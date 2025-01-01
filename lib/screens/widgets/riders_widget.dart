import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_app/helpers/image_helper.dart';
import 'package:task_app/models/rider_details.dart';

class RidersTab extends StatefulWidget {
  const RidersTab({super.key});

  @override
  State<RidersTab> createState() => _RidersTabState();
}

class _RidersTabState extends State<RidersTab> {
  final List<Ride> rideList = [
    Ride(
      title: "ride to nandi hills",
      subtitle: "manish surapaneni",
      subtitlePlace: "Ducati",
      distance: "900 km",
      date: "July 20 2024",
      location: "hyderabad",
      imagePath: ImageHelper.banner,
      coRiders: "12",
    ),
    Ride(
      title: "ride to cochi hills",
      subtitle: "manish surapaneni",
      subtitlePlace: "Ducati",
      distance: "900 km",
      date: "July 20 2024",
      location: "hyderabad",
      imagePath: ImageHelper.banner,
      coRiders: "12",
    ),
    Ride(
      title: "ride to vayanad hills",
      subtitle: "manish surapaneni",
      subtitlePlace: "Ducati",
      distance: "900 km",
      date: "July 20 2024",
      location: "hyderabad",
      imagePath: ImageHelper.banner,
      coRiders: "12",
    ),
    Ride(
      title: "ride to kerela hills",
      subtitle: "manish surapaneni",
      subtitlePlace: "Ducati",
      distance: "900 km",
      date: "July 20 2024",
      location: "hyderabad",
      imagePath: ImageHelper.banner,
      coRiders: "12",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: rideList.length,
      itemBuilder: (context, index) {
        final ride = rideList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    image: DecorationImage(
                      image: AssetImage(ride.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ride.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 10, right: 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 18,
                                      child: Icon(Icons.person),
                                    ),
                                    const Gap(10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ride.subtitle,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        Text(
                                          ride.subtitlePlace,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  "Co Riders: ${ride.coRiders}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.directions, size: 16, color: Colors.red),
                                    const Gap(5),
                                    Text(
                                      ride.distance,
                                      style: const TextStyle(fontSize: 12, color: Colors.grey, letterSpacing: 0.5),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_month, size: 16, color: Colors.red),
                                    const Gap(5),
                                    Text(
                                      ride.date,
                                      style: const TextStyle(fontSize: 12, color: Colors.grey, letterSpacing: 0.5),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.location_city, size: 16, color: Colors.red),
                                    const Gap(5),
                                    Text(
                                      ride.location,
                                      style: const TextStyle(fontSize: 12, color: Colors.grey, letterSpacing: 0.5),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
