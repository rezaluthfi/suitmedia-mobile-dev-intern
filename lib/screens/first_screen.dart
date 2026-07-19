import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_mobile_dev_intern/core/utils/palindrome_helper.dart';
import 'package:suitmedia_mobile_dev_intern/widgets/custom_button.dart';
import 'package:suitmedia_mobile_dev_intern/widgets/custom_text_field.dart';

import '../core/providers/app_providers.dart';
import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'OK',
              style: TextStyle(
                color: Color(0xFF2B637B),
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 116,
                    height: 116,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 50),

                  // Input field for name
                  CustomTextField(
                    controller: _nameController,
                    hintText: 'Name',
                  ),

                  const SizedBox(height: 22),

                  // Input field for palindrome
                  CustomTextField(
                    controller: _palindromeController,
                    hintText: 'Palindrome',
                  ),

                  const SizedBox(height: 45),

                  // Button to check palindrome
                  CustomButton(
                    text: 'CHECK',
                    onPressed: () {
                      String text = _palindromeController.text.trim();
                      if (text.isEmpty) {
                        _showDialog(
                          'Masukkan teks palindrome terlebih dahulu!',
                        );
                      } else {
                        bool result = PalindromeHelper.isPalindrome(text);
                        _showDialog(result ? 'isPalindrome' : 'not palindrome');
                      }
                    },
                  ),

                  const SizedBox(height: 16),

                  // Button NEXT to navigate to SecondScreen
                  CustomButton(
                    text: 'NEXT',
                    onPressed: () {
                      if (_nameController.text.trim().isEmpty) {
                        _showDialog('Masukkan nama Anda terlebih dahulu!');
                      } else {
                        // Set name ke provider
                        context.read<AppProvider>().setInputName(
                          _nameController.text.trim(),
                        );
                        // Navigate ke SecondScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SecondScreen(),
                          ),
                        );
                      }
                    },
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
