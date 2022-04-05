SOA Challenge: Team Jason! Submission
======================

By Daniel Nersisyan, Samuel Bray, Jason Liu

<p align="center">
    ![Alt Text](https://media.giphy.com/media/1n3HWMtH7rP4onw75P/giphy.gif)
</p>

Objectives of Analysis
======================

This report aims to provide detailed analysis and insight into the
selection process of a national football team for Rarita and the
economic and global opportunities it would bring the nation. Considering
the actuarial control cycle, this report will define the issue, design a
solution and propose ways to monitor results, ultimately exploring the
team’s selection methods, the team’s probability of achieving an FSA
championship, future economic prospects for the nation and a breakdown
of our implementation plan. It will further outline the limitations,
assumptions, risks and risk management strategies of this report along
with our final recommendations.

Team Selection
==============

Team selection was conducted through several random forest models which
were split by player positions and assessed which player characteristics
were most influential in determining the player’s 2021 tournament team
ranking. In doing so, this model was able to provide a definitive
ranking on the influential player statistics that lead to a successful
tournament team. From there, a criteria for team selection per
individual position was created, with the following section detailing
the 8 most influential positional statistics to the player team’s
tournament ranking, the positive or negative relationship they have
which will be analysed through partial plots (Appendix E-H) and a
criteria to guide the selection process for each position.

### Selection Criteria

### Forward - 8 most influential positional statistics by MSE according to random forest model

<p align="center">
    <img src="report%201.png" width="300" length = "600" >
</p>
    
### Forward - Selection Guide
<p align="center">
    <img src="report%202.png" width="700" length = "700" >
</p>
                                                       
### Midfielder - 8 most influential positional statistics by MSE according to random forest model

<p align="center">
    <img src="report%203.png" width="300" length = "600" >
</p>


### Midfielder - Selection Guide

<p align="center">
    <img src="report%204.png" width="700" length = "700" >
</p>

### Defender - 8 most influential positional statistics by MSE according to random forest model

<p align="center">
    <img src="report%205.png" width="300" length = "600" >
</p>

### Defender - Selection Guide

<p align="center">
    <img src="report%206.png" width="700" length = "700" >
</p>

### Goalkeeper - 8 most influential positional statistics by MSE according to random forest model

<p align="center">
    <img src="report%207.png" width="300" length = "600" >
</p>

### Goalkeeper - Selection Guide

<p align="center">
    <img src="report%208.png" width="700" length = "700" >
</p>

### Selection of Players

Selection for each of the positions was conducted through random forest
models which gave a prediction as to where each league player would have
placed in the 2021 tournament given their current statistics and
position. Once a placement score was provided to each league player,
selection was conducted on a number of factors shown in the table below
which included the player’s placement score, current age, nationality
and the selection guide for each position. Loaned players were only
chosen when the conditions for Ratitian nationality players could not be
fulfilled.

<p align="center">
    <img src="report%209.png" width="700" length = "200" >
</p>

### Probability for Success

The probability of success was determined through the probabilities of
our constructed team coming in the top 10, top 3 and achieving first
place. This was conducted through a random forest model which regressed
a team’s 2021 tournament placing against a position average of the top 3
most influential statistics for each position. The model predicted our
team would have placed 8th in the 2021 tournament and gave the following
placement probabilities:

<p align="center">
    <img src="report%2010.png" width="600" length = "300" >
</p>

From this table, it is highly probable that our team will achieve top 10
within 5 years and there is a reasonable probability that the team will
achieve an FSA championship within 10 years. However, the true
probability of achieving a FSA championship should be higher with our
investments in younger players.

### Spending Required Over the Next 10 Years

Utilising the loan system, expanded further upon in the implementation
plan, Rarita is expected to generate continuous profit from 2022 to
2031. The consequent profit will allow Rarita to invest significant
funds at the spot rate, within the grassroots of the game and into
advertising which will increase awareness of fixtures.

### Direct Team Revenues

Based upon the data provided, it is modelled that a competitive team
will generate revenue that is the average of other nation’s that placed
in the top 10 in 2020. This will be explored in the following sections.

Economic Impact
===============

A competitive national football team would have far reaching positive
impacts economically and socially upon Rarita. In economic terms, a
competitive soccer team boosts a nation’s GDP through direct
expenditure, indirect expenditure, employment opportunities and tax
revenue. The 2015 KPMG report recognises this, concluding that
professional football championships will have large impacts on economic
activities and the country’s GDP (KPMG Sports 2015).

In 2013, the direct impact of professional football on the Spanish
economy was €3.6 billion, with 75% of that spent by football supporters
and 25% spent by companies for advertising. Furthermore, €2.995 billion
was spent indirectly within the economy through channels such as
hospitality, sports and construction. Combined, these two revenue
streams generated 140,000 full time jobs and €2.896 billion in tax
revenue for the country which contributed to 0.75% of Spain’s GDP in
2013 (KPMG Sports 2015). Spain’s experience could easily be mirrored
through the creation of a competitive Raritan football team. It would be
reasonable to model the financial returns on other competitive nations
such as Dosqaly and Nganion as our model predicts a highly probable top
10 finish in the medium term. Consequently, this would lead to a 362%
increase in net revenue, and a GDP increase of 0.22%. With such positive
widespread economic impact and minimal to none negative impacts, it is
Rarita’s responsibility under the utilitarian ethical framework to
create a national team to further the prosperity and livelihoods of
their citizens.

Football has an indelible influence upon the socioeconomic factors
within a country. Greater advertising of football within Rarita
generated by a national team increases community involvement at a
grassroot level. This will be particularly prudent within the country
due to the substantial investment in this category, outlined in Appendix
I. It is well documented that playing sport, and football specifically
has positive impacts upon the health and mental wellbeing of a
population. In 2017, UEFA (Union of European Football Associations)
developed the ‘Social Return on Investment’ model, which estimated that
each individual registered football player generates €3,326 in “implied
benefits” (Campelli 2021)\*. These factors are derived from education,
integration, reduced crime rates, improved wellbeing and reduction in
lifestyle diseases and thus under the care-based ethical framework,
Rarita should promote the game and form a national team to promote a
more healthy population.

The generation of a competitive national team will allow Rarita to
‘broadcast’ their nation to the world, improving tourism and generating
national camaraderie. Placing their team on an international scale will
grant Rarita the platform to advertise elements of their nation to the
world, improving jobs and providing a further boost to their economy
(Erin 2018). Based upon the GDP per capita, GNI, health care spending
per capita and household saving rates provided, it is evident that
Rarita experiences substantial levels of income inequality.
Consequently, under the care-based ethical framework, it is imperative
to promote a national identity to reduce the prevalence of civil unrest
and improve the relationship between Raritans under a common cause.

\*In the 25 national associations measured.

Implementation Plan
===================

The implementation plan utilises two phases to maximise the probability
of Rarita forming a competitive football in the short to long term.
Within the short term, there is a greater emphasis on Rarita homegrown
players under the age of 24 and loaned players within the ages of 29-33.
These players were preferred under the premise that the younger players
would gain valuable experience from playing together and attaining
knowledge from experienced international players, increasing the
probability of becoming competitive within 5 years. Players outside of
these objectives were also chosen to ensure success was not solely
attained within a single generation. Ideal players within these
categories were ranked based upon the random forest model previously
described. Following the first 5 years, loaned players are envisioned to
slowly phase out to be replaced by the younger generation Rarita
players, albeit for exceptions for certain players.

Loaning players will also form a valuable tool to boost revenue and
provide younger Rarita players with experience playing on an
international stage and will occur within two stages. For the first 5
year period, Rarita will place all players below the 1000th ranked
player, or 300th ranked goalkeeper for loan. This will ensure that teams
do not become too competitive due to attaining a strong player, as
adjudicated by the model, whilst allowing these players to improve and
potentially become a part of the Rarita national team if they improve.
Following the first 5 year period however, the loan system will shift
from a revenue building model to one that fosters the development of
young players, solely including players under the age of 25. The aim of
this shift is to further minimise the competitiveness of opposing teams
whilst providing valuable experience to younger players, ensuring the
long term prosperity of the Rarita national team.

Long term competitiveness of the Rarita national team will further be
safeguarded through substantial investment at the grassroots. These
investments, scheduled at ∂50 per capita, will largely target children
playing the sport through mechanisms such as upgrading local grounds,
low registration fees, professional development pathways and discounted
tickets to games. The goal of these initiatives is to maximise interest
in the game, improve the health of future generations and improve the
overall quality of future Raritan players.

Metrics of performance will be provided to a designated committee
annually, reporting on factors such as revenue and expenses against
expected and overall team performance. The model should continuously be
updated to determine the imperative statistics to team success and
undervalued players currently on the market. Team performance, albeit
important, will largely be judged based upon overall improvement and
future risk mitigation plans.

Assumptions
===========

### Key Modelling Assumptions

When assessing what statistics were most important to a player’s
position, it was assumed that the team’s tournament placing was a good
indicator of player performance. This assumption was made as it was the
only and most suitable option to substitute as a metric for player
performance.

When modelling goalkeeping performance, it was assumed that none of the
shooting or defending statistics were significant for a goalkeeper. This
assumption was made due as there were a limited number of goalkeeper
observations and the reduction in the number of independent variables
would significantly reduce overfitting in the model.

In the prediction for team success, the position average of the top 3
most influential statistics of each position was assumed to be a good
indicator of the quality of a team’s forwards, defenders, midfielders
and goalkeepers as there were only 24 team rankings and we did not wish
to overfit the model.

### Other modeling assumptions

-   Missing values in data assumed to be 0
-   Player past performance is a good indicator of future player
    performance

### Economic Assumptions

-   Population growth is assumed to remain at the long term trend of
    0.435%
-   The average spot and inflation rates over the long term is assumed
    to remain relatively stable

Risk and Risk Mitigation Considerations
=======================================

While the implementation of a national football team is likely to be
beneficial to Rarita in several aspects, there are risks to the success
of the program which must are addressed below using the actuarial
control cycle:

### Economic

<p align="center">
    <img src="report%2011.png" width="500" length = "100" >
</p>

The above table shows the clear relationship between average GDP and
revenue per capita across 20 major competitors in the FSA tournament.
Thus it can be assumed that a major fall in Rarita’s GDP is likely to
cause a decrease in revenue from football, since on average a 3%
reduction in GDP led to a 10% reduction in revenue. As discussed
previously with the example of Spain, a strong and prosperous football
system can help improve GDP growth, however if other factors were to
hinder economic performance, football revenue would also be hindered.
Inflation is predicted to slightly increase and continue its cyclical
pattern shown below.

<p align="center">
    <img src="report%2012.png">
</p>

While these are not dangerous levels, a marginal increase in prices of
consumer goods can impact the savings rate (which increased 0.7% in
2020), and thus an average football fan’s propensity to spend money on
tickets and merchandise. In order to mitigate the impact of an economic
downturn, the problem must first be identified through constant
monitoring of macroeconomic conditions. Then, a solution should be
created through constant pricing of tickets and merchandise as well as
levels of marketing to maintain demand from fans. Finally, sales and
engagement should continue to be monitored to determine the success of
Rarita’s dynamic pricing and economic awareness. The below table shows
the hypothetical economic probabilities based on previous performance,
and the subsequent recommended adjustments.

<p align="center">
    <img src="report%2013.png" width="700" length = "300" >
</p>

### Player injury/performance

Assuming a squad of 20 players, playing 6 games (finishing in the top
10), with 6 training sessions (1 hour each), total exposure equates to
around 219 hours. Research from FC Barcelona suggests an injury rate of
23.8/1000 hours of exposure (Barça Innovation Hub 2021), predicting
around 5 injuries within Rarita’s squad throughout the tournament.
Player injury, as well as poor form represented by significant decreases
in key statistics, can lead to underwhelming team performance and
decreased fan engagement. The hiring of a competent medical and training
staff team will help to allow players to recover after games,
rehabilitate after an injury, as well as maintain their best possible
level of form, thus maximising team performance and probability of
success. Furthermore, bench and reserve players should receive the same
treatment as star players, in order to maintain their morale and better
allow them to fill in critical roles if necessary. Finally, player
morale and physical health should continue to be monitored through both
qualitative and quantitative metrics to determine if there are any
further areas for improvement.

Data Limitation
===============

Incompleteness: Data from the 2020 tournament was missing for passing
and goalkeeping categories and their tournament ranking only included 16
teams. This limited the number of observations we could use (reduced
from 2015 to 488) in our models which would have reduced their
consistency and accuracy.

Missing Values: Missing values were presented in the data as null or
undefined observations for a number of observations as seen below. This
limitation would reduce the accuracy of our team selection models as the
data is incomplete.

![](report%2014.png)

Inconsistency: Data was inconsistent with standardised values in the
tournament data outside the range of 0 to 100. Data was also
inconsistent in the league data as standardised league factors had
values in the 1000s when the same factor in the tournament data only had
a range of 0 to 100. This would have reduced the effectiveness of our
team selection model and it might rank players in the league data higher
than they should be rated.

Final Recommendations
=====================

This report defines the ‘problem’ of forming a Raritian national team,
designs a ‘solution’ through the implementation strategy and provides
metrics to monitor the results in the medium to long term. Throughout
the report, we have explored the vast economical and socioeconomic
benefit to Rarita and it is our recommendation with reference to two
ethical frameworks that a national team be created. However, it is
advised that the risks mentioned are understood and risk mitigation
strategies are in place to ensure our model is successful. Furthermore,
with the data limitations previously outlined, we recommend greater
research and updates to our model be conducted as more data is provided.

References
==========

Barça Innovation Hub 2021, ‘Do footballers get injured more now than
before?’, accessed 23 March 2022,
<a href="https://barcainnovationhub.com/do-footballers-get-injured-more-now-than-before/" class="uri">https://barcainnovationhub.com/do-footballers-get-injured-more-now-than-before/</a>

Campelli, M. 2021, ‘Quantifying the economic and social impact of
football’, The Sustainability Report, accessed 23 March 2022,
<a href="https://sustainabilityreport.com/2021/01/28/quantifying-the-economic-and-social-impact-of-football/" class="uri">https://sustainabilityreport.com/2021/01/28/quantifying-the-economic-and-social-impact-of-football/</a>

Ein, M. 2018, ‘The uniquely unifying power of sports, and why it
matters’, World Economic Forum, accessed 23 March 2022,
<a href="https://www.weforum.org/agenda/2018/02/north-and-south-korea-have-shown-us-the-unifying-power-of-sport/" class="uri">https://www.weforum.org/agenda/2018/02/north-and-south-korea-have-shown-us-the-unifying-power-of-sport/</a>

KPMG Sports 2015, ‘Socioeconomic impact of professional football in
Spain’, accessed 23 March 2022,
<a href="https://assets.kpmg/content/dam/kpmg/pdf/2015/07/socioeconomic-impact-professional-football.pdf" class="uri">https://assets.kpmg/content/dam/kpmg/pdf/2015/07/socioeconomic-impact-professional-football.pdf</a>

Used in Appendix J OECD 2019, ‘Inflation forecast’, OECD Data, accessed
23 March 2022,
<a href="https://data.oecd.org/price/inflation-forecast.htm" class="uri">https://data.oecd.org/price/inflation-forecast.htm</a>

