import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottonPanel extends StatelessWidget {
  const BottonPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 315,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color.fromRGBO(52, 61, 67, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: SvgPicture.asset('icons/instagram.svg'),
              ),
              SizedBox(
                width: 17,
              ),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset('icons/facebook.svg'),
              ),
              SizedBox(
                width: 17,
              ),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset('icons/twitter.svg'),
              ),
            ],
          ),
          Container(
            width: 783,
            margin: const EdgeInsets.only(top: 34, bottom: 17),
            child: Column(
              children: const [
                Text(
                  'Donec nec mi vitae eros pretium iaculis. Pellentesque consectetur sem nisl, a dignissim ipsum cursus vitae. Praesent lacinia, mi in dapibus accumsan.',
                  style: TextStyle(
                    color: Color.fromRGBO(134, 205, 47, 1),
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    fontFamily: 'SF Pro Display',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Santa helena | Paraná | Brasil',
                  style: TextStyle(
                    color: Color.fromRGBO(
                      214,
                      202,
                      202,
                      1,
                    ),
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    fontFamily: 'SF Pro Display',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
