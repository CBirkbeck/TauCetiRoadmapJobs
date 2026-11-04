# Review of CurvesOverFiniteFields (pull request #1729 at d76a420)

**Verdict:** needs changes

Full re-review of `TauCetiRoadmap/CurvesOverFiniteFields/README.md` and `Suggested.lean` at the pins (Mathlib `f6090c70`, Tau Ceti `358314d4`). The gate passes, elaboration passes, the mathematics of every sampled target checks out, and twelve of the previous thirteen findings are repaired. One blocking finding remains: the ownership of the Weil-polynomial theory is still claimed by two open pull requests, now in opposite directions. Five P3 notes follow. No file of the pull request was changed.

## R01 (P1) — Two open heads build the Weil-polynomial theory, each naming the other as its consumer

**Location:** `TauCetiRoadmap/CurvesOverFiniteFields/README.md:61`–62, "The supply contract to `AbelianVarietiesOverFiniteFields` is 1.1–1.11; its geometric comparisons use these constructions"; lines 78–81, "It consumes `IsWeilPolynomial`, … from here"; line 1315, "the polynomial constructions are owned here … it supplies nothing here".

**Claim:** The sibling consumes Layer 1 by section and defines none of its objects.

**Witness:** At the sibling's open head, `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:359`–452 (§1.0, "Polynomial operations for finite-field Frobenius") defines the Weil `q`-polynomial, the reciprocal (symmetric) polynomial, the real Weil polynomial, slopes, `p`-rank, ordinary/supersingular, elevation, angle rank, Weil powers, twists and twist degree, the polynomial geometric extension degree, Weil roots, geometric irreducibility and both virtual counts, with their own API and Checks; its line 2123 reads "CurvesOverFiniteFields consumes §1.0's polynomial operations". Its commit title says "§1.0 owns Weil polynomials". So the previous review's R02 is not repaired: the same objects are built twice, and the two READMEs assert opposite supply directions. (The sibling's `Suggested.lean` declares none of them, so the duplication is README-level only.)

**Repair:** One owner. The merge order lists this roadmap (position 333, right after FunctionFieldArithmetic) and does not list the sibling; this Layer 1 carries the acceptance-test headlines; `HyperellipticCurves` and `AbelianSurfacesModularity` already consume the theory from here. So the consistent resolution is to keep Layer 1 here and have the sibling's §1.0 revert to citations of 1.1–1.11 (a change in the sibling's pull request, recorded here because this folder cannot make it). The alternative, settling ownership in the sibling's §1.0, would mean deleting Layer 1 here, citing `AbelianVarietiesOverFiniteFields` §1.0 in the supplier contracts and placing this roadmap after it. Either way, until the sibling's head matches, lines 61–62, 78–81 and 1315 state as fact something that is false at the sibling's head; at minimum phrase them as the contract offered ("Layer 1 is the polynomial-level supply for the `av.fq` invariants; consumers import 1.1–1.11 by section") rather than as a description of what the sibling does. Test instance: for `P = T² − 2T + 5` at `q = 5` both heads currently construct `h = X − 2` and slopes `{0, 1}` (sibling line 388, here 1.4 and 1.6); after the repair exactly one of them constructs it.

## R02 (P3) — §1.2 and §1.10 need each other, and state the same theorem twice

**Location:** `README.md:433`, "*Needs:* §1.1; … §1.10 for the power-operation corollary only"; `README.md:896`, "*Needs:* §§1.1–1.5; …".

**Claim:** Each target's Needs line is acyclic.

**Witness:** §1.10 lists §1.2 among its inputs and §1.2 lists §1.10, a section-level cycle. The only content §1.10 takes from §1.2 is the Weil-transport equivalence `IsWeilPolynomial q P ⟺ IsWeilPolynomial (q^r) (weilPower hP r)`, which §1.10 itself states (`isWeilPolynomial_weilPower_iff`, line 783) and §1.2 states again (line 431).

**Repair:** Make §1.10's Needs line "§§1.1, 1.3–1.5" (its product, factor and power arguments use no closure property of §1.2), and in §1.2 keep the one-sentence pointer "the change-of-`q` statement is §1.10" instead of restating it. The loop disappears and the theorem has one home.

## R03 (P3) — The nodal control in the §5.1 Check holds only for odd `q`

**Location:** `README.md:1154`–1156, "the nodal `y² = x³ + x²` has `q` projective points but `k(t)` still has `q + 1` places of degree one".

**Claim:** The nodal cubic separates the two counts over every finite field.

**Witness:** Over `𝔽₂` the equation `y² = x³ + x²` has the affine solutions `(0,0)` and `(1,0)`, so the projective count is `3 = q + 1`, equal to the place count of `k(t)`; in characteristic `2` the tangent cone `y² + x² = (y + x)²` is a cusp, not a node. Over `𝔽₃` and `𝔽₅` the counts are `3` and `5`, as stated.

**Repair:** Write "for odd `q`", or use the split node `y² + xy = x³`, which has exactly `q` projective points over every `𝔽_q` (over `𝔽₂`: the origin and the point at infinity).

## R04 (P3) — The layer numbering skips Layer 4

**Location:** `README.md:391`, 980, 1052, 1141: "Layer 1", "Layer 2", "Layer 3", "Layer 5"; `Suggested.lean:269`, "Layer 5".

**Claim:** The README is timeless.

**Witness:** The old Layer 4 became Layer 1 and the old Layer 5 kept its number, so a reader sees Layers 1, 2, 3, 5 and infers a reorganisation. No open consumer cites 5.x (HyperellipticCurves cites 2.1 and 3.1; the sibling cites 1.x).

**Repair:** Renumber "Layer 5" to "Layer 4" and 5.1–5.3 to 4.1–4.3 in the README (headings, the `av.fq` table, the consumer table, Dependencies lines), in the Lean section comment and docstrings, and in the module docstring's list of unstatable headlines.

## R05 (P3) — Two "uncertified" locators are now readable, and one uncertified sentence is not marked

**Location:** `README.md:1081`, "Serre 1983, Stichtenoth Theorem 5.3.1 (uncertified locator)"; `README.md:657`, "record `1.4.ae`, field `angles` (uncertified locator)"; `README.md:1111`–1112, "The knowl `av.fq.curve_point_counts` rejects a class as 'not a Jacobian' exactly when the first two fail".

**Witness:** Serre, *Lectures on N_X(p)* (Collège de France author page; cache `bdba7daa`), Theorem 4.10(a), p. 46 (lines 1641–1644) states `|b₁| ≤ n·m/2` for a monic integer polynomial whose roots are `q`-Weil integers, with `m = [2q^{w/2}]`, and §4.7.2, p. 48 (lines 1737–1743) states `|N_X(q) − q − 1| ≤ g·m` with the equality case; its §4.6.2 proof uses exactly the totally positive `m + 1 ∓ a` of 3.2's route. The LMFDB record `1.4.ae`, fetched through the public JSON API (cache `19144566`, lines 29–32), stores `angles = [0.0, 0.0]`, `real_poly = [1, −4]`, `p_rank = 0`, `newton_elevation = 1`; record `2.2.a_ae` (cache `c68da052`) stores `angles = [0.0, 0.0, 1.0, 1.0]`. The knowl `av.fq.curve_point_counts` returned an empty page in every cached fetch, so its rejection-policy wording is not certified by any readable text.

**Repair:** Cite Serre's lectures (Thm 4.10, p. 46; §4.7.2, p. 48) for 3.2 and add the work to References; cite the API records for the storage convention and drop "uncertified" there; mark the knowl's policy sentence in 3.4 as uncertified or restate it as this roadmap's own criterion ("3.4's first two conditions are the ones the database's rejection uses").

## R06 (P3) — A consumer of Layer 1 is missing from the consumer table, and cites the retired numbers

**Location:** `README.md:1312`–1318, the *Downstream consumers* table.

**Witness:** `TauCetiRoadmap/AbelianSurfacesModularity/README.md:65`–67 and 617 (open pull request by another author, later in the merge order) consume "CurvesOverFiniteFields §§4.1, 4.3, 4.6 and 4.11" for the Weil predicate, finiteness and coefficient bounds, polynomial `p`-rank and ordinarity, and the point-count formula. Those sections are now 1.1, 1.3, 1.6 and 1.11.

**Repair:** Add a row "1.1, 1.3, 1.6, 1.11 — the `q`-Weil predicate, finiteness and coefficient bounds, polynomial `p`-rank and ordinarity, the virtual point counts — AbelianSurfacesModularity", so that the consumer's repair is a lookup. (The consumer's own citations are outside this folder.)

## Verified sound

### Disposition of the previous review (13 findings)

| Previous | Passage at this head | Disposition |
| --- | --- | --- |
| R01 degree-one hypothesis | `Suggested.lean:282` `(hP : P.degree = 1)`; README 1146–1149 and the Check at 1180–1184 (the degree-two cusp witness, counts `1` and `3`) | Repaired |
| R02 second owner | README 61–62, 78–81, 1315; sibling head e6d7112f §1.0 | **Not repaired**; present R01 |
| R03 nonsquare `q` symmetry | README 544–545: "the exponent of `T² − q` is even" | Repaired; `(T² − 2)(T² − 2T + 2)` is the retained non-example (555–557) |
| R04 angle power rule | README 677–681; Check 691–692 (`T² + 2`, `[1/2] ↦ [1, 1]`) | Repaired |
| R05 monicity | README 461–462 "`P(0) = q^g · leadingCoeff P`", 472, 475, 481; Check 505–507 (`2T² + 4`); §1.2 "a monic `P` is Weil iff" | Repaired |
| R06 finite slope count | README 565–567 "`natDegree P − ord₀(P)`"; Checks 601–606 | Repaired |
| R07 twist exponents with zero roots | README 790–795 | Repaired |
| R08 recovery headlines | `Suggested.lean:215`–226 | Repaired; both elaborate, see table rows |
| R09 integrality in convention 7 | README 223–226 "`IsIntegral ℤ α ∧ IsWeilNumber (q : ℝ) 1 α`" | Repaired |
| R10 degenerate Checks | README 490 "all constants, including zero"; 936–937 "`1` for `1` and `0` for positive degree" | Repaired |
| R11 unused definitions | the eight definitions are gone; 36 declarations remain | Repaired |
| R12 structure | Summary, Conventions, Exact supplier contracts, How to read the build, per-target Needs lines, per-layer Examples/Dependencies, Layer 1 first | Repaired; residue in present R02 and R04 |
| R13 locators | theorem/page locators on 2.1–2.3, 3.1–3.3, 3.5, 1.4–1.5, 1.8; `\binom` gone; angle storage cites a record | Repaired as far as readable texts allowed; present R05 names the now-readable ones |

No repair report marks any finding "not actionable in this package"; nothing is re-raised on that basis.

### Gate, dependency check, elaboration, signatures, padding

Worker's gate at `d76a420`: every check `0`, `OK`. Dependency check run again:

```text
depcheck: 204 roadmaps, 1641 edges, 0 problem(s)
```

No UPWARD or CYCLE line; no `moved:` line (the roadmap is listed at position 333, after FunctionFieldArithmetic at 332; its other suppliers are on main or earlier in the order; AbelianVarietiesOverFiniteFields is not in the order and is cited nowhere as a supplier). The diff outside the folder is empty.

A scratch copy of `Suggested.lean` with `#check @name` for all 36 declarations elaborated with `lake env lean`: 22 `sorry` warnings, no other warning or error, 36 printed types. Compared with the README statement by statement: no section binder was lost; `card_degreeOne_eq_pointCount` carries `[Finite k]`, `hF`, `hex`, `genus = 1`, `P.degree = 1` and the coordinate predicate; `classNumber_bounds`, `card_le_four_of_classNumber_eq_one`, `serre_bound`, `ihara_bound` carry `[Finite k]`, `hF`, `hex`; `isSupersingular_iff_isSupersingular_weilPolynomial` carries `[Finite k]`, `[W.IsElliptic]` and the `q ∈ {p, p²}` disjunction.

Padding probe: a second scratch copy replaced each of the 22 `sorry`s by `first | rfl | simp | infer_instance | exact?`; all 22 failed (one error per declaration, no "Try this"). No declaration restates a definition, mirrors a Check or computes a value; the file is headlines plus the eleven definitions they need.

Form: `module` / `public import Mathlib` plus four `TauCeti.*` modules that exist at the pin; one module docstring naming the unstatable headlines (3.1 link theorem, 3.4, 3.5, Layer 2, 1.6's slope statements, 5.2, 5.3) and what each lacks; no `lemma`, `set_option`, `#eval`, `#print`, sorry'd data, `True` placeholder, process word, pull-request number, LaTeX delimiter, `\binom` or `<a id=` anchor (grepped).

### Headline coverage

README headlines: the real-polynomial dictionary and the `±√q` classification (1.4–1.5), the ordinariness test, angle count and angle-rank-zero equivalence (1.6–1.7), the CM theorem (1.8), the Weil-power root/trace/transport/product theorems and the finiteness of Weil roots (1.10), the virtual Hasse–Weil bound and the two recovery theorems (1.11), the class-number bounds and the class-number-one corollary (3.1), Serre (3.2), Ihara (3.3), the point-count identification and the supersingularity comparison (5.1). All are stated. The unstatable ones are named in the docstring with the missing carrier (`L_F`/`N_r` for `r ≥ 2`, the slope multiset, `zetaFunction`, `IsWeilNumber`). The genus-one identity `h_F = N_1(F)` of 2.4 is the pinned bijection `Place.degreeOneEquivDegreeZeroClassGroup` (`TauCeti/FieldTheory/FunctionField/Elliptic/Basic.lean:188`) and is rightly not a headline.

### Supplier citations resolved (every one, at the head or pin named)

- FunctionFieldArithmetic at its open head c5d655e2: §0.2 (line 482), §5.1 (1726: `effectiveDivisorCount`, `placeCount`, `pointCount`, `zeta_eulerProduct`, `zeta_logDeriv`, `pointCount_eq`, `pointCount 0 = 0`, Möbius inversion), §5.2 (1779), §5.3 (1807: `zeta_rationality`, `a_1 = N_1 − (q+1)`, `a_{2g} = q^g`, functional equation, `L(1) = h`), §5.4 (1838: `zeta_eq_schemeZeta`, root modulus, Hasse–Weil), §5.5 (1865: `lPolynomial_constantExtension`, `zeta_constantExtension`), §5.6 (1888: `IsLPolynomialData`, `.unique`, `lPolynomial_isLPolynomialData`). The 1.11 equivalence "reverse `P` satisfies `IsLPolynomialData q g N` iff the first `g` virtual counts equal `N`" was checked against that definition: `P(0)=1`, `deg ≤ 2g`, `a_{2g−j} = q^{g−j}a_j`, and the Newton identities `r·a_r = Σ (N_i − q^i − 1) a_{r−i}`; with `N_i − q^i − 1 = −s_i` these are the Newton identities of `∏(1 − α_i T)`, and the converse follows by induction on `r` using `a_0 = 1`.
- SchemeAndStackFoundations on main §5.11 (line 7273): `weil_bound_via_surfaces`, `weilBound_eq_hasse` (7302).
- NewtonPolygons on main: Conventions 1–4 (80–112; Convention 4 is the `d − ord₀` slope count 1.6 now uses), §2.1 (512: `Polynomial.newtonPolygon`, reversal negates slopes), §3.2 (648: slope concatenation), §3.3 (667: slopes are `−w` of the nonzero roots). With `L = reverse P` this gives slope `v(α_i)`, as convention 9 says.
- EllipticCurves on main Layer 3: `frobeniusTrace` (689), `IsSupersingular E ↔ ringChar F ∣ frobeniusTrace E` (741), the fixed-point model and the trace recursion `t₀ = 2, t₁ = a_q, t_{n+2} = a_q t_{n+1} − q t_n` (774–787), the zeta function (769).
- AlgebraicCurves on main Layer 10 (i)–(iii) (1245–1252); Completed/PolynomialGaloisGroups (splitting-field group, `galActionHom`, `nTj` labels through degree five).
- DeligneWeightsAndPurity (open, via `roadmaps show`): §0.1 (`IsWeilNumber`, `q > 1`, integrality separate), §0.2, §0.3 (`α` Weil at `q` iff `α^r` Weil at `q^r`), §1.6 (curve/Jacobian trace formula), DWP.10 (table line 540). FaltingsFinitenessAndIsogenyTheorems R28.5.1 (line 2019: finiteness at real modulus `r` via `finite_mahlerMeasure_le`). AbelianSchemesAndArithmeticModuliPartII F3.2 (line 2794, Honda–Tate, citing Waterhouse pp. 526–528). WeilConjectures §1.16 (605) and §5.20 (1078).
- Mathlib at the pin, each opened: `dickson_add_two` (Dickson.lean:80), `dickson_one_one_eval_add_inv` (122), `finite_mahlerMeasure_le` (NumberTheory/MahlerMeasure.lean:106), `mahlerMeasure_eq_leadingCoeff_mul_prod_roots` (Analysis/Polynomial/MahlerMeasure.lean:223), `NumberField.Embeddings.pow_eq_one_of_norm_eq_one` (Embeddings.lean:138), `IsCMField` (CMField.lean:69), `IsTotallyReal`/`IsTotallyComplex` (TotallyRealComplex.lean:47, 209), `AdjoinRoot.powerBasis'` (AdjoinRoot.lean:737), the `NumberField (AdjoinRoot f)` instance for `Fact (Irreducible f)` (NumberField/Basic.lean:446), `Matrix.charpolyRev` (Charpoly/Coeff.lean:290), `reverse_mul_of_domain`, `reverse_leadingCoeff`, `reverse_natDegree` (Reverse.lean:276, 259, 256), `card_roots_map_eq_natDegree_of_isUnit_leadingCoeff` (IsAlgClosed/Basic.lean:119), `IsAlgClosed.splits_domain` (66), `IsIntegrallyClosed.eq_map_mul_C_of_dvd` (GaussLemma.lean:78), `galActionHom`, `card_of_separable` (PolynomialGaloisGroup.lean:204, 363), `prod_X_sub_X_eq_sum_esymm` (Vieta.lean:87), `nthRootsFinset` (Roots.lean:400), `padicValInt` (PadicVal/Basic.lean:88), `WeierstrassCurve.LFunction` (LFunction.lean:79), `FiniteField.Extension`, `frobeniusAlgHom`, `ArithmeticFunction.moebius`, `Algebra.lmul` (Bilinear.lean:143), `PerfectField.ofFinite` (Perfect.lean:308, the instance `isElliptic` needs).
- Tau Ceti at the pin: `IsWeierstrassCoordinates` with its five fields and no degree condition (Elliptic/WeierstrassEquation.lean:70), `exists_isWeierstrassCoordinates_of_genus_eq_one` (213), `IsWeierstrassCoordinates.isElliptic` needing `[PerfectField k]`, `P.degree = 1`, `genus ≠ 0` (Nonsingular.lean:126), `genus_eq_zero_of_isSingular` (113), `WeierstrassCurve.pointCount` = affine solutions plus one (PointCount.lean:73), `pointCount_eq_card_point` under `IsElliptic` (86), `frobeniusTrace` (101), `WeierstrassCurve.IsSupersingular p W` as trivial `p`-torsion over the algebraic closure (Supersingular.lean:86), `IsEllipticFunctionField` = genus one plus a degree-one divisor (Elliptic/Basic.lean:68), `classNumber`, `classNumber_pos` (ClassNumber.lean:202, 210), `finite_setOf_isEffective_degree_le` (82), `finite_setOf_degree_le` (BoundedDegree.lean:94), `genus` (Genus.lean:189), `genus_eq_genus_of_constantCompositum_eq_top` (ConstantExtension/Genus.lean:69), `constantCompositum` (GeometricDegree.lean:96), `IsFunctionField` (Basic.lean:51).

Ownership against open work: searched by object (Weil polynomial, real Weil polynomial, Newton slopes of a Weil polynomial, angle rank, Weil power, virtual counts) across main, the board index and the open heads with `roadmaps grep`. Owners/consumers found: AbelianVarietiesOverFiniteFields §1.0 (R01), HyperellipticCurves (consumer of 2.1/3.1), AbelianSurfacesModularity (consumer, R06), CharacterSumsOverFiniteFields, CanonicalModelsAndGonality and SatoTateGroups (neighbours that cite but do not build). Serre's and Ihara's bounds, the maximal-curve criterion and the class-number bounds are built nowhere else.

### Sources read

Waterhouse 1969 (Numdam, cache `7be2bf9d`), Chapter 2, printed pp. 527–528 = marker pages 8–9, lines 248–329: Weil numbers; real-prime cases `P = T ± p^{a/2}` (`a` even) and `ℚ(√p)` (`a` odd, dimension 2); totally imaginary case with `β = π + q/π` totally real, `ℚ(π)` quadratic over `ℚ(β)`, `|β| < 2√q`, and the converse; passing to the degree-`s` extension replaces `π` by `π^s`. Supports 1.4–1.5, 1.8 and the base-change reading of 1.10 as cited. Serre, *Lectures on N_X(p)* (cache `bdba7daa`), pp. 45–48: see R05. LMFDB readable knowls: `nf.weil_polynomial` (cache `6c2cafa4` line 90: monic, integer coefficients, roots of absolute value `√q`, for prime-power `q`; line 92 finiteness), `av.fq.l-polynomial` (`e722abdb` lines 90–95: `L_A` is the reverse of the Weil polynomial, constant term `1`), `av.fq.lmfdb_label` (`c9b7d01b` lines 98–100: the label carries `a_1, …, a_g` of the `L`-polynomial, so convention 5's translation is right), `av.fq.frobenius_angles` (`eb3134a4` lines 90–92: `Arg(α_i)` only; the normalisation is the record's), `av.fq.angle_rank` (`89fa0033` lines 90–92: `dim Span{Arg(α_i)/2π} ∪ {1} − 1` over the nonzero roots; rescaling by `2` does not change it), `av.fq.newton_elevation` (`49cab141` lines 90–100: lattice points strictly below with `0 ≤ x ≤ g`; elevation `0` ordinary, `1` almost ordinary with vertices `(0,0),(g−1,0),(g+1,1),(2g,g)`, maxima `(g+1)²/4` and `g(g+2)/4`), `av.fq.p_rank`, `av.fq.ordinary`, `av.fq.supersingular` (`146b1755`, `511880a0`, `53fdc64a`: geometric definitions; the README's coefficient definitions are its own, with the identification a theorem), `ag.fq.point_counts`, `av.fq.class_number_1` (`5cd585f1` line 90: eight curves). LMFDB API records `1.4.ae`, `2.2.a_ae`, `2.2.ab_a`, `2.2.ad_f` (caches `19144566`, `c68da052`, `4dc35d39`, `308e95ff`): every value the README states for them (`poly`, `real_poly`, `angles`, `angle_rank`, `p_rank`, `slopes`, `newton_elevation`, `geometric_extension_degree`, `curve_counts`, `abvar_counts`, number-field discriminant `2312`/`225`, Galois labels `4T3 = D₄`, `4T2 = C₂×C₂`) agrees with the record.

### Seeded sample

| Target | Text and locator inspected | Assessment |
| --- | --- | --- |
| 1.1 predicate, `q`-Weil numbers | `nf.weil_polynomial` line 90; DWP §0.1–0.3; Waterhouse line 250–253 | The iff with `IsWeilNumber (q:ℝ) 1` for `1 < q` holds in both directions (minimal polynomial divides `P`; the identity embedding gives the modulus). `(P.coeff 0)² = q^n` checked on `T² − 2T + 2` (`4 = 2²`), `T − 2` at `q = 4` (`4 = 4`), `P = 1` (`1 = q⁰`). |
| 1.3 finiteness | Faltings R28.5.1 line 2019; Mathlib MahlerMeasure 106, 223 | The Mahler measure of a Weil polynomial of degree `n` is `max(1,√q)^n` (`T² − 2T + 2`: `2`; `T² − 2`: `2`; `1`: `1`). Coefficient bound `|a_j| ≤ binom(n,j) q^{(n−j)/2}`: `2.2.ac_c` gives `2 ≤ 4√2`, `2 ≤ 6·2`, `4 ≤ 4·2√2`, `4 = 4`. |
| 1.6 Newton polygon, strata | NewtonPolygons Conventions 1–4, §§2.1, 3.3; knowls `p_rank`, `ordinary`, `supersingular`, `newton_elevation` | Slope count `d − ord₀`: `T²` has `0`, `T² + 2` has `2`, `T(T − 2)` has `1`. `pRank` `2, 1, 0, 1, 3` on the five README polynomials (recomputed). Ordinary iff `p ∤ a_g`: for `j < g` symmetry gives `a_j = q^{g−j}a_{2g−j}`, divisible by `p`. Supersingular iff all slopes `1/2` for Weil `P` because `v(P(0)) = n/2` puts the endpoint on the line; `T² + 16` (endpoint height `4`) is the retained non-Weil control. Elevations `0, 1, 2, 4` recomputed. |
| 1.7 angles, angle rank | `frobenius_angles`, `angle_rank` knowls; records `1.4.ae`, `2.2.a_ae`; Mathlib Kronecker 138 | Angles recomputed for all thirteen examples (table below); `θ₂ − θ₁ = 1/3` for `2.2.ad_f` and `θ₁+θ₂ = 2/7`, `θ₁+θ₃ = 6/7` for `3.2.ad_c_b` to `10⁻¹⁴`. Rank-zero iff supersingular: rational angles give `α^{2n} = q^n`, hence slope `1/2`; conversely `α²/q` is integral at every place and of modulus `1`. |
| 1.9 factorization predicates | Mathlib `Irreducible`, `Squarefree`, `normalizedFactors` | `T⁴ + 4 = (T² − 2T + 2)(T² + 2T + 2)` (reducible, squarefree, not isotypic); `(T − 2)²` isotypic `e = 2`; `1` unit. Consistent. |
| 1.10 powers, twists, roots | Waterhouse line 317–318; Mathlib `powerBasis'`, `charpoly`, `nthRootsFinset` | Powers, twist pairs, Weil roots, extension degrees and coincidence counts all recomputed (table). Sign `(−1)^{(r−1)n}`: `∏_{ζ^r=1}(ζT − α) = (−1)^{r−1}(T^r − α^r)`. |
| 1.11 counts | FFA §5.6; Newton identities | Both recovery theorems checked (table); `N_r`, `A_r` and Möbius sums recomputed for every example. |
| 2.1 Weil polynomial and roots | FFA §5.3 lines 1807–1815 | Reverse of `L` is monic with constant term `q^g`; symmetry is FFA's functional equation multiplied through by `q^j`. `1.2.ac`: `T² − 2T + 2`, roots `1 ± i`, sum `2 = 3 − 1`. |
| 2.2 counts from roots | FFA §5.4 line 1842; §5.6 | `N_r = q^r + 1 − s_r`; recursion `s_{r+2g} = −Σ a_{2g−j}s_{r+2g−j}` is `Σ α_i^r P(α_i) = 0`. |
| 2.3 constant-field extension | FFA §5.5 lines 1865–1870; Tau Ceti ConstantExtension/Genus.lean:69 | Inverse roots of `L_{F'}` are `α_i^r`, so `P_{F'} = P^{(r)}`; `1.2.ac`, `r = 2`: `T² + 4`, `h' = 5 = N_2`. |
| 3.1 RH and corollaries | FFA §5.4; DWP §1.6; FFA §5.3 `L(1) = h` | Bounds `(√q−1)^{2g} ≤ h ≤ (√q+1)^{2g}`: `(2,1)` gives `0.1716 ≤ 1 ≤ 5.828`. `h = 1`, `g ≥ 1` forces `q ≤ 4`; at `q = 4` each `|1 − α_i| = 1` forces `α_i = 2`, `L = (1 − 2T)^{2g}`, and `N_1 = 5 − 4g ≥ 0` forces `g ≤ 1` (`1.4.ae` attains it). |
| 3.2 Serre | Serre lectures Thm 4.10, §4.7.2 (R05) | `m = [2√q] = Nat.sqrt(4q)`; AM–GM on `∏(m+1∓x_i) ≥ 1` gives `|Σx_i| ≤ gm`. Table below. |
| 3.5 maximal/minimal | FFA §5.4 root modulus; triangle equality | `Σα_i = ∓2g√q` with `|α_i| = √q` forces every `α_i = ∓√q`; `L ∈ ℤ[T]` then forces `√q ∈ ℚ` when `g ≥ 1`. `1.4.e`: `N_1 = 9`, `L = (1 + 2T)²`. |
| 5.1 point counts, Hasse | Tau Ceti WeierstrassEquation.lean:70, Nonsingular.lean:113/126, PointCount.lean:73/86 | The signature now carries `P.degree = 1`; the cusp witness of the previous review is the README's Check. `isElliptic` needs perfectness (`PerfectField.ofFinite`) and `genus ≠ 0`, both available. The nodal control is R03. |
| 5.2 elliptic zeta | EllipticCurves Layer 3 lines 769–787; FFA §5.1 `zeta_logDeriv`, `pointCount_eq` | `log Z = Σ N_r T^r/r` on both sides once `N_r` is the fixed-point count; `1.2.ac`: `Z = (1 − 2T + 2T²)/((1 − T)(1 − 2T)) = 1 + T + 3T² + …`, `log Z = T + (5/2)T² + …`, matching `N_1 = 1`, `N_2 = 5`. No pinned carrier. |

### Adversarial mathematics table

`E₂ := T² − 2T + 2` at `q = 2`, `O₂ := T² − T + 2`. Power sums by Newton's identities from the coefficients, roots by iteration, all independently of the previous review.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Convention 7, `IsWeilPolynomial` | `E₂`; `(T−1)(T−2)`; `2E₂`; `0`; `T` at `q=0`; `T−1` at `q=1`; `T−2` at `q=4` | root moduli `√2,√2`; `1,2`; right roots, leading coefficient `2`; not monic; `0 = √0`; `1`; `2 = √4` | true; false for every `q`; false; false; true; true; true | none |
| 1.1 `(P.coeff 0)² = q^n` | `E₂`; `T−2`,`q=4`; `T²−3T+2`,`q=2`; `1` | `4 = 2²`; `4 = 4`; `4 = 2²` yet not Weil; `1 = 1` | necessary, not sufficient, as stated | none |
| Convention 7, `IsWeilSymmetric` | `E₂` (`g=1`); `T²−2`; `2T²+4`; `T⁴+T` at `q=0,g=2`; `0` at `g=0` | `1·2=2·1`, `2·(−2)=2·(−2)`, `4·1=2·2`; `j=0`: `−2≠2`; all three equations hold; all `0=0`; `natDegree 0 = 0` | symmetric; not; symmetric non-monic; symmetric non-Weil; symmetric | none |
| 1.4 `P(0) = q^g·lc`, root symmetry | `2T²+4`; `E₂`; `P=0` | `4 = 2·2`; `2/(1+i) = 1−i`; empty multiset | holds without monicity; `aroots_map_div` needs only `q>0` | none |
| 1.4 converse (monic, `P(0)=q^g`, root-stable ⟹ symmetric) | `T²−2` at `q=2` | roots `±√2` stable under `α↦2/α` but `P(0) = −2 ≠ 2` | the constant-term clause is what excludes it | none |
| 1.4 Dickson identity | `a=2`, `x=1+i`, `y=1−i`, `n=0,1,2,3` | `D₀=2`, `D₁(2)=2`, `D₂(2)=4−4=0=x²+y²`, `D₃(2)=8−12=−4=x³+y³` | correct for general parameter | none |
| 1.4 `realWeilPolynomial` and spec | `1.2.ac`, `2.2.ac_c`, `1.4.ae`, `2.2.a_ae`, `2.2.ab_a`, `2.2.ad_f`, `3.2.ad_c_b`; `2T²+4` | `X−2`; `X²−2X−2`; `X−4`; `X²−8`; `X²−X−4`; `X²−3X+1`; `X³−3X²−4X+13`; `2X` with `T·2(T+2/T) = 2T²+4` | all match the README and the records' `real_poly`; the spec holds for non-monic symmetric `P` too | none |
| 1.4 monic `h` of degree `g` | `3.2.ad_c_b`; `2T²+4` | leading coefficient `a_{2g}=1`; `2X` not monic | monicity hypothesis correctly stated | none |
| 1.4 Weil iff `h` real-rooted in `[−2√q,2√q]` | `E₂`; `T²−4T+2`; `2T²+4` | `h=X−2`, `2 ≤ 2√2`; `h=X−4`, `4 > 2√2`, roots `2±√2` of unequal modulus; `h=2X`, root `0` inside but `P` not Weil | both directions; `hm` needed | none |
| 1.4 prefix determines `P` | `2.2.ac_c`; `T⁴`,`T⁴+T` at `q=0` | `(2,2,−2,2) ↦ c₃=−4, c₄=4`; both prefixes `(2,0,0,0)` | needs `q>0`, as stated | none |
| 1.5 real-root classification | `q=2,4,0,1` | `T²−2`; `T∓2`; `T`; `T∓1` | Lean disjunction covers all | none |
| 1.5 parity of real multiplicities | `(T²−2)²`; `(T−2)²`; `(T²−2)E₂` | `P(0)=(−2)²·1 = 4 = q²`; `4 = 4`; `P(0) = −4 ≠ 4` | even for symmetric; odd exponent breaks symmetry | none |
| 1.5 `P = P_real·P_cplx`, symmetric iff `P_real` is | `(T²−2)E₂`; `(T²−2)²` | `P_real = T²−2` (exponent `1`, not symmetric), `P_cplx = E₂` symmetric; `(T²−2)²` exponent `2`, `P(0) = 4` | iff holds through the constant-term criterion | none |
| 1.6 finite slopes | `T²`; `T²+2`; `T(T−2)` | `0`; `1/2,1/2`; `1` plus one zero root | matches NewtonPolygons Convention 4 | none |
| 1.6 slope orientation | `T²+2`, `q=2` | `L = 1+2T²`, heights `(0,∞,1)`, slope `1/2`; root `i√2` has `v = 1/2` | slope `= v(α)` | none |
| 1.6 `pRank` | `T⁴−3T³+5T²−6T+4`; `T⁴−T³−2T+4`; `T²−2T+8`; `(T²−2T+8)(T²−T+8) = T⁴−3T³+18T²−24T+64`; `3.2.ad_c_b`; `1` | `2`; `1`; `0`; `1`; `3`; `0` | correct and additive (`0+1`) | none |
| 1.6 ordinary iff `p ∤ a_g` | the two quartics; `T²−T+4` at `q=4`; `1` | `5` odd/rank `2`; `0` even/rank `1`; `−1` odd, `p=2`, rank `1=g`; `1`, rank `0=g` | both directions | none |
| 1.6 `IsSupersingular` | `T²+2`, `O₂` at `q=2`; `T²−4T+8`, `T²−2T+8` at `q=8`; `T²+16` at `q=2`; `2.2.ac_c`; `2.2.a_ae` | true, false; true (`3≤4`), false (`3≤2`); true with slopes `2,2`; true; true | matches the README; Weil hypothesis needed for the slope iff | none |
| 1.6 almost ordinary, `r ≤ 2` vs `r ≥ 3` | `T⁴−T³−2T+4`; the `q=8` product | slopes `0,1/2,1/2,1`; `0,1/3,2/3,1` | the `(1/r)ℤ` height argument excludes a middle vertex only for `r ≤ 2` | none |
| 1.6 elevation | ordinary `g=2`; heights `0,0,1/2`; supersingular `g=2,3,0` | `0`; `1`; `2 = 2·4/4`, `4 = 16/4`, `0` | formulas match the knowl's maxima | none |
| 1.7 angle multiset | all thirteen examples | `[1/4]`, `[0.38497]`, `[1/2]`, `[3/4]`, `[1/6]`, `[0,0]`, `[1,1]`, `[1/12,7/12]`, `[0.13939,0.68617]`, `[1/4,3/4]`, `[0.12355,0.45688]`, `[0,0,1,1]`, `[0.09926,0.18646,0.75788]` | all agree with the README and the four records | none |
| 1.7 `2·card = 2g + m` | `E₂`; `(T−2)²`; `(T²−2)²`; `1` | `2·1 = 2+0`; `2·2 = 2+2`; `2·4 = 4+4`; `0 = 0` | correct | none |
| 1.7 rank bound, product bound | `E₂·O₂`; `(T²−2)²` | `1 ≤ 0+1 ≤ 2`; angles `0,0,1,1` rational, rank `0 ≤ g=2` | rational angles add no dimension | none |
| 1.7 rank zero iff supersingular | `E₂`; `O₂`; `1`; `2.2.ad_f` | `α²/2 = i`; `α²/2 = (−3+i√7)/4` with minimal polynomial `2X²+3X+2`; empty, both true; irrational angle, rank `1`, slopes `0,0,1,1` | both directions, `g=0` included | none |
| 1.7 power rule for angles | `T²+2`, `r=1,2`; `E₂`, `r=5`; `(T−2)²`, `r=2` | `[1/2]`; `[1,1]` from `(T+2)²`; `5/4 ↦ −3/4 ↦ 3/4` and `(1+i)⁵ = −4−4i`; `[0,0]` | the doubled entry for newly real roots is right | none |
| 1.8 number field, CM | `E₂`; `2.2.ac_c`; `3.2.ad_c_b`; `T−2`; `T²−2` | `ℚ(i)`, disc `−4`; disc of `P` is `144·…`, field `ℚ(ζ₁₂)` disc `144`, real subfield `ℚ(√3)`; `ℚ(ζ₇)`, disc `−7⁵`; `ℚ`; `ℚ(√2)` | the no-real-root guard excludes the last two from CM | none |
| 1.8 Galois groups | `E₂`; `2.2.ac_c`; `3.2.ad_c_b`; `2.2.ab_a` | `C₂`; `(ℤ/12)^× = C₂×C₂` (`4T2`); `C₆`; `4T3 = D₄` of order `8` vs `C₂` for `X²−X−4` | records agree | none |
| 1.10 Weil powers | `E₂` `r=2,4`; `T²±2` `r=2,4`; `2.2.ac_c` `r=12`; `1`; `T` | `T²+4`, `(T+4)²`; `(T∓2)²`, `(T−4)²` both; `(T+64)⁴`; `1`; `T−1` at `r=0`, `T` at `r>0` | multiplicities retained | none |
| 1.10 product formula sign | `T−2`, `r=2`; `P=1` | `(T−2)(−T−2) = 4−T² = −(T²−4)`; `1 = 1` | `(−1)^{(r−1)n}` correct | none |
| 1.10 `weilPowerSum` | `E₂` `r=1..4`; `(T−2)²` `r=2`; `1`; `T` | `2,0,−4,−8`; `8`; `0`; `1` then `0` | correct | none |
| 1.10 twists, twist degree | `T²∓3T+3`; `T²±2`; `T` vs `T`; `T` vs `T−1`; `O₂` vs `E₂` | equal at `r=2` (`T²−3T+9`) and `r=3` (`T²+27`), `2 ∤ 3`; unequal at `2`, equal at `4`; all `r`; none; none | zero-root rule and non-divisibility as stated | none |
| 1.10 twist finiteness | degree-`n` torsion ratios | each ratio lies in a field of degree `≤ (n!)²`, so `φ(m) ≤ (n!)²` | finitely many roots of unity, finitely many `Q` | none |
| 1.10 Weil roots | `(T−2)²`, `T²+4`, `T+2` at `r=2`; `1`; `2T` at `r=1` | `{T²−2}`; `{T²∓2T+2}` (mixed products non-integral); `∅`; `{1}`; `∅` | cardinalities `1,2,0,1,0` | none |
| 1.10 geometric irreducibility | `O₂`; `E₂`; `2.2.ac_c`; `1`; `T−2` | non-torsion ratio; `(T+4)²` at `r=4`; `(T+64)⁴` at `r=12`; unit; `T−2^r` | true, false, false, false, true | none |
| 1.10 extension degree | `T²+2`; `E₂`; `T⁴+4`; `1`, `T`, `(T−2)²`; `2.2.ac_c`, `2.2.ad_f`, `3.2.ad_c_b`, `2.2.ab_a`, `2.2.a_ae` | `2`; `4`; `4` with coincidence counts `4,8,16` at `s=1,2,4`; `1,1,1`; `12,6,7,1,2` | records give `1,6,2` for the last three fetched | none |
| 1.11 virtual counts | all thirteen examples, `r ≤ 6` | `N` and `A` sequences (e.g. `2.2.ac_c`: `N=1,5,1,9,41,65`, `A=1,13,25,169`; `2.2.a_ae`: `N=3,−3,9,1`, `A=1,1,49,81`; `3.2.ad_c_b`: `N=0,0,3,28`, `A=1,29,301,8149`) | agree with the README and the records | none |
| 1.11 Hasse–Weil for virtual counts | `(T²−2)²`, `r=2` | `(−3−5)² = 64 ≤ 4·4·4 = 64` | bound attained, positivity not implied | none |
| 1.11 abelian-count bounds, nonnegativity | `(T∓2)²` at `q=4`; `(T²−2)²` | `A₁ = 1, 9` with bounds `1, 9`; `A_r = (1−2^r)^2 ≥ 0` | even real multiplicities give the sign | none |
| 1.11 Möbius sums | `2.2.ac_c`, `1.2.a`, `ℙ¹` at `q=2`, `2.2.a_ae`, `T²+16` | `4,0,4`; `6,6,0`; `2,6,12`; `−6,6,4`; `N = 3,37,9,−495` | the rejections are the stated ones | none |
| 1.11 recovery from `N₁..N_g` | `q=2,g=1,N₁=1`; `g=0`; `q=2,g=2,N=(1,5)` | `E₂` only (`O₂` gives `2`); `P=Q=1`; `b₁=−2`, `2b₂ = 4+0`, `b₂=2`, then `−4,4` | `IsLPolynomialData` iff, then `.unique`; `P(0)=q^g≠0` makes reversal injective | none |
| 1.11 recovery from all `A_r` | `q=1`: `(T−1)²`, `(T−1)⁴`, `(T−1)²(T+1)²`; `q=0`: `T`, `T²`; `q=2`: `E₂`, `O₂` | all `A_r = 0`; all `A_r = 1`; `A₁ = 1 ≠ 2` | `q ≥ 2` is exactly what makes `q^{|S|/2} = √q` force `|S|=1` | none |
| 1.11 Jacobian compatibility | `1` at `q=2`; `2.2.ac_c`; `T²+2`; `(T²−2)²`; `T²+16` | compatible; `4,0,4`; `6,6,0`; `N₂=−3`; `N₂=37 > N₄=−495` | necessary conditions separate | none |
| 2.1–2.4 | `1.2.ac`; `ℙ¹`; `2.2.a_a`; `O₂` | `T²−2T+2`, `P(0)=2`; `1`; `T⁴+4`, not `4T⁴+1`; `s = 2,1,−3,−5`, `N₂ = 5+3 = 8` | reversal and genus-one recursion agree with EllipticCurves' `t_n` | none |
| 3.1 cosine form | `E₂`, `r=1,2` | `3 − 2√2cos(π/4) = 1`; `5 − 4cos(π/2) = 5` | two-root weighting right | none |
| 3.2 Serre | `(q,g) = (2,1),(2,2),(2,3),(2,4),(3,2),(4,2),(7,3),(16,1)` | `(⌊HW⌋, Serre, ⌊Ihara⌋) = (5,5,5),(8,7,6),(11,9,8),(14,11,9),(10,10,9),(13,13,11),(23,23,22),(25,25,33)` | the README table is exact; `(16,1)` shows Ihara weaker | none |
| 3.2 proof route | `q=2`, `m=2`, `x=2` | `m+1−x = 1`, `m+1+x = 5`, products `≥ 1`, AM–GM gives `−2 ≤ Σx ≤ 2` | signs right; Serre §4.6.2 is the same argument | none |
| 3.3 Ihara | `E₂`; `O₂`; `g=0`; `(2,1)` | `S²−gS = 2 ≤ 6 = q²−q+2qg`; `0 ≤ 6`; bound `q+1`; `3+(√25−1)/2 = 5` | the lower root for `S` gives the stated upper bound for `N₁` | none |
| 3.5 maximal/minimal | `(T±2)²` at `q=4`; `P=1` | `N₁ = 9 = 5+4`, `1 = 5−4`; `q+1` both sides with no square conclusion | `g ≥ 1` guard right | none |
| 5.1 coordinate comparison | `v²+v = u³+u+1` over `𝔽₂` at infinity; at the degree-two place `u=0` | `1 = 1`; `1 ≠ 3` | `P.degree = 1` excludes the second | none (repaired) |
| 5.1 singular controls | cusp `y²=x³` and node `y²=x³+x²` over `𝔽₂,𝔽₃,𝔽₅` | cusp `3,4,6 = q+1`; node `3,3,5` | node has `q` points only for odd `q` | R03 |
| 5.1 supersingularity comparison | `q=2,a=−2`; `q=4,a=4`; `q=8,a=2` | `2∣−2`, `1 ≤ 2v₂`; `2∣4`, `2 ≤ 2·2`; `3 ≤ 2` fails though `2∣2` | `r ≤ 2` is exactly where the polynomial criterion is `p ∣ a` | none |
| 5.3 scalar/integral dictionary | `1+i`; `(1+i√17)/3`; `1` at `q=2` | `X²−2X+2` integral, moduli `√2`; `X²−(2/3)X+2`, purity holds, integrality fails; integral but `1 ≠ √2` | convention 7 now carries integrality | none |
| Lean binders | all 36 declarations | types printed and compared | `hm` in `virtualCurveCount_sub_sq_le` is also `hW.1`, harmless | none |

Unused-hypothesis note (not a finding): `virtualCurveCount_sub_sq_le` could take `hW.1` in place of `hm`.

## Not verifiable

- **Stichtenoth 2009**, Theorems 5.1.15, 5.1.16, 5.2.1, 5.2.3, 5.3.1 and Proposition 5.3.3: no legal full text (Springer). The README marks these locators uncertified; the statements were checked against the supplier roadmaps and by computation.
- **Ihara 1981**, pp. 721–724: the sources service returned HTTP 429 on this run and the Tokyo repository copy was unreachable in the previous one. The bound and its proof route were checked algebraically and numerically; the page locator stays uncertified.
- **Serre 1983** (C. R. Acad. Sci.) and **Serre 2020** (Documents Mathématiques): not fetched; the same bound is readable in Serre's lectures on `N_X(p)` (R05).
- **Tate 1966**, **Honda 1968**, **Lidl–Mullen–Turnwald 1993**: background citations only; not read.
- **LMFDB knowls** `av.fq.weil_polynomial`, `av.fq.number_field`, `av.fq.galois_group`, `av.fq.curve_point_counts`, `av.fq.initial_coefficients`, `lf.newton_polygon`, `lf.newton_slopes`, `g2c.good_lfactors`, `av.fq.frobenius_angles_correctness` and the three `*.bottom` knowls: every cached fetch is an empty page; the rejection-policy sentence in 3.4 and the display conventions attributed to these knowls are uncertified (R05). Record `3.2.ad_c_b` returned a browser check; its values were recomputed instead.
- Claims about Tau Ceti declarations not at the pin (`WeierstrassCurve.zetaFunction`, the Newton-polygon and Hermitian modules): absence at the pin confirmed by search; nothing else about them was checked.
- Ownership against open pull requests whose files the brief did not supply was not checked beyond `roadmaps grep`.

## Source issues

- none
