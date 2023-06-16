def item(px,py,ps)
    draw(576, 416, C_BLUE);
    
    if((px-576).abs<32&&(py-416).abs<32)
        if(ps==2)
            ps=ps+1;
            
        end
    end 

    return ps
end
