import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Scanner(),
      ),
    );
  }
}

class Scanner extends StatelessWidget {
  Scanner({Key? key}) : super(key: key);
  MobileScannerController scannerController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: scannerController,
      allowDuplicates: false,
      onDetect: (Barcode? barcode, args) {
        if (barcode!.rawValue!.isEmpty) {
          // print("Failed to find a barcode");
        } else {
          final code = barcode.rawValue;
          // print("Barcode is $code");
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(
                  codeValue: code!,
                ),
              ));
        }
      },
    );
  }
}
