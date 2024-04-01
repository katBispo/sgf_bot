import 'package:flutter/material.dart';
import 'package:sgf_bot/ChatBot.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 350, // Defina a largura desejada
              height: 350, // Defina a altura desejada
              child: Image.asset('assets/trem_grande.png'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navega para a página de chat quando o botão é pressionado
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Cor de fundo do botão
                padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24), // Espaçamento interno do botão
                shape: RoundedRectangleBorder(
                  // Define a forma do botão
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.chat_bubble,
                      color: Colors.white), // Ícone de balão de conversa
                  const SizedBox(
                      width: 8), // Espaçamento entre o ícone e o texto
                  Text(
                    'Converse com o SGF BOT!',
                    style: TextStyle(
                      color: Colors.white, // Cor do texto do botão
                      fontWeight: FontWeight.bold, // Negrito no texto
                      fontSize: 20, // Tamanho da fonte
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
