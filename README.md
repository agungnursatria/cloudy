# Cloudy

This is a simple app that display weather forecast from openweathermap.org. The coordinate has been fixated to Monas (Jakarta).

## Features

**Weather Forcasting**
Show weather forecasting from time to time in Jakarta.

## Supported Devices

**Android**
All Android devices with OS version over 4.1 Jellybean (SDK version 16)

**Tested in**
Samsung A52 Android OS version 12

## Installation

**Prerequisite**

- Make sure you have the latest Flutter SDK (at least version 2.17.6) to build the app
- Make sure you have added the Flutter SDK path in your environment variable
- [Mac OS Installation](https://docs.flutter.dev/get-started/install/macos)
- [Windows Installation](https://docs.flutter.dev/get-started/install/windows)

**Clone Project**
- Open Terminal 
- Go to folder where you want to clone
- Type in terminal `git clone https://github.com/agungnursatria/cloudy.git`
- Open your `cloudy` project

**How to Build**
- Open Terminal 
- Go to cloudy folder
- To build the apk file:
    - Type `flutter build apk` the result apk will be found in `cloudy/build/app/outputs/apk/`debug folder
- To install directly to Android phone/emulator
    - Make sure your phone/emulator connected to adb
        - For Android phone, you have to activate developer option and activate USB Debugging option
        - To check if the device already connected, go to terminal and type `adb devices`
    - Open Terminal
    - Go to cloudy folder
    - Type in `flutter run`
    - Make sure your phone/emulator always connected to the computer while the installation process is taking place

**How to Test**
- Open Terminal 
- Go to cloudy folder
- Type in `flutter test`

## Library References
- [Cupertino Icons](https://pub.dev/packages/cupertino_icons)
- [Dartz](https://pub.dev/packages/dartz)
- [Dio](https://pub.dev/packages/dio)
- [Flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [Get_it](https://pub.dev/packages/get_it)
- [Just Audio](https://pub.dev/packages/just_audio)
- [Equatable](https://pub.dev/packages/equatable)
- [Shimmer](https://pub.dev/packages/shimmer)
- [Bloc_test](https://pub.dev/packages/bloc_test)
- [Build_runner](https://pub.dev/packages/build_runner)
- [Mockito](https://pub.dev/packages/mockito)
- [intl](https://pub.dev/packages/intl)
