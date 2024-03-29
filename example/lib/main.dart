import 'package:coordinate_drawer/coordinate_drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
          ),
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              shape: BoxShape.circle,
            ),
            child: InteractiveViewer(
              maxScale: 100,
              minScale: 0.1,
              boundaryMargin: const EdgeInsets.all(200),
              child: SizedBox(
                height: 300,
                width: 300,
                child: RepaintBoundary(
                  child: CoordinateDrawer(
                    coordinateLists: [
                      germany,
                    ],
                    closeShapes: true,
                    lineWidth: 5,
                    drawPoints: true,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final square1 = [
  const Coordinate(lat: 10, lon: 11),
  const Coordinate(lat: 11, lon: 11),
  const Coordinate(lat: 11, lon: 10),
  const Coordinate(lat: 10, lon: 10),
];

final fra = [
  [
    const Coordinate(lat: 50.0344, lon: 8.52593),
    const Coordinate(lat: 49.9984, lon: 8.52608),
  ],
  [
    const Coordinate(lat: 50.0326, lon: 8.53463),
    const Coordinate(lat: 50.0451, lon: 8.58698),
  ],
  [
    const Coordinate(lat: 50.0371, lon: 8.49708),
    const Coordinate(lat: 50.0458, lon: 8.53372),
  ],
  [
    const Coordinate(lat: 50.0275, lon: 8.53417),
    const Coordinate(lat: 50.0401, lon: 8.58653),
  ]
];

final pafa = [
  [
    const Coordinate(lat: 64.8161, lon: -147.847),
    const Coordinate(lat: 64.8223, lon: -147.835),
  ],
  [
    const Coordinate(lat: 64.8026, lon: -147.886),
    const Coordinate(lat: 64.828, lon: -147.839),
  ],
  [
    const Coordinate(lat: 64.8002, lon: -147.876),
    const Coordinate(lat: 64.8142, lon: -147.85),
  ],
];

List<Coordinate> getGlobus() {
  final List<Coordinate> list = [];
  for (var i = -17; i < 18; i++) {
    for (var j = -90; j < 90; j++) {
      list.add(
        Coordinate(lat: j * 1, lon: i * 10),
      );
    }
  }
  return list;
}

final test = [
  const Coordinate(lat: 00, lon: 00),
  const Coordinate(lat: 10, lon: 00),
  const Coordinate(lat: 20, lon: 00),
  const Coordinate(lat: 30, lon: 00),
  const Coordinate(lat: 40, lon: 00),
  const Coordinate(lat: 50, lon: 00),
  const Coordinate(lat: 60, lon: 00),
  const Coordinate(lat: 70, lon: 00),
  const Coordinate(lat: 80, lon: 00),
];

final grid = [
  const Coordinate(lat: 0, lon: 0),
  const Coordinate(lat: 0, lon: 10),
  const Coordinate(lat: 10, lon: 0),
  const Coordinate(lat: 10, lon: 10),
  const Coordinate(lat: 20, lon: 0),
  const Coordinate(lat: 20, lon: 10),
  const Coordinate(lat: 30, lon: 0),
  const Coordinate(lat: 30, lon: 10),
  const Coordinate(lat: 40, lon: 0),
  const Coordinate(lat: 40, lon: 10),
  const Coordinate(lat: 50, lon: 0),
  const Coordinate(lat: 50, lon: 10),
  const Coordinate(lat: 60, lon: 0),
  const Coordinate(lat: 60, lon: 10),
  const Coordinate(lat: 70, lon: 0),
  const Coordinate(lat: 70, lon: 10),
  const Coordinate(lat: 80, lon: 0),
  const Coordinate(lat: 80, lon: 10),
  const Coordinate(lat: 90, lon: 0),
  const Coordinate(lat: 90, lon: 10),
];

final germany = [
  const Coordinate(lon: 8.407297932191138, lat: 55.04395228653645),
  const Coordinate(lon: 8.442500114441145, lat: 55.0159721374514),
  const Coordinate(lon: 8.353609085083235, lat: 54.967361450195654),
  const Coordinate(lon: 8.366944313049544, lat: 54.90236282348644),
  const Coordinate(lon: 8.429720878601302, lat: 54.87763977050787),
  const Coordinate(lon: 8.812039375305233, lat: 54.9167366027832),
  const Coordinate(lon: 9.224779129028263, lat: 54.85595321655279),
  const Coordinate(lon: 9.282591819763411, lat: 54.80223464965832),
  const Coordinate(lon: 9.408679962158317, lat: 54.841171264648494),
  const Coordinate(lon: 9.435277938842773, lat: 54.788471221923885),
  const Coordinate(lon: 9.613611221313704, lat: 54.87597274780296),
  const Coordinate(lon: 9.603055953979776, lat: 54.83152770996105),
  const Coordinate(lon: 9.84305572509794, lat: 54.756248474121094),
  const Coordinate(lon: 9.955279350281046, lat: 54.780139923095646),
  const Coordinate(lon: 10.034722328186263, lat: 54.67235946655285),
  const Coordinate(lon: 9.983054161071891, lat: 54.701248168945426),
  const Coordinate(lon: 9.963891689870369, lat: 54.67303628596345),
  const Coordinate(lon: 10.034166336059798, lat: 54.66986083984375),
  const Coordinate(lon: 10.02750015258789, lat: 54.55041503906284),
  const Coordinate(lon: 9.840277671813965, lat: 54.46736145019537),
  const Coordinate(lon: 10.199167251587141, lat: 54.45597076416027),
  const Coordinate(lon: 10.13194561004633, lat: 54.311248779296875),
  const Coordinate(lon: 10.228056907653865, lat: 54.413471221923885),
  const Coordinate(lon: 10.318612098693961, lat: 54.43569564819353),
  const Coordinate(lon: 10.704722404479924, lat: 54.304862976074276),
  const Coordinate(lon: 10.928610801696777, lat: 54.381805419922216),
  const Coordinate(lon: 11.128055572509766, lat: 54.39069366455084),
  const Coordinate(lon: 11.058609962463436, lat: 54.35430526733438),
  const Coordinate(lon: 11.093610763550032, lat: 54.19791793823248),
  const Coordinate(lon: 10.75416564941412, lat: 54.05486297607433),
  const Coordinate(lon: 10.890831947326603, lat: 53.955696105956974),
  const Coordinate(lon: 11.179167747497502, lat: 54.01569366455084),
  const Coordinate(lon: 11.258610725403116, lat: 53.98485946655296),
  const Coordinate(lon: 11.258610725403116, lat: 53.93402862548851),
  const Coordinate(lon: 11.335276603698844, lat: 53.95847320556646),
  const Coordinate(lon: 11.45472240447998, lat: 53.900417327881144),
  const Coordinate(lon: 11.483610153198242, lat: 53.968471527099666),
  const Coordinate(lon: 11.378055572509936, lat: 53.997360229492244),
  const Coordinate(lon: 11.492501258850325, lat: 54.02291488647472),
  const Coordinate(lon: 11.490279197693042, lat: 53.968193054199276),
  const Coordinate(lon: 11.62583255767845, lat: 54.08958435058588),
  const Coordinate(lon: 11.525277137756348, lat: 54.07180404663086),
  const Coordinate(lon: 11.682498931884766, lat: 54.15319442749018),
  const Coordinate(lon: 12.087498664856184, lat: 54.18319320678711),
  const Coordinate(lon: 12.124721527099894, lat: 54.150138854980526),
  const Coordinate(lon: 12.09527778625494, lat: 54.18097305297857),
  const Coordinate(lon: 12.339165687561263, lat: 54.2979164123538),
  const Coordinate(lon: 12.519721031188965, lat: 54.484306335449276),
  const Coordinate(lon: 12.962499618530387, lat: 54.437637329101676),
  const Coordinate(lon: 12.68351455577495, lat: 54.40644354068151),
  const Coordinate(lon: 12.715277671814022, lat: 54.404304504394474),
  const Coordinate(lon: 12.678054809570312, lat: 54.37014007568371),
  const Coordinate(lon: 12.786945343017862, lat: 54.3962516784668),
  const Coordinate(lon: 12.810278892517147, lat: 54.3451385498048),
  const Coordinate(lon: 13.019721984863338, lat: 54.43902587890659),
  const Coordinate(lon: 13.093609809875716, lat: 54.366806030273665),
  const Coordinate(lon: 13.105833053588867, lat: 54.281806945800895),
  const Coordinate(lon: 13.286388397216797, lat: 54.235137939453296),
  const Coordinate(lon: 13.346388816833723, lat: 54.18041610717819),
  const Coordinate(lon: 13.318054199219034, lat: 54.15986251831066),
  const Coordinate(lon: 13.415834426880224, lat: 54.17514038085943),
  const Coordinate(lon: 13.382498741150187, lat: 54.14236068725586),
  const Coordinate(lon: 13.456945419311523, lat: 54.090694427490234),
  const Coordinate(lon: 13.696389198303223, lat: 54.17180633544956),
  const Coordinate(lon: 13.806944847107104, lat: 54.10319519042969),
  const Coordinate(lon: 13.74416637420677, lat: 54.029304504394645),
  const Coordinate(lon: 13.914167404174805, lat: 53.92235946655302),
  const Coordinate(lon: 13.824722290039404, lat: 53.866249084473),
  const Coordinate(lon: 13.937500953674316, lat: 53.90847396850597),
  const Coordinate(lon: 13.90583419799816, lat: 53.98986053466797),
  const Coordinate(lon: 13.965278625488452, lat: 53.99013900756853),
  const Coordinate(lon: 13.959721565246582, lat: 53.93402862548851),
  const Coordinate(lon: 14.042499542236555, lat: 53.942081451416016),
  const Coordinate(lon: 14.046944618225268, lat: 53.99652862548845),
  const Coordinate(lon: 14.00347855685085, lat: 54.0366769060455),
  const Coordinate(lon: 14.221389770507926, lat: 53.93013763427729),
  const Coordinate(lon: 14.186329841613997, lat: 53.91558074951217),
  const Coordinate(lon: 14.2173366546632, lat: 53.865417480469205),
  const Coordinate(lon: 13.806388854980412, lat: 53.85819625854492),
  const Coordinate(lon: 14.038612365722884, lat: 53.75513839721674),
  const Coordinate(lon: 14.2830562591555, lat: 53.73875045776384),
  const Coordinate(lon: 14.215276718139592, lat: 53.70264053344738),
  const Coordinate(lon: 14.273162841796875, lat: 53.69930648803711),
  const Coordinate(lon: 14.324908256530762, lat: 53.61864852905296),
  const Coordinate(lon: 14.302708625793684, lat: 53.54261016845703),
  const Coordinate(lon: 14.448929786682186, lat: 53.26163864135748),
  const Coordinate(lon: 14.378918647766113, lat: 53.204158782958984),
  const Coordinate(lon: 14.345703125000057, lat: 53.052917480468864),
  const Coordinate(lon: 14.142452239990291, lat: 52.961112976074276),
  const Coordinate(lon: 14.121270179748649, lat: 52.84027099609369),
  const Coordinate(lon: 14.639061927795638, lat: 52.58003234863287),
  const Coordinate(lon: 14.600604057312069, lat: 52.53302383422857),
  const Coordinate(lon: 14.631249427795638, lat: 52.499130249023665),
  const Coordinate(lon: 14.528908729553166, lat: 52.39641189575218),
  const Coordinate(lon: 14.570899963378906, lat: 52.2895622253418),
  const Coordinate(lon: 14.699570655822868, lat: 52.24108886718756),
  const Coordinate(lon: 14.669348716736067, lat: 52.12155151367199),
  const Coordinate(lon: 14.741278648376522, lat: 52.07339096069347),
  const Coordinate(lon: 14.70477771759056, lat: 51.94266128540062),
  const Coordinate(lon: 14.586701393127385, lat: 51.823604583740234),
  const Coordinate(lon: 14.738728523254622, lat: 51.66687011718744),
  const Coordinate(lon: 14.698139190673942, lat: 51.55850982666027),
  const Coordinate(lon: 14.933858871460018, lat: 51.482269287109375),
  const Coordinate(lon: 14.967818260192928, lat: 51.3544158935548),
  const Coordinate(lon: 15.028479576110897, lat: 51.30979919433605),
  const Coordinate(lon: 14.930111885070744, lat: 50.99140548706072),
  const Coordinate(lon: 14.8050794601441, lat: 50.828918457031534),
  const Coordinate(lon: 14.710870742797965, lat: 50.826759338379134),
  const Coordinate(lon: 14.611928939819393, lat: 50.85478210449219),
  const Coordinate(lon: 14.651672363281364, lat: 50.93264007568365),
  const Coordinate(lon: 14.560112953186092, lat: 50.92348480224615),
  const Coordinate(lon: 14.595055580139274, lat: 50.988510131836165),
  const Coordinate(lon: 14.501680374145508, lat: 51.05150604248075),
  const Coordinate(lon: 14.39741039276123, lat: 51.00828170776373),
  const Coordinate(lon: 14.29401683807373, lat: 51.05416488647461),
  const Coordinate(lon: 14.246868133545036, lat: 50.97320175170904),
  const Coordinate(lon: 14.400946617126465, lat: 50.94234848022472),
  const Coordinate(lon: 14.372268676757926, lat: 50.88858032226568),
  const Coordinate(lon: 13.954609870910872, lat: 50.80371093750006),
  const Coordinate(lon: 13.850809097290096, lat: 50.71820068359375),
  const Coordinate(lon: 13.548975944519043, lat: 50.713214874267635),
  const Coordinate(lon: 13.465190887451229, lat: 50.59648895263689),
  const Coordinate(lon: 13.374910354614315, lat: 50.643661499023665),
  const Coordinate(lon: 13.326787948608512, lat: 50.581813812255916),
  const Coordinate(lon: 13.248618125915641, lat: 50.59226989746088),
  const Coordinate(lon: 13.195990562439079, lat: 50.500591278076286),
  const Coordinate(lon: 13.0332670211792, lat: 50.50854873657232),
  const Coordinate(lon: 12.977046012878645, lat: 50.41427230834961),
  const Coordinate(lon: 12.828769683837834, lat: 50.45862197875988),
  const Coordinate(lon: 12.705128669738826, lat: 50.39775848388672),
  const Coordinate(lon: 12.51611328125, lat: 50.40008544921898),
  const Coordinate(lon: 12.364088058471737, lat: 50.27642440795904),
  const Coordinate(lon: 12.32758998870844, lat: 50.17972946166998),
  const Coordinate(lon: 12.282715797424373, lat: 50.18267822265631),
  const Coordinate(lon: 12.194091796874943, lat: 50.32287597656256),
  const Coordinate(lon: 12.085860252380428, lat: 50.25535202026384),
  const Coordinate(lon: 12.198919296264876, lat: 50.19562149047863),
  const Coordinate(lon: 12.19906044006359, lat: 50.11182022094732),
  const Coordinate(lon: 12.256030082702637, lat: 50.062278747558594),
  const Coordinate(lon: 12.547736167907715, lat: 49.92714309692383),
  const Coordinate(lon: 12.472072601318473, lat: 49.79027175903349),
  const Coordinate(lon: 12.402890205383244, lat: 49.75516128540045),
  const Coordinate(lon: 12.527859687805176, lat: 49.68775939941435),
  const Coordinate(lon: 12.588051795959473, lat: 49.54399871826166),
  const Coordinate(lon: 12.645830154418945, lat: 49.53105926513672),
  const Coordinate(lon: 12.661074638366813, lat: 49.43216705322294),
  const Coordinate(lon: 12.78410530090332, lat: 49.35190582275402),
  const Coordinate(lon: 13.033589363098258, lat: 49.30863952636736),
  const Coordinate(lon: 13.180210113525618, lat: 49.144439697265625),
  const Coordinate(lon: 13.403729438781738, lat: 49.05178070068382),
  const Coordinate(lon: 13.401620864868221, lat: 48.98391342163103),
  const Coordinate(lon: 13.63125991821289, lat: 48.95058059692383),
  const Coordinate(lon: 13.835957527160701, lat: 48.7750511169433),
  const Coordinate(lon: 13.78705883026123, lat: 48.721511840820426),
  const Coordinate(lon: 13.809944152832088, lat: 48.590904235840014),
  const Coordinate(lon: 13.721092224121207, lat: 48.51679229736334),
  const Coordinate(lon: 13.503158569335938, lat: 48.59651184082037),
  const Coordinate(lon: 13.435749053955078, lat: 48.564682006835994),
  const Coordinate(lon: 13.410618782043514, lat: 48.377738952636776),
  const Coordinate(lon: 13.285719871520996, lat: 48.30517196655279),
  const Coordinate(lon: 12.868214607238826, lat: 48.20366668701183),
  const Coordinate(lon: 12.753028869628963, lat: 48.11729049682623),
  const Coordinate(lon: 13.00114727020275, lat: 47.8522300720216),
  const Coordinate(lon: 12.91126728057867, lat: 47.73124313354498),
  const Coordinate(lon: 13.043539047241325, lat: 47.720989227295206),
  const Coordinate(lon: 13.105588912963867, lat: 47.639202117920036),
  const Coordinate(lon: 13.013463973999023, lat: 47.46576690673845),
  const Coordinate(lon: 12.799818038940373, lat: 47.561462402343864),
  const Coordinate(lon: 12.826677322387695, lat: 47.61626052856451),
  const Coordinate(lon: 12.782772064209098, lat: 47.675922393799055),
  const Coordinate(lon: 12.605334281921444, lat: 47.67924880981457),
  const Coordinate(lon: 12.506064414978141, lat: 47.62885284423828),
  const Coordinate(lon: 12.43596267700218, lat: 47.70073318481451),
  const Coordinate(lon: 12.258779525756836, lat: 47.67621994018549),
  const Coordinate(lon: 12.254279136657772, lat: 47.739990234375114),
  const Coordinate(lon: 12.17435169219982, lat: 47.698875427246094),
  const Coordinate(lon: 12.2092800140382, lat: 47.60120010375982),
  const Coordinate(lon: 11.636343955993766, lat: 47.598270416259766),
  const Coordinate(lon: 11.58102035522461, lat: 47.51182174682634),
  const Coordinate(lon: 11.437379837036133, lat: 47.51325988769548),
  const Coordinate(lon: 11.388031959533805, lat: 47.47192382812523),
  const Coordinate(lon: 11.424080848693961, lat: 47.44562149047846),
  const Coordinate(lon: 11.341606140136776, lat: 47.45182418823248),
  const Coordinate(lon: 11.27390003204357, lat: 47.391010284423885),
  const Coordinate(lon: 11.224139213562012, lat: 47.391269683837834),
  const Coordinate(lon: 11.246058464050293, lat: 47.43478012084961),
  const Coordinate(lon: 10.977520942687931, lat: 47.39611053466808),
  const Coordinate(lon: 10.926508903503532, lat: 47.478080749511776),
  const Coordinate(lon: 10.862998962402344, lat: 47.47803115844738),
  const Coordinate(lon: 10.91859436035162, lat: 47.51609420776373),
  const Coordinate(lon: 10.883132934570426, lat: 47.53810501098644),
  const Coordinate(lon: 10.772025108337402, lat: 47.516143798828125),
  const Coordinate(lon: 10.600060462951888, lat: 47.57365036010742),
  const Coordinate(lon: 10.561381340026912, lat: 47.53593063354498),
  const Coordinate(lon: 10.432245254516829, lat: 47.58555984497076),
  const Coordinate(lon: 10.471569061279524, lat: 47.43306350708008),
  const Coordinate(lon: 10.433580398559798, lat: 47.378719329833984),
  const Coordinate(lon: 10.170168876648177, lat: 47.26990127563522),
  const Coordinate(lon: 10.226869583130338, lat: 47.3929176330567),
  const Coordinate(lon: 10.095960617065373, lat: 47.3548698425293),
  const Coordinate(lon: 10.090755462646598, lat: 47.45659255981451),
  const Coordinate(lon: 9.997338294983138, lat: 47.48622512817394),
  const Coordinate(lon: 9.971186637878759, lat: 47.55048370361328),
  const Coordinate(lon: 9.87366962432867, lat: 47.53071975708008),
  const Coordinate(lon: 9.774218559265364, lat: 47.59680175781267),
  const Coordinate(lon: 9.688732147217138, lat: 47.543983459472656),
  const Coordinate(lon: 9.044014930725098, lat: 47.82368850708008),
  const Coordinate(lon: 9.221139907837028, lat: 47.66815185546875),
  const Coordinate(lon: 9.164094924927213, lat: 47.65358352661133),
  const Coordinate(lon: 8.99164009094244, lat: 47.747985839844034),
  const Coordinate(lon: 8.941365242004451, lat: 47.731822967529354),
  const Coordinate(lon: 9.006369590759277, lat: 47.69509124755882),
  const Coordinate(lon: 8.891834259033374, lat: 47.65522384643566),
  const Coordinate(lon: 8.808216094970987, lat: 47.74168014526367),
  const Coordinate(lon: 8.771158218383846, lat: 47.71976852416992),
  const Coordinate(lon: 8.79814815521263, lat: 47.67990875244152),
  const Coordinate(lon: 8.727890014648608, lat: 47.696842193603686),
  const Coordinate(lon: 8.730445861816634, lat: 47.766109466552734),
  const Coordinate(lon: 8.56799125671381, lat: 47.8143768310548),
  const Coordinate(lon: 8.404397964477653, lat: 47.680049896240405),
  const Coordinate(lon: 8.473678588867188, lat: 47.64335632324219),
  const Coordinate(lon: 8.607149124145621, lat: 47.675994873046875),
  const Coordinate(lon: 8.584686279296875, lat: 47.60031127929693),
  const Coordinate(lon: 8.520914077758846, lat: 47.63809585571306),
  const Coordinate(lon: 8.458548545837402, lat: 47.60595703125017),
  const Coordinate(lon: 8.488503456115836, lat: 47.581394195556754),
  const Coordinate(lon: 8.379540443420467, lat: 47.570251464843864),
  const Coordinate(lon: 8.202873229980526, lat: 47.62615585327154),
  const Coordinate(lon: 8.087834358215446, lat: 47.56288528442394),
  const Coordinate(lon: 7.944071769714355, lat: 47.549701690673885),
  const Coordinate(lon: 7.820772171020621, lat: 47.5946998596192),
  const Coordinate(lon: 7.669493198394889, lat: 47.53711700439453),
  const Coordinate(lon: 7.632383823394775, lat: 47.5624237060548),
  const Coordinate(lon: 7.670560836792106, lat: 47.59326171875006),
  const Coordinate(lon: 7.607770919799862, lat: 47.580959320068416),
  const Coordinate(lon: 7.512126922607479, lat: 47.696090698242244),
  const Coordinate(lon: 7.62215709686285, lat: 47.97365951538109),
  const Coordinate(lon: 7.568590164184684, lat: 48.0363388061524),
  const Coordinate(lon: 7.577859401702995, lat: 48.121391296386776),
  const Coordinate(lon: 7.745231628417969, lat: 48.32982635498047),
  const Coordinate(lon: 7.733546733856315, lat: 48.39868545532238),
  const Coordinate(lon: 7.835922718048039, lat: 48.63367462158203),
  const Coordinate(lon: 8.087015151977653, lat: 48.802013397217024),
  const Coordinate(lon: 8.22887897491455, lat: 48.97063064575218),
  const Coordinate(lon: 7.937040328979435, lat: 49.05623245239258),
  const Coordinate(lon: 7.635286331176815, lat: 49.05416870117199),
  const Coordinate(lon: 7.445586204528809, lat: 49.184024810791016),
  const Coordinate(lon: 7.293400287628174, lat: 49.115158081054744),
  const Coordinate(lon: 7.098150730133057, lat: 49.15433120727545),
  const Coordinate(lon: 7.05802440643356, lat: 49.112586975097656),
  const Coordinate(lon: 7.033706188201904, lat: 49.18826293945324),
  const Coordinate(lon: 6.924295425415494, lat: 49.223075866699276),
  const Coordinate(lon: 6.840444087982178, lat: 49.21423339843767),
  const Coordinate(lon: 6.834462642669791, lat: 49.15137863159214),
  const Coordinate(lon: 6.737987518310831, lat: 49.16456985473633),
  const Coordinate(lon: 6.53541898727417, lat: 49.434162139892635),
  const Coordinate(lon: 6.35482120513916, lat: 49.46498489379883),
  const Coordinate(lon: 6.363647937774658, lat: 49.57404708862322),
  const Coordinate(lon: 6.516485214233398, lat: 49.724178314208984),
  const Coordinate(lon: 6.528252124786377, lat: 49.808570861816406),
  const Coordinate(lon: 6.312281131744612, lat: 49.83549880981457),
  const Coordinate(lon: 6.098370075225944, lat: 50.05990982055687),
  const Coordinate(lon: 6.189638137817383, lat: 50.189464569091854),
  const Coordinate(lon: 6.170382022857893, lat: 50.23625564575207),
  const Coordinate(lon: 6.408339977264632, lat: 50.33306884765619),
  const Coordinate(lon: 6.33975791931158, lat: 50.37989425659174),
  const Coordinate(lon: 6.374671936035213, lat: 50.44594955444336),
  const Coordinate(lon: 6.330028057098446, lat: 50.49364471435558),
  const Coordinate(lon: 6.172194004059065, lat: 50.55051422119158),
  const Coordinate(lon: 6.278378963470516, lat: 50.61639785766596),
  const Coordinate(lon: 6.173087120056209, lat: 50.62143325805687),
  const Coordinate(lon: 6.118731975555477, lat: 50.708736419677905),
  const Coordinate(lon: 5.963199138641357, lat: 50.79505157470703),
  const Coordinate(lon: 6.0738401412965, lat: 50.846858978271484),
  const Coordinate(lon: 6.082940101623649, lat: 50.921798706054744),
  const Coordinate(lon: 6.015170097351074, lat: 50.93315887451172),
  const Coordinate(lon: 6.030001163482893, lat: 50.98336410522472),
  const Coordinate(lon: 5.903690814971924, lat: 50.978271484375284),
  const Coordinate(lon: 5.872058868408317, lat: 51.04341125488281),
  const Coordinate(lon: 5.969543933868522, lat: 51.034469604492415),
  const Coordinate(lon: 6.171799182891846, lat: 51.15293121337896),
  const Coordinate(lon: 6.144780158996809, lat: 51.17371749877941),
  const Coordinate(lon: 6.193139076233138, lat: 51.19166183471674),
  const Coordinate(lon: 6.091834068298397, lat: 51.175292968750284),
  const Coordinate(lon: 6.078186035156193, lat: 51.2447128295899),
  const Coordinate(lon: 6.231968879699764, lat: 51.36598205566412),
  const Coordinate(lon: 6.220355987548942, lat: 51.50917053222656),
  const Coordinate(lon: 6.090958118438778, lat: 51.605220794677734),
  const Coordinate(lon: 6.118769168853703, lat: 51.6604576110841),
  const Coordinate(lon: 5.964007854461727, lat: 51.74161148071289),
  const Coordinate(lon: 6.004777908325309, lat: 51.76816940307623),
  const Coordinate(lon: 5.964649200439453, lat: 51.824409484863395),
  const Coordinate(lon: 6.168982028961295, lat: 51.84503173828142),
  const Coordinate(lon: 6.107149124145565, lat: 51.88898849487299),
  const Coordinate(lon: 6.158889770507812, lat: 51.905384063720646),
  const Coordinate(lon: 6.417467117309798, lat: 51.82563400268566),
  const Coordinate(lon: 6.402299880981388, lat: 51.87480163574219),
  const Coordinate(lon: 6.742709159851131, lat: 51.89905166625988),
  const Coordinate(lon: 6.835361003875846, lat: 51.99552917480486),
  const Coordinate(lon: 6.698178768157959, lat: 52.040119171142805),
  const Coordinate(lon: 6.700688838958968, lat: 52.07379150390648),
  const Coordinate(lon: 7.069309234619254, lat: 52.23925399780296),
  const Coordinate(lon: 7.029718875884953, lat: 52.29431915283209),
  const Coordinate(lon: 7.07911586761486, lat: 52.38272476196295),
  const Coordinate(lon: 7.006279945373649, lat: 52.469501495361385),
  const Coordinate(lon: 6.950539112091064, lat: 52.43696975708002),
  const Coordinate(lon: 6.764862060546875, lat: 52.464931488037166),
  const Coordinate(lon: 6.683791160583496, lat: 52.55606460571312),
  const Coordinate(lon: 6.768260955810604, lat: 52.56516647338867),
  const Coordinate(lon: 6.724298000335807, lat: 52.59061050415045),
  const Coordinate(lon: 6.743810176849422, lat: 52.64709091186529),
  const Coordinate(lon: 7.051859855651912, lat: 52.63584899902344),
  const Coordinate(lon: 7.094276905059871, lat: 52.84645080566429),
  const Coordinate(lon: 7.26148796081543, lat: 52.997539520263615),
  const Coordinate(lon: 7.226968765258846, lat: 53.124462127685604),
  const Coordinate(lon: 7.284560203552189, lat: 53.19956970214872),
  const Coordinate(lon: 7.205277919769514, lat: 53.23880767822271),
  const Coordinate(lon: 7.249166965484562, lat: 53.32986068725586),
  const Coordinate(lon: 6.998610973358154, lat: 53.361251831054915),
  const Coordinate(lon: 7.034166812896729, lat: 53.53319549560558),
  const Coordinate(lon: 7.13361120223999, lat: 53.53236007690424),
  const Coordinate(lon: 7.09027719497675, lat: 53.57652664184576),
  const Coordinate(lon: 7.158053874969539, lat: 53.627918243408146),
  const Coordinate(lon: 7.316944122314794, lat: 53.683471679687614),
  const Coordinate(lon: 8.015831947326944, lat: 53.71069335937506),
  const Coordinate(lon: 8.172499656677246, lat: 53.554584503173885),
  const Coordinate(lon: 8.155276298523177, lat: 53.513748168945426),
  const Coordinate(lon: 8.06472206115734, lat: 53.50597381591797),
  const Coordinate(lon: 8.073611259460677, lat: 53.46486282348633),
  const Coordinate(lon: 8.252499580383244, lat: 53.399028778076115),
  const Coordinate(lon: 8.316389083862418, lat: 53.46625137329124),
  const Coordinate(lon: 8.316389083862418, lat: 53.5220832824707),
  const Coordinate(lon: 8.230832099914778, lat: 53.52041625976574),
  const Coordinate(lon: 8.271943092346419, lat: 53.609859466552734),
  const Coordinate(lon: 8.516389846801701, lat: 53.55625152587902),
  const Coordinate(lon: 8.556944847106877, lat: 53.52569580078131),
  const Coordinate(lon: 8.519721984863338, lat: 53.50097274780279),
  const Coordinate(lon: 8.570834159851074, lat: 53.51819610595703),
  const Coordinate(lon: 8.483611106872786, lat: 53.69430541992193),
  const Coordinate(lon: 8.608056068420467, lat: 53.87874984741228),
  const Coordinate(lon: 8.883610725402946, lat: 53.82791519165045),
  const Coordinate(lon: 9.09972286224371, lat: 53.86291503906256),
  const Coordinate(lon: 8.963610649109114, lat: 53.894584655761776),
  const Coordinate(lon: 8.819722175598258, lat: 54.02152633666998),
  const Coordinate(lon: 8.98250007629423, lat: 54.04652786254911),
  const Coordinate(lon: 8.927499771118164, lat: 54.131805419921875),
  const Coordinate(lon: 8.85916709899908, lat: 54.12263870239269),
  const Coordinate(lon: 8.807498931884709, lat: 54.173194885253906),
  const Coordinate(lon: 8.83583259582548, lat: 54.251804351806584),
  const Coordinate(lon: 8.951944351196516, lat: 54.31289291381836),
  const Coordinate(lon: 8.846387863159237, lat: 54.26291656494169),
  const Coordinate(lon: 8.580278396606559, lat: 54.30402755737316),
  const Coordinate(lon: 8.60416603088413, lat: 54.357917785644645),
  const Coordinate(lon: 8.685832023620605, lat: 54.35708236694347),
  const Coordinate(lon: 8.608610153198185, lat: 54.38624954223644),
  const Coordinate(lon: 8.893611907959212, lat: 54.41208267211914),
  const Coordinate(lon: 9.02361106872587, lat: 54.472637176513786),
  const Coordinate(lon: 8.989167213440396, lat: 54.519306182861385),
  const Coordinate(lon: 8.903610229492188, lat: 54.46069335937506),
  const Coordinate(lon: 8.806388854980526, lat: 54.47041702270508),
  const Coordinate(lon: 8.890276908874682, lat: 54.59263992309582),
  const Coordinate(lon: 8.813055992126749, lat: 54.597362518311),
  const Coordinate(lon: 8.822500228881836, lat: 54.64597320556675),
  const Coordinate(lon: 8.687498092651595, lat: 54.72986221313516),
  const Coordinate(lon: 8.590276718139762, lat: 54.885139465331974),
  const Coordinate(lon: 8.41638755798374, lat: 54.84708404541021),
  const Coordinate(lon: 8.310277938842887, lat: 54.874305725097656),
  const Coordinate(lon: 8.279722213745174, lat: 54.75180435180687),
  const Coordinate(lon: 8.298054695129508, lat: 54.909305572509766),
  const Coordinate(lon: 8.407297932191138, lat: 55.04395228653645)
];
