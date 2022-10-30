#get data 
library(RMySQL)

con <- dbConnect(MySQL(), user='x', password='x', host='x', 
                 port=x, dbname='x')
rs = dbSendQuery(con, "Select * from cbp98us")
    cbp98us = fetch(rs, n=-1)
    cbp98us$year <- 1998
rs = dbSendQuery(con, "Select * from cbp99us")
    cbp99us = fetch(rs, n=-1)
    cbp99us$year <- 1999
rs = dbSendQuery(con, "Select * from cbp00us")
    cbp00us = fetch(rs, n=-1)
    cbp00us$year <- 2000
rs = dbSendQuery(con, "Select * from cbp01us")
    cbp01us = fetch(rs, n=-1)
    cbp01us$year <- 2001
rs = dbSendQuery(con, "Select * from cbp02us")
    cbp02us = fetch(rs, n=-1)
    cbp02us$year <- 2002
rs = dbSendQuery(con, "Select * from cbp03us")
    cbp03us = fetch(rs, n=-1)
    cbp03us$year <- 2003
rs = dbSendQuery(con, "Select * from cbp04us")
    cbp04us = fetch(rs, n=-1)
    cbp04us$year <- 2004
rs = dbSendQuery(con, "Select * from cbp05us")
    cbp05us = fetch(rs, n=-1)
    cbp05us$year <- 2005
rs = dbSendQuery(con, "Select * from cbp06us")
    cbp06us = fetch(rs, n=-1)
    cbp06us$year <- 2006
rs = dbSendQuery(con, "Select * from cbp07us") #NOISE FLAGS WERE ADDED
    cbp07us = fetch(rs, n=-1)
    cbp07us$year <- 2007
rs = dbSendQuery(con, "Select * from cbp08us")
    cbp08us = fetch(rs, n=-1)
    cbp08us$year <- 2008
rs = dbSendQuery(con, "Select * from cbp09us")
    cbp09us = fetch(rs, n=-1)
    cbp09us$year <- 2009
rs = dbSendQuery(con, "Select * from cbp10us")
    cbp10us = fetch(rs, n=-1)
    cbp10us$year <- 2010
rs = dbSendQuery(con, "Select * from cbp11us")
    cbp11us = fetch(rs, n=-1)
    cbp11us$year <- 2011
rs = dbSendQuery(con, "Select * from cbp12us") #start new naics codes
    cbp12us = fetch(rs, n=-1)
    cbp12us$year <- 2012
rs = dbSendQuery(con, "Select * from cbp13us")
    cbp13us = fetch(rs, n=-1)
    cbp13us$year <- 2013
rs = dbSendQuery(con, "Select * from cbp14us")
    cbp14us = fetch(rs, n=-1)
    cbp14us$year <- 2014

#changing variables (1998-2006)
#1998 - cbp98us
cbp98us$q1_4class <- cbp98us$q1_4
cbp98us$q5_9class <- cbp98us$q5_9
cbp98us$q10_19class <- cbp98us$q10_19
cbp98us$q20_49class <- cbp98us$q20_49
cbp98us$q50_99class <- cbp98us$q50_99
cbp98us$q100_249class <- cbp98us$q100_249
cbp98us$q250_499class <- cbp98us$q250_499
cbp98us$q500_999class <- cbp98us$q500_999
cbp98us$a100_249class <- cbp98us$a100_249
cbp98us$a250_499class <- cbp98us$a250_499
cbp98us$a500_999class <- cbp98us$a500_999
cbp98us$a1000class <- cbp98us$a1000
cbp98us$e1000class <- cbp98us$e1000
cbp98us$q1_4 <- NULL
cbp98us$q5_9 <- NULL
cbp98us$q10_19 <- NULL
cbp98us$q20_49 <- NULL
cbp98us$q50_99 <- NULL
cbp98us$q100_249 <- NULL
cbp98us$q250_499 <- NULL
cbp98us$q500_999 <- NULL
cbp98us$a100_249 <- NULL
cbp98us$a250_499 <- NULL
cbp98us$a500_999 <- NULL
cbp98us$a1000 <- NULL
cbp98us$e1000 <- NULL
#1999 - cbp99us
cbp99us$q1_4class <- cbp99us$q1_4
cbp99us$q5_9class <- cbp99us$q5_9
cbp99us$q10_19class <- cbp99us$q10_19
cbp99us$q20_49class <- cbp99us$q20_49
cbp99us$q50_99class <- cbp99us$q50_99
cbp99us$q100_249class <- cbp99us$q100_249
cbp99us$q250_499class <- cbp99us$q250_499
cbp99us$q500_999class <- cbp99us$q500_999
cbp99us$a100_249class <- cbp99us$a100_249
cbp99us$a250_499class <- cbp99us$a250_499
cbp99us$a500_999class <- cbp99us$a500_999
cbp99us$a1000class <- cbp99us$a1000
cbp99us$e1000class <- cbp99us$e1000
cbp99us$q1_4 <- NULL
cbp99us$q5_9 <- NULL
cbp99us$q10_19 <- NULL
cbp99us$q20_49 <- NULL
cbp99us$q50_99 <- NULL
cbp99us$q100_249 <- NULL
cbp99us$q250_499 <- NULL
cbp99us$q500_999 <- NULL
cbp99us$a100_249 <- NULL
cbp99us$a250_499 <- NULL
cbp99us$a500_999 <- NULL
cbp99us$a1000 <- NULL
cbp99us$e1000 <- NULL
#2000 - cb00us
cbp00us$q1_4class <- cbp00us$q1_4
cbp00us$q5_9class <- cbp00us$q5_9
cbp00us$q10_19class <- cbp00us$q10_19
cbp00us$q20_49class <- cbp00us$q20_49
cbp00us$q50_99class <- cbp00us$q50_99
cbp00us$q100_249class <- cbp00us$q100_249
cbp00us$q250_499class <- cbp00us$q250_499
cbp00us$q500_999class <- cbp00us$q500_999
cbp00us$a100_249class <- cbp00us$a100_249
cbp00us$a250_499class <- cbp00us$a250_499
cbp00us$a500_999class <- cbp00us$a500_999
cbp00us$a1000class <- cbp00us$a1000
cbp00us$e1000class <- cbp00us$e1000
cbp00us$q1_4 <- NULL
cbp00us$q5_9 <- NULL
cbp00us$q10_19 <- NULL
cbp00us$q20_49 <- NULL
cbp00us$q50_99 <- NULL
cbp00us$q100_249 <- NULL
cbp00us$q250_499 <- NULL
cbp00us$q500_999 <- NULL
cbp00us$a100_249 <- NULL
cbp00us$a250_499 <- NULL
cbp00us$a500_999 <- NULL
cbp00us$a1000 <- NULL
cbp00us$e1000 <- NULL
#2001 - cbp01us
cbp01us$q1_4class <- cbp01us$q1_4
cbp01us$q5_9class <- cbp01us$q5_9
cbp01us$q10_19class <- cbp01us$q10_19
cbp01us$q20_49class <- cbp01us$q20_49
cbp01us$q50_99class <- cbp01us$q50_99
cbp01us$q100_249class <- cbp01us$q100_249
cbp01us$q250_499class <- cbp01us$q250_499
cbp01us$q500_999class <- cbp01us$q500_999
cbp01us$a100_249class <- cbp01us$a100_249
cbp01us$a250_499class <- cbp01us$a250_499
cbp01us$a500_999class <- cbp01us$a500_999
cbp01us$a1000class <- cbp01us$a1000
cbp01us$e1000class <- cbp01us$e1000
cbp01us$q1_4 <- NULL
cbp01us$q5_9 <- NULL
cbp01us$q10_19 <- NULL
cbp01us$q20_49 <- NULL
cbp01us$q50_99 <- NULL
cbp01us$q100_249 <- NULL
cbp01us$q250_499 <- NULL
cbp01us$q500_999 <- NULL
cbp01us$a100_249 <- NULL
cbp01us$a250_499 <- NULL
cbp01us$a500_999 <- NULL
cbp01us$a1000 <- NULL
cbp01us$e1000 <- NULL
#2002 - cbp02us
cbp02us$q1_4class <- cbp02us$q1_4
cbp02us$q5_9class <- cbp02us$q5_9
cbp02us$q10_19class <- cbp02us$q10_19
cbp02us$q20_49class <- cbp02us$q20_49
cbp02us$q50_99class <- cbp02us$q50_99
cbp02us$q100_249class <- cbp02us$q100_249
cbp02us$q250_499class <- cbp02us$q250_499
cbp02us$q500_999class <- cbp02us$q500_999
cbp02us$a100_249class <- cbp02us$a100_249
cbp02us$a250_499class <- cbp02us$a250_499
cbp02us$a500_999class <- cbp02us$a500_999
cbp02us$a1000class <- cbp02us$a1000
cbp02us$e1000class <- cbp02us$e1000
cbp02us$q1_4 <- NULL
cbp02us$q5_9 <- NULL
cbp02us$q10_19 <- NULL
cbp02us$q20_49 <- NULL
cbp02us$q50_99 <- NULL
cbp02us$q100_249 <- NULL
cbp02us$q250_499 <- NULL
cbp02us$q500_999 <- NULL
cbp02us$a100_249 <- NULL
cbp02us$a250_499 <- NULL
cbp02us$a500_999 <- NULL
cbp02us$a1000 <- NULL
cbp02us$e1000 <- NULL
#2003 - cbp03us
cbp03us$q1_4class <- cbp03us$q1_4
cbp03us$q5_9class <- cbp03us$q5_9
cbp03us$q10_19class <- cbp03us$q10_19
cbp03us$q20_49class <- cbp03us$q20_49
cbp03us$q50_99class <- cbp03us$q50_99
cbp03us$q100_249class <- cbp03us$q100_249
cbp03us$q250_499class <- cbp03us$q250_499
cbp03us$q500_999class <- cbp03us$q500_999
cbp03us$a100_249class <- cbp03us$a100_249
cbp03us$a250_499class <- cbp03us$a250_499
cbp03us$a500_999class <- cbp03us$a500_999
cbp03us$a1000class <- cbp03us$a1000
cbp03us$e1000class <- cbp03us$e1000
cbp03us$q1_4 <- NULL
cbp03us$q5_9 <- NULL
cbp03us$q10_19 <- NULL
cbp03us$q20_49 <- NULL
cbp03us$q50_99 <- NULL
cbp03us$q100_249 <- NULL
cbp03us$q250_499 <- NULL
cbp03us$q500_999 <- NULL
cbp03us$a100_249 <- NULL
cbp03us$a250_499 <- NULL
cbp03us$a500_999 <- NULL
cbp03us$a1000 <- NULL
cbp03us$e1000 <- NULL
#2004 - cbp04us
cbp04us$q1_4class <- cbp04us$q1_4
cbp04us$q5_9class <- cbp04us$q5_9
cbp04us$q10_19class <- cbp04us$q10_19
cbp04us$q20_49class <- cbp04us$q20_49
cbp04us$q50_99class <- cbp04us$q50_99
cbp04us$q100_249class <- cbp04us$q100_249
cbp04us$q250_499class <- cbp04us$q250_499
cbp04us$q500_999class <- cbp04us$q500_999
cbp04us$a100_249class <- cbp04us$a100_249
cbp04us$a250_499class <- cbp04us$a250_499
cbp04us$a500_999class <- cbp04us$a500_999
cbp04us$a1000class <- cbp04us$a1000
cbp04us$e1000class <- cbp04us$e1000
cbp04us$q1_4 <- NULL
cbp04us$q5_9 <- NULL
cbp04us$q10_19 <- NULL
cbp04us$q20_49 <- NULL
cbp04us$q50_99 <- NULL
cbp04us$q100_249 <- NULL
cbp04us$q250_499 <- NULL
cbp04us$q500_999 <- NULL
cbp04us$a100_249 <- NULL
cbp04us$a250_499 <- NULL
cbp04us$a500_999 <- NULL
cbp04us$a1000 <- NULL
cbp04us$e1000 <- NULL
#2005 - cbp05us
cbp05us$q1_4class <- cbp05us$q1_4
cbp05us$q5_9class <- cbp05us$q5_9
cbp05us$q10_19class <- cbp05us$q10_19
cbp05us$q20_49class <- cbp05us$q20_49
cbp05us$q50_99class <- cbp05us$q50_99
cbp05us$q100_249class <- cbp05us$q100_249
cbp05us$q250_499class <- cbp05us$q250_499
cbp05us$q500_999class <- cbp05us$q500_999
cbp05us$a100_249class <- cbp05us$a100_249
cbp05us$a250_499class <- cbp05us$a250_499
cbp05us$a500_999class <- cbp05us$a500_999
cbp05us$a1000class <- cbp05us$a1000
cbp05us$e1000class <- cbp05us$e1000
cbp05us$q1_4 <- NULL
cbp05us$q5_9 <- NULL
cbp05us$q10_19 <- NULL
cbp05us$q20_49 <- NULL
cbp05us$q50_99 <- NULL
cbp05us$q100_249 <- NULL
cbp05us$q250_499 <- NULL
cbp05us$q500_999 <- NULL
cbp05us$a100_249 <- NULL
cbp05us$a250_499 <- NULL
cbp05us$a500_999 <- NULL
cbp05us$a1000 <- NULL
cbp05us$e1000 <- NULL
#2006 - cbp06us
cbp06us$q1_4class <- cbp06us$q1_4
cbp06us$q5_9class <- cbp06us$q5_9
cbp06us$q10_19class <- cbp06us$q10_19
cbp06us$q20_49class <- cbp06us$q20_49
cbp06us$q50_99class <- cbp06us$q50_99
cbp06us$q100_249class <- cbp06us$q100_249
cbp06us$q250_499class <- cbp06us$q250_499
cbp06us$q500_999class <- cbp06us$q500_999
cbp06us$a100_249class <- cbp06us$a100_249
cbp06us$a250_499class <- cbp06us$a250_499
cbp06us$a500_999class <- cbp06us$a500_999
cbp06us$a1000class <- cbp06us$a1000
cbp06us$e1000class <- cbp06us$e1000
cbp06us$q1_4 <- NULL
cbp06us$q5_9 <- NULL
cbp06us$q10_19 <- NULL
cbp06us$q20_49 <- NULL
cbp06us$q50_99 <- NULL
cbp06us$q100_249 <- NULL
cbp06us$q250_499 <- NULL
cbp06us$q500_999 <- NULL
cbp06us$a100_249 <- NULL
cbp06us$a250_499 <- NULL
cbp06us$a500_999 <- NULL
cbp06us$a1000 <- NULL
cbp06us$e1000 <- NULL

#2007 - cbp07us
cbp07us$qp1nf <- NULL
cbp07us$q1_4nf <- NULL
cbp07us$q5_9nf <- NULL
cbp07us$q10_19nf <- NULL
cbp07us$q20_49nf <- NULL
cbp07us$q50_99nf <- NULL
cbp07us$q100_249nf <- NULL
cbp07us$q250_499nf <- NULL
cbp07us$q500_999nf <- NULL
cbp07us$q1000nf <- NULL
cbp07us$apnf <- NULL
cbp07us$a1_4nf <- NULL
cbp07us$a5_9nf <- NULL
cbp07us$a10_19nf <- NULL
cbp07us$a20_49nf <- NULL
cbp07us$a50_99nf <- NULL
cbp07us$a100_249nf <- NULL
cbp07us$a250_499nf <- NULL
cbp07us$a500_999nf <- NULL
cbp07us$a1000nf <- NULL
cbp07us$empnf <- NULL
cbp07us$e1_4nf <- NULL
cbp07us$e5_9nf <- NULL
cbp07us$e10_19nf <- NULL
cbp07us$e20_49nf <- NULL
cbp07us$e50_99nf <- NULL
cbp07us$e100_249nf <- NULL
cbp07us$e250_499nf <- NULL
cbp07us$e500_999nf <- NULL
cbp07us$e1000nf <- NULL
#2008 - cbp08us
cbp08us$qp1nf <- NULL
cbp08us$q1_4nf <- NULL
cbp08us$q5_9nf <- NULL
cbp08us$q10_19nf <- NULL
cbp08us$q20_49nf <- NULL
cbp08us$q50_99nf <- NULL
cbp08us$q100_249nf <- NULL
cbp08us$q250_499nf <- NULL
cbp08us$q500_999nf <- NULL
cbp08us$q1000nf <- NULL
cbp08us$apnf <- NULL
cbp08us$a1_4nf <- NULL
cbp08us$a5_9nf <- NULL
cbp08us$a10_19nf <- NULL
cbp08us$a20_49nf <- NULL
cbp08us$a50_99nf <- NULL
cbp08us$a100_249nf <- NULL
cbp08us$a250_499nf <- NULL
cbp08us$a500_999nf <- NULL
cbp08us$a1000nf <- NULL
cbp08us$empnf <- NULL
cbp08us$e1_4nf <- NULL
cbp08us$e5_9nf <- NULL
cbp08us$e10_19nf <- NULL
cbp08us$e20_49nf <- NULL
cbp08us$e50_99nf <- NULL
cbp08us$e100_249nf <- NULL
cbp08us$e250_499nf <- NULL
cbp08us$e500_999nf <- NULL
cbp08us$e1000nf <- NULL
#2009 - cbp09us
cbp09us$qp1nf <- NULL
cbp09us$q1_4nf <- NULL
cbp09us$q5_9nf <- NULL
cbp09us$q10_19nf <- NULL
cbp09us$q20_49nf <- NULL
cbp09us$q50_99nf <- NULL
cbp09us$q100_249nf <- NULL
cbp09us$q250_499nf <- NULL
cbp09us$q500_999nf <- NULL
cbp09us$q1000nf <- NULL
cbp09us$apnf <- NULL
cbp09us$a1_4nf <- NULL
cbp09us$a5_9nf <- NULL
cbp09us$a10_19nf <- NULL
cbp09us$a20_49nf <- NULL
cbp09us$a50_99nf <- NULL
cbp09us$a100_249nf <- NULL
cbp09us$a250_499nf <- NULL
cbp09us$a500_999nf <- NULL
cbp09us$a1000nf <- NULL
cbp09us$empnf <- NULL
cbp09us$e1_4nf <- NULL
cbp09us$e5_9nf <- NULL
cbp09us$e10_19nf <- NULL
cbp09us$e20_49nf <- NULL
cbp09us$e50_99nf <- NULL
cbp09us$e100_249nf <- NULL
cbp09us$e250_499nf <- NULL
cbp09us$e500_999nf <- NULL
cbp09us$e1000nf <- NULL
#2010 - cbp10us
cbp10us$qp1nf <- NULL
cbp10us$q1_4nf <- NULL
cbp10us$q5_9nf <- NULL
cbp10us$q10_19nf <- NULL
cbp10us$q20_49nf <- NULL
cbp10us$q50_99nf <- NULL
cbp10us$q100_249nf <- NULL
cbp10us$q250_499nf <- NULL
cbp10us$q500_999nf <- NULL
cbp10us$q1000nf <- NULL
cbp10us$apnf <- NULL
cbp10us$a1_4nf <- NULL
cbp10us$a5_9nf <- NULL
cbp10us$a10_19nf <- NULL
cbp10us$a20_49nf <- NULL
cbp10us$a50_99nf <- NULL
cbp10us$a100_249nf <- NULL
cbp10us$a250_499nf <- NULL
cbp10us$a500_999nf <- NULL
cbp10us$a1000nf <- NULL
cbp10us$empnf <- NULL
cbp10us$e1_4nf <- NULL
cbp10us$e5_9nf <- NULL
cbp10us$e10_19nf <- NULL
cbp10us$e20_49nf <- NULL
cbp10us$e50_99nf <- NULL
cbp10us$e100_249nf <- NULL
cbp10us$e250_499nf <- NULL
cbp10us$e500_999nf <- NULL
cbp10us$e1000nf <- NULL
#2011 - cbp11us
cbp11us$qp1nf <- NULL
cbp11us$q1_4nf <- NULL
cbp11us$q5_9nf <- NULL
cbp11us$q10_19nf <- NULL
cbp11us$q20_49nf <- NULL
cbp11us$q50_99nf <- NULL
cbp11us$q100_249nf <- NULL
cbp11us$q250_499nf <- NULL
cbp11us$q500_999nf <- NULL
cbp11us$q1000nf <- NULL
cbp11us$apnf <- NULL
cbp11us$a1_4nf <- NULL
cbp11us$a5_9nf <- NULL
cbp11us$a10_19nf <- NULL
cbp11us$a20_49nf <- NULL
cbp11us$a50_99nf <- NULL
cbp11us$a100_249nf <- NULL
cbp11us$a250_499nf <- NULL
cbp11us$a500_999nf <- NULL
cbp11us$a1000nf <- NULL
cbp11us$empnf <- NULL
cbp11us$e1_4nf <- NULL
cbp11us$e5_9nf <- NULL
cbp11us$e10_19nf <- NULL
cbp11us$e20_49nf <- NULL
cbp11us$e50_99nf <- NULL
cbp11us$e100_249nf <- NULL
cbp11us$e250_499nf <- NULL
cbp11us$e500_999nf <- NULL
cbp11us$e1000nf <- NULL
#2012 - cbp12us
cbp12us$qp1nf <- NULL
cbp12us$q1_4nf <- NULL
cbp12us$q5_9nf <- NULL
cbp12us$q10_19nf <- NULL
cbp12us$q20_49nf <- NULL
cbp12us$q50_99nf <- NULL
cbp12us$q100_249nf <- NULL
cbp12us$q250_499nf <- NULL
cbp12us$q500_999nf <- NULL
cbp12us$q1000nf <- NULL
cbp12us$apnf <- NULL
cbp12us$a1_4nf <- NULL
cbp12us$a5_9nf <- NULL
cbp12us$a10_19nf <- NULL
cbp12us$a20_49nf <- NULL
cbp12us$a50_99nf <- NULL
cbp12us$a100_249nf <- NULL
cbp12us$a250_499nf <- NULL
cbp12us$a500_999nf <- NULL
cbp12us$a1000nf <- NULL
cbp12us$empnf <- NULL
cbp12us$e1_4nf <- NULL
cbp12us$e5_9nf <- NULL
cbp12us$e10_19nf <- NULL
cbp12us$e20_49nf <- NULL
cbp12us$e50_99nf <- NULL
cbp12us$e100_249nf <- NULL
cbp12us$e250_499nf <- NULL
cbp12us$e500_999nf <- NULL
cbp12us$e1000nf <- NULL
#2013 - cbp13us
cbp13us$qp1nf <- NULL
cbp13us$q1_4nf <- NULL
cbp13us$q5_9nf <- NULL
cbp13us$q10_19nf <- NULL
cbp13us$q20_49nf <- NULL
cbp13us$q50_99nf <- NULL
cbp13us$q100_249nf <- NULL
cbp13us$q250_499nf <- NULL
cbp13us$q500_999nf <- NULL
cbp13us$q1000nf <- NULL
cbp13us$apnf <- NULL
cbp13us$a1_4nf <- NULL
cbp13us$a5_9nf <- NULL
cbp13us$a10_19nf <- NULL
cbp13us$a20_49nf <- NULL
cbp13us$a50_99nf <- NULL
cbp13us$a100_249nf <- NULL
cbp13us$a250_499nf <- NULL
cbp13us$a500_999nf <- NULL
cbp13us$a1000nf <- NULL
cbp13us$empnf <- NULL
cbp13us$e1_4nf <- NULL
cbp13us$e5_9nf <- NULL
cbp13us$e10_19nf <- NULL
cbp13us$e20_49nf <- NULL
cbp13us$e50_99nf <- NULL
cbp13us$e100_249nf <- NULL
cbp13us$e250_499nf <- NULL
cbp13us$e500_999nf <- NULL
cbp13us$e1000nf <- NULL
#2014 - cbp14us
cbp14us$qp1nf <- NULL
cbp14us$q1_4nf <- NULL
cbp14us$q5_9nf <- NULL
cbp14us$q10_19nf <- NULL
cbp14us$q20_49nf <- NULL
cbp14us$q50_99nf <- NULL
cbp14us$q100_249nf <- NULL
cbp14us$q250_499nf <- NULL
cbp14us$q500_999nf <- NULL
cbp14us$q1000nf <- NULL
cbp14us$apnf <- NULL
cbp14us$a1_4nf <- NULL
cbp14us$a5_9nf <- NULL
cbp14us$a10_19nf <- NULL
cbp14us$a20_49nf <- NULL
cbp14us$a50_99nf <- NULL
cbp14us$a100_249nf <- NULL
cbp14us$a250_499nf <- NULL
cbp14us$a500_999nf <- NULL
cbp14us$a1000nf <- NULL
cbp14us$empnf <- NULL
cbp14us$e1_4nf <- NULL
cbp14us$e5_9nf <- NULL
cbp14us$e10_19nf <- NULL
cbp14us$e20_49nf <- NULL
cbp14us$e50_99nf <- NULL
cbp14us$e100_249nf <- NULL
cbp14us$e250_499nf <- NULL
cbp14us$e500_999nf <- NULL
cbp14us$e1000nf <- NULL


#LFO code - only include '-' (all establishments) - from 2008-2014
cbp08us <- cbp08us[ which(cbp08us$lfo=="-"), ]
cbp09us <- cbp09us[ which(cbp09us$lfo=="-"), ]
cbp10us <- cbp10us[ which(cbp10us$lfo=="-"), ]
cbp11us <- cbp11us[ which(cbp11us$lfo=="-"), ]
cbp12us <- cbp12us[ which(cbp12us$lfo=="-"), ]
cbp13us <- cbp13us[ which(cbp13us$lfo=="-"), ]
cbp14us <- cbp14us[ which(cbp14us$lfo=="-"), ]

#eliminating variables (2008-2013 & 2014)
cbp14us$lfo <- NULL
cbp14us$xtab2 <- NULL
cbp08us$lfo <- NULL
cbp09us$lfo <- NULL
cbp10us$lfo <- NULL
cbp11us$lfo <- NULL
cbp12us$lfo <- NULL
cbp13us$lfo <- NULL

#append data
cbp_us <- rbind(cbp98us, cbp99us, cbp00us, cbp01us, cbp02us, cbp03us,
                    cbp04us, cbp05us, cbp06us, cbp07us, cbp08us, cbp09us,
                    cbp10us, cbp11us, cbp12us, cbp13us, cbp14us)
rm(cbp98us, cbp99us, cbp00us, cbp01us, cbp02us, cbp03us,
                    cbp04us, cbp05us, cbp06us, cbp07us, cbp08us, cbp09us,
                    cbp10us, cbp11us, cbp12us, cbp13us, cbp14us)
cbp_us <- unique(cbp_us) #drop duplicates

#make variable coding consistent
cbp_us$q1_4 <- cbp_us$q1_4class
cbp_us$q5_9 <- cbp_us$q5_9class
cbp_us$q10_19 <- cbp_us$q10_19class
cbp_us$q20_49 <- cbp_us$q20_49class
cbp_us$q50_99 <- cbp_us$q50_99class
cbp_us$q100_249 <- cbp_us$q100_249class
cbp_us$q250_499 <- cbp_us$q250_499class
cbp_us$q500_999 <- cbp_us$q500_999class
cbp_us$a100_249 <- cbp_us$a100_249class
cbp_us$a250_499 <- cbp_us$a250_499class
cbp_us$a500_999 <- cbp_us$a500_999class
cbp_us$a1000 <- cbp_us$a1000class
cbp_us$e1000 <- cbp_us$e1000class
cbp_us$q1_4class <- NULL
cbp_us$q5_9class <- NULL
cbp_us$q10_19class <- NULL
cbp_us$q20_49class <- NULL
cbp_us$q50_99class <- NULL
cbp_us$q100_249class <- NULL
cbp_us$q250_499class <- NULL
cbp_us$q500_999class <- NULL
cbp_us$a100_249class <- NULL
cbp_us$a250_499class <- NULL
cbp_us$a500_999class <- NULL
cbp_us$a1000class <- NULL
cbp_us$e1000class <- NULL
cbp_us$e.total <- cbp_us$emp
cbp_us$n.total <- cbp_us$est
cbp_us$emp <- NULL
cbp_us$est <- NULL
cbp_us$e.1_4 <- cbp_us$e1_4
cbp_us$e.5_9 <- cbp_us$e5_9
cbp_us$e.10_19 <- cbp_us$e10_19
cbp_us$e.20_49 <- cbp_us$e20_49
cbp_us$e.50_99 <- cbp_us$e50_99
cbp_us$e.100_249 <- cbp_us$e100_249
cbp_us$e.250_499 <- cbp_us$e250_499
cbp_us$e.500_999 <- cbp_us$e500_999
cbp_us$e.1000 <- cbp_us$e1000
cbp_us$n.1_4 <- cbp_us$n1_4
cbp_us$n.5_9 <- cbp_us$n5_9
cbp_us$n.10_19 <- cbp_us$n10_19
cbp_us$n.20_49 <- cbp_us$n20_49
cbp_us$n.50_99 <- cbp_us$n50_99
cbp_us$n.100_249 <- cbp_us$n100_249
cbp_us$n.250_499 <- cbp_us$n250_499
cbp_us$n.500_999 <- cbp_us$n500_999
cbp_us$n.1000 <- cbp_us$n1000



keepvars <- c("naics", "year", 
    "e.total", "e.1_4", "e.5_9", "e.10_19", "e.20_49", "e.50_99", "e.100_249", "e.250_499", "e.500_999", "e.1000", 
    "n.total", "n.1_4", "n.5_9", "n.10_19", "n.20_49", "n.50_99", "n.100_249", "n.250_499", "n.500_999", "n.1000") 
cbp_us <- cbp_us[keepvars]
cbp_us[, c(2:22)] <- sapply(cbp_us[, c(2:22)], as.numeric)
rm(con, keepvars, rs)


cbp_us <- cbp_us[ which(
    cbp_us$naics==	"311///"	|
    cbp_us$naics==	"3111//"	|
    cbp_us$naics==	"31111/"	|
    cbp_us$naics==	"311111"	|
    cbp_us$naics==	"311119"	|
    cbp_us$naics==	"3112//"	|
    cbp_us$naics==  "31121/"	|
    cbp_us$naics==	"311211"	|
    cbp_us$naics==	"311212"	|
    cbp_us$naics==	"311213"	|
    cbp_us$naics==	"31122/"	|
    cbp_us$naics==	"311221"	|
    cbp_us$naics==	"311224"	|
    cbp_us$naics==	"311225"	|
    cbp_us$naics==	"31123/"	|
    cbp_us$naics==	"311230"	|
    cbp_us$naics==	"3113//"	|
    cbp_us$naics==	"31131/"	|
    cbp_us$naics==	"311313"	|
    cbp_us$naics==	"311314"	|
    cbp_us$naics==	"31134/"	|
    cbp_us$naics==	"311340"	|
    cbp_us$naics==	"31135/"	|
    cbp_us$naics==	"311351"	|
    cbp_us$naics==	"311352"	|
    cbp_us$naics==	"3114//"	|
    cbp_us$naics==	"31141/"	|
    cbp_us$naics==	"311411"	|
    cbp_us$naics==	"311412"	|
    cbp_us$naics==	"31142/"	|
    cbp_us$naics==	"311421"	|
    cbp_us$naics==	"311422"	|
    cbp_us$naics==	"311423"	|
    cbp_us$naics==	"3115//"	|
    cbp_us$naics==	"31151/"	|
    cbp_us$naics==	"311511"	|
    cbp_us$naics==	"311512"	|
    cbp_us$naics==	"311513"	|
    cbp_us$naics==	"311514"	|
    cbp_us$naics==	"31152/"	|
    cbp_us$naics==	"311520"	|
    cbp_us$naics==	"3116//"	|
    cbp_us$naics==	"31161/"	|
    cbp_us$naics==	"311611"	|
    cbp_us$naics==	"311612"	|
    cbp_us$naics==	"311613"	|
    cbp_us$naics==	"311615"	|
    cbp_us$naics==	"3117//"	|
    cbp_us$naics==	"31171/"	|
    cbp_us$naics==	"311710"	|
    cbp_us$naics==	"3118//"	|
    cbp_us$naics==	"31181/"	|
    cbp_us$naics==	"311811"	|
    cbp_us$naics==	"311812"	|
    cbp_us$naics==	"311813"	|
    cbp_us$naics==	"31182/"	|
    cbp_us$naics==	"311821"	|
    cbp_us$naics==	"311824"	|
    cbp_us$naics==	"31183/"	|
    cbp_us$naics==	"311830"	|
    cbp_us$naics==	"3119//"	|
    cbp_us$naics==	"31191/"	|
    cbp_us$naics==	"311911"	|
    cbp_us$naics==	"311919"	|
    cbp_us$naics==	"31192/"	|
    cbp_us$naics==	"311920"	|
    cbp_us$naics==	"31193/"	|
    cbp_us$naics==	"311930"	|
    cbp_us$naics==	"31194/"	|
    cbp_us$naics==	"311941"	|
    cbp_us$naics==	"311942"	|
    cbp_us$naics==	"31199/"	|
    cbp_us$naics==	"311991"	|
    cbp_us$naics==	"311999"	|
    cbp_us$naics==	"312///"	|
    cbp_us$naics==	"3121//"	|
    cbp_us$naics==	"31211/"	|
    cbp_us$naics==	"312111"	|
    cbp_us$naics==	"312112"	|
    cbp_us$naics==	"312113"	|
    cbp_us$naics==	"31212/"	|
    cbp_us$naics==	"312120"	|
    cbp_us$naics==	"31213/"	|
    cbp_us$naics==	"312130"	|
    cbp_us$naics==	"31214/"	|
    cbp_us$naics==	"312140"	|
    cbp_us$naics==	"722330"	|
    cbp_us$naics==	"311222"	|
    cbp_us$naics==	"311223"	|
    cbp_us$naics==	"311311"	|
    cbp_us$naics==	"311312"	|
    cbp_us$naics==	"311320"	|
    cbp_us$naics==	"311330"	|
    cbp_us$naics==	"311711"	|
    cbp_us$naics==	"311712"	|
    cbp_us$naics==	"311824"	|
    cbp_us$naics==	"311823"
), ]


#data analysis - 
cbp_us_wide <- reshape(cbp_us, 
        timevar = "naics",
        idvar = c("year"),
        direction = "wide")
cbp_us_medium <- cbp_us
rm(cbp_us)


keepvars <- c("naics", "year", "e.total", "e.1_4", "e.5_9", "e.10_19", "e.20_49", "e.50_99", "e.100_249", "e.250_499", "e.500_999", "e.1000") 
cbp_us_medium_e <- cbp_us_medium[keepvars]
keepvars <- c("naics", "year", "n.total", "n.1_4", "n.5_9", "n.10_19", "n.20_49", "n.50_99", "n.100_249", "n.250_499", "n.500_999", "n.1000")
cbp_us_medium_n <- cbp_us_medium[keepvars]

rm(keepvars)



#library(xlsx)
#setwd("/Users/trev/desktop")
#naics <- read.xlsx("naics.xlsx", sheetIndex=1, header = FALSE)
#naics <- naics["X1"]
#naics <- t(naics)
#colnames(naics) = naics[1, ]
#naics <- naics[1:87]
#naics <- t(naics)
#colnames(naics) = naics[1, ]
#naics = naics[-1, ] 


cbp_us_long_e <- reshape(cbp_us_medium_e, 
             varying = list(names(cbp_us_medium_e)[3:12]), 
             v.names = "e",
             idvar = c("year", "naics"), 
             timevar = "size", 
             times = c("total", "1_4", "5_9", "10_19", "20_49", "50_99", "100_249", "250_499", "500_999", "1000"), 
             direction = "long")
cbp_us_naics_e <- reshape(cbp_us_long_e, 
                        timevar = "naics",
                        idvar = c("year", "size"),
                        direction = "wide")

cbp_us_naics_e[is.na(cbp_us_naics_e)] <- 0

cbp_us_naics_e$e.311224 <- cbp_us_naics_e$e.311224 + cbp_us_naics_e$e.311222 + cbp_us_naics_e$e.311223
cbp_us_naics_e$e.311314 <- cbp_us_naics_e$e.311314 + cbp_us_naics_e$e.311311 + cbp_us_naics_e$e.311312
cbp_us_naics_e$e.311351 <- cbp_us_naics_e$e.311351 + cbp_us_naics_e$e.311320 + cbp_us_naics_e$e.311330
cbp_us_naics_e$e.311710 <- cbp_us_naics_e$e.311710 + cbp_us_naics_e$e.311711 + cbp_us_naics_e$e.311712
cbp_us_naics_e$e.311824 <- cbp_us_naics_e$e.311824 + cbp_us_naics_e$e.311822 + cbp_us_naics_e$e.311823
cbp_us_naics_e$e.311222 <- NULL
cbp_us_naics_e$e.311223 <- NULL
cbp_us_naics_e$e.311311 <- NULL
cbp_us_naics_e$e.311312 <- NULL
cbp_us_naics_e$e.311320 <- NULL
cbp_us_naics_e$e.311330 <- NULL
cbp_us_naics_e$e.311711 <- NULL
cbp_us_naics_e$e.311712 <- NULL
cbp_us_naics_e$e.311822 <- NULL
cbp_us_naics_e$e.311823 <- NULL

cbp_us_long_e <- reshape(cbp_us_naics_e, 
                       varying = list(names(cbp_us_naics_e)[3:89]), 
                       v.names = "e",
                       idvar = c("year", "size"), 
                       timevar = "naics", 
                       times = c("311///", "3111//", "31111/", "311111", "311119", "3112//",
                                 "31121/", "311211", "311212", "311213", "31122/", "311221",
                                 "311224", "311225", "31123/", "311230", "3113//", "31131/",
                                 "311313", "311314", "31134/", "311340", "31135/", "311351",
                                 "311352", "3114//", "31141/", "311411", "311412", "31142/",
                                 "311421", "311422", "311423", "3115//", "31151/", "311511",
                                 "311512", "311513", "311514", "31152/", "311520", "3116//",
                                 "31161/", "311611", "311612", "311613", "311615", "3117//",
                                 "31171/", "311710", "3118//", "31181/", "311811", "311812",
                                 "311813", "31182/", "311821", "311824", "31183/", "311830",
                                 "3119//", "31191/", "311911", "311919", "31192/", "311920",
                                 "31193/", "311930", "31194/", "311941", "311942", "31199/",
                                 "311991", "311999", "312///", "3121//", "31211/", "312111",
                                 "312112", "312113", "31212/", "312120", "31213/", "312130",
                                 "31214/", "312140", "722330"), 
                       direction = "long")





cbp_us_long_n <- reshape(cbp_us_medium_n, 
              varying = list(names(cbp_us_medium_n)[3:12]), 
              v.names = "n",
              idvar = c("year", "naics"), 
              timevar = "size", 
              times = c("total", "1_4", "5_9", "10_19", "20_49", "50_99", "100_249", "250_499", "500_999", "1000"), 
              direction = "long")
cbp_us_naics_n <- reshape(cbp_us_long_n, 
                          timevar = "naics",
                          idvar = c("year", "size"),
                          direction = "wide")

cbp_us_naics_n[is.na(cbp_us_naics_n)] <- 0

cbp_us_naics_n$n.311224 <- cbp_us_naics_n$n.311224 + cbp_us_naics_n$n.311222 + cbp_us_naics_n$n.311223
cbp_us_naics_n$n.311314 <- cbp_us_naics_n$n.311314 + cbp_us_naics_n$n.311311 + cbp_us_naics_n$n.311312
cbp_us_naics_n$n.311351 <- cbp_us_naics_n$n.311351 + cbp_us_naics_n$n.311320 + cbp_us_naics_n$n.311330
cbp_us_naics_n$n.311710 <- cbp_us_naics_n$n.311710 + cbp_us_naics_n$n.311711 + cbp_us_naics_n$n.311712
cbp_us_naics_n$n.311824 <- cbp_us_naics_n$n.311824 + cbp_us_naics_n$n.311822 + cbp_us_naics_n$n.311823
cbp_us_naics_n$n.311222 <- NULL
cbp_us_naics_n$n.311223 <- NULL
cbp_us_naics_n$n.311311 <- NULL
cbp_us_naics_n$n.311312 <- NULL
cbp_us_naics_n$n.311320 <- NULL
cbp_us_naics_n$n.311330 <- NULL
cbp_us_naics_n$n.311711 <- NULL
cbp_us_naics_n$n.311712 <- NULL
cbp_us_naics_n$n.311822 <- NULL
cbp_us_naics_n$n.311823 <- NULL

cbp_us_long_n <- reshape(cbp_us_naics_n, 
                       varying = list(names(cbp_us_naics_n)[3:89]), 
                       v.names = "n",
                       idvar = c("year", "size"), 
                       timevar = "naics", 
                       times = c("311///", "3111//", "31111/", "311111", "311119", "3112//",
                                 "31121/", "311211", "311212", "311213", "31122/", "311221",
                                 "311224", "311225", "31123/", "311230", "3113//", "31131/",
                                 "311313", "311314", "31134/", "311340", "31135/", "311351",
                                 "311352", "3114//", "31141/", "311411", "311412", "31142/",
                                 "311421", "311422", "311423", "3115//", "31151/", "311511",
                                 "311512", "311513", "311514", "31152/", "311520", "3116//",
                                 "31161/", "311611", "311612", "311613", "311615", "3117//",
                                 "31171/", "311710", "3118//", "31181/", "311811", "311812",
                                 "311813", "31182/", "311821", "311824", "31183/", "311830",
                                 "3119//", "31191/", "311911", "311919", "31192/", "311920",
                                 "31193/", "311930", "31194/", "311941", "311942", "31199/",
                                 "311991", "311999", "312///", "3121//", "31211/", "312111",
                                 "312112", "312113", "31212/", "312120", "31213/", "312130",
                                 "31214/", "312140", "722330"), 
                       direction = "long")


cbp_us_long <- merge(cbp_us_long_n, cbp_us_long_e, by=c("year","naics", "size"))
cbp_us_medium <- reshape(cbp_us_long, 
                          timevar = "size",
                          idvar = c("year", "naics"),
                          direction = "wide")
cbp_us_wide <- reshape(cbp_us_medium, 
                          timevar = "naics",
                          idvar = "year",
                          direction = "wide")


rm(cbp_us_long_n, cbp_us_long_e, cbp_us_medium_n, cbp_us_naics_e, cbp_us_naics_n, cbp_us_medium_e)


#update NAICS codes - note: changes start in 2012 datasets
#311224 = 311222 + 311223
#311314 = 311311 + 311312
#311351 = 311320 + 311330
#311710 = 311711 + 311712
#311824 = 311822 + 311823




















