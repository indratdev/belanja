import '../databases/sqldatabase.dart';

class Supermarket {
  SqlDatabase sqldatabase = SqlDatabase.instance;
  String nameSupermarket;

  Supermarket({this.nameSupermarket = ""});

  String trimAndUppercaseText(String value) {
    return value.trim().toUpperCase();
  }

  bool isNullNameSupermartket(String name) {
    return (trimAndUppercaseText(name).isEmpty) ? true : false;
  }

  // addNewSupermarket(String value) {
  //   String name = trimAndUppercaseText(value);
  //   // var checkData = isNullNameSupermartket(name);
  //   // try {
  //   //   if (!checkData) {
  //   // checkIsExistSupermarketName(name);
  //   //   } else {
  //   //     print("data ksoong");
  //   //   }
  //   // } catch (e) {
  //   //   print("data salah :$e");
  //   // }
  // }

  Future<bool> checkIsExistSupermarketName(String value) async {
    value = trimAndUppercaseText(value);
    var isExist = await sqldatabase.isExistSupermarket(value);
    return (isExist == 1) ? true : false;
  }

  Future<int> insertNewSupermarket(String value) async {
    value = trimAndUppercaseText(value);
    return await sqldatabase.insertNote(value);
  }

  Future<int> deleteSupermarketByID(int id) async {
    return await sqldatabase.deleteDataSupermarketByID(id);
  }

  // location
  // check apakah sudah ada nama yg sama
  Future<bool> checkIsExistLocation(
      int idSupermarket, String locationName) async {
    locationName = trimAndUppercaseText(locationName);
    var isExist =
        await sqldatabase.isExistLocation(idSupermarket, locationName);
    return (isExist == 1) ? true : false;
  }

  // insert lokasi
  Future<int> insertLocationSupermarket(
      int idSupermarket, String locationName) async {
    locationName = trimAndUppercaseText(locationName);

    return await sqldatabase.insertLocation(idSupermarket, locationName);
  }
}
