<!--#include file="admin/config.asp"-->
<!--#include file="admin/functions.asp"-->
<% base= request("base") 
   if base="" then base="rbcatalogo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml" xml:lang="pt-PT" lang="pt-PT">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="robots" content="index, follow" />
	<title>Navegar por termos - <%=sentidadelonga%></title>
	<link rel="stylesheet" href="css/default.min.css?version=001" type="text/css" />
	<script language="JavaScript" src="js/geral.min.js"></script>
	<link rel="dns-prefetch" href="https://www.google-analytics.com" />
	<link rel="dns-prefetch" href="https://ajax.googleapis.com" />
	<link rel="dns-prefetch" href="https://cdnjs.cloudflare.com" />
	<link rel="dns-prefetch" href="<%=surlOPACdominio%>" />
	<script defer="defer" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" crossorigin="anonymous"></script>
	<script language="JavaScript" type="text/javascript">
		var tabs = new Array(26);
		for(i=0;i<26;i++) tabs[i]='tab'+(i+1);
		var letra="";
		var nval=1;

		function ChkLinkHref(tipo,formato,linha_in) {
			var dim=0;
			var tmp="",car="";
			tmp=ConvUp(linha_in);
			tmp=FindRepChar(unescape(tmp),"`","\"");
			var param="/<%=spastaOPAC%>/cgi/www.exe/[in=pesqger.in]?ut=<% if session("Nome")="" then response.write "guest" else response.write session("Nome") end if%>&base=<%=base %>&nomemnu=catindex.asp&formato="+formato+"&lim_inicio=1&limites=100&id=3";
			param+="&letra="+letra+"&user=<%=session("Nome")%>&expressao=";
			dim=tmp.length;
			car=tmp.charAt(dim-1);

			if (tipo=="1" && car==")") tmp=tmp.substring(0,dim-1);

			if (tipo=="3") tmp=TrataCDU(tmp);
			return(param + ChkChars_2(LimpaMais(tmp)));
		}

		function mudaPainel() {
			showPanel(nval,letra,false);
		}

	</script>
	<script language="JavaScript" type="text/javascript">
		function getXmlHttpRequestObject() {
			if (window.XMLHttpRequest) {
				return new XMLHttpRequest(); //Not IE
			} else if (window.ActiveXObject) {
				return new ActiveXObject("Microsoft.XMLHTTP"); //IE
			} else {

				alert("O seu navegador não suporta o objecto XmlHttpRequest.");
			}
		}

		var receiveReq = getXmlHttpRequestObject();

		function showPanel(n,stermo,op) {


			var express=document.getElementById("termo").value.toUpperCase();
			var p=express.charCodeAt(0)-64;
			if (op && n!=p) express="";
			letra= express =="" ? stermo.charAt(0): express.charAt(0);
			stermo= express =="" ? stermo : express;

			nval= express=="" ? n: p;
			for(i = 0; i < 26; i++) {
				document.getElementById(tabs[i]).className=(nval-1 == i) ? 'tab_sel':'tab';
			}
			for (i=0;i<5;i++)
				if (document.getElementById("PRFX").options[i].selected) {
					sprefix=document.getElementById("PRFX").options[i].value;
					break;
				}

			document.getElementById('panel_a').innerHTML="<span style=\"position:relative;left:50%;top:40%;\"><img  src=\"imagens/picactions/wait.gif\"></span>";
			if (receiveReq.readyState == 4 || receiveReq.readyState == 0) {

				sprefix= (sprefix=="PAL") ? stermo +"$":sprefix + " " + stermo +"$";
				var browser= navigator.userAgent.indexOf("MSIE")!=-1? 'ie':'noie';
				var url= "admin/getalfa.asp?expressao="+escape(sprefix)+"&base=rbcatalogo&letra="+letra+"&tab="+n;
				receiveReq.open("GET", url, true);

				receiveReq.onreadystatechange = handleResp;
				receiveReq.send(null);
			}

		}

		function handleResp() {

			if (receiveReq.readyState == 4) {


				var elem = document.getElementById("panel_a");
				var newSpan = document.createElement('span');
				newSpan.id = elem.id;
				newSpan.innerHTML = receiveReq.responseText;
				for (var i = 0; i < document.getElementById("panel").childNodes.length; i++) {
					var n = document.getElementById("panel").childNodes[i];
					n.parentNode.removeChild(n);
				}

				document.getElementById("panel").appendChild(newSpan);

			}
		}

	</script>
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
		<h1 style="font-variant: small-caps">Catálogo Coletivo:
			<%=sentidadelonga%>
		</h1>
	</div>
	<!-- Segmento Navegação topo -->
	<div class="col3-contentor">
		<div class="col3">
			<p class="fil">» <a href="default.asp">Entrada</a> » Índice de termos</p>
		</div>
		<div class="col3" id="lblutilizador">
			<% if session("user")="" then 
		    response.write "Utilizador: Visitante"
		  elseif session("LeitorIn") then 
		    response.write "Utilizador: " & DecodeUTF8(session("user")) 
		  else response.write "Utilizador: " & ucase(session("user")) 
		  end if%>
			<%if Session("LoggedIn") or session("LeitorIn") then%> [ <a href="logout.asp?sys=admin">Sair</a> ]
			<%end if%>
		</div>
	</div>
	<!-- Segmento Navegação topo - FIM -->
	<br />
	<div id="principal">
		<p>Não sabe o que temos para poder pesquisar? <b>Navegue nas listas de termos</b>!
		</p>
		<div class="col5-contentor">
			<div class="col5">
				<select size="1" name="PRFX" id="PRFX" tabindex="1" onchange="mudaPainel()">
					<option selected value="AU">Autor</option>
					<option value="TI">Título</option>
					<option value="AS">Assunto</option>
					<option value="COL">Coleção</option>
					<option value="PAL">Palavra</option>
				</select>
			</div>
			<div class="col5">
				<input type="text" id="termo" name="termo" size="25" onkeydown="if (event.keyCode == 13) mudaPainel()">
			</div>
		</div>
		<p>Listas <b>por letra inicial</b></p>
		<div id="tabs">
			<% for i=65 to 90 %>
			<div id="tab<%= i-64%>" class="<% if i=65 then response.write " tab_sel" else response.write "tab" end if%>" align="center" onClick="javascript:showPanel(<%=i-64%>,this.innerHTML, true);"><%=chr(i)%>
			</div>
			<%next%>
		</div>
		<div class="tab_bdr"></div>
		<div id="panel" style="min-height:120px"><span id="panel_a" style="height:120px"><span style="position:relative;left:50%;top:40%;"><img src="imagens/picactions/wait.gif"/></span></span>
		</div>
		<br />
		<p class="info"><img src="imagens/pictitulos/pic_ajuda_alt.svg" alt="Ajuda" title="Ajuda" height="32" width="32" style="vertical-align:middle" /> Informação: Esta pesquisa (por termos) permite navegar por índices automáticos criados com o conteúdo das bases de dados.
		</p>
			<dl>
			<dt>Sugestões de navegação</dt>
				<dd>Pode <b>limitar a lista</b> por Autor, Título, Assunto, Coleção ou Palavra.</dd>
				<dd>Na listagem carregue numa entrada para ver a <b>ficha do documento</b> correspondente.</dd>
			</dl>
		<h4><a style="text-decoration:none" href="ajuda_dicas.asp"><img src="imagens/pictitulos/pic_questao_alt.svg" alt="Dúvidas" title="Dúvidas" height="22" width="22" style="vertical-align:middle" />  Dúvidas? Carregue aqui para ver dicas de pesquisa</a></h4>
		<div class="txtrodape" align="center"><a style="text-decoration:none" href="creditos.asp">Catálogo Coletivo<br /> &copy; <b><%=sentidadelonga%></b></a>
		</div>
	</div>
	<script>
		var l=(letra=="" ? 'A': letra);
		showPanel(nval,l)
	</script>
</body>
