import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_generator/settings/user_preferences.dart';
import 'package:qr_scanner_generator/views/home_screen_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(MyApp(preferences: sharedPreferences));
}

class MyApp extends StatefulWidget {
  final SharedPreferences preferences;

  MyApp({Key key, this.preferences})
      : assert(preferences != null),
        super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserPreferences _userPreferences;

  @override
  void initState() {
    super.initState();

    _userPreferences = UserPreferences(widget.preferences);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return Provider<UserPreferences>.value(
      value: _userPreferences,
      child: StreamBuilder<UserPreferences>(
        initialData: _userPreferences,
        stream: _userPreferences.stream,
        builder: (context, shot) {
          ThemeMode _themeMode() {
            if (shot.data.usesDarkTheme()) {
              return ThemeMode.dark;
            }

            return ThemeMode.light;
          }

          return MaterialApp(
            darkTheme: ThemeData.dark(),
            themeMode: _themeMode(),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
