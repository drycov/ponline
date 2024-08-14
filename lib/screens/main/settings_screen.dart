import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
        backgroundColor: const Color(0xFF007BFF),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Учетная запись'),
            onTap: () {
              // Логика управления учетной записью
            },
          ),
          ListTile(
            title: const Text('Уведомления'),
            trailing: Switch(
              value: true,
              onChanged: (bool value) {
                // Логика включения/выключения уведомлений
              },
            ),
          ),
          ListTile(
            title: const Text('О приложении'),
            onTap: () {
              // Логика отображения информации о приложении
            },
          ),
          ListTile(
            title: const Text('Выход из учетной записи'),
            onTap: () {
              // Логика выхода из учетной записи
            },
          ),
        ],
      ),
    );
  }
}
