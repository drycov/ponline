// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ponlink/services/index.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  bool isEmailCorrect = false;

  @override
  void dispose() {
    _emailController.clear();
    _passwordController.clear();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      User? user = await _authService.signInWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );

      if (user != null) {
        if (kDebugMode) {
          print(user.uid);
        }
        List<String>? roles = await _authService.getUserRoles(user.uid);
        if (roles != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login Successful with roles: ${roles.join(', ')}')),
          );
          _navigateBasedOnRoles(roles);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Roles not found')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login Failed')),
        );
      }
    }
  }

  void _navigateBasedOnRoles(List<String> roles) {
    if (_authService.hasRole(roles, 'admin')) {
      Navigator.pushReplacementNamed(context, '/admin_dashboard');
    } else if (_authService.hasRole(roles, 'owner')) {
      Navigator.pushReplacementNamed(context, '/owner_dashboard');
    } else if (_authService.hasRole(roles, 'manager')) {
      Navigator.pushReplacementNamed(context, '/manager_dashboard');
    } else if (_authService.hasRole(roles, 'installer')) {
      Navigator.pushReplacementNamed(context, '/installer_dashboard');
    } else if (_authService.hasRole(roles, 'network_engineer')) {
      Navigator.pushReplacementNamed(context, '/network_engineer_dashboard');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No roles found for navigation')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://storge.pic2.me/cm/2560x1440/463/586197a18ebcf.jpg',
            ),
            fit: BoxFit.cover,
            opacity: 0.4,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'PonLink',
                    style: GoogleFonts.corinthia(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: isEmailCorrect ? 280 : 200,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: TextFormField(
                            controller: _emailController,
                            onChanged: (val) {
                              setState(() {
                                isEmailCorrect = isEmail(val);
                              });
                            },
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              prefixIcon: Icon(Icons.person, color: Colors.green),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Email",
                              hintText: 'your-email@domain.com',
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: _passwordController,
                              obscuringCharacter: '*',
                              obscureText: true,
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                prefixIcon: Icon(Icons.key, color: Colors.green),
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Password",
                                hintText: '*********',
                                labelStyle: TextStyle(color: Colors.black),
                              ),
                              validator: (value) {
                                if (value!.isEmpty || value.length < 5) {
                                  return 'Введите верный пароль';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        isEmailCorrect
                            ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor: isEmailCorrect ? Colors.green : Colors.red,
                            padding: const EdgeInsets.symmetric(horizontal: 131, vertical: 20),
                          ),
                          onPressed: _login,
                          child: const Text(
                            'Войти',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        )
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
