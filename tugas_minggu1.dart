void main() {
  const String namaToko = "Toko Gadget Murah";
  final String tanggal = DateTime.now().toString();
  var namaPelanggan = "Budi";

  int hargaBarang = 500000;
  int jumlahBeli = 3;

  print("Selamat datang di $namaToko");
  print("Tanggal Transaksi: $tanggal");

  print("\n--- Proses Scanning ---");
  for (int i = 1; i <= jumlahBeli; i++) {
    print("Scanning barang ke-$i...");
  }

  int totalHarga = hitungTotal(harga: hargaBarang, jumlah: jumlahBeli);

  cekStatusMember(totalHarga, true);
}

int hitungTotal({required int harga, required int jumlah}) {
  return harga * jumlah;
}

void cekStatusMember(int totalBelanja, bool punyaKartuMember) {
  print("\n--- Rincian Pembayaran ---");
  print("Total Belanja: Rp $totalBelanja");

  if (totalBelanja > 1000000 && punyaKartuMember) {
    print("Status: SUPER VIP (Diskon Besar)");
    print("Karena belanja > 1juta DAN punya kartu member.");
  } else if (totalBelanja > 1000000 || punyaKartuMember) {
    print("Status: VIP (Diskon Standar)");
    print("Karena belanja > 1juta ATAU punya kartu member.");
  } else {
    print("Status: Regular (Tidak ada diskon)");
  }
}