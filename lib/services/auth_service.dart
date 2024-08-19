import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      if (kDebugMode) {
        print('Error during sign in: $e');
      }
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print('Error during sign out: $e');
      }
    }
  }

  User? get currentUser => _auth.currentUser;

  Future<List<String>?> getUserRoles(String uid) async {
    try {
      DocumentSnapshot snapshot = await _firestore.collection('users').doc(uid).get();
      List<String> roles = List<String>.from(snapshot['roles']);
      return roles;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user roles: $e');
      }
      return null;
    }
  }

  bool hasRole(List<String>? roles, String role) {
    return roles != null && roles.contains(role);
  }
}
