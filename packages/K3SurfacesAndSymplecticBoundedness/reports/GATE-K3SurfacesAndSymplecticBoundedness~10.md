## H01 (CBirkbeck) — answered

The duplicate ownership remains at companion head `e974688`: NeronModelsAndSemistableAbelianVarietiesPartII §§2.1, 2.3, 2.5, 4.1–4.2 and the common parts of §§4.16–4.17 still construct the genus-one carrier, geometric fibres, canonical/Hodge formulas and regular Jacobian independently, whereas `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:15`, §6.0b (lines 735–829) and line 1385 already assign that general interface here, including the proper-base restriction at lines 752–764. The required repair is companion-side imports and specializations of this prefix, preserving its excellent-DVR, characteristic-two and arithmetic refinements; that file is outside the permitted edits, so no transfer was made and this finding remains open.

## H02 (CBirkbeck) — answered

The live description at head `8bc8863` still omits direct supplier K3Surfaces (author `kim-em`) and transitive suppliers IndexTheory, TopologicalSheafCohomology and CharacteristicClasses; the exact edges below are already stated in `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:70`–74 and lines 184–186, contradicting the description's same-author/direct-supplier and consumer characterizations. Correcting the live prerequisite/merge description and arranging the external supplier stages is outside the permitted edits; no description or merge-order change was made, and the passing dependency check does not resolve this finding.

**Verified prerequisite edges.** These are the minimum edges implicated by H02, not a certification of every transitive prerequisite.

| Supplier and verified head | Required stage edge |
| --- | --- |
| K3Surfaces `43784f8` | Conventions, K0, K0.A and K1–K2 → this roadmap's adapter and geometric/complex applications; this is a direct dependency. |
| IndexTheory `819f43f` | I7.3 Dolbeault-symbol/index–Todd comparison → K3Surfaces K1 analytic surface RR → K2 and the consumed complex/Betti package. |
| TopologicalSheafCohomology `f06755a` | TS3.1–TS3.3 and TS3.7 → ComplexComparisonPartII C6.1 → C6.3 → C6.6 → §3.1 here. |
| CharacteristicClasses `d077cb4` | C1.2/S0–S5 → the same C6.1 comparison chain, retaining support, proper-map and CW-domain hypotheses. |
| NoncommutativeAndEquivariantIwasawa `3ec4ff3` | §0.1 uniform first congruence kernel, including torsion-freeness → §4.5 → §§4.6 and 6.6 here; later Iwasawa arithmetic supplies no premise. |

All five suppliers remain open, and the first four have no active or completed folder on main `fe54001`; ComplexComparisonPartII's checked head is `2d50a88`. The tracked merge order already places ComplexComparisonPartII before this roadmap and this roadmap before NeronModelsAndSemistableAbelianVarietiesPartII; it contains no entries for the four other-author suppliers, so its successful check is not evidence that the advertised external integration order is complete.

**Ownership and source evidence.** The object search covered main, the board's package READMEs and the indexed open-roadmap heads, including the supplied sibling roadmaps; ownership against open pull requests was checked. The generic prefix remains here because its arbitrary-field carrier and proper-base adapter supply both the K3 applications and the companion without a reciprocal dependency; its Needs exclude §§1.5 and 4.2, which enter only its subsequent K3 specialization, and no target was moved or added in this round.

The shared-carrier and localization hypotheses agree with enriques-one line 17390 and lines 17405–17431; the canonical formula and Hodge-line sign agree with Theorem 4.1.6, enriques-one lines 17528–17563. At the pins, `TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/Basic.lean:44`–74 gives flatness, finite presentation, the specified generic-fibre isomorphism and separate properness, without smooth-generic or minimality data; its `BaseChange.lean:66` and line 103 are restricted to finite DVR extensions, as the README states. `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:41`, line 57 and line 71 supply the properness predicate, composition and base change used by the adapter. EllipticCurves Layer 4 retains ownership of ReductionSymbol; its geometric realization is the shared target here.

The six citation leads were resolved: the five IsK3 headline names are this module's own declarations, and Crystalline.wittCohomology_V_complete is the supplier's planned CR.4.7 declaration, not a missing pinned-library theorem. The source checks used the existing legal cached texts; no new source, waiver or missing-text request is needed.

**Signature comparison.** All nine actual declarations (three definitions and six theorems) were compared with the supplied mechanically elaborated `#check @name` types and README §§1.1–1.2, 2.3–2.4 and 4.2–4.6: field instances, structure morphisms, K3 hypotheses, finite-dimensionality, separability and rank equality are retained, with no binder repair required. The supplied tally of ten includes a spurious `group` entry parsed from the docstring at `Suggested.lean:138`; it is not a declaration, and its diagnostic does not indicate a failed target build.

**Adversarial record.** No mathematical statement was edited; these are numerical and carrier controls for the acceptance declarations and the shared interface implicated by the findings, not proofs of the admitted targets.

| Statement | Instances tried and computed values | Result | Change |
| --- | --- | --- | --- |
| differentialForms (§1.1) | Rank-two local cotangent frame, exterior degrees 0,1,2,3: ranks 1,2,1,0; the tensor cube instead has rank 8. | Sheaf exterior-power definition has the intended degrees. | None. |
| IsK3 (§1.1) | Smooth quartic: canonical line O and h¹(O)=0; E×E: h¹(O)=2; empty scheme: nonemptiness false. | Product and empty scheme fail required conjuncts. | None. |
| isK3_fieldExtension_iff (§1.2) | Identity extension: quartic gives true ↔ true, E×E gives false ↔ false; after any field extension the latter still has h¹(O)=2. | Both directions preserve the cohomological exclusion. | None. |
| IsK3.noVectorFields (§2.3) | K3 source values (h⁰Ω¹,h⁰T,h²T)=(0,0,0); abelian surface values (2,2,2), with h¹(O)=2 excluding it. | K3 hypothesis distinguishes the negative control; characteristic two is retained. | None. |
| IsK3.hodgeNumbers (§2.4) | Rows p=0,1,2 give (1,0,1),(0,20,0),(1,0,1); p=3 or q=3 gives 0; de Rham ranks (1,0,22,0,1), Euler sum 24. | Finite-dimensionality is explicit; values agree with deligne-lift lines 29–57 and huybrechts lines 367–380. | None. |
| geometricPicardRank (§4.3) | Complex Fermat quartic: geometric rank 20, also after changing algebraic closure; defining it as b₂ would give 22. | Rank is taken on the actual geometric line-bundle class group. | None. |
| IsK3.picardGroup_finiteFree (§4.2) | Complex Fermat quartic: Pic is free of rank 20, torsion subgroup has order 1; its ample hyperplane has square 4 and infinite order. | Rank-zero and torsion models fail the geometric controls; huybrechts lines 335–354 and line 12288. | None. |
| IsK3.picardRank_bounds (§4.4) | Complex Fermat quartic: 1≤20≤20≤22 and 20≤20; a rank-22 positive-characteristic input satisfies 22≤22, without a characteristic-zero conclusion. | The 20 bound remains conditional on characteristic zero. | None. |
| IsK3.boundedPicardDescent (§4.6) | Algebraically closed complex Fermat base: K=k, degree 1, arithmetic and geometric ranks 20=20; GL₀, GL₁, GL₂ over F₃ have orders 1,2,48. | Degree-one endpoint is included; the statement asserts rank equality, not unconditional integral Picard descent. | None. |
| Genus-one carrier/localization (§6.0b) | E×P¹ and E×A¹ have generic h⁰=h¹=1; P¹×P¹ has generic h¹=0; localization at t=0 has generic fibre E over k(t) and closed fibre E. | The generic-genus and specified-model conditions discriminate the intended carrier. | None. |
| Separate relative minimality (§6.0b) | Product fibre: relative canonical degree 0; blowup exceptional curve: square −1 and relative canonical degree −1. | Proper flat model does not silently imply minimality. | None. |
| Proper-base restriction (§6.0b) | E×P¹: proper base and h⁰(O_X)=1; E×A¹: nonproper base and independent sections 1,t,t²,…; both have generic h⁰=h¹=1. | Adding properness excludes the second fibration without changing generic/local data. | None. |
| Inseparable fibre comparison (§6.0b) | In characteristic 2, b²=a gives t²−a=(t−b)²: pulled-back divisor length 2 versus reduced-point length 1. | Adapter retains the full scheme-theoretic fibre/divisor distinction. | None. |
| Geometric Kodaira realization (§6.0b) | I₀* matrix applied to primitive vector (2,1,1,1,1) gives (0,0,0,0,0); applied to reduced vector (1,1,1,1,1) gives (2,−1,−1,−1,−1). | Primitive multiplicities cannot be replaced by reduced support. | None. |
| Canonical and Hodge-line laws (§6.0b) | Product: deg ω_C−deg L=−2−0=−2; Jacobian K3: −2−(−2)=0; χ=2 and torsion length 1 give deg L=−3, not −2. | Both the inverse line and the wild torsion term are necessary; the last input is a formula control, not a K3 existence claim. | None. |
| Jacobian section and multiple fibres (§6.0b) | Intersection with a section gives 1=m(C₀·Fbar); m=2 would require an integer equal to 1/2. | The Jacobian has multiplicity 1; a torsor need not. | None. |
| Numerical restriction/determinant (§6.0b) | Bielliptic control: MW order 4, N=MW, q=1 and absolute discriminants 1, giving 1²·1=1; substituting full MW order gives 16≠1; index-2 sublattice of Gram [−2] has determinant magnitude 8=2²·2. | Quotient MW/N and square index remain essential; no return to the false full-MW formula. | None. |
| Odd-prime congruence input (§4.5) | −1 reduces to 2 modulo 3 and to 1 modulo 2; at rank 0 the group order is 1. | Oddness excludes the order-2 kernel element; rank 0 remains covered. | None. |

**Build outcome.** `lake build TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness.Suggested` exited 0, with exactly six declaration-uses-sorry warnings and no errors; exact final line: `Build completed successfully (9040 jobs).`

**Dependency-direction output.**

```text
depcheck: 33 roadmaps, 305 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line for this roadmap.

**Gate summary (exit 0).**

```text
gate K3SurfacesAndSymplecticBoundedness: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Neither permitted roadmap file changed; the worktree remains clean at `8bc88634194bd04a2b8b1963f8cb55df8d20c01d`, so no repair commit was created and nothing was pushed. H01 and H02 remain open for the companion and live integration changes described above.
