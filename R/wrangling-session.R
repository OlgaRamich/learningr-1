source(here::here("R/package-loading.R"))


NHANES %>%
	colnames()
colnames(NHANES)


# Testing column is added

NHANES %>%
	mutate(Height = Height / 100,
				 Testing = "yes",
				 HighlyActive = if_else(
				 	PhysActiveDays >= 5,
				 	"yes",
				 	"no"
				 ))


NHANES %>%
	select(starts_with("SMOKE"),
				 contains("Vol"),
				 matches("[123]"))

NHANES %>%
	rename(NumberBabies = nBabies,
				 Sex=Gender
	)

NHANES %>%
	select(
		BMI, NumberBabies = nBabies,
		Gender, Height
	)


NHANES %>%
	filter(
		Gender == "female"
	)

NHANESfiltered <- NHANES %>%
	filter(
		Gender != "female" & BMI >= 20
	)

NHANES %>%
	summarise(MaxAge = max(Age, na.rm = TRUE
												 ),
						MinBMI = min(BMI, na.rm = TRUE
												 ))

NHANES %>%
	group_by(Gender) %>%
	summarise(MeanBMI = mean(BMI, na.rm = TRUE))

# Conversion to long form -------------------------------------------------


table4b %>%
	gather(year, population, -country)

table4b %>%
	gather(year, population, `1999`, `2000`)


nhanes_simple <- NHANES %>%
	select(SurveyYr, Gender, Age, Weight, Height, BMI, BPSysAve)

nhanes_long <- nhanes_simple %>%
	gather(Measure, Value, -SurveyYr, -Gender)

nhanes_summary <- nhanes_long %>%
	group_by(SurveyYr, Gender, Measure) %>%
	summarise(
		MeanValue= mean(Value, na.rm = TRUE)
	)

table2 %>%
spread(type, count)

nhanes_summary %>%
	spread(Gender, MeanValue)


