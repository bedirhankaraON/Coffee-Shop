import 'dart:io';

import 'package:flutter_espresso/core/error/exceptions.dart';
import 'package:flutter_espresso/features/coffees/data/dtos/coffee_dto.dart';
import 'package:flutter_espresso/features/coffees/domain/entities/coffee.dart';
import 'package:http/http.dart';

import 'dummy.dart';

class Any {
  static final successResponse = Response(
    Dummy.responseBody,
    200,
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    },
  );
  static final errorResponse = Response('', 404);
  static const coffeeDTOList = [
    CoffeeDTO(
        title: "Black Coffee",
        description:
            "Siyah kahve, öğütülmüş kahve çekirdeklerinin sıcak suda demlenmesiyle yapılır, sıcak olarak servis edilir. Eğer havalı olmak istiyorsanız siyah kahveye doğru adıyla 'café noir' diyebilirsiniz.",
        ingredients: ["Kahve"],
        image:
            "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        id: 1,
        price: 6),
    CoffeeDTO(
      title: "Latte",
      description:
          "Dışarıda en popüler kahve içeceği olan latte, bir miktar espresso ve buharda ısıtılmış süt ile biraz köpükten oluşur. Aromasız veya vanilyadan balkabağı baharatlarına kadar her şeyle tatlandırılmış olarak sipariş edilebilir.",
      ingredients: ["Espresso", "Buharda ısıtılmış süt"],
      image:
          "https://images.unsplash.com/photo-1561882468-9110e03e0f78?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGxhdHRlfGVufDB8fDB8fHww",
      id: 2,
      price: 6,
    ),
  ];
  static ApiResponseException get responseException =>
      ApiResponseException(Any.errorResponse, Any.errorResponse.statusCode);

  static const coffeeList = [
    Coffee(
        title: "Black Coffee",
        description:
            "Siyah kahve, öğütülmüş kahve çekirdeklerinin sıcak suda demlenmesiyle yapılır, sıcak olarak servis edilir. Eğer havalı olmak istiyorsanız siyah kahveye doğru adıyla 'café noir' diyebilirsiniz.",
        ingredients: ["Kahve"],
        image:
            "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        id: 1,
        price: 6),
    Coffee(
      title: "Latte",
      description:
          "Dışarıda en popüler kahve içeceği olan latte, bir miktar espresso ve buharda ısıtılmış süt ile biraz köpükten oluşur. Aromasız veya vanilyadan balkabağı baharatlarına kadar her şeyle tatlandırılmış olarak sipariş edilebilir.",
      ingredients: ["Espresso", "Buharda ısıtılmış süt"],
      image:
          "https://images.unsplash.com/photo-1561882468-9110e03e0f78?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGxhdHRlfGVufDB8fDB8fHww",
      id: 2,
      price: 6,
    ),
  ];
}
