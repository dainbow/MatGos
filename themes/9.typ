#import "../conf.typ": *

= Теорема о неявной функции, заданной одним уравнением
#definition[
  *Кубом* радиуса $delta$ вокруг точки $x_0 in RR^n$ назовём
  #eq[
    $K_(delta, bold(x_0)) = times.big_(k = 1)^n (x_0^k - delta, x_0^k + delta)$
  ]
  где под $times$ подразумевается декартово произведение.
]

#theorem[
  Пусть $F(bold(x), y) = F(x_1, ..., x_n, y)$ дифференцируема в окрестности точки $(bold(x_0), y_0) = (x_0^1, ..., x_0^n, y_0)$.

  Её производная $(partial F) / (partial y)$ непрерывна в этой окрестности, причём $F(x_0, y_0) = 0, (partial F) / (partial y) (x_0, y_0) != 0$.

  Тогда для любого достаточно малого $epsilon > 0$ найдётся $delta > 0$:
  #eq[
    $forall x in K_(delta, x_0) : exists ! y = phi(x) : forall (x, y) in K_(delta, x_0) times (y_0 - epsilon, y_0 + epsilon) : \
    F(x, y) = 0 <=> y = phi(x), "причём" exists phi'(x_0)$
  ]
]

#proof[
  БОО будем считать, что $(partial F) / (partial y)(x_0, y_0) > 0$.

  По непрерывности частной производной, $exists$ окрестность точки $(x_0, y_0)$, в
  которой $(partial F) / (partial y)(x, y) > 0$.

  Тогда из непрерывности $F$ по $y$ и знакоопределённости производной следует
  #eq[
    $exists epsilon_0 : forall epsilon in (0, epsilon_0) : space F(x_0, y_0 + epsilon) > 0 and F(x_0, y_0 - epsilon) < 0$
  ]
  Расширяем территорию дальше, из непрерывности $F$ по $x$ следут
  #eq[
    $exists delta > 0 : forall x in K_(delta, x_0) : F(x, y_0 + epsilon) > 0 and F(x, y_0 - epsilon) < 0$
  ]
  Из теоремы о промежуточных значениях непрерывной функции берём существование, а
  из знакоопределённости производной единственность:
  #eq[
    $exists! phi(x) in (y_0 - epsilon, y_0 + epsilon) : F(x, phi(x)) = 0$
  ]
  Заметим, что $phi$ непрерывна по построению в $(x_0, y_0)$: мы брали $x$ из $2delta$ окрестности
  точки $x_0$, а значение лежало в $2epsilon$ окрестности точки $y_0$.

  Теперь докажем дифференцируемость $phi$, для этого распишем дифференцируемость $F$:
  #eq[
    $F(x, y) - underbrace(F(x_0, y_0), 0) = \ sum_(k = 1)^n (partial F) / (partial x_k) (x_0, y_0)dot (x_k - x_0^k) + (partial F) / (partial y) (x_0, y_0) dot (y - y_0) + alpha(x, y)$
  ]
  где $alpha = o(norm((x, y) - (x_0, y_0))), (x, y) -> (x_0, y_0)$.

  Воспользуемся умножением на "умную единицу":
  #eq[
    $alpha(x, y) = sum_(i = 1)^n (alpha(x, y) dot (x_i - x_0^i)^2) / norm((x, y) - (x_0, y_0))_2^2 + (alpha(x, y) dot (y - y_0)^2) / norm((x, y) - (x_0, y_0))_2^2$
  ]

  Введём новые обозначения:
  #eq[
    $alpha_i (x, y) := (alpha(x, y) dot (x_i - x_0^i)) / norm((x, y) - (x_0, y_0))_2^2 ; quad beta(x, y) := (alpha(x, y) dot (y - y_0)) / norm((x, y) - (x_0, y_0))_2^2$
  ]
  Тогда
  #eq[
    $F(x, y) = sum_(k = 1)^n &((partial F) / (partial x_k)(x_0, y_0) + alpha_k (x, y))(x_k - x_0^k) + \ &((partial F) / (partial y)(x_0, y_0) + beta(x, y))(y - y_0)$
  ]
  Подставляя $y = phi(x)$ в выражение выше, будем использовать новые обозначения:
  #eq[
    $tilde(alpha)_k (x) := alpha_k (x, phi(x)) ; quad tilde(beta) (x) := beta(x, phi(x))$
  ]
  Таким образом,
  #eq[
    $underbrace(F(x, phi(x)), 0) = sum_(k = 1)^n &((partial F) / (partial x_k)(x_0, phi(x_0)) + tilde(alpha)_k (x))(x_k - x_0^k) + \ &((partial F) / (partial y)(x_0, phi(x_0)) + tilde(beta)(x))(phi(x) - phi(x_0))$
  ]
  Выразим приращение $phi$:
  #eq[
    $phi(x) - phi(x_0) = -sum_(k = 1)^n (((partial F) / (partial x_k)(x_0, phi(x_0)) ) / ((partial F) / (partial y)(x_0, phi(x_0))) + gamma_k (x)) (x_k - x_0^k) $
  ]
  где
  #eq[
    $gamma_k (x) := -((partial F) / (partial x_k)(x_0, phi(x_0)) ) / ((partial F) / (partial y)(x_0, phi(x_0))) + ((partial F) / (partial x_k)(x_0, phi(x_0)) + tilde(alpha)_k (x) ) / ((partial F) / (partial y)(x_0, phi(x_0)) + tilde(beta)(x))$
  ]
  Остаётся заметить, что $tilde(alpha)_k (x) ->_(x -> x_0) 0; tilde(beta) (x) ->_(x -> x_0) 0$,
  а это значит, что
  #eq[
    $phi(x) - phi(x_0) = sum_(k = 1)^n A_k (x_k - x_0^k) + gamma(x); quad gamma(x) = o(norm(x - x_0)), x -> x_0$
  ]
  Что и является требуемой дифференцируемостью $phi$ в $x_0$.
]
