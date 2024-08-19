import 'package:flutter/material.dart';

class ManagerDashboard extends StatelessWidget {
  const ManagerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manager Dashboard'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _buildDashboardItem(
              context,
              icon: Icons.task,
              label: 'Tasks',
              onTap: () {
                // Логика перехода на страницу задач
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.schedule,
              label: 'Schedule',
              onTap: () {
                // Логика перехода на страницу расписания
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.people_outline,
              label: 'Team',
              onTap: () {
                // Логика перехода на страницу команды
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.insert_chart,
              label: 'Statistics',
              onTap: () {
                // Логика перехода на страницу статистики
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
            Icon(icon, size: 50, color: Colors.greenAccent),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
