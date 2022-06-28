import '../../networks/http_client.dart';
import '../config/api_service_paths.dart';

class TodosApiService {
  TodosApiService(this.httpClient);

  final HttpClient httpClient;

  Future<dynamic> getTopic() async {
    final response = await httpClient.get(ApiServicePaths.todo);
    return response;
  }

}
