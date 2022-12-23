import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plataforma_rede_campo/components/bottom%20panel/botton%20panel.dart';
import 'package:plataforma_rede_campo/views/cadastro_screen/components/title_text_form_cadastro.dart';

class CadastroScreen extends StatelessWidget {
  const CadastroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 231, 231, 1),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 68, left: 55, right: 55),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Tooltip(
                  message: "Home",
                  child: InkWell(
                    onTap: () {},
                    child: SvgPicture.asset('icons/home.svg'),
                  ),
                ),
                Tooltip(
                  message: "Sair",
                  child: InkWell(
                    onTap: () {},
                    child: SvgPicture.asset('icons/sign_out.svg'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 4, left: 549, right: 549, bottom: 67),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('icons/user_circle.svg'),
                SizedBox(
                  height: 87,
                ),
                TitleTextFormCadastro(title: "Nome completo:"),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: const TextStyle(fontSize: 25),
                  //onChanged: loginStore.setPassword,
                  //enabled: !loginStore.loading,
                  decoration: InputDecoration(
                    //errorText: loginStore.passwordError,
                    filled: true,
                    fillColor: const Color.fromRGBO(193, 193, 193, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 33,
                ),
                TitleTextFormCadastro(title: "Email:"),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: const TextStyle(fontSize: 25),
                  //onChanged: loginStore.setPassword,
                  //enabled: !loginStore.loading,
                  decoration: InputDecoration(
                    //errorText: loginStore.passwordError,
                    filled: true,
                    fillColor: const Color.fromRGBO(193, 193, 193, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 33,
                ),
                TitleTextFormCadastro(title: "Idade:"),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: const TextStyle(fontSize: 25),
                  //onChanged: loginStore.setPassword,
                  //enabled: !loginStore.loading,
                  decoration: InputDecoration(
                    //errorText: loginStore.passwordError,
                    filled: true,
                    fillColor: const Color.fromRGBO(193, 193, 193, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 33,
                ),
                TitleTextFormCadastro(title: "Telefone:"),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: const TextStyle(fontSize: 25),
                  //onChanged: loginStore.setPassword,
                  //enabled: !loginStore.loading,
                  decoration: InputDecoration(
                    //errorText: loginStore.passwordError,
                    filled: true,
                    fillColor: const Color.fromRGBO(193, 193, 193, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 68,
                ),
                SizedBox(
                  height: 73,
                  width: 439,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(72, 125, 59, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'SF Pro Display',
                        color: Color.fromRGBO(246, 245, 244, 1),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Salvar alterações"),
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                SizedBox(
                  height: 73,
                  width: 439,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(182, 60, 60, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'SF Pro Display',
                        color: Color.fromRGBO(246, 245, 244, 1),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Excluir conta"),
                  ),
                )
              ],
            ),
          ),
          BottonPanel(),
        ],
      ),
    );
  }
}
