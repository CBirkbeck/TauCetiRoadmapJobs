# Review of GaugeQuiltFieldTheory (pull request #2577 at d6aa8df)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 46 lines changed since `e5a7b31` finds the one earlier finding repaired and no new one. The shift `S_C` of §4.4 is now defined (grading shift of the last factor by the generator of the deck group `ℤ/4`, with a value on the length-zero object of `C(pt)`), and the false clause of its third Check is replaced by a true one; the three earlier small corrections, the format note and both questions are also resolved, each checked against the source at its locator. There are no small corrections and no format notes, and nothing is left for a human to decide.

## Previous findings

- R01 — repaired: §4.4 defines `S_C` as the shift of "the grading of the last factor by the generator of the deck group `ℤ/4`", and the Check now says "`S_C^4` fixes every object of positive length"; both agree with ww-coprime lines 1828–1841.
- C01 — repaired: §3.1 asks for "the product cylinder `[0,1] × X` with the pulled-back data, the identity of §0.1" to go to the identity (ww-coprime line 450); §0.1 and §2.3 distinguish product and mapping cylinders.
- C02 — repaired: §§4.4, 4.5, 5.1 and the References cite Theorem 4.2.1, Definitions 4.1.3, 4.1.5, 4.1.8 and Remarks 4.1.6(a), 4.1.9 (ww-coprime lines 1665–1690, 1828–1891); §5.1 states the source's hypotheses.
- C03 — repaired: the ambient space is "the open set of functions of codimension at most one, the excellent functions together with these", as in Cerf's property 1° (cerf-stratification line 744).
- N01 — repaired: the connected-level-set target names the route through Lemma 4.10 and Theorem 4.5, with Definition 2.12 and Lemma 2.13 (gay-kirby-morse2 lines 573–584, 917–926, 1367–1373, 1948–1953).
- First question (§4.3) — answered: "on objects every `F_L` is concatenation (§4.2), whether or not a geometric composite exists".
- Second question (§1.6) — answered: the text no longer fixes the constant; it says their trace is "a positive multiple of `tr₂`, a constant their text does not fix" (dfl-atiyah-floer lines 249–260).

## Verified sound

| statement | instances tried | values computed on each side | result |
|---|---|---|---|
| §4.4 definition of `S_C` (WW Def. 4.1.5, Rem. 4.1.6(a)) | object `(L₀,…,L_k)`; length-zero object of `C(pt)`; zero category | `(L₀,…,L_k[1])`; `() ↦ (pt[1])`, length `0→1`; one zero object fixed, `S_C = id` | determines the object; `S_C = id` excluded when a graded brane exists |
| §4.4 third Check | `S_C^4` on `(L)`; on `()`; sphere value | `L[4] = L` (deck group of order 4); `() ↦ (pt[4]) = (pt) ≠ ()`, so "positive length" is needed and stated; identity functor | true |
| §4.4 equivariance on the new length-zero value | `F_L S_C ()` against `S_D F_L ()` | `(pt[1], L)` against `(L[1])`: different objects, related by composition with the point, so coherent, not strict, as §4.4 says | consistent |
| §0.1 identity law, §3.1 extension principle (WW Thm 2.2.13(c)) | product cylinder; mapping cylinder of `φ ≠ id` | `[0,1]×X` is the identity; mapping cylinder of `φ` is invertible, not an identity; of `id` it is the product | holds; ww-coprime 450 |
| §2.3 lift on cylinders | `φ = id`; `φ ≠ id` | diagonal in `N_g⁻ × N_g`; graph of the §1.5 symplectomorphism, half-dimensional, equal to the diagonal for `φ = id` | consistent with §1.5 (line 117) |
| §3.1 codimension-one stratum (Cerf I §3.1, 1°) | ambient `F⁰ ∪ F¹` against the earlier "union of the two strata" | `F¹` of codimension one in `F⁰ ∪ F¹`, which is open in the function space | holds; cerf-stratification 744–745 |
| §3.1 connected-level-set route (GK Lemma 4.10, Thm 4.5, Lemma 2.13) | `m = 3`; ends connected | Lemma 2.13 needs `m ≥ 3`, connected ends, indefinite and ordered; ends are level sets, so connected by hypothesis | holds; gay-kirby-morse2 581–584, 917–918 |
| §1.6 comparison with DFL eq. (2.5) | sign of their trace on `so(3)` | (2.4) `−∫tr(c∧*c) > 0` forces `tr` negative definite, hence `c·tr₂` with `c > 0` by invariance; `c` not fixed in the text | holds |
| §§4.5, 5.1 field theory (WW Thm 4.2.1) | hypotheses of the source against the README's | source: `r,d` coprime positive, `Φ∘S₀ = S₁∘Φ` strictly, proof = Thm 3.5.1 then `Fuk/S` of Rem. 4.1.9; README says exactly this and what it adds | supported; ww-coprime 1835–1836, 1877–1891 |

The rows for the untouched statements stand as in the previous review, of `e5a7b31`.

- Source locators read at their lines for the changed passages: 15 (ww-coprime 8: Thm 2.2.13(c), Def. 4.1.3, Def. 4.1.5, Rem. 4.1.6(a), Def. 4.1.8, Rem. 4.1.9, Thm 4.2.1, Thm 3.5.1; gay-kirby-morse2 5: Thm 1.4, Def. 2.12, Lemma 2.13, Thm 4.5, Lemma 4.10; cerf-stratification 1; dfl-atiyah-floer 1). Seeded sample: the targets falling in changed passages (0.1, 3.1, 4.1, 4.3, 4.5, 5.1) are covered by these.
- Library declarations: none touched by the change; `Suggested.lean` is unchanged since `e5a7b31`.
- Cross-roadmap citations: the change adds none (one internal edge, §2.3 to §1.5, which resolves at line 117).
- Overlap check: read InstantonFloerTheory, FukayaTheory, HeegaardFloer; nothing shared (as in the previous review; the change adds no object).
- Dependency check: `depcheck: 200 roadmaps, 2197 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder. Automatic checks: all passed.
- Elaboration of `TauCetiRoadmap/GaugeQuiltFieldTheory/Suggested.lean`: three `declaration uses sorry` warnings (lines 59, 67, 78), nothing else.
- Pull request text: agrees with the head; it describes the shift definition, the product-cylinder identities, the Theorem 4.2.1 citations and the Daemi–Fukaya–Lipyanskiy wording, and no Lean declaration changed.

Source independence: changed passages only; 6 passages compared with 4 sources (ww-coprime, gay-kirby-morse2, cerf-stratification, dfl-atiyah-floer), none shared beyond the displayed Hom formula of Definition 4.1.5, which the mathematics forces; largest share ww-coprime, as in the previous review; no layer added, removed or reordered, so the contents comparison stands: independent.

Research link: Layers 2–5 are the connected Floer field theory of Wehrheim–Woodward (2016, Theorem 4.2.1), built on the functors of Ma'u–Wehrheim–Woodward (2018); Layer 1's rank-two case is the surface moduli of Daemi–Fukaya–Lipyanskiy's Atiyah–Floer comparison (2021), consumed by InstantonFloerTheory IF9. Rests on the README and the sources read.

## Not verifiable

- Atiyah–Bott (1983), Theorem 9.12: not read; the README cites it only as cited in the proof of Wehrheim–Woodward Theorem 3.3.3.
- Drezet–Narasimhan (1989), Theorem F: not read; mentioned only as cited in the proof of Proposition 3.3.2.
- The theorem numbering of the published Gay–Kirby (Geom. Topol. 19, 2015) was not read; the README says it cites arXiv v5, which was read.

## Source issues

- **Error** in ww-coprime at Theorem 3.3.3(a) with eq. (26) and Remark 3.2.2(b), printed pp. 17, 27, 29: the source says `c₁ = 2r[ω]` for the form built from `−Tr` with no further constant; it should be for that form divided by `4π²` (rank two: `c₁ = 2α`, `α` twice the level-one class); affects a stated result.
- **Error** in ww-coprime at Theorem 3.4.3 and its proof, printed pp. 32–33: the source says the correspondence of an elementary bordism is a principal `SU(r)`-bundle over the smaller moduli and is spin; it should be an associated bundle with fibre `SU(r)` under conjugation, relatively spin only (rank two, genus two to three: `w₂ ≠ 0`); affects a stated result.
- **Misprint** in ww-coprime at Remark 3.3.4, printed p. 30: the source says that in genus zero the moduli is empty exactly when `d/r` is an integer and a point otherwise; it should be empty when `d/r` is not an integer and a point when it is, as its own proof says; affects nothing.

## For the human reviewers

- none
