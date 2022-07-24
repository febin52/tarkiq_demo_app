import 'package:example_app/bloc/loginbloc/loginbloc.dart';
import 'package:example_app/bloc/random_list_bloc/random_list_bloc.dart';
import 'package:example_app/ui/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RandomListViewBloc>(
            create: (BuildContext context) => RandomListViewBloc()),
        BlocProvider<LoginBloc>(create: (BuildContext context) => LoginBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'kumbh',
          primarySwatch: Colors.blue,
        ),
        home: const Login(),
      ),
    );
  }
}
