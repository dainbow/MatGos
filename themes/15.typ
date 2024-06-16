#import "../conf.typ": *

= Дифференциальные формы на открытых подмножествах евклидова пространства, оператор внешнего дифференцирования $dif$ и его независимость от криволинейной замены координат
== Дифференциальные формы, оператор внешнего дифференцирования
В этом и других билетов, связанных с дифференциальными формами введём понятия $E = RR^n$ -- евклидово
пространство.

$E^*$ -- сопряжённое к нему, aka пространство линейных функционалов aka линейных
форм aka ковекторов.

Если мы будем употреблять $p in NN$, то мы имеем ввиду количество векторов
#eq[
  $x_1, ..., x_p in E$
]

Если мы будем употреблять $q in NN$, то мы имеем ввиду количество ковекторов
#eq[
  $y^1, ..., y^q in E^*$
]

Обратите внимание на индексы, это важно.

#definition[
  *Полилинейной формой валентности $(p, q)$* называется функция $U : E^p times (E^*)^q -> RR$,
  линейная по каждому из аргументов.
]

#proposition[
  Полилинейная форму однозначно определяется значениями на базисных элементах $E$ и $E^*$,
  то есть числами
  #eq[
    $omega_(bold(i))^(bold(j)) := omega_(i_1, ..., i_p)^(j_1, ..., j_q) = U(e_i_1, ..., e_i_p, e^(j_1), ..., e^(j_q))$
  ]
  где $seq(idx: i, end: n, e)$ -- базис $E$, а ${e^j}_(j = 1)^q$ -- двойственный
  базис $E^*$.
]

#proof[
  Очевидно из линейности.
]

#definition[
  Набор чисел ${omega_(bold(i))^(bold(j)) | i in (overline("1, n"))^p, j in (overline("1, n"))^q}$ (то
  есть мы рассматриваем значения на всех комбинациях базисных векторов и
  ковекторов) называется *тензором*
]

#proposition[
  Множество полилинейных форм валентности $(p ,q)$ образует *линейное
  пространство* $Omega_p^q$.
]

#definition[
  *Тензорным произведением* форм $U in Omega_(p_1)^(q_1); V in Omega_(p_2)^(q_2)$ называется
  форма $U times.circle V in Omega_(p_1 + p_2)^(q_1 + q_2)$, задаваемая формулой.
  #eq[
    $\ forall bold(x) in E^(p_1 + p_2) : forall bold(y) in E^(q_1 + q_2) : \ U times.circle V (x_1, ..., x_p_1, x_(p_1 + 1), ..., x_(p_1 + p_2), y^1, ..., y^(q_1), y^(q_1 + 1), ..., y^(q_1 + q_2)) = \
    U(x_1, ..., x_p_1, y^1, ..., y^(q_1))dot V(x_(p_1 + 1), ..., x_(p_1 + p_2), y^(q_1 + 1), ..., y^(q_1 + q_2))$
  ]
]

#definition[
  $W in Omega_p^0$ называется *симметрической*, если она не изменяется при любой
  перестановке её аргументов.
]

#definition[
  $W in Omega_p^0$ называется *антисимметрической (кососимметрической)*, если при
  любой перестановке пары её аргументов она меняет знак.

  Введём линейное пространство антисимметрических форм:
  #eq[
    $Lambda_p := { W in Omega_p^0 | W - "антисимметрическая" }$
  ]
]

#definition[
  Пусть $pi_p = (i_1, ..., i_p)$ -- перестановка индексов ${1, ..., p}$. Тогда
  #eq[
    $forall W in Omega_p^0 : forall bold(x) in E^p : space (pi_p W) (x_1, ..., x_p) := W(x_i_1, ..., x_i_p)$
  ]
]

#definition[
  *Симметризацией формы* $W in Omega_p^0$ называется форма
  #eq[
    $"sym" W := 1 / p! sum_(pi_p in S_p) pi_p W$
  ]
]

#definition[
  *Антисимметризацией формы* $W in Omega_p^0$ называется форма
  #eq[
    $"asym" W := 1 / p! sum_(pi_p in S_p) "sgn" pi_p dot pi_p W$
  ]
]

#definition[
  Если $U in Lambda_p, V in Lambda_q$, то их *внешним произведением* называется
  #eq[
    $U and V := (p + q)! / (p!q!) "asym" (U times.circle V)$
  ]
]

#theorem(
  "Основные свойства внешнего произведения",
)[
  + Линейность
    - $(alpha_1 U_1 + alpha_2 U_2) and V = alpha_1 (U_1 and V) + alpha_2 (U_2 and V)$
    - $U and (alpha_1 V_1 + alpha_2 V_2) = alpha_1 (U and V_1) + alpha_2 (U and V_2)$
  + Ассоциативность
    - $(U and V) and W = U and (V and W)$
  + Антикоммутативность
    - $forall U in Lambda_p : forall V in Lambda_q : space U and V = (-1)^(p q) (V and U)$
]

#proposition[
  Базисом в пространстве $Lambda_p$ является система
  #eq[
    ${f^(i_1) and ... and f^(i_p) | 1 <= i_1 < ... < i_p <= n}$
  ]
  где $seq(idx: i, end: n, f)$ -- базис в $E^* = Lambda_1$. (Принято брать базис
  проекторов)
] <form-basic>

#definition[
  *$p$-формой (дифференциальной формой валентности (степени) $p$)* на множестве $U subset E$ называется
  отображение $Omega : U -> Lambda_p$.

  В силу линейности пространства $Lambda_p$, нам достаточно задать поведение
  получаемой формы лишь на базисе, поэтому
  #eq[
    $forall x in U : space Omega(x) := sum_(1 <= i_1 < ... < i_p <= n) omega_(i_1, ..., i_p) (x) f^(i_1) and ... and f^(i_p)$
  ]
  Таким образом, дифференциальная форма однозначно задаётся наобором
  действительнозначных функций
  #eq[
    ${omega_(i_1, ..., i_p) | 1 <= i_1 < ... < i_p <= n}$
  ]
]

#definition[
  *Внешнее дифференцирование $p$-формы* определяется как $(p + 1)$-форма
  #eq[
    $dif Omega : U -> Lambda_(p + 1)$
  ]
  По правилу
  #eq[
    $forall x in U : space dif Omega (x) := (p + 1) "asym" (Omega' (x))$
  ] где под производной подразумевается производная по Фреше.

  Стоит заметить, что, формально $Omega' : U -> U -> Lambda_p$, однако мы считаем,
  что $U -> Lambda_p subset Omega_(p + 1)^0$ (Действительно, линейно по $p + 1$ вектору
  получаем число).

  Также стоит упомянуть, что для любого базиса $(e_1, ..., e_n)$ из $E$ и
  двойственного к нему базиса $(e^1, ..., e^n)$ существует соглащение, что
  #eq[
    $forall i = overline("1, n") : space e^i = dif e_i$
  ]
  Которое не лишено смысла, ведь $e_i$ -- это 0-форма. А $e^i$ -- это функционал,
  то есть $1$-форма.
]

#theorem(
  "Основные свойства операции внешнего дифференцирования",
)[
  + $dif (Omega and Pi) = (dif Omega and Pi) + (-1)^p (Omega and dif Pi)$, где $Omega$ -- $p$-форма,
    а $Pi$ -- $q$-форма.
  + $d(d Omega) = 0$
]

#proof[
  + Для простоты считаем, что форма -- одночлен, по линейности всё очевидно
    доказывается для произвольной формы.

    Фиксируем базис, в котором
    #eq[
      $Omega (x) = omega(x) dif x^(i_1) and ... and dif x^(i_p); quad Pi(x) = pi(x) dif x^(j_1) and ... and dif x^(j_q)$
    ]
    Тогда
    #eq[
      $dif (Omega and Pi) = dif (omega(x) pi(x) dif x^(i_1) and ... and dif x^(i_p) and dif x^(j_1) and ... and dif x^(j_q)) = \
      dif (omega(x) pi(x)) and dif x^(i_1) and ... and dif x^(i_p) and dif x^(j_1) and ... and dif x^(j_q) = \
      pi(x) sum_(i = 1)^n (partial omega) / (partial x_i) (x) dif x^(i_1) and ... and dif x^(i_p) and dif x^(j_1) and ... and dif x^(j_q) + \
      omega(x) sum_(i = 1)^n (partial pi) / (partial x_i) (x) dif x^(i_1) and ... and dif x^(i_p) and dif x^(j_1) and ... and dif x^(j_q) = \
      d Omega and Pi (x) + (-1)^p (Omega and dif Pi)$
    ]
    В последнем переходе мы воспользовались свойством антикоммутативности внешнего
    произведения для перестановки всех $dif x^(j_...)$ перед всеми $dif x^(i_...)$,
    остальное свернули по определению
  + Распишем двойной дифференциал:
    #eq[
      $dif(dif Omega) = dif(
        sum_(j, forall k : j != i_k) (partial omega) / (partial x_j) dif x^j and dif x^(i_1) and ... and dif x^(i_p)
      ) = \
      sum_(l, l != j, forall k : l != l_k)sum_(j, forall k : j != i_k) (partial^2 omega) / (partial x_l partial x_j) dif x^l and dif x^j and dif x^(i_1) and ... and dif x^(i_p) = \
      sum_(j, l, j < l, forall k : j != i_k and l != i_k) ((partial^2 omega) / (partial x_l partial x_j) - (partial^2 omega) / (partial x_j partial x_l)) dif x^l and dif x^j and dif x^(i_1) and ... and dif x^(i_p) = 0$
    ]
]

== Независимость внешнего дифференцирования от замены координат
#definition[
  Пусть
  - $Omega$ -- дифференциальная $p$-форма в области $U subset RR^n$
  - $phi : V -> U$ -- диффеоморфизм области $V subset RR^n$ на $U$
  Тогда $phi^* Omega$ -- дифференциальная $p$-форма в области $V$, определяемая
  как
  #eq[
    $forall bold(b) in RR^n : space (phi^* Omega) (y) (bold(b)) := Omega (phi(y)) (phi'(y) b_1, ..., phi'(y) b_p)$
  ]
]

#proposition(
  "Правило подсчёта",
)[
  Мы можем выразить форму после замены координат через упомянутое выше базисное
  представление:
  #eq[
    $(phi^* Omega)(y) = sum_(1 <= i_1 < ... < i_p <= n) omega_(i_1, ..., i_p)(phi(y)) dif phi^(i_1)(y) and ... and dif phi^(i_p)(y)$
  ]
]

#proof[
  Заметим, что для произвольного вектора $b in RR^n$ верно
  #eq[
    $dif phi^i (y)(b) = sum_(l = 1)^n (partial phi^i) / (partial y^l)(y) dif f^l (b) = sum_(l = 1)^n (partial phi^i) / (partial y^l)(y) b^l = (phi'(y) b)^i = dif f^i (phi'(y) b)$
  ]
  Не забывайте, что в качестве $dif f^i$ мы берём проекцию на $i$-ую координату.

  Что и требовалось.
]

#lemma("Независимость внешнего дифференцирования от замены координат")[
  #eq[
    $phi^*(dif Omega) = dif (phi^* Omega)$
  ]
]

#proof[
  БОО считаем, что $Omega$ -- это одночлен, для многочленов обобщается очевидно по
  линейности.

  Зафиксируем $Omega = omega (x) and dif x^(i_1) and ... and dif x^(i_p)$

  Тогда по свойствам внешнего дифференцирования:
  #eq[
    $dif Omega = dif omega (x) and dif x^(i_1) and ... and dif x^(i_p)$
  ]
  Тогда по правилу подсчёта
  #eq[
    $phi^* (dif Omega) = dif omega (phi(y)) and dif phi^(i_1)(y) and ... and dif phi^(i_p)(y)$
  ]
  С другой стороны, по определению замены координат
  #eq[
    $phi^*(Omega) = omega(phi(y)) dif phi^(i_1)(y) and ... and dif phi^(i_p) (y)$
  ]
  Применим оба свойства внешнего дифференцирования (двойной дифференциал нулевой и
  псевдодистрибутивность):
  #eq[
    $dif (phi^* Omega) = dif omega (phi(y)) and dif phi^(i_1)(y) and ... and dif phi^(i_p)(y)$
  ]
]
