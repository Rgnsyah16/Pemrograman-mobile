import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Praktikum - Login Form',
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;
  bool showPassword = false;
  bool isLoading = false;

  String? emailError;
  String? passwordError;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email');
    final savedRemember = prefs.getBool('remember');

    if (savedEmail != null) {
      emailController.text = savedEmail;
    }

    if (savedRemember != null) {
      setState(() {
        rememberMe = savedRemember;
      });
    }
  }

  bool validateEmail(String value) {
    final pattern = r"^[^\s@]+@[^\s@]+\.[^\s@]+$";
    return RegExp(pattern).hasMatch(value);
  }

  bool validate() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    setState(() {
      emailError = null;
      passwordError = null;
    });

    bool isValid = true;

    if (email.isEmpty) {
      emailError = "Email wajib diisi";
      isValid = false;
    } else if (!validateEmail(email)) {
      emailError = "Format email tidak valid";
      isValid = false;
    }

    if (password.isEmpty) {
      passwordError = "Password wajib diisi";
      isValid = false;
    } else if (password.length < 6) {
      passwordError = "Minimal 6 karakter";
      isValid = false;
    }

    setState(() {});
    return isValid;
  }

  Future<void> handleSubmit() async {
    if (!validate()) return;

    setState(() => isLoading = true);

    await Future.delayed(const Duration(seconds: 1));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (rememberMe) {
      await prefs.setString('email', emailController.text.trim());
      await prefs.setBool('remember', true);
    } else {
      await prefs.remove('email');
      await prefs.remove('remember');
    }

    setState(() => isLoading = false);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Login Berhasil'),
        content: Text('Email: ${emailController.text}\nRemember Me: $rememberMe'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 380,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Login Form",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // EMAIL INPUT
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  errorText: emailError,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),

              // PASSWORD INPUT
              TextField(
                controller: passwordController,
                obscureText: !showPassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  errorText: passwordError,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() => showPassword = !showPassword);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (v) {
                      setState(() => rememberMe = v!);
                    },
                  ),
                  const Text("Remember me"),
                ],
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: isLoading ? null : handleSubmit,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Login", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
