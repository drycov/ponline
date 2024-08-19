import 'package:flutter/material.dart';

class NetworkEngineerDashboard extends StatelessWidget {
  const NetworkEngineerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Engineer Dashboard'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _buildDashboardItem(
              context,
              icon: Icons.wifi,
              label: 'Network Monitoring',
              onTap: () {
                // Логика перехода на страницу мониторинга сети
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.router,
              label: 'Manage Devices',
              onTap: () {
                // Логика перехода на страницу управления устройствами
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.settings_ethernet,
              label: 'Configure Equipment',
              onTap: () {
                // Логика перехода на страницу настройки оборудования
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.dns,
              label: 'Diagnostics',
              onTap: () {
                // Логика перехода на страницу диагностики сети
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.cloud_download,
              label: 'Backup & Restore',
              onTap: () {
                // Логика перехода на страницу резервного копирования и восстановления
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.security,
              label: 'Security Settings',
              onTap: () {
                // Логика перехода на страницу настроек безопасности
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardItem(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.purpleAccent),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
