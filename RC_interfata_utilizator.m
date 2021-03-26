function RC_interfata_utilizator()
%-------Crearea figurii------------------
Fig=figure('Name','RC-Integrator',...
           'Units','normalized',...
           'Position',[.12 .08 .8 .8],...
           'Color','#00FFFF',...
           'NumberTitle','off');
%-------------Crearea panoului unde introducem R,C,S--------------------
p= uipanel('Title','Introduceți Valori','FontSize',12,...
             'BackgroundColor','#00ffff',...
             'HighLightColor','#000000',...
             'Position',[.05 .5 .3 .5]);
EV=uicontrol('Parent',p,...
             'Style','text',...
             'Units','normalized',...
             'Position',[0.05 0.8 0.7 0.1],...
             'BackgroundColor','#00ffff',...
             'fontsize',10,...
             'fontangle','italic',...
             'String',"Introduceți valoarea sursei:");
%--------------Edit cu  care preluăm valoarea sursei prin folosirea
%tag-ului voltages------------------------------------------------
v=uicontrol('Parent',p,...
             'Style','edit',...
             'Tag','voltages',...
             'Units','normalized',...
             'Position',[0.07 0.7 0.5 0.1],...
             'BackgroundColor','#ffff00',...
             'fontsize',10,...
             'fontangle','italic',...
             'String',"5",...
             'Callback','RC_calcul()');
uv=uicontrol('Parent',p,...
             'Style','text',...
             'Units','normalized',...
             'Position',[0.57 0.69 0.3 0.1],...
             'BackgroundColor','#00ffff',...
             'fontsize',10,...
             'fontangle','italic',...
             'String',"Voltages[V]");
ER=uicontrol('Parent',p,...
             'Style','text',...
             'Units','normalized',...
             'Position',[0.03 0.5 0.7 0.1],...
             'BackgroundColor','#00ffff',...
             'fontsize',10,...
             'fontangle','italic',...
             'String',"Introduceți valoarea rezistenței:");
%--------------Slider cu valoarea între [0.5,100] cu care preluăm valoarea rezistenței prin folosirea
%tag-ului ohms------------------------------------------------
r=uicontrol('Parent',p,...
             'Style','slider',...
             'Tag','ohms',...
             'Units','normalized',...
             'Position',[0.07 0.4 0.5 0.1],...
             'BackgroundColor','#ffff00',...
             'fontsize',10,...
             'fontangle','italic',...
             'Min',0.5,'Max',100,'Value',5,...
             'Callback','RC_calcul()');
ur=uicontrol('Parent',p,...
             'Style','text',...
             'Units','normalized',...
             'Position',[0.57 0.39 0.3 0.1],...
             'BackgroundColor','#00ffff',...
             'fontsize',10,...
             'fontangle','italic',...
             'String',"Ohms[kΩ]");
EC=uicontrol('Parent',p,...
             'Style','text',...
             'Units','normalized',...
             'Position',[0.05 0.2 0.7 0.1],...
             'BackgroundColor','#00ffff',...
             'fontsize',10,...
             'fontangle','italic',...
             'String',"Introduceti valoarea capacitorului:");
%----------------------text care arată valoarea selectată pe slider, actualizare se face prin tag-ul c_val 
Cv=uicontrol('Parent',p,...
             'Style','text',...
             'Units','normalized',...
             'Tag','c_val',...
             'Position',[0.7 0.5 0.1 0.1],...
             'BackgroundColor','#00ffff',...
             'fontsize',10,...
             'fontangle','italic',...
             'String',"5");
%--------------Edit cu  care preluăm valoarea condensatorului prin folosirea tag-ului farads------------------------------------------------
c=uicontrol('Parent',p,...
             'Style','edit',...
             'Tag','farads',...
             'Units','normalized',...
             'Position',[0.07 0.1 0.5 0.1],...
             'BackgroundColor','#ffff00',...
             'fontsize',10,...
             'fontangle','italic',...
             'String',"5",...
             'Callback','RC_calcul()');
uc=uicontrol('Parent',p,...
             'Style','text',...
             'Units','normalized',...
             'Position',[0.57 0.09 0.3 0.1],...
             'BackgroundColor','#00ffff',...
             'fontsize',10,...
             'fontangle','italic',...
             'String',"Farads[nF]");
txtper=uicontrol('Style','text',...
              'Units','normalized',...
              'Position',[0.05 0.4 0.3 0.05],...
              'horizontalAlign','left',...
              'BackgroundColor','#00ffff',...
              'fontsize',10,...
              'String','Selectați numărul de tau pe o semiperioadă:');
%--------------Popupmenu care permite selectarea numărului de tau pe o
%semiperioadă prin folosirea tag-ului Perioada---------------------------
per=uicontrol('Style','popupmenu',...
             'Tag','Perioada',...
             'Units','normalized',...
             'Position',[0.33 0.44 0.05 0.01],...
             'BackgroundColor','#ffff00',...
             'fontsize',10,...
             'Value',5,...
             'String','1|2|3|4|5',...
             'Callback','RC_calcul()');
txtN=uicontrol('Style','text',...
              'Units','normalized',...
              'Position',[0.05 0.33 0.2 0.05],...
              'BackgroundColor','#00ffff',...
              'horizontalAlign','left',...
              'fontsize',10,...
              'String','Setează numărul de perioade:');
%--------------Edit care permite selectarea numărului de perioade prin folosirea tag-ului nr_per---------------------------
edN=uicontrol('Style','edit',...
               'Units','normalized',...
               'Tag','nr_per',...
               'Position',[0.24 0.35 0.05 0.03],...
               'BackgroundColor','#ffff00',...
               'fontsize',10,...
               'String','5',...
               'Callback','RC_calcul()');
%--------------check1 care permite vizualizarea graficului tensiunii pe condensator 
ch1=uicontrol('Style','check',...
             'Tag','check1',...
             'Units','normalized',...
             'Position',[0.05 0.2 0.3 0.05],...
             'BackgroundColor','#00ffff',...
             'Value',1,...
             'fontsize',10,...
             'String',"Variația tensiunii pe condensator",...
             'Callback','RC_calcul()');
%--------------check2 care permite vizualizarea graficului curentului pe condensator 
ch2=uicontrol('Style','check',...
             'Tag','check2',...
             'Units','normalized',...
             'Position',[0.05 0.15 0.3 0.05],...
             'BackgroundColor','#00ffff',...
             'Value',0,...
             'fontsize',10,...
             'String',"Variația curentului pe condensator",...
             'Callback','RC_calcul()');
%Prin bifarea lui check1 si check2 putem să vizualizăm simultan semnalele
%-------------check3 face posibilă vizualizarea graficului de
%încărcare/descărcare pe condensator
ch3=uicontrol('Style','check',...
             'Tag','check3',...
             'Units','normalized',...
             'Position',[0.05 0.25 0.3 0.05],...
             'BackgroundColor','#00ffff',...
             'Value',0,...
             'fontsize',10,...
             'String',"Încărcarea și descărcarea condensatorului",...
             'Callback','RC_calcul()');
txtau=uicontrol('Style','text',...
             'Units','normalized',...
             'Position',[0.01 0.1 0.2 0.05],...
             'BackgroundColor','#00ffff',...
             'fontsize',10,...
             'String',"Valoarea lui tau este:");
%----------------------text care arată valoarea lui tau folosit în circuit, actualizare se face prin tag-ul Tau 
valtau=uicontrol('Style','text',...
             'Units','normalized',...
             'Tag','Tau',...
             'Position',[0.19 0.1 0.05 0.05],...
             'BackgroundColor','#00ffff',...
             'horizontalAlignment', 'left',...
             'fontsize',10,...
             'String',"25");
utau=uicontrol('Style','text',...
             'Units','normalized',...
             'Position',[0.23 0.1 0.05 0.05],...
             'BackgroundColor','#00ffff',...
             'fontsize',10,...
             'String',"[µs]");
%----------------------------pushbutton care resetează toate valorile din circuit------------------
Bp=uicontrol('Style','pushbutton',...
             'Units','normalized',...
             'Tag','btn',...
             'Position',[0.05 0.05 0.05 0.05],...
             'BackgroundColor','#ffff00',...
             'fontsize',10,...
             'String','Reset',...
             'Callback','reset_aplicatia()'); 