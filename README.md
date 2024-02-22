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
- UI Design criado para o evento: <a href="https://github.com/caneto/darkweek11_barbearia/blob/main/DWBarbeshop.fig">**Barbearia**</a>
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
    - [dart sdk] = 3.2.6
    - [flutter_riverpod] - 2.4.10 https://pub.dev/packages/flutter_riverpod
    - [riverpod_annotation] - 2.3.4 (https://pub.dev/packages/riverpod_annotation)
    - [custom_lint] - 0.6.2 (https://pub.dev/packages/custom_lint)
    - [riverpod_lint] - 2.3.9 (https://pub.dev/packages/riverpod_lint)
    - [riverpod_generator] - 2.3.11 (https://pub.dev/packages/riverpod_generator)
    - [dio] - 5.4.1 (https://pub.dev/packages/dio)
    - [pretty_dio_logger] - 1.3.1 (https://pub.dev/packages/pretty_dio_logger)
    - [asyncstate] - 2.1.0 (Nacional) (https://pub.dev/packages/asyncstate)
    - [syncfusion_flutter_calender] - 22.2.11 (https://pub.dev/packages/syncfusion_flutter_calendar)
    - [top_snackbar_flutter] - 3.1.0 (https://pub.dev/packages/top_snackbar_flutter)
    - [shared_preferences] - 2.2.2 (https://pub.dev/packages/shared_preferences)
    - [loading_animation_widget] - 1.2.0+4 (https://pub.dev/packages/loading_animation_widget)
    - [intl] - 0.18.1 (https://pub.dev/packages/intl)
    - [validationles] - 1.2.3 (https://pub.dev/packages/validatorless)
    - [table_calendar] - 3.1.0 (https://pub.dev/packages/table_calendar)
    - [flutter_lints] - 3.0.1 (https://pub.dev/packages/flutter_lints)
         
    entre outros

<h2>🤯 Desafios e aprendizado ao longo do caminho</h2>

Sem dúvida, o maior aprendizado foi o Riverpod; Percebi que é muito interessante para gerenciar o estado de uma aplicação, indo além em pontos que podem ser cruciais (como poder ter vários provedores do mesmo tipo, realizar o descarte quando ela não for mais utilizada, entre outras coisas) .

Além disso, foi muito legal aprender mais sobre os poderes e usos do Dart 3 na prática, como o novo `switch` e o uso do `pattern match`; que se encaixam muito bem e tornam o código mais objetivo. Outro ponto que foi muito interessante foi o `Either` usado sem nenhuma dependência externa. Você pode usar programação funcional com `correspondência de padrões` para lidar com casos de erro e sucesso.

Vários outros aprendizados foram adquiridos e também reforçados; além de refatorações e melhorias de código feitas ao longo do caminho. Sempre há algo a ser melhorado e aprendido. 🚀
</p>

<h2>🤔 Como usar</h2>

   ```
   É necessário ter o Flutter instalado. Para configurar o ambiente de desenvolvimento na sua máquina:
   https://flutter.dev/docs/get-started/install

   O aplicativo consome os dados do backend desenvolvido pela comunidade ADF chamado json_rest_server:
   https://pub.dev/packages/json_rest_server

   - Clone o repositório:
    $ git clone https://github.com/caneto/dartweek11_barbearia

   - Entre no diretório:
   $ cd dartweek11_barbearia\dw_barbershop

   - Instale as dependências:
   $ flutter pub get

   - Instale o json_rest_server
   $ dart pub global activate json_rest_server

   - Abra a pasta em CMD, o backend
   $ cd dartweek11_barbearia\dw_barbershop_api

   - Para inicializá-lo, execute o comando:
   $ jrs run

   - Em outro terminal, no diretório raiz do projeto, execute:
   $ flutter run
   ```

---

<h2>💪 Como contribuir</h2>

   ```
   - Gosto bastante de seguir a seguinte Style Guide de Commits 😊:
   https://udacity.github.io/git-styleguide/

   - Dê um fork no projeto 

   - Cria uma nova branch com suas mudanças:
   $ git checkout -b my-feature

   - Salve suas mudanças e faça uma mensagem de commit message sobre suas alterações:
   $ git commit -m "feat: My new feature"

   - Envie suas mudanças:
   $ git push origin my-feature
   ```

---

<h2>📝 Licença</h2>

<p>
   Esse repositório está sobre a Licença GNU General Public License v3.0, e você pode vê-la no arquivo <a href="https://github.com/caneto/darkweek9_vakinha_burger/blob/main/LICENSE">LICENSE</a> para mais detalhes. 😉
</p>


---

   >Esse projeto foi desenvolvido com ❤️ por **[@Carlos Alberto Pinto](https://www.linkedin.com/in/canetorj/)**, com o instrutor **[@Rodrigo Rahman](https://br.linkedin.com/in/rodrigo-rahman)**, no evento #DartWeek da **[Academia do Flutter]**.<br>
   Se isso te ajudou, dê uma ⭐, e contribua, isso irá me ajudar também 😉


