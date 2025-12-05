import 'package:flutter/material.dart';
import 'clients/clients_page.dart';
import 'products/products_page.dart';
import 'reports/reports_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: FuturisticGridPainter(),
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "NEXAADMIN",
                    style: TextStyle(
                      fontSize: 58,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 8,
                      shadows: [
                        Shadow(
                          color: Colors.blueAccent,
                          blurRadius: 20,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "A infraestrutura secreta por trás da próxima revolução dos ERPs.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 60),

                  Wrap(
                    spacing: 40,
                    runSpacing: 40,
                    alignment: WrapAlignment.center,
                    children: [
                      neonButton(
                        context,
                        "Clientes",
                        Icons.people_alt,
                        ClientsPage(),
                        Colors.blueAccent,
                      ),
                      neonButton(
                        context,
                        "Produtos",
                        Icons.shopping_cart_checkout,
                        ProductsPage(),
                        Colors.purpleAccent,
                      ),
                      neonButton(
                        context,
                        "Relatórios",
                        Icons.bar_chart_rounded,
                        ReportsPage(),
                        Colors.tealAccent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget neonButton(BuildContext context, String title, IconData icon,
      Widget page, Color glowColor) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => page),
      ),
      child: Container(
        width: 200,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF1B1B1B), Color(0xFF0F0F0F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: glowColor.withOpacity(0.6),
              blurRadius: 18,
              spreadRadius: 1,
            ),
          ],
          border: Border.all(color: glowColor.withOpacity(0.6), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: glowColor, size: 42),
            const SizedBox(height: 15),
            Text(
              title,
              style: TextStyle(
                color: glowColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 1.4,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FuturisticGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueGrey.withOpacity(0.12)
      ..strokeWidth = 1;

    const gridSize = 40;

    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
