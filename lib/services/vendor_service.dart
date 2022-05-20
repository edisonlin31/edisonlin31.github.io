import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wholesale/models/load_more_queries.dart';
import 'package:wholesale/models/vendor.dart';
import 'package:wholesale/models/vendor_location_response.dart';
import 'package:wholesale/models/vendor_response.dart';
import '../models/menu.dart';
import '../models/menu_response.dart';
import '../models/vendor_location.dart';

part 'vendor_service.g.dart';

@RestApi()
abstract class VendorService {
  factory VendorService(Dio dio, {String baseUrl}) = _VendorService;

  @GET('/vendors')
  Future<VendorResponse> getVendors();

  @GET('/vendors/{id}')
  Future<Vendor> getVendorDetail(@Path('id') int id);

  @GET('/vendors/{id}/locations')
  Future<VendorLocationResponse> getVendorLocations(@Path('id') int id);

  @GET('/vendors/{id}/menus')
  Future<MenuResponse> getMenus(
      @Path('id') int id, @Queries() LoadMoreQueries queries);

  @GET('/menus/{id}')
  Future<Menu> getMenuDetail(@Path('id') int id);
}
