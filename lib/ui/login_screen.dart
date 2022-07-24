import 'package:example_app/bloc/loginbloc/loginbloc.dart';
import 'package:example_app/bloc/loginbloc/loginevents.dart';
import 'package:example_app/bloc/loginbloc/loginstates.dart';
import 'package:example_app/ui/random_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController authPhoneController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/back.png"),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                  const Text(
                    "Log in",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  const Text('Welcome back to TARKIQ',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.black45)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                  form(context),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                  submitButton(context),
                  //  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget form(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Username'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextFormField(
                controller: authPhoneController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (username) {
                  if (username!.isEmpty) {
                    return "Enter Username";
                  }

                  return null;
                },
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Text('Password'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextFormField(
                obscureText: true,
                controller: passwordcontroller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (number) {
                  if (number!.isEmpty) {
                    return "Enter password";
                  }

                  return null;
                },
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget submitButton(context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * .7,
              child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<LoginBloc>(context).add(Verify(
                        number: authPhoneController.text,
                        password: passwordcontroller.text));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      primary: const Color(0xff2949F0)),
                  child: BlocConsumer<LoginBloc, LoginStates>(
                      listener: ((context, state) {
                    if (state is LoginSuccess) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const RandomList()),
                          (Route<dynamic> route) => false);
                    }
                  }), builder: (context, state) {
                    if (state is StartLoading) {
                      return const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ));
                    } else {
                      return const Text('LOGIN');
                    }
                  }))),
          const SizedBox(
            height: 30.0,
          ),
          const Text(
            'forgot password ?',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.10),
          RichText(
            text: const TextSpan(
              text: 'Powered By ',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: 'TARKIQ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
