
import 'package:flutter/material.dart';
// ريم محمد
class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
    required this.error
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(error));
  }
}
