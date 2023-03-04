import 'package:flutter/material.dart';

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
                    const Text("Formulario")

                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
