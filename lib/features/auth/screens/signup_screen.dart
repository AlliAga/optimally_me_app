import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/auth/providers/stepper_provider.dart';
import 'package:optimally_me_app/features/auth/widgets/progress_widget.dart';
import 'package:optimally_me_app/widgets/button_widget.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _animateToPage(StepperProvider stepperProvider) =>
      _pageController.animateToPage(
        stepperProvider.currentPageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );

  @override
  Widget build(BuildContext context) {
    return Consumer<StepperProvider>(
      builder: (context, stepperProvider, widget) {
        return Scaffold(
          appBar: AppBar(
            leading: stepperProvider.isInitialStep
                ? null
                : IconButton(
                    onPressed: () {
                      stepperProvider.onPreviousStep();
                      _animateToPage(stepperProvider);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
            actions: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "Quit",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              FormProgressBar(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                percentage: stepperProvider.stepperProgressPercentage,
              ),
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemCount: stepperProvider.stepperScreens.length,
                  itemBuilder: (context, index) {
                    return stepperProvider.stepperScreens[index];
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: FormButton(
                              onPressed: () {
                                stepperProvider.onNextStep();
                                _animateToPage(stepperProvider);
                              },
                              text: !stepperProvider.isFinalStep
                                  ? "Next"
                                  : "Finish"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "We will never share your personal information with anyone",
                      style:
                          TextStyle(color: Colors.grey.shade500, fontSize: 13),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
