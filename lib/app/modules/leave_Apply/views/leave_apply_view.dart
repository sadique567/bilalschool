import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/leave_apply_controller.dart';

class LeaveApplyView extends GetView<LeaveApplyController> {
  const LeaveApplyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LeaveApplyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LeaveApplyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
