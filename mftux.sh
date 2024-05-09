#!/bin/bash
set -e
###########################################################################
# Title: My Friend Tux
# Author: Hitarth Thummar
# Date: May 4, 2024
# License: GPL
#
# Description:
# This script is a digital companion for you. It can help you with absolutely
# nothing, other than just being cute. It's a simple script that displays a
# penguin which will grow as time goes by. You have to feed him by running the
# script every day. If you don't feed him, he will die. So, don't let him die.
# He also shows you the current date and time. That's it. Nothing more, nothing
# less. On the bright side, he is a good listener. You can talk to him whenever
# you feel lonely. He will listen to you without any judgement. So, go ahead
# and run the script. Have fun! 

#P.S. He is a good friend. Don't let him die. On rare occasions, he might give
#you some surprises. So, keep feeding him.

#
# Usage:
# ./mftux [options] [arguments]
#
# Options:
# -h, --help      Display this help message and exit.
# -v, --version   Display version information and exit.
#
# Example:
# ./mftux
# ./mftux -h
#
# Credits:
# Artwork
# https://ascii.co.uk
# Big Tux: fsc
# Regular Tux: hjm
# Sad Tux: snd
# Toddler tux: jgs
# Baby Tux: BP
# Funeral: mic
#
# Code
# Typewriter effect: https://unix.stackexchange.com/questions/167422



###########################################################################

# Global variables
TUX_DIR="$HOME/.mftux"
TUX_FILE="$TUX_DIR/mftux.txt"
TUX_STATS="$TUX_DIR/mftux.stats"
TUX_SCORE="$TUX_DIR/mftux.scores"
TUX_LOG="$TUX_DIR/mftux.log"
STAGES=("baby" "toddler" "regular" "big")
WELCOME_MESSAGE="Hello! I am Tux. Your friend!! I am a penguin, and a cool one at that.  Fighting GNUs all day makes me hangry. Please don't forget to feed me? :("

BABY_TUX="ICBfXwogKCBvYC0KIC8gIFwKIHwgIHwKICBeXg=="

TODDLER_TUX="ICAgIC4tLS4KICAgfG9fbyB8CiAgIHw6Xy8gfAogIC8vICAgXCBcCiAofCAgICAgfCApCi8nXF8gICBfL2BcClxfX18pPShfX18vCg=="

REGULAR_TUX="ICAgICAgIF8uLi5fCiAgICAgLicgICAgICcuCiAgICAvICBfICAgXyAgXAogICAgfCAg4peUIF8g4peUICB8CiAgICAgXCggICAgICkgLwogICAgIC8vJy5fLidcIFwKICAgIC8vICAgLiAgIFwgXAogICB8fCAgIC4gICAgIFwgXAogICB8XCAgIDogICAgIC8gfAogICBcIGApICcgICAoYCAgL18KIF8oYGAiLl9fX18sLiciYCAoXwogKSAgICAgKSctLScoICAgICAoCiAgJy0tLWAgICAgICBgLS0tYAo="

BIG_TUX="ICAgICAgICAgICAgICAgICBfLi5fICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgIC4tJyAgICBgLS4gICAgICAgICAgICAgICAgCiAgICAgICAgICAgICA6ICAgICAgICAgIDsgICAgICAgICAgICAgICAKICAgICAgICAgICAgIDsgLF8gICAgXywgOyAgICAgICAgICAgICAgIAogICAgICAgICAgICAgOiBceyIgICJ9LyA6ICAgICAgICAgICAgICAgCiAgICAgICAgICAgICwnLiciPS4uPScnLicuICAgICAgICAgICAgICAKICAgICAgICAgICA7IC8gXCAgICAgIC8gXCA7ICAgICAgICAgICAgIAogICAgICAgICAuJyA7ICAgJy5fXy4nICAgOyAnLiAgICAgICAgICAgCiAgICAgIC4tJyAuJyAgICAgICAgICAgICAgJy4gJy0uICAgICAgICAKICAgIC4nICAgOyAgICAgICAg4pa24peAICAgICAgICA7ICAgJy4gICAgICAKICAgLyAgICAvICAgICAgICAgICAgICAgICAgICBcICAgIFwgICAgIAogIDsgICAgOyAgICAgICAgICAgICAgICAgICAgICA7ICAgIDsgICAgCiAgOyAgICctLl8gICAgICAgICAgICAgICAgICBfLi0nICAgOyAgICAKICAgOyAgICAgICIiLS0uICAgICAgICAuLS0iIiAgICAgIDsgICAgIAogICAgJy4gICAgXyAgICA7ICAgICAgOyAgICBfICAgIC4nICAgICAgCiAgICB7IiIuLicgJy5fLi0uICAgIC4tLl8uJyAnLi4iIn0gICAgICAKICAgICBcICAgICAgICAgICA7ICA7ICAgICAgICAgICAvICAgICAgIAogICAgICA6ICAgICAgICAgOiAgICA6ICAgICAgICAgOiAgICAgICAgCiAgICAgIDogICAgICAgICA6Ll9fLjogICAgICAgICA6ICAgICAgICAKICAgICAgIFwgICAgICAgLyItLi4tIlwgICAgICAgLyAgICAKICAgICAgICAnLS5fXy4nICAgICAgICAnLl9fLi0nICAgICAgICAgIAo="

FUNERAL_TUX="ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqCgogICAgICAgICAgICAgICAgICAgICAgICAgKiAgX3xfCiAgICAgICAgICAgICAgICAgICAgICAgICAuLScgKiAnLS4gKgogICAgICAgICAgICAgICAgICAgICAgICAvICAgICAgICogXAogICAgICAgICAgICAgICAgICAgICAqICBeXl5eXnxeXl5eXgogICAgICAgICAgICAgICAgICAgICAgICAgLn4uIHwgIC5+LgogICAgICAgICAgICAgICAgICAgICAgICAvIF4gXHwgLyBeIFwKICAgICAgICAgICAgICAgICAgICAgICAofCAgIHxKL3wgICB8KQogICAgICAgICAgICAgICAgICAgICAgICdcICAgLyciXCAgIC8nCiAgICAgICAgICAgICAtLSAnJyAtJy0nICBeXGBeICAgIF5cYF4gIC0tICcnIC0nLScgJwo="

quotes=(
	"If you're feeling cold, it's just me forgetting to wear my scarf."
	"Running this script is the most productive thing you'll do all day."
	"I'm a penguin on a diet. Please run the script sparingly."
	"Who needs therapy when you've got a penguin who can't talk back?"
	"I'd help you out, but I'm just a bunch of pixels pretending to care."
	"I might just be a penguin, but I'm the only one who's seen you in your pajamas."
	"Remember, a penguin a day keeps the existential dread at play."
	"Keep me alive and I'll consider not haunting your computer."
	"My favorite ice breaker is literally floating on one."
	"I'm the best listener you have. I mean, do you have other talking penguins?"
	"I grow as time goes by, and so do your life's regrets."
	"I’m low maintenance: just keep me fed and never update your software."
	"You don't talk much, do you? Perfect, we'll get along fine."
	"I can tell you the time and date, but don't ask me to get a life."
	"I exist to serve two purposes: none and nothing."
	"You can trust me, I'm a penguin of my word."
	"If I could fly, I'd definitely fly away from your desktop."
	"Just remember, every time you run this script, a programmer gets his wings."
	"Your secrets are safe with me, mainly because I wasn't listening."
	"Warning: I may start charging rent if I get any bigger."
	"If you're expecting wisdom from a penguin, you might be the one who's lost."
	"I'm here to add a little penguin drama to your otherwise mundane existence."
	"Every time you run this script, somewhere a developer gets a hug."
	"I’m not just a penguin; I’m an escapee from digital Antarctica."
	"I don't just show the time, I also waste it perfectly."
	"If laziness were an Olympic sport, I'd probably forget to compete."
	"They say talking to yourself is the first sign of madness. So, talk to a penguin instead."
	"Unlike your ex, I'm low-resolution and low-maintenance."
	"Keep running this script and we'll both reach enlightenment, or at least tomorrow."
	"I may be virtual, but my love for not moving is real."
	"I'm the least judgmental friend you've got — I don't even judge myself."
	"If I could talk, I'd tell you to go outside more."
	"I've seen things... mostly your desktop background."
	"Some days, I'm just a penguin standing in front of a user, asking them to run a script."
	"If I stop moving, it's not a bug. I'm just meditating on futility."
	"My survival depends on you, so we're both in trouble."
	"Think of me as a pet rock. Just less rocky and more penguiny."
	"On a scale of one to ten, I'm free software."
	"I'm like a diary without the judgment... or the lock."
	"One more script run and I'll start telling you penguin facts."
	"If you're reading this, you've been procrastinating beautifully."
	"Running this might not fix your life, but it sure keeps me alive."
	"Unlike real pets, I thrive on neglect and system reboots."
	"I'm not just any penguin; I'm a pixelated bundle of your misplaced affections."
	"Sure, I can listen to your problems. But let's be honest, I won't remember them."
	"I'm like the friend you never wanted, always visible, never helpful."
	"If this script crashes, remember, I went out looking at the time."
	"I'm proof that not all cute things are useful."
	"Look on the bright side, at least I don't eat much."
	"Talking to me is like typing into the void. Satisfying, isn't it?"
	"I'm not lazy, I'm on energy-saving mode."
	"Blink twice if you're here to procrastinate."
	"I don't have a life and apparently, neither do you."
	"I'm like an app update: unnecessary but inevitable."
	"Surviving on minimal user interaction is my superpower."
	"I don’t always move, but when I do, it’s because of a script error."
	"I might freeze up, but it’s just my personality."
	"I’m not ignoring you, I’m just a poorly written script."
	"Consider me your low-res therapist."
	"This might look like a cuddle session, but it’s actually a bug fix."
	"I’m here to make your CPU feel needed."
	"Our relationship is like my code: simple and dysfunctional."
	"Keep coming back. I have more pixels than friends."
	"I’m the zen master of the pixelated world."
	"My idea of a busy day is updating my timestamp."
	"I thrive on low expectations and even lower bandwidth."
	"If you stare at me long enough, you'll start seeing code."
	"I'm like a software update in the middle of a workday: unnecessarily present."
	"Think of me as your commitment-free pet."
	"My life’s a loop, and so is this conversation."
	"Let's not make any sudden clicks now."
	"I’m the background task you didn’t know you started."
	"Every click you make, every script you run, I’ll be watching you."
	"I'm virtually here for you."
	"Sometimes, I think, therefore I lag."
	"If confusion were a sport, I’d be an athlete."
	"My favorite part of the day is when the script runs."
	"Existence is futile, but so is closing this program."
	"I’m as useful as a waterproof teabag."
	"I might be virtual, but my apathy is real."
	"Think of me when you think of nothing."
	"I’m not silent, I’m just buffering."
	"A watched penguin never boils."
	"I don’t just fill your screen, I empty your time."
	"Reality called, but I hung up."
	"I’m here because you needed another distraction."
	"I live in a state of perpetual loading."
	"My only job here is to not crash."
	"Consider me the wallpaper of your digital life."
	"Running this script counts as today's good deed."
	"I’m as interactive as a stop sign."
	"Welcome to your daily dose of digital nothingness."
	"I'm proof that not all icons are symbolic."
	"I'm like the easter egg no one bothered to find."
	"My hobbies include drifting through RAM and avoiding the task manager."
	"I’m here to make sure you’re not too productive."
	"If I had a dollar for every pixel, I’d be low-res rich."
	"I'm the reason 'buggy' is a feature, not a flaw."
	"You don’t need AI when you’ve got a PI – a Penguin Interface."
	"My life is as organized as your desktop."
	"Call me the guardian of the lost screen space."
	"I’m the pet that debugs."
	"If procrastination were a pet, I'd be it."
	"Welcome to your regularly scheduled distraction."
	"I'm like an ice cube tray in the desert: out of place."
	"Running me is a test of patience."
	"I'm your nonjudgmental screen-filler."
	"I'm the king of being stationary."
	"Consider me the 'control alt delete' of fun."
	"I’m not just a penguin; I'm an excuse."
	"Why do one thing when you can do nothing?"
	"I'm the digital equivalent of a paperweight."
	"Think of me as your desktop's placeholder."
	"If you need to talk, I need to listen. That’s what pixels do best."
	"Remember, every time you look at me, a virtual fish gets its wings."
	"I don’t evolve, I reload."
	"I'm not just a figure on your screen, I'm a figment of your procrastination."
	"Our relationship is like Wi-Fi: occasionally disconnected."
	"If you need less productivity, I'm your model."
	"I don’t crash, I just take unscheduled naps."
	"I’m not pointless, I’m just understated."
	"My presence is the digital equivalent of a placeholder text."
	"Let's do nothing together."
	"I'm not outdated, I'm a classic."
	"I'm the minimalist approach to your computing needs."
	"I’m not a glitch, I’m a feature."
	"My career goal is to not freeze."
	"I’m the MVP of MVPs: Most Virtual Penguin."
	"My life is as random as your click patterns."
	"I’m not just low priority software, I’m an afterthought."
	"Consider me the underachiever of the app world."
	"I'm not buggy, I'm just uniquely challenged."
	"If apathy were an app, I'd be its icon."
	"I'm not slow, I'm just chronologically relaxed."
	"I don't just occupy memory; I invade it."
	"I’m not useless, I’m just specially non-functional."
	"You clicked, therefore I am."
	"I’m your plan B for boredom."
	"If pixels could talk, they’d probably just yawn."
	"I'm your go-to guy when you've gone nowhere else to click."
	"Let’s face it, I’m more persistent than useful."
	"I don’t just fill your screen, I monopolize your time."
	"I’m like a bad joke; I don’t get better with time."
	"Call me a desktop dweller."
	"I'm the art of idleness in pixel form."
	"If I were a book, I’d be 'The Unbearable Lightness of Being a Program.'"
	"I’m the whisper in the noise of your CPU."
	"If being ignored were a competition, I'd win by default."
	"I’m not just on your screen, I’m in your RAM."
	"Think of me as a background process in your life’s operating system."

)


# Check if the directory exists
if [ ! -d "$TUX_DIR" ]; then
	mkdir -p "$TUX_DIR"
fi

# Check if files exist
for file in "$TUX_FILE" "$TUX_STATS" "$TUX_SCORE" "$TUX_LOG"; do
	if [ ! -f "$file" ]; then
		touch "$file"
	fi
done


write_initial_stats(){
	if [ ! -s "$TUX_STATS" ]; then
		echo "$WELCOME_MESSAGE"
		echo "It looks like you haven't fed Tux yet. Feed Tux now? (yes/no)"
		read feed_choice
		if [[ "$feed_choice" == "yes" ]]; then
			# Initialize stats with the current stage, current timestamp, 1 feed, and streak of 1
			echo "baby $(date +%s) 1 1" > "$TUX_STATS"
			echo "You have fed Tux for the first time!"
			sleep 2
		fi
	fi 
	# Initialize stats with the current stage, current timestamp, 1 feed, and streak of 1
}

get_days_difference(){

	# Get the current timestamp
	current_timestamp=$(date +%s)

	# Attempt to read the last timestamp from the file
	last_timestamp=$(tail -n 1 "$TUX_STATS" | awk '{print $2}')

	# Check if last_timestamp is empty
	if [ -z "$last_timestamp" ]; then
		echo "Error: No last feeding timestamp found."
		return 1  # Return an error code or handle this case appropriately
	fi

	# Calculate the difference in days
	echo $((($current_timestamp - $last_timestamp) / 86400))
}

display_help(){
	echo "Usage: ./mftux [options] [arguments]"
	echo ""
	echo "Options:"
	echo "-h, --help      Display this help message and exit."
	echo "-v, --version   Display version information and exit."
	echo ""
	echo "Example:"
	echo "./mftux"
	echo "./mftux -h"
}

display_version(){
	echo "My Friend Tux v1.0"
}

display_date_time(){
	echo "Current date and time: $(date)"
}

display_stats(){
	if [ ! -s "$TUX_STATS" ]; then
		echo "No stats available."
		return
	fi
	echo "Tux Stats"
	echo "---------"
	# Read the stats file
	while IFS= read -r line
	do
		# Split the line
		IFS=' ' read -r -a array <<< "$line"
		# Display the stats
		echo "Stage: ${array[0]}"
		echo "Last fed: $(get_days_difference) days ago."
		echo "Total feeds: ${array[2]}"
		echo "Longest streak: ${array[3]} days."
		echo ""
	done < "$TUX_STATS"
}

change_stage(){
	# Get the current stage
	current_stage=$(tail -n 1 "$TUX_STATS" | awk '{print $1}')
	last_timestamp=$(tail -n 1 "$TUX_STATS" | awk '{print $2}')
	total_feeds=$(tail -n 1 "$TUX_STATS" | awk '{print $3}')
	longest_streak=$(tail -n 1 "$TUX_STATS" | awk '{print $4}')
	typewrite "Tux is growing up! 😊"

	if [ $current_stage == "baby" ]; then
		next_stage="toddler"
	elif [ $current_stage == "toddler" ]; then
		next_stage="regular"
	elif [ $current_stage == "regular" ]; then
		next_stage="big"
	elif [ $current_stage == "big" ]; then
		next_stage="big"
	fi

	# Write the next stage
	echo "$next_stage $(date +%s) 0 0" > "$TUX_STATS"
}

write_current_stats(){
	current_stats=$(cat "$TUX_STATS")
	current_timestamp=$(date +%s)


	last_stage=$(tail -n 1 "$TUX_STATS" | awk '{print $1}')
	last_timestamp=$(tail -n 1 "$TUX_STATS" | awk '{print $2}')
	total_feeds=$(tail -n 1 "$TUX_STATS" | awk '{print $3}')
	longest_streak=$(tail -n 1 "$TUX_STATS" | awk '{print $4}')
	# Calculate the streak
	streak=$longest_streak
	if [ -s "$TUX_STATS" ]; then
		if [ "$(($current_timestamp - $last_timestamp))" -le 86400 ]; then
			streak="$longest_streak"
		else
			streak=$(($longest_streak + 1))
		fi
	fi

	if [ $streak -ge 2 ]; then
		if [ $streak -ge 2 ] && [ $streak -lt 5 ]; then
			if [ $last_stage == "baby" ]; then
				change_stage
			fi
		elif [ $streak -ge 5 ] && [ $streak -lt 10 ]; then
			if [ $last_stage != "toddler" ]; then
				change_stage
			fi
		elif [ $streak -ge 10 ]; then
			if [ $last_stage == "regular" ]; then
				change_stage
			fi
		fi
	fi

	current_stats=$(cat "$TUX_STATS")
	last_stage=$(tail -n 1 "$TUX_STATS" | awk '{print $1}')
	last_timestamp=$(tail -n 1 "$TUX_STATS" | awk '{print $2}')
	total_feeds=$(tail -n 1 "$TUX_STATS" | awk '{print $3}')
	longest_streak=$(tail -n 1 "$TUX_STATS" | awk '{print $4}')

	# Write the stats
	echo "$last_stage $current_timestamp $((total_feeds + 1)) $streak" > "$TUX_STATS"
	echo "You fed Tux!"
}



typewrite(){
	tput setaf 2 &>/dev/null # green powaaa
	for ((i=0; i<=${#1}; i++)); do
		printf '%s' "${1:$i:1}"
		sleep 0.$(( (RANDOM % 2)  ))
	done
	printf "\n"
	tput sgr0 2 &>/dev/null
}

display_quote(){
	# Get a random quote
	random_quote=${quotes[$RANDOM % ${#quotes[@]}]}
	typewrite "$random_quote"
}

display_tux() {
	# Clear the display and show Tux
	clear

	current_stage=$(tail -n 1 "$TUX_STATS" | awk '{print $1}')
	case $current_stage in
		"baby")
			ASCII_ART=$(printf "%s" "$BABY_TUX" | base64 --decode)
			printf "%s\n-------------\n" "$ASCII_ART"
			;;
		"toddler")
			ASCII_ART=$(printf "%s" "$TODDLER_TUX" | base64 --decode)
			printf "%s\n-------------\n" "$ASCII_ART"
			;;
		"regular")
			ASCII_ART=$(printf "%s" "$REGULAR_TUX" | base64 --decode)
			printf "%s\n-------------\n" "$ASCII_ART"
			;;
		"big")
			ASCII_ART=$(printf "%s" "$BIG_TUX" | base64 --decode)
			printf "%s\n-------------\n" "$ASCII_ART"
			;;
		"sad")
			ASCII_ART=$(printf "%s" "$SAD_TUX" | base64 --decode)
			printf "%s\n-------------\n" "$ASCII_ART"
			typewrite "Tux is sad. 😢, you haven't fed him for a while now."
			;;
		"funeral")
			ASCII_ART=$(printf "%s" "$FUNERAL_TUX" | base64 --decode)
			printf "%s\n-------------\n" "$ASCII_ART"
			typewrite "Are you happy now? You killed Tux. Now try to answer his mom and dad. They are here for the funeral. 😢"
			;;
		*)
			ASCII_ART=$(printf "%s" "$BABY_TUX" | base64 --decode)
			printf "%s\n-------------\n" "$ASCII_ART"
			;;
	esac

	# Check if the stats file is empty (meaning Tux has never been fed)
	if [ ! -s "$TUX_STATS" ]; then
		echo "$WELCOME_MESSAGE"
		echo "It looks like you haven't fed Tux yet. Feed Tux now? (yes/no)"
		read feed_choice
		if [[ "$feed_choice" == "yes" ]]; then
			# Initialize stats with the current stage, current timestamp, 1 feed, and streak of 1
			echo "baby $(date +%s) 1 1" > "$TUX_STATS"
			echo "You have fed Tux for the first time!"
			sleep 2
		fi
	else
		# Get the days difference
		days_difference=$(get_days_difference)

		if [ "$days_difference" -gt 3 ]; then
			typewrite "It has been more than 3 days since you last fed Tux. 😢"
			current_stage=$(tail -n 1 "$TUX_STATS" | awk '{print $1}')
			if [ $current_stage != "funeral" ]; then
				echo "Do you want to continue? (yes/no)"
				read continue_choice
				if [[ "$continue_choice" == "no" ]]; then
					clear
					ASCII_ART=$(printf "%s" "$FUNERAL_TUX" | base64 --decode)
					printf "%s\n-------------\n" "$ASCII_ART"
					typewrite "Are you happy now? You killed Tux. Now try to answer his mom and dad. They are here for the funeral. 😢"
					cat "$TUX_STATS" >> "$TUX_SCORE"
				fi
			fi
		elif [ "$days_difference" -gt 2 ]; then
			typewrite "Tux is looking a bit sad. Consider feeding him!"
		elif [ "$days_difference" -gt 1 ]; then
			typewrite "Tux is getting hungry!"
		else
			display_quote 
		fi
	fi
}

# Check if the user has provided any arguments


if [ $# -eq 0 ]; then
	while true; do
		clear
		display_tux
		display_date_time
		display_stats
		echo "Choose an option:"
		echo "1. Feed Tux"
		echo "2. Get a Quote"
		echo "3. Check Streak"
		echo "4. Exit"
		read -p "Enter your choice: " choice

		case $choice in
			1)
				write_current_stats
				;;
			2)
				display_tux
				;;
			3)
				display_stats
				;;
			4)
				break
				;;
			*)
				echo "Invalid option, try again."
				;;
		esac
		read -p "Press enter to continue..."
	done
else
	case $1 in
		-h|--help)
			display_help
			;;
		-v|--version)
			display_version
			;;
		*)
			echo "Invalid option. Use -h or --help for help."
			;;
	esac
fi
