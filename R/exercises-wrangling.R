
# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES


# Piping, transforming, adding --------------------------------------------

# Check the names of the variables
colnames(NHANES)

# Pipe the data into mutate function and:
NHANES_modified <- NHANES %>% # dataset
	mutate(
		# 1. Calculate average urine volume
		UrineVolAvg = ((UrineVol1+UrineVol2)/2),
		# 2. Modify Pulse variable
		Pulse = Pulse*60,
		# 3. Create YoungChild variable using a condition
		YoungChild = if_else(Age >= 6, TRUE, FALSE)
	)
NHANES_modified
head(NHANES_modified)
smmary(NHANES_modified$UrineVolAvg)

NHANES %>%
	select(Gender, BMI)

NHANES %>%
	select (-BMI)



# To see values of categorical data
summary(NHANES)

# 1. BMI between 20 and 40 and who have diabetes
NHANES %>%
	# format: variable >= number
	filter(BMI >= 20 & BMI <= 40 & Diabetes == "yes")


# 2. Working or renting, and not diabetes
NHANES %>%
	filter((Work == "Working" | HomeOwn == "Rent") & Diabetes == "No") %>%
	select(Age, Gender, Work, HomeOwn, Diabetes)

# 3. How old is person with most number of children.
NHANES %>%
	arrange(desc(nBabies)) %>%
	select(Age)





NHANES_final <-
	NHANES %>% mutate(
		BPDiaAve = ((BPDia1 + BPDia2 + BPDia3) / 3),
		BPSysAve = ((
			NHANES$BPSys1 + NHANES$BPSys2 + NHANES$BPSys3
		) / 3),
		MoreThan5DaysActive =  NHANES$PhysActiveDays > 5
	) %>% select(
		AgeDiabetesDiagnosis = DiabetesAge,
		BMI,
		BPDiaAve,
		BPSysAve,
		DrinksOfAlcoholInDay = AlcoholDay,
		NumberOfBabies = nBabies,
		MoreThan5DaysActive,
		Poverty,
		TotalCholesterol = TotChol,
		SurveyYr,
		Gender
	)


NHANES_simple <- NHANES_final %>%  gather(Measure, Value, -Gender, -SurveyYr) %>% group_by(Gender, Measure, SurveyYr) %>% summarise(Value)
