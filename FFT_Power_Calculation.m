
%% Obliczanie FFT dla wszystkich badanych, metoda Welcha   
      h = waitbar(0,'Rozpoczêcie obliczeñ');
      waitX = length(ALLEEG);
      len_i = length(ALLEEG);
      for i = 1:len_i
         clear spectra freqs 
         for jj = 1:size(ALLEEG(i).data,3)
            for kk = 1:size(ALLEEG(i).data,1)
                [WynikiFFT_REST(i).data(kk,:,jj), freqs] = pwelch(ALLEEG(i).data(kk,:,jj), 500, 375, 500, 500,'PSD');
            end
         end
      waitbar(i/waitX,h,sprintf('%d/%d badanych przeanalizowanych',i,len_i))
      end
      close(h);
%% Usrednianie wynikow po okienkach, zostaja tylko el. i bin. czestotliwosciowe
for i = 1:length(WynikiFFT_REST)
      WynikiFFT_REST(i).Mean_W=mean(WynikiFFT_REST(i).data,3);   
end  
%% Rysowanie przykladowych wykresow, dla spr.
% Wszystkie elektrody!
      plot(freqs,10*log10(WynikiFFT_REST(6).Mean_W)); 
      
%% Usrednianie wynikow po elektrodach, zostaje tylko jedna srednia dla wszystkich elektrod
for i = 1:length(WynikiFFT_REST)
      WynikiFFT_REST(i).Mean_El_1_value=mean(WynikiFFT_REST(i).Mean_W,1);   
end  
%% Rysowanie przykladowych wykresow, dla spr.
% Srednia ze wszystkich elektrod!
      plot(freqs,10*log10(WynikiFFT_REST(6).Mean_El_1_value));
%% Wszystkie wyniki w podziale na pasma - nowa macierz Pasma_WynikiFFT
    Pasma_WynikiFFT_REST.PasmaALL = vertcat(WynikiFFT_REST.Mean_W)
    
%% Uciecie powyzej 70 Hz - nowa macierz Pasma_70 
  Cut = (71:251);
  Pasma_WynikiFFT_REST.Pasma_70 = Pasma_WynikiFFT_REST.PasmaALL
  Pasma_WynikiFFT_REST.Pasma_70(:,Cut) = []
  
%% Podzia³ na pasma i zapis
%Pasma:
Delta_Cut = (1:3); 
Theta_Cut = (4:7); 
Alfa_Cut = (8:12); 
BetaL_Cut = (13:16); 
BetaH_Cut = (17:30);
GammaL_Cut = (31:45); 
GammaH_Cut = (55:70);

%Zapis
Pasma_WynikiFFT_REST.DeltaALL = Pasma_WynikiFFT_REST.Pasma_70(:,Delta_Cut);
Pasma_WynikiFFT_REST.ThetaALL = Pasma_WynikiFFT_REST.Pasma_70(:,Theta_Cut);
Pasma_WynikiFFT_REST.AlfaALL = Pasma_WynikiFFT_REST.Pasma_70(:,Alfa_Cut);
Pasma_WynikiFFT_REST.BetaLALL = Pasma_WynikiFFT_REST.Pasma_70(:,BetaL_Cut);
Pasma_WynikiFFT_REST.BetaHALL = Pasma_WynikiFFT_REST.Pasma_70(:,BetaH_Cut);
Pasma_WynikiFFT_REST.GammaLALL = Pasma_WynikiFFT_REST.Pasma_70(:,GammaL_Cut);
Pasma_WynikiFFT_REST.GammaHALL = Pasma_WynikiFFT_REST.Pasma_70(:,GammaH_Cut);

%% Œrednia dla wszystkich pasm (srednia wynikow z pasm np. 1:3 dla Delty)
Pasma_WynikiFFT_REST.Mean_Delta = mean(Pasma_WynikiFFT_REST.DeltaALL,2);
Pasma_WynikiFFT_REST.Mean_Theta = mean(Pasma_WynikiFFT_REST.ThetaALL,2);
Pasma_WynikiFFT_REST.Mean_Alfa = mean(Pasma_WynikiFFT_REST.AlfaALL,2);
Pasma_WynikiFFT_REST.Mean_BetaL = mean(Pasma_WynikiFFT_REST.BetaLALL,2);
Pasma_WynikiFFT_REST.Mean_BetaH = mean(Pasma_WynikiFFT_REST.BetaHALL,2);
Pasma_WynikiFFT_REST.Mean_GammaL = mean(Pasma_WynikiFFT_REST.GammaLALL,2);
Pasma_WynikiFFT_REST.Mean_GammaH = mean(Pasma_WynikiFFT_REST.GammaHALL,2);
%

%% WSZYSTKIE PASMA

Pasma_WynikiFFT_REST.WszystkiePasma_Mean = horzcat(Pasma_WynikiFFT_REST.Mean_Delta,Pasma_WynikiFFT_REST.Mean_Theta,Pasma_WynikiFFT_REST.Mean_Alfa,Pasma_WynikiFFT_REST.Mean_BetaL,Pasma_WynikiFFT_REST.Mean_BetaH,Pasma_WynikiFFT_REST.Mean_GammaL,Pasma_WynikiFFT_REST.Mean_GammaH);
