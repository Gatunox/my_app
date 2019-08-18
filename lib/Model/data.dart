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
      https: "https://images.dog.ceo/breeds/hound-basset/n02088238_11849.jpg"))
  ..add(Dog(
      id: 1105,
      name: 'Bavarian Mountain Scent Hound',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/hound-basset/n02088238_11849.jpg"))
  ..add(Dog(
      id: 1106,
      name: 'Beagle',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/beagle/n02088364_7784.jpg"))
  ..add(Dog(
      id: 1107,
      name: 'Bearded Collie',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1108,
      name: 'Beauceron',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1109,
      name: 'Bedlington Terrier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/terrier-bedlington/n02093647_3166.jpg"))
  ..add(Dog(
      id: 1110,
      name: 'Belgian Laekenois',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1111,
      name: 'Belgian Malinois',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/malinois/n02105162_6106.jpg"))
  ..add(Dog(
      id: 1112,
      name: 'Belgian Sheepdog',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/malinois/n02105162_6106.jpg"))
  ..add(Dog(
      id: 1113,
      name: 'Belgian Tervuren',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/groenendael/n02105056_2834.jpg"))
  ..add(Dog(
      id: 1114,
      name: 'Bergamasco Sheepdog',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1115,
      name: 'Berger Picard',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1116,
      name: 'Bernese Mountain Dog',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1117,
      name: 'Bichon Frise',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1118,
      name: 'Biewer Terrier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1119,
      name: 'Black and Tan Coonhound',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1120,
      name: 'Black Russian Terrier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1121,
      name: 'Bloodhound',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1122,
      name: 'Bluetick Coonhound',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1123,
      name: 'Boerboel',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1124,
      name: 'Bohemian Shepherd',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1125,
      name: 'Bolognese',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1126,
      name: 'Border Collie',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1127,
      name: 'Border Terrier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1128,
      name: 'Borzoi',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1129,
      name: 'Boston Terrier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1130,
      name: 'Bouvier des Flandres',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1131,
      name: 'Boxer',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1132,
      name: 'Boykin Spaniel',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1133,
      name: 'Bracco Italiano',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1134,
      name: 'Braque du Bourbonnais',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1135,
      name: 'Braque Francais Pyrenean',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1136,
      name: 'Briard',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1137,
      name: 'Brittany',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1138,
      name: 'Broholmer',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1139,
      name: 'Brussels Griffon',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1140,
      name: 'Bull Terrier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1141,
      name: 'Bulldog',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 1142,
      name: 'Bullmastiff',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))

      
  ..add(Dog(
      id: 21,
      name: 'Cairn Terrier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/basenji/n02110806_4142.jpg"))
  ..add(Dog(
      id: 22,
      name: 'Cairnoodle',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/hound-basset/n02088238_11849.jpg"))
  ..add(Dog(
      id: 23,
      name: 'Canaan Dog',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/beagle/n02088364_7784.jpg"))
  ..add(Dog(
      id: 24,
      name: 'Cane Corso Mastiff',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 25,
      name: 'Cao De Castro Laboreiro',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 26,
      name: 'Cardigan Welsh Corgi',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 27,
      name: 'Carolina Dog',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/terrier-bedlington/n02093647_3166.jpg"))
  ..add(Dog(
      id: 28,
      name: 'Catahoula Leopard Dog',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/malinois/n02105162_6106.jpg"))
  ..add(Dog(
      id: 29,
      name: 'Caucasian Mountain Dog',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/groenendael/n02105056_2834.jpg"))
  ..add(Dog(
      id: 30,
      name: 'Cava-Corgi',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 31,
      name: 'Dachshund Mini',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/dachshund/dachshund-6.jpg"))
  ..add(Dog(
      id: 32,
      name: 'Dachshund Smooth',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/dachshund/dachshund-1920_640.jpg"))
  ..add(Dog(
      id: 33,
      name: 'Dachshund Standard',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/dachshund/dog-1083690_640.jpg"))
  ..add(Dog(
      id: 34,
      name: 'Dachshund Wire',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 35,
      name: 'Dalmatian',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/dalmatian/cooper1.jpg"))
  ..add(Dog(
      id: 36,
      name: 'Dandi Dinmont Terrier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
  ..add(Dog(
      id: 37,
      name: 'Doberman Pinscher',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/doberman/n02107142_9090.jpg"))
  ..add(Dog(
      id: 38,
      name: 'Dogo Argentino',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/brabancon/n02112706_1764.jpg"))
  ..add(Dog(
      id: 39,
      name: 'Dogue de Bordeaux',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/groenendael/n02105056_2834.jpg"))
  ..add(Dog(
      id: 40,
      name: 'Doodleman Pinscher',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/dingo/n02115641_2041.jpg"))
  ..add(Dog(
      id: 219,
      name: 'Groenendael',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/groenendael/n02105056_2834.jpg"))
  ..add(Dog(
      id: 220,
      name: 'Laekenois',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"))
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
