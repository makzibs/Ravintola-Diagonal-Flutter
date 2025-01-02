import 'package:flutter/material.dart';
import 'package:ravintola_diagonal/widgets/custom_app_bar.dart';
import 'package:ravintola_diagonal/widgets/drawer_widget.dart';

class EarnedCouponScreen extends StatelessWidget {
  const EarnedCouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: CustomAppBar(),
      body: Container(
        child: Text("hello"),
      ),
    );
  }
}
