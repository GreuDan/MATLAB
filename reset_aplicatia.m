function reset_aplicatia()
%----------------Resetează toată aplicația--------------------
findobj('Tag','voltages').set('String',5);
findobj('Tag','ohms').set('Value',5);
findobj('Tag','farads').set('String',5);
findobj('Tag','check1').set('Value',1);
findobj('Tag','check2').set('Value',0);
findobj('Tag','Perioada').set('Value',5);
findobj('Tag','nr_per').set('String','5');
findobj('Tag','check3').set('Value',0);
RC_calcul();