import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showDemoMessage(BuildContext context, String option) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$option está disponible solo como demostración.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final options = <({String title, String subtitle, IconData icon})>[
      (
        title: 'Mi cuenta',
        subtitle: 'Suscripción y datos personales',
        icon: Icons.account_circle_outlined,
      ),
      (
        title: 'Notificaciones',
        subtitle: 'Estrenos, recomendaciones y novedades',
        icon: Icons.notifications_none,
      ),
      (
        title: 'Configuración',
        subtitle: 'Reproducción, idioma y descargas',
        icon: Icons.settings_outlined,
      ),
      (
        title: 'Ayuda',
        subtitle: 'Centro de ayuda y contacto',
        icon: Icons.help_outline,
      ),
    ];

    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 28),
        children: [
          Text('Perfil', style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 28),
          const Center(
            child: CircleAvatar(
              radius: 54,
              backgroundColor: AppColors.red,
              child: Icon(
                Icons.person_rounded,
                size: 70,
                color: AppColors.white,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Alex Rivera',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 4),
          Text(
            'Perfil principal',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                for (var index = 0; index < options.length; index++) ...[
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5,
                    ),
                    leading: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceHigh,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(options[index].icon, color: AppColors.white),
                    ),
                    title: Text(
                      options[index].title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      options[index].subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () =>
                        _showDemoMessage(context, options[index].title),
                  ),
                  if (index < options.length - 1)
                    const Divider(
                      height: 1,
                      indent: 72,
                      color: AppColors.surfaceHigh,
                    ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: () => _showDemoMessage(context, 'Cerrar sesión'),
            icon: const Icon(Icons.logout),
            label: const Text('Cerrar sesión'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Netflix Lab · Demostración académica',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.muted, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
