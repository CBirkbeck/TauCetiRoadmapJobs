# Review of PadicExtensionFamilies (pull request #2942 at bfaaef4)

**Verdict:** accepted

**Summary.** Accepted: the one-line change is correct (Crossref gives *Jump sets in local fields* as J. Algebra 593, pp. 398–476, for the DOI in the description), and a full pass over the roadmap found no false statement, no missing hypothesis and no supplier defect. Every sampled locator that could be read supports its statement, and the values recomputed for all 18 statements of `Suggested.lean` agree with the README. There are four small corrections and two format notes, none blocking. One point is left for the human reviewers (the weight of LMFDB knowls among the sources).

## C01 — This pull request and the open draft that adds §4.3 edit the same References entry, and neither says which merges first

The two heads conflict in `TauCetiRoadmap/PadicExtensionFamilies/README.md`, so whichever merges second must be rebased, and a reader of either description cannot tell which that is. The draft #2944 (Pagano's mass formula for unit filtrations) rewrites the Pagano entry to add its §4.3 locators, and its head already ends that entry with "J. Algebra 593 (2022), 398–476".

The smallest change is one sentence in this description: "Merge this first; #2944 is rebased on it and keeps its own longer Pagano entry." Closing this pull request in favour of #2944 would also settle it, since #2944 carries the same correction.

## C02 — The scope exclusion "no class field theory" reads as contradicting 6.7, which consumes ClassFieldTheory Layers 6–8

Under *Explicit scope exclusions* (line 1837) the list has "no explicit reciprocity, no class field theory, no `G_K(p)`", while the *Needs* line of 6.7 (lines 1645–1646) cites ClassFieldTheory Layers 6–7 (local reciprocity) and Layer 8 (existence, the degree–index correspondence), and the last 6.7 Check uses the norm-subgroup correspondence over `ℚ_3`. The neighbouring bullet on Newton polygons says "beyond consuming"; this one does not.

Would "no class field theory of its own: 6.7 consumes ClassFieldTheory Layers 6–8 and states none" do?

## C03 — In 3.5 the filtration transport is attributed to Number-field arithmetic 6.5, which is a different statement

Line 971 says "6.5 of Number-field arithmetic transports the local filtration". In `Completed/NumberFieldArithmetic/README.md`, 6.5 (line 1873) is the permutation-action discriminant exponent formula; the imported local filtration and its comparison with the global one are 6.1 and 6.2 (lines 1733, 1755). The *Needs* line of 3.5 lists only 5.6, so an implementer following it does not reach the comparison at all.

Cite 6.1–6.2 in the sentence and add them to the *Needs* line of 3.5.

## C04 — The two Mathlib maps named in 3.5 do not give the embedding `Gal(g over ℚ_p) → Gal(g over ℚ)`

Lines 967–968 name `Polynomial.Gal.restrictDvd` and `Polynomial.Gal.restrict` for the restriction along `ℚ ⊆ ℚ_p`. At the pin both live over one base field: `restrict : Gal(E/F) →* p.Gal` (`Mathlib/FieldTheory/PolynomialGaloisGroup.lean:117`) and `restrictDvd (hpq : p ∣ q) : q.Gal →* p.Gal` (line 230). The base-change map from `(g.map (algebraMap ℚ ℚ_p)).Gal` to `g.Gal` is neither. The mathematics of 3.5 is unaffected.

Say that the base-change embedding is a target of 3.5, built from `AlgEquiv.restrictNormalHom` on the splitting field of `g` over `ℚ` inside that over `ℚ_p`, or name the two maps as analogues only.

## N01 — Six parentheses cite line numbers of a text extraction no reader has

"pauli-sinclair line 1078" (1.4), "heiermann lines 423, 449, 460, 1261" (4.1), "miki-1981 line 524" and "line 572", "pagano line 108" and "line 219" (4.2), "pauli-roblot line 113" and "line 335" (5.1, 5.3), "monge-count line 208" (6.7). The theorem and page locators beside them suffice; the line numbers could go.

## N02 — Convention 6 has a misplaced code span

Lines 98–99: the backtick opens before `c =` and closes after `∈ ℕ`, so the words "the **height**" sit inside code. Close the span after `discriminantExponent K L` and reopen it at `H(L/K)`.

## Verified sound

### Previous review

The previous review (of the head that was merged to main) recorded no findings. Its two repaired items still stand at this head: 6.6, lines 1573–1577, "Define the **packet** relation on the family by the hidden invariants alone … (knowl `lf.packet`, its four conditions)": repaired; 1.1, lines 302–304, "Mathlib `Polynomial.comp`, `Polynomial.comp_eq_sum_left` and `Polynomial.coeff_X_add_C_pow`": repaired.

### Revision against main

Merge base `d7c8747`: the folder changes by one line (README line 2282, the published reference of Pagano). No layer, item, heading or Lean declaration is removed, renamed or renumbered; nothing outside the folder changes. Title and description describe exactly this change.

### Adversarial table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| The change: Pagano, J. Algebra 593 (2022), 398–476 | Crossref record of DOI 10.1016/j.jalgebra.2021.10.038 | title "Jump sets in local fields", volume 593, pages 398-476 | pass |
| 0.1 `w`, `ε`, tower laws | `ℚ_2 ⊂ ℚ_2(√2) ⊂ ℚ_2(∜2)`; tame cubic over `ℚ_5` | `2 = 1+1`, `1 = 1·1`; `e=3, w=0, ε=3`, `3 ∣ 5²−1` in the closure | pass |
| 0.4 square class, root field | bases `(1,√2)`, `(1,2√2)`; cyclic cubic | `8`, `32 = 8·2²`, class `2`; square, degree `1` | pass |
| 1.1 valuation formula | `x⁴+2x²+2`; `x⁸−2`; `3X+6` | `v(ρ_1,ρ_2,ρ_3) = 6,2,8`; `24,16,·,8`; `ρ = 3X`, not monic | pass |
| 1.2 vertices, rams, counts | `x⁴−2`; `x⁸−2`; `x⁴+2x+2`; `x³−5` | `(2,4)`; `(2,4,8)`; `(1/3,1/3)`, `3·(1/3)=1`; flat, no rams | pass; Greve–Pauli Lemma 4.1 |
| 1.3 `residualPolynomial_additive` | `x⁴−2`; `x⁴+2x+2`; `x⁴+2x³+2`; `x³−5` | `z²+1`, `z+1`: exponents `2,4`, `1,2`; `z+1`: `1,4`; `z³+1`: `1,4`; tame `z²+3z+3` excluded by `0<h` | pass |
| 1.3 wrong model: a sub-face | `x⁴−2`, `k=3` inside `[2,4]` | `v(ρ_3)=8`, coefficient `j=0` nonzero, `3` not a power of `2` | excluded: `IsFiniteFace` contact set is exactly `[l,u]` |
| 1.4 orbit, associated inertia | `α⁴=2` over `ℚ_4`, `δ³=1`; `z²+3z+3` over `𝔽_5` | `γ = δ⁻⁴, δ⁻⁸`: `(z²+δ², δ²z+δ)`; discriminant `−3 ≡ 2`, non-square: inertia `2` | pass; Pauli–Sinclair Thm 4.8 with list reversed |
| 1.5 `conjugateBreaks`, both theorems | `ℚ_2(∜2)` in `ℚ_2(∜2,i)`; `ℚ_2(√2)`; `ℚ_5(∛5)`; `K/K` | `v_M = 6,10,6` gives `{2,4,2}`; `{2}`; zeros `2 = 3−5⁰`; empty, `1−1=0` | pass |
| 2.1 orbit count | `S_3`, `H=C_2`; unramified quadratic; `K/K` | `1` at `0`, `3` after; `1` at `−1`, `2` after; `1` | pass |
| 2.2 `artinSlopeList` | `D_4`, `#G_t = 8,8,4,4,2,2,2,2,1`; `ℚ_2(ζ_8)`; `S_3` over `ℚ_5` | `φ(1,3,7)=1,2,3`, indices `1,2,2`: `[3,4]`; `[2,3]`; empty | pass |
| 2.3 `discriminantExponent_eq_integral` | identity; unramified quadratic; tame cubic; `ℚ_2(∜2)` | `0`; `0`; `2·1 = 2`; `3·3 + 2·1 = 11` | pass |
| 2.4 `slopePolygon_eq_of_embeddingOrbitCount_eq` | `ℚ_2(∜2)`: `(u,u') = (2,3)`, `(3,10)`, `(1,3)`; `u>u'` | `3`; `3+4(n−2)`: `7`, `11`; hypothesis fails at `v=2`; `n` forced, `x = x+0` | pass |
| 2.5 `one_add_card_filter_newtonSlopes_eq_relIndex` | `D_4`: `t=−1,0,3,5,8` | `4=4`; `4=4`; `φ_{M/L}(3)=2`: `1+3 = 4/1`; `φ(5)=3`: `2 = 2/1`; `1=1` | pass |
| 2.6 `discriminantExponent_eq_sum_artinSlopeList` | `[3,4]`; `[]` tame cubic; `K=L` | `3+4(2/4+3/2) = 11`; `2+0`; `0` | pass |
| 2.6 `den_dvd_ordCompl_count_newtonSlopes` | `x⁴+2x+2`; `x⁴−2`; `x³−3` over `ℚ_3`; `r` not a ram | `3 ∣ 3`; `1 ∣ 1`; count `2`, `2 ∣ 2`; `ordCompl 0 = 0` | pass |
| 3.3 `discriminantExponent_div_finrank_eq` | `[2,3,4]`; `[]_3^2`; `[]^2`; `[5/2]_2`; `[4/3,4/3]_3^2`; `K=M` | `3 = 24/8`; `2/3`; `0`; `11/6`; `7/6 = 28/24`; `0` | pass |
| 4.1 indices; `indexOfInseparability_eq_of_eisenstein` | `x⁴−2`; `(x+1)⁴+1`; `x⁴+2x²+2`; `x²−2` vs `x²−4x+2`; `X²+t^mX+t` | `[8,4,0]`; `[5,2,0]`; `[6,2,0]`; `[2,0]` both; `[2m−1,0]` | pass; Heiermann 3.13, 3.16, 3.17, 7.1 |
| 4.1 polygon relation | `x⁴+2x+2` | `N(2) = 2/3 < i_1 = 1`, equality at `1` and `4` | pass |
| 4.2 Miki decomposition | `−1` in `ℚ_2(√2)`; level-`2` units there | `(1+√2)²(−3+2√2)`, levels `1,3`, weights `2<3`; squares have level `2` or `≥4`, so the second level is unique | pass |
| 4.2 jump sets | `p=2, e=2` | `ρ = 2,4,5,…`, `T={1,3}`, `e*=4`; `{1,3} ↦ β = (2,1)`, `4 < 5` | pass; Pagano §1.2 |
| 5.1 `ore_realizability` | `ℚ_2`: `n=2,4,8`; `ℚ_2(√2)`, `n=2`; `𝔽_2((t))`; `n=1` | `{1,2}`; `{1,3,5,6,7,8}`; 18 values to `24`; `{1,3,4}`; odd `j`; `{0}` | pass; equals Pauli–Roblot Prop. 3.1 |
| 5.3 `krasner_refined_count` | `ℚ_2, n=2`; `n=4`; `n=8`; `ℚ_3, n=3, 9`; `ℚ_4`; `ℚ_2(√2)`; `𝔽_2((t))` | `2,4`; `4,8,16,16,16,32 = 92`; `5880`; `6,6,9`; `5085`; `6,8`; `2,4,8`; `2^m` | pass; `⌊b/p^{a+1}⌋ = ⌊(b−1)/p^{a+1}⌋` under Ore |
| 6.2 compatibility | rams `(1,3)`, `(2,4)`, `(1,4)`, `(1/3,1/3)`, `(3/2)` at `3`; `(1,2)`, `(2,2)` | geometric/arithmetic as stated; `(1,2)`: `2 ≠ 4`; `(2,2)`: `6` even, `d=2` | pass; `j=6` quartics all have rams `(1,4)` |
| 6.3 families | `ℚ_4`, `e=2` | `6` and `8` classes; fixed square classes `2+4`; `6 + 8/2 = 10` | pass; knowl `lf.family_invariants` |
| 6.4 diagram and ram counts | `[1]`, `[2]` over `ℚ_2`; `[1]` over `ℚ_4`; `[2m−1]` over `𝔽_2((t))`; `[1/3,1/3]` | `(α,β,γ) = (1,0,1)`, `(0,1,1)`; `12` polynomials; `(1,m−1,1)`; `0` points at `k=1`, `1` at `k=2` | pass |
| 6.5 masses | `[1]`, `[2]` over `ℚ_2`; `ℚ_4`; `𝔽_2((t))` | `1`, `2`, `1/2+2/4 = 1`; `12/4 = 3`; `2^{m−1}`, sum `1−2^{−M}` | pass |
| 6.6 subfamilies, packets | `x⁴+2x³+2`, `x⁴+2x³+2x²+2` | `z³+1`, `z³+z+1`; kernels `2`, `1` | pass; knowls `lf.packet`, `lf.subfamily` |
| 6.7 `monge_class_count` | `ℚ_2 (2,1)`; `ℚ_4 (2,1)`; `ℚ_2 (2,2)`; `(1,1)` | `1+3+2 = 6`; `3+7+4 = 14`; `(1+3+3+7+2+4)/2 = 10`; `1` | pass; Monge Thm 1, (6), (7) |
| 6.8 `mass_completeness` | six quadratics of `ℚ_2`; `ℚ_3` cubics; `𝔽_2((t))`, `n=2` | `2/4+4/8 = 1`; `2/3+2/9+1/9 = 1`; both sides false | pass |
| 7.1 `rootDiscr_le_galoisRootDiscriminant` | `ℚ`; `ℚ(√5)`; `ℚ(∜2)` | `1`; `5^{1/2}` both; `2^{11/4} < 8` | pass |
| 7.2 `galoisMeanSlopeAt_eq_zero_iff` | `ℚ(√5)` at `5`, `2`; `p=1` | `1/2`; `0`; junk value excluded by primality | pass |
| 7.3 `galoisRootDiscriminant_eq_prod` and bound | `ℚ`; `ℚ(∜2)`; `3.1.23.1`; `ℚ(ζ_5)`; `x⁴+2x²+2` | empty product `1`; `2^{24/8} = 8 < 16`; `23^{1/2}`; `5^{3/4}`; `2^{22/8}` | pass |
| C02 scope line against 6.7 | README lines 1837, 1645–1646 | "no class field theory" beside Needs ClassFieldTheory Layers 6–8 | small correction |
| C03, C04 pointers in 3.5 | NumberFieldArithmetic 6.1, 6.2, 6.5; Mathlib `restrict`, `restrictDvd` | 6.5 is the discriminant exponent formula; both maps have one base field | small corrections |

- Source locators checked against the text: 27, in Greve–Pauli (Lemmas 4.1, 4.2, Prop. 4.3, §4, Def. 3.2, Thm 7.4), Pauli–Sinclair (Props 3.10, 3.11, Lemmas 4.7, 5.7, Thms 4.8, 6.3), Heiermann (3.13, 3.16, 3.17, 7.1), Pauli–Roblot (Prop. 3.1, Thm 6.1), Monge 2014 (§1.2, Lemma 3, Thm 1, §2.4), Monge 2011 (Thm 1, (6), (7)), Pagano (§1.2, Thms 1.4, 1.5); six LMFDB knowls.
- Page numbers: all agree with the README's (Heiermann's are the printed preprint pages; Pauli–Roblot pp. 3 and 7 are pp. 1643 and 1647 of the journal pagination in the HAL deposit hal-00863052).
- Library declarations opened at the pin: 17, among them `TauCeti.IsFiniteFace` (`TauCeti/Analysis/Convex/Sequence/Face.lean:203`), `IsRepresentativeSet` (`…/MassFormula/Representative.lean:65`), `totallyRamifiedOfDegree` (`…/MassFormula/Basic.lean:111`), `Polynomial.newtonPolygon` (`TauCeti/NumberTheory/NewtonPolygon/Basic.lean:218`), `hasseArf` (`…/Herbrand/HasseArf/Abelian.lean:50`), `deepUnitPadicIntModule` (`…/DeepUnits/Coordinates.lean:41`). All 390 backticked names of the README were searched in the pinned sources: the only ones absent are file names, LMFDB column and knowl ids, and two roadmap names.
- Cross-roadmap citations resolved on main: RamificationOfCompleteDiscretelyValuedFields §3a.2, §4a.2 and `subgroupOf_upperRamificationGroup`; EtaleMassFormula §§1.1–1.3; ClassFieldTheory Layers 6–8; NumberFieldArithmetic 4.2, 5.1–5.3, 5.6, 5.10, 6.3, 6.5; PolynomialGaloisGroups `TransitiveGroupLabel`; ClassicalArithmeticCompletion 3.11, 3.33, 3.46, 3.52, 3.53; MassFormula (the count by discriminant is named there as a continuation); LocalFieldsRamification Layers 0–4 through its table of former layer numbers.
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/PadicExtensionFamilies/Suggested.lean`: 18 warnings, all `declaration uses sorry`, no error. One-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`, `Iff.rfl`, `norm_num`, `aesop`) on a copy: 18 failures at the 18 proof lines, so no padding.
- Binders: the seven definitions flagged as having lost a section binder (`wildRamificationExponent`, `ramificationPolynomial`, `conjugateBreaks`, `residualPolynomial`, `embeddingSubgroup`, `slopePolygon`, `indexOfInseparability`) use only the binders their bodies read; the theorems about them carry the remaining hypotheses explicitly. Nothing changed.
- Headlines: polygon-to-break, slope polygon, Ore and Krasner, mass completeness, Monge's count and the Galois root discriminant product are stated; the jump-set classification and the family theorems (compatibility, generic polynomial, family mass) are named in the module docstring as not statable, with the missing carriers.
- Automatic checks of the worker on this head: all passed, including the targeted build.

Overlap check: read MassFormula, EtaleMassFormula, RamificationOfCompleteDiscretelyValuedFields, LocalFieldsRamification, NewtonPolygons; nothing shared (Serre's formula and the Eisenstein region are MassFormula's and consumed; the class–orbit bijection and automorphism count are EtaleMassFormula's and consumed; `ψ_{L/K}` is RamificationOfCompleteDiscretelyValuedFields §4a.2; Krasner's refined count, families and the Galois root discriminant are owned here only). ArtinRepresentations, an open new roadmap, is named only as the owner of the root number. The other open pull request on this folder is C01.

Source independence: 27 passages compared with 7 sources and 6 knowls, none shared beyond formulas and forced definitions; largest share LMFDB knowls, 13 of about 70 locator citations (no table of contents), then Monge's two papers and Greve–Pauli; contents compared with Greve–Pauli §§2–9 and Monge 2014 §§2.1–2.4: independent.

Research link: Layers 1–3 formalize the invariants of Jones–Roberts (2006) and Greve–Pauli (2012); Layer 5 is Krasner's count as in Pauli–Roblot (2001); Layer 6 rests on Monge (2011, 2014) and Pauli–Sinclair (2017); 4.2 on Miki (1981) and Pagano (2022); Layer 7 on Jones–Roberts (2007). Rests on the README's references and the texts read.

## Not verifiable

- Serre, *Local Fields* (III §6 Prop. 13, IV §1 Props 3–4, IV §3 Prop. 15): paywalled; the statements taken from it were recomputed on examples instead.
- Deligne, Appendix §A.6 (Props A.6.1–A.6.2): no legal copy found.
- Jones–Roberts 2007, §2 (Layer 7): paywalled, no open version found; the product formula was recomputed.
- Miki 1981, Lemma 17: only the EuDML record page was reachable, not the scan; 4.2 is outside the sample and was checked by computation.
- Krasner 1966, Ore 1928, Fried 1974: not obtained. Knowl `lf.family_ambiguity`: the page returned a browser check.

## Source issues

- **Error** in LMFDB knowl lf.eisenstein_diagram at the section "Slopes, means, and rams on Eisenstein diagrams": the source says the drawn points in band `B_k` of index at most `k` always number `⌈r_k⌉`; it should be the integers in `[ε p^k m_k, ε p^k s_k)`, which is fewer inside a run of equal rams (`[1/3,1/3]` over `ℚ_2`, `k=1`: none); affects nothing.

## For the human reviewers

- **Scope/licence.** Thirteen of about seventy locator citations are LMFDB knowls (README lines 2286–2292), database documentation rather than refereed text; each definition taken from one also cites a refereed source (Jones–Roberts 2006, Monge 2014, Pauli–Sinclair 2017).
- **Licence.** The Greve–Pauli and Heiermann locators refer to preprints (an author page and the MPIM archive) whose numbering differs from the published versions; the README says so at lines 2242–2245 and 2261.
