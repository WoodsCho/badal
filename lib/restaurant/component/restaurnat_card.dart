import 'package:badal/common/const/colors.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final Widget image;

  //이미지
  final String name;

  //레스토랑 이름
  final List<String> tags;

  // 레스토랑 태그
  final int ratingCount;

  //평점 갯수
  final int deliveryTime;

  //배송시간
  final int deliveryFee;

  //배송료
  final double rating;

  //평균 평점
  const RestaurantCard({
    required this.image,
    //이미지
    required this.name,
    //레스토랑 이름
    required this.tags,
    // 레스토랑 태그
    required this.ratingCount,
    //평점 갯수
    required this.deliveryTime,
    //배송시간
    required this.deliveryFee,
    //배송료
    required this.rating,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular((12.0)),
            child: image,
          ),
          SizedBox(height: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              Text(tags.join(' · '),style: TextStyle(color: bodyTextColor),),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: priMaryColor,
                    size: 13,
                  ),
                  Text(rating.toString()),
                  Text(' · '),
                  Icon(
                    Icons.view_list_outlined,
                    color: priMaryColor,
                    size: 13,
                  ),
                  Text(ratingCount.toString()),
                  Text(' · '),

                  Text(' · ')

                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
