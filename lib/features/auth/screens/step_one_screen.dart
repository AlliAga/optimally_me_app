import 'package:flutter/material.dart';
import 'package:optimally_me_app/features/auth/widgets/step_header_widget.dart';
import 'package:optimally_me_app/widgets/input_form_field_widget.dart';

class StepOneScreen extends StatelessWidget {
  const StepOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        StepHeader(
          title: "Tell us about yourself?",
          description:
              "We will use your information to calculate your nutritional needs",
        ),
        InputFormField(
          label: "First name",
          hintText: "Enter First Name",
        ),
        InputFormField(
          label: "Last name",
          hintText: "Enter First Name",
        ),
        InputFormField(
          label: "Date of birth",
          hintText: "DD / MM / YYYY",
        ),
        InputFormField(
          label: "Your Height (cm)",
          hintText: "Enter your height",
        ),
        InputFormField(
          label: "Your weight (kg)",
          hintText: "Enter your weight",
        ),
      ],
    );
  }
}
