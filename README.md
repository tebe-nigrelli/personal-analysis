# This notebook

As mentioned in my [doom-emacs repository](https://github.com/tebe-nigrelli/doomemacs-config), I collect data on my habits and analyze it using mathematical methods. 

The following page gives an outline for my process. The full jupyter notebook is available for reference, while in this page I have highlighted its main features with some personal results.

# Data Collection 

I store most of my data through a customised doom-emacs distribution, which can be accessed [here](https://github.com/tebe-nigrelli/doomemacs-config). 

For example, whenever I watch a movie, I open [Emacs](https://www.gnu.org/software/emacs/tour/) and use my own keyboard shortcuts to quickly store an entry in one of my log files. I use a slightly modified version of the [org-mode](https://orgmode.org/) markdown format, one of the available plugins, to store time stamps with the time zone. 

In the original file, this is how a sample entry a stored in text: it shows that the 'Film' subheading, under the tag MDI (Media) has a single logged duration, lasting for the time between two time stamps, which amounts to one hour and fifty-five minutes, with 'Dune' as entry note.

```
** Film :MDI:
:LOGBOOK:
CLOCK: [2024-10-16 Wed 22:24 +0200]--[2024-10-17 Thu 00:20 +0200] =>  1:56
- Dune
:END:
```

# Exporting

The data is exported to csv using [Jeff Filipovits](https://github.com/legalnonsense)'s brilliant org-csv-export package. It is particularly useful because it can be extended with arbitrary code to include functions that retrieve additional data with each clock entry adding it to the export file. The full code is available at [org-clock-export](https://github.com/legalnonsense/org-clock-export) and the file '' of this repository.

The following are my settings: I make sure to include position in the log inside the file (outline), tags and any included notes. 
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

At export, the data looks like this, down for 7184 rows, as of Sun Nov  3 14:26 2024.

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

As a choice of my study, I group the logs by time and category, running the scripts on the grouped data.

> Instead of studying N events that happened in a week, I group them and consider only their combined duration. This ignores their number and variation by event, instead focusing on the total effect. With this transformation, doing something for 1 hour, 10 times, would be the same as doing it once, for 10 hours

This is done for practical reasons: to reduce the size of the dataset, and to make the effect of particularly long events uniform.

## Grouping in time

Logs are first grouped into discrete time chunks: a "time step" size is picked (1 day, 1 week, 1 month, ...) and all events that fall under a time period are summed into the number of minutes dedicated to each activity. 

> Instead of considering N occurrences of an event in each week, I just count the total minutes dedicated to each event type per week. 

This subdivision results in a summary table

## Grouping by category
Each event has some tags associated to it. Take the following entry as an example, which has year, type, and location as tag: 2023_2024 for the school year, _LES_ for Lessons, _GER_ as in German and _@aulae_ to refer to classroom E.
```
Filename, Heading, ..., Tags
University.org, "GER", ..., :2023_2024:LES:GER:@aulae:
```

The following are the main ones I use:
- _SWO_, _SFR_ - sleep (with the distinction of waking up with an alarm or freely)
- _LES_, _REV_, _EXM_ - lessons, revision for university and exams
- _BUR_, _WRK_, _TDY_ - bureaucracy, various work tasks, tidying up
- _PRJ_ - time dedicated to personal projects
- _MDI_ - media such as reading books, watching movies or series

Since events generally have multiple tags, one would want their combined duration, while remaining capable of differentiating between them by tag. For example, I may want to check how "REV" and "LES" correlate in time.

My solution is to group events into their total duration, taking every group of tags in the dataset, as this is the natural way of grouping the events with minimal loss of information.

# Data Analysis

# Extensions

In its current state, the code has a lot of useful features that can be used to analyse the data, or as a basis for other data analysis methods, but it requires interactive development within Jupyter notebooks.

I had plans to bundle the code into a flexible script that allowing users to order a certain output in the form of data, a report, or a graph. The program would sketch out the steps and cache intermediate stages while generating the output, to reduce the running time on average. 

Although the idea was scrapped due to its complexity and time requirements, I would still like to revise the project in the future. For instance, I would like automatic yearly reports on my habits and productivity. 

For the time being, most of my time is spent developing [Attimo](https://github.com/quercia-dev/Attimo/), a free and open source productivity tool. 