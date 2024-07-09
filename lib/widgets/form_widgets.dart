import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ocreative_land/widgets/static_color.dart';

/// my email form field widget ....................................................
///
class MailFormField extends StatelessWidget {
  const MailFormField({
    super.key,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    required this.controller,
  });
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        validator: validator,
        style: const TextStyle(fontSize: 12),
        controller: controller,
        decoration: InputDecoration(
          labelText: 'email',
          labelStyle: const TextStyle(color: appLightGreen),
          floatingLabelStyle: const TextStyle(
            color: appLightGreen,
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: appLightGreen, width: 2)),
          errorStyle: const TextStyle(fontSize: 12),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: appLightGreen, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: appLightGreen, width: 2)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: appLightGreen),
          ),
        ));
  }
}

/// my password // confirm password form field widget ....................................................

class MyPassFormField extends StatelessWidget {
  const MyPassFormField({
    super.key,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    required this.iconTapped,
    required this.leb,
    required this.obscure,
    required this.controller,
  });
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function() iconTapped;
  final String leb;
  final bool obscure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      validator: validator,
      style: const TextStyle(fontSize: 12),
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          color: appLightGreen,
          icon: obscure
              ? const Icon(Icons.visibility_off_sharp)
              : const Icon(Icons.visibility_sharp),
          onPressed: iconTapped,
        ),
        labelText: leb,
        labelStyle: const TextStyle(color: appLightGreen),
        floatingLabelStyle: const TextStyle(
          color: appLightGreen,
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: appLightGreen, width: 2)),
        errorStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 12),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: appLightGreen, width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: appLightGreen, width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: appLightGreen, width: 2)),
      ),
    );
  }
}

/// my search form field widget ....................................................

class SearchField extends StatelessWidget {
  const SearchField(
      {super.key, required this.controller, required this.afocus});
  final TextEditingController controller;
  final bool afocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: afocus,
      style: const TextStyle(fontSize: 12),
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Quick search commodities',
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(39),
            borderSide: const BorderSide(color: appLightGreen, width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: appLightGreen, width: 2)),
      ),
    );
  }
}
