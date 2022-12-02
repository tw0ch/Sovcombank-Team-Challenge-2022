import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:stock_app/screens.dart';

bool newUser = false;

class EntryPage extends StatelessWidget {
  EntryPage({Key? key}) : super(key: key);

  final _loginController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  // void login(String email, String password) {
  //   try {
  //     Response response =
  //   }cath{
  //     print(e.toString());
  //   };
  // }

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
                    "Вход",
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
              _phoneTextField(),
              const SizedBox(height: 30),
              _passwordTextfield(),
              const SizedBox(height: 30),
              _nextButton(context),
              const SizedBox(height: 20),
              InkWell(
                child: const Text(
                  'Сменить аккаунт',
                  style: TextStyle(color: Color(0xFF8B8B8B), fontSize: 20),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/registration');
                },
              ),

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

  Widget _nextButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (true) {}
        Navigator.pushNamed(context, '/profile_page');
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
