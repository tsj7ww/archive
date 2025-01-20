import os
import datetime
import re
import pandas as pd
import numpy as np

import matplotlib.pyplot as plt
from scipy.stats import skew, norm
import scipy.stats as stats
import statsmodels.api as sm

from sklearn.model_selection import cross_val_score
from sklearn.model_selection import RepeatedStratifiedKFold
from sklearn.feature_selection import RFECV,RFE
from sklearn.pipeline import Pipeline
from sklearn.ensemble import RandomForestRegressor

from sklearn.preprocessing import OrdinalEncoder
from sklearn.preprocessing import StandardScaler #,LabelEncoder,RobustScaler,MinMaxScaler
from sklearn.decomposition import PCA
from sklearn.metrics import mean_squared_error
from sklearn.model_selection import train_test_split

class Process:    
    def __init__(self):
        None
    
    def load(self):
        cwd = os.getcwd()
        data = os.path.join(cwd,'data')

        self.train_df = pd.read_csv(os.path.join(data,'train.csv'),header=0,index_col=0)
        self.test_df = pd.read_csv(os.path.join(data,'test.csv'),header=0,index_col=0)
        self.df = pd.concat([self.train_df,self.test_df],axis=0)
        
        self.label_col = 'SalePrice'
        self.y = self.df[self.label_col]
        self.x = self.df.drop(self.label_col,axis=1)
    
    def log(self):
        fig, ax = plt.subplots(1,2,figsize=(15,5))
        sm.qqplot(self.y.dropna(), stats.t, distargs=(4,),fit=True, line="45", ax=ax[0])
        sm.qqplot(np.log(self.y.dropna()), stats.t, distargs=(4,),fit=True, line="45", ax=ax[1])
        self.y = np.log1p(self.y)

        all_cat_cols = list(set(self.x.select_dtypes(include=[object]).columns))
        cont_cols = self.x.drop(all_cat_cols,axis=1).columns
        skewed_features  = self.x[cont_cols].apply(lambda x: stats.skew(x)).sort_values(ascending=False)
        high_skew = skewed_features[skewed_features > 0.5]
        for col in high_skew.index:
            self.x[col] = np.log1p(self.x[col])

    
    def fill(self):
        replace_0 = [
            'MasVnrArea', 'GarageYrBlt','BsmtHalfBath',
            'BsmtFullBath', 'BsmtFinSF1', 'BsmtFinSF2',
            'BsmtUnfSF','TotalBsmtSF', 'GarageCars', 'GarageArea'
        ]
        replace_popular = [
            'MSZoning', 'Exterior2nd',
            'Exterior1st', 'Utilities',
            'Electrical',
        ]
        replace_median = ['LotFrontage']
        replace_value = {
            'Functional':'Typ',
            'KitchenQual':'TA',
            'SaleType':'Oth',
        }
        replace_none = [
            col for col in self.x.columns
            if col not in
                replace_0+replace_popular+
                replace_median+list(replace_value.keys())
        ]
        
        self.x[replace_0] = self.x[replace_0].fillna(0)
        self.x[replace_none] = self.x[replace_none].fillna('None')
        for col in replace_popular:
            self.x[col].fillna(self.x[col].value_counts().idxmax(), inplace=True)
        for col in replace_median:
            self.x.fillna({col: self.x[col].median()}, inplace=True)
        for col,value in replace_value.items():
            self.x[col].fillna(value, inplace=True)

        if self.x.isnull().values.any():
             print('Missing values!')
        else:
            print('No missing values')

    def scale(self):
        all_cat_cols = list(set(self.x.select_dtypes(include=[object]).columns))
        cont_cols = self.x.drop(all_cat_cols,axis=1).columns
        self.x[cont_cols] = StandardScaler().fit_transform(self.x[cont_cols].values)
        
    def encode(self):
        categorical = [
            'LotShape','LandContour','LandSlope',
            'ExterQual','ExterCond','BsmtQual',
            'BsmtCond','BsmtExposure','BsmtFinType1',
            'BsmtFinType2','HeatingQC','KitchenQual',
            'FireplaceQu','GarageFinish','GarageQual',
            'GarageCond','PoolQC','Fence',
        ]
        for col in categorical:
            self.x[col] = pd.Categorical(self.x[col],categories=self.x[col].unique())
            self.x[col] = self.x[col].cat.codes
        
        cat_other = ['PavedDrive', 'Utilities', 'CentralAir', 'Alley']
        for col in cat_other:
            self.x[col] = self.x[col].astype('category')
            self.x[col] = self.x[col].cat.codes
        
        # one hot encode remaining object variables
        all_cat_cols = set(self.x.select_dtypes(include=[object]).columns)
        one_hot_cols = list(all_cat_cols - set(categorical + cat_other))
        self.x = pd.get_dummies(self.x,columns=one_hot_cols,drop_first=True)
    
    def feature_selection(self,grid=False):
        if grid:
            rfe = RFECV(estimator=RandomForestRegressor(),step=1,cv=5,scoring='neg_mean_squared_error',n_jobs=-1)
        else:
            rfe = RFE(estimator=RandomForestRegressor(),n_features_to_select=100)
        rfe.fit(self.x.loc[self.y[self.y.notnull()].index],self.y[self.y.notnull()])
        self.x = self.x.loc[:,rfe.support_]
    
    def pca(self):
        None

    def split(self):
        self.y_train = self.y[self.y.notnull()]
        self.y_predict = self.y[self.y.isnull()]

        self.x_train = self.x.loc[self.y_train.index]
        self.x_predict = self.x.loc[self.y_predict.index]
        
        self.x_train,self.x_test,self.y_train,self.y_test = train_test_split(
            self.x_train,self.y_train,test_size=0.2,random_state=42
        )