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

|                                                                                                   | NPM        | Nama                               | Jurusan                                         | Role                                              |
| :-----------------------------------------------------------------------------------------------: | ---------- | ---------------------------------- | ----------------------------------------------- | ------------------------------------------------- |
|     <img src="https://github.com/ervhinoaryoseto-del.png" width="64" alt="Ervhino Aryo Seto">     | 2506551125 | **Ervhino Aryo Seto**              | Information Systems '25 @ Universitas Indonesia | Katalog Tanaman                                   |
|             <img src="https://github.com/voruzaa.png" width="64" alt="Forza Derian">              | 2506596041 | **Forza Derian**                   | Information Systems '25 @ Universitas Indonesia | Kuis & Challenge Harian                           |
|      <img src="https://github.com/zikabyte.png" width="64" alt="Mohammad Zidane Kurnianto">       | 2506584861 | **Mohammad Zidane Kurnianto**      | Information Systems '25 @ Universitas Indonesia | Authentication, Profile, Leaderboard, & ARboretum |
| <img src="https://github.com/fairusarisandi.png" width="64" alt="Muhammad Fairus Azfar Arisandi"> | 2506588752 | **Muhammad Fairus Azfar Arisandi** | Information Systems '25 @ Universitas Indonesia | User Journal & Posting                            |
|      <img src="https://github.com/Roatsky.png" width="64" alt="Muhammad Naufal Syarifuddin">      | 2506602896 | **Muhammad Naufal Syarifuddin**    | Information Systems '25 @ Universitas Indonesia | Q&A Forum                                         |

## Module Definition

| Module                  | Penanggung Jawab               |
| ----------------------- | ------------------------------ |
| Authentication          | Mohammad Zidane Kurnianto      |
| Q&A Forum               | Muhammad Naufal Syarifuddin    |
| Katalog Tanaman         | Ervhino Aryo Seto              |
| Kuis & Challenge Harian | Forza Derian                   |
| User Journal & Posting  | Muhammad Fairus Azfar Arisandi |
| ARboretum               | Mohammad Zidane Kurnianto      |

### Authentication

Mengelola register, login, logout, dan halaman profil yang menampilkan pengalaman serta PediaPoint. Memakai OAuth Google untuk kemudahan login, dengan fallback login/register manual.

### Q&A Forum

Ruang diskusi seputar bertani tempat user mengunggah pertanyaan. Jawaban yang di-upvote memberi PediaPoint ke penjawabnya.

### Katalog Tanaman

Database referensi tanaman lengkap dengan cara menanam dan merawat (cahaya, air, suhu, dll.), diambil dari Trefle API.

### Kuis & Challenge Harian

Kuis _multiple choice_ seputar dasar bertani yang diadakan sekali sehari. Setiap jawaban benar memberi PediaPoint.

### User Journal & Posting

User mengunggah foto beserta caption (progres kebun, hasil panen, dll.) ke publik. Like dari user lain memberi PediaPoint ke pemilik post.

### ARboretum

Fitur AR untuk melihat model 3D tanaman di ruang nyata lewat kamera ponsel, diakses dari halaman detail katalog sebelum user memutuskan untuk menanam.

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
