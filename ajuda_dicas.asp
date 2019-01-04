<!--#include file="admin/functions.asp"-->
<!--#include file="admin/config.asp"-->
<%
  strURL=strROOT & "/cgi/www.exe/[in=getpar.in]"
  strHTML=getUrl(strURL)
  valores= split(strHTML,",")
  session("portal")=valores(2)
  strURL=strROOT & "/cgi/www.exe/[in=getrates.in]?expr=MFN $"
  strHTML=getUrl(strURL)
  votos= split(strHTML,",")
  sentidadelonga = ReadIniFile(Server.MapPath("cgi/cgi.ini"), "GERAL", "entidadelonga")
  sversao = ReadIniFile(Server.MapPath("cgi/cgi.ini"), "GERAL", "versao")
  surlRBE = ReadIniFile(Server.MapPath("cgi/cgi.ini"), "GERAL", "urlRBE")
  surlPORTAL = ReadIniFile(Server.MapPath("cgi/cgi.ini"), "GERAL", "urlPORTAL")
  sentidade = ReadIniFile(Server.MapPath("cgi/cgi.ini"), "GERAL", "entidade")
  stitulo = ReadIniFile(Server.MapPath("cgi/cgi.ini"), "PORTAL", "titulo")
  slogo = ReadIniFile(Server.MapPath("cgi/cgi.ini"), "PORTAL", "imglogo")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml" xml:lang="pt-PT" lang="pt-PT">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="robots" content="index, follow" />
	<title>Dicas de pesquisa - <%=stitulo%></title>
	<link rel="stylesheet" href="css/default.min.css?version=001" type="text/css" />
	<script type="text/javascript" src="js/geral.min.js"></script>

	<meta name="description" content="Dicas de pesquisa no catálogo coletivo - XXPTO - Catálogo coletivo da Rede de Bibliotecas do concelho" />
	<meta name="keywords" content="Catálogo coletivo, Bibliotecas, pesquisar biblioteca, OPAC, registo bibliográfico" />
	<meta name="author" content="Rede Concelhia de Bibliotecas - XXPTO" />
	<!-- Favicon Geral -->
	<link rel="icon" href="/rbcatalogo/favicon.ico" type="image/x-icon" />
	<link rel="icon" type="image/png" sizes="32x32" href="/rbcatalogo/imagens/app/favicon-32x32.png?v=001" />
	<!-- Favicon Android -->
	<link rel="manifest" href="manifest.json?v=001" />
	<meta name="theme-color" content="#cdc8b1" />
	<!-- Favicon Windows IE -->
	<meta name="msapplication-config" content="IEconfig.xml?v=001" />
	<meta name="application-name" content="Cat.RB XXPTO" />
	<meta name="msapplication-TileColor" content="#afa782" />
	<!-- Favicon iOS -->
	<link rel="apple-touch-icon-precomposed" href="/rbcatalogo/imagens/app/apple-touch-icon-precomposed.png?v=001" />
	<link rel="mask-icon" href="/rbcatalogo/imagens/app/safari-pinned-tab.svg?v=001" color="#5bbad5" />
	<!-- OpenGraph Facebook -->
	<meta property="og:image" content="http://www.pesquisardocumentos.com/rbcatalogo/partilhasocial.png"/>
	<meta property="og:image:height" content="363"/>
	<meta property="og:image:width" content="694"/>
	<meta property="og:title" content="XXPTO - Catálogo da Rede de Bibliotecas do concelho"/>
	<meta property="og:description" content="Pesquise os documentos e saiba rapidamente onde os pode requisitar. OPAC - XXPTO: Catálogo coletivo da Rede de Bibliotecas do Concelho. Ler, ver, sentir e viver"/>
	<meta property="og:type" content="website"/>
	<meta property="og:site_name" content="Catálogo.XXPTO - Rede de bibliotecas - XXPTO"/>
	<meta property="og:locale" content="pt_PT"/>
</head>

<body>
	<div class="destaque1">
		<h1 style="font-variant: small-caps">Catálogo Coletivo: <%=sentidadelonga%></h1>
	</div>
	<!-- Segmento Navegação topo -->
	<div class="col3-contentor">
		<div class="col3">
			<p class="fil">» <a href="default.asp">Entrada</a> » Ajuda: Dicas de pesquisa</p>
		</div>
		<div class="col3" id="lblutilizador">Utilizador:
			<% if session("user")="" then response.write "Visitante" else response.write ucase(session("user"))%>
		</div>
	</div>
	<!-- Segmento Navegação topo - FIM -->
	<div id="principal">
		<div align="center">
			<img src="<%=slogo%>" alt="Logótipo"/>
		</div>
		<h2><img src="imagens/pictitulos/pic_ajuda_alt.svg" alt="Técnicas de pesquisa" title="Técnicas de pesquisa" border="0" height="70" width="70" align="absmiddle"/><br />Dicas de pesquisa no catálogo</h2>
		<p>Pesquisar neste catálogo é muito simples: basta escrever uma palavra na caixa de pesquisa e carregar em pesquisar.
			<br /><span style="text-align:center; display: block;"><img src="imagens/ajuda/pesquisa.png" alt="Resultado da pesquisa" title="Resultado da pesquisa" border="0"/></span>
			<br />
			Pode fazer muito mais: obter menos resultados, mas mais exatos, filtrar resultados por biblioteca e tipo de documento, alterar o formato de visualização ou ver a biblioteca num mapa.
		</p>
		<br />
		<h2><img src="imagens/pictitulos/pic_pesquisa_alt.svg" alt="Tipos de pesquisa" title="Tipos de pesquisa" border="0" height="60" width="60" align="absmiddle"/>A- Tipos de pesquisa</h2>
		<p>O catálogo oferece vários tipos de pesquisa e combináveis com filtros e operadores. Recomendamos que, dependendo do tipo de informação pretendida, utilize a pesquisa Simplificada ou a Orientada.<br />
			Nota: pode pesquisar um autor pela forma normal ("Nome Apelido") ou forma inversa (“Apelido, Nome”)
		</p>
		<br style="clear:left;" />
		<br />
		<h3><img src="imagens/pictitulos/pic_pesqsimples_alt.svg" alt="Pesquisa simplificada" title="Pesquisa simplificada" border="0" height="45" width="45" align="absmiddle"/>A1- Pesquisa simplificada</h3>
		<p>A pesquisa simplificada é uma pesquisa livre que permite encontrar rapidamente sem ter de se indicar muitos detalhes sobre o documento. <br />
			Deve ser utilizada quando não se sabe exatamente o nome de um autor ou o título completo de um livro. O número de respostas tende a ser elevado.<br />
			<span style="text-align:center; display: block;"><img src="imagens/ajuda/pesquisa_simplificada.png" alt="Pesquisa simplificada" title="Pesquisa simplificada" border="0"/></span>
			<br style="clear:left;" />
			Este tipo de pesquisa aceita a introdução de uma ou mais palavras e é feita em vários campos ao mesmo tempo (Título, Autor, Assunto, Coleção, Local de edição e Editor).
		</p>
		<br style="clear:left;" />
		<br />
		<div class="destaquetexto">
			<h3><img src="imagens/pictitulos/pic_pesqorientada_alt.svg" alt="Pesquisa orientada" title="Pesquisa orientada" border="0" height="45" width="45" align="absmiddle"/>A2- Pesquisa orientada</h3>
			<p>A pesquisa orientada permite maior detalhe na pesquisa. <br />
				Deve ser utilizada quando sabemos exatamente o que procurar ou para limitar as pesquisas apenas a uma biblioteca.<br />
				<span style="text-align:center; display: block;"><img src="imagens/ajuda/pesquisa_orientada.png" alt="Pesquisa orientada" title="Pesquisa orientada" border="0"/></span>
				<br style="clear:left;" />
				Na pesquisa orientada encontra vários campos de pesquisa disponíveis (ex.: Autor, Título, Assunto, Coleção, Biblioteca).<br />
				Para melhorar a exatidão das pesquisas pode colocar termos em mais de um campo e escolher os operadores [ <b>E</b> ][ <b>OU</b> ][ <b>NÃO</b> ] de forma a limitar os resultados obtidos.
			</p>
		</div>
		<br style="clear:left;" />
		<br />
		<h3><img src="imagens/pictitulos/pic_pesqtermos_alt.svg" alt="Navegação por termos" title="Navegação por termos" border="0" height="45" width="45" align="absmiddle"/>A3- Pesquisa/navegação por termos</h3>
		<p>A pesquisa por termos permite encontrar documentos mesmo sem escrever. É uma lista do que existe no catálogo e com navegação simples<br />
			Deve ser utilizada quando não sabemos que tipo de documentos existem numa biblioteca ou quando não sabemos como se escreve um determinado título ou nome de autor.<br />
			<span style="text-align:center; display: block;"><img src="imagens/ajuda/pesquisa_termos.png" alt="Pesquisa por termos" title="Pesquisa por termos" border="0"/></span>
			<br style="clear:left;" />
			Na entrada da navegação por termos encontra uma listagem de palavras organizadas por alfabeto. Clique no resultado pretendido e irá para a ficha do documento.<br />
			Pode limitar as listagens utilizando os vários campos de pesquisa disponíveis (ex.: Autor, Título, Assunto, Coleção).<br />
		</p>
		<br style="clear:left;" />
		<br />
		<div class="destaquetexto1">
			<h2><img src="imagens/pictitulos/pic_filtros_alt.svg"  alt="Pesquisar com filtros" title="Pesquisar com filtros" border="0" height="60" width="60" align="absmiddle"/>B- Pesquisar com filtros</h2>
			<p style="text-align:center">Na pesquisa simplificada ou na orientada pode filtrar as suas pesquisas por tipo de material ou ano de edição.<br />
				Para tal carregue no ícone (+) de forma a ver as opções <br />
				<img src="imagens/ajuda/pesquisa_filtros.png" alt="Filtrar pesquisas" title="Filtrar pesquisas" border="0"/>
				<br />
				É igualmente nos filtros que pode alterar o formato de visualização dos resultados.<br />
				<img src="imagens/ajuda/pesquisa_filtros1.png" alt="Escolha dos filtros" title="Escolha dos filtros" border="0"/>
			</p>
		</div>
		<br style="clear:left;" />
		<br />
		<h2><img src="imagens/pictitulos/pic_pesqoperadores_alt.svg" alt="Pesquisar com operadores" title="Pesquisar com operadores" border="0" height="60" width="60" align="absmiddle"/>C- Pesquisar com operadores</h2>
		<p>A utilização de operadores nas pesquisas permite limitar os resultados obtidos<br />
			São utilizados os operadores [ E ][ OU ][ NÃO ] que permitem condicionar uma pesquisa de forma a mostrar documentos que, por exemplo, possuam duas palavras específicas ou em que tenham uma mas não a outra palavra.
		</p>
		<h3>C1- Operadores na pesquisa orientada</h3>
		<p>Na pesquisa orientada os operadores estão disponíveis diretamente, para escolha, em cada campo.<br />
			<span style="text-align:center; display: block;"><img src="imagens/ajuda/pesquisa_oper_ori.png" alt="Operadores na pesquisa orientada" title="Operadores na pesquisa orientada" border="0"/></span>
		</p>
		<h3>C2- Operadores na pesquisa simplificada</h3>
		<p>Na pesquisa simplificada a utilização de operadores terá de ser feita manualmente através de uma expressão de pesquisa composta por:
			<ul>
				<li>Palavras a pesquisar</li>
				<li>Símbolos para os operadores: + (E) , espaço (OU) , - (NÃO)</li>
				<li>Sinais de pontuação (aspas, parêntesis)</li>
			</ul>
		</p>
		<p><span style="text-align:center; display: block;">Exemplo:<br />
			<img src="imagens/ajuda/pesquisa_oper_simp.png" alt="Operadores na pesquisa simplificada" title="Operadores na pesquisa simplificada" border="0"/></span>
			<br />
			Para mais exemplos de utilização de operadores visite este sítio web: 
			<a style="text-decoration:none" href="https://sites.google.com/view/pesquisarcatalogo/operadores" target="_blank">https://sites.google.com/view/pesquisarcatalogo/operadores <img src="imagens/picactions/icon_url.svg" alt="Abrir em nova janela" title="Abrir em nova janela" border="0" height="15" width="15" align="absmiddle"/></a>
		</p>
		<br style="clear:left;" />
		<br />
		<div class="destaquetexto">
			<h2><img src="imagens/pictitulos/pic_resultados_alt.svg" alt="Resultados" title="Resultados" border="0" height="60" width="60" align="absmiddle"/>D- Resultados de uma pesquisa</h2>
			<p>Após fazer uma pesquisa obtém os seus resultados com a indicação das bibliotecas onde estão disponíveis <br />
				Para detalhes veja a linha "localização" e carregue na sigla da biblioteca ou no sinal "+" <br />
				<span style="text-align:center; display: block;"><img src="imagens/ajuda/bib_identificar1.png" alt="Resultados de uma pesquisa" title="Resultados de uma pesquisa" border="0"/></span>
				<br />
				Como identificar a biblioteca onde requisitar o documento? <a style="text-decoration:none" href="ajuda_identificar.asp">Carregue aqui para saber como >>>.</a>
			</p>
		</div>
		<br style="clear:left;" />
		<div class="destaquetexto1">
			<p><img src="imagens/pictitulos/pic_questao_alt.svg" alt="Dúvidas" title="Dúvidas" border="0" height="22" width="22" align="absmiddle"/> Em caso de dúvidas dirija-se à biblioteca mais próxima onde terão todo o gosto de o ajudar nas pesquisas e empréstimos, mesmo que o documento não esteja nessa biblioteca.
				<br />Boas leituras!
			</p>
			<p>Mais informações sobre como pesquisar no catálogo: <a style="text-decoration:none" href="https://sites.google.com/view/pesquisarcatalogo" target="_blank">https://sites.google.com/view/pesquisarcatalogo <img src="imagens/picactions/icon_url.svg" alt="Abrir em nova janela" title="Abrir em nova janela" border="0" height="12" width="12" align="absmiddle"/></a>
			</p>
		</div>
		<br />
		<div align="center" style="clear:both" class="txtvoltar">
			<a style="text-decoration:none" href="default.asp"><input type="button" name="bt2" value="Voltar" class="botao botao5" ;></a>
		</div>
	</div>
	<br />
	<br />
</body>

</html>
