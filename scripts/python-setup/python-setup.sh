# copy this file into your working directory
# and run as "bash this-script.sh"

# to be added: pre-commit hooks for code formattting

python3 -m venv venv
source venv/bin/activate

pip install black
pip install pylance
pip install mypy

touch .gitignore
echo "venv/" > .gitignore


export MJ_APIKEY_PUBLIC='034a56b5d808f7e9c6c63c287051aced'
export MJ_APIKEY_PRIVATE='be63ecb733b4374bd674abfbf943680a'

Edward Van Evenstraat 17, 3000 Leuven
Huis te koop in Leuven met 4 slaapkamers


# Just errors on line 1 of course
./test_1.sh 
if [ $? -ne 0 ]; then
    ./test_2.sh
fi
