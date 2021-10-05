import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';



void  customURlLaunch(command) async {
  if (await canLaunch(command)) {
    await launch(command);
  } else {
    print('could not launch $command');
  }
}

class ToolsUtilities {

  // static final mainColor = Color(0xffdc3636);
  static final mainColor = Color(0xffcf5331);
  static final secondColor = Color(0xff3f4a9a);

  static final redColor = Color(0xffdc3636);
  static final whiteColor = Color(0xffffffff);


  //edit the Urls of Web Sites
  static final homePageUrl            = "https://ksa.citylolo.com";
  static final videoPageUrl           = "https://ksa.youtube.com";
  static final allPageUrl             = "https://ksa.citylolo.com/brands";
  static final firstCategoryPageUrl   = "https://ksa.citylolo.com/category/electronics";
  static final secondCategoryPageUrl  = "https://ksa.citylolo.com/category/fashion";
  static final thirdCategoryPageUrl   = "https://ksa.citylolo.com/category/health-and-beauty";
  static final fourthCategoryPageUrl  = "https://ksa.citylolo.com/category/home-and-garden";
  static final fifthCategoryPageUrl   = "https://ksa.citylolo.com/category/games-and-activities";
  static final sixthCategoryPageUrl   = "https://ksa.citylolo.com/category/sports-and-recreation";
  static final seventhCategoryPageUrl = "https://ksa.citylolo.com/category/other-supplies";
  static final eighthCategoryPageUrl  = "https://ksa.citylolo.com/category/grocery";

  //edit the social media Links
  static final facebookUrl  = "https://www.facebook.com/";
  static final twitterUrl   = "https://twitter.com/home";
  static final instagramUrl = "https://www.instagram.com/";
  static final snapchatUrl  = "https://ads.snapchat.com/";
  static final websiteUrl   = "https://citylolo.com/ksa";
  static final pintrestUrl  = "https://www.pinterest.com/homefeed/";
  static final youtubeUrl   = "https://www.youtube.com/";

//Add your Email
  static final email = "info@citylolo.com";

  //The Url Function that open any Url

  static List categoriesNames = [
    "الإلكترونيات",
    "الأزياء والموضة",
    "الصحة والجمال",
    "المنزل والحديقة",
    "الألعاب والأنشطة ",
    "الرياضة والترفيه ",
    "اللوازم الأخرى ",
    "البقالة ",
  ];

  static List categoriesUrls = [
    firstCategoryPageUrl,
    secondCategoryPageUrl,
    thirdCategoryPageUrl,
    fourthCategoryPageUrl,
    fifthCategoryPageUrl,
    sixthCategoryPageUrl,
    seventhCategoryPageUrl,
    eighthCategoryPageUrl,


  ];

  static List categoryImages =[
    firstCategoryPageImage,
    secondCategoryPageImage,
    thirdCategoryPageImage,
    fourthCategoryPageImage,
    fifthCategoryPageImage,
    sixthCategoryPageImage,
    seventhCategoryPageImage,
    eighthCategoryPageImage,
  ];

  static List categoriesIcons = [
    FontAwesomeIcons.laptop,
    FontAwesomeIcons.tshirt,
    FontAwesomeIcons.weight,
    FontAwesomeIcons.houseUser,
    FontAwesomeIcons.babyCarriage,
    FontAwesomeIcons.dumbbell,
    FontAwesomeIcons.infinity,
    FontAwesomeIcons.shoppingBasket,

  ];
  static String discoveryImageHeader = 'assets/categories/1.png';
  static String contactUsHeaderImage = 'assets/categories/5.png';
  static String infoHeaderImage = 'assets/categories/3.png';
  static String ourCategoriesHeaderImage = "assets/categories/4.png";
  static String visionImage = "assets/categories/5.png";
  static String missionImage = "assets/categories/6.png";

  static String firstCategoryPageImage    = "assets/categories/9.png";
  static String secondCategoryPageImage   = "assets/categories/10.png";
  static String thirdCategoryPageImage    = "assets/categories/11.png";
  static String fourthCategoryPageImage   = "assets/categories/12.png";
  static String fifthCategoryPageImage    = "assets/categories/13.png";
  static String sixthCategoryPageImage    = "assets/categories/14.png";
  static String seventhCategoryPageImage  = "assets/categories/15.png";
  static String eighthCategoryPageImage   = "assets/categories/16.png";


  static String infoParagraphMission1 = "تعنى (سياسة الخصوصية) لدينا بطريقة جمعنا وحفظنا واستخدامنا وطريقة حماية معلوماتك الشخصية ومن المهم ان تقوم بالإطلاع سياسة الخصوصية هذه.";
  static String infoParagraphMission2 = "ونقصد بالمعلومات الشخصية هي المعلومات التي ترتبط بشخص معين والتي تستخدم في التعريف عنه. نحن لا نأخذ بعين الاعتبار أي معلومات مجهولة المصدر لانها لا تصلح في تشكيل معلومات شخصية ولكننا نقوم بجمع المعلومات الشخصية من الراغبين بإستخدام موقع سيتي لولو.كوم او صفحات الانترنت المرتبطة (بما في ذلك وعلى سبيل الحصر بيعك وشرائك لبضائع او حين تتصل هاتفيا او بواسطة البريد الالكتروني بفريق مركز دعم المستخدمين لدينا).";
  static String infoParagraphMission3 = "وبمجرد تزويدك لنا بمعلوماتك الشخصية تكون قد فوضتنا لمعالجة هذه المعلومات وفق بنود وشروط (سياسة الخصوصية).";
  static String infoParagraphMission4 = "قد نقوم بتعديل (سياسة الخصوصية) في اي وقت وذلك من خلال الإعلان عن هذا التعديل بنشر النسخة المعدلة على الموقع.";
  static String infoParagraphMission5 = "وتكون النسخة المعدلة من (سياسة الخصوصية) سارية المفعول اعتبارا من تاريخ نشرها.";
  static String infoParagraphMission6 = "في اعقاب النشر يعتبر استمرارك في استخدام الموقع موافقة منك بالشروط والبنود الواردة في النسخة المعدلة لطريقة معالجتنا وتعاملنا مع معلوماتك الشخصية التي كنت قد زودتنا بها.نأمل منكم الإطلاع على الموقع من حين لأخر للإعلانات عن اية تعديلات على سياسة الخصوصية.";
  static String infoParagraphMission7 = "";
  static String infoParagraphMission8 = "";

  static String infoParagraphVision1 = "إنشاء حساب بائع لدولة مختارة: حسب التعليمات الواردة في الموقع، يتعين عليك إنشاء حساب بائع لدينا عن كل دولة من الدول المختارة التي تحتاج إلى الاستفادة من خدماتنا فيها.";
  static String infoParagraphVision2 = "إذا كنت فرداً، يجب أن تكون مقيماً في تلك الدولة المختارة، أما في حالة الشركات، يتعين أن يكون لدى الشركة القدرة على ممارسة الأعمال في الدولة المختارة حسب القوانين المعمول بها في تلك الدولة المختارة.";
  static String infoParagraphVision3 = "قد نقوم بمساعدتكم في إنشاء حساب في كل دولة من الدول المختارة بعد تلقي المعلومات اللازمة من طرفكم. ويجب عليكم التعرف بأنفسكم على العملية الواردة في الموقع والتعرف كذلك على جميع شروط الموقع. ويجب عدم التسجيل باسم مستعار و/أو انتحال بيانات اعتماد تسجيل الدخول الخاصة بأي بائع آخر أو كلمة (كلمات) السر الخاصة به، حيث ينتج عن هذا السلوك الاحتيالي مخالفة القوانين واللوائح الاتحادية أو الوطنية أو الإقليمية أو الدولية المعمول بها (القوانين المعمول بها) في الدولة المختارة ذات الصلة. كما أنكم توافقون على تقديم كافة المعلومات ذات الصلة إلينا طالما كان حسابكم فعالاً.";
  static String infoParagraphVision4 = "ويجب عليكم عند تسجيل حساب البائع الخاص بكم، وذلك لدى كل دولة من الدول المختارة، تقديم الوثائق الثبوتية السارية والأصلية التي نحددها (حسب القوانين المعمول بها في الدولة المختارة) وذلك حسب ما نطلبه من خلال الموقع أو حساب البائع الخاص بكم";
  static String infoParagraphVision5 = "";
  static String infoParagraphVision6 = "";
  static String infoParagraphVision7 = "";
  static String infoParagraphVision8 = "";
  static String infoParagraphVision9 = "";


}