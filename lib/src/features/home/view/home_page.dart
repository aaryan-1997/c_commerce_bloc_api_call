import 'package:c_commerce_bloc_api_call/src/features/home/bloc/home_bloc.dart';
import 'package:c_commerce_bloc_api_call/src/features/home/models/product.dart';
import 'package:c_commerce_bloc_api_call/src/util/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categoryList = [];
  List<Product> productList = [];
  HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeProductFetchEvent());
    homeBloc.add(HomeCategoryFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          BlocConsumer<HomeBloc, HomeState>(
              bloc: homeBloc,
              listener: (context, state) {
                if (state is HomeLoadingState) {
                 // AppUtils().showLoader(context);
                }
                if (state is HomeProductSuccessState) {
                 // AppUtils().hideLoader(context, true);
                  productList = state.prductList;
                }
                if (state is HomeCategorySuccessState) {
                  //AppUtils().hideLoader(context, true);
                  categoryList = state.categoryList;
                }
                if (state is HomeErrorState) {
                 // AppUtils().hideLoader(context, true);
                }
              },
              builder: (context, state) {
                return Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: ListView.builder(
                          itemCount: categoryList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            height: 50,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 2.5),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              categoryList[index].toUpperCase(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          itemCount: productList.length,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.80,
                          ),
                          itemBuilder: (context, index) {
                            var product = productList[index];
                            return Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 0.1, color: Colors.grey),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    image: NetworkImage(product.image),
                                    height: 130,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.title,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "Rs.${product.price}",
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: AppUtils()
                                                  .getRatingStars(
                                                      rating:
                                                          product.rating.rate *
                                                              2,
                                                      starSize: 15),
                                            ),
                                            Text(
                                              "(${product.rating.count})",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
