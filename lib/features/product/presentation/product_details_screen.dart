
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:softic_task/helpers/space_helper.dart';

import '../data/product_repository.dart';

class ProductsDetails extends StatefulWidget {
  const ProductsDetails({super.key});

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  @override
  Widget build(BuildContext context) {
    Map repo = ModalRoute.of(context)!.settings.arguments as Map;
    // log("Arguem ${repo['id']}");
    return Scaffold(
      body: Hero(
        tag: 'product${repo['id']}',
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics:const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Image.network('${repo['image']}'),
              SpaceHelper.verticalSpaceSmall,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
               Text('${repo['name']}'),
              SpaceHelper.verticalSpaceSmall,
              Text('${repo['description']}',
             
              ),
              SpaceHelper.verticalSpaceMedium,
              Text('${repo['subCategory']['category']['name']}',
            
              ),  
            SpaceHelper.verticalSpaceMedium,
              Row(
                children: [
                 const Text('Brand',),
                  const Spacer(),
                  Text('${repo['brand']['name']}',),
                ],
              ),
              
                ],),
              ),
             
            
            ]),
        ),
    ));
  }
}