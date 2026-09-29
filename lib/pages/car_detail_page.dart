import "package:flutter/material.dart";
import "../models/car_model.dart";


class CarDetailPage extends StatelessWidget {
  final Car car;
  const CarDetailPage({super.key, required this.car});

  Widget _section(String title) => Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 8),
        child: Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      );

  Widget _row(IconData icon, String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Icon(icon, size: 18, color: Colors.deepPurple),
            const SizedBox(width: 8),
            SizedBox(width: 80, child: Text(label)),
            Text(": $value", style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(car.name,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: car.name + car.year.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  car.imageUrl,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const SizedBox(
                      height: 220,
                      child: Center(child: Icon(Icons.broken_image, size: 48))),
                ),
              ),
            ),
            _section("Car Details"),
            _row(Icons.abc, "id", car.id),
            _row(Icons.person, "Name", car.name),
            _row(Icons.branding_watermark, "Brand", car.brand),
            _row(Icons.calendar_month, "Year", car.year.toString()),
            _row(Icons.price_change, "Price", "Rp ${car.price.toStringAsFixed(0)}"),
            _row(Icons.description, "Description", car.description),
          ],
        ),
      ),
    );
  }
}
