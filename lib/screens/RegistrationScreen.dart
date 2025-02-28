import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:templateuiauth/screens/widgets/LoginForm.dart';
import 'package:templateuiauth/screens/widgets/SignupForm.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleView() {
    setState(() {
      if (isLogin) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.deepPurple],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Spacer(flex: 2),
                          Animate(
                            effects: [
                              FadeEffect(duration: 600.ms),
                              ScaleEffect(
                                begin: const Offset(0.8, 0.8),
                                end: const Offset(1, 1),
                                duration: 600.ms,
                              ),
                            ],
                            child: Text(
                              isLogin ? 'Welcome Back' : 'Create Account',
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 40),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: isLogin
                                ? const LoginForm()
                                : const SignupForm(),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return ScaleTransition(
                                  scale: animation, child: child);
                            },
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: _toggleView,
                            child: Text(
                              isLogin
                                  ? 'Need an account? Sign up'
                                  : 'Already have an account? Log in',
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ),
                          const Spacer(flex: 3),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
