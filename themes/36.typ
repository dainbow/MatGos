#import "../conf.typ": *
= Интегральная формула Коши. Разложение функции регулярной в окрестности точки в ряд Тейлора.

== Интегральная формула Коши.

#theorem[_Формула Коши для круга_
  Пусть f голоморфна в D, $overline(O_rho(a)) in D$ тогда
  #eq[$
      f(z) = 1/(2 pi i) integral_(abs(zeta - a) = rho) (f(zeta)) / (zeta - z) d zeta
    $]

]

#proof[
  В силу $overline(O_rho(a)) in D => exists R > rho: space O_R(a) in D$.
  Зафиксируем $z in O_rho(a)$

  Рассмотрим следующую функцию
  #eq[$
      g(zeta) = cases((f(zeta) - f(z)) / (z - zeta) \, zeta != z, f'(z) \, z = zeta)
    $]

  Она удовлетворяет условиям усиленной Леммы Гурса, следовательно
  #eq[$
      0 = integral_(abs(zeta - a) = rho) g(zeta) d zeta = integral_(abs(zeta - a) = rho) (f(zeta)) / (zeta - z) d zeta - integral_(abs(zeta - a) = rho) (f(z)) / (zeta - z) d zeta = integral_(abs(zeta - a) = rho) (f(zeta)) / (zeta - z) d zeta - f(z) integral_(abs(zeta - a) = rho) d zeta / (zeta - z).
    $]

  Обозначим $G(z) = integral_(abs(zeta - a) = rho) d zeta / (zeta - z)$.

  Она голоморфна в области как интеграл Коши. $G' = integral_(abs(zeta - a) = rho) (d zeta) / (zeta - z)^2 equiv 0$

  Следовательно $G(z) = "const" = G(a) = 2 pi i$

  Отсюда эелементарно получим требуемое.
]

#note[Фомулировку для более общего случая смотри в прошлом билете]
== Разложение функции регулярной в окрестности точки в ряд Тейлора.

#theorem[
  Пусть $f$ - голоморфная в $D$, $O_R(a) subset D$, тогда
  #eq[$forall z in O_R(a): f(z) = sum_(n=0)^(infinity) c_n (z-a)^n, space c_n = f^((n))(a) / n! $]
]

#proof[
  Возьмем $0 < r < R$, тогда $f$ голоморфна в $overline(O_r(a))$. Тогда по теореме
  Коши
  $2 pi i space f(z) = integral_(gamma_r) (f(xi) d xi) / (xi - z)$.

  Распишем #eq[$1 / (xi - z) = 1 / ((xi - a) - (z - a)) = 1 / ((xi - a)) dot.op 1 / (1 - (z - a) / (xi - a)) =^((|z-a| < |xi - a|)) = 1 / (xi - a) sum^infinity ((z-a)/(xi-a))^n = sum^infinity (z-a)^n/(xi-a)^(n+1)$]

  Полученный ряд сходится равномерно, а значит можно почленно интегрировать.

  $2 pi i space f(z) = integral_(gamma_r) f(xi) / xi = sum^infinity integral (f(xi))/(xi-a)^(n+1) (z-a)^n = sum_(n=0)^(infinity) 2 pi i c_n (z-a)^n$

  Причем по следтвию формулы Коши для круга, $2 pi i dot.op c_n = f^((n)) / n!$

  Ну раз верно для любого $r < R$, то и для $R$ верно.
]