# Review of CurvesOverFiniteFields (pull request #1729 at 1e1b4ad)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/CurvesOverFiniteFields/README.md` and `Suggested.lean` at the pins Mathlib `f6090c70` / Tau Ceti `358314d4`. The gate at this head fails on `build` (the Lake module-system warning); every other scanner and the dependency check pass. Two blocking design defects (R01, R02), three P2s, seven P3s.

## R01 (P1) — Two owners of the Weil-polynomial theory, and a cycle with the sibling AbelianVarietiesOverFiniteFields

**Location.** README lines 27–30 ("the sibling roadmap `AbelianVarietiesOverFiniteFields` consumes every polynomial-level object from here"), lines 176–181, the Downstream consumers table (line 934), and 5.1 lines 766–769 ("Waterhouse's list of elliptic traces, his Theorem 4.1, which is the sibling `AbelianVarietiesOverFiniteFields` 4.6 … consumed here and not proved").

**Claim.** Layer 4 is owned here and the sibling consumes it; at the same time 5.1 consumes the sibling's 4.6.

**Witness.** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md` at the head of its open pull request, §1.0 (lines 359–452), defines the same objects under the same conventions: Weil `q`-polynomial, reciprocal (= symmetric) polynomial, real Weil polynomial with `P(T) = T^g h(T + q/T)`, the CM field, slopes, `p`-rank as "deg P minus the least coefficient index not divisible by p", ordinary, supersingular, elevation as the lattice points below the polygon on `0 ≤ x ≤ g`, angle rank, Weil powers, polynomial twists, geometric extension degree, Weil roots, geometric irreducibility, virtual abelian and curve counts. Its Downstream consumers (line 2123) say: "CurvesOverFiniteFields consumes §1.0's polynomial operations, §4.6's elliptic existence list, and §10.4's surface Jacobian criterion … These consumers supply no input to this roadmap." So the two open pull requests each build the object and each names the other as its consumer; and this README itself declares both directions (Layer 4 → sibling; sibling 4.6 → 5.1), which is a cycle. The depcheck does not see it because the sibling is not yet in the merge order and the 5.1 citation is not a `*Needs:*` line.

**Repair.** Settle one direction, in both pull requests. Consistent with the rest of this README: keep Layer 4 as the owner, record in *Scope and ownership* that the sibling's §1.0 is to be reduced to citations of 4.1–4.11, and remove every input from the sibling: in 5.1 state the agreement `IsSupersingular E ↔ IsSupersingular q P_E` only for `q = p` and `q = p²` (where it is the polynomial identity `p ∣ a ⟺ 2 v_p(a) ≥ r`), and hand the `r ≥ 3` case to the sibling as the theorem "the Weil polynomial of an abelian variety has these invariants", which lines 179–181 already assign to it. The alternative (delete Layer 4, consume the sibling's §1.0 by section, place this roadmap after it) is equally consistent but leaves Layers 2–3 and 5 as the whole roadmap. Either way the sibling's text must change too; this review cannot edit it.

## R02 (P1) — The gate's build step fails

**Location.** `Suggested.lean` line 1, `import Mathlib`.

**Claim.** The gate reports `build=1 FAIL` with the only message "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`".

**Witness.** The worker's gate output at this head; `lake env lean` on a copy elaborates with only `sorry` warnings, so the failure is Lake's warning alone.

**Repair.** Make the file a module-system file: line 1 `module`, blank line, `public import Mathlib`, `public import TauCeti.FieldTheory.FunctionField.RiemannRoch.ClassNumber`, the module docstring, then `public section` before `namespace TauCetiRoadmap.CurvesOverFiniteFields` (`module` alone silences the warning but makes every declaration private; the `public` forms are what other roadmaps at these pins use). Re-run the gate.

## R03 (P2) — Headline theorems that are statable at the pins are absent from `Suggested.lean`

**Location.** README 3.8 (line 465), 3.9 (line 476), 3.6 (line 457, `h_F = 1 ⟹ q ≤ 4`), 5.1 (line 749, `N_1(F) = W.pointCount`); `Suggested.lean` lines 319–332 state only `classNumber_bounds`.

**Claim.** The module docstring (lines 18–20) says every milestone naming `N_r` "is specified in `README.md` alone" because `N_r` is FunctionFieldArithmetic's.

**Witness.** `N_1(F)` is `Nat.card {P : Place k F // P.degree = 1}` on Tau Ceti's own carrier (`TauCeti.Place`, `Place.degree : Place k F → ℕ`, both at the pin in `TauCeti/FieldTheory/FunctionField/Place/Basic.lean`, line 495 for `degree`), and FunctionFieldArithmetic §5.1 defines `placeCount 1` as exactly that cardinality. The statement

    |(Nat.card {P : Place k F // P.degree = 1} : ℤ) - (Nat.card k + 1)| ≤ genus k F * Nat.sqrt (4 * Nat.card k)

elaborated on a scratch copy with `[Finite k]`, `hF`, `hex` in scope (unused-variable warnings only). Ihara's bound is a real inequality in the same three quantities; `h_F = 1 → 1 ≤ genus k F → Nat.card k ≤ 4` uses `Divisor.classNumber`; and 5.1's `Nat.card {Q // Q.degree = 1} = W.pointCount` uses `Place.IsWeierstrassCoordinates` (pin, `Elliptic/WeierstrassEquation.lean` line 70) and `WeierstrassCurve.pointCount` (pin, `AlgebraicGeometry/EllipticCurve/PointCount.lean` line 73).

**Repair.** State Serre's bound (3.8), Ihara's bound (3.9), the class-number-one corollary of 3.6 and the 5.1 identification in `Suggested.lean` on these carriers, each with `sorry`; keep the docstring's list of what is not statable to the milestones that genuinely need `L_F` (3.6's link theorem, 3.11) or Tau Ceti main beyond the pin (5.2's `zetaFunction`, 4.6's slopes).

## R04 (P2) — 4.5 overstates the multiplicity of `X² − 4q` in the real Weil polynomial by a factor two

**Location.** README line 578–579: "when `q` is not a square, `T² − q` divides `P` with multiplicity `m` and `X² − 4q` divides `h_P` with multiplicity `m`".

**Claim.** Equal multiplicities.

**Witness.** `P = (T² − 2)²`, `q = 2`, `g = 2` (the roadmap's own `2.2.a_ae`): `m = 2`, and `h_P = C(a_2) + C(a_3)·X + C(a_4)·(X² − 4) = −4 + 0 + X² − 4 = X² − 8 = X² − 4q`, multiplicity `1 = m/2` (the LMFDB record for 2.2.a_ae, read through its JSON API, has `real_poly = [1, 0, −8]`). In general a root `±√q` of `P` of multiplicity `k` is a root `±2√q` of `h_P` of multiplicity `k/2`, as 4.4 (line 559–560) correctly says.

**Repair.** Replace "with multiplicity `m`" for `h_P` by "with multiplicity `m/2`" (`m` is even for symmetric `P`, as the next clause proves).

## R05 (P2) — 4.6's "supersingular ⟺ every slope is 1/2" needs the Weil (or `|P(0)| = q^g`) hypothesis

**Location.** README line 601–603: "`IsSupersingular q P` by the coefficient criterion of convention 9, equivalent to **every slope equals `1/2`** (the polygon is the straight segment from `(0, 0)` to `(2g, g)` iff every coefficient point lies on or above it)".

**Claim.** The equivalence for a monic `P` of degree `2g`.

**Witness.** `q = 2` (`p = 2`, `r = 1`), `P = T² + 16`, `g = 1`: the predicate of convention 9 holds (`j = 0`: `1·2 ≤ 2·v_2(16) = 8`; `j = 1`: coefficient `0`; `j = 2`: `0 ≤ 0`), but `reverse P = 1 + 16T²` has heights `0, ∞, 4` and slope multiset `{2, 2}`, not `{1/2, 1/2}`. The coefficient criterion says "on or above the line through the origin of slope 1/2"; it forces the polygon onto that line only when the endpoint `(2g, v(P(0)))` lies on it, which is `|P(0)| = q^g`, true for Weil polynomials (4.1's `P(0)² = q^{natDegree}`). The Lean `angleRank_eq_zero_iff` carries `hW`, so only the prose is wrong.

**Repair.** State the equivalence for Weil `q`-polynomials (or add `P(0)² = q^{2g}` as the hypothesis), and add `T² + 16` at `q = 2` as a negative-control Check of the coefficient predicate.

## R06 (P3) — Two worked-example angle ranks are wrong

**Location.** README line 868 (`2.2.ad_f`: "angle rank `2`") and line 878 (`3.2.ad_c_b`: "angle rank `3`").

**Witness.** With the angles the README itself lists: for `2.2.ad_f`, `θ₂ − θ₁ = 0.45688 − 0.12355 = 0.33333 = 1/3` (exactly: `cos π(θ₁ + 1/3) = 0.9256·0.5 − 0.3785·0.866 = 0.135 = cos πθ₂`), so `Span_ℚ{1, θ₁, θ₂}` has dimension `2` and the angle rank is `1`; for `3.2.ad_c_b`, `θ₂ = 2/7 − θ₁` and `θ₃ = 6/7 − θ₁` (`0.285714 − 0.09926 = 0.18645`, `0.857143 − 0.09926 = 0.75788`), angle rank `1`. The LMFDB JSON API returns `angle_rank = 1` for both, with `geometric_extension_degree` `6` and `7` (the root ratios are sixth and seventh roots of unity). Both classes are ordinary but not geometrically simple, which is exactly where angle rank drops below `g`; the sentence at line 816 says all numbers were computed.

**Repair.** Write angle rank `1` in both examples, and add the relations `θ₂ − θ₁ = 1/3` and `θ₂ + θ₁ = 2/7`, `θ₃ + θ₁ = 6/7` as the Check that distinguishes `angleRank` from "number of angles".

## R07 (P3) — Padding and non-headline declarations in `Suggested.lean`

**Location and witness** (one-tactic probes on a scratch copy, elaborated with `lake env lean`):

- line 62, `example (q : ℕ) : IsWeilPolynomial q 1` — closes by `simp [IsWeilPolynomial]`; a proved non-vacuity example.
- line 72, `IsWeilPolynomial.isIntegral` — closes by the term `⟨P, h.1, (mem_aroots.1 hz).2⟩`, i.e. the definition of `IsIntegral`.
- line 181, `pRank_example` — computes a small value (`4 − 3 = 1`); mirrors the worked example.
- line 65, `card_aroots` — a proved API lemma that is `IsAlgClosed.card_roots_map_eq_natDegree_of_isUnit_leadingCoeff` after unfolding.
- line 91, `finite_setOf_isWeilPolynomial` — a proved restatement of FaltingsFinitenessAndIsogenyTheorems R28.5.1 (`finite_weilPolynomials`, at the head of its pull request, lines 2019–2032, same proof route); the owner is cited, so the statement is a duplicate.
- line 110, `dickson_one_eval_add` — a theorem about free variables `R, a, x, y` whose conclusion is algebra on its hypotheses, not a headline; and `weilPower_one` (line 253), `IsWeilPolynomial.mul`/`of_dvd`/`coeff_zero_sq`, `realWeilPolynomial_monic`, `pRank_mul`, `angleRank_le` are API lemmas rather than end theorems.

**Repair.** Delete the first six from `Suggested.lean` (the README keeps them as targets and Checks); keep the API lemmas only if the author regards them as acceptance tests, otherwise delete them too. Note: `IsWeilSymmetric.aroots_map_div` (line 137) does not need `hW`: for `q ≥ 1`, `T^{2g} P(q/T) = q^g P(T)` gives `P(T) = ∏ (T − q/α_i)` directly (`P(0) = q^g ≠ 0`), so the root multiset is stable under `α ↦ q/α` for every symmetric `P`, as 2.5 states.

## R08 (P3) — Supplier names and links that do not resolve

**Location and witness.**

- README line 521: `IsWeilNumber.of_aeval_eq_zero` and `IsWeilNumber.norm_eq` — DeligneWeightsAndPurity's `Suggested.lean` at the head of its pull request declares `IsWeilNumber` (line 54) and no lemma of either name; the facts are its README §0.1 API bullets ("If `P ∈ ℚ[T]` is nonzero, `P(α) = 0` and every complex root of `P` has absolute value `q^{n/2}`, then `α` is a Weil `q`-number"; "Every field embedding into `ℂ` sends the Weil number to a number of modulus `q^{n/2}`"). Cite the section, not invented names.
- README line 241: "FunctionFieldArithmetic (whose Layer 5 names the exactness hypothesis `hk`)" — its Layer 5 (head of its pull request, line 1719) writes `IsIntegrallyClosedIn k F` and never names `hk`.
- README lines 156, 647, 928: `[PolynomialGaloisGroups](../PolynomialGaloisGroups/README.md)` — the roadmap is `Completed/PolynomialGaloisGroups/README.md` on main (its Layers 0, 2, 6 are at lines 442, 653, 1172 there); the relative link is dead.
- README lines 124, 593, 615: `Polynomial.newtonSlopes`, `newtonSlopes_mul`, `newtonSlopes_eq_map_roots` attributed to Tau Ceti main beyond the pin — not checkable here; NewtonPolygons on main names only `Polynomial.newtonPolygon` (§2.1) and describes the slope multiset (§3.3) and the product rule (§3.2) without Lean names. Say that the names are the roadmap's suggestions.
- References line 950: Waterhouse is cited as "§2"; the paper is organised in chapters (`waterhouse1969` line 224, "CHAPTER 2", printed pp. 527–528; the real-root dictionary is lines 294–316). Write "Chapter 2, pp. 527–528".

## R09 (P3) — 5.5 is an interface note on a later roadmap, not a target

**Location.** README lines 789–799.

**Witness.** The only objects in 5.5 are `C_p`, `F_p` "of HyperellipticCurves", which is later in the merge order (line 370 against 333 for this roadmap), and the sentence "whoever supplies `F_p` with `genus = 2` gets the Euler factor from FunctionFieldArithmetic §5.3". HyperellipticCurves at its head (line 123) already defers the good Euler factor's `L`-polynomial to this roadmap. Nothing is proved in 5.5 that 2.5 and 3.6 do not already state for an arbitrary `F`.

**Repair.** Delete 5.5 and put one row in Downstream consumers ("HyperellipticCurves reads the good Euler factor of a genus-2 reduction as `LPolynomial 𝔽_p F_p` through 2.5 and 3.6").

## R10 (P3) — Checks are not per definition, and several definitions have fewer than three

**Location.** Layer 4 (lines 504–737) has no `**Checks.**` lists; the tests live in *Worked examples* (lines 814–894).

**Witness.** `geometricExtensionDegree` has no computed value anywhere (for the record: `T² + 2 ↦ 2`, `T² − 2T + 2 ↦ 4`, `(T² − 2)² ↦ 2`, `2.2.ad_f ↦ 6`, `3.2.ad_c_b ↦ 7`, the last three agreeing with the LMFDB API); `IsGeometricallyIrreducible` has none; `IsIsotypic` has one non-example (`2.2.a_a`); `weilRoots` one; `twistDegree` one; `virtualAbvarCount` is evaluated only for `2.2.ac_c`.

**Repair.** Give each definition of Layer 4 a `**Checks.**` list of at least three discriminating bullets (one computed value, one degenerate case, one non-example or wrong-model exclusion), moving the relevant worked-example values there.

## R11 (P3) — Form: docstring, process prose, numbering, missing locators

- `Suggested.lean` lines 7–13 and 31–33: "Discharging every declaration here would finish neither a layer nor the roadmap. `sorry` is permitted in this human-owned repository" and "the small non-vacuity examples" are process prose; the docstring must instead name which headline theorems are not statable and what each lacks (3.6 and 3.11 lack `L_F`; 5.2 lacks `WeierstrassCurve.zetaFunction`, beyond the pin; 4.6's slope statements lack a slope multiset at the pin).
- README References lines 951, 954, 955: "(on disk)" is a remark about the operator's machine, not a locator; delete.
- README lines 92–94, 371–372: "on Tau Ceti's main branch beyond the pin of this repository" dates the text; say "not at the pin" once, in *What Tau Ceti supplies*.
- Section numbers run 2.5–2.8, 3.6, 3.8–3.11, 5.1, 5.2, 5.4, 5.5: the gaps read as deleted catalogue entries; renumber.
- Lidl–Niederreiter (line 957) is cited for the Dickson polynomials with no chapter or section; give one (or cite Mathlib's `Polynomial.dickson` docstring, which is what 4.4 actually uses).

## R12 (P3) — README/Lean generality: `IsSupersingular` and `IsOrdinary` take different first arguments

**Location.** `Suggested.lean` lines 156–167 and README convention 9.

**Witness.** `IsOrdinary p g P` and `IsAlmostOrdinary p g P` take the prime `p`; `IsSupersingular q P` takes `q` and derives `p := q.minFac`, `r := q.factorization p` inside. For `q = 12` (not a prime power) `IsSupersingular 12 P` evaluates with `p = 2`, `r = 2`, while `isOrdinary_iff_not_dvd_coeff` guards with `IsPrimePow q`. The README's `IsSupersingular q P := ∀ j, …` matches the Lean, but the Downstream consumer (the sibling's `is_supersingular`) and 4.7's `angleRank_eq_zero_iff` all need `IsPrimePow q`; one convention for the three predicates (all on `q`, or all on `(p, r)`) avoids a junk-value mismatch. Note only; no instance makes a stated theorem false.

## Verified sound

**Gate and dependency check.** Gate at `1e1b4ad`: every scanner `0` except `build=1` (R02). Dependency check run from the worktree:

    depcheck: 204 roadmaps, 1617 edges, 0 problem(s)

No UPWARD or CYCLE line; the cycle of R01 is invisible to it because the sibling is not in the merge order.

**Elaboration.** `lake env lean` on a copy of `Suggested.lean` with 47 appended probes: the original file elaborates with 26 `sorry` warnings and nothing else; `signatures.md` (50 declarations) shows no dropped section binder; every binder named in a README statement is in the corresponding Lean signature (`hq : 0 < q` in `realWeilPolynomial_spec`, `IsPrimePow q` in the two Newton statements, `[Finite k]`, `hF`, `hex` in `classNumber_bounds`).

**Library declarations opened at the pins** (all present, `#check` in the probe): `TauCeti.IsFunctionField`, `TauCeti.Place`, `Place.degree`, `TauCeti.genus`, `Divisor.classNumber` (`Nat.card (degreeClass hF).ker`, `ClassNumber.lean` line 202), `classNumber_pos`, `Place.finite_setOf_degree_le`, `Divisor.finite_setOf_isEffective_degree_le`, `Place.one_le_degree_of_isFunctionField`, `Place.degreeOneEquivDegreeZeroClassGroup` (`Elliptic/Basic.lean` line 188, hypotheses `hF hex (hg : genus = 1) (hP₀ : P₀.degree = 1)`), `IsEllipticFunctionField` (structure, `Elliptic/Basic.lean` line 68), `Place.IsWeierstrassCoordinates`, `exists_isWeierstrassCoordinates_of_genus_eq_one`, `constantCompositum`, `genus_eq_genus_of_constantCompositum_eq_top`, `WeierstrassCurve.pointCount`, `frobeniusTrace` (`PointCount.lean` lines 73, 101), `frobeniusTrace_sq_le_four_mul_card` and `hasse_bound` (`HasseBound.lean` lines 52, 65), `WeierstrassCurve.IsSupersingular` (`Supersingular.lean` line 86, torsion-by-`p` over the algebraic closure is `⊥`); Mathlib `finite_mahlerMeasure_le`, `mahlerMeasure_eq_leadingCoeff_mul_prod_roots`, `dickson_one_one_eval_add_inv` (parameter `1` only, as the README says), `NumberField.IsCMField` (`IsTotallyComplex` + `IsQuadraticExtension (maximalRealSubfield K) K`, `CMField.lean` line 69), `NumberField.Embeddings.pow_eq_one_of_norm_eq_one`, `IsIntegrallyClosed.eq_map_mul_C_of_dvd`, `Gal.galActionHom`, `Gal.card_of_separable`, `AdjoinRoot.powerBasis'`, the `NumberField (AdjoinRoot f)` instance for `[Fact (Irreducible f)]` (`NumberField/Basic.lean` line 446), `reverse_mul_of_domain`, `reverse_leadingCoeff`, `reverse_natDegree`, `Multiset.prod_X_sub_X_eq_sum_esymm`, `Matrix.charpolyRev`, `WeierstrassCurve.LFunction`, `FiniteField.Extension`, `nthRootsFinset r (1 : ℂ)`. Not at the pin, as the README says: `Polynomial.newtonPolygon`/`newtonSlopes`, `WeierstrassCurve.zetaFunction`, the Hermitian function field.

**Cross-roadmap citations resolved.** FunctionFieldArithmetic (head of its pull request): §0.2 `exists_divisor_degree_eq_one` (line 484), §5.1 `effectiveDivisorCount`, `placeCount`, `pointCount`, `zeta_eulerProduct`, `zeta_logDeriv`, `pointCount_eq`, `N_r(F·𝔽_{q^s}) = N_{rs}`, Möbius inversion (lines 1728–1750), §5.2 `effectiveDivisorCount_eq`/`_of_large` (1781, 1784), §5.3 `zeta_rationality` with `a_1 = N_1 − (q+1)`, `a_{2g} = q^g`, `a_{2g−j} = q^{g−j}a_j`, `L(1) = h` (1809–1815), §5.4 `zeta_eq_schemeZeta` with `|α_i| = √q` and `|N_r − q^r − 1| ≤ 2g q^{r/2}` (1840–1846), §5.5 `lPolynomial_constantExtension`, `zeta_constantExtension` (1867–1869), §5.6 `IsLPolynomialData` (`P(0) = 1`, `deg ≤ 2g`, symmetry for `j ≤ g`, Newton identities for `r ≤ g`), `.unique`, `lPolynomial_isLPolynomialData` (1890–1893) — 4.11's equivalence with `virtualCurveCount` is consistent with that definition (the `r`-th identity carries `N_r − q^r − 1` with coefficient `a_0 = 1`). SchemeAndStackFoundations §5.11 on main: `weil_bound_via_surfaces`, `weilBound_eq_hasse`, hypotheses smooth projective geometrically irreducible (lines 7273–7302). NewtonPolygons on main: Conventions 1–4 (line 80 ff.; Convention 3 "slope `m` corresponds to a nonzero root of valuation `−m`", so a slope of `reverse P` is `v(α)` as 4.6 says), §2.1, §3.2, §3.3. DeligneWeightsAndPurity (head): §0.1 `IsWeilNumber` for real `q > 1`, integer weight, element of a characteristic-zero field (line 561 ff.), §0.2, §0.3 (the `r ≥ 1` iff), §1.6 (`a_i` Weil of weight 1, `Z = P^rev/((1−t)(1−qt))`), Layer DWP.10. FaltingsFinitenessAndIsogenyTheorems (head) R28.5.1 as cited. WeilConjectures (head) Layer WC.1, §1.16, §5.20. AbelianSchemesAndArithmeticModuliPartII (head) F3.2 "Honda–Tate simple isogeny classification". EllipticCurves on main Layer 3: `IsSupersingular E ↔ ringChar F ∣ frobeniusTrace E` (line 741), trace sequence `t 0 = 2`, `t 1 = a_q` (line 781). AlgebraicCurves on main Layers 8, 10 (i)–(iii) (lines 1245–1252), 12. Completed NumberFieldArithmetic and AlgebraicCodingTheory exist. HyperellipticCurves (head, later in the order) defers the Euler factor to this roadmap (line 123); CharacterSumsOverFiniteFields and SatoTateGroups cite nothing from here.

**Sources read.** `waterhouse1969` (Numdam, cache `7be2bf9d`; printed page = marker + 520): Weil numbers defined at line 253 (p. 527); real-root cases `T ± p^{a/2}` for `a` even and `ℚ(√p)` for `a` odd at lines 294–308; `β = π + q/π` totally real with `|β| < 2√q`, converse, at lines 309–316 (p. 528); Theorem 4.1 at lines 619–626 (p. 537) with the five families, which confirm convention 13's "no elliptic curve over `𝔽_8` has trace `±2`" (`a = 3` odd, `p = 2`: traces `p ∤ β`, `±4`, `0`). LMFDB JSON API (read online; the knowl pages are behind a captcha for the service): `2.2.a_ae` angles `[0,0,1,1]`, `p_rank 0`, slopes four `1/2`, `curve_counts [3, −3, 9, …]`, `abvar_counts [1, 1, 49, …]`, `real_poly [1,0,−8]`, elevation `2`, `is_simple`, `geometric_extension_degree 2`; `1.4.ae` angles `[0,0]`, elevation `1`, `is_primitive`, `curve_counts [1,9,49,225]`, number field `ℚ`; `2.2.ab_a` `[1,−1,0,−2,4]`, angles `0.139387, 0.686170`, angle rank `2`, `p_rank 1`, slopes `0,1/2,1/2,1`, elevation `1`, `4.0.2312.1`, `4T3`, counts `[2,4,2,24]`; `2.2.ad_f` angles `0.123549, 0.456882`, angle rank `1` (R06), `p_rank 2`, elevation `0`, `4.0.225.1`, `4T2`, counts `[0,6,9,10]`, `has_jacobian 1`; `3.2.ad_c_b` angle rank `1` (R06), `p_rank 3`, `6.0.16807.1`, `6T1`, counts `[0,0,3,28]`, `real_poly [1,−3,−4,13]`.

**Adversarial table** (values computed by hand; `s_r = ∑ α_i^r`, `N_r = q^r + 1 − s_r`, `e_i` the elementary symmetric functions of the roots, Newton `s_r = e_1 s_{r−1} − e_2 s_{r−2} + ⋯ ± r e_r`).

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. 8 / 4.4 `h_P` from Dickson polynomials; `P = ∑ C(h_i)(X²+q)^i X^{g−i}` | `g=1`, `P = T²−aT+q`; `2.2.ac_c`; `2.2.ab_a`; `2.2.ad_f`; `3.2.ad_c_b`; `g=0`, `P=1` | `D_1 = X`, `D_2 = X²−2q`, `D_3 = X³−3qX`; `g=1`: `h = X − a`, `C(−a)X + (X²+q) = X²−aX+q`; `2.2.ac_c`: `h = 2 − 2X + X² − 4 = X²−2X−2`, expansion `X⁴−2X³+2X²−4X+4 = P`; `2.2.ab_a`: `X²−X−4`; `2.2.ad_f`: `X²−3X+1`; `3.2.ad_c_b`: `1 + 2X − 3(X²−4) + (X³−6X) = X³−3X²−4X+13`; `g=0`: `h = C(1) = 1` (the `i=0` term avoids `D_0 = 2`) | all agree with the README's real Weil polynomials | none |
| 4.4 countermodel at `q = 0` | `T⁴ + T`, `g = 2` | symmetric (`0^j a_j = 0^g a_{4−j}` reduces to `a_0 = 0`); `h = X²`, roots `0 ∈ [0,0]`; roots of `P` include cube roots of `−1`, modulus `1 ≠ 0` | `hq : 0 < q` is needed and present | none |
| 2.5/4.4 root multiset stable under `α ↦ q/α` | symmetric `P`, `q ≥ 1` | `T^{2g}P(q/T) = ∏(q − α_iT) = P(0)∏(T − q/α_i) = q^g ∏(T − q/α_i)`, so `P = ∏(T − q/α_i)` | true without `hW` | R07 note |
| 4.5 real-root multiplicities | `(T²−2)²`, `q=2`; `(T−2)²`, `q=4`; `T−2` alone | `P(0) = (−q)^m q^{g−m}`: `m=2 ⟹ +4 = q^g` ✓; `(T−2)²`: `m_+ = 2` even ✓; `T−2`: odd degree, not symmetric; `h_{(T²−2)²} = X²−8`, `X²−4q` to the power `1 = m/2` | README's "multiplicity `m`" false | R04 |
| 4.5 irreducible real-rooted Weil polynomials | `q=2`: `T²−2`; `q=4`: `T∓2`; `q=0`: `T`; `q=1`: `T∓1` | minimal polynomial of `±√q` is `T²−q` iff `q` not a square; `T`, `T∓1` fit `s² = q` with `s = 0, 1` | `irreducible_real_root` true incl. `q = 0, 1` | none |
| 4.1 `P(0)² = q^{natDegree}`; `q = 0, 1` | `P = 1`; `P = T^n`, `q = 0`; `q = 1` | `1 = q^0`; `0 = 0^n` for `n ≥ 1`; Kronecker: roots on the unit circle ⟹ roots of unity (`T−1` is Weil for `q=1`) | true | none |
| 4.1 comparison with `IsWeilNumber (q:ℝ) 1 α` | DWP §0.1 requires real `q > 1` | README restricts the comparison to `1 < q` (line 520) | consistent | names in R08 |
| 4.2 closure | `(T−1)(T−2)`; `T²−2 ∣ (T²−2)²`; `P^{(r)}` | roots `1, 2` have different moduli ⟹ Weil for no `q`; monic factor of a Weil polynomial has a sub-multiset of roots; `|α^r| = q^{r/2} ⟺ |α| = √q` | true | none |
| 4.3 Mahler measure | monic, `n` roots of modulus `√q` | `M(P) = ∏ max(1,|α_i|) = max(1,√q)^n`; the Lean proof elaborates | true, duplicate of R28.5.1 | R07 |
| 4.6 `IsSupersingular` coefficient predicate | `T²−2T+8`, `q=8`; `T²−4T+8`; `T²+2`, `q=2`; `T²−T+2`; `T²+16`, `q=2` | `r=3`: `j=1`: `3·1 ≤ 2·v_2(2) = 2` fails ⟹ rejected; `T²−4T+8`: `3 ≤ 4` ✓; `T²+2`: `2 ≤ 2` ✓; `T²−T+2`: `1 ≤ 0` fails; `T²+16`: accepted but slopes `{2,2}` | predicate as stated; the slope equivalence needs Weil | R05 |
| 4.6 slopes of `(T²−2T+8)(T²−T+8)`, `q = 8` | product expanded | `L = 1 − 3T + 18T² − 24T³ + 64T⁴`, `v_2`: `0,0,1,3,6`, hull slopes `0,1,2,3`, normalised `0,1/3,2/3,1`; `pRank = 4 − 3 = 1` | agrees | none |
| 4.6 `pRank` and ordinariness test | `T⁴−T³−2T+4`; `T⁴−3T³+5T²−6T+4`; `P = 1`; `g=1` symmetric | `sInf{j : 2 ∤ a_j} = 3 ⟹ pRank 1`; `= 2 ⟹ pRank 2`; `P=1`: `0 − 0 = 0 = g`; symmetry `a_j = q^{g−j} a_{2g−j}` forces `p ∣ a_j` for `j < g` under `IsPrimePow q` | `isOrdinary_iff_not_dvd_coeff` true; `pRank_mul` true (reduce mod `p`, `𝔽_p[X]` a domain) | none |
| 4.6 elevation | supersingular `g = 1, 2, 3, 4`; almost ordinary `g = 2` | lattice points strictly below `y = x/2`, `0 ≤ x ≤ g`: `1, 2, 4, 6` = `(g+1)²/4`, `g(g+2)/4`; `2.2.ab_a`: heights `0,0,1/2,1` ⟹ `(2,0)` only ⟹ `1` | agrees with README and LMFDB (`2.2.a_ae` elevation 2, `1.4.ae` elevation 1) | none |
| 4.6 almost ordinary ⟹ slopes `{0^{g−1},1/2,1/2,1^{g−1}}` iff `r ≤ 2` | break heights in `(1/r)ℤ ∩ (0,1/2]` | `r=1`: none; `r=2`: `{1/2}`; `r=3`: `1/3` realised by the `𝔽_8` example | true | none |
| 4.7 `2·card(frobeniusAngles) = 2g + m` | `(T−2)²`; `(T²−2)²`; `T²−T+2` | `[0,0]`: `4 = 2+2`; `[0,0,1,1]`: `8 = 4+4`; one angle: `2 = 2+0` | true | none |
| 4.7 `angleRank = 0 ⟺ supersingular` | `T²−2T+2`: `α²/q = i`; `T²−T+2`: `α²/2 = (−3+i√7)/4`, minimal polynomial `2x²+3x+2` | root of unity ⟹ angle `1/4`; not an algebraic integer ⟹ not a root of unity, angle rank `1`, ordinary | true | none |
| 4.7 angle ranks of the examples | `2.2.ad_f`, `3.2.ad_c_b` | `θ₂−θ₁ = 1/3`; `θ₂+θ₁ = 2/7`, `θ₃+θ₁ = 6/7` | rank `1`, not `2`/`3` | R06 |
| 4.8 CM field | `2.2.ac_c`; `2.2.ad_f`; `2.2.ab_a` | `√2ζ₂₄ = (√3+1)/2 + i(√3−1)/2 ∈ ℚ(i,√3) = ℚ(ζ₁₂)`, disc `144`; `α² − xα + 2` with `x = (3±√5)/2` has discriminant `−3·((√5∓1)/2)²` ⟹ `ℚ(√5,√−3)`, disc `225`; `u²−u−4` has disc `17`, `2312 = 2³·17²` | agree with README and LMFDB | none |
| 4.9 isotypic/squarefree | `T⁴+4 = (T²−2T+2)(T²+2T+2)`; `(T²−2)²`; `(T−2)²` | not isotypic, squarefree; isotypic (`e=2`), not squarefree — LMFDB `2.2.a_ae` `is_simple true` | consistent with "simple iff isotypic" | none |
| 4.10 product formula sign | `∏_{ζ^r=1}(ζT − α)` | `= (∏ζ)(T^r − α^r)`, `∏ζ = (−1)^{r−1}` (constant term of `T^r − 1`) | `(−1)^{(r−1)n}` correct | none |
| 4.10 twists | `T²−3T+3`, `T²+3T+3`, `q=3`; `T²−2`, `T²+2`, `q=2`; `T²+2`, `T²−2T+2` | `r=2`: `3e^{±iπ/3}` both; `r=3`: `±3√3 i` both; `r=4`: `(±√2)⁴ = 4 = (±i√2)⁴`; `(i√2)⁴ = 4 ≠ (1+i)⁴ = −4`, eighth powers `16` ⟹ `twistDegree 8` (LMFDB: `2.2.a_ae`–`2.2.a_a` twist of degree 8) | `twistDegree 2` with exponent `3` as claimed | none |
| 4.10 `weilRoots`, Weil `4`-polynomial `(T−2)²` | `Q` monic integral with roots `±√2` | only `T²−2`; it is Weil for `q=2`; `1.4.ae` is primitive (LMFDB `is_primitive true`, `primitive_models []`) | claim true | none |
| 4.10 `geometricExtensionDegree` | `T²+2`; `T²−2T+2`; `(T²−2)²`; `P = T` | ratios `−1` (order 2); `i` (order 4); `−1`; `0/0 = 0` not of finite order | `2, 4, 2`; junk-free | R10 (no Check in README) |
| 4.11 / 2.6 counts and recursion | `2.2.ac_c`; `2.2.ab_a`; `2.2.ad_f`; `2.2.a_a`; `2.2.a_ae`; `3.2.ad_c_b`; `1.2.ac`…`1.4.e` | `2.2.ac_c`: `s = 2,0,8,8 ⟹ N = 1,5,1,9`; `A_2 = (5−2√3)(5+2√3) = 13`, `A_3 = 25`, `A_4 = 169`; `2.2.ab_a`: `s = 1,1,7,−7 ⟹ 2,4,2,24`; `2.2.ad_f`: `s = 3,−1,0,7 ⟹ 0,6,9,10`; `2.2.a_a`: `s = 0,0,0,−16 ⟹ 3,5,9,33`; `2.2.a_ae`: `s_1 = 0, s_2 = 8 ⟹ 3, −3`; `3.2.ad_c_b`: `s = 3,5,6,−11 ⟹ 0,0,3,28`; genus one: `1.2.ac` `1,5,13,25,41,65`, `1.2.ab` `2,8,14,16`, `1.2.a` `3,9,9,9`, `1.3.ad` `1,7,28,91`, `1.4.ae` `(2^r−1)²`, `1.4.e` `9,9,81` | all README values and LMFDB `curve_counts` agree | none |
| 4.11 `(A_r)` determines `P` iff `q ≥ 2` | `q=1`: `(T−1)(T+1)` and `(T−1)²` | both give `A_r = 0` for all `r`; for `q ≥ 2` the modulus-`q^{r/2}` terms are exactly `−α_i^r` with coefficient `−(multiplicity)` | hypothesis `q ≥ 2` needed and present | none |
| 3.10 Jacobian-compatibility | `2.2.a_ae`; `2.2.ad_f` | `N_2 = −3 < 0`; `N_2 − N_1 = 6`, `N_3 − N_1 = 9 ≡ 0 (3)`, `N_4 − N_2 = 4 ≡ 0 (4)` | rejects / accepts as claimed (LMFDB `has_jacobian` `−1` / `1`) | none |
| 3.6 class-number bounds and `h = 1 ⟹ q ≤ 4` | `q = 4`, `g = 1`; `g = 0` | `(√4−1)^2 = 1 = h` attained by `1.4.ae`, `L = (1−2T)²`; `N_1 = 5 − 4g ≥ 0 ⟹ g ≤ 1`; `g=0`: `1 ≤ 1 ≤ 1` | true | none |
| 3.8 Serre | `(q,g) = (2,1),(2,2),(2,3),(2,4),(3,2),(4,2),(7,3),(16,1)` | `⌊2√q⌋ = 2,2,2,2,3,4,5,8` ⟹ `5,7,9,11,10,13,23,25`; AM–GM on `∏(m+1∓x_i) ≥ 1`; `1.2.c` attains `5` | table correct | none |
| 3.9 Ihara | same table | `(√((8q+1)g² + 4(q²−q)g) − g)/2`: `2, 3.58, 5.15, 6.72, 5.08, 6.55, 14.45, 16` ⟹ floors `5,6,8,9,9,11,22,33`; improvement iff `g > (q−√q)/2` by squaring | table correct; sign of the Cauchy–Schwarz step checked (`S ≥ (g − √…)/2`) | none |
| 3.11 maximal | `1.4.e` | `9 = 4 + 1 + 2·1·2`, `L = (1+2T)²` | true | none |
| 2.8 genus one | `h = L(1) = 1 − a + q = N_1` | `1.2.ab`: `1 − 1 + 2 = 2 = N_1` | true; also Tau Ceti's bijection | none |
| Conv. 13 | elliptic traces over `𝔽_8` | Waterhouse Thm 4.1 (`a = 3` odd, `p = 2`): `p ∤ β`, `β = ±4`, `β = 0` | `±2` impossible, as claimed | none |
| Statability of 3.8 on the pin's carrier | `Nat.card {P : Place k F // P.degree = 1}` | elaborates | headline absent | R03 |
| 5.1 against Tau Ceti | `WeierstrassCurve.IsSupersingular` is torsion-by-`p` over the closure; EllipticCurves Layer 3 line 741 | `p ∣ a ⟺ 2v_p(a) ≥ r` for `r ≤ 2` only | `r ≥ 3` needs Waterhouse 4.1 (a curve fact), consumed from a consumer | R01 |

Ownership against open pull requests: checked for the polynomial objects in the sibling checkouts named in the brief (AbelianVarietiesOverFiniteFields: duplicate, R01; HyperellipticCurves, CharacterSumsOverFiniteFields, SatoTateGroups, FunctionFieldArithmetic: no duplicate) and on main (`roadmaps grep` for `IsWeilPolynomial`, `realWeilPolynomial`, `angleRank`, `weilPower`: only the two siblings).

## Not verifiable

- Stichtenoth, *Algebraic Function Fields and Codes*, 2nd ed. (Springer, paywalled; recorded `uncertified`): Theorem 5.1.15(e)–(f), Corollary 5.1.16, Theorems 5.2.1 and 5.2.3 (the README assigns 5.2.1 to the Riemann hypothesis and 5.2.3 to the Hasse–Weil bound; the author should confirm the two numbers are not swapped), Theorem 5.3.1, Proposition 5.3.3.
- Serre 1983 (C. R. Acad. Sci. 296, 397–402) and Serre 2020 (Documents Mathématiques 18): no open copy found (service and web search); cited by locator only.
- Ihara 1981: open at the University of Tokyo repository (record 39612, file `jfs280320.pdf`), which answered HTTP 503 on three attempts; listed in the scratch `needs-references.toml`.
- Honda 1968: Project Euclid returned a captcha interstitial to the service (empty cache text); Tate 1966: Springer, paywalled (`uncertified`). Both are cited as background only.
- Lidl–Niederreiter 1997: Cambridge, paywalled; no locator given in the README (R11).
- LMFDB knowls (`av.fq.*`, `lf.*`, `g2c.good_lfactors`, `nf.weil_polynomial`): the service and the `knowledge/raw` endpoint return a captcha or 404; the text of the knowls (conventions 5, 7, 9, 10, 12) was not read. The JSON API answered for five of the classes above and returned the interstitial for `2.2.ac_c` and `1.8.ae`.
- Tau Ceti main beyond the pin: `Polynomial.newtonPolygon`/`newtonSlopes`, `WeierstrassCurve.zetaFunction`, the Hermitian function field (cited in prose only).

## Source issues

- none
