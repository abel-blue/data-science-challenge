import json
import pandas as pd
import numpy as np
# from textblob import TextBlob
from zipfile import ZipFile
from itertools import zip_longest

def read_json(json_file: str) -> list:
    # json_data = []
    with ZipFile(json_file, 'r') as zip_ref:
        zip_ref.extractall("data/")
        json_data = json.load(open("data/global_design_data.json", 'r'))
        dataa = json_data.items()
        listt = list(dataa)
    return len(listt), listt
# 
class CmpDfExtractor:

    def __init__(self, cmp_list):
        self.cmp_list = cmp_list
        print('Data Extraction in progress...')
    
    def gamekey_extractor(self):
        game_key = []
        for x in self.cmp_list:
            game_key.append(x[0])
        return game_key
            
    def labels_extractor(self):
        labels_engagement = []
        labels_clickthr = []
        for x in self.cmp_list:
            for k, v in x[1].items():
                if 'labels' in v.keys():
                    labels_engagement.append(v['labels']['engagement'])
                    labels_clickthr.append(v['labels']['click_through'])
                else:
                    labels_engagement.append(None)
                    labels_clickthr.append(None)
        return labels_engagement, labels_clickthr
        
    def text_extractor(self):
        text_engagement = []
        text_clickthr = []
        for x in self.cmp_list:
            for k, v in x[1].items():
                if 'text' in v.keys():
                    text_engagement.append(v['text']['engagement'])
                    text_clickthr.append(v['text']['click_through'])
                else:
                    text_engagement.append(None)
                    text_clickthr.append(None)
        return text_engagement, text_clickthr
        
    def color_extractor(self):
        colors_engagement = []
        colors_clickthr = []
        for x in self.cmp_list:
            for k, v in x[1].items():
                if 'colors' in v.keys():
                    colors_engagement.append(v['colors']['engagement'])
                    colors_clickthr.append(v['colors']['click_through'])
                else:
                    colors_engagement.append(None)
                    colors_clickthr.append(None)
        return colors_engagement, colors_clickthr
    
    def videosd_extractor(self):
        videos_data = []
        for x in self.cmp_list:
            for k, v in x[1].items():
                if 'videos_data' in v.keys():
                    videos_data.append(v['videos_data']['has_video'])
        return videos_data
    
    def eng_type_extractor(self):
        eng_type_data = []
        for x in self.cmp_list:
            for k, v in x[1].items():
                if 'eng_type' in v.keys():
                    eng_type_data.append(v['eng_type']['eng_type'])
                else:
                    eng_type_data.append(None)
        return eng_type_data
    
    def direction_extractor(self):
        direction_data = []
        for x in self.cmp_list:
            for k, v in x[1].items():
                if 'direction' in v.keys():
                    direction_data.append(v['direction']['direction'])
                else:
                    direction_data.append(None)
        return direction_data
        
    def get_cmp_df(self, save=False) -> pd.DataFrame:

        columns = ['game_key', 'labels_engagement', 'labels_clickthr', 
                   'text_engagement', 'text_clickthr',
                   'videosd', 'eng_type', 'direction']

        game_key = self.gamekey_extractor()
        labels_engagement, labels_clickthr = self.labels_extractor()
        text_engagement, text_clickthr = self.text_extractor() 
        # colors_engagement, colors_clickthr = self.color_extractor()
        videosd = self.videosd_extractor()
        eng_type = self.eng_type_extractor()
        direction = self.direction_extractor()
        
        data = zip_longest(game_key, labels_engagement, labels_clickthr, text_engagement, 
                           text_clickthr, videosd, 
                           eng_type, direction, fillvalue=np.nan)
        df = pd.DataFrame(data=data, columns=columns)

        if save:
            df.to_csv('data/extracted_cmp_data.csv', index=False)
            print('Extracted Data Saved !!!')
        return df

if __name__ == "__main__":
    _, cmp_list = read_json("data/global_design_data.zip")
    cmp = CmpDfExtractor(cmp_list)
    df = cmp.get_cmp_df(True)