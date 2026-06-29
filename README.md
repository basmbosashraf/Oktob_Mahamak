# Oktob Mahamak

A cross-platform To-Do List application built with **Flutter**, designed to help users organize, manage, and track their daily tasks efficiently across mobile, web, and desktop.

## Overview

Oktob Mahamak is a task management app built using Flutter's unified codebase, allowing it to run natively on Android, iOS, Web, Windows, macOS, and Linux. The project follows standard Flutter architecture and is structured for easy maintenance and future feature expansion.

## Features

- Add, edit, and delete tasks
- Mark tasks as complete or incomplete
- Clean and responsive user interface
- Cross-platform support (mobile, web, and desktop)
- Built with Dart and the Flutter SDK

> Feel free to update this list with the specific features implemented in your app (e.g., due dates, categories, notifications, local storage, etc.).

## Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **Platforms:** Android, iOS, Web, Windows, macOS, Linux

## Project Structure

```
Oktob_Mahamak/
├── android/        # Android platform-specific files
├── ios/             # iOS platform-specific files
├── lib/             # Main application source code (Dart)
├── linux/           # Linux platform-specific files
├── macos/           # macOS platform-specific files
├── web/             # Web platform-specific files
├── windows/         # Windows platform-specific files
├── assets/          # App assets (images, icons, etc.)
├── test/            # Unit and widget tests
├── pubspec.yaml     # Project dependencies and configuration
└── README.md
```

## Getting Started

### Prerequisites

Make sure you have the following installed on your machine:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart) (comes bundled with Flutter)
- A code editor such as [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)
- An emulator, simulator, or physical device for testing

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/basmbosashraf/Oktob_Mahamak.git
   ```

2. Navigate to the project directory:
   ```bash
   cd Oktob_Mahamak
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

   To run on a specific platform:
   ```bash
   flutter run -d chrome     # Web
   flutter run -d windows    # Windows
   flutter run -d macos      # macOS
   ```

## Running Tests

```bash
flutter test
```

## Contributing

Contributions are welcome. To contribute:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/your-feature-name`)
3. Commit your changes (`git commit -m "Add your feature"`)
4. Push to the branch (`git push origin feature/your-feature-name`)
5. Open a Pull Request

## License

This project does not currently specify a license. Consider adding a `LICENSE` file (e.g., MIT, Apache 2.0) to clarify usage rights for others.

## Author

Developed by [Basmala Ashraf](https://github.com/basmbosashraf)
