import 'package:flutter/material.dart';
import 'package:prolog_teste/app/core/utils/currency_type_formatter.dart';
import 'package:prolog_teste/app/core/utils/tire_pressure_formatter.dart';
import 'package:prolog_teste/app/features/tire/domain/entities/tire_details_entity.dart';
import 'package:prolog_teste/app/features/tire/presenter/widgets/card_item_widget.dart';

class CardDetailsWidget extends StatelessWidget {
  const CardDetailsWidget({
    super.key,
    required this.tireDetails,
  });

  final TireDetailsEntity tireDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0XFF2E3D80),
          border: Border.all(
            color: Colors.white,
            width: .3,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Número de série: ${tireDetails.serialNumber}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              CardItemWidget(
                label1: 'Empresa:',
                label2: 'Filial:',
                value1: tireDetails.companyGroupName,
                value2: tireDetails.branchOfficeName,
              ),
              CardItemWidget(
                label1: 'Marca:',
                label2: 'Condição:',
                value1: tireDetails.make,
                value2: tireDetails.newTire ? 'Novo' : 'Usado',
              ),
              CardItemWidget(
                label1: 'Altura:',
                label2: 'Largura:',
                value1: '${tireDetails.tireSizeHeight.toStringAsFixed(1)} cm',
                value2: '${tireDetails.tireSizeWidth.toStringAsFixed(1)} cm',
              ),
              CardItemWidget(
                label1: 'Pressão recomendada:',
                label2: 'Pressão atual:',
                value1: TirePressureFormatter.format(tireDetails.recommendedPressure),
                value2: TirePressureFormatter.format(tireDetails.currentPressure),
              ),
              CardItemWidget(
                label1: 'Vezes recauchutados:',
                label2: 'Recauchutagens esperadas:',
                value1: tireDetails.timesRetreaded.toString(),
                value2: tireDetails.maxRetreadsExpected.toString(),
              ),
              CardItemWidget(
                label1: 'Status:',
                label2: 'Custo de compra:',
                value1: tireDetails.status?.name ?? '',
                value2: CurrencyTypeFormatter.format(tireDetails.purchaseCost),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
