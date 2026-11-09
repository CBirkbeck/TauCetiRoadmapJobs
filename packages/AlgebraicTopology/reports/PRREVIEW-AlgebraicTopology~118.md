# Review of AlgebraicTopology (pull request #1797 at 692438c)

**Verdict:** needs changes

## R01 (P2) — The proper homotopy-extension theorem puts "strongly locally finite" on the subcomplex, not on the ambient complex

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 2972–2975: "the proper homotopy-extension theorem: a closed strongly locally finite CW subcomplex A of a CW complex X has the property `HasProperHomotopyExtensionProperty`". The same claim appears at README line 2988 and in the `Suggested.lean` docstrings at lines 543 and 558–560.

**Claim.** The statement is false when X is not locally finite.

**Witness.** Take X = ⋁_ℕ[0,1], wedged at 0, A = {0}, f = id_X, and H(t,0) = t on spike 1. Any proper extension K has K(1,·) proper with K(1,0) = the end of spike 1. The preimage of [½,1] then contains a neighbourhood of 0, which meets infinitely many open cells, so it is not compact. ftw1973 line 134 (Theorem 1.6) places the hypothesis on the whole complex K, with L any subcomplex.

**Repair.** Restate the theorem as: every subcomplex A of a strongly locally finite CW complex X has `HasProperHomotopyExtensionProperty`, and so does the product pair (FTW Theorem 1.6; finite-dimensional locally finite complexes qualify by Theorem 1.4; for pairs, Remark 1.9). Use the same wording at line 2988 and in both docstrings. The wedge above is not locally finite, so it is excluded.

## R02 (P2) — Two headlines the docstring calls "data" are statable, and representability is stated without a model existing

**Location.** `Suggested.lean` lines 148–149: "the functorial abelian family `K(A, n)` with its normalized identifications (Stage 8.8c) and the ordinary EM loop comparison and cohomology suspension (Stage 8.11b): they are data." The affected theorem is `ordinaryEMRepresentability` at line 712.

**Claim.** The propositional content of both headlines is statable with the file's own `OrdinaryEMModel`. Without an existence theorem, `ordinaryEMRepresentability` is quantified over models that nothing guarantees exist, so it does not yet say that `H^n(-;A)` is representable.

**Witness.** Both statements below elaborate on a scratch copy at the pins; `lake env lean` reports only `sorry` warnings. hatcher line 15901 (p. 365) constructs a CW K(G,n) for every abelian G and every n≥1.

**Repair.** Add the following, with `open scoped Topology.Homotopy`:

```lean
/-- Existence of `K(A, n)` models (Hatcher, Section 4.2, p. 365). -/
theorem nonempty_ordinaryEMModel (A : Type u) [AddCommGroup A] (n : ℕ) [NeZero n] :
    Nonempty (OrdinaryEMModel A n) := by
  sorry

/-- The loop space of a `K(A, n + 1)` model is weakly equivalent to a `K(A, n)` model. -/
theorem exists_isWeakHomotopyEquivalence_loop (A : Type u) [AddCommGroup A] (n : ℕ)
    [NeZero n] (K : OrdinaryEMModel A n) (K' : OrdinaryEMModel A (n + 1)) :
    ∃ f : C(K.space, Ω^ (Fin 1) K'.space K'.point), f.IsWeakHomotopyEquivalence := by
  sorry
```

Name both in README 8.8c and 8.11b with their locators; the loop statement follows from uniqueness, Hatcher Proposition 4.30. Narrow the docstring bullet to what really is data: the normalized coefficient-natural maps and the suspension σ_right.

## R03 (P2) — "Compact smooth manifolds have finite CW type" has two owners in this pull request

**Location.** AlgebraicTopology `README.md` line 3059 and `Suggested.lean` line 579 (`compactManifoldFiniteCWType`, Stage 8.7). `TauCetiRoadmap/GeometricTopology/README.md` line 3139, in 12.1: "Compact smooth manifolds have finite CW type (`TauCeti.FiniteCWType`), through 11.2."

**Claim.** The same theorem is a target of GeometricTopology 12.1 and a headline of AlgebraicTopology Stage 8.7.

**Witness.** GeometricTopology README line 3132 itself names AlgebraicTopology as the consumer that obtains finite CW type ("This is the item that AlgebraicTopology (compact smooth manifolds have finite CW type) … consume"). AlgebraicTopology lines 3055–3062 derive it from 12.1.

**Repair.** Keep Stage 8.7 as the single owner. Replace GeometricTopology 12.1's third bullet with a sentence citing AlgebraicTopology Stage 8.7 (`compactManifoldFiniteCWType`, `compactManifoldWithBoundaryFiniteCWType`). That edit is in this pull request's GeometricTopology folder.

## R04 (P3) — Stage 6.3 re-defines the native orientation local system, and the docstring names it as missing

**Location.** README lines 2224–2225: "define the integral orientation local system by `or_U(x)=H_m(U,U\{x};ℤ)`, with the excision transport below". README lines 2268–2272 build `T_L` "with transport defined by excision on coordinate balls". `Suggested.lean` lines 140–142 say the orientation local system `or_M` is a construction of the roadmap.

**Witness.** `TauCeti.localHomologySystem` is declared at `Singular/LocalHomology/System.lean:406`: a functor from the fundamental groupoid, with fibre `H_k(M, M∖{x})`, whose docstring calls it "the orientation local system" for k = dim E. Its transport is characterised by `TauCeti.eq_localHomologyTransport` (line 481). The only native cap product is the absolute `TopCat.singularCap` (`Cohomology/Cap/Basic.lean:101`).

**Repair.** Cite `TauCeti.localHomologySystem` with its file among the Tau Ceti contracts, as `or_U` and as `T_L` for constant L. Stage 6.3 then owns only the twisted-L functor and `T_L ≃ L⊗or_U`. In the docstring, give the missing carriers as the cap product with local coefficients and the relative cap product.

## R05 (P3) — The pair-quotient comparison is stated over a narrower ring than the README claims

**Location.** README lines 1331–1332: "for every n≥0 and every constant module M over any coefficient ring". `Suggested.lean` line 318: `(R : Type u) [CommRing R]`.

**Witness.** A scratch copy of `ordinaryPairQuotientComparison` with `[Ring R]` elaborates; `lake env lean` reports only the `sorry` warning.

**Repair.** State the homology theorem with `[Ring R]`. Say in the README that the cohomological form is stated for commutative R, or test it with `[Ring R]` and generalise it if it elaborates.

## R06 (P3) — Stage 6.4 cites "GT Layer 1" as a whole layer, giving a layer-level cycle, and its dependency row omits GeometricTopology

**Location.** README line 2628–2629: "a two-sided tube around the boundaryless compact ∂K in U from GT Layer 1". The dependency row for 6.1–6.4 at line 2713 does not mention GeometricTopology.

**Witness.** GeometricTopology README line 775 (1.4, connected sum) needs "AlgebraicTopology … Stage 7", and AlgebraicTopology Stage 7 consumes Stages 2–6 (line 2720). So GT Layer 1 → AT 6.4 → AT 7 → GT 1.4 at layer granularity. The tube itself is GT 1.3 (line 665).

**Repair.** Cite GeometricTopology 1.3 (tubular neighbourhoods) and 1.1 (collars) instead of "Layer 1". Add them to the 6.1–6.4 row and to "From other roadmaps" (lines 703–706).

## R07 (P3) — Ids that only open revisions define, with no named revision, leave the nerve-to-Milnor comparison unowned on main

**Location.** README lines 105–111 ("its Layer 1", "its Layer 2, the comparison with the nerve model", for ClassifyingSpaces), line 179 ("its C1.5a") and line 685 ("projectiveEMComparisons is CharacteristicClasses C1.5a").

**Witness.** On main, ClassifyingSpaces has Stages 1–4 and no nerve model, and CharacteristicClasses has no C1.5a: its README line 63 has C1.6 consume AT8.10 and AT8.12. Layers 1–2 exist at #1854's head (lines 262 and 398). Main's AlgebraicTopology owned the bar-to-Milnor comparison (main README line 1829); this head drops it.

**Repair.** Name the CharacteristicClasses/ClassifyingSpaces revision (#1854, or whichever of #1807/#1808/#1854 lands) in this pull request's description as a merge prerequisite. Otherwise, until it merges, cite main's ids (ClassifyingSpaces Stage 3; CharacteristicClasses C1.5/C1.6) and keep the comparison in 8.8b.

## R08 (P3) — Conflicting open heads change this roadmap, and no merge order is stated

**Location.** The pull-request description, which says nothing on ordering.

**Witness.** The overlap check (`roadmaps overlaps AlgebraicTopology`) reports that #1187, #1652, #1807, #1808 and #1854 all change `TauCetiRoadmap/AlgebraicTopology/README.md` and `Suggested.lean`, and each conflicts with #1797. Its AlgebraicTopology README differs from #1854's head in 1841 diff lines.

**Repair.** State in the description which pull request merges first and which is rebased onto which; for example, #1797 is rebased onto #1854, and #1652 onto #1797. Do not put pull-request numbers in the README.

## R09 (P3) — Three headlines lack locators, and one library file is mis-cited

**Location.** `lsCupLength_add_one_le_categoryCount` (README 6.2 supplement, lines 2098–2125, and `Suggested.lean` line 501), `groupClassifyingSpace_isEMOne` (README 8.8, lines 3066–3075, and `Suggested.lean` line 613) and `properStrongDeformationRetract_of_inverse` (README lines 2982–2996) carry no locator. README line 498 files `TauCeti.IsHurewiczFibration` under `Topology/Homotopy/MappingPath/`.

**Witness.** hatcher line 9937 (§3.2 Exercise 2, p. 229): n contractible open sets kill n-fold positive cup products. Example 1B.7 (p. 89, line 3844) builds the Δ-complex BG. Corollary 0.20 is on p. 16 (line 870). The predicate is declared at `Topology/Homotopy/HurewiczFibration/Basic.lean:58`.

**Repair.** Add these locators:
- Hatcher §3.2 Ex. 2, p. 229, for the cup-length bound; categorical opens follow by the same relative-cup argument.
- Hatcher Example 1B.7, p. 89, for the bar model.
- Hatcher Proposition 0.19 and Corollary 0.20, p. 16, with FTW Theorem 1.6, for proper rectification.

Also correct the file of `IsHurewiczFibration`.

## Verified sound

**Gate and build.**
- The worker's gate at 692438c passes on every check, including build and depcheck.
- My rerun gives the same 0 on every AlgebraicTopology check. Its outside-folder hits all lie in the folders this pull request owns, because I ran it without the brief's folder exclusions.
- Depcheck output: `depcheck: 235 roadmaps, 2255 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.

**Elaboration.**
- `lake env lean Suggested.lean`: 18 `declaration uses sorry` warnings and nothing else. All 92 `#check` pins elaborate.
- I ran `#check @` on all 44 declarations in a scratch file and compared each elaborated type with its README statement. No section binder is lost and nothing changed.

**Padding probe.**
- All 18 theorems fail `first | rfl | (simp; done) | infer_instance | trivial | (norm_num; done)`.
- None restates a definition or mirrors a Check.

**Duplication audit at the pins.** None of the following exists natively:
- General CW approximation. Native has only the path-connected case, `isWeakHomotopyEquivalence_cwApproximationMap` (`Homotopy/CWApproximation/Basic.lean:336`).
- Homological Whitehead.
- Cap duality or Poincaré duality.
- Cup length.
- Proper extension.
- Relative Hurewicz with only the subspace simply connected. The native `bijective_hurewicz_of_subsingleton_homotopyGroup` (`Hurewicz/Relative.lean:282`) also needs Y highly connected.
- Mod-Serre Hurewicz. `isoModSerre` occurs only in `RingTheory/Almost`.
- The nerve model as a K(G,1).
- FiniteCWType for compact manifolds.
- Mapping-space CW type.
- The good-pair quotient comparison.
- The twisted compact-support theorem. The constant-coefficient forms are at `LocalHomology/Compact.lean:259` and `:294`.

**Name resolution.**
- All 216 backticked README names not pinned by `#check` resolve at the pins, either by elaboration or by exact declaration grep. Examples: `pi1MulEquivFundamentalGroup_smul` (`FundamentalGroupAction.lean:204`), `eulerChar_sphere_eq_one_sub` (`Sphere.lean:75`), `IsLocallyCollared.isCollared` (`Collar/Brown.lean:459`), `reducedSingularHomologySphereZeroIso_inv_ι` (`Singular/Sphere.lean:184`), and Mathlib's `TopPair`, `SSetPair` and `HomologyPretheory`.
- The claim that Tau Ceti redeclares `Projectivization.instTopologicalSpace` is confirmed (Mathlib `Topology/Algebra/Projectivization.lean:44`; Tau Ceti line 90).

**Dropped names.**
- 448 declarations of main's AlgebraicTopology Lean files are gone at this head.
- Searching main and the open heads finds 21 distinct dropped names still cited elsewhere, including `lsCategoryCount`, `finiteCWEulerCharacteristic`, `RelativeTwistedClassDatum`, `reducedSuspensionSphereHomeomorph`, `compactReducedSuspensionCarrierComparison`, `relativeCWPushout`, `supBallEuclideanDiskHomeomorph`, `towerDifference`, `BasedTopPair` and `SimplyConnectedAtInfinity`.
- Every one is mapped in the "Former names" paragraph.
- No other roadmap declares a name in `TauCetiRoadmap.AlgebraicTopology`.

**Cross-roadmap citations resolved.**
- At this head: UniversalCovers (Completed); GeometricTopology 12.1 (line 3122), Layer 11, 1.1 and 1.3.
- On main:
  - DifferentialGeometry 2.1–2.4, 5.1, 9.3 and 10.5.
  - DeRhamCohomologyAndDuality §4.1 (line 512).
  - CharacteristicClasses C1.2, C1.2a, C2.0 and C3.
  - TopologicalKTheory T1.5, T1.6 and T7.0.
  - GeneralizedCohomology G2.1, G2.10 and G5.
  - ComplexKahlerGeometry K7 and K8.
  - RiemannianGeometry R3 and R4.7.
  - MorseTheory M2, M4 and M5.
  - AffineMorseLefschetz A4 and A4.0.
  - SmoothBundlesConnections B6.1.
  - BanachAlgebras A8.
- The exceptions are in R07.

**Source sample (21 locators, all match).**
- hatcher: Prop. 0.17 p. 15 (line 835); the example before 0.15 (line 794); p. 125 (line 5479); Prop. 2.22 (line 5456); Example 0.6 (line 453); Lemma 3.27 (line 10255); Thm 3.30 (line 10453); Thm 3.43 (line 10976); Prop. 4.13 (line 15375); Prop. 4.21 (line 15508); Prop. 4.30 (line 15928); Cor. 4.33 (line 16001); Thm 4.37 p. 371 (line 16124); Thm 4.57 (line 17069); A.3, A.4 p. 522, A.6 and A.14 p. 530.
- brown: 6.7.2 (line 9424); 7.4.2 and the Addendum, pp. 285–286 (lines 11027–11043); 8.4.1; 9.1.2.
- vogt1972: Proposition and Lemma 1, p. 627 (lines 28, 39). The track-sum identity H₀+g₀K₀f₀−g₀f₀H₀ ≃ H₀ checks out after renaming Brown's H₀/K₀.
- strom1972: Thm 6 (line 181).
- milnor1959: Thm 3 and Cor. 3, p. 276 (lines 209, 218); Dowker, p. 274 (line 119).
- dugundji1951: 4.1 p. 357, 4.2 p. 358, §7 and 7.1 p. 363.
- ftw1973: Thm 1.6, 4.2, Lemma 4.3 and Cor. 4.9 (lines 134, 600, 610, 752).
- hatcher-vbkt: Prop. 1.20, p. 36.

**Adversarial table.**

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `ordinaryPairQuotientComparison` | B=∅; (D¹,S⁰); B=X≠∅; comb B={0}∪{1/k} | H_n(X)/H_n(X₊)=H_n(X); ℤ/H̃₁(S¹)=ℤ; 0/H̃(pt)=0; free countable rank / ↠ℤ^ℕ, uncountable | true; the comb is excluded by HEP (no retraction) | R05 (ring) |
| `…CohomologyComparison` | B=∅; (D²,S¹), n=2 | H^n(X)=H̃^n(X₊); ℤ/H̃²(S²)=ℤ | true | none |
| `exists_cwApproximation` | ∅; ℚ; Warsaw circle | ∅→∅; discrete ℚ→ℚ; pt→W, all π trivial | true | none |
| `compactSupportTopClass_exists/unique` | K=∅; m=0, finite K; ℝ, K=[0,1] | 0 / vacuous; ⊕_{x∈K}L_x / coordinates; ℤ / local iso ℤ | true | none |
| `poincareDuality_zmodTwo` | RP²; ∅; k points (n=0) | 𝔽₂ ↔ 𝔽₂ for p=0,1,2; 0↔0; 𝔽₂^k↔𝔽₂^k | true | none |
| `poincareDuality_int` | S¹; T²; RP² | H⁰=ℤ→H₁=ℤ, H¹→H₀; ℤ²↔ℤ²; RP² has no orientation (H⁰=ℤ, H₂=0) | true; the hypothesis is needed | none |
| `lsCupLength_add_one_le_categoryCount` | pt; ∅; Sⁿ; T²; RP^∞ over 𝔽₂; zero ring | 1≤1; 1≤0 fails, excluded by `Nonempty`; 2≤2; 3≤3; ⊤≤⊤; 1≤count | true | R09 (locator) |
| `relHurewicz_…subspace` | (D³,S²), n=0; Y=D³⊔S³ | π₃(D³,S²)≅π₂(S²)=ℤ / H₃=ℤ; ℤ vs ℤ², excluded by `PathConnectedSpace` | true | none |
| `homologicalWhitehead` | id_{S²}; Σ³→S³ of degree 1 (Poincaré sphere) | iso; H_* iso but π₁≠0, excluded by `SimplyConnectedSpace` | true | none |
| `HasProperHomotopyExtensionProperty` | A=∅; A=X; comb; ⋁_ℕ[0,1] with A={0} | K=f∘pr₂ proper; K=H; no retraction; no proper K | definition sound; README theorem false | R01 |
| `properStrongDeformationRetract_of_inverse` | ℝ×[0,1] ⊃ ℝ×0; ℝ⊃{0} | (x,t)↦(x,0) proper; no proper inverse, hypothesis fails | true | R09 (locator) |
| `compactManifoldFiniteCWType` (and boundary) | n=0 (finite discrete); S², T²; [0,1], D² | finite CW; χ=2, 0; contractible | true | R03 (owner) |
| `groupClassifyingSpace_isEMOne` | trivial G; ℤ; ℤ/2; S₃ | pt; ≃S¹; RP^∞; π₁≅S₃ | true | R09 (locator) |
| `SatisfiesSerreAxioms` / `hurewicz_isoModSerre` | C=0; C torsion with S³, n=1; n=0; fixed-exponent class | absolute Hurewicz; H₁=H₂=0, ℤ≅ℤ, π₄=ℤ/2↠0; π₂≅H₂, π₃↠H₃; ℤ/dᵐ→ℤ/d²ᵐ leaves the class | true | none |
| `ordinaryEMRepresentability` | K=S¹ (A=ℤ); X=∅; S¹⊔S¹; A=0; −ι | [S¹,S¹]=ℤ=H¹; 1=1; ℤ²=ℤ²; 1=1; evaluates to −1≠1 | true, but no model is asserted to exist | R02 |
| `OrdinaryEMModel` Checks | S², RP^∞, two points | π₃(S²)=ℤ excludes S²; RP^∞ is a model; not path connected | Checks hold | none |
| `continuousHomotopyClasses` Checks | [X,pt]; [pt,[0,1]]; ab vs ba in [S¹,S¹∨S¹] | 1; 1 component vs uncountably many points; conjugate, so equal | hold | none |
| `finiteSourceMappingCWType` / `basedLoopCWType` | K=∅; Cantor→S⁰; K=ℕ; Ω_x S¹ off the 0-cell | pt; countable discrete; Cantor set, no CW type, excluded; components ℤ | true | none |
| `capProduct` / `cupProduct` Checks | [v₀,v₁,v₂] with front/back duals; T² | σ⌢φ=[v₁,v₂] matches native (`Cap/Basic.lean` docstring); 1 vs 0; b⌣a=−a⌣b | hold | none |
| Pair-quotient carrier Checks | B=∅; B=X; (Dⁿ,Sⁿ⁻¹); n=0 | X₊; pt; Sⁿ; S⁰ | hold | none |
| Stage 5.0 Checks and regrading | ℤ→ℤ by 2; ⊕(x_k→y_k); constant filtration; (p,q)=(0,0) | E²=ℤ/2 at (0,0); colimit 0=H₀; E¹=0≠ℤ; (1,−1) in degree 0 | hold | none |
| Stage 6.5 linking sign | n=3,i=1; n=5,i=2; n=7,i=3 | +1 symmetric; −1 skew; +1 symmetric | correct | none |
| Stage 6.3 boundary and pole signs | D¹; D²; ρₙ for n=1,2; p₀=±q | [+1]−[−1]; ccw [S¹]; det −1, +1; σ₀=−1/ε₀=1 and σ₀=1/ε₀=−1 | consistent | none |
| RP² local system | cellular d₁, d₂ for ε vs ℤ | ±2, 0 vs 0, ±2; H⁰,H¹,H²(ε)=0, ℤ/2, ℤ = H₂,H₁,H₀(ℤ) | consistent | none |
| Stage 4.7 simplex map | n=1, z=±1, 0 | e₁, e₀, centroid; weights sum 1 and ≥(1−r)/(n+1) | correct | none |
| Stage 5.4 torus naturality | (z₁²z₂,z₂); swap | det 2; det −1 | correct | none |
| Stage 6.2 H_c Checks | x↦x+1, x³, x²; H(t,x)=(1−t)x+tx² | 1, 1, 0; H(t,−(1−t)/t)=0, not jointly proper | correct | none |
| Stage 7 Checks | S⁰, S¹, S², T⁰, CPⁿ, RPⁿ | 2, 0, 2, 1, n+1, (1+(−1)ⁿ)/2 | correct | none |
| Stage 4.5 compact generation | cocountable uncountable X | compact sets finite, kX discrete ≠ X | correct | none |
| Stage 8.8d exponent argument | ⊕_ℕ ℤ/d | bounded, so Prüfer splits it; Künneth keeps dᵐ | correct | none |
| Stage 6.3 or_U | native `localHomologySystem` | exists natively at System.lean:406 | restated | R04 |
| Stage 8.7 owner | GT 12.1 bullet | same theorem in two folders | duplicate | R03 |

**Ownership against open pull requests.** I checked by object, using `roadmaps grep` over main and 456 heads.
- The nerve model, `OrdinaryEMModel`, `lsCupLength`, `HasProperHomotopyExtensionProperty`, `SatisfiesSerreAxioms` and `LocallyRepresentedTopSection` have no second owner.
- ClassifyingSpaces at #1854 consumes 8.8a rather than building it.
- The AlgebraicTopology–DifferentialGeometry two-way supply is acyclic at item level: AT6.1–6.2 → DG8 → DG10 → AT6.5, and DG2/5.1 → AT6.3. #1854 keeps the same edges.

## Not verifiable

- serre1953 (Ch. III Thm 1; Ch. I axioms II_A, III), fq1990 §7.7, tomdieck2008 Thm 9.5.1, milnor1963 Lemmas 3.6–3.7, weibel 5.5.1(2) and 5.5.10: settled as uncertified, so I did not read them.
- may1967 Ch. 3 and 12: an image-only scan with no OCR on this worker; it is listed in needs-references.
- dowker1952: checked only through milnor1959's quotation at p. 274.
- Eilenberg–Steenrod, G. W. Whitehead, Dold, McCleary, K. Brown (*Cohomology of Groups*) and Serre 1951: chapter-level spine citations, absent from the manifest and the cache.

## Source issues

- **Misprint** in milnor1959 at the proof of Corollary 3, p. 276: the source says Theorem 4 gives the homotopy type of the function-space triad; it should be Theorem 3, since the paper has no Theorem 4; affects nothing.
- **Misprint** in milnor1959 at the end of the proof of Theorem 2, p. 276: the source says the argument completes the proof of Theorem 3; it should be Theorem 2, whose implication (c)⇒(d) it proves; affects nothing.
