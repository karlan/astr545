PRO gray_atmosphere

    mu = (findgen(1000)+1.0)/1000.0
    tau = (findgen(1000.0))
    x = findgen(1000)/1000*20

    n_mu = n_elements(mu)
    n_x = n_elements(x)

    int_result = findgen(n_x)

    for i=0, n_x-1 do begin
	xi = x[i]

        int_step0 = findgen(n_mu)
	print, i
	for j=0, n_mu -1 do begin
	    mui = mu[j]

	    f_tau = (3.0*tau/4.0+0.5)^(0.25)
	    fun_int = exp(-tau/mui)/(exp(xi/f_tau)-1)
	    int_step0[j] = int_tabulated(tau,fun_int)
	endfor
	int_step1 = int_tabulated(mu,int_step0)
	int_result[i] = 30*xi^4/(!pi)^4 * int_step1
    endfor

    forprint, x, int_result, text='intergral_b.dat',format='F,F'
END
