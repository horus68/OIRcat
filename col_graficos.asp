<!--#include file="admin/config.asp"-->
<!--#include file="admin/functions.asp"-->
<%
  strHTML=getUrl(strROOT & "/cgi/www.exe/[in=getpar.in]")
  valores= split(strHTML,",")

sigla=request("users")
base=request("base")
if sigla="" then sigla=request("sigla")
criterio=trim(request("criterio"))
sp= request("mnu")
op= request("op")
select case op
	case ""  
	    if criterio<>"$" and sigla="X" then
		  filtro= criterio
		  sfiltro=criterio
		else  
	     'if sigla<>"X" and lcase(base) <> lcase(sigla) then filtro=" AND SI " & sigla & criterio else filtro= criterio
		 if criterio<>"$" then 
		      ss= split(criterio,"AND") 
			  if sigla<>"X" and sp<>"3" then
			       if lcase(base) <> lcase(sigla) then filtro=ss(1) else filtro=criterio
			  else 
			       filtro=criterio
              end if			  
		  else 	  
			  if sigla<>"X" and (lcase(base) <> lcase(sigla)) then filtro= criterio else filtro=criterio 
		  end if	  
		  sfiltro =criterio
        end if
	case "AS","COL","CDU","TI","AU"
	     if sigla<>"X" then 
			filtro = replace(replace(criterio,"SI "+ucase(trim(sigla)),"")," AND ","")
		 else
		    filtro = criterio 
		 end if	
		 
	     sfiltro=filtro
	case else
         filtro="$"
		 sfiltro ="Geral"
end select
'response.write base
'response.end
Dim objXmlHttp
Dim strHTML
Set objXmlHttp = Server.CreateObject("Msxml2.ServerXMLHTTP")
objXmlHttp.open "GET", strROOT & "/cgi/www.exe/[in=getuser.in]?expressao=SIGLA " & ucase(sigla), False
objXmlHttp.send
strHTML = objXmlHttp.responseText
if strHTML<>"" then
siglaEXT= mid(strHTML,1,len(strHTML)-2)
end if
objXmlHttp.open "GET", strROOT & "/cgi/www.exe/[in=getuser.in]?expressao=SIGLA " & ucase(base), False
objXmlHttp.send
strHTML = objXmlHttp.responseText
if strHTML<>"" then
siglaBASE= mid(strHTML,1,len(strHTML)-2)
end if

if sp<>"3" then 

    if sigla<>"X" and lcase(base) <> lcase(sigla) then 
	    objXmlHttp.open "GET", strROOT & "/cgi/www.exe/[in=relbib.in]?base="+lcase(base), False
		objXmlHttp.send
		strHTML = objXmlHttp.responseText
		entidades=split(strHTML,",")
	else
		objXmlHttp.open "GET", strROOT & "/cgi/www.exe/[in=relbib.in]", False
		objXmlHttp.send
		strHTML = objXmlHttp.responseText
		entidades=split(strHTML,",")
		objXmlHttp.open "GET", strROOT & "/cgi/www.exe/[in=relbib.in]?base="+lcase(base), False
		objXmlHttp.send
		strHTML1 = objXmlHttp.responseText
		biblios=split(strHTML1,",")
	end if

	strDados=""
	strDados1=""
	strBibs=""
	strBibs1=""
	totalREFS=0
	totalREFSB=0
	
	for i=0 to ubound(entidades)-1

	   if criterio="X" and lcase(base) <> lcase(sigla) then
	    objXmlHttp.open "GET", strROOT & "/cgi/www.exe/[in=getex.in]?base=" & lcase(entidades(i)) & "&expressao=$&lim_inicio=1&limites=9999999&d=" & now(), False
	   else
		objXmlHttp.open "GET", strROOT & "/cgi/www.exe/[in=getex.in]?base=" & lcase(entidades(i)) & "&expressao="+ server.URLEncode(filtro)+"&lim_inicio=1&limites=9999999&d=" & now(), False
	   end if
	   objXmlHttp.send
	   if objXmlHttp.responseText="" then vv=0 else vv= Clng(objXmlHttp.responseText)
	   strDados = strDados & vv & ","
	   totalREFS=totalREFS + vv
	   if sigla<>"X" or criterio<>"$" then
	   objXmlHttp.open "GET", strROOT & "/cgi/www.exe/[in=getex.in]?base=" & lcase(entidades(i)) & "&expressao=$&lim_inicio=1&limites=9999999&d=&d=" & now() , False
	   objXmlHttp.send
	   if objXmlHttp.responseText="" then vv=0 else vv= Clng(objXmlHttp.responseText)
	   strDados1=strDados1 & vv & ","
	     
	   end if
	   
	next
    if sigla<>"X" and  lcase(base)=lcase(sigla) then
	
		for i=0 to ubound(biblios)-1
	  
		   objXmlHttp.open "GET", strROOT & "/cgi/www.exe/[in=getex.in]?base=" & lcase(biblios(i)) & "&expressao="+ server.URLEncode(sfiltro)+"&lim_inicio=1&limites=9999999&d=" & now(), False
	   
		   objXmlHttp.send
		   if objXmlHttp.responseText="" then vv=0 else vv= Clng(objXmlHttp.responseText)
		   strBibs = strBibs & vv & ","
		   totalREFSB=totalREFSB + vv
		   if sigla<>"X" or criterio<>"$" then
		   objXmlHttp.open "GET", strROOT & "/cgi/www.exe/[in=getex.in]?base=" & lcase(biblios(i)) & "&expressao=$&lim_inicio=1&limites=9999999&d=" & now(), False
		   objXmlHttp.send
		   if objXmlHttp.responseText="" then vv=0 else vv= Clng(objXmlHttp.responseText)
		   strBibs1=strBibs1 & vv & ","
		   end if
	   
		next

    end if	

else
	  sfiltro= ucase(sigla)
	  
	  totalCDU=1
	  if lcase(base) <> lcase(sigla) then filtro=" AND SI " & sigla else filtro=""
	  'GET", strROOT & "/cgi/www.exe/[in=getex.in]?base=rbcatalogo&expressao=SI "+ucase(sigla)+filtro+ " AND CDU " & i & "$&lim_inicio=1&limites=500000
	  for i=0 to 9   
	   'response.write strROOT & "/cgi/www.exe/[in=getex.in]?base="+base+"&expressao=CDU " & i & filtro & "&lim_inicio=1&limites=500000" & "<br />"  
	   objXmlHttp.open "GET", strROOT & "/cgi/www.exe/[in=getex.in]?base="+base+"&expressao=CDU " & i & "$" & filtro & "&lim_inicio=1&limites=9999999&d=" & now(), False
	   objXmlHttp.send
	   strDados = strDados & objXmlHttp.responseText & ","
	   if objXmlHttp.responseText<>"" then
	      totalCDU=totalCDU + Clng(objXmlHttp.responseText)
	   end if	  
	  next
	  objXmlHttp.open "GET", strROOT & "/cgi/www.exe/[in=relbib.in]?base="+lcase(base), False
	  objXmlHttp.send
	  strHTML1 = objXmlHttp.responseText
	  biblios=split(strHTML1,",")
	
end if
'response.write strDados & "<br />"
'response.write strDados1
'response.end 
Set objXmlHttp = Nothing

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml" xml:lang="pt-PT" lang="pt-PT">

<head>
	<meta http-equiv="X-UA-Compatible" content="IE=11,chrome=1" />
	<title>Gr�ficos - <%=sentidadelonga%></title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="css/default.min.css?version=001" type="text/css" />
	<link rel="stylesheet" href="css/tabcontent.min.css" type="text/css" />
	<link rel="stylesheet" id="ui-theme" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css" type="text/css" crossorigin="anonymous" />
	<link rel="stylesheet" href="js/jquery.jui_dropdown.css" type="text/css" />
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/tabcontent.min.js"></script>
	<script type="text/javascript" src="js/jquery.jui_dropdown.min.js"></script>
	<script type="text/javascript" src="js/tableH.min.js"></script>
	<script>
		var base = '<%=base%>';

		function start() {
			if (!document.getElementsByTagName || !document.createTextNode) return;
			var rows = document.getElementById("users").getElementsByTagName("tbody")[0].getElementsByTagName("tr");
			for (i = 1; i < rows.length; i++) {
				rows[i].title = "Clique para ver a cole��o desta entidade";
				rows[i].onclick = function() {
					window.location.href="col_graficos.asp?base="+this.cells[0].firstChild.nodeValue.toLowerCase()+"&op=<%=request("op")%>&criterio=<%=request("criterio")%>&voltar=true&sigla="+ this.cells[0].firstChild.nodeValue;
					//document.getElementById("frmseluser").submit();
				}
			}
		}

		function ver_grafcomp() {
			var loc ="col_cdu_comp.asp?base=<%=request("base")%>&sBase=<%=siglaBase%>&sigla=<%=sigla%>";
			popup = window.open(loc,"ID","toolbar=no,location=no,directories=no,status=no,scrollbars=no,resizable=no,width=740,height=550,left=50,top=50");
			if (window.focus) {
				popup.focus()
			}
			return false;
		}

		function verCDU(bib) {
			window.location.href="col_graficos.asp?base="+base.toLowerCase()+"&op=<%=request("op")%>&mnu=3&criterio=<%=trim(request("criterio"))%>&voltar=true&sigla="+bib;
		}

	</script>
	<!-- Google Charts com carregamento de vers�o espec�fica -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		<% if sp<>"3" then %>
		google.charts.load('46.2', {packages:["<%if valores(9)="N" then response.write "corechart" else if valores(7)="S" then response.write "barchart" else response.write "corechart" end if end if%>"], 'language': 'pt'});
		<%else%>
		google.charts.load('46.2', {packages:["corechart"], 'language': 'pt'});
		<%end if%>
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {

			var valores = "<%=strDados%>";
			<% if sp<>"3" then %>
			var entidades = "<%=strHTML%>";
			var s = entidades.split(",");
			<%end if%>
			var t = valores.split(",");
			var scaleH = t.length < 5 ? 1.4 : 1;
			var flag = false;
			for (i = 0; i < t.length - 1; i++)
				if (t[i] != 0) flag = true;
			if (flag == false) {
				document.getElementById("chart_div").innerHTML = "<div style='position: relative; background: url(imagens/picgraficos/no-graph.png); width: 450px; height: 270px;'><div style='position: absolute; top: 1em; left: 2em; padding: 4px;color:red;'><b>N�o existem dados para mostrar!</b></div></div>";
				return
			}
			var data = new google.visualization.DataTable();
			<% if sp<>"3" then %>
			var c2 = 'Institui��es';
			var nr = s.length - 1;
			<% else %>
			var c2 = 'CDU';
			var nr = 10;
			<% end if%>
			eval("data.addColumn('string', '" + c2 + "')");
			data.addColumn('number', 'Ref�s');
			eval("data.addRows(" + nr + ")");
			document.getElementById("chart_div").innerHTML = "";
			for (i = 0; i < nr; i++) {
				<% if sp="3" then %>
				var c3 = 'CDU ' + i <%else%>
				var c3 = s[i]
				<%end if%>
				data.setValue(i, 0, c3);
				data.setValue(i, 1, parseFloat(t[i]));
			}
			<% if sp<>"3" then %>
			<%if valores(9)="N"   then  %> /* or (sigla<>"X" and lcase(sigla)<>lcase(base)) */
			/* Gr�fico Distribui��o na rede - tarte (config admin) */
			var options = {
				/* width: "100%",
				height: 470, */
				enableTootlTip: true,
				is3D: false,
				title: ''
			};
			var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
			chart.draw(data, options);
			<% else %> /* Gr�fico Distribui��o na rede - barras */
			<%if valores(7)="S" then %>
			/* var h = t.length * 57 * scaleH; */
			var options = {
				/* width: '100%',
				height: h, */
				vAxis: {
					minValue: 0,
					baseline: 0,
					viewWindow: {min: 0},
					viewWindowMode: "explicit"
				},
				hAxis: {
					minValue: 0,
					baseline: 0,
					viewWindow: {min: 0},
					viewWindowMode: "explicit"
				},
				bar: {groupWidth: "95%"},
				enableTootlTip: true,
				axisFontSize: 12,
				is3D: false,
				legend: 'none',
				title: 'Exist�ncias por entidade (Qtd.)',
				tooltipFontSize: 16
			};
			var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
						chart.draw(data, options);
			<% else %> /* Gr�fico Distribui��o na rede - colunas (admin)*/
			var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
						chart.draw(data, options);
			/* var h = 470; */
			<% end if%>
			/* var larg = '100%';*/
			var options = {
				/* width: larg,
				height: h, */
				vAxis: {
					minValue: 0,
					baseline: 0,
					viewWindow: {min: 0},
					viewWindowMode: "explicit"
				},
				hAxis: {
					minValue: 0,
					baseline: 0,
					viewWindow: {min: 0},
					viewWindowMode: "explicit"
				},
				bar: {groupWidth: "95%"},
				enableTootlTip: true,
				axisFontSize: 12,
				is3D: false,
				legend: 'none',
				title: 'Exist�ncias por entidade (Qtd.)',
				tooltipFontSize: 16
			};
			<% end if%>
			 /* Gr�fico Distribui��o na rede - tarte */
			var options = {
				/* width: "100%",
				height: 470, */
				is3D: false,
				axisFontSize: 12,
				title: 'Exist�ncias por entidade (%)',
				titleTextStyle: {
					color: 'black',
					fontSize: 10
				},
				//colors: ['#1F78B4', '#E31A1C', '#33A02C', '#FF7F00', '#6A3D9A', '#B15928', '#A880BB', '#8ACF4E', '#F8514F', '#FFFF4D', '#03CEA4'],
				pieSliceTextStyle: {
					color: '#000000',
					fontSize: 12
				},
				enableTootlTip: true,
				tooltipFontSize: 16,
			};
			var chart = new google.visualization.PieChart(document.getElementById('chart_div2'));
			chart.draw(data, options);
			<%else%> /* Gr�fico ficha de biblioteca - tarte */
			var options = {
				/* width: "100%",
				height: 600, */
				enableTootlTip: true,
				is3D: true,
				chartArea: {
					left: 5,
					top: 10,
					width: "100%",
					height: "100%"
				},
				legend: {
					position: 'right',
					textStyle: {
						color: '#673802',
						fontSize: 16
					}
				},
				tooltipFontSize: 16,
				'tooltip': {
					'boxStyle': {
						'stroke': '#b2b2b2',
						'strokeOpacity': 1,
						'strokeWidth': 1.5,
						'fill': 'white',
						'fillOpacity': 1,
						'shadow': {
							'radius': 1,
							'opacity': 0.2,
							'xOffset': 0,
							'yOffset': 2
						}
					}
				},
				pieSliceTextStyle: {
					color: '#000000',
					fontSize: 12
				},
				slices: [{
					color: '#996633' // CDU 0
				}, {
					color: '#9966CC' // CDU 1
				}, {
					color: '#99CCFF' // CDU 2
				}, {
					color: '#006600' // CDU 3
				}, {
					color: '#666600' // CDU 4
				}, {
					color: '#FF9900' // CDU 5
				}, {
					color: '#FF66CC' // CDU 6
				}, {
					color: '#800080' // CDU 7
				}, {
					color: '#3366CC' // CDU 8
				}, {
					color: '#FF0000' // CDU 9
				}]
			};
			var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
			chart.draw(data, options);
			<%end if%>
		}
		<% if sp<>"3" and strBibs1<>"" then %>
		/* Gr�fico barras bibliotecas do grupo */
		google.charts.setOnLoadCallback(drawChart1);

		function drawChart1() {

			var valores1 = "<%=strBibs%>";
			<% if sp<>"3" then %>
			var biblios = "<%=strHTML1%>";
			var u = biblios.split(",");

			<%end if%>

			var z = valores1.split(",");
			var flag = false;
			for (i = 0; i < z.length - 1; i++)
				if (z[i] != 0) flag = true;
			if (flag == false) {
				document.getElementById("chart_div1").innerHTML = "<div style='position: relative; background: url(imagens/picgraficos/no-graph.png); width: 350px; height: 270px;'><div style='position: absolute; top: 1em; left: 2em; padding: 4px;color:red;'><b>N�o existem dados para mostrar!</b></div></div>";
				return
			}
			var data = new google.visualization.DataTable();
			<% if sp<>"3" then %>
			var c2 = 'Institui��es';
			var nr = u.length - 1;
			<% else %>
			var c2 = 'CDU';
			var nr = 10;
			<% end if%>
			eval("data.addColumn('string', '" + c2 + "')");
			data.addColumn('number', 'Refer�ncias');
			eval("data.addRows(" + nr + ")");

			document.getElementById("chart_div1").innerHTML = "";
			for (i = 0; i < nr; i++) {
				<% if sp="3" then %>
				var c3 = 'CDU ' + i <%else%>
				var c3 = u[i]
				<%end if%>
				data.setValue(i, 0, c3);
				data.setValue(i, 1, parseFloat(z[i]));
			}
			var options = {
				width: 1150,
				height: 1150,
				bar: {groupWidth: "95%"},
				vAxis: {
					minValue: 0,
					baseline: 0,
					viewWindow: {min: 0},
					viewWindowMode: "explicit"
				},
				hAxis: {
					minValue: 0,
					baseline: 0,
					viewWindow: {min: 0},
					viewWindowMode: "explicit"
				},
				chartArea: {width: '40%'},
				is3D: false,
				axisFontSize: 9,
				legend: 'none',
				titleTextStyle: {
					color: 'black',
					fontSize: 10,
					italic: true,
				},
				title: '',
				enableTootlTip: true,
				tooltipFontSize: 16,
				'tooltip': {
					'boxStyle': {
						'stroke': '#b2b2b2',
						'strokeOpacity': 1,
						'strokeWidth': 1.5,
						'fill': 'white',
						'fillOpacity': 1,
						'shadow': {
							'radius': 1,
							'opacity': 0.2,
							'xOffset': 0,
							'yOffset': 2
						}
					}},
			};
			var chart = new google.visualization.BarChart(document.getElementById('chart_div1'));
			<% if sp<>"3" then %>
			var titulo = "";
			<%else%>
			var titulo = 'Distribui��o por classe CDU';
			<%end if%>
			chart.draw(data, options);
		}
		<% end if%>

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
<%dim v1
v1= split(strDados,",")


flag=0
for i=0 to ubound(v1)-1
   if v1(i)<>"" then flag=1

next  
if lcase(base) <> lcase(sigla) then nomeAGRUP= " ["& siglaBASE &"]"
if sp="3" then menu=3 else menu=2

%>

<body <% if (sp<>"3" and sigla<>"X" and lcase(sigla)=lcase(base)) or sigla="X" then response.write "onload='start()'" %>>
	<div class="destaque1">
		<h1 style="font-variant: small-caps">Cat�logo Coletivo: Avalia��o de exist�ncias</h1>
	</div>
	<!-- Segmento Navega��o topo -->
	<div class="col3-contentor">
		<div class="col3">
			<p class="fil">� <a href="default.asp">Entrada</a> � <a href="col.asp?id=3">Cole��o</a> �
				<% if sp="3" then %><a href="cgi/www.exe/[in=mnucol.in]?mnu=3">
					<% else %><a href="col_colselop.asp?ut=<%=ucase(session(" user"))%>&base=
						<%=lcase(base)%>&criterio=
						<%=sigla%>&users=
						<%=sigla%>">
						<% end if %>Exist�ncias</a> �
					<% if sp<>"3" then %><a href="javascript:history.back()">Lista de t�tulos</a> �
					<% end if %> Gr�ficos
			</p>
		</div>
		<div class="col3" id="lblutilizador">Utilizador: <span id="utilizador">
				<% if session("user")="" then response.write "Visitante" else response.write ucase(session("user"))%>
				<%if Session("LoggedIn") then%> [ <a href="default.asp?Logout=1">Sair</a> ]
				<%end if%>
			</span>
		</div>
	</div>
	<!-- Segmento Navega��o topo - FIM -->
	<div id="principal">
		<div id="admbotoes" style="float:right;margin-right:30px"><a href="javascript:history.go(-1);"><img src="imagens/picactions/icon_close.svg" alt="Voltar � p�gina anterior"  height="25" width="25" /></a>
			<% if flag=1 then %><a href="javascript:window.print()"><img src="imagens/picactions/icon_imprimir.svg" alt="Imprimir esta p�gina" title="Imprimir esta p�gina"  height="25" width="25" /></a>
			<%end if%>
		</div>
		<h3>Refer�ncias por entidade/biblioteca</h3>
		<!-- Segmento Gr�fico Geral -->
		<div>
			<% 'if request("voltar") then response.write "javascript:history.go(-1);" else if sigla="X" then response.write "col.asp" else response.write "../cgi/www.exe/[in=mnucol.in]?mnu="& menu 
			%>
			<span style="float:right;">
				<% 
		if (lcase(base)= lcase(sigla)) and (sp<>"3") then
		if ubound(biblios)>0 then
			response.write "<div id=""drop"">"
			response.write "<div id=""launcher_container"">Gr�ficos extra:"
			if ubound(biblios)>1 then
			response.write "<a id=""vgraf"" href=""javascript:void(0)"" onclick=""ver_grafcomp()""><img src=""imagens/picgraficos/graf_comparativo.svg"" align=""absmiddle"" alt=""Gr�fico comparativo da CDU"" title=""Gr�fico comparativo da CDU"" border=""0"" height=""60"" width=""60""/></a>"
			end if
			response.write "<input style=""width:60px;height:60px;padding:0;border:none"" type=""image"" src=""imagens/picgraficos/graf_biblios.svg"" id=""launcher4"" title=""Distribui��o por biblioteca"" border=""0"" height=""60"" width=""60""/>"
			response.write "<div>" 
			response.write "<ul id=""menu4"">"
  		
			for i=0 to ubound(biblios)-1
					response.write "<li id='"&biblios(i)&"'><a href=""javascript:verCDU('"&biblios(i)&"');"">" & biblios(i) & "</a></li>"
			next		
			response.write "</ul>"
			response.write "</div>"
			response.write "</div>"
			response.write "</div>"
	 		
	%>
				<script>
					$(function() {
						if ($("#drop").name == "undefined") return;
						$("#drop").jui_dropdown({
							launcher_id: 'launcher4',
							launcher_container_id: 'launcher_container',
							menu_id: 'menu4',
							launcherUIShowText: false,
							launchOnMouseEnter: true,
							launcherUISecondaryIconClass: 'ui-icon-gear',
							menuClass: 'menu4',
							containerClass: 'container4',
							my_position: 'right top',
							at_position: 'right bottom',
							onSelect: function(event, data) {
								base = data.id;
							}
						});

					});

				</script>
				<%
		else
		   response.write "<div id=""launcher_container"">"
	       response.write "<a id=""vgraf"" href=""javascript:void(0)"" onclick=""verCDU('"&base&"')""><input style=""width:60px;height:60px;padding:0;border:none"" type=""image"" src=""imagens/picgraficos/graf_biblios.svg"" id=""launcher4"" title=""Distribui��o na biblioteca""/></a>"
		   response.write "</div>"
		end if

	end if
    if sigla="X" then 
		 response.write "<div id=""launcher_container"">Gr�fico por CDU: "
	     response.write "<a id=""vgraf"" href=""javascript:void(0)"" onclick=""ver_grafcomp()""><img src=""imagens/picgraficos/graf_comparativo.svg"" alt=""Gr�fico comparativo da CDU"" title=""Gr�fico comparativo da CDU"" border=""0"" height=""60"" width=""60""/></a>"	
		 response.write "</div>"
	end if
%>
			</span>


			<span style="font-size:0.9em"> crit�rio: [
				<%if sp<>"3" then  response.write sfiltro else  response.write sigla & " (<span style=""color:red"">" & trim(siglaEXT) & "</span>)"%>]
				<% if sp<>"3" then%>em
				<% if sigla <>"X" then response.write sigla & " (<span style=""color:red"">" & trim(siglaEXT) & "</span>)" & nomeAGRUP  else response.write "Toda a rede"%>
				<% end if%></span>
		</div>
		<div style="clear:both;margin-bottom:5px"></div>
		<%
flagtabs=false
if sp<>"3" then
   if sigla<>"X" then 
      if  lcase(sigla)=lcase(base) then
	    if ubound(biblios)>0 then   
		  flagtabs=true 
		end if 
	  end if 
	end if 
 end if 
 if flagtabs then %>
		<ul id="tabs" class="shadetabs">
			<li><a href="#" rel="tab1" class="selected">Distribui��o na rede</a></li>
			<li><a href="#" rel="tab2">Distribui��o na entidade</a></li>
		</ul>
		<div id="painel">
			<div id="tab1" class="tabcontent">
				<br />
				<%
 else
    response.write "<div id=""painel"">"  
 end if 
			 if sp<>"3" and sigla<>"X" and lcase(sigla)=lcase(base) then response.write "<b>A) Distribui��o na rede</b>"  else response.write "<br />" 
			 if sp="3" then response.write "<b>Distribui��o por CDU</b>"
			 %>
				<!-- Segmento Gr�fico Distribui��o na rede -->
				<div id="chart_div" style="width:100%; height:450px;">A carregar dados... aguarde um momento, por favor.
				</div>
				<br /><hr><br />
				<!-- Segmento Gr�fico Distribui��o na rede - tarte -->
				<div id="chart_div2" style="width:100%; height: 450px;"></div>
				<br /><br />
				<!-- Segmento Tabela Gr�fico Parcial -->
				<div>
					<br />
					<%
			if flag=1 then
				%>
					<table id="users" class="graficos">
						<caption>Tabela de valores</caption>
						<th>
							<%if sp<>"3" then%>Fundo
							<%else%>&nbsp;CDU
							<%end if%>
						</th>
						<th>Ref.�s</th>
						<% response.write "<th title=""N� de ref�s &divide; Total encontrado para todas as entidades""> A </th>"
				   if sigla<>"X" or criterio<>"$" then    
					 if sp<>"3" then response.write "<th title=""N� de ref�s &divide; Total de refer�ncias por entidade""> B </th>" 
				   end if
				dados=split(strdados,",")
				dados1=split(strdados1,",")
				on error resume next
				total1=0
				if sp="3" then
					for i=0 to 9
					   response.Write("<tr><td align=""center"">" & i & "</td><td align=""right"">" & dados(i) & "</td>")
					   response.Write("<td align=""right"">" & formatpercent(dados(i)/totalCDU,1) & "</td></tr>") 
					   'total1= total1+ Clng(dados(i))
					next
					
				else
					
					for i=0 to ubound(entidades)-1
					   response.Write"<tr "
					   if entidades(i)=sigla then response.write "style=""background-color:yellow""" 
					   response.write "><td>" & entidades(i) & "</td><td align=""right"">" & dados(i)  & "</td><td align=""right"">" & formatpercent(dados(i)/totalREFS,1) & "</td>"
					   if dados(i)=0 and dados1(i)=0 then dados1(i)=1 
					   if sigla<>"X" or criterio<>"$" then response.Write("<td align=""right"">" & formatpercent(dados(i)/dados1(i),1) & "</td>")
					   response.write ("</tr>") 
					   'total1= total1+ Clng(dados(i))
					next
				end if
				'response.write "<tr><td>Total</td><td align=""right""><b>" & total1 & "</b></td></tr>"
				%>
					</table>
				</div>
			<% end if
			%>
			<!-- Segmento Gr�fico Distribui��o na rede - FIM -->
			<!-- Segmento Gr�fico Distribui��o na entidade -->
			<% 
response.write "</div>" 
	if sp<>"3" then
		if sigla<>"X" then 
			if  lcase(sigla)=lcase(base) then
				if ubound(biblios)>0 then  
		%>

			<div id="tab2" class="tabcontent">
				<br />
				<b>B) Distribui��o nas bibliotecas da entidade</b>
				<div id="chart_div1" style="width:100%; height:100%; overflow: auto">A carregar dados... aguarde um momento, por favor.
				</div>
				<!-- Segmento Tabela Gr�fico Parcial -->
				<%
			if flag=1 then
	%>
				<br />
				<div>
					<table id="users" class="graficos">
						<caption>Tabela de valores (Grupo)</caption>
						<th>
							<%if sp<>"3" then%>Fundo
							<%else%>CDU
							<%end if%>
						</th>
						<th>Ref.�s</th>
						<% response.write "<th title=""N� de ref�s &divide; Total encontrado para todas as entidades""> A </th>"
				   if sigla<>"X" or criterio<>"$" then    
					 if sp<>"3" then response.write "<th title=""N� de ref�s &divide; Total de refer�ncias por entidade""> B </th>" 
				   end if
				dados=split(strBibs,",")
				dados1=split(strBibs1,",")
				on error resume next
				total1=0
				if sp="3" then
					for i=0 to 9
					   response.Write("<tr><td>" & i & "</td><td align=""right"">" & dados(i) & "</td>")
					   response.Write("<td align=""right"">" & formatpercent(dados(i)/totalCDU,1) & "</td></tr>") 
					   'total1= total1+ Clng(dados(i))
					next
				else
					
					for i=0 to ubound(biblios)-1
					   response.Write"<tr "
					   if biblios(i)=sigla then response.write "style=""background-color:yellow""" 
					   response.write "><td>" & biblios(i) & "</td><td align=""right"">" & dados(i)  & "</td><td align=""right"">" & formatpercent(dados(i)/totalREFSB,1) & "</td>"
					   if dados(i)=0 and dados1(i)=0 then dados1(i)=1 
					   if sigla<>"X" or criterio<>"$" then response.Write("<td align=""right"">" & formatpercent(dados(i)/dados1(i),1) & "</td>")
					   response.write ("</tr>") 
					   'total1= total1+ Clng(dados(i))
					next
				end if
				'response.write "<tr><td>Total</td><td align=""right""><b>" & total1 & "</b></td></tr>"
				%>
					</table>
				</div>
				<% end if%>
			</div>
			<script type="text/javascript">
				var menus = new ddtabcontent("tabs")
				menus.setpersist(true)
				menus.setselectedClassTarget("link") //"link" or "linkparent"
				menus.init()

			</script>
			<script>
				menus.expandit(<% if request("id")="" then response.write 0 else response.write request("id") end if%>)

			</script>
			<%    end if
     end if
   end if
 end if%>
			<!-- Segmento Gr�ficos FIM -->
			<p>Legenda: <ul>
					<li><b>coluna A</b> - N� de ref�s &divide; Total de ref�s para o crit�rio de pesquisa </li>
					<% if sp<>"3" and sigla<>"X" or (criterio<>"$" and sp<>"3") then %>
					<li><b>coluna B</b> - N� de ref�s &divide; Total de ref�s por entidade</li>
					<% end if%>
				</ul>
			</p>
			</div>
			<p id="noprint" style="margin-left:15px">Sugest�es:
				<br />- Use o bot�o "X" (no topo) para voltar � p�gina anterior.
				<br />- Os bot�es de gr�ficos, no topo, permitem ver gr�ficos de distribui��o por CDU ou alternar entre bibliotecas do mesmo grupo.
				<br />- Nos gr�ficos com grupos de bibliotecas pode carregar numa das linhas da tabela de dados para aceder a detalhes das bibliotecas desse grupo.
			</p>
		</div>
	</div>
	<script>
		// Gr�ficos responsivos
		$(window).resize(function() {
			drawChart();
			drawChart1();
		});
	</script>
</body>

</html>
