# username : david-yhaz

# sampling-data
1. If block untuk cek apakah sudah ada folder data, jika belum buat folder data
```
if [  ! -d data ] ; then
	mkdir data
fi
```

2. Download data yang dibutuhkan lalu pindah directory ke folder data
```
wget -P ./data "https://github.com/labusiam/dataset/raw/main/weather_data.xlsx"

cd data
```

3. Simpan nama sheet yang ada di dalam file weather_data.xlsx ke file text.txt
```
in2csv -n weather_data.xlsx >> text.txt
```

4. while loop untuk mengambil nama sheet dari text.txt kemudian merubah tiap sheet menjadi csv 
```
while read -r line; do
	in2csv weather_data.xlsx --sheet "$line" > $line.csv;
done < text.txt
```

5. gabung kedua csv menjadi satu file weather.csv
```
csvstack weather_2014.csv weather_2015.csv > weather.csv
```

6. hapus file weather_data.xlsx dan file text.txt
```
rm weather_data.xlsx text.txt
```

7. sampling data weather.csv sebanyak 30% dan simpan ke file sample_weather.csv
```
csvlook weather.csv | sample -r 0.3 > sample_weather.csv
```
