import 'package:analyzer/file_system/overlay_file_system.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Data/Errors.dart';
import '../../databases/sqldatabase.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    SqlDatabase sqldatabase = SqlDatabase.instance;
    on<InitialTransactionEvent>((event, emit) async {
      try {
        emit(LoadingInitialTransaction());
        var result = await sqldatabase.InitialSupermarket();

        emit(SuccessInitialTransaction(result: result));
      } catch (e) {
        print(e.toString());
        emit(FailureInitialTransaction(messageError: "GAGAL INIT"));
      }
    });

    on<ChangeSupernLocationEvent>((event, emit) async {
      emit(LoadingChangeSupernLocation());

      try {
        var idSuper =
            await sqldatabase.readSupermarketByName(event.supermarketName);
        var result = await sqldatabase.GetSuperandLocation(idSuper);

        emit(SuccessInitialTransaction(result: result));
      } on OperationSQLException catch (e) {
        emit(FailureChangeSupernLocation(messageError: e.toString()));
      } catch (e) {
        print(e.toString());
        emit(FailureChangeSupernLocation(messageError: "Gagal !"));
      }
    });
  }
}
