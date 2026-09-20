import 'package:device_preview/device_preview.dart';

import 'package:ecommerce_app/controllers/auth_cubit.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/services/auth_service.dart';
import 'package:ecommerce_app/views/home_screen.dart';
import 'package:ecommerce_app/views/login_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  DevicePreview.enable();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return BlocProvider(
      create: (_) => AuthCubit(AuthService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-commerce App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: user == null
            ? const LoginScreen()
            : const HomeScreen(),
      ),
    );
  }
}