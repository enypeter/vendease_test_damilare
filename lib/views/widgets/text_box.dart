import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

TextFormField searchTextField({controller, onChanged}) {
  return TextFormField(
    buildCounter: (context,
        {required currentLength, required isFocused, maxLength}) =>
    null,
    controller: controller,
    style: const TextStyle(fontSize: 14, color: DARK_GREY),
    onChanged: onChanged,
    decoration: InputDecoration(
      filled: false,
      border: InputBorder.none,
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: GREY, width: 0.6),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: GREY, width: 0.6),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: GREY.withOpacity(0.6), width: 0.6),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(color: Colors.redAccent, width: 0.6),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(color: LIGHT_GREY, width: 0.6),
      ),
      suffixIcon: const Icon(Icons.search, size: 20),
      hintText: 'Search Product',
      hintStyle: const TextStyle(fontSize: 13, color: GREY),
      contentPadding:
      const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
    ),
  );
}
