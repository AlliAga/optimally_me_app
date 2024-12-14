import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 185,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 8,
            spreadRadius: -10,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  width: 125,
                  height: 125,
                  fit: BoxFit.cover,
                  'https://img.freepik.com/free-photo/delicious-homemade-crepe-cake-decorated-with-pomegranate-seeds-mandarins_114579-85449.jpg?t=st=1734203282~exp=1734206882~hmac=7f6b0dba73118a50d34a0a43f0e22c15816dea9c8c8da162ac4d190ec2753f42&w=1380',
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: SizedBox(
                  height: 125,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: [
                          ...["Vegetarian", "+2"].map(
                            (e) => Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color:
                                    Colors.blueGrey.shade100.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                e,
                                style: TextStyle(
                                  color: Colors.blueGrey.shade800,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.bookmark_outline,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Whole grain Pancakes with Maple Syrup",
                        textScaler: TextScaler.linear(1.25),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          {"icon": CupertinoIcons.clock, "text": "15 min"},
                          {"icon": CupertinoIcons.person, "text": "2"}
                        ]
                            .map((data) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      (data['icon'] ?? Icons.abc) as IconData?,
                                      size: 20,
                                    ),
                                    Text("${data['text']} Serving"),
                                    const SizedBox(width: 8)
                                  ],
                                ))
                            .toList(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            'By Optimally Me',
            style: Theme.of(context).textTheme.labelLarge,
          )
        ],
      ),
    );
  }
}
