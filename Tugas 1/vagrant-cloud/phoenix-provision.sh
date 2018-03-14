 #!/usr/bin/env bash
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
apt-get update
apt-get install esl-erlang -y
apt-get install elixir -y

mix local.hex

