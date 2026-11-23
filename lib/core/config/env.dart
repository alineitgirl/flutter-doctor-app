/// Конфигурация, передаваемая при сборке через `--dart-define`
/// (или `--dart-define-from-file=.env.json`). Секретов здесь быть не должно:
/// только публичные Supabase URL и publishable (anon) key.
abstract final class Env {
  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabasePublishableKey = String.fromEnvironment(
    'SUPABASE_PUBLISHABLE_KEY',
  );

  static bool get hasSupabase =>
      supabaseUrl.isNotEmpty && supabasePublishableKey.isNotEmpty;
}
