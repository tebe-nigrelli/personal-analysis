# This notebook

As mentioned in my [doom-emacs repository](https://github.com/tebe-nigrelli/doomemacs-config), I like to collect data on my habits and analyze it using mathematical methods. 

The following page gives an outline for my process. The [full jupyter notebook](Common%20Agenda%20AnalysisFramework.ipynb) is available for reference, while here I have highlighted its main features with some personal results.

# Data Collection 

I store most of my data through a customised doom-emacs distribution, which can be accessed [here](https://github.com/tebe-nigrelli/doomemacs-config). 

For example, whenever I watch a movie, I open [Emacs](https://www.gnu.org/software/emacs/tour/) and use my own keyboard shortcuts to quickly store an entry in one of my log files. For the writing format, I use [org-mode](https://orgmode.org/), one of the available plugins for Emacs, which I extended slightly to include the time zone in the time stamps. 

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">

<colgroup>
<col  class="org-left" />
<col  class="org-left" />
<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">&#xa0;</th>
<th scope="col" class="org-left">Original</th>
<th scope="col" class="org-left">Extended</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-left">C</td>
<td class="org-left">[%Y-%m-%d %a %H:%M]</td>
<td class="org-left">[%Y-%m-%d %a %H:%M %z]</td>
</tr>
<tr>
<td class="org-left">org-mode</td>
<td class="org-left"><span class="timestamp-wrapper"><span class="timestamp">[2024-11-04 Mon 09:48 +0100]</span></span></td>
<td class="org-left"><span class="timestamp-wrapper"><span class="timestamp">[2024-11-04 Mon 09:48 +0100]</span></span></td>
</tr>
</tbody>
</table>


The following excerpt shows how a typical entry is stored. Here, the 'Film' subheading, which falls under the tag/category MDI (ie. Media), has a single log, lasting for the time between two time stamps, which amounts to one hour and fifty-five minutes, with 'Dune' as the full entry note.

```
** Film :MDI:
:LOGBOOK:
CLOCK: [2024-10-16 Wed 22:24 +0200]--[2024-10-17 Thu 00:20 +0200] =>  1:56
- Dune
:END:
```

# Exporting

The data is exported to a csv table using [Jeff Filipovits](https://github.com/legalnonsense)'s brilliant org-csv-export package. It is particularly useful because it was designed to be extensible: users can define functions that retrieve data for each row, adding the results to the export file. The full code is available at [org-clock-export](https://github.com/legalnonsense/org-clock-export) and the file 'org-csv-util.el' of this repository contains my settings.

The following is my export format: I make sure to include position in the log inside the file (outline), tags and any included notes. 
```
'("filename" (file-name-nondirectory (buffer-file-name)) 
  "outline"  (tn/list-to-string (org-get-outline-path t t))
  "date"     (concat start-year "-" start-month "-" start-day)
  "tzone"    (tn/get-tzone)
  "start"    (concat start-hour ":" start-minute)
  "duration" (number-to-string (+ (* (string-to-number total-hours) 60)
                                  (string-to-number total-minutes)))
  "tags"     (or (org-entry-get (point) "ALLTAGS") "nil")
  "note"     (tn/get-lognote))
```

At export, the data looks like this, all the way down for 7184 rows, as of November 3rd 2024.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">

<colgroup>
<col  class="org-left" />
<col  class="org-left" />
<col  class="org-right" />
<col  class="org-right" />
<col  class="org-right" />
<col  class="org-right" />
<col  class="org-left" />
<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">filename</th>
<th scope="col" class="org-left">outline</th>
<th scope="col" class="org-right">date</th>
<th scope="col" class="org-right">tzone</th>
<th scope="col" class="org-right">start</th>
<th scope="col" class="org-right">duration</th>
<th scope="col" class="org-left">tags</th>
<th scope="col" class="org-left">note</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-left">Calendar.org</td>
<td class="org-left">&ldquo;Projects&rdquo; &ldquo;Quantified-Self-Study&rdquo; &ldquo;Export Report&rdquo;</td>
<td class="org-right">2024-01-05</td>
<td class="org-right">+0100</td>
<td class="org-right">23:00</td>
<td class="org-right">55</td>
<td class="org-left">:2024:PRJ:</td>
<td class="org-left">Computing matrix linear transformation</td>
</tr>
<tr>
<td class="org-left">Calendar.org</td>
<td class="org-left">&ldquo;Projects&rdquo; &ldquo;Quantified-Self-Study&rdquo; &ldquo;Export Report&rdquo;</td>
<td class="org-right">2024-01-05</td>
<td class="org-right">+0100</td>
<td class="org-right">22:15</td>
<td class="org-right">13</td>
<td class="org-left">:2024:PRJ:</td>
<td class="org-left">Simplifying code</td>
</tr>
<tr>
<td class="org-left">Calendar.org</td>
<td class="org-left">&ldquo;Projects&rdquo; &ldquo;Quantified-Self-Study&rdquo; &ldquo;Export Report&rdquo;</td>
<td class="org-right">2024-01-03</td>
<td class="org-right">+0100</td>
<td class="org-right">23:30</td>
<td class="org-right">50</td>
<td class="org-left">:2024:PRJ:</td>
<td class="org-left">Experimenting</td>
</tr>
<tr>
<td class="org-left">Calendar.org</td>
<td class="org-left">&ldquo;Projects&rdquo; &ldquo;Quantified-Self-Study&rdquo; &ldquo;Export Report&rdquo;</td>
<td class="org-right">2024-01-03</td>
<td class="org-right">+0100</td>
<td class="org-right">22:00</td>
<td class="org-right">69</td>
<td class="org-left">:2024:PRJ:</td>
<td class="org-left">R Markov Chain automated improvements</td>
</tr>
<tr>
<td class="org-left">Calendar.org</td>
<td class="org-left">&ldquo;Projects&rdquo; &ldquo;Quantified-Self-Study&rdquo; &ldquo;Export Report&rdquo;</td>
<td class="org-right">2024-01-03</td>
<td class="org-right">+0100</td>
<td class="org-right">18:30</td>
<td class="org-right">195</td>
<td class="org-left">:2024:PRJ:</td>
<td class="org-left">R Markov Chain</td>
</tr>
<tr>
<td class="org-left">Calendar.org</td>
<td class="org-left">&ldquo;Projects&rdquo; &ldquo;Quantified-Self-Study&rdquo; &ldquo;Export Report&rdquo;</td>
<td class="org-right">2024-01-03</td>
<td class="org-right">+0100</td>
<td class="org-right">14:00</td>
<td class="org-right">228</td>
<td class="org-left">:2024:PRJ:</td>
<td class="org-left">R Statistic</td>
</tr>
<tr>
<td class="org-left">Calendar.org</td>
<td class="org-left">&ldquo;Projects&rdquo; &ldquo;Quantified-Self-Study&rdquo; &ldquo;Export Report&rdquo;</td>
<td class="org-right">2024-01-03</td>
<td class="org-right">+0100</td>
<td class="org-right">12:05</td>
<td class="org-right">60</td>
<td class="org-left">:2024:PRJ:</td>
<td class="org-left">Tweaking org-clock-export</td>
</tr>
</tbody>
</table>

I use primarily pandas to conduct my investigation, as its methods are particularly efficient and straightforward, in addition to having the necessary features. The table with the data is read into a pandas dataframe, which I will use throughout my code.

# Data Cleaning

Data is first filtered and formatted for analysis.

## Parsing

As the data is originally in text format, columns are converted into their proper types and added to the dataframe. 

The columns affected are time stamps, which become 'datetime' objects, time durations, made into 'timedelta' objects and tags, which are converted into frozenset types. The latter is Python's immutable version of the tag object: immutability makes the data hashable, so the pandas library can quickly use filter the dataframe.

Typically, methods add results to the dataframe without overwriting existing data, unless it was generated by the function itself. For instance, calling a method will add a column the first time, but calling it again, even with different parameters, will overwrite the column.

In hindsight, I believe that a better choice would have been to produce columns and add them separately, but for the time being the code works to a satisfactory degree, so it does not warrant a rewrite.

## Grouping Events
As a choice of my study, I typically group logs by time and category, running the scripts only the summarised data.

> Instead of studying N events that happened in a week, I group them and only model their combined duration. This ignores their number and variation by event, instead focusing on the total effect. Doing an activity for 1 hour, 10 times, will look the same as doing it once, for 10 hours.

This is done for practical reasons: to reduce the size of the dataset, and to make the effect of particularly long events uniform. Moreover, I automatically store the summary table to reduce running time, using the file when needed.

## Outliers

Outlier events are identified based on deviation from the mean, measured in standard deviations: first, a critical number of standard deviations is fixed. All values that do not fall within the bounds are considered extreme. 

The following command shows how a mask is typically extracted: in this case I group events by outline, that is, by their heading, in order to only compare similar events. 

> extract_outliers_by_group_mask(df, "outline", "duration_timedelta", 3)

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">

<colgroup>
<col  class="org-right" />
<col  class="org-left" />
<col  class="org-right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-right">&#xa0;</th>
<th scope="col" class="org-left">outline</th>
<th scope="col" class="org-right">duration (h)</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-right">53</td>
<td class="org-left">[Work, Helping-Various]</td>
<td class="org-right">02:30</td>
</tr>
<tr>
<td class="org-right">331</td>
<td class="org-left">[Projects, Thesis-Help, Thesis-Data]</td>
<td class="org-right">02:13</td>
</tr>
<tr>
<td class="org-right">380</td>
<td class="org-left">[Projects, Attimo-Personal-Clocking, Coding]</td>
<td class="org-right">03:00</td>
</tr>
<tr>
<td class="org-right">577</td>
<td class="org-left">[Learning, Series, The Boys]</td>
<td class="org-right">04:38</td>
</tr>
<tr>
<td class="org-right">598</td>
<td class="org-left">[Learning, Series, Better Call Saul]</td>
<td class="org-right">02:30</td>
</tr>
</tbody>
</table>

The reason to group outliers stems from the range of recordings, as some kinds are much longer than other. If one considered all events, activities such as sleep would seem outliers and be removed. I should note that this method is also useful to identify events that were misrecorded, helping to correct faulty data.

## Utilities

The **pandas** and **matplotlib** libraries offer a variety of methods and shortcuts to filter dataframes by the values of their columns, or to visualise data quickly. As some data types I use are not standard, I wrote some methods to help with operations.

## Outline Navigation

Outlines are lists of strings which represent the position of a log inside a file. Consider the following file structure.
```
Heading 1
└─► Subheading 2
└─► Subheading 3
      Log A
      Log B
    │  
    └─► Subheading 4
        Log1
        Log2
```
From the example, _Log A_ will have as outline: ["Heading 1", "Subheading 3"]. Specialised methods are used to select clocks based on which outline criteria they match. For example, _Log A_ and _Log B_ are under "Subheading 3" but not "Subheading 4". The following methods are used:

> get_exact_outline_mask(df: pd.DataFrame, outline: list) -> pd.DataFrame

> get_any_outline_mask(df: pd.DataFrame, outline: str) -> pd.DataFrame

> get_index_outline(df: pd.DataFrame, outline: str, index: int) -> pd.DataFrame:

The same is done for tags: events can be selected if their tags are a subset of the desired tags.

> get_subset_match_tags_mask(cl: pd.Series, tags) -> pd.Series:

### Histograms

I plot single properties such as duration with a personalisable function for ease of use.
> plot_histogram(df["duration"], title="Duration histogram", bins=40)
> 
> ![](assets/Duration_Histogram.png)

In the image above, one can see the relation between frequency of recording and duration of the log. The bell-looking distribution to the right is sleep, whereas events at the first peak left show personal activities and the second, lower peak corresponds to lessons, typically lasting 90 minutes.

There are situations where one might want to visualize 2D histograms, so my code includes this functionality:

![](assets/sleep2Dhist.png)

I should note that the visualisation code accounts for nonstandard types: in the following plot I compare tags, of fronzenset type, to duration, of timedelta type.

![](assets/sleep2Dhisttag.png)

# Data Analysis

The rest is coming soon... in the meantime you can find the code [here](Common%20Agenda%20Analysis%20Framework.ipynb).

## Grouping in time

Logs are first grouped into discrete time chunks: the user picks a "time step size", typically 1 day, 1 week or 1 month, and all events that fall under each time period are summed into the number of minutes dedicated to each activity. 

> Instead of considering N occurrences of an event in each week, I just count the total minutes dedicated to each event type per week. 

This subdivision results in a summary table which is a lot smaller compared to the original data: for instance, a 7 day summary of a full year will amount to only 52 rows, from an original 3000. It should also be noted that choosing very long or very short steps will result in either too few data points or many time chunks which are occupied in full by single events. In both cases, analysis is not very indicative.

## Grouping by category
It should be noted that each event has multiple tags associated to it. Consider the following entry: it has year, type, and location as tag: 2023_2024 for the school year, _LES_ for Lessons, _GER_ as in German and _@aulae_ to refer to classroom 'e'.

```
Filename, Heading, ..., Tags
University.org, "GER", ..., :2023_2024:LES:GER:@aulae:
```

These are the main tags ones I use:
- _SWO_, _SFR_ - sleep (with the distinction of waking up with an alarm or freely)
- _LES_, _REV_, _EXM_ - lessons, revision for university and exams
  - _R_, _E_, _S_: revision, exercises and social (ie. in group)
- _BUR_, _WRK_, _TDY_ - bureaucracy, various work tasks, tidying up
- _PRJ_ - time dedicated to personal projects
- _MDI_ - media such as reading books, watching movies or series

Since events generally have multiple tags, one would want their combined duration, while remaining capable of differentiating between them by tag. For example, I may want to compare only how "REV" and "LES" correlate in time.

My solution is to group events into their total duration, taking every group of tags in the dataset, as this is the natural way of grouping the events with minimal loss of information.

The process results in a summary table which has one column for each unique combination of tags. These columns are empty for most of the time, but they can be combined as needed, based on a desired merging rule.

## Merging by category

tag trees


# Extensions

In its current state, the code has a lot of useful features that can be used to analyse the data, or as a basis for other data analysis methods, but it requires interactive development within Jupyter notebooks.

I had plans to bundle the code into a flexible script that would allow users to 'order' a certain output, whether data, a report, or a visual graph. The program would identify all the intermediate steps needed to compute the results, and save them to memory, while generating the output, to reduce its average running time. 

Although the idea was scrapped due to its complexity and time requirements, I would still like to revise the project in the future. For instance, I would like to have a script that automatically compiles yearly reports on my habits and productivity. 

For the time being, most of my time is spent developing [Attimo](https://github.com/quercia-dev/Attimo/), a free and open source productivity tool. 