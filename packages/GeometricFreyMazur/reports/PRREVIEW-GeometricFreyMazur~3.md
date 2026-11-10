# Review of GeometricFreyMazur (pull request #2130 at 6017ad8)

**Verdict:** needs changes

This is a full review of the head that the previous review also read (the folder has not changed since). There are five P3 findings and nothing blocking:
- one carried description finding;
- two sampled locators that do not point at the statement they support;
- pinned Tau Ceti carriers that are used but not cited;
- one incomplete layer dependency line.

The gate passes, `Suggested.lean` elaborates with `sorry` as its only warning, and the depcheck reports no UPWARD or CYCLE line.

## R01 (P3) — The generated merge-order block still omits CanonicalModelsAndGonality and denies the dependency

**Location.** Pull-request description, generated block `merge-order`, which ends: "→ #1504 (CongruenceSpectralGap) → **this pull request** (#2130). It depends on no other author's open pull request."

**Claim.** This block contradicts the rest of the description and the README:
- The handwritten dependency paragraph names "#1726 (CanonicalModelsAndGonality), a new roadmap folder".
- The generated `depends-on` block lists "#1726 CanonicalModelsAndGonality".
- The README consumes it at lines 11, 21, 93–95, 1131–1141, 1590 and 1610.

The merge-order block leaves #1726 out of its chain and says there is no other-author dependency. This is review 2's R01, unrepaired: the head is unchanged and no repair report marks it not actionable.

**Witness.** `roadmaps list` shows "#1726 CanonicalModelsAndGonality (new) @roed-math". `ORDER.txt` has no line for it. Its own open suppliers are:
- MotivesAndAlgebraicCycles (#1313, ORDER line 92), its README line 344;
- HeightsRationalPointsAndObstructions (#1017, ORDER line 142), line 340;
- CongruenceSpectralGap (#1504, ORDER line 157), line 337.

**Repair.**
- Regenerate the block from the dependency closure that includes #1726, or edit it by hand if the tool cannot place a roadmap missing from the merge order.
- Add #1313 and #1017 at their merge-order positions.
- Put "#1726 (CanonicalModelsAndGonality)" after "#1504 (CongruenceSpectralGap)" and before **this pull request**.
- Delete "It depends on no other author's open pull request."

Tested: #1726's last supplier in the merge order is CongruenceSpectralGap at line 157. That is before GeometricFreyMazur at line 311, and #1726 cites nothing of this roadmap, so this position creates no upward edge and no cycle.

## R02 (P3) — The §9.2 locator points at a theorem that states none of §9.2's facts (§9.4 shares it)

**Location.** `TauCetiRoadmap/GeometricFreyMazur/README.md` line 1201, §9.2: "End(E over an algebraic closure of K)=Z … free rank-one Z-module … σ(f)=χ(σ)f … (BT16 Theorem 1, p. 710 (descent left implicit); BT16 line 58.)" Line 1229 (§9.4) has the same locator.

**Claim.** §9.2 is a seeded-sample target. BT16 at that locator does not support it as written.

**Witness.**
- BT16 lines 58–64 (Theorem 1) state only that isogeny classes are determined by the p-torsion local system.
- BT16 line 75 says "Theorems 1 and 2 follow from the following geometric result" and gives no argument.
- Nowhere does BT16 mention End(E), a Hom lattice or a quadratic character (`grep -a` for "End(" finds only line 312, about Kani–Schanz CM points).

**Repair.**
- In §§9.2 and 9.4, replace the parenthetical with a locator for what the source actually does: "(BT16 p. 710, BT16 line 75, asserts the deduction of Theorems 1–2 from Theorem 3 without argument; the steps below are this roadmap's)".
- For §9.2's standard facts, add a textbook locator and record it in `sources.toml`, by locator alone if paywalled. For example, the characteristic-zero dichotomy ℤ / imaginary-quadratic order is Silverman, *The Arithmetic of Elliptic Curves*, Corollary III.9.4.

Tested: BT16 line 75 contains exactly the asserted, unproved deduction.

## R03 (P3) — The §2.6 locator omits the published statement it corrects, BT16 Proposition 12(b)

**Location.** README line 528, §2.6: "(BT16 Lemma 11(a) and its tiling argument, pp. 722–723; Lemma 13, pp. 724–725. The quotient intersection retains every lifted lens.)"

**Claim.** §2.6 (sampled) is the corrected form of BT16 Proposition 12(b). The cited lemmas are only its ingredients: a small-height lift and the midpoint lens bound. A reader cannot find the published statement, nor learn that the roadmap changes it. §2.5 names Proposition 12(a) and §2.7 names 12(c); §2.6 alone omits its counterpart.

**Witness.** BT16 lines 621–623, p. 724: Proposition 12(b) puts the intersection of the two (1/2+δ)ρ_X cusp balls in a single ball of radius δρ_X+O(1). This round's computation for the §2.5 family:

| p | Midpoint separation | 2 log p |
|---|---|---|
| 101 | 8.844443 | 9.230241 |
| 1009 | 13.453454 | 13.833430 |
| 10007 | 18.042162 | 18.422080 |

So no single ball of radius δρ_X+O(1) covers both lenses once δ is small and p is large.

**Repair.** Add to the §2.6 locator: "Proposition 12(b), p. 724 (BT16 line 621), corrected from one ball to a union of p^(O(δ)) lens balls". Point to the §2.6 Check as the witness.

Tested: line 621 is Proposition 12(b) and is on p. 724, whose page marker is BT16 line 624.

## R04 (P3) — Pinned triangle-group and geometric-CM carriers are used but not cited

**Location.**
- README line 320, §1.1: "uniformized by the orientation-preserving hyperbolic triangle group Δ(2,3,p). The quotient γ_p:PSL₂(Z)→Δ sends the standard cusp translation U to an order-p rotation."
- Line 332, §1.2: "give the normalized faithful triangle representation".
- Line 1201, §9.2: "End(E over an algebraic closure of K)=Z".
- The Tau Ceti contract (line 53) names none of the carriers below.

**Claim.** The pin already has these objects:
- the abstract triangle group and its universal property;
- the presentation of PSL₂(ℤ) as Δ(3,2,∞), through which γ_p factors;
- a cofinite Fuchsian realization of every hyperbolic Δ(p,q,r);
- the geometric endomorphism ring and the geometric-CM predicate.

The README restates them in prose and never names them.

**Witness.** At Tau Ceti 2fd255d:
- `TauCeti.TriangleGroup.lift`, `GroupTheory/TriangleGroup/Basic.lean:174`;
- `TauCeti.ModularGroup.triangleGroupEquiv : TriangleGroup 3 2 0 ≃* PSL(2, ℤ)`, sending z ↦ T⁻¹, `Analysis/Complex/Fuchsian/LevelOne/TriangleGroup.lean:315`;
- `TauCeti.TriangleOrder.IsHyperbolic.exists_isCofinite_triangleGroup`, `Analysis/Complex/Fuchsian/TriangleOrder/Group.lean:469`;
- `WeierstrassCurve.HasGeometricCM`, `AlgebraicGeometry/EllipticCurve/Isogeny/Hom/ComplexMultiplication.lean:100`.

**Repair.**
- Add the four declarations, with file and line, to "From Tau Ceti".
- In §1.1, define γ_p as `TauCeti.TriangleGroup.lift` from Δ(3,2,∞) to Δ(3,2,p) composed with `triangleGroupEquiv.symm`. Take Δ(2,3,p) ⊂ PSL(2,ℝ) from `exists_isCofinite_triangleGroup`, which FuchsianOrbifolds Layer 2 item 6 already names. Say that §1.1 adds the identification of Ξ(p)\H with the selected component.
- In §1.2, state that U_p, S give a normalization conjugate to that pinned group.
- In §9.2, write End = ℤ as ¬`W.HasGeometricCM`. Its geometric endomorphisms are taken over the separable closure, which is the algebraic closure in characteristic zero.
- Add each declaration to the relevant *Needs:* line.

Tested: T ↦ z⁻¹, so U=T maps to an element of order p in Δ(3,2,p). TriangleOrder (2,3,p) is hyperbolic exactly when 1/2+1/3+1/p<1, that is p>6. Both agree with §1.1 and its Check.

## R05 (P3) — Layer 10's dependency line omits §9.5

**Location.** README line 1403: "Statement prerequisites from other layers: §7.5, §9.7, §0.5, §0.6."

**Claim.** §10.1 and §10.2 state their results over every algebraically closed characteristic-zero field. §7.5 is over ℂ only, so both need §9.5, and their *Needs:* lines (1323, 1337) list "§9.5" first. The layer summary drops it. A mechanical comparison of each layer's other-layer *Needs:* items against its Dependencies line finds this as the only mismatch in Layers 1–10.

**Witness.** Line 1323 is "*Needs:* §9.5; §7.5; §9.7; …" and line 1337 is "*Needs:* §9.5; §7.5; …".

**Repair.** Change line 1403 to "Statement prerequisites from other layers: §7.5, §9.5, §9.7, §0.5, §0.6."

Tested: the same comparison then reports no mismatch in any layer.

## Previous findings

- **R01** (merge-order block): not repaired. The head is unchanged; the block still ends "… → **this pull request** (#2130). It depends on no other author's open pull request." Raised again above as R01.
- Review 2 called its other five findings repaired or settled. I re-checked each at this head, and each still holds:
  - R02: line 1141 lists CanonicalModelsAndGonality §§8.2 and 8.6–8.7, ModularCurvesPartII §6.1 and ComplexComparisonPartII §C1.9.
  - R03: line 1590 reads "This is CanonicalModelsAndGonality §1.6".
  - R04: the `gonality` body is the owner's.
  - R05: withdrawn; "Section 8.1 is now CanonicalModelsAndGonality §8.6" serves ModularCurvesPartIII's citation.
  - R06: the docstring on line 73 reads "stated there for a fixed constant field".
- Review 2's "Not verifiable" item on the BTE p. 3 display is now verified (see below).

## Verified sound

**Gate, build, direction.**
- I re-ran the full gate on 6017ad8. Every counter is 0 and the result is OK (exit 0).
- `lake env lean …/Suggested.lean` gives exactly two warnings, `declaration uses sorry`, at lines 58 and 78 (5.6 s).
- Depcheck output: `depcheck: 235 roadmaps, 2133 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The folder has only README.md, Suggested.lean and metadata.toml.

**Signatures and probes.** I appended `#check` lines to a scratch copy and elaborated it.
- `#check @gonality`, `@full_monodromy` and `@geometric_frey_mazur` equal `signatures.md`, with quantifier order ∀N ∃M ∀k K. There is no `variable` block, so no binder can have been dropped. Nothing changed.
- `0 < gonality k K` is proved in scratch under the headline binders (via `TauCeti.isFunctionField_iff_functionField` and `Nat.sInf_mem`), so N≤1 is vacuous, as README lines 1259 and 1289 say.
- Padding: neither headline closes in one tactic. Each requires constructing a Galois element or an isogeny, and the hypotheses are satisfiable (ℂ(t), the Legendre curve, e=id). `gonality` is the one definition both headlines need.
- Headlines that are not statable are named in the docstring, lines 15–31. I checked that each carrier really is absent: the quotient surface, Hecke loci, scheme symmetric powers, elliptic schemes over U, and finite étale torsion isomorphisms. The subgroup-index and self-twist results (§§8.2, 8.4) are elementary auxiliaries, not headlines.

**Library declarations opened at the pins.**

Mathlib 1b1ccf4:
- `Matrix.ProjGenLinGroup` (`…/GeneralLinearGroup/Projective.lean:41`) and `mk_eq_mk_iff` (64);
- `ProjectiveSpecialLinearGroup.toPGL` (113) and `toPGL_injective` (120);
- `Matrix.ProjectiveSpecialLinearGroup` (`…/ProjectiveSpecialLinearGroup.lean:36`);
- `norm_eq_sup_sup_nnnorm` and `norm_apply_le_norm` (`Analysis/Matrix/Normed.lean:87, 106`);
- `FunctionField` (`NumberTheory/FunctionField.lean:59`);
- `AddSubgroup.torsionBy` (`…/Torsion/Basic.lean:971–972`) and `torsionBy.zmodModule` (1009);
- `toZModLinearMap` (`Algebra/Module/ZMod.lean:81`);
- `Point.map` (`…/Affine/Point.lean:822`);
- `LinearMap.det` (`LinearAlgebra/Determinant.lean:164`);
- `Matrix.SL2.commutator_eq_top` (`…/SpecialLinearGroup.lean:804`, with a≠0 and a²≠1);
- `Sym.map` and `Sym.map_map` (`Data/Sym/Basic.lean:342, 361`).

Tau Ceti 2fd255d:
- `TauCeti.Isogeny` (`…/Isogeny/Basic.lean:139`);
- `existsUnique_map_eq_iff_galoisFixed` (`…/Isogeny/Descent.lean:117`);
- `Hom.degree_zsmul` (`…/MulByInt/Hom.lean:63`);
- `IsFunctionField` (51), `finiteDimensional_adjoin` (64) and `isFunctionField_iff_functionField` (133, namespace `TauCeti`);
- `closure_range_toSpecialLinearGroup_eq_top_of_field` (`…/Transvection.lean:600`);
- `RiemannSurface.FiniteHolomorphicMap` (`Degree.lean:134`), `degree` (121), `degree_comp` (435) and `ramificationDivisor` (`Ramification.lean:114`).

Every file and line the README gives agrees.

**Cross-roadmap citations resolved this round.** About 95 section ids across 12 roadmaps, each against main or the open head:
- **ModularCurves** (main): §§0D, 0E, 2C, 5B, 5C. These are kept at the #1808 head.
- **ModularCurvesPartII** (07e21ad): all 18 cited sections, plus `complexConjugationComparison` (§8.4) and `genericBaseChangeAndLevelCompatibility` (§8.5). §4.7's genus formula (p+2)(p−3)(p−5)/24 equals the README's 1+(p²−1)(p−6)/24 identically; both are 3 at p=7. §9.13 gives degree multiplier ψ(m) and the cyclic filter.
- **SchemeAndStackFoundations** (main): §§0.8, 0.9, 0.11, 1.17 (`finiteGroupQuotient_projective`: Noetherian base, norm polarization, flat base change), 3.2, 3.5 (`sectionNorm`, `lineBundleNorm_divisor`), 4.11–4.13 (`bertini_smoothness`), 5.1–5.3, 5.9, 5.10. All 14 sections and all four names are kept at #1656, #1807, #1808 and #1854.
- **AlgebraicCurves** (main): Layers 3, 4, 5, 7, 12 (12B–12E). These are kept at #1807, #1808 and #1854.
- **FuchsianOrbifolds** (main): Layers 0–5.
- **ComplexKahlerGeometry** (main): K3 and K6.1.
- **ComplexComparisonPartII** (a021e44): C−1.1–C−1.3, C1.9, C2.2, C4.1–C4.5, C5.4 (`CurrentCalculus`, `AnalyticCycleIntegration`, `lelongPoincareSection`, convention (i/π)∂∂̄log|f|=[div f] at its line 3957), C6.2.
- **InverseGaloisAndArithmeticFundamentalGroups** (9432671): IG.0.3, IG.1.3 (its paragraph "Invariance under algebraically closed base extension in characteristic zero" covers finite-type X, so nonproper curves are included), IG.3.1.
- **AbelianSchemesAndArithmeticModuli** (4ed5f32): A1.6 (`relativeEllipticEquivalence`), A1.8, A3.1–A3.5, A3.7, A3.8, A6.1, A6.6, A6.7, A6.20, A6.25, A6.34.
- **NeronModelsAndSemistableAbelianVarieties** (861f8ce): §§1.3, 1.8.
- **CongruenceSpectralGap** (86faacb): §5.3, λ′₁≥21/100 in curvature −1.
- **CanonicalModelsAndGonality** (e7bed94): §§1.1–1.7, 8.1–8.7 (§8.6: λ·index≤24·gonAn, so 21/100 gives 7/800), 9.1. Its namespace differs from this roadmap's, so there is no fully-qualified-name clash.

**Ownership and direction.**
- `roadmaps grep` finds no other owner of Z(p), function-field Frey–Mazur, the full-monodromy bound or the proper-subgroup index bound. ModularCurvesPartII owns X(p) (§§4.7, 5.7), and it is imported.
- CanonicalModelsAndGonality is not in the merge order. Its last ordered supplier is line 157, before this roadmap's line 311, and it does not cite GeometricFreyMazur.
- No *Needs:* line cites a later subsection of this roadmap (checked mechanically).
- `overlaps.md` reports nothing dropped. I confirmed this for the main suppliers' open revisions listed above.

**Declared gaps.** The nine slugs in `design/plan.json` match the nine README contracts, and each names its supplier and section.
- gap:finite-group-quotient-analytification is not already supplied: ComplexComparisonPartII C−1.2/C−1.3 treat étale-presentation quotients only, not ramified finite-group quotients.
- gap:hyperbolic-trigonometry is not already supplied: FuchsianOrbifolds Layer 2 and the pins have no second cosine law, trace–length formula or lens bound.

**Sources: the seeded sample.** The sample is 15 targets, checked against the cached texts. BT16's printed page is the PDF page + 708.

| Target | Locator | Verdict |
|---|---|---|
| 0.4 | line 319, p. 716 | supported |
| 0.6 | lines 322–345, pp. 716–717 | supported |
| 2.6 | Lemma 11(a), line 578, p. 722; Lemma 13, line 644, p. 724 | ingredients supported; published counterpart missing (R03) |
| 3.5 | Remark 16, line 747, p. 727; BTE §1, line 32 | supported |
| 4.2 | line 884, pp. 730–731 | supported: "at most O(log p) elements", line 898 |
| 5.2 | Prop 25, line 1182, pp. 736–737 | supported: (p^(−2δ′)+d³p^(−1)), line 1195 |
| 5.5 | Lemma 28 and vol′, lines 1231–1237, p. 738 | supported |
| 6.2 | line 1393, p. 741 | supported |
| 6.5 | line 1407, pp. 741–742 | supported |
| 8.3 | lines 71–74 and 81–82, p. 710; ABR96 line 14, Thm 0.1, (7/800)D_Γ≤d_ℂ | supported |
| 9.2 | line 58 | not supported (R02) |
| 9.7 | Thm 1, line 58 | supported |
| 9.8 | Thm 2, line 67 | supported |
| 10.1 | Cor 30, line 1458, p. 742; gon≤g+1, line 1379, p. 740 | supported |
| 10.5 | Cor 32, line 1471, p. 742 | supported |

I spot-checked every other BT16 locator in the README against the page map; all agree. I rendered the BTE scan with gs:
- p. 3: Prop 3.1 concludes that (1/sinh r)·vol(C∩B(Δ̄,r)) increases. The Prop 4.1 display prints sinh(ρ/2)/sinh(ε), the reciprocal, so the README's §5.3 correction holds. The last line has d³p⁻¹, as the README uses.
- p. 4: Prop 4.2 uses BT16 Prop 12(b), which the README's global cusp-ball target (§5.4) replaces.

**Adversarial table.** Values computed this round, with a pure-Python checker and Lean probes.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `gonality` (README 21; Lean 47) | headline binders; k(t); ℂ(t)/ℝ | 0<gonality, Lean-proved; k(t): f=t gives 1; ℂ(t)/ℝ: 2 (i∉ℝ(f)) | holds | none |
| `full_monodromy` / §9.6 | N=0,1; N=2, p=227/229; constant E over ℂ(t) | vacuous (gon≥1); 7·227=1589<1600<1603=7·229; constant E gives image {I}, missing [[1,1],[0,1]], excluded by j∉k | holds | none |
| `geometric_frey_mazur` / §9.8 | `#check`; Legendre, e=id; quadratic twist | ∀N ∃M ∀k K; Q=σP gives eQ=σ(eP) trivially, identity isogeny; a twist's geometric iso has σf=−f, not equivariant | holds | none |
| §0.4 | p=7 | 3=(p−1)/2 same-line cusps; inertia 7; gcd(7,2)=gcd(7,3)=1 | holds | none |
| §0.6 | m=1,4,6,9; swap | ψ=1,6,12,12; σ₁(4)=7; f∨[p]φ₂=mφ₁ with m a unit mod p | holds | none |
| §1.1 | p=5,7 | 1/2+1/3+1/7=41/42<1; 1/2+1/3+1/5=31/30>1; z↦T⁻¹ has order p in Δ(3,2,p) | holds | cite pin (R04) |
| §1.2 | p=7, 101 | y₇=1.7250824, cosine-law root 1.7250824; (1−b)p²/π²=1.000646; S²=U⁷=(SU)³=−I numerically | holds | cite pin (R04) |
| §1.3 | p=7, 11, 13, 101, 103; deformed | words equal M_p, det 1, trace 2p²+2, ≡I mod p; tr/p² = 0.683877, 0.6839176, 0.68391798 at p=1009, 10007, 100003 → 27/(4π²)=0.683918 | holds | none |
| §1.4 | p=7 | A=[[0,−1],[1,−7]] gives M=[[1,−7],[7,−48]], trace −47; 2arcosh(23.5)=7.699389<4log7=7.783641 | holds | none |
| §1.8 | p=101, y=1/2, 1, 1/4 | 0.969374, 4.163618, 0.939686, 0.984568 | holds | none |
| §2.5 | p=101…100003 | d(z₀,zᵢ)=9.132087 at p=101, then 2log p−0.0922; labels (29,3) and (72,−3)=−(29,3) | holds | none |
| §2.6 | as in R03; lens radius | separations as in R03; 2artanh√tanh(1/2)=1.657454; excess → 0.693147=log 2 | holds | locator (R03) |
| §3.5 | ℂ/ℤ[i]; ℂ/ℤ[ω] | [i]−[−i]=[2i], degree 4; [ω]−[ω²], degree 3; both invertible on E[p] for p>3 | holds | none |
| §4.2 | split, imaginary, real quadratic | ±I; ≤6 units; log((3+√5)/2)=0.962424, so ≤2(A log p+log 2)/0.962+1 values | holds | none |
| §4.4 | p=7, d=1, R=1/2 | 0, 0.980099, 1.645565, 1.961531 (symmetric); k=0,1,6 below 1; sinh 10=11013.232875 | holds | none |
| §5.2 | d=4 | Σ_(m<4)ψ=8≤14<64; BT16 has d³ | holds | none |
| §5.3 | BTE p. 3 render | printed sinh(ρ/2)/sinh ε; Prop 3.1 forces sinh ε/sinh R | holds | none |
| §5.5 | q=t², ε=0.01; diagonal at p=7 | 2π/(−log ε)=1.364376; ratio 1+24/4=7 | holds | none |
| §5.8 counterexample | p=7, general p | ratio |G₀|/(2K)=3p/(p−6), 21 at p=7, → 3 | holds | none |
| §6.2 | degree-q map to a rational image | gon(D)=1≤n | holds | none |
| §6.5 | n=2, C=T₁×{a}, p=7 | Deg=8; Σ pair=(n−1)·8=8; K_(Sⁿ)=Σπᵢ*K_S | holds | none |
| §8.2 | p=2, 3, 5 | A₃ index 2; Q₈ index 3 in SL₂(𝔽₃); SL₂(𝔽₅) perfect, so no index <5 | holds | none |
| §8.3 | N=2; Borel | 7·229/800=2.00375>1; index 230 gives 2.0125 | holds | none |
| §8.4 | 𝔽₅, diag(2,3) | both sides [[0,3],[2,0]] | holds | none |
| §9.1 | Legendre t=2, 3; Ψ=diag(1,3), p=7 | j=1728, 21952/9; 3∉{1,2,4} | holds | none |
| §9.2 | Legendre; y²=x³−x | j has a pole at t=0, not in ℚ̄, so End=ℤ; constant j=1728 has [i]; deg(af)=a²deg f | holds | locator and carrier (R02, R04) |
| §9.4 | Ψ=[−1], f=id | f[p]=−Ψ; χ=−1 forces 2f[p]=0, impossible for odd p | holds | locator (R02) |
| §9.7 | sign step | needs p odd and p>3; M_N≥max(M_N^geom,5) | holds | none |
| §10.1 | N=2 | g≤1 gives gon≤2<3, so M₃ is needed; BT16's M₂ misses genus 1 | holds | none |
| §10.2 | g=0, 1 | gonality 1 and 2, both <3 | holds | dependency line (R05) |
| §10.3 / §10.5 | 1/3(1,1), 1/3(1,2), 1/p(1,p−1); C²=−2 | [−3]; [−2,−2]; p−1 (−2)-curves; −2+1=−1, −2+4=2 | holds | none |
| dᶜ convention | f=z²; disc metric | ddᶜ=(i/2π)∂∂̄; 4πddᶜ(−log(1−|z|²))=4dxdy/(1−|z|²)²; mass 2 | holds | none |
| Point-ball line | (z,z/2), t=1, 2, 4 | V/a=1.207701, 1.122800, 1.023008 (decreasing) | holds | none |

## Not verifiable

- BLR90 §1.2 Proposition 8, p. 15, and §1.4 Proposition 2, p. 19: the manifest settles this source as uncertified, so it is cited by locator alone and I did not read the text.

## Source issues

- **Error** in BT16 at Proposition 12(a), p. 724: the source says a fixed lift of one cusp has at most one lift of another cusp within (1+δ)ρ_X; it should allow p^(O(δ)) such lifts (two lifts of one cusp lie at distance 2 log p − 0.0922 for every large p); affects a stated result.
- **Error** in BT16 at Proposition 12(b), p. 724: the source says two (1/2+δ)ρ_X cusp balls meet inside one ball of radius δρ_X+O(1); it should be a union of p^(O(δ)) such balls, whose lens midpoints can be 2 log p − 0.38 apart; affects a stated result.
- **Error** in BT16 at Lemma 5 proof, p. 718: the source says [[1−p²,p],[−p,1]] realizes the bound for loops nontrivial in the filled curve; it should use an element outside the unipotent normal closure, since this product U(p)L(−p) dies after filling; affects the proof.
- **Error** in BT16 at Corollary 8 proof, p. 720: the source says a minimal geodesic has length ≤ 2 log p + O(1) and so nears at most one cusp; it should be 4 log p + O(1), which allows several deep cusp visits; affects the proof.
- **Misprint** in BT16 at Proposition 18 proof, p. 731: the source says h_Y is strictly smaller than h_X; it should say h_X ≤ h_Y, as in Proposition 7, p. 720, and as the next display uses; affects nothing.
- **Error** in BT16 at Proposition 27, p. 737: the source says Σ_g mult_(Δ_g)(C) = O(p^(−δ)Deg C) for every curve in no Δ_g; it should also require non-Hecke projections, since C ⊂ T₁×T₁ from a general D ∈ |L⊠L| gives ratio 3p/(p−6); affects a stated result.
- **Misprint** in BT16 at Corollary 30, p. 742: the source says p > M_N suffices for genus < N; it should be the gonality threshold M_(N+1), since gon ≤ g+1 ≤ N; affects a stated result.
- **Gap** in BT16 at Theorems 1–2, p. 710: the source says Theorems 1 and 2 follow from Theorem 3; it should supply the Hecke lift, scalar-compatible Galois descent of the isogeny and its extension over U; affects the proof.
- **Misprint** in BTE at Proposition 4.1 proof, p. 3: the source says the ε-tube volume is ≪ sinh(ρ/2)/sinh(ε) times the total; it should be sinh(ε)/sinh(ρ/2), by its own Proposition 3.1; affects nothing.
