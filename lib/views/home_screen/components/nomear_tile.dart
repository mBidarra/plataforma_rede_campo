import 'package:flutter/material.dart';
import 'package:plataforma_rede_campo/models/news.dart';

class NomearTile extends StatelessWidget {
  const NomearTile({Key? key, required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 186,
      margin: const EdgeInsets.symmetric(horizontal: 21, vertical: 8),
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(52, 61, 67, 1),
      ),
      child: Column(
        children: [],
      ),
    );
  }
}
