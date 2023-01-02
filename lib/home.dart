import 'package:flutter/material.dart';

import 'vouchers/view/view.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App BAR'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(AddVoucherFormView.route(context));
                },
                child: const Text('Add Voucher'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(VouchersListView.route(context));
                },
                child: const Text('Load All Vouchers'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
