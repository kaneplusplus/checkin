# Summary

The analysis of mobility data often begins with the processing of data
capturing the time and location of individuals. When preparing these
data for analysis, the continuous timestamp data can be particularly
difficult to normalize since they require the data scientist to
integrate mode assumptions such as, where is a person/device between
checkins? Where is a person/device before the first checkin? Should
last-observation-carried-forward be used between checkins or between
descretization boundaries? For example, we may want to build sequences
of checkins for a given device over locations and then count the total
number of transitions between locations over all individuals. Problems
like these are common in mobility research, they require careful
consideration based on the goals of an analysis, and software tools
implementing these types of computations will provide benefits in terms
of time savings and data integrity. To address these challenges we
provide the `checkin` package, which provides a standard set of
functions for appropriately descretizing spatio-timestamp data for
aggregate analysis for the R programming environment (R Core Team 2022).

# Statement of Need

Raw mobility data is often characterized by having a column denoting the
device/person identifier, a timestamp, the location, and potentially
other features of the checkin. The device/person identifer is often
given as a unique identifier of a device or person in possession of a
device; the timestamp denotes the time at which a person was at a given
location; and the location can be precise location information (such as
GPS) but is often aggregated to a discrete location, such as a store,
census tract, county etc. While these data are information-rich, to
analyze them, especially at the aggregate level (many devices and many
locations), requires processing to transform them into a representation
amenable to analysis. One such representation is the **mobility graph**,
which encodes vertices as discrete locations, directed edges as the
aggregate movement between locations, and edge weights capturing the
amount of movement (or similar measure) between locations with
corresponding directed edge `[@gilani2020]`. More generally, processing
steps for these aggregate analyses either descretize continuous
timestamp and spatial data and/or aggregate already descretized data.

# Usage

Consider the `checkins` data set from the `checkin` library shown below.
The data consists of 3 columns corresponding to the device (id), time,
(timestamp), and location identifier (location).

    library(checkin)
    data(checkins)
    checkins

    ## # A tibble: 14,609 × 3
    ##       id timestamp           location
    ##    <int> <dttm>                 <int>
    ##  1   442 2020-04-19 17:23:44    36496
    ##  2   442 2020-04-19 17:23:35    36496
    ##  3   166 2020-04-19 12:55:44    37461
    ##  4   476 2020-04-19 06:23:47    33476
    ##  5   456 2020-04-19 05:39:09    33468
    ##  6   458 2020-04-19 10:04:20    36500
    ##  7   458 2020-04-19 15:15:25    36876
    ##  8   651 2020-04-19 13:31:19    37391
    ##  9   652 2020-04-19 05:27:54    37469
    ## 10   653 2020-04-19 05:28:59    37389
    ## # … with 14,599 more rows
    ## # ℹ Use `print(n = ...)` to see more rows

# Related Packages

wickham2022 grolemund2011 weston2022 muller2022

`Gala` is an Astropy-affiliated Python package for galactic dynamics.
Python enables wrapping low-level languages (e.g., C) for speed without
losing flexibility or ease-of-use in the user-interface. The API for
`Gala` was designed to provide a class-based and user-friendly interface
to fast (C or Cython-optimized) implementations of common operations
such as gravitational potential and force evaluation, orbit integration,
dynamical transformations, and chaos indicators for nonlinear dynamics.
`Gala` also relies heavily on and interfaces well with the
implementations of physical units and astronomical coordinate systems in
the `Astropy` package (Astropy Collaboration 2013) (`astropy.units` and
`astropy.coordinates`).

`Gala` was designed to be used by both astronomical researchers and by
students in courses on gravitational dynamics or astronomy. It has
already been used in a number of scientific publications (Pearson,
Price-Whelan, and Johnston 2017) and has also been used in graduate
courses on Galactic dynamics to, e.g., provide interactive
visualizations of textbook material (Binney and Tremaine 2008). The
combination of speed, design, and support for Astropy functionality in
`Gala` will enable exciting scientific explorations of forthcoming data
releases from the *Gaia* mission (Gaia Collaboration 2016) by students
and experts alike.

# Mathematics

Single dollars ($) are required for inline mathematics
e.g. *f*(*x*) = *e*<sup>*π*/*x*</sup>

Double dollars make self-standing equations:

$$\Theta(x) = \left\\{\begin{array}{l}
0\textrm{ if } x &lt; 0\cr
1\textrm{ else}
\end{array}\right.$$

You can also use plain for equations and refer to from text.

# Citations

Citations to entries in paper.bib should be in
[rMarkdown](http://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html)
format.

If you want to cite a software repository URL (e.g. something on GitHub
without a preferred citation) then you can do it with the example BibTeX
entry below for Smith, Thaney, and Hahnel (2020).

For a quick reference, the following citation commands can be used: -
`@author:2001` -&gt; “Author et al. (2001)” - `[@author:2001]` -&gt;
“(Author et al., 2001)” - `[@author1:2001; @author2:2001]` -&gt;
“(Author1 et al., 2001; Author2 et al., 2002)”

# Figures

Figures can be included like this: ![Caption for example
figure.](figure.png) and referenced from text using .

Figure sizes can be customized by adding an optional second parameter:
<img src="figure.png" style="width:20.0%"
alt="Caption for example figure." />

# Acknowledgements

This work was partially supported by the National Science Foundation
(NSF) Grant Human Networks and Data Science - Infrastructure (HNDS-I),
award numbers 2024335 and 2024233.

# References

Astropy Collaboration. 2013. “<span class="nocase">Astropy: A community
Python package for astronomy</span>.” *Astronomy and Astrophysics* 558
(October). <https://doi.org/10.1051/0004-6361/201322068>.

Binney, J., and S. Tremaine. 2008. *Galactic Dynamics: Second Edition*.
Princeton University Press.
<http://adsabs.harvard.edu/abs/2008gady.book.....B>.

Gaia Collaboration. 2016. “<span class="nocase">The Gaia
mission</span>.” *Astronomy and Astrophysics* 595 (November).
<https://doi.org/10.1051/0004-6361/201629272>.

Pearson, S., A. M. Price-Whelan, and K. V. Johnston. 2017. “<span
class="nocase">Gaps in Globular Cluster Streams: Pal 5 and the Galactic
Bar</span>.” *ArXiv e-Prints*, March.
<http://adsabs.harvard.edu/abs/2017arXiv170304627P>.

R Core Team. 2022. *R: A Language and Environment for Statistical
Computing*. Vienna, Austria: R Foundation for Statistical Computing.
<https://www.R-project.org/>.

Smith, A. M., K. Thaney, and M. Hahnel. 2020. “Fidgit: An Ungodly Union
of GitHub and Figshare.” *GitHub Repository*. GitHub.
<https://github.com/arfon/fidgit>.
