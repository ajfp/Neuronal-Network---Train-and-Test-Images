function  [net2,accuracyTreino,accuracyTeste]=alinea_C_treino_pasta_1(redes,numero_neuronios,funcao_ativacao,funcao_treino,num_epocas,treino,teste,validacao)

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
inputs = zeros(tam*tam, nTotal);

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


for tot=1:nTotal %nº total de imagens 
  if tot<=200 
    for a=1:nA
  
    inputs(:,tot)=letra_A(:,a);
   
    end
  
  else if tot<=400
     for e=1:nE
        inputs(:,tot)=letra_E(:,e);
     end
  
  else if tot<=600
   for i=1:nI   
            inputs(:,tot)=letra_I(:,i);
   end
   
  else if tot<=800
   for o=1:nO   
            inputs(:,tot)=letra_O(:,o);
   end
  
      else 
      for u=1:nU    
         inputs(:,tot)=letra_U(:,u);
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


numero_neuronios=round(numero_neuronios);
if strcmp(redes,"feedforwardnet")==1 
    net = feedforwardnet(numero_neuronios);
end
if strcmp(redes,"patternnet")==1
     net = patternnet(numero_neuronios);
end
 % COMPLETAR A RESTANTE CONFIGURACAO


net.layers{1}.transferFcn = funcao_ativacao;
 
  
 net.TrainFcn = funcao_treino;
  
 net.trainParam.epochs=num_epocas;
net.divideFcn = 'dividerand';
net.divideParam.trainRatio = treino;
net.divideParam.valRatio = teste;
net.divideParam.testRatio = validacao;
 
 % TREINAR
 [net,tr] = train(net, inputs, Targets);
 view(net);
 close(gcf)
 disp(tr)
 close(gcf)
 out = sim(net, inputs);
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
TInput = inputs(:, tr.testInd);
TTargets = Targets(:, tr.testInd);

out = sim(net, TInput);

net2=net;
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