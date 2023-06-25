import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextField(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          filled: true,
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            borderSide: BorderSide.none,
          ),
          labelText: label,
        ),
        // Add TextEditingController to manage the entered value
        controller: TextEditingController(),
        // Add form validation
        // validator: (value) {
        //   // Perform validation and return error message if invalid
        //   return 'Invalid $label';
        // },
        // Enable/disable auto-focus, auto-capitalization, etc., based on requirements
      ),
    );
  }
}
