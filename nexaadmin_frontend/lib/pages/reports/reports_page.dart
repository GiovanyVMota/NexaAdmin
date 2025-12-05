import 'package:flutter/material.dart';
import '../../services/client_service.dart';
import '../../services/product_service.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  int totalClients = 0;
  int totalProducts = 0;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final clients = await ClientService().getClients();
      final products = await ProductService().getProducts();

      setState(() {
        totalClients = clients.length;
        totalProducts = products.length;
        loading = false;
      });
    } catch (e) {
      print("Erro ao carregar relatórios: $e");
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Relatórios",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Dashboard Geral",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 25),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _metricCard("Clientes", totalClients.toString(),
                          Colors.blueAccent),
                      _metricCard("Produtos", totalProducts.toString(),
                          Colors.purpleAccent),
                      _metricCard("Vendas", "R\$ 89.400", Colors.tealAccent),
                    ],
                  ),

                  const SizedBox(height: 50),

                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.3),
                          blurRadius: 20,
                        )
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: CustomPaint(
                      painter: FuturisticLineChartPainter(),
                    ),
                  ),

                  const SizedBox(height: 50),

                  const Text(
                    "Atividade Recente",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  _timelineItem(
                      "Novo cliente cadastrado",
                      "Sistema registrou um novo cliente no banco.",
                      Colors.blueAccent),
                  _timelineItem(
                      "Produto atualizado",
                      "Alteração de estoque sincronizada.",
                      Colors.purpleAccent),
                  _timelineItem(
                      "Geração de relatório",
                      "Dashboard processou métricas semanais.",
                      Colors.tealAccent),
                ],
              ),
            ),
    );
  }

  Widget _metricCard(String title, String value, Color color) {
    return Container(
      width: 130,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF131313),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withOpacity(0.6)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 15,
          )
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _timelineItem(String title, String subtitle, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 22),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161616),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.6)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.25),
            blurRadius: 15,
          )
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.bolt, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(color: Colors.white70)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FuturisticLineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final grid = Paint()
      ..color = Colors.white12
      ..strokeWidth = 1;

    // GRID
    for (double y = 0; y < size.height; y += 40) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), grid);
    }

    for (double x = 0; x < size.width; x += 50) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), grid);
    }

    // Pontos do gráfico
    final points = [
      Offset(0, 150),
      Offset(50, 120),
      Offset(100, 90),
      Offset(150, 110),
      Offset(200, 70),
      Offset(250, 80),
      Offset(300, 40),
    ];

    final line = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final glow = Paint()
      ..color = Colors.blueAccent.withOpacity(0.25)
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 18);

    final path = Path()..moveTo(points.first.dx, points.first.dy);

    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    // Glow primeiro
    canvas.drawPath(path, glow);

    // Linha principal por cima
    canvas.drawPath(path, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
