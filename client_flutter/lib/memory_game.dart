import 'package:flutter/material.dart';

class MemoryGameScreen extends StatefulWidget {
  @override
  _MemoryGameScreenState createState() => _MemoryGameScreenState();
}

class _MemoryGameScreenState extends State<MemoryGameScreen> {
  List<String> cards = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
  List<String> flippedCards = [];
  String? currentSelection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memory Game Online'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return MemoryCard(
            card: cards[index],
            isFlipped: flippedCards.contains(cards[index]),
            onTap: () {
              if (flippedCards.length < 2) {
                setState(() {
                  if (!flippedCards.contains(cards[index])) {
                    flippedCards.add(cards[index]);
                  }
                });
                if (flippedCards.length == 2) {
                  // Aquí puedes agregar la lógica para comparar cartas y sincronizar con otros jugadores en línea
                  // Por ejemplo, puedes usar sockets para comunicarte con otros jugadores.
                  // Si las cartas coinciden, mantén las cartas boca arriba, de lo contrario, voltea las cartas nuevamente.
                  // Puedes usar una lógica similar a la del juego de memoria tradicional.
                  // También necesitarás una forma de identificar a los jugadores en línea y sincronizar sus movimientos.
                }
              }
            },
          );
        },
      ),
    );
  }
}

class MemoryCard extends StatelessWidget {
  final String card;
  final bool isFlipped;
  final VoidCallback onTap;

  MemoryCard({
    required this.card,
    required this.isFlipped,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isFlipped ? null : onTap,
      child: Container(
        margin: EdgeInsets.all(4),
        color: isFlipped ? Colors.blue : Colors.grey,
        child: Center(
          child: isFlipped ? Text(card) : Text(''),
        ),
      );
    }
  }
}
