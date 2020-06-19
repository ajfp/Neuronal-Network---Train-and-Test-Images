function alinea_C(rede)


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

nTotal = nA + nE + nI + nO + nU;
tam=45;
inputs = zeros(tam*tam, nTotal);

vogais_A = zeros(tam*tam,nA);
vogais_E = zeros(tam*tam,nE);
vogais_I = zeros(tam*tam,nI); 
vogais_O = zeros(tam*tam,nO);
vogais_U = zeros(tam*tam, nU);

    for a=1:nA
      filename = strcat('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_3\A\',Pasta3_A(a).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      vogais_A(:,a)=imbinarize(b(:));
      
    end
   for e=1:nE
       
      filename = strcat('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_3\E\',Pasta3_E(e).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      vogais_E(:,e)=imbinarize(b(:));
   end

for i=1:nI
filename = strcat('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_3\I\',Pasta3_I(i).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      vogais_I(:,i)=imbinarize(b(:));
end

for o=1:nO
filename = strcat('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_3\O\',Pasta3_O(o).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      vogais_O(:,o)=imbinarize(b(:));
end


for u=1:nU
filename = strcat('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Pasta_3\U\',Pasta3_U(u).name);
      x = imread(filename);
      
      b=imresize(x,[tam tam]);
     
      vogais_U(:,u)=imbinarize(b(:));
end

%Para colocar todas as imagens numa só matriz de inputs 

for tot=1:nTotal %nº total de imagens 
  if tot<101
    for a=1:nA
  
    inputs(:,tot)=vogais_A(:,a);
   
    end
  
  else if tot<201
     for e=1:nE
        inputs(:,tot)=vogais_E(:,e);
     end
  
  else if tot<301
   for i=1:nI   
            inputs(:,tot)=vogais_I(:,i);
   end
   
   else if tot<401
     for o=1:nO
        inputs(:,tot)=vogais_O(:,o);
     end
  
      else 
      for u=1:nU   
   inputs(:,tot)=vogais_U(:,u);
      end
      end
      end
  end
  end
end

Targets=zeros(1,nTotal);
for ii = 1:nTotal
    if ii<101
        Targets(1,ii)=1;
    else if ii<201
            Targets(2,ii)=1;
        else if ii<301
                Targets(3,ii)=1;
           else if ii<401
                Targets(4,ii)=1;
              else
                Targets(5,ii)=1;
            end
        end
    end
    end
end


out=net(inputs);

plotconfusion(Targets, out);


set(gca,'xticklabel',{'Vogal A' 'Vogal E' 'Vogal I' 'Vogal O' 'Vogal U' 'Total'})
set(gca,'yticklabel',{'Vogal A' 'Vogal E' 'Vogal I' 'Vogal O' 'Vogal U' 'Total'})

end

