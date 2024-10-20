import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utility/util/helper.dart';
import '../../domain/arena/arena_model.dart';

class ArenaDataSource {
  var listArena = <ArenaModel>[].obs;

  ArenaDataSource() {
    listArena.addAll(dummyArenaData);
  }

  ArenaModel getArena({required int index}) {
    return listArena[index];
  }

  int getArenaIndex({required ArenaModel arena}) {
    return listArena.indexWhere((data) => data == arena);
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

  PictureType getPicturesType({
    required int indexArena,
    required int indexCourt,
  }) {
    return listArena[indexArena].courtData[indexCourt].pictureType;
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

  List<ArenaModel> dummyArenaData = [
    ArenaModel(
      location: 'Petaling Jaya, Selangor',
      name: 'MBPJ Sports Complex',
      courtData: [
        CourtModel(
          pictures: [
            XFile('assets/images/field1.png'),
          ],
          pictureType: PictureType.asset,
          courtName: '1',
          arenaType: 'Indoor',
          flooringType: 'Court Turf',
          operationalHours: List.generate(
            7,
            (index) => OperationalHour(
              isActive: true.obs,
              dayName: Helper.dayName[index],
              openTime: const TimeOfDay(hour: 9, minute: 00).obs,
              closeTIme: const TimeOfDay(hour: 18, minute: 00).obs,
              chooseTime: true.obs,
            ),
          ),
          rateArena: [
            RateModel(name: 'Weekend Rate', price: 10.obs, hour: 1.0.obs),
            RateModel(name: 'Weekdays Rate', price: 10.obs, hour: 1.0.obs),
          ],
        ),
        CourtModel(
          pictures: [
            XFile('assets/images/field2.png'),
          ],
          pictureType: PictureType.asset,
          courtName: '2',
          arenaType: 'Outdoor',
          flooringType: 'Court Grass',
          operationalHours: List.generate(
            7,
            (index) => OperationalHour(
              isActive: true.obs,
              dayName: Helper.dayName[index],
              openTime: const TimeOfDay(hour: 9, minute: 00).obs,
              closeTIme: const TimeOfDay(hour: 18, minute: 00).obs,
              chooseTime: true.obs,
            ),
          ),
          rateArena: [
            RateModel(name: 'Weekend Rate', price: 10.obs, hour: 1.0.obs),
            RateModel(name: 'Weekdays Rate', price: 10.obs, hour: 1.0.obs),
          ],
        ),
      ],
    ),
    ArenaModel(
      location: 'Sungai Besar',
      name: 'Padang Utama',
      courtData: [
        CourtModel(
          pictures: [
            XFile('assets/images/field3.png'),
          ],
          pictureType: PictureType.asset,
          courtName: '1',
          arenaType: 'Indoor',
          flooringType: 'Cement',
          operationalHours: List.generate(
            7,
            (index) => OperationalHour(
              isActive: true.obs,
              dayName: Helper.dayName[index],
              openTime: const TimeOfDay(hour: 9, minute: 00).obs,
              closeTIme: const TimeOfDay(hour: 18, minute: 00).obs,
              chooseTime: true.obs,
            ),
          ),
          rateArena: [
            RateModel(name: 'Weekend Rate', price: 10.obs, hour: 1.0.obs),
            RateModel(name: 'Weekdays Rate', price: 10.obs, hour: 1.0.obs),
          ],
        ),
      ],
    ),
  ];
}
