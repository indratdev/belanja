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
        // check string kosong
        var result = supermarket.addNewSupermarket(event.nameSupermarket);
        emit(SuccessAddNewSupermarket(result: result));
        // result
        print("result : $result.toString()");
        // } on Error catch (e) {
        //   print("aaaa : $e");
      } on Exception catch (e) {
        // print("Exception : $e");
        print("----- ini jalan");
        // emit(FailureAddNewSupermarket(messageError: e.toString()));
      } catch (e) {
        // throw e;
        print("dari catch e : $e");
        // emit(FailureAddNewSupermarket(
        //     messageError: 'Data Supermarket Sudah Ada'));
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
  }
}
