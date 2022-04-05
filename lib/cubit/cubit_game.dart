import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorize_game/cubit/cubit_state.dart';
import 'dart:math';

class MemorizeCubit extends Cubit<MemorizeState> {
  MemorizeCubit() : super(MemorizeInitial());
  List<int> randoms =
      List.generate(6, (index) => Random().nextInt(10)).toList();
  bool isVisible = false;

  void showRandoms() {
    emit(ChangeState());
    isVisible = true;
    Future.delayed(Duration(seconds: 4)).then((value) {
      isVisible = false;
      emit(ChangeState());
    });
  }

  void makeRandom() {
    randoms = List.generate(6, (index) => Random().nextInt(10)).toList();
    emit(ChangeState());
  }

  void ochir(int index) {
    randoms.sort(((a, b) => a.bitLength.compareTo(b.bitLength)));
    randoms.sort();
    if (randoms[index] == randoms.first) {
      randoms.removeAt(index);
      emit(ChangeState());
      if (randoms.length == 0) {
        emit(MemorizeEnd());
        print("Tugadi");
      }
    }
  }
}
