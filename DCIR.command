#!/usr/bin/env python3
import os
import pandas as pd
import openpyxl
import glob
import xlsxwriter
import subprocess


## Get filepath from user, get battery sample name from filepath
filepath = input('\nDrop your .xlsx DCIR result file here:\n\n')
filepath = filepath.strip()
lastSlash = filepath.rindex("/")


## Scan folder for other other result files
sampleFolder = filepath[:lastSlash]
xlsx_files = glob.glob(os.path.join(sampleFolder, "*.xlsx"))


## Loop over the list of result files

output = []

for f in xlsx_files:

	## Read in result file, focusing on Amps, Volts, and State columns
	df = pd.read_excel(f, engine='openpyxl', header=1, usecols= range(7,10))

	sampleNameIndex = f.rindex("/")
	sampleName = f[sampleNameIndex+1:-9]


	## Filter State column down to only Discharges
	dischargeStep = df['State'] == 'D'
	
	dataFrame = df[dischargeStep]	
	lastDischarge = dataFrame.iloc[-4:]

	iBase = lastDischarge.iloc[1,0]
	vBase = lastDischarge.iloc[1,1]
	iPulse = lastDischarge.iloc[3,0]
	vPulse = lastDischarge.iloc[3,1]


	DCIR = abs((vPulse - vBase)/(iPulse - iBase))

	output.append([sampleName, DCIR, vBase, vPulse, iBase, iPulse])
				

outputDF = pd.DataFrame(output, columns = ['Sample', 'DCIR', 'V_base',\
'V_pulse', 'I_base', 'I_pulse'])

outputFileName = sampleName[:-2]
outputFileName = outputFileName + '.xlsx'
outputDF.to_excel(outputFileName, engine = 'xlsxwriter')

subprocess.run(['open', outputFileName], check=True)
print('Done!')
