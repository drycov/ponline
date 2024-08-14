import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Задачи на сегодня'),
        backgroundColor: const Color(0xFF007BFF),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: const Text('Задача 1'),
              subtitle: const Text('Описание задачи'),
              trailing: const Icon(Icons.check_circle_outline, color: Colors.grey),
              onTap: () {
                // Логика открытия экрана детали задачи
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Задача 2'),
              subtitle: const Text('Описание задачи'),
              trailing: const Icon(Icons.check_circle_outline, color: Colors.grey),
              onTap: () {
                // Логика открытия экрана детали задачи
              },
            ),
          ),
          // Добавьте больше карточек задач по необходимости
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Логика добавления новой задачи
        },
        backgroundColor: const Color(0xFF28A745),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Карта',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'Отчеты',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
        selectedItemColor: const Color(0xFF007BFF),
      ),
    );
  }
}
