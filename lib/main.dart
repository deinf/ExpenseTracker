import 'dart:io';

import 'package:expensetracker/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // statusBarIconBrightness: Brightness.light,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey:
                "AIzaSyBpAYiPwPup-uBaipG1_lO2vV7yCHPFYUY", // apikey google-servis
            appId:
                "1:154733629495:android:93ed9d4d54787d6f7e2fb2", // app id di firebase
            messagingSenderId: "154733629495", // project number
            projectId: "expense-tracker-93047") // project id
        );
  } else {
    await Firebase.initializeApp();
  }
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}
