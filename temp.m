%%
%init

clc; clear; close all;

xDoc = xmlread('behind lums.xml');
allWays = xDoc.getElementsByTagName('way');
allNodes = xDoc.getElementsByTagName('node');

%% ways ref
h = waitbar(0,'Please wait...');
node_counter_percell=1;
for i=0:allWays.getLength-1
    thisListItem = allWays.item(i);
    
    childNode = thisListItem.getFirstChild;
    id = thisListItem.getAttributes.getNamedItem('id');
    disp(id);
    
    latlon_array = {};
    node_counter_perway=1;%set to zero for each new way
    
    while ~isempty(childNode)
        %Filter out text, comments, and processing instructions.
        if childNode.getNodeType == childNode.ELEMENT_NODE
            %Assume that each element has a single org.w3c.dom.Text child
            idforWay = childNode.getAttributes.getNamedItem('ref');
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Acess node ids
            if(idforWay ~=0 )
                flagstop=0;
                for j=0:allNodes.getLength-1
                    thisListItemN = allNodes.item(j);
                    childNodeN = thisListItemN;
                    if(flagstop==1)
                        break;
                    end
                    while ~isempty(childNodeN)
                        if(flagstop==1)
                            break;
                        end
                        %Filter out text, comments, and processing instructions.
                        if childNodeN.getNodeType == childNodeN.ELEMENT_NODE
                            %Assume that each element has a single org.w3c.dom.Text child
                            
                            idforNode = childNodeN.getAttributes.getNamedItem('id');
                            nodelat = childNodeN.getAttributes.getNamedItem('lat').toString;
                            nodelon = childNodeN.getAttributes.getNamedItem('lon').toString;
                            
                            
                            
                            somet =  compare_ids(idforWay.toString,idforNode.toString);
                            if(somet == 0)%meaning that they match
                                disp('-----------');
                                disp(id)
                                disp(idforNode);
                                
                                latlon_array{node_counter_perway} = [cooord_to_num(nodelat),cooord_to_num(nodelon)];
                                node_counter_perway=node_counter_perway+1;
                                disp('^^^^^^^^^^');
                                %                       pause(5);
                                %                       disp(childNodeN.getAttributes.getNamedItem('id'))
                            end
                            
                            if(strcmp(idforNode,'id="4602505148"'))
                                j=allNodes.getLength;
                                flagstop=1;
                                
                            end
                            %childText = char(childNode.getFirstChild.getData);
                            switch char(childNodeN.getTagName)
                                case 'id'; itemFound = strcmp(childText,infoLabel);
                                case 'callback' ; infoCbk = childText;
                            end
                        end
                        childNodeN = childNodeN.getNextSibling;
                    end
                    %           if itemFound break; else infoCbk = ''; end
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %childText = char(childNode.getFirstChild.getData);
            switch char(childNode.getTagName)
                case 'ref' ; itemFound = strcmp(childText,infoLabel);
                case 'callback' ; infoCbk = childText;
            end
        end
        childNode = childNode.getNextSibling;
    end
    %          if itemFound break; else infoCbk = ''; end
    
    
    cellarray_ways{node_counter_percell}=latlon_array;
    node_counter_percell=node_counter_percell+1;
    
    disp('TIME TO PLOT BITCHESSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS')
    axis equal
%     axis([31,32,74,75])
    hold on
    xcoord = zeros(1,node_counter_perway-1);
    ycoord = zeros(1,node_counter_perway-1);
    for plotteri = 1:node_counter_perway-1
        plot(latlon_array{plotteri}(1) , latlon_array{plotteri}(2) ,'.')
        xcoord(plotteri)=latlon_array{plotteri}(1);
        ycoord(plotteri)=latlon_array{plotteri}(2);
    end
    
    plot(xcoord,ycoord);
    
    %pause(2);
    drawnow;   
    waitbar(i/(allWays.getLength-1),h)    
end
close(h);