# Review of AbelianVarietiesOverFiniteFields (pull request #1720 at da079ae)

**Verdict:** needs changes

Full re-review of the repaired head (1904 changed lines since `da7f7cd`). Section 1 checks the previous review's findings one by one; the rest is a review of the whole folder.

## Repairs of the previous review's findings (R01–R25 of the review at da7f7cd)

| Previous finding | Passage at this head | State |
|---|---|---|
| R01 Deligne carrier parity | §9.1 (lines 1562–1600): Weil lattices in general; even rank and `qʲcⱼ = qᵍc₂ɡ₋ⱼ` only on the no-real-root and admissible subcategories; Checks keep `(ℤ, F=2)` at `q=4` (rank 1) and `(ℤ[√2], √2)` (constant −2) as negative controls | repaired |
| R02 reversed reciprocity | the identity is gone from `Suggested.lean`; §1.0 and §9.1 state `qʲcⱼ = qᵍc₂ɡ₋ⱼ` (checked below on `2.3.b_ac`) | repaired |
| R03 dual Frobenius | §1.1: `(π_A)^∨ = V_{A^∨}`, `(V_A)^∨ = π_{A^∨}`; Check `π = 1+2i`, `π∨ = 1−2i`, `ππ∨ = 5` | repaired (agrees with `centeleghestix2015` line 175) |
| R04 weak equivalence hypotheses | `weakEquiv_iff_one_mem` carries `[Module.Finite ℚ E] [IsReduced E] (hΛ : IsOrder E Λ) (hI) (hJ)` (elaborated type below) | repaired |
| R05 Gorenstein criterion needs reduced `E` | `isGorenstein_iff_forall_invertible` carries `[IsReduced E]` and `IsOrder E Λ` | repaired |
| R06 type one on `E = 0` | §8.5 restricts the type-one equivalences to nonzero `E` and records both suprema `0` on `E = 0`; §8.2 `𝔣_Λ ≠ 0` only for nonzero `E`; nothing on types remains in Lean | repaired |
| R07 polarization sign | §10.1: `b(x,y) = Tr(λ x̄ y)`, `λ` Φ-positive, `b(ιx, x) > 0`; §9.2 `Φ_ε` by positive `p`-adic valuation; witness `b(i,1) = 1` recomputed below | repaired |
| R08 twist invariants | §5.6 keeps dimension, `p`-rank, slopes, angle rank; Check records degrees 2 and 4 with twist degree 8 | repaired |
| R09 `1.2.ac` geometric simplicity | worked example: geometrically simple, Honda exponent 2, multiplicity 2/2 = 1 | repaired |
| R10 one rational point | §7.1 `#A(K) = 1 → g = 0 ∨ q ≤ 4`; §7.5 likewise; Check `ℙ¹/𝔽₅` | repaired |
| R11 quaternion point group | §9.6: scalar `π = s` gives `E(K) ≅ (ℤ/|s−1|)²`, `O/(π−1)O` only in the commutative cases; Check `(ℤ/4)²` of order 16 at `q = 9` | repaired |
| R12 overorder graph | §8.7 defines the graph on realizable overorders and reduces the full lattice to §9.4's hypotheses; Check `q=4`, `T²+4` | repaired |
| R13 resultant obstruction | §10.5 requires both factors of positive degree; Check `1·(X−2)` | repaired |
| R14 missing Part II sections | citations are now F0.2–F0.5, F1.3, F1.5, F1.11, F3.1a–d, F3.2, F3.8, F3.10 and ArithmeticStatisticsPartI's Tate/finiteness targets; all resolved below | repaired |
| R15 Curves cycle | the CurvesOverFiniteFields supplier edge is gone; §1.0 owns the polynomial operations; Curves is listed as a consumer | repaired on this side, but see R01 below (the sibling still owns the same objects) |
| R16 HNR as axiom | §10.4(B) now lists both tables, the gluing targets with Kani's hypotheses, and the char-2/3 lists as proof targets | repaired |
| R17 curve-count finiteness | §10.6: tricanonical embedding, Hilbert scheme K-points, genus 0 and 1 separately | repaired |
| R18 gate | worker gate at this head: every counter 0, `build=0 OK`; `module` header present | repaired |
| R19 nonordinary prime-field polarizations | §10.1 owns a comparison through `T_w`, `D(I)`, `κ`, `c₀`, with the criterion `c/c₀ ∈ E⁺` totally positive from A3.13/A6.15 | repaired (route checked below) |
| R20 Waterhouse headline | `waterhouse` stated on `WeierstrassCurve`, `IsElliptic`, `frobeniusTrace` | repaired |
| R21 morphism formulas | §1.1 `π_A.toHom ≫ f = f ≫ π_B.toHom`; §9.3 `F(f) = π_{A_w} ∘ f = f ∘ π_A` | repaired |
| R22 padding | file reduced to four admitted theorems and the definitions they need | repaired |
| R23 locators | Marseglia and Centeleghe–Stix cited by theorem and arXiv page; all checked below | repaired |
| R24 shape | Summary, Scope, Conventions, Exact supplier contracts, How to read the build, Examples/Dependencies in every layer, Checks for 8.1 and 8.5, `*Needs:*` lines | repaired |
| R25 stale availability | partly: `Module.End.IsSemisimple` is still written `LinearMap.IsSemisimple`, and the "intended module locations" list names declarations that exist nowhere (R02 below) | partly |

## R01 (P2) — Two open pull requests own the polynomial-level objects

**Location:** `TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:356–516` (§1.0), 508 ("the sibling's `IsWeilPolynomial q P_A ∧ IsWeilSymmetric q g P_A`"), 1060 ("the sibling's elevation"), 2123. **Claim:** §1.0 is owned here and CurvesOverFiniteFields consumes it.

**Witness:** `TauCetiRoadmap/CurvesOverFiniteFields/README.md` at its open head (#1729), lines 29 and 174–178: the sibling "consumes every polynomial-level object from here", listing `IsWeilPolynomial`, `IsWeilSymmetric`, `realWeilPolynomial`, `pRank`, `IsOrdinary`, `IsSupersingular`, `IsAlmostOrdinary`, `frobeniusAngles`, `angleRank`, `weilPower`, `virtualCurveCount`, `virtualAbvarCount`, `IsTwistOver`, `twistDegree`, `weilRoots`, `geometricExtensionDegree`; its §§4.6–4.7 (lines 587–641) define the same slopes, elevation (lattice points strictly below the polygon, lines 301–302) and angle rank that §1.0 defines. The same objects, under the same names, are planned in both pull requests, and this README still attributes two of them to "the sibling".

**Repair:** one owner. The merge direction forces the choice: Curves consumes this roadmap's §4.6 and §§5.4–5.6 (its lines 174, 768), so it sits after this roadmap and cannot supply §1.0. Keep §1.0 here, delete the two "sibling's" attributions (write "§1.0's `IsWeilPolynomial …`" and "§1.0's elevation"), and have the Curves pull request consume §1.0 by section instead of planning its Layer 4 (that edit is the sibling's, but approval of this folder should wait for the two texts to agree). The alternative, dropping §1.0 and citing Curves Layer 4, only works if Curves also drops its three edges into this roadmap. Tested: with §1.0 as the owner, the depcheck below reports no cycle, and every §1.0 object this README uses (`weilPower`, `virtualAbvarCount`, `weilRoots`, `geometricExtensionDegree`, `IsTwistOver`, `twistDegree`, `pRank`, `angleRank`) is defined in §1.0.

## R02 (P3) — Declarations cited as supplied that exist neither at the pin nor in the cited roadmaps

**Location:** `README.md:248–262`, used at 566, 1079, 1395, 1422, 1432; also 193 and 1571; 1707. **Claim:** GlobalNumberFields Layer 11 and EllipticCurves Layer 3 supply `maximalOrderPicEquiv` (`Orders/Maximal.lean`), `Orders/Quadratic/Basic.lean`, `Isogeny/Frobenius/{Charpoly,…}.lean` with `isSupersingular_iff_dvd_frobeniusTrace`, `pointCount_eq`, `zetaFunction`, `OrdinaryEnd`, `AlgebraicGroup/Frobenius/FiniteField.lean` with `frobeniusPoints`, `rationalPointsMulEquiv`, and `AbelianVariety/DimensionZero.lean` with `isZero_iff_dim_eq_zero`; Mathlib has `LinearMap.IsSemisimple`; ArithmeticStatisticsPartI has a target `support-abelian-counts`.

**Witness:** at the pin, `TauCeti/NumberTheory/NumberField/Global/Orders/` has `Quadratic.lean` (not `Quadratic/Basic.lean`) and no `Maximal.lean`; a grep of the pinned Tau Ceti for the ten names finds none; `Completed/GlobalNumberFields/README.md:571–600` and `TauCetiRoadmap/EllipticCurves/README.md:683–745` name none of them (EllipticCurves line 741 states the trace criterion as `IsSupersingular E ↔ ringChar F ∣ frobeniusTrace E`, in prose). `Mathlib/LinearAlgebra/Semisimple.lean:55` defines `Module.End.IsSemisimple`; no `LinearMap.IsSemisimple` exists. ArithmeticStatisticsPartI (#1171) has no slug `support-abelian-counts`; its target is "Finiteness of an isogeny class and of unpolarized classes" (line 2550), with Lean name `unpolarizedClasses_finite` (line 1857). Conversely `traceDual`, `IsGorenstein` (`Orders/Gorenstein.lean:124,372`), `Lattice.lean`, `IsSupersingular`/`IsOrdinary` (`EllipticCurve/Supersingular.lean:86,91`) and `brauerCohomologyEquiv` (`Algebra/CrossedProduct/Comparison.lean:267`) are pinned, not "intended".

**Repair:** cite the pinned declarations by their files, and cite the rest by section and prose: EllipticCurves Layer 3 for the trace criterion and the zeta function, EllipticCurves Layer 1 for `End E` of an ordinary curve being an order of `ℚ(π)` (its line 527), Tau Ceti `AbelianVariety.dim_trivial` (`Trivial.lean`) for dimension zero; write `Module.End.IsSemisimple`; name the ArithmeticStatisticsPartI target by its heading. Line 38's "beside the existing order files (`Bass`, …)" should say these are proposed files: none exists at the pin.

## R03 (P3) — Style

**Location:** `Suggested.lean:85, 88` (103 and 135 columns); `README.md:547–548` and `1235–1236` (FunctionFieldArithmetic §§5.3–5.4 listed twice in one `*Needs:*` line); `README.md:1609, 1623` (two `**Checks.**` blocks in §9.1). **Repair:** wrap the two Lean lines at 100 columns, drop the duplicated citations, merge the two Check lists.

## Verified sound

Both files were read in full; no file in the pull request was changed. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` and nothing else.

**Gate and build.** The worker's gate at this head has every counter `0` and `build=0 OK`. Independent elaboration of a scratch copy with `lake env lean` succeeded in 10 s with exactly four `sorry` warnings. `#check @name` for all 15 declarations (and the three pinned carriers used) elaborated; the 4 "dropped binder" leads (`colon`, `multiplierRing`, `IsInvertible`, `WeakEquiv` without `[Algebra ℚ E]`) are definitions whose bodies do not use the ℚ-structure, not defects. Elaborated types compared with the README: `weakEquiv_iff_one_mem` and `isGorenstein_iff_forall_invertible` and `finite_pic` carry `[Module.Finite ℚ E] [IsReduced E]` and `IsOrder E Λ` (§8.4's "E finite-dimensional and reduced, Λ a full order"), the first also both `IsFractionalIdeal` hypotheses (§8.6); `waterhouse` carries `Finite K`, `p.Prime`, `CharP K p`, `0 < r`, `Nat.card K = p ^ r` and the five alternatives of §4.6. No `set_option`, `lemma`, `#eval`, sorry'd data or admitted `example`; imports are `Mathlib` and one existing `TauCeti` module (`PointCount.lean:73,101`: `pointCount` and `frobeniusTrace = q + 1 − pointCount`).

**Padding probe.** Each of the four admitted statements was tried on a scratch copy with `first | simp [..] | rfl | infer_instance | decide | aesop`; all four left unsolved goals. No padding; nothing restates a definition or a Check.

**Headline inventory.** End results of the README: Waterhouse's elliptic list (4.6); the point-count identity and the isogeny relation (Layer 1); endomorphism field and geometric decomposition (Layers 2–5); `p`-rank/slope comparison and the supersingular structure theorem (Layer 6); the point-group dictionary (7, 9.5); the étale-order theory with weak equivalence, Gorenstein and Picard finiteness (Layer 8); Deligne and Centeleghe–Stix (9.2–9.3) with the class count (9.4); the polarization dictionaries and principal polarizability (10.1–10.2); the surface trichotomy and HNR (10.3–10.4); curve-count finiteness (10.6); the label prefix (11.1). Statable at the pins and stated: Waterhouse, the weak-equivalence criterion, the Gorenstein criterion, Picard finiteness. The others need `AbelianVariety.frobenius`/`End.charpoly`, the simple-class carrier, canonical lifts, duals and polarizations, or the Jacobian functor, none pinned (`AbelianVariety/` at the pin: `Basic`, `End`, `Hom`, `Isogeny`, `MorphismGroup`, `Product`, `Trivial`, `Albanese`, `TangentSpace`); the module docstring names each missing carrier. No headline is forced through a stand-in.

**Dependency check** (the required command):

```text
depcheck: 204 roadmaps, 1600 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The merge order lists this roadmap at line 370 after HyperellipticCurves (369); every supplier is earlier (AbelianSchemesAndArithmeticModuli 40, FiniteFlatGroups 45, DeligneWeightsAndPurity 75, ShimuraVarieties 90, ArithmeticStatisticsPartI 94, PELModuli 101, Part II 139, Faltings 142, CMER 150, FunctionFieldArithmetic 332) or on main. CurvesOverFiniteFields and SatoTateGroups (#1729, #1725) cite this roadmap and are not cited by it (apart from R01's shared ownership).

**Cross-roadmap citations resolved** (each at main or the named open head, by heading):

| Supplier | Resolved |
|---|---|
| AbelianSchemesAndArithmeticModuli (#849) | A0.2 (676), A2.4 (1148), A2.5 (1198), A3.1 (1389), A3.3 (1470), A3.5 (1511), A3.6 (1535), A3.9 (1684), A3.13 (1755), A4.1 (1822), A4.5 (1996), A4.9–A4.10 (2344, 2362), A5.1 (2511), A6.1–A6.5 (2815–2905), A6.7 (2937), A6.8 (2957), A6.10–A6.15 (2998–3092), A6.17–A6.19, A6.21 (3344: `π` central, `π^†π = q`, semisimple), A6.30–A6.34 (3698–3756); names `End.degRat`, `End.charpoly_eval`, `End.charpoly_coeff_zero`, `Polarization.rosati`, `frobeniusSemisimple`, `QuadraticAbelianTwist`, `AbelianTate`, `rationalNSAmpleCone`, `toAbelianVariety` all occur there |
| AbelianSchemesAndArithmeticModuliPartII (rev/1405) | F0.1 (2320), F0.2 (2345: reciprocity `a_{2g−i} = q^{g−i}a_i` and `P_{A×B} = P_AP_B`), F0.3 (2371), F0.4 (2397), F0.5 (2409), F0.8 (2422), F1.3 (2541), F1.5 (2587), F1.11 (2615: `inv_v = f_v ord_v(π)/a`), F3.1a–d (2660–2759), F3.2 (2793: `2 dim A = [ℚ(π):ℚ]√[End⁰:ℚ(π)]`), F3.8 (2885: every order containing Frob and p/Frob occurs, nonreal prime-field), F3.10 (2916) |
| ArithmeticStatisticsPartI (#1171) | "Tate's theorem over a finite field" (2544: integral Hom at every prime, commutants, isogeny iff `P_A = P_B`), "Finiteness of an isogeny class and of unpolarized classes" (2550: all-prime marked lattices, `End⁰(A₀)^×`-orbits, finiteness) |
| DeligneWeightsAndPurity (#929) | DWP.1 §1.1 (907: adapter, degree `q^g`, `π_{A_{𝔽_{q^m}}} = π_A^m`), §1.2 (939), §1.3 (950), §1.4 (960), §1.5 (970: `N_m = P_{π^m}(1)`), §1.6 (985), §1.8 (1016), §1.9 (1026); `IsWeilNumber` DWP.0 (557) |
| FunctionFieldArithmetic (rev/1474) | §0.2 (482), §5.3 (1807: `L(1) = h`, `a_{2g−j} = q^{g−j}a_j`), §5.4 (1838: `L_F` = reversed Jacobian Frobenius polynomial, `N_r = q^r+1−Σα_i^r`) |
| ComplexMultiplicationAndExplicitReciprocity (#1254) | §5.2 (779: ordinary order levels, supersingular level pairs) |
| FaltingsFinitenessAndIsogenyTheorems (#1004) | R28.5.1 "Finitely many Weil polynomials" (2019); the name `finite_weilPolynomials` is this README's, not Faltings' |
| PELModuli (#966) | M0.1 `PositiveInvolution` (431), M0.2 `albertTypes` (494) |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879) | R07.2.15 (3538), R07.2.16 (3569: slopes of a Dieudonné module), R07.2.19 (3665) |
| ShimuraVarieties (#933) | §§5.5–5.8 (1431–1488) |
| main: ClassicalArithmeticCompletion §7.4 (14393, `IntegralOrder.IsOrder`), §7.21 (14867, `IsMaximalOrder`), §7.49 (15568, trace-dual bound with the `ℤ[2i]` Check); GlobalNumberFields Layer 11 (Completed, 571); ClassFieldTheory Layers 5 and 10 (920, 1552; `invMap` normalized by arithmetic Frobenius, line 62–66); QuadraticFormInvariants 7B (2413, `brauerCohomologyEquiv_crossedProductClass` 2564); JacobianChallenge Layer E (332; duality 373, Frobenius dual = Verschiebung 385, principal polarization of a Jacobian 390–396); SchemeAndStackFoundations §0.29 (1825), §4.14 (5706), §5.11 (7273); AlgebraicCurves Layers 4, 5, 12 (578, 624, 1468); NewtonPolygons §1.1 (444), §1.3 (482), §2.1 (512), §3.3 (667); EllipticCurves Layer 3 (683) | all present |

**Pinned declarations opened** (file and line at the pins): `Mathlib/Algebra/Module/Lattice.lean:67` (`Submodule.IsLattice`: FG and full span); `Mathlib/LinearAlgebra/Semisimple.lean:55`; `Mathlib/GroupTheory/FiniteAbelian/Basic.lean` (`equiv_directSum_zmod_of_finite`); `Mathlib/NumberTheory/MahlerMeasure.lean` (`finite_mahlerMeasure_le`); `Mathlib/RingTheory/Artinian/{Module,Ring}.lean` (`IsArtinianRing.equivPi`, `isField_of_isReduced_of_isLocalRing`); `Mathlib/FieldTheory/Finite/GaloisField.lean` (`algEquivOfCardEq`); `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean`; `Mathlib/NumberTheory/NumberField/CMField.lean` (`NumberField.IsCMField`); `Mathlib/Algebra/Central/Defs.lean:67` (`Algebra.IsCentral`; the pin also has `Algebra.IsCentralSimple`, line 30); `Mathlib/Algebra/BrauerGroup/Defs.lean` (`IsBrauerEquivalent`); `TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean:73,101,115`; `TauCeti/AlgebraicGeometry/EllipticCurve/Supersingular.lean:86,91`; `TauCeti/AlgebraicGeometry/EllipticCurve/HasseBound.lean:65`; `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:56,61` (`isogenies`, `IsIsogeny`); `TauCeti/NumberTheory/NumberField/Global/Orders/Basic.lean:59` (`NumberFieldOrder`: FG and spanning), `Gorenstein.lean:124,372,394,454`, `Quadratic.lean:75,143`, `Picard.lean:34` (`Pic O = ClassGroup O.toSubalgebra`), `IdealClassMonoid.lean:106,197,265`, `Conductor.lean:38`, `AwayConductor.lean:100,116`, `Functoriality.lean:68,164`, `NarrowPic.lean:55,162`; `TauCeti/FieldTheory/FunctionField/Elliptic/Basic.lean:188` (`degreeOneEquivDegreeZeroClassGroup`); `TauCeti/Algebra/CrossedProduct/Comparison.lean:267`.

**Ownership against open work.** Searched by object (Weil polynomials and their operations, orders in étale algebras, trace duals, weak equivalence, Cohen–Macaulay type, Deligne modules, Frobenius order) in the sibling checkouts the brief lists: the only overlap is CurvesOverFiniteFields Layer 4 (R01). QuaternionArithmetic (#1722) owns the quaternion Gorenstein instance (its 2.2, 2.5), as the Scope says. HyperellipticCurves (#1707) owns curve invariants and cites this roadmap for Euler factors (its line 124). SatoTateGroups (#1725) cites this roadmap (lines 274, 1802). No `Suggested.lean` of a readable roadmap declares a name in `TauCetiRoadmap.AbelianVarietiesOverFiniteFields`. Open pull requests without a checkout in the brief were not checked.

**Source sample.** Every seeded target inspected at its locator in the cached text.

| Target | Text, locator (cache line) | Outcome |
|---|---|---|
| 1.4 Powers | Milne AV II Thm 1.1 and proof, p. 76 (`f5ca4e63` 3105–3147): `P_{π^m}(X) = ∏(X − a_i^m)`, `#A(𝔽_{q^m}) = P_{π^m}(1)` | supports |
| 1.8 Invariants | Waterhouse–Milne Thm 7, p. 57–58 (`2aaafc66` 208–215): isogenous ⟺ same `P` ⟺ same counts over every extension | supports; the converse is correctly consumed |
| 3.3 Real classes | Waterhouse Thm 4.1 proof, printed 537–538 (`7be2bf9d` 630–640): `ef = 2`, real case `e = 2`, quaternion ramified at `p, ∞`; WM Part II Thm 2 (`2aaafc66` 311–316) for `inv_v` | supports |
| 5.4 Endomorphism field | Milne AV II §2 and AS Tate (coincidence count); knowl `av.fq.galois_group` unreadable (CAPTCHA) | supports; knowl not certified |
| 5.7 Number field, Galois group | knowl `av.fq.number_field`/`galois_group` unreadable; Waterhouse Ch. 2 pp. 526–528 for `ℚ(π)` | mathematics checked on `2.2.ad_f` (biquadratic, below); knowls not certified |
| 6.2 Slopes | WM Part II Thm 1–2, pp. 60–61 (`2aaafc66` 308–316); FFG R07.2.16 (3569); Part II F1.3/F1.5 | supports |
| 6.5 Angle rank | knowl `av.fq.angle_rank` (`89fa0033` 90–92): `dim_ℚ span{Arg α_i/2π} ∪ {1} − 1` | supports the convention |
| 8.1 Orders | CAC §7.4, §7.21, §7.49 (main 14393, 14867, 15568); knowl `av.fq.order` unreadable | supports |
| 8.4 Gorenstein, Bass | Marseglia ICM Prop 2.11 p. 4 (`98814ede` 160–166), Prop 3.7 p. 5 (220–234); CS Thm 11 pp. 9–10 (`698eb615` 435–437, even-degree hypothesis 419–428); knowl `bass_zfv` (`3beca660` 90) | supports; `q = p` makes every `w` of even degree |
| 9.1 Deligne modules | Deligne Thm 7, pp. 240–241 (`b96581ff` 113–128); Howe Def 4.1, 4.4 (`02bfcdee` 317–332, 383–399); Marseglia pol. Thm 4.3 pp. 6–7 (`efc1b4d0` 259–272) | supports |
| 9.4 Class set | Marseglia pol. Cor 4.4 (273–281); Waterhouse Thm 7.4 (`7be2bf9d` 1342); Part II F3.8/F3.10 | supports |
| 9.6 Elliptic rings | Waterhouse Thm 4.2 printed 539–540 (716–726), Thm 4.5 (806–814) | supports, including the noncommutative class number |
| 10.3 Surfaces | Weil 1957 not readable (below); A2.4 (`h⁰ = χ`, `deg φ_L = χ²`) at #849 line 1148 | elementary direction supported; Weil's exhaustiveness uncertified |
| 10.4 HNR | Thm 1.2 and Tables 1–2, pp. 1–2 (`f6ff813d` 33–77); Thm 1.4 p. 3 (115–120); Thms 2.1–2.4 pp. 5 (197–216); Thms 3.1–3.2 pp. 6 (253–271); Thm 10.1 p. 22 (1078–1080); Howe char 3 Thm 1.1 (`f75cc6d3` 38–41); Maisner–Nart Tables 1–4 pp. 22–23 (`29369e05` 828–847) | every row of both tables matches the source |
| 11.1 Label prefix | knowl `av.fq.lmfdb_label` (`c9b7d01b` 90–102): `a_1,…,a_g` of the `L`-polynomial, base 26 | supports |

Additional locators checked: Marseglia ICM Prop 4.1 p. 6 (251–272: weak equivalence ⟺ `1 ∈ (I:J)(J:I)` ⟺ same multiplier ring and `I = LJ`), Thm 4.6 pp. 7–8 (326–334); Marseglia pol. Thm 3.2 p. 5 (199–207), Thm 5.4 pp. 9–10 (392–419); CS Thm 1 pp. 2–3 (86–92), §1.7 p. 4 (172–184), §7.4 and Props 44–45 pp. 28–29 (1280–1326); Howe Def 4.7–4.8, Prop 4.9 (420–470); Waterhouse Thm 4.1 printed 537 (619–626: the five cases as stated in `waterhouse`).

**Adversarial pass (README).** `E₂`: `q=2`, `P=T²−2T+2`; `E₅`: `q=5`, `P=T²−2T+5`; `S₂`: `(T²−2)²` at `q=2`; `A`: `2.2.ad_f`; `B`: `2.3.b_ac`. Values computed with exact integer arithmetic and numerical roots (`scratch/py/adv.py`, `curves.py`).

| Statement | Instances | Values | Result |
|---|---|---|---|
| 1.0 reciprocity `qʲcⱼ = qᵍc₂ɡ₋ⱼ` | `B`, `j=0..4`; `T²−2` | (9,9),(9,9),(−18,−18),(27,27),(81,81); `T²−2`: (−2,2) | holds; `T²−2` fails as claimed |
| 1.0 real polynomial | `B`: `T²h(T+3/T)`, `h=x²+x−8` | expands to `T⁴+T³−2T²+3T+9` | holds |
| 1.0 slopes, elevation | `E₅`; `T²+2`; `(T²+2)²`; `T²+4` at `q=4`; `A`; `B`; `S₂`; `2.2.a_ad`; `T⁴−2T²+4` | {0,1},0; {½,½},1; {½⁴},2; {½,½} (v₂=1, r=2); {0,0,1,1},0; {0,0,1,1},0; {½⁴},2; {0,0,1,1},0; {½⁴},2 | all as stated; `(iii)` at `p=2` supersingular as claimed |
| 1.0 angle rank | `E₅`, `E₂`, `A` | arguments irrational, rational (±1/8), irrational | 1, 0, ≥1 as stated |
| 1.0 Weil powers | `E₅` r=2; `E₂` r=4; `A` r=6; `B` r=3; `S₂` r=2 | `T²+6T+25`; `(T+4)²`; `(T²+11T+64)²`; `(T²+8T+27)²`; `(T−2)⁴` | holds |
| 1.0 twists | `T²+2`, `E₂` eighth powers; degree-4 Weil polynomials over `𝔽₂` (35 of them) | both `(T−16)²`, least `n=8`; twists of `A`: `(a,b)=(0,−1)` n=3, `(0,1)` n=12, `(3,5)` n=2 | twist degree 8; `A` has three twists, `twist_count = 4` as stated |
| 1.2, 1.4, 7.1 counts | `E₅`, `E₂`, `A`, `B`, `S₂`, `1.4.ae` (ten terms) | 4,32,148,640; 1,5,13,25; 1,19,76,171; 12,48,1296,7104; 1,1,49,81; 1,9,49,…,1046529 | all as stated; `4 ∣ 32` |
| 1.5, 7.4 curve counts | same | 4,32,…; 1,5,13,25; 0,6,9,10; 5,5,44,89; 3,−3,9,1 | as stated; `S₂` has a negative count |
| worked Jacobians | `y²+(x³+x²+1)y=x⁶+x⁵+1/𝔽₂`; `y²=2x⁵+2x⁴+x³+x/𝔽₃` | brute force 0,6,9,10 over `𝔽₂,𝔽₄,𝔽₈,𝔽₁₆`; 5,5,44 over `𝔽₃,𝔽₉,𝔽₂₇` | equal to the curve counts of `A`, `B` |
| 1.1 dual Frobenius | `E₅` | `π∨ = 1−2i`, `ππ∨ = 5`, `π² = −3+4i` | holds |
| 1.3 reversal | `E₅` | `L = 1−2T+5T²`, `L(1)=4=P(1)` | holds |
| 1.8 invariants | the two `E₅` members | same `P`, groups `ℤ/4`, `(ℤ/2)²` | group not invariant, as stated |
| 2.1 Tate action | `E₅` on basis `1, 2i` | matrix `[[1,−4],[1,1]]`, det 5; inverse det 1/5 | arithmetic convention discriminates |
| 3.3 real classes | `q=4, π=2`; `q=2, π=√2` | `e=2,g=1,(T−2)²`; `inv₂ = ½·2 ≡ 0`, `e=2`, `g=2` | holds |
| 3.4 dimension | `E₅²`; `π=2/𝔽₄` | `4·1·2 = 8`; quaternion dim 4 | holds |
| 4.6 Waterhouse | `q=2,3,4`; `q=49,a=7,14`; `q=9,a=−6` | {−2..2}; {−3..3}; {−4..4}; false, true; true | source cases match the Lean disjunction |
| 5.1–5.3 multiplicities | `E₅²`, `S₂`, `S₂/𝔽₄` | `(v,e,n)=(2,1,2)`,`(2,2,1)`; `(T−2)⁴`, `n=4/2=2` | holds |
| 5.4 extension degree | `T²+2`, `E₂`, `π=2` | orders 2, 4, 1 | holds |
| 5.5 primitivity | `(T−2)²/𝔽₄` | `a²−4=4` has no integer solution | primitive as stated |
| 5.6 twist classes | `E₅`; `1.4.ae` | traces −4,−2,2,4 with n=4,2,1,4; traces −4,−2,0,2,4 with n=2,3,4,6,1 | `max_twist_degree = 4`; `twist_count = 5` |
| 5.7 Galois group | `A` | `η²−8 = −3((√5−1)/2)²`, splitting field `ℚ(√5,√−3)`, `C₂×C₂` | holds |
| 6.1 p-rank | `E₅`, `E₂`, `0` | 1, 0, 0 | holds |
| 6.3 structure, `g ≤ 2` converse | `S₂/𝔽₄`; four symmetric slopes in `(0,1)` with integral break points | `(T−2)⁴ ~ E²`; only `{½⁴}` | holds; `{⅓³,⅔³}` needs `g=3` |
| 6.3 "r even" | `q` nonsquare: conjugation `√q ↦ −√q` makes the lcm of ratio orders even | `E₂`: lcm 8; `S₂`: 2 | holds |
| 7.1 bound | `q=5,g=0`; `q=5,g=1`; `q=4,g=1` | 1; `(√5−1)²=1.528>1`; `(2−1)²=1` | `1.4.ae` admitted, `q≥5` excluded |
| 7.2, 9.5 point groups | `ℤ[2i]/(2i)`, `ℤ[i]/(2i)`, scalar `−3/𝔽₉` | Smith (1,4), (2,2), (4,4) | `ℤ/4`, `(ℤ/2)²`, `(ℤ/4)²` of order 16 |
| 7.3 cyclicity | `E₅` class | noncyclic prime {2}, `2² ∣ 4` | holds |
| 8.1 orders | parity order in `ℤ²`, diagonal `ℤ` | index 2; span dimension 1 | diagonal rejected |
| 8.2 Picard formula | `ℤ[2i]` | `#(ℤ[i]/2)^× = 2`, `#(ℤ[2i]/2ℤ[i])^× = 1`, `[ℤ[i]^×:ℤ[2i]^×] = 2`, `#Pic = 1` | holds |
| 8.3 discriminants | `E₅`, `E₂`, `A`, `B` | `disc = −16 = 2²(−4)`, `N(4i)=16`; `−4`, `N(2i)=4`; `disc P = 900 = 2²·225`, `N(π−V)=9h(3)=9`; `disc P = 39204 = 3²·4356`, `N(π−V)=h(−4)=4`, `zfv_index = 2` | `[ℤ[π,V]:ℤ[π]] = 1,1,2,3` as stated |
| 8.4 Gorenstein | `ℤ[i]`; `ℤ[ε]⊂ℚ[ε]/ε²`; `E=0` | `Rᵗ=½ℤ[i]`, invertible; `ℤε ≠ R`; `0=0` | reducedness needed, as stated |
| 8.5 type | `ℤ`; `E=0`; mod-2 triples order | 1; 0; `Λ/2Λ = 𝔽₂[u,v]/(u,v)²`, socle 2 | holds |
| 8.6 weak equivalence | diagonal `Λ`; `Λ = J`; `ℤ[i], 2ℤ[i]` | `(I:J)(J:I)=2ℤ²∌1`; both false; `Λ ∋ 1` | matches Marseglia Prop 4.1 |
| 8.7 realizability | `q=4`, `T²+4`; `E₅` | {ℤ[i]} ⊊ {ℤ[2i],ℤ[i]}; both occur | holds (Waterhouse 4.2(3)) |
| 9.1 carrier | `(ℤ,2)` at `q=4`; `(ℤ[√2],√2)`; `(ℤ,2)` at `q=2` | rank 1, real multiplicity 1; constant −2; `|2| ≠ √2` | parity only on admissible objects; last rejected |
| 9.2 CM type | `E₅` at `(1+2i)` | `v(1+2i)=1`, `v(1−2i)=0` | one embedding per pair |
| 10.1 sign | `I=ℤ[i]`, `λ=i/2`, `ι=i`, `Φ` usual | `λI = ½ℤ[i] = Īᵗ`; `b(i,1) = Tr((i/2)(−i)) = 1`, `b(1,i) = −1`; general: `b(ιx,x) = Σ_Φ 2lm|φx|² > 0` for `φ(λ)=il, φ(ι)=im` | agrees with Howe's Riemann positivity (Prop 4.9) |
| 10.1 semi-balance | `b(Fx,y)` with `F = π·` | `Tr(λ π̄ x̄ y) = b(x, Vy)` since `π̄ = V` | holds |
| 10.1 prime-field route | `μ = μ₀ ∘ x`, `x ∈ End⁰(B)` Rosati-fixed | `NS_ℚ ≅ E⁺`, ample ⟺ totally positive (A6.15) | criterion `c/c₀ ∈ E⁺` totally positive is the right one |
| 10.2, 10.4 | `(q,a,b)=(2,−1,−1)`, `(2,0,−3)`, `(3,0,−4)`; split `(2;2,1)`, `(2;1,1)`, `(9;6,6)`, `(5;0,0)`; simple `(2;0,−4)`, `(2;−3,5)` | `a²−b=2=q`, prime divisors of 1 vacuous; `b=1−2q`; `b=2−2q`; `|s−t|=1`; `t²−4q=−7`; `s²=4q`, `q=9`; no row; `b=−2q`; no row | matches HNR Tables 1–2 and the worked examples |
| 10.5 resultant | `(X−2,X−1)`, `(X−2,X)`, `1·(X−2)` | 1, 2, degree 0 | holds |
| 10.6 presentation | `g=2,3` | degree 6 in `ℙ⁴`, `6n−1`; degree 12 in `ℙ⁹`, `12n−2` | holds |
| 11.1 prefix | `E₅`; `A` | `(1,5,[−2]) ↦ 1−2T+5T²`; `(2,2,[−3,5]) ↦ −6,4` | injective on these |

**Adversarial pass (Lean).** `R = ℤ[2i]`, `O = ℤ[i]`, `E = ℚ(i)`.

| Declaration | Instance | Values | Result |
|---|---|---|---|
| `IsOrder` | `R`; diagonal `ℤ ⊂ ℚ²` | FG and span 2; span 1 | discriminates |
| `IsFractionalIdeal` | `O` as `R`-module; `0` | rank 2; rank 0 | discriminates |
| `colon`, `multiplierRing` | `(R:O)`, `(O:O)`, `(R:0)` | `2O`, `O`, `E` | correct totals |
| `IsInvertible` | `R`; `O` over `R` | `R(R:R)=R`; `O·2O = 2O ≠ R` | discriminates |
| `WeakEquiv` | `R, 2R`; `R, O` at `(1+i)` | isomorphic; `O/𝔪O` dim 2 vs 1 | discriminates |
| `weakEquiv_iff_one_mem` | `E = 0`; `ℤ[i], 2ℤ[i]` | vacuous ⟺ `1 ∈ 0 = 1`; both sides true | consistent |
| `traceDual`, `IsGorenstein` | `R`; `ℤ[ε]` | `½ℤ+(i/4)ℤ = (i/4)R`; `ℤε ≠ ℤ[ε]` | `[IsReduced E]` carried |
| `isGorenstein_iff_forall_invertible` | `E=0`; `O` | `0·⊤ = 0 = 1`; `(I:I)=O ⇒` invertible | consistent |
| `picSetoid`, `Pic`, `finite_pic` | `R`, `O` | `#Pic = 1`, `1`; `E=0`: one class | consistent |
| `waterhouse` | `q=2`: `a=±2` via `a²=p^{r+1}`; `q=4`: `a=0` via `p%4≠1`; `q=49,a=7`: `p%3=1` | as in the table above | matches `7be2bf9d` 619–626 |

**Repairs of the previous round, recomputed.** The repaired witnesses were all recomputed above: `5=5`, `25=25` for reciprocity; `(1+2i)(1−2i)=5`; `b(i,1)=+1`; `(ℤ/4)²` of order 16; the `q=4` overorder pair; the degree-0 factor; `g=0 ∨ q≤4` on `ℙ¹/𝔽₅`.

## Not verifiable

- LMFDB knowls `av.fq.newton_elevation`, `av.fq.weak_equivalence_class`, `av.fq.order`, `av.fq.galois_group`, `av.fq.number_field`, `av.fq.honda_tate`, `av.fq.frobenius_angles_correctness`, `av.fq.endomorphism_ring_notation`, `av.fq.singular_dimensions`, `av.fq.zfv_rel_disc_norm`, `av.fq.zfv_real_index`, `av.fq.max_cohen_macaulay_type`, `av.fq.one_rational_point`, `av.geometrically_squarefree`: the cached texts are browser-challenge pages, and the sources service reports the host in no licence class for a re-fetch. The numerical conventions they fix (elevation, label indices) were checked against the readable knowls `av.fq.lmfdb_label`, `av.fq.angle_rank`, `av.fq.bass_zfv` and the primary papers only.
- A. Weil, *Zum Beweis des Torellischen Satzes* (1957): no legal copy found by the service; 10.3's exhaustiveness is cited by locator alone.
- Neukirch I §12, Reiner §26, Mumford AV §16, Tate 1966: books or paywalled; cited by locator; the facts used (index formula, Jordan–Zassenhaus, Riemann–Roch) are standard and were checked on instances above.

## Source issues

- **Error** in marseglia2021 (arXiv:1805.10223v3) at Theorem 5.4(a), printed p. 9: the statement says the element `a` with `b(s,t) = Tr(a t̄ s)` must be Φ-positive; its own proof, from Proposition 5.3's Φ-non-positive `S(t,t)`, concludes Φ-non-positive, and the sign depends on which argument is conjugated; it should be Φ-negative for that form, or the form should be `Tr(a s̄ t)`; affects a stated result (the roadmap's 10.1 takes its sign from Howe's Riemann positivity and is unaffected).
