import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homePageController.dart';

class Searchlocationpage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Choose Destination', style: TextStyle(fontWeight: FontWeight.w300)),centerTitle: true,),
        body: Obx((){
          return Container(
            margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 20),
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  cursorColor: Colors.deepOrange,
                  style: const TextStyle(color: Colors.black),
                  controller: controller.searchController,
                  onChanged: (value){
                    controller.searchLocation.value = value;
                    if (value.trim().length >= 3) {
                      controller.onChangeDestination(value);
                    } else {
                      controller.searchResultList.clear();
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white10,
                    hintText: 'Search by address',
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange,width: 2.0),),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),),
                  ),
                ),
                const SizedBox(height: 20,),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.searchResultList.length,
                    itemBuilder: (context, index){
                      final place = controller.searchResultList[index].description ?? '';
                      return ListTile(
                        onTap: (){
                          controller.onTapSearchLocation(controller.searchResultList[index].placeId ?? '');
                          Get.back();
                        },
                        title: Text(place, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                        leading: const Icon(Icons.location_on_rounded, color: Colors.deepOrange,),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

}




