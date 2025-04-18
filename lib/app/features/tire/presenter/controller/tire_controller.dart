import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prolog_teste/app/features/tire/domain/params/get_tire_details_params.dart';
import 'package:prolog_teste/app/features/tire/domain/params/get_tires_params.dart';
import 'package:prolog_teste/app/features/tire/presenter/store/tire_store.dart';

class TireController {
  final TireStore store;

  TireController({
    required this.store,
  });

  final ScrollController scrollController = ScrollController();

  Future<void> getTires(bool showLoading) async {
    final params = GetTiresParams(
      branchOfficesId: 215,
      pageSize: store.state.pageSize,
      pageNumber: store.state.pageNumber,
      showLoading: showLoading,
    );
    await store.getTires(params);
    final isFirstPage = store.state.pageNumber == 1;
    final newData = store.state.tiresList;
    final previousData = store.state.displayedTires;

    final combinedData = isFirstPage ? newData : [...previousData, ...newData];

    store.updateDisplayedTires(combinedData);
  }

  Future<void> getTireDetails() async {
    final id = store.state.selectedId;
    if (id != null) {
      final params = GetTireDetailsParams(id: id);
      await store.getTireDetails(params);
    }
  }

  void setupScrollListener() {
    scrollController.addListener(() {
      final scrollPos = scrollController.position;
      final isCloseToBottom =
          scrollPos.maxScrollExtent - scrollPos.pixels <= 200;

      if (isCloseToBottom && store.state.haveMore) {
        store.updatePageNumber(store.state.pageNumber + 1);
        getTires(false);
      }
    });
  }

  void goToTireDetailsPage(int id) {
    store.updateSelectedId(id);
    Modular.to.pushNamed(
      '/tires/details',
    );
  }

  void dispose() {
    scrollController.dispose();
  }
}
