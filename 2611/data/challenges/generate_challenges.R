# Generates the data for all four daily challenges on home_challenges.Rmd.
# Run from the repo root:  Rscript data/challenges/generate_challenges.R
#
# Each challenge has its own seed, so changing one doesn't change the others.
# To get new data (and new answers) for the next course, change a seed and re-run.
# The walkthroughs compute the answers, so the answer boxes update automatically,
# but check that the traps described in each walkthrough still give a different answer.


# ---- Monday: Countable Colonies ----------------------------------------
# Written as R code (colonies.R): on Monday, students can't read files yet.

set.seed(21)
true_conc <- 2.9e8                                  # CFU/mL in the culture
dilution  <- rep(c(1e-3, 1e-4, 1e-5, 1e-6), each = 3)
volume_ml <- 0.1
counts    <- rpois(length(dilution), true_conc * dilution * volume_ml)
colonies  <- ifelse(counts > 1000, "TNTC", as.character(counts))

writeLines(c(
  "# Colony counts from 12 plates (3 plates per dilution)",
  paste0("colonies <- c(", paste0('"', colonies, '"', collapse = ", "), ")"),
  paste0("dilution <- c(", paste(format(dilution, scientific = TRUE), collapse = ", "), ")"),
  "volume_ml <- 0.1   # volume spread on each plate"
), "data/challenges/colonies.R")


# ---- Tuesday: Mouse Mismatch -------------------------------------------

set.seed(3)
n <- 20
ids <- sprintf("M%02d", 1:n)
genotype <- rep(c("WT", "KO"), each = 10)[sample(n)]
sex <- sample(c("F", "M"), n, replace = TRUE)
weight <- round(ifelse(genotype == "KO", 26.2, 24.0) +
                ifelse(sex == "M", 1.5, 0) +
                rnorm(n, 0, 1.6), 1)

# Scale export: European settings (; separator, decimal comma), sorted by ID
weights <- data.frame(id = ids, sex = sex, weight_g = weight)
write.csv2(weights, "data/challenges/mouse_weights.csv", row.names = FALSE, quote = FALSE)

# Animal facility list: different order, and one ID typed in lower case
genotypes <- data.frame(id = ids, genotype = genotype)[sample(n), ]
genotypes$id[genotypes$id == "M07"] <- "m07"
write.csv(genotypes, "data/challenges/mouse_genotypes.csv", row.names = FALSE, quote = FALSE)


# ---- Wednesday: Primer Pairs -------------------------------------------
# The designs below fix how many pairs pass and which pair is best;
# the seed only changes the sequences and which gene gets which design.

set.seed(11)

# A random primer of a given length with exactly `n_gc` G/C bases
make_primer <- function(len, n_gc) {
  bases <- c(sample(c("G", "C"), n_gc, replace = TRUE),
             sample(c("A", "T"), len - n_gc, replace = TRUE))
  paste(sample(bases), collapse = "")
}

targets <- c("GAPDH", "ACTB", "TP53", "MYC", "EGFR", "BRCA1", "IL6", "TNF",
             "IL1B", "CXCL8", "VEGFA", "HIF1A", "CDKN1A", "MKI67", "PCNA",
             "STAT3", "JUN", "FOS", "EEF1A1", "RPLP0", "SOX2", "POU5F1",
             "NANOG", "KRT18", "CDH1", "VIM", "SNAI1", "TWIST1", "CD44", "ALDH1A1")

# Primer designs as (length, number of G/C) for forward and reverse.
# Wallace rule: Tm = 2 * (A + T) + 4 * (G + C) = 2 * length + 2 * n_gc
good <- list(c(18, 9, 18, 9), c(19, 9, 19, 10), c(20, 9, 20, 9), c(18, 10, 19, 9),
             c(19, 10, 19, 10), c(20, 8, 19, 9), c(18, 8, 18, 9), c(19, 10, 20, 10),
             c(20, 10, 19, 10), c(18, 9, 19, 8), c(19, 8, 18, 9), c(20, 9, 19, 10),
             c(18, 10, 18, 10), c(20, 8, 20, 8))
best <- list(c(20, 10, 20, 10))                       # the only pair with mean Tm 60
bad  <- list(c(18, 6, 18, 9),   # GC 33 %
             c(20, 13, 20, 12), # GC 65 %, Tm 66
             c(22, 11, 22, 11), # Tm 66
             c(17, 8, 17, 8),   # Tm 50
             c(18, 8, 20, 10),  # Tm differs by 8
             c(19, 9, 20, 10),  # Tm differs by 4
             c(18, 9, 19, 7),   # GC 37 %
             c(20, 9, 18, 7),   # Tm differs by 8
             c(21, 10, 21, 11), # Tm 62 and 64
             c(18, 10, 20, 12), # GC 60 % is fine, but Tm 56 vs 64
             c(19, 12, 19, 12), # GC 63 %
             c(16, 8, 16, 8),   # Tm 48
             c(20, 11, 18, 8),  # Tm 62 vs 52
             c(19, 7, 19, 7),   # GC 37 %
             c(20, 14, 20, 13)) # GC 70 %
designs <- c(good, best, bad)
targets <- sample(targets)                            # random target for each design

primers <- do.call(rbind, lapply(seq_along(designs), function(i) {
  d <- designs[[i]]
  data.frame(target = targets[i], direction = c("F", "R"),
             sequence = c(make_primer(d[1], d[2]), make_primer(d[3], d[4])))
}))

# Messy data entry. Lower case: forward primers of good pairs 1-3, and of 2 bad pairs
lower <- which(primers$target %in% targets[c(1:3, 17, 20)] & primers$direction == "F")
primers$sequence[lower] <- tolower(primers$sequence[lower])
# Direction typed in lower case: reverse primers of good pairs 4-5, and of 1 bad pair
lower_dir <- which(primers$target %in% targets[c(4:5, 18)] & primers$direction == "R")
primers$direction[lower_dir] <- "r"

primers <- primers[sample(nrow(primers)), ]
write.csv(primers, "data/challenges/primers.csv", row.names = FALSE, quote = FALSE)


# ---- Thursday: Who's the Imposter? -------------------------------------

set.seed(5)
n_genes <- 2000
samples <- sprintf("S%02d", 1:12)
true_sex  <- c("F", "F", "F", "F", "F", "F", "M", "M", "M", "M", "M", "M")
label_sex <- true_sex
imposter  <- 4                                      # labelled F, but male
true_sex[imposter] <- "M"

# Expression levels (CPM-like) for ordinary genes, and library sizes
base <- rlnorm(n_genes, meanlog = log(20), sdlog = 1.6)
lib  <- round(runif(12, 8e6, 30e6))
lib[9] <- 2.5e6                                     # one small library

sex_genes <- c("XIST", "RPS4Y1", "DDX3Y", "KDM5D", "UTY", "EIF1AY")
genes <- c(sprintf("GENE%04d", 1:(n_genes - length(sex_genes) - 2)),
           "GAPDH", "ACTB", sex_genes)
level <- matrix(base, n_genes, 12)
level[genes == "GAPDH", ] <- 3000
level[genes == "ACTB", ]  <- 2500
for (j in 1:12) {
  female <- true_sex[j] == "F"
  level[genes == "XIST", j] <- if (female) runif(1, 150, 250) else runif(1, 0, 0.5)
  for (g in sex_genes[-1]) {
    level[genes == g, j] <- if (female) runif(1, 0, 0.2) else runif(1, 20, 60)
  }
}
level <- sweep(level, 2, colSums(level), "/") * 1e6  # proper CPM scale
mu <- sweep(level, 2, lib / 1e6, "*")
counts <- matrix(rnbinom(length(mu), mu = mu, size = 20), n_genes, 12,
                 dimnames = list(genes, samples))
counts <- counts[sample(n_genes), ]                  # genes in random order

# Bonus: S11 is an accidental duplicate of S08
counts[, "S11"] <- counts[, "S08"]

write.csv(data.frame(gene = rownames(counts), counts), "data/challenges/counts.csv",
          row.names = FALSE, quote = FALSE)

sheet <- data.frame(sample = samples, sex = label_sex,
                    treatment = rep(c("control", "treated"), 6),
                    rin = round(runif(12, 7.2, 9.6), 1))
write.csv(sheet[sample(12), ], "data/challenges/sample_sheet.csv",
          row.names = FALSE, quote = FALSE)
