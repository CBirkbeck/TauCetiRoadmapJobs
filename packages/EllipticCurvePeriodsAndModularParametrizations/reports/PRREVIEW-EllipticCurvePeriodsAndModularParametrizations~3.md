# Review of EllipticCurvePeriodsAndModularParametrizations (pull request #1715 at d55b326)

**Verdict:** needs changes

## R01 (P2) — The route to Vatsal's Theorem 1.11 skips the rational 21-isogeny classes

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:1617`–1624 (“For an optimal E₀/ℚ with reducible E₀[ℓ] and ordinary reduction at ℓ≥7, prove ℓ²∤N and construct an étale isogeny of degree ℓ”) and 1626–1632 (“The passage from these comparisons to Theorems 1.10–1.11 … Use EllipticCurveModularityPartII §§5.0a–5.0b”).

**Claim:** Proposition 5.3 plus the cyclic-degree classification proves the stated theorem target “for ℓ ≥ 7 with E[ℓ] reducible and E ordinary at ℓ, the conjecture holds for the class (Vatsal, Theorem 1.11)” (line 1386).

**Witness:** vatsal line 1446–1448 (§5.6, author p. 44): the proof first excludes the sporadic classes “as explained in Remark 1.12”, then uses that the class has exactly two curves. Remark 1.12 and the following discussion (vatsal lines 221–268, author pp. 7–9) handle the classes with a rational cyclic 21-isogeny (Cremona 162B, 162C) by Stevens' twisting theorem ([Ste89] Theorem 5.1) and a machine comparison of minimal and optimal curves. The hypotheses of Theorem 1.11 hold there: `162b1 = [1,−1,1,−5,5]` (Cremona data, line 573 of the cached table) has E[7] reducible (its class carries the 21-isogeny) and, by point counting over 𝔽₇, `a₇ = 2 ≢ 0 (mod 7)`, so it is good ordinary at 7; its class has four curves, so §5.6's two-curve argument does not apply. Neither Stevens' Theorem 5.1 nor the finite verification is a target, a Check, or a supplier contract anywhere in §4.10.

**Repair:** Either restrict the stated partial result to classes without a rational cyclic 21-isogeny (the only sporadic degrees compatible with ℓ ≥ 7 and good ordinary reduction: the 14-isogeny classes are the CM classes of conductor 49 and their twists, additive at 7), or add the two missing inputs: (i) Stevens' twisting theorem (Stevens 1989, Theorem 5.1: the conjecture for E implies it for E ⊗ χ_D when D is prime to the additive primes of E) as a target with its hypotheses, and (ii) the finite verification for the classes 162b and 162c, stated as Checks giving the minimal and Γ₁-optimal curves of each. Tested on the refuting instance: with (i) and (ii) the class of 162b1 and every twist by D prime to 3 (twists with 3 ∣ D are the class 162c and its twists) is covered; the restriction alternative removes 162b1 from the quantifier. Theorem 1.10 (semistable classes) needs no such step: every sporadic class has additive reduction at a prime (conductors 49, 50, 121, 162, 361, 1225, …), so Lemma 5.4's exception never meets the semistable hypothesis.

## R02 (P2) — The three deep inputs are targets in name only: their Needs lines list carriers, and the project already assigns two of them to another owner

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:1463`–1470 (“CM Iwasawa comparison … These are proved arithmetic targets”), 1519–1535 (“Almost-all-character unit theorem … This target varies K, p, ℓ and η”), 1549–1571 (“CM reduction … Prove that for each q there is n₀ such that … this map is surjective”), and the ownership sentence at lines 75–77.

**Claim:** §4.10 owns and proves Rubin's one-variable main conjecture for χ-components over the fields F_n, Hida's ℓ-adic unit theorem for almost all anticyclotomic characters, and the surjectivity of reduction of conductor-pⁿ CM points onto the supersingular locus.

**Witness:** Each target's `*Needs:*` line names only carriers (PadicMeasuresIwasawaAlgebras §§1.7, 2.1, 4.1–4.6; ImaginaryQuadraticClassNumber §H3.1; GlobalNumberFields Layers 9–10; ModularCurvesPartII §§4.1–4.4, 11.1–11.2) and no route. Rubin's theorem is cited at vatsal line 765–770 to [Rub94] Theorem 2(i), whose proof is the Euler system of elliptic units; Hida's theorem at vatsal lines 885–897 to [Hid03] Theorem 1.1, whose proof is geometric (mod-ℓ Hecke orbits on the Igusa tower); the surjectivity at vatsal lines 1129–1135 to [Vat03] §6 and Cornut [Cor02] (Ratner-type equidistribution). None of these inputs is a layer here or a named supplier section. The project's existing contract for the first two is a declared gap of HeegnerPointEulerSystems on EulerSystemsCyclotomicMainConjecture (HeegnerPointEulerSystems README line 271: “What EulerSystemsCyclotomicMainConjecture must provide (gap:eisenstein-elliptic-unit-inputs): Provide an independent elliptic-unit/Katz main-conjecture and μ input for the imaginary-quadratic finite-order character components”), so the same object now has two prospective owners. The CM-reduction Needs cite ModularCurvesPartII §§4.1–4.4 (cusp strata and Tate charts, lines 1358–1428 of its head) and §§11.1–11.2 (Igusa components at primes dividing the level), which construct neither CM points of conductor pⁿ on X₀(N) nor the supersingular locus at q ∤ N; Vatsal §4.6 is where the surjectivity is used, not proved.

**Repair:** For each of the three: cite the primary source (Rubin, *The “main conjectures” of Iwasawa theory for imaginary quadratic fields*, Invent. Math. 103 (1991), Theorem 4.1, or Rubin 1994 Theorem 2(i) as Vatsal does; Hida, *Non-vanishing modulo p of Hecke L-values*, 2004, Theorem 1.1; Vatsal, *Special values of anticyclotomic L-functions*, Duke 2003, §6, and Cornut, Invent. Math. 148 (2002)), and either give the target a route whose inputs are owned — for Rubin's theorem, the anticyclotomic Euler systems over ring class fields and the Kolyvagin-system bound of EulerSystemsAndKolyvaginSystems §§2.9, 3.8, 3.17 together with a target here for the elliptic-unit norm relations — or state it as a supplier contract on an earlier owner in the declared-gap form (EulerSystemsCyclotomicMainConjecture for the elliptic-unit main conjecture and the unit/μ input, matching the slug HeegnerPointEulerSystems already uses, once this roadmap has a plan to carry the gap). For the CM-reduction target, replace the ModularCurvesPartII §§4.1–4.4 and 11.1–11.2 citations by sections that construct CM points with level structure and the supersingular locus at a good prime, and name the equidistribution input. Tested on the instance that refutes the present text: with K = ℚ(√−23), ℓ = 3, p = 7 (h_K = 3, Δ of order 3), nothing in the cited carriers produces the equality of characteristic ideals or the unit statement; the repaired contract names where it comes from.

## R03 (P2) — Ring class fields and Artin reciprocity are cited to a supplier that does not state them

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:295`–299 (“From ImaginaryQuadraticClassNumber §H3.1: ring and ray class fields, proper ideal classes of every imaginary quadratic order, CM ideal action and Artin reciprocity”), and the Needs lines at 1449, 1535, 1570, 1602.

**Claim:** ImaginaryQuadraticClassNumber §H3.1 supplies the ring class fields H_n = K(pⁿ) with G_n = Pic(O_n) = Gal(H_n/K) used throughout §4.10.

**Witness:** On main, `TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md:83`–91 (§H3.1) constructs level-N modular functions, the maximal-order generator τ_D and the reciprocity action on function values; the words “ring class” occur nowhere in that README (its §H1, line 45, does give Pic(O_f) and the conductor exact sequence). `Completed/GlobalNumberFields/README.md:188`: “The ring class field attached to an order is deliberately absent: it belongs to Class Field Theory.” The owner on main is `TauCetiRoadmap/ClassFieldTheory/README.md`, Layer 13 (line 1799; frozen interface line 594: `ringClassField`, `ringClassArtinMap`, `gal_ringClassField_equiv_pic`, quadratic orders only) and Layer 11 (global Artin reciprocity, line 1683); ArithmeticStatisticsPartVI cites exactly “ClassFieldTheory Layers 11–13 (ring class fields and reciprocity)” for the same object.

**Repair:** Replace the IQCN §H3.1 clause by: ClassFieldTheory Layer 13 (`ringClassField` of the quadratic order O_n and `gal_ringClassField_equiv_pic`) and Layer 11 (reciprocity), ImaginaryQuadraticClassNumber §H1 (Pic(O_f), the conductor sequence giving |G_n| = h_K pⁿ⁻¹(p − (D_K/p))), and keep §H3.1 only for the CM dictionary used by the CM-reduction target; update the four Needs lines. Tested on the instance: for O_1 = ℤ + 7O_K in ℚ(√−23), ClassFieldTheory Layer 13 gives Gal(H_1/K) ≅ Pic(O_1) of order 24, which §H3.1 cannot.

## R04 (P3) — Locators: cache line numbers in the README, one page slip, no source register

**Location:** `README.md:424` (“milne-mf lines 2090, 2576, 2640”), 1266 (“cesnavicius lines 267–282”), 1278, 1285, 1346; `README.md:1012` (“Cremona Theorem 2.1.4, p. 13”); the folder, which has no `sources.toml`.

**Claim:** These are public locators.

**Witness:** The line numbers are those of a worker's cache extraction (they match the cached texts read here), not of any edition; a reader of the README cannot use them. Cremona Theorem 2.1.4 is at ch. 2 line 389, under the running head “14 II. MODULAR SYMBOL ALGORITHMS” (line 369): printed p. 14, not 13 (Theorem 2.1.3 is on p. 13). The register asked for by the previous review (its R03) is still absent.

**Repair:** Delete the “lines N–M” clauses (the theorem and page locators beside them suffice); change p. 13 to p. 14 for Theorem 2.1.4; add `sources.toml` with one entry per cited work (Vatsal's manuscript and the journal version as one entry with a version note).

## R05 (P3) — Duplicated Checks blocks

**Location:** `README.md:727` and 740 (§2.7), 1098 and 1106 (§4.3), 1301 and 1313 (§4.8), 1640 and 1650 (§4.10): each subsection carries two separate `**Checks.**` lists.

**Claim:** House shape is one Checks list per definition.

**Witness:** The second list in each case repeats the heading after a stray blank line and partly restates the first (§4.3: the degree-1 quotients of 11a1/11a3 appear in both).

**Repair:** Merge each pair into one list, dropping the restated bullets.

## Verified sound

A full review: every subsection of the README (38 numbered targets, the arithmetic-input subsection of §4.10, Conventions, supplier contracts, worked examples, boundary checks) and all 392 lines of `Suggested.lean` were read; the change set since 383e7d0 was read line by line and every changed passage is covered below.

### Previous findings, checked individually

| Previous finding | Passage at this head | Assessment |
|---|---|---|
| R01 (P1) CM curves not isomorphic over ℚ(i) | README 1981–1990: “isomorphic over ℚ(ζ₈) … u = ζ₈ gives u⁴ = −1, so u⁻⁴·4 = −4 and \|u\|² = 1 … no such scale lies in ℚ(i)” | Repaired. Computed: ζ₈⁴ = −1, ζ₈⁻⁴·4 = −4, \|ζ₈\|² = 1; the fourth powers of ±1, ±i are all 1. |
| R02 (P1) Vatsal route consumes unowned deep inputs | README 1418–1582: four named targets with Checks; 1591–1624 Needs lines; 1634–1638 | Partly repaired. The inputs are now named, with the right statements (checked against vatsal lines 650–1024, 1108–1157) and the ECMII §§5.0a–5.0b edge resolves at the open head (lines 508–560: list {1,…,19,21,25,27,37,43,67,163}). The targets' own inputs remain unowned and one supplier is wrong: R02 and R03 above. The 21-isogeny gap in the route is new: R01. |
| R03 (P3) source register and §3.2/§3.3 | README 344–348 cites ADS §3.1, §3.2, §3.3 correctly (`Completed/ArithmeticDirichletSeries/README.md:190`–207); Vatsal manuscript locators 2082–2089 | Partly repaired: locators added and the Euler-product section fixed; no `sources.toml` (R04). |
| R04 (P3) WeakBSD code span | README 946–948 in prose | Repaired; `Suggested.lean` declares no WeakBSD and the README claims none. |

### Gate, dependency check, build, binders, padding

The worker's gate at d55b326 passes every check (`gate … depcheck=0 … build=0 OK`). The dependency check run here:

```text
depcheck: 204 roadmaps, 1594 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The roadmap sits at position 318 of the merge order, after GrossZagierAndArithmeticHeights (317); every supplier cited is on main (EllipticCurves, ModularForms, ClassFieldTheory, PadicMeasuresIwasawaAlgebras, ImaginaryQuadraticClassNumber, GlobalNumberFields, ArithmeticDirichletSeries) or earlier in the order (ECMII 180, PeriodsAndSpecialValues 296, GZ 317, NM, MCII, ECM, MSPL, Arakelov, FFIT, EulerSystems…). `git diff --stat origin/main...HEAD` outside the folder is empty.

`lake env lean` on `Suggested.lean`: 36 `declaration uses 'sorry'` warnings and nothing else (18 s). A scratch copy with `#check @name` for all 54 declarations elaborated and printed every type; the four binders the worker flagged (`localPeriod` and `jDenominatorIdeal` without `[NumberField K]`, `analyticRank` and `leadingCoefficient` without `[W.IsElliptic]`) are the generality the Conventions paragraph (lines 120–126) announces, and the positivity, finiteness and nonvanishing theorems carry the instances. One-tactic probe: every one of the 36 admitted theorems was tried with `first | rfl | simp | infer_instance | exact trivial | decide` on a scratch copy; all 36 fail (36 error sites, 0 closed). No padding; no sorry'd data, no `set_option`, no admitted `example`, imports are `import Mathlib` plus five existing `TauCeti.*` modules.

Headline inventory (README): lattice characterization and real shapes (1.1, 1.6), model invariance of the global period (2.5), isogeny lattice inclusion with degree index (2.7), nonvanishing and continuation-independent leading term (3.2–3.4), Stevens' minimal curve (4.10), rank-zero rationality (4.12), Faltings ratio one iff minimal (5.5): all stated. The docstring names the non-statable ones (integral period comparison, optimality, Manin constant, modular degree, congruence theorem, semistable Manin, the §4.10 arithmetic inputs, BSD quotient, Faltings-height comparisons) with the missing carriers; the pinned trees were searched for `faltingsHeight`, a Tamagawa product and a modular-curve quotient and have none.

### Pinned declarations opened

| Object | File at the pin | What was read |
|---|---|---|
| `PeriodPair`, `lattice`, `G`, `g₂ = 60 G 4`, `g₃ = 140 G 6` | `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean:59`, 78, 944, 956, 959 | Two complex periods, span lattice; the invariants as the README states them. |
| `localPolynomial`, `LFunction`, `LSeries` | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:43`–50, 79, 84 | Good `1 − aX + qX²`, split `1 − X`, nonsplit `1 + X`, additive `1`: README 3.2's four bad factors are Mathlib's. |
| `covolume_div_covolume_eq_relIndex'`, `covolume_comap`, `covolume_eq_det` | `Mathlib/Algebra/Module/ZLattice/Covolume.lean` | Index as covolume ratio (5.5), transport, determinant form (2.3). |
| `variableChange_c₄`, `c₆` | `Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean` | u⁻⁴, u⁻⁶ laws (1.3). |
| `Submodule.colon`, `mem_colon_singleton` | `Mathlib/RingTheory/Ideal/Colon.lean:35`, 48 | `r ∈ N.colon {x} ↔ r • x ∈ N`: `jDenominatorIdeal` is the integrality ideal (5.3). |
| `prod_eq_abs_norm`, `embedding_of_isReal_apply`, `mk_conjugate_eq`, `card_add_two_mul_card_eq_rank`, `Ψ₂Sq`, `absLogHeight₁`, `instAdmissibleAbsValues`, `splits_iff_roots_eq_three` | the Mathlib files named in the supplier contracts | present at the pin. |
| `reducedMinimalModel`, `IsReducedMinimal`, `exists_smul_eq_reducedMinimalModel`, `existsUnique_reducedMinimal`, `reducedMinimalModel_smul` | `TauCeti/AlgebraicGeometry/EllipticCurve/MinimalModel/Reduced.lean` | present. |
| `minimalDiscriminantIdeal_smul`, `…_eq_span_of_isGlobalMinimal`, `isGlobalMinimal_iff_…`, `IsSemiGlobalMinimal`, `globalMinimalityClass`, `IsSemistable` | `…/MinimalModel/DiscriminantIdeal.lean`, `GlobalMinimalModel.lean`, `ObstructionExponent.lean`, `Class.lean`, `Semistable.lean` | present. |
| `regulator_eq_one_of_finrank_eq_zero`, `regulator_eq_abs_det_neronTateGramMatrix`, `neronTatePairing_apply/_self`, `canonicalHeight_parallelogram_law`, `PointModTorsion`, `fg_point_of_numberField`, `hasse_bound` | `…/MordellWeil/Regulator.lean`, `CanonicalHeight/Basic.lean`, `MordellWeil/PointModTorsion.lean`, `FinitelyGenerated.lean`, `HasseBound.lean` | present. |
| `Newform N k`, `peterssonInner`, `peterssonInnerFd`, `peterssonInnerCosets_definite`, `periodMap_mk`, `periodMap_injective`, `rawPairing`, `degreeZero`, `qExpansion` | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`, `Petersson/*.lean`, `ModularSymbols/Period/Map.lean`, `Period/Injective.lean:148`, `ModularSymbols/Basic.lean` | present. |
| `pullbackDifferential_negIsogeny_invariantDifferential`, `pullbackDifferential_zsmul_id_invariantDifferential`, `existsUnique_smul_invariantDifferential` | `…/Isogeny/Differential.lean`, `Isogeny/Hom/Differential.lean`, `Affine/InvariantDifferential.lean` | present. |

### Cross-roadmap citations resolved

Main: EllipticCurves Layers 2, 4, 4.5a (905), 4.5b (1013), 6 (1200), 7 (1262; the explicit real-period integral and the Cassels block pinned to ℚ, lines 1288–1342); ModularForms Layer 8 (`heckeAlgℤ`, line 870); ClassFieldTheory Layers 11, 13; PadicMeasuresIwasawaAlgebras §§1.7 (909), 2.1 (1148), 4.1–4.6 (2361–2710); ImaginaryQuadraticClassNumber §H1 (45), §H3.1 (83); GlobalNumberFields Layers 9 (508), 10 (531); ArithmeticDirichletSeries §§3.1–3.3 (190–207). Open heads: ModularCurvesPartII §§1.1–1.4, 4.1–4.4, 5.1, 5.17, 7.1–7.6, 11.1–11.2, 14.12, 14.15, 16.2, 16.5 (all present; §16.5 assumes primitive level N ≥ 5, harmless for conductors of elliptic curves); EllipticCurveModularity R29.3–R29.6 with “Elliptic coefficient summability” (1860) and `exists_entire_completed_LSeries` (1930); EllipticCurveModularityPartII §§5.0a–5.0b (508, 538); GrossZagierAndArithmeticHeights §§3.1, 3.5, 3.7, 3.8, 3.9, 3.10 (1083–1306; §3.9 states `|c_φ|²·8π²(f,f) = deg φ · i∫ω_E∧ω̄_E` as 4.7 quotes it); PeriodsAndSpecialValues PS.1.1 (403), PS.1.7 (593), PS.1.8 (618), PS.3.3 (847, `L* = L^{(r)}(0)/r!`); ArakelovGeometryAndAbelianHeights §§2.1–2.3, 2.7, 2.9, 3.1, 3.4 with `faltingsHeight_eq`, `faltingsHeight_11a2`, `faltingsHeight_model_nonexample`, `stableFaltingsHeight_le`, `_eq_of_semistable`, `_congr_geometric`; FaltingsFinitenessAndIsogenyTheorems R28.6.5 (2767), R28.6.6 (2788); NeronModelsAndSemistableAbelianVarieties §1.1 (706, the mapping property); ModularSymbolsPadicLFunctions §§0.4, 0.8, 1.2; NoncommutativeAndEquivariantIwasawa §4.3 (`RubinTwoVariableMainConjecture`, line 1905, a named hypothesis for a rational CM curve and p ≥ 5, as the README says). The resolver's 11 leads are ten knowl identifiers and `AbelianVariety.faltingsHeight`, an Arakelov-roadmap target: none is a missing library name.

Ownership by object: no roadmap on main or at the open heads builds the equation-indexed period lattice, the local/global periods over K, the BSD quotient over K, the Manin constant as a curve invariant, Stevens' curve or the Faltings ratio; EllipticCurves Layer 7 explicitly leaves the general-K period to “the complex-analytic successor roadmap”. Elliptic units and the CM main conjecture occur only as hypotheses or gaps elsewhere (EulerSystemsAndKolyvaginSystems 233; NoncommutativeAndEquivariantIwasawa §4.3; HeegnerPointEulerSystems gap line 271; ModularIwasawaMainConjectures 179–181): R02.

### Seeded source sample

| Target | Text read, locator | Conclusion |
|---|---|---|
| 1.3 scaling law | `variableChange_c₄/c₆`; MCII §1.3 (head line 446: `g₂(uΛ) = u⁻⁴g₂`, differential multiplier u, degree `[Λ′:uΛ]`) | Supports the statement; the covolume factor \|u\|² is the determinant of multiplication by u on ℝ². |
| 1.6 real shapes | ec.q.period_lattice lines 92–98 (rectangular ⟨x, yi⟩ for Δ > 0, ⟨2x, x+yi⟩ for Δ < 0, real period 2x in both cases); EllipticCurves Layer 7 (the integral `2∫_{D_W>0} dx/√D_W`); Silverman Advanced V.2.3.1 not readable | Supports shapes, component count and the comparison; the manifold statement rests on the uncertified Silverman locator. |
| 2.1 embedded equations | `embedding_of_isReal_apply`, `mk_conjugate_eq` at the pin | Supports. |
| 2.2 real local period | ec.q.real_period line 90 (least positive real element times the number of components); EllipticCurves Layer 7 | Supports. |
| 2.7 isogenies and lattices | MCII §1.3; Tau Ceti `pullbackDifferential`, `existsUnique_smul_invariantDifferential`, `pullbackDifferential_zsmul_id_invariantDifferential`; vatsal lines 124–130 (n_φ ∈ ℤ, étale iff n_φ = ±1, degree-p dichotomy) | Supports, including the signed scalar and the integrality through the Néron model. |
| 3.1 convergence input | EllipticCurveModularity “Elliptic coefficient summability” lines 1860–1923 | All number fields, all primes, Re s > 3/2: the owner is right. |
| 3.6 BSD quotient / Ш_an | ec.analytic_sha_order lines 96–105: `|D_K|^{1/2} L^{(r)}(E,1)/r! · #tors²/Reg_NT · 1/(Ω ∏c_𝔭)` | Supports 3.6 exactly, including the unnormalised regulator. |
| 3.7 conjectures | ec.q.bsdconjecture lines 92–94; EllipticCurves Layer 7 lines 1288–1305 (Cassels block, stretch, pinned to ℚ) | Supports; the isogeny-invariance clause is correctly scoped to ℚ. |
| 4.2 X₀(N)-optimality | ECM R29.5 (1472–1600; 11a3 least quotient degree 5, line 1577); vatsal Lemma 1.5 lines 177–183 | Supports both the degree-1 and the surjective-homology forms. |
| 4.7 Petersson formula | GZ §3.9 (1292–1304); cremona ch. 2 line 2561–2563 (Proposition 2.15.1, printed p. 48: `4π²‖f‖² = deg(φ)Vol(E_f)`); Arakelov §2.1 | `i∫dz∧dz̄ = 2·area` turns GZ's identity into `deg φ · covol = 4π²c²‖f‖²`; Cremona is the c = 1 case. |
| 4.8 congruence modulus | ARS congruence paper in Stein's collected works (b9cc0320 lines 63317–63326: Definition 2.1, Theorem 2.2 `m_E ∣ r_E`, `ord_p N ≤ 1 ⇒ ord_p r_E = ord_p m_E`; Table 1 line 63341 `54B1 2 6`); cesnavicius lines 153 (Prop. 2.2), 269 (Ex. 2.8), 277 (Lemma 2.9), 289 (Lemma 2.10), 312 (Thm 2.11), pages 4–8 | Supports the two parts and the p = 2 route. |
| 5.1 `h = −½ log covol` | faltings lines 193–219 (§3, printed p. 354: degree of a metrised line, `‖α‖² = (i/2)∫α∧ᾱ`); Arakelov §3.1 `faltingsHeight_eq`, §2.2 covolume | Supports; the Néron lattice index is 1 for ω_min. |
| 5.4 isogeny change | faltings lines 361–364 (Lemma 5, printed p. 358: `h(A₂) = h(A₁) + ½ log deg φ − (1/[K:ℚ]) log #(s*Ω)`); Arakelov §2.3 | Supports 5.4 in exactly this shape. |
| 5.5 Stevens' curve and ratio | vatsal lines 151–157 (Theorem 1.3, three equivalent conditions), 158–159 (Remark 1.4), 100–101 (indices 5 and 25 in class 11); ec.q.faltings_ratio not readable | Supports (1)⇔(3) and the indices. |
| 5.6 height through ‖f‖ | derived from 4.7 and 5.1; values recomputed below | Supports. |

### Adversarial mathematics table

Values are my own computations; decimals recompute the displayed inputs.

| Statement | Instance | Left side | Right side / control | Result |
|---|---|---|---|---|
| 1.1 invariants of 11a1 | c₄ = 496, c₆ = 20008 | g₂ = 124/3, g₃ = 2501/27 | g₂³ − 27g₃² = −161051 = −11⁵ | agrees with Δ |
| 1.1 CM uniqueness | g₃ = 0, u = i; g₂ = 0, u = ζ₆ | i⁴ = 1, ζ₆⁶ = 1 | i⁶ = −1, ζ₆⁴ ≠ 1 | exponent choice necessary |
| 1.1 excluded pair | (g₂, g₃) = (3, 1) | 27 − 27 = 0 | ellipticity requires ≠ 0 | excluded |
| 1.2 j of 11a1 | above | 1728 g₂³/Δ = −122023936/161051 | = −2¹²·31³/11⁵ | matches the ECMII check value |
| 1.3 scaling | Λ = ⟨2, 3i⟩, c = 2 | basis ⟨4, 6i⟩, covolume 24 | \|2\|²·6 = 24 | agrees |
| 1.3 sign | c = −1 | −Λ = Λ, covolume 6 | signed −6 rejected | absolute value needed |
| 1.5 conjugation | ⟨2, 1+3i⟩ | determinants 6, −6 | covolumes 6, 6 | agrees |
| 1.6 shapes | ⟨2, 3i⟩; ⟨2, 1+3i⟩ | least real period 2, 2 | Ω = 4, 2 | component factor right; 1 ∉ ⟨2, 1+3i⟩ |
| 2.3 complex period | ⟨2, 3i⟩ | 2·covol = 12 | \|∫dz∧dz̄\| = 2·6 | factor 2 is the definition |
| 2.4 product law | ℚ(√5), u = 2 | each real factor ×2 | \|N(2)\| = 4 | only the product scales by the norm |
| 2.5 base change | 11a1 to ℚ(i) | 2·covol = 3.7030875 | Ω² = 1.6108925 | the two differ, as 2.5 says |
| 2.5 defect | y² = x³ + 16 | 4096^{1/12}·Ω_min/2 | Ω_min | prefactor 2 restores |
| 2.7 étale and non-étale | 11a1→11a2, 11a1→11a3 | α = 1, 5 | degree 5 both; α·α̂ = 5 | both extremes occur |
| 3.2 Mathlib bad factors | split, nonsplit, additive | 1 − X, 1 + X, 1 | LFunction.lean lines 47–50 | README agrees with the pin |
| 3.3 continuation domain | {Re s > 3/2}; disc \|s−1\| < 1/4 | 1 ∉ U; 2 ∉ U | rejected, rejected | nonvacuous predicate |
| 3.4 factorial | germ 3(s−1)² | F″(1)/2! = 3 | F″(1) = 6 | matches PS.3.3's check |
| 3.5 regulator | rank 0; rank 1, d = 2, Gram 6 | 1; 6 | 1/2⁰; 6/2 = 3 | relative/normalised distinguished |
| 3.6 Ш_an of 11a1 | Ω = 1.2692093, #tors = 5, c₁₁ = 5 | L(1) = 0.2538419 | Ω·5/25 = 0.2538419 | Ш_an = 1 |
| 4.1 level-37 integral comparison | 38 Manin generators | ranks 33, 32, 32 over ℚ, 𝔽₂, 𝔽₃ (previous review, not recomputed here) | torsion-free quotient rank 5, cuspidal 4 = 2g | quotient by torsion necessary |
| 4.4 lattice law | c = 1 | Λ_E = Λ_f, area ratio 1 | c² = 1 | consistent |
| 4.5 non-optimal constant | 11a2; 11a3 | 1·1 = 1; 1·5 = 5 | degrees 5, 5 | constant ≠ degree |
| 4.7 Petersson | 11a1 | 4π²·0.0469001 = 1.8515417 | deg φ·covol = 1.8515437 | agree to the displayed precision |
| 4.8 congruence modulus | 54b1 | r = 6, m = 2, r/m = 3 | v₃(m) = 0 ≠ v₃(r) = 1 and 9 ∣ 54 | exception exactly where allowed |
| 4.9 covolume criterion | 11a1 | covol Λ_E = 1.8515437 | 4·covol Λ_f = 7.4061750 | c = 1 |
| 4.10 ring-class orders | K = ℚ(√−23), p = 7 | \|G₁\| = 3·8 = 24, \|G₂\| = 168, \|G₀\| = 3 | n = 0 formula gives 24/7 | formula scoped to n ≥ 1 |
| 4.10 splitting data | same K, ℓ = 3 | −23 ≡ 1 (mod 3): split; −23 ≡ 5 (mod 7), squares {1, 2, 4}: inert | gcd(3, 8) = 1 | hypotheses hold with h_K = 3 |
| 4.10 Euler factor | ℓ = 3; ℓ = 5 | 1 − 3a; 1 − 125a | ≡ 1 (mod ℓ) | unit |
| 4.10 interpolation constants | ℓ = 3, m = 1, 2 | (k−1)! = 1, 6 | u = 4: u^m − 1 = 3, 15 | arguments in the maximal ideal |
| 4.10 Theorem 1.11 route | 162b1 = [1,−1,1,−5,5] | #E(𝔽₇) = 6, a₇ = 2 ≢ 0 (mod 7) | class has 4 curves and a 21-isogeny | hypotheses hold, two-curve step fails: R01 |
| 4.10 Theorem 1.10 route | sporadic degrees 11, 14, 15, 17, 19, 21, 27, 37, 43, 67, 163 | conductors 121, 49, 50, 14450, 361, 162, 27, 1225, CM | all additive somewhere | no semistable sporadic class |
| 4.10 Vatsal 1.3 indices | class 11 | Λ(11a3) ⊂ Λ(11a1), Λ(11a2) | indices 5, 25 | vatsal lines 100–101 |
| 4.12 rationality | 11a1 | L(1)/Ω = 1/5 | Ш_an = (1/5)·25/5 = 1 | rank-zero corollary |
| 5.1 height | 11a1 | −½ log 1.8515437 = −0.3080099 | Arakelov `faltingsHeight_11a2` −0.3080098 | agree |
| 5.3 stable correction | 27a3, \|Δ\| = 27, denom j = 1 | −log 27/12 = −0.2746531 | h_st − h | agree |
| 5.3 denominator ideal | j = 0; j = 1728; j = 1/2 | (1); (1); (2) | colon membership | unit ideal, not zero |
| 5.4 isogeny change | 11a1→11a2 (α = 1); →11a3 (α = 5) | +½ log 5 = 0.8047190; ½ log 5 − log 5 | h(11a3) = −1.1127288 | agree with worked examples |
| 5.5 ratio | 11a1, 11a2, 11a3 | 5, 25, 1 | exp(2(h − h_min)) | integers |
| 5.6 height from ‖f‖ | 11a1; 37a1 | −0.3080093; −0.9965421 | −½ log covol: −0.3080099; −0.9965422 | agree to the inputs' precision |
| Worked example 32a1/64a1 | u = ζ₈ | u⁴ = −1, u⁻⁴·4 = −4, \|u\|² = 1 | ±1, ±i have fourth power 1 | previous R01 repaired |

## Not verifiable

- **Silverman, AEC (2nd ed.)** III.1, VI.5.1, VII.1, VIII.9, X.4, C.16 and **Advanced Topics** Corollary V.2.3.1: DOIs 10.1007/978-0-387-09494-6 and 10.1007/978-1-4612-0851-8 are paywalled; the statements were checked against Cremona, Milne, the knowls and the suppliers instead.
- **BLR §1.2**, **Mazur Corollary 4.1**, **Manin 1972 §5**, **Abbes–Ullmo Theorem A**: paywalled or unresolved; checked through ARS Theorems 2.3–2.5 (ars-manin lines 84–112, printed p. 619) and NeronModels §1.1.
- **Stevens 1989** Theorem 2.3, Conjectures I–II, Theorem 5.1: not readable (the author-page URL failed certificate verification in the previous round; not retried past that). Theorem 2.3 was checked as vatsal Theorem 1.3; Theorem 5.1 (needed by R01) only as vatsal lines 244–246.
- **Hida 2004** Theorem 1.1: resolves only to a paywalled de Gruyter page; used as restated in vatsal lines 885–904. Recorded in `needs-references.toml` as wanted, not needed for any finding.
- **Rubin 1991/1994**, **Vatsal 2003 Duke §6**, **Cornut 2002**: not fetched; R02 concerns their absence from the README, not their content.
- **LMFDB knowls** `ec.q.optimal`, `ec.q.modular_degree`, `ec.q.manin_constant`, `ec.q.faltings_height`, `ec.q.faltings_ratio`, `ec.regulator`: only browser-check pages are cached; the formulas were checked against the other texts.
- The journal pagination of Vatsal 2005 was not compared with the manuscript; all locators above are manuscript pages.

## Source issues

- **Misprint** in vatsal at §4.6, author p. 35 (line 1139): the source says the stabilisation `L_n = L_m·H_n` follows from Corollary 2.7; it should cite Corollary 3.21 (Corollary 2.7 concerns fields of definition of fibre points); affects nothing.
- **Misprint** in vatsal at Example 1.2, author p. 3 (line 73): the source says the level-11 newform is η(z)η(11z); it should be η(z)²η(11z)²; affects nothing.
- **Misprint** in vatsal at the proof of Theorem 3.11, author p. 27 (line 870): the source says “page Lemma 1.10, page 105”; it should give one locator, Lemma 1.10 on p. 105 of de Shalit; affects nothing.
- **Gap** in vatsal at §4.6, author p. 35 (lines 1129–1134): the source says the reduction map `C_n → S_q(N)` is surjective for large n, citing [Vat03] §6; it should state the hypotheses of that result (q inert, q ∤ ND_K ℓ p) at the point of use; affects the proof (the roadmap must import them: R02).
