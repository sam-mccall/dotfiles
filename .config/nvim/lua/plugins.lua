require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use {'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      local on_attach = function(client, bufnr)
        if client.supports_method('textDocument/documentHighlight') then
          vim.cmd('autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
          vim.cmd('autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()')
          vim.cmd('autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()')
        end
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

      lspconfig.clangd.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = {
          ['textDocument/clangd.fileStatus'] = function(err, result, ctx, cfg)
            local buf = vim.fn.bufnr(vim.uri_to_fname(result.uri))
            if buf < 0 then return end
            local state = ''
            if result.state == 'idle' then
              state = '✓'
            elseif string.find(result.state, 'parsing include', 0, true) then
              state = '⟳'
            elseif string.find(result.state, 'queued', 0, true) then
              state = '…'
            end
            vim.b[buf].lsp_status = state
          end
        },
        init_options = { clangdFileStatus = true },
        cmd = {os.getenv('CLANGD') or 'clangd', '-log=verbose', '-pretty'},
      }

      local runtime_path = vim.split(package.path, ';')
      table.insert(runtime_path, "lua/?.lua")
      table.insert(runtime_path, "lua/?/init.lua")

      lspconfig.sumneko_lua.setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
              path = runtime_path,
            },
            diagnostics = { globals = {'vim'} },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false },
          },
        },
      }

      lspconfig.tsserver.setup {
        capabilities = capabilities,
      }

      lspconfig.cmake.setup {
        capabilities = capabilities,
      }

    end,
  }

  use {'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/vim-vsnip'
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = 'nvim_lsp' },
        }
      })
    end,
  }

  use {'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup{
        extra_trigger_chars={'{'},
        --always_trigger = true,

      }
    end,
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    setup = function()
      vim.g.nvim_tree_show_icons = {
        folder_arrows = 0,
        folders = 1,
      }
      vim.g.nvim_tree_respect_buf_cwd = 1
    end,
    config = function()
      require('nvim-tree').setup {
        view = { width = 30 },
        update_cwd = true,
        update_focused_file = { enable = true, },
        update_to_buf_dir = { enable = true, auto_open = true },
      }
    end,
  }

  use {'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup {
        defaults = {
          path_display = {"smart"},
        },
      }
    end,
  }

  use {'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          theme = 'ayu_dark',
          disabled_filetypes = {'NvimTree','packer'},
        },
        sections = {
          lualine_x = {'filetype'},
          lualine_y = {function()
            for _, client in ipairs(vim.lsp.buf_get_clients()) do
              local result = client.name
              local state = vim.b.lsp_status
              if state then
                result = result .. ' ' .. state
              end
              return result
            end
            return 'x'
          end},
          lualine_z = {'progress', 'location'},
        },
        tabline = {
          lualine_a = {{'buffers',
            max_length = function() return vim.o.columns end
          }},
        },
      }
    end
  }

  use {'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter').setup {
        ensure_installed = {"c", "cpp"},
        highlight = {
          enable = true,
        },
      }
    end,
  }

  use {'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('gitsigns').setup()
    end,
  }

  use {'antoinemadec/FixCursorHold.nvim',
    setup = function()
      vim.g.cursorhold_updatetime = 1000
    end,
  }

end)

