import 'package:flutter_espresso/core/constants/app_constants.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@injectable
class CoffeesService {
  const CoffeesService();

  Future<Response> getCoffees() async {
    return await get(Uri.parse('${AppConstants.baseUrl}/coffee'));
  }
}
