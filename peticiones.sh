#!/bin/bash

reqFunction(){
   time_total=$(curl -o /dev/null -L -qs -w "%{time_total}" http://192.168.0.119:3200/)
   time_required=0,0013
   echo "El tiemo total de respuesta es: $time_total"
   echo "El tiempo requerido de respuesta es: $time_required"
   validationFunction
}

validationFunction(){
   if awk 'BEGIN{exit ARGV[1]>=ARGV[2]}' "$time_total" "$time_required"s
   then
      echo 'Peticion realizada de forma exitosa ^^'
      exit 0
   else
      echo 'Tiempo de respuesta excedido, se procedera a tomar acciones en el servidor'
      sshpass -p "12345" ssh -t -o StrictHostKeyChecking=no kamil018@192.168.0.119 'cd git_environment;cd Laboratorio-N-1;sudo sh reinicio.sh'
   fi
}
while true; do reqFunction & sleep 10; done

