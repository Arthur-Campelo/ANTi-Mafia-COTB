
function get_damaged(_damaged, _iframes=false){
	
	//se ele estiver usando iframes e estiver no tempo de iframes o código vai ser terminado aqui antes de passar pelo dano
	if (_iframes and (iframe_timer>0)) {
		iframe_timer--
		if iframe_timer mod 5 ==0 {
			if image_alpha = 1 {
				image_alpha = 0
			} else {
				image_alpha = 1
			}
		}
		exit
	}
	//ter certeza q o bicho n fica invisivel
	if _iframes {
		image_alpha =1
	}
	
	
	if place_meeting(x,y,_damaged) { // se tomou dano
		
		//cria uma lista ds
		var _attacker_list = ds_list_create()
		instance_place_list(x,y,_damaged,_attacker_list,false)//preenche a lista com as balas q acertaram
		var _attacker_list_size = ds_list_size(_attacker_list)//descobre o tamanho da lista
	
	
	
		//faz um loop para pegar todas os acertos no mesmo frame
		var _hit_confirm =false //varíavel local para hit_confirm
		for(var i = 0; i < _attacker_list_size; i++) {
		
			var _attacker = ds_list_find_value(_attacker_list,i)
		
			if _iframes or ds_list_find_index(damage_list, _attacker)==-1 {//se tal objeto n existir n0a lista ele causa dano e é adicionado a lista, se existr, nada //ou se é utilizado um iframe do personagem
				
				//testa para ver se é o player intangível que a gente está tentando dar dano
				if(!(variable_instance_exists(self,"player_tangible") and player_tangible==false)){
					hp -= _attacker.damage
					_attacker.hit_confirm = true
					_hit_confirm = true
				}
				
				if !_iframes {
					ds_list_add(damage_list,_attacker)//se iframes for falso adiciona a instancia na lista de instancias de dano
				}
				
			} 
		}
		//se usar iframes E tiver sido acertado coloca invensibilidade dos iframes
		if _iframes and _hit_confirm {
			iframe_timer = iframe_number
		}
		
	
		ds_list_destroy(_attacker_list)//destroi uma ds lista
	}

	//limpar a lista damgelist de balas  qn tão mais importando
	if !_iframes 
	{
		var _damge_list_size = ds_list_size(damage_list)//tamanho da lista
		for(var i =0; i < _damge_list_size; i++) {
	
			var _inst_bala = ds_list_find_value(damage_list, i)//variavel q estamos mexendo agr
	
			if (!(instance_exists(_inst_bala)) or !(place_meeting(x,y,_inst_bala))) {//se a variavel nao existe ou n está encostando no inimigo
		
				ds_list_delete(damage_list, i)//tira ela da lista e arruma a lista
				i--
				_damge_list_size--
			} 
		}
	}
}

function damage_create(_hp, _iframes=false) {
	hp = _hp
	//get the iframes 
	if _iframes {
		iframe_timer=0
		iframe_number=90
	} 
	if _iframes==false{//cria a damage_list se não tiver iframes (no caso se não for o player)
		damage_list = ds_list_create();
	}
}

function damage_destroy(_damage_list, _iframes = false) {
	if !_iframes {
		ds_list_destroy(_damage_list)
	}
}