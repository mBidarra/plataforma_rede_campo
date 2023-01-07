import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../components/bottom panel/botton panel.dart';
import '../../components/home_button.dart';
import '../../components/navigation_bar/navigation_barra.dart';
import '../../components/rounded_right_button2.dart';
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
          Stack(
            fit: StackFit.passthrough,
            children: [
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
                          news.title!,
                          style: TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'TimesNewRoman',
                          ),
                        ),
                        const SizedBox(
                          height: 64,
                        ),
                        Container(
                          height: 594,
                          width: double.infinity,
                          color: const Color.fromRGBO(217, 217, 217, 1),
                          child: CachedNetworkImage(
                            imageUrl: news.image1!.isEmpty ? 'https://static.thenounproject.com/png/194055-200.png' : news.image1!.first,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        (news.titleImage2 != null && news.titleImage2!.isNotEmpty)
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 655,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          height: 594,
                                          color: const Color.fromRGBO(217, 217, 217, 1),
                                          child: CachedNetworkImage(
                                            //imageUrl: news.images.isEmpty ? 'https://static.thenounproject.com/png/194055-200.png' : images.images.first,
                                            imageUrl: news.image1!.isEmpty
                                                ? 'https://static.thenounproject.com/png/194055-200.png'
                                                : news.image2.url,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          news.titleImage2 ?? '',
                                          maxLines: 1,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Color.fromRGBO(52, 61, 67, 1),
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        (news.optionalContent != null && news.optionalContent!.isNotEmpty)
                                            ? Text(
                                                news.optionalContent!,
                                                textAlign: TextAlign.justify,
                                                style: const TextStyle(
                                                  color: Color.fromRGBO(52, 61, 67, 1),
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  SizedBox(
                                    width: 655,
                                    child: Column(
                                      children: [
                                        Text(
                                          news.title!,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            color: Color.fromRGBO(52, 61, 67, 1),
                                            fontSize: 33,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 27,
                                        ),
                                        Text(
                                          news.content!,
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(
                                            color: Color.fromRGBO(52, 61, 67, 1),
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  Text(
                                    news.title!,
                                    style: const TextStyle(
                                      fontSize: 33,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(52, 61, 67, 1),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 45,
                                  ),
                                  Text(
                                    news.content!,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(52, 61, 67, 1),
                                    ),
                                  ),
                                  (news.optionalContent != null && news.optionalContent!.isNotEmpty)
                                      ? Text(
                                          news.optionalContent!,
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(52, 61, 67, 1),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 88,
                    left: 73,
                  ),
                  child: HomeButton(),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 88,
                    right: 73,
                  ),
                  child: RoundedRightButton2(
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
          const BottonPanel(),
        ],
      ),
    );
  }
}
