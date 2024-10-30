# 🎉 İstenmeyen Klavye Düzenini Kaldırma

Bu **PowerShell programı**, Windows 10 ve 11'de istenmeyen İngilizce klavye düzenini yeniden başlatmaya gerek kalmadan kaldırmanızı sağlar. 💻✨

## Kullanım

Eğer çıktıyı kaydetmek isterseniz, aşağıdaki komutu kullanabilirsiniz:  

```bash
powershell .\IstenmeyenKlavyeDuzeniKaldir.ps1 >output_file.txt 
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
