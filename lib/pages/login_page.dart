import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool buttonTapped = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome() async {
    final form = _formKey.currentState;

    if (form!.validate()) {
      setState(() {
        buttonTapped = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        buttonTapped = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                'assets/images/login.png',
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  "Welcome $name",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username should not be Empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                          labelText: 'Username', hintText: 'Enter Username'),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username should not be Empty";
                        } else if (value.length < 6) {
                          return "Password should be more than 6";
                        } else if (value.length > 12) {
                          return "Password should be less than 12";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter Password',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(buttonTapped ? 50 : 7),
                      child: InkWell(
                        onTap: () => moveToHome(),
                        child: AnimatedContainer(
                          height: 40,
                          width: buttonTapped ? 40 : 120,
                          alignment: Alignment.center,
                          child: buttonTapped
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                          duration: const Duration(seconds: 1),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
