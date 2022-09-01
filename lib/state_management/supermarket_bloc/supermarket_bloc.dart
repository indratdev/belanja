import 'package:belanja/Data/Errors.dart';
import 'package:belanja/Data/supermaket.dart';
import 'package:belanja/databases/sqldatabase.dart';
import 'package:belanja/models/supermarket_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'supermarket_event.dart';
part 'supermarket_state.dart';

class SupermarketBloc extends Bloc<SupermarketEvent, SupermarketState> {
  SupermarketBloc() : super(SupermarketInitial()) {
    Supermarket supermarket = Supermarket();
    SqlDatabase sqldatabase = SqlDatabase.instance;

    on<AddNewSuperMarket>((event, emit) async {
      try {
        emit(LoadingAddNewSupermarket());

        var cleanValue =
            supermarket.trimAndUppercaseText(event.nameSupermarket);

        if (cleanValue.isEmpty) {
          throw DataInputNullException();
        }

        // cek apakah sudah ada di database
        bool status = await supermarket.checkIsExistSupermarketName(cleanValue);

        var finalStatus;

        if (status) {
          throw UnExistSupermarketException();
        } else {
          finalStatus = await supermarket.insertNewSupermarket(cleanValue);
        }

        emit(SuccessAddNewSupermarket(result: finalStatus));
      } on UnExistSupermarketException catch (e) {
        emit(FailureAddNewSupermarket(messageError: e.toString()));
      } on DataInputNullException catch (e) {
        emit(FailureAddNewSupermarket(messageError: e.toString()));
      } catch (err) {
        print("Error Add new: $err");
        emit(FailureAddNewSupermarket(messageError: err.toString()));
      }
    });

    on<ViewAllSupermarket>((event, emit) async {
      try {
        emit(LoadingViewSupermarket());
        var result = await sqldatabase.readAllSupermarket();
        // print("rsu : $result");
        emit(SuccessViewSupermarket(result: result));
        // } on FormatException {
        //   print("object");
        // } on PlatformException catch (e) {
        //   print("PlatformException : $e");
      } catch (e) {
        print("error e: $e");
      }
      // } catch (e) {
      //   emit(FailureViewSupermarket(messageError: "Error : Menampilkan Data"));

      // }
    });

    on<DeleteSuperMarket>((event, emit) async {
      try {
        emit(LoadingDeleteSupermarket());
        var result =
            await supermarket.deleteSupermarketByID(event.idSupermarket!);
        emit(SuccessDeleteSupermarket(result: result));
      } catch (e) {
        print("Error delete: $e");
        emit(FailureDeleteSupermarket(messageError: e.toString()));
      }
    });

    on<AddLocationSupermarket>((event, emit) async {
      var locationName = "";
      try {
        emit(LoadingLocationSupermarket());
        var cleanValue = supermarket.trimAndUppercaseText(event.locationName);

        if (cleanValue.isEmpty) {
          throw DataInputNullException();
        }

        // cek apakah sudah ada di database
        bool status = await supermarket.checkIsExistLocation(
            event.idSupermarket, cleanValue);

        var finalStatus;

        if (status) {
          throw UnExistLocationSupermarketException();
        } else {
          finalStatus = await supermarket.insertLocationSupermarket(
              event.idSupermarket, cleanValue);
        }
        emit(SuccessAddLocationSupermarket(result: finalStatus));
      } on UnExistLocationSupermarketException catch (e) {
        emit(FailureLocationSupermarket(messageError: e.toString()));
      } on DataInputNullException catch (e) {
        emit(FailureLocationSupermarket(messageError: e.toString()));
      } catch (e) {
        print("error : $e");
        emit(FailureLocationSupermarket(messageError: e.toString()));
      }
    });

    on<ViewLocationById>((event, emit) async {
      try {
        emit(LoadingViewLocationById());
        print("event.idsupermarket : ${event.idSupermarket}");
        var result =
            await sqldatabase.readLocationByIDSuper(event.idSupermarket);
        print("result : $result");

        emit(SuccessViewLocationById(result: result));
      } catch (e) {
        print("error e: $e");
        emit(FailureViewLocationById(messageError: e.toString()));
      }
    });
  }
}
