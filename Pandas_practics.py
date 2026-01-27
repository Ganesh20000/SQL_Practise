import pandas as pd
import numpy as np


df=pd.read_csv('smartphones_cleaned_v6.csv')


# print(df.head())




filter=df[(df['brand_name']=='samsung') & (df['ram_capacity']>8)]
# print(filter)

filter2= df.loc[(df['rating']>80 & (df['price']<2500))]
print(filter2)

filter2 = df.loc[
    (df['rating'] > 80) & (df['price'] < 25000),
    ['model', 'price', 'rating']
]

print(filter2)

