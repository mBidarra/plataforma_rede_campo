import 'package:flutter/material.dart';

class BarButton extends StatelessWidget {
  BarButton({Key? key, required this.label, required this.onTap})
      : super(key: key);

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color.fromRGBO(217, 217, 217, 1),
              ),
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(217, 217, 217, 1),
            ),
          ),
        ),
      ),
    );
  }
}
