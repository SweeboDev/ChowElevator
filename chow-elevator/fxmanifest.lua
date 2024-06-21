-- fxmanifest.lua

fx_version 'cerulean'
game 'gta5'

author 'Chow Scripts'
description 'Elevator Script'
version '1.0.0'

shared_script '@ox_lib/init.lua'


client_scripts {
    'config.lua',
    'elevator.lua'
}


dependencies {
   
    'ox_lib'
}
lua54 'yes'
