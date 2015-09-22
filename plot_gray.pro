PRO plot_gray
    psname = 'gray.eps'
    set_plot, 'ps'
    device, filename = psname, /encapsulated,/color,xsize=12,ysize=10,/helvetica,font_size=10,/TT_FONT,set_font='Times'
    !p.font = 0
    !p.thick=3
    !x.thick=3
    !y.thick=3
    !p.charsize=1
    !x.margin = [8,2]
    !y.margin = [4,1]
    !p.multi=[0,1,2]

    readcol,'intergral_b.dat',x,y
    y1=15/(!pi)^4*x^4/(exp(x)-1)  
    remove, [0], x,y,y1

    plot, x, y, xtitle='', ytitle='y',position = [0.15, 0.3, 0.95, 0.98],xticks=4, xtickn=[' ',' ',' ',' ',' ']
    oplot, x, y1, color=fsc_color('blue'), linestyle=1
    
    plot, x, y1-y, position = [0.15,0.1,0.95,0.30],xtitle='x', ytitle=textoidl('\Delta y'),xticks=4
    oplot, x, x*0, color=fsc_color('gray')
    legend, ['gray body', 'black body'], colors=[fsc_color('black'),fsc_color('blue')], linestyle = [0,1], /normal, position = [0.550,0.90]
    device,/close
end
