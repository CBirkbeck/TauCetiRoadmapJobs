# Review of Rank24LatticeConstructions (pull request #2632 at 4e0bd8d)

**Verdict:** accepted

**Summary.** Accepted, with no findings, no small corrections and no format notes. The repair states the `K^∨/K` headline as two theorems in `Suggested.lean`: exponent 2, and the classification of the isotropic subgroups of order 2. Both are true at the pins. The three nonzero classes `[2e₀]`, `[s]` and `[𝟙/2]` have half-norms 1, 2 and 3/2, and the iff uses the quadratic notion of isotropy, which is the one under which it holds. All five earlier points are repaired. The human reviewers still have to decide on the reuse of the Conway–Sloane generator column and on the fact that *SPLAG* could not be read.

## Previous findings

- R01 — repaired: “theorem two_nsmul_discriminantGroup_constructionBLattice … 2 • x = 0” and “isIsotropic_constructionBLattice_iff_of_natCard_eq_two … H = leechShiftSubgroup ∨ ∃ x …, (x : Fin 24 → ℚ) = Pi.single 0 2 ∧ …” (`Suggested.lean` lines 113–131). Headline (3) of the docstring and §6.1 of the README name both.
- C01 — repaired: §2.2 now cites “(Chenevier 2020, §5.1 (a), (c) and §5.3)”, and §2.1 says “the generators are those of Conway–Sloane 1982, Table V”.
- C02 — repaired: “unimodularity and the root theorem it proves there only for separately glued model lattices (… `TauCeti.a11d7e6Lattice`), not for `N_r`” (`Suggested.lean` lines 43–45). The scope table rows on README lines 569, 571 and 576 now agree with it.
- C03 — repaired: “The Layer 2 theorems follow from the pinned row theorems by case analysis on the row …; the Layer 3 theorems follow from the Layer 2 ones through …” (`Suggested.lean` lines 46–51). §3.3 adds “The eliminator is a convenience lemma”.
- N01 — repaired: “is in [RootSystems](…);”, “are in [ThetaSeries](…), Layer 8” and “are in [CFSGBasicProperties](…)” (README lines 589–598). No stray apostrophe is left.

## Verified sound

| statement | instances tried | values computed (README / independent) | result |
| --- | --- | --- | --- |
| §6.1 `two_nsmul_discriminantGroup_constructionBLattice` | `[2e₀]`, `[s]`, `[𝟙/2]`; wrong model `ℤ/4` | `4e₀` (sum 4), `2s=(−3,1,…)` (mod 2 `𝟙∈C`, sum 20), `𝟙` (sum 24) all in `K`; three classes distinct and nonzero, so not cyclic | holds |
| §6.1 isotropic order-2 iff | the three subgroups of order 2, both directions | `B` = 2, 4, 3, so `q` = 0, 0, 1/2; only `⟨[2e₀]⟩` and `⟨[s]⟩` are isotropic | holds |
| same, against the bilinear notion | `B(x,x) mod ℤ` | 0, 0, 0: bilinear isotropy (`FiniteBilinearModule/Basic.lean:675`) would make all three isotropic; the statement uses the quadratic one (`Quadratic.lean:610`) | the right notion |
| same, where `∞` sits | `[2e₀]` and `[2e_j]` | `2e₀−2e_j` has sum 0 and lies in `K`, so the class is the same; `leechShift` has `−3/2` at 0 (`Leech/Basic.lean:58`), and Convention 8 sets `∞ = 0` | consistent |
| §6.1 Checks | `B(2e_∞,s)`, gluing along `[2e_∞]` | `2·(−3/2)/2 = −3/2 ≡ 1/2`; `K + (2e₀+K)` is the Construction-A lattice, which contains `2e₀` of norm 2 | holds |
| §2.2 locator (Chenevier) | Che20 lines 1069–1071, 1088–1092, 1122–1124 | (a) defines Lagrangian as isotropic with `I = I^⊥`, equivalently `|A| = |I|²`; (c) gives unimodular iff Lagrangian; §5.3 gives `|res R| = |I|²` | supports |
| §2.1 locator (Table V) | CS82 lines 355–357 | the column header is the generators of the glue words | supports |
| C02 docstring and scope table | pin rows | `_of_ne`: 4 exclusions, 19 rows (`Niemeier.lean:179`); bound on `H_r` for three rows (`IdentifiedRows.lean:107, 277, 340`), on `a2TwelfthGlueSubgroup` for `A₂¹²` (`A2Twelfth.lean:300`) | holds |
| C03 docstring route | Layer 2 to Layer 3 | `isUnimodular_lattice_iff` (`Niemeier.lean:169`) turns the order into unimodularity; `map_glueSubgroup_a2Twelfth` (`IdentifiedRows.lean:134`) is the `A₂¹²` transfer | holds |
| one-tactic probe, new theorems | `simp`, `aesop`, `exact?` | none closes either goal at the pins | not padding |

Rows for untouched statements stand as in the previous review, of `b9c5765`.

Overlap check: read OrthogonalTamagawaAndLatticeMass (open), IntegralLattices (main and its open revision), LevelOneAutomorphicFormsForClassicalGroups (open), BoundsOnCodes (open), LatticePackingsAndPerfectForms, AlgebraicCodingTheory, ThetaSeries and CFSGBasicProperties (main and open). The new §6.1 object, `K^∨/K` and its isotropic subgroups, is stated by no other roadmap. CFSGBasicProperties cites only Tau Ceti's `leechLattice` (its README line 1542 at the open head). The owners otherwise stand as in the previous review. Nothing is owned twice, and no cited id is dropped.

- Source locators checked against the text: Chenevier 2020 §5.1 (a) and (c) and §5.3, and Conway–Sloane 1982 Table V (header).
- Library declarations opened at the pin: 24 names that the diff adds or cites were elaborated by `#check`, and all resolve. Also read: `Quadratic.lean:610`, `Discriminant/Quadratic.lean:184`, `Discriminant/Group.lean:109`, `Leech/Basic.lean:58, 153–215`, `ConstructionB/Golay.lean:42–100`, `Niemeier.lean:169–206`, `IdentifiedRows.lean:125–148`, `A2Twelfth.lean:300`.
- Cross-roadmap citations resolved: the three relinked roadmaps exist on main. The Layer 6 heading that CFSGBasicProperties links to is unchanged.
- Dependency check: `depcheck: 200 roadmaps, 2197 edges, 0 problem(s)`.
- Automatic checks re-run at this head: every count is zero, OK. No files change outside the folder.
- Elaboration: `Suggested.lean` gives eight `sorry` warnings and nothing else. The elaborated types of the two new theorems match README §6.1, and no section binder is lost (the file has no `variable`).
- The pull-request description was read against this head and contradicts it nowhere: 15 Checks (recounted per section), eight theorems, two Tau Ceti imports, and the corrected pin coverage.

Source independence: changed passages only. 5 passages were compared with 2 sources: §2.1 against CS82 lines 355–357, and §2.2 and the new References entry against Che20 lines 1069–1071, 1088–1092 and 1118–1124. Beyond standard terms (“Lagrangian”, “Niemeier lattices”), none share wording. The new §6.1 prose and the two new `Suggested.lean` docstrings have no readable source to compare with. Largest share: *SPLAG*, 11 of 19 locator sites (not readable). The arrangement was not compared again, because no layer was added, removed or reordered.

Research link: the 24 lattices and their glue codes are the input to Chenevier's characteristic masses of Niemeier lattices (Chenevier 2020, §5.3, which builds on the Conway–Sloane table). Through the Leech lattice they feed the Conway groups and the lattice-packing results consumed downstream. This rests on the README's References and Downstream consumers and on Che20 §5.3.

## Not verifiable

- *SPLAG* (Conway–Sloane 1999): Chapter 7 §5, cited for Construction B and `K^∨/K` in §6.1 (README lines 480, 495 and 702) and in the new docstring (`Suggested.lean` line 112), and Chapter 16 §1 with Table 16.1. The publisher's copy is paywalled and the sources service found no legal open copy.
- Niemeier 1973, Wilson 2009 §5.4 and Ebeling 2013: the publisher copies are paywalled. None of these locators is changed by the diff.

## Source issues

- none

## For the human reviewers

- Reuse: the generator column of the Layer 2 table (README lines 119–141) reproduces the 23 generator entries of Conway–Sloane 1982 Table V (CS82 lines 358–379), in its notation and row order. The columns `h`, `A_R`, span mode and order of `H` do not appear in Table V.
- Not tested: *SPLAG*, the source with the largest share of locators (11 of 19), could not be read legally. Its wording and its table of contents were not compared.
- Scope fact: the `Suggested.lean` docstring (lines 46–51) says the six Layer 2–3 statements are assembled from pinned row theorems by case analysis. The roadmap's remaining new targets are §3.3, §4.1, §5.1, §5.2 and §6.1.
