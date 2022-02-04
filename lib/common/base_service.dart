
import 'package:gallery/api/api_client.dart';

abstract class BaseService{
  BaseService(this._apiClient);

  final ApiClient? _apiClient;

  ApiClient? getApiClient() {

    return _apiClient;
  }
}