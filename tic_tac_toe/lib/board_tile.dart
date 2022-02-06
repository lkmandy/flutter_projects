import 'package:flutter/material.dart';
import 'package:tic_tac_toe/tile_state.dart';

class BoardTile extends StatelessWidget {
  final TileState tileState;
  final double dimension;
  final VoidCallback? onPressed;

  const BoardTile({Key? key, required this.dimension, this.onPressed, required this.tileState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dimension,
      height: dimension,
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
        onPressed: onPressed,
        child: _widgetForTileState(),
      ),
    );
  }

  Widget _widgetForTileState() {
    Widget widget;

    switch (tileState) {
      case TileState.empty:
        widget = Container();
        break;

      case TileState.circle:
        widget = Image.asset('images/o.png');
        break;

      case TileState.cross:
        widget = Image.asset('images/x.png');
        break;

      default:
        widget = Container();
    }
    return widget;
  }
}
