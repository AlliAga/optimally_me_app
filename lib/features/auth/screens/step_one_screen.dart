import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/auth/providers/step_one_provider.dart';
import 'package:optimally_me_app/features/auth/widgets/step_header_widget.dart';
import 'package:optimally_me_app/widgets/input_form_field_widget.dart';
import 'package:optimally_me_app/widgets/multi_select_button_widget.dart';
import 'package:optimally_me_app/widgets/select_indicator_widget.dart';
import 'package:provider/provider.dart';

class StepOneScreen extends StatefulWidget {
  const StepOneScreen({super.key});

  @override
  State<StepOneScreen> createState() => _StepOneScreenState();
}

class _StepOneScreenState extends State<StepOneScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 20),
      children: [
        const StepHeader(
          title: "Tell us about yourself?",
          description:
              "We will use your information to calculate your nutritional needs",
        ),
        const InputFormField(
          label: "First name",
          hintText: "Enter First Name",
        ),
        const InputFormField(
          label: "Last name",
          hintText: "Enter First Name",
        ),
        const InputFormField(
          label: "Date of birth",
          hintText: "DD / MM / YYYY",
        ),
        MultiSelectButton(
          options: [
            MultiSelectButtonOption(
              icon: Icons.male,
              text: "Male",
              value: "male",
            ),
            MultiSelectButtonOption(
              icon: Icons.female,
              text: "Female",
              value: "female",
            ),
          ],
          defaultSelected: "male",
        ),
        SelectIndicator(
          options: const ["kg,cm", "lb,ft"],
          onTap: context.read<StepOneProvider>().onWeightOptingIndexChange,
          controller: _tabController,
        ),
        Consumer<StepOneProvider>(
          builder: (context, provider, child) {
            return Column(
              children: provider.weightOptionIndex == 0
                  ? [
                      const InputFormField(
                        label: "Your Height (cm)",
                        hintText: "Enter your height",
                      ),
                      const InputFormField(
                        label: "Your weight (kg)",
                        hintText: "Enter your weight",
                      ),
                    ]
                  : [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: InputFormField(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                label: "Your Height (ft)",
                                hintText: "Enter your height",
                              ),
                            ),
                            Expanded(
                              child: InputFormField(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                label: "Your weight (lb)",
                                hintText: "Enter your weight",
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
            );
          },
        )
      ],
    );
  }
}
