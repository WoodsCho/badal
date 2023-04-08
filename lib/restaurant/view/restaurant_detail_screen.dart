import 'package:badal/common/const/data.dart';
import 'package:badal/common/lay%20out/default_layout.dart';
import 'package:badal/product/component/product_card.dart';
import 'package:badal/restaurant/component/restaurnat_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestaurantDetaileScreen extends StatelessWidget {
  final String id;

  const RestaurantDetaileScreen({required this.id, Key? key}) : super(key: key);

  Future getRestaurantDetail() async {
    final dio = Dio();
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final resp = await dio.get(
      'http://$ip/restaurant/$id',
      options: Options(
        headers: {
          'authorization': 'Bearer $accessToken',
        },
      ),
    );
    return resp;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: '불타는 떡볶이',
        child: FutureBuilder(
          future: getRestaurantDetail(),
          builder: (_, snapshot) {
            print(snapshot.data);
            return CustomScrollView(
              slivers: [
                renderTop(),
                renderLabel(),
                renderProducts(),
              ],
            );
          },
        ));
  }

  SliverPadding renderLabel() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          '메뉴',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  renderProducts() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ProductCard(),
          );
        }, childCount: 10),
      ),
    );
  }

  SliverToBoxAdapter renderTop() {
    return SliverToBoxAdapter(
      child: RestaurantCard(
          image: Image.asset('asset/img/food/ddeok_bok_gi.jpg'),
          name: '불타는 떡볶이',
          tags: ['떡볶이', '맛있음', '치즈'],
          ratingsCount: 100,
          deliveryTime: 30,
          deliveryFee: 3000,
          ratings: 4.76,
          isDetail: true,
          detail: '맛있는 떡볶이'),
    );
  }
}
