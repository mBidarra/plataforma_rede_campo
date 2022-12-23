import 'package:flutter/material.dart';

class TitleTextFormCadastro extends StatelessWidget {
  const TitleTextFormCadastro({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          '•',
          style: TextStyle(
            color: Color.fromRGBO(13, 13, 13, 1),
            fontWeight: FontWeight.w400,
            fontSize: 34,
          ),
        ),
        Text(
          ' ${title}',
          style: TextStyle(
            color: Color.fromRGBO(13, 13, 13, 1),
            fontWeight: FontWeight.w400,
            fontSize: 34,
          ),
        ),
      ],
    );
  }
}
