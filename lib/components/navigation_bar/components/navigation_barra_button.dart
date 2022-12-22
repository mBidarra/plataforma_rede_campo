import 'package:flutter/material.dart';

class NavigationBarraButton extends StatelessWidget {
  const NavigationBarraButton(
      {Key? key, required this.label, required this.onTap})
      : super(key: key);

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 173,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(39, 67, 44, 0.7),
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromRGBO(23, 42, 56, 1),
              width: 3,
            ),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(226, 226, 226, 1),
          ),
        ),
      ),
    );
  }
}
