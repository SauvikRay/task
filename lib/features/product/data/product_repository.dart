import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:softic_task/constants/api_endpoints.dart';
import 'package:softic_task/constants/app_constants.dart';
import 'package:softic_task/services/api_service/dio.dart';
final storage = GetStorage();
class ProductRepository {
Box? _box;
 
  var _productDataList=[];
  List get product => _productDataList;

  openbox()async{
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    _box = await Hive.openBox('productsListData');
    return;
  }

  Future putProductsData(data)async{
    await _box!.clear();
    for(var datum in data){
      _box!.add(datum);
    }

  }
  
  Future<bool>fetchAllProductsResponse()async{
      final authToken =await storage.read(kKeyIdToken);
      await openbox();
      try{
        final response = await getHttp(Endpoints.getProductList("0","10"),authToken);
        if(response.statusCode ==200){
          // log(response.data.toString());
          List data = json.decode(json.encode(response.data));
          // log(data.toString());
          await putProductsData(data);
           var myData  = _box!.toMap().values.toList();
          if(myData.isEmpty){
            _productDataList.add('empty');
          }else {
            _productDataList = myData;
            // log("Product Details Data : ${_productDataList}");
          }
        } 

        }catch(e) {
            debugPrint('No Internet');
        }
        return Future.value(true);
    }


    createproduct()async{
        final authToken =await storage.read(kKeyIdToken);
        try{
          Map data = {
          "name": "dfsdfsdf",
          "barcode": "45456",
          "description": "string",
          "image": "string",
          "subCategory": 0,
          "brand": 0,
          "quantity": {
          "quantity": 0,
          "unit": "string",
          "unitValue": 0,
          "pastQuantity": 0
        },
        "productPrice": {"price": 12, "unitPrice": 52, "mrp": 20}
      };
          final response = await postHttp(Endpoints.productCreateApi(),data);
          if(response.statusCode==200){
            log(response.data.toString());
          }

        }catch(e){
          log(e.toString());
        }

    }

deleteProduct(int productId)async{
   final authToken =await storage.read(kKeyIdToken);
   try{
    final response = await deleteHttp(Endpoints.productDeleteApi(productId),authToken);
    log(response.data.toString());
    _box!.clear();
    await ProductRepository().fetchAllProductsResponse();
    
   }catch(e){
    log(e.toString());
   }

}
   
}


