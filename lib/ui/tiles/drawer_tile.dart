import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;

  DrawerTile(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Theme.of(context).primaryColor, // : Colors.grey[700],
                ),
              ),
              Spacer(),
              Icon(
                icon,
                size: 32.0,
                color: Theme.of(context).primaryColor, // : Colors.grey[700],
              ),
              SizedBox(
                width: 32.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
