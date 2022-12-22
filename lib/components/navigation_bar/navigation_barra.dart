import 'package:flutter/material.dart';
import 'package:plataforma_rede_campo/components/navigation_bar/components/navigation_barra_button.dart';

class NavigationBarra extends StatelessWidget {
  const NavigationBarra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(23, 42, 56, 0.7),
        border: Border.all(
          color: const Color.fromRGBO(23, 42, 56, 1),
          width: 3,
        ),
      ),
      height: 117,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NavigationBarraButton(label: "Home", onTap: () {}),
          const SizedBox(width: 20),
          NavigationBarraButton(label: "Projetos", onTap: () {}),
          const SizedBox(width: 20),
          NavigationBarraButton(label: "Noticias", onTap: () {}),
        ],
      ),
    );
  }
}
