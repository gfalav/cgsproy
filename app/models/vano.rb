class Vano < ActiveRecord::Base

	belongs_to :conductor
	belongs_to :zona

	def calcvano(zona_id, cond_id, vano, hconductor, vano_id)

  		cond = Conductor.find(cond_id)
  		zona = Zona.find(zona_id)

  		result = Hash.new
  		result[:conductor_id] = cond_id
  		result[:zona_id] = zona_id
  		result[:vano] = vano
  		result[:hconductor] = hconductor
  		result[:vano_id] = vano_id


	    tmax = fmax = tmed = k1 = k2 = k3 = 0
   		arrtmp = Array.new
    
	    zona.condclimas.each {|c|
	   		arrtmp = Array.new
    		flag = 0
      
	      	pv1 = pvcond(zona_id, c.viento, 0, cond.diametro, vano, hconductor)
	      	ph1 = phcond(zona_id, cond.diametro,c.hielo)
	      	pt1 = Math.sqrt(pv1**2 + (ph1+cond.peso/1000)**2)
	      	pang1 = Math.atan(pv1 / (cond.peso/1000 + ph1)) / Math::PI * 180
	      
	      	t1 = cond.tmax * cond.seccion
	      	tmax = t1
	      	if (c.nombre=="Tmed")
	        	tmed = t1 / cond.seccion
	      	end
	      	f1 = vano**2 * pt1 / 8 / t1
	      	fmax = f1
	      
	      	k1 = vano**2 * pt1**2 / 24 / (t1**2)  - cond.coef_t * c.temp - t1 / cond.coef_e / cond.seccion

	      	calc = Calccond.new
	      	calc.vano_id = vano_id
	      	calc.condclima_id = c.id
	      	calc.temp = c.temp
	      	calc.viento = c.viento
	      	calc.hielo = c.hielo
	      	calc.tension = t1 / cond.seccion
	      	calc.tiro = t1
	      	calc.flecha_t = f1
	      	calc.flecha_h = f1 * Math.sin(pang1 / 180 * Math::PI)
	      	calc.flecha_v = f1 * Math.cos(pang1 / 180 * Math::PI)
	      	arrtmp << calc
	      
	      	zona.condclimas.each {|c2|
	        	if (c.id != c2.id)          
	          		pv2 = pvcond(zona_id, c2.viento, 0, cond.diametro, vano, hconductor)
	          		ph2 = phcond(zona_id, cond.diametro, c2.hielo)
	          		pt2 = Math.sqrt(pv2**2 + (ph2 + cond.peso/1000)**2)
	          		pang2 = Math.atan(pv2 / (cond.peso/1000 + ph2)) / Math::PI * 180
	          
	          		k2 = ((k1 + cond.coef_t * c2.temp) * cond.coef_e * cond.seccion).to_f
	          		k3 = (vano**2 * pt2**2 * cond.coef_e * cond.seccion / 24).to_f
	          		t2 = newton(k2,k3)
	          		f2 = vano**2 * pt2 / 8 / t2
	          		if (c2.nombre=="Tmed")
	            		tmed = t2 / cond.seccion
	          		end
	          		if (t2 > t1)
	            		flag = 1
		            	break
	    	      	else
	        	    	calc = Calccond.new
	            		calc.vano_id = vano_id
	            		calc.condclima_id = c2.id
			            calc.temp = c2.temp
	    		        calc.viento = c2.viento
	        		    calc.hielo = c2.hielo
	            		calc.tension = t2 / cond.seccion
		            	calc.tiro = t2
		    	        calc.flecha_t = f2
	    	    	    calc.flecha_h = f2 * Math.sin(pang2 / 180 * Math::PI)
	        	    	calc.flecha_v = f2 * Math.cos(pang2 / 180 * Math::PI)
	            		arrtmp << calc
	          		end
	        	end
	    	}
	      
	      	if (flag == 0)
	        	break
	      	end
	    }


    	arrtmp.sort! { |a,b| a.condclima_id <=> b.condclima_id }
    	result[:conds] = arrtmp
	    return result
  	end

  	def pvcond(zona_id,v,ang,d,vano,h_conductor)
    	case zona_id
      		when 6
        		if (v != 0)
          			pv = 0.05 * d
        		else
          			pv = 0
        		end
      		
      		else 
        		if (v <= 110)
          			k = 0.85
        		else 
          			k = 0.75
        		end
	        	if (vano > 200)
    	      		q = 0.6 + 80 / vano
        		else
          			q = 1
	        	end
    	    	if (h_conductor > 20 && h_conductor < 30)
        	  		v = v * 1.05
        		elsif (h_conductor > 30)
          			v = v * Math.sqrt(0.8 + alt_conductor/100)
	        	end
    	    	if (d<12.5)
        	  		c = 1.2
        		elsif (d<15.8)
          			c = 1.1
	        	else
    	      		c = 1
        		end
                
        	pv = k * c * (v/3.6) ** 2 / 16000 * d * q * Math.cos(ang/180*Math::PI)
    	end

    	return pv
  	end
  
  	def phcond(zona_id,d,e)
    	case zona_id 
      		when 6 
        		if (e != 0)
          			ph = 0.18 * Math.sqrt(d)
        		else 
          			ph = 0
        		end
      
      		else
        		ph = 0.0029845 * e * (e + d)
    		end
    
    	return ph
  	end
  
  	def newton(k2,k3)
    	n=0
    	x0 = 0.01
    
	    while (n < 500) do
    	  	x = x0 - (x0**3 + k2 * x0**2 - k3) / (3 * x0**2 + 2 * k2 * x0);
      		x0 = x;
      		n += 1;
    	end
    
    	return x    
  	end

end
