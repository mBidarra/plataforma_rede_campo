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
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        //mainAxisAlignment: MainAxisAlignment.center,
        alignment: WrapAlignment.start,
        direction: Axis.horizontal,
        spacing: 28,
        runSpacing: 5.0,
        children: [
          NavigationBarraButton(label: "Home", onTap: () {}),
          NavigationBarraButton(label: "Projetos", onTap: () {}),
          NavigationBarraButton(label: "Notícias", onTap: () {}),
          NavigationBarraButton(label: "Galeria", onTap: () {}),
          NavigationBarraButton(label: "Parcerias", onTap: () {}),
          NavigationBarraButton(label: "Eventos", onTap: () {}),
          NavigationBarraButton(label: "Equipe", onTap: () {}),
          NavigationBarraButton(label: "Painel", onTap: () {}),
        ],
      ),
    );
  }
}
