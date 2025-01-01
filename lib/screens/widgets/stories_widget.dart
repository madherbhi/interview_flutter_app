import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StoriesTab extends StatefulWidget {
  const StoriesTab({super.key});

  @override
  State<StoriesTab> createState() => _StoriesTabState();
}

class _StoriesTabState extends State<StoriesTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 16,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${"Title"} ${index + 1}',
                    style: const TextStyle(
                      fontSize: 14,
                      letterSpacing: 1,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    )),
                const Gap(10),
                const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean mattis sed nibh quis consequat, Cras pulvinar dolor at ante dignissim implerdiet. Suspenndisse posuere massa non nulla scelerisque vestibulum. Duis id pulvinar lavus, eget molestie orci. Aliquam pulvinar eu tellus quis vulputate",
                    style: TextStyle(fontSize: 12, letterSpacing: 0.5)),
              ],
            ),
          ),
        );
      },
    );
  }
}
