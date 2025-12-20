class Barang {
  String nama;
  int harga;

  Barang(this.nama, this.harga);
}

void main() {
  List<Barang> daftarBelanja = [
    Barang('susu', 15000),
    Barang('Roti', 12000),
    Barang('Telur', 25000),
  ];

  int totalBayar = 0;

  for (var item in daftarBelanja) {
    totalBayar += item.harga;
  }

  for (var item in daftarBelanja) {
    print('${item.nama}: Rp ${item.harga}');
  }

  print('total yang harus dibayar : Rp $totalBayar');
}
