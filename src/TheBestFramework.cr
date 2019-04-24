require "http/server"
require "db"

module TheBestFramework
  VERSION = "0.1.0"

  
  alias Server = HTTP::Server
  alias TheBestFramework::Orm = DB
end
