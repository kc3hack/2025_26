import 'package:firebase_storage/firebase_storage.dart';
import 'package:geoguessur_test/interface/place.dart';
import 'package:geoguessur_test/service/database/firestore_service.dart';

class DevelopCreat {
  final FirestoreService _firestoreService = FirestoreService();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> savePlacesToFirestore() async {
    // 既存のデータを全消去
    await _firestoreService.deleteAllPlaces();

    final places = [
      Place(
        name: '住吉大社',
        address: '大阪府大阪市住吉区住吉2丁目9-89',
        category: Category.shrine,
        popularity: 5,
        year: '211',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/sumiyoshi.jpg?alt=media&token=59bd2191-e220-46a0-a637-c1dc3f3965ee',
      ),
      Place(
        name: '四天王寺',
        address: '大阪府大阪市天王寺区四天王寺1丁目11-18',
        category: Category.temple,
        popularity: 4,
        year: '593',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/shitennouji.jpg?alt=media&token=d5112e91-3ec4-4078-a54b-46bc01386452',
      ),
      Place(
        name: '平城宮跡',
        address: '奈良県奈良市佐紀町',
        category: Category.ruins,
        popularity: 3,
        year: '710',
        imageUrl: 'assets/images/default.jpg',
      ),
      Place(
        name: '大仙陵古墳',
        address: '大阪府堺市堺区大仙町',
        category: Category.tomb,
        popularity: 2,
        year: '5世紀',
        imageUrl: 'assets/images/default.jpg',
      ),
      Place(
        name: '伏見稲荷大社',
        address: '京都府京都市伏見区深草薮之内町68',
        category: Category.shrine,
        popularity: 5,
        year: '711',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/fushimiinari.jpg?alt=media&token=96b21d49-96de-425f-ae4f-33a7c3225d1c',
      ),
      Place(
        name: '東大寺',
        address: '奈良県奈良市雑司町406-1',
        category: Category.temple,
        popularity: 5,
        year: '752',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/toudaiji.jpg?alt=media&token=59d2c3a8-03c7-4a13-a808-07920e904dde',
      ),
      Place(
        name: '高松塚古墳',
        address: '奈良県高市郡明日香村平田',
        category: Category.tomb,
        popularity: 3,
        year: '7世紀',
        imageUrl: 'assets/images/default.jpg',
      ),
      Place(
        name: '金閣寺',
        address: '京都府京都市北区金閣寺町1',
        category: Category.temple,
        popularity: 5,
        year: '1397',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/kinkakuji.jpg?alt=media&token=abc123',
        description: '金閣寺は京都市北区にある寺院で、1397年に創建されました。',
      ),
      Place(
        name: '銀閣寺',
        address: '京都府京都市左京区銀閣寺町2',
        category: Category.temple,
        popularity: 4,
        year: '1482',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/ginkakuji.jpg?alt=media&token=def456',
        description: '銀閣寺は京都市左京区にある寺院で、1482年に創建されました。',
      ),
      Place(
        name: '春日大社',
        address: '奈良県奈良市春日野町160',
        category: Category.shrine,
        popularity: 5,
        year: '768',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/kasugataisha.jpg?alt=media&token=ghi789',
        description: '春日大社は奈良市にある神社で、768年に創建されました。',
      ),

      Place(
        name: '熊野本宮大社',
        address: '和歌山県田辺市本宮町本宮1110',
        category: Category.shrine,
        popularity: 4,
        year: '紀元前',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/kumanohongu.jpg?alt=media&token=pqr678',
        description: '熊野本宮大社は和歌山県田辺市にある神社で、紀元前に創建されました。',
      ),

      Place(
        name: '清水寺',
        address: '京都府京都市東山区清水1丁目294',
        category: Category.temple,
        popularity: 5,
        year: '778',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/kiyomizudera.jpg?alt=media&token=yz1234',
        description: '清水寺は京都市東山区にある寺院で、778年に創建されました。',
      ),
      Place(
        name: '南禅寺',
        address: '京都府京都市左京区南禅寺福地町86',
        category: Category.temple,
        popularity: 4,
        year: '1291',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/nanzenji.jpg?alt=media&token=abcd567',
        description: '南禅寺は京都市左京区にある寺院で、1291年に創建されました。',
      ),
      Place(
        name: '東寺',
        address: '京都府京都市南区九条町1',
        category: Category.temple,
        popularity: 4,
        year: '796',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/toji.jpg?alt=media&token=efg890',
        description: '東寺は京都市南区にある寺院で、796年に創建されました。',
      ),
      Place(
        name: '法隆寺',
        address: '奈良県生駒郡斑鳩町法隆寺',
        category: Category.temple,
        popularity: 5,
        year: '607',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/horyuji.jpg?alt=media&token=lmn678',
        description: '法隆寺は奈良県生駒郡斑鳩町にある寺院で、607年に創建されました。',
      ),
      Place(
        name: '興福寺',
        address: '奈良県奈良市登大路町48',
        category: Category.temple,
        popularity: 4,
        year: '669',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/kofukuji.jpg?alt=media&token=opq901',
        description: '興福寺は奈良市にある寺院で、669年に創建されました。',
      ),
      Place(
        name: '長谷寺',
        address: '奈良県桜井市大字長谷',
        category: Category.temple,
        popularity: 4,
        year: '686',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/hasedera.jpg?alt=media&token=rst234',
        description: '長谷寺は奈良県桜井市にある寺院で、686年に創建されました。',
      ),
      Place(
        name: '東福寺',
        address: '京都府京都市東山区本町15丁目778',
        category: Category.temple,
        popularity: 4,
        year: '1236',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/tofukuji.jpg?alt=media&token=example',
        description: '東福寺は京都市東山区にある寺院で、1236年に創建されました。',
      ),
      Place(
        name: '三十三間堂',
        address: '京都府京都市東山区三十三間堂廻り町657',
        category: Category.temple,
        popularity: 5,
        year: '1164',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/sanjusangendo.jpg?alt=media&token=example',
        description: '三十三間堂は京都市東山区にある寺院で、1164年に創建されました。',
      ),

      Place(
        name: '石山寺',
        address: '滋賀県大津市石山寺1丁目1-1',
        category: Category.temple,
        popularity: 4,
        year: '747',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/ishiyamadera.jpg?alt=media&token=example',
        description: '石山寺は滋賀県大津市にある寺院で、747年に創建されました。',
      ),

      Place(
        name: '薬師寺',
        address: '奈良県奈良市西ノ京町457',
        category: Category.temple,
        popularity: 5,
        year: '680',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/yakushiji.jpg?alt=media&token=example',
        description: '薬師寺は奈良県奈良市にある寺院で、680年に創建されました。',
      ),

      Place(
        name: '唐招提寺',
        address: '奈良県奈良市五条町13-46',
        category: Category.temple,
        popularity: 4,
        year: '759',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/toshodaiji.jpg?alt=media&token=example',
        description: '唐招提寺は奈良県奈良市にある寺院で、759年に創建されました。',
      ),
      Place(
        name: '室生寺',
        address: '奈良県宇陀市室生78',
        category: Category.temple,
        popularity: 4,
        year: '8世紀',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/muroji.jpg?alt=media&token=example',
        description: '室生寺は奈良県宇陀市にある寺院で、8世紀に創建されました。',
      ),
      Place(
        name: '石舞台古墳',
        address: '奈良県高市郡明日香村島庄',
        category: Category.tomb,
        popularity: 4,
        year: '7世紀',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/ishibutai.jpg?alt=media&token=example',
        description: '石舞台古墳は奈良県明日香村にある古墳で、7世紀に創建されました。',
      ),
      Place(
        name: '箸墓古墳',
        address: '奈良県桜井市箸中',
        category: Category.tomb,
        popularity: 3,
        year: '3世紀',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/hashihaka.jpg?alt=media&token=example',
        description: '箸墓古墳は奈良県桜井市にある古墳で、3世紀に創建されました。',
      ),
      Place(
        name: '天理教本部',
        address: '奈良県天理市三島町1-1',
        category: Category.shrine,
        popularity: 4,
        year: '1838',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/tenrikyo.jpg?alt=media&token=example',
        description: '天理教本部は奈良県天理市にある神社で、1838年に創建されました。',
      ),
      Place(
        name: '橿原神宮',
        address: '奈良県橿原市久米町934',
        category: Category.shrine,
        popularity: 5,
        year: '1889',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/kashiharajingu.jpg?alt=media&token=example',
        description: '橿原神宮は奈良県橿原市にある神社で、1889年に創建されました。',
      ),
      Place(
        name: '大神神社',
        address: '奈良県桜井市三輪1422',
        category: Category.shrine,
        popularity: 5,
        year: '紀元前',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/oomiwa.jpg?alt=media&token=example',
        description: '大神神社は奈良県桜井市にある神社で、紀元前に創建されました。',
      ),

      Place(
        name: '熊野本宮大社',
        address: '和歌山県田辺市本宮町本宮1110',
        category: Category.shrine,
        popularity: 4,
        year: '紀元前',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/kumanohongu.jpg?alt=media&token=example',
        description: '熊野本宮大社は和歌山県田辺市にある神社で、紀元前に創建されました。',
      ),

      Place(
        name: '薬師寺',
        address: '奈良県奈良市西ノ京町457',
        category: Category.temple,
        popularity: 5,
        year: '680',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/yakushiji.jpg?alt=media&token=example',
        description: '薬師寺は奈良県奈良市にある寺院で、680年に創建されました。',
      ),

      Place(
        name: '平等院',
        address: '京都府宇治市宇治蓮華116',
        category: Category.temple,
        popularity: 5,
        year: '1052',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/byodoin.jpg?alt=media&token=example',
        description: '平等院は京都府宇治市にある寺院で、1052年に創建されました。',
      ),

      Place(
        name: '唐招提寺',
        address: '奈良県奈良市五条町13-46',
        category: Category.temple,
        popularity: 4,
        year: '759',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/toshodaiji.jpg?alt=media&token=example',
        description: '唐招提寺は奈良県奈良市にある寺院で、759年に創建されました。',
      ),
      Place(
        name: '室生寺',
        address: '奈良県宇陀市室生78',
        category: Category.temple,
        popularity: 4,
        year: '8世紀',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/muroji.jpg?alt=media&token=example',
        description: '室生寺は奈良県宇陀市にある寺院で、8世紀に創建されました。',
      ),
      Place(
        name: '石舞台古墳',
        address: '奈良県高市郡明日香村島庄',
        category: Category.tomb,
        popularity: 4,
        year: '7世紀',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/ishibutai.jpg?alt=media&token=example',
        description: '石舞台古墳は奈良県明日香村にある古墳で、7世紀に創建されました。',
      ),
      Place(
        name: '箸墓古墳',
        address: '奈良県桜井市箸中',
        category: Category.tomb,
        popularity: 3,
        year: '3世紀',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/hashihaka.jpg?alt=media&token=example',
        description: '箸墓古墳は奈良県桜井市にある古墳で、3世紀に創建されました。',
      ),
      Place(
        name: '天理教本部',
        address: '奈良県天理市三島町1-1',
        category: Category.shrine,
        popularity: 4,
        year: '1838',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/tenrikyo.jpg?alt=media&token=example',
        description: '天理教本部は奈良県天理市にある神社で、1838年に創建されました。',
      ),
      Place(
        name: '橿原神宮',
        address: '奈良県橿原市久米町934',
        category: Category.shrine,
        popularity: 5,
        year: '1889',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/kashiharajingu.jpg?alt=media&token=example',
        description: '橿原神宮は奈良県橿原市にある神社で、1889年に創建されました。',
      ),
      Place(
        name: '大神神社',
        address: '奈良県桜井市三輪1422',
        category: Category.shrine,
        popularity: 5,
        year: '紀元前',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/oomiwa.jpg?alt=media&token=example',
        description: '大神神社は奈良県桜井市にある神社で、紀元前に創建されました。',
      ),

      Place(
        name: '比叡山延暦寺',
        address: '滋賀県大津市坂本本町4220',
        category: Category.temple,
        popularity: 4,
        year: '788',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/enryakuji.jpg?alt=media&token=example',
        description: '比叡山延暦寺は滋賀県大津市にある寺院で、788年に創建されました。',
      ),
      Place(
        name: '熊野本宮大社',
        address: '和歌山県田辺市本宮町本宮1110',
        category: Category.shrine,
        popularity: 4,
        year: '紀元前',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/kumanohongu.jpg?alt=media&token=example',
        description: '熊野本宮大社は和歌山県田辺市にある神社で、紀元前に創建されました。',
      ),

      Place(
        name: '薬師寺',
        address: '奈良県奈良市西ノ京町457',
        category: Category.temple,
        popularity: 5,
        year: '680',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/shrines-and-temples-app.firebasestorage.app/o/yakushiji.jpg?alt=media&token=example',
        description: '薬師寺は奈良県奈良市にある寺院で、680年に創建されました。',
      ),
    ];

    for (var place in places) {
      await _firestoreService.createPlace(place);
    }
  }
}
