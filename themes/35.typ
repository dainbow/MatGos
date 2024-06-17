
#import "../conf.typ": *
= Дифференцируемость функции комплексного переменного. Условия Коши-Римана. Интегральная теорема Коши.

== Дифференцируемость функции комплексного переменного. Условия Коши-Римана

#note[
  В ТФКП используются следующие станартные оборзначения
  $z$ - комплексная переменная

  $z = x + i y : x,y in RR$

  $f(z)$ - исследуемая функция

  $f(x+i y) = u(x,y) +i v(x, y) \: u,v in RR^2->RR$

]

#definition[
  Функция $f: B_r(z_0) -> CC$ называется _дифференцируемой_ в $z_0$ если
  #eq[
    $exists A in CC : f(z) = f(z_0) + A(z-z_0) + o(z-z_0)\, |z-z_0| -> 0$ 
  ]
]

#theorem[
  $f: B_r(z_0) -> CC$ дифференцируема тогда и только тогда когда
  + $u(x,y), v(x,y)$ дифференцируемы в $(x_0, y_0)$
  + Выполняются _условия Коши-Римана_:

    $cases(
      (partial u) / (partial x)  =  (partial v) / (partial y) ,

      (partial u) / (partial y)  = -(partial v) / (partial x) 
    )$ 

    При этом $f'(z_0) = (partial u)/(partial x) (x_0, y_0) + i(partial v) /(partial x) (x_0, y_0)$
]

#proof[

  ($==>$)

  Пусть $f$ дифференцируема. Тогда $Delta f = A Delta z + alpha(Delta z) = A Delta z + alpha_0(Delta x, Delta y) + i alpha_1(Delta x, Delta y)$
  
  Обозначим $A = a + i b$ и распишем $Delta f$ по координатно.

  #eq[$
    cases(
      Delta u = a Delta x - b Delta y + alpha_0(Delta x, Delta y)
      Delta v = b Delta x + a Delta y + alpha_1(Delta x, Delta y)
    )
  $]
  
  Из того, что $alpha(Delta z) = o(Delta z)$ следует $alpha_1, alpha_2$ тожe $o(Delta x, Delta y)$

  Отсюда по определию $u$, $v$ дифференцируемы. Причем $(partial u) / (partial x)  =  (partial v) / (partial y) = a, -(partial u) / (partial y)  = (partial v) / (partial x) = b$

  ($<==$)

  Пусть $u, v$ дифференцируемы и выполняются УКР, тогда 

  #eq[$
    Delta f = Delta u + i Delta v 
    &= (partial u) / (partial x) Delta x + (partial u) / (partial y) Delta y + alpha_0(Delta x, Delta y) + i ((partial v) / (partial x) Delta x + (partial v) / (partial y) Delta y + alpha_1(Delta x, Delta y)) \
    
    &= (partial u) / (partial x) Delta x - (partial v) / (partial x) Delta y + i ((partial u) / (partial x) + (partial v) / (partial x)) alpha_0(Delta x, Delta y) + i alpha_1(Delta x, Delta y) \
    
    &= ((partial u) / (partial x) + i (partial v) / (partial x)) (Delta x + i Delta y) + alpha_0(Delta x, Delta y) + i alpha_1(Delta x, Delta y)
  $]

  Что и означает дифференцируемость. 

]

== Интегральная теорема Коши

#definition[
  Пусть $gamma$ - кусочно гладкая кривая в $D$ - области. Тогда _приращением аргумента функции вдоль кривой_ $Delta_gamma f$ называется
  $\Im integral_gamma (f'(z) d z) / f(z)$
]

#definition[
  Пусть $gamma$ - кусочно гладкая замкнутая кривая в $CC$, $a in C without gamma$. Тогда индксом $a$ относительно $gamma$ называется 
  #eq[$J_gamma (a) = (Delta_gamma (z-a)) / (2 pi )$] 
]

#definition[
  Пусть $gamma$ - кусочно гладкая кривая лежит в области $D$. Тогда говорят что $gamma space ~ space 0 (mod D)$ _гомологично эквивалентна нулю_, если 
  $forall a in CC without D space J_gamma(a) = 0$
]

#definition[
  Циклом $Gamma$ называется формальная линейная комбинация с целыми коэфициентами кусочно-гладких замкнутых кривых.
  Все определения и теоремы для кривых тривиально переносятся на циклы. 
]


#definition[
 Пусть $gamma$ кусочно гладкая кривая, $phi$ непрерывна на $gamma$. Тогда инегралом Коши называется 
 #eq[$F_n(z, phi) = integral_gamma phi(xi) / (xi - z)^n d xi $]
]

#proposition[Свойства интеграла Коши
  1. $F_n$ голоморфна в $CC without gamma$
  2. $F_n'(z, phi) = n F_(n+1)(z, phi)$
]

#lemma[ _Обшая теорема Коши_

  Пусть $D$ - область в $CC$, $f$ - голоморфна в $D$ Тогда
  1. #eq[$ g(xi, z) = cases(
    (f(xi)-f(z)) / (xi - z) \, xi != z,
    (f'(z)) \, z = xi
  )$]
  непрерывна в $D times D$
  2. Для любой кусочно гладкой $gamma in D$ 
  #eq[$
    h(z) = integral_gamma g(xi, z) d xi
  $]
  голоморфна в D
]


#theorem[_Лиувиля_
  Пусть $f$ голоморфная в $CC$ и $exists M,m,R space forall z |z| > R: space |f(z)| < M z^m$, тогда $f$ полином степени $m$.
  В частности, если $f$ ограничена, то она константа. 
]



#theorem[ _Интегральная теорема Коши_
  Пусть $D$ - область в $CC$, $f$ - голоморфна в $D$. Пусть $Gamma$ - цикл в $D$, причем $Gamma space ~ space 0 (mod D)$, тогда 
  1. $forall z D without Gamma: J_Gamma (z)  f(z) 1 / (2 pi i ) = integral_Gamma (f(xi) d xi) / (xi - z)$
  2. $ integral_Gamma f(z) d z = 0$
]

#proof[
  Пусть $G = {z in CC without Gamma | J_Gamma (z) = 0}$ оно открытое. 
  Рассмотрим две функции 
  + $ 2 pi i space tilde(h)(z) = integral_Gamma (f(xi) d xi) / (xi - z)$

      Она голоморфна в $G$ как интеграл Коши.

  + $ 2 pi i space h(z) = integral_Gamma ((f(xi)-f(z)) / (xi - z)) d xi$

    Она голоморфна в $D$ по 2 пункту общей теоремы Коши

  Заметим, что $forall z in G sect D : space h(z) = tilde(h)(z) $ так как 
  #eq[$
    h(z) - tilde(h)(z) = 1 / (2 pi i) integral_Gamma (f(z)) / (xi - z) d xi = J_Gamma(z) f(z) = 0
  $]

  Из того, что $Gamma space ~ space 0 (mod D) $ следует $CC without D subset G$
  Тогда рассмотрим новую функцию: 
  #eq[$
    F(z) = cases(
      h(z)\, z in D,
      tilde(h)(z), z in CC without D subset G
    )
  $]
  Она голоморфна в каждой из компонент. А так как на границе $h$ и $tilde(h)$ равны, то голоморфна и в $CC$. 

  Заметим, что 
  #eq[$
    |tilde(h)(z)| <= 1 / (2 pi) integral_Gamma (max_Gamma |f| |d xi|) / ( \d\i\s\t (z, Gamma)) ->_(\d\i\s\t (z, Gamma) -> infinity) 0
  $]
  А следовательно по теореме Лиувиля $F(z) equiv 0$.

  Следовательно в $D without Gamma space h(z) = 0$. 
  То есть #eq[$
  f(z) / (2 pi i) integral_Gamma (d xi) / (xi - z) = integral_Gamma (f(xi) d xi) / (xi - z) \
  f(z) J_Gamma(z) = integral_Gamma (f(xi) d xi) / (xi - z)
  $]

  (1 => 2)

  Применим 1 к $tilde(f)(z) = (z-a)(f(z))$, где $a in CC without Gamma$ (естественно в области определения f) Тогда
  #eq[$
  0 = J_Gamma(a) (a - a) f(a) = J_Gamma(a) tilde(f)(a) = integral_Gamma (tilde(f)(xi) d xi) / (xi - a) = integral_Gamma f(xi) d xi 
  $]
]