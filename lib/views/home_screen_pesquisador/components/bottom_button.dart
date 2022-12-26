import 'package:flutter/material.dart';

class BottonButton extends StatelessWidget {
  const BottonButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
        height: 245,
        width: 703,
        child: Card(
          color: const Color.fromRGBO(217, 217, 217, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(57, 51, 51, 1),
                //fontFamily: "SF Pro Text",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
