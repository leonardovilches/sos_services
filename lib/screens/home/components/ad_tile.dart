import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sos_services/models/ad.dart';
import 'package:sos_services/helpers/extensions.dart';

class AdTile extends StatelessWidget {
  AdTile(this.ad);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          height: 120,
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 8,
            child: Row(
              children: [
                SizedBox(
                  height: 135,
                  width: 127,
                  child: CachedNetworkImage(
                    imageUrl: ad.images.isEmpty
                        ? 'https://static.thenounproject.com/png/194055-200.png'
                        : ad.images.first,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ad.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          ad.price.formattedMoney(),
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '${ad.createDate.formattedDate()} - '
                          '${ad.address.city.name} - '
                          '${ad.address.uf.initials}',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
