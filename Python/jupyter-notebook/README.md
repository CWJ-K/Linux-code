


# cd to project directory
pipenv install ipykernel
pipenv shell
python -m ipykernel install --user --name=my-virtualenv-name

# install jupyter notebook excetions
install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user

# run jupyter notebook in pipenv (if use roor)
jupyter notebook --allow-root


# When IOPub data rate exceeded in Jupyter notebook (when viewing image) (if use roor)
jupyter notebook --NotebookApp.iopub_data_rate_limit=1.0e10 --allow-root