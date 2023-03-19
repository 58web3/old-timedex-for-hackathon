# timedex

## Getting Started

+ File Generateについて
  + `flutter pub run build_runner build` を実行してAuto Generate Fileを生成

+ 初期化
  + FirebaseのOptionファイルを追加
    ```
    npm install -g firebase-tools
    dart pub global activate flutterfire_cli
    flutterfire configure
    ```
  + Flutter Command
    + Debug
    ```
    flutter run --web-renderer html --web-port 8080　--dart-define=FLAVOR=${flavor}
    ```
    + Release
    ```
    flutter build --web-renderer html --web-port 8080　--dart-define=FLAVOR=${flavor}
    ```
  + Flavor
    + Flavorにより，開発環境の切り分けが可能
    + dev, stg, prodの３環境を用意