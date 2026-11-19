# Review of ArithmeticStatisticsPartVIII (pull request #1179 at e223db6)

**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the six lines changed since `7a814c7`. The three changed sentences (the guide's line on §5.22, the downstream consumer of §5.17, and the mapping of the two former §5.16 titles) are each true against the `*Needs:*` lines, the consumer's open head and the citing roadmaps on main, and the title and description agree with this head. The previous review had no finding; its four small corrections are repaired and its two format notes are carried, none blocking. The three questions for the human reviewers stand.

## N01 — Three `*Needs:*` lines in §5.17 omit what their proofs name

Carried from the previous review, unchanged at this head. *Overlapping symplectic subgroups generate* (line 779) lists only `Matrix.symplecticGroup`, while its proof applies `TauCeti.GLSymplecticFin.eq_top_of_adjacent_of_long`; *Mod l hyperelliptic monodromy is symplectic* (line 795) and *Monodromy of the odd degree polynomial family* (line 863) list Layer IG.0 (and IG.1), while their proofs use §IG.5.7. Add the items.

## N02 — Link labels and unqualified names

Carried, unchanged. Four links (lines 1531, 1535, 1569, 1571) are labelled “complements of a coprime abelian normal subgroup are conjugate” but point to the heading *Sections of a coprime abelian semidirect product*; use the heading's title. “similitudeGroup” (line 909) and “Mathlib symplecticGroup” (line 897) are bare names: write “the similitude group of ArithmeticGaloisRepresentations §7.3” and `Matrix.symplecticGroup`.

## Previous findings

The previous review (of `7a814c7`) had no finding (no R01); its small corrections and format notes are accounted for here.

- C01 — repaired: line 1629 now ends “The titles *Tor spectral sequences over graded algebras* and *Uniform Betti numbers of Hurwitz schemes*, under which other roadmaps cite §5.16 of this part, name … its Layer 1 … and the bound of its §5.3; §5.16 here states neither.”
- C02 — repaired: line 1603 now reads “CountingBundlesAndHallAlgebrasOfCurves §4.10 (density of curve Weil tuples) uses the `Sp_{2g}(ℤ_ℓ)` geometric monodromy of the odd-degree hyperelliptic family from §5.17”; the two unsupported consumers are gone from README and description.
- C03 — repaired: line 19 now lists the marked-extension counts of Layer IG.4, the trace formula and Hurwitz counts of Layers IG.0 and IG.5, DeligneWeightsAndPurity's weight bound, the top-degree trace of §5.16, Part I's reciprocity and Dirichlet's theorem.
- C04 — repaired: the description now says “(its §5.3), which the moment estimate of §5.19 feeds into the trace estimate of §5.16”.
- N01 — not repaired: lines 779, 795 and 863 are as before; carried as N01.
- N02 — not repaired: lines 897, 909, 1531, 1535, 1569 and 1571 are as before; carried as N02.

## Verified sound

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| Guide line on §5.22 (line 19) against the `*Needs:*` lines of §5.22 (lines 1517, 1535, 1553, 1571) | union of the four lines, item by item | Needs: IG.4 (§IG.4.5), IG.0, IG.5, DeligneWeightsAndPurity 7.12, §5.16 top-cohomology target, Part I reciprocity, Mathlib Dirichlet, CRT, complements. Guide: all nine covered (last two as “group theory”) | agrees |
| Consumer of §5.17 (line 1603) against *Monodromy of the odd degree polynomial family* (line 857) | consumer's §4.10 hypotheses: `q₀` odd, `ℓ ≥ 5` prime to `q₀`; target: `ℓ` odd, `2ℓ` invertible, `n = 2g+1 ≥ 3` | consumer's case lies inside the target's; group named on both sides `Sp_{2g}(ℤ_ℓ)`; at `g = 1, ℓ = 3` the README's value `648 = 24·27 = |SL₂(ℤ/9)|` recomputed | agrees; anchor resolves to line 857 |
| Mapping of the former §5.16 titles (line 1629) | the citing passages on main | 2 titles, 3 citing passages (InverseGaloisAndArithmeticFundamentalGroupsPartII lines 440 and 1859; SpectralSequencesAndConvergencePartII line 88); targets named: its Layer 1 (line 753, taking DGAInfinity Layer 5) and its §5.3 (line 1742); §5.16 here has 2 targets, neither of them | agrees |

The rows for the untouched statements stand as in the previous review, of `7a814c7`; the diff changes no statement and no Lean declaration.

- Source locators checked against the text this round: 0 (the changed passages carry none; the seeded sample falls in none of them).
- Library declarations opened at the pin: 0 new; the changed text names none beyond those the previous review opened.
- Cross-roadmap citations resolved: 6 (CountingBundlesAndHallAlgebrasOfCurves §4.10 at its open head, lines 655–661 and 690; InverseGaloisAndArithmeticFundamentalGroupsPartII Layer 1, §5.3 and its three citing passages on main; SpectralSequencesAndConvergencePartII line 88; DeligneWeightsAndPurity 7.12, line 2364).
- Dependency check: `depcheck: 200 roadmaps, 2205 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder, which holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: five `declaration uses 'sorry'` warnings (lines 63, 73, 84, 95, 123), no error; the file is unchanged since `7a814c7`, so the `#check` comparison and the padding probe of that review stand.
- Pull request text: title, summary block and prose read sentence by sentence against the head and the folder's change (a new roadmap, 3 files, 9 Lean declarations, suppliers as named); no sentence contradicted, no change left unstated.
- Overlap check: read ArithmeticStatisticsPartVII, ArithmeticStatistics, ArithmeticStatisticsPartVI (open), ArithmeticStatisticsPartI, ArithmeticStatisticsPartV, InductionRestrictionPartII (main), as in the previous review, and CountingBundlesAndHallAlgebrasOfCurves §4.10 for the changed sentence; nothing newly shared. Owners unchanged: Hurwitz stability and Betti bounds, InverseGaloisAndArithmeticFundamentalGroupsPartII; fixed-fibre counts and parity series, InductionRestrictionPartII; families, Part I; joint-cokernel laws, Part VII; the §5.17 monodromy, this part (the consumer cites it, does not restate it).

Source independence: changed passages only: 3 passages compared, none cites or paraphrases a source (0 sources), none shared; largest share ref-37, 33 of 110 locators; contents compared with ref-37 in the previous review: independent (no layer added, removed or reordered since).

Research link: §§5.15–5.19 prove Ellenberg–Venkatesh–Westerland (2016), Theorems 1.2 and 8.8; §§5.20–5.21 Wood (2019), Theorems 1.2 and 4.8; §5.22 Liu–Wood–Zureick-Brown (2024), Theorem 1.4; §5.12 Browning–Le Boudec–Sawin (2023), §5; §§5.13–5.14 Lipnowski–Tsimerman (2018), §5. Rests on the README's sources, read in the previous review.

## Not verifiable

- The published numbering of ref-45, ref-46 and ref-51, and the Duke page numbers beside the arXiv locators of ref-50: only the arXiv versions were read (previous review).
- The sentence of *Downstream consumers* that LocalGaloisDeformationRings consumes ArithmeticGaloisRepresentations §7.3: untouched by this change and not opened again.
- DGAInfinity Layer 5 as the home of the graded `Tor` spectral sequences: DGAInfinity on main has no heading of that name; InverseGaloisAndArithmeticFundamentalGroupsPartII declares it as a supplier gap, and this part consumes nothing from it.
- Ownership against open pull requests was checked through the search of their heads, not by reading each roadmap.

## Source issues

- none

## For the human reviewers

- **Scope.** `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md` on main (lines 111–122, 440–442, 1859–1861) and `TauCetiRoadmap/SpectralSequencesAndConvergencePartII/README.md` (line 88) still describe §5.16 targets this part does not have; line 1629 here now maps the titles, the passages on main need a follow-up edit.
- **Scope.** §§5.13–5.14 are conditional on Lipnowski–Tsimerman's Conjecture 5.2 and on an analogue (H2, line 339) that the README formulates itself; ref-45 states only the CM case, with thresholds the README halves.
- **Scope.** The Kolmogorov distance of §5.14 is also defined in §1.1 of the open MathematicalStatisticsHigherOrderAndResampling, which the merge order does not list; one of the two should cite the other.
- **Licence.** ref-48 and ref-52 are read from author-hosted PDFs.
