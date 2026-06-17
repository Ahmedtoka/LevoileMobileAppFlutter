class ListingRegion {
  String? id;
  String? name;
  String? slug;
  String? description;

  ListingRegion.fromMyListingJson(json) {
    id = json['term_id']?.toString();
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
  }
}
