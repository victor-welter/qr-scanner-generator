import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
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
                  context, MaterialPageRoute(builder: (context) => ScanQR()));
            },
          ),
          CustomRaisedButton(
            title: 'Generate QR Code',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GenerateQR()));
            },
          ),
        ],
      ),
    );
  }
}

class ScanQR extends StatefulWidget {
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
        title: const Text("Scan QR Code"),
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
                fontSize: 25.0,
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

            //Button to scan QR code
            CustomRaisedButton(
              title: "Open Scanner",
              onPressed: () async {
                //barcode scanner
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

class GenerateQR extends StatefulWidget {
  @override
  _GenerateQRState createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  String qrData = "https://github.com/victor-welter";

  final qrdataFeed = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Generate QR Code"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: QrImage(
                  data: qrData,
                  constrainErrorBounds: true,
                ),
              ),

              //TextField for input link
              const TextField(
                decoration: InputDecoration(
                  hintText: "Insira seu link aqui",
                ),
              ),

              const SizedBox(height: 20),

              CustomRaisedButton(
                title: "Generate QR Code",
                onPressed: () async {
                  //a little validation for the textfield
                  if (qrdataFeed.text.isEmpty) {
                    setState(() {
                      qrData = "";
                    });
                  } else {
                    setState(() {
                      qrData = qrdataFeed.text;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRaisedButton extends StatelessWidget {
  final String _title;
  final void Function() _onPressed;

  /// Cria um [RaisedButton] para ser utilizado no aplicativo
  CustomRaisedButton({
    @required String title,
    @required void Function() onPressed,
  })  : this._title = title,
        this._onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: 55,
      child: RaisedButton(
        elevation: 0,
        color: Colors.white,
        splashColor: Colors.grey[50],
        focusColor: Colors.grey[50],
        hoverColor: Colors.grey[50],
        colorBrightness: Brightness.dark,
        onPressed: this._onPressed,
        child: Text(
          '${this._title}',
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.teal,
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
