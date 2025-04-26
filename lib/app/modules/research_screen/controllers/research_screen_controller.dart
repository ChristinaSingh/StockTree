import 'package:get/get.dart';

class ResearchScreenController extends GetxController {
  var traders = <Trader>[
    Trader(
        name: 'Aryan Patel',
        image: 'https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png',
        rating: 4.8,
        reviews: 3279,
        trades: 10,
        experience: 10,
        online: true),
    Trader(
        name: 'Devansh Patel',
        image: 'https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png',
        rating: 4.8,
        reviews: 3279,
        trades: 10,
        experience: 10,
        online: true),
    Trader(
        name: 'Devansh Patel',
        image: 'https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png',
        rating: 4.8,
        reviews: 3279,
        trades: 10,
        experience: 10,
        online: true),
  ].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

class Trader {
  final String name;
  final String image;
  final double rating;
  final int reviews;
  final int trades;
  final int experience;
  final bool online;

  Trader({
    required this.name,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.trades,
    required this.experience,
    required this.online,
  });
}

