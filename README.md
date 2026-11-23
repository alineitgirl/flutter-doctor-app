# health_app

Мобильное приложение для персонального мониторинга здоровья и профилактических осмотров с распознаванием результатов анализов (дипломный проект).

Flutter (Android 8.0+, API 26) · Riverpod · go_router · Supabase. Подробности: [CLAUDE.md](CLAUDE.md).

## Запуск

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
flutter run
```

Без ключей Supabase приложение запускается в режиме «только UI». Чтобы подключить бэкенд, создайте `.env.json` (он в `.gitignore`):

```json
{
  "SUPABASE_URL": "https://<project>.supabase.co",
  "SUPABASE_PUBLISHABLE_KEY": "<publishable/anon key>"
}
```

и запускайте с `flutter run --dart-define-from-file=.env.json`.

## Проверки

```bash
flutter analyze
flutter test
```
