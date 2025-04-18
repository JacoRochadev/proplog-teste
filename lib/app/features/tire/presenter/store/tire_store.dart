import 'package:flutter_triple/flutter_triple.dart';
import 'package:prolog_teste/app/features/tire/domain/entities/tire_entity.dart';
import 'package:prolog_teste/app/features/tire/domain/params/get_tire_details_params.dart';
import 'package:prolog_teste/app/features/tire/domain/params/get_tires_params.dart';
import 'package:prolog_teste/app/features/tire/domain/usecases/get_tire_details/i_get_tire_details_usecase.dart';
import 'package:prolog_teste/app/features/tire/domain/usecases/get_tires/i_get_tires_usecase.dart';

import 'tire_state.dart';

class TireStore extends Store<TireState> {
  final IGetTiresUsecase _iGetTiresUsecase;
  final IGetTireDetailsUsecase _iGetTireDetailsUsecase;

  TireStore({
    required IGetTiresUsecase iGetTiresUsecase,
    required IGetTireDetailsUsecase iGetTireDetailsUsecase,
  })  : _iGetTiresUsecase = iGetTiresUsecase,
        _iGetTireDetailsUsecase = iGetTireDetailsUsecase,
        super(TireState.init());

  Future<void> getTires(GetTiresParams params) async {
    if (params.showLoading!) setLoading(true);
    final result = await _iGetTiresUsecase.call(params);
    result.fold(
      (l) => setError(l),
      (r) {
        update(state.copyWith(
          tiresList: r,
          haveMore: r.isNotEmpty,
        ));
      },
    );
    if (params.showLoading!) setLoading(false);
  }

  Future<void> getTireDetails(GetTireDetailsParams params) async {
    setLoading(true);
    final result = await _iGetTireDetailsUsecase.call(params);
    result.fold(
      (l) => setError(l),
      (r) {
        update(state.copyWith(tireDetailsEntity: r));
      },
    );
    setLoading(false);
  }

  void updateDisplayedTires(List<TireEntity> list) {
    update(state.copyWith(displayedTires: list));
  }

  void updatePageNumber(int value) {
    update(state.copyWith(pageNumber: value));
  }

  void updateSelectedId(int value) {
    update(state.copyWith(selectedId: value));
  }
}
