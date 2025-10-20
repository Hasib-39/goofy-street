import 'package:flutter/material.dart';
import '../models/bag_item_model.dart';

class BagItemCard extends StatefulWidget {
  final BagItem item;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback? onRemoveItem;

  const BagItemCard({
    super.key,
    required this.item,
    required this.onAdd,
    required this.onRemove,
    this.onRemoveItem,
  });

  @override
  State<BagItemCard> createState() => _BagItemCardState();
}

class _BagItemCardState extends State<BagItemCard> {
  bool _isZoomed = false;

  void toggleZoom() {
    setState(() {
      _isZoomed = !_isZoomed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: toggleZoom,
            child: AnimatedScale(
              duration: const Duration(milliseconds: 300),
              scale: _isZoomed ? 1.6 : 1.0, // zoom effect
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.item.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.item.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Color: ${widget.item.color}   Size: ${widget.item.size}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: widget.onRemove,
                            child: const Icon(Icons.remove, size: 18),
                          ),
                          Text("${widget.item.quantity}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold)),
                          GestureDetector(
                            onTap: widget.onAdd,
                            child: const Icon(Icons.add, size: 18),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '\$${widget.item.price * widget.item.quantity}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.black54),
            onSelected: (value) {
              if (value == 'remove' && widget.onRemoveItem != null) {
                widget.onRemoveItem!();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'remove',
                child: Text('Remove item'),
              ),
              const PopupMenuItem(
                value: 'save',
                child: Text('Save for later'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
