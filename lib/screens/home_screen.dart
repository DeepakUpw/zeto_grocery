import 'package:flutter/material.dart';
import 'package:zeto_grocery_app/data/frozen_food_datas.dart';
import 'package:zeto_grocery_app/data/fruits_product_datas.dart';
import 'package:zeto_grocery_app/data/grid_images.dart';
import 'package:zeto_grocery_app/data/heading_and_title.dart';
import 'package:zeto_grocery_app/data/trending_products_data.dart';
import 'package:zeto_grocery_app/widgets/grid_product_details.dart';
import 'package:zeto_grocery_app/widgets/home_app_bar.dart';
import 'package:zeto_grocery_app/widgets/image_slider.dart';
import 'package:zeto_grocery_app/widgets/search_bar.dart';
import 'package:zeto_grocery_app/widgets/title_bar.dart';
import 'package:zeto_grocery_app/widgets/top_collection_slider.dart';
import 'package:zeto_grocery_app/widgets/view_product_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //trending products catelog container
  Widget trendingProductsContainer() {
    return Container(
      height: 185,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trendingProducds.length,
            itemBuilder: (context, index) {
              return viewProductsdetails(
                trendingProducds[index].productimage,
                trendingProducds[index].productname,
                trendingProducds[index].netweight,
                trendingProducds[index].oldprice.toString(),
                trendingProducds[index].newprice,
                // trendingProducds[index].offer.toString(),
              );
            }),
      ),
    );
  }

  //categorys catelog container
  Widget categoriesContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 500,
      // height: 700,
      // color: Colors.red,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: 3,
          ),
          itemCount: gridImages.length,
          itemBuilder: (context, index) {
            return gridProductsView(gridHead[index], gridImages[index]);
          }),
    );
  }

  //frozen food container
  Widget frozenProductsContainer() {
    return Container(
      height: 185,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: frozenProducts.length,
            itemBuilder: (context, index) {
              return viewProductsdetails(
                frozenProducts[index].productimage,
                frozenProducts[index].productname,
                frozenProducts[index].netweight,
                frozenProducts[index].oldprice.toString(),
                frozenProducts[index].newprice,
                // frozenProducts[index].offer.toString(),
              );
            }),
      ),
    );
  }

  //Gudness Of Fruits container
  Widget gudnessOfFruits() {
    return Container(
        height: 185,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: fruitsProducds.length,
              itemBuilder: (context, index) {
                return viewProductsdetails(
                  fruitsProducds[index].productimage,
                  fruitsProducds[index].productname,
                  fruitsProducds[index].netweight,
                  fruitsProducds[index].oldprice.toString(),
                  fruitsProducds[index].newprice,
                  // fruitsProducds[index].offer.toString(),
                );
              }),
        ));
  }

  //In Focus Today
  Widget inFocusTodaySlider() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          image: NetworkImage(
              "https://github.com/karun7607/Zepto-Homescreen-UI/blob/main/assets/new/products_111.jpeg?raw=true"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3EBF7),
      appBar: homeAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            imageSlider(),
            searchBar(),
            titlebar(titles.title1, "SeeMore >"), //trending products
            trendingProductsContainer(),
            titlebar(titles.title2, "SeeMore >"), //categories
            categoriesContainer(),
            titlebar(titles.title3, ""), //top collection slider
            topCollectionSlider(),
            titlebar(titles.title4, "SeeMore >"), //frozen foods
            frozenProductsContainer(),
            titlebar(titles.title5, "SeeMore >"), //Gudness Of Fruits
            gudnessOfFruits(),
            titlebar(titles.title6, ""), //In Focus Today slider
            inFocusTodaySlider(),
          ],
        ),
      ),
    );
  }
}
