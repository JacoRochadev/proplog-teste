import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:prolog_teste/app/features/tire/presenter/controller/tire_controller.dart';
import 'package:prolog_teste/app/features/tire/presenter/store/tire_state.dart';
import 'package:prolog_teste/app/features/tire/presenter/store/tire_store.dart';
import 'package:prolog_teste/app/features/tire/presenter/widgets/card_details_widget.dart';

class TireDetailsPage extends StatefulWidget {
  const TireDetailsPage({
    super.key,
    required this.controller,
  });

  final TireController controller;

  @override
  State<TireDetailsPage> createState() => _TireDetailsPageState();
}

class _TireDetailsPageState extends State<TireDetailsPage> {
  TireController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getTireDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        appBar: AppBar(
          title: Text(
            'Detalhes do Pneu',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
        body: ScopedBuilder<TireStore, TireState>(
          store: controller.store,
          onLoading: (_) => const Center(child: CircularProgressIndicator()),
          onState: (_, state) {
            final details = state.tireDetailsEntity;
            if (details == null) {
              return const Center(child: Text('Nenhum detalhe encontrado'));
            }

            return Center(
              child: CardDetailsWidget(
                tireDetails: details,
              ),
            );
          },
        ),
      ),
    );
  }
}
