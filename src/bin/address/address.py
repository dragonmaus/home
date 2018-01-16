#!/usr/bin/python

import geocoder
import getopt
import sys
import time

def google(arg):
    return geocoder.google(arg)

def google_reverse(arg):
    return geocoder.google(arg, method="reverse")

def main():
    try:
        opts, args = getopt.getopt(sys.argv[1:], "chr")
    except getopt.GetoptError as e:
        print(e)
        sys.exit(1)
    coords = False
    reverse = False
    for o, a in opts:
        if o == "-c":
            coords = True
        elif o == "-h":
            usage()
            sys.exit()
        elif o == "-r":
            reverse = True
        else:
            assert False, "unhandled option"

    delay = 5

    if reverse:
        provider = google_reverse
        query = [float(x) for x in args[:2]]
    else:
        provider = google
        query = " ".join(args)

    response = provider(query)
    while response.error:
        time.sleep(delay)
        delay += 1
        response = provider(query)

    if coords:
        print(" ".join([str(x) for x in response.latlng]))
    else:
        print(response.address)

def usage():
    print("usage: address [-c] text ...", file=sys.stderr)
    print("       address [-c] -r latitude longitude", file=sys.stderr)

if __name__ == "__main__":
    main()
