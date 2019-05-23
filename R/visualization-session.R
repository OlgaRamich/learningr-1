source(here::here("R/package-loading.R"))


# #1-dimentional plots ----------------------------------------------------

ggplot(NHANES, aes(x=BMI)) +
	geom_density()

ggplot(NHANES, aes(x=BMI)) +
	geom_histogram()

ggplot(NHANES, aes(x=Education)) +
	geom_bar()


# #2-dimensional plots ----------------------------------------------------

two_nums <- ggplot(NHANES, aes(x=Age, y=BPSysAve))
two_nums+geom_point()

two_nums+geom_line()

two_nums+geom_hex()

two_nums+geom_smooth()

two_categ <-
	ggplot(NHANES, aes(x=Education,
										 fill = Diabetes))

two_categ+
	geom_bar()

two_categ+
	geom_bar(position=position_dodge())

two_mixed <-
	ggplot(NHANES, aes(
		x=Diabetes,
		y=TotChol
	))

two_mixed +
	geom_boxplot()

NHANES %>%
	filter(!is.na(Diabetes)) %>%
	ggplot(aes(x=Diabetes,
						 y=TotChol))+
	geom_boxplot()

two_mixed +
	geom_jitter(with=0.2)



# #Exercise ---------------------------------------------------------------
# See summary
summary(NHANES)

# See the variables available
names(NHANES)

# 1 continuous
ggplot(NHANES, aes(x=BPSysAve)) +
	geom_histogram()

# 1 discrete
ggplot(NHANES, aes(x = MaritalStatus)) +
	geom_bar()

# 2 continuous
two_nums <- ggplot(NHANES, aes(x=Age, y=BMI))
two_nums+geom_point()


# 2 discrete
two_categ <-
	ggplot(NHANES, aes(x=Education,
										 fill = Race1))+
	geom_bar()


# 1 continous and 1 discrete
ggplot(___, aes(x = ___, y = ___)) +
	___



# #3-dimentions -----------------------------------------------------------

colour_plot_nums <-
	ggplot(NHANES, aes(
		x=BMI,
		y=BPSysAve,
		colour=HomeOwn
		))

colour_plot_nums+
	geom_point()


colour_plot_nums+
	geom_smooth()

colour_plot_mixed <-
	ggplot(NHANES, aes(
		x=Gender,
		y=BPSysAve,
		colour=HomeOwn
	))

colour_plot_mixed+
	geom_boxplot()


colour_plot_mixed+
	geom_violin()


colour_plot_nums+
	geom_point(aes(alpha=Age))

colour_plot_nums+
	geom_point(aes(size=Age))

colour_plot_nums+
	geom_smooth(aes(linetype=Diabetes))

colour_plot_mixed+
geom_boxplot()+
facet_grid(cols=vars(SurveyYr),
					 rows=vars(PhysActive))


colour_plot_nums+
	geom_point()+
	geom_smooth()+
	facet_grid(cols=vars(SurveyYr))

base_boxplot <-
	ggplot(NHANES, aes(
		x=HomeOwn,
		fill=Education
	))+
	geom_bar(
		position=position_dodge()
	)

base_boxplot+
	scale_fill_viridis_d()

base_boxplot+
	scale_fill_viridis_d(option="A")

base_boxplot+
	scale_fill_brewer(type="qual")


# #Exercise 3-dimential plot ----------------------------------------------



# 1. Two continuous, discrete, and one facet.

# Optional: add another layer

colour_plot_nums <-
	ggplot(NHANES, aes(
		x=Age,
		y=BPSysAve,
		colour=HomeOwn
	))

colour_plot_nums+
	geom_smooth()+
	facet_grid(cols=vars(SurveyYr))


# 2. Three continuous, with viridis
ggplot(___, aes(x = ___, y = ___, colour = ___)) +
	___ +
	scale_

colour_plot_nums <-
	ggplot(NHANES, aes(
		x=BMI,
		y=BPSysAve,
		colour=Age
	))

colour_plot_nums+
	geom_point()+
	scale_color_viridis_c()



# 3. Three discrete, with brewer
ggplot(___, aes(x = ___, fill = ___)) +
	___ +
	facet_ +
	scale_



colour_plot_mixed <-
	ggplot(NHANES, aes(
		x=Race1,
		y=HomeOwn,
		colour=Diabetes
	))

colour_plot_mixed+
	geom_boxplot()



# #Themes, labels, title --------------------------------------------------

basic_scatterplot <-
	ggplot (NHANES, aes(
		x=Height,
		y=Weight,
		colour=Age
	))+
	geom_point(alpha=0.5)+
	facet_grid(cols=vars(Gender))+
	scale_colour_viridis_c()

basic_scatterplot+
	theme_bw()

basic_scatterplot+
	theme_minimal()

basic_scatterplot+
	theme_classic()

basic_scatterplot+
	labs(x="Height in cm",
			 y="Weight in kg",
			 title = "Height and weight with age.")+
	theme_minimal()


basic_scatterplot+
	theme(panel.background = element_rect
			(fill="purple"),
			axis.text=element_text(size=14, face="bold"),
			strip.background = element_blank(),
			axis.line.x=element_line(colour="green", size=5)
				)

custom_theme <- theme(
	panel.background = element_rect(fill="black")
)

plot_to_save <- basic_scatterplot+
	custom_theme

ggsave(here::here("doc/ugly-figure.pdf"),
			 plot_to_save)

ggsave(here::here("doc/ugly-figure.tiff"),
			 plot_to_save, dpi=600)


# #Final_exercise ---------------------------------------------------------

#Graph 1

 <- NHANES %>%
	filter(!is.na(Diabetes))

ggplot(NHANES_filt, aes(
		x=Poverty,
		y=BMI,
		colour=Diabetes
	))+
	geom_point()+
	facet_grid(cols=vars(SurveyYr),
						 rows=vars(Gender),
							)+
	geom_smooth(method="lm", size=2)+
	scale_color_viridis_d(end=0.7)


#Graph 2

NHANES_simple2 <- NHANES %>%
	gather(Measure, Value, -Gender, -SurveyYr) %>%
	group_by(Gender, Measure, SurveyYr) %>%
	summarise(Value)

NHANES_simple2 <- NHANES %>%
	select(Gender, Education, TotChol, Diabetes)

NHANES_long <- NHANES_simple2  %>%
	gather(Measure, Value, -Diabetes, -Gender, -Education)


NHANES_long1 <- NHANES_simple2  %>%
	gather(Measure, TotChol, -Diabetes, -Gender, -Education)


colour_plot_nums <-
	ggplot(NHANES_long1, aes(
		x=Gender,
		y=TotChol,
		colour=Diabetes
	))


colour_plot_nums+
	geom_boxplot()+
	coord_flip()
