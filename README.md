# salgadar_app
Aplicativo móvel de loja virtual de salgados e fast foods.

## Versões
1. Flutter: 2.0.0
2. Android SDK: 30.0.2
3. Node.js: 14.15.3

## Instruções para execução no emulador
Observações importantes para execução do aplicativo no emulador Android:
1. Instalar o [Node.js](https://nodejs.org/en/download/).
2. Abrir no terminal o diretório do arquivo servidor [salgadar.json](json_server/salgadar.json) e executar o seguinte comando de sistema:
  - json-server --watch salgadar.json

## Features
O aplicativo possui as seguintes features:

1. Elementos de CRUD de usuário.
2. Elementos de CRUD de carrinho e compras.
3. Validações de campos de cadastro de usuário.
4. Cadastro prévio de itens (comidas e bebidas).
5. Cache de itens, compras e usuário no Banco de Dados SQLite.
6. Cache de preferências de usuário: tema, tamanho da fonte e login.
7. Filtro de itens por categoria (comida e bebida) e subcategoria (salgados, pizzas, sucos, ...).
8. Possibilidade de adição/remoção de quantidade de itens no carrinho.
9. Feedbacks de confirmação de finalização de compra e remoção de compra.
10. Verificação de conexão com internet nas operações de:
  - Cadastro e alteração de usuário.
  - Finalização de uma compra.
  - Remoção de uma compra.
11. Verificação de conexão com o JSON server no inicio do aplicativo.
12. Animações com opacidade em cadastro/alteração de usuário, finalização de compra.
13. Notificação Local após a finalização da compra.
14. Configurações de Tema (Claro, escuro, alto contraste e definido pelo sistema) e tamanho da cor.
15. Carregamento de dados com Splash Screen.
16. Teste unitário do carrinho.

**Obs.:** CRUD é um acrônimo para as quatro operações básicas para armazenamento persistente: cadastro (Create), leitura (Read), atualização (Update), e remoção (Delete).

### Padrões de Arquitetura/Projeto
Foram utilizados neste aplicativo os seguintes Padrões de Arquitetura/Projeto:

1. MVC (Model-View-Controller).
2. DAO (Data Access Object).

### Gerência de estado
Foram utilizadas neste aplicativo as seguintes gerências de estado:

1. ChangeNotifier
2. ValueNotifier


## Screenshots
Splash Screen              |  Tela inicial
:-------------------------:|:-------------------------:
<img src="images/Salgadar_SplashScreen.png" width="300">|<img src="images/Salgadar_HomePage.png" width="300">|

Tela de Login              |  Validações
:-------------------------:|:-------------------------:
<img src="images/Salgadar_LoginPage.png" width="300">|<img src="images/Salgadar_Validators.png" width="300">|

Tela do carrinho           |  Tela de minhas compras
:-------------------------:|:-------------------------:
<img src="images/Salgadar_CartPage.png" width="300">|<img src="images/Salgadar_MyPurchases.png" width="300">|

Notificação Local          |  Tela de configurações
:-------------------------:|:-------------------------:
<img src="images/Salgadar_LocalNotification.png" width="300">|<img src="images/Salgadar_Configuration.png" width="300">|

Conexão com internet       |  Feedback de confirmação
:-------------------------:|:-------------------------:
<img src="images/Salgadar_ConnectionChecker.png" width="300">|<img src="images/Salgadar_Feedback.png" width="300">|

Tema escuro                |  Alto Contraste
:-------------------------:|:-------------------------:
<img src="images/Salgadar_DarkTheme.png" width="300">|<img src="images/Salgadar_HighContrast.png" width="300">|

## Modelo relacional
O armazenamento das estruturas de dados utilizadas no aplicativo seguiu o seguinte Modelo Relacional:
<img src="images/salgadar_modeloRelacional.png">

## Imagens
As imagems dos itens foram retiradas do site [Unplash](https://unsplash.com/).

## Equipe desenvolvedora
- Elias Cícero Moreira Guedes (Mentorado).
- Israel Hudson Aragão Barbosa (Mentor).

**Obs.:** Este aplicativo foi implementado durante o período de mentoria no Dell Academy e aprimorado, via fork, pelo próprio mentor após este período.