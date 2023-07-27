import 'package:assignment/model/mobile_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class MobileCard extends StatefulWidget {
  final Mobile mobile;
  const MobileCard({super.key, required this.mobile});

  @override
  State<MobileCard> createState() => _MobileCardState();
}

class _MobileCardState extends State<MobileCard> {
  void likeFunction() {
    setState(() {
      widget.mobile.isLiked = !widget.mobile.isLiked;
    });
  }

  String formatIndianCurrency(int number) {
    final NumberFormat format = NumberFormat('##,##,##,###');
    return '₹ ' + format.format(number);
  }

  String formatDate(String dateStr) {
    DateTime date = DateFormat('dd/MM/yyyy').parse(dateStr);
    int day = date.day;
    String suffix = day % 10 == 1 && day % 100 != 11
        ? 'st'
        : day % 10 == 2 && day % 100 != 12
            ? 'nd'
            : day % 10 == 3 && day % 100 != 13
                ? 'rd'
                : 'th';
    String formattedDate = DateFormat('MMM d').format(date);
    return '$formattedDate$suffix';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Card(
        elevation: 0,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.23,
                  child: CachedNetworkImage(
                    imageUrl: widget.mobile.images![1],
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Container(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "${formatIndianCurrency(widget.mobile.listingNumPrice ?? 0)}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.mobile.model ?? "",
                        style: TextStyle(fontSize: 11),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '''${widget.mobile.deviceStorage}''',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.grey[700]),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '''Condition:${widget.mobile.deviceCondition}''',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.mobile.listingLocation ?? "",
                              style: TextStyle(
                                  fontSize: 11, color: Colors.grey[700]),
                            ),
                          ),
                          Text(
                            "${formatDate(widget.mobile.listingDate ?? "")}",
                            style: TextStyle(
                                fontSize: 11, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              child: IconButton(
                splashColor: Colors.transparent,
                onPressed: () {
                  likeFunction();
                  Fluttertoast.showToast(
                    msg: widget.mobile.isLiked
                        ? "Added to Liked Category"
                        : "Removed from Liked Category",
                  );
                },
                icon: Icon(
                  widget.mobile.isLiked
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
