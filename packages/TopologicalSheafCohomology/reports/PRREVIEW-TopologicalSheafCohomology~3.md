# Review of TopologicalSheafCohomology (pull request #973 at 5305dcd)
**Verdict:** needs changes

:robot: Independent AI review. Incremental re-review of 73 changed lines since 5789680. One P1 finding: the ownership repair introduces a roadmap-level supply cycle. The gate, targeted build, direct elaboration and signature checks pass. No pull-request file was changed.

## R01 (P1) — The new ImplicitAtlases import closes a supply cycle

**Location:** `TauCetiRoadmap/TopologicalSheafCohomology/README.md:49`, “Consume §0.7's Čech cohomology”; the corresponding `*Needs:*` imports are at lines 147 and 182.

**Claim:** ImplicitAtlases can supply this roadmap's Čech identification and first hypercohomology spectral sequence while CharacteristicClasses consumes this roadmap's early cover theory.

**Witness:** `TauCetiRoadmap/CharacteristicClasses/README.md:449` consumes TS1.1–TS1.2; `TauCetiRoadmap/ImplicitAtlases/README.md:75` consumes CharacteristicClasses C1.2b; this README's line 49 consumes ImplicitAtlases §0.7. These three supplier-to-consumer edges form a cycle.

The first citation was verified on main at `9c6e95d9`; the second at the supplied ImplicitAtlases head `3b7572e0`. The cycle is:

`TopologicalSheafCohomology → CharacteristicClasses → ImplicitAtlases → TopologicalSheafCohomology`.

The new edge points from position 200 to position 283 in the open-roadmap merge order, but the return path through the roadmap on main remains. The rule requires a single direction between roadmaps, even where the consumed sections can be implemented separately. All six possible orders of these three packages violate at least one edge. The previous report's proposed import repair overlooked this return path; its recommendation does not make the resulting cycle valid.

**Exact repair:** Extract the shared foundations consumed here from ImplicitAtlases §§0.6–0.7 into an independent earlier supplier: the open/K-sheaf equivalence, open/compact-cover Čech identification, finite-cover and empty-space results, and bounded-below compact-cover hypercohomology with its first spectral sequence. Transfer ownership, then have both roadmaps import that supplier; keep TS1.1–TS1.2's arbitrary-space extension and the native derived comparisons here. The new supplier must not consume CharacteristicClasses or ImplicitAtlases. This needs coordinated ownership changes, not deletion of citations while leaving their inputs unowned, and not edits to the other roadmap inside this PR.

**Repair test:** With F denoting that extracted supplier, `F → TopologicalSheafCohomology → CharacteristicClasses → ImplicitAtlases`, together with `F → ImplicitAtlases`, has a valid linear order. On S¹, the common two-arc complex still has differential (a,b)↦(b−a,b−a), H¹=ℤ, and one owner; this roadmap adds its derived comparison and CharacteristicClasses its singular comparison. Neither downstream comparison supplies the foundations back to F. Merely moving ImplicitAtlases in the merge order cannot fix the current three-edge cycle.

## Previous findings

- R01 — partly repaired: README §§1.2 and 1.4 now identify with and import ImplicitAtlases §0.7, removing the duplicated ownership. That repair introduces the supply cycle in this report's R01.
- R02 — repaired: README §0.1, line 74 explicitly owns the acyclic-resolution computation of native right derived sections, with Stacks 13.15.6 and 13.16.7; its Needs line includes the input.
- R03 — repaired: README §1.1, line 111 chooses a well-order and specifies permutation signs, together with the equivalent orientation-line presentation.
- R04 — repaired: README §2.1 and Suggested.lean line 63 retain Hausdorffness only for X. Closedness supplies the required neighborhood argument; the ℚ and doubled-origin Checks discriminate the revised hypotheses.
- R05 — repaired: README §1.1, line 114 takes the homotopy sign from Stacks §20.25 and explicitly identifies §20.15's reversed difference.

## Verified sound

### Scope, gate, build and signatures

Reviewed the five previous findings and all changed passages, their cited suppliers, the affected seeded targets and the one changed Lean theorem. Unchanged mathematical checks below are explicitly carried from [R2][previous], rather than represented as a new full review. Read the governing repository README and CONTRIBUTING and compared the shape with main's AlgebraicTopology and DGAInfinity. The folder remains three roadmap files: README, Suggested.lean and metadata. Both the outside-folder diff and final worktree status are empty.

The supplied gate has all checks, including build, at zero. The independently rerun gate also passes every reported text, naming, metadata, ownership-path and dependency check. The separately rerun targeted command `lake build TauCetiRoadmap.TopologicalSheafCohomology.Suggested` succeeds (8976 jobs). Direct `lake env lean` elaboration succeeds with exactly the two expected `sorry` warnings, at Suggested.lean lines 32 and 63.

The prescribed dependency check printed:

```text
depcheck: 208 roadmaps, 1457 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. R01 is a manually verified cycle missed by that output, not a claim that the tool reported a failure. The three source locations in R01 suffice to reproduce it without changing the tooling.

A scratch copy with `#check @name` for all three declarations elaborated. `moduleCohomologyForgetComparison` retains the two HasSheafify assumptions, Γ additivity, module-sheaf HasInjectiveResolutions and abelian-sheaf HasExt, for every natural degree n. `fiberStalkMap` still has no properness or separation requirement. `properFiniteFiberStalk` retains T2Space X, properness and finiteness of every fiber, and has no T2Space Y or local-compactness binders. This exactly matches the revised README; zero binders were accidentally lost.

Padding probes on a second scratch copy tried `exact ⟨Iso.refl _⟩`, `infer_instance`, `rfl` and `simp` for the first theorem, and `infer_instance`, `rfl` and `simp [fiberStalkMap]` for the second. Neither closes. The first ends with “simp made no progress”; the second leaves the IsIso goal for the actual product of native stalk maps. No existing pinned theorem providing the finite-fiber product isomorphism was located. The single definition is necessary to state that headline.

### Headline inventory

| README headline | Acceptance-test disposition |
|---|---|
| §0.1 module-derived/underlying-abelian comparison | Stated by `moduleCohomologyForgetComparison`, Suggested.lean line 32; unchanged signature |
| §1.3 compact Hausdorff Čech/derived comparison | Module docstring lines 10–12 names the missing cover-refinement cohomology diagram and all-cover colimit |
| §1.4 bounded-below hypercohomology comparison and two convergent sequences | Module docstring lines 13–16 names the missing hypercohomology diagram and pagewise colimits; the new supplier identification does not create a native pinned carrier |
| §2.1 proper finite-fiber stalk comparison | Stated by `properFiniteFiberStalk`, Suggested.lean line 63, with the broader correct hypotheses |

There are two headline theorems and one real-bodied supporting definition, one `import Mathlib`, no sorry'd data, no placeholder predicate and no `set_option` in Suggested.lean. The added acyclic-resolution result is a proof input, not a new headline forced through an artificial carrier. All definition sections still have API prose and at least three discriminating Checks.

### Resolved suppliers and pinned APIs

All four cross-roadmap references were resolved again, not inferred from the earlier review:

| Roadmap and location | Contract checked |
|---|---|
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3388` on main, §2.5 | Godement is explicitly the cosimplicial resolution (line 3392), with exactness, flasque terms, restriction, `sheafH_iso_godement` and flasque Čech vanishing. Thus the added alternating 0/identity point complex is the specified unnormalized model. |
| `TauCetiRoadmap/ImplicitAtlases/README.md:172`, `:189` at its supplied head | §0.6 states locally compact Hausdorff conventions and the open/K-sheaf equivalence; §0.7 states refinement independence, finite-cover cofinality, open/compact agreement and the bounded-below sequence. Arbitrary ring coefficients in these group-free statements do not require averaging. |
| `TauCetiRoadmap/CharacteristicClasses/README.md:449` on main, C1.2b | Consumes this roadmap's arbitrary-space TS1.1–TS1.2, then constructs the constant-coefficient Čech/singular comparison. This is the return edge in R01. |
| `TauCetiRoadmap/ComplexKahlerGeometry/README.md:193`, `:272` on main, K2 | Owns analytic/fine resolutions and Čech/derived comparison on paracompact Hausdorff manifolds. The unchanged boundary here is arbitrary compact Hausdorff spaces with module coefficients. |

`roadmaps show ImplicitAtlases --pr 974` agrees with the supplied checkout. `roadmaps resolve` finds no unresolved roadmap/name lead; its library portion did not inspect the pins, so the following checks were made directly. Object searches with `roadmaps grep` and searches of the board packages covered acyclic resolutions, right derived functors, compact-cover hypercohomology, point-neighborhood covers, constant-ring adapters and finite-fiber stalk comparisons. They locate the shared ownership in ImplicitAtlases, and the native coefficient and stalk comparisons here. The new Γ_R-acyclic computation is a specialization tied to the native module-sheaf functor, not a second generic derived category. No new duplicate Lean declaration was introduced: the diff changes only hypotheses of an existing theorem. Open work outside the supplied checkouts was not independently certified from search snippets.

Pins verified from both the manifest and checkouts: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Reopened the following 25 relevant declarations (paths relative to their library roots):

| Pinned file and line | Declarations and limits checked |
|---|---|
| `Mathlib/Topology/Sheaves/Sheaf.lean:107`; `Mathlib/CategoryTheory/Sites/Whiskering.lean:51` | `TopCat.Sheaf`, `sheafCompose`; sheaf carrier adds no separation or compactness |
| `Mathlib/CategoryTheory/Sites/GlobalSections.lean:64` | `Sheaf.Γ` is a right adjoint; terminal-site instance at line 74 |
| `Mathlib/CategoryTheory/Abelian/RightDerived.lean:64`, `:108` | `rightDerivedToHomotopyCategory` uses injectiveResolutions; `Functor.rightDerived` takes its homology. No computation from an arbitrary acyclic resolution is supplied here |
| `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56`, `:84`, `:152` | `Sheaf.H`, `H'`, `functorH`; abelian Ext and open/site cohomology, not a module/abelian comparison |
| `Mathlib/Algebra/Category/ModuleCat/Sheaf.lean:97` | `SheafOfModules.forgetToSheafModuleCat` restricts to the ring of global sections |
| `Mathlib/CategoryTheory/Sites/SheafCohomology/Cech.lean:65`; `Mathlib/CategoryTheory/Limits/FormalCoproducts/Basic.lean:47` | `cechComplexFunctor`, `FormalCoproduct`; fixed family and actual index type, not the cover-colimit diagram |
| `Mathlib/Topology/Sheaves/Functors.lean:60`; `Mathlib/Topology/Sheaves/Stalks.lean:172`, `:180` | `pushforward`, `stalkPushforward`, `stalkPushforward_germ`; correct coordinate map and its source/target |
| `Mathlib/Topology/Maps/Proper/Basic.lean:77`, `:92`, `:225` | `IsProperMap`, `IsProperMap.isClosedMap`, `isProperMap_iff_isClosedMap_and_compact_fibers`; continuity plus filter lifting, with no separation or finiteness built in; closedness needs no separation |
| `TauCeti/Topology/Sheaves/Flasque.lean:75`, `:149`, `:156` | `isFlasque_of_injective`, `subsingleton_H'_succ_of_isFlasque`, `subsingleton_H_succ_of_isFlasque`; arbitrary topological spaces, abelian coefficients |
| `TauCeti/CategoryTheory/Sites/SheafCohomology/FreeYoneda.lean:84`, `:145` | `freeYonedaSheafSectionsEquiv`, `mono_freeYonedaSheafFunctor_map`; sheafification assumptions and monomorphism hypothesis |
| `TauCeti/CategoryTheory/Sites/SheafCohomology/Cech.lean:198`, `:309`; `TauCeti/CategoryTheory/Sites/SheafCohomology/Terminal.lean:101` | `cechAugmentation`, `quasiIso_cechAugmentation_iff`, `cohomologyPresheafEvaluationIsoFunctorH`; terminal object, positive exactness and abelian Ext assumptions |

Also reread `Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean:46`, `:95`, `:109`: bounded-below derived-functor infrastructure and the injective-complex comparison. Searches in the pinned abelian/derived-category and Tau Ceti sheaf directories did not find the new acyclic-resolution computation or the canonical finite-fiber product-stalk isomorphism already implemented.

### Sources and seeded sample

Fetched all three cited works through the sources service, from the legal Stacks PDFs and arXiv v6. No sources manifest was changed. The new or changed locator checks are below; unchanged sampled portions retain [R2][previous]'s checks. Nothing in the README is flagged as an unverified locator.

| Sample or changed claim | Source locator and extraction | Verification |
|---|---|---|
| §0.1 added acyclic-resolution input | Stacks Derived Categories 13.15.6, tag 05T8, p.56: `stacks-derived line 2835`; 13.16.7, tag 015E, p.59: `stacks-derived line 2966` | Embedding/closure/exactness hypotheses and bounded-below F-acyclic computation match. Derived-functor existence is supplied by the README's injective-resolution assumptions. |
| §0.1 flasque closure and point Godement Check | Stacks 20.12.3, pp.18–19: `stacks-cohomology line 812`, proof at line 816; 20.30.1–20.30.2, pp.65–66: lines 3083, 3110 | Closure and exact sections are explicitly in the proof. The cosimplicial resolution has all point cofaces equal to id, giving 0, id, 0, id,… |
| §0.2 bounded-below derived sections | Stacks §20.3 p.3 and 20.30.2 p.66: `stacks-cohomology line 114`, line 3110 | Unchanged locator check carried from R2; reread 20.30.2's finite-diagonal totalization, which remains compatible with the added §0.1 input |
| §1.1 chosen order and orientation line | Stacks 20.23.2 and Remark 20.23.5, pp.40–41: `stacks-cohomology line 1840`, line 1874; Pardon footnote 42, p.119: `pardon line 5262` | Chosen order, sign of reordering and the two-generator orientation relation match |
| §1.1 homotopy sign | Stacks §20.15, p.24: `stacks-cohomology line 1072`; §20.25, pp.46–47: line 2144, line 2184 | Explicit prism gives second minus first. The changed warning accurately identifies the erroneous §20.15 display |
| §1.2 imported colimit, refinement, finite-cover and empty-space laws | Pardon A.4.1–A.4.4, pp.119–120: `pardon line 5231`, line 5237, line 5240, line 5267 | Statements agree with ImplicitAtlases §0.7. New ℚ and Sierpiński examples are the roadmap's own correct computations |
| §1.3 compact comparison | Stacks 20.16.2, pp.26–28: `stacks-cohomology line 1169`; 20.11.6 p.15: line 678 | Mathematical statements unchanged, carried from R2. Changed S¹ attribution agrees with ImplicitAtlases line 202 |
| §1.4 added open/compact comparison and imported first sequence | Pardon A.4.10–A.4.11, pp.121–122: `pardon line 5341`, line 5361; A.4.13 p.122: line 5386 | Source proves the sheaf comparison using finite compact covers and open neighborhoods. Finite sums in each total degree and exact filtered colimits extend that argument to the stated complexes. Bounded-below sequence has the specified E₁ page |
| §1.4 unchanged native comparison/prism inputs | Stacks §20.25, pp.46–48: `stacks-cohomology line 2140`, line 2196, line 2229 | Carried from R2; the prism computation was reread for the changed sign citation |
| §2.1 broadened stalk theorem | Pardon Convention A.0.1 p.113, A.3.2 p.118 and A.4.8 p.121: `pardon line 4931`, line 5202, line 5321 | Source assumes locally compact Hausdorff spaces. The README explicitly owns the broader statement; its replacement proof uses finite Hausdorff separation and native proper-map closedness, which suffice |

### Adversarial table

The table contains 27 unchanged rows carried from [R2][previous] and 17 rows recomputed for changed statements and their dependencies. R2's acyclic-cover row contained a contradictory phrase about the two-arc cover; the values below retain its valid calculation and state correctly that those intersections are acyclic. This was a report wording error, not a roadmap defect.

| Statement | Instances and values computed on each side | Result | Change / provenance |
|---|---|---|---|
| §0.1 equivalence Sh(X;R-Mod) ≃ Mod(R_X) | Two discrete points: Γ(R_X)=ℤ², constant map r↦(r,r); (2,3)·(a,b)=(2a,3b); restricting along R→Γ(R_X) returns the R-action 2·(a,b)=(2a,2b). Stalks of R_X at each point: ℤ | Consistent | Carried from [R2][previous], same statement |
| §0.1 extension of scalars | ℤ→ℚ: ℤ↦ℚ, ℤ/2↦0, 0→ℤ→ℤ→ℤ/2→0 ↦ 0→ℚ→ℚ→0 exact. ℤ→𝔽₂: ×2 ↦ 0:𝔽₂→𝔽₂, kernel 𝔽₂ | Consistent | Carried from [R2][previous], same statement |
| §0.1 zero ring | R=0: all modules 0, both sides 0 | Consistent | Carried from [R2][previous], same statement |
| §0.1 V RⁿΓ_R ≅ Hⁿ U | Point, R=ℤ/4, F=ℤ/4: H⁰=ℤ/4 both sides, 2·1=2 both sides, Hⁿ=0 for n>0. Field ℤ/2: ℤ/2 injective as module, not divisible as group (no x with 2x=1), still H¹=0 at a point on both sides. X=∅: Γ(∅)=0, all groups 0 | Consistent | Carried from [R2][previous], same statement |
| §0.2 point complex ℤ→ℤ, ×2 | H⁰=ker 2=0, H¹=ℤ/(2)=ℤ/2; identity complex: H=0; zero differential: ℤ,ℤ | Consistent | Carried from [R2][previous], same statement |
| §0.2 shift sign | F[1]^q=F^{q+1}: ℤ[1] lives in degree −1; two-term ×2 becomes −2 under (−1)^k d with k=1 | Consistent | Carried from [R2][previous], same statement |
| §0.2 finite diagonal | b=−2, m=0: q∈{−2,−1,0}, p=2,1,0, three terms; no bound: (k,−k) for all k | Consistent | Carried from [R2][previous], same statement |
| §1.1 repeated two-index point cover | Ordered C⁰=ℤ², C¹=ℤ, d(a,b)=b−a (Stacks (9.0.1): s₁−s₀); H⁰ diagonal ℤ, H¹=0; sum instead of difference leaves the diagonal | Consistent | Carried from [R2][previous], same statement |
| §1.1 bounds and empty family | Two ordered indices: C²=0; tuple C² has 8 coordinates; empty family: every term a product over the empty tuple set, 0; identity of 0 is 0 | Consistent | Carried from [R2][previous], same statement |
| §1.1 composition of refinements | Indices {0,1,2}, select 2: (2,3,5)↦5; then the unique map to the one-point cover: 5; composite index function also selects 2 | Consistent | Carried from [R2][previous], same statement |
| §1.2 smallness | Covers X→Opens X with X : Type u form a Type u; finite covers Σ n, ULift (Fin n)→Opens X likewise | Consistent | Carried from [R2][previous], same statement |
| §1.2 raw category not filtered | Constant index functions 0,1 from the one-point cover to the repeated cover; for any nonempty J′→{∗}, 0∘f≠1∘f | Consistent | Carried from [R2][previous], same statement |
| §1.2 two discrete points | Singleton cover: C⁰=A×B, ordered C¹=F(∅)=0; restriction to {a} is the projection A×B→A | Consistent | Carried from [R2][previous], same statement |
| §1.3 compact Hausdorff comparison | S¹: Čech¹=ℤ=H¹(S¹;ℤ); point: F(pt) in degree 0, 0 above, both sides; ∅: 0=0; R=0: 0=0 | Consistent | Carried from [R2][previous], same statement |
| §1.3 zero sheafification needs P(∅)=0 | {a,b}, P(∅)=ℤ, P(nonempty)=0: tuple C⁰=0, C¹=ℤ² (coordinates ab, ba), cocycle condition s_ab+s_ba=0 from the (a,b,a) tuple, so H¹=ℤ; ordered: C¹=P(∅)=ℤ, C²=0, H¹=ℤ; this cover is finest, so the colimit is ℤ; P^#=0 gives 0 | Consistent | Carried from [R2][previous], same statement |
| §1.3 local annihilation | P({a,b})=ℤ, else 0: P(∅)=0; stalks are colimits over the terminal neighbourhood {a}, {b}: 0; one-set cover H⁰=ℤ, singleton cover H⁰=0, colimit 0 | Consistent | Carried from [R2][previous], same statement |
| §1.3 acyclic cover | S¹ one-set cover: H¹(S¹;ℤ)=ℤ≠0 violates the acyclic-intersection hypothesis and fixed-cover H¹=0. Two contractible arcs with a two-component intersection have Hʲ=0 for j>0 on every intersection; their complex gives H¹=ℤ, as does derived cohomology. | Consistent | Carried from [R2][previous], same statement |
| §1.4 total convention | D=δ+(−1)^p d; from (0,0): δ then d contributes (−1)^1=−1, d then δ contributes +1, sum 0 when δd=dδ; unsigned total 2 | Consistent | Carried from [R2][previous], same statement |
| §1.4 conjugation | ε=(−1)^{pq}: δ-component acquires (−1)^q, d-component acquires (−1)^p, giving d+(−1)^q δ; at (1,1): −1, at (0,1): +1 | Consistent | Carried from [R2][previous], same statement |
| §1.4 which page descends | Repeated point cover, F in degree 0: Čech-degree filtration E₁=cochains ℤ², maps (0,1)↦0 or 1; E₂=diagonal ℤ, both maps identity | Consistent | Carried from [R2][previous], same statement |
| §1.4 cohomology presheaf at ∅ | F^q(∅)=0 for sheaves, so ℋ^q(∅)=0 and §1.3's presheaf comparison applies | Consistent | Carried from [R2][previous], same statement |
| §2.1 `fiberStalkMap` direction | `eqToHom : stalk (f_*F) y ⟶ stalk (f_*F) (f x)` from y=f x, then `stalkPushforward : (f_*F).stalk (f x) ⟶ F.stalk x`; coordinate x of the product | Consistent | Carried from [R2][previous], same statement |
| §2.1 two points to a point | Stalks ℤ, ℤ/2: (f_*F)_pt=F({a})×F({b})=ℤ×ℤ/2, product ℤ×ℤ/2, map identity, (3,1)↦(3,1); swapping coordinates violates the germ formula | Consistent | Carried from [R2][previous], same statement |
| §2.1 empty source, identity | f:∅→Y: (f_*F)(V)=F(∅)=0, product over ∅ is 0; id on a point: id_M, M=0 included | Consistent | Carried from [R2][previous], same statement |
| §2.1 properness needed | (0,1)→ℝ, F=ℤ: (j_*ℤ)_0=colim ℤ((0,ε))=ℤ, empty fiber product 0, ℤ→0 not iso | Consistent | Carried from [R2][previous], same statement |
| §2.1 composition | {a,b,c}→{u,v}→pt: direct (2,3,5)↦(2,3,5); iterated ((2,3),5); reindexing identifies them | Consistent | Carried from [R2][previous], same statement |
| §2.1 no averaging | 𝔽₂: identity on 𝔽₂²; S₃-type invariants do not enter | Consistent | Carried from [R2][previous], same statement |
| §0.1 acyclic-resolution comparison and flasque class (`README.md:74`) | At a point, M=ℤ/4: the cosimplicial Godement terms are M in every degree, d⁰=1−1=0, d¹=1−1+1=1, alternating thereafter. H⁰=M, H¹=ker(1)/im(0)=0, H²=ker(0)/im(1)=0, matching RⁿΓ. On S¹ the constant ℤ sheaf is not Γ-acyclic: its one-term sections have H¹=0 but R¹Γ=ℤ. | Correct; acyclicity is essential | New input supplies previous R02; point Check recomputed |
| §0.1 flasque closure and exact sections (`README.md:74`) | On a point, 0→ℤ --2→ℤ→ℤ/2→0 stays exact after Γ; all restrictions are identities. On two discrete points, product-of-stalks restriction A×B→A is onto before and after forgetting scalars. | Correct; general closure follows from cited flasque lifting argument | New statement checked at stacks-derived line 2835 and stacks-cohomology line 816 |
| §1.1 chosen order and orientation-line presentation (`README.md:111`) | One open: tuple differential 0,1,0,1,…, hence H=(P(U),0,…); ordered complex P(U)[0]. Two repeated point opens: d(a,b)=b−a. Reversal sends the degree-one generator to its negative: d'(b,a)=a−b=−(b−a). Mod 2 the signs agree; no division by 2. Orientation relation o₁+o₂=0 gives o₂=−o₁. | Correct | Previous R03 repaired; ordering and source footnote checked |
| §1.1 prism convention (`README.md:114`) | Refine a repeated point cover by the point with indices 0 and 1. On (2,3), T₁−T₀=3−2=1; hδ=1 and δh=0. The opposite displayed difference is −1. | README sign correct | Previous R05 repaired; source erratum explicitly identified |
| §1.2 arbitrary-space cofinality and comparison (`README.md:132`, `:136`) | Wₓ=Uₓ∩Vₓ contains x and refines both. A point-neighborhood choice refines each given cover. For the repeated point cover the raw maps have values 2 and 3 on (2,3), but both send (a,a) to a on H⁰=ℤ. | Correct; cohomology diagrams, not raw maps, descend | Recomputed with new supplier identification |
| §1.2 locally compact identification, finite-cover and empty-space imports (`README.md:134`, `:138`) | S¹ two arcs: d:ℤ²→ℤ² sends (a,b) to (b−a,b−a), ker=ℤ, coker=ℤ; both ordered/orientation-line and tuple models give these values. The empty family gives 0 in every degree on ∅ in both colimits. A compact cover has a finite subcover, with identical transition map after cohomology. | Mathematics and supplier statements agree | Ownership duplication replaced by imports; package cycle remains R01 |
| §1.2 noncompact negative control (`README.md:144`) | On ℚ, Uₙ=(n,n+2)∩ℚ covers every rational. A finite refining cover lies in a bounded union of Uₙ, so misses a rational larger than every right endpoint. A chosen Uₙ containing each rational gives a point-neighborhood refinement whose union is ℚ. | Correct: finite covers not cofinal; point-neighborhood covers cofinal | New Check |
| §1.2 non-Hausdorff negative control (`README.md:145`) | On Sierpiński X, a cover must contain X. For {X,{1}}, d:P(X)×P({1})→P({1}) is (a,b)↦b−res(a), with kernel {(a,res(a))}≅P(X) and cokernel 0. The one-set cover has H⁰=P(X), Hⁿ=0 for n>0. | Correct for arbitrary presheaves, including nonzero P(∅) | New Check |
| §1.3 S¹ Check's supplier attribution (`README.md:160`) | The imported two-arc Čech H¹ is ℤ and the derived H¹ is ℤ; the comparison is an isomorphism. The one-set cover has H¹=0, while its intersection X has derived H¹=ℤ, excluding the fixed-cover theorem. | Correct | Changed attribution checked against ImplicitAtlases §0.7 |
| §1.4 open/compact hypercohomology identification (`README.md:169`) | At a point, F=(ℤ --2→ℤ) in degrees 0,1: open and compact singleton covers both have total differential 2, H⁰=0 and H¹=ℤ/2; ∅ and zero coefficients give 0 in every degree. For a finite compact cover with n members, ordered Čech degrees are 0,…,n−1; each total degree has finitely many terms on both sides. Filtered neighborhood colimits commute with these finite sums, kernels and cokernels. | Correct extension of the sheaf comparison | New identification checked against pardon line 5361–5378; same finite-cover proof works degreewise |
| §1.4 first spectral sequence imported, second constructed (`README.md:171`) | Point and F=(ℤ --2→ℤ): first E₁ has row ℤ --2→ℤ, yielding E₂=(0,ℤ/2); second has only E₂^(0,1)=ℤ/2. Both abut to H⁰=0, H¹=ℤ/2. | Page formulas and convergence agree with supplier/source | Changed ownership checked; R01 concerns supply, not these values |
| §1.4 finite-diagonal convergence (`README.md:173`) | b=−1, total degree m=1: (p,q)=(0,1),(1,0),(2,−1), length 3. dᵣ has bidegree (r,1−r), so outgoing differentials require r≤q−b+1≤3 and incoming require r≤p≤2. For r>3 both vanish. Degree −2 has no terms; no lower bound permits all (k,−k) in degree 0. | Correct; swapping filtrations gives the same bound | Changed ownership of convergence checked; common lower bound retained |
| §2.1 broadened theorem and closed-neighborhood argument (`README.md:200`, `Suggested.lean:63`) | For a finite fiber S and disjoint representing opens Oₓ, V=Y∖f(X∖⋃Oₓ) contains y: S⊆⋃Oₓ makes y absent from the removed image. Also f⁻¹V⊆⋃Oₓ. Germ tuple (sₓ) glues over disjoint pieces to s, and evaluation sends s back to (sₓ). With empty S, V=Y∖f(X), sections and fiber product are both 0. | Both injectivity and surjectivity use only Hausdorff X and closedness of f | Broader hypotheses valid; properness supplies closedness without separation of Y |
| §2.1 removal of local compactness (`README.md:209`) | X=Y=ℚ, f=id, y=0: source stalk F₀, one-factor product F₀, comparison id. For a non-Hausdorff target take the inclusion {a}→Y={a}⊔B, where B={0,1} is indiscrete: {a} is closed and the inclusion is proper; stalk map is id_M at a and 0→0 on the indiscrete component. | Correct, including an actual non-Hausdorff target | New Check and generalized Lean statement tested |
| §2.1 Hausdorff-source negative control (`README.md:210`) | Doubled-origin line→ℝ: fiber over 0 has two points. A closed set intersects each open line chart in a closed subset of ℝ, so its image is the union of two closed sets. Fibers are finite, hence compact, and the continuous fold is proper. Preimages of intervals about 0 are connected: source stalk of f_*ℤ is ℤ, fiber product ℤ², map n↦(n,n); (1,0) has no preimage. | Correct; dropping Hausdorff X would make the theorem false | New Check recomputed |
| Conventions and elaborated binders (`README.md:17`, `Suggested.lean:63`) | R, X, Y and stalk modules all remain in universe u. The changed theorem has 1 separation binder, T2Space X; the old theorem had 4 separation/local-compactness binders. Properness and every-fiber finiteness both remain. R=0 gives 0→0; no nonzero-ring assumption occurs. | README and Lean agree | All three signatures checked; no accidental binder loss |
| Supplier graph introduced by §§1.2, 1.4 imports | Supplier→consumer edges: TopologicalSheafCohomology→CharacteristicClasses→ImplicitAtlases→TopologicalSheafCohomology. Three edges; 0 of 6 permutations is a valid order. After extracting the shared foundations to F, F→TopologicalSheafCohomology→CharacteristicClasses→ImplicitAtlases plus F→ImplicitAtlases has that displayed valid order. | Fails the single-direction contract | New R01; ownership extraction breaks the witnessed cycle |

## Not verifiable

- No cited text was inaccessible: all three source works were legally retrieved. No missing-reference request is pending.
- Ownership against open pull requests whose files the brief did not supply was not independently checked. Tool search snippets from those pull requests were treated only as leads, not evidence for a finding.
- The advanced comparison theorems remain implementation targets. Elaboration and the finite computations establish signature and test consistency, not formal proofs of their mathematical conclusions.

## Source issues

- **Misprint** in stacks-cohomology at Section 20.15 (tag 09UY), printed p.24: the source says the first refinement map minus the second equals dh+hd; it should be the second minus the first for the displayed prism; affects the proof.
- **Misprint** in pardon at Lemma A.3.2, printed p.118: the source says the compact set K lies in X; it should be a compact subset of Y; affects a stated result.
- **Misprint** in pardon at Remark A.4.1, printed p.119: the source says the containing coarser member is indexed by f applied to a coarser index; it should apply f to the refining index; affects a stated result.

[previous]: PRREVIEW-TopologicalSheafCohomology~2.md
