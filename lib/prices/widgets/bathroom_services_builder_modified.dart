import 'package:flutter/material.dart';
import 'package:ms_kopalisce_admin_panel/prices/widgets/bathroom_services_list_modified.dart';
import 'package:price_repository/price_repository.dart';

class BathroomServicesBuilderModified extends StatelessWidget {
  const BathroomServicesBuilderModified({
    Key? key,
    required List<Ticket> tickets,
  })  : _tickets = tickets,
        super(key: key);

  final List<Ticket> _tickets;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: ListView.separated(
        padding: const EdgeInsets.all(20),
        shrinkWrap: true,
        itemCount: TicketType.values.length,
        itemBuilder: (context, index) {
          final type = TicketType.values[index];
          final sortedTickets = sortByType(type);
          return BathroomServicesListModified(
            title: type.toStringReadable(),
            tickets: sortedTickets,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
      ),
    );
  }

  List<Ticket> sortByType(TicketType type) {
    final elementsCopy = List<Ticket>.from(_tickets);

    return elementsCopy.where((element) => element.type == type).toList()
      ..sort(
        (a, b) => a.price.compareTo(b.price),
      );
  }
}
