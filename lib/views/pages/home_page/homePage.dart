import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sisutaxi/views/pages/home_page/searchLocationPage.dart';

import '../../../consts/app_images.dart';
import 'homePageController.dart';

class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx((){
          return Container(
            margin: const EdgeInsets.only(bottom: 250),
            child: GoogleMap(
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              markers: Set<Marker>.of(controller.marker),
              polylines: Set<Polyline>.of(controller.polyline),
              mapType: MapType.normal,
              onLongPress: controller.addDestinationMarker,
              initialCameraPosition: controller.kGooglePlex,
              onMapCreated: (GoogleMapController map) {
                DefaultAssetBundle.of(context).loadString(AppImages.themes)
                    .then((value)=> map.setMapStyle(value));
                controller.mapController.complete(map);
              },
            ),
          );
        }),
        bottomSheet: Obx((){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 70,
                margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                padding: const EdgeInsets.only(top: 8, left: 18, right: 18, bottom: 8),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: controller.isDestinationSelect.isTrue ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(controller.duration.value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrange),),
                    Text(controller.distance.value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrange),),
                    Text(controller.price.value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrange),),
                  ],
                ): const Center(
                  child: Text('Long press on map to select destination', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                ),

              ),
              SizedBox(height: 10),
              Container(
                height: 265,
                margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 8),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Row(
                        children: [
                          Image(image: AssetImage(AppImages.pin), height: 20, width: 20),
                          SizedBox(width: 4,),
                          Text('Pick up', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrange),),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Text(controller.pickup.value, style: TextStyle(fontSize: 18, fontWeight:FontWeight.w300),),
                      SizedBox(height: 8,),
                      Divider(color: Colors.black54,thickness: 0.2,),
                      GestureDetector(
                        onTap: (){
                          Get.dialog(Searchlocationpage());
                          controller.searchController.clear();
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image(image: AssetImage(AppImages.des), height: 16, width: 16),
                                SizedBox(width: 4,),
                                Text('Destination', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrange),),
                              ],
                            ),
                            SizedBox(height: 4,),
                            Text(controller.destination.value, style: TextStyle(fontSize: 18, fontWeight:FontWeight.w300 ),),
                          ],
                        )
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 60,
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child:const Center(child: Text('Book Taxi', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

}




