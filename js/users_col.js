//** OIR - OPAC.isisRBE
function getAction(){
	 var pos=document.getElementById("susers").selectedIndex;
	 var x=document.getElementById("susers").options[pos].value;
	 document.getElementById("expressao").value="SIGLA "+x;
	 document.getElementById("frmseluser").submit();
	
}

function getOp(){
   var pos=document.getElementById("criterio").selectedIndex;
   var x=document.getElementById("criterio").options[pos].value;
   switch(x){
   case 'X': document.getElementById("frmgescol").action="col_colselop.asp";break;
   case 'i': document.getElementById("frmgescol").action="cgi/www.exe/[in=mnucol.in]"; document.getElementById("mnu").value="2";break;
   case 'c': document.getElementById("frmgescol").action="cgi/www.exe/[in=mnucol.in]"; document.getElementById("mnu").value="3";break;	 
   }
   document.getElementById("frmgescol").submit();
}

function getOpCol(){
   var pos=document.getElementById("opges").selectedIndex;
   var x=document.getElementById("opges").options[pos].value;
   if (x!="" && document.getElementById("termo").value=="") {alert("ATENÇÃO! O termo não pode ficar vazio.");return false}
   var ss= x + " " +  document.getElementById("termo").value;
   var flag=false;
   if(document.getElementById("op").value.toUpperCase()==document.getElementById("base").value.toUpperCase()) flag=true;
   document.getElementById("op").value=document.getElementById("op").value.toUpperCase();
   document.getElementById("expressao").value =(document.getElementById("op").value=='X' || flag==true? ss : "SI " + document.getElementById("op").value+ " AND " + ss);
   if(document.getElementById("PFX").checked==false) document.getElementById("expressao").value += "$";
   if(document.getElementById("limites").value =="" || parseInt(document.getElementById("limites").value)<=0 || parseInt(document.getElementById("limites").value)>1000 ) document.getElementById("limites").value="25";
   document.getElementById("frmselcri").submit();
}

function getOpsel(){
	 var pos=document.getElementById("susers").selectedIndex;
	 if (pos==-1) {alert("ATENÇÃO! É necessário selecionar uma biblioteca ou entidade.");return false}
	 var x=document.getElementById("susers").options[pos].value;
	 var tags=x.split("~~");
	 document.getElementById("base").value=tags[1]; 
	 document.getElementById("users").value=tags[0];

	 if (FileExists("../../admin/chkfile.asp?vdir=/rbcatalogo&fname="+tags[1].toLowerCase()+"&d="+new Date().getTime())=='False') {alert("ATENÇÃO! Biblioteca sem base de dados carregada no sistema.");return};
//	 if (tags[0]==tags[1]) 
//		document.getElementById("expressao").value="";
//	 else
//	     document.getElementById("expressao").value="SI "+tags[0];
	 if (document.getElementById("mnu").value=='2')
	    document.getElementById("frmselcri").action="../../col_colselop.asp";
	 else
	 {
	   document.getElementById("base").value=document.getElementById("base").value.toLowerCase();
	   document.getElementById("frmselcri").action="../../col_graficos.asp";
	 }  
	 document.getElementById("frmselcri").submit();
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

function check(f){ 
   return hex_md5(f.value);	
}

function FileExists(strURL){
    oHttp = window.ActiveXObject ? new ActiveXObject("Microsoft.XMLHTTP") : new XMLHttpRequest(); 
	oHttp.open("GET", strURL, false);
	oHttp.send();
	return (oHttp.responseText);
}
