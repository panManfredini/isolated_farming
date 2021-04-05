echo "Time irr_g irr_dir irr_diff temp city" > grouped_irradiance/grouped_irradiance.csv
rome_path="raw_irradiance/rome/Dailydata_41.903_12.496_SA_"
mizpe_path="raw_irradiance/mizpe/Dailydata_30.615_34.802_SA_"
zurich_path="raw_irradiance/zurich/Dailydata_47.377_8.540_SA_"

for x in "01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12" 
do
	cat "$zurich_path${x}_35deg_0deg.csv" | awk -v vari=$x '{printf "2010-" vari "-01T%s %s %s %s %1.2f Zurich\n", $1,$2,$3,$4,$5}' | awk "NR > 6 && NR < 31" >> grouped_irradiance/grouped_irradiance.csv
	cat "$rome_path${x}_35deg_0deg.csv" | awk -v vari=$x '{printf "2010-" vari "-01T%s %s %s %s %1.2f Rome\n", $1,$2,$3,$4,$5}' | awk "NR > 6 && NR < 31" >> grouped_irradiance/grouped_irradiance.csv
	cat "$mizpe_path${x}_35deg_0deg.csv" | awk -v vari=$x '{printf "2010-" vari "-01T%s %s %s %s %1.2f Mizpe\n", $1,$2,$3,$4,$5}' | awk "NR > 6 && NR < 31" >> grouped_irradiance/grouped_irradiance.csv
done
