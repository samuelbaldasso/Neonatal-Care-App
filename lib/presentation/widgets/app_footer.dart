import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/theme/app_colors.dart';

/// Institutional footer shown at the bottom of every screen.
///
/// Identifies the public partners behind the app (UFRJ, Governo do Estado
/// do Rio de Janeiro / SES-RJ, Ministério da Saúde) and exposes their
/// official contact channels, so the app can be distributed and recognized
/// as an official public-health resource for neonatal units.
class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 28),
        decoration: const BoxDecoration(
          color: AppColors.footerBg,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: const EdgeInsets.fromLTRB(22, 28, 22, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Uma iniciativa pública para cuidado neonatal',
              style: TextStyle(color: AppColors.footerHeading, fontWeight: FontWeight.w800, fontSize: 16),
            ),
            const SizedBox(height: 4),
            const Text(
              'Conteúdo desenvolvido em parceria institucional para apoiar famílias e equipes de unidades neonatais em todo o estado.',
              style: TextStyle(color: AppColors.footerText, fontSize: 12.5, height: 1.4),
            ),
            const SizedBox(height: 20),
            const Wrap(
              spacing: 28,
              runSpacing: 20,
              children: [
                _InstitutionBlock(
                  title: 'UFRJ',
                  subtitle: 'Universidade Federal do Rio de Janeiro',
                  detail: 'Desenvolvimento e curadoria de conteúdo científico',
                ),
                _InstitutionBlock(
                  title: 'Governo do Estado do Rio de Janeiro',
                  subtitle: 'Secretaria de Estado de Saúde (SES-RJ)',
                  detail: 'Rede estadual de unidades neonatais',
                ),
                _InstitutionBlock(
                  title: 'Ministério da Saúde',
                  subtitle: 'Governo Federal',
                  detail: 'Diretrizes do Método Canguru e atenção humanizada',
                ),
              ],
            ),
            const SizedBox(height: 22),
            const Divider(color: Colors.white24, height: 1),
            const SizedBox(height: 18),
            const Text(
              'Canais oficiais de contato',
              style: TextStyle(color: AppColors.footerHeading, fontWeight: FontWeight.w800, fontSize: 14),
            ),
            const SizedBox(height: 10),
            _ContactLink(
              icon: Icons.local_hospital_rounded,
              label: 'Disque Saúde RJ — 0800 282 9922',
              onTap: () => _open('tel:08002829922'),
            ),
            _ContactLink(
              icon: Icons.public_rounded,
              label: 'saude.rj.gov.br',
              onTap: () => _open('https://www.saude.rj.gov.br'),
            ),
            _ContactLink(
              icon: Icons.language_rounded,
              label: 'gov.br/saude',
              onTap: () => _open('https://www.gov.br/saude'),
            ),
            _ContactLink(
              icon: Icons.school_rounded,
              label: 'ufrj.br',
              onTap: () => _open('https://ufrj.br'),
            ),
            _ContactLink(
              icon: Icons.support_agent_rounded,
              label: 'Disque 136 — Ouvidoria do SUS',
              onTap: () => _open('tel:136'),
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.white24, height: 1),
            const SizedBox(height: 14),
            const Text(
              '© 2026 Unidades Neonatais. Conteúdo educativo.\nFontes: Ministério da Saúde (Brasil) e Organização Mundial da Saúde (OMS).\nEste aplicativo não substitui avaliação ou orientação da equipe de saúde.\nEm caso de emergência, procure imediatamente a unidade de saúde mais próxima ou ligue 192 (SAMU).',
              style: TextStyle(fontSize: 11, color: AppColors.footerText, height: 1.5),
            ),
          ],
        ),
      );
}

class _InstitutionBlock extends StatelessWidget {
  final String title;
  final String subtitle;
  final String detail;
  const _InstitutionBlock({required this.title, required this.subtitle, required this.detail});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.account_balance_rounded, size: 16, color: AppColors.primaryLight),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(title, style: const TextStyle(color: AppColors.footerHeading, fontWeight: FontWeight.w800, fontSize: 13)),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(color: AppColors.footerText, fontSize: 12, fontWeight: FontWeight.w600)),
            const SizedBox(height: 2),
            Text(detail, style: const TextStyle(color: AppColors.footerText, fontSize: 11.5, height: 1.35)),
          ],
        ),
      );
}

class _ContactLink extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ContactLink({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Icon(icon, size: 17, color: AppColors.primaryLight),
              const SizedBox(width: 10),
              Text(label, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      );
}
