import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductSlider(),
    );
  }
}

class ProductSlider extends StatefulWidget {
  @override
  _ProductSliderState createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  final PageController _pageController = PageController();

  final List<PageContent> pages = [
    PageContent(
      imageUrl:
          'https://raw.githubusercontent.com/SebassRM128/imagenes/refs/heads/main/reloj1.jpg',
      title: 'Cuahtli P.',
      rating: 4.0,
      reviews: 2300,
      description:
          'Nuestro nuevo reloj, la calidad es nuestro estilo, tu estilo, prueba nuestro nuevo reloj, tu reloj, CUAHTLI.',
    ),
    PageContent(
      imageUrl:
          'https://raw.githubusercontent.com/SebassRM128/imagenes/refs/heads/main/reloj2.jpg',
      title: 'Cuahtli X.',
      rating: 4.5,
      reviews: 1900,
      description:
          'Diseño elegante y moderno. Relojes CUAHTLI, una declaración de estilo para cada ocasión.',
    ),
    PageContent(
      imageUrl:
          'https://raw.githubusercontent.com/SebassRM128/imagenes/refs/heads/main/reloj3.jpg',
      title: 'Cuahtli Gold',
      rating: 5.0,
      reviews: 3200,
      description:
          'Edición limitada en oro. La perfección en cada detalle. Solo en CUAHTLI.',
    ),
    PageContent(
      imageUrl:
          'https://raw.githubusercontent.com/SebassRM128/imagenes/refs/heads/main/reloj4.jpg',
      title: 'Cuahtli Chrono',
      rating: 4.7,
      reviews: 2750,
      description:
          'Precisión y poder. Descubre el reloj que marca la diferencia.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() {
          });
        },
        itemBuilder: (context, index) {
          return buildPage(context, pages[index], index);
        },
      ),
    );
  }

  Widget buildPage(BuildContext context, PageContent data, int index) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          data.imageUrl,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    '${index + 1}/${pages.length}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  data.title,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    ...List.generate(
                      5,
                      (i) => Icon(
                        i < data.rating.round()
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      data.rating.toStringAsFixed(1),
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '(${data.reviews})',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  data.description,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PageContent {
  final String imageUrl;
  final String title;
  final double rating;
  final int reviews;
  final String description;

  PageContent({
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.reviews,
    required this.description,
  });
}
