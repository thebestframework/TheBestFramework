# TheBestFramework

THE BEST

## Usage

#### Server

```crystal
require "TheBestFramework"

server = TheBestFramework::Server.new do |context|
  context.response.content_type = "text/the_best"
  context.response.print "THE BEST"
end

address = server.bind_tcp 3000
puts "THE BEST on http://#{address}"
server.listen
```

#### Orm

```crystal
require "TheBestFramework"
require "sqlite3"

TheBestFramework::Orm.open "sqlite3:./file.db" do |db|
  # When using the pg driver, use $1, $2, etc. instead of ?
  db.exec "create table contacts (name text, age integer)"
  db.exec "insert into contacts values (?, ?)", "John Doe", 30

  args = [] of DB::Any
  args << "Sarah"
  args << 33
  db.exec "insert into contacts values (?, ?)", args

  puts "max age:"
  puts db.scalar "select max(age) from contacts" # => 33

  puts "contacts:"
  db.query "select name, age from contacts order by age desc" do |rs|
    puts "#{rs.column_name(0)} (#{rs.column_name(1)})"
    # => name (age)
    rs.each do
      puts "#{rs.read(String)} (#{rs.read(Int32)})"
      # => Sarah (33)
      # => John Doe (30)
    end
  end
end
```
