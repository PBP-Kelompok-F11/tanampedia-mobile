import 'package:flutter_test/flutter_test.dart';
import 'package:tanampedia/features/catalog/data/models/plant.dart';

void main() {
  test('reads direct image_url from species response', () {
    final plant = Plant.fromJson({
      'slug': 'rosa',
      'common_name': 'Rose',
      'image_url': 'https://images.example/rose.jpg',
    });

    expect(plant.imageUrl, 'https://images.example/rose.jpg');
  });

  test('reads image_url from main_species response', () {
    final plant = Plant.fromJson({
      'slug': 'rosa',
      'main_species': {
        'image_url': 'https://images.example/rose.jpg',
      },
    });

    expect(plant.imageUrl, 'https://images.example/rose.jpg');
  });

  test('normalizes relative image URL', () {
    final plant = Plant.fromJson({
      'slug': 'rosa',
      'image_url': '/images/rose.jpg',
    });

    expect(plant.imageUrl, 'https://trefle.io/images/rose.jpg');
  });

  test('upgrades http image URL to https', () {
    final plant = Plant.fromJson({
      'slug': 'rosa',
      'image_url': 'http://images.example/rose.jpg',
    });

    expect(plant.imageUrl, 'https://images.example/rose.jpg');
  });

  test('reads first image from grouped images map (detail response)', () {
    final plant = Plant.fromJson({
      'slug': 'rosa',
      'main_species': {
        'images': {
          'flower': [
            {'image_url': 'https://images.example/flower.jpg'},
          ],
          'leaf': [],
        },
      },
    });

    expect(plant.imageUrl, 'https://images.example/flower.jpg');
  });
}
