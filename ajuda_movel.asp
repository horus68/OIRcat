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
	<title>Cat�logo no telem�vel - <%=stitulo%></title>
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
			<p class="fil">� <a href="default.asp">Entrada</a> � Ajuda: Usar no telem�vel </p>
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
		<h2><img src="imagens/pictitulos/pic_ajuda_alt.svg" alt="Utilizar o cat�logo coletivo em telem�veis" title="Utilizar o cat�logo coletivo em telem�veis" height="70" width="70" style="vertical-align:middle" /><br />Como utilizar o cat�logo em telem�veis?</h2>
		<div class="col1-contentor" style="width:100%">
			<div class="col1" style="min-width:50%;background-color:#f9f9ed;">
				<h3><img src="imagens/pictitulos/pic_movel_alt.svg" alt="Utiliza��o em telem�veis" title="Utiliza��o em telem�veis" height="50" width="50" style="vertical-align:middle" />No navegador Web e sem aplica��es</h3>
				<p>Pode utilizar o cat�logo no telem�vel com o seu navegador Web habitual, basta entrar no endere�o do cat�logo.
					<br />O cat�logo adapta-se ao seu ecr� e ter� as mesmas funcionalidades que num computador.
					<br /><span style="text-align:center; display: block;"><img src="imagens/ajuda/movel_entrada.png" alt="Cat�logo no telem�vel" title="Cat�logo no telem�vel"/></span>
					<br />Dica: Para encontrar mais facilmente a sua rede concelhia no Google pesquise por algo parecido com "cat�logo rede bibliotecas" + "nome do seu concelho"
				</p>
			</div>
			<div class="col1" style="min-width:50%">
				<h3><img src="imagens/pictitulos/pic_qrcode_alt.svg" alt="QR Code" title="QR Code" height="50" width="50" style="vertical-align:middle" />Entrar por QR Code</h3>
				<p>Escreva o endere�o no navegador ou capture a imagem com o leitor de QR Code do seu telem�vel.</p>
				<p>No seu telem�vel, abra a aplica��o de QR Code e aponte a c�mara para esta imagem:
					<br />
					<br />
					<span style="text-align:center; display: block;"><img src="imagens/app/qrcode.png" alt="Liga��o em QR Code para o cat�logo" title="Liga��o em QR Code para o cat�logo"/></span>
					<br />
					<br />- A aplica��o ir� ler o c�digo diretamente do ecr�.
					<br />Carregue no endere�o Web que aparece na aplica��o e entrar� no cat�logo.
				</p>
			</div>
					<br />
		</div>
		<br style="clear:left" />
				<h2><i>Tenha o cat�logo sempre � m�o... no telem�vel</i></h2>
		<div class="col1-contentor" style="width:100%">
			<div class="col1" style="min-width:60%">
				<h3><img src="imagens/pictitulos/pic_ecran_app_alt.svg" alt="Acesso direto no ecr�" title="Acesso direto no ecr�" height="50" width="50" style="vertical-align:middle" />Atalho no ecr� principal (tipo aplica��o)</h3>
				<p>Depois de abrir o endere�o, no navegador Web do telem�vel, pode carregar no menu principal do navegador e escolher "Adicionar ao ecr� principal".
					<br />Ser� criado um �cone especial no seu ecr� de entrada e ficar� com um acesso tipo App ao cat�logo.
				</p>
				<p>N�o � necess�rio instalar qualquer aplica��o mas funciona de forma semelhante!
				</p>
			</div>
			<div class="col1" style="min-width:40%">
					<img src="imagens/ajuda/movel_adicionar.png" alt="Menu do navegador Web" title="Adicionar ao ecr� principal do telem�vel" align="center"/>
			</div>
		</div>
		<br style="clear:left" />
		<div class="destaquetexto1">
			<h4 align="left"><img src="imagens/pictitulos/pic_questao_alt.svg" alt="D�vidas" title="D�vidas" height="22" width="22" style="vertical-align:middle" />D�vidas sobre utiliza��o em telem�veis?</h4>
			<p>Encontre respostas (e sugest�es de aplica��es QR Code) aqui: <a style="text-decoration:none" href="<%=sguiaUTILIZADOR%>/movel" target="_blank" rel="noopener"><%=sguiaUTILIZADOR%>/movel <img src="imagens/picactions/icon_url.svg" alt="Abrir em nova janela" title="Abrir em nova janela" height="15" width="15" style="vertical-align:middle" /></a>
			</p>
			<p>Em caso de d�vidas dirija-se � biblioteca mais pr�xima onde o podem ajudar nas pesquisas e empr�stimos.
				<br />Boas leituras!
			</p>
		</div>
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
