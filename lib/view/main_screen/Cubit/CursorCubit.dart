import 'package:flutter_application_1/view/main_screen/Cubit/CursorState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouseCubit extends Cubit<CarouseState> {
  CarouseCubit() : super(CarouseState(currentIndex: 0));

  void updateIndex(int newIndex) {
    emit(CarouseState(currentIndex: newIndex));
  }
}
