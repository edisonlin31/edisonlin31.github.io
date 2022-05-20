import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/controllers/auth.dart';

import '../controllers/dashboard_controller.dart';
import '../router/router.gr.dart';

class DashboardPage extends ConsumerWidget {
  DashboardPage({Key? key}) : super(key: key);
  TabsRouter? _tabsRouter;

  Widget buildBottomNav(
    BuildContext context,
    TabsRouter tabsRouter,
    WidgetRef ref,
  ) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: tabsRouter.activeIndex,
      unselectedItemColor: Colors.grey.shade400,
      selectedItemColor: Theme.of(context).primaryColor,
      onTap: tabsRouter.setActiveIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.storefront),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long),
          label: 'Order',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Account',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authControllerProvider, (previous, state) {
      if (state == AuthState.unauthenticated) {
        AutoRouter.of(context).replace(const LoginRoute());
      }
    });
    ref.listen(dashboardControllerProvider, (previous, next) {
      _tabsRouter?.setActiveIndex(next as int);
    });
    return AutoTabsScaffold(
      animationDuration: Duration.zero,
      routes: const [
        HomeTab(),
        CartTab(),
        OrderTab(),
        AccountTab(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        _tabsRouter = tabsRouter;
        return buildBottomNav(context, tabsRouter, ref);
      },
    );
  }
}
