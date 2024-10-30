# 🎉 İstenmeyen Klavye Düzenini Kaldırma

Bu **PowerShell programı**, Windows 10 ve 11'de istenmeyen İngilizce klavye düzenini yeniden başlatmaya gerek kalmadan kaldırmanızı sağlar. 💻✨

## Kullanım

## PowerShell ile Programı İndirme ve Çalıştırma

Aşağıdaki komutları kullanarak programı İndirilenler klasörünüze kaydedebilir ve çalıştırabilirsiniz:

### Programı İndirme

```powershell
$DownloadsPath = [System.IO.Path]::Combine($env:USERPROFILE, "Downloads")
iwr -Uri "https://raw.githubusercontent.com/repersonxd/Ingilizce-Klavye-Duzeni-Silici/refs/heads/main/IngilizceKlavyeDuzeniSilme.ps1" -OutFile "$DownloadsPath\IngilizceKlavyeDuzeniSilme.ps1"


Eğer çıktıyı kaydetmek isterseniz, aşağıdaki komutu kullanabilirsiniz:  

```bash
powershell .\IstenmeyenKlavyeDuzeniKaldir.ps1 >output_file.txt 
```
Programı Çalıştırma
```powershell
powershell -ExecutionPolicy Bypass -File "$DownloadsPath\IngilizceKlavyeDuzeniSilme.ps1"
```

Ya da çıktıyı doğrudan panoya kopyalamak için:
```bash
powershell .\IstenmeyenKlavyeDuzeniKaldir.ps1 | clip
```
Önemli Notlar ⚠️
Bu program imzasızdır. Çalıştırmadan önce PowerShell’de imzasız programların çalıştırılmasına izin vermeniz gerekir. Bu, kendi bilgisayarınızda yazdığınız imzasız programları çalıştırmanıza ve internetten gelen imzalı programlara izin verir.

Yapmanız Gerekenler:
PowerShell’i "Yönetici olarak çalıştır" seçeneğiyle açın.
Aşağıdaki komutu çalıştırarak gerekli ayarı yapın:
```bash
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```
Artık istenmeyen klavye düzenini kolayca kaldırabilirsiniz! İyi eğlenceler! 🎈
