
function get_damaged(damaged){
	if place_meeting(x,y,damaged) {
	
		var _attacker_list = ds_list_create()//cria uma lista ds
	
		instance_place_list(x,y,damaged,_attacker_list,false)//preenche a lista com as balas q acertaram
	
		var _attacker_list_size = ds_list_size(_attacker_list)//descobre o tamanho da lista
	
		for(var i = 0; i < _attacker_list_size; i++) {//faz um loop para pegar todas as balas no mesmo frame
		
			var _attacker = ds_list_find_value(_attacker_list,i)
		
			if ds_list_find_index(damage_list, _attacker)==-1 {//se tal objeto n existir na lista ele causa dano e é adicionado a lista, se existr, nada
			
				hp -= _attacker.damage
				_attacker.hit_confirm = true
				
				ds_list_add(damage_list,_attacker)
			} 
		}
	
		ds_list_destroy(_attacker_list)//destroi uma ds lista
	}

	//limpar a lista damgelist de balas  qn tão mais importando
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

function damage_create(_hp) {
	hp = _hp
	//cria a damage_list
	damage_list = ds_list_create();
}

function damage_destroy(_damage_list) {
	ds_list_destroy(_damage_list)
}