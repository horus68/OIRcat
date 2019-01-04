<%	
		vdir = "/" & Split(Request.ServerVariables("SCRIPT_NAME"), "/")(1)  
		host=  Request.ServerVariables("server_name")
		porta= Request.ServerVariables("server_port")
		strROOT = "http://" & host 
		if porta <>"80" then strROOT = strROOT & ":" & porta
		strROOT = strROOT & vdir
		http=strROOT
		base=request("base")
		sigla=request("sigla")
		Dim objXmlHttp
		Dim strHTML
		Set objXmlHttp = Server.CreateObject("Msxml2.ServerXMLHTTP")
	    if sigla="X" then cgi="relinst" else cgi="relbib"
		objXmlHttp.open "GET", http & "/cgi/www.exe/[in=" & cgi & ".in]?base="+lcase(base), False
		objXmlHttp.send
		strHTML = objXmlHttp.responseText
	    biblios=split(strHTML,",")

		for i=0 to ubound(biblios)-1	  
		  for j=0 to 9 
		   objXmlHttp.open "GET", http & "/cgi/www.exe/[in=getex.in]?base="+lcase(biblios(i))+"&expressao=CDU " & j & "$&lim_inicio=1&limites=9999999", False
		   objXmlHttp.send
		   if objXmlHttp.responseText="" then vv=0 else vv= Clng(objXmlHttp.responseText)
		   strBibs=strBibs & vv & ","
		  next 
          'response.write strBibs & "<br />"		  
		next
		'response.end
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-PT" lang="pt-PT">

<head>
	<title>Gráfico comparativo da coleção <%if sigla="X" then response.write "em toda a rede" else response.write "na entidade"%></title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="robots" content="noindex, nofollow" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<!--[if lt IE 9]><script language="javascript" type="text/javascript" src="js/jqplot/excanvas.min.js"></script><![endif]-->
	<link rel="stylesheet" href="js/jqplot/jquery.jqplot.min.css" type="text/css" />
	<script language="javascript" type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" crossorigin="anonymous"></script>
	<script language="javascript" type="text/javascript" src="js/jqplot/jquery.jqplot.min.js"></script>
	<script language="javascript" type="text/javascript" src="js/jqplot/plugins/jqplot.donutRenderer.min.js"></script>

	<script>
		var valores = "<%=strBibs%>";

		<% if sp<>"3" then %>
		var entidades = "<%=strHTML%>";
		var s = entidades.split(",");
		<%end if%>
		var t = valores.split(",");

		$(document).ready(function() {
			$.jqplot.config.enablePlugins = true;

			k = 1;
			for (i = 0; i < t.length - 1; i++) {
				eval("s" + k + " = [['0 Generalidades. Informática', " + t[i++] + "], ['1 Filosofia. Psicologia', " + t[i++] + "], ['2 Religião. Teologia'," + t[i++] + "], ['3 Ciências sociais'," + t[i++] + "],['(4 Vazia)'," + t[i++] + "], ['5 Matemática. Ciências naturais'," + t[i++] + "], ['6 Ciências aplicadas. Teconologia'," + t[i++] + "],['7 Arte. Desporto'," + t[i++] + "], ['8 Língua. Literatura'," + t[i++] + "], ['9 Geografia. História'," + t[i] + "]]");
				k++;
			}

			var strDados = '';
			for (j = 1; j < k; j++) {
				var x = eval("s" + j);
				flag = false;
				for (m = 0; m < 10; m++) {
					eval("y='" + x[m] + "'");
					var ind = y.indexOf(',');
					var tmp = y.substr(ind + 1);
					if (tmp != '0') flag = true;
				}
				if (flag) strDados = strDados + "s" + j + ",";
			}
			newStr = strDados.substring(0, strDados.length - 1);
			eval("plot2 = $.jqplot('chart2', [" + newStr + "], { seriesColors: ['#996633', '#9966CC', '#99CCFF', '#006600', '#666600', '#FF9900', '#FF66CC', '#800080', '#3366CC', '#FF0000', '#808080', '#00ff99'], seriesDefaults: { renderer:$.jqplot.DonutRenderer,  rendererOptions:{ sliceMargin: 3, innerDiameter: 15, fill:true,  dataLabels:'percent', showDataLabels:true, startAngle: -90 }}, legend: { show: true, location: 'e', placement: 'inside' }})");

			$('#chart2').bind('jqplotDataHighlight', function(ev, seriesIndex, pointIndex, data) {
				$('#info2').html('Unidade documental: ' + s[seriesIndex] + ', [CDU ' + pointIndex + ' = ' + data[1] + ' ex.]');
			});
			$('#chart2').bind('jqplotDataUnhighlight', function(ev) {
				$('#info2').html('');
			});

			$(document).unload(function() {
				$('*').unbind();
			});
		});

	</script>
	<meta name="description" content="Análise de coleção: distribuição por classes CDU" />
	<meta name="keywords" content="Catálogo coletivo, Bibliotecas, pesquisar biblioteca" />
	<!-- Favicon Geral -->
	<link rel="icon" type="image/x-icon" href="/rbcatalogo/favicon.ico" />
	<link rel="icon" type="image/png" sizes="32x32" href="/rbcatalogo/imagens/app/favicon-32x32.png" />
	<!-- Favicon Android -->
	<link rel="manifest" href="manifest.json?v=001" />
	<meta name="theme-color" content="#cdc8b1" />
	<!-- Favicon Windows IE -->
	<meta name="msapplication-config" content="IEconfig.xml?v=001" />
	<meta name="msapplication-TileColor" content="#afa782" />
	<!-- Favicon iOS -->
	<link rel="apple-touch-icon-precomposed" href="/rbcatalogo/imagens/app/apple-touch-icon-precomposed.png?v=001" />
	<link rel="mask-icon" href="/rbcatalogo/imagens/app/safari-pinned-tab.svg?v=001" color="#5bbad5" />
</head>

<body>
	XXPTO - Rede de Bibliotecas: Distribuição CDU<br />
<div style="float:right;margin-right:30px"><a href="col.asp?id=3"><img src="imagens/picactions/icon_close.svg" height="25" width="25" title="Fechar" alt="Fechar"></a>
		</div>
	<div style="margin-left:25px;font-size:1.0em;color:red">
		(<% if sigla="X" then response.write "Toda a Rede" else response.write request("sBase") %>) <span id="info2" style="color:#000"></span></div>
	<div id="chart2" style="margin-top:0px; margin-left:10px; width:700px; height:500px;"></div>

</body>
