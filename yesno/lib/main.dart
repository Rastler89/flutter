import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesno/config/theme/app_theme.dart';
import 'package:yesno/presentation/providers/chat_provider.dart';
import 'package:yesno/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        title: 'Yes or Not App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 3).theme(),
        home: const ChatScreen()
      ),
    );
  }
}