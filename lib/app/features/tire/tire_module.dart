import 'package:flutter_modular/flutter_modular.dart';
import 'package:prolog_teste/app/core/core_module.dart';
import 'package:prolog_teste/app/features/tire/domain/repositories/i_get_tire_details_repository.dart';
import 'package:prolog_teste/app/features/tire/domain/repositories/i_get_tires_repository.dart';
import 'package:prolog_teste/app/features/tire/domain/usecases/get_tire_details/get_tire_details_usecase.dart';
import 'package:prolog_teste/app/features/tire/domain/usecases/get_tire_details/i_get_tire_details_usecase.dart';
import 'package:prolog_teste/app/features/tire/domain/usecases/get_tires/get_tires_usecase.dart';
import 'package:prolog_teste/app/features/tire/domain/usecases/get_tires/i_get_tires_usecase.dart';
import 'package:prolog_teste/app/features/tire/external/datasources/get_tire_details_datasource.dart';
import 'package:prolog_teste/app/features/tire/external/datasources/get_tires_datasource.dart';
import 'package:prolog_teste/app/features/tire/infra/datasources/i_get_tire_details_datasource.dart';
import 'package:prolog_teste/app/features/tire/infra/datasources/i_get_tires_datasource.dart';
import 'package:prolog_teste/app/features/tire/infra/repositories/get_tire_details_repository.dart';
import 'package:prolog_teste/app/features/tire/infra/repositories/get_tires_repository.dart';
import 'package:prolog_teste/app/features/tire/presenter/controller/tire_controller.dart';
import 'package:prolog_teste/app/features/tire/presenter/pages/tire_details_page.dart';
import 'package:prolog_teste/app/features/tire/presenter/pages/tires_page.dart';
import 'package:prolog_teste/app/features/tire/presenter/store/tire_store.dart';

class TireModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
  ];
  @override
  void binds(Injector i) {
    // Controller
    i.addLazySingleton(TireController.new);

    // Store
    i.addLazySingleton(TireStore.new);

    // Get Tires
    i.addLazySingleton<IGetTiresUsecase>(GetTiresUsecase.new);
    i.addLazySingleton<IGetTiresRepository>(GetTiresRepository.new);
    i.addLazySingleton<IGetTiresDatasource>(GetTiresDatasource.new);

    // Get Tire Details
    i.addLazySingleton<IGetTireDetailsUsecase>(GetTireDetailsUsecase.new);
    i.addLazySingleton<IGetTireDetailsRepository>(GetTireDetailsRepository.new);
    i.addLazySingleton<IGetTireDetailsDatasource>(GetTireDetailsDatasource.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => TiresPage(
        controller: Modular.get<TireController>(),
      ),
    );
    r.child(
      '/details',
      child: (_) => TireDetailsPage(
        controller: Modular.get<TireController>(),
      ),
    );
  }
}
