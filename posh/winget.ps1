$uninstall = @(
    # Проверка работоспособности ПК Windows
    '{DAA78B45-828D-4E8C-848C-50A70ACC6747}',
    # Cortana
    'Microsoft.549981C3F5F10_8wekyb3d8bbwe',
    # Xbox
    'Microsoft.GamingApp_8wekyb3d8bbwe',
    'Microsoft.GetHelp_8wekyb3d8bbwe',
    'Microsoft.HEIFImageExtension_8wekyb3d8bbwe',
    'Microsoft.StorePurchaseApp_8wekyb3d8bbwe',
    'Microsoft.People_8wekyb3d8bbwe',
    'Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe',
    'Microsoft.VP9VideoExtensions_8wekyb3d8bbwe',
    'Microsoft.Wallet_8wekyb3d8bbwe',
    'Microsoft.WebMediaExtensions_8wekyb3d8bbwe',
    'Microsoft.WebpImageExtension_8wekyb3d8bbwe',
    'Microsoft.Windows.Photos_8wekyb3d8bbwe',
    'Microsoft.WindowsAlarms_8wekyb3d8bbwe',
    'Microsoft.WindowsCamera_8wekyb3d8bbwe',
    'Microsoft.WindowsMaps_8wekyb3d8bbwe',
    'Microsoft.XboxApp_8wekyb3d8bbwe',
    'Microsoft.XboxGameOverlay_8wekyb3d8bbwe',
    'Microsoft.XboxGamingOverlay_8wekyb3d8bbwe',
    'Microsoft.XboxIdentityProvider_8wekyb3d8bbwe',
    'Microsoft.XboxSpeechToTextOverlay_8wekyb3d8bbwe',
    'Microsoft.Xbox.TCUI_8wekyb3d8bbwe',
    'Microsoft.YourPhone_8wekyb3d8bbwe'
)

$uninstall | ForEach-Object {
    Write-Output "`nrem > $_"
    winget uninstall $_
}
