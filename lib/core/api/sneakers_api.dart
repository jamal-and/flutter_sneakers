import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:sneakers_app/core/models/product_model.dart';

class SneakersApi {
  String baseUrl = 'url.to.replace';
  final dio = Dio(BaseOptions());

  // Mocking the api

  SneakersApi() {
    final dioAdapter = DioAdapter(dio: dio);
    dioAdapter.onGet(
      baseUrl,
      (server) => server.reply(
        200,
        mockData,
        // Delay the response by 1 second
        delay: const Duration(seconds: 1),
      ),
    );
  }

  // Fetching sneakers data
  Future<List<Product>> fetchSneakers() async {
    final response = await dio.get(baseUrl);
    List<Product> products = [];
    for (Map<String, dynamic> i in response.data) {
      products.add(Product.fromJson(i));
    }
    return products;
  }
}

List mockData = [
  {
    "images": [
      "https://res.cloudinary.com/dwvzinqzc/image/upload/v1633451482/kim-jones-air-max-95-shoe-Pnm3zx-removebg-preview_rrjdqo.png",
      "https://res.cloudinary.com/dwvzinqzc/image/upload/v1633523724/kim-jones-air-max-95-shoe-Pnm3zx-removebg-preview_1_rofx2r.png",
      "https://res.cloudinary.com/dwvzinqzc/image/upload/v1633523725/kim-jones-air-max-95-shoe-Pnm3zx-removebg-preview_3_dqpm0r.png",
      "https://res.cloudinary.com/dwvzinqzc/image/upload/v1633523724/kim-jones-air-max-95-shoe-Pnm3zx-removebg-preview_2_m23iye.png",
      "https://res.cloudinary.com/dwvzinqzc/image/upload/v1633523724/kim-jones-air-max-95-shoe-Pnm3zx-removebg-preview_nmchi6.png"
    ],
    "name": "Jones Air Max 95",
    "brand": "Nike x Kim",
    "price": "85",
    "description":
        "Prolific designer Kim Jones brings his extensive fashion pedigree to one of Nike's most beloved shoes, the Nike x Kim Jones Air Max 95...",
    "color": "green"
  },
  {
    "images": [
      "https://res.cloudinary.com/dwvzinqzc/image/upload/v1633450638/air-vapormax-plus-mens-shoes-nC0dzF-removebg-preview_hkzcuz.png"
    ],
    "name": "Air VaporMax Plus",
    "brand": "Nike",
    "price": "110",
    "description":
        "The Nike Air VaporMax Plus looks to the past to propel you into the future...",
    "color": "amour"
  },
  {
    "images": [
      "https://res.cloudinary.com/dwvzinqzc/image/upload/v1633451284/air-max-plus-mens-shoes-x9G2xF-removebg-preview_yrrx1n.png",
      "https://res.cloudinary.com/dwvzinqzc/image/upload/v1633523475/air-max-plus-mens-shoes-x9G2xF-removebg-preview_1_zdjtyq.png",
      "https://res.cloudinary.com/dwvzinqzc/image/upload/v1633523475/air-max-plus-mens-shoes-x9G2xF-removebg-preview_3_bzwrqq.png",
      "https://res.cloudinary.com/dwvzinqzc/image/upload/v1633523475/air-max-plus-mens-shoes-x9G2xF-removebg-preview_2_jupyzn.png",
      "https://res.cloudinary.com/dwvzinqzc/image/upload/v1633523475/air-max-plus-mens-shoes-x9G2xF-removebg-preview_x5qndu.png"
    ],
    "name": "Air Max Plus",
    "brand": "Nike",
    "price": "65",
    "description":
        "Give your attitude an edge in your Nike Air Max Plus, a Tuned Air experience that gives you incredible stability and unbelievable cushioning...",
    "color": "amyCrisp"
  },
  {
    "images": [
      "https://res.cloudinary.com/dwvzinqzc/image/upload/v1633450790/waffle-one-premium-mens-shoes-2Zs0G1-removebg-preview_ytqoot.png",
      "https://res.cloudinary.com/dwvzinqzc/image/upload/v1633521038/waffle-one-premium-mens-shoes-2Zs0G1-removebg-preview_1_qljpng.png",
      "https://res.cloudinary.com/dwvzinqzc/image/upload/v1633521038/waffle-one-premium-mens-shoes-2Zs0G1-removebg-preview_4_tsfxqf.png",
      "https://res.cloudinary.com/dwvzinqzc/image/upload/v1633521038/waffle-one-premium-mens-shoes-2Zs0G1-removebg-preview_3_yeeebw.png",
      "https://res.cloudinary.com/dwvzinqzc/image/upload/v1633521038/waffle-one-premium-mens-shoes-2Zs0G1-removebg-preview_roqtpv.png"
    ],
    "name": "Waffle One Premium",
    "brand": "Nike",
    "price": "110",
    "description":
        "The Nike Waffle One Premium keeps it cozy. Merging classic track aesthetics with a quilted upper and sweater-like liner, it lets you tread calmly...",
    "color": "orange"
  }
];
