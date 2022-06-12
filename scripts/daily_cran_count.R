#!/usr/bin/env /usr/local/bin/Rscript
path <- "/home/spk/DATA/crancount/data"
dold <- readRDS(file.path(path, "dold.rds"))
dnew <- tools::CRAN_package_db()
pnew <- setdiff(dnew[["Package"]], dold[["Package"]])
pdrop <- setdiff(dold[["Package"]], dnew[["Package"]])
pobs <- data.frame(
  date=Sys.Date(),
  npkg=nrow(dnew),
  nnew=length(pnew),
  ndrop=length(pdrop)
)
write.table(pobs, file.path(path, "cran_pkg_count.csv"), append=TRUE, sep=",",
  row.names=FALSE, col.names=FALSE)
saveRDS(dnew, file.path(path, "dold.rds"))
saveRDS(dnew, file.path(path, paste0("dold_", Sys.Date(), ".rds")))
