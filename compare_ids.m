function c = compare_ids( a , b )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
c=0;
for(y =4:a.length-1)
    for(z =3:b.length-1)
        %                       disp(idforWay.toString.charAt(y));
        %                       disp(idforNode.toString.charAt(z));
        if(~strcmp(a.charAt(y),b.charAt(z)) && (y-1==z ))
            
            %                           disp(idforWay.toString.charAt(y));
            %                           disp(idforNode.toString.charAt(z));
            %                           disp('v')
            c=1;
            return;
%             y=idforWay.toString.length-1;
%             z=idforNode.toString.length-1;
            
        end
    end
end





end

