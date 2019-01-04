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
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>Cat�logo - <%=sentidadelonga%></title>
	<link rel="stylesheet" href="css/default.min.css?v=001" type="text/css" />
	<link rel="dns-prefetch" href="https://ajax.googleapis.com" />
	<link rel="dns-prefetch" href="https://www.google-analytics.com" />
	<link rel="dns-prefetch" href="https://cdnjs.cloudflare.com" />
	<link rel="dns-prefetch" href="<%=surlOPACdominio%>" />
	<link rel="canonical" href="<%=surlOPAC%>" />
	<script defer="defer" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" crossorigin="anonymous"></script>
	<script defer="defer" type="text/javascript" src="js/geral.min.js"></script>
	<script type="text/javascript" src="js/jqueryRater/jquery.rater.min.js"></script>
	<meta name="description" content="<%=sdescription%>" />
	<meta name="keywords" content="<%=skeywords%>" />
	<meta name="author" content="<%=sentidadelonga%>" />
	<meta name="copyright" content="Copyright (c) 2005-2019 RBE (Projeto RedesConcelhias.RBE) - Direitos reservados. Ver license_info.txt" />
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
	<!-- Dublin Core metadata -->
	<link rel="schema.DC" href="http://purl.org/dc/elements/1.1/" />
	<meta name="DC.Title" content="Cat�logo <%=stitulo%>" />
	<meta name="DC.Creator" content="<%=stitulo%>" />
	<meta name="DC.Publisher" content="<%=sprojetoRBE%>" />
	<meta name="DC.Subject" content="<%=skeywords%>" />
	<meta name="DC.Description" content="<%=sOGdescription%>" />
	<meta name="DC.date.created" content="2019-01-02" />
	<meta name="DC.type" content="Dataset" />
	<meta name="DC.Format" content="text/html" />
	<meta name="DC.Source" content="Cat�logos das bibliotecas integrantes da Rede Concelhia" />
	<meta name="DC.Language" content="pt-PT" />
	<meta name="DC.audience" content="leitores, bibliotecas, docentes, alunos, professores" />
	<meta name="DC.coverage" content="Portugal" />
	<!-- Twitter Meta Tags -->
	<meta name="twitter:card" content="summary_large_image" />
	<meta name="twitter:title" content="<%=sOGtitle%>" />
	<meta name="twitter:description" content="<%=sOGdescription%>" />
	<meta name="twitter:image" content="<%=sOGimage%>" />
	<meta name="twitter:url" content="<%=surlOPAC%>" />
	<!-- C�digo Google Analytics - Global site tag (gtag.js) -->
	<script async="async" type="text/javascript" src="https://www.googletagmanager.com/gtag/js?id=UA-71820207-1" defer="defer"></script>
	<script type="text/javascript">window.dataLayer = window.dataLayer || [];  function gtag(){dataLayer.push(arguments);} gtag('js', new Date());  gtag('config', 'UA-71820207-1');</script>
	<!-- Registo de service works para m�veis - Utilizar apenas em https
    <script type="text/javascript">
    if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('/<%=spastaOPAC%>/sw.js');
    }
    </script> -->
</head>

<body>
	<div id="header" role="banner" aria-label="T�tulo">
		<div class="destaque1">
			<h1 style="font-variant: small-caps">Cat�logo Coletivo<br /><%=sentidadelonga%></h1>
		</div>
		<!-- Segmento Destaque Promo -->
		<div class="destaquepromo">
			<p align="center">Pesquise. Encontre. Contacte. Visite. Requisite. Leia. Sinta. Viva.</p>
		</div>
		<!-- Segmento Destaque Promo - FIM -->
		<!-- Segmento Alerta Manuten��o -->
		<% if session("portal")="N" then %>
		<br />
		<h3 style="color:red">O cat�logo encontra-se em MANUTEN��O.<br /> Retomaremos o servi�o logo que poss�vel...</h3>
		<%else %>
		<!-- Segmento Alerta Manuten��o - FIM -->
		<!-- Segmento Navega��o de topo autenticado - Reservas desativado -->
		<%if Session("LoggedIn") or session("LeitorIn") then %>
		<div class="navegatopo">
			<% if session("nuser")<>"" then %>
			<a href="javascript:void(0)" onclick="javascript:alterarPin()" title="Alterar PIN" rel="nofollow"><img src="imagens/setnav/nav_leitor.svg" alt="Alterar o meu PIN" title="Alterar o meu PIN" height="28" width="28" /></a>
			<% end if%>
			<!-- Reservas
		<%if (session("user")<>"" and session("user")<>"ADMIN") or session("nuser")<>"" then %> <a href="javascript:void(0)" onclick="javascript:build_reservas(&quot;<%=session("user")%>&quot;,&quot;<%=session("nuser")%>&quot;)" title="Reservas" rel="nofollow"><img src="imagens/setnav/nav_reservas.svg" alt="As minhas reservas" title="As minhas reservas" height="28" width="28"/></a><br />
		<% end if%>
		-->
			<% if session("LoggedIn") then response.write "Utilizador: " &  DecodeUTF8(session("user"))%>
			<% if Session("LoggedIn") or session("LeitorIn") then %> [ <a href="logout.asp?sys=admin" title="Terminar sess�o" rel="nofollow">Sair</a> ]
			<% end if%>
			<%if Session("LoggedIn") then %><br /><a href="admin/admin.asp" title="Administra��o" rel="nofollow"><img src="imagens/pictitulos/pic_administra.svg" title="Administra��o" height="16" width="16" />�Ir para zona de administra��o</a>
			<% end if%>
		</div>
		<% end if%>
	</div>
	<!-- Segmento Navega��o de topo autenticado FIM -->
	<!-- Segmento Pesquisas - Tipo -->
	<div id="nav" role="navigation" aria-label="Pesquisa">
		<h2 style="font-variant: small-caps">Descubra os documentos que temos para si!</h2>
		<div class="col1-contentor" style="text-align:center;">
			<div class="col1">
				<h4 style="font-variant: small-caps"><a href="catpesq.asp?id=0&amp;bd=col" title="Pesquisa tudo">Pesquisa simplificada</a></h4>
				<p><a href="catpesq.asp?id=0&amp;bd=col" title="Pesquisa tudo" role="search" aria-label="Simplificada"><img src="imagens/pictitulos/pic_pesqsimples.svg" alt="Pesquisa r�pida" title="Pesquisa tudo" height="85" width="85" /></a>
					<br /> Rapidez. Basta escrever uma ou mais palavras
					<br />
					<i>(poder� encontrar qualquer coisa em qualquer lado)</i></p>
			</div>
			<div class="col1">
				<h4 style="font-variant: small-caps"><a href="catpesq.asp?id=1&amp;bd=col" title="Pesquisa com detalhe">Pesquisa orientada</a></h4>
				<p><a href="catpesq.asp?id=1&amp;bd=col" title="Pesquisa com detalhe" role="search" aria-label="Orientada"><img src="imagens/pictitulos/pic_pesqorientada.svg" alt="Pesquisa detalhada" title="Pesquisa com detalhe" height="85" width="85" /></a>
					<br /> Exatid�o. Para quando se sabe o que se pretende encontrar
					<br />
					<i>(poder� limitar a pesquisa a algumas bibliotecas ou �reas)</i></p>
			</div>
			<div class="col1">
				<h4 style="font-variant: small-caps"><a href="catindex.asp" title="Navega numa listagem">Listas de termos</a></h4>
				<p><a href="catindex.asp" title="Navega numa listagem" role="search" aria-label="Lista termos"><img src="imagens/pictitulos/pic_pesqtermos.svg" alt="Listagem de termos" title="Navega numa listagem" height="85" width="85" /></a>
					<br /> Organiza��o. Navegar no cat�logo sem ter de escrever
					<br />
					<i>(poder� descobrir o que nem imagina que exista)</i></p>
			</div>
			<!--<% if ucase(session("user"))="ADMIN" or session("LeitorIn") then %>
		<div class="col1">
			<h4><a href="catpesq.asp?id=3&amp;bd=col" rel="nofollow" title="Etiquetas pessoais">Etiquetas pessoais</a></h4>
			<p><a href="catpesq.asp?id=3&amp;bd=col" rel="nofollow" title="Etiquetas pessoais" role="search" aria-label="Etiquetas"><img src="imagens/pictitulos/pic_pesqetiquetas.svg" alt="Etiquetas do leitor" title="Etiquetas pessoais" height="85" width="85"/></a>
				<br /> Etiquetas criadas pelos leitores
				<br /><i>(dispon�vel apenas a leitores autenticados)</i></p>
		</div><%end if%>-->
		</div>
	</div>
	<!-- Segmento Pesquisas - Tipo - FIM -->
	<br />
	<!-- Segmento Top T�tulos -->
	<div id="content" role="complementary" aria-label="Tops">
		<div class="col-contentor">
			<div class="col" style="width:100%">
				<%
        if ubound(votos)>0 then 
    %>
				<fieldset style="margin:5px 5px 0 0;padding:5px">
					<legend>Top t�tulos</legend>
					<br />
					<table style="width:100%;font-size:0.9em">
						<% on error resume next
                s="":t="":u="":x=""
			    for i=1 to ubound(votos)-1 step 4
				criterio=replace(replace(votos(i),"^a",""),"^b","")

				strURL=strROOT & "/cgi/www.exe/[in=gettit.in]?base=rbcatalogo&expr=" & criterio   '& string(7 - Len(votos(i)),"0") & votos(i)
				strHTML=getUrl(strURL)

				if strHTML<>"" then
					tmp=split(strHTML,"�")
					
					if ubound(tmp)>2 then
						med=Clng(tmp(2))/Clng(tmp(3))
						s=s & med & "#":t=t & tmp(0) & "�":z=z & tmp(4) & "�"             'string(7 - Len(votos(i)),"0") & votos(i) & "," 
					end if
				end if
			     next
			     if s<>"" then
   
					v=split(s,"#"): t0=split(t,"�"): t3=split(z,"�")
					
					sortArrayD v, t0, t3
					if session("user")="" then us="guest" else us=session("user") 
					limite=4
					if ubound(v)<5 then limite=ubound(v)-1
					for i=0 to limite
					 response.write "<tr><td width=""70%"" align=""left""><a style=""text-decoration:none"" href=""/rbcatalogo/cgi/www.exe/[in=pesqger.in]?base=rbcatalogo&expressao="+t3(i)+"&limites=25&lim_inicio=1&formato=wiusr&id=0&nomenu=catpesq.asp&ut="& us & "&nut=" &session("nuser") &""">" &replace(replace(t0(i),"<",""),">","") &"</a></td><td width=""30"" align=""left""><span class=""ui-rater""><span class=""ui-rater-starsOff"" style=""width:90px;""><span class=""ui-rater-starsOn"" style=""width:"&round(v(i)*18,0)&"px""></span></span></span> (" & round(v(i),1) & ") </td></tr>"   '<td> votos:" & string(4 - Len(t2(i)),chr(160)) & t2(i) &"</td>'
					next
			     end if
			     on error goto 0
			 %>
					</table>
					<br />
				</fieldset>
				<% end if %>
			</div>
			<div class="col" style="width:0%">
			</div>
		</div>
	</div>
	<!-- Segmento Top T�tulos - FIM -->
	<!-- Segmento Extra -->
	<div id="section" role="main" aria-label="Destaque">
		<div class="destaquetexto1" style="text-align:center;">
			<p>O que pode <b>fazer</b> aqui? Pesquise por <b>autores, assuntos ou t�tulos de documentos</b> para ficar a saber os que existem nas <b>bibliotecas</b> deste <b>concelho</b>.
				<br /><b>Contacte ou saiba como visitar</b> a biblioteca onde est� o livro ou audiovisual que pretende <b>consultar</b>.
				<br />Conhe�a ainda as <b>atividades</b> das bibliotecas ao visitar o nosso <a style="text-decoration:none" href="<%=surlPORTAL%>" target="_blank" rel="noopener">s�tio oficial</a>.
			</p>
		</div>
	</div>
	<!-- Segmento Extra FIM -->
	<br /><br />
	<!-- Segmento Ajuda -->
	<div id="content" role="complementary" aria-label="Ajuda">
		<div class="col1-contentor" style="text-align:center;">
			<div class="col1" id="bordercol" style="border-width: 0px 3px 0px 0px;">
				<p class="fil" style="font-variant: small-caps"><a style="text-decoration:none" href="col.asp">
						<img src="imagens/pictitulos/pic_graficos.svg" alt="An�lise da cole��o" title="Gr�ficos e listagens" height="40" width="40" />
						<br />Estat�sticas - <b>Gr�ficos e listagens</b></a>
					<br />Listagens e gr�ficos para analisar o que existe no cat�logo e como se distribui por bibliotecas
				</p>
			</div>
			<div class="col1" id="bordercol" style="border-width: 0px 3px 0px 2px;">
				<p class="fil" style="font-variant: small-caps"><a style="text-decoration:none" href="ajuda_dicas.asp">
						<img src="imagens/pictitulos/pic_ajuda.svg" alt="Dicas de pesquisa" title="Dicas de pesquisa" height="40" width="40" />
						<br />Ajuda - <b>Dicas de pesquisa</b></a>
					<br />Como utilizar os diferentes tipos de pesquisa e pequenos truques para obter melhores resultados ao pesquisar documentos
				</p>
			</div>
			<div class="col1" id="bordercol" style="border-width: 0px 3px 0px 2px;">
				<p class="fil" style="font-variant: small-caps"><a style="text-decoration:none" href="ajuda_identificar.asp">
						<img src="imagens/pictitulos/pic_ajuda.svg" alt="Como identificar bibliotecas" title="Como identificar bibliotecas" height="40" width="40" />
						<br />Ajuda - <b>Identificar bibliotecas</b></a>
					<br />Como saber qual a biblioteca que tem o documento pretendido e identificar a sua localiza��o no mapa
				</p>
			</div>
			<div class="col1" id="bordercol" style="border-width: 0px 0px 0px 2px;">
				<p class="fil" style="font-variant: small-caps"><a style="text-decoration:none" href="ajuda_movel.asp">
						<img src="imagens/pictitulos/pic_ajuda.svg" alt="Como utilizar no telem�vel" title="Como utilizar no telem�vel" height="40" width="40" />
						<br />Ajuda - <b>Cat�logo no telem�vel</b></a>
					<br />Como aceder no telem�vel com o navegador ou com uma App sem instala��o. Saiba como utilizar o acesso por QR Code
				</p>
			</div>
		</div>
	</div>
	<!-- Segmento Ajuda FIM -->
	<!-- Segmento Log�tipo -->
	<div id="noprint">
		<div id="figure" role="contentinfo" aria-label="Logo">
			<p class="rodape" align="center">
				<a style="text-decoration:none" href="creditos.asp"><img src="<%=simglogo%>" alt="Log�tipo da Rede" title="Log�tipo da Rede" style="vertical-align:middle" hspace="3" /></a>
			</p>
		</div>
		<!-- Segmento Log�tipo FIM -->
		<!-- Segmento Infos e M�vel -->
		<div id="footer" role="contentinfo" aria-label="Infos">
			<div class="col5-contentor" style="width:100%">
				<div class="col5" style="min-width: 40%">
					<p class="rodape" style="font-variant: small-caps; text-align: center"><img src="imagens/pictitulos/pic_movel_alt.svg" alt="Abrir numa janela a toda a largura" title="Abrir numa janela a toda a largura" height="32" width="32" style="vertical-align:middle" /> <b><i>Est� a ver no telem�vel?</i></b>
					</p>
					<p><b>Usar como uma App?</b>
						<br />
						No menu de op��es do navegador Web do telem�vel escolha "Adicionar ao ecr� principal".
						<br />
						Passar� a ter uma aplica��o com acesso direto ao cat�logo (ver <a href="ajuda_movel.asp" title="Utiliza��o em telem�veis">ajuda aqui</a>).
					</p>
					<p><b>Est� numa janela pequena ou dentro de outro s�tio?</b>
						<br />
						<a href="default.asp" title="Janela a toda a largura" target="_blank" rel="noopener">
							<button type="button" class="botao botao5" style="width:90%;">Carregue aqui para abrir numa nova janela a toda a largura</button>
						</a>
					</p>
				</div>
				<div class="col5" style="min-width:30%">
					<p class="rodape" style="font-variant: small-caps; text-align: center"><img src="imagens/pictitulos/pic_fixo_alt.svg" alt="Capturar QR Code" title="Capturar QR Code" height="32" width="32" style="vertical-align:middle" /> <b><i>Est� a ver no computador?</i></b>
					</p>
					<p style="text-align: center">Abra no telem�vel capturando este QR Code:
						<br />
						<img src="imagens/app/qrcode.png" alt="Liga��o em QR Code para o cat�logo" title="Capture a imagem com o leitor de QR Code do seu telem�vel" style="vertical-align:middle" />
						<br />
						Sem leitor de QR Code? Ver <a href="ajuda_movel.asp" title="Utiliza��o em telem�veis">ajuda aqui</a>
					</p>
				</div>
				<div class="col5" style="min-width:30%">
					<br /><br />
					<p class="rodape" style="font-variant: small-caps; text-align: center"><a style="text-decoration:none" href="creditos.asp">Informa��es e cr�ditos do cat�logo:
							<br />
							<img src="imagens/pictitulos/pic_info.svg" alt="Informa��es t�cnicas e cr�ditos do cat�logo" title="Informa��es t�cnicas e cr�ditos do cat�logo" height="20" width="20" style="vertical-align:middle" /> <b>Sobre o cat�logo coletivo</b></a>
					</p>
					<br /><br />
					<p class="rodape" align="center" style="font-variant: small-caps"><a style="text-decoration:none" href="<%=surlPORTAL%>" target="_blank" rel="noopener">Atividades da Rede (s�tio oficial):<br />
							<img src="imagens/pictitulos/pic_web.svg" alt="S�tio oficial e not�cias das bibliotecas" title="S�tio oficial e not�cias das bibliotecas" height="20" width="20" style="vertical-align:middle" /> <b><%=sentidadelonga%></b></a></p>
				</div>
			</div>
		</div>
		<!-- Segmento Infos e M�vel - FIM -->
		<div id="aside" role="form" aria-label="Social">
			<!-- AddToAny - Local de exibi��o dos bot�es de partilha -->
			<div align="center" class="a2a_kit a2a_kit_size_32 a2a_default_style">
				<a class="a2a_dd" href="https://www.addtoany.com/share"></a>
				<a class="a2a_button_facebook"></a>
				<a class="a2a_button_twitter"></a>
				<a class="a2a_button_blogger"></a>
				<a class="a2a_button_diigo"></a>
				<a class="a2a_button_evernote"></a>
			</div>
			<script type="text/javascript">
				var a2a_config = a2a_config || {};
				a2a_config.icon_color = "grey";
				a2a_config.onclick = 1;
				a2a_config.locale = "pt-PT";

			</script>
			<script async="async" type="text/javascript" src="https://static.addtoany.com/menu/page.js"></script>
		</div>
		<!-- AddToAny - Local de exibi��o dos bot�es de partilha - FIM -->
		<br />
		<!-- Segmento Autentica��o Principal - Reservas e leitores desativados -->
		<div id="form" role="form" aria-label="Gerir">
			<div class="navega">
				<% if session("nuser")<>"" then %><a href="javascript:void(0)" onclick="javascript:alterarPin()" title="Alterar PIN" rel="nofollow">
					<img src="imagens/setnav/nav_leitor.svg" alt="Alterar o meu PIN" title="Alterar o meu PIN" height="28" width="28" /></a>
				<% end if%>
				<!-- Reservas 
		<%if (session("user")<>"" and session("user")<>"ADMIN") or session("nuser")<>"" then %> 
		<a href="javascript:void(0)" onclick="javascript:build_reservas(&quot;<%=session("user")%>&quot;,&quot;<%=session("nuser")%>&quot;)" title="Reservas" rel="nofollow">
		<img src="imagens/setnav/nav_reservas.svg" alt="As minhas reservas" title="As minhas reservas" height="28" width="28"/></a><%end if%>
		-->
			</div>
			<div class="navega">
				<p>�
					<% if session("user")="" then response.write "<b>�rea reservada:</b> " else response.write "Utilizador: " &  DecodeUTF8(session("user"))%>
					<%if Session("LoggedIn") or session("LeitorIn") then%> [ <a href="logout.asp?sys=admin" title="Terminar sess�o" rel="nofollow">Sair</a> ]
					<%else%> &nbsp;
					<!-- Leitores
			<a href="javascript:void(0)" onClick="window.open('admin/logleitor.asp','login','width=420,height=320,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,copyhistory=no,resizable=no')" title="Entrada de leitores" rel="nofollow">Leitores</a>
			 -->
					&nbsp;<a href="admin/admin.asp" title="Entrada bibliotecas" rel="nofollow">Autenticar</a>
					<%end if%>
					<br />
					<%if Session("LoggedIn") then %> � <a href="admin/admin.asp" title="Administra��o" rel="nofollow"> Ir para zona de administra��o</a>
					<% end if%>
				</p>
			</div>
		</div>
	</div>
	<!-- Segmento Autentica��o Principal - FIM -->
	<!-- Software: <%=sversao%> - <%=surlRBE%> -->
	<!-- Fecho de c�digo da aplica��o -->
	<% end if%>
	<!-- Fecho de c�digo da aplica��o FIM -->
	<!-- Cookie Consent script cookieconsent.insites.com - In�cio -->
	<script defer="defer" type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/cookieconsent2/3.1.0/cookieconsent.min.js"></script>
	<script type="text/javascript">
		window.addEventListener("load", function() {
			window.cookieconsent.initialise({
				"palette": {
					"popup": {
						"background": "#285E6C",
						"text": "#ffffff"
					},
					"button": {
						"background": "#62ffaa"
					}
				},
				"theme": "classic",
				"position": "bottom-left",
				"content": {
					"message": "O uso de Cookies neste s�tio destina-se apenas a uma melhor experi�ncia de utiliza��o. N�o s�o recolhidos dados pessoais.",
					"dismiss": "Ok, compreendi!",
					"link": "Mais detalhes",
					"href": "<%=sguiaTEC%>/utilizadores"
				}
			})
		});

	</script>
	<noscript><a href="<%=sguiaTEC%>/utilizadores" target="_blank" rel="noopener">C�digo para consentimento de Cookies</a></noscript>
	<!-- Cookie Consent script - FIM -->
</body>

</html>
<%sub sortArrayD(byref arrShort, byref t0, byref t3)

    for i = UBound(arrShort) - 1 To 0 Step -1
        for j= 0 to i
            if arrShort(j)<arrShort(j+1) then
                temp=arrShort(j+1)
				tmp0=t0(j+1)
				
				tmp3=t3(j+1)
                arrShort(j+1)=arrShort(j)
				t0(j+1)=t0(j)
				
				t3(j+1)=t3(j)
                arrShort(j)=temp
				t0(j)=tmp0
				
				t3(j)=tmp3
            end if
        next
    next
 
end sub%>
