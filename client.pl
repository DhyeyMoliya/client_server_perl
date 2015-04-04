#!/usr/local/bin/perl

use Socket;
require "tcp.pl";

#host and port address of server
print "Enter Host Address to which you want to connect : ";
$loc_host = <>;
print "Enter Port Address : ";
$port_addr = <>;

# connection to server using open_tcp function in tcp.pl
if (open_TCP(SERV, $loc_host, $port_addr) == undef) {
  print "Error connecting to server\n";
  exit(-1);
}
else{
  print "Connected to server \n\n";
}

while(1){

#input from server
sysread(SERV, $buffer, 200);
print "Message from server : $buffer";

#input from clientprppfpfofo                              
print "Write your message : ";
$buff= <>;
syswrite(SERV, $buff, length($buff));

close(FH);

}


#socket(SERV, PF_INET, SOCK_STREAM, getprotobyname('tcp')) || die $!;

#my $sin = sockaddr_in (5000,inet_aton('127.0.1.1'));
#connect(SH,$sin) || die $!;

#$buffer="hello !";
#syswrite(FH, $buffer, length($buffer));

#select(FH);
#$|=1;                # set $| to non-zero to make selection autoflushed
#print FH "hello world!";
#sysread(FH, $buffer, 200);  # read at most 200 bytes from FH


#$buffer = <FH>;
