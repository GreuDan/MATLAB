function RC_variatia(R,tau,S)
pr=findobj('Tag','Perioada').get('Value');
T=(pr)*2*tau;
t=0:T/100:T/2;
Vc=S*(1-exp(-t./tau));
Cc=(S/R)*exp(-t./tau);
min=tau;
mr=0;
for i=1:length(t)
    if (t(i)==tau)
        mr=i;
    else
        a=tau-t(i);
        if a>0 && a<min
            min=a;
            mr=i;
        end
    end
end
plot(t,Vc).set('Visible','off');
plot(t,Cc).set('Visible','off');
subplot('Position',[0.5 0.1 0.4 0.3]).set('Visible','off');
if findobj('Tag','check1').get('Value')==1 && findobj('Tag','check2').get('Value')==1
    %--------------Permite vizualizarea ambelor variații(tensiune/curent)
    cla(subplot('Position',[0.5 0.1 0.4 0.3]),'reset');
    subplot('Position',[0.5 0.1 0.4 0.3]);
    plot(t,Vc,'g');
    hold on;
    plot(t,Cc,'r');
    hold on
    plot(t(mr),Vc(mr),'*b');
    hold on
    plot(t(mr),Cc(mr),'*b');
    grid on;
    title('Variația tensiunii  și a curentului pe condensator');
    xlabel('Time[µs]');
    xlim([0,5*tau]);
    ylim([0,S]);
    ylabel(['Tensiunea de la susrsă ',num2str(S),'[V]']);
    legend('Tensiunea','Curentul',['tau=',num2str(tau),'µs']);
else
    %------------------Permite vizualizarea variației tensiunii
    plot(t,Vc).set('Visible','off');
    if findobj('Tag','check1').get('Value')==1
        cla(subplot('Position',[0.5 0.1 0.4 0.3]),'reset');
        subplot('Position',[0.5 0.1 0.4 0.3]);
        plot(t,Vc);
        hold on;
        a=plot(t(mr),Vc(mr),'*r');
        grid on;
        title('Variația tensiunii pe condensator');
        xlabel('Time[µs]');
        xlim([0,5*tau]);
        ylim([0,S]);
        ylabel(['Tensiunea de la susrsă ',num2str(S),'[V]']);
        legend(a,['tau=',num2str(tau),'µs']);
    else
        %------------------Permite vizualizarea variației curentului
        if findobj('Tag','check2').get('Value')==1
            cla(subplot('Position',[0.5 0.1 0.4 0.3]),'reset');
            subplot('Position',[0.5 0.1 0.4 0.3]);
            plot(t,Cc);
            hold on
            a=plot(t(mr),Cc(mr),'*r');
            grid on;
            title('Variația curentului pe condensator');
            xlabel('Time[µs]');
            xlim([0,5*tau]);
            ylim([0,S]);
            ylabel(['Tensiunea de la susrsă ',num2str(S),'[V]']);
            legend(a,['tau=',num2str(tau),'µs']);
        else
            cla(subplot('Position',[0.5 0.1 0.4 0.3]),'reset');
            plot(t,Vc).set('Visible','off');
            plot(t,Cc).set('Visible','off');
            subplot('Position',[0.5 0.1 0.4 0.3]).set('Visible','off');
        end
    end
end