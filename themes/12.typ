#import "../conf.typ": *

= Равномерная сходимость функциональных последовательностей и рядов. Непрерывность, интегрируемость и дифференцируемость суммы функционального ряда.
== Непрерывность суммы функционального ряда
#definition[
  *Функциональная последовательность* $seq(f)$ *сходится равномерно* на $E$ к
  функции $f(x)$ ($f_n arrows f$), если
  #eq[
    $forall epsilon > 0 : exists N in NN : forall n > N : forall x in E : space abs(f_n (x) - f(x)) < epsilon$
  ]
]

#definition[
  Функциональная последовательность $seq(f)$ *сходится поточечно* на $E$ к функции $f(x)$,
  если
  #eq[
    $forall x in E : forall epsilon > 0 : exists N in NN : forall n > N : space abs(f_n (x) - f(x)) < epsilon$
  ]
]

#theorem(
  "Критерий Коши равномерной сходимости функциональной последовательности",
)[
  #eq[
    $f_n arrows_E f <=> forall epsilon > 0 : exists N in NN : forall n > N : forall p in NN : forall x in E : space abs(f_(n + p) (x) - f_n (x)) < epsilon$
  ]
]

#definition[
  *Фукнциональный ряд* $sum_(n = 1)^oo f_n (x)$ *равномерно сходится* на $E$, если
  равномерно сходится на $E$ функциональная последовательность $S_n (x) = sum_(k = 1)^n f_k (x)$
]

#theorem(
  "Критерий Коши равномерной сходимости функциональных рядов",
)[
  #eq[
    $sum_(n = 1)^oo f_n "равномерно сходится на " E <=> \
    forall epsilon > 0 : exists N in NN : forall n > N : forall p in NN : forall x in E : space abs(sum_(k = n)^(n + p) f_k (x)) < epsilon$
  ]
]

#theorem("Предельный переход в равномерно сходящихся последовательностях")[
  Если $seq(f)$ равномерно сходится к $f$ на множестве $E$ метрического
  пространства, $x_0$ -- предельная точка $E$, причём
  #eq[
    $forall n in NN : lim_(x -> x_0, x in E) f_n (x) = a_n$
  ]
  Тогда
  #eq[
    $lim_(x -> x_0, x in E) f(x) = lim_(n -> oo) a_n$
  ]
  То есть оба предела существуют и равны.
]

#proof[
  Воспользуемся критерием Коши равномерной сходимости:
  #eq[
    $forall epsilon > 0 : exists N in NN : forall n > N : forall p in NN : forall x in E : space abs(f_(n + p) (x) - f_n (x)) < epsilon$
  ]
  Совершим предельный переход $x -> x_0$:
  #eq[
    $forall epsilon > 0 : exists N in NN : forall n > N : forall p in NN : space abs(a_(n + p) - a_n) <= epsilon$
  ]
  То есть числовая последовательность $seq(a)$ имеет какой-то предел $a$, теперь
  нужно установить, что он равен пределу предельной функции:
  #eq[
    $abs(f(x) - a) = abs(f(x) - f_n (x)) + abs(f_n (x) - a_n) + abs(a_n - a)$
  ]
  Стоит упомянуть про кванторы:
  - Берём номер $N$ больший $N_1$ для равномерного предела функций и $N_2$ для
    числового предела $a_n ->_(n -> oo) a$
  - $delta$-окрестность $x_0$ меньшую требуемой для фиксированного $f_N (x) ->_(x -> x_0) a_N$
]

#corollary[
  Если $f_n (x)$ непрерывна на $E$, $f_n arrows f$ на $E$, то $f$ непрерывна на $E$.
]

#theorem(
  "Предельный переход в функциональных рядах",
)[
  Если $sum_(n = 1)^oo f_n (x)$ сходится равномерно на $E$, $x_0$ -- предельная
  точка $E$, $forall n in NN : space lim_(x -> x_0, x in E) f_n (x) = a_n$, то
  #eq[
    $sum_(n = 1)^oo a_n = lim_(x -> x_0, x in E) sum_(n = 1)^oo f_n (x)$
  ]
]

#proof[
  Доказывается очевидно применением предыдущей теоремы для последовательности
  частичных сумм.
]

== Интегрируемость суммы функционального ряда
#theorem(
  "Интегрирование равномерно сходящейся функциональной последовательности",
)[
  Если $forall n in NN : space f_n$ интегрируемы по Риману на $[a, b]$ и $f_n arrows f$ на $[a, b]$,
  то $f$ интегрируема по Риману на $[a, b]$ и
  #eq[
    $integral_a^b f(x) dif x = lim_(n -> oo) integral_a^b f_n (x) dif x$
  ]
]

#proof[
  Воспользуемся тем, что каждый элемент функциональной последовательности
  интегрируем:
  #eq[
    $forall n in NN : forall epsilon > 0 : exists P : space U(P, f_n) - L(P, f_n) < epsilon / (3 (b - a))$
  ]
  Далее определение равномерной сходимости:
  #eq[
    $forall epsilon > 0 : exists N in NN : forall x in [a, b] : space abs(f_n (x) - f(x)) < epsilon / (3 (b - a))$
  ]
  Итак, оценим верхнюю сумму Дарбу предела:
  #eq[
    $U(P, f) = sum_(k = 1)^n sup_(x in [x_(k - 1), x_k]) f(x) Delta x_k <= \ sum_(k = 1)^n (sup_(x in [x_(k - 1), x_k]) f_n (x) + epsilon / (3 (b - a)))Delta x_k = U(P, f_n) + epsilon / 3$
  ]
  Аналогично для нижней:
  #eq[
    $L(P, f) >= L(P, f_n) - epsilon / 3$
  ]
  Таким образом,
  #eq[
    $U(P, f) - L(P, f) <= U(P, f_n) - L(P, f_n) + (2 epsilon) / 3 < epsilon$
  ]
  Мы доказали интегрируемость $f$, осталось доказать, что интеграл равен тому, что
  надо:
  #eq[
    $abs(integral_a^b f_n (x) dif x - integral_a^b f(x) dif x) <= integral_a^b abs(f_n (x) - f(x)) dif x <= epsilon / (3 (b - a)) dot (b - a) < epsilon$
  ]
]

#theorem(
  "Интегрирование функциональных рядов",
)[
  Если $f_n in cal(R)[a, b], sum_(n = 1)^oo f_n (x)$ равномерно сходится на $[a, b]$,
  то $sum_(n = 1)^oo f_n (x) in cal(R)[a, b]$ и
  #eq[
    $integral_a^b sum_(n = 1)^oo f_n (x) dif x = sum_(n = 1)^oo integral_a^b f_n (x) dif x $
  ]
]

#proof[
  Доказывается очевидно применением предыдущей теоремы для последовательности
  частичных сумм.
]

== Дифференцируемость суммы функционального ряда
#theorem("Дифференцирование функциональных последовательностей")[
  Если
  + $f_n$ дифференцируемы на $(a, b)$
  + $f'_n arrows$ на $(a, b)$
  + $exists x_0 in (a, b) : space f_n (x_0) ->_(n -> oo)$
  То
  + $f_n arrows f$ на $(a, b)$
  + $f$ дифференцируема на $(a, b)$
  + $f'_n -> f'$ на $(a, b)$
]

#proof[
  Используем равномерную сходимость производных:
  #eq[
    $forall epsilon > 0 : exists N in NN : forall n > N : forall p in NN : forall x in (a, b) : space abs(f'_(n + p) (x) - f'_n (x)) < epsilon / (2 (b - a)) $
  ]
  А также сходимость самих функций в точке $x_0$:
  #eq[
    $forall epsilon > 0 : exists N in NN : forall n > N : forall p in NN : space abs(f_(n + p) (x_0) - f_n (x_0)) < epsilon / 2$
  ]
  Применим теорему Лагранжа для непрерывных $f_n$ между произвольной точкой $x$ и
  фиксированной $x_0$:
  #eq[
    $exists xi in {x, x_0} : space abs((f_(n + p) (x) - f_n (x)) - (f_(n + p) (x_0) - f_n (x_0))) = \ abs(f'_(n + p) (xi) - f'_n (xi))abs(x - x_0) $
  ]
  Тогда мы можем доказать фундаментальность самой последовательнсоти:
  #eq[
    $abs(f_(n + p) (x) - f_n (x)) <= abs(f_(n + p) (x_0) - f_n (x_0)) + abs(f'_(n + p) (xi) - f'_n (xi))abs(x - x_0) < \
    epsilon / 2 + epsilon / (2 (b - a)) abs(x - x_0) < epsilon$
  ]
  Значит по критерию Коши $f_n arrows f$ на $(a, b)$.

  Остаётся доказать дифференцируемость $f$ в произвольной точке $x in (a, b)$, для
  этого введём вспомогательные функции:
  #eq[
    $phi_n (t) := (f_n (t) - f_n (x)) / (t - x) ; quad phi(t) := (f(t) - f(x)) / (t - x)$
  ]
  Докажем фундаментальность $seq(phi)$:
  #eq[
    $\
    abs(phi_(n + p) (t) - phi_n (t)) = abs((f_(n + p) (t) - f_n (t)) - (f_(n + p) (x) - f_n (x))) / (t - x) attach(=, t: "теорема Лагранжа") \
    abs(f'_(n + p) (xi) - f'_n (xi)) < epsilon / (2 (b - a )) $
  ]
  Получили, что $phi_n arrows phi$ на $A := (a, b) without {x}$.

  Заметим, что $x$ -- предельная точка $A$, тогда применим теорему о непрерывном
  поточечном пределе:
  #eq[
    $lim_(n -> oo) f'_n (x) = lim_(n -> oo) lim_(t -> x, t in A) phi_n (t) = lim_(t -> x, t in A) phi(t) = f'(x)$
  ]
  Заметим, что этими равенствами мы доказываем как существование, так и равенство
  пределов.
]
