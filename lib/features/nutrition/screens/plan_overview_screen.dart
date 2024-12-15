import 'package:flutter/material.dart';
import 'package:optimally_me_app/widgets/button_widget.dart';

class PlanOverviewScreen extends StatelessWidget {
  const PlanOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
              fit: BoxFit.cover,
              'assets/images/plan_overview/product-hero.jpg'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sugar-free dilights: \n a 7_days meal plan",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const Spacer(),
              const Icon(Icons.share_outlined),
              const SizedBox(width: 15),
              const Icon(Icons.bookmark)
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: FormButton(
                type: ButtonType.outlined,
                onPressed: () {},
                text: "View reports",
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: FormButton(
                type: ButtonType.outlined,
                onPressed: () {},
                text: "Explore",
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Plan overview",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 15),
              Text(
                "This meal plan focuses on eleminating added sugars. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ipsum recusandae saepe perferendis aliquam consequuntur eaque iusto, eos aut beatae consequatur facilis provident commodi at dolore quis unde doloremque sint fuga laborum ducimus deserunt quasi quibusdam alias? Cupiditate beatae blanditiis quas quisquam ipsam quod necessitatibus accusantium! Excepturi accusamus sint a architecto veniam mollitia ipsam nulla tempora consectetur atque nobis cumque quisquam nam aspernatur doloremque quos suscipit delectus, quidem itaque fuga deserunt animi at. Non, minus praesentium. Atque, commodi. Voluptas, ipsum iure tempora repellat sint sapiente doloremque temporibus fugit, quas qui error neque impedit dicta reprehenderit cumque. Repudiandae consequuntur cupiditate dolor aut.",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        )
      ],
    );
  }
}
