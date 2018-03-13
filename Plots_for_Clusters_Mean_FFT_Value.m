%% Sortowanie danych
% Sortuje najpierw rosn¹co dla Pasma, a póŸniej rosn¹co dla nazwy Klastra
% dane Datasrednie.mat

%% Sortowanie danych
Datasrednie = sortrows(Datasrednie,'Band','ascend');
Datasrednie = sortrows(Datasrednie,'Klaster','ascend');
% 

%% Rysowanie wykresow - dla ka¿dego obszaru wszystkie wykresy razem
koniec = height(Datasrednie);
 for i = 1:14:koniec
     
        %Rozszerzenie okienka na max  
        figure('units','normalized','outerposition',[0 0 1 1]); 
        
        %Dane dla rysowania wykresu, kolejne s³upki
        alfa_rest = Datasrednie.Mean(i);         alfa_zad = Datasrednie.Mean(i+1);
        beta_H_rest = Datasrednie.Mean(i+2);       beta_H_zad = Datasrednie.Mean(i+3);
        beta_L_rest = Datasrednie.Mean(i+4);       beta_L_zad = Datasrednie.Mean(i+5);
        delta_rest = Datasrednie.Mean(i+6);      delta_zad = Datasrednie.Mean(i+7);
        gam_H_rest = Datasrednie.Mean(i+8);      gam_H_zad = Datasrednie.Mean(i+9);
        gam_L_rest = Datasrednie.Mean(i+10);      gam_L_zad = Datasrednie.Mean(i+11);
        theta_rest = Datasrednie.Mean(i+12);      theta_zad = Datasrednie.Mean(i+13);
        
        %Dane dla rysowania w¹sów, kolejne s³upki
        alfa_rest_S = Datasrednie.SE(i);         alfa_zad_S = Datasrednie.SE(i+1);
        beta_H_rest_S = Datasrednie.SE(i+2);   beta_H_zad_S = Datasrednie.SE(i+3);
        beta_L_rest_S = Datasrednie.SE(i+4);   beta_L_zad_S = Datasrednie.SE(i+5);
        delta_rest_S = Datasrednie.SE(i+6);      delta_zad_S = Datasrednie.SE(i+7);
        gam_H_rest_S = Datasrednie.SE(i+8);      gam_H_zad_S = Datasrednie.SE(i+9);
        gam_L_rest_S = Datasrednie.SE(i+10);      gam_L_zad_S = Datasrednie.SE(i+11);
        theta_rest_S = Datasrednie.SE(i+12);     theta_zad_S = Datasrednie.SE(i+13);
        
       
        z = [delta_rest delta_zad theta_rest theta_zad alfa_rest alfa_zad beta_L_rest beta_L_zad beta_H_rest beta_H_zad gam_L_rest gam_L_zad gam_H_rest gam_H_zad];
        zz = [delta_rest_S delta_zad_S theta_rest_S theta_zad_S alfa_rest_S alfa_zad_S beta_L_rest_S beta_L_zad_S beta_H_rest_S beta_H_zad_S gam_L_rest_S gam_L_zad_S gam_H_rest_S gam_H_zad_S];
        b = bar(z,'FaceColor',[.19 .22 .22],'EdgeColor',[.19 .22 .22]);
        hold on,errorbar(z,zz,'color',('Red'),'linestyle','none','linewidth',1.2), grid on, grid minor, box off, hold off;
        set(gca,'xticklabel',{'DELTA R','DELTA T','THETA R','THETA T', 'ALFA R', 'ALFA T', 'BETA-L R', 'BETA-L T','BETA-H R', 'BETA-H T', 'GAMMA-L R', 'GAMMA-L T', 'GAMMA-H R', 'GAMMA-H T'});

        % Tytu³ wykresu       
        str_title = sprintf('%s','Power spectrum mean values of EEG frequency bands for ',Datasrednie.Klaster{i},' cluster of electrodes');
        title(str_title);
        
        xlabel('EEG Bands | Task Condition, R - REST, T - TASK'); % x-axis label
        ylabel('Power spectrum'); % y-axis label
        hold on, set(gca,'fontsize',12), hold off
        
        % Rysowanie istotnoœci
        yt = get(gca, 'YTick');
        axis([xlim    0  ceil(max(yt)*1.04)])
        xt = get(gca, 'XTick');
            
        if Datasrednie.pVal(i) < 0.05
            hold on
                plot(xt([1 2]), [1 1]*max(yt)*1.1, '-k',  mean(xt([1 2])), max(yt)*1.15, '*k')
            hold off
        end
        
        if Datasrednie.pVal(i+2) < 0.05
            hold on
                plot(xt([3 4]), [1 1]*max(yt)*1.1, '-k',  mean(xt([3 4])), max(yt)*1.15, '*k')
            hold off
        end
        
        if Datasrednie.pVal(i+4) < 0.05
            hold on
                plot(xt([5 6]), [1 1]*max(yt)*1.1, '-k',  mean(xt([5 6])), max(yt)*1.15, '*k')
            hold off
        end
        
         if Datasrednie.pVal(i+6) < 0.05
            hold on
                plot(xt([7 8]), [1 1]*max(yt)*1.1, '-k',  mean(xt([7 8])), max(yt)*1.15, '*k')
            hold off
         end
        
         if Datasrednie.pVal(i+8) < 0.05
            hold on
                plot(xt([9 10]), [1 1]*max(yt)*1.1, '-k',  mean(xt([9 10])), max(yt)*1.15, '*k')
            hold off
         end
        
        if Datasrednie.pVal(i+10) < 0.05
            hold on
                plot(xt([11 12]), [1 1]*max(yt)*1.1, '-k',  mean(xt([11 12])), max(yt)*1.15, '*k')
            hold off
        end
        
        if Datasrednie.pVal(i+12) < 0.05
            hold on
                plot(xt([13 14]), [1 1]*max(yt)*1.1, '-k',  mean(xt([13 14])), max(yt)*1.15, '*k')
            hold off
        end
                 
        saveas(b,sprintf('IMAGES\\FIG_BAR_%s.png',Datasrednie.Klaster{i}));
 end