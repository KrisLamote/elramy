# Demo

This is basic demo app which shows the complete cycle of message from inception till consumed. 

## Installation

To run the demo app:

1.  ./develop up -d

2.  ./develop mix deps.get

3.  ./develop mix ecto.create

4.  ./develop mix ecto.migrate

5.  ./develop iex -S mix

6. Publish a message with payload "hello" in the following queue:
   http://localhost:15672/#/queues/%2F/gen_server_test_queue 

7. check log in the terminal for log and mysql table using any GUI like mysqlworkbench


