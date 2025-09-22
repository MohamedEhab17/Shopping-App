import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});
  static const routeName = '/product_details';
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductEntity;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 331,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: product.images[index],
                        );
                      },
                      autoplay: true,
                      itemCount: product.images.length,
                      pagination: const SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                          color: Color(0xffD9D3E1),
                          activeColor: Colors.black,
                        ),
                      ),
                      // control: const SwiperControl(),//! arrows
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: CircleBorder(),
                    ),
                    icon: Icon(IconlyBold.heart, color: Colors.red),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      product.title * 5,
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'EGP ${product.price}',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Text(
                product.description,
                style: TextStyle(
                  color: Color(0xff5C5C5C),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 42),
            MaterialButton(
              minWidth: double.infinity,
              height: 50,
              onPressed: () {},
              color: Color(0xff212121),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Add to cart",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
            SizedBox(height: kBottomNavigationBarHeight),
          ],
        ),
      ),
    );
  }
}
