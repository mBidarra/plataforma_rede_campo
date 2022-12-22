import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:plataforma_rede_campo/stores/login_store.dart';
import 'package:plataforma_rede_campo/views/login_screen/components/navigation_button.dart';
import 'components/bar_button.dart';
import 'components/title_text_form.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/backgroundLoginScreen.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: SizedBox(
                width: 978,
                child: Card(
                  //margin: EdgeInsets.symmetric(horizontal: 400),
                  color: const Color.fromRGBO(52, 61, 67, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 45,
                      left: 154,
                      right: 154,
                      bottom: 69,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Observer(
                            builder: (context) => Row(
                              children: [
                                BarButton(
                                  label: 'Pesquisador',
                                  color: loginStore.typeLogin ==
                                          TypeLogin.PESQUISADOR
                                      ? const Color.fromRGBO(120, 230, 33, 1)
                                      : const Color.fromRGBO(217, 217, 217, 1),
                                  onTap: () {
                                    loginStore.setTypeLogin(
                                        TypeLogin.PESQUISADOR.index);
                                  },
                                ),
                                BarButton(
                                  label: 'Administrador',
                                  color: loginStore.typeLogin ==
                                          TypeLogin.ADMINISTRADOR
                                      ? const Color.fromRGBO(120, 230, 33, 1)
                                      : const Color.fromRGBO(217, 217, 217, 1),
                                  onTap: () {
                                    loginStore.setTypeLogin(
                                        TypeLogin.ADMINISTRADOR.index);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 92,
                        ),
                        const TitleTextForm(
                          title: "EMAIL",
                        ),
                        Observer(
                          builder: (context) => TextFormField(
                            style: const TextStyle(fontSize: 25),
                            onChanged: loginStore.setEmail,
                            keyboardType: TextInputType.emailAddress,
                            enabled: !loginStore.loading,
                            decoration: InputDecoration(
                              errorText: loginStore.emailError,
                              filled: true,
                              fillColor: const Color.fromRGBO(239, 231, 231, 1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        const TitleTextForm(
                          title: "SENHA",
                        ),
                        Observer(
                          builder: (context) => TextFormField(
                            style: const TextStyle(fontSize: 25),
                            onChanged: loginStore.setPassword,
                            obscureText: true,
                            enabled: !loginStore.loading,
                            decoration: InputDecoration(
                              errorText: loginStore.passwordError,
                              filled: true,
                              fillColor: const Color.fromRGBO(239, 231, 231, 1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Observer(
                                  builder: (context) => Theme(
                                    data: Theme.of(context).copyWith(
                                      unselectedWidgetColor:
                                          const Color.fromRGBO(
                                              217, 217, 217, 1),
                                    ),
                                    child: Checkbox(
                                      value: loginStore.manterConectado,
                                      onChanged: (x) {
                                        loginStore.setManterConectado();
                                      },
                                      hoverColor: const Color.fromRGBO(
                                          217, 217, 217, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  "Mantenha-me conectado",
                                  style: TextStyle(
                                    fontFamily: 'Chillax',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              child: const Text(
                                "Esqueceu sua senha?",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: 'Chillax',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: Observer(
                            builder: (context) => SizedBox(
                              height: 58,
                              width: 248,
                              child: GestureDetector(
                                onTap: loginStore.invalidSendPressed,
                                child: ElevatedButton(
                                  onPressed: loginStore.loginPressed,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(237, 179, 29, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    "LOGIN",
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Rede Campo",
                style: TextStyle(
                  fontFamily: 'Chillax',
                  fontSize: 37,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(120, 231, 33, 1),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.only(
                left: 14,
                top: 30,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  NavigationButton(
                    label: 'Home',
                    onTap: () {},
                  ),
                  NavigationButton(
                    label: 'Noticias',
                    onTap: () {},
                  ),
                  NavigationButton(
                    label: 'Projetos',
                    onTap: () {},
                  ),
                  NavigationButton(
                    label: 'Painel',
                    onTap: () {},
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
