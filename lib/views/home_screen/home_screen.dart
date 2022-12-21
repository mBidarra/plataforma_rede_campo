import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: [
          PreferredSize(
            preferredSize: Size(screenSize.width, 1000),
            child: SizedBox(
              height: 390,
              child: Stack(
                children: [
                  Image.asset(
                    'images/Header.png',
                    fit: BoxFit.contain,
                  ),
                  Center(
                    child: Text(
                      "Rede Campo",
                      style: TextStyle(
                          color: Color.fromRGBO(41, 208, 78, 1),
                          fontSize: 100,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
