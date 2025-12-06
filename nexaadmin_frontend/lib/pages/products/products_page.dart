import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../services/product_service.dart';
import 'product_form_page.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late Future<List<ProductModel>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _refreshList();
  }

  void _refreshList() {
    setState(() {
      _futureProducts = ProductService.getProducts();
    });
  }

  // Formata a data para exibir bonitinho
  String _formatDate(String dateStr) {
    if (dateStr.isEmpty) return "Data não disponível";
    try {
      final date = DateTime.parse(dateStr);
      return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year} às ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
    } catch (e) {
      return dateStr;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        title: const Text("Produtos", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ProductFormPage()),
          );
          _refreshList();
        },
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.purpleAccent));
          }
          if (snapshot.hasError) {
            return Center(child: Text("Erro: ${snapshot.error}", style: const TextStyle(color: Colors.white)));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Nenhum produto encontrado.", style: TextStyle(color: Colors.white70)));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              final product = snapshot.data![index];
              
              return Card(
                color: const Color(0xFF1E1E1E),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.purpleAccent.withOpacity(0.3), width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              product.nome,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "R\$ ${product.preco.toStringAsFixed(2)}",
                            style: const TextStyle(
                              color: Colors.purpleAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      
                      // AQUI ESTÁ A DESCRIÇÃO
                      Text(
                        product.descricao.isNotEmpty ? product.descricao : "Sem descrição",
                        style: const TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      
                      const SizedBox(height: 12),
                      const Divider(color: Colors.white10),
                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // AQUI ESTÁ A DATA DE ATUALIZAÇÃO
                          Row(
                            children: [
                              const Icon(Icons.access_time, size: 14, color: Colors.white38),
                              const SizedBox(width: 4),
                              Text(
                                "Atualizado: ${_formatDate(product.dataAtualizado)}",
                                style: const TextStyle(color: Colors.white38, fontSize: 12),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blueAccent, size: 20),
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => ProductFormPage(product: product)),
                                  );
                                  _refreshList();
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.redAccent, size: 20),
                                onPressed: () async {
                                  if (product.id != null) {
                                    await ProductService.deleteProduct(product.id!);
                                    _refreshList();
                                  }
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}