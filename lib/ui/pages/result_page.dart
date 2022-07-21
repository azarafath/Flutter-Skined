import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skined/shared/size_config.dart';
import 'package:skined/shared/theme.dart';
import 'package:skined/ui/pages/detail_result_page.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.image, required this.pred})
      : super(key: key);
  final List? pred;
  final File? image;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool isTips = true;
  List label = [
    'Jerawat',
    'Kudis',
    'Dermatitis',
    'Kurap',
    'Kutil',
  ];

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget customAppBar() {
      return AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: whiteColor,
        toolbarHeight: getProportionateScreenHeight(60),
        centerTitle: true,
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(23)),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: blueColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Text(
                  'Result',
                  style: latoTextStyle.copyWith(
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: weightBold,
                    color: whiteColor,
                  ),
                ),
              ),
              Positioned(
                right: getProportionateScreenWidth(20),
                top: getProportionateScreenHeight(20),
                child: GestureDetector(
                  onTap: (() => Navigator.pushNamedAndRemoveUntil(
                      context, '/main', (route) => false)),
                  child: Text(
                    'Done',
                    style: latoTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: weightBold,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: customAppBar(),
        body: (widget.pred![0]['label'] == label[0])
            ? DetailResultPage(
                image: widget.image,
                sDetail:
                    'Penyebab jerawat adalah penyumbatan pada pori-pori kulit. Penyumbatan ini dapat terjadi akibat',
                lDetail:
                    'Penyebab jerawat adalah penyumbatan pada pori-pori kulit. Penyumbatan ini dapat terjadi akibat produksi sebum berlebih oleh kelenjar minyak, penumpukan kulit mati, atau penumpukan bakteri.\n\nDi setiap pori-pori kulit, terdapat folikel yang terdiri dari kelenjar minyak dan rambut. Folikel di pori-pori kulit yang tersumbat bisa membengkak dan membentuk komedo putih atau komedo hitam. Jika terkontaminasi oleh bakteri,komedo dapat meradang dan menjadi jerawat dalam bentuk pustula, papula, nodul, atau bahkan kista',
                penyakit: 'Jerawat',
                tips:
                    'Beberapa upaya yang dapat dilakukan untuk mencegah jerawat yaitu\n\n1. Membersihkan riasan wajah sebelum tidur.\n2. Mengelola stres dengan baik\n3. Menghindari penggunaan pakaian yang terlalu ketat.\n4. Menjaga kebersihan tubuh dengan selalu mandi setelah beraktivitas.\n5. Menghindari memencet dan memegang jerawat, karena dapat memicu jerawat bertambah banyak.\n6. Menjaga kebersihan wajah dengan membersihkan wajah dua kali dalam sehari, untuk mengangkat sel-sel kulit mati, minyak yang berlebihan, serta sisa kosmetik di permukaan kulit.',
                medicine: [
                  'assets/obat_jerawat1.png',
                  'assets/obat_jerawat2.png',
                  'assets/obat_jerawat3.png',
                  'assets/obat_jerawat4.png'
                ],
              )
            : (widget.pred![0]['label'] == label[1])
                ? DetailResultPage(
                    image: widget.image,
                    sDetail:
                        'Penyebab scabies adalah tungau jenis S.scabiei yang menginvasi kulit. Tungau ini biasanya',
                    lDetail:
                        'Penyebab scabies/kudis adalah tungau jenis S. scabiei yang menginvasi kulit. Tungau ini biasanya terdapat di seprai, gorden, bantal, atau pakaian orang yang terinfeksi. Saat bersembunyi di bawah kulit, tungau membuat terowongan sebagai tempat ia menyimpan telur. \n\nSaat telur menetas, larva tersebut dapat muncul ke permukaan kulit dan menyebar ke area kulit lainnya, bahkan pindah ke orang lain. Gatal yang timbul karena penyakit ini merupakan reaksi tubuh terhadap tungau, telur, serta kotorannya.\n\nKontak fisik dekat dengan seseorang yang mengidap penyakit ini, seperti berbagi pakaian atau tidur satu ranjang dapat meningkatkan risiko terinfeksi kudis. Rutin membersihkan tempat tidur dan tidak berbagi-pakai pakaian sangat penting untuk mencegah penularan.',
                    penyakit: 'Kudis',
                    tips:
                        'Ada beberapa cara yang bisa dilakukan untuk mencegah infestasi ulang dan mencegah penyebaran penyakit ini pada orang lain, yaitu:\n\n1. Membersihkan pakaian dengan benar. Gunakan air sabun panas untuk mencuci semua pakaian, handuk, dan seprai yang digunakan dalam waktu tiga hari sebelum perawatan dilakukan. Keringkan pakaian tersebut dengan panas tinggi.\n\n2. Pisahkan barang yang tidak bisa dicuci. Cobalah untuk memisahkan barang-barang yang tidak dapat dicuci ke dalam kantong plastik tertutup dan letakkan di tempat yang terpisah, seperti garasi. Diamkan selama beberapa minggu agar tungau mati setelah beberapa hari tidak mendapatkan makanan.',
                    medicine: [
                      'assets/obat_kudis1.png',
                      'assets/obat_kudis2.png',
                      'assets/obat_kudis3.png',
                      'assets/obat_kudis4.png'
                    ],
                  )
                : (widget.pred![0]['label'] == label[2])
                    ? DetailResultPage(
                        image: widget.image,
                        sDetail:
                            'Dermatitis disebabkan oleh zat yang mengiritasi kulit atau memicu reaksi alergi. Substansi',
                        lDetail:
                            'Dermatitis disebabkan oleh zat yang mengiritasi kulit atau memicu reaksi alergi. Substansi bisa menjadi salah satu dari ribuan alergen dan iritasi yang diketahui. Beberapa zat dapat menyebabkan dermatitis kontak iritan dan dermatitis kontak alergi. \n\nDermatitis kontak iritasi terjadi ketika lapisan luar kulit bersentuhan dengan zat tertentu yang menyebabkan lapisan pelindung kulit mengalami kerusakan. Jenis dermatitis inilah yang paling sering terjadi.\n\nSedangkan dermatitis kontak alergi erjadi ketika kulit bersentuhan dengan zat alergen yang memicu sistem kekebalan tubuh bereaksi berlebihan, sehingga menyebabkan kulit gatal dan meradang.',
                        penyakit: 'Dermatitis',
                        tips:
                            'Berikut adalah beberapa upaya yang dapat dilakukan untuk mencegah dermatitis kontak:\n\n1. Hindari iritan dan alergen. Cobalah untuk mengidentifikasi dan menghindari zat yang mengiritasi kulit atau menyebabkan reaksi alergi.\n\n2. Cuci kulit. Kamu bisa menghilangkan sebagian besar zat penyebab ruam jika segera mencuci kulit setelah bersentuhan dengannya. Gunakan sabun lembut, bebas pewangi, air hangat, dan bilas sepenuhnya. \n\n3. Cuci pakaian atau barang lain yang mungkin terkena alergen tanaman.\n\n4. Kenakan pakaian pelindung atau sarung tangan. Masker wajah, kacamata, sarung tangan, dan barang pelindung lainnya dapat melindungi kami dari zat yang mengiritasi. Termasuk cairan pembersih rumah.\n\n5. Gunakan penutup untuk menutup logam bersentuhan dengan kulit. Ini bisa menghindari paparan dari kancing celana jeans atau resleting yang terbuat dari logam.',
                        medicine: [
                          'assets/obat_dermatitis1.png',
                          'assets/obat_dermatitis2.png',
                          'assets/obat_dermatitis3.png',
                          'assets/obat_dermatitis4.png'
                        ],
                      )
                    : (widget.pred![0]['label'] == label[3])
                        ? DetailResultPage(
                            image: widget.image,
                            sDetail:
                                'Penyebab kurap adalah jamur yang tumbuh dan berkembang biak dengan cepat pada kulit',
                            lDetail:
                                'Penyebab kurap adalah jamur yang tumbuh dan berkembang biak dengan cepat pada kulit manusia. Setidaknya, terdapat tiga jenis jamur yang bisa menyebabkan penyakit kurap, yaitu Trichophyton, Epidermophyton, dan Microsporum. Kurap sendiri termasuk jenis infeksi kulit yang mudah menular.\n\nUdara panas dan lembap, berbagi pemakaian barang pribadi, dan memakai pakaian yang ketat bisa membuat seseorang lebih rentan terkena kurap.\n\nKurap ditandai dengan munculnya ruam bersisik berwarna kemerahan di permukaan kulit. Ruam kulit ini dapat meluas. Meski demikian, gejala kurap dapatberbeda-beda pada tiap orang, tergantung pada lokasi kurap.',
                            penyakit: 'Kurap',
                            tips:
                                'Selain menggunakan obat anti jamur, pengidap dapat melakukan beberapa hal berikut ini untuk membantu mengatasi kurap:\n\n1. Tidak memakai pakaian dengan bahan yang bisa memicu iritasi pada area kurap.\n\n2. Mencuci baju dan sprei setiap hari selama kurap belum sembuh sepenuhnya.\n\n3. Menjaga kebersihan lingkungan rumah dan sekitar.\n\n4. Menjaga kebersihan dan mengeringkan kulit secara teratur, terutama pada area yang terinfeksi kurap.\n\n5. Segera membawa hewan peliharaan ke dokter apabila terkena kurap.\n\n6. Sebisa mungkin tidak menggaruk area tubuh yang terasa gatal.\n\n7. Langsung bertanya pada dokter kulit apabila kurap tidak membaik selama lebih dari dua minggu. ',
                            medicine: [
                              'assets/obat_kurap1.png',
                              'assets/obat_kurap2.png',
                              'assets/obat_kurap3.png',
                              'assets/obat_kurap4.png'
                            ],
                          )
                        : DetailResultPage(
                            image: widget.image,
                            sDetail:
                                'Pada umumnya, kutil disebabkan oleh infeksi virus dan jenis yang paling sering adalah human',
                            lDetail:
                                'Pada umumnya, kutil disebabkan oleh infeksi virus dan jenis yang paling sering adalah human papilloma virus (HPV). Virus ini memiliki banyak serotipe dengan jumlah lebih dari 100. Dari 100 serotipe tersebut, hanya beberapa yang menyebabkan kutil di bagian tubuh selain kelamin. Beberapa serotipe lain menyebabkan kutil pada kelamin dan sebagian lain dapat membuat kondisi serius, seperti kanker serviks.\n\nVirus ini menyebar dengan cara kontak kulit dan paling sering menginfeksi individu dengan sistem imun yang lemah, seperti anak-anak, lansia, atau seseorang yang mengidap masalah imunokompromais (HIV/AIDS, mengonsumsi kortikosteroid, dan diabetes mellitus).',
                            penyakit: 'Kutil',
                            tips:
                                'Ada beberapa cara yang dapat dilakukan untuk menurunkan risiko masalah kulit ini dan mencegah penyebarannya pada orang lain. \n\nKetahui beberapa cara pencegahannya, antara lain:\n1.Hindari kontak dengan kutil (diri sendiri maupun orang lain).\n2.Jaga kebersihan tangan.\n3.Jaga tubuh agar tidak lembap.\n4.Memakai alas kaki di tempat umum.\n5.Hindari menggaruk kutil.',
                            medicine: [
                              'assets/obat_kutil1.png',
                              'assets/obat_kutil2.png',
                              'assets/obat_kutil3.png',
                              'assets/obat_kutil4.png'
                            ],
                          ),
      ),
    );
  }
}
