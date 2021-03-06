% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bb_plotHicSquare.R
\name{bb_plotHicSquare}
\alias{bb_plotHicSquare}
\title{Plot a Hi-C interaction matrix in a square format}
\usage{
bb_plotHicSquare(
  data,
  resolution = "auto",
  zrange = NULL,
  norm = "KR",
  matrix = "observed",
  chrom,
  chromstart = NULL,
  chromend = NULL,
  altchrom = NULL,
  altchromstart = NULL,
  altchromend = NULL,
  assembly = "hg19",
  palette = colorRampPalette(c("white", "dark red")),
  half = "both",
  x = NULL,
  y = NULL,
  width = NULL,
  height = NULL,
  just = c("left", "top"),
  default.units = "inches",
  draw = TRUE,
  params = NULL
)
}
\arguments{
\item{data}{Path to .hic file as a string or a 3-column dataframe of interaction counts in sparse upper triangular format.}

\item{resolution}{A numeric specifying the width in basepairs of each pixel. For hic files, "auto" will attempt to choose a resolution based on the size of the region. For
dataframes, "auto" will attempt to detect the resolution the dataframe contains.}

\item{zrange}{A numeric vector of length 2 specifying the range of interaction scores to plot, where extreme values will be set to the max or min.}

\item{norm}{Character value specifying hic data normalization method, if giving .hic file. This value must be found in the .hic file. Default value is \code{norm = "KR"}.}

\item{matrix}{Character value indicating the type of matrix to output. Default value is \code{matrix = "observed"}. Options are:
\itemize{
\item{\code{"observed"}: }{Observed counts.}
\item{\code{"oe"}: }{Observed/expected counts.}
}}

\item{chrom}{Chromosome of region to be plotted, as a string.}

\item{chromstart}{Integer start position on chromosome to be plotted.}

\item{chromend}{Integer end position on chromosome to be plotted.}

\item{altchrom}{Alternate chromosome for off-diagonal plotting or interchromosomal plotting, as a string.}

\item{altchromstart}{Alternate chromosome integer start position for off-diagonal plotting or interchromosomal plotting.}

\item{altchromend}{Alternate chromosome integer end position for off-diagonal plotting or interchromosomal plotting.}

\item{assembly}{Default genome assembly as a string or a \link[BentoBox]{bb_assembly} object. Default value is \code{assembly = "hg19"}.}

\item{palette}{A function describing the color palette to use for representing scale of interaction scores. Default value is \code{palette = colorRampPalette(c("white", "dark red"))}.}

\item{half}{A character value indicating which diagonal regions to plot. For intrachromosomal plotting, options are \code{"both"}, \code{"top"}, or \code{"bottom"}. For off-diagonal or interchromosomal plotting, options are \code{"top"} or \code{"bottom"}. Default value is \code{half = "both"}.
\itemize{
\item{\code{"both"}: }{Both diagonal halves.}
\item{\code{"top"}: }{Half above the diagonal.}
\item{\code{"bottom"}: }{Half below the diagonal.}
}}

\item{x}{A numeric or unit object specifying square Hi-C plot x-location.}

\item{y}{A numeric or unit object specifying square Hi-C plot y-location.}

\item{width}{A numeric or unit object specifying square Hi-C plot width.}

\item{height}{A numeric or unit object specifying square Hi-C plot height.}

\item{just}{Justification of square Hi-C plot relative to its (x, y) location. If there are two values, the first value specifies horizontal justification and the second value specifies vertical justification.
Possible string values are: \code{"left"}, \code{"right"}, \code{"centre"}, \code{"center"}, \code{"bottom"}, and \code{"top"}. Default value is \code{just = c("left", "top")}.}

\item{default.units}{A string indicating the default units to use if \code{x}, \code{y}, \code{width}, or \code{height} are only given as numerics. Default value is \code{default.units = "inches"}.}

\item{draw}{A logical value indicating whether graphics output should be produced. Default value is \code{draw = TRUE}.}

\item{params}{An optional \link[BentoBox]{bb_assembly} object containing relevant function parameters.}
}
\value{
Returns a \code{bb_hicSquare} object containing relevant genomic region, Hi-C data, placement, and \link[grid]{grob} information.
}
\description{
Plot a Hi-C interaction matrix in a square format
}
\details{
This function can be used to quickly plot a square Hi-C plot by ignoring plot placement parameters:
\preformatted{
bb_plotHicSquare(data, chrom,
                 chromstart = NULL, chromend = NULL)
}
A square Hi-C plot can be placed on a BentoBox coordinate page by providing plot placement parameters:
\preformatted{
bb_plotHicSquare(data, chrom,
                 chromstart = NULL, chromend = NULL,
                 x, y, width, height, just = c("left", "top"),
                 default.units = "inches")
}
}
\examples{
## Load Hi-C data
data("bb_hicData")

## Plot upper diagonal of square Hi-C plot filling up entire graphic device
bb_plotHicSquare(data = bb_hicData, resolution = 10000, zrange = c(0, 70),
                 chrom = "chr21", chromstart = 28000000, chromend = 30300000, half = "top")

## Plot and place both halves of square Hi-C plot on a BentoBox page
bb_pageCreate(width = 3, height = 3, default.units = "inches", xgrid = 0, ygrid = 0)
bb_plotHicSquare(data = bb_hicData, resolution = 10000, zrange = c(0, 70),
                 chrom = "chr21", chromstart = 28000000, chromend = 30300000,
                 x = 0.5, y = 0.5, width = 2, height = 2,
                 just = c("left", "top"), default.units = "inches")

}
\seealso{
\link[BentoBox]{bb_readHic}
}
