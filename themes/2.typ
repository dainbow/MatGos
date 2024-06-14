#import "../conf.typ": *

= Ограниченность функции, непрерывной на отрезке, достижение точных верхней и нижней граней
== Ограниченность функции, непрерывной на отрезке
#definition[
  Пусть $f$ определена в некоторой окрестности $U_delta_0 (x_0)$, где $x_0 in RR$.
  Если $lim_(x -> x_0) f(x) = f(x_0)$, то функция называется *непрерывной в точке* $x_0$.
]

#definition[
  $f$ называется *непрерывной на множестве* $X subset RR$, если
  #eq[
    $forall x_0 in X : forall epsilon > 0 : exists delta > 0 : forall x in X, abs(x - x_0) < delta : space abs(f(x) - f(x_0)) < epsilon$
  ]
]

#theorem("Первая теорема Вейшерштрасса о непрерывной на отрезке функции")[
  Если $f$ непрерывна на $[a, b]$, то $f$ ограничена на $[a, b]$.
]

#proof[
  От противного, пусть $f$ неограничена сверху. Тогда
  #eq[
    $sup_(x in [a, b]) f(x) = +oo$
  ]
  То есть
  #eq[
    $forall n in NN : exists x_n in [a, b] : space f(x_n) > n$
  ]
  Причём $forall n in NN : a <= x_n <= b$, то есть $seq(x)$ -- ограниченная, тогда
  по теореме Больцано-Вейерштрасса
  #eq[
    $exists seq(idx: k, x_n) : space lim_(k -> oo) x_n_k = x_0 => lim_(k -> oo) f(x_n_k) = f(x_0)$
  ]
  Однако из $f(x_n) > n$ следует, что $f(x_0) = oo$. Противоречие.
]

== Достижение точных верхних и нижних граней
#theorem(
  "Вторая теорема Вейерштрасса о непрерывных на отрезке функциях",
)[
  Если $f$ непрерывна на $[a, b]$, то
  #eq[
    $exists x', x'' in [a, b] : space f(x') = sup_(x in [a, b]) f(x) ; quad f(x'') = inf_(x in [a, b]) f(x)$
  ]
]

#proof[
  Пусть $M = sup_(x in [a, b]) f(x)$. Тогда по определению супремума
  #eq[
    $forall epsilon > 0 : exists x in [a, b] : space M - epsilon < f(x) <= M$
  ]
  В том числе для $seq(epsilon) = { 1 / n }_(n = 1)^oo$:
  #eq[
    $exists seq(x) subset [a, b] : forall n in NN : space M - 1 / n < f(x_n) <= M $
  ]
  Тогда по теореме Больцано-Вейерштрасса:
  #eq[
    $exists seq(idx: k, x_n) : space lim_(k -> oo) x_n_k = x_0 => lim_(k -> oo) f(x_n_k) = f(x_0) = M$
  ]
  Последнее равенство было получено устремлением $k -> oo$ в неравенстве $M - 1 / n_k < f(x_n_k) <= M$.

  Таким образом, $M$ действительно достижим функцией $f$ в точке $x_0$. Для
  инфимума аналогично.
]
