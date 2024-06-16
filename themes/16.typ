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
  Интегралом от формы $Omega (x) = alpha(x) V_(e_0)$ по области $D subset E$ называется
  #eq[
    $integral_D Omega = integral_D alpha(x) dif mu(x)$
  ]
]

#definition[
  Если $Omega$ -- гладкая $n - 1$ форма, заданная на замыкании куба $K subset RR$,
  то
  #eq[
    $integral_(partial K) Omega := integral_K dif Omega$
  ]
]

#definition[
  Для формы $Omega$ и диффеоморфизма $phi: U -> V$, $M subset U$ -- клетки, $K subset V$ -- куба:
  #eq[
    $integral_M Omega = integral K phi^* Omega$
  ]
]
