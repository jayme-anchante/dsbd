# Um documento em Markdown

## Sobre o Markdown

O Markdown é uma linguagem de marcação muito simples, desenvolvida por
John Gruber.

A ideia básica por trás da linguagem é fazer com que o escritor se
preocupe mais com o **conteúdo** do texto do que com a *formatação*.

## Mais um título

Aqui vamos tentar descrever uma análise.

## Simulando variáveis aleatórias

No R podemos simular valores de uma distribuição normal padrão através
da função `rnorm()`.

Seja $X \sim \text{N}(0,1)$, então para gerar 30 valores dessa variável
aleatório normal, fazemos


```r
(x <- rnorm(30))
#  [1] -2.15982116 -0.16941789  0.46894679 -0.52404176 -0.12749213
#  [6] -1.48269281  1.49224837 -0.28938939 -1.08257443  0.51035898
# [11] -1.39406886 -0.40217373 -1.01450015 -1.03307985  1.57843184
# [16] -1.00773639  1.01731509 -0.34370914  0.95835694  0.52449374
# [21] -0.58968237  0.14815029 -1.01669704  0.05011242 -0.38470147
# [26]  1.24794429  0.57823361 -0.10654095  0.36521390 -1.74725063
```

## Comentários

Com o resultado dessa simulação, podemos calcular a média e a variância
dessa VA $X$ para conferir se o resultado fica próximo de 0 e 1,
respectivamente.

## Visualização

Também podemos fazer um histograma dessa VA $X$ simulada


```r
hist(x)
```

<img src="documentos-dinamicos_files/figure-html/unnamed-chunk-11-1.png" width="672" />

A média de $X$ é -0.198.
