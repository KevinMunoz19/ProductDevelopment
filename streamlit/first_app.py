import streamlit as st
import numpy as np
import pandas as pd
import time

st.title("This is my first streamlit app!")
x = 4

st.write(x, 'square is', x * x)

x, 'square is', x * x

"""
## Data Frames
"""

df = pd.DataFrame({
    'Column A': [1, 2, 3, 4, 5],
    'Column B': ['A', 'B', 'C', 'D', 'E']
})

st.write(df)

"""
## Graphs
"""

chart_df = pd.DataFrame(
    np.random.randn(20, 3),
    columns=['A', 'B', 'C']
)

st.line_chart(chart_df)

"""
## Map
"""

map_df = pd.DataFrame(
    np.random.randn(1000, 2) / [50, 50] + [37.76, -122.4],
    columns=['lat', 'lon']
)

st.map(map_df)

"""
## Widgets
"""

"""
### Checkbox
"""
if st.checkbox("Show dataframe"):
    map_df

"""
### Slider
"""
x = st.slider('Select value for x')
st.write(x, 'Square is', x * x)

"""
### Options
"""

option = st.selectbox(
    'Which number do you like',
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
)

st.write('You like', option)

"""
### Progress Bar
"""

progress_bar_label = st.empty()
progress_bar = st.progress(0)
progress_bar_2 = st.sidebar.progress(0)

for i in range(101):
    progress_bar_label.text(f'Iteration {i}')
    progress_bar.progress(i)
    time.sleep(0.01)

for i in range(101):
    progress_bar_2.progress(i)
    time.sleep(0.01)

options_side = st.sidebar.selectbox('Choose your weapon?', ['handgun', 'machine gun', 'katana'])

st.sidebar.write('Your weapon is:', options_side)

another_slider = st.sidebar.slider("Select range", 0.0, 100.0, (25.0, 75.0))

st.sidebar.write('The range selected is', another_slider)
