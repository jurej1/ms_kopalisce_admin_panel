import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_kopalisce_admin_panel/prices/blocs/blocs.dart';
import 'package:price_repository/price_repository.dart';

class BathroomServicesListModified extends StatelessWidget {
  const BathroomServicesListModified({
    Key? key,
    required this.tickets,
    required this.title,
  }) : super(key: key);

  final List<Ticket> tickets;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            );
          }
          final item = tickets[index - 1];
          return BlocProvider(
            create: (context) => DeleteBathroomTicketCubit(RepositoryProvider.of<PriceRepository>(context)),
            child: _ListTile(item: item),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: tickets.length + 1);
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Ticket item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(item.title),
        Text('€${item.price}'),
      ],
    );
  }
}
