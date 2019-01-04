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
  sversao = ReadIniFile(Server.MapPath("cgi/cgi.ini"), "GERAL", "versao")
  surlRBE = ReadIniFile(Server.MapPath("cgi/cgi.ini"), "GERAL", "urlRBE")
  surlPORTAL = ReadIniFile(Server.MapPath("cgi/cgi.ini"), "GERAL", "urlPORTAL")
  sentidadelonga = ReadIniFile(Server.MapPath("cgi/cgi.ini"), "GERAL", "entidadelonga")
  stitulo = ReadIniFile(Server.MapPath("cgi/cgi.ini"), "PORTAL", "titulo")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml" xml:lang="pt-PT" lang="pt-PT">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="robots" content="index, follow" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>Catálogo - <%=stitulo%></title>
	<link rel="stylesheet" href="css/default.min.css?v=001" type="text/css" />
	<link rel="dns-prefetch" href="https://ajax.googleapis.com" />
	<link rel="dns-prefetch" href="https://www.google-analytics.com" />
	<link rel="dns-prefetch" href="https://cdnjs.cloudflare.com" />
	<link rel="dns-prefetch" href="//www.pesquisardocumentos.com" />
	<script defer="defer" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" crossorigin="anonymous"></script>
	<script defer="defer" type="text/javascript" src="js/geral.min.js"></script>
	<script type="text/javascript" src="js/jqueryRater/jquery.rater.min.js"></script>
	<meta name="description" content="Catálogo coletivo da Rede de Bibliotecas do Concelho - XXPTO - Pesquise os documentos no OPAC e saiba onde os pode requisitar. Ler, ver, sentir e viver" />
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
	<meta property="og:url" content="http://www.pesquisardocumentos.com/rbcatalogo/"/>
	<meta property="og:type" content="website"/>
	<meta property="og:site_name" content="Catálogo.XXPTO - Rede de bibliotecas - XXPTO"/>
	<meta property="og:locale" content="pt_PT"/>
	<!-- Dublin Core metadata -->
	<link rel="schema.DC" href="http://purl.org/dc/elements/1.1/" />
	<meta name="DC.Title" content="Catálogo RB XXPTO" />
	<meta name="DC.Creator" content="RB XXPTO" />
	<meta name="DC.Publisher" content="Projeto RedesConcelhias.RBE" />
	<meta name="DC.Subject" content="OPAC, catálogo, registo bibliográfico, biblioteca" />
	<meta name="DC.Description" content="Catálogo coletivo da Rede de Bibliotecas do Concelho. Pesquise os documentos e saiba onde os pode requisitar" />
	<meta name="DC.date.created" content="2018-07-20" />
	<meta name="DC.type" content="Dataset" />
	<meta name="DC.Format" content="text/html" />
	<meta name="DC.Source" content="Catálogos das bibliotecas integrantes da Rede Concelhia" />
	<meta name="DC.Language" content="pt-PT" />
	<meta name="DC.audience" content="leitores, bibliotecas, docentes, alunos" />
	<meta name="DC.coverage" content="Portugal" />
	<!-- Código Google Analytics - Global site tag (gtag.js) -->
	<script async="async" type="text/javascript" src="https://www.googletagmanager.com/gtag/js?id=UA-71820207-1" defer="defer"></script>
	<script type="text/javascript">window.dataLayer = window.dataLayer || [];  function gtag(){dataLayer.push(arguments);} gtag('js', new Date());  gtag('config', 'UA-71820207-1');</script>
	<!-- Registo de service works para móveis - Utilizar apenas em https
    <script type="text/javascript">
    if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('/rbcatalogo/sw.js');
    }
    </script> -->
</head>

<body>
	<div class="destaque1">
		<h1 style="font-variant: small-caps">Catálogo Coletivo<br />
			<%=sentidadelonga%>
		</h1>
	</div>
	<!-- Segmento Destaque Promo -->
	<div class="destaquepromo">
		<p align="center">Pesquise. Encontre. Contacte. Visite. Requisite. Leia. Sinta. Viva.</p>
	</div>
	<!-- Segmento Destaque Promo - FIM -->
	<!-- Segmento Alerta Manutenção -->
	<% if session("portal")="N" then %>
	<br />
	<h3 style="color:red">O catálogo encontra-se em MANUTENÇÃO.<br /> Retomaremos o serviço logo que possível...</h3>
	<%else %>
	<!-- Segmento Alerta Manutenção - FIM -->
	<!-- Segmento Navegação de topo autenticado - Reservas desativado -->
	<%if Session("LoggedIn") or session("LeitorIn") then %>
	<div class="navegatopo">
		<% if session("nuser")<>"" then %>
		<a href="javascript:void(0)" onclick="javascript:alterarPin()" rel="nofollow"><img src="imagens/pictitulos/nav_leitor.svg" alt="Alterar o meu PIN" title="Alterar o meu PIN" border="0" height="28" width="28"/></a>
		<% end if%>
		<!--
  <%if (session("user")<>"" and session("user")<>"ADMIN") or session("nuser")<>"" then %> <a href="javascript:void(0)" onclick="javascript:build_reservas(&quot;<%=session("user")%>&quot;,&quot;<%=session("nuser")%>&quot;)" rel="nofollow"><img src="imagens/setnav/nav_reservas.svg" alt="As minhas reservas" title="As minhas reservas" border="0" height="28" width="28"/></a><br />
  <% end if%>
-->
		<% if session("LoggedIn") then response.write "Utilizador: " &  DecodeUTF8(session("user"))%>
		<% if Session("LoggedIn") or session("LeitorIn") then %> [ <a href="logout.asp?sys=admin" rel="nofollow">Sair</a> ]
		<% end if%>
		<%if Session("LoggedIn") then %><br /><a href="admin/admin.asp" rel="nofollow"><img src="imagens/pictitulos/pic_administra.svg" alt="Administração" title="Administração" border="0" height="16" width="16"/>»Ir para zona de administração</a>
		<% end if%>
	</div>
	<% end if%>
	<!-- Segmento Navegação de topo autenticado FIM -->
	<!-- Segmento Pesquisas - Tipo -->
	<h2 style="font-variant: small-caps">Descubra o que temos para si!</h2>
	<div class="col1-contentor" style="text-align:center;">
		<div class="col1">
			<h4 style="font-variant: small-caps"><a href="catpesq.asp?id=0&amp;bd=col">Pesquisa simplificada</a></h4>
			<p><a href="catpesq.asp?id=0&amp;bd=col" alt="Pesquisa rápida" title="Pesquisa tudo"><img src="imagens/pictitulos/pic_pesqsimples.svg" alt="Pesquisa rápida" title="Pesquisa tudo" border="0" height="85" width="85"/></a>
				<br /> Rapidez. Basta escrever uma ou mais palavras
				<br />
				<i>(poderá procurar qualquer coisa em qualquer lado)</i></p>
		</div>
		<div class="col1">
			<h4 style="font-variant: small-caps"><a href="catpesq.asp?id=1&amp;bd=col">Pesquisa orientada</a></h4>
			<p><a href="catpesq.asp?id=1&amp;bd=col" alt="Pesquisa detalhada" title="Pesquisa com detalhe"><img src="imagens/pictitulos/pic_pesqorientada.svg" alt="Pesquisa detalhada" title="Pesquisa com detalhe" border="0" height="85" width="85"/></a>
				<br /> Exatidão. Para quando se sabe o que se pretende encontrar
				<br />
				<i>(poderá limitar a pesquisa a algumas bibliotecas ou áreas)</i></p>
		</div>
		<div class="col1">
			<h4 style="font-variant: small-caps"><a href="catindex.asp">Listas de termos</a></h4>
			<p><a href="catindex.asp" alt="Listagem de termos" title="Navega numa listagem"><img src="imagens/pictitulos/pic_pesqtermos.svg" alt="Listagem de termos" title="Navega numa listagem" border="0" height="85" width="85"/></a>
				<br /> Organização. Navegar no catálogo sem ter de escrever
				<br />
				<i>(poderá descobrir o que nem imagina que exista)</i></p>
		</div>
		<!--<% if ucase(session("user"))="ADMIN" or session("LeitorIn") then %>
    <div class="col1">
        <h4><a href="catpesq.asp?id=3&amp;bd=col" rel="nofollow">Etiquetas pessoais</a></h4>
        <p><a href="catpesq.asp?id=3&amp;bd=col" rel="nofollow"><img src="imagens/pictitulos/pic_pesqetiquetas.svg" alt="Etiquetas do leitor" title="Etiquetas pessoais" border="0" height="85" width="85"/></a>
            <br /> Etiquetas criadas pelos leitores
            <br /><i>(disponível apenas a leitores autenticados)</i></p>
  </div>
    </div><%end if%>-->
	</div>
	<!-- Segmento Pesquisas - Tipo - FIM -->
	<br />
	<!-- Segmento Top Títulos -->
	<div class="col-contentor">
		<div class="col" style="width:100%">
			<%
        if ubound(votos)>0 then 
    %>
			<fieldset style="margin:5px 5px 0 0;padding:5px">
				<legend>Top títulos</legend>
				<br />
				<table style="width:100%;font-size:0.9em">
					<% on error resume next
                s="":t="":u="":x=""
			    for i=1 to ubound(votos)-1 step 4
				criterio=replace(replace(votos(i),"^a",""),"^b","")

				strURL=strROOT & "/cgi/www.exe/[in=gettit.in]?base=rbcatalogo&expr=" & criterio   '& string(7 - Len(votos(i)),"0") & votos(i)
				strHTML=getUrl(strURL)

				if strHTML<>"" then
					tmp=split(strHTML,"£")
					
					if ubound(tmp)>2 then
						med=Clng(tmp(2))/Clng(tmp(3))
						s=s & med & "#":t=t & tmp(0) & "§":z=z & tmp(4) & "§"             'string(7 - Len(votos(i)),"0") & votos(i) & "," 
					end if
				end if
			     next
			     if s<>"" then
   
					v=split(s,"#"): t0=split(t,"§"): t3=split(z,"§")
					
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
	<!-- Segmento Top Títulos - FIM -->
	<!-- Segmento Extra -->
	<div class="destaquetexto1" style="text-align:center;">
		<p>O que pode <b>fazer</b> aqui? Pesquise <b>autores, assuntos e títulos de documentos</b> para ficar a saber os que existem nas <b>bibliotecas</b> deste <b>concelho</b>. 
			<br /><b>Contacte ou saiba como visitar</b> a biblioteca onde está o livro ou audiovisual que pretende <b>consultar</b>.
			<br />Conheça ainda as <b>atividades</b> das bibliotecas ao visitar o nosso <a style="text-decoration:none" href="<%=surlPORTAL%>" target="_blank">sítio oficial</a>.
		</p>
	</div>
	<!-- Segmento Extra FIM -->
	<br /><br />
	<!-- Segmento Ajuda -->
	<div class="col1-contentor" style="text-align:center;">
		<div class="col1" id="bordercol" style="border-width: 0px 3px 0px 0px;">
			<p class="fil" style="font-variant: small-caps"><a style="text-decoration:none" href="col.asp">
					<img src="imagens/pictitulos/pic_graficos.svg" alt="Análise da coleção" title="Gráficos e listagens" border="0" height="40" width="40"/>
					<br />Estatísticas - <b>Gráficos e listagens</b></a>
				<br />Listagens e gráficos para analisar o que existe no catálogo e como se distribui por bibliotecas
			</p>
		</div>
		<div class="col1" id="bordercol" style="border-width: 0px 3px 0px 2px;">
			<p class="fil" style="font-variant: small-caps"><a style="text-decoration:none" href="ajuda_dicas.asp">
					<img src="imagens/pictitulos/pic_ajuda.svg" alt="Dicas de pesquisa" title="Dicas de pesquisa" border="0" height="40" width="40"/>
					<br />Ajuda - <b>Dicas de pesquisa</b></a>
					<br />Como utilizar os diferentes tipos de pesquisa e pequenos truques para obter melhores resultados ao pesquisar documentos
			</p>
		</div>
		<div class="col1" id="bordercol" style="border-width: 0px 3px 0px 2px;">
			<p class="fil" style="font-variant: small-caps"><a style="text-decoration:none" href="ajuda_identificar.asp">
					<img src="imagens/pictitulos/pic_ajuda.svg" alt="Como identificar bibliotecas" title="Como identificar bibliotecas" border="0" height="40" width="40"/>
					<br />Ajuda - <b>Identificar bibliotecas</b></a>
					<br />Como saber qual a biblioteca que tem o documento pretendido e identificar no mapa a sua localização no mapa
			</p>
		</div>
		<div class="col1" id="bordercol" style="border-width: 0px 0px 0px 2px;">
			<p class="fil" style="font-variant: small-caps"><a style="text-decoration:none" href="ajuda_movel.asp">
					<img src="imagens/pictitulos/pic_ajuda.svg" alt="Como utilizar no telemóvel" title="Como utilizar no telemóvel" border="0" height="40" width="40"/>
					<br />Ajuda - <b>Catálogo no telemóvel</b></a>
					<br />Como aceder no telemóvel com o navegador ou com uma App sem instalação. Saiba como utilizar o acesso por QR Code
			</p>
		</div>
	</div>
	<!-- Segmento Ajuda FIM -->
	
	<!-- Segmento Móvel e Antiframe -->
	<div id="noprint">
		<br />
		<p align="center"><img src="imagens/pictitulos/pic_fixo_alt.svg" alt="Capturar QRCode" title="Capturar QRCode" border="0" height="32" width="32" align="absmiddle"/> <b><i>Está a ver no computador?</i></b><br />Abra no telemóvel capturando este QR Code:
			<br />
			<img src="imagens/app/qrcode.png" alt="Ligação em QR Code para o catálogo" title="Capture a imagem com o leitor de QR Code do seu telemóvel" border="0" align="middle"/>
			<br /> Nota: depois de abrir o endereço, no menu de opções do navegador Web do telemóvel,
			<br /> pode escolher "Adicionar ao ecrã principal" e passará a ter uma App no seu telemóvel para acesso rápido ao catálogo (ver <a href="ajuda_movel.asp">ajuda aqui</a>).</p>
		<br />
		<p align="center"><img src="imagens/pictitulos/pic_movel_alt.svg" alt="Abrir numa janela a toda a largura" title="Abrir numa janela a toda a largura" border="0" height="32" width="32" align="absmiddle"/> <b><i>Está a ver no telemóvel ou numa janela pequena?</i></b>
			<br />
			<a href="default.asp" target="_blank" rel="noopener">
				<button type="button" class="botao botao5" style="width:50%;">Carregue aqui para abrir numa janela a toda a largura</button>
			</a>
		</p>
			<br />
	</div>
	<!-- Segmento Móvel e Antiframe - FIM -->
	<!-- Segmento Logótipo -->
	<div class="col2-contentor">
		<div class="col2">
			<p class="rodape" align="center" style="font-variant: small-caps"><a style="text-decoration:none" href="creditos.asp">Infos e créditos do Catálogo Coletivo:<br />
						<img src="imagens/pictitulos/pic_info.svg" alt="Informações técnicas e créditos do catálogo" title="Informações técnicas e créditos do catálogo" border="0" height="20" width="20" align="absmiddle"/> <b><%=sentidadelonga%></b></a></p>
		</div>
		<div class="col2">
			<p class="rodape" align="center">
				<a style="text-decoration:none" href="creditos.asp"><img src="imagens/logotipo.png" alt="Logótipo da Rede" title="Logótipo da Rede" align="middle" hspace="3"/></a>
			</p>
		</div>
		<div class="col2">
			<p class="rodape" align="center" style="font-variant: small-caps"><a style="text-decoration:none" href="<%=surlPORTAL%>" target="_blank">Sítio de notícias e atividades da Rede:<br />
						<img src="imagens/pictitulos/pic_web.svg" alt="Sítio oficial e notícias das bibliotecas" title="Sítio oficial e notícias das bibliotecas" border="0" height="20" width="20" align="absmiddle"/> <b><%=sentidadelonga%></b></a></p>
		</div>
	</div>
	<!-- Segmento Logótipo - FIM -->
	<!-- AddToAny - Local de exibição dos botões de partilha -->
	<div align="center" class="a2a_kit a2a_kit_size_32 a2a_default_style">
		<a class="a2a_dd" href="https://www.addtoany.com/share"></a>
		<a class="a2a_button_facebook"></a>
		<a class="a2a_button_twitter"></a>
		<a class="a2a_button_google_plus"></a>
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
	<!-- AddToAny - Local de exibição dos botões de partilha - FIM -->
	<br />
	<!-- Segmento Autenticação Principal - Reservas e leitores desativados -->
	<div class="navega">
		<% if session("nuser")<>"" then %><a href="javascript:void(0)" onclick="javascript:alterarPin()" rel="nofollow">
		<img src="imagens/pictitulos/nav_leitor.svg" alt="Alterar o meu PIN" title="Alterar o meu PIN" border="0" height="28" width="28"/></a>
		<% end if%>
		<!--
    <%if (session("user")<>"" and session("user")<>"ADMIN") or session("nuser")<>"" then %> 
    <a href="javascript:void(0)" onclick="javascript:build_reservas(&quot;<%=session("user")%>&quot;,&quot;<%=session("nuser")%>&quot;)" rel="nofollow">
    <img src="imagens/setnav/nav_reservas.svg" alt="As minhas reservas" title="As minhas reservas" border="0" height="28" width="28"/></a><%end if%>
-->
	</div>
	<div class="navega">
		<p>»
			<% if session("user")="" then response.write "<b>Área reservada:</b> " else response.write "Utilizador: " &  DecodeUTF8(session("user"))%>
			<%if Session("LoggedIn") or session("LeitorIn") then%> [ <a href="logout.asp?sys=admin" rel="nofollow">Sair</a> ]
			<%else%> &nbsp;
			<!--
     <a href="javascript:void(0)" onClick="window.open('admin/logleitor.asp','login','width=420,height=320,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,copyhistory=no,resizable=no')" rel="nofollow">Leitores</a>
-->
			&nbsp;<a href="admin/admin.asp" rel="nofollow">Autenticar</a>
			<%end if%>
			<br />
			<%if Session("LoggedIn") then %> » <a href="admin/admin.asp" rel="nofollow"> Ir para zona de administração</a>
			<% end if%>
		</p>
	</div>
	<!-- Segmento Autenticação Principal - FIM -->
	<!-- Software: <%=sversao%> - <%=surlRBE%> -->
	<!-- Fecho de código da aplicação -->
	<% end if%>
	<!-- Fecho de código da aplicação FIM -->
	<!-- Cookie Consent script cookieconsent.insites.com - Início -->
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
					"message": "O uso de Cookies neste sítio destina-se apenas a uma melhor experiência de utilização. Não são recolhidos dados pessoais.",
					"dismiss": "Ok, compreendi!",
					"link": "Mais detalhes",
					"href": "https://sites.google.com/view/opacrbe/utilizadores"
				}
			})
		});

	</script>
	<noscript><a href="https://sites.google.com/view/opacrbe/utilizadores" target="_blank" rel="noopener">Código para consentimento de Cookies</a></noscript>
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
