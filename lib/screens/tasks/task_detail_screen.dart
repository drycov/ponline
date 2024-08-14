import 'package:flutter/material.dart';

mixin TaskDetailScreen implements StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали задачи'),
        backgroundColor: const Color(0xFF007BFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Адрес',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Контактные данные',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Описание работы',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Логика сохранения изменений
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF007BFF),
              ),
              child: const Text('Сохранить изменения'),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Логика отметки задачи как выполненной
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF28A745),
              ),
              child: const Text('Отметить как выполненную'),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Логика удаления задачи
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDC3545),
              ),
              child: const Text('Удалить задачу'),
            ),
          ],
        ),
      ),
    );
  }
}
