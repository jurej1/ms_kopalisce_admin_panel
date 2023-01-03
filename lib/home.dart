import 'package:flutter/material.dart';
import 'package:ms_kopalisce_admin_panel/prices/prices.dart';
import 'package:ms_kopalisce_admin_panel/prices/view/add_bathroom_ticket_view.dart';
import 'package:ms_kopalisce_admin_panel/prices/view/add_food_item_view.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(AddVoucherFormView.routeNormal(context));
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
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  child: const Text('Add Bathroom Ticket'),
                  onPressed: () {
                    Navigator.of(context).push(AddBathroomTicketView.route(context));
                  },
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  child: const Text('Load Bathroom Tickets'),
                  onPressed: () {
                    Navigator.of(context).push(BathroomServicesView.route(context));
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  child: const Text('Add Food Item'),
                  onPressed: () {
                    Navigator.of(context).push(AddFoodItemFormView.route(context));
                  },
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  child: const Text('Load Food Items'),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(AddVoucherFormView.routeAddToWheel(context));
                  },
                  child: const Text('Add Voucher To Wheel'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(VouchersWheelListView.route(context));
                  },
                  child: const Text('Load All Wheel Vouchers'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
