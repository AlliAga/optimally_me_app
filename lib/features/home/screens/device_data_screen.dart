import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/home/models/device_data_model.dart';
import 'package:optimally_me_app/features/home/providers/device_data_provider.dart';
import 'package:optimally_me_app/features/home/widgets/device_data_widget_card_widget.dart';
import 'package:provider/provider.dart';

class DeviceDataScreen extends StatelessWidget {
  const DeviceDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Set up the widget",
                  style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 10),
              const Text(
                "Please select the data and specify the order in which to display them.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Consumer<DeviceDataProvider>(
              builder: (context, provider, widget) {
            final List<DeviceData> deviceDatas = provider.deviceDatas;
            return ListView.builder(
              itemCount: deviceDatas.length,
              itemBuilder: (context, index) {
                return DeviceDataWidgetCard(
                  deviceData: deviceDatas[index],
                );
              },
            );
          }),
        )
      ],
    );
  }
}
