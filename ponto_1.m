function   [net2,accuracyTreino,accuracyTeste]=ponto_1(rede)

load(rede);

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

nTotal= nA + nE + nI + nO + nU;

tam=45;

inputs2 = zeros(tam*tam, nTotal);

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

%Para colocar todas as imagens numa só matriz de inputs 

for tot=1:nTotal %nº total de imagens 
  if tot<=100 
    for a=1:nA
  
    inputs2(:,tot)=letra_A(:,a);
   
    end
  
  else if tot<=200
     for e=1:nE
        inputs2(:,tot)=letra_E(:,e);
     end
  
  else if tot<=300
   for i=1:nI   
            inputs2(:,tot)=letra_I(:,i);
   end
   
  else if tot<=400
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


        
    
Targets=zeros(1,nTotal);
for ii = 1:500
    if ii<=100
        Targets(1,ii)=1;        
      else if ii<=200
            Targets(2,ii)=1;
        else if ii<=300
                Targets(3,ii)=1;
           else if ii<=400
                   Targets(4,ii)=1;
               else
                    Targets(5,ii)=1;
                 end
            end
         end
    end
end

 




 
 % COMPLETAR A RESTANTE CONFIGURACAO



 
 % TREINAR
 [net,tr] = train(net, inputs2, Targets);
 view(net);
 close(gcf)
 disp(tr)
 close(gcf)
 out = sim(net, inputs2);
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
TInput = inputs2(:, tr.testInd);
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
