# Review of SheafConvolutionOnAbelianVarieties (pull request #1809 at faf245b)

**Verdict:** accepted

Incremental re-review of the 52 lines changed since 21c53e3 (23 insertions, 29 deletions, `TauCetiRoadmap/SheafConvolutionOnAbelianVarieties/README.md` only), and the check of the pull request's title and description against this head. No finding.

## Previous findings

- The previous report (of 21c53e3) had no finding; there is nothing to account for.

## Verified sound

**What changed.** Eight `###` headings became run-in bold labels under five group headings, with their numbers kept (5.7, 5.8 under 5.6; 6.2 under 6.1; 6.4, 6.5 under 6.3; 7.2, 7.3 under 7.1; 8.2 under 8.1); five headings were retitled and five introductory paragraphs added (README lines 995, 1057, 1103, 1194, 1290). No statement, hypothesis, locator, Check or `*Needs:*` line changed; `Suggested.lean` and `metadata.toml` are unchanged.

| statement | instances tried | values computed | result |
|---|---|---|---|
| Line 995: "n=2 (§5.6) and n=3 (§5.7), … excludes … n=4 (§5.8). The classification of §6.6 consumes all three" | labels at lines 997, 1013, 1029; §6.6 `*Needs:*` (line 1164) | §5.6 is LS B.4 (n=2), §5.7 is B.5–B.8 (n=3), §5.8 is B.9 (n=4); line 1164 lists §5.6; §5.7; §5.8 | intro agrees with the three statements and the consumer |
| §5.6 (n=2), cited by the new intro | k=3, histogram 5[0]+1[1]; k=2 | binom(5,3)=10=binom(5,2), m=6=2k; k=2: binom(3,2)=3=binom(3,1), m=4; k(v′−v)=1 impossible for k≥2 | m=2k, d=binom(2k−1,k), as stated |
| §5.7 (n=3), cited by the new intro | j=1: P₁=(5,20), histogram 1,23,1, k=5 | binom(23,4)=8855; binom(23,5)+binom(23,3)=33649+1771=35420=4·8855; binom(25,5)/6=53130/6=8855=D₁ | row 8855·(1,4,1), as stated |
| §5.8 (n=4), cited by the new intro | weights 0,0,1,2, k=2; m=4,k=2 | pair sums 0,1,2,1,2,3 → 1,2,2,1, ratio 2≠11; total 6<24d | no realization in these instances, as stated |
| Line 1057: "occupancy-ratio identities and bounds (§6.1) … comparisons (§6.2). The exclusion of §§6.3–6.5 consumes both" | histogram 1,23,1, k=5 (r=4, t=19); `*Needs:*` at 1117, 1131, 1146 | R_a=1·19/5, R_b=1·4/20=1/5, sum 4=A(3,1), product 19/25<1=h(v−1)h(v+1); each of the three `*Needs:*` lines lists §6.1 and §6.2 | intro agrees |
| Line 1103: three steps §6.3, §6.4, §6.5; "§6.6 consumes the result" | n=5 row 1,26,66,26,1 | thresholds: R_a≥13 (§6.3), k≥5 (§6.4: roots of sum 26, product ≤4: 13−√165≈0.15<1, 13+√165≈25.85>25), R_b≥13 (§6.5); R_a+R_b=26 forces one regime; §6.6 needs §6.3; §6.5 | the three steps exhaust n≥5; intro agrees |
| Line 1194: summary of §§7.1–7.2 and §7.3; "§7.5 consumes both" | statements at lines 1196, 1210, 1224; §7.5 `*Needs:*` (1276) | (G*)^c trivial on constant constituents is the last sentence of §7.2 under §7.1's hypotheses; degree-zero concentration and no invariants off finitely many torsion cosets is §7.3; line 1276 lists §7.2; §7.3 | intro agrees, hypotheses not weakened (geometric origin, semisimple, no constant constituent all named) |
| Line 1290: summary of §8.1 and §8.2; "§8.3 consumes both" | statements at 1292, 1306; §8.3 `*Needs:*` (1334); c=2, M=2 | prime-to-p order and exceptional set S′ both named; box 3²=9 tuples, at most 2·3=6 bad, 3 good; §8.2 ℓ-power character, all conjugates; line 1334 lists §8.1; §8.2 | intro agrees |
| Section references to the regrouped numbers | grep of README, `Suggested.lean`, main and the open heads | every §5.7, §5.8, §6.2, §6.4, §6.5, §7.2, §7.3, §8.2 in the README resolves to its bold label; `Suggested.lean` cites only §7.4 and §2.18; no other roadmap cites a regrouped id (FourierDeligneTransform line 625 and MixedHodgeModulesAndIrregularHodgeTheory line 1183 cite §§0.3, 0.4, 0.9, 1.5, 4.3) | no citation broken |

The rows of the previous reports for the untouched statements stand as in the previous review, of 21c53e3.

**The pull request's text against this head.** Title: the pull request adds the roadmap (not on main; 1587 insertions, 0 deletions), as "roadmap" says. Each sentence of the summary block and of the prose checked against the README: convolution and the Euler-negligible quotient (lines 3, 17, 29); Fourier–Mellin generic vanishing without convolution or quotient (§0.4, whose `*Needs:*` line cites neither §0.3 nor §§0.5–0.6); Laumon–Rothstein and Schnell (line 7, §0.8); loci as unions of translated subtori ρ·T_B (§0.9); Euler-one rigidity by Fourier–Mukai, covering elliptic curves (§1.5 route and fourth Check); every m including multiples of the cohomological prime (line 27); the whole Picard class with finite stabilizers (§9.4); SL, Sp, SO outside the threefold degrees D_j (§6.7); the three consumer sentences (Downstream consumers, line 1444); folder contents (three files); validation figures (gate below). No sentence names a section number, so the regrouping contradicts none; nothing was removed against main.

- Source locators checked against the text (the sampled §5.6, the only sampled target in the changed passages): 3 of 3. LS Lemma B.4 at LS line 4452, p. 94; Lemmas B.5–B.8 from LS line 4503, p. 95 (page marker at LS line 4501); Lemma B.9 at LS line 4660, p. 96.
- Gate at faf245b, run again against `origin/main`: every check 0 (set_option, sorry-data, prnum, imports, statement-hygiene, readme-ids-missing, layer-ids, target-ids, depcheck, stray-files, outside-folder), OK; the worker's run adds build=0.
- Elaboration (`lake env lean` on `Suggested.lean`): four "declaration uses `sorry`" warnings (lines 78, 86, 98, 115), nothing else.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Files changed outside the folder: none (the three-dot diff against main outside the folder is empty).
- Declared gaps, supplier citations and `Suggested.lean` (8 declarations, 0 dropped binders): not touched by the diff.
- Overlap check: read MixedHodgeModulesAndIrregularHodgeTheory, SpringerResolutionAndCharacteristicCycles, EtaleDualityAndPerverseSheaves, GeometricSatakeAndFusion, HeightsRationalPointsAndObstructionsPartII (the open list by vocabulary; the other two lists are empty); nothing shared (their convolutions are additive on `A¹`, coherent on Steinberg-type kernels and on the affine Grassmannian; none is on an abelian variety).
- Source independence: changed passages only; 5 passages (the new introductory paragraphs) compared with 1 source (LS, at LS lines 1399, 1582, 1628, 4451, 5008), none shared; no layer added, removed or reordered, so the arrangement was not compared again (largest share LS, as in the previous reviews).

## Not verifiable

- none.

## Source issues

- none

## For the human reviewers

- none
