import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/home/interfaces/device_data_interface.dart';
import 'package:optimally_me_app/features/home/models/device_data_model.dart';

class DeviceDataProvider extends ChangeNotifier implements DeviceDataInterface {
  final List<DeviceData> _deviceData = [
    DeviceData(priority: 1, icon: Icons.directions_walk, text: "Steps"),
    DeviceData(
        priority: 2, icon: Icons.directions_walk, text: "Burned Calories"),
    DeviceData(
        priority: 3, icon: Icons.fireplace_rounded, text: "BloodPressure"),
    DeviceData(priority: 4, icon: Icons.vaping_rooms_outlined, text: "VO2"),
    DeviceData(priority: 5, icon: Icons.hvac_rounded, text: "HRV sleep"),
    DeviceData(priority: 6, icon: Icons.bed, text: "Sleep time"),
    DeviceData(
        priority: 6, icon: Icons.self_improvement_sharp, text: "Sleep core"),
  ];

  @override
  List<DeviceData> get deviceDatas => _deviceData;

  @override
  void selectDeselectDeviceData(DeviceData deviceData) {
    deviceData.isSelected = !(deviceData.isSelected ?? false);
    notifyListeners();
  }
}
