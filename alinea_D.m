function [formaSaiu]=alinea_D(vogal,rede)

load(rede);

tam=45;
inputs = zeros(tam*tam,1);






filename = strcat('C:\Users\alexa\Desktop\CR_ALEX\CR_ALEX\NN_datasets\Vogais_Desenhadas\',vogal);
x = imread(filename);
%x = x(:, :, 2); %porque a imagem tinha 3 dimensoes
%x=x(:,:,1);
x=rgb2gray(x);
b=imresize(x,[tam tam]);

inputs=imbinarize(b(:));
      



newoutput =sim(net,inputs);


if newoutput(1)>newoutput(2) && newoutput(1)>newoutput(3) && newoutput(1)>newoutput(4) && newoutput(1)>newoutput(5)
    formaSaiu="Sou a vogal -> a";
else if newoutput(2)>newoutput(1) && newoutput(2)>newoutput(3)&& newoutput(2)>newoutput(4) && newoutput(2)>newoutput(5)
        formaSaiu="Sou a vogal -> e";
    else if newoutput(3)>newoutput(1) && newoutput(3)>newoutput(2)&& newoutput(3)>newoutput(4) && newoutput(3)>newoutput(5)            
            formaSaiu="Sou a vogal -> i";
            else if newoutput(4)>newoutput(1) && newoutput(4)>newoutput(2)&& newoutput(4)>newoutput(3) && newoutput(4)>newoutput(5)            
            formaSaiu="Sou a vogal -> o";
                 else
            formaSaiu="Sou a vogal -> u";
        end
    end
end
end
end








