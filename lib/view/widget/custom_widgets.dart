import 'package:chat_app/constantces.dart';
import 'package:flutter/material.dart';

class CostumTextFormField extends StatelessWidget {
  final String hintText;
  final Function(String) onChange;
  final FormFieldValidator<String> validator;
  const CostumTextFormField(this.hintText,
      {required this.onChange, required this.validator, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CostumButton extends StatelessWidget {
  final String textChild;
  final VoidCallback onTap;
  const CostumButton(this.textChild, {required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Center(
          child: Text(
            textChild,
            style: const TextStyle(fontSize: 20, color: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}

void messageFromSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
