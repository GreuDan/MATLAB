function RC_calcul()
%----------Preluăm valorile R,C,S----------------
S=str2num(findobj('Tag','voltages').get('String'));
R=findobj('Tag','ohms').get('Value');
C=str2num(findobj('Tag','farads').get('String'));
%----------Actualizăm tau------------------------
findobj('Tag','c_val').set('String',R);
tau=R*C;
findobj('Tag','Tau').set('String',tau);
%-----------Apelăm funcțile de calcul------------
RC_variatia(R,tau,S);
RC_incarcare_descarcare(tau,S);
