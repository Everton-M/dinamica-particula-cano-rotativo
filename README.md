# Dinâmica de Partícula em Cano Rotativo

Este projeto é uma implementação em **MATLAB** do **Exemplo 8** do livro:  
*Ilmar F. Santos - Dinâmica de Sistemas Mecânicos*.  

O modelo descreve uma **partícula deslizando sem atrito em um cano rotativo**, preso em um dos eixos. O objetivo é comparar a **solução exata** com a **solução aproximada** (via expansão de Taylor), além de visualizar o erro relativo e a trajetória da partícula em um sistema inercial.

---

## Estrutura do Projeto

- `main.m` → Script principal que realiza a simulação.  
- `startup.m` → Script auxiliar para inicialização rápida da simulação.  
- `README.md` → Documentação do projeto.  

---

## Parâmetros do Modelo

Você pode modificar diretamente no script `main.m` os seguintes parâmetros:

- `w` → Velocidade angular do cano (rad/s).  
- `teta2` → Ângulo de inclinação do cano (rad).  
- `g` → Gravidade (m/s²).  
- `h` → Altura inicial da partícula (m).  
- `t0`, `tf` → Tempo inicial e final da simulação.  
- `npt` → Número de pontos de integração (define a resolução).  

---

## Saídas Geradas

O programa gera três tipos de gráficos:

1. **Comparação entre Solução Exata e Aproximada**: posição X(t) da partícula.  
2. **Erro Relativo (%)**: diferença percentual entre as duas soluções.  
3. **Trajetória 3D**: comparação da órbita exata e aproximada no espaço inercial.  

---
