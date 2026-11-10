# Review of WeilConjectures (pull request #1208 at 9587601)

**Verdict:** accepted

This is an incremental re-review of the 125 lines of `TauCetiRoadmap/WeilConjectures/README.md` that changed since e79b1b6. `Suggested.lean` and `metadata.toml` did not change, and nothing outside the folder changed. All four previous findings are repaired. The repairs introduced no new defect, and the gate passes. This review raises no findings.

## Previous findings

- R01 — repaired: §5.19 now says “Prove that the `zetaSeries` of `E` equals `WeierstrassCurve.zetaFunction` of `W`”, with the route through `coeff_finrank_logOf_zetaFunction`, `isPullback_projModelBaseChange` and `projModelPointsEquiv`. §§7.4–7.6 cite the pinned declarations, and the contracts list modules and `[W.IsElliptic]`.
- R02 — repaired: the description now reads “Open pull requests: #849 (AbelianSchemesAndArithmeticModuli), … #1062 (PadicHodgeTheory) … Roadmaps on main: SchemeAndStackFoundations, EtaleCohomologyFoundations, AlgebraicCurves, EllipticCurves, ReductiveGroupsPartII and the completed AnalyticToricGeometry.”
- R03 — repaired: `README.md:1279` “Prove that potentially semistable extensions of a trivial representation by a trivial representation are unramified: for `n ≥ 1`, a continuous representation `V` of `G_{ℚ_ℓ}` … with trivial action on `ℚ_ℓ^n` and on `ℚ_ℓ`, is unramified”.
- R04 — repaired: `README.md:1229` “and `s` a natural number”. The section adds “Also `P_j = 0` whenever `2j ≥ s` and `j > d`”, three Checks (one of them the `s = 0` instance on `ℙ²`), and the source of BFP's range `s ≥ d`.

## Verified sound

**Gate.** I ran the gate on this head:

```text
gate WeilConjectures: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate on the same head also records `build=0`.

**Dependency check.** With the given merge order and `--movable`:

```text
depcheck: 234 roadmaps, 2275 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. WeilConjectures is at line 125 of the merge order. The diff adds no roadmap supplier. It drops AlgebraicCurves Layers 7 and 10 in favour of pinned Tau Ceti declarations and keeps AlgebraicCurves Layer 12 and EllipticCurves Layer 3, both on main. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Elaboration.** `lake env lean TauCetiRoadmap/WeilConjectures/Suggested.lean` at Mathlib 1b1ccf4 and Tau Ceti 2fd255d gives six `declaration uses sorry` warnings, at lines 70, 80, 94, 105, 122 and 145, and nothing else.

**Carried forward.** `git diff e79b1b6 HEAD` touches only `README.md`, so the previous review's results for the Lean file still hold:
- the `#check @name` comparison of all eight signatures, with no lost section binder;
- the one-tactic probe, in which all six theorems resist `simp`, `rfl`, `infer_instance` and `exact?`;
- the headline list.

The §5.19 comparison is now statable at the pins, but it is a compatibility target, not a headline, so its absence from `Suggested.lean` is correct.

**Library declarations opened at the pins (31).**

Tau Ceti 2fd255d, `AlgebraicGeometry/EllipticCurve/Isogeny/Frobenius/Zeta.lean`:
- `zetaRatFunc` (l. 93) and `mobiusAutOf_zetaRatFunc` (l. 112) are in a section with only `[Finite F]`. This confirms “Neither needs ellipticity”.
- Under `[W.IsElliptic]` (l. 144): `zetaFunction` (l. 153), `constantCoeff_zetaFunction` (l. 171), `logOf_zetaFunction` (l. 176), `coeff_finrank_logOf_zetaFunction` (l. 184; the conclusion is `(W⁄E).pointCount / finrank`), `zetaFunction_eq_mul_inv` (l. 220), `coe_zetaRatFunc` (l. 232), and the RH lemma (l. 244; `‖z‖ = (√q)⁻¹`).

Tau Ceti, `…/Frobenius/PowTrace.lean`:
- `frobeniusPowTrace` (l. 83, `qⁿ + 1 − deg(1 − πⁿ)`), `_zero` (l. 94), `_one` (l. 100), `_finrank` (l. 117) and `_add_two` (l. 178). All carry `[W.IsElliptic]`.

Tau Ceti, the Weierstrass model and point counts:
- `PointCount.lean`: `pointCount` (l. 73), `pointCount_eq_card_point` (l. 86, with finite solutions and `IsElliptic`) and `frobeniusTrace` (l. 101).
- `Scheme/ProjModel.lean`: `projModel` (l. 98, `R : Type u`, `Scheme.{u}`), `projModelOver` (l. 103) and `isProper_projModelOver` (l. 108).
- `Scheme/Smooth.lean`: `smoothOfRelativeDimension_one_projModelOver` (l. 199, `[W.IsElliptic]`).
- `Scheme/BaseChange.lean`: `isPullback_projModelBaseChange` (l. 231).
- `Scheme/Points.lean`: `projModelPointsEquiv` (l. 874; a field, `[W.IsElliptic]`, sections ≃ `W.toAffine.Point`).

Tau Ceti, `FieldTheory/FunctionField/ArtinSchreier/Monomial.lean`:
- `FunctionField` (l. 90), `isIntegrallyClosedIn` (l. 195), `existsUnique_restrict_eq_infty` (l. 241), `two_mul_genus` (l. 327) and `genus_functionField_two_three` (l. 341). The hypotheses are `[Fact p.Prime] [CharP k p] [Fact ¬p ∣ m]`, as the README says.

Mathlib 1b1ccf4:
- `FiniteField.Extension` (`FieldTheory/Finite/Extension.lean:48`). It has type `Type` and needs `[NeZero n]`, so it shares a universe with `zetaSeries`'s `k : Type`, as `isPullback_projModelBaseChange` requires.
- `finrank_extension` (l. 81).
- The instance `(W.map f).IsElliptic` (`AlgebraicGeometry/EllipticCurve/Weierstrass.lean:455`).
- The notation `W⁄A := baseChange W A` (l. 239), which is `W.map (algebraMap _ A)`.

Together these make §5.19's route type-correct at the pins:
1. Over-category morphisms from `Spec k_r` to `E` are sections of the base change, by the pullback square with `f = algebraMap k k_r`.
2. Those sections are `(W⁄k_r).toAffine.Point`.
3. These are counted by `pointCount_eq_card_point`.
4. The degree-zero inner coefficients agree: `0`, and `deg(1 − π⁰)/0 = 0` in `ℚ`.

**Cross-roadmap citations resolved.**
- EllipticCurves (main) Layer 3 is at its README l. 683, and the zeta milestone, items (i)–(iii) plus the functional equation and RH, is at l. 769.
- AlgebraicCurves (main) Layer 12 is at l. 1468. 12B.0 (model, closed-point/place dictionary) is at l. 1492, and 12B.0b (geometric integrality, smoothness over perfect `k`) at l. 1524. §7.6 cites exactly these.
- The resolver's three unresolved names (`VanishingCycles.*`, README l. 130) are in unchanged text. The previous review resolved them as EtaleCohomologyFoundations-planned names.

**Ownership of the changed objects.** I searched with `roadmaps grep` over main and the 449 open heads.
- CurvesOverFiniteFields §4.2 (its README ll. 1241–1267) compares Tau Ceti's `zetaFunction` with FunctionFieldArithmetic's function-field `zeta k F`. That is a different carrier from WC's scheme-level `zetaSeries`, so there is no second owner. It is also later in the merge order (line 359).
- EllipticKTheory (its README l. 285) only cites `projModelPointsEquiv`.
- The overlap file lists no dropped or revision-only ids.

**Sources checked for the changed passages.** Ids are those the sources service printed for this review. These texts were fetched without a manifest, since the roadmap has none and this review edits none.

| Id | Text | Printed page |
| --- | --- | --- |
| `vdbe` | van den Bogaart–Edixhoven, arXiv math/0505178v3 | page marker |
| `bfp` | BFP, authors' copy of the published text | page marker + 1322 |
| `milne-lec` | Milne, LEC v2.21, author's notes | page marker (header at l. 6062 reads 159) |
| `mustata` | Mustață, author's notes | page marker − 6 |

| Changed locator | Lines read | Result |
| --- | --- | --- |
| §5.23: BFP Prop. 3.1 “states the conclusions for `s ≥ d`”, p. 1330 | `bfp` 297–317 | Fix an integer `s ≥ d`. The conclusions are odd vanishing for `i ≥ s` and `dim H^{2i} = P_i` with eigenvalues `p^i` for `s/2 ≤ i ≤ d`. Matches. |
| §5.23 and §5.16: vdBE Lemma 4.1, pp. 6–7, “error exponent `d` and degree bound `r` satisfy `d ≤ r ≤ 2d`” (§5.16: `s ≤ r ≤ 2s`) | `vdbe` 203–245 | Hypotheses `d ≤ r ≤ 2d` and error `o(p^{nd/2})`. Conclusions: odd vanishing for `i ≥ d`, `P_i = 0` for `i > r/2`, and exact even terms for `d/2 ≤ i ≤ r/2`. The proof spans pp. 6–7. Matches. |
| §5.25: vdBE Lemma 4.2 and its proof, pp. 8–9 | `vdbe` 307–361 | The statement and proof run from p. 8 to the end of the proof on p. 9. The Minkowski step is on p. 10 (365–371). The References entry “Lemma 4.2 and the proof in §4, pp. 8–10” is therefore also right. |
| §5.19 source: Milne Thm 27.15, p. 159 | `milne-lec` 6060–6109 | Purity for nonsingular projective varieties is on p. 159. |
| §5.19, §7.5 source: Mustață Ex. 3.10, pp. 22–23 | `mustata` 1201–1207 | The genus-one zeta function, with `a = 1 + q − #X(𝔽_q)`, is on pp. 22–23. |

**Seeded sample.** §5.16 is cited by the changed §5.23, and its locators are verified in the table above. The other fourteen targets of the sample are outside the changed passages and are not re-reviewed in an incremental round: 1.9, 1.16, 2.2, 2.4, 5.1, 5.2, 5.5, 5.6, 5.8, 5.26, 6.4, 6.8, 7.7 and 7.11.

**Adversarial table.** The rows for changed statements were computed for this review. The rows marked r4 are carried from the previous review, PRREVIEW-WeilConjectures~4, for statements this diff leaves untouched.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Contract: `zetaRatFunc`, `mobiusAutOf_zetaRatFunc` | `y²=x³−x/𝔽₅` (`a=−2`); cusp `y²=x³/𝔽₅` (`a=0`, not elliptic) | At `1/(5T)` the numerator is `(5T²+2T+1)/(5T²)` and the denominator `(1−5T)(1−T)/(5T²)`, so the ratio is `Z(T)`. Cusp: `(1+5T²)/(5T²)` over the same denominator, also invariant. So the identity holds without ellipticity. | Sound |
| Contract: `coeff_finrank_logOf_zetaFunction` | `E = 𝔽₅` and `𝔽₂₅` over `𝔽₅` | `n=1`: coefficient 8 = 8/1. `n=2`: 16 = 32/2. | Sound |
| Contract: `frobeniusPowTrace`, `_add_two`, `_finrank` | same curve | `t = 2, −2, −6, 22`. `N₃ = 126 − 22 = 104 = |1−π³|²`, with `π = −1+2i` and `1−π³ = −10+2i`. Both 32 and 104 are multiples of `N₁ = 8`. | Sound |
| Contract: RH lemma | same curve | Zeros of `1+2T+5T²` are `(−1±2i)/5`, with `|z|² = 1/5 = (√5)^{−2}`. | Sound |
| Contract: `projModelPointsEquiv`, `pointCount_eq_card_point` | same curve | 7 affine solutions plus the zero section gives 8 sections, which is 8 points. | Sound |
| §5.19 comparison | same curve; affine-only count; cusp | Inner coefficients: `r=0`: 0 = 0; `r=1`: 8 = 8; `r=2`: 16 = 16. Affine-only: `a = −1`, numerator `1+T+5T²`, first log coefficient `1+5+1 = 7 ≠ 8`. Cusp: `N_r = 5^r+1`. `zetaRatFunc` gives `N₁ = 6`, which agrees, and `N₂ = 26 + 10 = 36 ≠ 26`. | Sound |
| §5.19 signed equation (Lean §6.6 form) | same curve | `U = 1+2T+5T²` and `V = (1−T)(1−5T)` are coprime, since `U(1) = 8` and `U(1/5) = 8/5`. `χ = 2−2 = 0`, `Δ = 1`, `Δ² = 5⁰`, so `Z(1/(5T)) = Z(T)`. | Sound |
| §5.23 local cutoff, `s` unrestricted | `ℙ²`: `(s,P) = (0, 1+T+T²)`, `(1, T+T²)`, `(7, 1+T+T²+T³)`; `ℙ¹` with `s = 3 > 2d`, `P = 7+T`; `d=0` with `Spec ℤ_{p²}` | Errors 0, 1 and `−p^{3n}`. The last is `o(p^{sn/2})` iff `s ≥ 7`, and then only `j ≥ 4` is constrained, so `P₃` is free. `ℙ¹`: error `−6` is `o(p^{3n/2})`. Only `P_j = 0` for `j ≥ 2` is concluded, and `P₀ = 7 ≠ 1` is allowed. `Spec ℤ_{p²}`: counts `2·[2∣n]`. `s = 0` fails for every constant `P`. `s = 1` holds and forces `P` constant. The Lean conjunct `s ≤ 2j → r < 2j` with `r = 2d` is the README's “`j > d`”. | Sound |
| §5.25 local extension lemma | `n = 1`: unramified class; `log χ_cyc` class; `V = ℚ_ℓ(1) ⊕ ℚ_ℓ` | The unramified class is crystalline and unramified. The `log χ_cyc` class is not Hodge–Tate, so it is not pst and is excluded. `ℚ_ℓ(1) ⊕ ℚ_ℓ` is crystalline, is an extension of `ℚ_ℓ` by `ℚ_ℓ(1)`, and is ramified, so the new explicit trivial-action hypothesis is necessary. | Sound |
| §7.4, `g = 1` | general `q` | `Π₁ = 1+c₁T+c₂T²`, and `qT²Π₁(1/(qT)) = c₂/q + c₁T + qT²`, so `c₂ = q`. `S₁ = −c₁ = q+1−N₁`, so `c₁ = −a`. `S_r = frobeniusPowTrace r`, with `S₀ = 2 = b₁`. | Sound |
| §7.5 worked example | `y²=x³−x/𝔽₅` | Affine counts 1, 1, 2, 2, 1 give 8, so `a = 6 − 8 = −2`. Roots `−1±2i`: sum −2, product 5, modulus `√5`. `S₂ = −6`, so `N₂ = 32`. `χ = 1−2+1 = 0`. `Δ = 1·5⁻¹·5 = 1`, the same `∏det^{(−1)^i}` convention that gives `q³` on `ℙ²`. | Sound |
| §7.6 Artin–Schreier model | `p=2, m=5`; `m=3`; `m=4` (excluded) | `2∤5`, `2g = 1·4 = 4`, so `g = 2`. `m=3`: `g = 1`. `m=4`: `y = y′ + x²` turns `y²+y = x⁴` into `y′²+y′ = x²`, and the formula would give `2g = 3`, so the hypothesis `p ∤ m` is needed. | Sound |
| 5.16 `graded_polynomial_approximation` (r4, plus a new case) | r4: `p=2`, `(r,s) = (2,0)`, `(4,2)`. New: `s > r` | r4: errors 0 and 1, `P₀ = b₀ = P₁ = b₂ = 1`, constant below the cutoff. `s > r`: only `P_j = 0` for `2j ≥ s` is asserted, consistent with the source's range `s ≤ r ≤ 2s`. | Sound |
| 1.1 `arithmeticZeta_absoluteConvergence` (r4) | `Spec ℤ`; `Spec 𝔽₄`; empty | `Σ p^{−σ} < ∞` for `σ > 1`; one factor; empty sum. | Sound |
| 1.2 `zetaSeries` (r4) | point; degree-two point; `𝔾_m/𝔽₃` | `1/(1−T)`; `1/(1−T²)`; `1+2T+6T²+18T³`. | Sound |
| 1.6 `normalized_integral_zeta_presentation` (r4) | `𝔾_m/𝔽₃`; point; empty | `U = 1−T`, `V = 1−3T`; `U = 1`, `V = 1−T`; `U = V = 1`. | Sound |
| 1.8, 1.13–1.15 (r4) | `BS₃/𝔽₅`; `ℙ¹/𝔽₂`; sieve with two fibres | Mass `1/6+1/2+1/3 = 1`. `Z⁻¹ = 1−3T+2T²`. `2 + (−1−q) + q = 1`. | Sound |
| 2.1/2.3, 2.4 (r4) | `ℙ²`; point, `r = 2` | `ε = −1`; `ε₂ = −1` while `ε² = 1`. | Sound |
| 5.1, 5.4, 5.9/5.10 (r4) | `β=(2,3)`; `α=(2,2)`, `w=(1,−1)`; 𝔽₂ versus `ℤ/4` | Moments 8 and 21 recover 3 and 5. Zero total weight gives no claim. `B = 0` over 𝔽₂ and `DG = B` over `ℤ/4`. | Sound |
| 5.18, 5.24, 5.28 (r4) | `Spec 𝔽_{q³}`; `ℙ²` and the empty family; `q = 5` surface | `N_r = 3[3∣r]`. `C = 1+T+T²`, and `C = 0` for the empty family. `E² = −10`, `DE = 2`, `|a| ≤ 2√5`. | Sound |
| 6.2–6.5, 6.8 (r4) | zero cone; seven-ray fan; `𝔾_m`; `BC₂/𝔽₃` | Empty fan: proper but not complete. Ten determinants ±1, `7−15+10 = 2`. Weights 0 and 2. Trace 1 = mass 1. | Sound |
| 6.6 `functional_equation_of_smooth_proper` (r4) | `ℙ²/𝔽₂` at `T=2`; `Spec 𝔽_{q²}`; genus 2 | `Z(1/8) = 64/21 = −8·8·Z(2)`, so `Δ = 8`. `Δ = −1`. `Δ = 1/2`. | Sound |
| 7.2, 7.6 counts, 7.8, 7.10, 7.15 (r4) | two degree-two points; `y²+y=x⁵`; `𝔾_m/𝔽₃`; quadrics | `(1−T²)²`. Counts 3, 5, 9, 33 give `Π₁ = 1+4T⁴`. `2, 8`. Split versus nonsplit descent. `N₁ = 9` versus `5`. | Sound |
| 7.16 `weilConjectures_smooth_proper` (r4) | `ℙ¹/𝔽₄`; genus 2/𝔽₂; `Spec k` | Degrees (1,0,1). `|z| = 2^{−1/2}`. `P₀ = P_last = 1−T`. | Sound |

**Remark on changed wording (no change requested).** The scope sentence groups “the projective Weierstrass model and its point dictionary” under “already in Tau Ceti”, not under EllipticCurves Layer 3 ownership. That is accurate: no roadmap on main owns `projModel` (only ModularCurves cites it), and the supplier-table row for Layer 3 does not claim it.

## Not verifiable

- None among the changed passages. The previous review's items (Fulton for §§6.2–6.4, Kedlaya's published numbering for §6.9, Fujino–Sato for §6.4) concern untouched text and were not re-attempted.

## Source issues

- **Misprint** in BFP (Bergström–Faber–Payne, Ann. of Math. 199) at Proposition 3.1, proof, p. 1330: the displayed trace-formula error is little-o of `p^{md/2}`, with `d` the dimension. It should be little-o of `p^{ms/2}`, the hypothesis, which is then fed to vdBE Lemma 4.1 with error exponent `s` and `r = 2d`. Affects nothing; §5.23 works with `s` throughout.
