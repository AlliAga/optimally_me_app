import 'package:optimally_me_app/features/home/models/device_data_model.dart';

abstract class DeviceDataInterface {
  List<DeviceData> get deviceDatas;
  void selectDeselectDeviceData(DeviceData deviceData);
}
