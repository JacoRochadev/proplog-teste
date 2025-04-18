import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:prolog_teste/app/features/tire/presenter/controller/tire_controller.dart';
import 'package:prolog_teste/app/features/tire/presenter/store/tire_state.dart';
import 'package:prolog_teste/app/features/tire/presenter/store/tire_store.dart';
import 'package:prolog_teste/app/features/tire/presenter/widgets/list_item_widget.dart';

class TiresPage extends StatefulWidget {
  final TireController controller;

  const TiresPage({super.key, required this.controller});

  @override
  State<TiresPage> createState() => _TiresPageState();
}

class _TiresPageState extends State<TiresPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.getTires(true);
    widget.controller.setupScrollListener();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        appBar: AppBar(
          title: Text(
            'Pneus',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
        body: ScopedBuilder<TireStore, TireState>(
          store: widget.controller.store,
          onLoading: (_) => const Center(child: CircularProgressIndicator()),
          onError: (_, error) => Center(child: Text('Erro: $error')),
          onState: (_, state) {
            if (state.displayedTires.isEmpty) {
              return const Center(child: Text('Nenhum pneu encontrado'));
            }

            return ListView.builder(
              controller: widget.controller.scrollController,
              itemCount: state.displayedTires.length +
                  (widget.controller.store.isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == state.displayedTires.length) {
                  return Padding(
                    padding: EdgeInsets.all(size.width * .04),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }

                final tire = state.displayedTires[index];
                return ListItemWidget(
                  element: tire,
                  onTap: () => widget.controller.goToTireDetailsPage(tire.id),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
