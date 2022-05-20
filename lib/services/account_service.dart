import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wholesale/models/vendor_response.dart';

import '../models/vendor_location_response.dart';

part 'account_service.g.dart';

@RestApi()
abstract class AccountService {
  factory AccountService(Dio dio, {String baseUrl}) = _AccountService;

  @GET('/vendors')
  Future<VendorResponse> getVendors();

  @GET('/vendors/{id}/locations')
  Future<VendorLocationResponse> getLocations(@Path('id') int id);
}
