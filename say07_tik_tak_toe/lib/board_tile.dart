import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:say07_tik_tak_toe/tile_state.dart';

class BoardTile extends StatelessWidget {
  late final double dimension;
  final VoidCallback onPressed;
  final TileState tileState;

  BoardTile(this.dimension, this.onPressed, this.tileState);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimension,
      height: dimension,
      child: TextButton(
        onPressed: onPressed,
        child: _widgetForTileState(),
      ),
    );
  }

  Widget _widgetForTileState() {
    Widget widget;
    switch (tileState) {
      case TileState.EMPTY:
        {
          widget = Container();
        }
        break;
      case TileState.CROSS:
        {
          widget = Image.asset('assets/x.png');
        }
        break;
      case TileState.CIRCLE:
        {
          widget = Image.asset('assets/o.png');
        }
        break;
    }
    return widget;
  }
}
