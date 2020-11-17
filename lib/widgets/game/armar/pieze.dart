import 'package:app_movij/config/config_export.dart';
import 'package:flutter/material.dart';

class Pieze extends StatelessWidget {
  final Image image;
  final Size imageSize;
  final int row;
  final int col;
  final int max;

  const Pieze({
    Key key,
    @required this.image,
    @required this.imageSize,
    @required this.row,
    @required this.col,
    @required this.max,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppThemeColors.BLACK.withOpacity(0.55),
        ),
      ),
      width: 100,
      height: 100,
      child: ClipPath(
        child: image,
        clipper: _PuzzlePieceClipper(row, col, max),
      ),
    );
  }
}

// this class is used to clip the image to the puzzle piece path
class _PuzzlePieceClipper extends CustomClipper<Path> {
  final int row;
  final int col;
  final int max;

  _PuzzlePieceClipper(
    this.row,
    this.col,
    this.max,
  );

  @override
  Path getClip(Size size) {
    return getPiecePath(
      size,
      row,
      col,
      max,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

  // this is the path used to clip the image and, then, to draw a border around it; here we actually draw the puzzle piece
  Path getPiecePath(
    Size size,
    int row,
    int col,
    int max,
  ) {
    // Tamano del recuadro interno
    final width = size.width / max;
    final height = size.height / max;
    // Posicion inicial para el dibujo
    // Se calcula con el tama;o del recuadro y el numero de columna
    final offsetX = col * width;
    final offsetY = row * height;

    var path = Path();
    path.moveTo(offsetX, offsetY);
    path.lineTo(offsetX + width, offsetY);
    path.lineTo(offsetX + width, offsetY + height);
    path.lineTo(offsetX, offsetY + height);
    path.close();

    return path;
  }
}
