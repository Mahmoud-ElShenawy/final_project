import 'package:final_project/controller/home_controller.dart';
import 'package:final_project/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController hController = HomeController();

  @override
  void initState() {
    super.initState();
    hController.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
        ),
        backgroundColor: Colors.indigo[800],
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder<List<ProductModel>>(
            future: hController.getProduct(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? productsList()
                  : snapshot.hasError
                      ? errorWidget()
                      : loadingWidget();
            },
          ),
        ],
      ),
    );
  }

  Widget productsList() => Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          itemCount: hController.productsList.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      hController.productsList[index].image ?? '',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.black.withOpacity(0.4),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.9),
                          ],
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            hController.productsList[index].title ?? '',
                            style: TextStyle(
                              color: Colors.yellow[700],
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFBC02D).withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        hController.productsList[index].price.toString(),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget errorWidget() => const Text(
        'Sorry, Something went wrong',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.red,
          fontSize: 16,
        ),
      );

  Widget loadingWidget() => const CupertinoActivityIndicator();
}
