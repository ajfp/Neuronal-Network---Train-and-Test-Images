function alinea_C_teste_pasta_1(rede)

load(rede);


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
 
 
 out=net(inputs);

plotconfusion(Targets, out);


set(gca,'xticklabel',{'Vogal A' 'Vogal E' 'Vogal I' 'Vogal O' 'Vogal U' 'Total'})
set(gca,'yticklabel',{'Vogal A' 'Vogal E' 'Vogal I' 'Vogal O' 'Vogal U' 'Total'})
 
 

end