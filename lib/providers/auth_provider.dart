import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class User {
  final String name;
  final String email;
  final String password;

  User({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }
}

class AuthProvider with ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;
  String _errorMessage = '';

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  bool get isLoggedIn => _currentUser != null;

  // Initialize provider and check if user is already logged in
  Future<void> initializeAuth() async {
    _setLoading(true);
    try {
      final prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

      if (isLoggedIn) {
        final userJson = prefs.getString('currentUser');
        if (userJson != null) {
          final userMap = json.decode(userJson);
          _currentUser = User.fromJson(userMap);
        }
      }
    } catch (e) {
      _setError('Failed to initialize authentication');
    }
    _setLoading(false);
  }

  // Sign up new user
  Future<bool> signUp(String name, String email, String password) async {
    _setLoading(true);
    _clearError();

    try {
      final prefs = await SharedPreferences.getInstance();

      // Check if user already exists
      final existingUsersJson = prefs.getString('users') ?? '[]';
      final List<dynamic> existingUsers = json.decode(existingUsersJson);

      // Check if email is already registered
      for (var userData in existingUsers) {
        final user = User.fromJson(userData);
        if (user.email.toLowerCase() == email.toLowerCase()) {
          _setError('Email already registered');
          _setLoading(false);
          return false;
        }
      }

      // Create new user
      final newUser = User(name: name, email: email, password: password);
      existingUsers.add(newUser.toJson());

      // Save users list
      await prefs.setString('users', json.encode(existingUsers));

      // Set as current user
      _currentUser = newUser;
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('currentUser', json.encode(newUser.toJson()));

      _setLoading(false);
      notifyListeners();
      return true;
    } catch (e) {
      _setError('Failed to create account');
      _setLoading(false);
      return false;
    }
  }

  // Login user
  Future<bool> login(String email, String password) async {
    _setLoading(true);
    _clearError();

    try {
      final prefs = await SharedPreferences.getInstance();
      final usersJson = prefs.getString('users') ?? '[]';
      final List<dynamic> users = json.decode(usersJson);

      // Find user with matching credentials
      for (var userData in users) {
        final user = User.fromJson(userData);
        if (user.email.toLowerCase() == email.toLowerCase() &&
            user.password == password) {
          _currentUser = user;
          await prefs.setBool('isLoggedIn', true);
          await prefs.setString('currentUser', json.encode(user.toJson()));

          _setLoading(false);
          notifyListeners();
          return true;
        }
      }

      _setError('Invalid email or password');
      _setLoading(false);
      return false;
    } catch (e) {
      _setError('Failed to login');
      _setLoading(false);
      return false;
    }
  }

  // Send password reset (simulate sending email)
  Future<bool> sendPasswordReset(String email) async {
    _setLoading(true);
    _clearError();

    try {
      final prefs = await SharedPreferences.getInstance();
      final usersJson = prefs.getString('users') ?? '[]';
      final List<dynamic> users = json.decode(usersJson);

      // Check if email exists
      bool emailExists = false;
      for (var userData in users) {
        final user = User.fromJson(userData);
        if (user.email.toLowerCase() == email.toLowerCase()) {
          emailExists = true;
          break;
        }
      }

      if (!emailExists) {
        _setError('Email not found');
        _setLoading(false);
        return false;
      }

      // Simulate sending reset email (in real app, you'd call an API)
      await Future.delayed(const Duration(seconds: 2));

      _setLoading(false);
      return true;
    } catch (e) {
      _setError('Failed to send password reset');
      _setLoading(false);
      return false;
    }
  }

  // Logout user
  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
      await prefs.remove('currentUser');
      _currentUser = null;
      notifyListeners();
    } catch (e) {
      _setError('Failed to logout');
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _errorMessage = error;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = '';
  }

  void clearError() {
    _clearError();
    notifyListeners();
  }
}
