#!/usr/bin/perl -w
use strict;

my ($dataname,$speakername)=@ARGV[0,1];
mkdir $dataname."_".$speakername,0755;
system("chuck --srate:44100 record.ck:$dataname:$speakername");

