import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../components/bottom panel/botton panel.dart';
import '../../components/navigation_bar/navigation_barra.dart';
import '../../models/news.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key, required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/header2.png"),
                fit: BoxFit.cover,
              ),
            ),
            height: 390,
            width: screenSize.width,
            child: Stack(
              children: const [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Rede Campo",
                    style:
                        TextStyle(fontFamily: 'Chillax', color: Color.fromRGBO(41, 208, 78, 1), fontSize: 100, fontWeight: FontWeight.w700),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: NavigationBarra(),
                )
              ],
            ),
          ),
          UnconstrainedBox(
            child: SizedBox(
              width: 1360,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 100,
                ),
                child: Column(
                  children: [
                    Text(
                      news.title,
                      style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'TimesNewRoman',
                      ),
                    ),
                    SizedBox(
                      height: 64,
                    ),
                    Container(
                      height: 594,
                      width: double.infinity,
                      color: Colors.blue,
                      child: CachedNetworkImage(
                        //imageUrl: news.images.isEmpty ? 'https://static.thenounproject.com/png/194055-200.png' : images.images.first,
                        imageUrl: 'https://static.thenounproject.com/png/194055-200.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 594,
                              width: 655,
                              child: CachedNetworkImage(
                                //imageUrl: news.images.isEmpty ? 'https://static.thenounproject.com/png/194055-200.png' : images.images.first,
                                imageUrl: 'https://static.thenounproject.com/png/194055-200.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(news.title),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Text(news.title),
                            Container(
                              width: 655,
                              child: Text(
                                news.description,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const BottonPanel(),
        ],
      ),
    );
  }
}
