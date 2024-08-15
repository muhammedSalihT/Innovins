import "package:flutter/material.dart";
import "package:flutterinterviewproject/common/app_colors.dart";
import "package:flutterinterviewproject/controllers/products_controller.dart";
import "package:flutterinterviewproject/models/product_list_model.dart";
import "package:flutterinterviewproject/routes/Route.dart";
import "package:flutterinterviewproject/services/storage_service.dart";
import "package:get/get.dart";
import "package:velocity_x/velocity_x.dart";

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  final ProductsController controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  onTap: () async {
                    await Get.toNamed(RouteName.staticProductListScreen);
                  },
                  tileColor: AppColors.appPrimeryColor,
                  leading: const Text(
                    "Static screens",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.appWhiteColor,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.appWhiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.appWhiteColor),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.appWhiteColor,
        ),
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: AppColors.appPrimeryColor,
        title: "Products".text.base.make(),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: AppColors.appWhiteColor,
            ),
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  content: const Text(
                    "Are you sure want to logout?",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: Get.back,
                      child: const Text(
                        "Cancel",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        StorageServices().clearDataAndCloseApp();
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          return controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : controller.productList.isEmpty
                  ? const Text(
                      "Nothing to found",
                      style: TextStyle(fontSize: 20),
                    ).centered()
                  : Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          height: 20,
                        ),
                        itemCount: controller.productList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final ProductList product =
                              controller.productList[index];
                          return InkWell(
                            onTap: () async {
                              await Get.toNamed(
                                RouteName.productDetailScreen,
                                arguments: <String, dynamic>{
                                  "id": product.id ?? "",
                                  "name": product.name ?? "",
                                  "moq": product.moq ?? "",
                                  "price": product.price ?? "",
                                  "discounted_price":
                                      product.discountedPrice ?? "",
                                },
                              );
                              await controller.productListApi();
                            },
                            child: Card(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Product Name: ${product.name ?? "N/a"}',
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'MOQ: ${product.moq ?? "N/a"}',
                                      style: const TextStyle(
                                        color: AppColors.appBlackColor,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      'Price:  ₹${product.price ?? "N/a"}',
                                      style: const TextStyle(
                                        color: AppColors.appBlackColor,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      'Discounted Price: ₹${product.discountedPrice ?? "N/a"}',
                                      style: const TextStyle(
                                        color: AppColors.appBlackColor,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete_outlined,
                                        color: Colors.red,
                                        size: 40,
                                      ),
                                      onPressed: () {
                                        Get.dialog(
                                          AlertDialog(
                                            content: const Text(
                                              "Are you sure want to delete this product?",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: Get.back,
                                                child: const Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  Get.back();
                                                  await controller
                                                      .productDeleteApi(
                                                    product.id ?? "",
                                                  );
                                                },
                                                child: const Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ).px8(),
                          );
                        },
                      ),
                    );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.appPrimeryColor,
        onPressed: () async {
          await Get.toNamed(RouteName.productDetailScreen);
          await controller.productListApi();
        },
        child: const Icon(
          Icons.add,
          color: AppColors.appWhiteColor,
        ),
      ),
    );
  }
}
