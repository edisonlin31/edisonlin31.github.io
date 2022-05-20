import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/controllers/account_list_controller.dart';
import 'package:wholesale/controllers/vendor_controller.dart';
import '../../models/vendor.dart';
import '../../router/router.gr.dart';
import '../../utils/app_text_styles.dart';
import '../../widgets/ripple.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Our Vendor')),
      // backgroundColor: COlor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _HomeHeaderView(),
          Expanded(
            child: Consumer(
              builder: ((context, ref, child) {
                ref.watch(accountListControllerProvider);
                final asyncData = ref.watch(vendorControllerProvider);
                return asyncData.when(data: ((data) {
                  return ListView.builder(
                    itemCount: data.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: ((context, index) {
                      final vendor = data[index];
                      return Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(16.0),
                        child: Ripple(
                          onTap: () => context.pushRoute(
                            VendorDetailRoute(
                              id: vendor.id,
                              vendor: vendor,
                            ),
                          ),
                          child: Stack(
                            children: [
                              AspectRatio(
                                aspectRatio: 2 / 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    imageUrl: vendor.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      vendor.name,
                                      style: AppTextStyles.bold(
                                        fontSize: 32,
                                        color: Colors.white,
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: const Offset(1.0, 1.0),
                                            blurRadius: 3.0,
                                            color:
                                                Colors.black.withOpacity(0.8),
                                          ),
                                          Shadow(
                                            offset: const Offset(1.0, 1.0),
                                            blurRadius: 8.0,
                                            color:
                                                Colors.black.withOpacity(0.8),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                }), error: (error, st) {
                  return const Text('error');
                }, loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                });
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeHeaderView extends StatelessWidget {
  const _HomeHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 16, left: 16, right: 16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chef Space',
              style: AppTextStyles.bold(
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              height: 1,
            ),
          ],
        ));
  }
}

class VendorItem extends StatelessWidget {
  final Widget? child;
  final Vendor vendor;
  final EdgeInsets? padding;
  final Function()? onTap;
  const VendorItem({
    required this.vendor,
    this.child,
    this.padding,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ripple(
      onTap: onTap,
      child: Container(
        color: onTap == null ? Colors.transparent : Colors.white,
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: vendor.imageUrl,
                fit: BoxFit.cover,
                height: 80,
                width: 80,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      vendor.name,
                      style: AppTextStyles.bold(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    if (child != null) child!
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
