<h1 align="center">Adludio Data Science Challenge</h1>
<div>
<img src="https://img.shields.io/badge/OS-linux%20%7C%20windows-blue??style=flat&logo=Linux&logoColor=b0c0c0&labelColor=363D44" alt="Operating systems"/>
<!-- <img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" alt="Operating systems"/> -->
<a href="https://github.com/Abel-Blue/adludio-data-science-challenge/network/members"><img src="https://img.shields.io/github/forks/Abel-Blue/adludio-data-science-challenge" alt="Forks Badge"/></a>
<a href="https://github.com/Abel-Blue/adludio-data-science-challenge/pulls"><img src="https://img.shields.io/github/issues-pr/Abel-Blue/adludio-data-science-challenge" alt="Pull Requests Badge"/></a>
<a href="https://github.com/Abel-Blue/adludio-data-science-challenge/issues"><img src="https://img.shields.io/github/issues/Abel-Blue/adludio-data-science-challenge" alt="Issues Badge"/></a>
<a href="https://github.com/Abel-Blue/adludio-data-science-challenge/graphs/contributors"><img alt="GitHub contributors" src="https://img.shields.io/github/contributors/Abel-Blue/adludio-data-science-challenge?color=2b9348"></a>
<a href="https://github.com/Abel-Blue/adludio-data-science-challenge/blob/main/LICENSE"><img src="https://img.shields.io/github/license/Abel-Blue/adludio-data-science-challenge?color=2b9348" alt="License Badge"/></a>
</div>

</br>

![ad-image](https://marketsplash.com/content/images/2021/07/Improve-The-UX-Of-Your-Website-Content.png)

## Table of Contents

1. [Introduction](#Introduction)
2. [Project Structure](#project-structure)
   - [data](#data)
   - [notebooks](#notebooks)
   - [scripts](#scripts)
   - [tests](#tests)
   - [logs](#logs)
   - [root file](#root-file)
3. [Installation guide](#installation-guide)

<hr>

## Introduction

> <p>We are expected to develop a Machine Learning framework in a modular way to determine the KPI likelihood (engagement & click) of an impression given its inventory, brief, and creative design components.</p>

 <p>The given data was registered at different steps of the creative creation and ad
placement process. In principle, the process should have used an identifier to link all the data sources
coming from the different steps. Unfortunately, that was not done, so the data linking must be done using
metadata registered at each step of the process. The tasks are:
</p>

1. Come up with an optimal strategy that maximizes the accuracy of
linking related data from multiple sources. Successful completion means you end up merging all data
sources into a single table.
    * Ingestion of given raw data into a data lake of your choice.
    * Modeling the data to reduce the memory process and improve the performance of fetch queries.
    * ETL pipeline to enrich your data into a data warehouse following your models.
    * Validator to validate the correctness of your data for the ETL pipeline.
    * And finally, an interface to expose your actionable data for the Machine learning task.
2. Expected to develop a Machine Learning framework in a modular way to determine
the KPI likelihood (engagement & click) of an impression given its inventory, brief, and creative design
components.
    * Generate KPI events (impression, first_droped, & click_through) from type column of
campaigns_inventory data. Consider using KPI rates such as ER, CTR to perform feature
selection. For more info, see KPI values definition from the above data definition section.
    * Merge multiple data sources.
    * Preprocessed data set ready for machine learning.
    * Data visualization and EDA on that data set show feature importance for KPI prediction.
3. Perform Image/video analysis to extract frame/video features from the
images provided in Creative_assets.zip file and use them to enrich the already extracted
features in(global_design_data.json). The plan here is to determine potential adunit components
that can help the help for creative kpi performance.

### <b>Data:</b>
>
> <p>

> - <b>Design data ( global_design_data.json)</b>: 
This data is found by analyzing the advertisements using computer vision. It constitutes
the ad-unit components. Note that the unique identifier in this data is game_key
> - <b>Campaigns data (campaigns_inventory.csv)</b>:
Campaign historical performance dataset. It contains historical inventories of the
campaign created placed and also KPI events associated with it. The type column is the
one you will find the KPI events.
> - <b>Briefs data (briefing.csv)</b>:
Campaign & creative plan data.
> - <b>Creative Assets(Creative_assets_) Zipped File</b>:
The data contains images for particular game keys. Use computer vision to extract
features that enrich the already existing features in design data.

<hr>

## Project Structure

### [images](images):

- `images/` the folder where all snapshot for the project are stored.

### [logs](logs):

- `logs/` the folder where script logs are stored.

### [data](data):

- `data/` the folder where the dataset files are stored.

### [.github](.github):

- `.github/`: the folder where github actions and unit-tests are integrated.
- `cml.yaml`: the file where the cml configuration is stored.
- `unit_test.yml`: the file where the unit-tests are stored.

### [.vscode](.vscode):

- `.vscode/`: the folder where local path are stored.

### [notebooks](notebooks):

- `notebooks/`: a jupyter notebook for preprocessing the data.
- `data_exploration.ipynb`: a jupyter notebook for data exploration.
- `ml_preprocess.ipynb`: a jupyter notebook for preprocessing the data.
<!-- - `causal_inference.ipynb`: a jupyter notebook for causal inference feature extraction. -->
- `ml_model.ipynb`: a jupyter notebook for machine learning model training.

### [scripts](scripts):

- `scripts/`: folder where modules are stored.
<!-- - `causality.py`: a module for causal inference. -->
- `data_manipulation.py`: a module for data manipulation.
- `data_exploration.py`: a module for data exploration.
- `data_preProcessing.py`: a module for data preprocessing.

### [tests](tests):

- `tests/`: the folder containing unit tests for the scripts.
- `test.py`: the file containing unit tests for the scripts.

### [root file](#):

- `requirements.txt`: a text file listing the projet's dependancies.
<!-- - `.travis.yml`: a configuration file Travis CI for unit test. -->
- `setup.py`: a configuration file for installing the scripts as a package.
- `results.txt`: a text file containing the results of the cml report.
- `train.py`: a script for training the model.
- `README.md`: Markdown text with a brief explanation of the project and the repository structure.

<hr>

# <a name='Installation guide'></a>Installation guide

### <a name='conda'></a>Conda Enviroment

```bash
conda create --name mlenv python==3.8
conda activate mlenv
```

Next

```bash
git clone https://github.com/Abel-Blue/adludio-data-science-challenge.git
cd adludio-data-science-challenge
sudo python3 setup.py install
```

<hr>

# <a name='license'></a>License

[MIT](https://github.com/Abel-Blue/adludio-data-science-challenge/blob/main/LICENSE)