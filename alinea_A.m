
function  [net2,accuracyTreino] = alinea_A(redes,numero_neuronios,funcao_ativacao,funcao_treino,num_epocas)

Pasta_1 = dir('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_1\*.jpg');
n=length(Pasta_1);
tam=45;
inputs = zeros(tam*tam, length(Pasta_1));

 for i = 1 : length(Pasta_1)
      filename = strcat('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_1\',Pasta_1(i).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      inputs(:,i)=imbinarize(b(:));           
 end

 Targets=zeros(5,1);
 for i = 1:5
     Targets(i,i)=1;
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
net.divideFcn = '';

 
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

end
