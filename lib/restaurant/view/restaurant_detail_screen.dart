import 'package:badal/common/lay%20out/default_layout.dart';
import 'package:badal/product/component/product_card.dart';
import 'package:badal/restaurant/component/restaurnat_card.dart';
import 'package:flutter/material.dart';

class RestaurantDetaileScreen extends StatelessWidget {
  const RestaurantDetaileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: '불타는 떡볶이',
        child: Column(
          children: [
            RestaurantCard(
                image: Image.asset('asset/img/food/ddeok_bok_gi.jpg'),
                name: '불타는 떡볶이',
                tags: ['떡볶이', '맛있음', '치즈'],
                ratingsCount: 100,
                deliveryTime: 30,
                deliveryFee: 3000,
                ratings: 4.76,
                isDetail: true,
                detail: '맛있는 떡볶이'),
            ProductCard()
          ],
        ));
  }
}