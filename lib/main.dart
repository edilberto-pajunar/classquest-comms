import 'package:classquest/provider/image_data.dart';
import 'package:classquest/provider/random_word_provider.dart';
import 'package:classquest/views/dashboard_screen.dart';
import 'package:classquest/views/login_screen.dart';
import 'package:classquest/views/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDYBttjLDSkeKRzdTGdpw4z3KHZ_kdy7MM",
      projectId: "classquest-461f2",
      storageBucket: "classquest-461f2.appspot.com",
      messagingSenderId: "47374489749",
      appId: "1:47374489749:web:d5e2d005f5fbf3d170e39c",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RandomWordProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ImageDataProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.secularOneTextTheme(),
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return DashboardScreen();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.hasError}"),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return LoginScreen();
            }),
      ),
    );
  }
}
