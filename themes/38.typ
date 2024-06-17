#import "../conf.typ": *
= Вычеты. Вычисление интегралов по замкнутому контуру при помощи вычетов
#definition[
  Пусть $f$ голоморфна в $dot(O_r(a)), a in CC$, то определим вычет как 
  #eq[$res_a f = 1 / (2 pi i) integral_(gamma_rho) f(z) d z $]
]

#lemma[Вычеты определены корректно (не завият от $gamma$)]
#proof[
  Пусть $f = sum_(-oo)^(+oo) c_n (z-a)^n, space z in dot(O)_r(a)$, то
  #eq[$
    1/(2 pi i) integral_(gamma_rho) f(z) d z = sum_(-oo)^(+oo) c_n 1/(2 pi i) integral_(gamma_rho) (z-a)^n = c_(-1)
  $]
  Не зависит от $gamma$
]

#theorem[_Коши о вычетах_ (a.k.a _Вычисление интегралов по замкнутому контуру с помощью вычетов_)

Пусть $D$ ограничена циклом $Gamma = gamma_0 - gamma_1 - gamma_2 - dots - gamma_n$. 
Пусть $A = {a_1, a_2, a_3, dots , a_N} subset.eq D$.
$f$ голоморфна в $D' without A$ где $D' supset D$. Тогда
#eq[$ 1 /(2 pi i) integral_Gamma f(z) d z = sum^N res_(a_i) f$]
]

#proof[
  Окужаем каждую особую точку кругом радиуса $R$. Добавляем и вычитаем из $Gamma$ эти круги ($delta_i$).
  В части с минусами получаем новый цикл $tilde(Gamma) = Gamma - sum delta_i$, такой что в нем $f$ голоморфна. 
  
  Проверяем что $tilde(Gamma) space ~ space 0 (mod tilde(D))$
  - В точках вне $D$ он так и остался 0. 
  - В новых точках (внутри $delta_i$) $ 1 - 1 = 0$
  Следовательно интеграл по $tilde(Gamma)$ равен 0, а оставшая часть это $sum integral_(delta_i) f d z= 2 pi i sum res_(a_i) f$. 
] 
