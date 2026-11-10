#show figure.where(kind: image): set figure(supplement: [Рис.])
#show figure.where(kind: table): set figure(supplement: [Табл.])
#show figure.where(kind: table): set figure.caption(position: top)
#set text(14pt, lang: "ru")
#show raw: set text(size: 9pt)
#show raw.where(block: true): block.with(fill: luma(245), inset: 8pt, radius: 3pt, width: 100%)
#show figure: set block(breakable: true)

#let placeholder(body) = rect(
  width: 100%,
  height: 6cm,
  stroke: (dash: "dashed"),
)[#align(center + horizon)[#body]]

#let layer(title, body) = rect(width: 100%, inset: 8pt, stroke: 0.8pt, radius: 3pt)[
  #align(center)[*#title* \ #body]
]

#let down-arrow = align(center)[#text(16pt)[↓]]

#align(center, text(16pt)[
  *Федеральное государственное автономное образовательное учреждение высшего образования «Национальный исследовательский университет ИТМО»*
  \
  \
  *Факультет программной инженерии и компьютерной техники*
])

#align(center + horizon, text(16pt)[
  Дисциплина \ "Информационная безопасность"
])

#v(2cm)

#align(center + horizon, text(16pt)[
  *Лабораторная работа №5* \
])

#align(center + horizon, text(16pt)[
  Аудит паролей с помощью менеджера паролей
])

#v(4cm)

#align(left, text(16pt)[
  #table(
    columns: 2,
    stroke: none,
    align: left,
    [*Выполнил:*], [Малышев Никита Александрович],
    [*Группа:*], [P3412],
    [*Проверила:*], [Маркина Татьяна Анатольевна],
  )
])

#align(center + bottom, text(16pt)[
  Санкт-Петербург\
  #datetime.today().year() год
])

#pagebreak()

#set heading(numbering: "1.")
#outline(
  title: [Содержание]
)

#set page(numbering: "1")

#pagebreak()

#set par(justify: true)

= Создание и настройка менеджера паролей

Создадим аккаунт на BitWarden: укажем свою почту, подтвердим ее,
придумаем мастер-пароль.

#figure(
  image("img/bitwarden-auth.png", width: 60%),
  caption: "Ввод мастер-пароля для создания учетной записи"
)

После успешного создания учетной записи, можем увидеть хранилище
BitWarden.

#figure(
  image("img/bitwarden-vaults.png", width: 80%),
  caption: "Основное окно хранилища BitWarden"
)

= Аудит паролей

Для проверки использовался сервис Have I Been Pwned
(https://haveibeenpwned.com/). В сервисе был проверен адрес
`malyshev.2005n@gmail.com`. Как видно на @hibp, почта фигурирует в трёх утечках,
произошедших в период с 2020 по 2025 год.

#figure(
  image("/img/hibp.png", width: 80%),
  caption: "Результаты проверки email-адреса в сервисе"
) <hibp>

Утечки произошли в сервисах Suno, CDEK и StreamCraft.

#figure(
  image("/img/suno.png", width: 80%),
  caption: "Отчет по утечке данных от платформы Suno"
) <suno>

#figure(
  image("/img/cdek.png", width: 80%),
  caption: "Отчет по утечке данных от платформы CDEK"
) <cdek>

#figure(
  image("/img/streamcraft.png", width: 80%),
  caption: "Отчет по утечке данных от платформы StreamCraft"
) <streamcraft>

После выполнения ЛР №8 я удалил аккаунты в Sudo и CDEK.
В StreamCraft удалить аккаунт, к сожалению, нельзя, поэтому хотя бы поменяем пароль. 

Также я поменяю четыре пароля короче 12 символов, один из которых для "Госуслуг" — важнейшего сервиса для ведения гражданских дел в России.

= Замена паролей
== StreamCraft
https://streamcraft.net

#figure(
  image("/img/streamcraft-reset.png", width: 80%),
  caption: "Сброс пароля для StreamCraft"
)

#figure(
  image("/img/streamcraft-success.png", width: 80%),
  caption: "Пароль StreamCraft изменён"
)

== Школа программистов
https://acmp.ru

#figure(
  image("/img/acmp-reset.png", width: 80%),
  caption: "Сброс пароля для \"Школы программистов\""
)

#figure(
  image("/img/acmp-success.png", width: 80%),
  caption: "Пароль \"Школы программистов\" изменён"
)

== Battle.net
https://battle.net

#figure(
  image("/img/battle-reset.png", width: 80%),
  caption: "Сброс пароля для Battle.net"
)

#figure(
  image("/img/battle-success.png", width: 80%),
  caption: "Пароль Battle.net изменён"
)

== ITMO ID
https://id.itmo.ru

#figure(
  image("/img/itmo-reset.png", width: 70%),
  caption: "Сброс пароля для ITMO ID"
)

#figure(
  image("/img/itmo-success.png", width: 70%),
  caption: "Пароль ITMO ID изменён"
)

== Госуслуги
https://gosuslugi.ru

#figure(
  image("/img/gosuslugi-reset.png", width: 80%),
  caption: "Сброс пароля для \"Госуслуг\""
)

#figure(
  image("/img/gosuslugi-success.png", width: 80%),
  caption: "Пароль \"Госуслуг\" изменён"
)

= Анализ паролей
После замены всех паролей на пяти аккаунтах, добавим
аутентификационные данные в хранилище.

#figure(
  image("/img/bitwarden-logins.png", width: 80%),
  caption: "Записи в BitWarden аккаунтов с новыми паролями"
)

Около года я пользуюсь менеджером паролей от Apple. 
При регистрации в новых сервисах создаю сложный пароль случайным образом через встроенный генератор. 
Однако сервисы, в которых я зарегистрировался ранее, имеют слабые пароли: короткие, без спецсимволов, цифр, заглавных букв.
Я завёл себе задачу в менеджере личных дел, чтобы поменять все слабые пароли на новые сильные, случайно сгенерированные. 

= Двухфакторная аутентификация через TOTP

Двухфакторная аутентификация (или 2FA, Two-Factor authentication) –
это метод защиты учетной записи, предполагающий предоставление сразу
двух различных типов доказательств, чтобы убедиться, что пользователь –
тот, за кого себя выдает.

TOTP (Time-based One-Time Password Algorithm — алгоритм одноразовых паролей на основе времени) — это технология двухфакторной аутентификации (2FA), которая генерирует короткие (обычно 6-значные) числовые коды, действующие всего несколько десятков секунд.

Подключим 2FA через TOTP для ChatGPT. В личном кабинете включим двухфакторную аутентификацию.

#figure(
  image("/img/totp-mac.png", width: 60%),
  caption: "Настройка 2FA в ChatGPT"
)

Установим на телефон Google Authenticator и отсканируем QR-код.

#figure(
  image("/img/totp-iphone.png", width: 30%),
  caption: "Одноразовый код для ChatGPT в Google Authenticator на телефоне"
)

В личном кабинете введём одноразовый код и подключим устройство.

#figure(
  image("/img/totp-mac-code.png", width: 60%),
  caption: "Ввод одноразового кода в настройках ChatGPT"
)

= Вывод

Настроил BitWarden, прогнал свою почту через Have I Been Pwned. Она засветилась в трёх утечках: Suno, CDEK и StreamCraft. Аккаунты в Suno и CDEK удалил, в StreamCraft удалить нельзя, поэтому хотя бы сменил пароль. Заодно поменял четыре пароля короче 12 символов: Госуслуги, ITMO ID, Battle.net и ACMP.

Старые пароли были слабые: короткие, без спецсимволов и цифр. Новые сделал случайно сгенерированными и сложными, всё сложил в менеджер. Также включил 2FA через TOTP для ChatGPT (Google Authenticator). Вывод простой: нужно использовать менеджер паролей, генератор и 2FA. А старые слабые пароли надо планомерно менять, что я и завёл себе задачей.