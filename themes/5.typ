#import "../conf.typ": *

= Формула Тейлора с остаточным членом в форме Пеано или Лагранжа
== Член в форме Лагранжа
#lemma[
  Если $f$ $n$ раз дифференцируема в точке $x_0$, то $exists !$ многочлен степени $<= n$ такой,
  что
  #eq[
    $f(x_0) = P_n (f, x_0) ; f'(x_0) = P'(f, x_0) ; ... ; f^((n)) (x_0) = P_n^((n))(f, x_0)$
  ]
  Этот многочлен имеет вид
  #eq[
    $P_n(f, x) = f(x_0) + (f'(x_0)) / 1! (x - x_0) + (f''(x_0)) / 2! (x - x_0)^2 + ... + (f^((n))(x_0)) / n! (x - x_0)^n$
  ]
  и называется *многочленом Тейлора* степени $n$ относительно точки $x_0$.
]

#proof[
  Очевидно проверяем каждую производную
]

#lemma(
  "Об отношении",
)[
  Если $phi, psi$ $(n + 1)$ раз дифференцируемы в $U_delta (x_0)$, причём
  #eq[
    $forall k = overline("0, n") : space phi^((k))(x_0) = psi^((k))(x_0) = 0$
  ]
  но
  #eq[
    $forall k = overline("0, n") : forall x in dot(U)_delta (x_0) : space psi^((k))(x) != 0$
  ]
  то
  #eq[
    $forall x in U_delta (x_0) : exists xi in (x_0, x) : space (phi(x)) / (psi(x)) = (phi^((n + 1))(xi)) / (psi^((n + 1))(xi))$
  ]
]

#proof[
  Заметим, что $phi, psi$ удовлетворяют условиям теоремы Коши о среднем. Тогда
  #eq[
    $exists xi_1 in (x_0, x) : space (phi(x) - underbrace(phi(x_0), 0)) / (psi(x) - underbrace(psi(x_0), 0)) = (phi'(xi_1)) / (psi'(xi_1)) = (phi'(xi_1) - underbrace(phi'(x_0), 0)) / (psi'(xi_1) - underbrace(psi'(x_0), 0)) = (phi''(xi_2)) / (psi''(xi_2)) = ... = (phi^((n + 1))(xi_(n + 1))) / (psi^((n + 1))(xi_(n + 1))) $
  ]
]

#theorem(
  "Формула Тейлора с остаточным членом в форме Лагранжа",
)[
  Если $f$ $(n + 1)$ раз дифференцируема в $U_delta (x_0), delta > 0$, то
  #eq[
    $forall x in dot(U)_delta (x_0) : exists xi in (x_0, x) : space f(x) - P_n (f, x) = (f^((n + 1))(xi)) / (n + 1)! (x - x_0)^(n + 1)$
  ]
]

#proof[
  Сведём к предыдущей лемме об отношении:
  #eq[
    $phi(x) := f(x) - P_n (f, x); quad psi(x) := (x - x_0)^(n + 1)$
  ]
  Все требуемые свойства проверяются очевидно.
]

== Член в форме Пеано

#theorem(
  "Формула Тейлора с остаточным членом в форме Пеано",
)[
  Если $f$ $n$ раз дифференцируема в точке $x_0$, то
  #eq[
    $f(x) - P_n (f, x) = o((x - x_0)^n), x -> x_0$
  ]
  где $P_n(f, x)$ -- многочлен Тейлора степени $n$ функции $f$ относительно $x_0$.
]

#proof[
  По определению, если $f$ $n$ раз дифференцируема в точке, то она $n - 1$ раз
  дифференцируема в окрестности.

  Снова используем лемму об отношении, но для случая $n - 1$:
  #eq[
    $phi(x) := f(x) - P_n(f, x) ; quad psi(x) = (x - x_0)^n$
  ]
  Получим, что
  #eq[
    $exists xi in (x_0, x) : space (f(x) - P_n(f, x)) / (x - x_0)^n = (f^((n - 1))(xi) - P_n^((n - 1))(f, xi)) / (n! (xi - x_0))$
  ]
  Заметим, что при $x -> x_0 => xi -> x_0$:
  #eq[
    $lim_(x -> x_0) (f(x) - P_n(f, x)) / (x - x_0)^n = lim_(xi -> x_0) (f^((n - 1))(xi) - P_n^((n - 1))(f, xi)) / (n! (xi - x_0)) = 1 / n! (f(x_0) - P_n (f, x_0))^((n)) = 0$
  ]
]
