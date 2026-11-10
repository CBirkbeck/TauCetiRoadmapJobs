# Review of GeneralizedCohomology (pull request #1807 at f6de6b4)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/GeneralizedCohomology/` at f6de6b4. The folder has `README.md` (4403 lines) and `Suggested.lean` (148 lines, six theorems).

**Checks re-run on this head.**

- **Gate.** The worker's gate passes. My re-run reports only `outside-folder` 26. All 26 files are in the 13 sibling folders this pull request owns. `git diff --stat origin/main...HEAD` outside those folders is empty. Not a finding.
- **Dependency check.** `depcheck: 234 roadmaps, 2291 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- **Elaboration.** `lake env lean TauCetiRoadmap/GeneralizedCohomology/Suggested.lean` gives six `sorry` warnings and nothing else (10 s).

## Previous review (5004f71): status of R01–R08

| Id | Status at f6de6b4 | Evidence |
|---|---|---|
| R01 Kan–Quillen statable but declared unstatable | repaired | `Suggested.lean` 64–82 states `kanQuillen_modelCategory` and `sSetTopAdj_unit_weakEquivalence`; README 206–214 is the "From Tau Ceti" contract for the weak equivalences; G2.1 at 587–594 consumes them and keeps the Kan-group criterion |
| R02 second owners in open pull requests | not repaired | #1901, #866 and #1798 still own the objects, and the description names none of them (R02 below) |
| R03 citations that did not resolve | repaired | `TopCat.diskBoundaryInclusion 4` (2503–2504); EM names in Stages 8.10 and 8.11b (284–289); TopK T1.5a for the Stiefel fibrations (294–295); GT Layer 11.3 with a working anchor (342, 3001, 4157); SpinGeometry G1.3's τ and τ_ℂ (333–334) |
| R04 Brown docstring reason | repaired | `Suggested.lean` 37–40; contract 215–220; *Needs:* lines 422 and 1965 |
| R05 locators | repaired | Cohen 10.3 is called Adams's variant (1948–1949); Cohen 10.40 is scoped to connective E and connected B (2719–2724); HSS 3.4.4, Shipley and Hovey (650–655); Schwede 7.4 (3138); TeX labels gone; excision is stated for m,n≥0 (771); all ten seeded sections now carry locators |
| R06 build order | repaired | the GL_k(ℝ) table moved to G4.6 (2903); the *Needs:* of G2.9 (1000), G4.0 (2658) and G5.7 (4270) are complete; G2.7 now consumes Tau Ceti's path fibration rather than G2.10 (872–874) |
| R07 Checks and API | partly | false G5.5 Check replaced (3907); G5.3 Check replaced (3222); twelve sections gained API bullets; G2.11, G5.5 and G5.7 still lack them (R08 below) |
| R08 policy | repaired | no PR numbers, commit links, roadmap abbreviations or item numbers remain (grep) |

## R01 (P2) — G4.0 builds a second quaternionic projective space and a second smooth structure on it, although both are in Tau Ceti

**Location.**
- README 2473–2475: "Define quaternionicProjectiveSpace n as the native `Projectivization` of (Fin (n+1)→ℍ) over ℍᵐᵒᵖ".
- README 2637–2639: "Put the smooth real 4n-manifold structure on the designated native quaternionicProjectiveSpace n".
- README 56–57 lists only Mathlib's `Projectivization` topology as already pinned for HPⁿ.

**Claim.** The pinned Tau Ceti already has HPⁿ, its affine charts and its smooth 4n-manifold structure. The scope rule says what is pinned is consumed, not planned again. DGFloer and RiemannianGeometry (2653–2656, 4297–4298) are told to consume G4.0b's second carrier.

**Witness.** Tau Ceti 2fd255d has three pieces:
- `TauCeti.QuaternionicProjectiveSpace n` (`Topology/QuaternionicProjectiveSpace/Basic.lean:62`), the quotient of S⁴ⁿ⁺³ by right multiplication by unit quaternions, compact and Hausdorff;
- `affineChart` and `affineChart_transition` (`Charts.lean`);
- `instChartedSpace : ChartedSpace (Fin n → ℍ) (QuaternionicProjectiveSpace n)` and `instIsManifold` (`Geometry/Manifold/Instances/QuaternionicProjectiveSpace.lean:48, 88`).

**Repair.**
- Add the three items above to "Already in the pinned libraries" and "From Tau Ceti".
- In G4.0a, build the CW structure, characteristic maps and Hopf line on `TauCeti.QuaternionicProjectiveSpace n`. Its projection `mk` from the unit sphere is already the Hopf quotient. Keep `Projectivization` only as a comparison homeomorphism with Gr_ℍ(1,n+1), if the Grassmannian route needs it.
- In G4.0b, consume `instChartedSpace` and `instIsManifold`. Keep only the Sp(n+1)/(Sp(n)×Sp(1)) diffeomorphism and the HP¹≃S⁴ comparison.
- Checked against the instance: Tau Ceti's `mk_eq_mk_iff` identifies vectors that differ by a right unit-quaternion factor. Its charts are the right ratios X_j X_k⁻¹. Both match G4.0a's right-line convention and its chart [v₀:v₁]↦v₀v₁⁻¹ (2507).

## R02 (P2) — Three objects still have a second owner in an open pull request (previous R02, not repaired)

**Location.**
- README 59–65 and 4310–4314: this roadmap owns, and HigherToposTheory and OperatorKTheory consume, G2.1's Kan–Quillen structure, the G2.11 foundations and G5.5's complex graded Clifford conventions.
- README 59–65 and 4296–4297: the same for G2.10's `numerableFiberBundle_hurewicz`, which DGFloer consumes.

**Claim.** Each object is also owned by an open pull request. One of them points the hand-off the other way. GeneralizedCohomology is on main and is the earlier owner, so those pull requests must cite it. Nothing in this pull request records the settlement.

**Witness.**
- **HigherToposTheory #1901.** Its README "It owns in particular" (lines 34–39) lists Kan–Quillen, Bergner, Joyal, straightening and Kan extensions. Its `Suggested.lean:1498` declares `scoped instance modelCategoryQuillen : ModelCategory SSet.{u}`. Its only citation of this roadmap (README 196–197) is G2.1's `realizationProductKelleyComparison`, which this README moves to AlgebraicTopology Stage 4.5 (line 82).
- **OperatorKTheory #866.** Its §5.1 (README 1129–1152) develops the same graded C*-algebras and Clifford conventions. Its line 2332 says GeneralizedCohomology consumes K5's graded Clifford conventions.
- **DGFloer #1798.** Its README 1489–1492, under "Own:", states that a locally trivial bundle with a numerable trivializing cover is a Hurewicz fibration.

**Repair.** In the description's merge-order paragraph, name #1901, #866 and #1798 as rebasing after this pull request. State what each must cite:
- #1901: G2.1 `kanQuillen_modelCategory`, G2.11, and AlgebraicTopology Stage 4.5 for the realization product.
- #866: G5.5's complex graded Clifford conventions, with its line 2332 reversed.
- #1798, by the same author: replace its "Numerable bundles" item with G2.10 `numerableFiberBundle_hurewicz`.

## R03 (P3) — The module docstring misstates what is not statable, and the rational Hurewicz docstring is wrong at k = 0

**Location.**
- `Suggested.lean` 41–42: "the cohomological comparison theorem (G3.3) and the Milnor sequence (G3.4): Mathlib has homology pretheories only, and no cohomology theory".
- `Suggested.lean` 131–136: "(so `X` is path connected …) … For `k ≤ 1` only the degree-one surjectivity is asserted". README 3945–3946 says the same.

**Claim.** README G1.1 (395–396) shapes cohomology theories as pretheories on the opposite category. That makes the cohomological comparison theorem an instance of the stated `homologyComparison`, not an unstatable headline.

At k = 0 the Lean statement asserts nothing, since `2 * 0 - 1 = 0`. The degree-one claim the docstring describes would also be false there.

**Witness.**
- A ℤ-graded cohomology theory valued in D is an `IsExtraordinaryEilenbergSteenrod` `TopPair.HomologyPretheory Dᵒᵖ (ComplexShape.down ℤ)`. The boundary for `c.Rel i (i−1)` becomes δ : h^{i−1}(A) → h^i(X,A), and `IsAdditive` (`EilenbergSteenrod.lean:214`) becomes the product axiom. `homologyComparison` at `C := Dᵒᵖ`, applied to `f.op`, is Hatcher's Proposition 3.17.
- For X = S¹ ⊔ S¹ with x in the first circle, the image of π₁ spans only ℚ⊕0 inside H₁(X;ℚ) = ℚ².

**Repair.**
- Docstring: say the cohomological comparison theorem is the instance C := Dᵒᵖ of `homologyComparison`.
- For the Milnor sequence, name the actual missing carriers. These are lim¹ of a tower of abelian groups and the Milnor connecting map. Without them only a non-natural, weakened form is statable.
- For Leray–Hirsch and Thom, name the missing carriers: products on a cohomology pretheory, and Thom spaces.
- Add the C := Dᵒᵖ remark to G3.3's third API bullet (2037–2038).
- Rational Hurewicz docstring and README 3945–3946: "for k = 1 only degree-one surjectivity is asserted, for k = 0 nothing", and "(so X is path connected when k ≥ 1)".

## R04 (P3) — Targets with no locator, among them a seeded section and a headline

**Location and claim.**
- **G4.5 (2765–2893), seeded.** No source is cited for the projective-bundle theorem, `E*(KPⁿ)=E*[x]/(x^(n+1))`, `H*(BSp(r);ℤ)=ℤ[a₁,…,a_r]` or the torus restriction.
- **G5.6 `rationalHurewicz` (3939–3947), a headline.** The two locators in the section (Hatcher SSAT 1.21, Cohen 10.19) support only `stableStem_isOfFinOrder`.
- **G5.5 (3367–3900).** The section has no locator. Joachim and Hebestreit–Sagave appear only under References.
- **G2.8 (907–945).** No locator. Segal and Elmendorf–Mandell appear only under References.
- **G2.6 prose (852–860).** HSS is cited only in a Check.

**Witness.** A grep of each line range for an author name or a theorem number returns nothing for G4.5, G2.8 and the G2.6 prose. For G5.5 it returns only "Quillen" as an adjective.

**Repair.** One stated-theorem locator per claim:
- **G4.5, ordinary case.** Hatcher, *Vector Bundles and K-Theory*, Theorems 3.1–3.2 and Proposition 3.3, pp. 78–80 (`HatcherVBKT` lines 3011–3146), through Leray–Hirsch.
- **G4.5, generalized complex-oriented case and H*(BSp(r);ℤ).** A text such as Adams, *Stable Homotopy and Generalised Homology*, Part II. Verify it first; it is not in the sources cache.
- **`rationalHurewicz`.** Klaus and Kreck (2004), or Félix, Halperin and Thomas, *Rational Homotopy Theory*, Theorem 8.6. Verify before citing.
- **G5.5.** Joachim 2001 and Hebestreit–Sagave §§6–7, at the theorems they support.
- **G2.6.** HSS Proposition 5.6.2, p. 61 (`HSS` line 2915), for the semistable comparison.

## R05 (P3) — G3.5 cites the wrong section of May, and that page states the refinement only as a step in a sketch proof

**Location.** README 2109–2111: "Chapter 23, §2, p. 189, for the countable numerable refinement of a cover by coordinate charts".

**Claim.** The page is right but the section is §1. The source asserts the countable refinement in one sentence of a sketch proof. It does not state what G3.5 uses: a refinement V_n, each a disjoint union of trivializing opens, with a subordinate partition of unity.

**Witness.** `MayConcise` line 8017 (printed p. 189) begins "One first shows that one can construct a countable numerable cover of coordinate charts". It sits inside the "Sketch proof" of the classification theorem of Ch. 23 §1. §2 starts at line 8038.

**Repair.** Write "May, Ch. 23 §1, p. 189 (in a proof sketch)". Add a stated lemma for Dold's disjoint-union refinement: Dold, *Partitions of unity in the theory of fibrations* (Ann. of Math. 78, 1963), or Milnor–Stasheff, Lemma 5.9, for paracompact bases. Verify the number before citing.

## R06 (P3) — A G3.7 Check does not test compactness

**Location.** README 2190: "`[⊕_n S, HZ] = ∏_n ℤ`, so an infinite wedge of spheres is not compact."

**Claim.** Compactness of P means that `[P, ⊕_m Y_m] = ⊕_m [P, Y_m]`. Maps into the single object HZ say nothing about it. The conclusion is true, but it does not follow from the displayed value.

**Witness.** `[⊕_n S, ⊕_m HZ] = ∏_n ⊕_m ℤ`. This group contains the family (e_n)_n, whose n-th coordinate is the n-th basis vector. That family is not in the image of `⊕_m ∏_n ℤ = ⊕_m [⊕_n S, HZ]`.

**Repair.** Replace the second clause with this computation.

## R07 (P3) — Pinned Tau Ceti theorems are cited only through roadmap sections

**Location.**
- README 3177–3180 (G5.2): "Use GeometricTopology's general normal bundle and tube … GeometricTopology Layer 1.5 supplies the general normal bundle and tube".
- README 4218–4221 (G5.7): "a smooth positive-definite ambient metric from DifferentialGeometry 12.1 … GT Layer 1.5's metric-dependent normal-exponential tube".
- The contracts at 340–347.

**Claim.** The normal bundle, the tubular-neighbourhood theorem in its plain and Riemannian forms, the closed normal disc bundles, the Euclidean tube and the existence of smooth Riemannian metrics are all at the Tau Ceti pin. Main's GeometricTopology §1.5 (its README 974–987) itself says they are Tau Ceti's.

**Witness.**
- `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset` (`Geometry/Manifold/TubularNeighborhood/Existence.lean:53`);
- `exists_diffeomorph_normalBundle_riemannian_subset` (`…/Riemannian/Coordinates.lean:146`);
- `exists_isClosedEmbedding_normalExp_disc` (`…/Riemannian/DiscSphere.lean:56`);
- `TauCeti.normalTube` (`…/Euclidean.lean:225`);
- `TauCeti.nonempty_contMDiffRiemannianMetric` (`Geometry/Manifold/VectorBundle/Riemannian/Existence.lean:69`; hypotheses T2, σ-compact, finite-dimensional, which G5.7's Hausdorff second-countable manifolds satisfy).

**Repair.**
- List these under "From Tau Ceti" and in the *Needs:* of G5.2 and G5.7.
- Keep GeometricTopology §1.5 only for the isotopy uniqueness of tubes, which G5.2's comparison of two embeddings uses.
- Drop DifferentialGeometry 12.1.

## R08 (P3) — Definitions without API bullets or with fewer than three Checks (previous R07, partly repaired)

**Location.**
- **G5.5.** About ten constructed objects share three Checks (3905–3907) and have no API list: K_op,n, `realMixedCliffordOperatorClassifier`, `RealHilbertComplexification`, the finite-Clifford Hilbert-module interface and its stabilization, the configuration model Λ(A,U), and the operator ABS map.
- **G5.7.** Mod_R∞, A_R(B), D_R, C_c,R and the continuous action adapter share three Checks (4274–4276).
- **G2.11.** The Bergner, Joyal and marked models, Cat∞, stable ∞-categories, ∞-operads, Ind_κ, C/D and LM^⊗ share seven Checks (1921–1927).
- These sections also have no API list: G2.2–G2.8, G3.2, G3.6, G3.8, G3.9, G4.0–G4.5, G5.0 and G5.2–G5.4.

**Claim.** The house rule requires an API list per definition and three discriminating Checks each.

**Witness.** `grep -c '^\*\*API\.\*\*'` over the README gives 12 sections. The ranges above contain none.

**Repair.** Add the bullets and Checks. Some Checks the prose already supports:
- π₀K_op,1 = 0 and π₀K_op,4 = ℤ in the real case (3533);
- A_R(point) = Mod_R∞;
- C_c,R(U) ≃ D_R(U) for compact U;
- Ind_ω(0) = 0;
- for C stable, Ind_ω(C) restricted to compact objects is C.

## R09 (P3) — Missing spaces, and a supplier citation without its stage

**Location and repair.**
- **Missing spaces.** Insert a space in:
  - "of1−shift" (2198), "is(a+b)-connective" (2215), "overlap0" (2059);
  - "degree0" (142, 144), "rank0", "rank1" and "ranks1,2" (2851, 3015–3028, 3250, 3849);
  - "Euler1" (2866, 3446), "modulo2" (2942);
  - "the3-connected", "on3-connected" and "and3-connectivity" (3085, 3092, 3096);
  - "degree2/degree8" (3325) and "degree8" (3869), "Layer0" (4219).
- **Unnumbered supplier.** G3.1 (1958, 1965) cites "AT's based-loop-CW-type comparison" with no stage, so the dependency check cannot see it. It is AlgebraicTopology Stage 8.11a (AlgebraicTopology README 3319, "8.11a mapping-space and based-loop CW type"). Write "AlgebraicTopology Stage 8.11a" at both places.

## Adversarial table

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `kanQuillen_modelCategory` (G2.1) | Δ[1]→Δ[0]; ∂Δ[1]→Δ[0]; ∂Δ[2]↪Δ[2]; Λ²₀→Δ[1] on vertices 0,1,0; one-tactic probe | \|Δ[1]\|→pt is a weak equivalence (`weakEquivalence_of_stdSimplex`); \|∂Δ[1]\| has π₀ of size 2 against 1; ∂Δ[2]↪Δ[2] is a mono with π₁ ℤ against 0; the missing edge 1→0 is absent, so Δ[1] is not Kan; no `ModelCategory SSet` at the pins (grep), and the probe fails | true; all three classes pinned by equations | none |
| `sSetTopAdj_unit_weakEquivalence` (G2.1) | X=Δ[0]; X=∂Δ[1]; X=Δ[1]/∂Δ[1]; route | Δ[0]→Sing(pt)=Δ[0] is an iso; two points to two points; \|η_X\| is a weak equivalence by ε_{\|X\|}∘\|η_X\|=id and C1.2b's counit (CC README 836–837, the counit of `sSetTopAdj`); no Quillen-equivalence notion or TopCat model structure at the pins (grep) | true; the unit half is the statable piece | none |
| `numerableFiberBundle_hurewicz` (G2.10) | B×F with ρ≡1; Möbius band; ι=∅; F=∅; {0,1}→[0,1]; continuity of p | `Prod.fst` lifts; two arcs with a two-function partition; Σρ=1 forces B=∅, so Z=∅; F=∅ gives Z=∅, and a lift exists only for empty test spaces; no trivialization of {0,1} near ½; p is continuous on the open sets p⁻¹(baseSet), which cover Z | true | none |
| `homologyComparison` (G3.3) | X=∅; ∨_ℕS¹; ∏_ℕH_*; ℤ→ℚ; C:=Dᵒᵖ | H(∅) is initial by `IsAdditive` at J=PEmpty, so both sides are 0; ∏_ℕ of homology theories fails `IsAdditive` and is excluded; ℤ→ℚ on a point is not an iso, so `hpt` fails; at Dᵒᵖ, additivity is the product axiom, giving Hatcher 3.17 | true; covers cohomology | R03 (docstring) |
| Hatcher Prop 3.17 | locator | `HatcherAT` 9415–9441, printed p. 217; infinite-dimensional case "left for the reader" | matches; see Source issues | none |
| `stableStem_isOfFinOrder` (G5.6) | (n,k)=(0,3), (2,5), (0,2); Hopf stems | π₄S³=ℤ/2 and π₈S⁵=ℤ/24 are finite; (0,2) is excluded (k≥3 fails), where π₃S²=ℤ is infinite; π_{4m−1}S^{2m} needs n=k−2<k−3, excluded | true; the range is sharp | none |
| `rationalHurewicz` (G5.6) | k=0 with X=S¹⊔S¹; k=1; S², k=2; S³, k=3; CP∞, k=2; universe | k=0: 2k−2=2k−1=0 in ℕ, nothing asserted (span ℚ⊕0≠ℚ² would fail); k=1: π₁ onto H₁(ℤ), spanning H₁(ℚ); S²: ℚ→ℚ in degree 2, and degree 3 is onto 0 with kernel not asserted (3>2k−2); S³: π₄=ℤ/2 is torsion; CP∞: ℤ→ℚ and 0→0; for X : Type u, `ModuleCat.of ℚ ℚ` fails to elaborate, so Type 0 is forced | true | R03 (docstring at k=0), R04 (locator) |
| G1.3 MV and Puppe | two-arc S¹; swap; cover (X,∅); locators | (a,b)↦(a−b,a−b) has cokernel ℤ=H¹(S¹); swap negates; with V=∅ the connecting map is 0; `MayConcise` 6222 (p. 147): ψ=i*α−j*β; `HatcherAT` 17236–17264 (p. 398): the Puppe sequence of a pair | hold | none |
| G1.4 products | Cohen locator; twists; suspension law | `CohenBMH` 11141–11156, printed p. 309: Definitions 10.16 and 10.17 (Cohen numbers definitions apart from theorems; Theorem 10.16 is Brown, p. 290); the twist has degree −1=(−1)^{1·1} on S¹∧S¹ and +1=(−1)^{2·2} on S²∧S²; a×(ι×b)=(−1)^p ι×(a×b) | hold | none |
| G1.5 smash splitting | locator; T²; X=S⁰; (ℝ²)⁺ | `HatcherAT` 20117, PDF 476 = p. 467, for CW X,Y; H̃²(T²)=ℤ, H̃²(S¹∨S¹)=0, the collapse is an iso; S⁰×Y=Y⊔Y, and S⁰∧Y is the second copy; (ℝ²)⁺=S²=ℝ⁺∧ℝ⁺ | hold | none |
| G2.2 symmetric sphere modules | HSS 3.4.4; Shipley 3.1, 3.2, 4.1; Hovey 7.7–7.11; Day square; F₁S¹ | `HSS` 1635 (p. 35); `ShipleyConvenient` 253, 265, 339 (positive R-model, commutative algebras, flat underlying); `HoveyGeneralSpectra` 1527, 1535, 1563, 1569 (7.11 needs cofibrant domains of generators); level 2 of S⊗S is 1+1+2=4 copies of S²; level n of F₁S¹ is n copies of Sⁿ | hold | none |
| G2.6 semistability | HSS 5.6; F₁S¹; HZ | `HSS` 2904 (Def 5.6.1, p. 61), 2907 (F₁S¹ not semistable), 2915 (Prop 5.6.2); naive π₀F₁S¹ = colim ℤⁿ = ⊕ℤ against π₀=ℤ; π_{n+k}K(ℤ,k)=ℤ only for n=0 | hold; theorem locator only in a Check | R04 |
| G3.1 Brown | Hatcher 4E.1–4E.2; Cohen 10.3; checks | verified at r56 (`HatcherAT` 19338–19342); `CohenBMH` 10035, now called the finite group-valued variant; ∏ over ∅ is a singleton; H̃⁰(S⁰)=ℤ=π₀ΩS¹ | hold | none |
| G3.4 Milnor | 3F.8; constant tower; ×2,×3,… tower | `HatcherAT` 13729 (p. 314), for CW unions; lim¹ of a constant tower is 0; lim=0 (divisible by every n!), lim¹=Ext(ℚ,ℤ)≠0 | hold | none |
| G3.5 open covers | May p. 189; X_i={0}∪[1/i,1]; ℝ | `MayConcise` 8017 is in §1, inside a sketch; the union is [0,1], each X_i has two path components, and the telescope's π₀ is a colimit of bijections of 2-point sets, so 2 against 1 | Check holds; locator wrong | R05 |
| G3.6 phantoms | Schwede 5.6; Hatcher p. 318; S_ℚ→ΣHZ; HF_p | `SchwedeSymSpec` 13539 (p. 257); `HatcherAT` 13889–13895 (Ext(ℚ,ℤ)≈(∏ℤ̂_p)/ℤ); [S,ΣHZ]=π₋₁HZ=0 and lim¹(ℤ,×n)=Ext(ℚ,ℤ); finite groups are Mittag–Leffler | hold | none |
| G3.7 compactness | Schwede 7.4; wedge Check; S⁰ formula; H₀(S_ℚ) | `SchwedeSymSpec` 15467 (p. 292); [⊕S,HZ]=∏ℤ does not test compactness, while (e_n)∈∏_n⊕_mℤ is not in ⊕_m∏_nℤ; colim π_k(HZ_k)=ℤ and π₋₁HZ=0; colim(ℤ,×n)=ℚ | first Check's inference fails | R06 |
| G3.8 Postnikov | Schwede 8.1, 8.3; KU; HA | `SchwedeSymSpec` 15660 (p. 295), 15745 (p. 296); π_*ku=ℤ[β]; τ_{≥k}HA=HA for k≤0 and 0 for k>0 | hold | none |
| G3.9 completion | Schwede 9.2, §9.3, 9.9; HZ, HQ | `SchwedeSymSpec` 15958 (p. 300), 16117 (p. 303, X^∧_p=F(S/p^∞,ΣX)), 16150–16170 (p. 304, tower and Ext/Hom sequence); π₀HZ^∧_p=Ext(ℤ/p^∞,ℤ)=ℤ_p; Ext(ℤ/p^∞,ℚ)=0=Hom(ℤ/p^∞,ℚ), while ℚ⊗ℤ_p=ℚ_p | hold | none |
| G4.1 Leray–Hirsch | 4D.1, 4D.8; X×CPⁿ; (D¹,S⁰) | `HatcherAT` 18645 (p. 432), 19006 (p. 441, a pair version with free, finitely generated in each degree); free on 1,…,xⁿ; rank one on σ | hold | none |
| G4.5 orientations | torus restriction; p₁; w_{4i}; formal group law Check; locator | c(Cξ)=Π(1−x_j²) gives a_i↦(−1)^i e_i(x²); p₁=−(a₀a₁+a₁a₀)=−2c₂=2e at r=1; w(Rξ)=ρ₂c(Cξ) gives w_{4i}=ρ₂a_i; x+y+βxy has degree 2; no source in 2765–2893 | math holds; no locator | R04 |
| G4.0 HP carrier | Tau Ceti HP | `QuaternionicProjectiveSpace` (Basic.lean:62), `instChartedSpace` (Instances:48), `instIsManifold` (Instances:88), with the same right-line convention | duplicate | R01 |
| G4.6 GL_k(ℝ) table | k=0…6; reflection; stabilizations | GL₀ trivial; ℝˣ: ℤ/2,0; O(2): ℤ; SO(3)≈RP³: ℤ/2,ℤ; SO(4): ℤ²; conjugation by r₄=−v̄ sends (q_L,q_R) to (q_R,q_L); for odd k, conjugation by r_k acts as an element of SO(k), trivially; ℤ→ℤ²→ℤ composite ×2 | hold | none |
| G5.5 Clifford Checks | e₁,e₂; p=q=0 | e₁e₂=diag(−i,i)=−e₂e₁, e₂*=e₂, e₂²=1; graded maps C₀(ℝ)→ℝ even are 0 and ev₀, so S⁰ | hold | none |

## Verified sound

- **Binder check.** `#check @` on all six declarations, in one scratch file. No section binder is lost. Each type matches its README statement: G2.1 at 591–593 and 603–605, G2.10 at 1039–1041, G3.3 at 2019–2024, G5.6 at 3939–3950. The `and`/`of` "declarations" in the worker's signature listing are parser artifacts: docstring lines 75–76 begin with the words "structure" and "theorem".
- **Padding probe.** I tried each theorem with `first | rfl | infer_instance | simp | aesop | exact inferInstance | decide` on a scratch copy. All six fail, so none is padding.
- **Library declarations opened at the pins (57).**
  - Mathlib 1b1ccf4, through one `#check` file: `sSetTopAdj`, `SSet.modelCategoryQuillen.I`/`J`, `Projectivization.instTopologicalSpace` (`Topology/Algebra/Projectivization.lean:44`), `Projectivization.equivSubmodule`, `OnePoint.equivProjectivization`, `onePointHyperplaneHomeoUnitSphere`, `onePointEquivSphereOfFinrankEq`, `Quaternion.ofComplex`, `Polynomial.hermite`, `EMetricSpace.ofRiemannianMetric`, `ContAction`, `ContinuousLinearMap.instLoewnerPartialOrder`, `instStarOrderedRingRCLike`, `IsPositive.spectrumRestricts`, `Matrix.linftyOpNormedRing`/`NormedAlgebra`, `Unitary.toUnits`, `skewAdjoint.submodule`, `ForgetEnrichment.enrichedOrdinaryCategory`, `Enriched.FunctorCategory.enrichedHom`/`enrichedHomπ`, `Grothendieck`, `FiberBundleCore`, `LinearPMap.adjoint`, `CliffordAlgebra.map`, `TopCat.disk`/`diskBoundaryInclusion`, `SimplexCategory.reedyStructure`, `ReedyStructure.op`, `SimplicialThickening`, `SimplicialNerve`, `TopCat.toSSet`, `CompactlyGenerated.compactlyGeneratedToTop`, `TopologicalSpace.compactlyGenerated`, `FormalGroup.IsComm`, `TopPair.HomologyPretheory` with `IsAdditive` (`EilenbergSteenrod.lean:214`) and `IsExtraordinaryEilenbergSteenrod` (297), `pinGroup`, `RelCWComplex`, `exists_embedding_euclidean_of_compact` (`WhitneyEmbedding.lean:132`); `instCStarModuleComplex` at `CStarAlgebra/Module/Constructions.lean:353`.
  - Tau Ceti 2fd255d:
    - simplicial sets and spectra: `instCategoryWithWeakEquivalences` and `weakEquivalence_iff` (`SimplicialSet/WeakEquivalence.lean:60, 71`), `rlp_monomorphisms_iff` (`TrivialFibration.lean:171`), `TopCat.weakEquivalences` (`Topology/Category/TopCat/WeakEquivalence.lean:50`), `PointedSSet.monoidalClosed` (`Pointed/Closed.lean:215`), `circle` (`Pointed/Circle.lean:115`, `PointedSSet.{0}`), `suspensionLoopAdjunction` (`Suspension.lean:47`), `sphereMonoid` (`SphereMonoid.lean:60`), `freeEvaluationAdjunction` (`Free.lean:56`), `Mod.internalHom` (`Mod/InternalHom.lean:326`), `Mod.monoidalCategory` (`Mod/Tensor.lean:121`), `Mod.symmetricCategory` (`Mod/Symmetric.lean:99`);
    - homotopy and fibrations: `PointedHomotopyCat` (`PointedHomotopyCat.lean:122`), `WedgeSum` (`Topology/WedgeSum.lean:78`), `IsHurewiczFibration` (`HurewiczFibration/Basic.lean:58`), `mem_serreFibrations` (90), `zeroSetSDR_liftingInclusion` (`Lifting/Relative.lean:44`), `MappingPathSpace` (`MappingPath/Basic.lean:40`), `MappingPathFiber` (`Fiber.lean:51`);
    - quasicategories: `MarkedSSet` (`Marked/Basic.lean:49`), `mapFlat`/`mapSharp` (`Marked/MappingSpace.lean:77, 83`), `SSet.join` (`Join/Basic.lean:358`), `SSet.slice` (`Slice.lean:103`), `Edge.IsCartesian` (`Quasicategory/Cartesian.lean:65`), `CartesianFibration` (110), `Edge.IsEquivalence` and `core` (`Quasicategory/Core.lean:71, 226`);
    - Hurewicz: `HomotopyGroup.hurewiczHom` (universe-polymorphic, `[HasCoproducts C] [Abelian C]`);
    - Clifford, Spin and Lie: `realCliffordForm` (`CliffordAlgebra/RealForm/Basic.lean:113`), `realSpinThreeEquivQuaternionUnitary` (`Spin/Real/Three.lean:192`), `realSpinFourEquivQuaternionUnitaryProd` (`Four.lean:100`), `EmbeddedLieSubgroupData` (`Lie/Subgroup/Embedded.lean:73`), `exists_isSliceChart_of_isClosed_subgroup` (`Atlas.lean:56`), `isClosed_unitarySubgroup_units` (`Star/Unitary.lean:52`), `chartedSpaceOfIsSliceChart`, `contMDiff_iff_comp_subtypeVal_chartedSpaceOfIsSliceChart` (`LieGroup.lean:107`), `unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_mem_skewAdjoint` (`Lie/Subgroup/Unitary.lean:103`), `lieEquivLieSubalgebraOfSubgroup` (`Differential.lean:249`), `isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom` (`Spin/Covering.lean:108`), `instCompactSpaceRealCliffordSpinGroupZero` (`Spin/Compact.lean:265`), `spinGroupMap` (`Spin/Map.lean:111`), `Matrix.linftyOpTopologicalSpace`/`linftyOpContinuousStar` (`Analysis/Matrix/Normed.lean:33, 44`), `Complexification` and `complexify` (`Normed/Module/Complexification.lean:82, 409`);
    - pinned objects behind R01 and R07, at the lines given there.
- **Statability claims in the docstring.**
  - There is no general topological reduced suspension at the pins. `Topology/Sphere/Suspension.lean` is only I×S¹→S².
  - There are no sequential spectra (grep for `Prespectrum` and `SequentialSpectrum`).
  - The only CW wedge structure is `WedgeCircles.lean`.
  - These three claims are accurate. The inaccurate ones are in R03.
- **Sources: seeded sample.** All 15 sections are in the table.
  - Verified: `HatcherAT` (4D.1, 4D.8, 3F.8, 4I.1, p. 318, p. 398); `MayConcise` Ch. 18 §3 (PDF page = printed + 8); `CohenBMH` Definitions 10.16–10.17 and Definition 10.28 (p. 333, line 12036); `HSS` Def 5.6.1, Prop 5.6.2, Ex 3.1.10, Thm 3.4.4, Ex 1.2.5; `ShipleyConvenient` 3.1, 3.2, 4.1; `HoveyGeneralSpectra` 7.7, 7.8, 7.10, 7.11; `SchwedeSymSpec` II Prop 5.2 (p. 256), Lemma 5.6, Thms 7.4, 8.1, 8.3, 9.2, 9.9 and §9.3.
  - Defects: G3.5 (R05) and G4.5 (R04).
- **Cross-roadmap citations resolved.**
  - AlgebraicTopology at this head: Stages 2.5 (README 650–660), 4.4 (821–862), 4.5 (933–1193; the coreflection at 1139–1140), 4.7 (1241), 4.8 (1268), 5.0 (1331), 5.5 (1456), 6.0 (1667), 6.4 (2365), 8.2 (2526–2550), 8.8c (2889), 8.8d (2963), 8.10 (3072), 8.11a (3319) and 8.11b (3181). `ordinaryPairQuotient`, `ordinaryPairQuotientComparison`, `ordinaryPairQuotientCohomologyComparison` and `ordinaryEMRepresentability` are declared in its `Suggested.lean`.
  - CharacteristicClasses at this head: C1.1b (449), C1.2/C1.2b (705, 830; the counit of `sSetTopAdj` at 836), C1.5 (950), C1.5a (986), C2.1 (1179), C2.4 (1444), C2.5 (1461), C3.2 (1670).
  - TopologicalKTheory at this head: T1.5 (141, 379), T1.6c `stableOrientedGrassmannianWhitneySum` (762), T7.0 `stableOrientedGrassmannianInverse` (1471). ComplexKahlerGeometry K1 (558) and K7.1 (2321). BordismFormalGroups' old → new list for F6.5 (92–101).
  - Main: GeometricTopology 1.1 (788), 1.5 (974) and 11.3 (7887, anchor correct); SpinGeometry G1.3 (item 3 of G1, scalar trace at 204–266), G4.1 (G4.1a), G5.0 and G6.0; DifferentialGeometry 12.1 (914); HilbertModules H1–H6; CStarAlgebras Layer 5; SelfAdjointSpectralTheory SA-D15–D17 (1099–1103); SmoothBundlesConnections B1.4 (421); SpinRepresentations Layer 7 (881); LieGroups Layer 2 (356); CompactGroups Layer 0 (205); ComplexManifolds Milestones 1–2 (172, 197); DGFloer Layer 1 item 4, which consumes G2.10 (main README 742–744).
  - Every supplier is on main. Of the consumers, HigherToposTheory, OperatorKTheory, TangentialBordism, StringOrientation, GeneralAlgebraicKTheory and StableHomotopyKTheory are not on main, and appear only in consumer sentences.
- **Overlaps.**
  - #1187, #1808 and #1854 change this folder. The description orders them after this pull request.
  - No id that this README cites is dropped by an open pull request. No id dropped here is cited elsewhere.
  - This pull request's TopologicalKTheory (147, 495) has G4.0b consuming T1.5's smooth graph-chart upgrade, as G4.0b does. Main's current TopologicalKTheory (63, 313, 1438–1440) still says G4.0b supplies it, so the rebase must keep this pull request's wording. That repair belongs to the TopologicalKTheory folder, not this one.
- **Ownership against open pull requests.** Checked by object, with `roadmaps grep`/`show` and the given checkouts, against HigherToposTheory #1901, OperatorKTheory #866 and DGFloer #1798 (R02). No other open roadmap states Serre's torsion theorem for stable stems or the unstable rational Hurewicz theorem (`roadmaps grep`). HomotopySpheres #284 defines a `stableStem` colimit but states no torsion theorem. The moves down into this roadmap are G2.11 (from BordismFormalGroups F6.5) and G5.5's graded Clifford conventions. Ownership against the other open pull requests was not checked.

## Not verifiable

- `QuillenHA` (G2.1), `JoachimKO`, `McDuffSegal`, `SegalCategories` and `ABSClifford` are settled as uncertified and cited by locator only.
- HSS: I read the arXiv text. The JAMS numbering behind "JAMS 13 (2000)" is paywalled and was not compared.
- The repair locators suggested in R04 and R05 (Adams Part II; Klaus–Kreck; Félix–Halperin–Thomas 8.6; Dold 1963; Milnor–Stasheff 5.9) are not in the sources cache. Each must be verified before it is cited.

## Source issues

- **Gap** in HatcherAT at Proposition 3.17, printed p. 217: the source proves the finite-dimensional case and leaves the infinite-dimensional telescope step to the reader; it should carry out the telescope argument, as in Theorem 3F.8; affects the proof.
