#import "../conf.typ": *

= Простейшая задача вариационного исчисления. Необходимые условия локального экстремума.
#note[
  Вспомнин $C$-нормы:
  #eq[
    $forall k in NN union {0} : space norm(f)_(C^k [a, b]) = sum_(i = 0)^k max_(x in [a, b]) abs(f^((i)) (x))$
  ]
]

#definition[
  Пусть $(X, rho)$ -- метрическое пространство, $M subset X$.

  Отображение $F : M -> RR$ называется *функционалом* с областью определения $M$.
]

Пусть $F(x, y, p)$ -- непрерывно дифференцируемая функция на $[a, b] times RR^2$.
В этом билете будем рассматривать функционал
#eq[
  $J(y) = integral_a^b F(x, y, y') dif x; quad y(a) = A, y(b) = B$
]
Определённый на множестве
#eq[
  $M := {y(x) in C^1 [a, b] | y(a) = a, y(b) = b}$
]

#definition[
  Функция $hat(y)(x) in M$ называется *слабым локальным минимумом* (максимумом)
  функционала $J$, если
  #eq[
    $exists epsilon > 0 : forall y(x) in M : space norm(hat(y) - y)_(C^1 [a, b]) < epsilon : space J(y) >= (<=) space J(hat(y))$
  ]
]

#definition[
  Задача на отыскание слабого локального экстремума функционала $J$ называется
  *простейшей вариационной задачей* или *задачей с закреплёнными концами*.
]

#definition[
  Выражение $dif / (dif alpha) J(y + alpha nu)|_(alpha = 0)$, где $eta in C^1 [a, b]$ называется
  *первой вариацией* функционала $J(y)$ на функции $y(x)$ и обозначается $partial J[y, eta(x)]$
]

#theorem[
  Если $hat(y)(x) in M$ является решением простейшей вариационной задачи, то
  #eq[
    $forall eta(x) in C^1 [a, b] : space partial J[hat(y), eta(x)] = 0$
  ]
]

#proof[
  Пусть, БОО, $hat(y)$ -- слабый локальный минимум $J(y)$. Тогда
  #eq[
    $exists epsilon > 0 : forall y(x) in M : norm(hat(y) - y)_(C^1 [a, b]) : space J(y) >= J(hat(y))$
  ]
  Зафиксировав $eta(x)$, подберём $alpha_0 : norm(alpha_0 eta)_(C^1 [a, b]) < epsilon$.
  Тогда
  #eq[
    $forall alpha : abs(alpha) < alpha_0 : space norm(alpha eta)_(C^1 [a, b]) < epsilon$
  ]
  Рассмотрим числовую функцию $Phi(alpha) := J(hat(y) + alpha eta)$. Так как $hat(y)$ -- слабый
  локальный экстремум $J(y)$, то $0$ -- локальный минимум функции $Phi$.

  Получается, что $Phi'(0) = 0$ по необходимуму условию минимума числовой функции,
  это и означает, что
  #eq[
    $forall eta in C^1 [a, b] : space partial J[hat(y), eta(x)] = 0$
  ]
]

#theorem(
  "Лемма Лагранжа / основная лемма вариационного исчисления",
)[
  Если $f(x) in C[a, b]$ и
  #eq[
    $forall eta(x) in C^1 [a,b] : space integral_a^b f(x) eta(x) dif x = 0$
  ]
  то $f(x) equiv 0$ на $[a, b]$.
]

#proof[
  Пусть это не так, тогда БОО $exists x_0 : f(x_0) > 0$.

  Из-за непрерывности $f$ следует, что
  #eq[
    $exists epsilon > 0 : space forall x in (x_0 - epsilon, x_0 + epsilon) : f(x) > 0$
  ]
  Тогда выберем $eta_0$, как гладкую положительную шапочку на даннном интервале,
  которая гладко спускается к нулю.

  Получим что
  #eq[
    $integral_a^b f(x) eta_0 (x) dif x = integral_(x_0 - epsilon)^(x_0 + epsilon) f(x) eta_0 (x) dif x > 0$
  ]
  Противоречие
]

#theorem[
  Пусть $F(x, y, p)$ -- дважды непрерывно дифференцируемая функция $forall (x, y, p) in [a, b] times RR^2$.

  Если непрерывно дифференцируемая функция $hat(y)$ является решением простейшей
  вариационной задачи для $J$, то эта функция удовлетворяет уравнению Эйлера на $[a, b]$:
  #eq[
    $(partial F) / (partial y) - dif / (dif x) ((partial F) / (partial y')) equiv 0$
  ]
]

#proof[
  Распишем первую вариацию:
  #eq[
    $partial J[y, eta(x)] = [dif / (dif alpha) integral_a^b F(x, y + alpha eta, y' + alpha eta')]|_(alpha = 0) = \
    [integral_a^b ((partial F (x, y + alpha eta, y' + alpha eta')) / (partial y) eta + (partial F (x, y + alpha eta, y' + alpha eta')) / (partial y') eta') dif x ]|_(alpha = 0) = \
    integral_a^b ((partial F(x, y, y')) / (partial y) eta + (partial F(x, y, y')) / (partial y') eta') dif x$
  ]
  Проинтегрируем одно из подыинтегральных слагаемых по частям:
  #eq[
    $integral_a^b (partial F(x, y, y')) / (partial y') eta' dif x = (partial F(x, y, y')) / (partial y') eta|_a^b - integral_a^b dif / (dif x) ((partial F(x, y, y')) / (partial y')) eta dif x$
  ]
  Первое слагаемое равно нулю в силу ограничений на допустимое приращение $eta$.
  Тогда
  #eq[
    $partial J[y, eta(x)] = integral_a^b ((partial F(x, y, y')) / (partial y) - dif / (dif x) ((partial F(x, y, y')) / (partial y')))eta dif x$
  ]
  Так как $y$ -- локальный экстремум, то по предыдущему необходимому условию
  #eq[
    $forall eta in C^1 [a, b] : space partial J [y, eta(x)] = 0$
  ]
  Теперь по лемме Лагранжа получим требуемое.
]