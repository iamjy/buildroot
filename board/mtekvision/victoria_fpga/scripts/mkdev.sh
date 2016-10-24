#!/bin/sh
#
# makedev.sh - creates device files for a busybox boot floppy image


####################################################################
# Symbol: BR2_ROOTFS_POST_BUILD_SCRIPT [=y]                        #
# Type  : string                                                   #
# Prompt: Custom scripts to run before creating filesystem images  #
#   Location:                                                      #
# (1) -> System configuration                                      #
#   Defined at system/Config.in:393                                #
####################################################################
# Called by ../post_build.sh                                       #
####################################################################


# we do our work in the dev/ directory
if [ -z "$1" ]; then
	echo "usage: `basename $0` path/to/dev/dir"
	exit 1
fi

cd $1


# miscellaneous one-of-a-kind stuff
if [ ! -e console ];
then
		mknod console c 5 1
fi

if [ ! -e full ];
then
		mknod full c 1 7
fi

if [ ! -e kmem ];
then
		mknod kmem c 1 2
fi

if [ ! -e mem ];
then
		mknod mem c 1 1
fi

if [ ! -e null ];
then
		mknod null c 1 3
fi

if [ ! -e port ];
then
		mknod port c 1 4
fi

if [ ! -e random ];
then
		mknod random c 1 8
fi

if [ ! -e urandom ];
then
		mknod urandom c 1 9
fi

if [ ! -e zero ];
then
		mknod zero c 1 5
fi

if [ ! -e /proc/kcore ];
then
		ln -s /proc/kcore core
fi

# IDE HD devs
# note: not going to bother creating all concievable partitions; you can do
# that yourself as you need 'em.
#if [ ! -e hda ];
#then
#		mknod hda b 3 0
#fi
#if [ ! -e hdb ];
#then
#		mknod hdb b 3 64
#fi
#if [ ! -e hdc ];
#then
#		mknod hdc b 22 0
#fi
#if [ ! -e hdd ];
#then
#		mknod hdd b 22 64
#fi

# loop devs
for i in `seq 0 7`; do
		if [ ! -e loop$i ];
		then
				mknod loop$i b 7 $i
		fi
done

# ram devs
for i in `seq 0 9`; do
		if [ ! -e ram$i ];
		then
				mknod ram$i b 1 $i
		fi
done
if [ ! -e ram ];
then
		ln -s ram0 ram
fi

# ttys
if [ ! -e tty ];
then
		mknod tty c 5 0
fi
for i in `seq 0 9`; do
		if [ ! -e tty$i ];
		then
			mknod tty$i c 4 $i
			fi
done
if [ ! -e ttyS0 ];
then
		ln -s /dev/console ttyS0
fi

# virtual console screen devs
for i in `seq 0 9`; do
		if [ ! -e vcs$i ];
		then
			mknod vcs$i b 7 $i
			fi
done
if [ ! -e vcs0 ];
then
		ln -s vcs0 vcs
fi

# virtual console screen w/ attributes devs
for i in `seq 0 9`; do
		if [ ! -e vcsa$i ];
		then
			mknod vcsa$i b 7 $i
		fi
done
if [ ! -e vcsa ];
then
		ln -s vcsa0 vcsa
fi
