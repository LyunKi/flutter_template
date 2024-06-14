# flutter_template

A new Flutter project.

## Getting Started

1. flutter pub get 下载依赖
1. flutter gen-l10n 生成国际化文件(ios需要单独配置，[参考](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization#localizing-for-ios-updating-the-ios-app-bundle))
2. 执行 build runner: flutter pub run build_runner watch
3. 以wasm方式启动: flutter run -d chrome --web-port 3001 --web-renderer skwasm
3. 桌面启动: flutter run -d windows

## clean code
dart fix

## issues 
https://github.com/dart-lang/build/issues/2835