# Review of ReflectionInvariantTheory (pull request #2539 at 7001076)

**Verdict:** needs changes

**Summary.** One P2 finding blocks acceptance, and it is a one-word repair. The opening overview states the height partition, `h = |Φ|/r`, the order of a Coxeter element and the height of the highest root for "a crystallographic root system", without "reduced"; all four fail for the non-reduced system `BC₁`. Convention 7, Layer 4 and `Suggested.lean` all assume reducedness, so only the overview is wrong. The finding and both small corrections of the previous review are repaired, and the deferred anchor finding stands. There is one small correction (the same omission in the pull-request description) and no format note. The human reviewers have two facts to note.

## R01 (P2) — The overview states the height partition and the Coxeter-number statements for every crystallographic root system, and they are false for the non-reduced system `BC₁`

The overview is where a reader takes the headline theorems from, and it gives them with a hypothesis missing. Lines 19–22 read: "For the Weyl group of a crystallographic root system, `#{i : eᵢ ≥ j}` positive roots have height `j`, for every `j ≥ 1`. For an irreducible one of rank `r`, with Coxeter number `h = |Φ|/r`, a Coxeter element has order `h`". The word "reduced" does not occur in the overview. The README itself treats reducedness as a separate hypothesis: Convention 7 (line 75) asks for a "reduced, crystallographic root pairing … in Mathlib's sense", §4.5 cites Macdonald "for every reduced root system" (line 761), and every Layer 4 theorem of `Suggested.lean` carries `[P.IsReduced]`.

Take `BC₁`: `Φ = {±α, ±2α}` on a line, simple root `α`, `Φ⁺ = {α, 2α}`.
- `W = {1, s}`, one basic invariant of degree `2`, one exponent `1`.
- Height partition at `j = 2`: one positive root (`2α`) of height `2`, but `#{i : eᵢ ≥ 2} = 0`.
- `|Φ|/r = 4/1 = 4`, while the only Coxeter element `s` has order `2`.
- The highest root `2α` has height `2`, which is neither `2 − 1` nor `4 − 1`.

The smallest change is at line 19: "For the Weyl group of a reduced crystallographic root system". The following sentence ("For an irreducible one") then inherits the hypothesis. If you want, `BC₁` could also become a Check of §4.5, as the instance that shows why Macdonald's statement is for reduced systems.

## C01 — The pull-request description states the dictionary for "irreducible crystallographic root systems", also without "reduced"

The third bullet of the description's opening list reads "for Weyl groups, the height partition of the positive roots; for irreducible crystallographic root systems, the dictionary between degrees and root data". The head states both for reduced pairings only (Convention 7; `[P.IsReduced]` in the six Layer 4 theorems), and `BC₁` above is a counterexample otherwise. "for Weyl groups of reduced crystallographic root systems, …; for irreducible ones, …" would be right.

## Earlier findings

- R01 — repaired: Convention 7 now reads "'Irreducible' means `P.IsIrreducible` with `ι` nonempty: Mathlib's class alone also holds for the pairing on a line with no roots, for which `|Φ|/r` is `0/0`" (lines 81–83), and the rootless pairing is a Check of §4.4 (lines 752–755).
- C01 — repaired: Convention 8 now lists "the definition and API of systems of basic invariants (§2.1)" (lines 88–89), and the scope paragraph agrees (lines 1038–1039).
- C02 — repaired: §4.5 now makes the product formula a step ("prove Macdonald's product formula … (Macdonald 1972, Theorem (2.4) with all its variables equal, Corollary (2.5), p. 164)", lines 765–767), names Macdonald's three inputs, and its *Needs:* line lists `TauCeti.weylDenominator_eq_weylNumerator_zero`, `TauCeti.length_weylCoxeterSystem_eq`, `RootPairing.exists_mem_dominantChamber` and `RootPairing.restrictScalarsRat` (lines 782–784). The type-by-type alternative is gone.

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Overview, lines 19–22 | `BC₁`; `G₂` | `BC₁`: height 2 count `1` vs `0`; `|Φ|/r = 4` vs order `2`. `G₂`: `2,1,1,1,1` both sides | false without "reduced" | R01 |
| §1.2 Hochster–Eagon | `{±1}` on `K²`, `θ = (x², y²)`; trivial `G`, `(x, x²)` | basis `1, xy`, Hilb `(1+t²)/(1−t²)²`; `x²` is zero on `K[x]/(x) = K` | true | none |
| §2.2 Jacobian | `S₃` at `(0,1,2)`; `μₘ` | `det = −2`, `(x−y)(x−z)(y−z) = −2`; `J = m x^(m−1)`, degree `m−1` | true | none |
| §2.3 étale covers | `n = 1` Hurwitz; Artin–Schreier; `𝔾_m` | `2g−2 = −2d + (d−m) = −d−m ≥ −2` forces `d = m = 1`; degree `p` cover; degree `2` cover | true | none |
| §2.4, `shephard_todd_target` | `{±1}` on `K²`; `ℤ/2` trivial on `K`; `μₘ` | both sides false; `K[x]` polynomial and `H ⊔ ker = ⊤`; both sides true | true | none |
| §2.5 comparison | `S₂` on `𝔽₂²` at `(1,0)` and `0` | Jacobian `x − y = 1` at `(1,0)`; `𝔽₂⟦x+y, xy⟧` at `0` | true | none |
| §3.1 chambers | chamber `uC`; `{1,s}` on `ℝ²` | hyperplanes separating `uC`, `wuC` = those separating `C`, `u⁻¹wuC`; half-planes contain `V^W` | true | none |
| §3.2 crystallographic case | `A₁` in `ℝ²`; `A₂` | `{x₁>0} = ℝe₂ + (half-line of ℝe₁)`; `ℓ(w₀) = 3` inversions | true | none |
| §3.3 fixed directions | `Sₙ` on `ℝⁿ`; trivial group | one degree `1` = `dim V^W`; `n` degrees `1` | true | none |
| §3.5, `poincareSeries_coinvariants_eq_prod` | `S₃`; `ℤ/2 × ℤ/2` on `ℝ`, not faithful | `(1+t)(1+t+t²)`, lengths `1,2,2,1`; `d = 2`, `1+t` | true | none |
| §3.6, `prod_degrees_eq_card`, `sum_degrees_eq_add_card_reflections` | `S₃`; `H₃`; `H₄`; `μₘ`; `V = 0` | `6 = 6`, `6 = 3+3`; `120`; `14400`; `m = 1+(m−1)`; `1 = 1`, `0 = 0` | true | none |
| `exists_linearEquiv_coinvariants_monoidAlgebra` | `{±1}` on `ℝ`; `g ≠ 1` at `t = 1` | trivial ⊕ sign; numerator vanishes to order `n`, denominator to `dim V^g < n` | true | none |
| §3.7 bridge | `S¹`; `U(2)` | `ℚ[t]`, degree 1; weights `(1,2)`: `1/((1−t)(1−t²))` vs standard `1/(1−t)²` | true | none |
| §4.1, `poincarePolynomial_weylCoxeterSystem_eq_prod` | `A₃`; `B₂`; `G₂` | `[1,3,5,6,5,3,1]`; `[1,2,2,2,1]`; `[1,2,2,2,2,2,1]`, each on both sides | true | none |
| §4.2 `IsCoxeterElement` | `A₂`; empty `ι` | `s₁s₂`, `s₂s₁` conjugate by `s₁`, order 3; `l = []`, `c = 1` | definition right | none |
| §4.3, `charpoly_coxeterElement_eq_prod` | `A₂`; `B₂`; route | `ζ₃, ζ₃²`; `±i`; `cᵀ dfᵢ(v) = ζ^(−eᵢ) dfᵢ(v)` from `dfᵢ(ζv) = ζ^(eᵢ) dfᵢ(v)` | true | none |
| §4.4, `card_eq_card_support_mul_orderOf`, Convention 7 | `E₈`; `A₁`; rootless line | `240 = 8·30`; `2 = 1·2`; `ι = ∅` now excluded, exponent `0 ∉ ∅` | true | none |
| `height_highestRoot_add_one_eq_orderOf` | `G₂`; `B₂`; `A_(n−1)` | `5+1 = 6`; `3+1 = 4`; `(n−1)+1 = n` | true | none |
| §4.5, `card_height_eq_card_degrees` | `G₂`; `A₁ × A₂`; route | `2,1,1,1,1`; `3,1` vs `1;1,2`; exponent of `1−t^k`: `n_(k−1) − n_k = #{eᵢ = k−1}`, `n₁ = n − #{dᵢ = 1}` | true | none |
| §4.6, `exists_degree_eq_of_coprime` | `E₈`; `H₃`; `H₄`; `I₂(5)` | 8 units mod 30 = exponents; `3,7` missing; `7,13,17,23` missing; `2,3` missing | true for Weyl groups | none |
| §4.7 reducible | `A₁ × A₂` | `|Φ| = 8`, `r = 3`, `8/3`; order `lcm(2,3) = 6`; `5` prime to `6`, not an exponent | true | none |
| §5.2 Dynkin trees | `S₃`; `D₄` | `(1 2)(2 3) = (1 2 3)`, other order `(1 3 2)`; order `6` | true | none |
| §5.3 affine diagrams | `Ã₁`, `Ã₃`, `D̃₄`, `D̃₅`, `C̃_r`, `D̃_r` | swap exchanges; 4 of 8; 24 preserve; 4 of 8 exchange; `i ↦ r−i` flips iff `r` odd; fork parities differ iff `r−4` odd | true | none |
| Table of Layer 4 | `F₄`, `E₆`, `D_r` | `2·6·8·12 = 1152`; `2·5·6·8·9·12 = 51840`; `2ʳ⁻¹ r!` | true | none |

- Source locators checked against the text: Steinberg1959 §1 p. 493, Thm 1.4, Lemmas 2.2–2.3 p. 494, 4.1 and Thm 4.2 p. 497, Cor. 4.3 p. 498, Thm 6.3 p. 500, Thm 8.4 p. 503 (lines 14–22, 48, 58–65, 179–186, 203–206, 314–319, 415–416); Macdonald1972 §2.1, (2.2) p. 163, Thm (2.4), Cor. (2.5), (2.6), Cor. (2.7) p. 164, Thm (2.8) p. 165, Lemmas (2.13)–(2.14) pp. 166–167 (lines 117–141, 166–191, 203, 266, 294); Springer1974 Prop. 2.3 p. 162, Prop. 4.1, Thm 4.2 p. 170, p. 171, Prop. 4.7 p. 172 (lines 171–179, 500–513, 541–550, 608–614); Stanley1979 p. 481, Thm 3.2, Lemma 3.3, Thm 4.1, Cor. 4.4, Prop. 4.8, Cor. 4.10 (lines 305–306, 333, 370, 498, 542, 603, 648); Smith1997 Thm 1.6 p. 220 (lines 451–465); SGA1 XIII 2.12 (lines 11447–11463). All match in number, page, hypotheses and statement.
- Library declarations opened at the pins: Mathlib `LinearAlgebra/RootSystem/Irreducible.lean:148`, `BaseChange.lean:132`; Tau Ceti `LinearAlgebra/RootSystem/Chamber.lean:274,304`, `Weyl/Denominator/Identity.lean:127–142`, `Weyl/Group.lean:470,476`, `HighestRoot.lean:94,98`, `FieldTheory/FunctionField/Different/Hurwitz.lean:120`. The hypotheses the README attributes to the denominator identity and the chamber theorem are those of the pin.
- Cross-roadmap citations resolved on main: PurityOfBranchLocus §2.2 (line 198; `etale_of_etaleAt_codimOne` in its `Suggested.lean`, line 92); RootSystems §2.1, §3.2, §§3.3–3.5, Layer 4, §6.1; LieGroups Layers 5A, 6, 8; CharacteristicClasses C5.1–C5.3, C5a.2, C5a.7; LieHighestWeight Layer 7. OrthogonalTamagawaAndLatticeMass (open) cites §3 and §4 here (line 528); both resolve.
- Automatic checks: all passed, none set aside. Dependency check: `depcheck: 200 roadmaps, 2197 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives eleven `declaration uses 'sorry'` warnings and nothing else. The 13 elaborated signatures were compared with the README statements; no binder is lost and the generality agrees.
- Padding probe: `first | rfl | (simp; done) | infer_instance | (aesop; done) | sorry` in place of each `sorry`, in a copy, closed none of the eleven theorems.
- Description against the head: "63 Checks in 26 sections" counted and correct; the sections said to cite no source (§§3.3, 3.7, 4.7, 4.8, 5.3) cite none.
- Previous review: one finding and two small corrections, all repaired; D01 deferred and standing.

Overlap check: read OrthogonalTamagawaAndLatticeMass (open), RootSystems, LieHighestWeight, RootSystemsPartII (main); the results-and-headings list was empty. Shared objects: the Weyl Coxeter presentation, greatest roots and the finite Coxeter classification belong to RootSystems and Tau Ceti and are cited here; degrees, exponents, their root-height comparison and the arrangements of general real reflection groups belong to this roadmap (RootSystems line 57 agrees); `|W| = ∏ dᵢ` belongs here and OrthogonalTamagawaAndLatticeMass cites it; RootSystemsPartII shares nothing. A search of every open head for Shephard–Todd, coinvariant algebra, basic invariants, Coxeter number and height partition found consumers only (IntegralLattices, KloostermanSheavesAndBesselIsocrystals, SmoothRepresentationsOfLocalGroupsPartII).

Source independence: 32 locators read beside their claims and 12 further prose passages (routes of §§1.2, 2.3, 4.2, 4.3, 4.4, 4.5, 4.6; statements of §§3.1, 4.5, 5.2; the h.s.o.p. definition of §1.2; one docstring) compared with 6 sources (Stanley1979, Smith1997, Steinberg1959, Springer1974, Macdonald1972, SGA1); none shared beyond forced terms (three consecutive words at Smith1997 line 461). The new route of §4.5 summarises Macdonald's argument in the roadmap's own words and order. Largest share Stanley1979, 11 of 42 locators; contents compared with Stanley1979 (§§1–10): independent, Layers 3–5 have no counterpart there.

Research link: Layer 2 is the Chevalley–Shephard–Todd theorem (Shephard–Todd 1954; Chevalley 1955) with Steinberg's stabilizer theorem (Steinberg 1964). Layer 4 is the Coxeter-element and exponent theory of Coleman 1958, Kostant 1959, Steinberg 1959, Macdonald 1972 and Springer 1974, which CharacteristicClasses C5a.7 uses for the rational cohomology of compact Lie groups. Rests on the README's References and the sources read.

## Not verifiable

- Fleischmann 2000 (uncertified): cited only through Fogarty 2001, p. 5; not read.
- Bourbaki 2002 (uncertified), Hochster–Eagon 1971, Shephard–Todd 1954, Chevalley 1955, Serre 1967, Kostant 1959, Coleman 1958, Humphreys 1990, Kane 2001, Smith 1995: listed in the References with no locator in the README; not fetched.
- Fogarty 2001, Steinberg 1964 and Bott 1956 locators lie outside this round's sample and in unchanged passages; the previous review read them and they were not reread.

## Source issues

- none

## For the human reviewers

- Licence: Springer 1974 and Macdonald 1972 were read as OCR of open GDZ scans; Stanley 1979, Smith 1997 and Steinberg 1959 from the free AMS back issues; SGA 1 from arXiv math/0206203.
- `STATUS.md` in this folder (generated; unchanged by this pull request) reports Tau Ceti proofs later than the pinned commit, so several `Suggested.lean` statements may be library theorems once the pin moves.
