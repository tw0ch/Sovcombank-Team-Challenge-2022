import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../server/remote_service.dart';

class RegistrationBeginPage extends StatelessWidget {
  RegistrationBeginPage({Key? key}) : super(key: key);

  final _loginController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181A20),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Expanded(flex: 2, child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Регистрация",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ), // FormTe
                ],
              ),
              // SizedBox(height: 80),
              Expanded(child: Container()),
              _loginTextField(),
              const SizedBox(height: 30),
              _passwordTextfield(),
              const SizedBox(height: 30),
              // const _passwordConfirmTextfield(),
              // const SizedBox(height: 30),
              _nextButton(context),
              Expanded(flex: 2, child: Container()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginTextField() {
    return TextField(
      controller: _loginController,
      obscureText: false,
      decoration: const InputDecoration(
        hintText: 'Логин',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        filled: true, //<-- SEE HERE
        fillColor: Color(0xFFDDDDDD),
      ),
    );
  }

  Widget _phoneTextField() {
    return TextField(
      controller: _phoneController,
      obscureText: false,
      decoration: const InputDecoration(
        hintText: 'Номер телефона',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        filled: true, //<-- SEE HERE
        fillColor: Color(0xFFDDDDDD),
      ),
    );
  }

  Widget _passwordTextfield() {
    return TextField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Пароль',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        filled: true, //<-- SEE HERE
        fillColor: Color(0xFFDDDDDD),
      ),
    );
  }

  void login(String login, String age, BuildContext context) async {
    if (await RemoteService().postUser({'username': login, 'age': age}) !=
        null) {
      Navigator.pushNamed(context, '/profile_page');
    }
  }

  Widget _nextButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        login(
          _loginController.text.toString(),
          _passwordController.text.toString(),
          context,
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF12D18E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // <-- Radius
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        width: 302,
        height: 60,
        child: const Text(
          'Далее',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
