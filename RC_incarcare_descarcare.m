function RC_incarcare_descarcare(tau,S)

pr=findobj('Tag','Perioada').get('Value');
nr_T=str2num(findobj('Tag','nr_per').get('String'));
ch=[63.2 86.4 95 98.1 99.3];
dh=[36.7 13.5 4.9 1.8 0.67];
ch_lim=S*ch(pr)/100;
dh_lim=S*dh(pr)/100;
if(findobj('Tag','check3').get('Value')==1)
    %----------------Generăm graficul de încărcarea și descărcarea pe
    %condensator dacă check3 e bifată--------------------------
    subplot('Position',[.5 .5 .4 .4]);
    T=pr*2*tau;
    set(gca,'XLim',[0 nr_T*T],'YLim',[0 S]);
    ta=0:tau/5:5*tau;
    grid on;
    ylabel(['minin:',num2str(dh_lim),'[V] ','maxim:',num2str(ch_lim),'[V]']);
    title('Încărcarea și descărcarea pe condensator');
    Vc=S*(1-exp(-ta./tau));
    Vd=S*exp(-ta./tau);
    Vc(1)=dh_lim;
    for j=1:nr_T
        t1 =0+(j-1)*T:tau/5:T/2+(j-1)*T;
        t2 = T/2+(j-1)*T:tau/5:T+(j-1)*T;  
        wave1=animatedline('Color','b','LineStyle','-','LineWidth',2);
        wave2=animatedline('Color','r','LineStyle','-','LineWidth',2);
        for i=1:length(t1)
            addpoints(wave1,t1(i),Vc(i));
            drawnow
        end
        for i=1:length(t2)
            addpoints(wave2,t2(i),Vd(i));
            drawnow        
        end
    end
else
    %----------------Generăm graficul Tensiunea Vc de ieșire pe condensator fixată dacă check3 nu e bifată--------------------------
    subplot('Position',[.5 .5 .4 .4]);
    T=pr*2*tau;
    set(gca,'XLim',[0 nr_T*T],'YLim',[0 S]);
    title('Tensiunea Vc de ieșire pe condensator fixată');
    ta=0:tau/5:5*tau;
    ylabel(['minin:',num2str(dh_lim),'[V] ','maxim:',num2str(ch_lim),'[V]']);
    grid on;
    Vc=S*(1-exp(-ta./tau));
    Vd=S*exp(-ta./tau);
    Vc(1)=dh_lim;
    Vd(1)=ch_lim;
    for j=1:nr_T
        t1 =0+(j-1)*T:tau/5:T/2+(j-1)*T;
        t2 = T/2+(j-1)*T:tau/5:T+(j-1)*T;  
        wave3=animatedline('Color','g','LineStyle','-','LineWidth',2);
        for i=1:length(t1)
            if(Vc(i)>=dh_lim)
                addpoints(wave3,t1(i),Vc(i));
                drawnow 
            end

        end
        for i=1:length(t2)
            if(Vd(i)<ch_lim)
                addpoints(wave3,t2(i),Vd(i));
                drawnow 
            end
        end
    end
end


