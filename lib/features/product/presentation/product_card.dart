import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softic_task/helpers/routes.dart';
import 'package:softic_task/helpers/space_helper.dart';
import 'package:softic_task/services/navigation_service.dart';

import '../data/product_repository.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.repo,
    required this.index,
  });

  final ProductRepository repo;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationService.navigateToWithArgs(Routes.producDetails,args:repo.product[index] );
      },
      child: Card(
        elevation: 2,
        margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Hero(
                tag: 'product${repo.product[index]['id']}',
                child:  ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                   (repo.product[index]['image'] == 'string'
                    ||(repo.product[index]['image']==null)) 
                    ?'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg' 
                    :'${repo.product[index]['image']}'),),),
              Text('${repo.product[index]['name']}',
                textAlign: TextAlign.left,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16.sp,),
              ),   
              Row(
                children:[
                 const Text('Price',
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16,),
                  ),
                 const Spacer(),
                  Text('${repo.product[0]['productPrice']['price']}',
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16.sp,),
                  ),
                ],
              ),
            IconButton(
              icon:Icon( Icons.delete,size: 20.sp,color: Colors.red,),
              onPressed: ()async{
                var productId = repo.product[index]['id'];
                log(productId.toString());
                await repo.deleteProduct(productId);
              },
            ),
            ],
          ),
        ),
      ),
    );
  }
}