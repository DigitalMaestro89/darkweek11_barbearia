<p align="center">
    <img src="https://github.com/caneto/darkweek11_barbearia/blob/main/dw_barbershop/assets/images/imgLogo.png" width="150" alt="Logo App Barbearia"/>
</p>

<h1 align="center">Barbearia App</h1>

---

<h2>Tópicos 📋</h2>

   <p>

   - [📖 Sobre](#-sobre)
   - [📱 Preview](#-preview)
   - [📦 Assets](#-assets)
   - [🛠️ Funcionalidades e Tecnologias Estudadas](#%EF%B8%8F-funcionalidades-e-tecnologias-estudadas)
   - [🤯 Desafios e Aprendizados ao longo do caminho](#-desafios-e-aprendizados-ao-longo-do-caminho)
   - [🤔 Como usar](#-como-usar)
   - [💪 Como contribuir](#-como-contribuir)
   - [📝 Licença](#-licença)

   </p>

---

<h2>📖 Sobre</h2>

<p>
    Projeto desenvolvido na Dart Week | 11ª Edição, um evento de lançamento para a <a href="http://academiadoflutter.com.br/">Academia do Flutter (ADF)</a>, do <a href="https://github.com/rodrigorahman">Rodrigo Rahman</a>.<br><br>
    Durante todo este ultimas duas semans, por ser um aluno da ADF (desde Outubro/2022), consegui entender com mais facilidade certos conceitos que ainda estavam confusos para mim, como a parte do <a href="https://pub.dev/packages/flutter_riverpod">RiverPod Flutter</a>.<br>
    <br>
</p>


---

<h2>📦 Assets</h2>

- <a href="https://github.com/caneto/darkweek11_barbearia/blob/main/dw_postman/DW11.postman_collection.json">Coleção do PostMan</a>
- UI Design criado para o evento: <a href="https://www.figma.com/file/FTkFmMrmIMUipkJ8FrcWfb/DW-Barbeshop?type=design&node-id=0-1&mode=design&t=lq1OHCPQ3DDpp4Zx-0">**Barbearia**</a>
---   

<h2>🛠️ Funcionalidades e Tecnologias Estudadas</h2>

- Usando o Dart 3:
    - Programação Funcional (Either) com Pure Dart (usando o poder do Dart 3)
    - Usando muitos métodos `switch`;
    - Usando `pattern matching` etc.
- Consulta da API usando o package Dio
- RiverPod como Gerenciamento de Estado e muito mais (grande novidade deste DW11)
- Fluxo de Login e Logout com a aplicação
- Persistência de dados com o SharedPreferences
- Pattern Matching com match
- Providers
- Telas: 
  - Splash (tela inicial do app para transição)
  - Home (tela principal do app, tanto para o proprietario como o trabalhador)
  - Login (onde possui o fluxo de login)
  - Register (onde possui o fluxo de cadastro)
   Principais packages utilizados.
    - [flutter_riverpod] - 2.4.5 https://pub.dev/packages/flutter_riverpod
    - [riverpod_annotation] - 2.3.0 (https://pub.dev/packages/riverpod_annotation)
    - [custom_lint] - 0.5.6 (https://pub.dev/packages/custom_lint)
    - [riverpod_lint] - 2.3.3 (https://pub.dev/packages/riverpod_lint)
    - [riverpod_generator] - 2.4.6 (https://pub.dev/packages/riverpod_generator)
    - [dio] - 5.3.3 (https://pub.dev/packages/dio)
    - [pretty_dio_logger] - 1.3.1 (https://pub.dev/packages/pretty_dio_logger)
    - [asyncstate] - 2.1.0 (Nacional) (https://pub.dev/packages/asyncstate)
    - [syncfusion_flutter_calender] - 22.2.11 (https://pub.dev/packages/syncfusion_flutter_calendar)
    - [top_snackbar_flutter] - 3.1.0 (https://pub.dev/packages/top_snackbar_flutter)
    - [shared_preferences] - 2.2.2 (https://pub.dev/packages/shared_preferences)
    - [loading_animation_widget] - 1.2.0+4 (https://pub.dev/packages/loading_animation_widget)
    - [intl] - 0.18.1 (https://pub.dev/packages/intl)
    - [validationles] - 1.2.1 (https://pub.dev/packages/validatorless)
    - [table_calendar] - 3.0.9 (https://pub.dev/packages/table_calendar)
    - [flutter_lints] - 3.0.1 (https://pub.dev/packages/flutter_lints)
         
    entre outros

<h2>🤯 Desafios e aprendizado ao longo do caminho</h2>

Sem dúvida, o maior aprendizado foi o Riverpod; Percebi que é muito interessante para gerenciar o estado de uma aplicação, indo além em pontos que podem ser cruciais (como poder ter vários provedores do mesmo tipo, realizar o descarte quando ela não for mais utilizada, entre outras coisas) .

Além disso, foi muito legal aprender mais sobre os poderes e usos do Dart 3 na prática, como o novo `switch` e o uso do `pattern match`; que se encaixam muito bem e tornam o código mais objetivo. Outro ponto que foi muito interessante foi o `Either` usado sem nenhuma dependência externa. Você pode usar programação funcional com `correspondência de padrões` para lidar com casos de erro e sucesso.

Vários outros aprendizados foram adquiridos e também reforçados; além de refatorações e melhorias de código feitas ao longo do caminho. Sempre há algo a ser melhorado e aprendido. 🚀
</p>

