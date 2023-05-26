fx_version 'cerulean'
game 'gta5'

author 'VGroup'
description 'Simple police garage script for ESX Legacy'
version '1.1.0'
lua54 'yes'


client_scripts {
    'config.lua',
	'client/*.lua'
} 

server_scripts {
    'config.lua',
	'server/*.lua'
}


dependencies {
    'es_extended',
}

escrow_ignore {
    'config.lua',
}
