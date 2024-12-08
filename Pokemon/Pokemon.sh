#! /bin/bash
clear
#Autor: Lorente Almán Alvaro.

nombre=$USERNAME
pokemon=""

function indicarNombre(){
clear
read -p "$nombre introduzca un nuevo nombre: " nombre
menu
}

function menu(){
vida=200
armadura=$(($RANDOM%15))

vidaC=200
armaduraC=$(($RANDOM%15))

clear
echo -------------------------
echo Pokemósh! Hazte con todos!
echo -------------------------
echo 	1. Elegir nombre
echo -------------------------
echo 	2. Elegir Pokemón
echo -------------------------
echo 	3. Comenzar a jugar
echo -------------------------
echo 	4. Ver historial
echo -------------------------
echo 	5. Salir
echo -------------------------
read -p "$nombre introduzca la opcion y pulse ENTER: " op

case $op in
1) indicarNombre;;
2) menuPokemon;;
3) jugar;;
4) historial;;
5) salir;;
esac
menu
}

function menuPokemon(){
clear
paplay obtener.wav &
echo -------------------------
echo Elige tu Pokemón favorito
echo -------------------------
echo 	1. Bulbasur
echo -------------------------
echo 	2. Charmander
echo -------------------------
echo 	3. Squirtle
echo -------------------------
echo 	4. Salir al menu
echo -------------------------
read -p "$nombre introduzca la opcion y pulse ENTER: " op

case $op in
1) 
pokemon="BULBASUR"
menu;;
2) 
pokemon="CHARMANDER"
menu;;
3) 
pokemon="SQUIRTLE"
menu;;
4) menu;;
esac
}

function jugar(){
clear
echo ENTRENADOR $nombre JUGARAS CON EL INCREIBLE POKEMON $pokemon

read -p "Pulse cualquier tecla para continuar..."

case $pokemon in
BULBASUR)
contrincante
;;
CHARMANDER)
contrincante
;;
SQUIRTLE)
contrincante
;;
esac
if [ -z $pokemon ]; then
clear
echo "Tiene que elegir un pokemon para empezar la partida. Gracias"
menuPokemon
fi
}

function historial(){
clear
if `cat /home/$USERNAME/SCRIPTS/Pokemon/ganadores.txt >/dev/null 2> /home/$USERNAME/SCRIPTS/Pokemon/errores.log`; then
	cat ganadores.txt
elif `cat /home/$USERNAME/SCRIPTS/Pokemon/perdedores.txt >/dev/null 2> /home/$USERNAME/SCRIPTS/Pokemon/errores.log`; then
	cat perdedores.txt
else
	echo "No existe un historial. Juega una partida al menos para mostrarlo"
fi
read -p "Pulse cualquier tecla para continuar..."
menu
}

function contrincante(){
case $(($RANDOM%3)) in
0) pikachu;;
1) chikorita;;
2) onix;;
esac
}

function pikachu(){
clear
local contrincanteP="PIKACHU"
echo $nombre pelearas contra $contrincanteP. Suerte para ambos!
read -p "Pulse cualquier tecla para continuar..."

case $pokemon in
BULBASUR)
bulbasurVsPikachu
;;
CHARMANDER)
charmanderVsPikachu
;;
SQUIRTLE)
squirtleVsPikachu
;;
esac
}

function bulbasurVsPikachu(){
paplay batalla.wav &
while [ $vida -gt 0 ] && [ $vidaC -gt 0 ]; do
clear
echo "														VIDA DE $contrincanteP: $vidaC"
echo -e "\n"
cat bulbasurPikachu.txt
echo -e "\n"
echo "		VIDA DE $pokemon: $vida"
echo "	-------------------------------------------------------------"
echo "	 1. CORTE | 2. DOBLE FILO | 3. LATIGO CEPA | 4. RIZO DEFENSA"
echo "	-------------------------------------------------------------"
echo -e "\n"
read -p "	Entrenador $nombre introduzca la accion y pulse ENTER: " ataque

clear
case $ataque in
1)
pAtaque=20
cat ataque1.txt
echo -e "\n"
echo $pokemon uso CORTE.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

2)
pAtaque=30
cat dobleFilo.txt
echo -e "\n"
echo $pokemon uso DOBLE FILO.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

3)
pAtaque=40
cat latigo.txt
echo -e "\n"
echo $pokemon uso LATIGO CEPA.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

4)
cat defensa.txt
echo -e "\n"
echo $pokemon uso RIZO DEFENSA.
sleep 2
let armadura=$armadura+5
;;
esac

clear
echo "														VIDA DE $contrincanteP: $vidaC"
echo -e "\n"
cat bulbasurPikachu.txt
echo -e "\n"
echo "		VIDA DE $pokemon: $vida"
sleep 3
clear

#ATAQUE RIVAL
case $(($RANDOM%4)) in
1)
pAtaqueC=20
cat ataque1.txt
echo -e "\n"
echo $contrincanteP uso ATAQUE RAPIDO.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;
2)
pAtaqueC=30
cat rayo.txt
echo -e "\n"
echo $contrincanteP uso RAYO.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

3)
pAtaqueC=40
cat impacttrueno.txt
echo -e "\n"
echo $contrincanteP uso IMPACTRUENO.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

4)
cat defensa.txt
echo -e "\n"
echo $contrincateP uso ENCANTO.
sleep 2
let armaduraC=$armaduraC+5
;;
esac
done

if [ $vida -gt 0 ]; then
	ganador
else
	perdedor	
fi

}

function charmanderVsPikachu(){
paplay batalla.wav &
while [ $vida -gt 0 ] && [ $vidaC -gt 0 ]; do
clear
echo "														VIDA DE $contrincanteP: $vidaC"
echo -e "\n"
cat charmanderPikachu.txt
echo -e "\n"
echo "		VIDA DE $pokemon: $vida"
echo "	----------------------------------------------------------------------"
echo "	 1. ATAQUE RAPIDO | 2. PUÑO DINAMICO | 3. LANZALLAMAS | 4. PROTECCION"
echo "	----------------------------------------------------------------------"
echo -e "\n"
read -p "	Entrenador $nombre introduzca la accion y pulse ENTER: " ataque




clear
case $ataque in
1)
pAtaque=20
cat ataque1.txt
echo -e "\n"
echo $pokemon uso ATAQUE RAPIDO.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

2)
pAtaque=30
cat puno.txt
echo -e "\n"
echo $pokemon uso PUÑO DINAMICO.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

3)
pAtaque=40
cat lanzallamas.txt
echo -e "\n"
echo $pokemon uso LANZALLAMAS.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

4)
cat defensa.txt
echo -e "\n"
echo $pokemon uso PROTECCION.
sleep 2
let armadura=$armadura+5
;;
esac

clear
echo "														VIDA DE $contrincanteP: $vidaC"
echo -e "\n"
cat charmanderPikachu.txt
echo -e "\n"
echo "		VIDA DE $pokemon: $vida"
sleep 3
clear

#ATAQUE RIVAL
case $(($RANDOM%4)) in
1)
pAtaqueC=20
cat ataque1.txt
echo -e "\n"
echo $contrincanteP uso ATAQUE RAPIDO.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;
2)
pAtaqueC=30
cat rayo.txt
echo -e "\n"
echo $contrincanteP uso RAYO.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

3)
pAtaqueC=40
cat impacttrueno.txt
echo -e "\n"
echo $contrincanteP uso IMPACTRUENO.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;


4)
cat defensa.txt
echo -e "\n"
echo $contrincanteP uso ENCANTO.
sleep 2
let armaduraC=$armaduraC+5
;;
esac
done

if [ $vida -gt 0 ]; then
	ganador
else
	perdedor	
fi

}

function squirtleVsPikachu(){
paplay batalla.wav &
while [ $vida -gt 0 ] && [ $vidaC -gt 0 ]; do
clear
echo "														VIDA DE $contrincanteP: $vidaC"
echo -e "\n"
cat squirtlePikachu.txt
echo -e "\n"
echo "		VIDA DE $pokemon: $vida"
echo "	--------------------------------------------------------------------"
echo "	 1. GOLPE CABEZA | 2. BURBUJA | 3. PISTOLA AGUA | 4. DEFENSA FERREA"
echo "	--------------------------------------------------------------------"
echo -e "\n"
read -p "	Entrenador $nombre introduzca la accion y pulse ENTER: " ataque

clear
case $ataque in
1)
pAtaque=20
cat ataque1.txt
echo -e "\n"
echo $pokemon uso GOLPE CABEZA.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

2)
pAtaque=30
cat burbuja.txt
echo -e "\n"
echo $pokemon uso BURBUJA.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

3)
pAtaque=40
cat pistola.txt
echo -e "\n"
echo $pokemon uso PISTOLA AGUA.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

4)
cat defensa.txt
echo -e "\n"
echo $pokemon uso DEFENSA FERREA.
sleep 2
let armadura=$armadura+5
;;
esac

clear
echo "														VIDA DE $contrincanteP: $vidaC"
echo -e "\n"
cat squirtlePikachu.txt
echo -e "\n"
echo "		VIDA DE $pokemon: $vida"
sleep 3
clear

#ATAQUE RIVAL
case $(($RANDOM%4)) in
1)
pAtaqueC=20
cat ataque1.txt
echo -e "\n"
echo $contrincanteP uso ATAQUE RAPIDO.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;
2)
pAtaqueC=30
cat rayo.txt
echo -e "\n"
echo $contrincanteP uso RAYO.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

3)
pAtaqueC=40
cat impacttrueno.txt
echo -e "\n"
echo $contrincanteP uso IMPACTRUENO.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

4)
cat defensa.txt
echo -e "\n"
echo $contrincanteP uso ENCANTO.
sleep 2
let armaduraC=$armaduraC+5
;;

esac
done

if [ $vida -gt 0 ]; then
	ganador
else
	perdedor	
fi

}

function chikorita(){
clear
local contrincanteP="CHIKORITA"
echo $nombre pelearas contra $contrincanteP. Suerte para ambos!
read -p "Pulse cualquier tecla para continuar..."

case $pokemon in
BULBASUR)
bulbasurVsChikorita
;;
CHARMANDER)
charmanderVsChikorita
;;
SQUIRTLE)
squirtleVsChikorita
;;
esac
}

function bulbasurVsChikorita(){
paplay batalla.wav &
while [ $vida -gt 0 ] && [ $vidaC -gt 0 ]; do
clear
echo "														VIDA DE $contrincanteP: $vidaC"
echo -e "\n"
cat bulbasurChikorita.txt
echo -e "\n"
echo "		VIDA DE $pokemon: $vida"
echo "	-------------------------------------------------------------"
echo "	 1. CORTE | 2. DOBLE FILO | 3. LATIGO CEPA | 4. RIZO DEFENSA"
echo "	-------------------------------------------------------------"
echo -e "\n"
read -p "	Entrenador $nombre introduzca la accion y pulse ENTER: " ataque




clear
case $ataque in
1)
pAtaque=20
cat ataque1.txt
echo -e "\n"
echo $pokemon uso CORTE.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

2)
pAtaque=30
cat corte.txt
echo -e "\n"
echo $pokemon uso DOBLE FILO.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

3)
pAtaque=40
cat latigo.txt
echo -e "\n"
echo $pokemon uso LATIGO CEPA.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

4)
cat defensa.txt
echo -e "\n"
echo $pokemon uso RIZO DEFENSA.
let armadura=$armadura+5
;;
esac

clear
echo "														VIDA DE $contrincanteP: $vidaC"
echo -e "\n"
cat bulbasurChikorita.txt
echo -e "\n"
echo "		VIDA DE $pokemon: $vida"
sleep 3
clear

#ATAQUE RIVAL
case $(($RANDOM%4)) in
1)
pAtaqueC=20
cat ataque1.txt
echo -e "\n"
echo $contrincanteP uso PLACAJE.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

2)
pAtaqueC=30
cat corte.txt
echo -e "\n"
echo $contrincanteP uso CORTE FURIA.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

3)
pAtaqueC=40
cat gigadrenado.txt
echo -e "\n"
echo $contrincanteP uso GIGADRENADO.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

4)
cat defensa.txt
echo -e "\n"
echo $contricanteP uso SINTESIS.
sleep 2
let armaduraC=$armaduraC+5
;;

esac
done

if [ $vida -gt 0 ]; then
	ganador
else
	perdedor	
fi
}

function charmanderVsChikorita(){
paplay batalla.wav &
while [ $vida -gt 0 ] && [ $vidaC -gt 0 ]; do
clear
echo "														VIDA DE $contrincanteP: $vidaC"
echo -e "\n"
cat charmanderChikorita.txt
echo -e "\n"
echo "		VIDA DE $pokemon: $vida"
echo "	----------------------------------------------------------------------"
echo "	 1. ATAQUE RAPIDO | 2. PUÑO DINAMICO | 3. LANZALLAMAS | 4. PROTECCION"
echo "	----------------------------------------------------------------------"
echo -e "\n"
read -p "	Entrenador $nombre introduzca la accion y pulse ENTER: " ataque




clear
case $ataque in
1)
pAtaque=20
cat ataque1.txt
echo -e "\n"
echo $pokemon uso ATAQUE RAPIDO.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

2)
pAtaque=30
cat puno.txt
echo -e "\n"
echo $pokemon uso PUÑO DINAMICO.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

3)
pAtaque=40
cat lanzallamas.txt
echo -e "\n"
echo $pokemon uso LANZALLAMAS.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

4)
cat defensa.txt
echo -e "\n"
echo $pokemon uso PROTECCION.
sleep 2
let armadura=$armadura+5
;;
esac

clear
echo "														VIDA DE $contrincanteP: $vidaC"
echo -e "\n"
cat charmanderChikorita.txt
echo -e "\n"
echo "		VIDA DE $pokemon: $vida"
sleep 3
clear

#ATAQUE RIVAL
case $(($RANDOM%4)) in
1)
pAtaqueC=20
cat ataque1.txt
echo -e "\n"
echo $contrincanteP uso PLACAJE.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

2)
pAtaqueC=30
cat corte.txt
echo -e "\n"
echo $contrincanteP uso CORTE FURIA.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

3)
pAtaqueC=40
cat gigadrenado.txt
echo -e "\n"
echo $contrincanteP uso GIGADRENADO.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

4)
cat defensa.txt
echo -e "\n"
echo $contrincanteP uso SINTESIS.
sleep 2
let armaduraC=$armaduraC+5
;;

esac
done

if [ $vida -gt 0 ]; then
	ganador
else
	perdedor	
fi
}

function squirtleVsChikorita(){
paplay batalla.wav &
while [ $vida -gt 0 ] && [ $vidaC -gt 0 ]; do
clear
echo "														VIDA DE $contrincanteP: $vidaC"
echo -e "\n"
cat squirtleChikorita.txt
echo -e "\n"
echo "		VIDA DE $pokemon: $vida"
echo "	--------------------------------------------------------------------"
echo "	 1. GOLPE CABEZA | 2. BURBUJA | 3. PISTOLA AGUA | 4. DEFENSA FERREA"
echo "	--------------------------------------------------------------------"
echo -e "\n"
read -p "	Entrenador $nombre introduzca la accion y pulse ENTER: " ataque




clear
case $ataque in
1)
#Meter for con la imagen y atacando
pAtaque=20
cat ataque1.txt
echo -e "\n"
echo $pokemon uso GOLPE CABEZA.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

2)
pAtaque=30
cat burbuja.txt
echo -e "\n"
echo $pokemon uso BURBUJA.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

3)
pAtaque=40
cat pistola.txt
echo -e "\n"
echo $pokemon uso PISTOLA AGUA.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

4)
cat defensa.txt
echo -e "\n"
echo $pokemon uso DEFENSA FERREA.
sleep 2
let armadura=$armadura+5
;;
esac

clear
echo "														VIDA DE $contrincanteP: $vidaC"
echo -e "\n"
cat squirtleChikorita.txt
echo -e "\n"
echo "		VIDA DE $pokemon: $vida"
sleep 3
clear

#ATAQUE RIVAL
case $(($RANDOM%4)) in
1)
pAtaqueC=20
cat ataque1.txt
echo -e "\n"
echo $contrincanteP uso PLACAJE.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

2)
pAtaqueC=30
cat corte.txt
echo -e "\n"
echo $contrincanteP uso CORTE FURIA.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

3)
pAtaqueC=40
cat gigadrenado.txt
echo -e "\n"
echo $contrincanteP uso GIGADRENADO.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

4)
cat defensa.txt
echo -e "\n"
echo $contrincanteP uso SINTESIS.
sleep 2
let armaduraC=$armaduraC+5
;;

esac
done

if [ $vida -gt 0 ]; then
	ganador
else
	perdedor	
fi
}

function onix(){
clear
local contrincanteP="ONIX"
echo $nombre pelearas contra $contrincanteP. Suerte para ambos!
read -p "Pulse cualquier tecla para continuar..."

case $pokemon in
BULBASUR)
bulbasurVsOnix
;;
CHARMANDER)
charmanderVsOnix
;;
SQUIRTLE)
squirtleVsOnix
;;
esac
}

function bulbasurVsOnix(){
paplay batalla.wav &
while [ $vida -gt 0 ] && [ $vidaC -gt 0 ]; do
clear
echo "														VIDA DE $contrincanteP: $vidaC"
echo -e "\n"
cat bulbasurOnix.txt
echo -e "\n"
echo "		VIDA DE $pokemon: $vida"
echo "	-------------------------------------------------------------"
echo "	 1. CORTE | 2. DOBLE FILO | 3. LATIGO CEPA | 4. RIZO DEFENSA"
echo "	-------------------------------------------------------------"
echo -e "\n"
read -p "	Entrenador $nombre introduzca la accion y pulse ENTER: " ataque




clear
case $ataque in
1)
pAtaque=20
cat ataque1.txt
echo -e "\n"
echo $pokemon uso CORTE.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

2)
pAtaque=30
cat dobleFilo.txt
echo -e "\n"
echo $pokemon uso DOBLE FILO.
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

3)
pAtaque=40
cat latigo.txt
echo -e "\n"
echo $pokemon uso LATIGO CEPA.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

4)
cat defensa.txt
echo -e "\n"
echo $pokemon uso RIZO DEFENSA.
sleep 2
let armadura=$armadura+5
;;
esac

clear
echo "														VIDA DE $contrincanteP: $vidaC"
echo -e "\n"
cat bulbasurOnix.txt
echo -e "\n"
echo "		VIDA DE $pokemon: $vida"
sleep 3
clear

#ATAQUE RIVAL
case $(($RANDOM%4)) in
1)
pAtaqueC=20
cat ataque1.txt
echo -e "\n"
echo $contrincanteP uso ATIZAR.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

2)
pAtaqueC=30
cat terremoto.txt
echo -e "\n"
echo $contrincanteP uso TERREMOTO.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

3)
pAtaqueC=40
cat lanzarocas.txt
echo -e "\n"
echo $contrincanteP uso LANZAROCAS.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

4)
cat defensa.txt
echo -e "\n"
echo $contrincanteP uso FERTILIZANTE.
sleep 2
let armaduraC=$armaduraC+5
;;

esac
done

if [ $vida -gt 0 ]; then
	ganador
else
	perdedor	
fi
}

function charmanderVsOnix(){
paplay batalla.wav &
while [ $vida -gt 0 ] && [ $vidaC -gt 0 ]; do
clear
echo "														VIDA DE $contrincanteP: $vidaC"
echo -e "\n"
cat charmanderOnix.txt
echo -e "\n"
echo "		VIDA DE $pokemon: $vida"
echo "	----------------------------------------------------------------------"
echo "	 1. ATAQUE RAPIDO | 2. PUÑO DINAMICO | 3. LANZALLAMAS | 4. PROTECCION"
echo "	----------------------------------------------------------------------"
echo -e "\n"
read -p "	Entrenador $nombre introduzca la accion y pulse ENTER: " ataque




clear
case $ataque in
1)
pAtaque=20
cat ataque1.txt
echo -e "\n"
echo $pokemon uso ATAQUE RAPIDO.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

2)
pAtaque=30
cat puno.txt
echo -e "\n"
echo $pokemon uso PUÑO DINAMICO.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

3)
pAtaque=40
cat lanzallamas.txt
echo -e "\n"
echo $pokemon uso LANZALLAMAS.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

4)
cat defensa.txt
echo -e "\n"
echo $pokemon uso PROTECCION.
sleep 2
let armaduraC=$armaduraC+5
;;
esac

clear
echo "														VIDA DE $contrincanteP: $vidaC"
echo -e "\n"
cat charmanderOnix.txt
echo -e "\n"
echo "		VIDA DE $pokemon: $vida"
sleep 3
clear

#ATAQUE RIVAL
case $(($RANDOM%4)) in
1)
pAtaqueC=20
cat ataque1.txt
echo -e "\n"
echo $contrincanteP uso ATIZAR.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

2)
pAtaqueC=30
cat terremoto.txt
echo -e "\n"
echo $contrincanteP uso TERREMOTO.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

3)
pAtaqueC=40
cat lanzarocas.txt
echo -e "\n"
echo $contrincanteP uso LANZAROCAS.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

4)
cat defensa.txt
echo -e "\n"
echo $contrincanteP uso FERTILIZANTE.
sleep 2
let armaduraC=$armaduraC+5
;;

esac
done

if [ $vida -gt 0 ]; then
	ganador
else
	perdedor	
fi
}

function squirtleVsOnix(){
paplay batalla.wav &
while [ $vida -gt 0 ] && [ $vidaC -gt 0 ]; do
clear
echo "														VIDA DE $contrincanteP: $vidaC"
echo -e "\n"
cat squirtleOnix.txt
echo -e "\n"
echo "		VIDA DE $pokemon: $vida"
echo "	--------------------------------------------------------------------"
echo "	 1. GOLPE CABEZA | 2. BURBUJA | 3. PISTOLA AGUA | 4. DEFENSA FERREA"
echo "	--------------------------------------------------------------------"
echo -e "\n"
read -p "	Entrenador $nombre introduzca la accion y pulse ENTER: " ataque




clear
case $ataque in
1)
pAtaque=20
cat ataque1.txt
echo -e "\n"
echo $pokemon uso GOLPE CABEZA.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

2)
pAtaque=30
cat burbuja.txt
echo -e "\n"
echo $pokemon uso BURBUJA.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

3)
pAtaque=40
cat pistola.txt
echo -e "\n"
echo $pokemon uso PISTOLA AGUA.
sleep 2
let vidaC=$(($vidaC-($pAtaque-$armaduraC)))
;;

4)
cat defensa.txt
echo -e "\n"
echo $pokemon uso DEFENSA FERREA.
sleep 2
let armadura=$armadura+5
;;
esac

clear
echo "														VIDA DE $contrincanteP: $vidaC"
echo -e "\n"
cat squirtleOnix.txt
echo -e "\n"
echo "		VIDA DE $pokemon: $vida"
sleep 3
clear

#ATAQUE RIVAL
case $(($RANDOM%4)) in
1)
pAtaqueC=20
cat ataque1.txt
echo -e "\n"
echo $contrincanteP uso ATIZAR.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

2)
pAtaqueC=30
cat terremoto.txt
echo -e "\n"
echo $contrincanteP uso TERREMOTO.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

3)
pAtaqueC=40
cat lanzarocas.txt
echo -e "\n"
echo $contrincanteP uso LANZAROCAS.
sleep 2
let vida=$(($vida-($pAtaqueC-$armadura)))
;;

4)
cat defensa.txt
echo -e "\n"
echo $contrincanteP uso FERTILIZANTE.
sleep 2
let armaduraC=$armaduraC+5
;;

esac
done

if [ $vida -gt 0 ]; then
	ganador
else
	perdedor	
fi
}

function ganador(){
clear
paplay ganar.wav &
echo -------------------------------------------------------
echo Enhorabuena $nombre has ganado la batalla. Felicidades!
echo -------------------------------------------------------
echo El jugador $nombre ha ganado contra $contrincanteP
echo ------------------------------------------------------
echo El día `date +"%D"` a las `date +"%T"` jugando con el usuario $USERNAME
echo ----------------------------------------------------------------

echo El jugador $nombre ha ganado contra $contrincanteP >> ganadores.txt
echo El día `date +"%D"` a las `date +"%T"` jugando con el usuario $USERNAME >> ganadores.txt
echo ---------------------------------------------------------------- >> ganadores.txt
echo -e "\n" >> ganadores.txt
read -p "Pulse cualquier tecla para continuar..."
menu
}

function perdedor(){
clear
echo -------------------------------------------------
echo $nombre has sido derrotado. Intentalo de nuevo...
echo -------------------------------------------------

echo El jugador $nombre ha perdido contra $contrincanteP >> perdedores.txt
echo El día `date +"%D"` a las `date +"%T"` jugando con el usuario $USERNAME >> perdedores.txt
echo ---------------------------------------------------------------- >> perdedores.txt
echo -e "\n" >> perdedores.txt
read -p "Pulse cualquier tecla para continuar..."
menu
}

function salir(){
clear
echo ---------------------------------------------------------------
echo $nombre gracias por jugar a Pokemósh. Nos vemos en la próxima!
echo ---------------------------------------------------------------
read -p "Pulse cualquier tecla para continuar..."
exit
}

while true; do
paplay opening.wav &
for (( i=1; i<=8; i++ )); do
	clear
	cat pantallacarga$i.txt
	sleep 1
done
menu
done
