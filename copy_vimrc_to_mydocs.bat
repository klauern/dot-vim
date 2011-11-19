@ECHO off
REM the _vimrc file in my Windows ~/ directory will get overwritten alot of the 
REM time even if you use Junctions or Hard Linking.  So, to keep this vimrc 
REM fresh with the _vimrc, copy it over;
cp vimrc ..\_vimrc
ECHO done
