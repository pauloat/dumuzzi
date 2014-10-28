Dumuzzi
=======


Sobre / About
=============

Dumuzzi é um sistema de monitoramento de máquinas e serviços pela internet que tem como objetivo verificar o estado atual de cada serviço e, em caso de queda ou grande lentidão, emitir avisos ao administrador.

O nome Dumuzzi vem da mitologia sumérica, onde Dumuzzi representava um filho fiel, um deus guardião das portas do céu. Um serviço de monitoramento eficiente é, de fato, o Guardião do Portal dos Céus de um SysAdmin que, tendo certeza de que seus servidores estão online e operando em perfeito estado, pode dormir tranquilo.

Dumuzzi é o "Filho fiel", deus sumério, consorte de Inanna, irmão de Geshtin-anna, rei-pastor de Uruk, guardião do portal dos céus de Anu, junto com Gishzida, e pescador de Ku'ara.

A utilização do serviço é totalmente gratuita e sem restrições, limitações e outra imposições, podendo utilizá-lo qualquer pessoa que queria monitorar um website.

Dumuzzi nasceu na competição Rally on Rails, feito pela Equipe Cidadelas Jedis e é distribuído sob a licença CDDL e está aberto a colaborações. Fique a vontade para usar, contribuir, modificar e aperfeiçoar.


How to run?
===========

 git clone git://github.com/KoshTech/dumuzzi.git

 cd dumuzzi

 bundle exec rake db:create

 bundle exec  rake db:migrate

 bundle exec  rake db:seed

 cp config/tester.yml.dist config/tester.yml

 nano config/tester.yml

 bundle exec rails s



Conheça das tecnologias utilizadas:
===================================

- rails
- mysql2
- sass-rails
- coffee-rails
- uglifier
- jquery-rails
- therubyracer
- devise
- omniauth
- zscaffold_admin => git://github.com/vagnerzampieri/zscaffold_admin.git
- foreverb
- net-ping
- unicorn


