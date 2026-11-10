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
  *Лабораторная работа №6* \
])

#align(center + horizon, text(16pt)[
  Криптография на практике: шифрование файлов и сообщений
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

= Симметричное шифрование
Установим VeraCrypt, создадим зашифрованный контейнер (Create
Volume → Create an encrypted file container → Standard VeraCrypt volume),
придумаем пароль. Далее смонтируем созданный контейнер.

#figure(
  image("img/mounted.png", width: 80%),
  caption: "Смонтированный контейнер"
)

В проводнике появился новый диск.

#figure(
  image("img/new-disk.png", width: 80%),
  caption: "Новый виртуальный диск"
)

Скопируем туда несколько текстовых файлов и картинку, после чего
размонтируем диск.

#figure(
  image("img/files.png", width: 80%),
  caption: "Добавленные файлы"
)

#figure(
  image("img/unmounted.png", width: 80%),
  caption: "Размонтированный диск"
)

= Асимметричное шифрование

Сгенерируем свою пару ключей с помощью gnupg.
```bash
gpg --full-generate-key
```

#figure(
  image("img/full-generate-key.png", width: 100%),
  caption: "Сгенерированная пара ключей"
)

Прилагаю вместе с отчетом открытый PGP ключ.
```bash
gpg --export --armor "malyshev.2005n@gmail.com" > public_key.asc
```

#figure(
  image("img/pub-key.png", width: 80%),
  caption: "Открытый PGP ключ"
)

Далее друг (моя вторая почта) шифрует сообщение с помощью моего
публичного ключа, и мы получаем от него
зашифрованное сообщение.

```bash
echo "Secret Message N. A. Malyshev" > secret_message_friend2me.txt
gpg --encrypt --armor --recipient malyshev.2005n@gmail.com secret_message_friend2me.txt
```

#figure(
  image("img/crypted.png", width: 100%),
  caption: "Зашифрованное сообщение от друга мне"
)

#figure(
  image("img/got.png", width: 80%),
  caption: "Полученное зашифрованное сообщение"
)

Далее расшифровываем полученное сообщение с помощью моего
приватного ключа и passphrase.
```bash
gpg --decrypt secret_message_friend2me.txt.asc
```
#figure(
  image("img/decrypt.png", width: 80%),
  caption: "Расшифрованное сообщение"
)

А теперь попробуем подписать ответное сообщение с помощью
открытого ключа друга.

```bash
echo "Secret Answer N. A. Malyshev" > secret_message_me2friend.txt
gpg --encrypt --armor --recipient malyshev1995@icloud.com secret_message_me2friend.txt
```

#figure(
  image("img/secret-pub-key.png", width: 100%),
  caption: "Зашифрованное сообщение от меня другу"
)

#figure(
  image("img/got-me2friend.png", width: 80%),
  caption: "Полученное зашифрованное сообщение от меня другу"
)

Далее друг успешно расшифровывает полученное сообщение с
помощью своего приватного ключа.

```bash
gpg --decrypt secret_message_me2friend.txt.asc
```

#figure(
  image("img/decrypt-me2friend.png", width: 80%),
  caption: "Расшифрованное сообщение от меня другу"
)

Таким образом, получилось успешно обменяться открытыми ключами
и отправить друг другу зашифрованное текстовое сообщение.

= Разница между симметричным и асимметричным шифрованием

Симметричное шифрование использует один и тот же секретный ключ
как для шифрования, так и для расшифровки данных. Это означает, что
отправитель и получатель должны заранее договориться о ключе и
обеспечить его безопасную передачу. Пример алгоритма: AES. Такой подход
быстр и эффективен для шифрования больших объёмов данных (например,
файлов или дисков), но требует надёжного канала для обмена ключом.

Асимметричное шифрование (или шифрование с открытым ключом)
использует пару математически связанных ключей: открытый ключ —
публичный, им может пользоваться любой желающий для шифрования
сообщения; закрытый ключ — хранится в тайне владельцем и используется
только для расшифровки. Благодаря этому отпадает необходимость в
предварительном обмене секретной информацией: чтобы отправить
зашифрованное сообщение, достаточно знать открытый ключ. Примеры
алгоритмов: RSA, ECC. Однако асимметричное шифрование значительно
медленнее, поэтому на практике его часто используют только для обмена
симметричным ключом (например, в TLS/SSL или PGP).

= Вывод
В ходе лабораторной мы на практике разобрались с двумя подходами к шифрованию. Сначала через VeraCrypt создали зашифрованный контейнер, смонтировали его как отдельный диск, закинули туда файлы и размонтировали. После этого без пароля содержимое недоступно, что наглядно показывает, как работает симметричное шифрование на уровне диска.

Потом через GnuPG сделали свою пару ключей, обменялись открытыми ключами со второй почтой и в обе стороны зашифровали и расшифровали сообщения. Заодно стало понятно, в чём разница: симметричный подход быстрый и удобный для больших объёмов данных, но требует безопасно передать ключ, а асимметричный решает проблему обмена ключами, хотя и медленнее. На практике их обычно комбинируют: асимметрикой договариваются о сессионном ключе, а дальше шифруют симметрично.