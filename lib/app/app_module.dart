import 'package:flutter_modular/flutter_modular.dart';
import 'package:prolog_teste/app/core/core_module.dart';
import 'package:prolog_teste/app/features/tire/tire_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
    TireModule(),
  ];

  @override
  void routes(r) {
    r.redirect('/', to: '/tires/'); // <- adiciona isso
    r.module('/tires', module: TireModule());
  }
}
