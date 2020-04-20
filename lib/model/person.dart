class Person {
  final int id;
  final double rating;
  final String work,
      picture,
      name,
      surname,
      phone,
      gender,
      aboutMe,
      payment,
      time;

  Person({
    this.id,
    this.rating,
    this.work,
    this.picture,
    this.name,
    this.surname,
    this.phone,
    this.gender,
    this.aboutMe,
    this.payment,
    this.time,
  });

  Person.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        rating = map['rating'],
        work = map['work'],
        picture = map['picture'],
        name = map['name'],
        surname = map['surname'],
        phone = map['phone'],
        gender = map['gender'],
        aboutMe = map['aboutMe'],
        payment = map['payment'],
        time = map['time'];

  Map<String, dynamic> toMap() => {
        'id': id,
        'rating': rating,
        'work': work,
        'picture': picture,
        'name': name,
        'surname': surname,
        'phone': phone,
        'gender': gender,
        'aboutMe': aboutMe,
        'payment': payment,
        'time': time,
      };
}
