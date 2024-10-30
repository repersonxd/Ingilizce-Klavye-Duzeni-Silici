# Yeniden başlatmadan istenmeyen İngilizce ABD klavye düzenini kaldır
# Eğer çıktıyı kaydetmek istiyorsanız, komutu yönlendirme ile çalıştırabilirsiniz (örneğin "powershell .\IstenmeyenABDLayoutuKaldir.ps1 >output.txt")
# veya çıktıyı panoya kopyalayabilirsiniz (örneğin "powershell .\IstenmeyenABDLayoutuKaldir.ps1 | clip")

Write-Host "Yeniden başlatmadan istenmeyen İngilizce ABD klavye düzenini kaldır [v0.1]"
Write-Host "Sistem tarihi:" (Get-Date -format "dd.MM.yyyy hh:mm:ss")

# Klavye düzeninin kaldırılacağı dil kimliği
$LCID_English_US = '0409'
# Kaldırılacak klavye düzeni kodu
$Keyboard_English_US = '00000409'

# Yüklü tüm dilleri getir
$languages = Get-WinUserLanguageList
Write-Host "`nYüklü diller"
Write-Host "==================="
Write-Host ($languages | Format-Table | Out-String) -NoNewline

# İstenmeyen klavye düzeni dinamik olarak eklenir ve Windows dil/klavye ayarlarında görünmez
# Kaldırma işlemi için öncelikle Windows dil/klavye ayarlarına doğru şekilde eklenmelidir
Write-Host "Aşama 1 - ekleme"
Write-Host "-------------"
ForEach ($lang in $languages) {
    # Tanımlı dil kimliğine ABD klavye düzenini ekle
    Write-Host ("Dil taranıyor [" + $lang.LanguageTag + "]")
    if ($lang.InputMethodTips -Like $LCID_English_US + "*") {
        Write-Host ("Eşleşti [" + $lang.LanguageTag + ":" + $LCID_English_US + "], GirişMetoduİpuçları [" + $lang.InputMethodTips + "]")
        Write-Host ("Ekle [" + $LCID_English_US + ":" + $Keyboard_English_US + "]")
        $lang.InputMethodTips.Add($LCID_English_US + ":" + $Keyboard_English_US)
    }
}

# Değişiklikleri uygula
Write-Host "`nAşama 1 sonrası değiştirilen diller nesnesi"
Write-Host "---------------------------------------" -NoNewline
Write-Host ($languages | Format-Table | Out-String) -NoNewline
Write-Host ("Aşama 1'i kaydet")
Set-WinUserLanguageList $languages -force

Write-Host "`nAşama 2 - kaldırma"
Write-Host "----------------"
ForEach ($lang in $languages) {
    # Tanımlı dil kimliğinden ABD klavye düzenini kaldır
    Write-Host ("Dil taranıyor [" + $lang.LanguageTag + "]")
    if ($lang.InputMethodTips -Like $LCID_English_US + "*") {
        Write-Host ("Eşleşti [" + $lang.LanguageTag + ":" + $LCID_English_US + "], GirişMetoduİpuçları [" + $lang.InputMethodTips + "]")
        Write-Host ("Kaldır [" + $LCID_English_US + ":" + $Keyboard_English_US + "]")
        while ($lang.InputMethodTips.Remove($LCID_English_US + ":" + $Keyboard_English_US)) {}
    }
}

# Değişiklikleri uygula
Write-Host "`nAşama 2 sonrası değiştirilen diller nesnesi"
Write-Host "---------------------------------------" -NoNewline
Write-Host ($languages | Format-Table | Out-String) -NoNewline
Write-Host ("Aşama 2'yi kaydet")
Set-WinUserLanguageList $languages -force

# Klavye düzenini kaldırdıktan sonra yüklü tüm dilleri getir
$languages = Get-WinUserLanguageList
Write-Host ""
Write-Host "Yüklü diller [son hali]"
Write-Host "============================="
Write-Host ($languages | Format-Table | Out-String) -NoNewline
