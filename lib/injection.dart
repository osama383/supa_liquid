import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:supa_liquid/injection.config.dart';

final GetIt sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => sl.init();
