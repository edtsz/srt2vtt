#!/usr/bin/env sh
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

if ! [ -f "$1" ]; then
 	echo 'File not found'
 	exit 1
fi

dos2unix --help foo > /dev/null 2>&1 || { echo >&2 "dos2unix is required but it's not installed. Aborting."; exit 1; }
uchardet --help foo > /dev/null 2>&1 || { echo >&2 "uchardet is required but it's not installed. Aborting."; exit 1; }
iconv    --help foo > /dev/null 2>&1 || { echo >&2 "iconv is required but it's not installed. Aborting."; exit 1; }
sed      --help foo > /dev/null 2>&1 || { echo >&2 "sed is required but it's not installed. Aborting."; exit 1; }

src=$1
dst="${src%.*}.vtt"

# Convert to UTF-8
iconv -f "$(uchardet $src)" -t UTF-8 $src -o $dst

# Convert CRLF to LF
dos2unix -q $dst

# Trim white space start and end
sed -i 's/^[ \t]*//;s/[ \t]*$//' $dst

# Convert time strings to VTT pattern
sed -i -E 's/(([0-9]{2}:){2}[0-9]{2}),([0-9]{3})/\1\.\3/g' $dst

# Add HEADERS
sed -i '1iWEBVTT\n' $dst
