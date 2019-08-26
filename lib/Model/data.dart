import 'package:my_app/model/dog_model.dart';
import 'package:my_app/model/letter_model.dart';

List<Dog> initialDoggos = []
  ..add(Dog(
      id: 1001,
      name: 'Affenpinscher',
      location: 'Portland, OR, USA',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      description:
          'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/30174107/Affenpinscher-copy-400x267.jpg"))
  ..add(Dog(
      id: 1002,
      name: 'Afghan Hound',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      location: 'Seattle, WA, USA',
      description: 'Best in Show 1999',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/19145725/Afghan-Hound1-400x267.jpg"))
  ..add(Dog(
      id: 1003,
      name: 'Airedale Terrier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'Dallas, TX, USA',
      description: 'A Very Good Boy',
      https:
          "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13001924/Airedale-Terrier-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 1004,
      name: 'Akita',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'Seattle, WA, USA',
      description: 'Best in Show 1999',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13001904/Akita-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1005,
      name: 'Alaskan Malamute',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13001815/Alaskan-Malamute-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 1006,
      name: 'American English Coonhound',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13001745/American-English-Coonhound-On-White-03-400x267.jpg"))
   ..add(Dog(
      id: 1007,
      name: 'American Eskimo Dog',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13001714/American-Eskimo-Dog-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 1008,
      name: 'American Foxhound',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13001630/American-Foxhound-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 1009,
      name: 'American Hairless Terrier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13001608/American-Hairless-Terrier-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1010,
      name: 'American Leopard Hound',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13001556/American-Leopard-Hound-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1011,
      name: 'American Staffordshire Terrier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/07172037/AmStaff.06-400x267.jpg"))
  ..add(Dog(
      id: 1012,
      name: 'American Water Spaniel',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/04160609/American-Water-Spaniel.1-400x267.jpg"))
  ..add(Dog(
      id: 1013,
      name: 'Anatolian Shepherd Dog',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13001436/Anatolian-Shepherd-Dog-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1014,
      name: 'Appenzeller Sennenhund',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/07194156/AdobeStock_64186349-400x267.jpg"))
  ..add(Dog(
      id: 1015,
      name: 'Australian Cattle Dog',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13001403/Australian-Cattle-Dog-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 1016,
      name: 'Australian Kelpie',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12191716/Australian-Kelpie-MP-400x267.jpg"))
  ..add(Dog(
      id: 1017,
      name: 'Australian Shepherd',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/03173132/Australian-Shepherd.1-400x267.jpg"))
  ..add(Dog(
      id: 1018,
      name: 'Australian Stumpy Tail Cattle Dog',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/07/10105842/Australian-Stumpy-Tail-Cattle-Dog-Slideshow-04-400x267.jpg"))
  ..add(Dog(
      id: 1019,
      name: 'Australian Terrier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/29112347/Australian-Terrier-on-White-011-400x267.jpg"))
  ..add(Dog(
      id: 1020,
      name: 'Azawakh',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/03161327/Azawakh_178091272-400x267.jpg"))


  ..add(Dog(
      id: 1101,
      name: 'Barbet',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/27114851/barbet.lying_.jpg"))
  ..add(Dog(
      id: 1102,
      name: 'Basenji',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13001133/Basenji-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1103,
      name: 'Basset Fauve de Bretagne',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/28184409/AdobeStock_23183632-400x267.jpg"))
  ..add(Dog(
      id: 1104,
      name: 'Basset Hound',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13001044/Basset-Hound-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 1105,
      name: 'Bavarian Mountain Scent Hound',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13191700/Bavarian.190758538-400x267.jpg"))
  ..add(Dog(
      id: 1106,
      name: 'Beagle',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13000937/Beagle-On-White-07-400x267.jpg"))
  ..add(Dog(
      id: 1107,
      name: 'Bearded Collie',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13000856/Bearded-Collie-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1108,
      name: 'Beauceron',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13000826/Beauceron-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 1109,
      name: 'Bedlington Terrier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/06122056/20121215-_MG_3486-400x267.jpg"))
  ..add(Dog(
      id: 1110,
      name: 'Belgian Laekenois',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12210239/Belgian-Laekenois-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 1111,
      name: 'Belgian Malinois',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13000724/Belgian-Malinois-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1112,
      name: 'Belgian Sheepdog',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13000641/Belgian-Sheepdog-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1113,
      name: 'Belgian Tervuren',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/29201539/Belgian-Tervuren.3-400x267.jpg"))
  ..add(Dog(
      id: 1114,
      name: 'Bergamasco Sheepdog',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12213719/Bergamasco-on-White-00-400x267.jpg"))
  ..add(Dog(
      id: 1115,
      name: 'Berger Picard',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/07192240/New-Stacking-full-body-2-400x267.jpg"))
  ..add(Dog(
      id: 1116,
      name: 'Bernese Mountain Dog',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13000440/Bernese-Mountain-Dog-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1117,
      name: 'Bichon Frise',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13000402/Bichon-Frise-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 1118,
      name: 'Biewer Terrier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/03173314/Biewer-Terrier-on-White-011-400x267.jpg"))
  ..add(Dog(
      id: 1119,
      name: 'Black and Tan Coonhound',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/29172221/Black-and-Tan-Coonhound-On-White-031-400x267.jpg"))
  ..add(Dog(
      id: 1120,
      name: 'Black Russian Terrier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/29203455/Black-Russian-Terrier-On-White-031-400x267.jpg"))
  ..add(Dog(
      id: 1121,
      name: 'Bloodhound',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13000208/Bloodhound-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1122,
      name: 'Bluetick Coonhound',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/28195318/Bluetick-Coonhound-400x267.jpg"))
  ..add(Dog(
      id: 1123,
      name: 'Boerboel',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13000046/Boerboel-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1124,
      name: 'Bohemian Shepherd',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2019/06/27202753/Bohemian-Shepherd.1-400x267.jpg"))
  ..add(Dog(
      id: 1125,
      name: 'Bolognese',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/07171038/AdobeStock_71665389-400x267.jpg"))
  ..add(Dog(
      id: 1126,
      name: 'Border Collie',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12235957/Border-Collie-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1127,
      name: 'Border Terrier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12235916/Border-Terrier-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 1128,
      name: 'Borzoi',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/01132030/Borzoi-On-White-031-400x267.jpg"))
  ..add(Dog(
      id: 1129,
      name: 'Boston Terrier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12235803/Boston-Terrier-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 1130,
      name: 'Bouvier des Flandres',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12235721/Bouvier-des-Flandres-On-White-02-400x267.jpg"))
  ..add(Dog(
      id: 1131,
      name: 'Boxer',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/17154200/Boxer.1-400x267.jpg"))
  ..add(Dog(
      id: 1132,
      name: 'Boykin Spaniel',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/30223645/Boykin_Spaniel_Alert-400x267.jpg"))
  ..add(Dog(
      id: 1133,
      name: 'Bracco Italiano',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/15104437/Bracco.7-400x267.jpg"))
  ..add(Dog(
      id: 1134,
      name: 'Braque du Bourbonnais',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/01230324/Bourbonnais-400x267.jpg"))
  ..add(Dog(
      id: 1135,
      name: 'Braque Francais Pyrenean',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12210106/Braque-Francais-Pyrenean-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1136,
      name: 'Briard',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12235526/Briard-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1137,
      name: 'Brittany',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/19033403/Brittany-1-400x267.jpg"))
  ..add(Dog(
      id: 1138,
      name: 'Broholmer',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12235434/Broholmer-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1139,
      name: 'Brussels Griffon',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12212238/Brussels-Griffon-on-White-06-400x267.jpg"))
  ..add(Dog(
      id: 1140,
      name: 'Bull Terrier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12235344/Bull-Terrier-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 1141,
      name: 'Bulldog',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/21010129/Bulldog-Slide-02-400x267.jpg"))
  ..add(Dog(
      id: 1142,
      name: 'Bullmastiff',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12212353/Bullmastiff-on-White-05-400x267.jpg"))
      
   ..add(Dog(
      id: 1201,
      name: "Cairn Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/04193145/Cairn-Terriers-on-White-031-400x267.jpg"))
  ..add(Dog(
      id: 1202,
      name: "Canaan Dog",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12235112/Canaan-Dog-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1203,
      name: "Cane Corso Mastiff",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/18123713/Cane-Corso-AKC-121516-296-400x267.jpg"))
  ..add(Dog(
      id: 1204,
      name: "Cardigan Welsh Corgi",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/04202304/Cardigan-Welsh-Corgi-on-White-111-400x267.jpg"))
  ..add(Dog(
      id: 1205,
      name: "Carolina Dog",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234947/Carolina-Dog-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1206,
      name: "Catahoula Leopard Dog",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12211404/Catahoula-Leopard-Dog-on-White-02-400x267.jpg"))
  ..add(Dog(
      id: 1207,
      name: "Caucasian Shepherd Dog",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/14131930/GettyImages-1095398138-400x267.jpg"))
  ..add(Dog(
      id: 1208,
      name: "Cavalier King Charles Spaniel",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234921/Cavalier-King-Charles-Spaniel-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 1209,
      name: "Central Asian Shepherd Dog",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12185837/Central-Asian-Shepherd-Dog-on-White-02-400x267.jpg"))
 ..add(Dog(
      id: 1210,
      name: "Cesky Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/15141010/Cesky-Terrier-on-White-011-400x267.jpg"))
 ..add(Dog(
      id: 1211,
      name: "Chesapeake Bay Retriever",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/29231024/Chesapeake-Bay-Retriever-hunting-400x267.jpg"))
 ..add(Dog(
      id: 1212,
      name: "Chesapeake Bay Retriever",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234710/Chihuahua-On-White-03-400x267.jpg"))
 ..add(Dog(
      id: 1213,
      name: "Chihuahua",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234710/Chihuahua-On-White-03-400x267.jpg"))
 ..add(Dog(
      id: 1214,
      name: "Chinese Crested",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234649/Chinese-Crested-On-White-01-400x267.jpg"))
 ..add(Dog(
      id: 1215,
      name: "Chinese Shar-Pei",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234623/Chinese-Shar-Pei-On-White-02-400x267.jpg"))
 ..add(Dog(
      id: 1216,
      name: "Chinook",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234558/Chinook-On-White-03-400x267.jpg"))
 ..add(Dog(
      id: 1217,
      name: "Cbow Chow",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234523/Chow-Chow-On-White-01-400x267.jpg"))
 ..add(Dog(
      id: 1218,
      name: "Cirneco dell'Etna",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12215538/Cirneco-Dell-Etna-On-White-01-400x267.jpg"))
 ..add(Dog(
      id: 1219,
      name: "Clumber Spaniel",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/07135844/Clumber-Spaniel-On-White-011-400x267.jpg"))
 ..add(Dog(
      id: 1220,
      name: "Cocker Spaniel",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12213216/Cocker-Spaniel-on-White-13-400x267.jpg"))
 ..add(Dog(
      id: 1221,
      name: "Collie",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234244/Collie-On-White-01-400x267.jpg"))
 ..add(Dog(
      id: 1222,
      name: "Coton de Tulear",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234218/Coton-de-Tulear-On-White-03-400x267.jpg"))
 ..add(Dog(
      id: 1223,
      name: "Croatian Sheepdog",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/05/16193300/Croatian-Sheepdog-400x267.jpg"))
 ..add(Dog(
      id: 1224,
      name: "Curly-Coated Retriever",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12185646/Curly-Coated-Retriever-on-White-04-400x267.jpg"))
 ..add(Dog(
      id: 1225,
      name: "Czechoslovakian Vlcak",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234147/Czechoslovakian-Vlcak-On-White-01-400x267.jpg"))


  ..add(Dog(
      id: 1301,
      name: "Dachshund",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234102/Dachshund-On-White-05-400x267.jpg"))
  ..add(Dog(
      id: 1302,
      name: "Dalmatian",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234026/Dalmatian-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1303,
      name: "Dandi Dinmont Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12233955/Dandie-Dinmont-Terrier-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1304,
      name: "Danish-Swedish Farmdog",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12205855/Danish-Swedish-Farmdog-on-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1305,
      name: "Deutcher Wachtelhund",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/29130931/AdobeStock_1083293871-400x267.jpg"))
  ..add(Dog(
      id: 1306,
      name: "Doberman Pinscher",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12233854/Doberman-Pinscher-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 1307,
      name: "Dogo Argentino",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/11141747/Dogo-Argentino-400x267.jpg"))
  ..add(Dog(
      id: 1308,
      name: "Dogue de Bordeaux",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12233808/Dogue-de-Bordeaux-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 1309,
      name: "Drentsche Patrijshond",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12205834/Drentsche-Patrijshond-on-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1310,
      name: "Drever",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12185609/Drever-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1311,
      name: "Dutch-Shepherd",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12205622/Dutch-Shepherd-on-White-01-400x267.jpg"))

  ..add(Dog(
      id: 1401,
      name: "English Cocker Spaniel",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/16105011/English-Cocker-Spaniel-Slide03-400x267.jpg"))
  ..add(Dog(
      id: 1402,
      name: "English Foxhound",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12233653/English-Foxhound-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1403,
      name: "English Setter",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12233610/English-Setter-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 1404,
      name: "English Springer Spaniel",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/08110247/English-Springer-Spaniel-On-White-011-400x267.jpg"))
  ..add(Dog(
      id: 1405,
      name: "English Toy Spaniel",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12233503/English-Toy-Spaniel-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1406,
      name: "Entlebucher Mountain Dog",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12233437/Entlebucher-Mountain-Dog-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1407,
      name: "Estella Mountain Dog",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13173254/Beau-400x267.jpg"))
  ..add(Dog(
      id: 1408,
      name: 'Eurasier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/28174934/Eurasier.1-400x267.jpg"))



  ..add(Dog(
      id: 1501,
      name: "Field Spaniel",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12233354/Field-Spaniel-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1502,
      name: "Finnish Lapphund",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12233323/Finnish-Lapphund-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1503,
      name: "Finnish Spitz",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12233256/Finnish-Spitz-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1504,
      name: "Flat-Coated Retriever",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12233222/Flat-Coated-Retriever-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 1505,
      name: "French Bulldog",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12145606/20121215-_MG_3384-400x267.jpg"))
  ..add(Dog(
      id: 1506,
      name: "French Spaniel",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/27114220/French-Spaniel-Gallery-01-400x267.jpg"))


  ..add(Dog(
      id: 1601,
      name: "German Longhaired Pointer",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12210613/German-Longhaired-Pointer-on-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1602,
      name: "German Pinscher",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12233117/German-Pinscher-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1603,
      name: "German Shepherd",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12213218/German-Shepherd-on-White-00-400x267.jpg"))
  ..add(Dog(
      id: 1604,
      name: "German Shorthaired Pointer",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12232941/German-Shorthaired-Pointer-On-White-07-400x267.jpg"))
  ..add(Dog(
      id: 1605,
      name: "German-Splitz",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12211936/German-Splitz-on-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1606,
      name: "German Wirehaired Pointer",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12232911/German-Wirehaired-Pointer-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1607,
      name: "Giant Schnauzer",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12232847/Giant-Schnauzer-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1608,
      name: "Glen of Imaal Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12232815/Glen-of-Imaal-Terrier-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1609,
      name: "Golden Retriever",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12121353/GoldenRetriever1_stacked-400x267.jpg"))
  ..add(Dog(
      id: 1610,
      name: "Gordon Setter",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/28145458/Gordon-Setter.3-400x267.jpg"))
  ..add(Dog(
      id: 1611,
      name: "Grand Basset Griffon Vendéen",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/31171741/GBGV.2-400x267.jpg"))
  ..add(Dog(
      id: 1612,
      name: "Great Dane",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12232605/Great-Dane-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1613,
      name: "Great Pyrenees",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12212157/Great-Pyrenees-on-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1614,
      name: "Greater Swiss Mountain Dog",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12232456/Greater-Swiss-Mountain-Dog-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1615,
      name: "Greyhound",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12232417/Greyhound-MP-400x267.jpg"))


  ..add(Dog(
      id: 1701,
      name: "Hamiltonstovare",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/20110654/Hamiltonstovare-on-White-011-400x267.jpg"))
  ..add(Dog(
      id: 1702,
      name: "Hanoverian Scenthound",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/03190519/Hanoverian-Scenthound.1-400x267.jpg"))
  ..add(Dog(
      id: 1703,
      name: "Harrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/22174432/Harrier3-400x267.jpg"))
  ..add(Dog(
      id: 1704,
      name: "Havanese",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12232252/Havanese-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1705,
      name: "Hokkaido",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/30144758/Hokkaido.1-400x267.jpg"))
  ..add(Dog(
      id: 1706,
      name: "Hovawart",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/02174018/Hovawart.10-400x267.jpg"))


  ..add(Dog(
      id: 1801,
      name: "Ibizan Hound",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12232219/Ibizan-Hound-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1802,
      name: "Icelandic Sitting",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/14115933/Icelandic-Sitting-400x267.jpg"))
  ..add(Dog(
      id: 1803,
      name: "Irish Red And White Setter",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12213903/Irish-Red-And-White-Setter-On-White-02-400x267.jpg"))
  ..add(Dog(
      id: 1804,
      name: "Irish Sette",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/22124811/Irish-Setter-on-point-in-a-field-400x267.jpg"))
  ..add(Dog(
      id: 1805,
      name: "Irish Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12213034/Irish-Terrier-on-white-01-400x267.jpg"))
  ..add(Dog(
      id: 1806,
      name: "Irish Water Spaniel",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12231921/Irish-Water-Spaniel-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 1807,
      name: "Irish Wolfhound",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/08/07003344/Irish-Wolfhound-on-White-14-400x267.jpg"))
  ..add(Dog(
      id: 1808,
      name: "Italian Greyhound",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12231757/Italian-Greyhound-On-White-03-400x267.jpg"))



  ..add(Dog(
      id: 1901,
      name: "Jadgterrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/23184625/Jadgterrier-400x267.jpg"))
  ..add(Dog(
      id: 1902,
      name: "Japanese Chin",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12210836/Japanese-Chin-on-White-01.jpg-400x267.jpg"))
  ..add(Dog(
      id: 1903,
      name: "Japanese Spitz",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2019/06/28104840/Japanese-Spitz.4-400x267.jpg"))
  ..add(Dog(
      id: 1904,
      name: "Jindo",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/03201430/Jindo.1-400x267.jpg"))


  ..add(Dog(
      id: 2001,
      name: "Kai Ken",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/28123020/Kai-Ken.5-400x267.jpg"))
  ..add(Dog(
      id: 2002,
      name: "Karelian Bear Dog",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/04224543/Karelian-Bear-Dog-400x267.jpg"))
  ..add(Dog(
      id: 2003,
      name: "Keeshond",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12231652/Keeshond-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2004,
      name: "Kerry Blue Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12211714/Kerry-Blue-on-White-00-400x267.jpg"))
  ..add(Dog(
      id: 2005,
      name: "Kishu Ken",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/09134802/Kishu-Ken-400x267.jpg"))
  ..add(Dog(
      id: 2006,
      name: "Komondor",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12231525/Komondor-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2007,
      name: "Kromfohrlander",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/07133650/Kromfohrlander.6-400x267.jpg"))
  ..add(Dog(
      id: 2008,
      name: "Kuvasz",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12231449/Kuvasz-On-White-01-400x267.jpg"))



  ..add(Dog(
      id: 2101,
      name: "Labrador Retriever",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12231410/Labrador-Retriever-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2102,
      name: "Lagotto Romagnolo",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12231312/Lagotto-Romagnolo-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2103,
      name: "Lakeland Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12231224/Lakeland-Terrier-On-White-02-400x267.jpg"))
  ..add(Dog(
      id: 2104,
      name: "Lancashire Heeler",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/30165210/Lancashire-heeler.1-400x267.jpg"))
  ..add(Dog(
      id: 2105,
      name: "Lapponian Herder",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12231210/Lapponian-Herder-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2106,
      name: "Leonberger",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12194744/Leonberger-on-White-05-400x267.jpg"))
  ..add(Dog(
      id: 2107,
      name: "Lhasa Apso",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12231104/Lhasa-Apso-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2108,
      name: "Lowchen",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12213953/Lowchen-On-White-02-400x267.jpg"))


  ..add(Dog(
      id: 2201,
      name: "Maltese",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12231006/Maltese-On-White-04-400x267.jpg"))
  ..add(Dog(
      id: 2202,
      name: "Manchester Terrier Standard",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/26203655/Manchester-Terrier-Standard-Slide-10-400x267.jpg"))
  ..add(Dog(
      id: 2203,
      name: "Manchester Terrier Toy",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/04/26221428/Manchester-Terrier-Slide-01-400x267.jpg"))
  ..add(Dog(
      id: 2204,
      name: "Mastiff",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230849/Mastiff-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 2205,
      name: "Miniature American Shepherd",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230829/Miniature-American-Shepherd-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2206,
      name: "Miniature Bull Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230801/Miniature-Bull-Terrier-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2207,
      name: "Miniature Pinscher",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230743/Miniature-Pinscher-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2208,
      name: "Miniature Schnauzer",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230713/Miniature-Schnauzer-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2209,
      name: "Mountain Cur",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230641/Mountain-Cur-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2210,
      name: "Mudi",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230639/Mudi-On-White-01-400x267.jpg"))





  ..add(Dog(
      id: 2301,
      name: "Neapolitan Mastiff",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230615/Neapolitan-Mastiff-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2302,
      name: "Nederlandse Kooikerhondje",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12210850/Nederlandse-Kooikerhondje-on-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2303,
      name: "Newfoundland",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/16191840/Newfoundland-onWhite-012-1-400x267.jpg"))
  ..add(Dog(
      id: 2304,
      name: "Norfolk Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230448/Norfolk-Terrier-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2305,
      name: "Norrbottenspets",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230431/Norrbottenspets-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2306,
      name: "Norwegian Buhund",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230414/Norwegian-Buhund-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2307,
      name: "Norwegian Elkhound",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230343/Norwegian-Elkhound-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 2308,
      name: "Norwegian Lundehund",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230304/Norwegian-Lundehund-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 2309,
      name: "Norwich Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230240/Norwich-Terrier-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 2310,
      name: "Nova Scotia Duck Tolling Retriever",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230224/Nova-Scotia-Duck-Tolling-Retriever-On-White-02-400x267.jpg"))


  ..add(Dog(
      id: 2401,
      name: "Old English Sheepdogs",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12212937/Old-English-Sheepdogs-on-white-02-400x267.jpg"))
  ..add(Dog(
      id: 2402,
      name: "Otterhound",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230108/Otterhound-On-White-03-400x267.jpg"))


  ..add(Dog(
      id: 2501,
      name: "Papillon",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230042/Papillon-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2502,
      name: "Parson Russell Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12211654/Parson-Russell-Terrier-on-White-05-400x267.jpg"))
  ..add(Dog(
      id: 2503,
      name: "Pekingese",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12225945/Pekingese-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2504,
      name: "Pembroke Welsh Corgi",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/25201637/day_2_dec_14_085-400x267.jpg"))
  ..add(Dog(
      id: 2505,
      name: "Perro de Presa Canario",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/02200433/Perro-de-Presa-Canario.1-400x267.jpg"))
  ..add(Dog(
      id: 2506,
      name: "Peruvian Inca Orchid",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/29133522/Peruvian-Inca-Orchid-04-400x267.jpg"))
  ..add(Dog(
      id: 2507,
      name: "Petit Basset Griffon Vendeen",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12212335/Petit-Basset-Griffon-Vendeen-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 2508,
      name: "Pharaoh Hound",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12214239/Pharaoh-Hound-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 2509,
      name: "Plott Hound",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12225755/Plott-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 2510,
      name: "Pointer",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/27120159/English-Pointer-pointing-quail-400x267.jpg"))
  ..add(Dog(
      id: 2511,
      name: "Polish Lowland Sheepdog",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12225700/Polish-Lowland-Sheepdog-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2510,
      name: "Pomeranian",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12225627/Pomeranian-On-White-01-400x267.jpg"))



  ..add(Dog(
      id: 2601,
      name: "Rafeiro do Alentejo",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12194226/Rafeiro-do-Alentejo-on-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2602,
      name: "Rat Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12225148/Rat-Terrier-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2603,
      name: "Redbone Coonhound",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/20142238/Redbone-Coonhound-400x267.jpg"))
  ..add(Dog(
      id: 2604,
      name: "Rhodesian Ridgeback",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12225049/Rhodesian-Ridgeback-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2605,
      name: "Romanian Mioritic Shepherd Dog",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/07/19163310/Romanian-Mioritic-Shepherd-Dog-400x267.jpg"))
  ..add(Dog(
      id: 2606,
      name: "Rottweiler",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12224942/Rottweiler-On-White-10-400x267.jpg"))
  ..add(Dog(
      id: 2607,
      name: "Russell Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12224927/Russell-Terrier-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 2608,
      name: "Russian Toy",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/03115758/Russian-Toy.8-400x267.jpg"))
  ..add(Dog(
      id: 2609,
      name: "Russian Tysvetnaya Bolonka",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12192514/Russian-Tysvetnaya-Bolonka-on-White-02-400x267.jpg"))



  ..add(Dog(
      id: 2701,
      name: "Shikoku",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/19174521/Shikoku.3-400x267.jpg"))
  ..add(Dog(
      id: 2702,
      name: "Siberian Husky",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12224224/Siberian-Husky-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 2703,
      name: "Silky Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12224133/Silky-Terrier-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2704,
      name: "Skye Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12224056/Skye-Terrier-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2705,
      name: "Sloughi",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/24164822/Sloughi-400x267.jpg"))
  ..add(Dog(
      id: 2706,
      name: "Slovakian Wirehaired Pointer",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/07/10135150/Slovakian-Wirehaired-Pointer-Slideshow-01-400x267.jpg"))
  ..add(Dog(
      id: 2707,
      name: "Slovensky Cuvac",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12193932/Slovensky-Cuvac-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2708,
      name: "Slovensky-Kopov",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12193539/Slovensky-Kopov-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2709,
      name: "Small Munsterlander Pointer",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/19190032/Munsterlander.5-400x267.jpg"))
  ..add(Dog(
      id: 2710,
      name: "Smooth Fox Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/14095809/Smooth_Fox_Terrier2-400x267.jpg"))
  ..add(Dog(
      id: 2711,
      name: "Soft Coated Wheaten Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12223937/Soft-Coated-Wheaten-Terrier-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2712,
      name: "Spanish Mastiff",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/29125304/Spanish-Mastiff-400x267.jpg"))
  ..add(Dog(
      id: 2713,
      name: "Spanish Water",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/26223654/Spanish-Water-Dog-400x267.jpg"))
  ..add(Dog(
      id: 2714,
      name: "Spinone Italiano",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12223825/Spinone-Italiano-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 2715,
      name: "Stabyhoun",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/31125942/AdobeStock_62619970-400x267.jpg"))
  ..add(Dog(
      id: 2716,
      name: "Staffordshire Bull Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12223759/Staffordshire-Bull-Terrier-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2717,
      name: "Standard Schnauzer",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12223711/Standard-Schnauzer-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 2718,
      name: "Sussex Spaniel",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12223645/Sussex-Spaniel-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2719,
      name: "Swedish Lapphund",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12223641/Swedish-Lapphund-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2720,
      name: "Swedish Vallhund",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12211633/Swedish-Vallhund-on-White-01-400x267.jpg"))




  ..add(Dog(
      id: 2801,
      name: "Taiwan Dog",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12223629/Taiwan-Dog-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2802,
      name: "Teddy Roosevelt Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12190133/Teddy-Roosevelt-Terrier-on-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2803,
      name: "Thai Ridgeback",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/22204051/Thai-Ridgeback.4-400x267.jpg"))
  ..add(Dog(
      id: 2804,
      name: "Tibetan Mastiff",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12223558/Tibetan-Mastiff-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 2805,
      name: "Tibetan Spaniel",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12223531/Tibetan-Spaniel-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 2806,
      name: "Tibetan Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12223455/Tibetan-Terrier-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2807,
      name: "Tornjak",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12211915/Tornjak-on-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2808,
      name: "Tosa",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12194713/Tosa-on-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2809,
      name: "Toy Fox Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12223410/Toy-Fox-Terrier-On-White-03-400x267.jpg"))
  ..add(Dog(
      id: 2810,
      name: "Transylvanian Hound",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12223400/Transylvanian-Hound-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2811,
      name: "Treeing Tennessee Brindle",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12205430/Treeing-Tennessee-Brindle-on-White-01-400x267.jpg"))
  ..add(Dog(
      id: 2812,
      name: "Treeing Walker Coonhound",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/28154358/Treeing-Walker-Coonhound-400x267.jpg"))



  ..add(Dog(
      id: 2901,
      name: "Vizsla",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12223307/Vizsla-On-White-01-400x267.jpg"))



  ..add(Dog(
      id: 3001,
      name: "Weimaraner",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12223229/Weimaraner-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 3002,
      name: "Welsh Springer Spaniel",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12194550/Welsh-Springer-Spaniel-on-White-01-400x267.jpg"))
  ..add(Dog(
      id: 3003,
      name: "Welsh Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12223129/Welsh-Terrier-On-White-02-400x267.jpg"))
  ..add(Dog(
      id: 3004,
      name: "West Highland White Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/27133042/Westie1-400x267.jpg"))
  ..add(Dog(
      id: 3005,
      name: "Whippet",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12223025/Whippet-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 3006,
      name: "Wire Fox Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/02163205/Wire-Fox-Terrier.1-400x267.jpg"))
  ..add(Dog(
      id: 3007,
      name: "Wirehaired Pointing Griffon",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/02154707/Wirehaired-Pointing-Griffon.1-400x267.jpg"))
  ..add(Dog(
      id: 3008,
      name: "Wirehaired Vizsla",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12222810/Wirehaired-Vizsla-On-White-01-400x267.jpg"))
  ..add(Dog(
      id: 3009,
      name: "Working Kelpie",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/15135603/Working-Kelpie.2-400x267.jpg"))


  ..add(Dog(
      id: 3101,
      name: "Xoloitzcuintli",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12222734/Xoloitzcuintli-On-White-01-400x267.jpg"))



  ..add(Dog(
      id: 3201,
      name: "Yakutian Laika",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/21194342/Yakutian-Laika1-400x267.jpg"))
  ..add(Dog(
      id: 3202,
      name: "Yorkshire Terrier",
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/20203728/Yorkshire-Terrier-2.1-400x267.jpg"))


      ;

List<Dog> duplicateDoggos = []..addAll(initialDoggos);

List<Letter> dogIndex = []
  ..add(Letter(id: 1, value:'A', enabled: true))
  ..add(Letter(id: 2, value:'B', enabled: true))
  ..add(Letter(id: 3, value:'C', enabled: true))
  ..add(Letter(id: 4, value:'D', enabled: true))
  ..add(Letter(id: 5, value:'E', enabled: true))
  ..add(Letter(id: 6, value:'F', enabled: true))
  ..add(Letter(id: 7, value:'G', enabled: true))
  ..add(Letter(id: 8, value:'H', enabled: true))
  ..add(Letter(id: 9, value:'I', enabled: true))
  ..add(Letter(id: 10, value:'J', enabled: true))
  ..add(Letter(id: 11, value:'K', enabled: true))
  ..add(Letter(id: 12, value:'L', enabled: true))
  ..add(Letter(id: 13, value:'M', enabled: true))
  ..add(Letter(id: 14, value:'N', enabled: true))
  ..add(Letter(id: 15, value:'O', enabled: true))
  ..add(Letter(id: 16, value:'P', enabled: true))
  ..add(Letter(id: 17, value:'Q', enabled: true))
  ..add(Letter(id: 18, value:'R', enabled: true))
  ..add(Letter(id: 19, value:'S', enabled: true))
  ..add(Letter(id: 20, value:'T', enabled: true))
  ..add(Letter(id: 21, value:'U', enabled: true))
  ..add(Letter(id: 22, value:'V', enabled: true))
  ..add(Letter(id: 23, value:'W', enabled: true))
  ..add(Letter(id: 24, value:'X', enabled: true))
  ..add(Letter(id: 25, value:'Z', enabled: true));
