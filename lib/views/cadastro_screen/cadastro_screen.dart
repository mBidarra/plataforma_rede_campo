import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';
import 'package:plataforma_rede_campo/components/bottom%20panel/botton%20panel.dart';
import 'package:plataforma_rede_campo/components/home_button.dart';
import 'package:plataforma_rede_campo/stores/cadastro_store.dart';
import 'package:plataforma_rede_campo/views/cadastro_screen/components/title_text_form_cadastro.dart';
import 'package:plataforma_rede_campo/views/login_screen/login_screen.dart';
import '../../components/error_box.dart';
import '../../components/sign_out_button.dart';
import '../../components/navigation_bar/navigation_barra.dart';
import '../login_screen/components/alert_dialog_email_send.dart';

class CadastroScreen extends StatefulWidget {
  CadastroScreen({Key? key}) : super(key: key);

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  CadastroStore cadastroStore = CadastroStore();
  late ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();

    disposer = reaction((_) => cadastroStore.singUpSuccess, (s) {
      if (s == true) {
        showDialog(
          context: context,
          builder: (context) => AlertDialogEmailSend(),
        ).then(
          (value) => cadastroStore.setSingUpSuccessSuccess(false),
        );
      }
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 231, 231, 1),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/header2.png"),
                fit: BoxFit.cover,
              ),
            ),
            height: 390,
            width: screenSize.width,
            child: Stack(
              children: const [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Rede Campo",
                    style:
                        TextStyle(fontFamily: 'Chillax', color: Color.fromRGBO(41, 208, 78, 1), fontSize: 100, fontWeight: FontWeight.w700),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: NavigationBarra(),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 68, left: 55, right: 55),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeButton(),
                SignOutButton(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 549, right: 549, bottom: 67),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('icons/user_circle.svg'),
                const SizedBox(
                  height: 87,
                ),
                const TitleTextFormCadastro(title: "Nome completo:"),
                const SizedBox(
                  height: 15,
                ),
                Observer(
                  builder: (context) => TextFormField(
                    initialValue: cadastroStore.name,
                    onChanged: cadastroStore.setName,
                    enabled: !cadastroStore.loading,
                    style: const TextStyle(fontSize: 25),
                    decoration: InputDecoration(
                      errorText: cadastroStore.nameError,
                      isDense: true,
                      filled: true,
                      fillColor: const Color.fromRGBO(193, 193, 193, 1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                const TitleTextFormCadastro(title: "Email:"),
                const SizedBox(
                  height: 15,
                ),
                Observer(
                  builder: (context) => TextFormField(
                    initialValue: cadastroStore.email,
                    onChanged: cadastroStore.setEmail,
                    enabled: !cadastroStore.loading,
                    style: const TextStyle(fontSize: 25),
                    decoration: InputDecoration(
                      errorText: cadastroStore.emailError,
                      isDense: true,
                      filled: true,
                      fillColor: const Color.fromRGBO(193, 193, 193, 1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(
                  height: 33,
                ),
                const TitleTextFormCadastro(title: "Senha:"),
                const SizedBox(
                  height: 15,
                ),
                Observer(
                  builder: (context) => TextFormField(
                    initialValue: cadastroStore.password,
                    onChanged: cadastroStore.setPassword,
                    enabled: !cadastroStore.loading,
                    style: const TextStyle(fontSize: 25),
                    decoration: InputDecoration(
                      errorText: cadastroStore.passwordError,
                      isDense: true,
                      filled: true,
                      fillColor: const Color.fromRGBO(193, 193, 193, 1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(
                  height: 33,
                ),
                const TitleTextFormCadastro(title: "Idade:"),
                SizedBox(
                  height: 15,
                ),
                Observer(
                  builder: (context) => TextFormField(
                    initialValue: cadastroStore.idadeText,
                    onChanged: cadastroStore.setIdadeText,
                    enabled: !cadastroStore.loading,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    style: const TextStyle(fontSize: 25),
                    decoration: InputDecoration(
                      errorText: cadastroStore.idadeError,
                      isDense: true,
                      filled: true,
                      fillColor: const Color.fromRGBO(193, 193, 193, 1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                const TitleTextFormCadastro(title: "Telefone:"),
                const SizedBox(
                  height: 15,
                ),
                Observer(
                  builder: (context) => TextFormField(
                    initialValue: cadastroStore.phone,
                    onChanged: cadastroStore.setPhone,
                    enabled: !cadastroStore.loading,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                    style: const TextStyle(fontSize: 25),
                    decoration: InputDecoration(
                      errorText: cadastroStore.phoneError,
                      isDense: true,
                      filled: true,
                      fillColor: const Color.fromRGBO(193, 193, 193, 1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Observer(
                  builder: (context) => Container(
                    margin: cadastroStore.error != null ? const EdgeInsets.only(top: 50, bottom: 50) : EdgeInsets.only(top: 68),
                    child: ErrorBox(
                      message: cadastroStore.error,
                    ),
                  ),
                ),
                Observer(
                  builder: (context) => SizedBox(
                    height: 73,
                    width: 439,
                    child: GestureDetector(
                      onTap: cadastroStore.invalidSendPressed,
                      child: ElevatedButton(
                        onPressed: cadastroStore.cadastrarPressed,
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
                        child: cadastroStore.loading
                            ? CircularProgressIndicator(
                                color: Color.fromRGBO(246, 245, 244, 1),
                              )
                            : const Text("Salvar alterações"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Observer(
                  builder: (context) => SizedBox(
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
                      onPressed: !cadastroStore.loading ? () {} : null,
                      child: Text("Excluir conta"),
                    ),
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
