// import 'package:states_lga/state_model.dart';
//
// class Repository {
//   // http://locationsng-api.herokuapp.com/api/v1/lgas
//   // test() => _india.map((map) => StateModel.fromJson(map));
//   List<Map> getAll() => _india;
//
//   getLocalByState(String state) => _india
//       .map((map) => StateModel.fromJson(map))
//       .where((item) => item.state == state)
//       .map((item) => item.lgas)
//       .expand((i) => i)
//       .toList();
//   // _india.where((list) => list['state'] == state);
//   // .map((item) => item['lgas'])
//   // .expand((i) => i)
//   // .toList();
//
//   List<String> getStates() => _india
//       .map((map) => StateModel.fromJson(map))
//       .map((item) => item.state)
//       .toList();
//   // _india.map((item) => item['state'].toString()).toList();
//
//   final List _india = [
//     {
//       "state": "Odisha",
//       "dist": [
//         "Balangir",
//         "Khordha",
//         "Puri",
//         "Jharsuguda",
//         "Bargarh",
//         "Sambalpur"
//       ],
//       "tahsil":[],
//       "block":[],
//       "panchayat":[],
//       "village":[]
//     },
//     {
//       "state": "Akwa Ibom",
//       "lgas": [
//         "Abak",
//         "Eastern Obolo",
//         "Eket",
//         "Esit Eket",
//         "Essien Udim",
//         "Etim Ekpo"
//       ]
//     },
//   ];
// }
