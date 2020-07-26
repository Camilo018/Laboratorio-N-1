#!/bin/bash

reqFunction(){
   $req_time = $(curl -s -w '%{time_total}\n' -o /dev/null 10.0.2.4:3200);
   echo "El tiempo de respuesta es: $req_time"
}
reqFunction