# The Hacker's Diet Online

This is an attempt to get HDO up and running, started by someone with no prior experience whatsoever with Perl.

## running it

(requires docker and docker-compose)

    make

Then access [locally at port 12380](http://localhost:12380).

Data will be saved on `data/` locally (mounted on `/var/lib/hackdiet` inside the container). You can customize this on docker-compose.yml


## perl hackers wanted

Currently uses a very old Ubuntu: Precise Pangolin (12.04 LTS).

I've tried to use a newer base image but there are a few perl errors that I'm not sure how to fix.

Updating to a modern perl would be ideal! Feel free to submit patches for this :)


## credits

>The source code is in the public domain and may be used in any manner without any restrictions whatsoever, but it is utterly unsupported—you are entirely on your own.
>[...]
>Installing it on a different server requires substantial work in changing settings for the server environment and establishing the initial database structure. If you decide to undertake this task, you'll have to puzzle it out yourself—I cannot offer any assistance.

>-- John Walker on https://www.fourmilab.ch/hackdiet/online/hdo.html

Thank you for releasing the source, John!

## GitHub Repo

As of April 2022, there's an [official GitHub repository for The Hacker's Diet Online](https://github.com/Fourmilab/hackers_diet_online).
