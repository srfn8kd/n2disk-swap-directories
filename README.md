# n2disk-swap-directories

Not sure if I understand the -O option in n2disk correctly, it currently doesn't functions as I thought it would, which was to fill up the primary repository, then begin copying over data from the primary repository to the secondary repository instead of deleting the file that would be rotated out of the primary; all the while also maintaining the secondary repository and finally deleting files from there to maintain the maximum disk usage setting.

As of publishing this script the functionality as described is not what I experience, so I created a bash script to basically do something similar

The name of the game is maintain as long an unbroken (or as close to unbroken as I can get) timeline of raw pcaps
