<h1 align="center">Tanampedia Mobile</h1>
<h6 align="center">Tumbuh Bersama, Di Mana Saja</h6>

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white) ![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat-square&logo=dart&logoColor=white)

</div>

<p align="center">
    <strong>Kelas</strong> PBP F | <strong>Kelompok</strong> 11 <br/>
    <strong>We 💓 Mobile Development</strong>
</p>

### Anggota

|                                                                                                   | NPM        | Nama                               | Jurusan                                         | Role |
| :-----------------------------------------------------------------------------------------------: | ---------- | ---------------------------------- | ----------------------------------------------- | ---- |
|     <img src="https://github.com/ervhinoaryoseto-del.png" width="64" alt="Ervhino Aryo Seto">     | 2506551125 | **Ervhino Aryo Seto**              | Information Systems '25 @ Universitas Indonesia | TBA  |
|             <img src="https://github.com/voruzaa.png" width="64" alt="Forza Derian">              | 2506596041 | **Forza Derian**                   | Information Systems '25 @ Universitas Indonesia | TBA  |
|      <img src="https://github.com/zikabyte.png" width="64" alt="Mohammad Zidane Kurnianto">       | 2506584861 | **Mohammad Zidane Kurnianto**      | Information Systems '25 @ Universitas Indonesia | TBA  |
| <img src="https://github.com/fairusarisandi.png" width="64" alt="Muhammad Fairus Azfar Arisandi"> | 2506588752 | **Muhammad Fairus Azfar Arisandi** | Information Systems '25 @ Universitas Indonesia | TBA  |
|      <img src="https://github.com/Roatsky.png" width="64" alt="Muhammad Naufal Syarifuddin">      | 2506602896 | **Muhammad Naufal Syarifuddin**    | Information Systems '25 @ Universitas Indonesia | TBA  |

## Setup

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Device, emulator, atau simulator yang sudah terhubung

### Installation

```bash
git clone <repo-url>
cd tanampedia-mobile
flutter pub get
```

### Running

```bash
flutter run
```

### Analyze & Test

```bash
flutter analyze
flutter test
```

## Folder Structure

Proyek ini mengikuti arsitektur **feature-based dan sedikit terinspirasi dari _clean architecture_**.

```
lib/
├── core/                 # Kode bersama yang dipakai lintas fitur (utils, constants, services, dll.)
└── features/
    ├── [feature]/
    │   ├── data/         # Data management & fetching
    │   ├── pages/        # Susunan dan tampilan satu halaman
    │   └── widgets/      # Komponen reusable
    └── example/          # Template skeleton untuk fitur baru (data/pages/widgets)
```
