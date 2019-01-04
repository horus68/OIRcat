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
	<title>Identificar bibliotecas - <%=stitulo%></title>
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
			<p class="fil">� <a href="default.asp">Entrada</a> � Ajuda: Identificar e localizar bibliotecas </p>
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
		<h2><img src="imagens/pictitulos/pic_ajuda_alt.svg" alt="Localizar o documento" title="Localizar o documento" height="70" width="70" style="vertical-align:middle" /><br />Como saber a que Biblioteca pertence um documento?</h2>
		<p>Em cada resultado de pesquisa surge uma indica��o de qual a biblioteca onde se encontra o documento, os contactos e morada da biblioteca bem como a localiza��o no mapa.</p>
		<p>Como � que pode chegar at� l�? Comece por pesquisar o que procura. Ao fazer uma pesquisa obt�m os seus resultados, sob a forma de registos bibliogr�ficos.
			<br /><span style="text-align:center; display: block;"><img src="imagens/ajuda/pesquisa_simplificada.png" alt="Pesquisa simplificada" title="Pesquisa simplificada"/></span>
		</p>
			<dl>
				<dt>Para ver a indica��o das bibliotecas onde pode consultar esses documentos veja a linha "Localiza��o" e carregue na sigla da biblioteca ou no sinal "+"</dt>
				<dd>Todos os resultados t�m uma indica��o de "Localiza��o" onde surgem as siglas das v�rias bibliotecas.</dd>
				<dd>Como se trata de um cat�logo coletivo v�o aparecer v�rias siglas de acordo com os v�rios exemplares existentes no cat�logo.</dd>
				<dd>Clicando na sigla (ou no sinal +) surge uma informa��o detalhada sobre a Biblioteca onde est� aquele documento.</dd>
			</dl>
			<span style="text-align:center; display: block;"><img src="imagens/ajuda/bib_identificar1.png" alt="Resultado da pesquisa" title="Resultado da pesquisa"/></span>
		<div class="destaquetexto">
			<h2><img src="imagens/pictitulos/pic_mapas_alt.svg" alt="Ver no mapa" title="Ver no mapa" height="60" width="60" style="vertical-align:middle" />Como chegar � biblioteca?</h2>
			<p>Para saber como chegar � biblioteca pode carregar no �cone do carro/percurso para que se abra uma janela com o mapa de localiza��o.
				<br />
				<span style="text-align:center; display: block;"><img src="imagens/ajuda/bib_identificar2.png" alt="Resultado da pesquisa" title="Resultado da pesquisa"/></span>
				<br /> Na p�gina inicial do cat�logo pode ainda consultar os contactos das bibliotecas, clicando na hiperliga��o "Contactos das Bibliotecas".
			</p>
		</div>
		<br />
		<p><img src="imagens/pictitulos/pic_questao_alt.svg" alt="D�vidas" title="D�vidas" height="32" width="32" style="vertical-align:middle" />Em caso de d�vidas dirija-se � biblioteca mais pr�xima onde o podem ajudar nas pesquisas e empr�stimos.
			<br />Boas leituras!
		</p>
		<div align="center" style="clear:both" class="txtvoltar">
			<a style="text-decoration:none" href="default.asp">
				<input type="button" name="bt2" value="Voltar" class="botao botao5" ;>
			</a>
		</div>
	</div>
	<br />
	<br />
</body>

</html>
