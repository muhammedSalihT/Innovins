import "package:flutter/material.dart";
import "package:flutterinterviewproject/common/app_colors.dart";
import "package:flutterinterviewproject/routes/Route.dart";
import "package:get/get.dart";

class StaticProductListScreen extends StatelessWidget {
  const StaticProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                width: double.infinity,
                height: 250,
                child: Image.asset(
                  "assets/image/tree.png",
                  height: 220,
                  fit: BoxFit.fill,
                ),
              ),
              _topBarWidget(),
            ],
          ),
          _filterListViewWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 15,
                ),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return _showProductsCard(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  SafeArea _topBarWidget() {
    return SafeArea(
      child: SizedBox(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: Get.back,
                child: const Icon(Icons.arrow_back_ios_rounded),
              ),
              const Text(
                "Vegetables",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
              const SearchBar(
                shadowColor: WidgetStatePropertyAll(AppColors.appWhiteColor),
                backgroundColor:
                    WidgetStatePropertyAll(AppColors.appWhiteColor),
                hintText: "Search",
                leading: Icon(
                  Icons.search,
                  color: Colors.black87,
                ),
                shape: WidgetStatePropertyAll(
                  StadiumBorder(
                    side: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _filterListViewWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          height: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              2,
              (int inx) => Wrap(
                spacing: 8,
                runSpacing: 12,
                children: List.generate(
                  10,
                  (int index) => Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: inx == 0 && index == 0
                          ? AppColors.appPrimeryColor.shade100
                          : AppColors.appWhiteColor,
                    ),
                    child: Row(
                      children: <Widget>[
                        if (inx == 0 && index == 0)
                          const Icon(
                            Icons.check_rounded,
                            color: AppColors.appPrimeryColor,
                          ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            "Cabbage and lettuce (${index + 15})",
                            style: TextStyle(
                              fontSize: 20,
                              color: inx == 0 && index == 0
                                  ? AppColors.appPrimeryColor
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _showProductsCard(int index) {
    final String image = <String>[
      "assets/image/img1.png",
      "assets/image/img2.png",
      "assets/image/img3.png",
    ][index];
    final String name = <String>[
      "Lettuce",
      "Cauliflower",
      "Cabage",
    ][index];
    final String price = <String>[
      "1.85",
      "1.6",
      "1.4",
    ][index];

    return InkWell(
      onTap: () async {
        await Get.toNamed(
          RouteName.staticProductDetailsScreen,
          arguments: <Map<String, String>>[
            <String, String>{"image": image},
            <String, String>{"name": name},
            <String, String>{"price": price},
          ],
        );
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    image,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Text(
                      " € / piece",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.favorite_outline,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.appSecondryColor,
                        ),
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          color: AppColors.appWhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
