import 'package:flutter/material.dart';
import 'package:sgf_bot/Home.dart'; // Importe o arquivo Home.dart ou o nome do arquivo que você definiu

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App Flutter',
      theme: ThemeData(
        primarySwatch: Colors.green, // Altere a cor do tema conforme desejado
      ),
      home: const Home(), // Defina Home como a página inicial do seu aplicativo
    );
  }
}
