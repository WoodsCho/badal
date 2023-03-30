import 'package:badal/common/const/colors.dart';
import 'package:badal/common/const/data.dart';
import 'package:badal/restaurant/model/restaurant_model.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final Widget image;

  //이미지
  final String name;

  //레스토랑 이름
  final List<String> tags;

  // 레스토랑 태그
  final int ratingsCount;

  //평점 갯수
  final int deliveryTime;

  //배송시간
  final int deliveryFee;

  //배송료
  final double ratings;

  final bool isDetail;

  final String? detail;

  //평균 평점
  const RestaurantCard({
    required this.image,
    //이미지
    required this.name,
    //레스토랑 이름
    required this.tags,
    // 레스토랑 태그
    required this.ratingsCount,
    //평점 갯수
    required this.deliveryTime,
    //배송시간
    required this.deliveryFee,
    //배송료
    required this.ratings,
    this.isDetail = false,
    this.detail,
    Key? key,
  }) : super(key: key);

  factory RestaurantCard.fromModel({
    required RestaurantModel model,
    bool isDetail = false,
  }) {
    return RestaurantCard(
      image: Image.network(
        model.thumbUrl,
        fit: BoxFit.cover,
      ),
      name: model.name,
      tags: model.tags,
      ratingsCount: model.ratingsCount,
      deliveryTime: model.deliveryTime,
      deliveryFee: model.deliveryFee,
      ratings: model.ratings,
      isDetail: isDetail,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          if (isDetail) image,
          if (!isDetail)
            ClipRRect(
              borderRadius: BorderRadius.circular((12.0)),
              child: image,
            ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isDetail ? 16.0 : 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  tags.join(' · '),
                  style: TextStyle(color: bodyTextColor),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    _IconText(icon: Icons.star, label: ratings.toString()),
                    renderDot(),
                    _IconText(
                        icon: Icons.receipt, label: ratingsCount.toString()),
                    renderDot(),
                    _IconText(
                        icon: Icons.timelapse_outlined,
                        label: '$deliveryTime 분'),
                    renderDot(),
                    _IconText(
                        icon: Icons.monetization_on,
                        label:
                            '${deliveryFee == 0 ? '무료' : deliveryFee.toString()}')
                  ],
                ),
                if (detail != null && isDetail)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(detail!),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

renderDot() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 4.0),
    child: Text(
      '·',
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.0),
    ),
  );
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconText({
    required this.icon,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: priMaryColor,
          size: 14.0,
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
