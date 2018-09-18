#! /usr/bin/python

import sys
import os
import pickle
import subprocess

history_file = os.path.expanduser("~/.dotfiles/rofi/web_history.txt")

def is_url_in_history(url, history):
    for u in history:
        if url in u:
            return True


def update_history(url, history):
    if url in history:
        history.remove(url)
    history.insert(0, url)


def read_history():
    if os.path.exists(history_file):
        with open(history_file, 'r') as f:
            return [l.strip() for l in f.readlines()]
    else:
        return []


def write_history(history):
    with open(history_file, "w") as f:
        for url in history:
            f.write(url + "\n")
    

history = read_history()

if len(sys.argv) == 1:
    for l in history:
        print(l)
else:
    url = sys.argv[1]
    if not url.startswith("https://") and not url.startswith("http://"):
        url = "https://" + url

    update_history(url, history)
    write_history(history)
    
    with open(os.devnull, 'wb') as devnull:
        subprocess.check_call(['chrome', '--app=' + url], stdout=devnull, stderr=devnull)

