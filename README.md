# 🐧 Arch Linux Dotfiles

Ceyhan Molla'nın Arch Linux masaüstü ortamı için yönetilen dotfiles koleksiyonu. Minimal, hızlı ve verimli bir i3wm tabanlı çalışma ortamı.

![Arch Linux](https://img.shields.io/badge/Arch-Linux-1793D1?logo=arch-linux)
![i3wm](https://img.shields.io/badge/i3wm-4CAF50?logo=gnu-bash)
![License](https://img.shields.io/badge/License-MIT-blue)

---

## 📋 İçindekiler

- [🎯 Özellikler](#-özellikler)
- [📦 İçerik](#-içerik)
- [⚡ Kurulum](#-kurulum)
- [🔧 Kullanılan Yazılımlar](#-kullanılan-yazılımlar)
- [📁 Dosya Açıklamaları](#-dosya-açıklamaları)
- [🎨 Tema ve Görünüm](#-tema-ve-görünüm)
- [🛠️ Özelleştirme](#️özelleştirme)
- [📚 Arch Linux Kurulum Rehberleri](#-arch-linux-kurulum-rehberleri)
- [📄 Lisans](#-lisans)
- [👤 İletişim](#-iletişim)

---

## 🎯 Özellikler

- **Lightweight WM**: i3 window manager (tiling)
- **Tema**: Nord color scheme
- **Notification**: Dunst
- **Status Bar**: i3status
- **Application Launcher**: Rofi
- **Taskbar**: Tint2
- **System Monitor**: Conky
- **Terminal Emulator**: Bash (zsh yüklenebilir)
- **BitTorrent Client**: rTorrent
- **IRC Client**: irssi
- **Media Player**: mplayer

---

## 📦 İçerik

Dotfiles repository şu yapıya sahiptir:

```
dotfiles/
├── .bashrc                 # Bash shell konfigürasyonu
├── .conkyrc                # Conky system monitor ayarları
├── .rtorrent.rc            # rTorrent torrent client yapılandırması
├── .tint2rc                # Tint2 taskbar konfigürasyonu
├── .xinitrc                # X11 başlatma scripti (startx için)
├── .Xresources             # X kaynak dosyaları (fontlar, renkler)
├── chrome-flags.conf       # Chrome/Chromium komut satırı flag'leri
├── i3wm/                   # i3 window manager konfigürasyonları
│   ├── i3config            # Ana i3 config dosyası
│   ├── i3status            # i3status konfigürasyonu
│   ├── dunstrc              # Dunst notification daemon ayarları
│   ├── nord.rasi           # Rofi (application launcher) Nord teması
│   └── Enable Tap To Click i3wm  # Touchpad tap-to-click etkinleştirme
├── Arch Linux Kurulum/     # Arch Linux kurulum rehberleri ve scriptler
│   ├── Arch Linux UEFI Non-Encrypted
│   ├── Arch Linux with Full Disk Encryption
│   ├── autostart
│   ├── irssi
│   ├── irssi_freenode
│   ├── locale.conf
│   ├── menu.xml
│   ├── mplayer config
│   └── weather.sh
└── README.md               # Bu dosya
```

---

## ⚡ Kurulum

### ⚠️ Uyarı
Bu dotfiles **sadece Arch Linux** üzerinde test edilmiştir. Diğer dağıtımlarda çalışmayabilir veya uyumluluk sorunları yaşayabilirsiniz.

### Hızlı Kurulum

```bash
# Repository'yi klonlayın
git clone https://github.com/ceyhanmolla/dotfiles.git ~/.dotfiles

# Çalışma dizinine gidin
cd ~/.dotfiles

# Stow kullanarak (önerilen)
stow -t ~ .bashrc .conkyrc .rtorrent.rc .tint2rc .xinitrc .Xresources chrome-flags.conf

# Veya manuel olarak taşıyın
cp .bashrc ~/.bashrc
cp .conkyrc ~/.conkyrc
cp .rtorrent.rc ~/.rtorrent.rc
cp .tint2rc ~/.tint2rc
cp .xinitrc ~/.xinitrc
cp .Xresources ~/.Xresources
cp chrome-flags.conf ~/.config/chrome-flags.conf  # Chrome Flags için

# i3wm klasörünü
mkdir -p ~/.config/i3
cp i3wm/* ~/.config/i3/
```

### Gerekli Paketler

Kurulumadan önce aşağıdaki paketlerin yüklü olduğundan emin olun:

```bash
# Temel sistem
sudo pacman -S xorg-server xorg-xinit i3-wm i3status i3lock

# Uygulamalar
sudo pacman -S rofi dunst tint2 conky rtorrent irssi mplayer

# Ek araçlar (opsiyonel)
sudo pacman -S picom nitrogen feh rxvt-unicode
```

### Başlatma

1. X server'ı başlatın:
   ```bash
   startx
   ```

2. Veya login manager kullanıyorsanız (GDM, LightDM), i3 session seçin.

---

## 🔧 Kullanılan Yazılımlar

| Yazılım | Tür | Açıklama |
|---------|-----|----------|
| **i3wm** | Window Manager | Tiling window manager, klavye odaklı çalışma |
| **i3status** | Status Bar | i3wm için sistem bilgileri gösteren panel |
| **rofi** | Application Launcher | Hızlı uygulama başlatıcı |
| **dunst** | Notification Daemon | Bildirimleri gösteren hafif servis |
| **tint2** | Taskbar | Görev çubuğu/tray |
| **conky** | System Monitor | Sistem istatistiklerini masaüstünde gösterir |
| **rtorrent** | BitTorrent Client | Terminal tabanlı torrent istemcisi |
| **irssi** | IRC Client | Terminal tabanlı IRC istemcisi |
| **mplayer** | Media Player | Video/müzik oynatıcı |
| **bash** | Shell | Varsayılan komut yorumlayıcı |
| **Xorg** | Display Server | grafik sistem sunucusu |

---

## 📁 Dosya Açıklamaları

### Ana Dotfiles

#### `.bashrc`
Bash shell için konfigürasyon dosyası. PS1 prompt, alias'lar, fonksiyonlar, PATH ayarları içerir.

```bash
# Ana özellikler:
- Gelişmiş bash prompt (Git branch Gösterimi)
- Alias komutları (ls, ll, la, vim, nano vs.)
- Fonksiyonlar (extract archive'lar için)
- Bash completion
```

#### `.xinitrc`
`startx` komutu çalıştırıldığında X11 oturumunu başlatır. i3wm başlatır ve ardından oturum sonlandığında temizlik yapar.

```bash
# İçerik:
- .Xresources yüklenir
- xsettingsd başlatılır (GTK tema desteği)
- picom (compositor) başlatılır (opsiyonel)
- nitrogen (wallpaper) ayarlanır
- i3wm çalıştırılır
```

#### `.Xresources`
X11 kaynak ayarları: fontlar, renkler, DPI ayarları, fare ayarları.

```bash
# Örnek:
Xft.dpi: 96
Xcursor.size: 24
```

### i3wm Konfigürasyonları (`i3wm/`)

#### `i3config`
Ana i3wm konfigürasyon dosyası. Mod klavye kombinasyonları, workspace'ler, uygulama kuralları, otomatik başlatma komutları.

**Temel Klavye Kısayolları:**
- `Mod+Enter`: Terminal aç (rxvt-unicode)
- `Mod+d`: Rofi uygulama başlatıcıyı aç
- `Mod+Shift+q`: Kabul edilen uygulamayı kapat
- `Mod+Shift+r`: i3wm yeniden yükle
- `Mod+Shift+e`: i3wm çıkış
- `Mod+1..9`: Workspace'lere geçiş
- `Mod+Shift+1..9`: Uygulamayı workspace'e taşı

#### `i3status`
Durum çubuğu konfigürasyonu: CPU, bellek, disk, ağ, saat, sıcaklık gibi sistem istatistiklerini gösterir.

#### `dunstrc`
Dunst notification daemon ayarları: Bildirim pozisyonu, boyutu, süresi, renkleri. Nord tema renkleri kullanır.

#### `nord.rasi`
Rofi (application launcher) için Nord renk teması.

### Diğer Konfigürasyonlar

#### `.conkyrc`
Masaüstü system monitor. CPU, RAM, disk kullanımı, ağ aktivitesi, sıcaklıklar, saat.

#### `.tint2rc`
Tint2 taskbar konfigürasyonu: Görev çubuğu, saat, system tray, battery indicator.

#### `.rtorrent.rc`
rTorrent torrent client konfigürasyonu: Download/upload hızları, torrent dizinleri, otomatik torrent yönetimi.

#### `chrome-flags.conf`
Google Chrome/Chromium için optimize edilmiş komut satırı flag'leri: `--enable-gpu-rasterization`, `--enable-zero-copy`, `--ignore-gpu-blocklist` gibi.

---

## 🎨 Tema ve Görünüm

Bu dotfiles **Nord renk paleti** kullanır:

| Renk | Hex | Açıklama |
|------|-----|----------|
| Polar Night | `#2E3440` | Arkaplan |
| Snow Storm | `#D8DEE9` | Bilgilendirici metin |
| Frost | `#81A1C1` | Linkler |
| Aurora | `#5E81AC` | Değişkenler |
| Red | `#BF616A` | Hata ve uyarılar |

Tema, i3config, dunstrc, nord.rasi ve Xresources dosyalarında tutarlı bir şekilde uygulanır.

---

## 🛠️ Özelleştirme

### Renk Temasını Değiştirme

Tüm renkleri değiştirmek için şu dosyaları güncelleyin:
1. `i3wm/i3config` (i3 renkleri)
2. `i3wm/dunstrc` (bıldirim renkleri)
3. `i3wm/nord.rasi` (rofi renkleri)
4. `.Xresources` (X11 renkleri ve fontlar)

### Klavye Kısayollarını Değiştirme

`i3wm/i3config` dosyasında `bindsym` satırlarını düzenleyin.

Örneğin:
```bash
# Varsayılan terminal değiştirme
bindsym $mod+Return exec rxvt-unicode
# Şöyle değiş:
bindsym $mod+Return exec alacritty
```

### Yeni Uygulama Ekleme

i3wm'de workspace'lere atamak için `i3wm/i3config`'e ekleyin:

```bash
for_window [class="Firefox"] move to workspace 2
```

---

## 📚 Arch Linux Kurulum Rehberleri

`Arch Linux Kurulum/` klasöründe iki tane kurulum rehberi bulunur:

### 1. Arch Linux UEFI Non-Encrypted
- UEFI sistemler için
- Şifreleme olmadan
- Adım adım talimatlar
- Menü oluşturma (`menu.xml`)

### 2. Arch Linux with Full Disk Encryption
- UEFI + LUKS şifreleme
- Tam disk şifreleme
- Boot encryption
- Özel partition ayarları

### Kurulum Adımları

1. Arch Linux ISO'sunu boot edin
2. İnternet bağlantısını sağlayın
3. `Arch Linux Kurulum/` klasöründeki rehberleri okuyun
4. Adım adım komutları çalıştırın
5. `autostart` ve `locale.conf` gibi ayarları yapılandırın
6. reboot edin

**Not:** Bu rehberler özelleştirilmiştir. Kendi sisteminize göre ayarlayın.

---

## 📄 Lisans

Bu dotfiles **MIT License** altında lisanslanmıştır. Detaylar için LICENSE dosyasına bakın (henüz eklenmedi, istenirse ekleyebiliriz).

---

## 👤 İletişim

**Ceyhan Molla**  
Web Infrastructure & IT Process Specialist

- 🌐 Website: https://www.ceyhanmolla.com
- 💼 LinkedIn: https://linkedin.com/in/ceyhan-molla
- 🐙 GitHub: https://github.com/ceyhanmolla
- 📧 Email: info@ceyhanmolla.com

---

## 🙏 Teşekkürler

- **i3wm Community**: Mükemmel bir window manager
- **Nord Theme**: Harika bir renk paleti
- **Arch Linux**: En iyi dağıtım!

---

**Son Güncelleme:** 10 Nisan 2025  
**Sürüm:** 1.0.0  
**Framework:** Arch Linux + i3wm + Nordic Tema
