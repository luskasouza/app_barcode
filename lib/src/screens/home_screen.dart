import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../components/constants.dart';
import '../models/register_model.dart';
import '../services/controller/register_controller.dart';
import '../services/database/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result = "";
  ControllerHome controller = Get.put(ControllerHome());
  @override
  void initState() {
    super.initState();
    controller.getRegisters();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ControllerHome controller = Get.put(ControllerHome());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBurntOrange,
        title: const Text('BARCODE'),
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async {
            await controller.getRegisters();
            Future<void>.delayed(const Duration(seconds: 3));
          },
          child: GetBuilder<ControllerHome>(
            builder: (_controller) => ListView.builder(
                itemCount: _controller.registerList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.qr_code_scanner),
                      title:
                          Text(_controller.registerList[index].code.toString()),
                    ),
                  );
                }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.qr_code_scanner),
        onPressed: () async {
          var res = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SimpleBarcodeScannerPage(),
              ));
          setState(() {
            if (res is String) {
              result = res;
            }
          });
          // RegisterController.add(code: 'code');
        },
      ),
    );
  }
}

class ControllerHome extends GetxController {
  List<Register> registerList = [];
  Future getRegisters() async {
    await read().then((items) {
      registerList.clear();
      items.asMap().forEach((i, x) {
        registerList.add(x);
      });
      update();
    });
    return registerList.toList();
  }
}
