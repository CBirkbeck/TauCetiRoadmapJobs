# Review of GeometricSatakeAndFusion (pull request #1235 at 140b5a7)

**Verdict:** needs changes

Incremental re-review of the 25 lines changed since `623fd52`, and of the pull request's title and description against this head. The gate passes; five P3 findings remain, three of them in the description only.

## R01 (P3) — §0.15: the filtration still has no API list

**Location:** `TauCetiRoadmap/GeometricSatakeAndFusion/README.md:520`–526, “it sends a `B⁺_dR-lattice Λ` to the ascending filtration `Fil^m=…`” followed directly by “**Checks.**”.

**Claim:** The previous R01 asked for the filtration's functoriality and flag API as well as its Checks. The three Checks were added; the API was not, so the map is defined by a formula with no stated properties.

**Witness:** CS lines 1435–1441 (proof of Proposition 3.4.3, p. 684) give two of the missing facts: the quotients are finite projective, and the rank of `Fil^m` is the largest `i` with `k_i ≥ −m`.

**Repair:** Insert before “**Checks.**”:

> Provide the following API.
>
> - Each `Fil^m` is a direct summand of the rank-`n` fibre, `Fil^m ⊂ Fil^{m+1}`, and on the cell of `μ=(k₁≥…≥k_n)` in the CS convention its rank is the number of `i` with `k_i ≥ −m`.
> - For `g` in `GL_n(B⁺)` with reduction `ḡ` modulo `ξ`, the filtration of `gΛ` is `ḡ` applied to the filtration of `Λ`; the formation commutes with base change of the perfectoid test algebra.
> - For general `G` the flag is the compatible family of these filtrations over all representations of `G`.

Tested on `Λ=diag(ξ,1)(B⁺)²`, which is the cell of `(0,−1)`: the rank formula gives 0, 1, 2 at `m=−1,0,1`, as the first Check computes.

## R02 (P3) — The new FS page note is false for most FS locators

**Location:** `TauCetiRoadmap/GeometricSatakeAndFusion/README.md:2385`, “locators are printed pages, which differ from the PDF pages”.

**Claim:** The repair of the previous R04 replaced one global rule by its opposite. In the cited PDF the two numberings agree through printed p. 285, which covers every Chapter IV and VI locator; line 430 of the same README says “printed/PDF p. 196”.

**Witness:** FS lines 7476–7477: PDF page 196 carries the printed header 196. FS line 10994: PDF 285 is printed 285. FS lines 11168–11169: PDF 300 is printed 289. FS lines 12430–12431: PDF 344 is printed 321.

**Repair:** “Author-hosted 383-page PDF; locators are printed pages. PDF page `=` printed page through p. 285; after that the PDF pages run ahead (printed p. 321 is PDF p. 344, printed p. 334 is PDF p. 359).” This agrees with lines 430, 2125, 2171, 2240 and 2272.

## R03 (P3) — Description: the sentence about the Lean file describes declarations the head does not have

**Location:** Pull request description, “the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti, every target is in the README.”

**Claim:** A reader concludes that `Suggested.lean` states definitions and theorems. At this head it declares nothing.

**Witness:** `TauCetiRoadmap/GeometricSatakeAndFusion/Suggested.lean:8`: “None of those geometric headlines is statable at these pins”; lines 35–37 are an empty namespace. The worker's change summary: Lean declarations 0 added.

**Repair:** “`Suggested.lean` states no declaration: none of the geometric headlines is statable at the pins, and its module docstring names the missing carriers (the Grassmannian and Hecke moduli, their constructible sheaf categories, the relative perfect categories of classifying stacks). Every target is in the README.”

## R04 (P3) — Description: the dependency paragraph contradicts the README and its own task list

**Location:** Pull request description, “By section, the README uses: MotivesAndAlgebraicCycles §§6.1–6.4, the Tannaka reconstruction imported in GS4. Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite.”

**Claim:** The README consumes, by section, eleven further roadmaps that are not on main; the description's own “Depends on” block lists them as suppliers.

**Witness:** `TauCetiRoadmap/GeometricSatakeAndFusion/README.md:42`–58: the table's rows include “RelativeFarguesFontaine §§3.1–3.9, 4.7–4.13”, “VStackSheavesAndLisseCategories §§VS0–VS1, VS3; DiamondSixOperations §§S2–S6” and “EtaleDualityAndPerverseSheaves §§2.1–2.4, …”.

**Repair:** “By section, the README uses, among roadmaps still open: MotivesAndAlgebraicCycles §§6.1–6.4; RelativeFarguesFontaine §§3.1–3.9, 4.7–4.13, 6.5–6.10, 6.16, 7.0–7.6; VStackSheavesAndLisseCategories §§VS0–VS1, VS3; DiamondSixOperations §§S2–S6; EtaleDualityAndPerverseSheaves §§2.1–2.4, 2.7, 2.10, 2.12, 3.1–3.3, 5.3, 5.5–5.6; LanglandsParameterStacks §§0.4, 4.1; VectorBundlesAndIsocrystals Layer 0; AdicCoefficientsAndComparisons §§L0–L1, L3; PadicHodgeTheory §7.1; CrystallineCohomology CR.1, CR.7; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2, R07.6; InverseGaloisAndArithmeticFundamentalGroups IG.0.T2–T3. Roadmaps on main are cited by name and section. The roadmaps named under ‘Downstream consumers’ are consumers, not prerequisites.”

## R05 (P3) — Description: “red-team passes to follow” is out of date

**Location:** Pull request description, “with author-side red-team passes to follow.”

**Claim:** The branch already contains those passes and two rounds of review repairs, which changed the roadmap after this sentence was written (the Tannaka reconstruction became an import, a consumer was dropped, the convolution support statement was corrected).

**Witness:** Commits `06529748` and `ef635d84` are titled “red-team repairs”; `623fd527` and `140b5a7e` are titled as review repairs.

**Repair:** “AI assistance: GPT-6 (Codex) for the port from the accepted explorer package; author-side red-team passes and two rounds of review repairs are included in this head.”

## Previous findings

- R01 — partly repaired: §0.15, §0.34 and §0.38 gained the requested Checks (“The ranks 0, 1, 2 at `m=−1,0,1` increase with `m`”; “the chart is the cone”; “fibres of size 2 … size 1”); the filtration's API is still absent. Carried as R01.
- R02 — not repaired, and withdrawn: the folder holds `README.md`, `Suggested.lean` and `metadata.toml` only. The request was mistaken: a manifest inside the roadmap folder is a stray file under the gate, and no roadmap folder on main has one. No change is asked.
- R03 — repaired: lines 1767 and 1781 cite “VStackSheavesAndLisseCategories VS1.5, “Drinfeld’s lemma for perfect local systems””, the heading at that roadmap's README line 559; no Lean identifier is claimed.
- R04 — partly repaired: the four late locators read “IX.2 p321 (PDF p. 344)” and “IX.7.1 p334 (PDF p. 359)”, both verified; the replacement note at line 2385 is false for pp. 1–285. R02 above.
- R05 — repaired: line 532 reads “Proposition 3.4.3 and its proof, p. 684, for the filtration; 3.4.4–3.4.6, pp. 685–686”; the proposition is at CS line 1422 on printed p. 684.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.15 Check 1 (filtration) | `Λ=diag(ξ,1)(B⁺)²`, `m=−1,0,1` | `ξ^{-m}Λ∩(B⁺)²` = `ξ²e₁⊕ξe₂`, `ξe₁⊕e₂`, `(B⁺)²`; images mod `ξ`: 0, line `e₂`, rank 2. CS rank formula for `(0,−1)`: 0, 1, 2 | Pass; reversed filtration gives 2, 1, 0 | R01 (API only) |
| §0.15 Check 2 | `μ=0` | `Gr_0` = point; `P⁻_0=G`, `G/G` = point | Pass | — |
| §0.15 Check 3 | `GL₂`, `μ=(2,0)` | Weights on `gl₂`: 2, 0, 0, −2; cell dimension `⟨2ρ,μ⟩=2`; `G/P⁻_μ=P¹`, dimension 1 | Pass; 2 ≠ 1 | — |
| §0.34 new Check | `(0,0,0)`, `(1,0,0)` | `x²−yz` = 0 and 1 | Pass | — |
| §0.38 new Checks | `Fl=P¹(𝔽₂)`, `u=v=s` | Over `(x,x)`: `z≠x`, 2 flags; over `x≠y`: `z∉{x,y}`, 1 flag; `ss=1`, `s*s=s` | Pass | — |
| §0.38 against §0.39 | Same model, `q=2` | Ordinary bound `(1+1−0)/2=1`: fibre `A¹`, 2 points. Demazure bound `1+1−1=1`: fibre `G_m`, 1 point | Consistent | — |
| §3.6 supplier citation | VS1.5 at the head of VStackSheavesAndLisseCategories | Heading “Drinfeld’s lemma for perfect local systems” at README line 559, under VS1.5 at line 531 | Resolves | — |
| §4.19 (seeded sample) | FS §IX.7.1, printed p. 334, PDF p. 359 | FS line 12972: cocycle `(2ρ_Ĝ−2ρ_Ĝb)(√q)^{|w|}φ(w)`, geometric Frobenius ↦ 1; README: `t_G/t_M=(2ρ̂_G−2ρ̂_M)(κ(w))` | Agrees | — |
| §§4.16, 4.24, 4.25 locators | FS IX.2 | FS lines 12430–12434: PDF page 344, printed header 321, section IX.2 begins | Agrees | — |
| FS page note | PDF pages 196, 285, 300, 344, 359 | Printed 196, 285, 289, 321, 334 | Note false below p. 286 | R02 |

No Lean statement changed, and `Suggested.lean` still declares nothing; the rows for the untouched statements stand as in the previous review, of `623fd52`.

- Source locators checked against the text: 5 (CS Proposition 3.4.3 at CS line 1422, p. 684; FS VI.1.13 at line 7491, p. 196; FS IX.2 at line 12434; FS Definition IX.7.1 and §IX.7.1 at lines 12943 and 12957; FS VI.9.2 at line 8646).
- Seeded sample: of the fifteen targets only §4.19 lies in a changed passage; checked above.
- Cross-roadmap citations resolved: 1 changed (VS1.5, at the open head of VStackSheavesAndLisseCategories). The three Lean-name leads of the resolver are supplier targets of EtaleCohomologyFoundations, as the previous review found; line 211 is unchanged.
- Library declarations opened: none; the change touches no library claim.
- Gate at `140b5a7`: every counter 0, including build, depcheck, stray-files and outside-folder. Dependency check: `depcheck: 245 roadmaps, 2244 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder.
- Elaboration of `TauCetiRoadmap/GeometricSatakeAndFusion/Suggested.lean`: exit 0, no warning; zero declarations, so the `#check` inventory and the one-tactic probe have no candidates.
- Title and description read against the head: the summary block's sentences agree with the README (projectivity in §0.27, Galois descent in §0.7, the rational route through generic reductivity, reconstruction imported from MotivesAndAlgebraicCycles §§6.1–6.4, the downstream Hecke and spectral actions); the three sentences that do not are R03–R05.
- Overlap check: read GeometricSatakeAndFusionPartII, SheafTheoreticSmithTheory, HeckeStacksAndLocalShtukas, ReductiveGroupsPartII; nothing shared. Each cites GS0–GS4 here as owner (PartII: §§0.6, 0.32, 0.37, 4.17–4.18; SheafTheoreticSmithTheory: §0.29; HeckeStacksAndLocalShtukas: §§4.24–4.25); ReductiveGroupsPartII disclaims affine Grassmannians.
- Source independence: changed passages only; 4 passages compared with 2 sources (CS, FS), none shared beyond the filtration formula, which the mathematics forces; largest share FS, 78 of 143 locators; the diff adds, removes and reorders no layer, so the contents were not compared again.

## Not verifiable

- GLX (§4.18, untouched): paywalled at the publisher, as in the previous review; cited by locator only.
- He §§5.3–5.4 (§0.38): the locator is unchanged and was not read again; the new Checks are finite computations, recomputed above.

## Source issues

- none

## For the human reviewers

- **Licence.** No source manifest is recorded for this roadmap; its fourteen references are identified only by the URLs in `TauCetiRoadmap/GeometricSatakeAndFusion/README.md:2383`–2437. FS and CS were read from the author's page and the Annals archive.
- **Licence.** GLX (README line 2409) links a publisher PDF that is paywalled; its text was not read in any review.
