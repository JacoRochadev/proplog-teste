import 'package:prolog_teste/app/features/tire/domain/entities/tire_details_entity.dart';
import 'package:prolog_teste/app/features/tire/domain/entities/tire_entity.dart';
import 'package:prolog_teste/app/features/tire/domain/enums/status_tire_enum.dart';
import 'package:prolog_teste/app/features/tire/domain/params/get_tire_details_params.dart';
import 'package:prolog_teste/app/features/tire/domain/params/get_tires_params.dart';

final tiresParamMock = GetTiresParams(
  branchOfficesId: 1,
  pageSize: 1,
  pageNumber: 1,
  showLoading: true,
);

const tiresEntityMock = TireEntity(
  id: 1,
  serialNumber: '1233',
  make: 'make',
  purchaseCost: 11.0,
  companyGroupName: 'Guabira',
);

final tireDetailsParamMock = GetTireDetailsParams(
  id: 1,
);

const tireDetailsEntityMock = TireDetailsEntity(
  id: 1,
  serialNumber: '1233',
  make: 'make',
  purchaseCost: 11.0,
  companyGroupName: 'Guabira',
  branchOfficeName: '',
  currentPressure: 12.0,
  maxRetreadsExpected: 1,
  newTire: true,
  recommendedPressure: 11.0,
  status: StatusTireEnum.analysis,
  timesRetreaded: 1,
  tireSizeHeight: 1.0,
  tireSizeWidth: 1.0,
);

final getTiresResponse = {
  "content": [
    {
      "id": 1,
      "serialNumber": "AB123",
      "make": {"name": "Goodyear"},
      "purchaseCost": 1500,
      "companyGroupName": "Grupo A",
    },
  ],
};

final getTireDetailsResponse = {
  "id": 118088,
  "serialNumber": "AB129",
  "companyGroupId": 15,
  "companyGroupName": "Empurrada",
  "branchOfficeId": 215,
  "branchOfficeName": "São Paulo",
  "currentLifeCycle": 3,
  "timesRetreaded": 2,
  "maxRetreadsExpected": 3,
  "recommendedPressure": 100,
  "currentPressure": 0,
  "dot": "1816",
  "purchaseCost": 1450,
  "newTire": false,
  "status": "ANALYSIS",
  "createdAt": "2019-08-18T15:13:21.985471Z",
  "tireSize": {"id": 269, "height": 80, "width": 275, "rim": 22.5},
  "make": {"id": 1258, "name": "adanved 10143"},
  "model": {
    "id": 6797,
    "name": "teste 3",
    "groovesQuantity": 4,
    "treadDepth": 12
  },
  "currentRetread": {
    "make": {"id": 25, "name": "Vipal"},
    "model": {
      "id": 667,
      "name": "ModeloTesteVipal",
      "groovesQuantity": 5,
      "treadDepth": 18
    },
    "retreadCost": 380
  },
  "analysis": {
    "recapperId": 956,
    "recapperName": "Garantia",
    "recapperPickUpId": "123",
    "reason": "Recapagem"
  },
  "registrationImages": []
};
