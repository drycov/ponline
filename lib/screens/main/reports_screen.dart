import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Отчеты'),
        backgroundColor: const Color(0xFF007BFF),
      ),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              title: Text('Отчет за 01.01.2024'),
              subtitle: Text('Выполненные задачи: 5'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Отчет за 02.01.2024'),
              subtitle: Text('Выполненные задачи: 3'),
            ),
          ),
          // Добавьте больше карточек отчетов по необходимости
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Логика создания нового отчета
        },
        backgroundColor: const Color(0xFF007BFF),
        child: const Icon(Icons.add),
      ),
    );
  }
}
