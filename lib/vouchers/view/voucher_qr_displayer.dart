import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class VoucherQRDisplayer extends StatelessWidget {
  const VoucherQRDisplayer({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;

  static MaterialPageRoute route(BuildContext context, {required String data}) {
    return MaterialPageRoute(
      builder: (context) {
        return VoucherQRDisplayer(data: data);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: QrImage(
          data: data,
          size: 200.0,
          version: QrVersions.auto,
        ),
      ),
    );
  }
}
