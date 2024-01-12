class useraddedpizza {
  String title;
  String image;
  int count;
  int price;
  bool isFavourite;
  useraddedpizza(
      {required this.image,
      required this.count,
      required this.price,
      required this.title,
      required this.isFavourite});
  //getter methods
  int getCount() {
    return count;
  }

  int getPrice() {
    return price;
  }
}
