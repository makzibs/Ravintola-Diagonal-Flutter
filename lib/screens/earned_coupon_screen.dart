import 'package:flutter/material.dart';
import 'package:ravintola_diagonal/widgets/custom_app_bar.dart';
import 'package:ravintola_diagonal/widgets/drawer_widget.dart';

class EarnedCouponScreen extends StatelessWidget {

  const EarnedCouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: CustomAppBar(),
      body: Center(
        child: Container(
          //color: Colors.green,
          //height: size*0.5,
          //width: size*0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Oops,',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'No free coupon yet',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
