import pandas as pd
from bs4 import BeautifulSoup
import re
import sys
import os
from nltk.corpus import stopwords

sys.path.append(os.path.abspath(os.path.join('data')))


class CleanDf:

    def __init__(self, df: pd.DataFrame):
        self.df = df
        print('Cleaning in progress...')

    def drop_unwanted_column(self) -> pd.DataFrame:
        columns = ['game_key', 'labels_engagement', 'labels_clickthr', 
                   'text_engagement', 'text_clickthr',
                   'videosd', 'eng_type', 'direction']
        unwanted_rows = []
        for columnName in columns:
            unwanted_rows = self.df[self.df[columnName] == columnName].index
            self.df.drop(unwanted_rows, inplace=True)
            self.df.reset_index(drop=True, inplace=True)
        return self.df

    def drop_nullValue(self) -> pd.DataFrame:
        self.df.dropna(subset=['game_key'], inplace=True)
        self.df.reset_index(drop=True, inplace=True)
        return self.df

    def drop_duplicate(self) -> pd.DataFrame:
        self.df.drop_duplicates(inplace=True)
        self.df.reset_index(drop=True, inplace=True)
        return self.df

    def remove_emoji(self, text):
        emoji_pattern = re.compile("["
                                   u"\U0001F600-\U0001F64F"  # emoticons
                                   u"\U0001F300-\U0001F5FF"  # symbols & pictographs
                                   u"\U0001F680-\U0001F6FF"  # transport & map symbols
                                   u"\U0001F1E0-\U0001F1FF"  # flags
                                   u"\U00002702-\U000027B0"
                                   u"\U000024C2-\U0001F251"
                                   "]+", flags=re.UNICODE)
        return emoji_pattern.sub(r'', text)

    def clean_text(self) -> pd.DataFrame:
        self.df['text_engagement'] = self.df['text_engagement'].apply(
            lambda x: " ".join(x.lower() for x in x.split()))  # lowercase
        self.df['text_engagement'] = self.df['text_engagement'].str.replace(
            '[^\w\s]', '')  # remove punctuation
        self.df['text_engagement'] = self.df['text_engagement'].apply(
            lambda x: self.remove_emoji(x))  # remove emoji
        stop = stopwords.words('english')  # remove stopwords
        self.df['text_engagement'] = self.df['text_engagement'].apply(
            lambda x: " ".join(x for x in x.split() if x not in stop))
        self.df['text_engagement'] = self.df['text_engagement'].str.findall(
            r'[a-zA-Z]+')
        self.df['text_engagement'] = self.df['text_engagement'].str.join(' ')
        return self.df

    def clean_data(self, save=False) -> pd.DataFrame:
        self.df = self.drop_unwanted_column()
        self.df = self.drop_nullValue()
        self.df = self.drop_duplicate()
        # self.df = self.remove_emoji()
        # self.df = self.clean_text()

        if save:
            self.df.to_csv(
                'data/cleaned_cmp_data.csv', index=False)
            print('Cleaned Data Saved !!!')
        return self.df


if __name__ == "__main__":
    df = pd.read_csv("data/extracted_cmp_data.csv")
    cleaner = CleanDf(df)
    cleaner.clean_data(True)