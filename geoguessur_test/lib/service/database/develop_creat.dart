import 'package:firebase_storage/firebase_storage.dart';
import 'package:geoguessur_test/interface/place.dart';
import 'package:geoguessur_test/service/database/firestore_service.dart';

class DevelopCreat {
  final FirestoreService _firestoreService = FirestoreService();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> savePlacesToFirestore() async {
    // 既存のデータを全消去
    // await _firestoreService.deleteAllPlaces();

    final places = [
      Place(
        id: 1,
        name: '住吉大社',
        address: '大阪府大阪市住吉区住吉2丁目9-89',
        category: Category.shrine,
        popularity: 5,
        year: 211,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/sumiyoshi.jpg?alt=media&token=59bd2191-e220-46a0-a637-c1dc3f3965ee',
        description:
            "古くは摂津国 (せっつのくに＝大阪府北西部と兵庫県南東部を占める旧国名) の中でも、由緒が深く、信仰が篤い神社として、「一之宮」という社格がつけられ、人々に親しまれてきました。昭和21年までは官幣大社であり、全国約2300社余の住吉神社の総本社でもあります。",
      ),
      Place(
        id: 2,
        name: '四天王寺',
        address: '大阪府大阪市天王寺区四天王寺1丁目11-18',
        category: Category.temple,
        popularity: 4,
        year: 593,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/shitennouji.jpg?alt=media&token=d5112e91-3ec4-4078-a54b-46bc01386452',
        description: '本尊は阿弥陀如来。四天王寺は、大阪市内で最も古い寺院の一つです。',
      ),
      Place(
        id: 3,
        name: '平城宮跡',
        address: ' 奈良県奈良市二条大路南３丁目５−１',
        category: Category.ruins,
        popularity: 3,
        year: 710,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/heizei.jpg?alt=media&token=8c838412-3ae2-4845-8cda-98568730eb69',
        description: '',
      ),
      Place(
        id: 4,
        name: '大仙陵古墳',
        address: '阪府堺市堺区大仙町１０７９−１',
        category: Category.tomb,
        popularity: 2,
        year: 500,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/daizennkohunn.jpg?alt=media&token=5a9dba20-84ea-4788-93f8-96bbd85537c1',
        description: '',
      ),
      Place(
        id: 5,
        name: '伏見稲荷大社',
        address: '京都府京都市伏見区深草薮之内町68',
        category: Category.shrine,
        popularity: 5,
        year: 711,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/fushimiinari.jpg?alt=media&token=96b21d49-96de-425f-ae4f-33a7c3225d1c',
      ),
      Place(
        id: 6,
        name: '東大寺',
        address: '奈良県奈良市雑司町406-1',
        category: Category.temple,
        popularity: 5,
        year: 752,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/toudaiji.jpg?alt=media&token=59d2c3a8-03c7-4a13-a808-07920e904dde',
      ),
      Place(
        id: 7,
        name: '高松塚古墳',
        address: '奈良県高市郡明日香村平田444',
        category: Category.tomb,
        popularity: 3,
        year: 700,
        imageUrl: 'assets/images/default.jpg',
      ),
      Place(
        id: 8,
        name: '金閣寺',
        address: '京都府京都市北区金閣寺町1',
        category: Category.temple,
        popularity: 5,
        year: 1397,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/azumadera.jpg?alt=media&token=47e386b9-0362-45b4-89c3-cd58369b9e6e',
        description: '金閣寺は京都市北区にある寺院で、1397年に創建されました。',
      ),
      Place(
        id: 9,
        name: '銀閣寺',
        address: '京都府京都市左京区銀閣寺町2',
        category: Category.temple,
        popularity: 4,
        year: 1482,
        imageUrl: '',
        description: '銀閣寺は京都市左京区にある寺院で、1482年に創建されました。',
      ),
      Place(
        id: 10,
        name: '春日大社',
        address: '奈良県奈良市春日野町160',
        category: Category.shrine,
        popularity: 5,
        year: 768,
        imageUrl: '',
        description: '春日大社は奈良市にある神社で、768年に創建されました。',
      ),

      Place(
        id: 11,
        name: '熊野本宮大社',
        address: '和歌山県田辺市本宮町本宮1110',
        category: Category.shrine,
        popularity: 4,
        year: -33,
        imageUrl: '',
        description: '熊野本宮大社は和歌山県田辺市にある神社で、紀元前に創建されました。',
      ),

      Place(
        id: 12,
        name: '清水寺',
        address: '京都府京都市東山区清水1丁目294',
        category: Category.temple,
        popularity: 5,
        year: 778,
        imageUrl: '',
        description: '清水寺は京都市東山区にある寺院で、778年に創建されました。',
      ),
      Place(
        id: 13,
        name: '南禅寺',
        address: '京都府京都市左京区南禅寺福地町86',
        category: Category.temple,
        popularity: 4,
        year: 1291,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/nanzenji.jpg?alt=media&token=abcd567',
        description: '南禅寺は京都市左京区にある寺院で、1291年に創建されました。',
      ),
      Place(
        id: 14,
        name: '東寺',
        address: '京都府京都市南区九条町1',
        category: Category.temple,
        popularity: 4,
        year: 796,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/azumadera.jpg?alt=media&token=47e386b9-0362-45b4-89c3-cd58369b9e6e',
        description: '東寺は京都市南区にある寺院で、796年に創建されました。',
      ),
      Place(
        id: 15,
        name: '法隆寺',
        address: '奈良県生駒郡斑鳩町法隆寺',
        category: Category.temple,
        popularity: 5,
        year: 607,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/horyuji.jpg?alt=media&token=lmn678',
        description: '法隆寺は奈良県生駒郡斑鳩町にある寺院で、607年に創建されました。',
      ),
      Place(
        id: 16,
        name: '興福寺',
        address: '奈良県奈良市登大路町48',
        category: Category.temple,
        popularity: 4,
        year: 669,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/kofukuji.jpg?alt=media&token=opq901',
        description: '興福寺は奈良市にある寺院で、669年に創建されました。',
      ),
      Place(
        id: 17,
        name: '長谷寺',
        address: '奈良県桜井市初瀬７３１−１',
        category: Category.temple,
        popularity: 4,
        year: 686,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/hasedera.jpg?alt=media&token=rst234',
        description: '本尊は十一面観音。開山は道明とされる。西国三十三所第8番札所。寺紋は輪違い紋。',
      ),
      Place(
        id: 18,
        name: '東福寺',
        address: '京都府京都市東山区本町15丁目778',
        category: Category.temple,
        popularity: 4,
        year: 1236,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/tofukuji.jpg?alt=media&token=example',
        description:
            '京都五山の第四位の禅寺として中世、近世を通じて栄えた。近代に入って規模が縮小されたとはいえ、今なお25か寺の塔頭を有する大寺院である。',
      ),
      Place(
        id: 19,
        name: '三十三間堂',
        address: '京都府京都市東山区三十三間堂廻り町657',
        category: Category.temple,
        popularity: 5,
        year: 1164,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/sanjusangendo.jpg?alt=media&token=example',
        description:
            '元は後白河上皇が自身の離宮内に創建した仏堂で、蓮華王院の名称は千手観音の別称「蓮華王」に由来する。洛陽三十三所観音霊場第17番札所。',
      ),

      Place(
        id: 20,
        name: '石山寺',
        address: '滋賀県大津市石山寺1丁目1-1',
        category: Category.temple,
        popularity: 4,
        year: 747,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/ishiyamadera.jpg?alt=media&token=example',
        description:
            '当寺は琵琶湖の南端近くに位置し、琵琶湖から唯一流れ出る瀬田川の右岸にある。本堂は国の天然記念物の珪灰石（「石山寺硅灰石」）という巨大な岩盤の上に建ち、これが寺名の由来ともなっている（石山寺珪灰石は日本の地質百選に選定）。',
      ),

      Place(
        id: 21,
        name: '薬師寺',
        address: '奈良県奈良市西ノ京町457',
        category: Category.temple,
        popularity: 5,
        year: 680,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/yakushiji.jpg?alt=media&token=example',
        description:
            '1998年に「古都奈良の文化財」の構成資産の一つとして、国際連合教育科学文化機関により世界文化遺産に登録されている',
      ),

      Place(
        id: 22,
        name: '唐招提寺',
        address: '奈良県奈良市五条町13-46',
        category: Category.temple,
        popularity: 4,
        year: 759,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/toshodaiji.jpg?alt=media&token=example',
        description: '鑑真が晩年を過ごした寺であり、奈良時代建立の金堂、講堂を始め、多くの文化財を有する',
      ),
      Place(
        id: 23,
        name: '室生寺',
        address: '奈良県宇陀市室生78',
        category: Category.temple,
        popularity: 4,
        year: 803,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/muroji.jpg?alt=media&token=example',
        description: '山号は宀一山または檉生山。本尊は如意輪観音。「女人高野」の別称がある。',
      ),
      Place(
        id: 24,
        name: '石舞台古墳',
        address: '奈良県高市郡明日香村島庄',
        category: Category.tomb,
        popularity: 4,
        year: 601,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/ishibutai.jpg?alt=media&token=example',
        description:
            '埋葬者としては蘇我馬子が有力視されている。 元は土を盛りあげて作った墳丘で覆われていたが、その土が失われ、巨大な石を用いた横穴式石室が露出している。',
      ),

      Place(
        id: 25,
        name: '室生龍穴神社',
        address: '奈良県宇陀市室生１２９７',
        category: Category.shrine,
        popularity: 2,
        year: 780,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/tenrikyo.jpg?alt=media&token=example',
        description: '1,000 年以上の歴史がある静かな神社。小道を辿ると聖なる洞窟がある。',
      ),
      Place(
        id: 26,
        name: '橿原神宮',
        address: '奈良県橿原市久米町934',
        category: Category.shrine,
        popularity: 5,
        year: 1889,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/kashiharajingu.jpg?alt=media&token=example',
        description: '旧社格は官幣大社、勅祭社。現在は神社本庁の別表神社。畝傍山の麓にあり、神武天皇畝傍山東北陵の南にある。',
      ),

      Place(
        id: 27,
        name: '平等院',
        address: '京都府宇治市宇治蓮華116',
        category: Category.temple,
        popularity: 5,
        year: 1052,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/byoudouin.jpg?alt=media&token=5dfcb182-4558-4055-a392-baefbde0ed87',
        description:
            '宗派は17世紀以来天台宗と浄土宗を兼ね、現在は特定の宗派に属しておらず、塔頭である本山修験宗聖護院末寺の最勝院と浄土宗の浄土院が年交代制で共同管理している。 ',
      ),

      Place(
        id: 28,
        name: '比叡山延暦寺',
        address: '滋賀県大津市坂本本町4220',
        category: Category.temple,
        popularity: 4,
        year: 788,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/enryakuji.jpg?alt=media&token=example',
        description: '平安時代初期の僧・最澄により開かれた日本天台宗の本山寺院である。住職は天台座主と呼ばれ、末寺を統括する',
      ),
    ];

    for (var place in places) {
      await _firestoreService.createPlace(place);
    }
  }
}
