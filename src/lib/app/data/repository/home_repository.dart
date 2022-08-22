import 'package:androidstudio/app/data/provider/home_provider.dart';

class HomeRepository {
  final HomeProvider apiClient;

  HomeRepository({required this.apiClient});

  getAll() {
    return apiClient.getAll();
  }

  getId(id) {
    return apiClient.getId(id);
  }
}
