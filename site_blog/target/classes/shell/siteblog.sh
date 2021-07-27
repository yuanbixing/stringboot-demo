#!/usr/bin/env sh
##
## This script launches the farseer.
##
## Optional environment variables
##
## JAVA_HOME        Point at a JDK install to use.
## 
## FARSEER_HOME    Pointer to your farseer install.  If not present, we 
##                  make an educated guess based of position relative to this
##                  script.
##
## JAVA_OPTS        Java runtime options.  Default setting is '-Xmx512m'.
##
## FOREGROUND       Set to any value -- e.g. 'true' -- if you want to run
##                  farseer in foreground
##

# Resolve links - $0 may be a softlink
echo "*********************************"
kill -9 `ps -ef|grep webapp.name=site-blog| grep -v grep |awk '{print $2}'`
PRG="$0"
while [ -h "$PRG" ]; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '.*/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done
PRGDIR=`dirname "$PRG"`
# Load java runtime environment
#if [ "$PRGDIR" = "." ] ; then
#  . j2eeenv.sh
#else
#  . $PRGDIR/j2eeenv.sh
#fi

# Read local farseer properties if any.
if [ -f $HOME/.farseerrc ]
then 
  . $HOME/.farseerrc
fi

# Set FARSEER_HOME.
if [ -z "$FARSEER_HOME" ]
then
    FARSEER_HOME=`cd "$PRGDIR/.." ; pwd`
fi
echo "----------------------------------"
echo "Set project path $FARSEER_HOME----"
echo "----------------------------------"
echo "Begin find java environment~~~----"
# Find JAVA_HOME.
if [ -z "$JAVA_HOME" ]
then
  JAVA=`which java`
  if [ -z "$JAVA" ] 
  then
    echo "Cannot find JAVA. Please set JAVA_HOME or your PATH."
    exit 1
  fi
  JAVA_BINDIR=`dirname $JAVA`
  JAVA_HOME=$JAVA_BINDIR/..
fi
echo "pass~~~~~~~~~~~~~~~~~~~~~~~~~~~~~----"
if [ -z "$JAVACMD" ] 
then 
   JAVACMD="$JAVA_HOME/bin/java"
fi
# Ignore previous classpath.  Build one that contains farseer jar and content
# of the lib directory into the variable CP.
#CP=$FARSEER_HOME:$FARSEER_HOME/config
echo "------------------------------------"
echo "---Begin add project dependencies jar !!!"
for jar in `find $FARSEER_HOME/lib -name *.jar`
do
    CP=${CP}:${jar}
done
echo "******Path is $FARSEER_HOME/lib *.jar ------------"
echo "--------------------------------------------------"
echo $CP
# Make sure of java opts.
if [ -z "$JAVA_OPTS" ]
then
  JAVA_OPTS=" -Xmx512m"
fi
echo "--------------------------------------------------"
echo "JAVA_OPTS: $JAVA_OPTS"
# Main farseer class.
if [ -z "$MAIN_CLASS" ]
then
  MAIN_CLASS='com.yaa.Application'
fi
echo "--------------------------------------------------"
echo "MAIN_CLASS : $MAIN_CLASS"
export CLASSPATH=$CLASSPATH:$FARSEER_HOME/bin/site-blog.jar
echo "--------------------------------------------------"
echo "JAR Root_PATH : $CLASSPATH"
# If FOREGROUND is set, run farseer in foreground.
WEBAPP_NAME="site-blog"
echo "--------------------------------------------------"
echo "WEBAPP_NAME: $WEBAPP_NAME"
echo "--------------------------------------------------"
echo "Run foreground!"
nohup java -Dwebapp.name=${WEBAPP_NAME} ${JAVA_OPTS} $MAIN_CLASS $@ >> /dev/null 2>&1 &
echo "--------------------------------------------------"
echo "Tail Logging~~~~~~~~~"
tail -f $FARSEER_HOME/log/site.log

	
