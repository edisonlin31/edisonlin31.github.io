import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/controllers/account_addresses_controller.dart';
import 'package:wholesale/models/vendor_location.dart';

import '../../controllers/account_controller.dart';
import '../../router/router.gr.dart';
import '../../utils/app_text_styles.dart';
import '../../widgets/ripple.dart';
import 'address_item_view.dart';

class AddressListPage extends StatefulWidget {
  final Function(VendorLocation)? onSelect;
  const AddressListPage({this.onSelect, Key? key}) : super(key: key);

  @override
  State<AddressListPage> createState() => _AddressListPageState();
}

class _AddressListPageState extends State<AddressListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved Addresses')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Ripple(
                onTap: () => context.pushRoute(const AddAddressRoute()),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Add new address',
                        style: AppTextStyles.medium(
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Consumer(
                builder: ((context, ref, child) {
                  final account = ref
                      .read(accountControllerProvider.notifier)
                      .getCurrentAccount();
                  final asyncData =
                      ref.watch(accountAddressesControllerProvider(account.id));
                  return asyncData.maybeWhen(
                    data: ((data) {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: data.length,
                        itemBuilder: ((context, index) {
                          return AddressView(
                            location: data[index],
                            onTap: widget.onSelect,
                          );
                        }),
                      );
                    }),
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
