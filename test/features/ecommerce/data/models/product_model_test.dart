import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:task_6/features/ecommerce/data/models/product_model.dart';
import 'package:task_6/features/ecommerce/domain/entities/product.dart';

void main() {
  const product = ProductModel(
      id: '1',
      name: 'name',
      price: 30,
      description: 'description',
      imageUrl: 'imageUrl');

  test('should be a subclass of Product entity', () {
    expect(product, isA<ProductEntity>());
  });

  group('to json', () {
    test('should map jsdon to  product model', () {
      const path =
          '/Users/joel/Documents/flutter_dev/2024-project-phase-mobile-tasks/mobile-eyuel/task_6/test/fixture/json_example.json';
      final response = json.decode(File(path).readAsStringSync());
      final result = ProductModel.fromJson(response['data']);

      expect(result.runtimeType, product.runtimeType);
    });
    test('should return a proper json data', () {
      final Map<String, dynamic> result = product.tojson();

      expect(result, {
        'id': '1',
        'name': 'name',
        'price': 30,
        'description': 'description',
        'imageUrl': 'imageUrl'
      });
    });
  });
}
