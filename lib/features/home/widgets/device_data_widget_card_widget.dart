import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/home/models/device_data_model.dart';
import 'package:optimally_me_app/features/home/providers/device_data_provider.dart';
import 'package:provider/provider.dart';

class DeviceDataWidgetCard extends StatelessWidget {
  final DeviceData deviceData;

  const DeviceDataWidgetCard({super.key, required this.deviceData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 0.8,
          color: Colors.grey.shade400,
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.menu),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade100.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                deviceData.icon,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              deviceData.text,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Spacer(),
          ],
        ),
        trailing:
            Consumer<DeviceDataProvider>(builder: (context, provider, widget) {
          return Checkbox(
            activeColor: Theme.of(context).primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            side: const BorderSide(width: 0.5),
            value: deviceData.isSelected,
            onChanged: (isSelected) =>
                provider.selectDeselectDeviceData(deviceData),
          );
        }),
      ),
    );
  }
}
