from flask import Flask, render_template
app = Flask(__name__)
app.debug = True


@app.route("/")
def main():
    return render_template("game.html")

if __name__ == "__main__":
    app.run()
