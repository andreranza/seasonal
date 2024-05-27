library(seasonal)

# - FORMAT arg not specified 
# - data file is anything other than datevalue format
# - deafult data format for X-13 is free format
# - however, seasonal::import.ts uses as a default 'datevalue'.
t1 <- 
"SERIES{
  TITLE = 'Commercial and industrial machinery and equipment (except automotive and electronic) repair and main'
  START = 2014.01
  PERIOD = 12
  SAVE = (A1 B1)
  PRINT = BRIEF
  NAME = '8081130000 - HE'
  FILE = 'c:\\HE8081130000.dat'
}"


try(seas(import.spc(text = t1)))

t2 <- 
"SERIES{
  TITLE = 'Commercial and industrial machinery and equipment (except automotive and electronic) repair and main'
  START = 2014.01
  PERIOD = 12
  SAVE = (A1 B1)
  PRINT = BRIEF
  NAME = '8081130000 - HE'
  FILE = 'c:\\HE8081130000.dat'
  FORMAT = FREE
}"

try(seas(import.spc(text = t2)))

# - ( in title makes it fail
# - replace ( with - makes it work
# - X13-SAM will have options to solve that
t3 <- 
"SERIES{
  TITLE = 'Commercial and industrial machinery and equipment (except automotive and electr'
  START = 2014.01
  PERIOD = 12
  SAVE = (A1 B1)
  PRINT = BRIEF
  NAME = '8081130000 - HE'
  FILE = 'c:\\HE8081130000.dat'
}"
