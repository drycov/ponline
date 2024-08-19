import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _buildDashboardItem(
              context,
              icon: Icons.group,
              label: 'Manage Users',
              onTap: () {
                // Логика перехода на страницу управления пользователями
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.analytics,
              label: 'View Reports',
              onTap: () {
                // Логика перехода на страницу отчетов
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.settings,
              label: 'Settings',
              onTap: () {
                // Логика перехода на страницу настроек
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.security,
              label: 'Security',
              onTap: () {
                // Логика перехода на страницу безопасности
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
            Icon(icon, size: 50, color: Colors.redAccent),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
