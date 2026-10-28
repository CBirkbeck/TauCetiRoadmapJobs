## H01 (CBirkbeck) — applied

Ordinary normalized representatives now pass through an integral refined-normalization retraction before the supported cycle-to-K map: `TauCetiRoadmap/MotivicEtaleKTheory/README.md:127`, :135, :220, :261, :283 and :306 specify the homotopy equivalence, facewise vanishing, boundary relations and restriction transports, with the explicit square and its refined representative at :146. BF line 395, BF line 408 and BF line 639 distinguish and compare the two normalizations, while Levine94 line 1197 uses individual-face vanishing; `TauCetiRoadmap/MotivicEtaleKTheory/Suggested.lean:9` records the missing carriers for this additional headline.

## H02 (CBirkbeck) — applied differently

The cube handoff now specifies preserved public adapters, the vertex-to-total-fiber comparison, support and pairing compatibility, generalized weights and ordered signs at `TauCetiRoadmap/MotivicEtaleKTheory/README.md:15` and :724. The conflict is confirmed at ColemanIntegration head ae078af76fc2ca886eeaa0e171727cefc6953365, §§L3.Fa.1–L3.Fa.2: replacing its repeated shared construction with that import remains necessary, but its files are outside the authorized edits, so this finding is only locally repaired.

## H03 (CBirkbeck) — applied differently

The ownership boundary at `TauCetiRoadmap/MotivicEtaleKTheory/README.md:15` now distinguishes SchemeKTheoryOperations' ordinary supported inputs in §§2.5, 6.1 and 6.8–6.9 from this roadmap's shared iterated restriction-fiber construction in §2.0a. SchemeKTheoryOperations head 88dbd5a787e63263d086c798f1873d401debe960 still assigns multi-relative constructions to ColemanIntegration in its scope and downstream contract; that sibling wording must be updated separately while retaining Coleman's exact-cube Adams comparison.

## H04 (CBirkbeck) — applied differently

The regulator handoff is now a marked equality reg_∞=πₚ₋₁∘ch_D,p for p≥2, with its actual source, target, embedding transport and computed projection values at `TauCetiRoadmap/MotivicEtaleKTheory/README.md:17` and :726. ColemanIntegration §L3.Fc.1 at ae078af76fc2ca886eeaa0e171727cefc6953365 still constructs reg_∞ without the §§7.1/7.4 import, so the matching sibling repair remains outside the authorized files; its arithmetic pairings, Galois lattice theorem and determinants remain its own work.

## H05 (CBirkbeck) — applied

“The empty support contributes zero” now reads “an acyclic complex and hence zero cohomology” at `TauCetiRoadmap/MotivicEtaleKTheory/README.md:549`, with the nonzero identity complex in degrees 1 and 2 computed at :557. The same distinction is explicit for the cycle pair fiber at :180, the supported spectrum at :221 and disjoint-support products at :512; BF line 520 supplies the support-fiber definition and BF line 760 the truncated column construction.

## Verification and remaining ownership work

H02–H04 split the three distinct sibling contracts in the review's second numbered finding. Their local specifications are repaired, but the sibling ownership conflict remains a merge consideration; no claim is made that those read-only roadmaps have been changed.

The repeated shared cube and regulator notions are placed here because ColemanIntegration is later in the supplied merge order. No ColemanIntegration construction is used as a supplier. SchemeKTheoryOperations remains the earlier supplier of ordinary K-theory, supported pairings and operations; its exact-cube comparison stays downstream in ColemanIntegration. No merge-order file was changed.

Ownership searches covered main, the supplied open-roadmap index and heads, the listed sibling checkouts and board packages, by the cycle, refined-normalization, multi-relative-fiber and regulator objects. KTheoryFiniteLocalFields §3.0a supplies simplicial cycles and moving, rather than this refined cubical adapter; MotivesAndAlgebraicCycles supplies its motive and relative-cycle interfaces. Polylogarithms §5.2 and BorelRegulators §6.0a already recognize this roadmap's general regulator ownership. No other owner of the added refined cubical comparison was found. The two design consumers also resolve: `packages/ZagierConjecturePolylogarithms/design/README.md:1683` contains the M.8 request, and `packages/MixedHodgeModulesAndIrregularHodgeTheory/design/README.md:1534` contains N/logarithmic-filtration. They are consumers only.

Cross-roadmap citations were resolved again against main fe5400174e8f9e8ce96423e5122b6dc4c5acf632 and the supplied open-head index; no unresolved roadmap or declaration name was reported. Main copies were confirmed for SchemeAndStackFoundations, DifferentialGeometry, ComplexKahlerGeometry, AlgebraicTopology and Completed/HodgeStructures, rather than consuming revisions to those roadmaps. EnhancedDerivedSheaves and EtaleCohomologyFoundations provided the two main-branch shape examples. The Whitney/flat-ideal supplier-extension requirements and all existing scope restrictions remain in place.

The pinned checkouts match Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Mathlib's `AlgebraicCycle` is `Function.locallyFinsupp` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44`); it supplies neither face admissibility nor the higher-cycle differential. Its weighted pushforward is at :69. The cone carrier and its two differential identities are in `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57`, :261 and :269. Searches by higher-cycle, multi-relative and Deligne objects found no native carriers that make the new geometric headline statable.

The declaration/signature audit found zero named declarations in Suggested.lean, both before and after the repair. Consequently there are no `#check @name` entries or elaborated binders to compare, and no hypothesis disappeared; the named-module build elaborated the updated carrier explanation. No substitute theorem or sorry'd data was added.

All source evidence used for these repairs is in the existing legal BF and Levine94 extractions. No new source or missing-text request was needed; the settled Levine98 waiver and Bloch86/Beilinson85 uncertified statuses were not reopened. Only flatness is used for the extra cubical maps: writing h=1−(1−x)(1−y), the map k[h]→k[x,y] is injective, and the latter is torsion-free over that polynomial PID, hence flat. Its fiber at h=1 is a crossing, so smoothness is not asserted.

## Adversarial mathematics pass

The table records the changed mathematical statements and the conventions reused by their repairs. Set A=[3]−[2] on the affine line, C=[x+y−xy=3]−[x+y−xy=2], and Z=[x+y=3]−[x=2]−[y=2], all over ℚ; affine face 1 is the original infinity face.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Refined subgroup and differential (§1.1) | n=0,1; point with p=0 | Degree 0: ℤ=ℤ; positive-degree p=0 groups: 0=0; in degree 1 the only remaining differential is +∂₁⁰ | Correct in the empty-intersection and degree-one cases | Added definition |
| Refined cycle iff every face vanishes (§1.1) | Graph Γ_t on 𝔸¹; point 2 in degree 1 | Graph: ∂₁⁰=[0]≠0 and ∂∞=0, so not a cycle; point 2: both faces and boundary 0 | Both implications tested | Added cycle-domain law |
| Extra cubical map (§1.1) | (0,y),(x,0),(1,y),(x,1) | h gives y,x,1,1 respectively, equal to the required face maps | Zero and infinity identities distinguished | Added witnesses |
| Flat extra map and admissibility | Fibers h=0 and h=1; vertices | h=0: (1−x)(1−y)=1, dimension 1; h=1: (1−x)(1−y)=0, dimension 1; vertex values 0,1,1,1 | Flat, including the reducible fiber; pulled-back levels 2 and 3 avoid all vertices | Kept flatness only |
| Characteristic independence | Characteristics 2 and 3 | h(0,2),h(1,2),h(2,0),h(2,1) give (0,1,0,1) in 𝔽₂ and (2,1,2,1) in 𝔽₃, matching y,1,x,1 | No division or characteristic exclusion | Added small-prime Check |
| Ordinary normalization need not kill zero faces | Square Z | Infinity restrictions 0,0; zero restrictions A,A; ∂Z=A−A=0 while A has coefficients (1,−1)≠(0,0) | Reviewer counterexample confirmed | Added negative control |
| Refined representative rZ | Z−C | Each zero face A−[3]+[2]=0; each infinity face 0 | All four individual faces vanish | Added explicit representative |
| Retraction identities | Degree 0, degree 1 and refined rZ | r₀(2)=2; r₁[2]=[2]; r₂(rZ)=rZ because ∂₂⁰(rZ)=0 | r i=id on the tested chains | Added integral retraction target |
| Homotopy sign | h₂Z in degree 3 | Zero faces are C,Z,Z; infinity faces 0,0,0; ∂h₂Z=C−Z+Z=C; rZ−Z=−C | Both sides of the stated boundary equality are −C | Added homology-class witness |
| Proper/flat naturality of refinement | 𝔽₂(t)/𝔽₂(t²), degree-one cycles | r₁=id; pullback/transfer coefficient is 2 before and after r, giving 2=2 over ℤ | Inseparability does not turn degree 2 into degree 1 | Added naturality API |
| Restriction fibers of the homotopy equivalence | Identity restriction on ℤ[0]; empty complement | Identity fiber ℤ→ℤ has H⁰=H¹=0 on either side; empty-complement fiber retains ℤ | Restriction and support extremes agree | Added diagram/fiber API |
| Derived coefficients preserve the comparison | R=0 and R=ℤ/2 | R=0 gives 0=0; 1−1 becomes 0 in ℤ/2; ℤ/2⊗ᴸℤ/2 retains ℤ/2 in degrees −1 and 0 | Homotopy transport does not discard Tor | Added derived-coefficient clause |
| Ordered normalization and J | n=0,1,2; graph Γ_t | J values 1,−1,1; δJ₁Γ_t=(−∂)(−Γ_t)=[0]=J₀∂Γ_t | Differential sign retained | Added order/transport clause |
| Relative-cycle domain (§2.0a) | Z versus rZ, support on their component unions | Z has face coefficients (1,−1) in K₀ supported at 3 and 2; rZ has (0,0) | Only the refined cycle enters the supported relative map | Added explicit domain bridge |
| Refined boundaries are relative homotopies | n=0; b=Γ_t on 𝔸¹ | Parameter-1 restriction 0; parameter-0 restriction [0]; forgetting support gives [O₀]=1−1=0 in K₀(𝔸¹) | Boundary maps to the zero relative-homotopy class | Added boundary/descent law |
| Representative independence (§2.1) | Z and rZ | Difference rZ−Z=−∂h₂Z, hence difference of homology classes 0 | Same class before the relative map | Replaced unsupported direct assignment |
| Cycle-to-K normalization (§2.1) | Rank 2; ℙ¹ point; unit 2; empty X | Images 2, 1−[O(−1)] of Euler characteristic 1, [2] of valuation 1, and 0 respectively | Refinement preserves the nonzero normalizations and zero case | Updated full construction route |
| Higher inverse comparison (§2.2) | Point rank 2; ℙ¹ divisor; K₁ unit 2 | Inverse values 2,h,[2]; ψ² eigenvalues 1,2; projector differences for weights 0,1,2 are −1,−3,−2 | Added comparison step preserves inverse and rational weights | Added refined-normalization input |
| Supported regular comparison (§2.3) | L=𝔽_ℓ(t)[s]/(s^ℓ−t), ℓ=2,3; origin in 𝔸¹_L | Full-support rank 1 maps to 1; origin coefficient +1 maps to +1; raw boundary −1 becomes +1 after the minus adapter | Regular nonsmooth scope and boundary sign retained | Added normalization on the restriction diagram |
| Empty cycle pair fiber (§1.3) | C=ℤ[0] | Cochains ℤ,ℤ; d=id; ker(id)=0 and coker(id)=0, versus zero cohomology | Acyclic without literal zero cochains | Repaired pattern |
| Empty supported spectrum (§2.0a) | S=∅, n=0; full-support point | Identity-fiber homotopy groups 0; full-support [k²] has value 2 | Empty and full supports distinguished | Rephrased as contractible |
| Disjoint-support product (§5.1) | V(x),V(x−1) in 𝔸² | Intersection ∅; target cohomology 0, hence product class 0 | Cohomological vanishing suffices | Specified cohomology |
| Empty support in ordinary column colimit (§5.3) | X=Spec ℂ,p=1,n=0 | Unique support ∅; column is ℝ→ℝ by id; dimensions (1,1), cohomology dimensions (0,0) | Nonzero cochains survive the colimit | Corrected API |
| Good truncation and cube normalization (§5.3) | Same point, cutoff 2, cube degree 0 | τ≤₂ retains ℝ in degrees 1 and 2 since outgoing d²=0; N₀ has no face conditions; H¹=H²=0 | Neither operation replaces the column by strict zero | Added regression Check |
| Common-union equality criterion (§5.3) | Point-support representatives at 0 and 1 on 𝔸¹ | At union {0,1}, generators map to (1,0) and (0,1), distinct; zero maps to (0,0) | Equality still requires equality after transition | Retained colimit law |
| Quillen/perfect adapter contract | Field rank 2, unit 2, DVR uniformizer | Comparisons preserve 2, unit valuation 1 and boundary +1 on both sides | Preserved public ordinary/relative/supported interfaces | Made consumer comparison explicit |
| Pairing transport | Full-support bundles of ranks 2 and 3 | Rank product 6=2·3; multiplying by rank 1 gives the original rank | Zero or rescaled pairing excluded | Added explicit compatibility contract |
| Ordered cube relativity and signs | One-loop face ranks; ordered two-loop symbol {u,v} | (1,0)↦1, (0,1)↦−1, (1,1)↦0; two consecutive last-slot residues +1, exchanged loops −1 | Matches Coleman’s existing sign convention | Preserved public sign API |
| Adams transport is on pointed spaces | Unit 2; stable η·1=[−1] over ℚ | ψ²[2]=2[2]; ψ²[−1]=0 while a unit-fixing spectrum map would preserve [−1]≠0 | No integral spectrum-operation claim added | Retained pointed-space scope |
| Generalized versus simultaneous weights | Full-cube unit class; linear test T=[[2,1],[0,2]] | Unit has eigenvalue 2; (T−2)e₂=e₁≠0 but (T−2)²e₂=0 | Generalized condition is weaker on an arbitrary diagram | Restricted eigenweight transport to full cubes |
| Marked point regulator | z=3+4i, p=2,3; addition of an element of ℝ(p) | π₁(z)=4i and π₂(z)=3; adding a real number at p=2 or a purely imaginary number at p=3 changes the value by 0 | Projection descends with the stated parity | Made source, target and marking explicit |

## Build, gate and commit

`lake build TauCetiRoadmap.MotivicEtaleKTheory.Suggested` exited 0:

```text
✔ [8976/8976] Built TauCetiRoadmap.MotivicEtaleKTheory.Suggested (3.5s)
Build completed successfully (8976 jobs).
```

Dependency-check output (exit 0; no UPWARD or CYCLE line):

```text
depcheck: 33 roadmaps, 305 edges, 0 problem(s)
```

Final gate output (exit 0):

```text
gate MotivicEtaleKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Committed as a2a3b038e1d07534ca84b928b275fdf149ef1333, `MotivicEtaleKTheory: review repairs (refined normalization, support acyclicity, explicit consumer contracts)`. Only the two authorized roadmap files changed; the worktree is clean. Nothing was pushed.
