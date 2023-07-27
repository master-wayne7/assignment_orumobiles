class Mobile {
  final String id;
  final String? deviceCondition;
  final String? listedBy;
  final String? deviceStorage;
  final List<String>? images;
  final String? defaultImage;
  final String? listingLocation;
  final String? make;
  final String? marketingName;
  final String? mobileNumber;
  final String? model;
  final bool? verified;
  final String? status;
  final String? listingDate;
  final String? deviceRam;
  final String? createdAt;
  final String? listingId;
  final int? listingNumPrice;
  final String? listingState;
  bool isLiked;

  Mobile({
    required this.id,
    this.deviceCondition,
    this.listedBy,
    this.deviceStorage,
    this.images,
    this.defaultImage,
    this.listingLocation,
    this.make,
    this.marketingName,
    this.mobileNumber,
    this.model,
    this.verified,
    this.status,
    this.listingDate,
    this.deviceRam,
    this.createdAt,
    this.listingId,
    this.listingNumPrice,
    this.listingState,
    this.isLiked = false,
  });

  factory Mobile.fromJson(Map<String, dynamic> json) {
    return Mobile(
      id: json['_id'] ?? '',
      deviceCondition: json['deviceCondition'],
      listedBy: json['listedBy'],
      deviceStorage: json['deviceStorage'],
      images: List<String>.from(
          json['images']?.map((image) => image['fullImage']) ?? []),
      defaultImage: json['defaultImage']?['fullImage'],
      listingLocation: json['listingLocation'],
      make: json['make'],
      marketingName: json['marketingName'],
      mobileNumber: json['mobileNumber'],
      model: json['model'],
      verified: json['verified'],
      status: json['status'],
      listingDate: json['listingDate'],
      deviceRam: json['deviceRam'],
      createdAt: json['createdAt'],
      listingId: json['listingId'],
      listingNumPrice: json['listingNumPrice'],
      listingState: json['listingState'],
    );
  }
}
