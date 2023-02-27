import 'package:flutter/material.dart';

class DescText extends Text {
  final String description;

  const DescText({super.key, required this.description})
      : super(
          description,
          style: const TextStyle(color: Colors.black54),
        );
}
