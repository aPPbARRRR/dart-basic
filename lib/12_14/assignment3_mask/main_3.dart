import 'package:dart_application_1/12_14/assignment3_mask/controller.dart';
import 'package:dart_application_1/12_14/assignment3_mask/repository.dart';
import 'package:dart_application_1/12_14/assignment3_mask/store_service.dart';



const String uri = 'http://104.198.248.76:3000/mask';

void main () async {
  Controller controller = Controller(service: StoreService(uri: uri, repository: Repository()));
}