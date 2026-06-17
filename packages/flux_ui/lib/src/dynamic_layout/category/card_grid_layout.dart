import 'package:flutter/material.dart';

import '../../entities/entities.dart';
import '../../widgets/widgets.dart';

class CardGridLayout extends StatelessWidget {
  const CardGridLayout({super.key, required this.config});

  final CardGridLayoutConfig config;

  @override
  Widget build(BuildContext context) {
    final items = config.items;
    return FluxGridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridConfig: config.gridConfig,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(config.borderRadius),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              FluxImage(imageUrl: item.imageUrl, fit: BoxFit.cover),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 12.0,
                  ),
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
