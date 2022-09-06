import 'package:analyzer/file_system/overlay_file_system.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../databases/sqldatabase.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    SqlDatabase sqldatabase = SqlDatabase.instance;
    on<InitialTransactionEvent>((event, emit) async {
      try {
        emit(LoadingInitialTransaction());
        print("jalan");
        var result = await sqldatabase.InitialSupermarket();
        print(result);
        emit(SuccessInitialTransaction(result: result));
      } catch (e) {
        print(e.toString());
        emit(FailureInitialTransaction(messageError: "GAGAL INIT"));
      }
    });
  }
}
