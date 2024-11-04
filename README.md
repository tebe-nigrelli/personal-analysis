# This notebook

As mentioned in my [doom-emacs repository](https://github.com/tebe-nigrelli/doomemacs-config), I like to collect data on my habits and analyze it using mathematical methods. 

The following page gives an outline for my process. The [full jupyter notebook](Common%20Agenda%20AnalysisFramework.ipynb) is available for reference, while in this page I have highlighted its main features with some personal results.

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


# Data Cleaning

As a choice of my study, I typically group logs by time and category, running the scripts only the summarised data.

> Instead of studying N events that happened in a week, I group them and only model their combined duration. This ignores their number and variation by event, instead focusing on the total effect. Doing an activity for 1 hour, 10 times, will look the same as doing it once, for 10 hours.

This is done for practical reasons: to reduce the size of the dataset, and to make the effect of particularly long events uniform. Moreover, I automatically store the summary table to reduce running time, using the file when needed.

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

The process results in a summary table which has one column for each unique combination of tags. These columns tags are empty for most of the time, but 

# Data Analysis

Coming soon... in the meantime you can find the code [here](https://github.com/tebe-nigrelli/doomemacs-config).

# Extensions

In its current state, the code has a lot of useful features that can be used to analyse the data, or as a basis for other data analysis methods, but it requires interactive development within Jupyter notebooks.

I had plans to bundle the code into a flexible script that would allow users to 'order' a certain output, whether data, a report, or a visual graph. The program would identify all the intermediate steps needed to compute the results, and save them to memory, while generating the output, to reduce its average running time. 

Although the idea was scrapped due to its complexity and time requirements, I would still like to revise the project in the future. For instance, I would like to have a script that automatically compiles yearly reports on my habits and productivity. 

For the time being, most of my time is spent developing [Attimo](https://github.com/quercia-dev/Attimo/), a free and open source productivity tool. 