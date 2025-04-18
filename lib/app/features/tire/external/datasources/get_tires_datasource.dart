import 'package:prolog_teste/app/core/remote_client/http/helpers/params.dart';
import 'package:prolog_teste/app/core/remote_client/http/i_http_service.dart';
import 'package:prolog_teste/app/features/tire/domain/entities/tire_entity.dart';
import 'package:prolog_teste/app/features/tire/domain/params/get_tires_params.dart';
import 'package:prolog_teste/app/features/tire/external/mappers/tire_mapper.dart';
import 'package:prolog_teste/app/features/tire/external/network/tire_endpoints.dart';
import 'package:prolog_teste/app/features/tire/infra/datasources/i_get_tires_datasource.dart';
import 'package:prolog_teste/app/parameters.dart';

class GetTiresDatasource implements IGetTiresDatasource {
  final IHttpService _iHttpService;

  const GetTiresDatasource({required IHttpService iHttpService})
      : _iHttpService = iHttpService;

  @override
  Future<List<TireEntity>> call(GetTiresParams params) async {
    final response = await _iHttpService.get(
      GetHttpServiceParam(
        url: baseUrl + TireEndpoints.tires,
        data: TireMapper.toMap(params),
      ),
    );

    final content = (response.data['content'] as List?) ?? [];

    return content.map<TireEntity>((item) {
      return TireMapper.fromMap(item);
    }).toList();
  }
}
