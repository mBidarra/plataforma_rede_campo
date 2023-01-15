import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

class PersonTile extends StatelessWidget {
  PersonTile({Key? key, this.image, required this.name}) : super(key: key);

  final String? image;

  final String name;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Observer(
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          image != null
              ? ClipOval(
                  //borderRadius: BorderRadius.circular(screenSize.height * 0.14),
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(
                      screenSize.height * 0.14,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: image!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/images/semImagem.svg'),
                ),
          const SizedBox(
            height: 30,
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w500,
              fontFamily: 'SF Pro Display',
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
        ],
      ),
    );
  }
}
