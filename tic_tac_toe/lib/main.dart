import 'package:flutter/material.dart';
import 'package:tic_tac_toe/board_tile.dart';
import 'package:tic_tac_toe/tile_state.dart';

void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatefulWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  var _boardState = List.filled(9, TileState.empty);
  var navigatorKey = GlobalKey<NavigatorState>();

  var _currentTurn = TileState.cross;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        appBar: AppBar(title: const Text('Tic Tac Toe'), backgroundColor: Colors.blueGrey,),
        body: Center(
          child: Stack(
            children: [Image.asset('images/board.png'), boardTiles()],
          ),
        ),
      ),
    );
  }

  Widget boardTiles() {
    return Builder(builder: (context) {
      // get the dimension of the screen
      final boardDimension = MediaQuery.of(context).size.width;
      final tileDimension = boardDimension / 3;

      return SizedBox(
        width: boardDimension,
        height: boardDimension,
        child: Column(
          children: chunk(_boardState, 3).asMap().entries.map((entry) {
            final chunkIndex = entry.key;
            final tileStateChunk = entry.value;

            return Row(
              children: tileStateChunk.asMap().entries.map((innerEntry) {
                final innerIndex = innerEntry.key;
                final tileState = innerEntry.value;
                final tileIndex = (chunkIndex * 3) + innerIndex;

                return BoardTile(
                  tileState: tileState,
                  dimension: tileDimension,
                  onPressed: () => _updateTileStateForIndex(tileIndex),
                );
              }).toList(),
            );
          }).toList(),
        ),
      );
    });
  }

  _updateTileStateForIndex(int selectedIndex) {
    if (_boardState[selectedIndex] == TileState.empty) {
      setState(() {
        _boardState[selectedIndex] = _currentTurn;
        _currentTurn = _currentTurn == TileState.cross
            ? TileState.circle
            : TileState.cross;
      });

      final winner = _findWinner();
      if (winner != null) {
        _showWinnerDialog(winner);
      }
    }
  }

  TileState? _findWinner() {
    TileState? winnerForMatch(int a, int b, int c) {
      if (_boardState[a] != TileState.empty) {
        if ((_boardState[a] == _boardState[b]) &&
            (_boardState[b] == _boardState[c])) {
          return _boardState[a];
        }
      }
      return null;
    }

    final checks = [
      winnerForMatch(0, 1, 2),
      winnerForMatch(3, 4, 5),
      winnerForMatch(6, 7, 8),
      winnerForMatch(0, 3, 6),
      winnerForMatch(1, 4, 7),
      winnerForMatch(2, 5, 8),
      winnerForMatch(0, 4, 8),
      winnerForMatch(2, 4, 6),
    ];

    TileState? winner;
    for (int i = 0; i < checks.length; i++) {
      if (checks[i] != null) {
        winner = checks[i];
        break;
      }
    }
    return winner;
  }

  void _showWinnerDialog(TileState tileState) {
    final context = navigatorKey.currentState?.overlay?.context;
    showDialog(
        context: context!,
        builder: (_) {
          return AlertDialog(
            title: const Text('Winner'),
            content: Image.asset(
                tileState == TileState.cross ? 'images/x.png' : 'images/o.png'),
            actions: [
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueGrey),
                  ),
                  onPressed: () {
                    _resetGame();
                    Navigator.of(context).pop();
                  },
                  child: const Text('New Game'))
            ],
          );
        });
  }

  void _resetGame() {
    setState(() {
      _boardState = List.filled(9, TileState.empty);
      _currentTurn = TileState.cross;
    });
  }
}
