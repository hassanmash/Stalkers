from flask import Flask, appcontext_popped
app = Flask(__name__)

import instaloader

@app.route("/insta/")
def insta_dp():
    return "Hello, Flask! Welcome back"

from PIL import Image
import glob
from flask import send_file
import os
import shutil

# code to run flask
# python -m flask run
# NOTE: run flask in the virtual environment given in the folder to avoid installing the modules by yourself!

@app.route('/insta/<name>')
def hello_world(name):
    mod=instaloader.Instaloader()
    user=name
    if os.path.exists("./" + user):
        shutil.rmtree('./' + user, ignore_errors=True)
    try:
        mod.download_profile(user,profile_pic_only=True)
        #Relative Path
        filenames = glob.glob("./"+user+"/*profile_pic.jpg")
        if filenames:
            filename = filenames[0]
            return send_file(filename, mimetype='image/gif')
        else:
            print("Image not Found!")
            filenames = glob.glob("./insta_def_pic.png")
            if filenames:
                filename = filenames[0]
                print('Failed',filename)
            return send_file(filename, mimetype='image/gif')
        # img = Image.open(filename)

    except:
        filenames = glob.glob("./insta_def_pic.png")
        if filenames:
            filename = filenames[0]
        return send_file(filename, mimetype='image/gif')
