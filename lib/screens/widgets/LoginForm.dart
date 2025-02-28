import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:templateuiauth/screens/widgets/CustomTextField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        SlideEffect(
            begin: const Offset(0, 0.1), end: Offset.zero, duration: 400.ms),
        FadeEffect(duration: 400.ms),
      ],
      child: Column(
        children: [
          const CustomTextField(
            hint: 'Email',
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 20),
          const CustomTextField(
            hint: 'Password',
            isPassword: true,
            icon: Icons.lock_outline,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.deepPurple,
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ).copyWith(
              elevation: MaterialStateProperty.all(8),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.deepPurple.withOpacity(0.5);
                  return null;
                },
              ),
            ),
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
              .animate(onPlay: (controller) => controller.repeat())
              .shimmer(duration: 1800.ms, color: Colors.white24)
              .scale(
                  begin: Offset(1, 1),
                  end: Offset(1.05, 1.05),
                  duration: 600.ms)
              .then(delay: 600.ms)
              .scale(
                  begin: Offset(1.05, 1.05),
                  end: Offset(1, 1),
                  duration: 600.ms),
          const SizedBox(height: 30),
          const Text(
            'Or login with',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton(FontAwesomeIcons.google, Colors.red),
              const SizedBox(width: 20),
              _buildSocialButton(FontAwesomeIcons.facebookF, Colors.blue),
              const SizedBox(width: 20),
              _buildSocialButton(FontAwesomeIcons.apple, Colors.black),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: IconButton(
        icon: FaIcon(icon, color: color, size: 24), // Specify size here
        onPressed: () {},
      ),
    )
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(duration: 1000.ms, color: Colors.white24)
        .shake(hz: 4, curve: Curves.easeInOut);
  }
}
