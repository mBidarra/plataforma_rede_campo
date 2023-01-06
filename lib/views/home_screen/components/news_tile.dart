import 'package:flutter/material.dart';
import 'package:plataforma_rede_campo/models/news.dart';
import 'package:plataforma_rede_campo/views/news_screen/news_screen.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({Key? key, required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NewsScreen(news: news),
          ),
        );
      },
      child: Container(
        height: 187,
        margin: const EdgeInsets.symmetric(horizontal: 21, vertical: 8),
        padding: const EdgeInsets.fromLTRB(24, 15, 24, 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(52, 61, 67, 1),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Categoria",
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                fontFamily: 'Chillax',
                color: Color.fromRGBO(134, 205, 47, 1),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "${news.title}",
              maxLines: 1,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "${news.content}",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(255, 255, 255, 0.87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
