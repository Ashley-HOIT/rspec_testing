#!/usr/bin/env ruby
require 'docker'

class Docker_test

  def initialize(concurrency=2)
                 # port_num,node)
    @concurrency=concurrency
    # @node=node

    # if port_num == nil
    #   @port_num = %x(
    #               lp=null\n
    #               for port in $(seq 4444 4450); do\n
    #               lsof -i -n -P |grep LISTEN |grep -q ":${port}"\n
    #               [ $? -eq 1 ] && { lp=$port; break; }\n
    #               done\n
    #               [ "$lp" = "null" ] && { echo "no free local ports available"; return 2; }\n
    #               echo $port\n)
    #   @port_num=@port_num.to_i
    # else
    #   @port_num = port_num
    # end


  end

  def start
   puts Docker.info

  end



end


test=Docker_test.new
test.start
