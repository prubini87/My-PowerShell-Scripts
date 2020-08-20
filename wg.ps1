# Custom WinGet
Function CustomWinGet {
    $Command = $args[0]
    $OtherArguments = if ($args.Length -gt 1) { $args[1..$args.Length] } else { "" }

    #available commands
    $Commands = @{
        i = "install"
        p = "show"
        s = "search"
        f = "search"
        a = "hash"
        v = "validate"
        o = "settings"
        e = "features"
    }

    # Translate single letter command
    if ($args.Length -gt 0) {
        if ($Command.Length -eq 1) {
            if ($Commands.ContainsKey($Command)) {
                $Expression = "winget $($Commands.$Command) $OtherArguments"
            }
        } else {
            $Expression = "winget $args"
        }

        Invoke-Expression $Expression
    } else {
        # Show custom helper
        $HelperMessage = @'
wg - Simplified Winget Commands

All commands below come from "winget" and are currently available:
'@
        Write-Host $HelperMessage
        $Commands
    }
}

Set-Alias wg CustomWinGet