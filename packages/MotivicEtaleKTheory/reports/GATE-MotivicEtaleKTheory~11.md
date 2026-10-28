The comment makes one blocking finding with four components, numbered H01–H04 in table order; its completion criterion is answered inside each. The "Checked and found sound" and "Review limits" paragraphs raise no further point (Bloch86 and Beilinson85 stay uncertified and Levine98 waived, as `TauCetiRoadmap/MotivicEtaleKTheory/README.md:748`, :749 and :752 state). All three heads are unchanged: target `83b84dfb91b8c5b462d57b390896bff8e5df7e43`, ColemanIntegration `ae078af76fc2ca886eeaa0e171727cefc6953365`, SchemeKTheoryOperations `88dbd5a787e63263d086c798f1873d401debe960`. Sibling line numbers below are file lines at those heads.

## H01 (CBirkbeck) — answered

Nothing on this branch changes, because the duplicate construction sits in ColemanIntegration: line 2397 still says to construct the specialization and iterated use of homotopy fibres for restriction maps, line 2435 still builds `cubeRelK` one coordinate at a time with its own ordered difference, and line 2446 still lists only L3.Fa.1 under *Needs*. That README names MotivicEtaleKTheory nowhere. The contract that L3.Fa.1–L3.Fa.2 must import is already in `TauCetiRoadmap/MotivicEtaleKTheory/README.md:15`, :211, :222–223 and :727: these lines keep `relativeKSpace`, `higherKGroupWithSupports`, `cubeRelK` and `cubeRelK.relativityIso` as Quillen-model adapters under SchemeKTheoryOperations §2.5, with zero-face-minus-infinity-face differences (1,0)↦1 and (0,1)↦−1 (:231) and two-loop exchange −1 (:232).

## H02 (CBirkbeck) — answered

Nothing on this branch changes. SchemeKTheoryOperations still assigns "multi-relative refinements and regulators" to ColemanIntegration at line 9 and "multi-relative constructions" at line 2403. This conflicts with `TauCetiRoadmap/MotivicEtaleKTheory/README.md:15`, where §2.0a owns the shared iterated restriction-fiber refinement, and with :17, where §§3.3–3.4, 4.1–4.2 and 7.1 own the general Deligne construction and character. So the corrected line-9 sentence must also narrow its unrestricted "regulators" to ColemanIntegration's arithmetic and syntomic regulators. No reverse prerequisite is needed. SchemeKTheoryOperations §§2.5, 6.1 and 6.8–6.9 supply this roadmap, which supplies ColemanIntegration, and the dependency check below reports 0 problems.

## H03 (CBirkbeck) — answered

Nothing on this branch changes. ColemanIntegration line 2650 still says to construct the complex regulator `reg_∞`, and its *Needs* at line 2659 (L3.Fa.1, L3.Fb.2, L3.Fc.2 and Mathlib) does not import §§7.1/7.4 here. The import it needs is `TauCetiRoadmap/MotivicEtaleKTheory/README.md:729` with :667: for p≥2, reg_∞=πₚ₋₁∘ch_D,p, where πₚ₋₁(z)=(z+(−1)ᵖ⁻¹z̄)/2 on H_D¹(Spec ℂ,ℝ(p))=ℂ/ℝ(p). At z=3+4i this gives 4i∈ℝ(1) for p=2 and 3∈ℝ(2) for p=3. The map kills (2πi)²=−4π² and (2πi)³=−8π³i respectively. The pairings, Borel's integral-image theorem, the determinants and the syntomic map stay in ColemanIntegration.

## H04 (CBirkbeck) — answered

Nothing on this branch changes. On arbitrary opens the target supplies only generalized weight pieces. It identifies them with simultaneous eigenspaces only on full cubes with product support (`TauCetiRoadmap/MotivicEtaleKTheory/README.md:211`, :223 and :727), and it records the obstruction at :235: for T(e₁)=2e₁ and T(e₂)=e₁+2e₂, dim ker(T−2)=1 but dim ker(T−2)²=2. The clauses that must use generalized pieces on arbitrary opens, or state and prove a separate semisimplicity theorem (which this roadmap does not supply), are:
- ColemanIntegration line 2395, which asserts a common-eigenspace direct sum for the multi-relative pairs of L3.Fa.2;
- ColemanIntegration line 2437, which gives `K_n^(j)(Y;□^m)` for every open Y; its weight statements on localized cubes at lines 2442–2444, 2458–2463, 2555 and 2610–2618 inherit this;
- SchemeKTheoryOperations line 2405, which asks for "simultaneous rational weight summands" on the iterated homotopy-fibre comparisons.

## Ownership, citations and interfaces

- **Ownership search.** The search was by object (multi-relative/relative cube K-theory, `relativityIso`, complex Beilinson regulator) across main and the indexed open roadmaps. It finds only ColemanIntegration, SchemeKTheoryOperations and this roadmap. ColemanIntegrationPartII at its head mentions none of these objects.
- **Why §2.0a owns the refinement.** It is needed here before the geometric cycle-to-K comparison of §2.3, on the vertex models that SchemeKTheoryOperations §§2.5, 6.1 and 6.8–6.9 supply earlier in the order. ColemanIntegration consumes it later.
- **No moves.** No ownership was moved, no supplier was added, and no declaration was given another roadmap's name.
- **Unchanged sections.** SchemeKTheoryOperations is still at `88dbd5a787e63263d086c798f1873d401debe960`, so the sections cited at :15–17 and :211–223 are unchanged. Its §6.9 (simultaneous weights on supported vertex groups) was re-read at that head.
- **Suggested.lean.** It declares nothing: one import, one module docstring and an empty namespace. So the `#check @name` inventory is empty and no elaborated signature or binder changed.
- **Sources.** No new source was needed and no missing-text request was made.

## Adversarial mathematics pass

No statement was added or changed. The rows recompute the statements that the four components rely on.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Ordered relativity, n=1 (:223, :231) | face ranks (1,0),(0,1),(1,1); reversed order | a−b gives 1,−1,0; reversed gives −1,1,0 | holds | none |
| Two-loop exchange (:223, :232) | {u,v} over ℚ(u,v) | exchange −{u,v}; ψ²{u,v}=2·2{u,v}=4{u,v} | holds | none |
| Full-cube weights (:223, :231) | Spec ℚ, unit 2, n=1 | class ↦[2]; ψ² gives 2[2], ψ³ gives 3[2] on both sides | holds | none |
| Generalized pieces on opens (:211, :235) | T=[[2,1],[0,2]] | (T−2)e₂=e₁≠0, (T−2)²=0; kernel dimensions 1 and 2 | generalized ≠ eigen | none |
| Equivariant transport (:235) | φT=T′φ, φ invertible | dim ker(T−2)ᵏ=dim ker(T′−2)ᵏ for k=1,2: 1 and 2 | no semisimplicity from transport | none |
| Vertex agreement (:211) | K₀(ℙ²)_ℚ, weights 0,1,2 | ψ² roots 1,2,4 distinct, so ∏(ψ²−2ʲ)=0 makes it diagonalizable | generalized = eigen on vertices | none |
| Rational coefficients (:234) | ℙ², h=1−[O(−1)] | ψ²h=2h−h², ψ²h²=4h²; ψ²(2h+h²)=2(2h+h²); lattice index 2 | ℚ needed | none |
| Integral pointed scope (:230) | Spec ℚ, η·1=[−1] | ψ²[−1]=[1]=0, while a spectrum map fixing 1 would fix η·1=[−1]≠0 | spectrum claim excluded | none |
| Arbitrary open cube (:233) | Spec ℤ₃ cube minus t=2 | face ranks (1,1), difference 0; no delooping asserted | holds | none |
| Common-base pairing (:222, :236) | Spec ℤ[i] self-product over ℤ at (1+i,s−i) | s²+1=v(v+2i) with 2i∈(1+i)²; dimension 1, cotangent dimension 2 | singular, excluded | none |
| n=0 and support ends (:221) | S=∅; S=X=Spec k | groups 0; [k²]=2 | holds | none |
| Marked point quotient (:667, :729) | z=3+4i; p=2,3 | π₁=4i∈ℝ(1), π₂=3∈ℝ(2); π₁(−4π²)=0, π₂(−8π³i)=0 | holds | none |
| Wrong parity (:667) | p=2, (z+z̄)/2 | sends −4π²∈ℝ(2) to −4π²≠0 | excluded | none |
| Weight-one exponential (:652, :709) | u=2,i,1/2; log u+2πi | Re log: log 2, 0, −log 2; branch change 0 | holds | none |
| Supply direction (:15, :727) | SchemeKTheoryOperations → here → ColemanIntegration | dependency check 0 problems, no UPWARD/CYCLE line | holds | none |

## Build and gate

No file changed, so there is no commit; nothing was pushed.

`lake build TauCetiRoadmap.MotivicEtaleKTheory.Suggested` exited 0 with no warnings:

```text
✔ [8976/8976] Built TauCetiRoadmap.MotivicEtaleKTheory.Suggested (1.0s)
Build completed successfully (8976 jobs).
```

The gate against origin/main exited 0:

```text
gate MotivicEtaleKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The dependency-direction check with the merge order and `--movable` exited 0. It printed no UPWARD, CYCLE or moved line:

```text
depcheck: 55 roadmaps, 638 edges, 0 problem(s)
```
