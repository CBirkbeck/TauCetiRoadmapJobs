<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12977#issuecomment-6866432599 -->
Review (codex) of 8f92ca6

Verdict: accepted
Conditional on the announced gaps: `extended-log-robba-growth`, `dejong-disc-robba-submodules`, `unit-root-correspondence-perfect-base`, `legendre-kummer-extension`, `irreducible-iota-purity`, `lefschetz-curves-irreducibility`, `docile-curve-restriction`, `coefficient-linear-weil-ii`, `dejong-generic-affine-line-comparison`

No findings. Acceptance is conditional on the nine declared supplier contracts listed below. The four reviewed package files were not changed. No source entry was added or rewritten.

## Previous finding and repair verification

**F01 (P3), round 7: repaired.** `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/Suggested.lean:54` now says the curve headlines “lack the completed generic field of a curve and its local fields with their Frobenius lifts, derivations and embeddings”. It no longer says that weak and adic completions themselves are absent.

I independently opened the pinned definitions, elaborated their explicit signatures and specialised both completions to ℤ₂[X]. The finite-type binder is present. The native objects supply rings, not the analytic Frobenius/connection structures or isocrystal categories needed by the five headlines. Their omission from the acceptance signatures remains justified.

I also reviewed every changed passage: the opening inventory and the MS.2.5/MS.4.2 bullet in Suggested.lean; README scope at lines 68 and 88–94, native supplier contracts at 224–238, parent contract at 260, MS.0.1 at 376–407, and the layer dependencies at 750–752. The repaired pattern does not persist elsewhere. Native completions, formal differentiation and the open-disc derivative are acknowledged; the remaining absence claims refer to the structured analytic objects. The parent’s RD.0.42 likewise uses the native weak completion and supplies its Frobenius lift. There are no settled “not actionable” findings to re-raise and no maintainer notes.

## Verified sound

The review covered all 69 numbered targets, all 20 definition/API blocks, all seven layers, every Needs paragraph and the four package files. I used the previous review’s computed examples as leads, recomputed the displayed headline/sample instances, and independently reviewed the other 35 targets rather than inheriting its uncomputed coverage summary. A complete computation ledger was saved with the review’s scratch work; the compact table below includes all 31 theorem headlines, both seeded subjects and the repaired carrier claims.

The roadmap extends its named parent; it does not re-plan it. The main checkout contains no second copy of this Part II. No route-specific prime restriction, computational algorithm, copied passage, sorry’d data, set_option, unowned prerequisite or upward dependency was found. The restriction p ≡ 1 mod 4 belongs to the Legendre–Kummer example, not the general theorems. General statements retain p = 2 and p = 3.

### Computed adversarial evidence

These are diagnostic instances, not substitutes for proofs. Write L_s for a constant line of slope s where defined. Write J for the logarithmic rank-two extension with module slopes −1,0, Frobenius q⁻¹,1 and connection ∇e₂=e₁ dt/t. Its solution slopes are 1,0; its bounded quotient is a slope-zero line. Top is the maximal-slope quotient and S₁ the minimal-slope subobject. PBQ excludes zero here.

| Statement | Instances tried | Values computed on the two sides / negative control | Result / change |
| --- | --- | --- | --- |
| MS.0.1 | Native completions; A = ℤ₂[X], π = 2; ramification e = 2 | Σ2ʲXʲ belongs to both completions: degree j ≤ j+1. Σ2ʲX^(j²) belongs to the adic completion but not the weak completion: j²/(j+1) is unbounded. If p = π², grouping j = 2m+r changes a linear degree bound c to 2c; both definitions give the same weak ring. | Consistent; none. |
| MS.0.4 | Opposite slope bound: unit line, its inclusion in two unit lines | Ranks of Top and pure target are 1 = 1, then 1 < 2; slopes are 0 = 0. Projection L₁ ⊕ L₀ → L₀ has slopes 1 ≠ 0 but kernel rank 1, so it fails injectivity. | Consistent; none. |
| MS.0.7 | Bounded splitting: 0, L₀, L₁ ⊕ L₀, J | Bounded solution ranks 0,1,2,1 versus total ranks 0,1,2,2. The slope filtration splits in the first three cases; J is nonsplit and unbounded. | Consistent; none. |
| MS.0.9 | PBQ sample: 0, L₀, L₁ ⊕ L₀, J | Bounded quotient ranks 0,1,2,1, with slope sets ∅,{0},{1,0},{0}; PBQ is false,true,false,true. This separates the stated nonzero convention from OHK’s zero convention. | Consistent; none. |
| MS.1.1 | Canonical PBQ filtration: 0, line, split slopes 1,0 | Lengths 0,1,2; split graded slopes 1 > 0. Maxima of the nested terms are 1,1, which do not decrease. The statement correctly uses grades. | Consistent; none. |
| MS.1.2 | Bounded graded formula: split object and J | Split bounded quotient has rank 2, slopes 1,0, equal to the sum of the two graded tops. J has a single PBQ grade and bounded quotient rank 1, slope 0; both sides have rank 1. | Consistent; none. |
| MS.1.4 | Bounded Robba descent | For the constant split slopes 1,0 the descended first step has rank 1 and slope 1, exactly the generic first step. An irreducible line has one grade, rank 1, before and after extension. | Consistent; none. |
| MS.1.5 | Disc descent; CT11 rank-three example | For slopes 0,1/2,1, the first PBQ piece spans e₁,e₃, rank 2 and maximum 1; the quotient has rank 1 and slope 1/2. The bounded grades have slopes 1,1/2, not all three original slopes. A line has one rank-one grade. | Consistent; none. |
| MS.1.8 | Growth/slope comparison on J, p = 2,3 | At λ = −1,0,1, growth dimensions are 0,1,2, equal to the shifted solution-slope filtration dimensions 0,1,2. Coefficients at pʳ have norm pʳ for both primes; maximum module slope is 0. | Consistent; none. |
| MS.2.1 | Curve PBQ sample: 0, unit, split | Generic bounded ranks 0,1,2 and PBQ values false,true,false. Restricting to a dense affine open preserves those ranks and the slope sets ∅,{0},{1,0}. | Consistent; none. |
| MS.2.2 | Intersections on A¹ and Gₘ | 1/x has order −1 at 0 and fails the interior intersection on A¹. On Gₘ, Σpⁿx^(pⁿ) lies in the completed coordinate ring, but at infinity its annular terms have norms p⁻ⁿr^(−pⁿ), unbounded for every r < 1: boundary overconvergence fails. A nontrivial invertible module still has local rank 1. | Consistent; none. |
| MS.2.3 | Gluing and normalised twists | A constant slope-one line twists by q⁻¹: q·q⁻¹ = 1, slope 0. Zero and full submodules glue to ranks 0 and 2. For a rank-one subspace in a rank-two module, the kernel of wedging with e₁ is exactly span(e₁), rank 1. | Consistent; none. |
| MS.2.5 | Curve PBQ filtration | For L₁ ⊕ L₀, successive grades have maxima 1,0 and ranks 1,1, length 2. A line has length 1. The nested rank-two term still has maximum 1, distinguishing the incorrect nested-maxima version. | Consistent; none. |
| MS.2.6 | Finite étale transport: Artin–Schreier, p = 2,3 | The map x ↦ xᵖ−x has derivative −1 and degree p; the unit pullback has rank 1 and its pushforward rank p, all slopes 0. For the identity, both ranks are 1. Inseparable x ↦ xᵖ has derivative 0 and is excluded. | Consistent; none. |
| MS.2.7 | Curve bounded quotient | The split constant object has bounded quotient rank 2. The ordinary Legendre top has rank 1, slope 1, but is not a dagger subquotient of that rank. At a supersingular point slopes are 1/2,1/2; the ordinary slope-filtration hypothesis cannot simply be extended there. | Consistent; none. |
| MS.2.9 | Convergent PBQ filtration | Unit, split slopes 1,0, zero, and the ordinary Legendre unit-root convergent line have lengths 1,2,0,1. The last has generic and local rank 1, despite not extending as a dagger line. | Consistent; none. |
| MS.3.6 | Local graded recovery | On split slopes 1,0 a graded map with scalars 2,3 recovers diag(2,3), rank 2; the recovered grade scalars are exactly 2 and 3. For zero there are no grades and total rank 0. | Consistent; none. |
| MS.3.7 | Local reconstruction and its saturation hypothesis | A unit-line top map 2 lifts uniquely to 2. J and the unit line have top ranks 1 = 1 but full ranks 2 ≠ 1; J has top-kernel rank 1, so the required saturation fails. | Consistent; none. |
| MS.4.2 | Curve rank theorem | The Legendre first PBQ piece has full rank 2, maximum 1; its convergent top has rank 1, maximum 1. The asserted equality is rank Top = rank image = 1, not 2 = 1. Split projection has kernel rank 1 and does not meet injectivity. | Consistent; none. |
| MS.4.3 | Curve irreducibility criterion | For a unit, split unequal slopes, and J, irreducibility is true,false,false. The corresponding triples (PBQ,saturated,irreducible top) are (true,true,true), (false,false,true), (true,false,true). Both directions survive these controls. | Consistent; none. |
| MS.4.4 | Curve graded recovery | The diagonal graded scalars 2,3 on split constant slopes 1,0 lift to diag(2,3), with those same two graded scalars. The zero object has empty graded data and rank 0 on both sides. | Consistent; none. |
| MS.4.6 | Specified map on a curve | For the constant unit line h = 2, the unique lift is 2 and its top is 2. Using J instead gives full ranks 2 and 1, but fails irreducibility/saturation. The rank-zero case fails the nonzero-map hypothesis. | Consistent; none. |
| MS.4.8 | Minimal-slope duality | A slope-one line dualises to slope −1 and back to +1; a map of scalar 2 dualises to scalar 2 and back to 2, with source and target reversed twice. Taking the same extremum without changing sign would select the wrong grade in slopes 1,0. | Consistent; none. |
| MS.5.3 | Frobenius-iterate and isoclinic reductions | Induction from F² replaces a rank-one unit object by rank 2, while zero remains 0. For split slopes 0,1 the induced object has rank 4 and first-slope rank 2; applying S₁ gives 2, not 4. The induced slope-one block has polynomial T²−q². | Consistent; none. |
| MS.5.5 | Generic minimal slope equality | For split slopes 0,1 and N = L₀, Hull†(N) = N and both embedded S₁ have rank 1 and slope 0. For N = 0 both ranks are 0. Taking the whole ambient object as every hull would fail the dagger-line minimality condition. | Consistent; none. |
| MS.5.6 | Affine-line reduction | Artin–Schreier has degree p, derivative −1 and ramification index p at infinity, including p = 2,3; it is étale on A¹ but not on its compactification. The identity has degree 1. The statement uses the open étale locus. | Consistent; none. |
| MS.5.7 | Minimal slopes on curves | For the ordinary Legendre unit-root N, rank N = 1 and rank Hull†(N) = 2, but both S₁ are that same rank-one line. A dagger line has hull rank 1; zero gives rank 0 on each side. | Consistent; none. |
| MS.5.8 | Docile Lefschetz and missing-hypothesis control | For constants on P² over F_(p²), both H⁰ spaces have dimension 2 over the smaller coefficient field. A nontrivial Dwork object on A² can have H⁰ = 0 while restriction to x = 0 gives dimension 1; it violates docility. Thus 0 ≠ 1 does not refute the theorem. | Consistent; none. |
| MS.6.1 | Lefschetz sample; residue-field rational point | At the F_p-origin, the identity A¹-curve gives 1 rational point in the fibre. The curve A¹ over F_(p²) mapping to A¹ over F_p has image containing the origin but gives 0 F_p-rational points above it. Only the first is a valid witness. | Consistent; none. |
| MS.6.3 | Fibre reconstruction | Equal unit lines and h = 2 give ranks 1 = 1 and fibre eigenvalues a = a. For two different eigenvalues a,b, Frobenius equivariance forces (a−b)h = 0, hence h = 0; the nonzero-map hypothesis fails. | Consistent; none. |
| MS.6.6 | Coefficient-linear trace and twist | On a point with λ = 2, the n = 1,2 traces are 2 = 2 and 4 = 4, not 4 = 2. For A¹, #A¹(F_(qⁿ)) = qⁿ equals the compact-support trace qⁿ. The duality twist O(−1) multiplies Frobenius by q. | Consistent; none. |
| MS.6.7 | Projected trace average, m = 1,2 | For m = 1 the average is the identity. For the two-coordinate swap, Av(1,0) = (1/2,1/2) = T·Av(1,0). The two-point primitive trace 1 and unit trace 2 distinguish totals 2 and 4 before projection; averaging is performed in characteristic zero. | Consistent; none. |
| MS.6.9 | Weights and coefficient irreducibility | On Spec F₃, Frobenius 2 has real weight 2 log₃2, about 1.262, not an integer. Over L = ℚ₃(√5), the L-line with eigenvalue (1+√5)/2 has one complex modulus 1.618…; forgetting L gives two moduli 1.618… and 0.618…, so is not pure. Equal weights subtract to 0 under the dual tensor. | Consistent; none. |
| MS.6.10 | Fibrewise criterion and pole | Equal unit objects on A¹ give L(t) = (1−qt)⁻¹, pole at t = 1/q and Hom dimension 1. Unequal constant eigenvalues a,b on a point give distinct fibres and (1−at)⁻¹ ≠ (1−bt)⁻¹, failing the hypothesis. | Consistent; none. |
| MS.6.13 | Finite-field minimal slope theorem | For equal lines with h = 2, both full and top ranks are 1, fibre eigenvalues agree and the dual tensor weight is w−w = 0. Nonzero h already gives an isomorphism on the line. Zero maps and zero objects do not enter the hypotheses. | Consistent; none. |
| MS.6.14 | Finite-field specified map; labelled source/target lines | With g′(e_N) = 2e_M and h(e_N) = 3e_M, h∘g′⁻¹ acts on M by 3/2, inverse 2/3; composing it with g′ gives 3e_M. The attempted h∘g′ is not typed. The curve case m = 1 gives the same unique scalar 3. | Consistent; none. |

The other targets were tested on the same models, with additional explicit controls: tensoring a unit line by zero changes PBQ from true to false (MS.0.11); quasi-saturation distinguishes an injective E†-map of rank 2 from its E-linearisation of rank 1 (MS.3.2); the hull of the ordinary Legendre unit-root line has rank 2 rather than 1 (MS.5.1, MS.5.4); diagonal endomorphism restriction to two copies has kernel 0 but misses (1,0) (MS.6.8); and the specified scalar 3 is recovered from a preliminary scalar 2 by multiplying by 3/2 (MS.6.11). None contradicts a statement under its hypotheses.

Standing conventions exclude the zero ring, equal-characteristic coefficients and q = 1: K is a characteristic-zero complete discretely valued field, and q = pˢ with s ≥ 1. Rank zero is handled by the empty PBQ filtration, while claims about a unique slope require a nonzero object. Curves are smooth and connected over a perfect field; their affine rings are domains, but their finite projective coefficient modules need not be globally free. Frobenius linearisation, coefficient-linear purity, finite étaleness, the rational point over the specified residue field, and the additional finite-field endomorphism condition remain explicit. The maps used in reconstruction have specified domains; duality changes slope sign; averaging divides by a positive integer in characteristic zero. No total-function junk value or vacuous arbitrary-data statement was found.

### Seeded sources and source inventory

All nine cited works have one manifest entry each. Seven are certified cached texts; DEJONG98 and TSU98 are the two settled uncertified entries. The arXiv versions read agree with the manifest’s version notes. No additional unverified locator flag requiring a new source request was found.

| Target | Source checked at its locator | Outcome |
| --- | --- | --- |
| PBQ, MS.0.9 | TSU Definition 3.16, p. 16, line 864; Definition 3.22, p. 17, line 920 | A unique slope of the bounded quotient; the extension from E† and the disc is by the generic fibre. The roadmap’s nonzero convention is explicit. |
| PBQ, MS.0.9 | CT11 Definition 5.1, printed p. 55, line 996 | Pure bounded quotient, with the disc notion tested generically; the printed page is distinguished from PDF page 23. |
| PBQ quotient criterion | OHK Definition 5.10 and Lemma 5.11, p. 27, lines 1336, 1343 | OHK allows zero, expressly at line 1341. The roadmap does not silently import that convention. Its quotient theorem retains the PBQ hypothesis omitted in OHK Corollary 5.12. |
| Curve PBQ, MS.2.1 | TSU Definition 3.26, p. 18, line 991 | Generic PBQ on a dense affine open, with the compatible lifted coefficient datum; the roadmap preserves independence of that choice. |
| Lefschetz condition, MS.6.1 | TSU §6.3, p. 28, lines 1456–1463 | The curve must have a k(α)-rational point over α and irreducible restriction. Mere containment of α in the image is insufficient; the computed 1-versus-0 point control detects it. |
| Coefficient Lefschetz supplier contract | AE §1.1, p. 4, lines 153–163; Theorem 3.10, p. 17, line 747 | The theorem is in the algebraic-closure coefficient category. The contract requires irreducibility after every finite coefficient extension and preserves the residue fields of the selected points. |

Further inspected passages include TSU §§3.1, 2.3, Theorem 3.19 and Proposition 7.12; OHK Theorem 7.6; and DAD Definition 4.1.1. The finite-field theorem remains an existence theorem until the separate endomorphism condition is supplied. In particular, the coefficient-linear statements do not claim purity after forgetting a finite coefficient-field action.

### Pinned library and Lean acceptance test

Mathlib pin: `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`. Tau Ceti pin: `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Both checkout heads match the manifest. I opened the following declarations and their binders, rather than relying on name resolution alone:

| Pinned file and line | Declaration / mathematical limit checked |
| --- | --- |
| Mathlib/RingTheory/AdicCompletion/Basic.lean:172 | AdicCompletion is the compatible inverse-limit family of ideal-power quotients. It imposes no Frobenius; general completeness is not built into its definition. The principal ideal here is finitely generated. |
| Mathlib/GroupTheory/MonoidLocalization/Away.lean:140; Mathlib/RingTheory/Localization/AtPrime/Basic.lean:55 | Localization.Away and Localization.AtPrime; the latter retains the prime-ideal hypothesis. |
| TauCeti/RingTheory/Dagger/WeakCompletion/Basic.lean:81, :90, :190, :201, :229, :240 | piAdicCompletion, the linear degree-growth condition, weakCompletion with Algebra.FiniteType, independence of presentation, weakCompletion.of and its Hausdorff injectivity criterion. These are native rings, not new constructions owned here. |
| TauCeti/RingTheory/PowerSeries/Bounded.lean:63, :81 | HasGaussNorm.subring and mem_subring_one_iff; positive radius and ultrametric hypotheses are present; radius 1 means bounded coefficient norms. |
| TauCeti/RingTheory/PowerSeries/OpenDisc/Basic.lean:295, :342; Mathlib/RingTheory/PowerSeries/Derivative.lean:50 | OnOpenDisc.subring, its derivative stability, and formal PowerSeries.derivative. Differentiation is not claimed absent. |
| Mathlib/LinearAlgebra/Isomorphisms.lean:39 | LinearMap.quotKerEquivRange; quotient by kernel, not arbitrary codomain surjectivity. |
| Mathlib/RepresentationTheory/Invariants.lean:126, :131, :137 | Representation.averageMap, averageMap_invariant, averageMap_id; finite group and invertible cardinality. |
| Mathlib/LinearAlgebra/Trace.lean:75, :190 | LinearMap.trace and trace_one; trace_one uses finite/free modules. The general definition does not by itself supply the cohomological trace formula. |
| Mathlib/NumberTheory/Padics/PadicNumbers.lean:881 | Padic.norm_p_pow; the coefficient p has norm p⁻¹. |
| Mathlib/FieldTheory/Fixed.lean:103 | FixedPoints.subfield for a monoid action; it does not supply Tsuzuki’s coefficient-field normalisation theorem. |
| Mathlib/RingTheory/WittVector/Isocrystal.lean:112, :179 | WittVector.Isocrystal bundles a Witt-fraction module with semilinear equivalence. isocrystal_classification is rank one over algebraically closed residue field; neither is an analytic (φ,∇)-module or a curve isocrystal. |

Object searches across both pins for Robba, PBQ, overconvergent isocrystals and dagger hulls found no corresponding implemented theory. Hits for “bounded quotient” in the homotopy category and distribution theory have different carriers and operations. Power-series derivatives and abstract completions were compared by object and retained as imports, not duplicated targets. No package-owned backticked Lean identifier is missing: the remaining unqualified tokens are mathematical notation, not advertised declarations.

The required `lake env lean` elaboration of `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/Suggested.lean`, run from the content checkout with the package file supplied by absolute path to the command, exited 0 with no warnings or output. A separate scratch signature file checked every cited library name with explicit binders, including both completions of ℤ₂[X], and exited 0. Two missing supporting object files were built by the permitted targeted module build before repeating that check; no general lake build was run.

Suggested.lean has one `import Mathlib`, one module docstring, the required namespace, zero declarations, zero sorry, zero set_option and zero examples. Consequently the package’s `#check @name` inventory and the every-sorried-theorem one-tactic probe inventory are both empty (0/0); there is no padding or silently lost binder to test. This is not an elaboration-based claim of mathematical truth.

The theorem-headline inventory is: MS.0.4, MS.0.7; MS.1.1, MS.1.2, MS.1.4, MS.1.5, MS.1.8; MS.2.2, MS.2.3, MS.2.5, MS.2.6, MS.2.7, MS.2.9; MS.3.6, MS.3.7; MS.4.2, MS.4.3, MS.4.4, MS.4.6, MS.4.8; MS.5.3, MS.5.5, MS.5.6, MS.5.7, MS.5.8; MS.6.3, MS.6.6, MS.6.7, MS.6.10, MS.6.13, MS.6.14. Each of these 31 is named in the module docstring with its missing structured carriers. Its explanations distinguish native rings from missing Frobenius modules, generic solution spaces, slope filtrations, isocrystal categories, dagger hulls, rigid cohomology and coefficient-linear fibres. The construction headlines in the summary receive the same treatment. None becomes statable merely by a few simple definitions. In particular, stating the average on a bare representation would replace MS.6.7 with the existing library lemma, not state the projected geometric trace theorem.

### Suppliers, gaps and direction of supply

The fresh dependency check returned exactly:

```text
depcheck: 240 roadmaps, 2169 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Reading all 69 actual Needs paragraphs gives 155 explicit internal MS-target edges and no internal cycle. The reference from MS.0.5 to MS.0.7 is forward in exposition but does not produce a cycle; dependencies, rather than subsection position, specify construction order. Every layer has its dependency summary.

The citation resolver reported no unresolved roadmap section or identifier. Its library warning was handled by the independent pin inspection and elaboration above. I resolved all 72 parent section references at the supplied current head of PadicDifferentialEquationsAndRigidCohomology, open PR #1002. Below, every number after a colon is a line of `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md` at that head:

- RD.0: 0.1:722; 0.9:957; 0.17:1166; 0.26:1413; 0.34:1602; 0.35:1639; 0.36:1672; 0.37:1712; 0.38:1737; 0.39:1758; 0.42:1836; 0.48:2015; 0.53:2159.
- RD.1: 1.13:2629; 1.22:2865; 1.25:2939; 1.27:3006; 1.32:3115; 1.35:3179; 1.36:3216; 1.37:3246; 1.39:3287; 1.40:3307; 1.41:3331; 1.43:3366; 1.44:3408; 1.45:3430; 1.72:4117.
- RD.2: 2.22:4770; 2.28:4969.
- RD.3: 3.15:6057; 3.16:6073; 3.19:6148; 3.22:6233; 3.25:6317; 3.29:6430; 3.31:6477; 3.32:6503; 3.33:6534; 3.34:6572; 3.37:6704; 3.38:6741; 3.39:6763; 3.40:6790; 3.41:6808; 3.45:6939; 3.47:6992; 3.48:7024.
- RD.4: 4.19:7642.
- RD.5: 5.2:8765; 5.4:8793; 5.7:8856; 5.8:8880; 5.8c:8946; 5.29:9405; 5.89:10727; 5.100:10972; 5.103:11081; 5.112:11313.
- RD.6: 6.2:11524; 6.4:11589; 6.23:12040; 6.28:12135; 6.42:12468; 6.47:12638; 6.57:12904; 6.59:12967; 6.60:12997; 6.61:13012; 6.77:13328; 6.82:13427; 6.85:13496.

The consumed statements concern the rings, Frobenius modules, slopes, realisation categories, full faithfulness, finite étale operations, cohomology, traces and weights named in the contracts. In particular, the complete-residue-field theorem of RD.0.53 is not silently treated as the generic k(t) comparison. The generic comparison is a separate declared gap. The same distinction is retained for perfect-base unit-root coefficients and coefficient-linear purity/Weil II.

The other two direct suppliers are on main: `TauCetiRoadmap/AlgebraicCurves/README.md:478` (Layer 2) and :1468 (Layer 12), and `TauCetiRoadmap/RigidAnalyticGeometry/README.md:434` (Layer 5). I read their statements and the relevant finite/projective and smoothness hypotheses. These and AdicSpacesPartIV also provided the upstream shape comparison.

All nine gap slugs occur both in design/plan.json and under the README’s Exact supplier contracts (lines 322–338), with the same needs text and a named parent supplier. They request precise missing interfaces, not unowned assumptions or already implemented stand-alone rings:

- extended-log-robba-growth
- dejong-disc-robba-submodules
- unit-root-correspondence-perfect-base
- legendre-kummer-extension
- irreducible-iota-purity
- lefschetz-curves-irreducibility
- docile-curve-restriction
- coefficient-linear-weil-ii
- dejong-generic-affine-line-comparison

The bundles within these contracts specify the compatible maps and laws of a single interface. They do not conflate unrelated tasks. The accepted verdict is conditional on their supply; their present absence is not supplier drift.

### Duplication and overlap audit

I read the board package index before searching for owners, checked main and the available open heads through the roadmap tools, and compared the supplied overlap facts with those texts. No conflicting copy, dropped cited ID, revision-only cited ID, removed locally cited ID or second changing pull request was found. No fully qualified declaration can collide, since this Suggested.lean declares none.

| Closest roadmap read | Scope / ownership resolved |
| --- | --- |
| PadicDifferentialEquationsAndRigidCohomology, #1002 | Owns foundational analytic rings with Frobenius, modules, slopes, isocrystals, full faithfulness and rigid cohomology/weights. The section references above import these; this Part II owns PBQ, saturation, curve reconstruction and the stated extensions. |
| KloostermanSheavesAndBesselIsocrystals, #2289, TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md:25, :100 | Owns Bessel/Kloosterman constructions, and imports this roadmap’s MS.4.6. It does not duplicate the general specified-map theorem. |
| CrystallineCohomologyPartII, #2265, TauCetiRoadmap/CrystallineCohomologyPartII/README.md:8, :16 | Owns its crystalline/de Rham–Witt and compact-support comparisons. Its slope-less-than-one comparison is not the PBQ bounded quotient; rigid foundations are assigned to the parent. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, #879, TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:52 | Owns finite-flat groups and integral Dieudonné/Kisin interfaces, not analytic PBQ or dagger hulls. |
| PadicHodgeTheory, #1062, TauCetiRoadmap/PadicHodgeTheory/README.md:7 | Owns rational period/comparison theory, not the generic-solution bounded quotient or minimal-slope reconstruction of curve isocrystals. |
| AdicSpacesPartIV, main, TauCetiRoadmap/AdicSpacesPartIV/README.md:58, :3820 | Owns dagger/adic geometry. Native weak-completion rings now belong to pinned Tau Ceti; this package cites them. Compatible Frobenius lifts are the parent’s RD.0.42, not rebuilt here. |

The results/headings closest-roadmap list was empty. The additional object search’s SatoTateGroup use of “Lefschetz” is a centralizer condition for a compact group, not the curve-restriction predicate here; it supplies no overlapping object.

Overlap check: read PadicDifferentialEquationsAndRigidCohomology, KloostermanSheavesAndBesselIsocrystals, CrystallineCohomologyPartII, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicHodgeTheory, AdicSpacesPartIV; analytic/isocrystal foundations belong to the parent, weak-completion rings to pinned Tau Ceti, dagger geometry to AdicSpacesPartIV, and PBQ/saturation/minimal-slope reconstruction to this Part II. KloostermanSheavesAndBesselIsocrystals consumes its reconstruction theorem; the other closest roadmaps share no newly owned object.

### Shape, independence and wording

The README has the required summary, scope, conventions, exact supplier contracts, reading guide, seven mathematical layers, seven Examples and seven Dependencies subsections, downstream consumers and references. All 20 definition blocks have an API and at least three Checks: their counts in order are 3,5,4,4,3,3,3,5,3,3,3,3,3,3,3,3,3,4,3,4. The theorem targets state their hypotheses and locators; proof routes name owned inputs or supplier sections. The checked examples distinguish zero from nonzero PBQ, bounded from unbounded solutions, generic from boundary convergence, coefficient from base extension, and existence from a specified lift. No claimed own Lean name, process residue, machine path, HTML anchor, forbidden import or lemma declaration was found in the package text. Metadata remains math.AG.

I compared 12 passage/source pairs directly: MS.0.9 against TSU line 864, CT11 line 996 and OHK line 1336; MS.2.1 against TSU line 991; MS.6.1 against TSU line 1456; its coefficient Lefschetz contract against AE line 747 with the coefficient conventions at line 153; MS.0.1 against TSU line 547; MS.0.4 against TSU line 513; MS.1.2 against TSU line 878; MS.1.8 against OHK line 1933; MS.5.1 against DAD line 435; and MS.6.6 against TSU line 1709. Mathematical notation, standard names and unavoidable short defining phrases agree; no distinctive copied sentence, clause-by-clause paraphrase, table, figure or imported list of exercises was found. I separately compared the revised module docstring with the actual native definitions.

For a reproducible locator count, I counted author-plus-named-locator occurrences in the README body, joining line wraps, excluding the References list, and counting repeated occurrences. Counts: TSU 108, DAD 17, OHK 13, CT11 8, AE 5, KED04 1, KED05 1, DEJONG98 1, TSU98 1; total 155. TSU is the largest share. Its contents were read: opposite slopes (§2), generic PBQ and curves (§3), local minimal slopes (§4), saturation (§5), curves (§6), and finite fields (§7). The roadmap does not reproduce that section sequence: MS.0 combines coefficient fields, opposite slopes and bounded quotients; MS.1 integrates OHK and CT11 growth/descent; MS.2 globalises PBQ; MS.3 combines local/global saturation; MS.4 reconstructs; MS.5 introduces DAD’s hull route; MS.6 combines Lefschetz, coefficients, trace and weights. Needs lines force generic bounded quotients before PBQ, PBQ and saturation before reconstruction, and reconstruction plus Lefschetz/weights before the finite-field conclusions. There is no freely ordered one-to-one run of source sections.

Source independence: 12 passages compared with 5 sources, no copied expression or reused material found; largest share TSU, 108 of 155 locator occurrences; contents compared with TSU: independent mathematical organisation, with the shared prerequisite order forced by the stated dependencies.

## Not verifiable

- DEJONG98, Proposition 6.4, and TSU98, Theorems 4.2.6 and 7.2.3, are settled uncertified manifest entries; their primary texts were not available in the supplied legal cache. They remain cited by locator, without a new request or a claim of direct textual certification. Their uses are explicit supplier contracts.
- The nine declared supplier interfaces are not implemented by this package. Acceptance checks their precision, ownership and declaration, not completion of future supplier work.

## Source issues

These are source defects, not package findings: the roadmap already states the corrected hypotheses, grades, coefficient base change or map direction.

- **Misprint** in TSU at Proposition 3.18, printed p. 16 (TSU line 872): the source says tensoring by any unit-root object preserves and reflects PBQ; it should require the unit-root factor to be nonzero; affects a stated result.
- **Misprint** in TSU at Theorem 3.19(1)–(2), printed pp. 16–17 (TSU lines 883, 886): the source says the decreasing maxima and bounded decomposition use nested filtration terms; it should use successive PBQ grades and their maximal-slope quotients; affects a stated result.
- **Misprint** in OHK at Corollary 5.12, printed p. 27 (OHK line 1350): the source says every quotient of an arbitrary module is PBQ; it should assume the original module is PBQ; affects a stated result.
- **Error** in TSU at proof of Lemma 7.11(3), printed p. 33 (TSU line 1706): the source says L tensor L splits into the embedding factors over K; it should extend the second factor to an algebraic closure, since L need not be normal; affects the proof.
- **Misprint** in TSU at proof of Proposition 7.12, printed p. 34 (TSU line 1767): the source says a scalar twist contributes λ in the n-th Frobenius trace; it should contribute λⁿ; affects the proof.
- **Misprint** in DAD at proof of Lemma 4.1.4, printed p. 12 (DAD line 455): the source says the induced hull itself equals the minimal-slope term; it should apply the minimal-slope operator to the induced hull; affects the proof.
- **Misprint** in TSU at proof of Corollary 6.8, printed p. 29 (TSU line 1493): the source says the reconstructed restriction map has target N; it should have target M; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "8f92ca6c1eae1d42b8d4ca29b35c661fe046cf5d", "job": "REV-PKG-PadicDifferentialEquationsAndRigidCohomologyPartII~8", "model": "gpt-6-astra", "worker": "chris-3"} -->
