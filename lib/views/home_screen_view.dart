import 'package:flutter/material.dart';
import 'package:qr_scanner_generator/views/generate_qr_code_view.dart';
import 'package:qr_scanner_generator/views/scan_qr_code_view.dart';
import 'package:qr_scanner_generator/views/settings_view.dart';
import 'package:qr_scanner_generator/widgets/custom_raised_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: IconButton(
                  icon: Icon(
                    Icons.settings_rounded,
                    color: Colors.teal,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Settings()));
                  },
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: const Icon(
                    Icons.qr_code_rounded,
                    color: Colors.teal,
                    size: 300,
                  ),
                ),
                CustomRaisedButton(
                  title: 'Scan QR Code',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScanQR()));
                  },
                ),
                CustomRaisedButton(
                  title: 'Generate QR Code',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GenerateQR()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
