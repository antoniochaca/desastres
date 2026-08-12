# Classificação Morfológica de Galáxias com Deep Learning

[![GitHub release](https://img.shields.io/github/v/release/antoniochaca/TCC_-Classificador_Galaxias?style=flat-square&color=blue)](https://github.com/antoniochaca/TCC_-Classificador_Galaxias/releases/tag/v1.0.0)
[![Python Version](https://img.shields.io/badge/python-3.10%2B-blue.svg?style=flat-square&logo=python)](https://www.python.org/)
[![PyTorch](https://img.shields.io/badge/PyTorch-EE4C2C?style=flat-square&logo=pytorch&logoColor=white)](https://pytorch.org/)
[![TensorFlow](https://img.shields.io/badge/TensorFlow-FF6F00?style=flat-square&logo=tensorflow&logoColor=white)](https://www.tensorflow.org/)
[![UFSC](https://img.shields.io/badge/UFSC-Engenharia_de_Computação-003366?style=flat-square)](https://ufsc.br/)

> Trabalho de Conclusão de Curso (TCC) em Engenharia de Computação pela Universidade Federal de Santa Catarina (UFSC).
> **Autor:** Antônio Pedro Chacarosque de Castro  
> **Orientador:** Prof. Dr. Alison R. Panisson  

---

## Sumário
- [Visão Geral](#visão-geral)
- [Contexto e Motivação](#contexto-e-motivação)
- [Classes Morfológicas](#classes-morfológicas)
- [Arquiteturas de Redes Neurais](#arquiteturas-de-redes-neurais)
- [Metodologia e Dataset](#metodologia-e-dataset)
- [Resultados e Desempenho](#resultados-e-desempenho)
- [Downloads e Releases (Modelos Treinados)](#downloads-e-releases-modelos-treinados)
- [Estrutura do Repositório](#estrutura-do-repositório)
- [Como Executar o Projeto](#como-executar-o-projeto)
- [Publicações e Trabalhos Relacionados](#publicações-e-trabalhos-relacionados)
- [Licença](#licença)
---

## Visão Geral

Estima-se a existência de cerca de **2 trilhões de galáxias** no universo observável. Com o avanço dos grandes levantamentos astronômicos (como o *Sloan Digital Sky Survey - SDSS*), a quantidade de imagens geradas ultrapassa a capacidade de análise humana manual.

Este projeto propõe e avalia um sistema automatizado para a **classificação morfológica de galáxias utilizando Redes Neurais Convolucionais (CNNs)**. O trabalho realiza um estudo comparativo abrangente entre uma arquitetura clássica (**AlexNet**) e uma arquitetura profunda residual (**ResNet152**), avaliando acurácia, generalização e desempenho por classe sobre um subconjunto estruturado da base **Galaxy Zoo 2**.

---

## Contexto e Motivação

A classificação morfológica de galáxias (com base na sequência de Hubble e suas extensões) é fundamental para a astrofísica, pois a forma visual de uma galáxia correlaciona-se diretamente com:
- Idade das estrelas e taxa de formação estelar.
- Conteúdo de gás e poeira interestelar.
- Histórico de fusões e interações gravitacionais.

Substituir o processo de rotulagem manual por métodos de **Deep Learning** permite processar dados massivos em tempo real com alta precisão e reprodutibilidade científica.

---

## Classes Morfológicas

O modelo classifica as galáxias em **9 categorias visuais distintas**, alinhadas com as definições do projeto *Galaxy Zoo 2*:

<img src="imagens/galaxias.png" alt="Exemplos de Galáxias por Classe" width="700">

| Rótulo | Classe | Descrição |
| :---: | :--- | :--- |
| **0** | **Elíptica** | Formato esferoidal/elíptico sem estrutura de disco visualizável. |
| **1** | **Lenticular** | Possui disco, mas sem braços espirais proeminentes. |
| **2** | **Espiral** | Apresenta braços espirais definidos em um disco achatado. |
| **3** | **Espiral Anel** | Estrutura espiral com presença de anel de poeira/estrelas. |
| **4** | **Espiral com Barra** | Espiral com barra central de estrelas cruzando o núcleo. |
| **5** | **Edge-on** | Galáxia vista de perfil (borda), exibindo faixa de poeira. |
| **6** | **Fusão (Merger)** | Duas ou mais galáxias em colisão/interação gravitacional. |
| **7** | **Irregular** | Formato caótico, sem simetria ou estrutura definida. |
| **8** | **Perturbada** | Apresenta distorções maretal ou caudas de maré por interação. |

---

## Arquiteturas de Redes Neurais

### 1. AlexNet
- **Histórico:** Vencedora do desafio ImageNet 2012, marco histórico do Deep Learning.
- **Estrutura:** 5 camadas convolucionais seguidas de 3 camadas totalmente conectadas (FC).
- **Características:** Uso de funções *ReLU*, *Dropout* e *Local Response Normalization (LRN)*.
- **Papel no TCC:** Utilizada como *baseline* tradicional e eficiente para conjuntos de dados moderados.

### 2. ResNet152
- **Histórico:** Introduzida por Kaiming He et al. (2015), resolveu o problema de degradação do gradiente em redes muito profundas.
- **Estrutura:** 152 camadas aprendíveis organizadas em blocos residuais com *skip connections* (conexões atalho).
- **Características:** Permite que o gradiente flua diretamente pelas camadas, facilitando o treinamento de representações altamente complexas.
- **Papel no TCC:** Arquitetura principal para extração profunda de características visuais refinadas.

---

## Metodologia e Dataset

### Dataset e Preprocessamento
- **Fonte original:** *Galaxy Zoo 2* (SDSS).
- **Amostragem:** Subconjunto balanceado composto por **1.000 imagens de treino** e **300 imagens de validação/teste** por classe.
- **Total de imagens:** 11.700 imagens astronômicas divididas estritamente entre as 9 classes.
- **Técnicas de Balanceamento e Data Augmentation:**
  - Rotações aleatórias (0°, 90°, 180°, 270°).
  - Espelhamento horizontal e vertical (*Flips*).
  - Recortes (*Crop*) e redimensionamento padrão.

### Treinamento
- **Frameworks:** PyTorch e TensorFlow.
- **Otimizador:** Adam / SGD com *learning rate decay*.
- **Função de Perda:** *Cross-Entropy Loss*.
- **Métricas:** Acurácia geral, Acurácia por classe, Matriz de Confusão, Precision, Recall e F1-Score.

---

## Resultados e Desempenho

A avaliação comparativa comprovou a superioridade substancial da arquitetura **ResNet152** sobre a **AlexNet**:

| Arquitetura | Acurácia em Validação/Teste | Desempenho Geral |
| :--- | :---: | :--- |
| **AlexNet** | **76,48%** | Baseline rápido, porém limitado na extração de sutilezas em braços espirais e aneis. |
| **ResNet152** | **91,96%** | **Acurácia Máxima**. Elevada taxa de acerto e alta capacidade de generalização. |

### Curvas de Aprendizado (Acurácia por Época)

| AlexNet | ResNet152 |
| :---: | :---: |
| ![Acurácia por Época - AlexNet](imagens/acuraciatotal.png) | ![Acurácia por Época - ResNet152](imagens/acuraciaResnet.png) |

### Matrizes de Confusão Normalizadas

| AlexNet | ResNet152 |
| :---: | :---: |
| ![Matriz de Confusão - AlexNet](imagens/matrizConfusão.png) | ![Matriz de Confusão - ResNet152](imagens/matrizConfusãoResnet.png) |

### Destaques por Classe:
- **Alta performance:** Categorias com bordas e formatos bem estruturados, como **Elípticas** e **Edge-on**.
- **Maior desafio:** A classe **Irregular**, devido à sua alta variação morfológica intrínseca e sutileza visual frente a galáxias perturbadas/fusões.

---

## Downloads e Releases (Modelos Treinados)

Devido ao tamanho dos arquivos de pesos dos modelos (`.pth` / `.h5`), os chekpoints treinados estão hospedados diretamente na página de **Releases do GitHub**.

### [Acessar Release v1.0.0](https://github.com/antoniochaca/TCC_-Classificador_Galaxias/releases/tag/v1.0.0)

| Arquivo / Asset | Descrição | Link de Download Direto |
| :--- | :--- | :---: |
| **Pesos do Modelo ResNet152** | Pesos treinados no PyTorch (Acurácia: 91,96%) | [Baixar Modelo](https://github.com/antoniochaca/TCC_-Classificador_Galaxias/releases/tag/v1.0.0) |
| **Pesos do Modelo AlexNet** | Pesos treinados no PyTorch (Acurácia: 76,48%) | [Baixar Modelo](https://github.com/antoniochaca/TCC_-Classificador_Galaxias/releases/tag/v1.0.0) |
| **Código Fonte (ZIP)** | Código completo empacotado da v1.0.0 | [Download .zip](https://github.com/antoniochaca/TCC_-Classificador_Galaxias/archive/refs/tags/v1.0.0.zip) |

---

## Estrutura do Repositório

```text
TCC_-Classificador_Galaxias/
├── data/                      # Scripts para download e organização do dataset
│   ├── processed/             # Subconjunto balanceado do Galaxy Zoo 2
│   └── raw/                   # Imagens originais (se aplicável)
├── models/                    # Definição das redes (AlexNet e ResNet152)
├── notebooks/                 # Jupyter Notebooks de exploração e treinamento
├── src/
│   ├── dataset.py             # Dataloaders e transformações de Data Augmentation
│   ├── train.py               # Script principal de treinamento dos modelos
│   ├── evaluate.py            # Avaliação de métricas e matriz de confusão
│   └── utils.py               # Funções auxiliares e visualização gráfica
├── requirements.txt           # Dependências do projeto
├── LICENSE                    # Licença do repositório
└── README.md                  # Documentação do projeto
```

---

## Como Executar o Projeto

### Pré-requisitos
- Python 3.10+
- GPU recomendada (com suporte a CUDA)

### 1. Clonar o Repositório
```bash
git clone [https://github.com/antoniochaca/TCC_-Classificador_Galaxias.git](https://github.com/antoniochaca/TCC_-Classificador_Galaxias.git)
cd TCC_-Classificador_Galaxias
```

---

### 2. Criar Ambiente Virtual e Instalar Dependências
```bash
# Criar ambiente virtual
python -m venv venv

# Ativar no Linux/macOS:
source venv/bin/activate

# Ativar no Windows (PowerShell):
.\venv\Scripts\Activate.ps1

# Instalar dependências
pip install -r requirements.txt
```
### 3. Executar Treinamento ou Avaliação

#### Para treinar a ResNet152 no dataset balanceado:
```bash
python src/train.py --model resnet152 --epochs 50 --batch_size 32
```

#### Para avaliar um modelo pré-treinado:
```bash
python src/evaluate.py --model_path path/to/resnet152_weights.pth
```

---

## Publicações e Trabalhos Relacionados

Artigo Aprovado no **ENIAC 2026 (Encontro Nacional de Inteligência Artificial e Computacional):**

"Galaxy Morphology Classification with Deep Neural Networks" — Antônio Pedro Chacarosque de Castro & Alison R. Panisson.

**Trabalho de Conclusão de Curso (TCC):** Apresentado no curso de Engenharia de Computação da UFSC, aprovado com nota máxima.

## Licença
Este projeto é distribuído sob a licença MIT. Sinta-se à vontade para estudar, utilizar e contribuir.
