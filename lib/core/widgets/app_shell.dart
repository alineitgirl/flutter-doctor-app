import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_tokens.dart';
import '../../l10n/app_localizations.dart';

/// Каркас с плавающей нижней навигацией (макет 03 · Главная).
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final items = [
      (Icons.home_outlined, l10n.navHome),
      (Icons.assignment_outlined, l10n.navPlan),
      (Icons.bar_chart_rounded, l10n.navLabs),
      (Icons.medication_outlined, l10n.navMeds),
      (Icons.person_outline, l10n.navProfile),
    ];

    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(14, 0, 14, 14),
        child: _FloatingNavBar(
          items: items,
          currentIndex: navigationShell.currentIndex,
          onSelected: (index) => navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          ),
        ),
      ),
    );
  }
}

class _FloatingNavBar extends StatelessWidget {
  const _FloatingNavBar({
    required this.items,
    required this.currentIndex,
    required this.onSelected,
  });

  final List<(IconData, String)> items;
  final int currentIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final height = tokens.navBarHeight;

    return Material(
      type: MaterialType.transparency,
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 7),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.82),
          borderRadius: BorderRadius.circular(height / 2),
          border: Border.all(color: Colors.white.withValues(alpha: 0.95)),
          boxShadow: [
            BoxShadow(
              color: AppColors.navy.withValues(alpha: 0.22),
              blurRadius: 40,
              offset: const Offset(0, 18),
            ),
          ],
        ),
        child: Row(
          spacing: 2,
          children: [
            for (final (index, (icon, label)) in items.indexed)
              Expanded(
                child: _NavItem(
                  icon: icon,
                  label: label,
                  selected: index == currentIndex,
                  onTap: () => onSelected(index),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? Colors.white : context.tokens.textSecondary;

    return Semantics(
      button: true,
      selected: selected,
      label: label,
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(28),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 56,
          decoration: BoxDecoration(
            gradient: selected
                ? const LinearGradient(colors: [AppColors.navy, AppColors.blue])
                : null,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 2,
            children: [
              Icon(icon, size: 22, color: color),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
