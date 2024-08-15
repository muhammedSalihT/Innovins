import "package:flutter/material.dart";
import "package:flutterinterviewproject/common/app_colors.dart";
import "package:flutterinterviewproject/common/app_text_form_field.dart";
import "package:flutterinterviewproject/controllers/product_detail_controller.dart";
import "package:get/get.dart";
import "package:velocity_x/velocity_x.dart";

class ProductDetailScreen extends GetView<ProductDetailController> {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.appWhiteColor,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: AppColors.appWhiteColor,
          ),
          onPressed: Get.back,
        ),
        backgroundColor: AppColors.appPrimeryColor,
        title: "Product Details".text.base.make(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                AppTextFormField(
                  controller: controller.nameController,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    return (GetUtils.isNullOrBlank(value) ?? true)
                        ? "Product Name required"
                        : null;
                  },
                  enabled: true,
                  labelText: "Product Name",
                  hintText: "Enter Product Name",
                ),
                AppTextFormField(
                  controller: controller.moqController,
                  keyboardType: TextInputType.number,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    return (GetUtils.isNullOrBlank(value) ?? true)
                        ? "MOQ is required"
                        : null;
                  },
                  enabled: true,
                  labelText: "MOQ",
                  hintText: "Enter MOQ",
                ),
                AppTextFormField(
                  controller: controller.priceController,
                  keyboardType: TextInputType.phone,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    return (GetUtils.isNullOrBlank(value) ?? true)
                        ? "Price required"
                        : null;
                  },
                  enabled: true,
                  labelText: "Price",
                  hintText: "Enter Price",
                  suffixIcon: const SizedBox(),
                ),
                AppTextFormField(
                  controller: controller.discountedController,
                  keyboardType: TextInputType.number,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.done,
                  validator: (String? value) {
                    return (GetUtils.isNullOrBlank(value) ?? true)
                        ? "Discount Price required"
                        : null;
                  },
                  enabled: true,
                  labelText: "Discount Price",
                  hintText: "Enter Discount Price",
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState?.validate() ??
                          false) {
                        if (controller.Id == "") {
                          await controller.addProductApi();
                        } else {
                          await controller.updateProductApi();
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appPrimeryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        controller.Id == "" ? "Add Product" : "Update Product",
                        style: const TextStyle(
                          color: AppColors.appWhiteColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ).pSymmetric(h: 12, v: 50),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
