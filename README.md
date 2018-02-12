# srt2vtt

Script to convert `.srt` subtitles to `.vtt`

- [Online converter][1]
- [Online documentation by W3C][2]
- [What is written on Wikipedia][3]

[1]: http://www.webvtt.org/                'WebVTT online converter'
[2]: https://w3c.github.io/webvtt/         'WebVTT oficial website'
[3]: https://en.wikipedia.org/wiki/WebVTT  'WebVTT Wikipedia'


## Usage

`$ ./srt2vtt.sh subtitle.srt`

Also support bash wildcards:

`$ ./srt2vtt.sh *.srt`

The output will be the same filename with `.vtt` extension instead `.srt`.


## Dependencies

You will need `dos2unix`, `uchardet`, `iconv` and `sed` installed in your system.

I've tested just on:
 - dos2unix 7.3.4 (2016-05-24)
 - uchardet Version 0.0.6
 - iconv (GNU libc) 2.25
 - sed (GNU sed) 4.4
