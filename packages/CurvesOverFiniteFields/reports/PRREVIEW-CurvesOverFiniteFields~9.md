# Review of CurvesOverFiniteFields (pull request #1729 at 408a5d8)

**Verdict:** needs changes

## R01 (P2) — Tau Ceti declarations cited "at the pin" are absent at this head's pin

**Location:** `TauCetiRoadmap/CurvesOverFiniteFields/README.md` lines 152–166 (also 338–344, 371–398, 681, 1172–1176, 1245–1258): "At the pin of this repository … the Newton-polygon library `TauCeti/NumberTheory/NewtonPolygon/` … `WeierstrassCurve.zetaFunction` … `TauCeti.IsHermitianCoordinates`".

**Claim:** The head's `lake-manifest.json` pins Tau Ceti `358314d4`. That commit has no `Polynomial.newtonPolygon`, `newtonSlopes`, `newtonSlopes_mul`, `newtonSlopes_eq_map_roots`, no `IsHermitianCoordinates` family, no `WeierstrassCurve.zetaFunction`, `zetaRatFunc`, `coeff_finrank_logOf_zetaFunction`, `zetaFunction_eq_mul_inv`, `constantCoeff_zetaFunction`; the fixed-point file is `Affine/Point/FrobeniusFixed.lean`, not `Affine/Point/Frobenius/Fixed.lean`.

**Witness:** At `358314d4`: no `TauCeti/NumberTheory/NewtonPolygon/`, no `TauCeti/FieldTheory/FunctionField/Hermitian/`, no `Isogeny/Frobenius/Zeta.lean`. All exist at main's pin `2fd255d9` (`NewtonPolygon/Slopes.lean:110`, `Hermitian/Basic.lean:66`, `Isogeny/Frobenius/Zeta.lean:153`).

**Repair:** Merge main into the branch so that the manifest pins Tau Ceti `2fd255d9` (and main's Mathlib), rebuild `TauCetiRoadmap.CurvesOverFiniteFields.Suggested`, and keep the text. Every name of the passages above resolves at `2fd255d9` (checked: `Mul.lean:319`, `Roots.lean:111`, `Hermitian/Genus.lean:69, 81`, `Hermitian/Existence.lean:37`, `Zeta.lean:93, 171, 176, 184, 220`, `Affine/Point/Frobenius/Fixed.lean`); the docstring's "no `AddValuation ℤ (WithTop ℝ)`" still holds there.

## R02 (P3) — "maximal" and "minimal" are used but never defined; one worked example cites a sense 3.5 does not have

**Location:** `README.md` line 1322: "`1.2.c` … (maximal, 3.5 in the non-square-`q` sense of attaining Serre's bound)"; line 1142: "a maximal function field in the sense of 3.5"; §3.5 (lines 1162–1178).

**Claim:** §3.5 states the equality criteria for `N_1 = q + 1 ± 2g√q` but never says which function fields are called maximal or minimal, and it contains no "non-square-`q` sense".

**Witness:** `1.2.c` has `N_1 = 5 < 2 + 1 + 2√2 ≈ 5.83`, so it does not satisfy §3.5's equality `N_1 = q + 1 + 2g√q`; it attains only §3.2's `q + 1 + g⌊2√q⌋ = 5`.

**Repair:** Open §3.5 with: "Call `F` *maximal* when `N_1(F) = q + 1 + 2g√q` and *minimal* when `N_1(F) = q + 1 − 2g√q`." Replace the parenthesis at line 1322 by "(attains the upper equality of Serre's bound 3.2; `q = 2` is not a square, so it is not maximal in the sense of 3.5)".

## R03 (P3) — backticked names of this roadmap that `Suggested.lean` does not declare

**Location:** `README.md` lines 214 and 363 (`` `LPolynomial k F` ``), 1020–1021, 1030, 1033, 1096 (`` `weilPolynomial k F` ``, `` `weilPolynomial = T² − 2T + 2` ``, `` `IsWeilPolynomial q (weilPolynomial k F)` ``).

**Claim:** A backticked name of the roadmap's own asserts a declaration of `Suggested.lean`; `weilPolynomial` and `LPolynomial` are not declared there (they are not statable at the pins, as the module docstring says).

**Witness:** `Suggested.lean` declares 36 names; neither is among them. The README already writes IsTwistOver, twistDegree, geometricExtensionDegree, IsAlmostOrdinary and IsGeometricallyIrreducible without backticks for this reason.

**Repair:** Write the two names without backticks, as for the five above, or use `P_F` and `L_F` (conventions 5): for example line 1020 "Define weilPolynomial k F, written `P_F`, as `reverse L_F`", and line 1096 "`IsWeilPolynomial q P_F`".

## R04 (P3) — `card_frobeniusAngles` carries a Weil hypothesis the statement does not need

**Location:** `Suggested.lean` lines 142–145 and `README.md` lines 692–694: "For a symmetric Weil polynomial of degree `2g` with `m` real roots, `2 · card (frobeniusAngles P) = 2g+m`".

**Claim:** The identity counts complex roots of a real polynomial of degree `2g` (non-real roots pair by conjugation); neither `IsWeilPolynomial q P` nor the coefficient symmetry enters.

**Witness:** `P = T⁴ + T`, `q = 0`, `g = 2` (symmetric, not Weil; README line 521): roots `0, −1, e^{±iπ/3}`, three with `im ≥ 0`, two real: `2·3 = 6 = 2·2 + 2`.

**Repair:** State it as `theorem card_frobeniusAngles {g : ℕ} {P : ℤ[X]} (hdeg : P.natDegree = 2 * g) : 2 * Multiset.card (frobeniusAngles P) = 2 * g + Multiset.card ((P.aroots ℂ).filter fun z => z.im = 0)`, and the README bullet as "For `P` of degree `2g` with `m` real roots". (`T⁴ + T` satisfies the new statement: `6 = 6`.)

## R05 (P3) — the pull-request description names a genus-2 interface and a section count the head does not have

**Location:** Description: "…maximal and minimal curves, and the elliptic and genus-2 interfaces." and "`TauCetiRoadmap/CurvesOverFiniteFields/README.md`: the roadmap, 4 layers and 24 milestones."

**Claim:** Layer 4 at the head is 4.1 and 4.2 (elliptic curves) and 4.3 (the two Weil-number predicates); no section is a genus-2 interface. The four layers have 11 + 4 + 5 + 3 = 23 numbered sections.

**Witness:** `README.md` headings at lines 1195, 1243, 1273; genus 2 occurs only in *Not owned here* (lines 102–107) and the *Downstream consumers* row for HyperellipticCurves (line 1391).

**Repair:** "…maximal and minimal curves, and comparison contracts with Tau Ceti's elliptic curves (point counts, Hasse bound, supersingularity, zeta function) and with the scalar Weil-number predicate; the genus-2 Euler factors are HyperellipticCurves', a consumer." and "the roadmap, 4 layers and 23 numbered sections."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 `IsWeilPolynomial` | `T²−2T+2`, `T²−3T+2`, `1`, `T`, `2T²−4T+4` | moduli `√2,√2`; `1,2`; no roots; `0` (only `q=0`); not monic. `P(0)² = q^n`: `4 = 2²` | holds | none |
| 1.1 / 4.3 scalar comparison | `1+i`; `(1+i√17)/3`; `1` at `q=2` | minpoly `X²−2X+2`; norm `18/9 = 2`, trace `2/3` not integral; `1 ≠ √2`. DWP §0.1 has `q>1` | holds for `1<q` | none |
| 1.2 closure | `(T²−2)(T²−2T+2)` at `q=2` | `= T⁴−2T³+4T−4`; all four roots of modulus `√2`; both factors monic integral | holds | none |
| 1.4 `realWeilPolynomial_spec` | `2.2.ac_c`; `g=0`; `T⁴+T` at `q=0` | `h=X²−2X−2`: `(X²+2)²−2X(X²+2)−2X² = P`; `C a₀`; `h=X²` gives `X⁴ ≠ X⁴+X` | holds for `0<q`; `q=0` fails as documented | none |
| 1.4 `isWeilPolynomial_iff_realWeilPolynomial` | `(T²−2)²`; `1.4.ae`; `g=0` | `h=X²−8`, roots `±2√2 = ±2√q`; `h=X−4 = X−2√q`; both sides true | holds, endpoints included | none |
| 1.4 `aroots_map_div`, prefix | `2T²+4` (`q=2`); `T⁴`, `T⁴+T` (`q=0`) | `4=2·2`, `h=2X`, prefix `(1,2,0)`; both `q=0` polynomials share prefix `(2,0,0,0)` | `0<q` needed and present | none |
| 1.5 `irreducible_real_root` | `q=2`, `q=4`, `q=0` | `T²−2`; `T∓2` with `s=2`; `T = X − C 0` with `s=0`. Sign: `(T²−2)(T²−2T+2)` has `P(0)=−4≠4` | holds; Waterhouse p. 528 agrees | none |
| 1.6 `pRank`, `IsOrdinary`, test | `2.2.ad_f`, `2.2.ab_a`, `T²−T+4`; `q=1`, `P=1`, `g=0` | ranks `2`, `1`, `1`; at `q=1`: `pRank=0=g` but `¬(1∣1)` false | holds; `IsPrimePow q` is used | none |
| 1.6 `IsSupersingular`, elevation | `T²−4T+8`, `T²−2T+8` (`q=8`); `T²+16` (`q=2`); `g=2,3` | `3≤4`; `3≤2` fails, slopes `1/3,2/3`; `2≤8` but slopes `2,2`; elevation `0+1+1=2`, `0+1+1+2=4` | holds; knowl `av.fq.newton_elevation` agrees | none |
| 1.7 `card_frobeniusAngles` | `1.4.ae`, `2.2.a_ae`, `T⁴+T` | `2·2=2+2`; `2·4=4+4`; `2·3=4+2` without Weil | true, hypothesis unused | R04 |
| 1.7 `angleRank_eq_zero_iff` | `T²−T+2`, `(T−2)²`, `T²−2`, `2.2.ad_f`, `3.2.ad_c_b` | rank `1`, `1≤0` fails; rank `0`, `4≤4`, `2≤4`; rank `0`, `2≤2`; `θ₂−θ₁=0.33333`; `θ₁+θ₂=0.285714=2/7` | holds | none |
| 1.8 `isCMField_weilNumberField` | `T²−2T+2`; `2.2.ac_c`; `T²+1` at `q=1`; `T` at `q=0` | `ℚ(i)`; `α²=2ζ₁₂`, so `ℚ(ζ₁₂) ⊃ ℚ(√3)`; `ℚ(i)`; excluded by the no-real-root hypothesis | holds; Mathlib `IsCMField` = totally complex quadratic over maximal real subfield | none |
| 1.10 `weilPower`, product formula | `T²−2T+2` (`r=2,4`), `(T−2)²`, `T` (`r=0`), `T−2` (`r=2`) | `T²+4`, `(T+4)²`; trace `8`; `T−1`; `(T−2)(−T−2)=4−T²=−(T²−4)` | holds | none |
| 1.10 twists, roots, extension degree | `T²∓3T+3`; `T²∓2`; `T⁴+4`; `2.2.ac_c`, `2.2.ad_f`, `3.2.ad_c_b` | powers `T²−3T+9`, `T²+27` both; `(T−4)²` at `4`; coincidences `4,8,16`; `(T+64)⁴`, `(T²+11T+64)²`, `(T²+13T+128)³` | holds: degrees `12,6,7` | none |
| 1.11 counts and recovery | `1.2.ac`; `(T²−2)²`; `T⁴` vs `T⁴+T` (`q=0`); `(T−1)²` vs `(T−1)⁴` (`q=1`) | `N=1,5,13,25`; `3,−3,9,1`, `A=1,1,49,81`; `s₁=s₂=0` for both; all `A_r=0` | holds; `0<q` and `2≤q` needed and present | none |
| 2.1 Weil polynomial | `1.2.ac`, `ℙ¹`, `2.2.a_a` | `T²−2T+2`, `∑α=2=3−N₁`; `1`; `T⁴+4`, `P(0)=4=q^g` | holds | none |
| 2.3 constant extension | `1.2.ac`, `r=2`; `ℙ¹/𝔽₂` | `P^{(2)}=T²+4`, `h=A₂=5`; `N₁=3`, `N₂=5`, `h=1` | holds; FunctionFieldArithmetic §5.5 supplies `α_i^r` | none |
| 2.4 genus one | `1.2.ab`; `1.3.ad` | `a=1`, `s=1,−3`, `N=2,8,14,16`, `h=2=N₁`; `N=1,7,28,91` | holds | none |
| 3.1 `classNumber_bounds`, `card_le_four…` | `(q,g,h)`: `(2,1,1)`, `(2,1,5)`, `(4,1,1)`, `g=0`; `q=5` | `0.17≤1≤5.83`; `5≤5.83`; `1≤1` equality; `1≤1≤1`; `(√5−1)²=1.53>1` | holds; `1≤g` needed (`ℙ¹`) | none |
| 3.2 `serre_bound` | `(2,1)` both signs; `𝔽₄(t)/𝔽₂` without `hex`; 7 table rows | `\|1−3\|=2`, `\|5−3\|=2`, `m=2`; `\|0−3\|≤0` false; `Nat.sqrt(4q)=⌊2√q⌋` on all rows | holds; Serre Thm 4.10(a),(b), §4.7.2.2 read | none |
| 3.3 `ihara_bound` | derivation; `(2,1)`, `(4,1)`, `(16,1)`, `g=0` | `t²/g+t ≤ q²−q+2qg` gives the stated root; `5`; `9` attained by `1.4.e`; `33>25`; `q+1` | holds | none |
| 3.4 necessary conditions | `2.2.a_ae`, `2.2.ac_c`, `T²+2`, `T²+16` | `N₂=−3`; Möbius `4,0,4`; `6,6,0`; `3,37,9,−495` | holds; knowl `av.fq.curve_point_counts` states the same two tests | none |
| 3.5 maximal curves | Hermitian `q₀=2,3`; `1.2.c` | `9=4+1+4`; `28=9+1+18`, `g=3`; `5<5.83` | criterion holds; term undefined | R02 |
| 4.1 `card_degreeOne_eq_pointCount` | node `y²+xy=x³`, cusp `y²=x³` on `k(t)`; `1.2.ac`; degree-2 place | `(t²+t)³` both sides; `pointCount = q` vs `q+1` places; cusp `q+1`; `1=1`; `1` vs `3` | holds with genus one and `P.degree = 1` | none |
| 4.1 supersingular comparison | `q=p`, `q=p²`, `q=8` with `a=±2` | `1≤2v_p(a)` and `2≤2v_p(a)` both `⟺ p∣a`; `3≤2` fails | holds for `r≤2` as stated | none |
| 4.2 zeta comparison | `1.2.ac` | log coefficients `1`, `5/2`; `N₂=4+1−(4−4)=5`; constant coefficients `1` | route sound; Tau Ceti side only at main's pin | R01 |
| Convention 1 witness | `𝔽₄(t)/𝔽₂` | `1/((1+T)(1+2T)) = 1−3T+7T²−…`; `deg D+1−ℓ(D) = −1` for `deg ≥ 0` | holds | none |
| Bounds table | 8 pairs `(q,g)` | `(5,5,5)`, `(8,7,6)`, `(11,9,8)`, `(14,11,9)`, `(10,10,9)`, `(13,13,11)`, `(23,23,22)`, `(25,25,33)` | all eight agree | none |

- Source locators checked against the text: 11. Wat69 lines 247–253 (p. 527), 294–316 (p. 528, three uses); Ser12 lines 1641–1654 (Theorem 4.10(a), (b) and the sign remark, p. 46), 1715–1743 (§4.7.2.2, p. 48); LMFDB knowls `av.fq.newton_elevation`, `av.fq.angle_rank`, `av.fq.curve_point_counts`; LMFDB record `2.2.a_ae` (angles `0,0,1,1`, counts `3,−3,9,1` and `1,1,49,81`).
- Library declarations opened at the head's pins: `Mathlib/NumberTheory/MahlerMeasure.lean:106`, `Mathlib/RingTheory/Polynomial/Dickson.lean:63, 80, 122`, `Mathlib/RingTheory/Polynomial/GaussLemma.lean:78`, `Mathlib/NumberTheory/NumberField/CMField.lean:69`, `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean:138`, `Mathlib/RingTheory/AdjoinRoot.lean:737`, `Mathlib/FieldTheory/PolynomialGaloisGroup.lean:204, 363`; `TauCeti/FieldTheory/FunctionField/Elliptic/WeierstrassEquation.lean:70, 213`, `Elliptic/Nonsingular.lean:126`, `Elliptic/Basic.lean:68, 188`, `RiemannRoch/ClassNumber.lean:82, 202, 210`, `ConstantExtension/Genus.lean:69`, `TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean:73, 101`, `HasseBound.lean:52`, `Supersingular.lean:86`. Fourteen further names resolve only at main's pin (R01).
- Cross-roadmap citations resolved: FunctionFieldArithmetic §0.2 and §§5.1–5.6 with 16 names (open head `4cac1f8`; it lists this roadmap as a consumer of §§5.1, 5.3–5.6); DeligneWeightsAndPurity §§0.1–0.3, 1.6, DWP.10; FaltingsFinitenessAndIsogenyTheorems R28.5.1; NewtonPolygons Conventions 1–4, §§2.1, 3.2, 3.3; SchemeAndStackFoundations §§2.11, 2.16, 5.11 (`weil_bound_via_surfaces`, `weilBound_eq_hasse`); EtaleCohomologyFoundations F.3.0, F.3; AlgebraicCurves Layers 8, 10(i)–(iii), 12; EllipticCurves Layer 3; PolynomialGaloisGroups Layers 0, 2, 6; AbelianVarietiesOverFiniteFields 5.1, 5.3–5.6, 10.6; AbelianSchemesAndArithmeticModuliPartII F3.2. No other `Suggested.lean` declares a name of this file.
- Gate: every check passes in the worker's record for this head. Dependency check: `depcheck: 237 roadmaps, 2250 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` at the head's pins: 22 `declaration uses sorry` warnings and nothing else. One-tactic probe (`simp`, `rfl`, `simp` with the file's definitions, `exact?`, `omega`) on a scratch copy: 22 of 22 theorems stay open. The 37 elaborated signatures were compared with the README statements: no binder lost, no change.
- Worked examples recomputed with exact integer arithmetic (companion-matrix powers): 14 polynomials, `N_1..N_6`, `A_1..A_4`, Weil powers 2, 3, 4 (and 6, 7, 12), angles, Möbius sums; every value in the README agrees. `N_1` of the ten explicit curves over `𝔽₂`, `𝔽₃`, `𝔽₄` recounted by hand.
- Overlap check: read AbelianVarietiesOverFiniteFields, HyperellipticCurves, HypergeometricMotives, WeilConjectures, CharacterSumsOverFiniteFields, PadicExtensionFamilies, AlgebraicCurves, ClassicalArithmeticCompletion; nothing shared (AbelianVarietiesOverFiniteFields consumes Layer 1 and 3.4 by section and defines nothing polynomial-level; the zeta function and `L_F` are FunctionFieldArithmetic's; the Weil bound is SchemeAndStackFoundations §5.11's).
- Source independence: 9 passages compared with 3 sources (Wat69, Ser12, LMFDB knowls), none shared beyond formulas; largest share LMFDB knowls, 17 of about 36 locators, which have no table of contents (the `av.fq` columns are placed by the README's own table, not in column order); second, Stichtenoth, 11 locators, text not readable: from its public contents, Layer 2 ↔ §5.1 (end), 3.1 ↔ §5.2, 3.2–3.3 ↔ §5.3, an order the dependencies 2.1 → 3.1 → 3.2 force, with Layers 1 and 4 and 3.4 outside it: independent.

## Not verifiable

- Stichtenoth, *Algebraic Function Fields and Codes* (Theorem 5.1.15, Corollary 5.1.16, Theorems 5.2.1, 5.2.3, 5.3.1, Proposition 5.3.3, §6.4): paywalled; the statements were recomputed, the numbering was not read.
- Ihara 1981, pp. 721–724 (3.3): no legal copy found by the sources service or a web search; the bound was rederived from `N_2 ≥ N_1` and Cauchy–Schwarz.
- Serre 1983 (C. R. Acad. Sci.) and Serre 2020 (SMF): not fetched; 3.2 was checked against Ser12 instead.
- LMFDB record `1.4.ae` (stored angles `[0, 0]`), the discriminant `2312` and the group `D₄` of `2.2.ab_a`: not read or recomputed.
- The three external formalisations named in *References* (repositories, declaration names, licences): not opened.
- Mathlib `Polynomial.reverse_natDegree`, `Matrix.charpolyRev` and the `NumberField (AdjoinRoot f)` instance: found at main's Mathlib pin (`Reverse.lean:254`, `Charpoly/Coeff.lean:290`, `NumberField/Basic.lean:447`); the head's pinned checkout became unavailable before they were opened there.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` lines 1430–1478 say three external Lean formalisations are Apache-2.0 and were "consulted as proof sources"; the repositories and licences were not opened in this review. `Suggested.lean` shares no declaration name with the ones cited.
- **Licence.** Ser12 was read from the author's page on the Collège de France site, a host the sources service does not classify; it was fetched as an author-page copy.
- **Licence.** The worked examples (`README.md` lines 1298–1383) carry LMFDB labels and invariants of 13 isogeny classes; the values were recomputed here, and the LMFDB's content licence was not read.
- **Not tested.** Stichtenoth (11 locators, the largest share among the printed sources) could not be read: wording was not compared with it, and the contents comparison used its public chapter headings only.
