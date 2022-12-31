import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_project/cubit/states.dart';
import 'package:firebase_database/firebase_database.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  bool ledOn = true; //Value of the LED
  int? sensorReading; //Value of the LDR
  final dataBase = FirebaseDatabase.instance.ref();

  void getData() {
    emit(DataGetting());
    dataBase.child('ESP').once().then((snap) {
      sensorReading = 5; //snap.value['LDR'];
      //ledOn = snap.value['LED'] == 1;
    }).then((value) {
      emit(DataGot());
    });

    dataBase.child('ESP').onChildChanged.listen((event) {
      DataSnapshot snap = event.snapshot;
      if (snap.key == 'LDR') {
        sensorReading = 5; //snap.value;
        emit(DataGot());
      }
    });
  }

  void ledChange() {
    emit(LedPressed());
    ledOn = !ledOn;
    final child = dataBase.child('ESP/');
    int boolString = ledOn ? 1 : 0;
    child.update({'LED': boolString});
    emit(LedChanged());
  }
}
