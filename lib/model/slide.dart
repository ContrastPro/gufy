class Slide {
  final String title;
  final String point_1, point_2, point_3, point_4, point_5;

  Slide({
    this.title,
    this.point_1,
    this.point_2,
    this.point_3,
    this.point_4,
    this.point_5,
  });
}

final slideList = [
  Slide(
    title: 'Для специалистов и професианалов своего дела',
    point_1:
        'Самостоятельно управляете своим временем, местом, объемом и стоимостью работы.',
    point_2: 'Имеете постоянный доступ к нескончаемой базе клиентов.',
    point_3: 'Работаете на себя и на свой рейтинг.',
    point_4:
        'Помогаете тем, кто ждет вашей помощи: профессионально, качественно и современно.',
  ),
  Slide(
    title: 'Для потребителей \n',
    point_1: 'Максимально решение\nпроблемы/ задачи/ запроса:',
    point_2:
        'Оперативность: находите специалиста в шаговой ДОступности от вас.',
    point_3: 'Качество: выбираете, опираясь на реальные Отзывы.',
    point_4:
        'На любой кошелек: узнаете стоимость на предварительном этапе, общаясь со спецалистами. ',
    point_5: 'Вам оказывают помощь те, кто действительно хотят и могут помочь.',
  ),
  Slide(
    title: 'Достоинства и преимущества работы через приложение',
    point_1:
        'Встроенные карты: геолокация заказчиков и специалистов в формате "здесь и сейчас"',
    point_2: 'Расписание: режим работы специалистов.',
    point_3:
        'Рейтинг: выбор специалиста на основе информации о качестве оказываемых услуг.',
    point_4: 'Комцникации: связь специалиста и клиента в режиме онлайн. ',
    point_5: 'Алгоритм: последовательное и быстрое оформление заявок.',
  ),
];
