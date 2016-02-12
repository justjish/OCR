function BoundingBox(L)
Nc=max(max(L));
for i=1:Nc;
    [r,c]=find(L==i);
    maxr=max(r);
    minr=min(r);
    maxc=max(c);
    minc=min(c);
    diffc = maxc-minc;
    diffr = maxr-minr;
    if ( diffc > 10 &&  diffr> 10 && diffc < 100 && diffr < 100)
        rectangle('Position',[minc,minr,maxc-minc+1,maxr-minr+1], 'EdgeColor','w');
    end
end
hold off;
end
