import 'package:flutter/material.dart';
import 'package:sgf_bot/TesteRasaService.dart';
import 'package:sgf_bot/AjusteTelaChat.dart'; // Importe o widget ChatMessage()

//classe principal do chat(FAZ A CONEXAO COM O CLOUD E TEM A ESTRUTURA BASICA DA TELA)
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final RasaService _rasaService = RasaService('http://34.95.134.247:5005');
  final List<String> _messages = [];
  final TextEditingController _textController = TextEditingController();

  _sendMessage(String text) async {
    _textController.clear();
    setState(() {
      _messages.add('Você: $text');
    });

    final response = await _rasaService.sendMessage(text);
    setState(() {
      _messages.add('Bot: $response');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Padding(
          padding: EdgeInsets.only(top: 5),
          child: AppBar(
            leadingWidth: 20,
            title: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset('assets/trem_grande.png',
                      height: 45, width: 45),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Seletinho",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isBot = message
                    .startsWith('Bot: '); // Verifica se é uma mensagem do bot
                return ChatMessage(
                  text: message,
                  isBot: isBot,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(hintText: "Enviar mensagem"),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_textController.text);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
