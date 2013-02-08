#!/usr/bn/perl
# add this for test

#This function executes the command it recieves and displays the result
sub execute {
    my $cmd = shift;
    print "$cmd\n";
    system($cmd);
}

#Global Variables and Command list
$USAGE="USAGE: perl run.pl <args mentioned below>\n********************\nArguments which may be used:\n1. clean to run \"mvn clean install\"\n2. install to run \"mvn install\"\n3. run to \"start the server\"\n********************\n";
$clean="mvn clean install";
$install="mvn install";
$run="mvn -P cargo.run";
$commit="git commit";
$push="git push";

#Check for arguments
if (@ARGV == null){

    print "No Args found\n$USAGE";
    
}
elsif(lc($ARGV[0]) eq "clean"){
    
    print "starting \"$clean\"\n";
    execute($clean);
    
}elsif(lc($ARGV[0]) eq "install"){
    
    print "starting \"$install\"\n";
    execute($install);
    
}elsif(lc($ARGV[0]) eq "run"){
    
    print "starting \"$run\"\n";
    execute($run);
    
}elsif(lc($ARGV[0]) eq "commit"){
    
    print "starting \"$commit\"\n";
    execute($commit);
    execute($push);
    
}elsif(lc($ARGV[0]) eq "test"){
    execute($ARGV[1]);
}
