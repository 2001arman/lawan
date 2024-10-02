import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/arena/arena_model.dart';

class ArenaDataSource {
  var listArena = <ArenaModel>[].obs;

  ArenaModel getArena({required int index}) {
    return listArena[index];
  }

  List<CourtModel> getCourt({required int indexArena}) {
    return listArena[indexArena].courtData;
  }

  List<OperationalHour> getOperationalHour({
    required int indexArena,
    required int indexCourt,
  }) {
    return listArena[indexArena].courtData[indexCourt].operationalHours;
  }

  List<RateModel> getRateArena({
    required int indexArena,
    required int indexCourt,
  }) {
    return listArena[indexArena].courtData[indexCourt].rateArena;
  }

  List<XFile> getPicturesArena({
    required int indexArena,
    required int indexCourt,
  }) {
    return listArena[indexArena].courtData[indexCourt].pictures;
  }

  String getArenaType({
    required int indexArena,
    required int indexCourt,
  }) {
    return listArena[indexArena].courtData[indexCourt].arenaType;
  }

  String getFlooringType({
    required int indexArena,
    required int indexCourt,
  }) {
    return listArena[indexArena].courtData[indexCourt].flooringType;
  }

  void addArena({required ArenaModel arena}) => listArena.add(arena);

  void addCourt({required int arenaIndex, required CourtModel court}) =>
      listArena[arenaIndex].courtData.add(court);

  void editArenaName({required int index, required String name}) {
    listArena[index].name = name;
  }

  void editCourtName(
      {required int arenaIndex,
      required int courtIndex,
      required String name}) {
    listArena[arenaIndex].courtData[courtIndex].courtName = name;
  }

  void deleteArena({required int index}) {
    listArena.removeAt(index);
  }
}
