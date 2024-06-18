#import "../conf.typ": *

= Линейное пространство, базис и размерность. Линейное отображение конечномерных пространств, его матрица.
== Линейное пространство, базис и размерность
#definition[
  Пусть $V$ -- линейное пространство над $FF; bold(v_1), ..., bold(v_k) in V$.

  *Линейной оболочкой* векторов $bold(v_1), ..., bold(v_k)$ называется множество
  линейных комбинаций этих векторов:
  #eq[
    $angle.l bold(v_1), ..., bold(v_k) angle.r := {sum_(i = 1)^k alpha_i bold(b_i) | alpha_1, ..., alpha_k in FF }$
  ]
]

#definition[
  Линейное пространство $V$ называется *конечнопорождённым*, если существуют
  векторы $bold(v_1), ..., bold(v_n) in V$ такие, что
  #eq[
    $angle.l bold(v_1), ..., bold(v_n) angle.r = V$
  ]
]

#definition[
  Пусть $V$ -- конечнопорождённое линейное пространство.

  Его *размерностью* называется количество векторов в любом его базисе.

  Обозначение -- $dim V$.
]

== Линейное отображение конечномерных пространств, его матрица

#definition[
  Пусть $U, V$ -- линейные пространства над полем $FF$.

  *Линейным отображением*, или *линейным оператором* называется отображение $phi: U -> V$,
  обладающее свойством линейности:
  - $forall bold(u_1), bold(u_2) in U : space phi(bold(u_1) + bold(u_2)) = phi(bold(u_1)) + phi(bold(u_2))$
  - $forall alpha in FF : forall bold(u) in U : space phi(alpha bold(u)) = alpha phi(bold(u))$
]

#definition[
  Пусть $phi: U -> V$ -- линейное отображение
  - *Образом* отображения $phi$ называется $"Im" phi := phi(U)$
  - *Ядром* отображения $phi$ называется $"Ker" phi := {bold(u) in U | phi(bold(u)) = bold(0) }$
]

#proposition[
  Пусть $phi: U -> V$ -- линейное отображение, $e = (bold(e_1), ..., bold(e_k))$ -- базис
  в пространстве $U$. Тогда
  #eq[
    $"Im" phi = angle.l phi(bold(e_1)), ..., phi(bold(e_k)) angle.r$
  ]
]

#proof[
  $subset$ Любой вектор $bold(u) in U$ представляется в виде линейной комбинации
  базисных векторов, поэтому по линейности $phi(bold(u)) in angle.l phi(bold(e_1)), ..., phi(bold(e_k)) angle.r$

  $supset$ Все векторы $phi(bold(e_1)), ..., phi(bold(e_k))$ лежат в $"Im" phi$ и $"Im" phi$ -- линейное
  пространство, поэтому $angle.l phi(e) angle.r subset "Im" phi$
]

#definition[
  Пусть $phi: U -> V$ -- линейное отображение.

  Тогда оно называется *инъективным*, если
  #eq[
    $forall bold(v) in "Im" phi : exists! bold(u) in U : space phi(bold(u)) = bold(v)$
  ]
]

#proposition[
  Пусть $phi: U -> V$ -- линейное отображение. Тогда
  #eq[
    $phi "инъективно" <=> "Ker" phi = {bold(0)}$
  ]
]

#proof[
  $=>$ Если $phi$ инъективно, то существует единственный вектор $bold(0) in U$,
  для которого $phi(bold(u)) = bold(0)$.

  $arrow.l.double$ От противного. Пусть для некоторых $bold(u_1), bold(u_2) in U$ выполнено $phi(bold(u_1)) = phi(bold(u_2))$,
  тогда $phi(bold(u_1) - bold(u_2)) = bold(0)$, откуда $bold(u_1) - bold(u_2) = bold(0) => bold(u_1) = bold(u_2)$
]
