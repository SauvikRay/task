import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:softic_task/constants/app_constants.dart';
import 'package:softic_task/helpers/routes.dart';
import 'package:softic_task/helpers/space_helper.dart';
import 'package:softic_task/services/navigation_service.dart';

import '../data/product_repository.dart';
import 'product_card.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  ProductRepository repo = ProductRepository();
  Future<void> onRefresh() async {
    await repo.fetchAllProductsResponse();
    if (mounted) {
      setState(() {
        repo.product;
      });
    }
  }

  final ImagePicker _imagePicker = ImagePicker();
  Uint8List? bytes;
  Uint8List? byy;

  void pickImage() async {
    if (await Permission.camera.request().isGranted) {
     final xFile = await _imagePicker.pickImage(
          source: ImageSource.camera, maxHeight: 512, maxWidth: 512);

      if (xFile != null) {
        byy = await xFile.readAsBytes();
        setState(() {
          bytes=byy;
        });
      }
      log(bytes.toString());
    }
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    final profileImage = storage.read(kKeyUserImage);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Product List',
          ),
          backgroundColor: Colors.orange,
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  NavigationService.navigateTo(Routes.profile);
                },
                child: Container(
                  height: 75.w,
                  width: 75.w,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('$profileImage'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: FutureBuilder(
          future: repo.fetchAllProductsResponse(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (repo.product.contains('empty')) {
                return const Center(child: Text('no data'));
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    childAspectRatio: 4 / 7.3,
                  ),
                  itemCount: repo.product.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      repo: repo,
                      index: index,
                    );
                  },
                );
              }
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(child: CircularProgressIndicator()),
                ],
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          showModalBottomSheet(
            context: context,
            builder: (context) {
              // return StatefulBuilder(
              //   builder: (context, setState) {
          return Container(
                  height: 300,
                  child: Column(
                    children: [
                      SpaceHelper.verticalSpaceSmall,
                      const SizedBox(
                        height: 20,
                      ),
                      StatefulBuilder(
                        builder: (context, setState) {
                          setState((){
                            bytes;
                          });
                     return   Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            bytes != null
                                ? Image.memory( bytes!, height: 150,width: 150,)
                                : Image.network(
                                    'https://png.pngtree.com/png-vector/20210604/ourmid/pngtree-gray-network-placeholder-png-image_3416659.jpg',
                                    height: 150,
                                    width: 150,
                                  ),
                          ],
                        );
            }),
                    
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.camera,
                              size: 20.sp,
                            ),
                            onPressed: () {
                              pickImage();
                            },
                          ),
                          const Spacer(),
                          IconButton(
                            icon: Icon(
                              Icons.browse_gallery,
                              size: 20.sp,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    
                    ],
                  ),
                );
              
            // });
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
