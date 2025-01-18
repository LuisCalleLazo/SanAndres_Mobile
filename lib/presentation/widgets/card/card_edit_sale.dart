import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/presentation/services/input_controller_manager.dart';
import 'package:san_andres_mobile/presentation/services/value_notifier_manager.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_text_default.dart';
import 'package:san_andres_mobile/presentation/widgets/dialogs/dialog_empty.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_default.dart';
import 'package:san_andres_mobile/presentation/widgets/text/text_decoration_dev.dart';

class CardEditSale extends StatefulWidget {
  const CardEditSale({super.key});

  @override
  State<CardEditSale> createState() => _CardAddSaleState();
}

class _CardAddSaleState extends State<CardEditSale> {
  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return const MenuForItemSale(
          saleId: 1,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showOptions(context),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 10,
        child: Container(
          height: 180,
          color: Colors.white60,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      'https://picsum.photos/id/1/600/250',
                      height: 100,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      "Codigo de producto",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextDecorationDev(
                      text: "Entregado",
                      width: double.infinity,
                      bg: Colors.amber[400],
                    ),
                    TextDecorationDev(
                      text: "Cancelado",
                      width: double.infinity,
                      bg: Colors.green[100],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Cantidad:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "22 unidades",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Precio por unidad:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "50 Bs",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.red[900], thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Sub Total:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "110 Bs",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuForItemSale extends StatelessWidget {
  final int saleId;
  const MenuForItemSale({
    super.key,
    required this.saleId,
  });

  _showEditDialog(BuildContext context, InputControllerManager controller,
      ValueNotifierManager<String?> notifier) {
    return showDialog(
      context: context,
      builder: (context) {
        return DialogEmpty(
          width: MediaQuery.of(context).size.width * 0.95,
          height: 500,
          child: ListView(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Detalle de producto de venta",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 93, 7, 7),
                    ),
                  ),
                ),
              ),
              InputDefault(
                label: "Cantidad",
                type: TextInputType.number,
                controller: controller.getController("amount_sale"),
                icon: CupertinoIcons.archivebox,
              ),
              const SizedBox(height: 20),
              InputDefault(
                label: "Cantidad entregada",
                type: TextInputType.number,
                controller: controller.getController("amount_sale_delivery"),
                icon: CupertinoIcons.archivebox,
              ),
              const SizedBox(height: 20),
              InputDefault(
                label: "Precio por unidad",
                type: TextInputType.number,
                controller: controller.getController("price_sale"),
                icon: CupertinoIcons.money_dollar,
              ),
              const SizedBox(height: 20),
              InputDefault(
                label: "Cantidad pagada",
                type: TextInputType.number,
                controller: controller.getController("pay_sale_delivery"),
                icon: Icons.payment,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: BtnTextDefault(
                  heigth: 50,
                  minHeight: 30,
                  text: "Guardar",
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final InputControllerManager inputManager = InputControllerManager();
    final ValueNotifierManager<String?> valueManager = ValueNotifierManager();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.edit, color: Colors.red),
            title: const Text('Editar Información',
                style: TextStyle(color: Colors.red)),
            onTap: () {
              _showEditDialog(context, inputManager, valueManager);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title: const Text('Eliminar', style: TextStyle(color: Colors.red)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
