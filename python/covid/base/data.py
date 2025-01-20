import os
import pandas as pd

class Data:
    def __init__(self):        
        cwd = os.getcwd()
        self.data_fname = f'{cwd}/../COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_US.csv'
    
    def extract(self):
        self.df = pd.read_csv(self.data_fname)
        self.df = self.df.set_index('UID')
    
    def transform(self):
        rva_fips = 51159
        self.df = self.df.loc[self.df.FIPS==rva_fips]
        
        drop_cols = [
            'iso2','iso3','code3',
            'Admin2','Province_State',
            'Country_Region','Lat','Long_',
            'Combined_Key','FIPS',#'Population',
        ]
        self.df = self.df.drop(drop_cols,axis=1)
        
        self.df = self.df.transpose()
        self.df.index = pd.to_datetime(self.df.index)
        # self.df = self.df.diff()
        # self.df[self.df < 0] = 0
        self.df = self.df.reset_index(drop=False)
        self.df = self.df.sort_index()
        self.df.columns = ['ds','y']
        self.df.y = self.df.y.cummax()

        
    def load(self):
        None