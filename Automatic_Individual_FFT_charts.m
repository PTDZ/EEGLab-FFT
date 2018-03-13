
%% Rysowanie wykresów FFT (FFT dla wszystkich elektrod) dla wszystkich badanych
% plik ALLEEG; tylko dane REST
% plik WynikiFFT_REST (dla œredniej)

% Loaduje moj¹ color mapê
% https://www.mathworks.com/help/matlab/ref/colormapeditor.html

ax = gca;
load('MyColormap','mycmap')
colormap(ax,mycmap)

%%
for i = 1:length(ALLEEG)
    
    EEG = ALLEEG(i);
    
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, i,'overwrite','on','gui','off');
    
    %wykres fft
    % overlap - nak³adanie siê okienek, wartoœæ w punktach - 375 - 75% trzy czêœci z 500 punków
    % spectopo.m ze zmienionymi parametrami graficznymi (wielkoœæ fontów, kolor i gruboœæ linii)
    h=figure('units','normalized','outerposition',[0 0 1 1]); pop_spectopo(EEG, 1, [0  998], 'EEG' , 'percent', 100, 'freq', [6 10 15 22 40 60], 'freqrange',[1 70],'electrodes','off', 'overlap', 375);

    hold on;
        %wybor kolormapy
        colormap(mycmap)
    hold off;
    
    hold on;
    % wyszukuje wszystkie osie
    % nastepny wykres
    hAllAxes = findobj(gcf,'type','axes');
    plot(hAllAxes(9),freqs,10*log10(WynikiFFT_REST(i).Mean_El_1_value),'LineWidth',4,'Color',[1 0.2 0.3]);
    hold off;
    
    %zapisz jako plik
    saveas(h,sprintf('ImageFFT/FIG_REST_%s.fig',EEG.setname(1:3)));
    saveas(h,sprintf('ImageFFT/FIG_REST_%s.png',EEG.setname(1:3)));
end