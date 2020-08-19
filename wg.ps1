# Custom WinGet
Function CustomWinGet {
    $Instruction = $args[0]
    $PackageName = $args[1]

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
    $InstructionLength = $Instruction.Length
    if ($InstructionLength -gt 0) {
        if ($InstructionLength -eq 1) {
            if ($Commands.ContainsKey($Instruction)) {
                Invoke-Expression "winget $($Commands.$Instruction) $PackageName"
            }
        }
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