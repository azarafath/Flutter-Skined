import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skined/provider/article_page_provider.dart';
import 'package:skined/shared/theme.dart';
import 'package:skined/shared/size_config.dart';
import 'package:skined/ui/pages/detail_article_page.dart';
import 'package:skined/ui/widgets/article_tile_widget.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    ArticlePageProvider articlePageProvider =
        Provider.of<ArticlePageProvider>(context);
    Widget listArticle() {
      return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          elevation: 0,
          backgroundColor: whiteColor,
          automaticallyImplyLeading: false,
          toolbarHeight: getProportionateScreenHeight(60),
          centerTitle: true,
          flexibleSpace: Container(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                'Articles',
                style: latoTextStyle.copyWith(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: weightBold,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
        body: VsScrollbar(
          controller: _scrollController,
          showTrackOnHover: true, // default false
          isAlwaysShown: true,
          style: VsScrollbarStyle(
            color: Color(0xff9D9F9F),
            hoverThickness: 100.0,
            radius: Radius.circular(5),
            thickness: 7,
          ),
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                const ArticleTileWidget(
                  id: 0,
                  image: 'assets/tile_jerawat.png',
                  title: 'Jerawat',
                  subTitle:
                      'Jerawat adalah gangguan pada kulit. Kondisi ini berhubungan dengan produksi minyak yang terjadi',
                ),
                const ArticleTileWidget(
                  id: 1,
                  image: 'assets/tile_kudis.png',
                  title: 'Kudis',
                  subTitle:
                      'Kudis adalah kondisi yang ditandai dengan gatal di kulit, terutama di malam hari. Gatal ini disertai',
                ),
                const ArticleTileWidget(
                  id: 2,
                  image: 'assets/tile_kutil.png',
                  title: 'Kutil',
                  subTitle:
                      'Kutil adalah benjolan di kulit akibat infeksi virus human papilloma. Virus ini dapat menyerang',
                ),
                const ArticleTileWidget(
                  id: 3,
                  image: 'assets/tile_kurap.png',
                  title: 'Kurap',
                  subTitle:
                      'Kurap adalah infeksi jamur pada kulit yang menimbulkan ruam melingkar berwarna merah. Kurap dapat',
                ),
                const ArticleTileWidget(
                  id: 4,
                  image: 'assets/tile_dermatitis.png',
                  title: 'Dermatitis',
                  subTitle:
                      'Dermatitis merupakan penyakit kulit yang biasanya ditandai dengan peradangan dan ruam bengkak kemerahan',
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                )
              ],
            ),
          ),
        ),
      );
    }

    switch (articlePageProvider.currentIndex) {
      case 0:
        return const DetailArticle(
          title: 'Jerawat',
          image: 'assets/image_jerawat.png',
          subTitle:
              'Jerawat adalah gangguan pada kulit. Kondisi ini berhubungan dengan produksi minyak yang terjadi secara berlebihan. Minyak berlebih bisa menyumbat pori-pori kulit.\n\nPada setiap pori-pori kulit, terdapat folikel yang terdiri dari kelenjar minyak dan rambut. Jerawat terjadi ketika folikel rambut atau tempat tumbuhnya rambut tersumbat oleh minyak dan sel kulit mati.\n\nHal tersebut menyebabkan peradangan serta penyumbatan pada pori-pori kulit. Peradangan ini ditandai dengan munculnya benjolan kecil yang terkadang berisi nanah di atas kulit.\n\nGangguan kulit ini dapat terjadi di bagian tubuh dengan kelenjar minyak terbanyak, yaitu di wajah, leher, bagian atas dada, dan punggung. Benjolan inilah yang disebut dengan jerawat.\n\nPengobatan jerawat disesuaikan dengan tingkat keparahan kondisinya. Metode yang digunakan bisa dengan pemberian obat oles, obat minum, atau terapi hormon. Bisa juga dengan prosedur chemical peels, terapi laser dan ekstraksi komedo.\n\nMeski sulit untuk dicegah, risiko munculnya jerawat dapat dikurangi dengan menjaga kebersihan wajah dan tubuh, menerapkan pola makan yang sehat, dan mengelola stres dengan baik.',
        );
      case 1:
        return const DetailArticle(
          title: 'Kudis',
          image: 'assets/image_kudis.png',
          subTitle:
              'Kudis adalah kondisi yang ditandai dengan gatal di kulit, terutama di malam hari. Gatal ini disertai dengan kemunculan ruam berbintik yang menyerupai jerawat atau lepuhan kecil bersisik. Kondisi ini terjadi akibat tungau yang hidup dan bersarang di kulit.\n\nKudis atau scabies merupakan penyakit yang mudah menular, baik melalui kontak langsung maupun tidak langsung. Penyakit ini sangat mudah menyebar, terutama jika ada kontak dekat antarmanusia di suatu lingkungan.\n\nKudis disebabkan oleh tungau Sarcoptes scabiei. Tungau ini mengeluarkan air liur, telur, dan kotoran. Hal tersebut memicu respons dari sistem kekebalan tubuh sehingga menimbulkan gatal.\n\nSiklus perkembangan parasit tungau dimulai ketika tungau betina masuk ke kulit manusia, kemudian membuat lubang yang menyerupai terowongan untuk dijadikan sarang. Selanjutnya, tungau jantan akan memasuki sarang tersebut untuk kawin dengan tungau betina.\n\nSetelah kawin, tungau jantan akan mati dan tungau betina akan mulai bertelur di sarang tersebut. Telur akan menetas 3–4 hari setelahnya. Setelah menetas, tungau muda akan keluar ke permukaan kulit selama 1–2 minggu ke depan sampai mereka tumbuh menjadi tungau dewasa.\n\nSetelah dewasa, tungau jantan akan menetap di permukaan kulit. Sementara tungau betina akan masuk lagi ke dalam kulit untuk membuat sarang baru dan mengulang siklus yang sama.\n\nPerlu diketahui, tungau kudis adalah parasit yang tinggal di lapisan kulit yang dalam. Hal ini membuatnya kebal terhadap sabun dan air panas, serta tidak akan hilang jika kulit hanya digosok-gosokkan. Tanpa penanganan yang tepat, tungau akan terus berkembang biak dan siklus perkembangan tungau akan terus berlanjut.',
        );
      case 2:
        return const DetailArticle(
          title: 'Kutil',
          image: 'assets/image_kutil.png',
          subTitle:
              'Kutil adalah benjolan di kulit akibat infeksi virus human papilloma. Virus ini dapat menyerang berbagai bagian tubuh, termasuk telapak tangan, kaki, dan kelamin.\n\nVirus penyebab kutil biasanya menular melalui kontak fisik dengan penderita kutil atau dari benda yang terkontaminasi. Setelah kulit terpapar HPV, kutil membutuhkan waktu sekitar 2–6 bulan untuk berkembang.\n\nKutil yang tergolong ringan biasanya dapat sembuh tanpa diobati. Meski demikian, kutil bisa menyebabkan nyeri dan iritasi di kulit. Oleh karena itu, segera periksakan diri ke dokter bila memiliki kutil, untuk mendapatkan penanganan yang tepat.\n\nKutil ditandai dengan benjolan kecil atau datar di kulit. Benjolan ini bisa bertekstur kasar atau halus, dengan warna seperti kulit, cokelat, atau hitam.\n\nKutil terjadi ketika virus HPV menginfeksi kulit dan membentuk benjolan kecil. Virus ini dapat menyebar melalui berbagai cara, misalnya kontak langsung dengan orang yang memiliki kutil, atau berhubungan seksual dengan penderita kutil kelamin.',
        );
      case 3:
        return const DetailArticle(
          title: 'Kurap',
          image: 'assets/image_kurap.png',
          subTitle:
              'Kurap adalah infeksi jamur pada kulit yang menimbulkan ruam melingkar berwarna merah. Kurap dapat terjadi di beberapa area tubuh, seperti kepala, wajah, tangan, kaki, atau selangkangan.\n\nJamur merupakan organisme yang bisa hidup di berbagai tempat, termasuk di tubuh manusia. Sebagian jamur tidak berbahaya bagi manusia, tetapi sebagian lainnya dapat berbahaya jika tumbuh dan berkembang di tubuh manusia dengan cepat.\n\nKarena bentuknya seperti cincin atau cacing yang melingkar, kurap juga dikenal dengan sebutan ringworm\n\nPenyebab dan Gejala Kurap\nKurap disebabkan oleh infeksi jamur pada kulit. Jamur ini dapat menular melalui kontak langsung dengan penderita atau kontak tidak langsung dengan benda atau tanah yang terkontaminasi.\n\nUdara panas dan lembap, berbagi pemakaian barang pribadi, dan memakai pakaian yang ketat bisa membuat seseorang lebih rentan terkena kurap.\n\nKurap ditandai dengan munculnya ruam bersisik berwarna kemerahan di permukaan kulit. Ruam kulit ini dapat meluas. Meski demikian, gejala kurap dapat berbeda-beda pada tiap orang, tergantung pada lokasi kurap.',
        );
      case 4:
        return const DetailArticle(
          title: 'Dermatitis',
          image: 'assets/image_dermatitis.png',
          subTitle:
              'Dermatitis merupakan penyakit kulit yang biasanya ditandai dengan peradangan dan ruam bengkak kemerahan. Kondisi ini umumnya membuat kulit menjadi sangat kering.\n\nPada kondisi yang lebih serius, kulit yang terkena penyakit dermatitis bisa sampai melepuh, mengeluarkan cairan, hingga mengelupas. Maka tak heran, bagi beberapa penderitanya, penyakit ini kerap mengganggu alias bikin tidak nyaman. Hal ini dikarenakan rasa gatal yang menyertainya bisa sangat ringan bahkan sangat parah.\n\nPenyakit dermatitis ini bisa menyerang siapa saja alias bisa terjadi pada semua usia, termasuk bayi sekalipun. Apalagi buat kamu yang memiliki riwayat alergi, demam atau asma maka lebih rentan terkena dermatitis.\n\nDermatitis sendiri terdiri dari beberapa jenis. Tiap jenisnya memiliki gejala yang berbeda-beda. Ada yang menetap dalam waktu lama, ada lagi yang hanya muncul jika terpapar zat tertentu.\n\nSalah satu penyebab dermatitis adalah karena seringnya atau kerap mencuci tangan, sehingga kulit menjadi kering. Oleh karena itu, salah satu cara mencegah dermatitis adalah dengan menjaga kulit agar tidak kering.',
        );
      case 5:
        return listArticle();
      default:
        return listArticle();
    }
  }
}
