%% Copyright (c) 2018, Vishal_S% All rights reserved. Please read the "license.txt" for license terms.%% Project Title: CellularAutomaton% % Developer: Vishal S% % Contact Info: vishalsubbu97@gmail.com%% use this program only after CA2D_von.m or CA2D_moore.m only clf;mesh ( Grain_no);view(2);pause(0);more off;grain_boundary = zeros(N+2,N+2);curvature = zeros(N+2,N+2);kink = zeros (5,5);for q = 1: 10  q  for w = 1:10    w     for  i = 2:N        for k = 2:N          grain_boundary(i,k) = 0;          a = Grain_no(i,k) - Grain_no(i-1,k);          b = Grain_no(i,k) - Grain_no(i+1,k);          c = Grain_no(i,k) - Grain_no(i,k+1);          d = Grain_no(i,k) - Grain_no(i,k-1);          e = Grain_no(i,k) - Grain_no(i+1,k+1);          f = Grain_no(i,k) - Grain_no(i+1,k-1);          g = Grain_no(i,k) - Grain_no(i-1,k+1);          h = Grain_no(i,k) - Grain_no(i-1,k-1);          if( (a) || (b)|| (c)|| (d)|| (e)|| (f)|| (g)|| (h))             grain_boundary(i,k)  = 1;          endif        endfor;     endfor;  for  i = 3:N-1     for k = 3:N-1        if( grain_boundary(i,k)!=0)           for s = -2:2              for t = -2:2                 if( Grain_no(i+s,k+t) == Grain_no(i,k))                    kink(s+3,t+3) = 1.0;                  else                     kink(s+3,t+3) = 0.0;                  endif              endfor;            endfor;            curvature (i,k) = 15 - sum(sum(kink));        endif     endfor;   endfor;   max_curve = max(max(curvature));   for i = 3:N-1      for k = 3:N-1         if( grain_boundary(i,k)!=0)            if(curvature(i,k) > 0 )               P = curvature(i,k) / max_curve ;               probab = rand();               for s = -1:1                  for t = -1:1                     if(Grain_no(i,k) != Grain_no(i+s,k+t))                        new_no = Grain_no(i+s,k+t);                     endif                  endfor;               endfor;               if( probab<P)                  Grain_no(i,k) = new_no;               endif            endif         endif      endfor;    endfor;     mesh (Grain_no);    view(2);    pause(0);  endfor;endfor;print -djpg Curvature_2D.jpg