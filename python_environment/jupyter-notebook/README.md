


# cd to project directory
pipenv install ipykernel
pipenv shell
python -m ipykernel install --user --name=my-virtualenv-name

# install jupyter notebook excetions
pipenv install jupyter_contrib_nbextensions
pipenv run jupyter contrib nbextension install --user

#pipenv run jupyter notebook --allow-root


# When IOPub data rate exceeded in Jupyter notebook (when viewing image)
jupyter notebook --NotebookApp.iopub_data_rate_limit=1.0e10 --allow-root