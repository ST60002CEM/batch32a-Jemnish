import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/app/constants/api_endpoint.dart';
import 'package:kheti_pati/features/product/presentation/viewmodel/product_view_model.dart';

class ProductView extends ConsumerStatefulWidget {
  const ProductView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<ProductView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productViewModelProvider);

    return NotificationListener<ScrollEndNotification>(
      onNotification: (notification) {
        if (_scrollController.position.extentAfter == 0) {
          ref.read(productViewModelProvider.notifier).getAllProducts();
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xffE1FCF9),
        appBar: AppBar(
          title: const Text('Products'),
          actions: [
            TextButton.icon(
              onPressed: () {
                ref.read(productViewModelProvider.notifier).resetState();
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: const Text(
                'Refresh',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          color: Colors.green,
          onRefresh: () async {
            ref.read(productViewModelProvider.notifier).resetState();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: state.products.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final products = state.products[index];

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              width: 0.9 * MediaQuery.of(context).size.width,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Image.network(
                                              'http://${ApiEndpoints.urls}:5000/products/${products.productImage}',
                                              width: 150,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 0.45 *
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              products.productTitle,
                                              style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              products.productDescription,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'Rs.${products.productPrice}',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Color(0xff009445),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                if (state.isLoading)
                  const CircularProgressIndicator(
                      color: Color.fromARGB(255, 255, 255, 255)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
