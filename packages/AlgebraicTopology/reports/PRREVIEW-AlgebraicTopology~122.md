# Review of AlgebraicTopology (pull request #1797 at 8709785)

**Verdict:** needs changes

## R01 (P2) — The GeometricTopology section numbers cited for Stages 6.4 and 8.7 no longer exist or point to other sections

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 714–719: "12.1 (Whitehead's smooth triangulation …) … 1.2 (gluing along faces, with its rounding of corners) and 1.3 (tubular neighbourhoods of compact submanifolds)". The same numbers appear in:

- README line 2497 ("1.2 the gluing API").
- README line 2651 ("GeometricTopology 1.3 (tubular neighbourhoods …)").
- README line 2662 ("rounded as in GeometricTopology 1.2").
- The 6.1–6.4 dependency row at line 2736.
- README line 3097 ("GeometricTopology 12.1").
- The docstrings of `compactManifoldFiniteCWType` and `compactManifoldWithBoundaryFiniteCWType` (`Suggested.lean` lines 593 and 605, "GeometricTopology 12.1").

**Claim.** These numbers follow the GeometricTopology README as it stood at 692438c. This head's merge of main brought in GeometricTopology's renumbered README. Against it:
- 12.1 resolves to nothing.
- 1.2 is a different section.
- 1.3 is the gluing section, not tubular neighbourhoods.

The previous R06 is therefore only partly repaired: the layer-level citation is gone, but the item numbers that replaced it are stale.

**Witness.** `TauCetiRoadmap/GeometricTopology/README.md` at this head: §1.2 (line 1311) is complements of embedded balls, §1.3 (line 1340) gluing with corner rounding, §1.5 (line 1551) tubular neighbourhoods, §11.3 (line 10631) smooth triangulation; no Layer 12. Main matches (lines 822, 851, 974, 7887).

**Repair.** Renumber everywhere listed above, to the items GeometricTopology's own downstream entry (lines 10878–10883) already expects this roadmap to consume:
- Line 714: "11.3 (the Cairns–Whitehead smooth triangulation, with its half-space form) and 11.1 (the realization and its CW structure)".
- Line 717: "1.3 (gluing along the boundary, with its rounding of corners) and 1.5 (tubular neighbourhoods of compact submanifolds)".
- Line 2497: "1.3 the gluing API".
- Line 2651: "GeometricTopology 1.5".
- Line 2662: "rounded as in GeometricTopology 1.3".
- Row 2736: "1.1 collars, 1.3 corner rounding and 1.5 tubular neighbourhoods".
- Line 3097: "GeometricTopology 11.3 … and 11.1's realization homeomorphism and CW structure".
- Both `Suggested.lean` docstrings: "GeometricTopology 11.3".

I checked the renumbered items for cycles. GeometricTopology 1.1, 1.3, 1.5, 11.1 and 11.3 consume no AlgebraicTopology item; its contract (lines 1109–1131) feeds only 1.4, 2.1, 3.x, 4.1, 5.x, 6.4, 7.4, 8.x, 9.x, 10.x and 11.1, and 11.1 takes only Stage 4. So no item-level cycle results.

## R02 (P2) — "Compact smooth manifolds have finite CW type" still has two owners, and each roadmap hands it to the other

The previous review's R03, not repaired.

**Location.**
- `TauCetiRoadmap/GeometricTopology/README.md` lines 10661–10664 (11.3): "a compact smooth manifold has finite CW type, `TauCeti.FiniteCWType`, by `TauCeti.IsTriangulable.finiteCWType` (Layer 11.1). This is the item that AlgebraicTopology … consume". The same claim recurs at lines 10882–10883.
- `TauCetiRoadmap/AlgebraicTopology/README.md` lines 3099–3102 own the same theorem as `compactManifoldFiniteCWType` and `compactManifoldWithBoundaryFiniteCWType` (`Suggested.lean` lines 596 and 608).

**Claim.** The same theorem is a GeometricTopology 11.3 target and an AlgebraicTopology Stage 8.7 headline. GeometricTopology says AlgebraicTopology consumes it. AlgebraicTopology says it proves it from GeometricTopology's triangulation.

**Witness.** `git diff origin/main...HEAD -- TauCetiRoadmap/GeometricTopology/README.md` adds the 11.3 sentence. Main's GeometricTopology README has no finite-CW-type claim; main's AlgebraicTopology README line 1815 (Stage 8.7) owns "The compact case has finite CW type".

**Repair.** Keep AlgebraicTopology Stage 8.7 as the single owner, since it is the owner on main.
- In GeometricTopology 11.3 (lines 10661–10664), replace the clause with: "that a compact smooth manifold, with or without boundary, has finite CW type is AlgebraicTopology Stage 8.7 (`compactManifoldFiniteCWType`, `compactManifoldWithBoundaryFiniteCWType`), which consumes this item and 11.1".
- At lines 10882–10883, replace "that compact smooth manifolds have finite CW type" with "for its Stage 8.7 finite-CW-type theorem".

Both edits are in this pull request's GeometricTopology folder. Main's AffineMorseLefschetz README does not consume the theorem from either roadmap, so its mention at line 10664 can simply be dropped.

## R03 (P3) — Ids defined only at open revisions are cited, and no revision is named

The previous review's R07, not repaired.

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md`:
- Line 109: "the pointed uniqueness of aspherical CW complexes (its Layer 1)".
- Line 112: "(its Layer 2, the comparison with the nerve model)", both for ClassifyingSpaces.
- Line 180: "its C1.5a, the classical Eilenberg–MacLane comparisons".
- Line 696: "projectiveEMComparisons is CharacteristicClasses C1.5a".

**Claim.** On main, ClassifyingSpaces has Stages 1–4 and no Layers 1–2, and CharacteristicClasses has no C1.5a. Neither the pull-request description nor a merge-order paragraph names the revision that defines them.

**Witness.** Main ClassifyingSpaces has Stages 1–4 (lines 110–222); its Stage 3 owns uniqueness and the model comparisons. Main CharacteristicClasses line 63 has C1.5 and C1.6, no C1.5a. #1854's head defines Layers 1–2 (lines 244, 387) and C1.5a (line 324).

**Repair.** Either fix is enough:
- In the folder: cite main's ids, "ClassifyingSpaces Stage 3 (uniqueness and the comparison of the models)" at lines 109–112, and "CharacteristicClasses C1.5–C1.6" at lines 180 and 696.
- In the description: name the CharacteristicClasses/ClassifyingSpaces revision (#1854, or whichever of #1807, #1808 and #1854 lands) as a merge prerequisite.

The second fix is a description edit, not a README edit.

## R04 (P3) — Conflicting open heads change this roadmap, and no merge order is stated

The previous review's R08, not repaired.

**Location.** The pull-request description, which says nothing about ordering.

**Witness.** `roadmaps overlaps AlgebraicTopology`: #1187, #1652, #1807, #1808 and #1854 each change this folder's `Suggested.lean` (all but #1187 also its README), and each conflicts with #1797.

**Repair.** State in the description which pull request merges first and which is rebased onto which. For example: #1797 is rebased onto #1854, and #1652 onto #1797. Keep pull-request numbers out of the README.

## Verified sound

### The previous review (692438c), finding by finding

- **R01, repaired.** README lines 2996–2998 now read "every subcomplex A of a strongly locally finite CW complex X, one covered by a locally finite family of finite subcomplexes, has the property". The docstrings at `Suggested.lean` lines 556–558 and 573–575 match. The new wedge Check (lines 3038–3045) is correct: an extension K has {1}×U ⊆ K⁻¹[½,1] for a neighbourhood U of 0, U meets every open 1-cell, and Hatcher Prop. A.1 then rules out compactness. FTW backs every clause: Theorem 1.6 (ftw1973 line 134), Theorem 1.4 (line 101), Remark 1.9 (line 205) and the definition at line 66.
- **R02, repaired.** `nonempty_ordinaryEMModel` (line 701) and `exists_ordinaryEMLoopEquivalence` (line 780) are stated, and the docstring bullet (lines 155–158) is narrowed to genuine data.
- **R03, not repaired.** See R02 above.
- **R04, repaired.** README lines 2240–2243 now say "is the native `TauCeti.localHomologySystem` … do not build a second one". The contract (lines 454–461) cites `TauCeti.localHomologySystem`, `TauCeti.eq_localHomologyTransport` and `TauCeti.isLimitLocalHomologySystemCone`. The docstring (lines 144–149) names the actually missing carriers.
- **R05, repaired.** Both comparisons take `[Ring R]` (lines 328 and 338), and the cohomological one uses `k := ℤ` (line 341). Hom_R(R[S], M) = M^S as an abelian group, so nothing depends on commutativity.
- **R06, partly repaired.** The citation and dependency row were updated, but with the pre-merge numbering. See R01 above.
- **R07, not repaired.** See R03 above.
- **R08, not repaired.** See R04 above.
- **R09, repaired.** Locators were added at README lines 2119–2122, 3112–3116 and 3024–3027, and the file of `IsHurewiczFibration` is corrected at line 508. All are verified in the sample below.

### Gate, build, elaboration and probes

- The worker's gate at 8709785 passes every check, including build and depcheck. My rerun without the brief's folder exclusions reports only `outside-folder` hits. All 17 lie in GeometricTopology, QuadraticFormInvariants, ReductiveGroups and LieHighestWeight, which the brief names as this pull request's own.
- Depcheck output: `depcheck: 235 roadmaps, 2258 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. This roadmap is on main, and its suppliers are on main: UniversalCovers (Completed), GeometricTopology and DifferentialGeometry.
- `lake env lean Suggested.lean`: 0 errors, and the 20 `declaration uses sorry` warnings are the only warnings. All 91 `#check` pins elaborate.
- Signature pass: a scratch file elaborated `#check @` on all 46 declarations. Each type matches its README statement and no section binder is lost. Nothing changed from the earlier pass.
- Padding probe: all 20 theorems fail `first | rfl | (simp; done) | infer_instance | trivial | (norm_num; done) | decide`, with 20 errors at the 20 proof sites. None restates a definition or mirrors a Check.

### Source sample (15 targets, seeded; all match)

- hatcher:
  - Prop. 2.21 (line 5222), for Stage 3's small chains.
  - Prop. 3.29 (line 10370). Its i>n half does not use noncompactness, so "the route of Proposition 3.29" is accurate for all manifolds.
  - Thm. 3.30 (line 10453).
  - §3.2 Ex. 2, p. 229 (line 9937): the n contractible open sets kill n-fold products.
  - Ex. 1B.7, p. 89 (line 3844): straight-line contraction to [e] and a free action on simplices.
  - Ex. 0.6 (line 453): the characteristic map w↦(w,√(1−|w|²)).
  - §4.2, p. 365 (line 15901): the CW K(G,n) for abelian G.
  - Prop. 4.30 and Lemma 4.31, p. 366 (lines 15928–15935).
  - Thm. A.6 (line 22693): the product CW structure on (X×Y)_c, equal to X×Y when one factor is locally compact.
- milnor1959:
  - Thm. 3, p. 276 (line 209), for compact n-ads into W_n.
  - Cor. 3, p. 276 (line 218).
  - Dowker's comparison quoted on p. 274 (line 119).
- dugundji1951:
  - Thm. 4.1, p. 357 (line 155).
  - Cor. 4.2, p. 358 (line 201): convex sets, closed or not, are ARs.
  - §7 and Thm. 7.1, p. 363 (lines 342–367), with the Kuratowski–Wojdysławski embedding.
- ftw1973: Thm. 1.4 (line 101), Thm. 1.6 (lines 134–139) and Rem. 1.9 (lines 205–210).
- hatcher-vbkt: Prop. 1.20, p. 36 (line 1445).
- The new locators outside the sample also match:
  - Cor. 4.33, p. 367 (line 16001).
  - Prop. 0.19 and Cor. 0.20, p. 16 (lines 867–870).
  - Prop. A.1, p. 520 (line 22534).
  - Thm. 4.37 (line 16124: (n−1)-connected pairs of path-connected spaces, n≥2, with π′=π when A is simply connected).
  - Thm. 4.57 (line 17069: based classes, n>0).

### Library declarations opened at the pins

All are in Tau Ceti at 2fd255d997.
- `TauCeti.localHomologySystem`, `Singular/LocalHomology/System.lean:406`. Its docstring calls it the orientation local system for k=dim E.
- `TauCeti.eq_localHomologyTransport` (`System.lean:481`) and `TauCeti.isLimitLocalHomologySystemCone` (`Singular/LocalHomology/TopHomology.lean:97`).
- `TauCeti.IsHurewiczFibration`, `Topology/Homotopy/HurewiczFibration/Basic.lean:58`.
- `HomotopyGroup.pathLoopSpaceMulEquiv m : π_(m+1)(Ω X, refl x) ≃* π_(m+2)(X,x)`, `Topology/Homotopy/HomotopyGroup/LoopSpace.lean:321`. It is built from `piLoopSpaceMulEquiv m 1` through `finSumFinEquiv`, so the loop coordinate is last, as README 8.11b says.
- `HomotopyGroup.zerothHomotopyLoopSpaceEquivFundamentalGroup`, `LoopSpace.lean:200`.

Absent at the pin, which confirms the docstring's not-statable reasons:
- A K(A,n) existence result for n≥2. Only `TauCeti.isEilenbergMacLaneSpaceOne_killHomotopyGroups` (`Homotopy/KillHomotopyGroups.lean:320`) exists, and the `EilenbergMacLane/` folder has only degree-one material. So `nonempty_ordinaryEMModel` duplicates nothing.
- Compactly supported singular cohomology and a relative cap product. `Cohomology/Cap/` holds only `Basic`, `Associativity` and `Unit`. STATUS.md's contrary wording describes a later Tau Ceti commit, not the pin.

### Cross-roadmap citations resolved

- On main:
  - DifferentialGeometry Layer 2 (2.1–2.4), 5.1 (the boundary interface and outward-first `boundaryOrientation`), 9.3 and 10.1–10.5.
  - DeRhamCohomologyAndDuality §4.1 (line 512).
  - CharacteristicClasses C1.2, C1.2a, C1.5, C1.6, C2.0 and C3.
  - ClassifyingSpaces Stage 3.
  - GeometricTopology 1.1, 11.1 and 11.3, with the exceptions in R01.
  - UniversalCovers (Completed).
  - HeegaardFloer, AffineMorseLefschetz, MorseTheory, RiemannianGeometry, ComplexKahlerGeometry, GeneralizedCohomology, TopologicalKTheory, SmoothBundlesConnections and DGFloer, all named as consumers.
- The exceptions are in R01 and R03.
- `roadmaps resolve` found no unresolved citation or Lean name.

### Ownership against open pull requests

I searched by object with `roadmaps grep` over main and 458 heads.
- The K(A,n) existence and the loop comparison have no second owner. DGFloer (#963, #1798) and StringOrientation (#948) consume 8.8c/8.11b. StableHomotopyKTheory 5.15 (#1227) builds spectrum-level Eilenberg–MacLane objects, not these spaces.
- No other `Suggested.lean`, including those of the five open revisions of this folder (R04), declares the two new names.

### Adversarial table

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `ordinaryPairQuotientComparison` (`[Ring R]`) | B=∅; (D¹,S⁰); B=X≠∅; R=M₂(ℚ), M=ℚ²; comb B={0}∪{1/k} | H_n(X) / H_n(X₊,*)=H_n(X); H₁: ℤ/ℤ, H₀: 0/0; 0 / H̃(pt)=0; free left R[S]-chains, same exact sequences; H₁(X,B)=ℤ^(ℕ) countable / H₁(Hawaiian earring)↠ℤ^ℕ uncountable | true; comb excluded by HEP | none |
| `ordinaryPairQuotientCohomologyComparison` (`k=ℤ`) | B=∅; (D²,S¹), n=2; noncommutative R | H^n(X;M) / H^n(X₊,*;M); ℤ/ℤ; Hom_R(R[S],M)=M^S on both sides | true | none |
| `exists_cwApproximation` | ∅; ℚ⊂ℝ; Warsaw circle W; Cantor set | ∅→∅; discrete ℚ→ℚ, π₀ bijective; pt→W, all π trivial; uncountable discrete 0-complex | true | none |
| `compactSupportTopClass_unique` / `_exists` | K=∅; m=0, finite K; ℝ, K=[0,1], L=ℤ; open Möbius band, L=or, K=core circle | H_m(M,M)=0, vacuous; ⊕_{x∈K}L_x with coordinate maps; ℤ→ℤ iso at each x; H₂(Mö,Mö∖S¹;or)≅H₀(S¹;ℤ)=ℤ, canonical section | true | none |
| `poincareDuality_zmodTwo` | RP²; ∅; n=0, k points; S¹⊔S¹ | 𝔽₂/𝔽₂ for p=0,1,2; 0/0; 𝔽₂^k/𝔽₂^k; 𝔽₂²/𝔽₂² | true | none |
| `poincareDuality_int` | S¹; T²; RP²; ∅ | H⁰=ℤ→H₁=ℤ (1↦[S¹]), H¹=ℤ→H₀=ℤ; ℤ²/ℤ²; RP² has no orientation (H⁰=ℤ, H₂=0); 0/0 | true; orientation needed | none |
| `lsCupLength_add_one_le_categoryCount` | pt; ∅; Sⁿ; T²; RP^∞ over 𝔽₂; S¹⊔S¹; zero ring | 1≤1; 1≤0 fails, excluded by `Nonempty`; 2≤2; 3≤3; ⊤≤⊤; 2≤2+2=4; 1≤count | true | none |
| `relHurewicz_bijective_of_simplyConnected_subspace` | (D³,S²), n=0; Y=D³⊔S³ ⊃ S² | π₃(D³,S²)≅π₂(S²)=ℤ / H₃(D³,S²)=ℤ; π₃=ℤ / H₃=ℤ², excluded by `PathConnectedSpace` | true | none |
| `homologicalWhitehead` | id_{S²}; Poincaré sphere Σ³→S³ of degree 1 | iso / iso; H_* iso but π₁(Σ³) has order 120, excluded by `SimplyConnectedSpace` | true | none |
| proper HEP theorem and `HasProperHomotopyExtensionProperty` | A=∅; A=X; comb; ⋁_ℕ[0,1], A={0}; ℝ with 0-cells ℤ, A=ℤ | K=f∘pr₂, K⁻¹C=I×f⁻¹C compact; K=H; no retraction I×X→Y; {1}×U⊆K⁻¹[½,1] meets infinitely many cells, not compact; 1-dimensional locally finite, so FTW 1.4+1.6 apply | true as now worded | none |
| `properStrongDeformationRetract_of_inverse` | ℝ×I⊃ℝ×0; ℝ⊃{0}; A=X | r(x,t)=(x,0), r⁻¹(C×0)=C×I compact, H(s)=(x,(1−s)t) jointly proper; no proper inverse, hypothesis fails; r=id | true | none |
| `compactManifoldFiniteCWType` / `…WithBoundaryFiniteCWType` | n=0; S², T²; [0,1], D²; ∅ | finite discrete; finite CW, χ=2 and 0; contractible finite CW; empty CW | true | R01, R02 |
| `groupClassifyingSpace_isEMOne` | trivial G; ℤ; ℤ/2; S₃ | point; ≃S¹; RP^∞ with H₁=ℤ/2, H₂=0; π₁≅S₃ | true | none |
| `SatisfiesSerreAxioms` Checks | C=0; torsion; finite; fixed exponent dᵐ | 0⊗0=Tor=0, B1 contractible; closed; H_*(BG) finite in each degree, killed by \|G\|; 0→ℤ/dᵐ→ℤ/d²ᵐ→ℤ/dᵐ→0 leaves the class | hold | none |
| `hurewicz_isoModSerre` | C=0; torsion, X=S³, n=1; finite, X=S², n=0 | absolute Hurewicz; H₁=H₂=0, π₃=ℤ≅H₃=ℤ, π₄=ℤ/2↠H₄=0; π₂=ℤ≅H₂=ℤ, π₃(S²)=ℤ↠H₃=0 | true | none |
| `nonempty_ordinaryEMModel` | (0,1); (ℤ,1); (ℤ,2); (ℚ,1); S² for (ℤ,2) | point; S¹; CP^∞; telescope of circles under degree-k maps; π₃(S²)=ℤ, rejected | true | none |
| `exists_ordinaryEMLoopEquivalence` | A=0, m=0; A=ℤ, m=0 (S¹, CP^∞); A=ℤ/2, m=0; K.point inside a 1-cell | constant map at refl, both sides 1; π₁(ΩCP^∞)=π₂(CP^∞)=ℤ, other π_j=0, a map S¹→ΩCP^∞ inducing id on ℤ exists; same over ℤ/2; HEP of a point of an open cell and trivial π₁-action on the H-group ΩK′ make f pointed with the same f_* | true | none |
| `OrdinaryEMModel` Checks | S¹; S²; point; two points; RP^∞ | model for (ℤ,1); π₃(S²)=ℤ rejects (ℤ,2); model for (0,n); not path connected; model for (ℤ/2,1), ι≠0 in H¹=𝔽₂ | hold | none |
| `ordinaryEMRepresentability` | K=S¹, A=ℤ; X=∅; X=S¹⊔S¹; A=0; −ι | [S¹,S¹]=ℤ / H¹=ℤ; 1 class / H=0; ℤ² / ℤ²; 1 / 1; normalization gives −1≠1 | true; ι unique | none |
| `finiteSourceMappingCWType` | K=∅; Cantor→S⁰; K=ℕ; X=∅, K≠∅ | point; countable discrete; Cantor set, no CW type, excluded by compactness; ∅ | true | none |
| `basedLoopCWType` | S¹ at a point of its 1-cell; point; two components | components ℤ; point; loops of one component | true | none |
| `capProduct` Checks | [v₀,v₁,v₂], φ dual to [v₀,v₁]; p=0; p=q on S¹ | σ⌢φ=[v₁,v₂], back-face convention gives 0; σ⌢1=σ; ⟨a,[S¹]⟩=1 gives the point class, −a its negative | hold | none |
| `cupProduct` Checks | same simplex, ψ dual to [v₁,v₂]; T² over ℤ and ℤ/2 | (φ⌣ψ)(σ)=1 / (ψ⌣φ)(σ)=0; b⌣a=−a⌣b≠a⌣b since H²=ℤ; equal over ℤ/2 | hold | none |
| `LocallyRepresentedTopSection` Checks | ℝ^m translated generator; sign flip at 0 on ℝ; m=0 | represented; same sign on a bounded J∋0, not represented; every family represented | hold | none |
| Stage 4.4 carrier Checks | B=∅; B=X; (Dⁿ,Sⁿ⁻¹), n=0 | X₊, H̃₀=H₀(X); point; S⁰, H̃₀=ℤ=H₀(D⁰) | hold | none |
| Stage 5.0 Checks | ℤ→ℤ (×2); ⊕(x_k→y_k); constant filtration | E²=ℤ/2 at (0,0), 0 at (1,0), equal to H; d^(k+1) from (k+1,−k), colimit 0=H₀; E¹=0 / H₀=ℤ | hold | none |
| Stage 7 Checks | S⁰,S¹,S², unit sphere of ℝ⁰; T⁰; CPⁿ; RPⁿ | 2,0,2,0; 1; n+1 and (n+1)·0=0=χ(S^(2n+1)); 1+(−1)ⁿ=2χ(RPⁿ)=2Σ_{i≤n}(−1)^i | hold | none |
| Stage 6.2 H_c Checks | x↦x+1, x³, x²; H(t,x)=(1−t)x+tx² | degrees 1, 1, 0; zero set {0,−(1−t)/t} unbounded as t→0⁺ | hold | none |
| Stage 6.5 linking sign | (n,i)=(3,1), (5,2), (7,3) | (−1)^4=+1, (−1)^9=−1, (−1)^16=+1 | symmetric, skew, symmetric as expected | none |
| Stage 6.1/6.3 RP² systems | sign system ε; constant ℤ | δ⁰=±2, δ¹=0: H⁰,H¹,H²(ε)=0,ℤ/2,ℤ / H₂,H₁,H₀(ℤ)=0,ℤ/2,ℤ; d₂=±2, d₁=0 | consistent | none |
| Stage 4.7 cell-ball map | n=1, z=1, −1, 0 | w=(−1,1), (1,−1): weights (0,1)=e₁, (1,0)=e₀; centroid | correct, positive | none |
| Stage 5.4 torus naturality | (z₁²z₂,z₂); swap | det 2; det −1 | correct | none |
| Stage 4.5 compact generation | uncountable X, cocountable topology | compact sets finite, kX discrete ≠ X | correct | none |
| Stage 4.6 CPⁿ cells (sampled) | n=1 | D² via w↦(w,√(1−\|w\|²)), boundary to CP⁰=pt, giving S² | matches Ex. 0.6 | none |
| Stage 4.5 Kelley product (sampled) | X=S¹, Y=⋁_ℕ S¹; X=Y=⋁_ℕ S¹ | cells e_α×e_β with characteristic maps Φ_α×Ψ_β; (X×Y)_c=X×Y, X being compact; (X×Y)_c=X×Y, both having countably many cells | matches Thm. A.6 | none |
| 8.11a ANR inputs (sampled) | C convex in a normed V, not closed | an absolute retract by Cor. 4.2 | matches | none |
| Stage 4.7 paracompactness (sampled) | ⋁_ℕ[0,1] | partitions of unity built over skeleta | matches vbkt Prop. 1.20 | none |
| Stage 3 small chains (sampled) | cover U of X | ι:C^U→C a chain homotopy equivalence | matches Prop. 2.21 | none |
| Stage 6.3 vanishing (sampled) | compact S¹, i=2 | H₂(S¹)=0 by the i>n half of Prop. 3.29's route | matches as a route | none |

## Not verifiable

- serre1953 (Ch. III Thm. 1; Ch. I axioms II_A, III), fq1990 §7.7, tomdieck2008 Thm. 9.5.1, milnor1963 Lemmas 3.6–3.7, weibel 5.5.1(2) and 5.5.10, lee and thom1954: settled as uncertified, so I did not read them. For `hurewicz_isoModSerre`, hatcher-ssat Thm. 1.8 (line 849) confirms the degree-n isomorphism mod C for its listed classes. It states neither the degree-(n+1) epimorphism nor the general-axiom form, which therefore rest on serre1953.
- may1967 (Ch. 3 and 12): an image-only scan with no OCR on this worker; it stays in needs-references.
- dowker1952: checked only through milnor1959's quotation on p. 274.
- Eilenberg–Steenrod, G. W. Whitehead, Dold, McCleary, K. Brown (*Cohomology of Groups*) and Serre 1951: chapter-level spine citations, absent from the manifest and the cache.
- brown, strom1972 and vogt1972: readable, but outside this round's sample. The previous round checked them.

## Source issues

- **Misprint** in milnor1959 at the proof of Corollary 3, p. 276: the source says Theorem 4 gives the homotopy type of the function-space triad; it should be Theorem 3, since the paper has no Theorem 4; affects nothing.
- **Misprint** in milnor1959 at the end of the proof of Theorem 2, p. 276: the source says the argument completes the proof of Theorem 3; it should be Theorem 2, whose implication (c)⇒(d) it proves; affects nothing.
