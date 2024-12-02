import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_blog_app/data/repository/post_repository.dart';
import 'package:flutter_firebase_blog_app/firebase_options.dart';
import 'package:flutter_firebase_blog_app/ui/home/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final postRepository = PostRepository();
  await postRepository.getAll();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.light,
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}