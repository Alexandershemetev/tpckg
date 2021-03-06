% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Geom_data.R
\name{geom_timeline_label}
\alias{geom_timeline_label}
\title{Labels for earthquake timeline plot}
\usage{
geom_timeline_label(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE,
  ...
)
}
\arguments{
\item{mapping}{Set of aesthetic mappings created by \code{\link[ggplot2:aes]{aes()}} or
\code{\link[ggplot2:aes_]{aes_()}}. If specified and \code{inherit.aes = TRUE} (the
default), it is combined with the default mapping at the top level of the
plot. You must supply \code{mapping} if there is no plot mapping.}

\item{data}{The earthquake data to be plotted (NOAA database). See the example for details.}

\item{stat}{The statistical transformation to use on the data for this
layer, as a string.}

\item{position}{Position adjustment, either as a string, or the result of
a call to a position adjustment function.}

\item{na.rm}{If \code{FALSE}, the default, missing values are removed with
a warning. If \code{TRUE}, missing values are silently removed.}

\item{show.legend}{logical. Should this layer be included in the legends?
\code{NA}, the default, includes if any aesthetics are mapped.
\code{FALSE} never includes, and \code{TRUE} always includes.
It can also be a named logical vector to finely select the aesthetics to
display.}

\item{inherit.aes}{If \code{FALSE}, overrides the default aesthetics,
rather than combining with them. This is most useful for helper functions
that define both data and aesthetics and shouldn't inherit behaviour from
the default plot specification, e.g. \code{\link[ggplot2:borders]{borders()}}.}

\item{...}{Other arguments passed on to \code{\link[ggplot2:layer]{layer()}}. These are
often aesthetics, used to set an aesthetic to a fixed value, like
\code{colour = "red"} or \code{size = 3}. They may also be parameters
to the paired geom/stat.}
}
\description{
This geom is intended to be used in conjunction with the \code{\link{geom_timeline}} geom to add a vertical line with a text
annotation (e.g. the location of the earthquake) for each data point on an earthquake timeline with the NOAA database.. The
x aesthetic specifies the date of the earthquake and the label aesthetic specifies the label for the annotation. An optional
n_max aesthetic can be used to subset to n_max earthquakes, meaning the n_max largest (by magnitude) will be labeled.
}
\section{Aesthetics}{

\code{geom_timeline_label} understands the following aesthetics
(required aesthetics are in bold):

\itemize{
  \item \strong{x}
  \item \strong{label}
  \item n_max
}
}

\examples{
\dontrun{
# You can plot a pair of earthquake timelines with labels as follows:

library(dplyr)

recent_earthquakes <- clean_earthquakes \%>\%
    filter(COUNTRY == "CHINA" | COUNTRY == "USA", DATE >= ymd('2000-01-01'))

g <- ggplot(recent_earthquakes,
            aes(x = DATE, y = COUNTRY, size = EQ_PRIMARY, color = TOTAL_DEATHS))
g <- g + geom_timeline(alpha = 0.5)
g <- g + geom_timeline_label(aes(label = LOCATION_NAME, n_max = 5))
g <- g + theme_classic()
g <- g + theme(legend.position = "bottom",
               axis.line.y = element_blank(),
               axis.ticks.y = element_blank(),
               axis.title.y = element_blank())
g <- g + guides(color = guide_colorbar(title = "# deaths"),
                size = guide_legend("Richter scale value"))
g
}

}
