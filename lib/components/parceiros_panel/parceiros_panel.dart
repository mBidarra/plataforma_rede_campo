import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ParceirosPanel extends StatelessWidget {
  const ParceirosPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 587,
      decoration: BoxDecoration(
        color: Color.fromRGBO(217, 217, 217, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 2,
          ),
          Text(
            "Parceiros",
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF Pro Display',
              color: Color.fromRGBO(28, 38, 50, 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 120,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset('images/utfpr.svg'),
                //SvgPicture.asset('images/utf.svg'),
                Image.asset('images/idr-pr.png'),
                SvgPicture.asset('images/prefeitura.svg'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
