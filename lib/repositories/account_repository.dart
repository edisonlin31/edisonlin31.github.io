import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/services/account_service.dart';

import '../helpers/api.dart';

final accountRepositoryProvider = Provider((ref) => AccountRepository());

class AccountRepository {
  final AccountService service = AccountService(
    Api.client,
    baseUrl: 'https://chef.esseplor.com/wholesale/api/v1',
  );

  AccountRepository();
}
