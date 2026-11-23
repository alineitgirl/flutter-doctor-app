import 'package:material_ui/material_ui.dart';

import '../../app/theme/app_tokens.dart';
import '../../l10n/app_localizations.dart';

/// Временный экран, пока фича не реализована.
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({
    super.key,
    required this.title,
    this.actions = const [],
  });

  final String title;

  /// Кнопки перехода на вложенные экраны (для проверки маршрутов).
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Text(
                AppLocalizations.of(context).placeholderInProgress,
                style: TextStyle(color: context.tokens.textSecondary),
              ),
              ...actions,
            ],
          ),
        ),
      ),
    );
  }
}
