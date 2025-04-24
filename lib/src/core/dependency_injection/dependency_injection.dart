import 'package:get_it/get_it.dart';

final sl = GetIt.I;

Future<void> setupService() async {

  await sl.allReady();
}
