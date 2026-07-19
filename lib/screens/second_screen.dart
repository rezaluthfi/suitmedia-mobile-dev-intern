import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_mobile_dev_intern/core/providers/app_providers.dart';
import 'package:suitmedia_mobile_dev_intern/widgets/custom_button.dart';

import 'third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final inputName = context.watch<AppProvider>().inputName;
    final selectedUser = context.watch<AppProvider>().selectedUserName;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF554AF0),
            size: 24,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Second Screen',
          style: TextStyle(
            color: Color(0xFF04021D),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF04021D),
                ),
              ),
              Text(
                inputName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF04021D),
                ),
              ),

              const Spacer(),

              // Display selected user name
              Center(
                child: Text(
                  selectedUser,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF04021D),
                  ),
                ),
              ),

              const Spacer(),

              // Button Choose a User
              CustomButton(
                text: 'Choose a User',
                onPressed: () {
                  // Navigate to ThirdScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThirdScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
