import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'components/bar_button.dart';
import 'components/title_text_form.dart';

enum TypeLogin { PESQUISADOR, ADMINISTRADOR }

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TypeLogin typeLogin = TypeLogin.PESQUISADOR;

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
                          child: Row(
                            children: [
                              BarButton(
                                label: 'Pesquisador',
                                onTap: () {
                                  typeLogin = TypeLogin.PESQUISADOR;
                                },
                              ),
                              BarButton(
                                label: 'Administrador',
                                onTap: () {
                                  typeLogin = TypeLogin.ADMINISTRADOR;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 92,
                        ),
                        const TitleTextForm(
                          title: "EMAIL",
                        ),
                        TextFormField(
                          style: const TextStyle(fontSize: 25),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(239, 231, 231, 1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        const TitleTextForm(
                          title: "SENHA",
                        ),
                        TextFormField(
                          style: const TextStyle(fontSize: 25),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(239, 231, 231, 1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: false,
                                  onChanged: (x) {
                                    if (kDebugMode) {
                                      print("");
                                    }
                                  },
                                  hoverColor: Color.fromRGBO(217, 217, 217, 1),
                                ),
                                const Text(
                                  "Mantenha-me conectado",
                                  style: TextStyle(
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
                          child: SizedBox(
                            height: 58,
                            width: 248,
                            child: ElevatedButton(
                              onPressed: () {},
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
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                  color: Color.fromRGBO(255, 255, 255, 1),
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
                  fontSize: 37,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(120, 231, 33, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
