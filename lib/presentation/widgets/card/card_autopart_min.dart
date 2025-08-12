import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_list.dart';
import 'package:san_andres_mobile/presentation/provider/autopart_provider.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_icon_dev.dart';

class CardAutopartMin extends StatefulWidget {
  final bool isChecked;
  final VoidCallback onTap;
  final AutopartList autopart;
  const CardAutopartMin(
      {super.key,
      required this.isChecked,
      required this.onTap,
      required this.autopart});

  @override
  State<CardAutopartMin> createState() => _CardAutopartMinState();
}

class _CardAutopartMinState extends State<CardAutopartMin> {
  @override
  Widget build(BuildContext context) {
    final autopartProvider =
        Provider.of<AutopartProvider>(context, listen: false);
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 10,
        child: Stack(
          children: [
            Container(
              height: 120,
              color: Colors.white60,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Código:",
                        style: TextStyle(
                          color: Colors.red[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.autopart.infos
                            .firstWhere(
                              (info) => info.type == 'code',
                              orElse: () => AutopartInfoList(
                                  type: 0,
                                  value: 'No disponible',
                                  id: 0,
                                  typeId: 0,
                                  autopartId: 0),
                            )
                            .value,
                        style: TextStyle(color: Colors.grey[900]),
                      ),
                      Text(
                        "Categoria",
                        style: TextStyle(
                          color: Colors.red[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.autopart.categoryName,
                        style: TextStyle(color: Colors.grey[900]),
                      ),
                    ],
                  ),
                  BtnIconDev(
                    onPressed: () {
                      autopartProvider.selectAutopart(widget.autopart);
                      context.push('/autoparts/imgs');
                    },
                    width: 25,
                    heigth: 50,
                    minHeight: 20,
                    minWidth: 20,
                    icon: Icons.image,
                  ),
                ],
              ),
            ),
            if (widget.isChecked)
              const Positioned(
                right: 10,
                top: 10,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.red,
                  size: 30,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
