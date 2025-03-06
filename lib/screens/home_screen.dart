import 'package:flutter/material.dart';
import 'package:zeto_grocery_app/data/biscuits_product_datas.dart';
import 'package:zeto_grocery_app/data/categ_to_explore_images.dart';
import 'package:zeto_grocery_app/data/choco_product_datas.dart';
import 'package:zeto_grocery_app/data/frozen_food_datas.dart';
import 'package:zeto_grocery_app/data/fruits_product_datas.dart';
import 'package:zeto_grocery_app/data/grid_images.dart';
import 'package:zeto_grocery_app/data/heading_and_title.dart';
import 'package:zeto_grocery_app/data/slider_images.dart';
import 'package:zeto_grocery_app/data/snacks_products_datas.dart';
import 'package:zeto_grocery_app/data/trending_products_data.dart';
import 'package:zeto_grocery_app/data/veg_products-datas.dart';
import 'package:zeto_grocery_app/widgets/cate_toExplore_details.dart';
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
  Widget trendingProducts() {
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
  Widget categories() {
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

  //vasitables
  Widget vagetables() {
    return Container(
        height: 185,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: vegProducds.length,
              itemBuilder: (context, index) {
                return viewProductsdetails(
                  vegProducds[index].productimage,
                  vegProducds[index].productname,
                  vegProducds[index].netweight,
                  vegProducds[index].oldprice.toString(),
                  vegProducds[index].newprice,
                  // frozenProducts[index].offer.toString(),
                );
              }),
        ));
  }

  // Categories to explore
  Widget categoriesToExplore() {
    return Container(
        height: 190,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cateExplore1.length,
              itemBuilder: (context, index) {
                return cateToExploreprdct(
                  cateToExploretitle1[index],
                  cateExplore1[index],
                );
              }),
        ));
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
            imageSlider(imgSliderList),
            searchBar(),
            titlebar(titles.title1, "SeeMore >"), //trending products
            trendingProducts(),
            titlebar(titles.title2, "SeeMore >"), //categories
            categories(),
            titlebar(titles.title3, ""), //top collection slider
            topCollectionSlider(),
            titlebar(titles.title4, "SeeMore >"), //frozen foods
            frozenProductsContainer(),
            titlebar(titles.title5, "SeeMore >"), //Gudness Of Fruits
            gudnessOfFruits(),
            titlebar(titles.title6, ""), //In Focus Today slider
            inFocusTodaySlider(),
            titlebar(titles.title7, "SeeMore >"), //Vagetables
            vagetables(),
            titlebar(titles.title8, ""), //Categories to explore
            categoriesToExplore(),
            titlebar(titles.title9, ""), //Season's Top Pick!
            Container(
                height: 190,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cateExplore2.length,
                      itemBuilder: (context, index) {
                        return cateToExploreprdct(
                            cateToExploretitle2[index], cateExplore2[index]);
                      }),
                )),
            titlebar(titles.title10, "SeeMore >"),
            Container(
                height: 185,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: biscuitsProducds.length,
                      itemBuilder: (context, index) {
                        return viewProductsdetails(
                          biscuitsProducds[index].productimage,
                          biscuitsProducds[index].productname,
                          biscuitsProducds[index].netweight,
                          biscuitsProducds[index].oldprice.toString(),
                          biscuitsProducds[index].newprice,
                          // frozenProducts[index].offer.toString(),
                        );
                      }),
                )),
            titlebar(titles.title11, "SeeMore >"),
            Container(
                // margin: EdgeInsets.symmetric(vertical: 10),
                height: 185,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: chocoProducds.length,
                      itemBuilder: (context, index) {
                        return viewProductsdetails(
                          chocoProducds[index].productimage,
                          chocoProducds[index].productname,
                          chocoProducds[index].netweight,
                          chocoProducds[index].oldprice.toString(),
                          chocoProducds[index].newprice,
                          // frozenProducts[index].offer.toString(),
                        );
                      }),
                )),
            titlebar(titles.title12, "SeeMore >"),
            Container(
                height: 185,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snacksProducds.length,
                      itemBuilder: (context, index) {
                        return viewProductsdetails(
                          snacksProducds[index].productimage,
                          snacksProducds[index].productname,
                          snacksProducds[index].netweight,
                          snacksProducds[index].oldprice.toString(),
                          snacksProducds[index].newprice,
                          // frozenProducts[index].offer.toString(),
                        );
                      }),
                )),
            Container(
              height: 120,
            )
          ],
        ),
      ),
    );
  }
}
