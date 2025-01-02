import 'package:flutter/material.dart';
import 'package:ravintola_diagonal/widgets/custom_app_bar.dart';
import 'package:ravintola_diagonal/widgets/drawer_widget.dart';


class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        drawer: const DrawerWidget(),
        appBar: CustomAppBar(),
        body: Container(
          child: Column(
            children: [
              Text("hi Anil"),
              Text("data")
            ],
          ),
        )
      );

  }
}
