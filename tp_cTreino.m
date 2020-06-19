function  [net2,accuracyTreino,accuracyTeste]=tp_cTreino(redes,numero_neuronios,funcao_ativacao,funcao_treino,num_epocas,treino,teste,validacao)

Formas2_Circle = dir('C:\Users\André\Desktop\André\isec\CR\21250156_AndréCalçada_21250157_SoraiaTarrinha\Formas_2\circle\*.png');
Formas2_Square=dir('C:\Users\André\Desktop\André\isec\CR\21250156_AndréCalçada_21250157_SoraiaTarrinha\Formas_2\square\*.png');
Formas2_Star=dir('C:\Users\André\Desktop\André\isec\CR\21250156_AndréCalçada_21250157_SoraiaTarrinha\Formas_2\star\*.png');
Formas2_Triangle=dir('C:\Users\André\Desktop\André\isec\CR\21250156_AndréCalçada_21250157_SoraiaTarrinha\Formas_2\triangle\*.png');
nC=length(Formas2_Circle);
nSq=length(Formas2_Square);
nSt=length(Formas2_Star);
nT=length(Formas2_Triangle);
nTotal=nC+nSq+nSt+nT;
tam=45;
inputs = zeros(tam*tam, nTotal);
circles=zeros(tam*tam,nC);
squares=zeros(tam*tam,nSq);
stars=zeros(tam*tam,nSt); 
triangles=zeros(tam*tam,nT);
    for c=1:nC
      filename = strcat('C:\Users\André\Desktop\André\isec\CR\21250156_AndréCalçada_21250157_SoraiaTarrinha\Formas_2\circle\',Formas2_Circle(c).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      circles(:,c)=imbinarize(b(:));
      
    end
   for s=1:nSq
       
      filename = strcat('C:\Users\André\Desktop\André\isec\CR\21250156_AndréCalçada_21250157_SoraiaTarrinha\Formas_2\square\',Formas2_Square(s).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      squares(:,s)=imbinarize(b(:));
   end

for st=1:nSt
filename = strcat('C:\Users\André\Desktop\André\isec\CR\21250156_AndréCalçada_21250157_SoraiaTarrinha\Formas_2\star\',Formas2_Star(st).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      stars(:,s)=imbinarize(b(:));


end

for t=1:nT
filename = strcat('C:\Users\André\Desktop\André\isec\CR\21250156_AndréCalçada_21250157_SoraiaTarrinha\Formas_2\triangle\',Formas2_Triangle(t).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      triangles(:,t)=imbinarize(b(:));
end

%Para colocar todas as imagens numa só matriz de inputs 

for tot=1:nTotal %nº total de imagens 
  if tot<=201 
    for c=1:nC
  
    inputs(:,tot)=circles(:,c);
   
    end
  
  else if tot<=402
     for s=1:nSq
        inputs(:,tot)=squares(:,s);
     end
  
  else if tot<=603
   for st=1:nSt   
            inputs(:,tot)=stars(:,st);
   end
  
      else 
      for t=1:nT    
   inputs(:,tot)=triangles(:,t);
      end
      end
      end
  end
end
nTotalFormas2=nTotal;

Formas3_Circle = dir('C:\Users\André\Desktop\André\isec\CR\21250156_AndréCalçada_21250157_SoraiaTarrinha\TemaRN_Imagens_\Formas_3\circle\*.png');
Formas3_Square=dir('C:\Users\André\Desktop\André\isec\CR\21250156_AndréCalçada_21250157_SoraiaTarrinha\TemaRN_Imagens_\Formas_3\square\*.png');
Formas3_Star=dir('C:\Users\André\Desktop\André\isec\CR\21250156_AndréCalçada_21250157_SoraiaTarrinha\TemaRN_Imagens_\Formas_3\star\*.png');
Formas3_Triangle=dir('C:\Users\André\Desktop\André\isec\CR\21250156_AndréCalçada_21250157_SoraiaTarrinha\TemaRN_Imagens_\Formas_3\triangle\*.png');
nC=length(Formas3_Circle);
nSq=length(Formas3_Square);
nSt=length(Formas3_Star);
nT=length(Formas3_Triangle);
nTotalFormas3=nC+nSq+nSt+nT;
nTotal=nTotalFormas2+nTotalFormas3;
tam=45;

inputs2 = zeros(tam*tam, nTotalFormas3);
circles=zeros(tam*tam,nC);
squares=zeros(tam*tam,nSq);
stars=zeros(tam*tam,nSt); 
triangles=zeros(tam*tam,nT);
    for c=1:nC
      filename = strcat('C:\Users\André\Desktop\André\isec\CR\21250156_AndréCalçada_21250157_SoraiaTarrinha\TemaRN_Imagens_\Formas_3\circle\',Formas3_Circle(c).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      circles(:,c)=imbinarize(b(:));
      
    end
   for s=1:nSq
       
      filename = strcat('C:\Users\André\Desktop\André\isec\CR\21250156_AndréCalçada_21250157_SoraiaTarrinha\TemaRN_Imagens_\Formas_3\square\',Formas3_Square(s).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      squares(:,s)=imbinarize(b(:));
   end

for st=1:nSt
filename = strcat('C:\Users\André\Desktop\André\isec\CR\21250156_AndréCalçada_21250157_SoraiaTarrinha\TemaRN_Imagens_\Formas_3\star\',Formas3_Star(st).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      stars(:,s)=imbinarize(b(:));


end

for t=1:nT
filename = strcat('C:\Users\André\Desktop\André\isec\CR\21250156_AndréCalçada_21250157_SoraiaTarrinha\TemaRN_Imagens_\Formas_3\triangle\',Formas3_Triangle(t).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      triangles(:,t)=imbinarize(b(:));
end

%Para colocar todas as imagens numa só matriz de inputs 

for tot=1:nTotalFormas3 %nº total de imagens 
  if tot<51 
    for c=1:nC
  
    inputs2(:,tot)=circles(:,c);
   
    end
  
  else if tot<101
     for s=1:nSq
        inputs2(:,tot)=squares(:,s);
     end
  
  else if tot<151
   for st=1:nSt   
            inputs2(:,tot)=stars(:,st);
   end
  
      else 
      for t=1:nT    
   inputs2(:,tot)=triangles(:,t);
      end
      end
      end
  end
end

Inputs = zeros(tam*tam, nTotal);
j=1;
for i=1:nTotal
    if i<=nTotalFormas2
    for j=1:nTotalFormas2
  
        Inputs(:,i)=inputs(:,j);
   
    end
    else
        for k=1:nTotalFormas3
        Inputs(:,i)=inputs2(:,k);
        end
    end
end
        
    

Targets=zeros(1,nTotal);
for i = 1:nTotal
    if i<=251
        Targets(1,i)=1;
        
    else if i<502
            Targets(2,i)=1;
        else if i<=753
                Targets(3,i)=1;
            else
                Targets(4,i)=1;
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

net.divideParam.trainRatio = treino;
net.divideParam.valRatio = teste;
net.divideParam.testRatio = validacao;
 
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

saveas(confusion,'ConfusionMatrix.jpg');
 close(confusion);

 
% Grafico com o desempenho da rede nos 3 conjuntos           
 plotperf(tr);
 saveas(gcf,'Performance.png')
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
