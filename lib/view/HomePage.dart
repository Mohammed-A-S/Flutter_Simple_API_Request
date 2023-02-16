import 'package:api_project/models/product.dart';
import 'package:api_project/view/ProductPage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget 
{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> 
{
  var dio = Dio();
  bool isLoading = true;
  Product product = Product();

  getData() async 
  {
    var response = await dio.get('https://dummyjson.com/products/');
    product = Product.fromJson(response.data);

    setState(() 
    {
      isLoading = false;
    });
  }


  @override
  void initState() 
  {
    // todo: implement initState
    super.initState();

    getData();
  }


  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        leading: const Icon(Icons.menu),
        title: const Text("Products", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
        backgroundColor: Colors.black,
      ),



      body: 
      isLoading == true ? const Center(child: CircularProgressIndicator(),) : ListView.builder
      (
        itemCount: product.products!.length,
        itemBuilder: (context, index) 
        {
          return InkWell
          (
            onTap: () 
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => product_screen
              (
                productImage: product.products![index].thumbnail!,
                productTitle: product.products![index].title!, 
                productDiscribtion: product.products![index].description!, 
                productPrise: "${product.products![index].price}", 
                productRating: "${product.products![index].rating}", 
              )));
            },
            child:Column
            (
              children: 
              [
                Card
                (
                  elevation: 10,
                  child: Column
                  (
                    children: 
                    [
                      Image.network(product.products![index].thumbnail!),
                      ListTile
                      (
                        title: Center(child: Text(product.products![index].title!, maxLines: 1, style: const TextStyle(fontSize: 20))),
                        subtitle: Text(product.products![index].description!, maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ) 
          );
        },
      ),
    );
  }
}