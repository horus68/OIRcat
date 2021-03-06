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
	<meta name="description" content="<%=sdescription%>" />
	<meta name="keywords" content="<%=skeywords%>" />
	<meta name="author" content="<%=sentidadelonga%>" />
	<!-- Favicon Geral -->
	<link rel="icon" type="image/x-icon" href="<%=sFAVico%>" />
	<link rel="icon" type="image/png" sizes="32x32" href="<%=sFAVicon32%>" />
	<!-- Favicon Android -->
	<link rel="manifest" href="manifest.json?v=001" />
	<meta name="theme-color" content="#cdc8b1" />
	<!-- Favicon Windows IE -->
	<meta name="msapplication-config" content="IEconfig.xml?v=001" />
	<meta name="application-name" content="<%=snomeAPP%>" />
	<meta name="msapplication-TileColor" content="#afa782" />
	<!-- Favicon iOS -->
	<link rel="apple-touch-icon-precomposed" href="<%=sFAVios%>" />
	<link rel="mask-icon" href="<%=sFAVsafari%>" color="#5bbad5" />
	<!-- Google / Search Engine Tags -->
	<meta itemprop="name" content="<%=sOGsitename%>" />
	<meta itemprop="description" content="<%=sOGdescription%>" />
	<meta itemprop="image" content="<%=sOGimage%>" />
	<!-- OpenGraph Facebook -->
	<meta property="og:image" content="<%=sOGimage%>" />
	<meta property="og:image:height" content="363" />
	<meta property="og:image:width" content="694" />
	<meta property="og:title" content="<%=sOGtitle%>" />
	<meta property="og:description" content="<%=sOGdescription%>" />
	<meta property="og:type" content="website" />
	<meta property="og:site_name" content="<%=sOGsitename%>" />
	<meta property="og:url" content="<%=surlOPAC%>" />
	<meta property="og:locale" content="pt_PT" />
</head>

<body>
	<div class="destaque1">
		<h1 style="font-variant: small-caps">Cat�logo Coletivo: <%=sentidadelonga%></h1>
	</div>
	<!-- Segmento Navega��o topo -->
	<div class="col3-contentor">
		<div class="col3">
			<p class="fil">� <a href="default.asp">Entrada</a> � Ajuda: Dicas de pesquisa</p>
		</div>
		<div class="col3" id="lblutilizador">Utilizador:
			<% if session("user")="" then response.write "Visitante" else response.write ucase(session("user"))%>
		</div>
	</div>
	<!-- Segmento Navega��o topo - FIM -->
	<div id="principal">
		<div align="center">
			<img src="<%=simglogo%>" alt="Log�tipo"/>
		</div>
		<h2><img src="imagens/pictitulos/pic_ajuda_alt.svg" alt="T�cnicas de pesquisa" title="T�cnicas de pesquisa" height="70" width="70" style="vertical-align:middle" /><br />Dicas de pesquisa no cat�logo</h2>
		<p>Pesquisar neste cat�logo � muito simples: basta escrever uma palavra na caixa de pesquisa e carregar em pesquisar.
			<br /><span style="text-align:center; display: block;"><img src="imagens/ajuda/pesquisa.png" alt="Resultado da pesquisa" title="Resultado da pesquisa" /></span>
			<br />
			Pode fazer muito mais: obter menos resultados (mas mais exatos), filtrar resultados por biblioteca e tipo de documento, alterar o formato de visualiza��o dos resultados ou ver a biblioteca num mapa.
		</p>
		<br />
		<h2><img src="imagens/pictitulos/pic_pesquisa_alt.svg" alt="Tipos de pesquisa" title="Tipos de pesquisa" height="60" width="60" style="vertical-align:middle" />A- Tipos de pesquisa</h2>
		<p>O cat�logo oferece v�rios tipos de pesquisa e combin�veis com filtros e operadores. Recomendamos que, dependendo do tipo de informa��o pretendida, utilize a pesquisa Simplificada ou a Orientada.<br />
			Nota: pode pesquisar um autor pela forma normal ("Nome Apelido") ou pela forma inversa ("Apelido, Nome")
		</p>
		<br style="clear:left;" />
		<br />
		<h3><img src="imagens/pictitulos/pic_pesqsimples_alt.svg" alt="Pesquisa simplificada" title="Pesquisa simplificada" height="45" width="45" style="vertical-align:middle" />A1- Pesquisa simplificada</h3>
		<p>A pesquisa simplificada � uma pesquisa livre que permite encontrar rapidamente sem ter de se indicar muitos detalhes sobre o documento. <br />
			Deve ser utilizada quando n�o se sabe exatamente o nome de um autor ou o t�tulo completo de um livro. O n�mero de respostas tende a ser elevado.<br />
			<span style="text-align:center; display: block;"><img src="imagens/ajuda/pesquisa_simplificada.png" alt="Pesquisa simplificada" title="Pesquisa simplificada"/></span>
			<br style="clear:left;" />
			Este tipo de pesquisa aceita a introdu��o de uma ou mais palavras e � feita em v�rios campos ao mesmo tempo (T�tulo, Autor, Assunto, Cole��o, Local de edi��o e Editor).
		</p>
		<br style="clear:left;" />
		<br />
		<div class="destaquetexto">
			<h3><img src="imagens/pictitulos/pic_pesqorientada_alt.svg" alt="Pesquisa orientada" title="Pesquisa orientada" height="45" width="45" style="vertical-align:middle" />A2- Pesquisa orientada</h3>
			<p>A pesquisa orientada permite maior detalhe na pesquisa. <br />
				Deve ser utilizada quando sabemos exatamente o que procurar ou para limitar as pesquisas apenas a uma biblioteca.<br />
				<span style="text-align:center; display: block;"><img src="imagens/ajuda/pesquisa_orientada.png" alt="Pesquisa orientada" title="Pesquisa orientada" /></span>
				<br style="clear:left;" />
				Na pesquisa orientada encontra v�rios campos de pesquisa dispon�veis (ex.: Autor, T�tulo, Assunto, Cole��o, Biblioteca).<br />
				Para melhorar a exatid�o das pesquisas pode colocar termos em mais de um campo e escolher os operadores [ <b>E</b> ][ <b>OU</b> ][ <b>N�O</b> ] de forma a limitar os resultados obtidos.
			</p>
		</div>
		<br style="clear:left;" />
		<br />
		<h3><img src="imagens/pictitulos/pic_pesqtermos_alt.svg" alt="Navega��o por termos" title="Navega��o por termos" height="45" width="45" style="vertical-align:middle" />A3- Pesquisa/navega��o por termos</h3>
		<p>A pesquisa por termos permite encontrar documentos mesmo sem escrever. � uma lista do que existe no cat�logo e com navega��o simples<br />
			Deve ser utilizada quando n�o sabemos que tipo de documentos existem numa biblioteca ou quando n�o sabemos como se escreve um determinado t�tulo ou nome de autor.<br />
			<span style="text-align:center; display: block;"><img src="imagens/ajuda/pesquisa_termos.png" alt="Pesquisa por termos" title="Pesquisa por termos"/></span>
			<br style="clear:left;" />
			Na entrada da navega��o por termos encontra uma listagem de palavras organizadas por alfabeto. Clique no resultado pretendido e ir� para a ficha do documento.<br />
			Pode limitar as listagens utilizando os v�rios campos de pesquisa dispon�veis (ex.: Autor, T�tulo, Assunto, Cole��o).<br />
		</p>
		<br style="clear:left;" />
		<br />
		<div class="destaquetexto1">
			<h2><img src="imagens/pictitulos/pic_filtros_alt.svg"  alt="Pesquisar com filtros" title="Pesquisar com filtros" height="60" width="60" style="vertical-align:middle" />B- Pesquisar com filtros</h2>
			<p style="text-align:center">Na pesquisa simplificada ou na orientada pode filtrar as suas pesquisas por tipo de material ou ano de edi��o.<br />
				Para tal carregue no �cone (+) de forma a ver as op��es <br />
				<img src="imagens/ajuda/pesquisa_filtros.png" alt="Filtrar pesquisas" title="Filtrar pesquisas"/>
				<br />
				� igualmente nos filtros que pode alterar o formato de visualiza��o dos resultados.<br />
				<img src="imagens/ajuda/pesquisa_filtros1.png" alt="Escolha dos filtros" title="Escolha dos filtros"/>
			</p>
		</div>
		<br style="clear:left;" />
		<br />
		<h2><img src="imagens/pictitulos/pic_pesqoperadores_alt.svg" alt="Pesquisar com operadores" title="Pesquisar com operadores" height="60" width="60" style="vertical-align:middle" />C- Pesquisar com operadores</h2>
		<p>A utiliza��o de operadores nas pesquisas permite limitar os resultados obtidos<br />
			S�o utilizados os operadores [ E ][ OU ][ N�O ] que permitem condicionar uma pesquisa de forma a mostrar documentos que, por exemplo, possuam duas palavras espec�ficas ou em que tenham uma mas n�o a outra palavra.
		</p>
		<h3>C1- Operadores na pesquisa orientada</h3>
		<p>Na pesquisa orientada os operadores est�o dispon�veis diretamente, para escolha, em cada campo.<br />
			<span style="text-align:center; display: block;"><img src="imagens/ajuda/pesquisa_oper_ori.png" alt="Operadores na pesquisa orientada" title="Operadores na pesquisa orientada"/></span>
		</p>
		<h3>C2- Operadores na pesquisa simplificada</h3>
		<p>Na pesquisa simplificada a utiliza��o de operadores ter� de ser feita manualmente atrav�s de uma express�o de pesquisa composta por:
		</p>
			<ul>
				<li>Palavras a pesquisar</li>
				<li>S�mbolos para os operadores: + (E) , espa�o (OU) , - (N�O)</li>
				<li>Sinais de pontua��o (aspas, par�ntesis)</li>
			</ul>
		<p><span style="text-align:center; display: block;">Exemplo:<br />
			<img src="imagens/ajuda/pesquisa_oper_simp.png" alt="Operadores na pesquisa simplificada" title="Operadores na pesquisa simplificada"/></span>
			<br />
			Para mais exemplos de utiliza��o de operadores visite este s�tio web: 
			<a style="text-decoration:none" href="<%=sguiaUTILIZADOR%>/operadores" target="_blank" rel="noopener"><%=sguiaUTILIZADOR%>/operadores <img src="imagens/picactions/icon_url.svg" alt="Abrir em nova janela" title="Abrir em nova janela" height="15" width="15" style="vertical-align:middle" /></a>
		</p>
		<br style="clear:left;" />
		<br />
		<div class="destaquetexto">
			<h2><img src="imagens/pictitulos/pic_resultados_alt.svg" alt="Resultados" title="Resultados" height="60" width="60" style="vertical-align:middle" />D- Resultados de uma pesquisa</h2>
			<p>Ap�s fazer uma pesquisa obt�m os seus resultados com a indica��o das bibliotecas onde est�o dispon�veis <br />
				Para detalhes veja a linha "localiza��o" e carregue na sigla da biblioteca ou no sinal "+" <br />
				<span style="text-align:center; display: block;"><img src="imagens/ajuda/bib_identificar1.png" alt="Resultados de uma pesquisa" title="Resultados de uma pesquisa" /></span>
				<br />
				Como identificar a biblioteca onde requisitar o documento? <a style="text-decoration:none" href="ajuda_identificar.asp">Carregue aqui para saber como >>>.</a>
			</p>
		</div>
		<br style="clear:left;" />
		<div class="destaquetexto1">
			<p><img src="imagens/pictitulos/pic_questao_alt.svg" alt="D�vidas" title="D�vidas" height="22" width="22" style="vertical-align:middle" /> Em caso de d�vidas dirija-se � biblioteca mais pr�xima onde ter�o todo o gosto de o ajudar nas pesquisas e empr�stimos, mesmo que o documento n�o esteja nessa biblioteca.
				<br />Boas leituras!
			</p>
			<p>Mais informa��es sobre como pesquisar no cat�logo: <a style="text-decoration:none" href="<%=sguiaUTILIZADOR%>" target="_blank" rel="noopener"><%=sguiaUTILIZADOR%> <img src="imagens/picactions/icon_url.svg" alt="Abrir em nova janela" title="Abrir em nova janela" height="12" width="12" style="vertical-align:middle" /></a>
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
