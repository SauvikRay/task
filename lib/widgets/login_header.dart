import 'package:flutter/material.dart';
import 'package:softic_task/constants/app_constants.dart';

class HeaderWidget extends StatefulWidget {
  final double _height;
  final bool _showIcon;
  final IconData _icon;

  const HeaderWidget(this._height, this._showIcon, this._icon, {Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState(_height, _showIcon, _icon);
}

class _HeaderWidgetState extends State<HeaderWidget> {
  double _height;
  bool _showIcon;
  IconData _icon;

  _HeaderWidgetState(this._height, this._showIcon, this._icon);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return Stack(
      children: [
        ClipPath(
          clipper:  ShapeClipper(
              [
                Offset(width / 5, _height),
                Offset(width / 10 * 5, _height - 60),
                Offset(width / 5 * 4, _height + 20),
                Offset(width, _height - 18)
              ]
          ),
          child: Container(
            decoration:  BoxDecoration(
              gradient:  LinearGradient(
                  colors: [
                    AppColors.buttonColor.withOpacity(0.4),
                    AppColors.buttonColor.withOpacity(0.4),
                    
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp
              ),
            ),
          ),
        ),
       
        ClipPath(
          clipper: ShapeClipper(
              [
                Offset(width / 3, _height + 20),
                Offset(width / 10 * 8, _height - 60),
                Offset(width / 5 * 4, _height - 60),
                Offset(width, _height - 20)
              ]
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.4),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp
              ),
            ),
          ),
        ),
        
        ClipPath(
          clipper: ShapeClipper(
              [
                Offset(width / 5, _height),
                Offset(width / 2, _height - 40),
                Offset(width / 5 * 4, _height - 80),
                Offset(width, _height - 20)
              ]
          ),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                       AppColors.shadowText,
                    GradiendColor.gColor3
                  ],
                  begin: FractionalOffset(0.0, 0.1),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp
              ),
            ),
          ),
        ),
        Visibility(
          visible: _showIcon,
          child: SizedBox(
            height: _height - 40,
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.only(
                  left: 5.0,
                  top: 20.0,
                  right: 5.0,
                  bottom: 20.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 5, color: Colors.white),
                ),
                child: Icon(
                  _icon,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  List<Offset> _offsets = [];
  ShapeClipper(this._offsets);
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height-20);

    // path.quadraticBezierTo(size.width/5, size.height, size.width/2, size.height-40);
    // path.quadraticBezierTo(size.width/5*4, size.height-80, size.width, size.height-20);

    path.quadraticBezierTo(_offsets[0].dx, _offsets[0].dy, _offsets[1].dx,_offsets[1].dy);
    path.quadraticBezierTo(_offsets[2].dx, _offsets[2].dy, _offsets[3].dx,_offsets[3].dy);

    // path.lineTo(size.width, size.height-20);
    path.lineTo(size.width, 0.0);
    path.close();


    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}