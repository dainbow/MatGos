#import "../conf.typ": *

= Математическое ожидание и дисперсия случайной величины, их свойства. Вычисление для нормального распределения.
== Математическое ожидание и дисперсия случайной величины, их свойства.
#definition[
  Система $cal(F)$ подмножеств $Omega$ называется *алгеброй*, если
  + $Omega in cal(F)$
  + $A in cal(F) => overline(A) := (Omega without A) in cal(F)$
  + $A, B in cal(F) => A sect B in cal(F)$
]

#definition[
  Система $cal(F)$ подмножеств $Omega$ называется *$sigma$-алгеброй*, если
  + $cal(F)$ -- алгебра
  + $forall seq(A) subset cal(F) => union.big_(n = 1)^oo A_n in cal(F)$
]

#definition[
  $P$ называется *вероятностной мерой* на $(Omega, cal(F))$, если $P : cal(F) -> [0, 1]$,
  удовлетворяющая свойствам:
  + $P(Omega) = 1$
  + $forall seq(A) : space P(union.sq_(n = 1)^oo A_n) = sum_(n = 1)^oo P(A_n)$
]

#definition[
  *Вероятностное пространство* -- это тройка $(Omega, cal(F), P)$, где
  - $Omega$ -- множество *элементарных исходов*
  - $cal(F)$ -- $sigma$-алгебра подмножеств $Omega$, элементы $cal(F)$ называются
    *событиями*
  - $P$ -- вероятностная мера на измеримом пространстве $(Omega, cal(F))$
]

Далее будем предполагать, что $(E, cal(E))$ -- произвольное измеримое
пространство.

#definition[
  *Борелевской сигма-алгеброй* называется наименьшая $sigma$-алгебра над $RR$,
  содержащая все интервалы.

  Обозначение -- $cal(B) (RR)$
]

#definition[
  Отображение $X : Omega -> E$ называется *случайным элементом*, если оно
  измеримо, то есть
  #eq[
    $forall B in cal(E) : space X^(-1) (B) = {omega | X(omega) in B} in cal(F)$
  ]
]

#definition[
  Если $(E, cal(E)) = (RR, cal(B) (RR))$, то случайный элемент называется
  *случайной величиной*.
]

#definition[
  Если $(E, cal(E)) = (RR^n, cal(B) (RR^n))$, то случайный элемент называется
  *случайным вектором*.
]

#definition[
  *Распределением* случайной величины (вектора) $xi$ называется вероятностная мера $P_xi$ на $(RR, cal(B)(RR))$ ($(RR^n, cal(B) (RR^n))$),
  определённая по правилу:
  #eq[
    $forall B in cal(B)(RR) : space P_xi (B) := P(xi in B) = P({omega in Omega | xi(omega) in B})$
  ]
]

#definition[
  *Простой случайной величиной* называется случайная величина $xi$:
  #eq[
    $xi(omega) = sum_(k = 1)^n x_k II_(A_k) (omega)$
  ]
  где $x_1, ..., x_n$ -- все различные значения $xi$, а события $A_1, ..., A_n$ образуют
  разбиение $Omega$.
]

#definition[
  *Математическим ожиданием* простой случайной величины $xi$ называется величина $EE xi = sum_(k = 1)^n x_k P_xi (A_k)$
]

#lemma(
  "Свойства матожидания",
)[
  Пусть $xi$ и $eta$ -- простые случайные величины. Тогда
  + Линейность. Если $a, b in RR$, то $EE(a xi + b eta) = a EE xi + b EE eta$
  + Если $xi >= 0$, то $EE xi >= 0$
  + Если $xi >= eta$, то $EE xi >= EE eta$
]

#definition[
  Пусть $xi >= 0$ -- неотрицательная случайная величина. Рассмотрим
  последовательность простых неотрицательных случайных величин $seq(xi)$, которой
  монотонно к ней сходится.

  *Математическим ожиданием* неотрицательной случайной величины $xi$ называется
  величина $EE xi = lim_(n -> oo) EE xi_n$
]

#definition[
  Пусть $xi$ -- произвольная случайная величина. Рассмотрим $xi^= = max(xi, 0); xi^- = max(-xi, 0)$.
  Это неотрицательные случайные величины, при этом $xi = xi^+ - xi^-$.

  + Если $EE xi^+ < +oo, EE xi^- < +oo$, то математическим ожиданием величины $xi$ назовём $EE xi = EE xi^+ - EE xi^-$
  + Если $EE xi^+ = +oo, EE xi^- = +oo$, то математическое ожидание случайной
    величины $xi$ не определено
  + Иначе $EE xi^plus.minus = +oo$. Тогда математическим ожиданием случайной
    величины $xi$ будем считать $plus.minus oo$
]

#note[
  Математическое ожидание -- это интеграл Лебега по вероятностной мере $P$.
]

#lemma(
  "Дополнительные свойства матожидания",
)[
  + $abs(EE xi) <= EE abs(xi)$
  + Если $xi = 0$ почти наверное, то $EE xi = 0$
  + Если $xi = eta$ почти наверное и $EE xi$ конечно, то $EE eta$ конечно и $EE xi = EE eta$
  + Если $xi >= 0$ и $EE xi = 0$, то $xi = 0$ почти наверное
  + Пусть $EE eta$ и $EE eta$ конечны. Тогда
    #eq[
      $forall A in cal(F) : EE (xi II_A) <= EE(eta II_A) => xi <= eta$
    ]
]

#proof[
  Все свойства очевидным образом следует из соответствующих свойств интеграла
  Лебега.
]

#definition[
  Если $EE xi$ конечно, то *дисперсией* случайной величины $xi$ называется
  #eq[
    $VV xi = EE (xi - EE xi)^2$
  ]
]

#lemma(
  "Свойства дисперсии",
)[
  + $forall c in RR : space VV(c xi) = c^2 VV(xi); quad VV(xi + c) = VV(xi)$
  + $VV xi = EE xi^2 - (EE xi)^2$
]

#proof[
  Очевидно следуют из свойств матожидания.
]

== Вычисление для нормального распределения
#definition[
  *Функцией распределения* вероятностной меры $P$ на $RR$ называется
  #eq[
    $F(x) = P((-oo, x])$
  ]
]

#definition[
  Пусть $P$ -- вероятностная мера на $(RR, cal(B)(RR))$, а $F$ -- её функция
  распределения.

  Она называется *абсолютно непрерывной*, если
  #eq[
    $exists p(t) >= 0 : forall x in RR : integral_RR p(t) dif t = 1 and F(x) = integral_(-oo)^x p(t) dif t$
  ]
  В этом случае $p(t)$ называтся *плотностью* функции распределения $F$ и меры $P$.
]

#definition[
  Распределение называется *нормальным* c параметрами $a in RR, sigma in RR^(++)$,
  если его плотность имеет вид
  #eq[
    $p(x) = 1 / sqrt(2 pi sigma^2) exp(- (x - a)^2 / (2 sigma^2))$
  ]
  Обозначение -- $cal(N)(a, sigma^2)$
]

#proposition[
  Если $xi$ имеет нормальное распределение $cal(N)(a, sigma)$, то
  #eq[
    $EE xi = a$
  ]
]

#proof[
  #eq[
    $EE xi = 1 / sqrt(2 pi sigma^2) integral_RR x exp(- (x - a)^2 / (2 sigma^2)) dif mu(x) = attach(=, t: t = (x - a) / sigma) 1 / sqrt(2 pi) integral_RR (sigma t + a) e^(-t^2 / 2) dif mu(t) = \
    1 / sqrt(2 pi) (integral_RR underbrace(sigma t e^(-t^2 / 2), "нечётная") dif mu(t) + integral_RR a e^(-t^2 / 2) dif mu(t)) = a / sqrt(2 pi) integral_RR e^(-t^2) dif mu(t) $
  ]
  Получили интеграл Эйлера-Пуассона. Напомним, как его вычислять:
  #eq[
    $\
    (integral_RR e^(-x^2) dif x)^2 = (integral_RR e^(-x^2) dif x)(integral_RR e^(-y^2) dif y) = integral.double_(RR^2) e^(-x^2 - y^2) dif x dif y attach(=, t: cases(x = rho cos phi, y = rho sin phi)) 1 / 2 integral_0^(2pi)integral_0^oo e^(-rho^2) dif rho^2 dif phi = \
    1 / 2 integral_0^(2pi) dif phi integral_0^oo e^(-t) dif t = pi $
  ]
  Мы вычисляли квадрат интеграла, а значит сам интеграл равен $sqrt(pi)$.

  Таким образом матожидание равно $a$.
]
