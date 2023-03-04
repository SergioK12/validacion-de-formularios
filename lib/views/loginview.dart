import 'package:flutter/material.dart';
import 'package:validacion_de_formularios/ui/inputdecorations.dart';

import '../widgets/widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children:   [
               SizedBox(height: (MediaQuery.of(context).size.height * 0.30),),
               CardContainer(
                child: Column(
                  children:  [
                    const SizedBox(height: 10,),
                    Text("Login", style:  Theme.of(context).textTheme.headlineLarge,),
                    const SizedBox(height: 30,),
                    const _LoginForm(),


                  ],
                )
              ),
              const SizedBox(height: 30),
              const Text("¿Ha olvidado su contraseña?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
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
    return Form(child: Column(
      children: [
        TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecorations.authInputDecoration(
            hinText: "Sergio@test.com",
            labeltextt: "Correo electrónico",
            prefixIcon: Icons.alternate_email_outlined
          )
        ),
        const SizedBox(height: 30),
        TextFormField(
          autocorrect: false,
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecorations.authInputDecoration(
            hinText: "*********",
            labeltextt: "Contraseña",
            prefixIcon: Icons.lock_outline
          )
        ),
        const SizedBox(height: 30),
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          disabledColor: Colors.green,
          elevation: 0,
          color: Colors.purple,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 15),
            child: const  Text("Ingresar", style: TextStyle(color: Colors.white),),
          ),
          onPressed: (){},
        )
      ],
    ));
  }
}