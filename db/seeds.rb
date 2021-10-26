=begin
admin = User.create!(login: "Admin", email: "master.testg2394@gmail.com", password: 'xxxxxx', type: 'Admin')
puts 'Admin created'

category1 = Category.create!(title: 'Фильмы')
category2 = Category.create!(title: 'Математика')
category3 = Category.create!(title: 'SQL')
category4 = Category.create!(title: 'Ruby')
puts 'Categories created'

test1= Test.create!(title: 'Тест по математике для 5-го класса', author_id: 1, category_id: 2, level: 1, published: true)
test2= Test.create!(title: 'Хорошо ли ты помнишь фильм “Матрица”?', author_id: 1, category_id: 1, level: 2, published: true)
test3= Test.create!(title: 'Тест на знание SQL', author_id: 1, category_id: 3, level: 2, published: true)
test4= Test.create!(title: 'Как хорошо вы знаете фильмы 90-х?', author_id: 1, category_id: 1, level: 4, published: true)
test5= Test.create!(title: 'Тест на знание основ Ruby', author_id: 1, category_id: 4, level: 4, published: true)
puts 'Tests created'

question1 = Question.create!(body: '8 * 5 =', test_id: 1)
question2 = Question.create!(body: '3 * 2 =', test_id: 1)
question3 = Question.create!(body: '7 * 9 =', test_id: 1)
question4 = Question.create!(body: '3 * 9 =', test_id: 1)
question5 = Question.create!(body: '8 * 9 =', test_id: 1)
question6 = Question.create!(body: '9 * 7 =', test_id: 1)
question7 = Question.create!(body: '7 * 8 = ', test_id: 1)
question8 = Question.create!(body: '6 * 5 =', test_id: 1)
question9 = Question.create!(body: '9 * 9 = ', test_id: 1)
question10 = Question.create!(body: '6 * 4 =', test_id: 1)
question11 = Question.create!(body: 'Кем работал Томас Андерсон?', test_id: 2)
question12 = Question.create!(body: 'Какой указ получил Нео после того, как ему пришло сообщение: «Ты увяз в Матрице»? ', test_id: 2)
question13 = Question.create!(body: 'Какую таблетку выпил Нео? ', test_id: 2)
question14 = Question.create!(body: 'Как назывался последний город, сохранившийся вне матрицы? ', test_id: 2)
question15 = Question.create!(body: 'Какое боевое искусство первым загрузили в мозг Нео? ', test_id: 2)
question16 = Question.create!(body: 'Какая крылатая фраза была написана над дверью дома у Пифии? ', test_id: 2)
question17 = Question.create!(body: 'Кто из героев фильма носил очки без дужек? ', test_id: 2)
question18 = Question.create!(body: 'Как звали главного злодея фильма? ', test_id: 2)
question19 = Question.create!(body: 'Чего из нижеперечисленного не существует?', test_id: 2)
question20 = Question.create!(body: 'И последнее: кто из команды Морфеуса оказался предателем? ', test_id: 2)
question21 = Question.create!(body: 'Что такое реляционные базы данных:', test_id: 3)
question22 = Question.create!(body: 'Как выглядит запрос, для вывода ВСЕХ значений из таблицы Orders:', test_id: 3)
question23 = Question.create!(body: 'Какие данные мы получим из этого запроса? SELECT id, date, customer_name FROM orders;', test_id: 3)
question24 = Question.create!(body: 'Есть ли ошибка в запросе? SELECT id, date, customer_name FROM orders WHERE customer_name = Mike; ', test_id: 3)
question25 = Question.create!(body: 'Что покажет следующий запрос: SELECT * FROM orders WHERE date BETWEEN ‘2017-01-01’ AND ‘2017-12-31’;', test_id: 3)
question26 = Question.create!(body: 'Что не так с этим запросом SELECT id, date FROM orders WHERE seller_id = NULL;', test_id: 3)
question27 = Question.create!(body: 'Порядок выполнения операторов AND и OR следующий:', test_id: 3)
question28 = Question.create!(body: 'Что покажет следующий запрос:  SELECT DISTINCT seller_id ORDER BY seller_id FROM orders;', test_id: 3)
question29 = Question.create!(body: 'Что делает спецсимвол \'_\' в паре с оператором LIKE:  SELECT * FROM orders WHERE customer_name LIKE \'mik_\';', test_id: 3)
question30 = Question.create!(body: 'Выберите корректный пример использования функции CONCAT:', test_id: 3)
question31 = Question.create!(body: 'Во втором «Терминаторе» Джон Коннор и биомашина с лицом Шварценеггера догадываются, что под личиной приемной матери Джона скрывается робот T-1000. Что его выдало?', test_id: 4)
question32 = Question.create!(body: 'Есть такое понятие — «большая пятерка». Так называют победу сразу в пяти основных номинациях «Оскара»: лучший фильм, сценарий, режиссура, лучшие актер и актриса. Среди всего трех фильмов, удостоившихся стольких наград, есть один из 1990-х. Какой?', test_id: 4)
question33 = Question.create!(body: 'В «Отступниках» Скорсезе копы искали внедренного в их ряды бандита, а мафия пыталась выкурить полицейскую крысу. У героев фильма «Бешеные псы», дебюта Квентина Тарантино, задача чуть легче — найти среди грабителей двойного агента. Кто это был?', test_id: 4)
question34 = Question.create!(body: 'Этот проект стал самым кассовым фильмом 1994 года, а заодно и самым прорывным для студии, его выпустившей. О какой картине речь?', test_id: 4)
question35 = Question.create!(body: 'Простой американский парень Форрест Гамп воевал во Вьетнаме, выступал на Олимпийских играх и стал бизнесменом-монополистом. А чего герой Тома Хэнкса НЕ делал?', test_id: 4)
question36 = Question.create!(body: 'От американских фильмов перейдем к британским. С каким шотландским актером вел мысленные диалоги (и имитировал его ответные реплики вслух) Саймон из фильма «На игле» Дэнни Бойла?', test_id: 4)
question37 = Question.create!(body: 'В фильме «Солдат Джейн» Деми Мур играет первую женщину, проходящую курс подготовки Военно-морских сил США. И предсказуемо встречается с сексизмом и пренебрежительным отношением сокурсников. Как она добивается их уважения?', test_id: 4)
question38 = Question.create!(body: 'Главный отечественный фильм 1990-х — это, конечно же, «Брат» Алексея Балабанова. Все его знают наизусть, поэтому и вопрос будет непростой. Какой альбом группы «Наутилус Помпилиус» попросил Данила у режиссера Степы?', test_id: 4)
question39 = Question.create!(body: 'Фармацевтический портфель этих героев так разнообразен, что будет проще сказать, чего там нет. Что НЕ употребляли Рауль Дюк и доктор Гонзо в фильме Терри Гиллиама «Страх и ненависть в Лас-Вегасе»?', test_id: 4)
question40 = Question.create!(body: 'Где записана сокращенная форма кода ниже:', test_id: 5)
question41 = Question.create!(body: 'Как называется самый популярный фреймворк языка Ruby для веба?', test_id: 5)
question42 = Question.create!(body: 'Что покажет этот код? num = -6 num *= 2 num = num.abs() res = Math.sqrt(num * 12) print("Результат: " + res.round().to_s)', test_id: 5)
question43 = Question.create!(body: 'В каком варианте вы получите число без пропуска строки от пользователя?', test_id: 5)
question44 = Question.create!(body: 'Какой метод позволяет привести строку в нижний регистр?', test_id: 5)
question45 = Question.create!(body: 'Что выведет этот код? Some = 25 print("Переменная: " + some)', test_id: 5)
question46 = Question.create!(body: 'Сработает ли данный код? print("Введите имя: ") name = gets puts("Имя: " + name)', test_id: 5)
question47 = Question.create!(body: 'Где указана пустая переменная (без значения)?', test_id: 5)
question48 = Question.create!(body: 'Что выведет код ниже? stroke = "Небольшая строка данных" puts(stroke.include? "Строка дан")', test_id: 5)

puts 'Questions created'

answer1 = Answer.create!(question_id: 1, body: '36', correct: false)
answer2 = Answer.create!(question_id: 1, body: '40', correct: true)
answer3 = Answer.create!(question_id: 1, body: '44', correct: false)
answer4 = Answer.create!(question_id: 2, body: '6', correct: true)
answer5 = Answer.create!(question_id: 2, body: '8', correct: false)
answer6 = Answer.create!(question_id: 2, body: '4', correct: false)
answer7 = Answer.create!(question_id: 3, body: '57', correct: false)
answer8 = Answer.create!(question_id: 3, body: '49', correct: true)
answer9 = Answer.create!(question_id: 3, body: '36', correct: false)
answer10 = Answer.create!(question_id: 4, body: '16', correct: false)
answer11 = Answer.create!(question_id: 4, body: '18', correct: false)
answer12 = Answer.create!(question_id: 4, body: '27', correct: true)
answer13 = Answer.create!(question_id: 5, body: '61', correct: false)
answer14 = Answer.create!(question_id: 5, body: '72', correct: true)
answer15 = Answer.create!(question_id: 5, body: '81', correct: false)
answer16 = Answer.create!(question_id: 6, body: '49', correct: false)
answer17 = Answer.create!(question_id: 6, body: '54', correct: false)
answer18 = Answer.create!(question_id: 6, body: '63', correct: true)
answer19 = Answer.create!(question_id: 7, body: '41', correct: false)
answer20 = Answer.create!(question_id: 7, body: '56', correct: true)
answer21 = Answer.create!(question_id: 7, body: '54', correct: false)
answer22 = Answer.create!(question_id: 8, body: '30', correct: true)
answer23 = Answer.create!(question_id: 8, body: '25', correct: false)
answer24 = Answer.create!(question_id: 8, body: '40', correct: false)
answer25 = Answer.create!(question_id: 9, body: '64', correct: false)
answer26 = Answer.create!(question_id: 9, body: '81', correct: true)
answer27 = Answer.create!(question_id: 9, body: '108', correct: false)
answer28 = Answer.create!(question_id: 10, body: '34', correct: false)
answer29 = Answer.create!(question_id: 10, body: '30', correct: false)
answer30 = Answer.create!(question_id: 10, body: '24', correct: true)
answer31 = Answer.create!(question_id: 11, body: 'Боссом в крупной компании', correct: false)
answer32 = Answer.create!(question_id: 11, body: 'Программистом', correct: true)
answer33 = Answer.create!(question_id: 11, body: 'В фильме не говорится, кем он работал', correct: false)
answer34 = Answer.create!(question_id: 12, body: '«Тебе конец»', correct: false)
answer35 = Answer.create!(question_id: 12, body: '«Это значит, что ты избранный»', correct: false)
answer36 = Answer.create!(question_id: 12, body: '«Следуй за белым кроликом»', correct: true)
answer37 = Answer.create!(question_id: 13, body: 'Красную', correct: true)
answer38 = Answer.create!(question_id: 13, body: 'Синюю', correct: false)
answer39 = Answer.create!(question_id: 13, body: 'Он вообще отказался', correct: false)
answer40 = Answer.create!(question_id: 14, body: 'Навуходоносор', correct: false)
answer41 = Answer.create!(question_id: 14, body: 'Кион', correct: false)
answer42 = Answer.create!(question_id: 14, body: 'Зион', correct: true)
answer43 = Answer.create!(question_id: 15, body: 'Джиу-джитсу', correct: true)
answer44 = Answer.create!(question_id: 15, body: 'Айкидо', correct: false)
answer45 = Answer.create!(question_id: 15, body: 'Капоэйра', correct: false)
answer46 = Answer.create!(question_id: 16, body: '«Познай себя»', correct: true)
answer47 = Answer.create!(question_id: 16, body: '«Лови момент»', correct: false)
answer48 = Answer.create!(question_id: 16, body: '«Бойся только себя самого»', correct: false)
answer49 = Answer.create!(question_id: 17, body: 'Морфеус', correct: true)
answer50 = Answer.create!(question_id: 17, body: 'Тринити', correct: false)
answer51 = Answer.create!(question_id: 17, body: 'Нео', correct: false)
answer52 = Answer.create!(question_id: 18, body: 'Агент Адам', correct: false)
answer53 = Answer.create!(question_id: 18, body: 'Агент Смит', correct: true)
answer54 = Answer.create!(question_id: 18, body: 'Агент Ноль', correct: false)
answer55 = Answer.create!(question_id: 19, body: 'Таблетки', correct: false)
answer56 = Answer.create!(question_id: 19, body: 'Ложки', correct: true)
answer57 = Answer.create!(question_id: 19, body: 'Избранных людей', correct: false)
answer58 = Answer.create!(question_id: 20, body: 'Апок', correct: false)
answer59 = Answer.create!(question_id: 20, body: 'Сайфер', correct: true)
answer60 = Answer.create!(question_id: 20, body: 'Тэнк', correct: false)
answer61 = Answer.create!(question_id: 21, body: 'База данных, в которой информация хранится в виде двумерных таблиц, связанных между собой', correct: true)
answer62 = Answer.create!(question_id: 21, body: 'База данных, в которой одна ни с чем не связанная таблица', correct: false)
answer63 = Answer.create!(question_id: 21, body: 'Любая база данных - реляционная', correct: false)
answer64 = Answer.create!(question_id: 21, body: 'Совокупность данных, не связанных между собой ', correct: false)
answer65 = Answer.create!(question_id: 22, body: 'select ALL from Orders;', correct: false)
answer66 = Answer.create!(question_id: 22, body: 'select % from Orders;', correct: false)
answer67 = Answer.create!(question_id: 22, body: 'select * from Orders;', correct: true)
answer68 = Answer.create!(question_id: 22, body: 'select *.Orders from Orders; ', correct: false)
answer69 = Answer.create!(question_id: 23, body: 'Неотсортированные номера и даты всех заказов с именами заказчиков', correct: true)
answer70 = Answer.create!(question_id: 23, body: 'Никакие, запрос составлен неверно', correct: false)
answer71 = Answer.create!(question_id: 23, body: 'Номера и даты всех заказов с именами заказчиков, отсортированные по первой колонке', correct: false)
answer72 = Answer.create!(question_id: 23, body: 'Номера и даты всех заказов с именами заказчиков, отсортированные по всем колонкам, содержащим слово Order ', correct: false)
answer73 = Answer.create!(question_id: 24, body: 'Запрос составлен правильно', correct: false)
answer74 = Answer.create!(question_id: 24, body: 'Mike необходимо записать в кавычках \'Mike\'', correct: true)
answer75 = Answer.create!(question_id: 24, body: 'Нужно убрать лишние поля из запроса', correct: false)
answer76 = Answer.create!(question_id: 24, body: 'Строчку с where поменять местами с from ', correct: false)
answer77 = Answer.create!(question_id: 25, body: 'Все данные по заказам, совершенным за 2017 год, за исключением 01 января 2017 года', correct: false)
answer78 = Answer.create!(question_id: 25, body: 'Все данные по заказам, совершенным за 2017 год, за исключением 31 декабря 2017 года', correct: false)
answer79 = Answer.create!(question_id: 25, body: 'Все данные по заказам, совершенным за 2017 год', correct: true)
answer80 = Answer.create!(question_id: 25, body: 'Ничего, запрос составлен неверно ', correct: false)
answer81 = Answer.create!(question_id: 26, body: 'Все верно, запрос покажет все заказы, продавцы которых не проставлены', correct: false)
answer82 = Answer.create!(question_id: 26, body: 'NULL нужно взять в кавычки', correct: false)
answer83 = Answer.create!(question_id: 26, body: 'Сравнение с NULL можно проводить только с оператором IS', correct: true)
answer84 = Answer.create!(question_id: 26, body: 'Сравнение с NULL можно проводить только с оператором ON ', correct: false)
answer85 = Answer.create!(question_id: 27, body: 'Сначала выполняется AND, а затем OR', correct: true)
answer86 = Answer.create!(question_id: 27, body: 'Сначала выполняется OR, а затем AND', correct: false)
answer87 = Answer.create!(question_id: 27, body: 'Порядок выполнения операторов AND и OR зависит от того, какой операторов стоит первым', correct: false)
answer88 = Answer.create!(question_id: 27, body: 'Операторы AND и OR выполняются одновременно ', correct: false)
answer89 = Answer.create!(question_id: 28, body: 'Уникальные ID продавцов, отсортированные по возрастанию', correct: false)
answer90 = Answer.create!(question_id: 28, body: 'Уникальные ID продавцов, отсортированные по убыванию', correct: false)
answer91 = Answer.create!(question_id: 28, body: 'Ничего, запрос составлен неверно, ORDER BY всегда ставится в конце запроса', correct: true)
answer92 = Answer.create!(question_id: 28, body: 'Неотсортированные никак уникальные ID продавцов ', correct: false)
answer93 = Answer.create!(question_id: 29, body: 'найдет все имена, которые начинаются на mik и состоят из 4 символов', correct: true)
answer94 = Answer.create!(question_id: 29, body: 'найдет все имена, которые начинаются на mik, вне зависимости от того, из какого количества символов они состоят', correct: false)
answer95 = Answer.create!(question_id: 29, body: 'найдет данные, где имя равно mik', correct: false)
answer96 = Answer.create!(question_id: 29, body: 'запрос составлен неверно, в паре с оператором like не используются спецсимволы ', correct: false)
answer97 = Answer.create!(question_id: 30, body: 'select concat = index and city from Orders;', correct: false)
answer98 = Answer.create!(question_id: 30, body: 'select concat IN (`index`, `city`) from Orders;', correct: false)
answer99 = Answer.create!(question_id: 30, body: 'select concat(`index`," ", `city`) from Orders;', correct: true)
answer100 = Answer.create!(question_id: 30, body: 'нет правильного примера ', correct: false)
answer101 = Answer.create!(question_id: 31, body: 'Назвал неверную кличку собаки', correct: true)
answer102 = Answer.create!(question_id: 31, body: 'Голос! Какой-то нечеловеческий, как у автоответчика', correct: false)
answer103 = Answer.create!(question_id: 31, body: 'Его спросили о любимом блюде Джона, и он не угадал', correct: false)
answer104 = Answer.create!(question_id: 31, body: 'Сообщил неправильный адрес', correct: false)
answer105 = Answer.create!(question_id: 32, body: '«Список Шиндлера»', correct: false)
answer106 = Answer.create!(question_id: 32, body: '«Побег из Шоушенка»', correct: false)
answer107 = Answer.create!(question_id: 32, body: '«Зеленая миля»', correct: false)
answer108 = Answer.create!(question_id: 32, body: '«Молчание ягнят»', correct: true)
answer109 = Answer.create!(question_id: 33, body: 'Мистер Синий', correct: false)
answer110 = Answer.create!(question_id: 33, body: 'Мистер Розовый', correct: false)
answer111 = Answer.create!(question_id: 33, body: 'Мистер Оранжевый', correct: true)
answer112 = Answer.create!(question_id: 33, body: 'Мистер Белый', correct: false)
answer113 = Answer.create!(question_id: 34, body: '«Леон»', correct: false)
answer114 = Answer.create!(question_id: 34, body: '«Криминальное чтиво»', correct: false)
answer115 = Answer.create!(question_id: 34, body: '«Король Лев»', correct: true)
answer116 = Answer.create!(question_id: 34, body: '«Прирожденные убийцы»', correct: false)
answer117 = Answer.create!(question_id: 35, body: 'Не тусовался с Джоном Ленноном', correct: false)
answer118 = Answer.create!(question_id: 35, body: 'Не показывал задницу президенту', correct: false)
answer119 = Answer.create!(question_id: 35, body: 'Не спасал Мао Цзэдуна', correct: true)
answer120 = Answer.create!(question_id: 35, body: 'Не общался с «Черными пантерами»', correct: false)
answer121 = Answer.create!(question_id: 36, body: 'Билли Коннолли', correct: false)
answer122 = Answer.create!(question_id: 36, body: 'Хамфри Богарт', correct: false)
answer123 = Answer.create!(question_id: 36, body: 'Шон Коннери', correct: true)
answer124 = Answer.create!(question_id: 36, body: 'Пирс Броснан', correct: false)
answer125 = Answer.create!(question_id: 37, body: 'Избивает собственного командира', correct: true)
answer126 = Answer.create!(question_id: 37, body: 'Быстрее всех преодолевает путь с препятствиями', correct: false)
answer127 = Answer.create!(question_id: 37, body: 'Выносит с поля боя раненого офицера', correct: false)
answer128 = Answer.create!(question_id: 37, body: 'Ну, понятно как...', correct: false)
answer129 = Answer.create!(question_id: 38, body: '«Крылья»', correct: false)
answer130 = Answer.create!(question_id: 38, body: '«Яблокитай»', correct: true)
answer131 = Answer.create!(question_id: 38, body: '«Князь тишины»', correct: false)
answer132 = Answer.create!(question_id: 38, body: '«Камнем по голове»', correct: false)
answer133 = Answer.create!(question_id: 39, body: 'Эфир', correct: false)
answer134 = Answer.create!(question_id: 39, body: 'Мескалин', correct: false)
answer135 = Answer.create!(question_id: 39, body: 'Кокаин', correct: false)
answer136 = Answer.create!(question_id: 39, body: 'Кодеин', correct: true)
answer137 = Answer.create!(question_id: 40, body: 'Нет сокращенной формы', correct: false)
answer138 = Answer.create!(question_id: 40, body: 'x = / 3', correct: false)
answer139 = Answer.create!(question_id: 40, body: 'x/3', correct: false)
answer140 = Answer.create!(question_id: 40, body: 'x /= 3 ', correct: true)
answer141 = Answer.create!(question_id: 41, body: 'Ruby Framework', correct: false)
answer142 = Answer.create!(question_id: 41, body: 'Rails', correct: false)
answer143 = Answer.create!(question_id: 41, body: 'Ruby On Rails', correct: true)
answer144 = Answer.create!(question_id: 41, body: 'Ruby Web', correct: false)
answer145 = Answer.create!(question_id: 42, body: 'Выведет: "Результат: 3"', correct: false)
answer146 = Answer.create!(question_id: 42, body: 'Выведет: Ошибку', correct: false)
answer147 = Answer.create!(question_id: 42, body: 'Выведет: "Результат: 12"', correct: true)
answer148 = Answer.create!(question_id: 42, body: 'Выведет: "Результат: -12"', correct: false)
answer149 = Answer.create!(question_id: 43, body: 'num = gets', correct: false)
answer150 = Answer.create!(question_id: 43, body: 'num = gets.chomp().to_i', correct: true)
answer151 = Answer.create!(question_id: 43, body: 'num = chomp().to_i', correct: false)
answer152 = Answer.create!(question_id: 43, body: 'num = gets.chomp()', correct: false)
answer153 = Answer.create!(question_id: 44, body: 'upcase()', correct: false)
answer154 = Answer.create!(question_id: 44, body: 'down()', correct: false)
answer155 = Answer.create!(question_id: 44, body: 'lowercase()', correct: false)
answer156 = Answer.create!(question_id: 44, body: 'downcase()', correct: true)
answer157 = Answer.create!(question_id: 45, body: 'Выведет: "Переменная: some"', correct: false)
answer158 = Answer.create!(question_id: 45, body: 'Будет выведена ошибка', correct: true)
answer159 = Answer.create!(question_id: 45, body: 'Выведет: "Переменная: 25"', correct: false)
answer160 = Answer.create!(question_id: 46, body: 'Необходимо дописать name.to_s при выводе информации', correct: false)
answer161 = Answer.create!(question_id: 46, body: 'Необходимо дописать gets.chomp()', correct: false)
answer162 = Answer.create!(question_id: 46, body: 'Код сработает в любом случае', correct: true)
answer163 = Answer.create!(question_id: 46, body: 'Код сработает только если введут строку, а не число', correct: false)
answer164 = Answer.create!(question_id: 47, body: 'some = 0', correct: false)
answer165 = Answer.create!(question_id: 47, body: 'some = nil', correct: true)
answer166 = Answer.create!(question_id: 47, body: 'some', correct: false)
answer167 = Answer.create!(question_id: 47, body: 'some = ""', correct: false)
answer168 = Answer.create!(question_id: 48, body: 'Выведет: ошибку', correct: false)
answer169 = Answer.create!(question_id: 48, body: 'Выведет: "Небольшая нных"', correct: false)
answer170 = Answer.create!(question_id: 48, body: 'Выведет: true', correct: false)
answer171 = Answer.create!(question_id: 48, body: 'Выведет: false ', correct: true)
puts 'Answers created'
=end

for c_i in 1..2
  category = Category.create!(title: "Category ##{c_i}")
  admin = User.create!(login: "Admin ##{c_i}", email: "admin#{c_i}@mail.ru", password: 'xxxxxx', type: 'Admin')
  user = User.create!(login: "User ##{c_i}", email: "user#{c_i}@mail.ru", password: 'xxxxxx')
  
  for t_i in 1..2
    test = Test.create!(title: "Test ##{t_i} (category_id: #{category.id}; level: #{t_i}; author: #{admin.id})", category_id: category.id, level: t_i, author_id: admin.id, published: true)
    # TestPassage.create!(test_id: t_i, user_id: user.id)

    for q_i in 1..3
    question = Question.new(body: "Question #{q_i} (test_id: #{test.id})", test_id: test.id)
    question_answers = []
      a_max = 3
      for a_i in 1..a_max
        corr = a_i == a_max ? true : false
        question_answers << question.answers.new(body: "Answer #{a_i} (test_id: #{test.id}; question_id: #{q_i}; correct: #{corr})" , question_id: question.id, correct: corr)
      end
    question.save!
    question_answers.each {|answer| answer.save!}
    end
  end
end

rule1 = Rule.create!(title:"Выдать бэйдж после успешного прохождения всех тестов из категории 2", method: "category", value: 2)
rule2 = Rule.create!(title:"Выдать бэйдж после успешного прохождения теста с первой попытки", method: "first_try")
rule3 = Rule.create!(title:"Выдать бэйдж после успешного прохождения всех тестов уровня 2", method: "level", value: 2)
puts 'Rules created'

badge1 = rule1.badges.create!(title: "успешноe прохождение всех тестов из категории 2", image_url: 'https://i.ibb.co/V2Lf81M/936f1b39-011e-4b8b-81d9-82e83319bcde.png')
badge2 = rule2.badges.create!(title: "успешноe прохождение теста с первой попытки", image_url: 'https://i.ibb.co/gJFXDL8/19c4596f-46f5-489d-ac5a-8b82d6ea1465.png', recurrent: true)
badge3 = rule3.badges.create!(title: "успешное прохождение всех тестов уровня 2", image_url: 'https://i.ibb.co/D4dXMjM/de3fc14d-2f30-49b5-8762-a38598a1d26f.png')
puts 'Badges created'
