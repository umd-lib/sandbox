#!/usr/bn/perl

#This function executes the command it recieves and displays the result.
sub execute {
    my $cmd = shift;
    #print "$cmd\n";
    $mycmd=system($cmd);
    
    if($retVal!=0){
        #Means the command has failed.
        exit 1;
    }
}

#Global Variables and Command list
$USAGE="USAGE:\n********************\nArguments which may be used:\n1. \"perl run.pl clean\" to run \"mvn clean install\"\n2. \"perl run.pl install\" to run \"mvn install\"\n3. \"perl run.pl start\" to start the server\n4. \"perl run.pl pull commit push\": This will run only the specified commands in the order mentioned by you.\n5. \"perl run.pl hardcommit \"commit message goes here\" \": This will pull, commit and push and you will have no control over this order\n********************\n";
$clean="mvn clean install";
$install="mvn install";
$run="mvn -P cargo.run";
$commit="git commit";
$push="git push";
$pull="git pull";


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
    
}elsif(@ARGV!=null && (lc($ARGV[0]) eq "pull" ||  lc($arg) eq "commit" || lc($arg) eq "push" ) ){
    
    foreach $arg (@ARGV){
        if(lc($arg) eq "pull"){
            execute($pull);
        }elsif(lc($arg) eq "commit"){
            execute($commit);
            
        }elsif(lc($arg) eq "push"){
            execute($push);
            
        }
    }
    
}elsif(lc($ARGV[0]) eq "hardcommit"){
    
    if($ARGV[1]==null){
        print "$USAGE";
        exit 0;
    }else{
        print "Are you sure you want to hardCommit? (This will run pull commit and push in one go)? [yes/no]:";
        my $response=<>;
        if(lc($response) eq yes){
            $hardcommit="git commit -m $ARGV[1]";
            execute($pull);
            execute($hardcommit);
            execute($push);
        }else{
            print "Aborting...Did not commit!!\n";
            exit 0;
        }
        
    }
    
}elsif(lc($ARGV[0]) eq "test"){
    execute($ARGV[1]);
}
