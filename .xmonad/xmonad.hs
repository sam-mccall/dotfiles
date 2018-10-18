import XMonad
import XMonad.Actions.PhysicalScreens
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.StackSet
import System.Environment
import System.IO

main = do
    xmproc <- spawnPipe "xmobar -d"
    xmonad $ docks $ ewmh defaultConfig
        { modMask = mod4Mask
        , terminal = "urxvt"
        , manageHook = manageDocks <+> manageHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 40
                        }
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , borderWidth = 2
        , focusedBorderColor = "#44bbff"
        } `additionalKeysP`
        [ ("M-S-l", spawn "xscreensaver-command -l")
        , ("M-p", spawn "dmenu_run -fn 'Open Sans-18'")
        , ("M-g", spawn "google-chrome")
        , ("M-t", spawn "urxvt")
        , ("M-S-t", withFocused $ windows . sink)
        , ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -- '-5%'")
        , ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -- '+5%'")
        , ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ -- toggle")
        , ("<XF86AudioMicMute>", spawn "pactl set-source-mute @DEFAULT_SOURCE@ -- toggle")
        , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 20")
        , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 20")
        , ("<XF86Tools>", spawn "toggle_touchpad")
        ]
