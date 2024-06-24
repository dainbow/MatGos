#import "../conf.typ": *

= Интегрирование дифференциальной формы с компактным носителем. Зависимость интеграла от замены координат.
Из @form-basic Пространство $Lambda_n $ одномерно. Иными словами, если $(f^1, ..., f^n)$ -- базис $E^*$,
то
#eq[
  ${c f^1 and ... and f^n | c in RR} = Lambda_n$
]

Тогда если $(e^1_0, ..., e^n_0)$ -- ортонормированный базис в $E^*$ сопряжённый
к $(e_1^0, ..., e_n^0)$ -- ортонормированному базису в $E^*$.

Введём форму *ориентированного объёма*
#eq[
  $V_(e^0) = e^1_0 and ... and e^n_0 attach(=, t: "соглашение") dif e_1^0 and ... dif e_n^0$
]

Возьмём произвольный базис $(e_1^0, ..., e_n^*)$ в $E$, связанный с исходным
матрицей перехода $T$:
#eq[
  $forall j : space e_j = t_j^i e_i^0$
]

Рассмотрим действие:
#eq[
  $V_(e_0) (e_1, ..., e_n) = dif e_1^0 and ... dif e_n^0 (e_1, ..., e_n) = det (dif e_i^0 (e_j))_(i, j = 1)^(n) = det T$
]

Причём $forall$ базиса форма ориентированного объёма на нём самом равна $1$:
#eq[
  $V_(e_0) = det T dot V_e$
]

В начале определим интеграл от форм из $Lambda_n$.

#definition[
  *Интегралом от формы* $Omega (x) = alpha(x) V_(e_0)$ по области $D subset E$ называется
  #eq[
    $integral_D Omega = integral_D alpha(x) dif mu(x)$
  ]
]

#definition[
  *Стандартным кубом* $K$ называется
  #eq[
    $x_0 in K <=> forall i in overline("1, n") : space 0 < x_0^i < 1 $
  ]
  в ортономированном базизе $e_1^0, ..., e_n^0$.
]

#definition[
  *Цепь стандартных кубов* -- это формальная линейная комбинация
  #eq[
    $Pi = sum_(i = 1)^m n_i K_i; quad n_i in ZZ, K_i - "стандартный куб"$
  ]
]

#definition[
  *Интегралом от формы* $Omega (x) = alpha(x) V_(e_0)$ по цепи кубов $Pi$ называется
  #eq[
    $integral_Pi Omega = sum_(i = 1)^m n_i integral_K_i Omega$
  ]
]

#definition[
  *Граница стандартного куба* -- цепь стандартных $(n - 1)$-мерных кубов с
  коэффицентами $plus.minus 1$, в зависимости от направления внешней нормали.
]

#theorem(
  "Формула Стокса-Пуанкаре для стандартного куба",
)[
  Если $Omega$ -- гладкая $n - 1$ форма, заданная на замыкании куба $K subset RR$,
  то
  #eq[
    $integral_(partial K) Omega = integral_K dif Omega$
  ]
]

#proof[
  Пусть $V_j$ -- форма ориентированного объёма в $n - 1$-мерном подпространстве $n$-мерного
  пространства, в которой отсутствует $dif e_j^0$.

  Тогда БОО
  #eq[
    $Omega (x) = alpha(x) V_j$
  ]
  Значит её дифференциал
  #eq[
    $dif Omega (x) = dif alpha(x) and V_j = (partial alpha (x)) / (partial x_j) dif e_j^0 and V_j = (-1)^(j - 1) (partial alpha (x)) / (partial x_j) V_e_0$
  ]
  Тогда распишем интеграл, к которому хотим свести:
  #eq[
    $integral_K dif Omega = (-1)^(j - 1) integral_K (partial alpha (x)) / (partial x_j) dif mu(x) =^("Фубини" x = (y, x_j)) (-1)^(j - 1) integral_K_j integral_[0, 1] (partial alpha (x)) / (partial x_j) dif e_j^0 dif mu_(n - 1) (y) = \
    (-1)^(j - 1) integral_K_j (alpha(y, 1) - alpha(y, 0)) dif mu_(n - 1) (y) $
  ]
  С другой стороны, от изначального интеграла по границе останутся лишь те
  слагаемые линейной кобинации, в которых также нет $dif e_j^0$, так как в
  остальных какая-то координата, участвующая в $V_j$ фиксирована, а значит
  интеграл будет нулевым:
  #eq[
    $integral_(partial K) Omega = integral_((-1)^(j + 1) K_(j, 1) + (-1)^j K_(j, 0)) alpha(x) V_j = \
    (-1)^(j + 1) integral_((-1)^(j + 1) K_(j, 1)) alpha(x) V_(j , 1) + (-1)^j integral_((-1)^j K_(j, 0)) alpha(x) V_(j, 0) = \
    (-1)^(j - 1) integral_K_j (alpha(y, 1) - alpha(y, 0)) dif mu_(n - 1) (y)$
  ]
]

#definition[
  *Клеткой* называется диффеоморфный образ куба
]

#definition[
  Для формы $Omega$ и диффеоморфизма $phi: U -> V$, $M subset U$ -- клетки, $K subset V$ -- куба:
  #eq[
    $integral_M Omega = integral_K phi^* Omega$
  ]
]
