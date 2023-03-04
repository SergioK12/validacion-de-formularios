import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validacion_de_formularios/ui/inputdecorations.dart';

import '../providers/loginformprovider.dart';
import '../widgets/widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: (MediaQuery.of(context).size.height * 0.30),
              ),
              CardContainer(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: const _LoginForm(),
                  )
                ],
              )),
              const SizedBox(height: 30),
              const Text(
                "¿Ha olvidado su contraseña?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final loginform = Provider.of<LoginFormProvider>(context);
    return Form(
        key: loginform.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hinText: "Sergio@test.com",
                  labeltextt: "Correo electrónico",
                  prefixIcon: Icons.alternate_email_outlined),
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                    ? null
                    : "El correo es incorrecto";
              },
              onChanged: (value) => loginform.email = value,
            ),
            const SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hinText: "*********",
                  labeltextt: "Contraseña",
                  prefixIcon: Icons.lock_outline),
              validator: (value) {
                return (value != null && value.length > 6)
                    ? null
                    : "Minimo 6 caracteres";
              },
              onChanged: (value) => loginform.contra = value,
            ),
            const SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.green,
              elevation: 0,
              color: Colors.purple,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: const Text(
                  "Ingresar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () {
                if (loginform.isValidForm()) {
                  Navigator.pushReplacementNamed(context, 'home');
                }
              },
            )
          ],
        ));
  }
}
