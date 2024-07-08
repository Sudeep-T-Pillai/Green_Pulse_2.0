import 'package:flutter/material.dart';

class TextInfo extends StatelessWidget {
  final String _tiltle; // Corrected typo here
  static const double _hpad = 16.0;

  const TextInfo(this._tiltle);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(_hpad, 12.0, _hpad, 4.0),
      child: Text(
        _tiltle, // Wrap the string with Text widget
        style: TextStyle(
          fontSize: 20, // Example of font size
        ),
      ),
    );
  }
}
