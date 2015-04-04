#!/usr/bin/perl

use IO::Socket;

$! = "Error encountered. \n\n Exiting Now ... ";

$proto = getprotobyname('tcp');
socket(SERV, PF_INET, SOCK_STREAM, $proto) || die $!;

print "\nEnter Host Address : ";
$host_addr = <STDIN>;
print "Enter Port Address : ";
$port_addr = <STDIN>;

my $sockin = sockaddr_in ($port_addr,inet_aton($host_addr));
bind(SERV,$sockin) || die $!;

$length = 1;
listen(SERV, $length) || die $!;

print "\n\nServer is running ....";
print "\nHost Address : $host_addr";
print "Port Address : $port_addr";

accept(FH,SERV) || die $!;
print "Client Connected...\n\n";

while (1){

print "Write your message : ";
$buffer= <>;
syswrite(FH, $buffer, length($buffer));

#select(FH);
#$|=1;                # set $| to non-zero to make selection autoflushed
#print FH "hello world!";

#print $_ while (<FH>);

sysread(FH, $buff, 200);  # read at most 200 bytes from FH
print "Message from client : $buff";
#$buffer = <FH>;

close(SERV);

}
