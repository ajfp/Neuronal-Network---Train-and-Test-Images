function   [net2,accuracyTreino,accuracyTeste]=ponto_2(rede)

load(rede);

%--------------------TRATAR PASTA_1------------------------------

Pasta_1 = dir('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_1\*.jpg');
nTotal=length(Pasta_1);
tam=45;
inputs = zeros(tam*tam, length(Pasta_1));

 for i = 1 : length(Pasta_1)
      filename = strcat('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_1\',Pasta_1(i).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      inputs(:,i)=imbinarize(b(:));           
 end

 nTotalVogais1=nTotal;
 
 
 %-------------------------------TRATAR PASTA_2----------------------------
 
Pasta2_A = dir('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_2\A\*.jpg');
Pasta2_E = dir('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_2\E\*.jpg');
Pasta2_I = dir('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_2\I\*.jpg');
Pasta2_O = dir('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_2\O\*.jpg');
Pasta2_U = dir('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_2\U\*.jpg');

nA = length(Pasta2_A);
nE = length(Pasta2_E);
nI = length(Pasta2_I);
nO = length(Pasta2_O);
nU = length(Pasta2_U);

nTotalVogais2= nA + nE + nI + nO + nU;
nTotal = nTotalVogais1 + nTotalVogais2;
tam=45;
inputs2 = zeros(tam*tam, nTotalVogais2);

letra_A = zeros(tam*tam,nA);
letra_E = zeros(tam*tam,nE);
letra_I= zeros(tam*tam,nI); 
letra_O = zeros(tam*tam,nO);
letra_U = zeros(tam*tam,nU);

    for a=1:nA
      filename = strcat('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_2\A\',Pasta2_A(a).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      letra_A(:,a)=imbinarize(b(:));
      
    end
   for e=1:nE
       
      filename = strcat('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_2\E\',Pasta2_E(e).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      letra_E(:,e)=imbinarize(b(:));
   end

for i=1:nI
filename = strcat('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_2\I\',Pasta2_I(i).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      letra_I(:,i)=imbinarize(b(:));


end

for o=1:nO
filename = strcat('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_2\O\',Pasta2_O(o).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      letra_O(:,o)=imbinarize(b(:));
end

for u=1:nU
filename = strcat('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_2\U\',Pasta2_U(u).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      letra_U(:,u)=imbinarize(b(:));
end

%Para colocar todas as imagens numa s� matriz de inputs 

for tot=1:nTotalVogais2 %n� total de imagens da pasta_2
  if tot<=200 
    for a=1:nA
  
    inputs2(:,tot)=letra_A(:,a);
   
    end
  
  else if tot<=400
     for e=1:nE
        inputs2(:,tot)=letra_E(:,e);
     end
  
  else if tot<=600
   for i=1:nI   
            inputs2(:,tot)=letra_I(:,i);
   end
   
  else if tot<=800
   for o=1:nO   
            inputs2(:,tot)=letra_O(:,o);
   end
  
      else 
      for u=1:nU    
         inputs2(:,tot)=letra_U(:,u);
      end
      end
      end
  end
  end
end


%-----------------------------TRATAR PASTA_3------------------------------



Pasta3_A = dir('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_3\A\*.jpg');
Pasta3_E = dir('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_3\E\*.jpg');
Pasta3_I = dir('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_3\I\*.jpg');
Pasta3_O = dir('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_3\O\*.jpg');
Pasta3_U = dir('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_3\U\*.jpg');

nA = length(Pasta3_A);
nE = length(Pasta3_E);
nI = length(Pasta3_I);
nO = length(Pasta3_O);
nU = length(Pasta3_U);

nTotalVogais3 = nA + nE + nI + nO + nU;
nTotal = nTotalVogais1 + nTotalVogais2 + nTotalVogais3;
tam=45;
inputs3 = zeros(tam*tam, nTotalVogais3);

letra_A = zeros(tam*tam,nA);
letra_E = zeros(tam*tam,nE);
letra_I= zeros(tam*tam,nI); 
letra_O = zeros(tam*tam,nO);
letra_U = zeros(tam*tam,nU);


 for a=1:nA
      filename = strcat('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_3\A\',Pasta3_A(a).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      letra_A(:,a)=imbinarize(b(:));
      
    end
   for e=1:nE
       
      filename = strcat('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_3\E\',Pasta3_E(e).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      letra_E(:,e)=imbinarize(b(:));
   end

for i=1:nI
filename = strcat('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_3\I\',Pasta3_I(i).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      letra_I(:,i)=imbinarize(b(:));


end

for o=1:nO
filename = strcat('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_3\O\',Pasta3_O(o).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      letra_O(:,o)=imbinarize(b(:));
end

for u=1:nU
filename = strcat('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_3\U\',Pasta3_U(u).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      letra_U(:,u)=imbinarize(b(:));
end


for tot=1:nTotalVogais3 %n� total de imagens da pasta_3
  if tot<=100 
    for a=1:nA  
    inputs3(:,tot)=letra_A(:,a);   
    end
  
  else if tot<=200
     for e=1:nE
        inputs3(:,tot)=letra_E(:,e);
     end
  
  else if tot<=300
   for i=1:nI   
         inputs3(:,tot)=letra_I(:,i);
   end
   
  else if tot<=400
   for o=1:nO   
         inputs3(:,tot)=letra_O(:,o);
   end  
      else 
      for u=1:nU    
         inputs3(:,tot)=letra_U(:,u);
      end
      end
      end
      end
  end
end




% Inputs = zeros(tam*tam, nTotal);
% j = 1;
% k = 1;
% m = 1;
% 
% for i=1:nTotal
%     if i <= 301
%         if j == 1
%             Inputs(:,i) = inputs(:,j);
%             j = j + 1;
%         else
%             if k <= 200
%                 for q = 
%             else
%                 
%             end
%             
%             for j=1:nTotalVogais1
%                 Inputs(:,i)=inputs(:,j);
%             end
%         end
%         
%         
%     else if i <= 602 && i > 301
%             for k=1:nTotalVogais2
%                 Inputs(:,i)=inputs2(:,k);
%             end
%         else if i <= 903 + nTotalVogais2 + nTotalVogais3 && i > 602
%             for m=1:nTotalVogais3
%                 Inputs(:,i)=inputs3(:,m);
%             end
%             else if i <= 1204 && i > 903
%                     for
%                     end
%                 else if i <= 1505 && i > 1204
%                         for
%                         end      
%                     end
%                 end
%             end            
%         end
%     end
% end



Inputs = zeros(tam*tam, nTotal);
for i=1:nTotal
    if i <= nTotalVogais1
        for j=1:nTotalVogais1
            Inputs(:,i)=inputs(:,j);
        end
    else if i <= nTotalVogais1 + nTotalVogais2 && i > nTotalVogais1
            for k=1:nTotalVogais2
                Inputs(:,i)=inputs2(:,k);
            end
        else if i <= nTotalVogais1 + nTotalVogais2 + nTotalVogais3 && i > nTotalVogais1 + nTotalVogais2
            for m=1:nTotalVogais3
                Inputs(:,i)=inputs3(:,m);
            end
        end
    end
    end
end

Targets=zeros(1,nTotal);
for i = 1:nTotal
    if i<=301
        Targets(1,i)=1;        
    else if i<=602
            Targets(2,i)=1;
        else if i<=903
                Targets(3,i)=1;
            else if i<=1204
                    Targets(4,i)=1;
                else
                    Targets(5,i)=1;
                end
            end
        end
    end
end

 




 
 % COMPLETAR A RESTANTE CONFIGURACAO



 
 % TREINAR
 [net,tr] = train(net, Inputs, Targets);
 view(net);
 close(gcf)
 disp(tr)
 close(gcf)
 out = sim(net, Inputs);
 net2=net;
 %VISUALIZAR DESEMPENHO

 confusion=plotconfusion(Targets, out);

saveas(confusion,'Matriz_Confusao.jpg');
 close(confusion);

 
% Grafico com o desempenho da rede nos 3 conjuntos           
 plotperf(tr);
 saveas(gcf,'Desempenho.png')
 close(gcf)
      

 
 %Calcula e mostra a percentagem de classificacoes corretas no total dos
 %exemplos
 r=0;
 for i=1:size(out,2)               % Para cada classificacao  
   [a b] = max(out(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
   [c d] = max(Targets(:,i));  %d guarda a linha onde encontrou valor mais alto da saida desejada
   if b == d                       % se estao na mesma linha, a classificacao foi correta (incrementa 1)
       r = r+1;
   end
 end
 
 accuracyTreino = r/size(out,2)*100;
 fprintf('Precisao total %f\n', accuracyTreino)

   

% SIMULAR A REDE APENAS NO CONJUNTO DE TESTE
TInput = Inputs(:, tr.testInd);
TTargets = Targets(:, tr.testInd);

out = sim(net, TInput);


%Calcula e mostra a percentagem de classificacoes corretas no conjunto de teste
r=0;
for i=1:size(tr.testInd,2)               % Para cada classificacao  
  [a b] = max(out(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
  [c d] = max(TTargets(:,i));  %d guarda a linha onde encontrou valor mais alto da saida desejada
  if b == d                       % se estao na mesma linha, a classificacao foi correta (incrementa 1)
      r = r+1;
  end
end
accuracyTeste = r/size(tr.testInd,2)*100;
fprintf('Precisao teste %f\n', accuracyTeste)





end
