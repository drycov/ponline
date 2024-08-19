import 'package:flutter/material.dart';

class OwnerDashboard extends StatelessWidget {
  const OwnerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Owner Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _buildDashboardItem(
              context,
              icon: Icons.business,
              label: 'Company Overview',
              onTap: () {
                // Логика перехода на страницу обзора компании
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.monetization_on,
              label: 'Finance',
              onTap: () {
                // Логика перехода на страницу финансов
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.people,
              label: 'Employees',
              onTap: () {
                // Логика перехода на страницу сотрудников
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.report,
              label: 'Reports',
              onTap: () {
                // Логика перехода на страницу отчетов
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
            Icon(icon, size: 50, color: Colors.blueAccent),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
