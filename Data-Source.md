# Data source and scope

**Source:** U.S. Bureau of Transportation Statistics (BTS), TranStats T-100 Domestic Segment (U.S. carriers). The project uses five annual CSV extracts, one for each calendar year from 2021 through 2025.

- [BTS T-100 Domestic Segment table profile and field descriptions](https://www.transtats.bts.gov/TableInfo.asp?QO_fu146_anzr=Nv4+Pn44vr&gnoyr_VQ=FIM)
- [BTS T-100 segment data product reference](https://www.bts.gov/sites/bts.dot.gov/files/docs/explore-topics-and-geography/topics/airlines-and-airports/230176/reference-file-db28-segment-data-product.pdf)

The five source files contain **2,107,690 rows** across service classes. The analysis selects Class F scheduled service and applies the validity rules documented in the PDF, leaving **1,579,887 analysis rows**. Each row summarizes monthly performed nonstop segments for a carrier, route, aircraft type, and service class. It is not one flight or one unique passenger.

| Year | Source rows | Analysis rows | Months present |
| --- | ---: | ---: | ---: |
| 2021 | 381,352 | 270,662 | 12 |
| 2022 | 408,432 | 297,562 | 12 |
| 2023 | 424,178 | 318,370 | 12 |
| 2024 | 437,871 | 338,164 | 12 |
| 2025 | 455,857 | 355,129 | 12 |

**Attribution and reuse:** Cite BTS TranStats as the source. This repository starter contains derived analysis and documentation, not the raw CSV files. Check the current BTS source terms before redistributing the downloads. A license for original repository materials should be chosen separately; it must not be presented as the license for the BTS source data.
