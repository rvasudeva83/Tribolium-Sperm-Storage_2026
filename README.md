# Tribolium-Sperm-Storage_2026
Dataset for manuscript
README
The evolution of complex female sperm-storage organs
Authors: Ramakrishnan Vasudeva1, Kris Sales2, Ryan Brock3, Kayleigh Goddard4, Nadine Eggleton, Alyson J. Lumley, Andrew C. Matthews1, Matthew J. G. Gage†, Tanya M. Pennell1, Manmohan D. Sharma1 & David J. Hosken1
Affiliations: - 1Centre for Ecology & Conservation, University of Exeter, Penryn, Cornwall, UK, TR10 9EZ; 2Forest Research, Alice Holt Lodge, Farnham, Surrey GU10 4LH, United Kingdom; 3IOME - Fachbereich Biologie, Johannes Gutenberg-Universität Mainz, 55128 Mainz; 4School of Biological Sciences, University of East Anglia, Norwich Research Park, Norwich, UK, NR4 7TJ
†deceased
Corresponding author(s): [D.J. Hosken, d.j.hosken@exeter.ac.uk & R. Vasudeva, r.vasudeva@exeter.ac.uk]
Study species: Tribolium castaneum (the red flour beetle)
Funding: [RV: Commonwealth Rutherford Fellowship; INRF (award number: INRF-2017-254) & DJH: Leverhulme Trust (Grant number: RPG-2024-330)]
 
General overview
This dataset accompanies the manuscript “The evolution of complex female sperm-storage organs” It contains phenotypic, reproductive, and imaging data from experimental evolution lines of T. castaneum maintained under contrasting sex ratio treatments, together with associated sperm-storage (spermathecal) morphology, sperm-depletion, sperm-competition (P2 paternity share), and interspecific hybridization assays to estimate spermathecal (sperm storage organ) complexity.
Experimental evolution lines
Populations were maintained under one of two treatments for >90 generations, each replicated as three independent lines:
Code	Regime	Replicate lines
Male-biased (“MaleBias” / “Male.Bias”)	Female-biased sex ratio creating intense male–male competition for mates	MA, MB, MC
Female-biased (“FemBias” / “Fem.Bias”)	Male-biased sex ratio, reduced male–male competition (relaxed sexual selection)	FA, FB, FC
Line codes (e.g., “A”, “B”,“MA13”, “FC30”) combine the selection-line identifier with an individual/replicate number.
General notes applicable to all files
•	Missing/blank cells indicate no data recorded, escapee or deaths for that observation (see per-file notes for any file-specific reasons, e.g., camera/image failure, trailing blank rows from spreadsheet formatting).
•	Body size was measured as elytra length (mm) unless otherwise specified.
•	All files are plain-text comma-separated values (.csv) except one Excel workbook (.xlsx, single sheet), openable in any spreadsheet or statistical software.
•	Figure references (e.g., “Fig_2A”) in file names indicate the main-text or supplementary figure each dataset was used to generate.
 
File-by-file description
1. Female fertility Declines Blocks 1-4 at 30C_Fig 2A.csv
Egg and offspring output data used to assess female sperm limitation (“sperm shortage”) 6 days after a single mating, used to generate Fig. 2A.
Column	Description
Block	Experimental block/replicate number (1–4)
Offsp	Total number of offspring (adults eclosing) produced from those eggs
F.ID	Number of females contributing to that block (n = 20 per block)
2. Male Fertility_8.09.26_Fig 2B.csv
Offspring counts from sequential matings used to characterize male sperm depletion across successive matings, used to generate Fig. 2B.
Column	Description
M.ID	Identifier of the focal male (N=7)
B1	Number of offspring produced from that mating
B2	Number of offspring produced from that mating
F.ID	Identity of the female mated (F1–F4, i.e., mating order/sequence 1st–4th female mated to that male)
Totals	Offspring counts from (B1+B2)
3. GA1_Sperm_store_complexity_tubule_numbers_Fig_4.csv
Spermathecal tubule counts from a general/baseline (non-selection-line) population, used as part of Fig. 4.
Column	Description
Treatment	Population/treatment code (GA1 = general/baseline stock population)
ID	Individual female identifier (1–30)
Tubule_number	Number of spermathecal tubules counted for that female (measure of sperm-storage organ complexity)
Condition	Mating status of the female at dissection (Non-Virgins = previously mated)
Body.Size	Body size measurement (mm)
4. SS_treatments_Sperm_store_complexity_tubule_numbers_Fig_4.csv
Spermathecal tubule counts from females of the male-biased and female-biased selection lines, used together with file 3 to generate Fig. 4.
Column	Description
Treatment	Selection regime (MaleBias, FemBias)
Line	Replicate selection line (MA, MB, MC, FA, FB, FC)
Replicate	Replicate/individual number within line (1–17)
ID	Individual female identifier (line code + replicate, e.g., A1)
Tubule_number	Number of spermathecal tubules counted
Body.Size	Body size measurement (mm)
5. Sperm_stored_GFP_tagged_sperm_10_days_Fig_5.csv
Image-quantification data from spermathecae of females mated to GFP-sperm-tagged males, assessing sperm storage 10 days post-mating via fluorescence microscopy, used to generate Fig. 5. Multiple observers (Ryan, Ram, Kris) independently scored the same images; columns are labelled accordingly for cross-observer comparison/reliability checks. Rows 82–144 are blank (spreadsheet formatting artifact with no associated data).
Column	Description
Combo.row / Row	Row/observation index
Selection.Regime	Selection regime of the male whose sperm was tagged (Male.Bias, Fem.Bias)
Reg.Line	Replicate line code (MA, MB, MC, FA, FB, FC)
Line.Rep	Individual/replicate identifier within line
Day	Days post-mating at which spermatheca was imaged (10)
Image.ID.Ram / Image.ID / Image.ID.Ram.1 / Image.ID.Kris	Image file identifiers used by each observer/analysis pass
Mean.Ryan / Mean.Ram / Mean.Kris	Mean fluorescence intensity of GFP-tagged sperm scored by each observer
Percentcover.Ryan / Percentcover.Ram / Perccover.Kris	Percentage of the spermathecal image area covered by fluorescent (GFP+) sperm, scored by each observer
Synccheckryan / Synccheckram	Synchronization/quality-control flag confirming image identity matched across observers (1 = matched)
Area.Ram	Area (pixels) of spermatheca/sperm signal measured
Sperm.presence	Binary indicator of whether GFP+ sperm was detected in the image (1 = present, 0 = absent)
Median.Kris	Median fluorescence intensity scored by observer Kris
Mean.Mean	Average of the mean fluorescence values across observers
Mean.Perccover	Average percentage cover across observers
Mean.Perccover.Absence.Correction	Average percentage cover across observers, corrected to zero for images scored as sperm-absent
6. Offspring_counts_160_days_number_of_sperm_stored_Fig_6A.csv
Long-term offspring production (160 days post-mating) used to relate sperm storage duration/capacity to reproductive output, used to generate Fig. 6A.
Column	Description
Treatment	Selection regime (MaleBias, FemBias)
Line	Replicate selection line (MA, MB, MC, FA, FB, FC)
Replicate	Replicate/individual number within line
Offspring	Total number of offspring produced by that female over the assay period
ID	Individual female identifier
Production	Timepoint/duration of offspring production assay (160d = 160 days)
7. Sperm_stored_Spermathecal_extremes_long_Fig_6B.csv
Long-format dataset combining offspring output with spermathecal tubule number and body size for individual females from all six selection lines, used to generate Fig. 6B.
Column	Description
Treatment	Selection regime (MaleBias, FemBias)
Line	Replicate selection line (MA, MB, MC, FA, FB, FC)
Replicate	Replicate/individual number within line
Offspring	Total offspring produced by that female
ID	Individual female identifier
Tubule_number	Number of spermathecal tubules
Body.Size	Body size measurement (mm)
8. Sperm_stored_Spermathecal_extremes_Fig_6B.xlsx
Line-level summary (means) of tubule-number “extremes” (low- vs high-complexity spermathecae) contrasted against offspring production, paternity share, and sperm-storage fluorescence, used to generate Fig. 6B. Single sheet (“Sheet1”).
Column	Description
Number	Row index (1–6, one row per selection line)
Treatment	Selection regime (Male.Bias, Female.Bias)
Population	Replicate selection line (MA, MB, MC, FA, FB, FC)
Tubule.Type	Spermathecal tubule-number category contrasted in this figure (3 = low complexity, 7 = high complexity)
Avg_Offspring	Mean number of offspring produced, averaged across females of that line/category
9. P2_Conspecific_data_Fig_7A.csv
Second-male paternity share (P2) from conspecific (within-species, T. castaneum × T. castaneum) double-mating sperm-competition trials, used to generate Fig. 7A.
Column	Description
Line	Replicate selection line (MA, MB, MC, FA, FB, FC)
Treat	Selection regime (Male.Bias, Female.Bias)
Conspecific	Percentage paternity share assigned to the second (focal) conspecific male (P2, %)
10. P2_Not_producing_Hybrid_Off_Data_Fig_7B.csv
Line-level summary of the proportion of trials in which no hybrid offspring were produced, from heterospecific mating trials (presumed T. castaneum × sister species, e.g., T. freemani — please confirm identity of the heterospecific partner), used to generate Fig. 7B.
Column	Description
Line	Replicate selection line (MA, MB, MC, FA, FB, FC)
Treat	Selection regime (Male.Bias, Female.Bias)
No.Hybrids_%	Percentage of trials for that line producing zero hybrid offspring
 
Data collection & analysis
Data were collected between [2018–2022] at the University of East Anglia. Statistical analyses were performed using SPSS [version 29.0.2.0(20). R Scripts (within RStudio: 2026.07.1 Build 147) for the plots (using ggplot2, v 4.0.1) are included in this submission.
Contact
For questions regarding these data, please contact [corresponding author: Dr. Ramakrishnan Vasudeva; r.vasudeva@exeter.ac.uk].
Citation
[Full citation once accepted/DOI assigned, e.g.: Vasudeva R, Sales K, Brock R, Goddard K, Eggleton N, Lumley AJ, Matthews AC, Gage MJG, Pennell TM, Sharma MD, Hosken DJ. Data from: The evolution of complex female sperm-storage organs. PNAS. (XXXX). Dataset available at [repository/DOI].]
