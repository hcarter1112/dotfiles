#!/bin/bash
# This script is to ask all of the set up questions and store them in variables to be referenced during the install.

## Set hostname
echo "Please enter a hostname: " &&
	read $hostname &&
	echo "$hostname" >/etc/hostname &&

	## Set Root password
	passwd &&

	## Create skel format for new users
	cd /etc/skel &&
	mkdir Downloads Documents Videos Pictures .config .gitstuff &&

	## Add ralldi user and prompt for password
	useradd -m -G wheel ralldi &&
	echo "User ralldi added..."
echo "please add a password"
passwd ralldi &&

	## This script will start with some prompts that
	# will store vaiables for software packages
	# Each prompt is placed in while loop with if statements for error checking
	error="Please enter a valid number"
confirm=-1
while [ $confirm -eq -1 ]; do
	## CPU selection prompt
	exit_code=-1
	while [[ $exit_code -eq -1 ]]; do
		echo "Please pick a CPU by entering a number:"
		echo "1) AMD"
		echo "2) Intel"
		read cpu
		if [ $cpu -eq 1 ]; then
			cpuReadout="AMD CPU"
			exit_code=0
		elif [ $cpu -eq 2 ]; then
			cpuReadout="INTEL CPU"
			exit_code=0
		else
			echo $error
		fi
	done

	## GPU Selection prompt
	exit_code=-1
	while [[ $exit_code -eq -1 ]]; do
		echo "Please pick a GPU by entering a number:"
		echo "0) NO GPU"
		echo "1) AMD"
		echo "2) NVIDIA (PROPRIETARY DRIVERS)"
		read gpu
		if [ $gpu -eq 1 ]; then
			gpuReadout="AMD GPU"
			exit_code=0
		elif [ $gpu -eq 2 ]; then
			gpuReadout="NVIDIA CPU"
			exit_code=0
		elif [ $gpu -eq 0 ]; then
			gpuReadout="NO GPU DRIVERS"
			exit_code=0
		else
			echo $error
		fi
	done

	## Gaming software selection prompts
	exit_code=-1
	while [[ $exit_code -eq -1 ]]; do
		echo "Would you like to install steam, lutris, and wine dependencies?"
		echo "1) Yes"
		echo "2) No"
		read gameStuff
		if [ $gameStuff -eq 1 ]; then
			gameStuffReadout="WILL install gaming and wine packages"
			exit_code=0
		elif [ $gpu -eq 2 ]; then
			gameStuffReadout="WILL NOT install gaming and wine packages"
			exit_code=0
		else
			echo $error
		fi
	done

	## Printing and scanning utilities (EPSON L-395)
	exit_code=-1
	while [[ $exit_code -eq -1 ]]; do
		echo "Would you like to install printing and scanning utilities?"
		echo "1) Yes"
		echo "2) No"
		read printing
		if [ $printing -eq 1 ]; then
			printingReadout="WILL install printing and scanning utilities"
			exit_code=0
		elif [ $gpu -eq 2 ]; then
			printingReadout="WILL NOT install printing and scanning utilities"
			exit_code=0
		else
			echo $error
		fi
	done
	## Read out section where you can see your selected options and decide
	## if you would like to reselect
	echo "These are the options that you have selected"
	echo "    - $cpuReadout"
	echo "    - $gpuReadout"
	echo "    - $gameStuffReadout"
	echo "    - $printingReadout"
	echo " "
	echo "Are these your desired options?"
	echo "1) Yes"
	echo "2) No"
	read ans
	if [ $ans -eq 1 ]; then
		echo "You have confirmed your selected options..."
		echo "Now on to installation..."
		confirm=0
	elif [ $ans -eq 2 ]; then
		echo "You will be returned to the start to reselect your options..."
	else
		echo $error
	fi
done
export printing
export gpu
export cpu
export gameStuff
