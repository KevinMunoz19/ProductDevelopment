import math

import streamlit as st
import numpy as np
import pandas as pd

st.title('Uber Pickups test')

data_source = 'https://s3-us-west-2.amazonaws.com/streamlit-demo-data/uber-raw-data-sep14.csv.gz'


@st.cache
def download_data():
    return pd.read_csv(data_source).rename(columns={'Lat': 'lat', 'Lon': 'lon', 'Date/Time': 'dt'})


df = download_data()
starting_value = 0
page_size = 1000
total_pages = math.ceil(len(df) / page_size)
slider = st.slider('Select Page', 1, total_pages)
st.write('Page selected', slider, 'with limits', (((slider - 1) * page_size), (slider * page_size)))
df_paginated = df.loc[((slider - 1) * page_size):(slider * page_size)]
df_paginated
another_slider = st.slider("Select range", 0, 24, (8, 16))
st.write('The range selected is', another_slider)

lower_lim = int(another_slider[0])
upper_lim = int(another_slider[1])

time_range = range(lower_lim, upper_lim + 1)
time_list = list(range(lower_lim, upper_lim + 1))
arr = np.array(time_list)

lower_lim_str = format(another_slider[0], '02d')
upper_lim_str = format(another_slider[1], '02d')

df_hours = df_paginated
df_hours.dt = pd.to_datetime(df_hours.dt)
df_hours = df_hours[
    df_hours.dt.dt.strftime('%H:%M:%S').between(f'{lower_lim_str}:00:00', f'{upper_lim_str}:59:00')]

df_hours

pu_array = []
for time in arr:
    lim_formatted = format(time, '02d')
    df_hours_temp = df_hours[
        df_hours.dt.dt.strftime('%H:%M:%S').between(f'{lim_formatted}:00:00', f'{lim_formatted}:59:00')]
    st.write(f'at {time} hours there are', df_hours_temp.size)
    pu_array.append(df_hours_temp.size)

chart_data = pd.DataFrame(
    pu_array,
    columns=["Pick Ups"])

st.bar_chart(chart_data)

st.map(df_hours)

