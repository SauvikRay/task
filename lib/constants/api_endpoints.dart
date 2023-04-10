const String baseUrl="https://secure-falls-43052.herokuapp.com";


class Endpoints{
  static String postLogin()=> "/api/authenticate";
  static String getProductList(String page,String size)=> "/api/products?page=$page&size=$size";
  static String getProfileApi()=> "/api/account";
  static String productDeleteApi(int id)=> "/api/products/$id";
  static String productCreateApi()=> "/api/create-products";

}