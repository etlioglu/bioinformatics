# R

- Visually checking a color palette:

        library(scales)
        pal <- rgb(ddf$r, ddf$g, ddf$b)
        show_col(pal)

- Running an R script via the terminal and directing outputs to "out" and "error" files:

        nohup Rscript my-r-script.r > output.out 2> error.err &

- to see if the design of the experiment is confounded:

        # X is the design matrix
        qr(X)$rank
        
