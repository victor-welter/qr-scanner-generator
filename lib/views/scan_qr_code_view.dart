import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_generator/widgets/custom_raised_button.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({Key key}) : super(key: key);

  @override
  _ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  String qrCodeResult = "Ainda não digitalizado";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Digitalizar código QR"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Resultado",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              qrCodeResult,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 20),

            //Button para digitalizar o código QR
            CustomRaisedButton(
              title: "Abrir scanner",
              onPressed: () async {
                //Open scanner => [BarcodeScanner]
                String codeSanner = await BarcodeScanner.scan();

                setState(() {
                  qrCodeResult = codeSanner;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
