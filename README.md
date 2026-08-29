# Unidades Neonatais — Flutter

Aplicativo cross-platform (Flutter/Dart), educativo, para famílias sobre cuidado neonatal humanizado: unidades neonatais, Método Canguru, contato pele a pele e participação dos pais. Pensado para distribuição em larga escala em unidades neonatais, em parceria institucional (UFRJ, governo do estado do Rio de Janeiro / SES-RJ, Ministério da Saúde).

## Funcionalidades

- Splash screen
- Home com cartão de destaque e lista de tópicos
- Drawer com navegação direta por tópico
- Página de conteúdo (texto + ilustração + pontos principais) por tópico
- Quiz interativo de 5 perguntas com feedback imediato e tela de resultado
- Header e footer padronizados em todas as telas
- **Footer institucional**: identifica os parceiros públicos (UFRJ, Governo do Estado do RJ / SES-RJ, Ministério da Saúde) e expõe canais oficiais de contato (Disque Saúde RJ, gov.br/saude, ouvidoria do SUS, SAMU), com links clicáveis via `url_launcher`
- Conteúdo com fontes públicas de saúde (Ministério da Saúde e OMS)

## Observação de conteúdo

O aplicativo evita a afirmação de que "parto natural é sempre o mais adequado dentro de uma unidade neonatal". A via de parto deve ser individualizada de acordo com as condições maternas e fetais. O conteúdo destaca o que as fontes consultadas sustentam: cuidado neonatal seguro, humanizado, contato pele a pele quando clinicamente apropriado e participação da família.

## Fontes principais

- Ministério da Saúde — Método Canguru: https://www.gov.br/saude/pt-br/assuntos/saude-de-a-a-z/s/saude-da-crianca/cuidado-neonatal/metodo-canguru
- Ministério da Saúde — Manual Técnico do Método Canguru: https://www.gov.br/saude/pt-br/assuntos/saude-de-a-a-z/s/saude-da-crianca/publicacoes/atencao_humanizada_recem_nascido_canguru.pdf/view
- OMS — Mother Newborn Care Unit: https://www.who.int/southeastasia/news/feature-stories/detail/mother-newborn-care-unit

## Arquitetura

O app segue **Clean Architecture** em três camadas, cada uma isolada por direção de dependência (`presentation` → `domain` ← `data`; `domain` não conhece as outras duas):

```
lib/
├── core/                     # transversal: tema, injeção de dependências
│   ├── di/injector.dart
│   └── theme/
├── domain/                   # regras de negócio puras, sem Flutter/IO
│   ├── entities/              (Topic, QuizQuestion, QuizResult)
│   ├── repositories/          (contratos: TopicsRepository, QuizRepository)
│   └── usecases/              (GetTopics, GetTopicByIndex, GetQuizQuestions)
├── data/                     # implementação dos contratos de domain
│   ├── datasources/           (conteúdo estático local)
│   └── repositories/          (*RepositoryImpl)
├── presentation/             # UI e estado de tela
│   ├── controllers/           (QuizController: ChangeNotifier)
│   ├── screens/
│   └── widgets/
└── main.dart
```

Fluxo de dependência: uma tela pede um caso de uso ao `Injector`, o caso de uso chama o repositório (interface, em `domain`), cuja implementação (em `data`) busca os dados na fonte local. Trocar a fonte de dados (ex.: de conteúdo estático para uma API) exige apenas uma nova implementação de repositório — telas e casos de uso não mudam.

## Como executar

1. Instale o Flutter 3.x.
2. Execute `flutter pub get`.
3. Rode `flutter run` para Android, iOS, Web, Windows, macOS ou Linux conforme seu ambiente Flutter.

Para Android: `flutter build apk --release`.

### Qualidade

```
flutter analyze
flutter test
```

---

## Architecture Decision Records (ADRs)

### ADR 001 — Adotar Clean Architecture em camadas domain/data/presentation

**Contexto**: o app começou como um protótipo com toda a lógica (dados estáticos, UI, navegação, estado do quiz) misturada em `screens/` e `widgets/`. Para um MVP que será distribuído em escala e evoluído por múltiplos times (equipe de conteúdo, UFRJ, futuras integrações com sistemas de saúde), essa mistura dificulta testes, troca de fonte de dados e a entrada de novos colaboradores.

**Decisão**: separar o código em `domain` (entidades e regras de negócio, sem dependência de Flutter além de tipos de UI inevitáveis como `IconData`), `data` (implementações concretas de acesso a dados) e `presentation` (telas, widgets, estado de UI). A comunicação entre camadas acontece por interfaces (`TopicsRepository`, `QuizRepository`) e casos de uso de responsabilidade única (`GetTopics`, `GetQuizQuestions`, etc.).

**Consequências**:
- Positivo: os dados dos tópicos/quiz podem migrar de conteúdo estático para uma API ou CMS trocando apenas a camada `data`, sem tocar em `domain`/`presentation`.
- Positivo: casos de uso e entidades são testáveis sem widget testing.
- Negativo: mais arquivos e indireção para um app deste tamanho — aceito conscientemente, dado o objetivo de distribuição institucional em larga escala e evolução contínua.

### ADR 002 — Injeção de dependência manual, sem pacote de DI

**Contexto**: Clean Architecture pede que a camada de apresentação receba casos de uso já montados (data source → repositório → caso de uso), em vez de instanciar tudo inline.

**Decisão**: usar um singleton simples (`core/di/injector.dart`) que monta manualmente o grafo de dependências, em vez de adotar `get_it`, `provider` ou `riverpod`.

**Consequências**:
- Positivo: zero dependências novas só para DI; grafo de dependências pequeno e visível em um único arquivo.
- Negativo: não escala bem se o número de dependências crescer muito — se o app ganhar biblioteca ou back-end real, revisar essa decisão (`get_it` ou `riverpod` seriam os próximos candidatos).

### ADR 003 — Estado do quiz em `ChangeNotifier` dedicado (`QuizController`), sem pacote de state management

**Contexto**: a lógica do quiz (índice da pergunta atual, resposta selecionada, pontuação) estava antes dentro do `State` do widget `QuizScreen`, misturando estado de negócio com estado de UI.

**Decisão**: extrair essa lógica para `QuizController extends ChangeNotifier`, em `presentation/controllers`, consumido pela tela via `setState` local (sem `provider`/`riverpod`, já que o controller vive só dentro da tela do quiz e não precisa ser compartilhado entre widgets distantes).

**Consequências**:
- Positivo: a regra "responder pergunta, avançar, calcular resultado" é testável isoladamente do widget tree.
- Positivo: não adiciona dependência de gerenciamento de estado — reavaliar se outras telas passarem a precisar de estado compartilhado entre widgets não-relacionados.

### ADR 004 — `Topic.icon` como `IconData` const, não codepoint (`int`)

**Contexto**: a versão original guardava o ícone de cada tópico como `int` (codepoint) e reconstruía `IconData(codepoint, fontFamily: 'MaterialIcons')` em tempo de execução. Isso quebra o tree-shaking de fontes de ícone do Flutter (`flutter build ... --release` falha com "Avoid non-constant invocations of IconData"), pois o compilador não consegue provar estaticamente quais glyphs são usados.

**Decisão**: `Topic.icon` passou a ser `IconData` (ex.: `Icons.favorite_rounded`), atribuído como constante diretamente nas entidades em `data/datasources/topics_local_datasource.dart`.

**Consequências**:
- Positivo: build de release (web, Android, iOS) funciona com tree-shaking normal de ícones, reduzindo o tamanho da fonte de ícones em mais de 99%.
- Negativo: a entidade `domain/entities/topic.dart` passa a importar `IconData` de `flutter/widgets.dart` — um vazamento pontual e aceito de um tipo de UI para dentro de `domain`, mais simples do que criar um enum próprio de ícones só para manter a camada 100% pura.

### ADR 005 — Footer institucional em todas as telas, com `url_launcher`

**Contexto**: para viabilizar a distribuição do app como projeto público (UFRJ + governo do estado do Rio de Janeiro + Ministério da Saúde), o app precisa deixar claro, em toda tela, quem são os responsáveis institucionais e como as famílias podem buscar atendimento oficial — não apenas um aviso de rodapé genérico.

**Decisão**: criar `presentation/widgets/app_footer.dart` como um componente único, reaproveitado em todas as telas, com três blocos institucionais (UFRJ, Governo do Estado do RJ / SES-RJ, Ministério da Saúde) e links de contato clicáveis (telefone e web) via o pacote `url_launcher`.

**Consequências**:
- Positivo: identidade institucional consistente em 100% das telas, sem duplicação de código.
- Positivo: contato de emergência (SAMU 192) sempre visível.
- Pendente: os canais de contato (telefones, URLs) atualmente no footer são placeholders plausíveis, não confirmados pelas instituições — precisam ser validados com os parceiros reais antes de publicação oficial.

### ADR 006 — Sem back-end: conteúdo estático embutido no app

**Contexto**: o MVP não tem, ainda, necessidade de conteúdo dinâmico (tópicos e perguntas do quiz mudam raramente e são revisados por especialistas antes da publicação de uma nova versão do app).

**Decisão**: manter tópicos e perguntas como listas `const` em `data/datasources/*_local_datasource.dart`, sem chamadas de rede.

**Consequências**:
- Positivo: app funciona 100% offline, importante para uso em unidades neonatais com conectividade instável.
- Positivo: reduz superfície de ataque e custos de infraestrutura no MVP.
- Negativo: atualizar conteúdo exige nova versão publicada nas lojas/web — aceitável no MVP; se o conteúdo passar a mudar com frequência, a interface `TopicsRepository`/`QuizRepository` já está pronta para uma implementação remota sem alterar `domain` ou `presentation`.
