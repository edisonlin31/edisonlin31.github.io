import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';

void main() {
  run();
}

void run() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: kIsWeb
        ? const FirebaseOptions(
            apiKey: "AIzaSyDf2miu0kELwNu0slnSYlqhvtVucel5Cu0",
            authDomain: "esseplor-com.firebaseapp.com",
            databaseURL:
                "https://esseplor-com-default-rtdb.asia-southeast1.firebasedatabase.app",
            projectId: "esseplor-com",
            storageBucket: "esseplor-com.appspot.com",
            messagingSenderId: "157509180340",
            appId: "1:157509180340:web:c1ca4f1392f06666ac70e1",
            measurementId: "G-0PD7QRNZST",
          )
        : null,
  );
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
