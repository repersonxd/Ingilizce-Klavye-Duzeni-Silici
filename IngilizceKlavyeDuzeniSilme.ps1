# Remove unwanted English (US) keyboard layout without reboot
# If you would like to save the output, you can run the command with redirection (for example, "powershell .\RemoveUnwantedUSLayout.ps1 >output.txt")
# or you can copy the output to the clipboard (for example, "powershell .\RemoveUnwantedUSLayout.ps1 | clip")

Write-Host "Remove unwanted English (US) keyboard layout without reboot [v0.1]"
Write-Host "System date:" (Get-Date -format "dd.MM.yyyy hh:mm:ss")

# Locale ID for the keyboard layout to be removed
$LCID_English_US = '0409'
# Keyboard layout code to be removed
$Keyboard_English_US = '00000409'

# Get all installed languages
$languages = Get-WinUserLanguageList
Write-Host "`nInstalled languages"
Write-Host "==================="
Write-Host ($languages | Format-Table | Out-String) -NoNewline

# The unwanted keyboard layout is dynamically added and is not visible in Windows language/keyboard settings
# To remove it, it must first be correctly added to the Windows language/keyboard settings
Write-Host "Phase 1 - adding"
Write-Host "-------------"
ForEach ($lang in $languages) {
    # Add US keyboard layout to the defined locale
    Write-Host ("Scanning language [" + $lang.LanguageTag + "]")
    if ($lang.InputMethodTips -Like $LCID_English_US + "*") {
        Write-Host ("Matched [" + $lang.LanguageTag + ":" + $LCID_English_US + "], InputMethodTips [" + $lang.InputMethodTips + "]")
        Write-Host ("Add [" + $LCID_English_US + ":" + $Keyboard_English_US + "]")
        $lang.InputMethodTips.Add($LCID_English_US + ":" + $Keyboard_English_US)
    }
}

# Apply changes
Write-Host "`nModified languages object after phase 1"
Write-Host "---------------------------------------" -NoNewline
Write-Host ($languages | Format-Table | Out-String) -NoNewline
Write-Host ("Commit phase 1")
Set-WinUserLanguageList $languages -force

Write-Host "`nPhase 2 - removing"
Write-Host "----------------"
ForEach ($lang in $languages) {
    # Remove US keyboard layout from the defined locale
    Write-Host ("Scanning language [" + $lang.LanguageTag + "]")
    if ($lang.InputMethodTips -Like $LCID_English_US + "*") {
        Write-Host ("Matched [" + $lang.LanguageTag + ":" + $LCID_English_US + "], InputMethodTips [" + $lang.InputMethodTips + "]")
        Write-Host ("Remove [" + $LCID_English_US + ":" + $Keyboard_English_US + "]")
        while ($lang.InputMethodTips.Remove($LCID_English_US + ":" + $Keyboard_English_US)) {}
    }
}

# Apply changes
Write-Host "`nModified languages object after phase 2"
Write-Host "---------------------------------------" -NoNewline
Write-Host ($languages | Format-Table | Out-String) -NoNewline
Write-Host ("Commit phase 2")
Set-WinUserLanguageList $languages -force

# Get all installed languages after removing the layout
$languages = Get-WinUserLanguageList
Write-Host ""
Write-Host "Installed languages [final state]"
Write-Host "============================="
Write-Host ($languages | Format-Table | Out-String) -NoNewline
