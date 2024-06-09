#import "conf.typ": *

#let title = [
  ГОС по матану
]

#show: doc => conf(title, doc)

#align(center, text(17pt)[
  *#title*
])

#align(center)[
  Disclaymer: доверять этому конспекту или нет выбирайте сами
]

= Теорема Больцано-Вейерштрасса и критерий Коши сходимости числовой последовательности
== Теорема Больцано-Вейерштрасса
#definition[
  Если $E subset RR$ -- ограниченное сверху (снизу) множество, то $M (m) in RR$ такое,
  что
  #eq[
    $forall x in E : x <= M (x >= m)$
  ]
  называется *верхней (нижней) гранью* множества $E$.
]

#definition[
  Наименьшая из верхних граней множества $E$ называется *точной верхней гранью*: $sup E$.

  Наибольшая из нижних граней множества $E$ называется *точной нижней гранью*: $inf E$.
]

#theorem(
  "О существовании точной верхней (нижней) грани",
)[
  Любое ограниченное сверху (снизу) непустое множество $E subset RR$ имеет точную
  верхнюю (нижнюю) грань.
]

#proof[
  Пусть $B$ -- множество верхних граней множества $E$. Введём обозначение $A := RR without B$.

  Тогда если произвольное число $a$ меньше какого-то $x in E$, то оно точно не
  верхняя грань $E => a in A$.

  Заметим также свойство множества $B$:
  #eq[
    $forall b in B : forall x > b : space x in B$
  ]
  Тогда по одной из аксиом действительных чисел
  #eq[
    $exists c in R : forall a in A : forall b in B : space a <= c <= b$
  ]
  Пусть $sup E := c$. Проверим свойства точной верхней грани:
  + $c$ является верхней гранью

    От противного. Пусть $c in.not B $, тогда $exists x in B : x > c$, причём $c < (x + c) / 2 < x$.

    Но тогда заметим, что $(x + c) / 2 in A$, что противоречит выбору $c$ как числа
    больше либо равного любого элемента $A$
  + $c$ является наименьшей из верхних граней

    От противного. Пусть $exists M in B : M < c$. Но тогда $M < (M + c) / 2 < c$,
    причём $(M + c) / 2 in B$, что противоречит выбору $c$ как числа меньше либо
    равного любого элемента $B$.
]

#theorem(
  "Вейерштрасса",
)[
  Каждая ограниченная сверху (снизу) неубывающая (невозрастающая)
  последовательность сходится, причём её предел равен точной верхней (нижней)
  грани.
]

#proof[
  $seq(x) "ограничена сверху" => exists sup seq(x) = l$

  Отсюда:
  + $forall n in NN : x_n <= l < l + epsilon$
  + $forall epsilon > 0 : exists N in NN : l - epsilon < x_N$ (по определению
    супремума)
  Заметим, что получилось в точности определение предела.
]

#theorem(
  "Принцип Кантора вложенных отрезков",
)[
  Всякая последовательность вложенных отрезков ${[a_n, b_n]}_(n = 1)^oo$, то есть
  #eq[
    $forall n in NN : [a_n, b_n] supset [a_(n + 1), b_(n + 1)]$
  ]
  имеет непустое пересечение, то есть
  #eq[
    $sect.big_(n = 1)^oo [a_n, b_n] != emptyset$
  ]
]

#proof[
  Из вложенности очевидно следует
  #eq[
    $forall n in NN : a_(n + 1) >= a_n, space b_(n + 1) <= b_n$
  ]
  Тогда заметим, что
  #eq[
    $forall n in NN : a_n <= b_1, b_n >= a_1$
  ]
  Тогда по теореме Вейерштрасса:
  #eq[
    $lim_(n -> oo) a_n = sup seq(a) = a \
    lim_(n -> oo) b_n = inf seq(b) = b$
  ]
  А значит отрезок $[a, b]$ (возможно вырожденный) включён в пересечение всех
  отрезков.
]

#theorem("Больцано-Вейерштрасса")[
  Из каждой ограниченной последовательности можно выделить сходящуюся
  подпоследовательность.
]

#proof[
  Пусть $seq(x)$ -- рассматриваемая ограниченная последовательность, то есть
  #eq[
    $exists a_1, b_1 in RR: forall n in NN : space a_1 <= x_n <= b_1$
  ]
  Заметим, что один из отрезков $[a_1, (a_1 + b_1) / 2], [(a_1 + b_1) / 2, b_1]$ содержит
  бесконечно много элементов последовательности.

  Пусть $[a_2, b_2]$ -- тот из отрезков, который содержит бесконечно много
  элементов.

  Продолжая данный трюк счётное количество раз получим последовательность
  вложенных отрезков ${[a_n, b_n]}_(n = 1)^oo$. Также заметим, что данные отрезки
  стягиваются:
  #eq[
    $0 < b_n - a_n = (b_1 - a_1) / 2^n$
  ]

  Тогда по принципу Кантора:
  #eq[
    $sect.big_(n = 1)^oo [a_n, b_n] = {c}$
  ]
  Осталось построить подпоследовательность, будем брать $x_n_k in [a_k, b_k]$,
  причём так, чтобы $n_k > n_(k - 1)$. Очевидно, $n_1 = 1$. Существование предела
  также очевидно:
  #eq[
    $0 <= abs(c - x_n_k) <= b_k - a_k = (b_1 - a_1) / 2^k ->_(k -> oo) 0$
  ]
]

== Критерий Коши
#definition[
  Последовательность $seq(x)$ называется фундаментальной, если
  #eq[
    $forall epsilon > 0 : exists N in NN : forall n > N : forall p in NN : space abs(x_(n + p) - x_n) < epsilon$
  ]
]

#theorem("Критерий Коши сходимости числовой последовательности")[
  Числовая последовательность сходится $<=>$ она фундаментальна.
]

#proof[
  $=>$ По определению предела:
  #eq[
    $exists l in RR : forall epsilon > 0 : exists N in NN : forall n > N : space abs(x_n - l) < epsilon / 2$
  ]
  Тогда по неравенству треугольника в условиях предела:
  #eq[
    $abs(x_(n + p) - x_n) = abs(x_(n + p) - l + l - x_n) <= abs(x_(n + p) - l) + abs(x_n - l) < epsilon$
  ]

  $arrow.l.double$ Вначале докажем, что из фундаментальности следует
  ограниченность:
  #eq[
    $epsilon := 1 : exists N in NN : forall n > N : forall p in NN : space abs(x_(n + p) - x_n) < 1$
  ]
  Тогда заметим, что
  #eq[
    $forall n in NN : min(x_1, ..., x_N, x_(N + 1) + 1) <= x_n <= max(x_1, ..., x_N, x_(N + 1) + 1)$
  ]
  Тогда из ограниченной последовательности $seq(x)$ по теореме
  Больцано-Вейерштрасса достанем сходящуюся подпоследовательность:
  #eq[
    $exists seq(idx: k, x_n) : exists l : forall epsilon > 0 : exists K(epsilon) in NN : forall k > K(epsilon) : space abs(x_n_k - l) < epsilon / 2$
  ]
  Также по определению фундаментальности:
  #eq[
    $forall epsilon > 0 : exists N(epsilon) in NN : forall n > N(epsilon) : forall p in NN : space abs(x_(n + p) - x_n) < epsilon$
  ]
  Объединим эти два условия и получим требуемое:
  #eq[
    $forall epsilon > 0 : exists N_0 = max(N(epsilon), n_(K(epsilon) + 1)) : forall n &> N_0 : \
    abs(x_n - l) = abs(x_n - x_n_(K(epsilon) + 1) + x_n_(K(epsilon) + 1) - l)        &<= abs(x_n - x_n_(K(epsilon) + 1)) + abs(x_n_(K(epsilon) + 1) - l) < epsilon$
  ]
]

= Ограниченность функции, непрерывной на отрезке, достижение точных верхней и нижней граней
== Ограниченность функции, непрерывной на отрезке
#definition[
  Пусть $f$ определена в некоторой окрестности $U_delta_0 (x_0)$, где $x_0 in RR$. Если $lim_(x -> x_0) f(x) = f(x_0)$, то функция называется *непрерывной в точке* $x_0$.
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
  Причём $forall n in NN : a <= x_n <= b$, то есть $seq(x)$ -- ограниченная, тогда по теореме Больцано-Вейерштрасса 
  #eq[
    $exists seq(idx: k, x_n) : space lim_(k -> oo) x_n_k = x_0 => lim_(k -> oo) f(x_n_k) = f(x_0)$
  ]
  Однако из $f(x_n) > n$ следует, что $f(x_0) = oo$. Противоречие.
]

== Достижение точных верхних и нижних граней
#theorem("Вторая теорема Вейерштрасса о непрерывных на отрезке функциях")[
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

  Таким образом, $M$ действительно достижим функцией $f$ в точке $x_0$. Для инфимума аналогично.
]

TEST
