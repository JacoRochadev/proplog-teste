import 'package:prolog_teste/app/features/tire/domain/entities/tire_details_entity.dart';
import 'package:prolog_teste/app/features/tire/domain/entities/tire_entity.dart';

class TireState {
  final List<TireEntity> tiresList;
    final List<TireEntity> displayedTires;
  final TireDetailsEntity? tireDetailsEntity;
  final int pageNumber;
  final int pageSize;
  final int? selectedId;
  final bool haveMore;

  const TireState({
    required this.tiresList,
    required this.displayedTires,
    required this.tireDetailsEntity,
    required this.pageNumber,
    required this.pageSize,
    required this.selectedId,
    required this.haveMore,
  });

  factory TireState.init() {
    return const TireState(
      tiresList: [],
      displayedTires: [],
      tireDetailsEntity: null,
      pageNumber: 0,
      pageSize: 15,
      selectedId: null,
      haveMore: false,
    );
  }

  TireState copyWith({
    List<TireEntity>? tiresList,
    List<TireEntity>? displayedTires,
    TireDetailsEntity? tireDetailsEntity,
    int? pageNumber,
    int? pageSize,
    int? selectedId,
    bool? haveMore,
  }) {
    return TireState(
      tiresList: tiresList ?? this.tiresList,
      displayedTires: displayedTires ?? this.displayedTires,
      tireDetailsEntity: tireDetailsEntity ?? this.tireDetailsEntity,
      pageNumber: pageNumber ?? this.pageNumber,
      pageSize: pageSize ?? this.pageSize,
      selectedId: selectedId ?? this.selectedId,
      haveMore: haveMore ?? this.haveMore,
    );
  }
}
