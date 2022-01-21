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

    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: 55,
      child: RaisedButton(
        elevation: 0,
        color: _userPreferences.usesDarkTheme() ? Colors.teal : Colors.white,
        splashColor: Colors.grey[50],
        focusColor: Colors.grey[50],
        hoverColor: Colors.grey[50],
        colorBrightness: Brightness.dark,
        onPressed: this._onPressed,
        child: Text(
          '${this._title}',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color:
                _userPreferences.usesDarkTheme() ? Colors.white : Colors.teal,
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
