import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_float_dev.dart';
import 'package:san_andres_mobile/presentation/widgets/card/card_autopart.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AutopartsScreen extends StatefulWidget {
  const AutopartsScreen({super.key});

  @override
  State<AutopartsScreen> createState() => _AutopartsScreenState();
}

class _AutopartsScreenState extends State<AutopartsScreen> {
  bool _isExpanded = false;
  late bool stateOptions;
  // bool _isDataLoaded = false;

  _loadData() {
    
  }
  @override
  void initState() {
    super.initState();
    stateOptions = true;
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("AutopartsScreen"),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.5) {
          _loadData();
        }
      },
      child: Stack(
        children: [
          ListView(
            children: const [
              CardAutopart(
                productId: 1,
                productCode: "wedwed-234n",
                productPrice: 232.4,
              ),
              CardAutopart(
                productId: 1,
                productCode: "wedwed-234n",
                productPrice: 232.4,
              ),
              CardAutopart(
                productId: 1,
                productCode: "wedwed-234n",
                productPrice: 232.4,
              ),
              CardAutopart(
                productId: 1,
                productCode: "wedwed-234n",
                productPrice: 232.4,
              ),
              CardAutopart(
                productId: 1,
                productCode: "wedwed-234n",
                productPrice: 232.4,
              ),
              CardAutopart(
                productId: 1,
                productCode: "wedwed-234n",
                productPrice: 232.4,
              ),
              CardAutopart(
                productId: 1,
                productCode: "wedwed-234n",
                productPrice: 232.4,
              ),
              CardAutopart(
                productId: 1,
                productCode: "wedwed-234n",
                productPrice: 232.4,
              ),
              CardAutopart(
                productId: 1,
                productCode: "wedwed-234n",
                productPrice: 232.4,
              ),
              CardAutopart(
                productId: 1,
                productCode: "wedwed-234n",
                productPrice: 232.4,
              ),
              CardAutopart(
                productId: 1,
                productCode: "wedwed-234n",
                productPrice: 232.4,
              ),
              CardAutopart(
                productId: 1,
                productCode: "wedwed-234n",
                productPrice: 232.4,
              ),
            ],
          ),
          if (_isExpanded)
            GestureDetector(
              onTap: _toggleExpand,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (_isExpanded) ...[
                    BtnFloatDev(
                      icon: Icons.add,
                      text: "Agregar",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 20),
                    BtnFloatDev(
                      icon: Icons.search_off_sharp,
                      text: "Filtro",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 20),
                  ],
                  // FAB principal para expandir o contraer
                  stateOptions
                      ? BtnFloatDev(
                          text: "",
                          onPressed: _toggleExpand,
                          bg: Colors.red[900],
                          icon: _isExpanded ? Icons.close : Icons.keyboard_arrow_up_rounded,
                        )
                      : const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
