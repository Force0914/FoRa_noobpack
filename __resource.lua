description 'FoRa_noobpack'

version '1.0.2'

server_scripts {
	"@mysql-async/lib/MySQL.lua",
  '@es_extended/locale.lua',
  'server/server.lua'
}

client_scripts {
  'client/client.lua'
}
