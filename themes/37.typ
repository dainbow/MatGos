#import "../conf.typ": *
= Разложение функции регулярной в кольце в ряд Лорана. Изолированные особые точки однозначного характера.

== Разложение функции регулярной в кольце в ряд Лорана.
#theorem[

  Пусть $f$ голоморфна в кольце $ K = {z in CC | r < |z - a| < R }$. Тогда
  #eq[$forall z in K: space f(z) = sum_(-infinity)(+infinity)c_n (z-a)^n$]
  где
  #eq[$c_n = 1 / (2 pi i) integral_(gamma_rho) (f(xi) d xi) / (xi - a)^(n+1)$]
]
где $gamma_rho $ положительно определеная окружность радиуса $rho in (r, R)$ с
центром в $а$.

#proof[
  Для начала покажем независимость коэфициентов от выбора $rho$. Возьмем две
  окружности радиусов $rho$ и $rho'$. Применим для $Gamma = rho - rho'$ интегральную
  теорему Коши и получим требуемое.

  Рассмотрим $r < r' < R' < R$. Тогда $forall z in K'_(r', R')$

  #eq[$
      f(z) = 1 / (2 pi i) integral_Gamma (f(xi) d xi) / (xi - z) = (2 pi i) (integral_(gamma_(R')) (f(xi) d xi) / (xi - z) - integral_(gamma_(r')) (f(xi) d xi) / (xi - z)) =: f_1 + f_2
    $]

  Заметим, что $f_1 = integral_(gamma_(R')) (f(xi) d xi) / (xi - z)$ голоморфна в $O_(R')(a)$.
  А значит раскладывается в ряд Тейлора. $f_1 = sum_0^(+infinity) c_n (z-a)^n$

  Вновь раскладываем $1 / (z - xi) = sum^infinity (xi - a)^n / (z-a)^(n+1)$ при $|(xi-a)/(z-a)| < 1$

  Значит
  #eq[$
      f_2(z) = sum_0^(infinity) (z-a)^(-n-1) dot.op (c_(-n-1) := 1/ (2 pi i) integral_(gamma_(r')) f(xi) (xi - a)^n d xi)
    $]

  Итого получили требуемое, не зависящее от $r', R'$
]
#definition[
  Такое представление голоморфной функции называется _рядом Лорана_
]

#lemma[_Единсвенность ряда Лорана_

  Если $f(z) = sum_(-infinity)(+infinity) c_n (z-a)^n$ в кольце $К$, то $f$ голоморфна
  в этом кольце, причем ряд лорана совпадает с данным. То есть $c_n = 1 / (2 pi i) dot.op integral_(gamma_rho) (f(xi) d xi) / (xi - a)^(n+1)$

]

#proof[
  $f$ голоморфна как предел сходящегося ряда.

  Проверка равенства коэфициентов. Для $n=-1$

  #eq[$integral_(gamma_rho) f(z) d z = sum_(-infinity)^(+infinity) integral_(gamma_rho) c_n (z-a)^n d z = c_(-1)$]

  Для $n!=-1$ двигаем ряд так чтобы нужный коэфициент встал на $-1$.
]

== Изолированные особые точки однозначного характера.

Здесь пусть $f(z)$ функция имеющая изолированную особую точку $a$, тогда:

#definition[
  a - устранимая особенная точка, если $exists A in CC: space lim_(z -> a) f(z) = A$
]

#definition[
  a - устранимая особенная точка, если $lim_(z -> a) f(z) = infinity$
]

#definition[
  a - существенная особенная точка, если $ exists.not lim_(z -> a) f(z) $
]

#theorem[
  a - УОТ $<=> f$ ограничена в какой-то $ dot(O)_delta(a)$
]
#proof[
  ($=>$) очевидно из определения предела.

  ($arrow.l.double$) Положим $M_(rho)(f) = max_(gamma_rho)|f|$ Тогда оценим
  #eq[$
      |c_n| <= 1 / (2 pi) integral_(gamma_rho) (|f| |d xi| / rho^(n+1)) <= M_rho(f) / rho^n
    $]

  Из ограниченности, можно оценить $M_rho$ как константу. А значит при $n<0, rho->0: space |c_n| -> 0$.
  Следовательно |c_n|. А значит есть только регулярная часть ряда Лорана, а
  следовательно $a$ - УОТ.
]

#theorem[
  $а$ - полюс $<=>$ существует лишь конечное число ненулевых членов в главной
  части ряда Лорана.
]
#proof[

  ($arrow.l.double$) аккурано посчитаем предел и получим требуемое. ($=>$) По
  условию $lim_(z->a) f(z) = infinity => lim_(z->a) 1 / f(z) = 0$. Т.е функция $1/f(z)$ имеет
  в $a$ УОТ.

  В силу изолированности $a$, $1/f(z)$ голоморфна в окрестности $a$, причем
  отлична от 0. А значит из предыдущего доказтельства получим разложение в
  Тейлора.

  #eq[$1/f(z) = (z-a)^m h(z), h(a) != 0 => f(z) = 1/(z-a)^m dot.op 1/h(z)$]

  $1/h(z) $ голоморфная в окрестности $=>$ раскладывается в Тейлора

]

#theorem[_Сохоцкого_

  Если а - СОТ, то $forall A in overline(CC) exists {z_n} -> a, f(z_n) -> A$
]

#proof[(Необязательно) Для $A = infinity$ очевидно. Если не существует, то ограничена $=>$ УОТ.

  Если $A != infinity$, то рассмотрим $g(z) := 1 / (f(z) - A)$.

  Если А не предельная, то $f(z) - A$ отделена от нуля, а значит g(z) ограничена.
  Следовательно $a$ - УОТ для g. Причем $g(z) != 0$ в области определения.

  Тогда заметим, что $f(z) = A + 1 / g(z)$.

  Если $g(a) != 0$, то $a$ - УОТ для $f$.

  Иначе полюс. Противоречие.]