import 'package:flutter/material.dart';

class InstallerDashboard extends StatelessWidget {
  const InstallerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Installer Dashboard'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _buildDashboardItem(
              context,
              icon: Icons.construction,
              label: 'Installations',
              onTap: () {
                // Логика перехода на страницу установок
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.report_problem,
              label: 'Issues',
              onTap: () {
                // Логика перехода на страницу проблем
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.check_circle,
              label: 'Completed Tasks',
              onTap: () {
                // Логика перехода на страницу завершенных задач
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.location_on,
              label: 'Locations',
              onTap: () {
                // Логика перехода на страницу местоположений
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
            Icon(icon, size: 50, color: Colors.orangeAccent),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
