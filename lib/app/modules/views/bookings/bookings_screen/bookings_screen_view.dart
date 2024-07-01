import 'package:doctor_appointment/app/modules/views/bookings/bookings_screen/cancelled_tabview.dart';
import 'package:doctor_appointment/app/modules/views/bookings/bookings_screen/commleted_tabview.dart';
import 'package:doctor_appointment/app/modules/views/bookings/bookings_screen/upcmming_tabview.dart';
import 'package:doctor_appointment/widgets/buttons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controllers/bookings/bookings_screen_controller.dart';

class BookingsScreenView extends GetView<BookingsScreenController> {
  const BookingsScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.notifier = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: controller.notifier.getBgColor,
      appBar: AppBar(
        backgroundColor: controller.notifier.getBgColor,
        automaticallyImplyLeading: false,
        title: Text(
          'My Bookings',
          style: TextStyle(
            color: controller.notifier.text,
            fontSize: Get.height / 40,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [searchButton(context)],
        bottom: TabBar(
          physics: const NeverScrollableScrollPhysics(),
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          dividerColor: controller.notifier.getfillborder,
          indicatorColor: const Color(0xff0165FC),
          labelColor: const Color(0xff0165FC),
          unselectedLabelColor: Colors.grey,
          controller: controller.tabController,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 5,
          labelStyle: TextStyle(
            fontSize: Get.height / 60,
            fontWeight: FontWeight.w500,
          ),
          tabs: const [
            Tab(child: Text("Upcomming", overflow: TextOverflow.ellipsis)),
            Tab(child: Text("Commleted", overflow: TextOverflow.ellipsis)),
            Tab(child: Text("Cancelled", overflow: TextOverflow.ellipsis)),
          ],
          mouseCursor: MouseCursor.uncontrolled,
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: const [
          UpcmmingTabview(),
          CommletedTabview(),
          CancelledTabview(),
        ],
      ),
    );
  }
}
