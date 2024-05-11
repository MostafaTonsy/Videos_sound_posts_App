import 'package:flutter/material.dart';
import 'package:videos_sounds_app/core/constants/Colors.dart';

class CUSTOM_TEXT_FORM_FIELD extends StatelessWidget {
  final TextInputType input_type;
  final ValueSetter? on_changed;
  final String label;
  String? Function(String?)? VALIDATOR;
  final Widget? suffix_icon;
  final int maxlines;

  final TextEditingController? editingController;
  final bool obscure_text;
  CUSTOM_TEXT_FORM_FIELD(
      {super.key,
      required this.VALIDATOR,
      required this.input_type,
      required this.label,
      required this.suffix_icon,
      required this.maxlines,
      required this.editingController,
      required this.obscure_text,
      required this.on_changed});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 13,
        color: Colors.black,
      ),
      keyboardType: input_type,
      cursorColor: Colors.purple,
      controller: editingController,
      obscureText: obscure_text,
      onChanged: on_changed,
      validator: VALIDATOR,
      maxLines: maxlines,
      decoration: InputDecoration(
          label: Text(label),
          labelStyle: const TextStyle(fontSize: 13),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: suffix_icon,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: BLUE_LIGHT_COLOR,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: BLUE_LIGHT_COLOR,
              ))),
    );
  }
}
