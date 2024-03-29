<h1> App para agendamento de consultas</h1>

## Objetivo do projeto
<p>O projeto foi desenvolvido para aprendizado na tecnlogia mobile usando Flutter/Dart. Para a persistência de todos os dados foi utilizado uma API desenvolvida em .NET.</p>
<p>A finalidade do app é realizar o agendamento de consultas médicas.</p>

## 📁 Acesso ao projeto
<p> Você pode ter acesso aos arquivos do projeto clicando aqui => https://github.com/silvaalexsander/AppAgendamentoConsultas/tree/master/lib

## ✔ Tecnologias utilizadas
- ``Flutter``
- ``.Net``
- ``Dart``
- ``SQL Server``
  

## 🛠️ Descrição/Funcionalidades do projeto
-  [x] `Tela de Login`

 Tela para fazer o login na aplicação. Necessário informar o e-mail e senha.
 A requisição é enviada via API, caso as informações estejam corretas o usuário é autenticado e recebe um token via JWT para ter acesso as demais funcionalidades.
 
<img src="https://github.com/silvaalexsander/AppAgendamentoConsultas/blob/master/assets/images/login.png" width=250px>
 
  
  
-  [x] `Tela de Cadastro`

 Caso o usuario não tenha cadastro, o mesmo é realizado preenchendo corretamente os campos.
 Após o preenchimento completo dos campos, o usuário é cadastrado via API e é retornado a tela de login para ser atutenticado no app.
  
  <img src= "https://github.com/silvaalexsander/AppAgendamentoConsultas/blob/master/assets/images/cadastro.png" width=250px>
   

 -  [x] `Tela Inicial - Sem consultas`
 
 Essa tela é exibida ao iniciar a aplicação e não tenha nenhuma consulta agendada.
 
 <img src= "https://github.com/silvaalexsander/AppAgendamentoConsultas/blob/master/assets/images/Screenshot_1677180858.png" width=250px>
 
  
-  [x] `Tela para Agendar consultas`
  <img src= "https://github.com/silvaalexsander/AppAgendamentoConsultas/blob/master/assets/images/agendarVazio.png" width=250px>
  Nessa tela o usuário se depara com os campos para escolher o Hospital de sua preferência, em seguida a Especialidade e por último profissional médico que irá lhe atender. 
  Essas informações vem do banco de dados via API.
  Após essa seleção, você irá escolher a data e o horário conforme disponibilidade.
  <img src= "https://github.com/silvaalexsander/AppAgendamentoConsultas/blob/master/assets/images/agendarCompleto.png" width=250px>
  O botão para confirmar a consulta so irá aparecer após todas as informações forem preenchidas corretamente.
  Ao confirmar, será exibido o modal para última verificação das informações.
  <img src= "https://github.com/silvaalexsander/AppAgendamentoConsultas/blob/master/assets/images/confirmarAgendamento.png" width=250px>
  Ao confirmar, o usuário é direcionado a página incial.
  
  
  -  [x] `Tela Inicial - Com consultas`
  
  Agora na tela inicial com os cards de consultas, é possível acessar os detalhes da consulta clicando sobre o card, ou mesmo editar e cancelar clicando nos respectivos botões.
  
  <img src= "https://github.com/silvaalexsander/AppAgendamentoConsultas/blob/master/assets/images/agendamentos.png" width=250px>
  
  
  -  [x] `Tela de Detalhes da Consulta`
  
  A tela exibe todos os detalhes relevantes da consulta, como nome do médico, especialidade, o hospital e o endereço do mesmo.
  Ao clicar no endereço do hospital, você é direcionado ao endereço via google maps.
  
  <img src= "https://github.com/silvaalexsander/AppAgendamentoConsultas/blob/master/assets/images/detalheAgendamento.png" width=250px>
  
  
  -  [x] `Tela de Edição de Consulta`
  
  Ao clicar em editar, o usuário é direcionado para a tela de edição de consultas.
  Na tela de edição a consulta, o procedimento é totalmente semelhante ao de agendar a consulta pela primeira vez. Basta seguir os passos para realizar a edição.
  
  <img src= "https://github.com/silvaalexsander/AppAgendamentoConsultas/blob/master/assets/images/editarAgendamento.png" width=250px>
  
  
  -  [x] `Tela de Exclusão de Consulta`
  
  Ao clicar em cancelar, abrirá uma caixa de dialogo perguntando da certeza do cancelamento da consulta, caso aperte em não a consulta continua e o usuário volta a tela principal, caso sim, a consulta é excluida do banco de dados e usuário volta a tela principal.
  
  <img src= "https://github.com/silvaalexsander/AppAgendamentoConsultas/blob/master/assets/images/excluiAgendamento.png" width=250px>
  
  
  -  [x] `Drawer com opções`
  
  Esse drawer apresenta opções ao usuário.
  
  <img src= "https://github.com/silvaalexsander/AppAgendamentoConsultas/blob/master/assets/images/drawer.png" width=250px>
  
  -  [x] `Tela Configurações`
  
  Ao clicar em configurações, o usário é redirecionado a está página onde ele pode acessar o seus dados clicando em Perfil ou Alterar sua Senha.
  
  <img src= "https://github.com/silvaalexsander/AppAgendamentoConsultas/blob/master/assets/images/settings.png" width=250px>
  
  
  -  [x] `Tela de Perfil`
  
  No perfil, é possível ver os dados pessoais do usuário e é possível também editar algum dos dados.
  
  <img src= "https://github.com/silvaalexsander/AppAgendamentoConsultas/blob/master/assets/images/dadosPessoais.jpeg" width=250px>
  
  <p> Fique a vontade para dar sugestões e correções. Obrigado!</p>
