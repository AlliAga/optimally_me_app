import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/home/providers/home_provider.dart';
import 'package:optimally_me_app/features/home/widgets/navigation_option_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 15,
                foregroundImage:
                    AssetImage("assets/images/avatars/profile-avatar.jpg"),
              ),
              Consumer<HomeProvider>(
                builder: (context, homeProvider, widget) {
                  return Row(
                    children: homeProvider.currentNavigationIndex == 1
                        ? [
                            Text(
                              "Nutrition",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ]
                        : homeProvider.currentNavigationIndex == 2
                            ? [
                                Text(
                                  "Device Data",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ]
                            : homeProvider.currentNavigationIndex == 3
                                ? [
                                    Text(
                                      "Add fast",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ]
                                : [
                                    const Icon(Icons.keyboard_arrow_left),
                                    Text(
                                      "Tooday, Nov 9",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    const Icon(Icons.keyboard_arrow_right),
                                  ],
                  );
                },
              ),
              Consumer<HomeProvider>(builder: (context, homeProvider, widget) {
                return homeProvider.currentNavigationIndex == 0
                    ? const Icon(CupertinoIcons.bell)
                    : homeProvider.currentNavigationIndex == 1
                        ? const Icon(CupertinoIcons.bag)
                        : const SizedBox.shrink();
              }),
            ],
          ),
        ),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return homeProvider.screens[homeProvider.currentNavigationIndex];
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.2, color: Colors.grey.shade300),
          ),
        ),
        child: BottomAppBar(
          color: Colors.white,
          padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
          child:
              Consumer<HomeProvider>(builder: (context, homeProvider, widget) {
            return Row(
              children: homeProvider.navptions.map((navOption) {
                bool isSelected =
                    homeProvider.currentNavigationIndex == navOption.index;
                return NavigaionOption(
                  onTap: () =>
                      homeProvider.onNavigationIndexChanged(navOption.index),
                  icon: navOption.icon,
                  text: navOption.text,
                  isSelected: isSelected,
                );
              }).toList(),
            );
          }),
        ),
      ),
    );
  }
}
