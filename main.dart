void main() {
    // int umur = 18;
    // double phi = 3.14;
    // String nama = "Muhammad Rian";

    // dynamic age = 19;
    // age = "Sembilan Belas";

    // var namaUKM = "Gdgoc";

    // final String sambutan = "Wellcome";

    // const String toko = "toko bangunan";

    // print("Hello world $nama");



    bool isRaining = false;

    if(isRaining) {
        print("yah pake payung");
    } else {
        print("gooo");
    }


    int nilai = 86;

    if(nilai >90) {
        print("lulus");
    } else if (nilai>85) {
        print("lulus juga");
    } else if (nilai<85) {
        print("ga lulus");
    }


    for(int i=0; i<=10; i++) {
        print("ini adalah pengulangan angka ke$i");
    }

    sapa("talkom");

    int persegi = persegiPanjang(20,20);
    print(persegi);
}
void sapa(String nama) {
    print("Selamat Datang $nama");
}

int persegiPanjang(int panjang,int lebar) {
    return panjang * lebar;
}