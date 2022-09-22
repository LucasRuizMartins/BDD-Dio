


<H1> BANCO DE DADOS </H1> 
<H3> estudos e reflexões sobre banco de dados relacionados ao bootcamp DIO.me </H3> 

<H3> MOTIVAÇÃO </H3> 

Os bancos de dados surgem com o intuito de facilitar o armazenamento e manipulação dos dados, uma forma de 
desvincular os dados da própria aplicação, fazendo com que sua manipulação e armazenamento seja facilitada e mais abrangente.
<br>
A partir dos dados gerados pelas próprias empresas, pode-se responder perguntas importantes para o dia a dia da empresa seguem alguns exemplos: <br><br>
 
Quais os produtos mais vendidos pela empresa em determinado periodo ? 
<br>
Quantos produtos de determinado tipo ainda temos em nosso estoque ? 
<br>
Qual foi o Desempenho de determinado vendedor no mês vigente? 
<br> 
Qual foi o Lucro de determinado setor 
<br>

<br>
Uma empresa bem organizada detém de todos esses dados, porém somente através de uma cuidadosa organização, estes dados podem se transformar em informações úteis ao negócio. 
<br>

Estes dados são persistidos em memória e a manipulação deles é facilitada por um SGBD(" Sistema de Gerenciamento de Banco de Dados") 
listarei aqui algumas caracteristicas de um bom SGBD:
<br>


<ul>
<li>  Velocidade </li>
<li>  Segurança e controle de acesso .</li>
<li>  tipagem dos dados (para garantir a melhor consistencia das informações).</li>
<li>  Consistência (sem violação das regras estipuladas). </li>
<li>  Evitar Redundância (em caso de modelo relacional)</li>
<li>  Backup para maior segurança dos dados persistidos  </li>
</ul>
 
 

Existem diversos tipos de Banco de dados tais quais: 


<ul>
<li>Hierárquico </li>
<li>Relacional </li>
<li>Orientado a objetos</li>
</ul>
E desde 2009 tem crescido a utilização dos modelos <strong>"NoSQL"</strong>( “Not Only SQL” ou "Não Somente SQL")
dentro destes NoSQL podemos especificar alguns tipos especificos :  
 <ul>
<li> Orientado a agregados</li>
<li> Chave-valor</li>
<li> Documentos</li>
<li> Família de colunas </li>
<li> Grafos
 </ul>
Porém ainda hoje sabe-se que a preferencia é dos modelos relacionais 


<HR>
<h4> DEFINIÇÕES TÉCNICAS BANCOS DE DADOS RELACIONAIS </H4>

Em um banco de dados relacional os dados são salvos em Tabelas também chamadas de relações <br>
Nessas tabelas, cada coluna correspode a um atributo <br>
Os atributos tendem seguir certas regras(restrições) que são denominadas CONSTRAINTS <br>
Cada linha dessa tabela também pode ser chamada de tupla ou uma instancia. <br>

<h3>Transações </h3>
As transações são outra caracteristica importante nos bancos de dados relacionais, para estes seguimos o principio <strong>"ACID"</strong>
 <br>
<h4>Atomicidade, Consistência, Isolamento, Durabilidade</h4>

<strong>Atômicas:</strong> uma transação deve ser indivisível. Ou executa tudo, ou não executa nada. Se um erro ocorrer no
meio das operações de uma transação, ou tudo será desfeito ou as operações serão retomadas e finalizadas.

<br>
<strong>Consistentes: </strong>uma transação deve levar o banco de dados de um estado consistente para outro estado
também consistente, sem violar as regras (Constraints).

<br>
<strong>Isoladas: </strong>enquanto uma transação estiver sendo executada, ninguém pode fazer alterações nos dados
envolvidos.
<br>
<strong> Duráveis: </strong> quando uma transação é concluída, os dados alterados devem realmente estar gravados.
 


<HR>
<h3>Modelagem de banco de dados</h3>

Um banco de dados precisa ser pensado de forma que consiga manter todas essas caracteristicas mencionadas anteriormente, 
o pensamento de organização destes dados em uma relação se dá pelo modelo de dados
Esta modelagem está dividida em diferentes níveis
<ul>
<li> <strong> Nível Conceitual </strong> (Descreve entidades e suas relações de forma INDEPENDENTE DE PARADIGMA E TECNOLOGIA)</li>
<br>
<li> <strong>Nível Lógico </strong>(Descreve as entidades e suas relações de forma INDEPENDENTE DE TECNOLOGIA, PRESO A PARADIGMA) <br> para o nível lógico podemos utilizar o modelo de entidade relacionamento (de Peter Chen) ou ainda o diagrama de classes UML  </li>
<br>
<li> <strong>Nível Físico </strong>(Descrever as entidades e suas inter-relações de forma PRESO A TECNOLOGIA, PRESO A PARADIGMA) </li> 
</ul>



<HR>

<H3> NORMALIZAÇÃO </H3>


<STRONG> primeira forma normal </STRONG> 
Proíbe atributos compostos, atributos multivalorados. 
Ou seja, permite apenas atributos que sejam atômicos/indivisiveis .

<br><br><br>

<STRONG> Segunda forma normal </STRONG> 
 
Para atender a segunda forma normal, anteriormente a relação necessita estar na primeira forma normal e ter todos os atributos da relação que não forem chave primária
dependendo funcionalmente de uma a chave primária.

<br><br><br>
<STRONG> Terceira forma normal </STRONG> 
Para atender a terceira forma normal, anteriormente a relação necessita estar na primeira e segunda forma normal
<br>Não existir atributos não chave dependentes de outros atributos não chave (Atributos não chave devem depender exclusivamente de atributos chave).


<HR>
<H2> SQL, DML, DDL </H2>

<STRONG> SQL </STRONG> ("Structured Query Language" / Linguagem de Consulta Estruturada) 
<BR>
é a linguagem padrão para o acesso aos bancos de dados relacionais. 
<br> 
A linguagem SQL é dividida em outras linguagens: 
<ul> 
<LI> <STRONG> DDL </STRONG> (Data Definition Language) 
<BR> 
Responsável pelos comandos que definem as estruturas de um banco de dados relacional.
<BR><BR>
principais comandos e exemplos:
<BR><BR>
<STRONG> CREATE -> </STRONG> criar uma nova relação, banco de dados.
<BR>
<BR>
CREATE DATABASE exemplo;
 <BR><BR>

CREATE TABLE tb_exemplo 
(dado_persistido TIPODEDADO); 
<BR><BR>

<STRONG> ALTER ->  </STRONG> alterar uma estrutura de um BDD ou relação.
<BR><BR>
ALTER TABLE tb_exemplo 
(dado_persistido NOVO_TIPODEDADO); 
<BR><BR>
<STRONG>DROP -> </STRONG>  deleta um BDD ou relação.
<BR><BR>

DROP DATABASE exemplo;
 <BR><BR>
DROP TABLE tb_exemplo; 

<BR><BR> 
</LI>

<LI><STRONG>DML </STRONG> (Data Manipulation Language) 
<BR><BR>
Responsável pelo gerenciamento dos dados do BDD.
<BR><BR>
principais comandos e exemplos:
<BR><BR>

 <STRONG> SELECT </STRONG> -> Selecionar dados de uma ou mais relação. 
<BR><BR>
<STRONG> INSERT </STRONG>  -> Insere dados em uma relação.
<BR><BR>
<STRONG> UPDATE </STRONG>  -> Atualiza dados de uma relação.
<BR><BR>
 </li>
<li>
<STRONG> DCL </STRONG> (Data Control Language)
<BR><BR>
Responsável pelo gerenciamento do acesso aos dados do BDD.
<BR><BR>
principais comandos:
<BR><BR>

<STRONG> GRANT </STRONG> -> Concede privilégios de acesso
<BR><BR>
<STRONG>  REVOKE </STRONG> -> Remove privilégios de acesso
</li>
</ul>
<hr>

<H3> Tipos de dados </H3> 

<TABLE> 
<TR> <TD> DATA TYPE </TD> <TD> SPEC </TD> </TR>
<TR> <TD>  CHAR </TD> <TD> STRING(0-255) </TD> </TR>
<TR> <TD>  VARCHAR </TD> <TD> STRING(0-255) </TD> </TR>
<TR> <TD>  TINYTEXT </TD> <TD> STRING(0-255) </TD>  </TR>
<TR> <TD>  TEXT </TD> <TD> STRING(0-65535) </TD>  </TR>
<TR> <TD>  TINYINT </TD> <TD> INTEGER(-127 ate 127) </TD> </TR>
<TR> <TD>  INT </TD> <TD> INTEGER(-2147483648  ate 2147483647) </TD> </TR>
<TR> <TD>  FLOAT </TD> <TD> DECIMAL( 23 DIGITOS) </TD> </TR>
<TR> <TD>  DATE </TD> <TD> YYYY-MM-DD </TD> </TR>
<TR> <TD>  DATETIME </TD> <TD> YYYY-MM-DD HH:MM:SS </TD> </TR>
<TR> <TD>  ENUM </TD> <TD> uma das opções listadas entre as 'aspas simples' </TD> </TR>
<TR> <TD>  BOOLEAN </TD> <TD> 1 ou 0 (true or false) </TD> </TR>
</TABLE>
 

<HR>
<H3> BANCO DE DADOS NoSQL </H3>


atualmente os Bancos de  dados NoSQL tem ganhado força no mercado de softwares e dispositivos Web, além de jogos, por ter uma grande flexibilidade, escalabilidade a alta performance, esse tipo de banco de dados pode ser uma ótima escolha para implementação. 
<br>
<br>
 <ul>
 <li> <STRONG> FLEXIBILIDADE :</STRONG> 
os bancos de dados não relacionais costumam ter uma flexibilidade que permite uma maior facilidade de implementação em alguns casos e até uma melhor curva de aprendizado, uma vez que não é necessário um schema para trabalhar com estes BDD </li> 
<br><br>
 <li> <STRONG> ESCALABILIDADE :</STRONG> 
 usados geralmente para grande numero de informações, costumam ser a melhor escolha para aplicações com grande numero de dados. 
</li>
<br><br>

 <li> <STRONG> PERFORMANCE :</STRONG> 
Geralmente são escolhas muito funcionais para o desenvolvimento de APIS 
</li>
<br><br>


 MongoDB é um banco de dados não relacional de documentos, utilizando o modelo JSON (javascript) ou até mesmo um xml.



 <a href="https://www.mongodb.com/docs/manual/tutorial/query-documents/">documentação queries mongoDB </a>
 
