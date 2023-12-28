# How to Run

1. Install `pipenv` bc its better than pip:
   - manages virtual environments for you
   - tracks direct and transitive dependencies separately.
   - track python version as dependency and install it for you when using pipenv
     to setup a virtual environment.
1. Create a virtual environment and install the script's required dependencies:
   `pipenv shell`. This may prompt you to choose which python interpreter you
   want, cython is good. Then, it'll install the dependencies into the virtual
   environment as well as symlink `python` within the environment to the correct
   version of python. Finally, it'll open the virtual environment within your
   current shell.
1. To run the script, `python main.py`
