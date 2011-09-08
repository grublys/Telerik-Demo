

/* js/profile.js */

var profileSwitch=function(){function a(){var c=document.getElementById("nav-profile-lang");
var d=document.getElementById("current-locale");
var b=document.getElementById("nav-profile-lang-list");
YEvent.on(d,"mouseover",function(){YDom.addClass(c,"hover")
});
YEvent.on(b,"mouseover",function(){YDom.addClass(c,"hover")
});
YEvent.on(c,"mouseout",function(){YDom.removeClass(c,"hover")
})
}return{init:function(){if(!document.getElementById("nav-profile-lang")){return false
}a()
}}
}();
YEvent.on(window,"load",profileSwitch.init);
var toggleWarning=function(){var b=document.getElementById("locale-createInternationalProfile");
var a=document.getElementById("unsupported");
var d=function(){b.onchange=function(){c()
}
};
var c=function(){for(var e=0;
supportedLanguages.length>e;
e++){var f=supportedLanguages[e];
if(b.options[b.selectedIndex].value==f){LI.hide(a);
break
}else{LI.show(a)
}}};
return{init:function(){if(!document.getElementById||!document.getElementById("locale-createInternationalProfile")){return
}d()
}}
}();
YEvent.on(window,"load",toggleWarning.init);
var flagPhotoForm={init:function(){if(!document.getElementById||!document.getElementById("flag-form")){return
}var a=YDom.getElementsByClassName("flag-photo","li")[0].getElementsByTagName("a")[0];
var c=YDom.getElementsByClassName("profile-control","div")[0];
var b=document.getElementById("cancel-flag");
a.onclick=function(){YDom.addClass(c,"open");
return false
};
b.onclick=function(){YDom.removeClass(c,"open");
return false
}
}};
YEvent.on(window,"load",flagPhotoForm.init);
var bubbleInfo=function(){return{init:function(){if(!YDom.get("introlink-bot")){return
}var a=YDom.get("introlink-bot");
if(a.nextSibling&&/bubble/.test(a.nextSibling.className)){a.onmouseover=a.onmouseout=function(){LI.toggle(this.nextSibling)
}
}}}
}();
YEvent.on(window,"load",bubbleInfo.init);
var profileExperts={init:function(){if(!document.getElementById||!document.getElementById("experts")){return
}var e=document.getElementById("experts");
var d=e.getElementsByTagName("li");
if(d.length>4){var b=document.getElementById("nobullet").style.display="list-item";
var c=document.getElementById("see-more-experts");
var a=d.length-1;
c.onclick=function(){profileExperts.toggleExperts(d,a);
return false
};
profileExperts.showExpertsOnInit(d,a)
}},toggleExperts:function(c,a){var d=0;
if(c[3].style.display=="list-item"){profileExperts.showExpertsOnInit(c,a)
}else{for(var b=0;
c.length>b;
b++){if(b<a){if(b>2){c[b].style.display="list-item";
d++
}}}document.getElementById("see-more-experts").innerHTML=i18n.seeLess
}},showExpertsOnInit:function(d,b){var f=0;
for(var c=0;
d.length>c;
c++){if(c<b){if(c>2){LI.hide(d[c]);
f++
}}}var a;
if(f==1){a=i18n.other
}else{a=i18n.others
}var e=i18n.and+" "+f+" "+a;
document.getElementById("see-more-experts").innerHTML=e
}};
var profileRecs={sets:null,showlinks:null,selectedSet:null,init:function(){if(!document.getElementById||!document.getElementById("showlinks-rec")){return
}profileRecs.showlinks=document.getElementById("showlinks-rec").getElementsByTagName("a");
for(var a=0;
a<profileRecs.showlinks.length;
a++){profileRecs.showlinks[a].onclick=function(){profileRecs.toggleSets(this);
return false
}
}profileRecs.sets=YDom.getElementsByClassName("recset","div");
profileRecs.hideAllSets();
profileRecs.showSet(profileRecs.selectedSet);
profileRecs.updateLinkClasses(profileRecs.selectedSet)
},toggleSets:function(a){profileRecs.hideAllSets();
var b=a.href.split("#")[1];
profileRecs.showSet(b);
profileRecs.updateLinkClasses(b)
},showSet:function(a){LI.show("recset_"+a)
},hideAllSets:function(){for(var a=0;
a<profileRecs.sets.length;
a++){LI.hide(profileRecs.sets[a])
}},updateLinkClasses:function(b){for(var a=0;
a<profileRecs.showlinks.length;
a++){YDom.removeClass(profileRecs.showlinks[a],"chosen");
if(profileRecs.showlinks[a].href.split("#")[1]==b){YDom.addClass(profileRecs.showlinks[a],"chosen")
}}}};
var profileQa={init:function(){if(!document.getElementById||!document.getElementById("showlinks-qa")){return
}LI.hide("hdr-q");
LI.hide("hdr-a");
var c=YDom.get("showlinks-qa");
var a=c.getElementsByTagName("a");
for(var b=0;
a.length>b;
b++){a[b].onclick=function(){profileQa.toggleQA(this.id);
return false
}
}if(isQuestionMode){profileQa.toggleQA("qLink")
}else{profileQa.toggleQA("aLink")
}},toggleQA:function(a){if(a=="qLink"){if(YDom.get("my-q")){LI.show("my-q")
}if(YDom.get("my-a")){LI.hide("my-a")
}if(YDom.get("qLink")){YDom.get("qLink").className="on"
}if(YDom.get("aLink")){YDom.get("aLink").className="off"
}}else{if(YDom.get("my-q")){LI.hide("my-q")
}if(YDom.get("my-a")){LI.show("my-a")
}if(YDom.get("qLink")){YDom.get("qLink").className="off"
}if(YDom.get("aLink")){YDom.get("aLink").className="on"
}}}};
YEvent.on(window,"load",profileQa.init);
(function(){function b(){var f=YDom.getElementsByClassName("primary-profile-content");
var d;
for(var c=0;
c<f.length;
c++){d=f[c];
var e=document.createElement("span");
e.className="control";
d.appendChild(e);
YDom.addClass(d,"collapse-open");
e._content=d;
f._control=e;
YEvent.on(e,"click",a)
}}function a(){var d=this;
var c=d._content;
if(YDom.hasClass(c,"collapse-open")){YDom.replaceClass(c,"collapse-open","collapse-close")
}else{YDom.replaceClass(c,"collapse-close","collapse-open")
}}YEvent.onDOMReady(b)
})();
function ToggleModuleVisibility(b,a){YEvent.on(b,"click",this.toggle,a)
}ToggleModuleVisibility.prototype={toggle:function(a,b){var c=YDom.get(b.parentID);
if(YDom.hasClass(c,"open")){YDom.removeClass(c,"open");
YDom.addClass(c,"close");
oUISettings.saveSettings(b.setting,"true")
}else{YDom.removeClass(c,"close");
YDom.addClass(c,"open");
oUISettings.saveSettings(b.setting,"false")
}}};
function ConnectionBrowseVcard(c,b){var a=c.getElementsByTagName("li");
YAHOO.util.Event.addListener(a,"mouseover",function(d){YAHOO.util.Dom.addClass(this,"hover")
});
YAHOO.util.Event.addListener(a,"mouseout",function(d){YAHOO.util.Dom.removeClass(this,"hover")
})
}function getRegionAndCityOptions(d,e){if(!e||typeof(e)!="object"||!e.countryFieldId||!e.postalCodeId||!e.resultsContainerId||!e.requestURL){return
}var j=document.getElementById(e.countryFieldId),b=document.getElementById(e.postalCodeId),g=document.getElementById(e.resultsContainerId),h=Y$("ul",g,true);
var c=h.innerHTML,f=null,a=null,i=null;
resetEl=function(){h.innerHTML=c;
g.style.display="none"
};
goGetMatchingLocations=function(m){clearTimeout(i);
resetEl();
var k=function(t){try{var s=YAHOO.lang.JSON.parse(t.responseText);
if(s&&s.formOptions&&s.formOptions.length>0){a="";
for(var q=0,p=s.formOptions.length;
q<p;
q++){a+='<li><label><input type="radio" name="'+s.formKey+'" value="'+s.formOptions[q].formValue+'" ';
if(s.checkedValue==s.formOptions[q].formValue){a+=' checked="checked" '
}a+="/> "+s.formOptions[q].formLabel+"</label></li>"
}h.innerHTML=a;
g.style.display="block"
}}catch(r){return
}};
var n={success:k};
var l=function(){YAHOO.util.Connect.asyncRequest("GET",e.requestURL+((e.requestURL.indexOf("?")>0)?"&":"?")+"countryCode="+j.options[j.selectedIndex].value+"&postalCode="+b.value,n)
};
i=setTimeout(l,300)
};
if(j&&b&&g&&h){YEvent.on(j,"change",goGetMatchingLocations);
YEvent.on(b,"keyup",goGetMatchingLocations)
}goGetMatchingLocations()
};

/* js/showhide.js */

var showHide={init:function(k){var g=(k)?YDom.get(k):document;
var h=YDom.getElementsByClassName("showhide-block","*",g);
for(var f=0;
f<h.length;
f++){LI.hide(h[f])
}var b=YDom.getElementsByClassName("showhide-link","*",g);
for(var e=0;
e<b.length;
e++){var d=b[e].getElementsByTagName("a");
for(var c=0;
c<d.length;
c++){YEvent.on(d[c],"click",showHide.toggle);
d[c].onclick=function(){return false
};
if(/-show/.test(d[c].id)){b[e].style.display="block"
}}}},toggle:function(d){var b=YEvent.getTarget(d);
var a=b.id;
var g=a.split("-")[0];
var c=a.split("-")[1];
var f=YDom.get(g);
if(c=="show"){LI.show(f);
if(YDom.get(g+"-hide")){YDom.get(g+"-hide").parentNode.style.display="block"
}}else{LI.hide(f);
YDom.get(g+"-show").parentNode.style.display="block"
}LI.hide(b.parentNode)
}};

/* js/nprofile_public.js */

var Base64={_keyStr:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",encode:function(c){var a="";
var k,h,f,j,g,e,d;
var b=0;
c=Base64._utf8_encode(c);
while(b<c.length){k=c.charCodeAt(b++);
h=c.charCodeAt(b++);
f=c.charCodeAt(b++);
j=k>>2;
g=((k&3)<<4)|(h>>4);
e=((h&15)<<2)|(f>>6);
d=f&63;
if(isNaN(h)){e=d=64
}else{if(isNaN(f)){d=64
}}a=a+this._keyStr.charAt(j)+this._keyStr.charAt(g)+this._keyStr.charAt(e)+this._keyStr.charAt(d)
}return a
},decode:function(c){var a="";
var k,h,f;
var j,g,e,d;
var b=0;
c=c.replace(/[^A-Za-z0-9\+\/\=]/g,"");
while(b<c.length){j=this._keyStr.indexOf(c.charAt(b++));
g=this._keyStr.indexOf(c.charAt(b++));
e=this._keyStr.indexOf(c.charAt(b++));
d=this._keyStr.indexOf(c.charAt(b++));
k=(j<<2)|(g>>4);
h=((g&15)<<4)|(e>>2);
f=((e&3)<<6)|d;
a=a+String.fromCharCode(k);
if(e!=64){a=a+String.fromCharCode(h)
}if(d!=64){a=a+String.fromCharCode(f)
}}a=Base64._utf8_decode(a);
return a
},_utf8_encode:function(b){b=b.replace(/\r\n/g,"\n");
var a="";
for(var e=0;
e<b.length;
e++){var d=b.charCodeAt(e);
if(d<128){a+=String.fromCharCode(d)
}else{if((d>127)&&(d<2048)){a+=String.fromCharCode((d>>6)|192);
a+=String.fromCharCode((d&63)|128)
}else{a+=String.fromCharCode((d>>12)|224);
a+=String.fromCharCode(((d>>6)&63)|128);
a+=String.fromCharCode((d&63)|128)
}}}return a
},_utf8_decode:function(a){var b="";
var d=0;
var e=c1=c2=0;
while(d<a.length){e=a.charCodeAt(d);
if(e<128){b+=String.fromCharCode(e);
d++
}else{if((e>191)&&(e<224)){c2=a.charCodeAt(d+1);
b+=String.fromCharCode(((e&31)<<6)|(c2&63));
d+=2
}else{c2=a.charCodeAt(d+1);
c3=a.charCodeAt(d+2);
b+=String.fromCharCode(((e&15)<<12)|((c2&63)<<6)|(c3&63));
d+=3
}}}return b
}};
YEvent.onDOMReady(function(){var b=YDom.getElementsByClassName("decoder");
for(var c=0,a=b.length;
c<a;
c++){b[c].innerHTML=LI.htmlEncode(Base64.decode(b[c].title))+" ";
b[c].removeAttribute("title")
}});