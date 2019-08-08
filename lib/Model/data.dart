import 'package:my_app/model/dog_model.dart';

List<Dog> initialDoggos = []
  ..add(Dog(
      id: 1,
      name: 'Affenpinscher',
      location: 'Portland, OR, USA',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      description:
          'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.',
      https: "https://images.dog.ceo/breeds/beagle/n02088364_7784.jpg"))
  ..add(Dog(
      id: 2,
      name: 'Afghan Hound',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      location: 'Seattle, WA, USA',
      description: 'Best in Show 1999',
      https: "https://images.dog.ceo/breeds/boxer/n02108089_5753.jpg"))
  ..add(Dog(
      id: 3,
      name: 'African Boerboel',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      location: 'Prague, CZ',
      description: 'Star good boy on international snooze team.',
      https: "https://images.dog.ceo/breeds/pembroke/n02113023_5050.jpg"))
  ..add(Dog(
      id: 4,
      name: 'Airedale Terrier',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'Dallas, TX, USA',
      description: 'A Very Good Boy',
      https:
          "https://images.dog.ceo/breeds/spaniel-brittany/n02101388_454.jpg"))
  ..add(Dog(
      id: 5,
      name: 'Akbash',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'Portland, OR, USA',
      description:
          'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.',
      https: "https://images.dog.ceo/breeds/akita/An_Akita_Inu_resting.jpg"))
  ..add(Dog(
      id: 6,
      name: 'Akita',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'Seattle, WA, USA',
      description: 'Best in Show 1999',
      https: "https://images.dog.ceo/breeds/collie-border/n02106166_7105.jpg"))
  ..add(Dog(
      id: 7,
      name: 'Alapha Blue Blood Bulldog',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'Prague, CZ',
      description: 'Star good boy on international snooze team.',
      https: "https://images.dog.ceo/breeds/vizsla/n02100583_2251.jpg"))
  ..add(Dog(
      id: 8,
      name: 'Alaskan Klee Kai',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'Dallas, TX, USA',
      description: 'A Very Good Boy',
      https: "https://images.dog.ceo/breeds/hound-english/n02089973_957.jpg"))
  ..add(Dog(
      id: 9,
      name: 'Alaskan Malamute',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/bulldog-english/bunz.jpg"))
  ..add(Dog(
      id: 10,
      name: 'American Bulldog',
      height: "9 inches to 11 inches tall",
      weight: "7 to 9 pounds",
      longevety: "12 to 14 years",
      location: 'North Pole, Earth',
      description: 'Self proclaimed human lover.',
      https: "https://images.dog.ceo/breeds/papillon/n02086910_3338.jpg"));

List<Dog> duplicateDoggos = []..addAll(initialDoggos);

List<String> dogIndex = []
  ..add('A')
  ..add('B')
  ..add('C')
  ..add('D')
  ..add('E')
  ..add('F')
  ..add('G')
  ..add('H')
  ..add('I')
  ..add('J')
  ..add('K')
  ..add('L')
  ..add('M')
  ..add('N')
  ..add('O')
  ..add('P')
  ..add('Q')
  ..add('R')
  ..add('S')
  ..add('T')
  ..add('U')
  ..add('V')
  ..add('X')
  ..add('W')
  ..add('Z');
