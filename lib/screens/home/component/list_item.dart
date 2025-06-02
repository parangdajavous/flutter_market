import 'package:flutter/cupertino.dart';
import 'package:flutter_market/core/my_util.dart';
import 'package:flutter_market/models/product.dart';

class ListItem extends StatelessWidget {
  const ListItem({required this.p});

  final Product p;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Container(
        height: 115,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://picsum.photos/id/237/200/300", // p.urlToImage
                width: 115,
                height: 115,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Container(
                height: 115,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${p.title}"),
                    Text("${p.address} • ${p.publishedAt}"),
                    Text("${p.price.toMoney()}원"),
                    Spacer(),
                    Row(
                      children: [
                        Spacer(),

                        Icon(CupertinoIcons.chat_bubble_2),
                        Text("${p.commentsCount}"),
                        SizedBox(width: 8),
                        Icon(CupertinoIcons.heart),
                        Text("${p.heartCount}"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
