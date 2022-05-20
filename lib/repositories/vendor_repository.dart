import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wholesale/models/menu.dart';
import 'package:wholesale/services/vendor_service.dart';

import '../helpers/api.dart';
import '../models/vendor.dart';

final vendorRepositoryProvider = Provider((ref) => VendorRepository());

class VendorRepository {
  final VendorService service = VendorService(
    Api.client,
    baseUrl: 'https://chef.esseplor.com/wholesale/api/v1',
  );

  VendorRepository();
}
