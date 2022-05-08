#!bin/bash

if [  ! -d data ] ; then
	mkdir data
fi

wget -P ./data "https://github.com/labusiam/dataset/raw/main/weather_data.xlsx"

cd data

in2csv -n weather_data.xlsx >> text.txt

while read -r line; do
	in2csv weather_data.xlsx --sheet "$line" > $line.csv;
done < text.txt

csvstack weather_2014.csv weather_2015.csv > weather.csv

rm weather_data.xlsx text.txt

csvlook weather.csv | sample -r 0.3 > sample_weather.csv

