## Script Information

The script functions as follows: it reads in the .xlsx file, extracts the 4
relevant data points, calculates the DCIR, and puts the result and data points in a
new Excel file that is created in the same folder as the script. The same operation
is then performed on each .xlsx file in the folder.

-----------------------------------------------------------------------------------

## Setup Instructions

1. Right click on the DCIR folder and select "New Terminal at Folder"
2. In the terminal, type "bash installer.sh" to install XCode, Homebrew, Python3,
   and all dependencies for this script (pandas, openpyxl, etc). You will be
   required to enter your user password. This step can take 5-10 minutes.

-----------------------------------------------------------------------------------

## Running the DCIR calculator

1. Double click on DCIR.command.
2. A terminal window will appear, prompting you to drop an .xlsx DCIR result file
   into the terminal. Hit Return.
3. If you get an error saying "NameError: name 'sampleName' is not defined", the
   filepath for your results file has a space in it. Please remove the space or
   replace it with an underscore.
