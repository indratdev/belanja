import 'package:belanja/Data/Errors.dart';
import 'package:belanja/models/supermarket_model.dart';
import 'package:flutter/material.dart';

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

  addNewSupermarket(String value) {
    String name = trimAndUppercaseText(value);
    var checkData = isNullNameSupermartket(name);
    try {
      if (!checkData) {
        checkIsExistSupermarketName(name);
      } else {
        print("data ksoong");
      }
    } catch (e) {
      print("data salah :$e");
    }
  }

  checkIsExistSupermarketName(String value) async {
    var isExist = await sqldatabase.isExistSupermarket(value);
    // try {
    if (isExist == 1) {
      throw Exception('Data sudah ada');
      // Errors(messageError: "Data sudah ada");
    } else {
      insertNewSupermarket(value);
    }
    // } catch (err) {
    //   print("ini jalan : $err");

    //   rethrow;
    // }

    // if (isExist == 0) {
    //   insertNewSupermarket(value);
    // } else if (isExist == 1) {
    //   print("sudah ada");
    //   throw Exception('Nama Supermarket Sudah ada!');
    //   // emit(
    //   //     FailureAddNewSupermarket(messageError: 'Data Supermarket Sudah Ada'));

    // }
  }

  Future<int> insertNewSupermarket(String value) async {
    return await sqldatabase.insertNote(value);
  }
}
