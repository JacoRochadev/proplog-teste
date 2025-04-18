import 'package:prolog_teste/app/core/remote_client/http/helpers/params.dart';
import 'package:prolog_teste/app/core/remote_client/http/i_http_service.dart';
import 'package:prolog_teste/app/features/tire/domain/entities/tire_details_entity.dart';
import 'package:prolog_teste/app/features/tire/domain/params/get_tire_details_params.dart';
import 'package:prolog_teste/app/features/tire/external/mappers/tire_details_mapper.dart';
import 'package:prolog_teste/app/features/tire/external/network/tire_endpoints.dart';
import 'package:prolog_teste/app/features/tire/infra/datasources/i_get_tire_details_datasource.dart';
import 'package:prolog_teste/app/parameters.dart';

class GetTireDetailsDatasource implements IGetTireDetailsDatasource {
  final IHttpService _iHttpService;

  const GetTireDetailsDatasource({required IHttpService iHttpService})
      : _iHttpService = iHttpService;

  @override
  Future<TireDetailsEntity> call(GetTireDetailsParams params) async {
    final url = '$baseUrl${TireEndpoints.tireDetails}/${params.id}';
    final response = await _iHttpService.get(
      GetHttpServiceParam(
        url: url,
      ),
    );

    return TireDetailsMapper.fromMap(response.data);
  }
}
