import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/home/providers/home_provider.dart';
import 'package:optimally_me_app/features/home/screens/lifestyle_screen.dart';
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
              Row(
                children: [
                  const Icon(Icons.keyboard_arrow_left),
                  Text(
                    "Tooday, Nov 9",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Icon(Icons.keyboard_arrow_right),
                ],
              ),
              const Icon(CupertinoIcons.bell),
            ],
          ),
        ),
      ),
      body: const LifestyleScreen(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.2, color: Colors.grey.shade300),
          ),
        ),
        child: BottomAppBar(
          color: Colors.white,
          padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
          child: Consumer<HomeProvider>(
            builder: (context, homeProvider, widget) {
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
            },
          ),
        ),
      ),
    );
  }
}
