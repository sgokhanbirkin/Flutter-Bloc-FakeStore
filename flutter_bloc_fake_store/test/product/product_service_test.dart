import 'package:flutter_bloc_fake_store/feature/home/service/home_service.dart';
import 'package:flutter_bloc_fake_store/product/network/product_network_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late IHomeService homeService;
  setUp(() {
    homeService = HomeService(ProductNetworkManager());
  });
  test('FetchAllProducts - test five elements', () async {
    final response = await homeService.fetchAllProducts();
    expect(response, isNotEmpty);
  });

  test('Fetch all Categories -', () async {
    final response = await homeService.fetchAllCategories();
    expect(response, isNotEmpty);
  });
}
