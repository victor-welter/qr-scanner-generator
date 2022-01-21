import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_generator/settings/user_preferences.dart';

class CustomRaisedButton extends StatelessWidget {
  final String _title;
  final void Function() _onPressed;

  ///Cria um [RaisedButton] para ser utilizado no aplicativo
  CustomRaisedButton({
    @required String title,
    @required void Function() onPressed,
  })  : this._title = title,
        this._onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    final _userPreferences = Provider.of<UserPreferences>(context);

    Color _backgroundColor() {
      if (_userPreferences.usesDarkTheme()) {
        return Colors.teal;
      }

      return Colors.white;
    }

    Color _splashColor() {
      if (_userPreferences.usesDarkTheme()) {
        return Colors.teal[600];
      }

      return Colors.grey[50];
    }

    Color _colorTextTitle() {
      if (_userPreferences.usesDarkTheme()) {
        return Colors.white;
      }

      return Colors.teal;
    }

    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: 55,
      child: RaisedButton(
        elevation: 0,
        color: _backgroundColor(),
        splashColor: _splashColor(),
        focusColor: _splashColor(),
        hoverColor: _splashColor(),
        colorBrightness: Brightness.dark,
        onPressed: this._onPressed,
        child: Text(
          '${this._title}',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: _colorTextTitle(),
            fontSize: 20,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: Colors.teal,
            width: 2,
          ),
        ),
      ),
    );
  }
}
