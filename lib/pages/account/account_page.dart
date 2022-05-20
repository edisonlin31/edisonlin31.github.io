import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/controllers/account_controller.dart';
import 'package:wholesale/controllers/account_list_controller.dart';
import 'package:wholesale/controllers/auth.dart';
import '../../models/vendor.dart';
import '../../router/router.gr.dart';
import '../../utils/app_text_styles.dart';
import '../../widgets/ripple.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _AccountHeaderView(),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Ripple(
                    onTap: () => context.pushRoute(AddressListRoute()),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Addresses'),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Divider(
                      height: 1,
                    ),
                  ),
                  Ripple(
                    onTap: () {
                      ref.refresh(authControllerProvider.notifier).logout();
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Text(
                          'Logout',
                          style: AppTextStyles.medium(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountHeaderView extends ConsumerWidget {
  const _AccountHeaderView({Key? key}) : super(key: key);

  void _modalBottomSheetMenu({
    required BuildContext context,
    required WidgetRef ref,
    required List<Vendor> vendorList,
    Vendor? selectedAccount,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return SelectAccountView(
          vendorList: vendorList,
          selectedAccount: selectedAccount,
          onSelected: ((val) {
            ref.read(accountControllerProvider.notifier).setAccount(val);
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(accountListControllerProvider);

    final account = ref.watch(accountControllerProvider);
    return asyncData.maybeWhen(data: ((data) {
      if (account == null) {
        return const SizedBox.shrink();
      }
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(
              Icons.account_circle,
              size: 52,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Ripple(
                disabledSplash: true,
                onTap: () => _modalBottomSheetMenu(
                  context: context,
                  vendorList: data,
                  ref: ref,
                  selectedAccount: account,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            account.name,
                            style: AppTextStyles.medium(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            account.code ?? '-',
                            style: AppTextStyles.regular(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }), orElse: () {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Center(
            child: Text(
          'Fetching Account Information...',
          style: AppTextStyles.medium(
            fontSize: 14,
            color: Colors.grey,
          ),
        )),
      );
    });
  }
}

class SelectAccountView extends StatelessWidget {
  final List<Vendor> vendorList;
  final Function(Vendor) onSelected;
  final Vendor? selectedAccount;
  const SelectAccountView({
    required this.vendorList,
    required this.onSelected,
    this.selectedAccount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 12,
                  top: 12,
                ),
                child: Text(
                  'Select Vendor',
                  style: AppTextStyles.medium(
                    fontSize: 16,
                  ),
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView.separated(
                  itemCount: vendorList.length,
                  itemBuilder: ((context, index) {
                    final vendor = vendorList[index];
                    return Ripple(
                      onTap: () {
                        context.popRoute();
                        onSelected(vendor);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    vendor.name,
                                    style: AppTextStyles.medium(
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    vendor.code ?? '',
                                    style: AppTextStyles.regular(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (selectedAccount != null &&
                                selectedAccount!.id == vendor.id)
                              Icon(
                                Icons.check,
                                color: Theme.of(context).primaryColor,
                                size: 20,
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 1,
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
