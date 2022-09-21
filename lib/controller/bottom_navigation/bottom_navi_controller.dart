import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RootController extends GetxController{

  RxInt rootPageIndex = 0.obs;

  void changeRootPageIndex(int index){
    rootPageIndex(index);
  }

}