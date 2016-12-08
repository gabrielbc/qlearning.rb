# Q-learning.rb

Implementação de algoritmo para aprendizado por reforço [Q-learning](https://en.wikipedia.org/wiki/Q-learning) para o Pacmaze.

## Modelagem

A entrada é um mundo bidimensional, sendo os caracteres '#' '-' 'P' e '&' as paredes, caminho, a posição do Pac e um fantasma respectivamente. O mundo representa o estado corrente, e as ações do Pac são: acima, abaixo, esquerda e direita. Após uma ação, o mundo alterado é o novo estado.

As recompensas são:
* - Caminho vazio => -1
* 0 Pastilha      => 10
* & Fantasma      => -10

O fator de desconto é inserido por argumento, e a função de transição é determinística.

Os estados '0' e '&' são terminais, e o Pac é reinserido aleatoriamente no mapa após.

## Utilização

As instruções seguintes se referem a utilização do programa.

### Pré-Requisito

Ruby 1.8.7. Comando no Ubuntu:
```
sudo apt-get install ruby-full
```

### Execução

```
ruby qlearning.rb {input} {taxa_de_aprendizado} {fator_de_desconto} {número_de_iterações} {e-greedy}  
```

Os parâmetros para execução são os seguintes:

* input: (ex: pacmaze-01-tiny.txt)
* taxa de aprendizado (ex: 0.2, 0.5, 0.8 e 1)
* fator de desconto (ex: 0.9)
* número de iterações (ex: 300, 1000, 5000)
* e-greedy (ex: 0.35, 0.7, 1)

Ex:

```
ruby qlearning.rb pacmaze-01-tiny.txt 0.5 0.9 300 0.35  
```
### Output

São gerados dois arquivos: q.txt que mostra todos os pares de estado->ação do mundo, para os estados não terminais, no seguinte formato.

linha,coluna,ação,valor

```
q.txt
1,1,direita,5.32
1,1,esquerda,-4
1,1,acima,1
1,1,abaixo,0.333
1,2,direita,6
...
```

O arquivo pi.txt é o próprio mundo com os caminhos vazios substituídos pela política predominante naquele estado. (<, ^, >, V para as ações esquerda, cima, direita e abaixo)

```
pi.txt
######
#>>>0#
#^#v&#
#^<^<#
######
```
