# 🌊 Disaster Analytics & Risk Management System

[![Java Version](https://img.shields.io/badge/Java-17%2B-orange.svg)](https://www.oracle.com/java/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Build Status](https://img.shields.io/badge/Build-Passing-brightgreen.svg)](#)

Sistema de análise, processamento e previsão de riscos de desastres naturais (como enchentes e deslizamentos) desenvolvido em **Java** com foco em integração de dados ambientais, modelagem de risco e algoritmos de suporte à tomada de decisão (**ALS**).

---

## Sobre o Projeto

O **Disaster Analytics System** foi idealizado para processar, estruturar e analisar dados geoespaciais e hidrológicos cruciais para a mitigação de desastres naturais. Através da integração de modelos estatísticos/preditivos (ALS) e ecossistema Java robusto, a plataforma oferece capacidade de processamento de alertas antecipados e mapeamento de áreas vulneráveis.

### Principais Objetivos
* **Monitoramento e Alertas:** Filtragem e agregação de dados em tempo real/quase real de estações e sensores.
* **Mapeamento de Risco:** Processamento de variáveis ambientais (pluviometria, elevação de rios, umidade do solo).
* **Modelagem Preditiva (ALS):** Utilização de técnicas de *Alternating Least Squares* / *Airborne Laser Scanning* para inferência e reconstrução de padrões de área afetada.
* **Escalabilidade:** Arquitetura orientada a serviços para facilitar integração com dashboards web e sistemas legados de Defesa Civil.

---

## Tecnologias Utilizadas

* **Linguagem:** Java 17+
* **Framework / Build:** Maven ou Gradle
* **Processamento e Estrutura:** Java Streams, Concorrência (`CompletableFuture`), Jackson (JSON)
* **Algoritmos / Core:** Módulos customizados de ALS (*Alternating Least Squares* / Processamento Espacial)
* **Persistência (Opcional):** PostgreSQL / PostGIS ou H2 Database
* **Testes:** JUnit 5, Mockito

---

## Estrutura do Repositório

```text
disaster-als-java/
├── src/
│   ├── main/
│   │   ├── java/com/disaster/
│   │   │   ├── config/          # Configurações do sistema
│   │   │   ├── controller/      # Endpoints / Controladores de fluxo
│   │   │   ├── model/           # Entidades (Estação, Alerta, DadoAmbiental)
│   │   │   ├── repository/      # Camada de acesso a dados
│   │   │   ├── service/         # Regras de negócio e integração
│   │   │   └── als/             # Algoritmos e módulos do ALS
│   │   └── resources/           # Arquivos de configuração e dados estáticos
│   └── test/                    # Testes unitários e de integração
├── docs/                        # Documentação técnica e diagramas
├── .gitignore
├── LICENSE
├── pom.xml                      # Gerenciador de dependências (Maven)
└── README.md
```

---

## Como Executar o Projeto

### Pré-requisitos
- Java JDK 17 ou superior
- Apache Maven 3.8+ (ou utilitário Wrapper ./mvnw)
- Git

### 1. Clonar o Repositório
```bash
git clone [https://github.com/seu-usuario/disaster-als-java.git](https://github.com/seu-usuario/disaster-als-java.git)
cd disaster-als-java
```

---

### 2. Criar Ambiente Virtual e Instalar Dependências
```bash
mvn clean install
```
### 3. Executar a aplicação
```bash
mvn exec:java -Dexec.mainClass="com.disaster.Main"
```

#### Para avaliar um modelo pré-treinado:
```bash
python src/evaluate.py --model_path path/to/resnet152_weights.pth
```
---

## Exemplo de Uso

### Exemplo simplificado de execução do pipeline de análise de risco via código:
```bash
import com.disaster.als.ALSRiskEngine;
import com.disaster.model.SensorData;
import com.disaster.model.RiskReport;

public class Main {
    public static void main(String[] args) {
        // Inicializa o motor de análise ALS
        ALSRiskEngine engine = new ALSRiskEngine();

        // Dados simulados de sensor
        SensorData data = new SensorData("ESTACAO-01", 120.5 /* mm chuva */, 4.2 /* m rio */);

        // Processa o risco estimado
        RiskReport report = engine.evaluate(data);

        System.out.println("Nível de Risco: " + report.getRiskLevel());
        System.out.println("Recomendação: " + report.getRecommendation());
    }
}
```
### Executar o exemplo
```bash
mvn test
```

---

## Licença
Este projeto é distribuído sob a licença MIT. Sinta-se à vontade para estudar, utilizar e contribuir.




