#import "../conf.typ": *

= Общая формула Стокса
#definition[
  *Границей клетки* $M = phi(K)$ называется
  #eq[
    $partial M := phi(partial K)$
  ]
]

#theorem(
  "Теорема Стокса для клетки",
)[
  Если $Omega$ -- гладкая $m - 1$ форма, заданная в окрестности $m$-мерной клетки,
  то
  #eq[
    $integral_(partial M) Omega = integral_M dif Omega$
  ]
]

#proof[
  Используя Теорему Стокса для куба (aka определение интеграла по формам меньших
  размерностей) и свойство инвариантности внешнего дифференцирования от замены
  координат:
  #eq[
    $integral_(partial M) Omega = integral_(partial K) phi^* Omega = integral_K dif (phi^* Omega) = integral_K phi^* (dif Omega) = integral_M dif Omega$
  ]
]
