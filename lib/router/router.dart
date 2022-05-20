import 'package:auto_route/auto_route.dart';
import '../pages/checkout/delivery_date_page.dart';
import '../pages/order/order_detail_page.dart';
import '../pages/account/account_page.dart';
import '../pages/address/add_address_page.dart';
import '../pages/address/address_list_page.dart';
import '../pages/checkout/payment_page.dart';
import '../pages/order/order_page.dart';
import '../pages/cart/cart_page.dart';
import '../pages/checkout/chechkout_page.dart';
import '../pages/home/home_page.dart';
import '../pages/dashboard_page.dart';
import '../pages/login/login_page.dart';
import '../pages/login/login_phone_page.dart';
import '../pages/vendor/food_detail_page.dart';
import '../pages/vendor/vendor_detail_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/login',
      initial: true,
      page: LoginPage,
    ),
    AutoRoute(
      path: '/login/phone',
      page: LoginPhonePage,
    ),
    AutoRoute(
      path: '/dashboard',
      // initial: true,
      page: DashboardPage,
      children: [
        AutoRoute(
          path: 'home',
          page: HomePage,
          name: 'HomeTab',
        ),
        AutoRoute(
          path: 'cart',
          page: CartPage,
          name: 'CartTab',
        ),
        AutoRoute(
          path: 'order',
          page: OrderPage,
          name: 'OrderTab',
        ),
        AutoRoute(
          path: 'account',
          page: AccountPage,
          name: 'AccountTab',
        ),
      ],
    ),
    AutoRoute(
      path: '/vendor/:id',
      usesPathAsKey: true,
      page: VendorDetailPage,
    ),
    AutoRoute(
      path: '/vendor/:vendorId/menus/:id',
      usesPathAsKey: true,
      page: FoodDetailPage,
    ),
    AutoRoute(
      path: '/checkout',
      page: CheckoutPage,
    ),
    AutoRoute(
      path: '/checkout/delivery-date',
      page: DeliveryDatePage,
    ),
    AutoRoute(
      path: '/checkout/payment',
      page: PaymentPage,
    ),
    AutoRoute(
      path: '/order/detail',
      page: OrderDetailPage,
    ),
    AutoRoute(
      path: '/account/addresses',
      page: AddressListPage,
    ),
    AutoRoute(
      path: '/account/add-address',
      page: AddAddressPage,
    ),
  ],
)
class $AppRouter {}
