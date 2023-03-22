fx_version 'cerulean'
game 'gta5'

name "ICT_Department_Status"
description "A hud script that displays a department's status!"
author "IC-Technologies"
version "1.0.0"

lua54 'yes'

shared_scripts {
	'config.lua',
	'shared/*.lua'
}

client_scripts {
	'client.lua'
}

server_scripts {
	'server.lua'
}

server_exports {
	"UpdateDepartmentStatus"
}