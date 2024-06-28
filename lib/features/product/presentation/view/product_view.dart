import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          // Scroll garda feri last ma ho ki haina bhanera check garne ani data call garne
          if (_scrollController.position.extentAfter == 0) {
            // Data fetch gara api bata
            ref.read(productViewModelProvider.notifier).getAllProducts();
          }
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Products '),
          actions: [
            TextButton.icon(
              onPressed: () {
                ref.read(productViewModelProvider.notifier).resetState();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh'),
            ),
          ],
        ),
        body: RefreshIndicator(
          // Yo chai pull to refresh ko lagi ho
          color: Colors.green,
          onRefresh: () async {
            ref.read(productViewModelProvider.notifier).resetState();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    controller: _scrollController,
                    itemCount: state.products.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final products = state.products[index];

                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                products.productId.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.network(
                                  // products.productImage,
                                  'https://i.pinimg.com/474x/74/e8/37/74e8372371b880d73ccd8132a8a0a59a.jpg',
                                  height: 200,
                                  width: 200,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else if (loadingProgress
                                            .expectedTotalBytes !=
                                        null) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.red,
                                          value: loadingProgress
                                                  .cumulativeBytesLoaded /
                                              loadingProgress
                                                  .expectedTotalBytes!,
                                        ),
                                      );
                                    } else {
                                      // If total bytes are unknown, you may want to handle it differently
                                      return const Center(
                                        child: CircularProgressIndicator(
                                            color: Colors.red),
                                      );
                                    }
                                  },
                                  errorBuilder: (BuildContext context,
                                      Object error, StackTrace? stackTrace) {
                                    return const Center(
                                      child: Text('Failed to load image'),
                                    );
                                  },
                                ),
                              ),
                              Text(
                                products.productTitle,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Data load huda feri progress bar dekhaune natra banda garne
                if (state.isLoading)
                  const CircularProgressIndicator(color: Colors.red),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
