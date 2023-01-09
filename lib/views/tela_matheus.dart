import 'package:flutter/material.dart';

class TelaMatheus extends StatefulWidget {
  @override
  _TelaMatheusState createState() => _TelaMatheusState();
}

class _TelaMatheusState extends State<TelaMatheus> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> _items = [
    {
      'image': 'https://picsum.photos/250?image=0',
      'title': 'Title 1',
      'description': 'Loremipsum dolor sit amet, consectetur adipiscing elit. Morbi fermentum vestibulum volutpat.',
    },
    {
      'image': 'https://picsum.photos/250?image=1',
      'title': 'Title 2',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi fermentum vestibulum volutpat.',
    },
    {
      'image': 'https://picsum.photos/250?image=2',
      'title': 'Title 3',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi fermentum vestibulum volutpat.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Image.network(_items[index]['image']);
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(_items[_currentIndex]['title'], style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(_items[_currentIndex]['description'], style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      _pageController.jumpToPage(0);
                    },
                    child: Text('Go to first page'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _pageController.animateToPage(
                        1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: Text('Go to second page'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _pageController.jumpToPage(2);
                    },
                    child: Text('Go to third page'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
