//** OIR - OPAC.isisRBE
function getAction(){
	 var pos=document.getElementById("susers").selectedIndex;
	 var x=document.getElementById("susers").options[pos].value;
	 document.getElementById("expressao").value="SIGLA "+x;
	 document.getElementById("frmseluser").submit();
	
}

function getActionHistRes(base){
	 var pos=document.getElementById("ophist").selectedIndex;
	 var x=document.getElementById("ophist").options[pos].value;
     //var tipo=document.getElementById("tipores").value;
	 var s_value=0;
	 for (var i=0; i < document.frmHistRes.situacao.length; i++)
	 {
	   if (document.frmHistRes.situacao[i].checked)
		  {
		  s_value += parseInt(document.frmHistRes.situacao[i].value);
		  }
	 }
	 var exp="";
	 switch (s_value) {
	    case 1: exp = "EST 0"; break;
		case 3: exp = "EST 1"; break;
		case 4: exp = "(EST 0 OR EST 1)"; break;
		case 5: exp = "EST 2"; break;
		case 6: exp = "(EST 0 OR EST 2)"; break;
		case 8: exp = "(EST 1 OR EST 2)"; break;
		case 9: exp = ""; break;
	 
	 }
	 tmp=exp;
	 var a_value=0;
	 for (var i=0; i < document.frmHistRes.ambito.length; i++)
	 {
	   if (document.frmHistRes.ambito[i].checked)
		  {
		  a_value += parseInt(document.frmHistRes.ambito[i].value);
		  }
	 }
	 
	 exp="";
	 switch (a_value) {
	    case 1: exp = base.toLowerCase()=='admin'? "": "AGR "+base ; break;
		case 3: exp = base.toLowerCase()=='admin'? "": "REQ "+base ; break;
		case 4: exp = base.toLowerCase()=='admin'? "": "(AGR "+base+ " OR REQ "+base+")" ; break;	 
	 }
     tmp += exp!=''? ' AND '+exp:'' ;
	 

     exp="";

	 var flag=true;
	 switch (x) {
	  case '': alert('ATEN��O. Selecione um crit�rio!'); flag=false;break;
	  case 'X': exp= '$';break
	  case 'l': exp= 'TU leitor AND REQ '+document.getElementById("incampo").value; break;
	  case 'a': exp= 'AGR '+document.getElementById("incampo").value+ document.getElementById("exata").checked ? '':'$'; break;
	  case 'b': exp= 'BIB '+document.getElementById("incampo").value+ document.getElementById("exata").checked ? '':'$'; break;
	 }
	 tmp += tmp=='' && exp=='$' ? '$': tmp==''? exp:' AND '+exp ;
     //tmp +='&estado='s_value;
	 document.getElementById("express1").value = tmp;
	 if (flag) document.getElementById("frmHistRes").submit();
	
}

function getActionRes(){
	 var pos=document.getElementById("estado").selectedIndex;
	 var x=document.getElementById("estado").options[pos].value;	   
	 if (x!='X') 
	 document.getElementById("express").value += " AND EST "+x;
	 document.getElementById("frmgesres").submit();
	
}


function validadados(flag){
       var status=true;var stat_gps=true;
       var msgconf="";var msgID="";
       var msg="";
       //if (!ValidateSigla(document.getElementById("v21"))) return false;
	   if (!ValidateEmail(document.getElementById("v11"))) return false; 
	   if (flag!=-1)
	   {
       var senha=document.getElementById("v7").value;
       var confirma=document.getElementById("confirma").value;
	    if (senha!=confirma)
        { msgconf= "As senhas n�o coincidem.\n";status=false; }
		if (document.getElementById("v1").value=="")
        {msg = "ID"; status=false; }
        else {
		    var valor = parseInt(document.getElementById("v1").value);
            if (isNaN(valor)) 
            {msgID = "O campo ID tem de ser num�rico!\n";status=false;}
		}	
        if (document.getElementById("v2").value=="")
        {msg= (msg != "") ? msg+ ",SIGLA": msg+"SIGLA"; status=false; }
		
		}
        if (document.getElementById("v3").value=="")
        {msg=  (msg != "") ? msg +",NOME": msg+ "NOME"; status=false; }
        
		if (flag!=-1)
	    {
		if (document.getElementById("v7").value=="")
        {msg= (msg != "") ? msg +",SENHA": msg+ "SENHA" ; status=false; }
        }
		if (msg != "")  msg= "Os campos " + msg + " s�o obrigat�rios.";
		if (document.getElementById("v22").value!=""){
 		 	   var valor1 = document.getElementById("v22").value;
			   if (!ValidateGPS(valor1)) stat_gps=false;
             
        }
        if (document.getElementById("v23").value!=""){
		       var valor2 = document.getElementById("v23").value;
			   if (!ValidateGPS(valor2)) stat_gps=false;
        }      
		if (!stat_gps) { msgID += "As coordenadas GPS devem ser valores num�ricos [ex: -9,02345].\n";status=false;}
        if (!status) alert ("ATEN��O! Existem erros no preenchimento do formul�rio.\n\n" + msgID+msgconf + msg)
		return status;
    }

	
'       function validadados() {'
'       var status=true; var stat_gps=true;'
'       var msg="";' 
'       var msgID="";'
'        //if (!ValidateSigla(document.getElementById("v21"))) return false;'	
'		 if (!ValidateEmail(document.getElementById("v11"))) return false;'
'        if (document.getElementById("v3").value=="")'
'        {msg=  (msg != "") ? msg +",NOME": msg+ "NOME"; status=false; }'
'        if (msg != "")  msg= "Os campos " + msg + " s�o obrigat�rios.";'
'        if (document.getElementById("v22").value!=""){'
'				var valor1 = document.getElementById("v22").value;'
'			    if (!ValidateGPS(valor1)) stat_gps=false;'
'        }'
'        if (document.getElementById("v23").value!=""){'
'		       var valor2 = document.getElementById("v23").value;'
'			   if (!ValidateGPS(valor2)) stat_gps=false;'
'        }'
'		 if (!stat_gps) { msgID += "As coordenadas GPS t�m de ser valores num�ricos [ex: -3,02345].\n";status=false;}'
'        if (!status) alert ("ATEN��O! Existem erros no preenchimento do formul�rio.\n\n" + msgID +"\n" + msg);'
'        return status;'
'       }'	
	
function validadadosLeitor(){
       var status=true;
       var msg="";var msgID="";
	    if (!ValidateData(document.getElementById("v3"))) return false;	
		if (!ValidateEmail(document.getElementById("v9"))) return false;
       	if (document.getElementById("v20").options[document.getElementById("v20").selectedIndex].value=="")
		{msg = "BIBLIOTECA"; status=false; }
		if (document.getElementById("v1").value=="")
        {msg= (msg != "") ? msg+ ",N� de LEITOR": msg+"N� de LEITOR"; status=false; }
        else {
		    var valor = parseInt(document.getElementById("v1").value);
            if (isNaN(valor)) 
            {msgID = "O campo N.� de leitor tem de ser num�rico!\n";status=false;}
		}	
        if (document.getElementById("v2").value=="")
        {msg= (msg != "") ? msg+ ",NOME": msg+"NOME"; status=false; }
        if (document.getElementById("v4").value=="")
        {msg=  (msg != "") ? msg +",MORADA": msg+ "MORADA"; status=false; }
        if (document.getElementById("v5").value=="")
        {msg= (msg != "") ? msg +",CONCELHO": msg+ "CONCELHO" ; status=false; }
        if (msg != "")  msg= "O(s) campo(s) " + msg + " �(s�o) obrigat�rio(s).\n";
		if (!status) alert ("ATEN��O! Existem erros no preenchimento do formul�rio.\n\n" + msg+msgID)
		return status;
    }
		   
   function chkuser(){
		   var flag=false; var now=new Date();
		   new Ajax.Request('../cgi/www.exe/[in=veruser.in]?sigla='+document.getElementById("v2").value.toLowerCase()+'&r='+ now.getTime(), {     
           method:'get',     
		   onSuccess: function(transport){       
		   var response = transport.responseText || "nao";
      	   
		   if (response.indexOf('sim')!=-1) {alert("ATEN��O! J� existe um utilizador com esta SIGLA ["+document.getElementById("v2").value.toUpperCase()+"]");} 
		   else 
		     {
			   document.getElementById("v7").value=check(document.getElementById("v7"));
			   document.getElementById("confirma").value=check(document.getElementById("confirma"));
			   flag=validadados(); 
			   if (flag) {document.getElementById("frminuser").action ="/rbcatalogo/cgi/www.exe/[in=newuser.in]?r="+now.getTime(); document.getElementById("frminuser").submit();}
			 }},
		   onFailure: function(){ alert('Ocorreu um erro. Contacte o administrador.') }}); 
		   return false;
   }
   
    function chkleitor(){
		   var flag=false;var now=new Date();

		   new Ajax.Request('../cgi/www.exe/[in=verleitor.in]?nome='+ConvUp(document.getElementById("v2").value)+'&r='+now.getTime(), {     
           method:'get',     
		   onSuccess: function(transport){       
		   var response = transport.responseText || "nao";
		   if (response.indexOf('sim')!=-1) {alert("ATEN��O! J� existe um utilizador com este nome ["+document.getElementById("v2").value.toUpperCase()+"]");} 
		   else 
		     {
			   flag=validadadosLeitor(); 
			   if (flag) {document.getElementById("frminleitor").action ="/rbcatalogo/cgi/www.exe/[in=newleitor.in]?r="+now.getTime(); document.getElementById("frminleitor").submit();}}},     
		   onFailure: function(){ alert('Ocorreu um erro. Contacte o administrador.') }   }); 
		   return false;
   }
	    
  function pwdRob(pwd){
	        var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
			var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
            var enoughRegex = new RegExp("(?=.{6,}).*", "g");
			var strength = document.getElementById('pwd');
			if (pwd.value.length==0) {
			strength.innerHTML = "";
			} else if (false == enoughRegex.test(pwd.value)) {
			strength.innerHTML = "<img src='/rbcatalogo/imagens/picgest/pwd0.svg' border='0' height='25' width='110'/>";   //muito fraca
			} else if (strongRegex.test(pwd.value)) {
			strength.innerHTML = "<img src='/rbcatalogo/imagens/picgest/pwd4.svg' border='0' height='25' width='110'/>";  //muito boa
			} else if (mediumRegex.test(pwd.value)) {
			strength.innerHTML = "<img src='/rbcatalogo/imagens/picgest/pwd2.svg' border='0' height='25' width='110'/>";  //razo�vel
			} else { 
			strength.innerHTML = "<img src='/rbcatalogo/imagens/picgest/pwd1.svg' border='0' height='25' width='110'/>";  //fraca
			}
		  } 

  function chgColor(ob,status){
	    switch (status){
		  case true:ob.style.backgroundColor="#99ff66";break;
		  case false:ob.style.backgroundColor="#fff";break;
		  default:
		}
		//document.getElementById("pwd").innerHTML="";
	}
	
  function alpha(s){
	
	for(var j=0; j<s.length; j++)
	{
		  var alphaa = s.charAt(j);
		  var hh = alphaa.charCodeAt(0);
		  if( (hh > 64 && hh<91) || (hh > 96 && hh<123))
		  {
		  }
		    else return false;
		  
 	}
 return true;
 }

/**
*
*  UTF-8 data encode / decode
*  http://www.webtoolkit.info/
*
**/
 
var Utf8 = {
	// public method for url encoding
	encode : function (string) {
		string = string.replace(/\r\n/g,"\n");
		var utftext = "";
 
		for (var n = 0; n < string.length; n++) {
 
			var c = string.charCodeAt(n);
 
			if (c < 128) {
				utftext += String.fromCharCode(c);
			}
			else if((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			}
			else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}
 
		}
 
		return utftext;
	},
 
	// public method for url decoding
	decode : function (utftext) {
		var string = "";
		var i = 0;
		var c = c1 = c2 = 0;
 
		while ( i < utftext.length ) {
 
			c = utftext.charCodeAt(i);
 
			if (c < 128) {
				string += String.fromCharCode(c);
				i++;
			}
			else if((c > 191) && (c < 224)) {
				c2 = utftext.charCodeAt(i+1);
				string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
				i += 2;
			}
			else {
				c2 = utftext.charCodeAt(i+1);
				c3 = utftext.charCodeAt(i+2);
				string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
				i += 3;
			}
 
		}
 
		return string;
	}
 
}
String.prototype.soundex = function(p){ //v1.0
	var i, j, r, p = isNaN(p) ? 4 : p > 10 ? 10 : p < 4 ? 4 : p,
	m = {BFPV: 1, CGJKQSXZ: 2, DT: 3, L: 4, MN: 5, R: 6},
	r = (s = this.toUpperCase().replace(/[^A-Z]/g, "").split("")).splice(0, 1);
	for(i in s)
		for(j in m)
			if(j.indexOf(s[i]) + 1 && r[r.length-1] != m[j] && r.push(m[j]))
				break;
	return r.length > p && (r.length = p), r.join("") + (new Array(p - r.length + 1)).join("0");
};
Array.prototype.max = function() {
var max = this[0];
var len = this.length;
for (var i = 1; i < len; i++) if (this[i] > max) max = this[i];
return max;
}
Array.prototype.min = function() {
var min = this[0];
var len = this.length;
for (var i = 1; i < len; i++) if (this[i] < min) min = this[i];
return min;
}

function trim(stringToTrim){
	return stringToTrim.replace(/^\s+|\s+$/g,"");
}
function ltrim(stringToTrim){
	return stringToTrim.replace(/^\s+/,"");
}
function rtrim(stringToTrim){
	return stringToTrim.replace(/\s+$/,"");
}

var dtCh= "-";
var minYear=1900;
var maxYear=2100;

function isInteger(s){
	var i;
    for (i = 0; i < s.length; i++){   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}

function stripCharsInBag(s, bag){
	var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++){   
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function daysInFebruary (year){
	// February has 29 days in any year evenly divisible by four,
    // EXCEPT for centurial years which are not also divisible by 400.
    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}
function DaysArray(n) {
	for (var i = 1; i <= n; i++) {
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) {this[i] = 29}
   } 
   return this
}

function isDate(dtStr){
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strDay=dtStr.substring(0,pos1)
	var strMonth=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1){
		alert("O formato da data deve ser: dd-mm-yyyy .")
		return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		alert("Por favor indique um m�s v�lido.")
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		alert("Por favor indique um dia do m�s v�lido.")
		return false
	}
	if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
		alert("Por favor indique um ano entre "+minYear+" e "+maxYear+".")
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		alert("Por favor indique uma data v�lida.")
		return false
	}
return true
}

function ValidateEmail(ctrl){
var strMail = ctrl.value;   
if (strMail=="") return true;    
var regMail =/^\w+([-.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;        
if (regMail.test(strMail)) {            
	return true;}        
else {
	ctrl.value = "";            
	ctrl.focus();            
	alert("Email inv�lido.\nPor favor indique um email v�lido no formato nome@servidor.dominio");            
	return false;        
	}
}

function ValidateData(ctrl){
   
	    if (ctrl.value !="" && !isDate(ctrl.value)) 
		{
		    ctrl.value="";
			ctrl.focus();    
			return false;
		}else return true;
		
}		
function ValidateSigla(ctrl){
   
	       var sigla=ctrl.value; 
		   switch (sigla.toLowerCase())
		   {
		    case 'admin':
		    	ctrl.value="";
				ctrl.focus(); 
				alert('O nome da entidade agrupante n�o � v�lido.');   
				return false;
				break;
			case '': 
			    return true;
			    break;     	
		    default:
			   var flag=false;
			   new Ajax.Request('cgi/www.exe/[in=veragr.in]?agr='+sigla.toLowerCase(), {     
			   method:'get', 		   
			   onSuccess: function(transport){       
			   var response = transport.responseText || "nao";      
			   if (response.indexOf('sim')!=-1) 
				  flag= true;				  
			   else 
				 {	   
				ctrl.value="";
				ctrl.focus();    
				alert('A entidade n�o existe ou o nome da entidade agrupante n�o � v�lido.'); 
				}},
				onFailure: function(){ alert('Ocorreu um erro. Contacte o administrador.') }   });
				return flag;
				break;
			}	
}		

function ValidateGPS(str){
        str=rtrim(str);
		if (isNaN(parseInt(str))) return false;
		var regStr =/^[+-]?\d+([,]\d+)*$/;        
		if (regStr.test(str)) {            
			return true;
		}else{ 
		    return false;        
		}		
}

function check(f){ 
   return hex_md5(f.value);	
}

function FileExists(strURL){
    oHttp = window.ActiveXObject ? new ActiveXObject("Microsoft.XMLHTTP") : new XMLHttpRequest(); 
	oHttp.open("GET", strURL, false);
	oHttp.send();
	return (oHttp.responseText);
}
	