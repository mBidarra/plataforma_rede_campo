import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plataforma_rede_campo/stores/about_store.dart';

class PersonTilePesquisador extends StatelessWidget {
  PersonTilePesquisador({Key? key, required this.aboutStore, required this.index}) : super(key: key);

  final AboutStore aboutStore;

  int index;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Observer(
      builder: (context) => InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            aboutStore.pesquisadoresList[index].image.url != null
                ? ClipOval(
                    //borderRadius: BorderRadius.circular(screenSize.height * 0.14),
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(
                        screenSize.height * 0.14,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: aboutStore.pesquisadoresList[index].image.url,
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
            aboutStore.loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    aboutStore.pesquisadoresList[index].name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SF Pro Display',
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
