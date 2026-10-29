# Port report: AlgebraicModuliForArithmeticGeometryPartII

Branch: `roadmap/algebraic-moduli-for-arithmetic-geometry-part-ii`.
Head commit: 83188b588aada52b5631cb3cd37cde5041b863a5.

The starting worktree was clean at `9c6e95d`. The requested branch name already pointed to an older main commit with no roadmap changes; it was reset to the verified base. Only `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometryPartII/{README.md,Suggested.lean,metadata.toml}` enters the commit. No push or GitHub write was performed.

## Draft pull request body

This roadmap extends AlgebraicModuliForArithmeticGeometry from parameter spaces and Picard sheafification to numerical Picard groups and contraction descent on arbitrary proper schemes. It builds relative numerical lattices and cones, the proper-field Picard scheme and its numerical local system, then proves positive-power descent, descent of projective contractions and surface fibre graphs, line-bundle lifting over complete discrete valuation rings, vertical numerical descent and independence of the Alexeev–Hacon–Kawamata rank. The general numerical and Picard theories retain nonreduced, disconnected and nonprojective proper schemes over arbitrary fields.

AI-assisted port and mathematical self-review by Codex (GPT-6). The accepted six supplier extensions remain explicit contracts; this port does not assert that they are implemented.

## Validation

Exact module build outcome: `Build completed successfully (9023 jobs).`
Warnings: **10**, all warnings that declarations use `sorry`; no other warnings or errors. The module has eight real-body definitions and ten admitted headline theorems, 323 lines. Its two individual Tau Ceti imports exist at the manifest pin and are used. There are no admitted data declarations, API-padding theorems or examples.

Exact push gate outcome:

```text
gate AlgebraicModuliForArithmeticGeometryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate's clean-worktree check necessarily ran after committing: before the commit every content counter was zero and only the three staged additions counted as dirty. This did not require any change to tooling or to the merge order.

The exact dependency-only output was:

```text
depcheck: 201 roadmaps, 1328 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The citation resolver, pointed explicitly at the worktree's pinned Lake packages, reported one lead, `Num.free_finiteRank`; it is a roadmap target in `TauCetiRoadmap/SchemeAndStackFoundations/README.md:7206`, with its statement at line 7220, and is correctly cited as a supplier target rather than as a pinned declaration.

## Accepted review notes and upstream-reader fixes

1. The accepted review's missing-carrier docstring note was already repaired in the supplied package: the file actually defines `IsProjectiveOver` using native homogeneous `Proj` and states projective contraction descent. It also states the fibre-graph and rational-residue-field headlines. All were retained; none was downgraded to an unstatable result.
2. Removed the KLE05 Theorem 6.16 citation from §1.3. Its projective-flat geometrically integral torsion-component statement does not establish arbitrary relative numerical rank. §1.3 retains BMP23 line 825 and its precise finite-point supplier contract. KLE05 line 2793 remains a source location for that narrower torsion-component theorem in the accepted source records.
3. Fixed the two doubled periods and joined PS12 to the references list, as the accepted review requested.
4. Replaced the dangling reference to a local `sources.toml`: the port deliberately contains only the three authorized files. All fourteen linked references, versions, theorem/page locators and source-line locators remain in the README; the source manifest remains read-only in `packages/AlgebraicModuliForArithmeticGeometryPartII/sources.toml`.
5. Made the lattice argument of §1.2 explicit about the intrinsic quotient Λ/ℓΛ. For Λ=2ℤ and ℓ=2 it has dimension 1, whereas the image of Λ inside ℤ/2 is zero. This prevents a false reading of “reduction modulo ℓ”; no theorem changed.
6. Made the regular-surface intersection convention in §4.3 explicit for §§4.5–4.6. The supplied relative pairing is degree over κ(z), and does not require a surface proper over a field. Added the witness that a κ(z)-rational node contributes relative degree 1 while its absolute k-degree is 2 when [κ(z):k]=2. The supplier is SchemeAndStackFoundations §5.9, particularly its relative pairing at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:7148`.
7. Promoted the proper-curve detection input inside §5.7's proof to an explicit quantified target: for every nonzero effective Cartier divisor on an integral proper variety over any field, some proper integral curve meeting but not contained in it has positive restricted degree. Its Chow-cover route and source, CT20 lines 667–702, remain explicit; no later roadmap is needed.
8. Expanded §0.1's nilpotent Check: a plane double line has Euler characteristics 1 and 3, whereas the split thickening of P¹ has 2 and 4. Both differences equal 2. This distinguishes the two schemes and verifies the claimed degree without confusing their Euler characteristics.
9. Removed a stray comma from the Picard-kernel convention.
10. Inserted the multiplication dot in both projection-formula occurrences in §0.6: without it, Markdown interpreted the residue-degree coefficient and following parentheses as a broken hyperlink. The formula and residue-degree factor are unchanged.

## What moved from Lean to README

Nothing. The accepted `Suggested.lean` already satisfies the acceptance-test rule at these pins and was copied unchanged. The package's eighteen actual declarations are eight definitions needed by its ten headlines. The supplied signature inventory's nineteenth item was a spurious name parsed from the words “theorem,” in a docstring; it was not a declaration and was not deleted from the source.

A full scratch copy with `#check @name` for every one of the eighteen declarations was elaborated. All eighteen printed signatures were compared with their README statements. No section binder was lost and no signature change was needed. In particular: properness remains on both numerical definitions and both lattice theorems; relative finiteness retains `IsNoetherian S`; the Galois predicate and its theorems retain the specified algebraic closure; torsion retains a prime p and algebraicity over ZMod p; the surface theorems retain smoothness, properness, pure dimension two, the canonical global-sections isomorphism, the actual contraction and structure-map equation; and lifting retains domain, DVR, maximal-ideal adic completeness, properness, flatness and actual H²-vanishing. The positive exponent precedes the universal quantifier over geometric line bundles. Graph isomorphisms retain their closure-of-image marking, and contraction descent retains both cartesian target and commuting source squares. The first scratch attempt imported the module, whose declarations are not exported by its module boundary; checking a complete scratch copy, as requested, resolves that visibility issue without changing the acceptance file.

## Suppliers, ownership and duplication

The roadmaps this one consumes that remain new-roadmap pull requests are:

- AlgebraicModuliForArithmeticGeometry: §§1.4–1.6, §2.1, Layer 3, §§7.3, 7.6.1–7.6.1a and 7.9.
- ComplexComparisonPartII: §§C3.2d.2, C3.2d.4, C3.2e and C3.2f.1–C3.2f.2.
- AbundanceStatement: Layers 4A–4D and Layer 5.
- ResolutionOfSingularitiesCharacteristicZero: §7.8.

Other suppliers are on main: SchemeAndStackFoundations, JacobianChallenge, StableReduction, AlgebraicVectorBundles and EtaleCohomologyFoundations. Their open revisions were not treated as dependencies. The citations were resolved against main for these five and against the indexed open heads for the four new roadmaps. In particular, the parent now locates `bigLineBundle` in §1.6 at line 935, `picard_infinitesimal_lifting` in §7.3, the rigidifications in §§7.6.1–7.6.1a and the components in §7.9; all statements consumed here remain there. ComplexComparisonPartII retains the universal-functions hypothesis in its relative representability theorem and projective-flat geometrically integral hypotheses for its torsion component. ResolutionOfSingularitiesCharacteristicZero §7.8 retains characteristic zero and projectivity. AbundanceStatement retains its characteristic-zero projective domain.

Read main models: `TauCetiRoadmap/AlgebraicVectorBundles/README.md`, `TauCetiRoadmap/PurityOfBranchLocus/README.md` and `Completed/OrthogonalL2Bases/README.md`; also compared the relevant open-head supplier prose. The detailed accepted layer structure was preserved: 51 numbered subsections, all with Needs lines and concrete Checks, and six layers each with Examples and Dependencies.

Object searches covered all indexed open roadmap heads and main, using the required roadmap grep/show tools, the board's package READMEs and the supplied sibling checkouts. Separate searches covered numerical equivalence, numerical lattices, Picard representability and torsion components, contractions and semiampleness, negative intersections and exceptional divisors, component/dual graphs, nef cones and bigness. Searches with truncated defaults were repeated with a limit of 5000. A separate search for every acceptance declaration name in all indexed Lean files returned no match. There is no duplicate fully qualified declaration name.

No new duplication removal or supplier replacement was necessary beyond the package's existing ownership boundaries. Those boundaries are retained only in Scope and ownership: imported curve degree, relative Spec, Stein factorization, abstract numerical quotients, matrix inequalities, projective characteristic-zero cone theory and the supplied surface numerical quotient are not restated as separate generic constructions. The retained variants differ explicitly: proper arbitrary-field Picard theory allows nontrivial finite constants and no universal functions; the numerical lattice allows arbitrary proper schemes; component graphs forget nodal loops and decorations; rigidity assumes the actual sheaf isomorphism and tests fibre curves; proper-algebraic-space ampleness extends the supplied scheme case. The doubled Picard lift is an application of the existing cokernel property, not an abstract quotient library. Enriques and K3 consumers request this extension rather than supply it. These distinctions explain this roadmap's ownership without creating a dependency on those later consumers.

## Pinned source audit

The manifest and checked-out sources agree: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`.

| Pinned source | Evidence and scope retained |
| --- | --- |
| `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:41` and line 82 | Properness extends separatedness, universal closedness and local finite type; the proper pullback second projection exists. Flatness and nonemptiness are absent. |
| `Mathlib/AlgebraicGeometry/Fiber.lean:37` | The fibre is the residue-field pullback, with the two projections at lines 40 and 46. |
| `Mathlib/AlgebraicGeometry/Noetherian.lean:277` | Noetherian means locally Noetherian plus compactness; relative finiteness keeps it. |
| `Mathlib/RingTheory/PicardGroup.lean:545` | Finite maximal spectrum implies the ring Picard group is subsingleton. |
| `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61` | The natural-valued total function alone does not imply module finiteness. |
| `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean:151` | Native Proj maps to Spec of the degree-zero subring; the definition then composes its K-structure map. |
| `Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean:88` | Native fibre rank; finite/flat/finite-presentation hypotheses are retained when invoking local constancy. |
| `Mathlib/FieldTheory/PurelyInseparable/Basic.lean:107` | The purely inseparable extension class is the native one. |
| `TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:70` | Euler degree is the difference of degree-two truncated Euler characteristics, with no implicit properness or finiteness assumption. The roadmap tests it only on proper curves. |
| `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/EulerCharacteristic.lean:303` and line 343 | Curve comparison and tensor additivity retain integral/local-DVR/coheight/properness and finite-dimensional H¹ assumptions. |
| `TauCeti/LinearAlgebra/Matrix/NegSemidef.lean:91` and line 104 | The semidefinite/radical inequalities exist; they do not construct a geometric fibre's intersection matrix. |
| `TauCeti/AlgebraicGeometry/Curves/StableReduction/NumericalType/Topology.lean:46` | The supplied graph is on a numerical type's component set, not irreducible components of a scheme. |
| `TauCeti/AlgebraicGeometry/Curves/StableReduction/NumericalType/IntersectionForm.lean:163` | The proper-subset negativity theorem exists; geometric realization remains a roadmap application. |
| `TauCeti/LinearAlgebra/SesquilinearForm/NumericalQuotient/Basic.lean` | Two radicals and their descended nondegenerate pairing are present. Identifying the geometric degree kernel remains the proper-scheme target. |

The two Tau Ceti imports, line-bundle classes, pullback functor and structure-sheaf cohomology were opened at the pin. Object searches in both pinned algebraic-geometry trees found the supplied curve and combinatorial numerical-type APIs, but no existing version of the proper-scheme numerical quotient, contraction or scheme-component graph defined here. No newer library API was substituted.

Literature checks reopened the versioned SCH23, KLE05, BMP23, HW23 and AHK07 PDFs, the CT20 v3 PDF through its unversioned URL (whose document explicitly identifies v3), and the relevant Stacks tags. The source-level proof step for vertical descent was read, not inferred from the lemma title: CT20 lines 667–702 uses a nonzero section on the zero-coefficient fibre component and a curve through its zero locus. The source's v3 errata concerns Theorem 2.30 and Proposition 3.2, not Lemma 2.17. AHK07 line 135's exceptional independence proof has the dimension-cut sign corrected in the accepted package: n−e−2, which gives 1 further cut at (n,e)=(4,1). The source's positive-rank statement is restricted to positive-dimensional varieties, with value 0 at a point in the roadmap. SCH23 line 191's zero-exponent possibility is excluded by the explicit d>0 condition. The strengthened rational-residue theorem has its own Hilbert-rigidity route and is not attributed to SCH23's weaker purely inseparable conclusion. Bibliographic links and exact locators are retained in the README, for example [SCH23](https://arxiv.org/pdf/2004.07025v3), [CT20](https://arxiv.org/pdf/1706.04845), [AHK07](https://arxiv.org/pdf/math/0605137v2) and [Stacks 0C66](https://stacks.math.columbia.edu/tag/0C66).

## Adversarial mathematics pass

The table gives one row for each individual assertion tested, with separate rows for the API laws, definitions and conventions rather than one verdict for a whole layer. Computed instances are evidence against mistaken formulations, not proofs of the general admitted theorems. All pairings use χ(L)−χ(O), and all residue-degree changes retain their stated ground field. The finite-field point counts, matrix quadratic values, degree signs, blow-up intersections and intrinsic/ambient lattice reduction witness were independently recomputed; the other values are the displayed small mathematical calculations. No computational procedure was added to the roadmap.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: universes and empty proper schemes | ∅ and Spec k | Num(∅)=0, graph vertices=0; Num(Spec k)=0, graph vertices=1 | consistent with stated hypotheses | retain |
| Conventions: curve and surface dimensions | P⁰, P¹, P² | dimensions 0,1,2; only P¹ is a curve, only P² a surface | consistent with stated hypotheses | retain |
| Conventions: degree sign | P¹ with O(−1),O,O(1) | χ=0,1,2; χ−χ(O)=−1,0,1 | consistent with stated hypotheses | retain |
| Conventions: restriction of scalars | P¹_ℂ over ℝ | 4−2=2=2·(2−1) | consistent with stated hypotheses | retain |
| Conventions: full field base change | P¹_ℂ over ℝ extended to ℂ | degree 2=1+1 on two components | consistent with stated hypotheses | retain |
| Conventions: nilpotent multiplicities | plane double line versus split double P¹ | 3−1=2 and 4−2=2, despite χ(O)=1 versus 2 | consistent with stated hypotheses | expanded §0.1 Euler witness |
| Conventions: positive tensor exponent | swap action on ℤ² | d(1,0)=(d,0) differs from (0,d) for d>0; both are (0,0) for d=0 | consistent with stated hypotheses | retain |
| Conventions: Cartier denominator | D=H/2 on P¹ | 2D has degree 1; D-degree=1/2; denominator 0 would be undefined | consistent with stated hypotheses | retain |
| Conventions: real topology after finite rank | P¹ and point | N¹=ℝ and 0, finite dimensions 1 and 0 | consistent with stated hypotheses | retain |
| Conventions: contractions retain source and base | id_X and projection P¹×P¹→P¹ | identity equation id∘id=id; projection equation pr₁=pr₁ | consistent with stated hypotheses | retain |
| Mathlib properness contract | Spec ℂ→Spec ℝ and ∅→Spec k | both proper; H⁰=ℂ versus ℝ and 0 versus k, so neither is a contraction | consistent with stated hypotheses | retain |
| Mathlib semilocal Picard contract | k, k×k, k[ε]/ε² | Pic=0 in all three, although maximal-point counts are 1,2,1 | consistent with stated hypotheses | retain |
| Mathlib total finrank warning | infinite free module and zero module | both natural-valued finranks can be 0; only zero module has dimension 0 | consistent with stated hypotheses | retain |
| Tau Ceti truncated Euler-degree contract | P¹ and Spec k | O(1) gives 2−1=1 on P¹; any line on point gives 1−1=0 | consistent with stated hypotheses | retain |
| Tau Ceti quotient pairing contract | pairing (a,b)·(c,d)=ad+bc | radicals 0; basis pairings (0,1),(1,0), determinant −1 | consistent with stated hypotheses | retain |
| Tau Ceti matrix sign contract | [[-2,2],[2,-2]] at (1,0),(1,1) | quadratic values −2 and 0; radical generated by (1,1) | consistent with stated hypotheses | retain |
| Supplier Leray direction | Spec ℂ→Spec ℝ and id_Spec ℝ | degree-two edge 0→0 and ℤ/2→ℤ/2 identity | consistent with stated hypotheses | retain |
| Supplier abelian Galois dictionary | C₃ and S₃ | 1+2=2+1=0 mod3; (12)(23)=(123) ≠ (132)=(23)(12) | consistent with stated hypotheses | retain |
| Supplier relative intersection convention | node over κ(z), [κ(z):k]=2 | relative degree 1, absolute degree 2=2·1 | consistent with stated hypotheses | explicit pairing convention and Check |
| Supplier cohomological finiteness | P¹ and point over algebraically closed k, ℓ≠char k | dim H²(μℓ)=1 and 0; numerical ranks 1 and 0 | consistent with stated hypotheses | retain |
| Gap: relative exceptional-degree witnesses | three separate rational blow-ups of P² | exceptional degree matrix diag(−1,−1,−1), determinant −1 | consistent with stated hypotheses | retain |
| Gap: projective nef-and-big criterion | P¹ O(1), P¹ O, dimension-zero point | top degrees 1,0,1; section growth m+1,1,1 | consistent with stated hypotheses | retain |
| Gap: finite-point numerical detection | P¹⊔P¹ over one point with O(1)⊔O(−1) | component degrees 1,−1 versus 0,0; total Euler polynomials both 2n+2 | consistent with stated hypotheses | retain |
| Gap: proper bigness comparison | blow-up π of P² and O(1) | h⁰ before=after=binom(m+2,2), difference 0≤C·m | consistent with stated hypotheses | retain |
| Gap: proper Picard nonflat descent | Spec k[ε]/ε² and nodal rational curve | Picard groups 0 and G_m on geometric degree-zero components | consistent with stated hypotheses | retain |
| Gap: proper Hilbert tangent | exceptional P¹ with normal O(−1) | Hom(I,O)=H⁰(O(−1))=0; ruling with O normal has h⁰=1 | consistent with stated hypotheses | retain |
| 0.1 relative curve pairing definition | P¹ over κ(s), O(m), m=−1,0,1 | pairings −1,0,1, all over κ(s) | consistent with stated hypotheses | retain |
| 0.1 tensor additivity | P¹ O(2)⊗O(−1) | degree 1=2+(−1) | consistent with stated hypotheses | retain |
| 0.1 inverse degree | P¹ O(2) dual | −2=−degree O(2) | consistent with stated hypotheses | retain |
| 0.1 first-Chern comparison | point divisor on P¹ | deg O(point)=1=c₁(O(1))∩[P¹] | consistent with stated hypotheses | retain |
| 0.1 component-cycle law | double plane line | degree 2=generic length 2 times reduced-line degree 1 | consistent with stated hypotheses | expanded §0.1 Euler witness |
| 0.1 zero-dimensional contribution | Spec k[ε]/ε² | χ(L)−χ(O)=2−2=0 | consistent with stated hypotheses | retain |
| 0.1 finite-map projection formula | degree-two P¹ map and O(1) | pullback degree 2=2·1 | consistent with stated hypotheses | retain |
| 0.2 geometric component factor | P¹_ℂ/ℝ | m=1,r=2,d_C=2, base degree 2=2·1 | consistent with stated hypotheses | retain |
| 0.2 inseparable component factor | k=F_p(t), constants k(t^(1/p)) | m=p,r=1,d_C=p, base degree p=p·1 | consistent with stated hypotheses | retain |
| 0.2 distinction from arithmetic index | pointless real conic | geometric m=r=d_C=1; closed-point index 2 and generator degree 2 | consistent with stated hypotheses | retain |
| 0.3 numerical-triviality iff after extension | P¹_ℝ O(−1),O,O(1) | degrees −1,0,1 on both fields, zero iff m=0 in both directions | consistent with stated hypotheses | retain |
| 0.3 transcendental-curve spreading route | generic line in P² over k(u) | O(1)-degree 1 before specialization and 1 after | consistent with stated hypotheses | retain |
| 0.4 absolute NumericallyTrivial definition | P¹ O, O(1) | degrees 0 and 1, giving true and false | consistent with stated hypotheses | retain |
| 0.4 relative predicate and class invariance | pr₁ on P¹×P¹, O(a,b) | fibre degree b; changing a leaves b unchanged | consistent with stated hypotheses | retain |
| 0.4 absolute/relative structure-map agreement | P¹→Spec k | unique fibre P¹; same degree m=m | consistent with stated hypotheses | retain |
| 0.4 subgroup identity | O on P¹ | degree 0, class 1 | consistent with stated hypotheses | retain |
| 0.4 subgroup tensor and inverse | degree-zero elliptic bundles L,M | deg(L⊗M)=0+0=0, deg L⁻¹=−0=0 | consistent with stated hypotheses | retain |
| 0.4 pullback from base | pr₁ and O(a) | O(a,0) has fibre degree 0 | consistent with stated hypotheses | retain |
| 0.4 closed-point characterization | P¹_R O(m) | special degree m; generic degree m, both vanish iff m=0 | consistent with stated hypotheses | retain |
| 0.4 geometric-fibre characterization | real conic O(generator) | base degree 2 and geometric degree 2, both nonzero | consistent with stated hypotheses | retain |
| 0.4 base-change preservation | O(a,0) on P¹×P¹ | fibre degrees 0 before and after extension | consistent with stated hypotheses | retain |
| 0.4 closed restriction | O on P² restricted to a line and a point | degrees 0 and 0 | consistent with stated hypotheses | retain |
| 0.4 surface supplier comparison | split P¹×P¹ with O(a,b) | pairings with rulings b,a; zero iff (a,b)=(0,0) | consistent with stated hypotheses | retain |
| 0.4 numerical versus actual triviality | elliptic O(p−q), p≠q | degree 1−1=0 while Picard class p−q≠0 | consistent with stated hypotheses | retain |
| 0.5 closed-point detection | P¹_R O(−1),O,O(1) | special and generic values −1,0,1 | consistent with stated hypotheses | retain |
| 0.5 generic-only negative control | Bl_x(P¹_R), O(E) | generic degree 0, exceptional special degree −1 | consistent with stated hypotheses | retain |
| 0.6 proper surjective pullback iff | normalization of nodal cubic and degree-m bundle | degree m=m, zero iff m=0 on both curves | consistent with stated hypotheses | retain |
| 0.6 contracted-curve case | Bl_p P² pullback O(1) | degree 0 on E, degree 1 on strict transform of line avoiding p | consistent with stated hypotheses | retain |
| 1.1 numerical quotient definition | P¹, elliptic curve, id_S | quotients ℤ,ℤ,0 although elliptic Pic⁰≠0 | consistent with stated hypotheses | retain |
| 1.1 generated subgroup equals numerical kernel | P¹ with degree map | kernel 0, subgroup generated by kernel 0 | consistent with stated hypotheses | retain |
| 1.1 two structure-map subgroups agree | P¹→Spec k | both degree kernels 0 | consistent with stated hypotheses | retain |
| 1.1 equality of quotient classes | O(2) and O(1) on P¹ | difference degree 1, unequal; O(p−q) versus O on E has difference 0, equal | consistent with stated hypotheses | retain |
| 1.1 descended degree pairing | elliptic L of degree zero and O(p) | quotient classes 0 and 1 pair as 0 and 1 | consistent with stated hypotheses | retain |
| 1.1 torsion-freeness | degree n·m on P¹ with n=2 | 2m=0 iff m=0; canonical order-two Enriques class maps to 0 | consistent with stated hypotheses | retain |
| 1.1 rational/real scalar extension injections | Num(P¹)=ℤ | 1 maps to 1 in ℚ and ℝ, not 0 | consistent with stated hypotheses | retain |
| 1.1 pullback identity/composition | P¹ maps of degrees 2 and 3 | id*=1, composite degree 6=3·2 | consistent with stated hypotheses | retain |
| 1.1 surjective-pullback injectivity | degree-two P¹ map | ℤ→ℤ is m↦2m, kernel 0 | consistent with stated hypotheses | retain |
| 1.1 field-extension injectivity | pointless real conic | integral image 2ℤ⊂ℤ, kernel 0 | consistent with stated hypotheses | retain |
| 1.1 Q-Cartier representative independence | D=H/2 represented by 2D=H and 4D=2H | 1/2=(1/4)·2 | consistent with stated hypotheses | retain |
| 1.1 supplied smooth surface quotient | P¹×P¹ | Num=ℤ² with matrix [[0,1],[1,0]], same pairing in both descriptions | consistent with stated hypotheses | retain |
| 1.2 absolute finite freeness | P⁰,P¹,P² | Num=0,ℤ,ℤ of ranks 0,1,1 | consistent with stated hypotheses | retain |
| 1.2 geometric-rank inequality | real nonsplit quadric surface | rank over ℝ 1≤geometric rank 2 | consistent with stated hypotheses | retain |
| 1.2 Kummer rank bound | P¹ and point | ρ=1≤1=dim H²(μℓ); ρ=0≤0 | consistent with stated hypotheses | retain |
| 1.2 intrinsic reduction in rank proof | Λ=2ℤ inside ℤ, ℓ=2 | Λ/2Λ=2ℤ/4ℤ has dimension 1; ambient mod2 image has dimension 0 | consistent with stated hypotheses | clarified intrinsic quotient in §1.2 |
| 1.2 elliptic-product ranks | End(E) ranks 1,2,4 | ρ(E×E)=2+rank End(E)=3,4,6 | consistent with stated hypotheses | retain |
| 1.3 relative finite freeness | P¹×P¹ over k and over first P¹ | free ranks 2 and 1 | consistent with stated hypotheses | retain |
| 1.3 relative Picard number zero case | id_S | Num=0, N¹=0, ρ=0 | consistent with stated hypotheses | retain |
| 1.3 Noetherian negative control | bounded integer sequences on βℕ | unit sequences e_n are linearly independent for arbitrarily many n | consistent with stated hypotheses | retain |
| 1.3 reducible Euler-polynomial negative control | O(p)⊔O(−p) on disjoint P¹ | χ=2n+2 for all p, degrees (p,−p) nonzero at p=1 | consistent with stated hypotheses | retain |
| 1.4 real cycle quotient | P¹×P¹ | two ruling classes yield ℝ²; id_S has no curves and yields 0 | consistent with stated hypotheses | retain |
| 1.4 bilinear pairing | O(a,b), cycle u[ruling₁]+v[ruling₂] | value bu+av, e.g. (1,2),(3,4) gives 10 | consistent with stated hypotheses | retain |
| 1.4 perfect duality | P¹×P¹ | pairing matrix determinant −1, both kernels 0 | consistent with stated hypotheses | retain |
| 1.4 effective and closed cones | P¹×P¹ and id_S | cones ℝ≥0² and {0}; both closed in these cases | consistent with stated hypotheses | retain |
| 1.4 cone-closure distinction | E×E, rank-one irrational matrix A | det A=0, no rational generator; det(A+I)=4, det(A+I/2)=7/4 | consistent with stated hypotheses | retain |
| 1.4 cycle pushforward/projection formula | degree-two P¹ map, O(1) | pushforward [P¹]↦2[P¹]; pairing 2=2 | consistent with stated hypotheses | retain |
| 1.5 nef definition on curve classes | P¹ O(−1),O,O(1) | degrees −1,0,1; nef false,true,true | consistent with stated hypotheses | retain |
| 1.5 dual closed convex cone | P¹×P¹ | dual of ℝ≥0² under off-diagonal pairing is ℝ≥0² | consistent with stated hypotheses | retain |
| 1.5 class membership iff nef | O(1,−1) and O(0,1) | pairs include −1 and 0,1; first false, second true | consistent with stated hypotheses | retain |
| 1.5 addition and positive scaling | P¹ classes 1 and 2 | 1+2=3≥0, 2·1=2≥0, zero class=0≥0 | consistent with stated hypotheses | retain |
| 1.5 pullback and surjective detection | degree-two P¹ map | degree −1 pulls to −2, degree 1 to 2; signs unchanged | consistent with stated hypotheses | retain |
| 1.5 geometric detection | real conic | generator degree 2 before and 2 after, nef on both | consistent with stated hypotheses | retain |
| 1.5 projective-supplier comparison | P¹×P¹ O(a,b) | both predicates require a≥0,b≥0 | consistent with stated hypotheses | retain |
| 1.6 section-growth bigness definition | P¹ O(1), O and P⁰ O | h⁰=m+1,1,1 with dimensions 1,1,0 | consistent with stated hypotheses | retain |
| 1.6 nef top-intersection criterion | P¹×P¹ O(1,1),O(1,0) | squares 2 and 0; h⁰=(m+1)² versus m+1 | consistent with stated hypotheses | retain |
| 1.6 positive-power invariance | P¹ O(1) and O(2) | h⁰=m+1 and 2m+1, both linear growth | consistent with stated hypotheses | retain |
| 1.6 integral field-extension invariance | P¹ O(1) over ℝ and ℂ | h⁰=m+1 on both fields | consistent with stated hypotheses | retain |
| 1.6 comparison with parent big predicate | P² O(1) | both use binom(m+2,2) with leading coefficient 1/2 | consistent with stated hypotheses | retain |
| 1.6 birational invariance | Bl_p P² pullback O(1) | h⁰=binom(m+2,2) on each side | consistent with stated hypotheses | retain |
| 1.6 numerical invariance of projective bigness | elliptic bundles of degree 1 | h⁰(L^m)=m for m≥1 on both numerical representatives | consistent with stated hypotheses | retain |
| 2.1 proper Picard representability | P¹ | components indexed by ℤ, degree-zero component a point | consistent with stated hypotheses | retain |
| 2.1 arbitrary constants | P¹_ℂ over ℝ | rational Picard ℤ, geometric Picard ℤ² with swap | consistent with stated hypotheses | retain |
| 2.1 nonreduced representability check | Spec k[ε]/ε² | Pic on local test rings 0; H⁰ has k-dimension 2 | consistent with stated hypotheses | retain |
| 2.1 component gluing | irreducible nodal rational curve | Pic⁰=G_m, tangent dimension 1 rather than 0 | consistent with stated hypotheses | retain |
| 2.2 affinization definition and finite constants | P¹, P¹⊔P¹ | B=k and k×k, dimensions 1 and 2 | consistent with stated hypotheses | retain |
| 2.2 base-change of constants | P¹_ℂ/ℝ extended to ℂ | ℂ⊗ℝℂ=ℂ×ℂ, dimensions 2 over ℂ | consistent with stated hypotheses | retain |
| 2.2 units Weil restriction | two disjoint P¹ | units A××A× on any A | consistent with stated hypotheses | retain |
| 2.2 affinization contraction | P¹×Spec k[ε]/ε² | H⁰=k[ε]/ε²; canonical map to these constants gives identity on H⁰ | consistent with stated hypotheses | retain |
| 2.2 affine universal property | Spec B with finite B | affinization id_Spec B; ring maps B→B unchanged | consistent with stated hypotheses | retain |
| 2.2 nilpotent unit preservation | (1+εa)(1+εb) | product 1+ε(a+b), inverse 1−εa | consistent with stated hypotheses | retain |
| 2.3 finite étale pushforward and Leray | Spec ℂ→Spec ℝ | H²(ℝ,h_*G_m)=Br(ℂ)=0 | consistent with stated hypotheses | retain |
| 2.3 nilpotent Brauer invariance | ℝ[ε]/ε² | H²=Br(ℝ)=ℤ/2 on both sides | consistent with stated hypotheses | retain |
| 2.3 product and torsion | ℝ×ℝ | H²=(ℤ/2)²; (1,0) has order 2 | consistent with stated hypotheses | retain |
| 2.3 degree-one vanishing | finite semilocal R=k×k | Pic(R)=0=H¹(k,h_*G_m) | consistent with stated hypotheses | retain |
| 2.4 Picard injection | pointless real conic | 2ℤ→ℤ is injective with cokernel ℤ/2 | consistent with stated hypotheses | retain |
| 2.4 obstruction killed by positive multiple | real conic degree-one sheaf point | obstruction 1 mod2; doubled obstruction 0 | consistent with stated hypotheses | retain |
| 2.4 arbitrary-field injectivity | P¹_ℂ over ℝ | Pic=ℤ=Picard(ℝ), identity inclusion | consistent with stated hypotheses | retain |
| 2.5 τ-component definition by positive multiples | classical Enriques | Pic⁰=0, 2·canonical=0, τ=ℤ/2 | consistent with stated hypotheses | retain |
| 2.5 finite type and open/closed | P¹ | τ is degree-zero point among discrete ℤ components | consistent with stated hypotheses | retain |
| 2.5 field-base-change compatibility | elliptic E | τ=Pic⁰=E, geometric dimension 1 on both sides | consistent with stated hypotheses | retain |
| 2.5 numerical membership iff | P¹ O(m) | τ membership iff m=0 iff degree m=0 | consistent with stated hypotheses | retain |
| 2.5 full nonreduced structure | ordinary characteristic-two Enriques | μ₂=k[t]/((t−1)²) has length 2 but one geometric point | consistent with stated hypotheses | retain |
| 2.6 numerical local-system quotient definition | P¹ | ℤ/0=ℤ, étale constant | consistent with stated hypotheses | retain |
| 2.6 abelian Galois dictionary | constant C₃ in characteristic 3 | three reduced points, addition 1+2=0; unlike μ₃ of length 3 with one point | consistent with stated hypotheses | retain |
| 2.6 geometric lattice rank | P¹_ℂ/ℝ | geometric lattice ℤ², swap matrix [[0,1],[1,0]] | consistent with stated hypotheses | retain |
| 2.6 separable versus algebraic closure points | purely inseparable constants extension | one geometric reduced component, rank 1 on both closures | consistent with stated hypotheses | retain |
| 2.6 Num(k) injection | pointless real conic | 2ℤ⊂ℤ, index 2 | consistent with stated hypotheses | retain |
| 2.6 field-base-change sheaf comparison | P¹_ℂ/ℝ extended to ℂ | swap local system becomes constant ℤ² | consistent with stated hypotheses | retain |
| 2.6 functorial pullback and injectivity | degree-two P¹ map | local lattice map m↦2m, kernel 0 | consistent with stated hypotheses | retain |
| 2.7 actual semilinear action predicate | swap on two P¹ versus P¹ | swap sends (1,0)→(0,1) unequal; P¹ generator 1→1 | consistent with stated hypotheses | retain |
| 2.7 constant group-scheme iff | P¹ and finite scheme | trivial lattice actions on ℤ and 0, ranks 1 and 0 | consistent with stated hypotheses | retain |
| 2.7 finite-index criterion | real conic and P¹_ℂ/ℝ | index 2 in ℤ versus diagonal rank1 in ℤ², infinite index | consistent with stated hypotheses | retain |
| 2.7 preservation by field extension | split P¹×P¹ | identity matrix I₂ remains I₂ | consistent with stated hypotheses | retain |
| 2.7 separably closed field | purely inseparable constants example | automorphism group action identity on rank1 lattice | consistent with stated hypotheses | retain |
| 2.8 norm homomorphism | degree-two constants extension, P¹ O(a),O(b) | 2(a+b)=2a+2b | consistent with stated hypotheses | retain |
| 2.8 norm after pullback | degree n=2, O(1) | norm degree 2=2·1, not 1 | consistent with stated hypotheses | retain |
| 2.8 τ preservation | elliptic degree-zero class | norm degree sum 0+0=0 | consistent with stated hypotheses | retain |
| 2.8 line-bundle norm comparison | P¹_E→P¹_k, O(d) | norm O(d)=O(nd), d=−1 gives −n | consistent with stated hypotheses | retain |
| 2.8 norm tower composition | degrees 2 then 3 | total scalar 6=2·3 | consistent with stated hypotheses | retain |
| 2.9 split τ-torsor killed by extension degree | P¹ τ=0 and real conic | torsor class 0, n·0=0 for n=1,2 | consistent with stated hypotheses | retain |
| 2.9 positive multiple lifts sheaf point | conic numerical generator l | 2l lifts; l already a Picard-sheaf point, while actual bundle requires even degree | consistent with stated hypotheses | retain |
| 2.10 uniform positive-power iff | P¹ | d=1, classes m=−1,0,1 each descend unchanged | consistent with stated hypotheses | retain |
| 2.10 converse and exponent-zero negative control | swap lattice ℤ² | d(1,0) outside diagonal for d≥1; d=0 yields (0,0) inside | consistent with stated hypotheses | retain |
| 2.10 uniform obstruction exponent | pointless real conic | image 2ℤ, d=2 works for every m, d=1 fails at m=1 | consistent with stated hypotheses | retain |
| 2.10 empty and finite cases | ∅, Spec k[ε]/ε² | Num=0, d=1 works, no rank positivity assumed | consistent with stated hypotheses | retain |
| 2.11 doubled Picard lift construction | ℤ/4→ℤ/2 | d(1)=2 mod4, projection gives 0=2 mod2 | consistent with stated hypotheses | retain |
| 2.11 first doubling identity | same example at q=1,2 | dπ(1)=2=[2](1); dπ(2)=0=[2](2) | consistent with stated hypotheses | retain |
| 2.11 second doubling identity | same example at n=1 | πd(1)=0=[2](1) | consistent with stated hypotheses | retain |
| 2.11 uniqueness | maps ℤ/2→ℤ/4 with dπ=[2] | generator forced to 2, not 0 | consistent with stated hypotheses | retain |
| 2.11 naturality/base-change | P=0 and identity morphism of sequence | d(n)=2n; id(2n)=2id(n) | consistent with stated hypotheses | retain |
| 2.11 wrong-kernel negative control | ℤ/8→ℤ/2 | kernel generator 2 doubles to 4≠0, so doubling cannot factor | consistent with stated hypotheses | retain |
| 2.12 finite-field rational τ finiteness | E/F₂: y²+y=x³ | affine counts 2,0 plus infinity give order 3 | consistent with stated hypotheses | retain |
| 2.12 algebraic-finite-field torsion | E/F₃: y²=x³−x | affine counts 1,1,1 plus infinity give order 4 | consistent with stated hypotheses | retain |
| 2.12 characteristic-zero negative control | nontorsion degree-zero elliptic class | degree 0 but nP≠0 for every n≥1 | consistent with stated hypotheses | retain |
| 3.1 contraction definition on opens | id_X and P¹→Spec k | section maps identities; H⁰(P¹,O)=k→k | consistent with stated hypotheses | retain |
| 3.1 surjectivity | Bl_p P²→P² | one point outside centre maps identically, centre has exceptional P¹≠∅ | consistent with stated hypotheses | retain |
| 3.1 geometric connectedness | pr₁ P¹×P¹→P¹ | each geometric fibre P¹, component count 1 | consistent with stated hypotheses | retain |
| 3.1 composites and isomorphisms | P¹×P¹→P¹→Spec k | H⁰ maps k→k→k, composite identity | consistent with stated hypotheses | retain |
| 3.1 flat base change | P¹_ℝ→Spec ℝ extended to ℂ | H⁰ map ℂ→ℂ identity | consistent with stated hypotheses | retain |
| 3.1 Stein factorization | P¹_ℂ→Spec ℝ | constants ℂ, factor P¹_ℂ→Spec ℂ→Spec ℝ of finite degree 2 | consistent with stated hypotheses | retain |
| 3.1 structure-map contraction iff constants k | P¹_k and P¹_ℂ/ℝ | H⁰=k and ℂ, giving true and false | consistent with stated hypotheses | retain |
| 3.1 finite birational negative control | cusp normalization | section inclusion k[t²,t³]⊊k[t], t missing | consistent with stated hypotheses | retain |
| 3.2 curve rigidity and unique factorization | Bl_p P² with g=blow-down versus g=id | first factors with h=id; second maps E of dimension1 to itself and cannot factor | consistent with stated hypotheses | retain |
| 3.3 relative semiampleness definition | pr₁ and O(a,0) | f*f_*L→L is an isomorphism locally, exponent 1 | consistent with stated hypotheses | retain |
| 3.3 section-ring construction | P¹ O(1) | degree-t piece dimension t+1, ring k[x₀,x₁] | consistent with stated hypotheses | retain |
| 3.3 positive-power iff | P¹ O(1),O(2),O(−1) | generated degrees 1,2; negative powers have h⁰=0 | consistent with stated hypotheses | retain |
| 3.3 semiample implies nef | P¹ O(1) and blow-up O(E) | degrees 1≥0 versus E-degree −1, excluding O(E) | consistent with stated hypotheses | retain |
| 3.3 pullback of semiampleness | pr₁ pullback O(1) | O(1,0) has two generating sections | consistent with stated hypotheses | retain |
| 3.3 field-extension detection | P¹_ℝ O(1) | h⁰=2 over ℝ and ℂ, both evaluations surjective | consistent with stated hypotheses | retain |
| 3.3 positive power pulled back from base | torsion L of order n | L^n=O=f*O, so exponent n works | consistent with stated hypotheses | retain |
| 3.3 projective characteristic-zero supplier | P¹ O(m) | semiample iff m≥0 in both interfaces | consistent with stated hypotheses | retain |
| 3.3 nef-not-semiample control | elliptic nontorsion degree-zero L | all L^m nontrivial, h⁰=0 for m>0 | consistent with stated hypotheses | retain |
| 3.4 semiample contraction and curve criterion | P¹×P¹ O(1,0) | degrees on rulings 0,1; first ruling contracted, second not | consistent with stated hypotheses | retain |
| 3.4 every projective contraction from a sheaf | id_P¹ and O(1) | Proj k[x₀,x₁]=P¹, resulting map id | consistent with stated hypotheses | retain |
| 3.4 section ring/base-change compatibility | P¹ O(1) | degree-t dimensions t+1 before and after extension | consistent with stated hypotheses | retain |
| 3.4 numerical uniqueness | elliptic O(p),O(q) of degree 1 | both ample, contractions identities, despite p≠q | consistent with stated hypotheses | retain |
| 3.5 finite field of definition | id_P¹ over algebraic closure | field k already suffices, source equation id=id | consistent with stated hypotheses | retain |
| 3.6 purely inseparable contraction descent | identity extension and projection P¹×P¹→P¹ | descended target P¹ and map pr₁, both squares identity-base-change squares | consistent with stated hypotheses | retain |
| 3.6 separable negative control | P¹_ℂ/ℝ with one component collapsed over ℂ | component dimensions in target 0,1 exchanged by conjugation, unequal | consistent with stated hypotheses | retain |
| 3.7 IsProjectiveOver definition | Spec K and ∅ | closed immersion into P⁰, n=0 in both cases | consistent with stated hypotheses | retain |
| 3.7 projective stability under closed immersion | degree-two point Spec ℂ in P¹_ℝ | closed locus x²+y²=0, residue degree 2; no closed immersion into P⁰_ℝ | consistent with stated hypotheses | retain |
| 3.7 projective implies proper | affine line | dimension1 affine line fails valuative properness, so no closed projective immersion | consistent with stated hypotheses | retain |
| 3.7 projectivity descends by field extension | pointless real conic | geometric P¹, conic embeds in P²_ℝ as degree2 curve | consistent with stated hypotheses | retain |
| 3.7 projectivity preserved by extension | P¹_ℝ→P¹_ℂ | n=1 immersion id on both sides | consistent with stated hypotheses | retain |
| 3.7 prescribed structure-map negative control | shift σ on ℚ(t₁,t₂,…) | K/σ(K)=σ(K)(t₁) not finitely generated as algebra; identity structure uses n=0 | consistent with stated hypotheses | retain |
| 3.7 constant-Num contraction descent | P¹×P¹ over k | Num=ℤ² with identity action; geometric pr₁ descends to pr₁, fibre degrees 0,1 | consistent with stated hypotheses | retain |
| 3.8 neighbourhood ampleness | P¹×Y, O(1) versus O | fibre degrees 1 versus 0, locus Y versus ∅ | consistent with stated hypotheses | retain |
| 3.8 universal ample locus | pullback along Y′→Y for previous two bundles | factorization through Y always, through ∅ only for Y′=∅ | consistent with stated hypotheses | retain |
| 4.1 graph definition | disjoint P¹, meeting lines, irreducible P¹ | vertex/edge counts (2,0),(2,1),(1,0) | consistent with stated hypotheses | retain |
| 4.1 adjacency symmetry/irreflexivity | two meeting lines A,B | Adj(A,B)=Adj(B,A)=true, Adj(A,A)=false | consistent with stated hypotheses | retain |
| 4.1 component vertex map and identity/composition | identity of pair of lines | vertices A→A,B→B, composite identity | consistent with stated hypotheses | retain |
| 4.1 edges map to edges or vertices | real x²+y²=0 extended to ℂ | edge between two lines maps to one vertex | consistent with stated hypotheses | retain |
| 4.1 arbitrary vertex bijection need not reflect edges | normalization of two meeting projective lines | vertex counts 2→2, edges 0→1 | consistent with stated hypotheses | retain |
| 4.1 field-extension component map | P¹_ℂ/ℝ | two geometric vertices map to one schematic vertex | consistent with stated hypotheses | retain |
| 4.1 base-change vertex bijection reflects adjacency | two split meeting lines | two vertices and one edge on both sides | consistent with stated hypotheses | retain |
| 4.2 constant Num iff marked graph descent | P¹_ℂ/ℝ versus two split meeting lines | swap ℤ² nonconstant and 2→1 vertices; identity ℤ² constant and (2,1)→(2,1) | consistent with stated hypotheses | retain |
| 4.2 empty scheme boundary | ∅ | Num=0, vertex counts 0→0, unique empty graph isomorphism | consistent with stated hypotheses | retain |
| 4.2 purity negative control | P¹_ℝ⊔Spec ℂ | Num=ℤ constant, vertex counts 3→2, zero-dimensional component violates purity | consistent with stated hypotheses | retain |
| 4.2 marking excludes arbitrary graph automorphism | split disjoint P¹ | projection sends first→first; swap sends first→second≠first | consistent with stated hypotheses | retain |
| 4.2 nonreduced/inseparable curves | double P¹ and inseparable constants of degree p | one vertex in each; reduced curve O(1)-degree1, full degrees2 and p | consistent with stated hypotheses | retain |
| 4.3 intersection matrix definition | two lines P² | matrix [[1,1],[1,1]], symmetric with eigenvalues 2,0 | consistent with stated hypotheses | retain |
| 4.3 negative-definite convention | rational blow-up E | matrix [−1], negative has [1] positive definite | consistent with stated hypotheses | retain |
| 4.3 edge labels | two lines P² and smooth fibre | one edge of label1 versus no edges and square0 | consistent with stated hypotheses | retain |
| 4.3 positivity iff adjacency | disjoint exceptional curves versus meeting lines | mutual degrees 0 versus 1 | consistent with stated hypotheses | retain |
| 4.3 full-divisor base-change invariance | degree-two blow-up centre over ℝ | −2=−1+0+0−1 over ℂ | consistent with stated hypotheses | retain |
| 4.3 absolute restriction of scalars | P²_ℂ as ℝ-scheme | line intersection2 over ℝ=2·1 over ℂ | consistent with stated hypotheses | retain |
| 4.3 inseparable multiplicities | p-fold Cartier lines | full local degree p²=p·p·1, reduced supports intersect in 1 | consistent with stated hypotheses | retain |
| 4.4 point contraction alternative | P²→Spec k | target dimension0, H⁰=k, structure map contraction | consistent with stated hypotheses | retain |
| 4.4 birational alternative | Bl_p P²→P² | target dimension2, function-field degree1 | consistent with stated hypotheses | retain |
| 4.4 fibre-type alternative | P¹×P¹→P¹ | target dimension1, fibres P¹ connected and flat | consistent with stated hypotheses | retain |
| 4.5 exceptional negativity | rational and degree-two blow-up centres | matrices [−1] and [−2]; both negative | consistent with stated hypotheses | retain |
| 4.5 A_n sign | A₁ and A₂ | [−2] and [[−2,1],[1,−2]], determinant3 and value −2 at (1,1) | consistent with stated hypotheses | retain |
| 4.6 off-diagonal positivity | I₂ fibre | C₁·C₂=2>0, two nodes | consistent with stated hypotheses | retain |
| 4.6 full-fibre orthogonality | I₂, m=(1,1) | N m=(0,0) | consistent with stated hypotheses | retain |
| 4.6 semidefinite form and radical | I₂ at (1,0),(1,1),(2,−1) | values −2,0,−18; vanishes precisely on (a,a) | consistent with stated hypotheses | retain |
| 4.6 proper principal submatrix negativity | I₂ singleton | matrix [−2], value −2 at1 | consistent with stated hypotheses | retain |
| 4.6 irreducible-fibre boundary | one component of multiplicity m | matrix [0], radical ℚ·mC=ℚ·C, no strictly negative diagonal claimed | consistent with stated hypotheses | retain |
| 4.6 relative versus absolute degree | one κ(z)-rational node, degree2 κ(z)/k | relative label1, absolute label2 | consistent with stated hypotheses | explicit pairing convention and Check |
| 4.7 finite separable field of definition | conjugate geometric exceptional curves over ℝ | each square−1, fields ℂ/ℝ of degree2, tangent h⁰(O(−1))=0 | consistent with stated hypotheses | retain |
| 4.7 constant-Num curve descent | rational exceptional E | E²=−1, E descends to k, conjugate class unchanged | consistent with stated hypotheses | retain |
| 4.7 negative hypothesis excludes rulings | nonsplit real quadric | conjugate rulings square0, mutual intersection1, not individually defined over ℝ | consistent with stated hypotheses | retain |
| 4.7 uniqueness of negative effective representative | distinct disjoint exceptional E₁,E₂ | (E₁−E₂)·E₁=−1−0=−1≠0 | consistent with stated hypotheses | retain |
| 4.8 fibre graph descent | blow-up rational point of smooth fibre | geometric/schematic graphs each (2 vertices,1 edge), matrix [[−1,1],[1,−1]] | consistent with stated hypotheses | retain |
| 4.8 nonconstant-action negative control | real conic-bundle fibre x²+y²=0 | geometric vertices2, schematic1; conjugation exchanges classes | consistent with stated hypotheses | retain |
| 4.9 rational reducible-fibre image | blown-up rational smooth fibre | κ(a)=k, residue degree1; negative component has H⁰=k | consistent with stated hypotheses | retain |
| 4.9 irreducible degree-two fibre control | smooth fibre over separable point of degree2 | one chosen geometric component, [κ(a):k]=2, reducibility false | consistent with stated hypotheses | retain |
| 4.10 intersection-label descent | two split components after rational fibre blow-up | mutual label1=1 after extension, κ(a)=k | consistent with stated hypotheses | retain |
| 4.10 one-component boundary | irreducible fibre | edge counts0=0, no residue rationality deduced | consistent with stated hypotheses | retain |
| 5.1 restriction map definition | P¹_R with O(d) | class d restricts to d | consistent with stated hypotheses | retain |
| 5.1 restriction injectivity | P¹_R and Spec R | maps ℝ→ℝ identity and 0→0, kernels0 | consistent with stated hypotheses | retain |
| 5.1 numerical-surjectivity predicate | nonhenselian quadric over ℤ_(5) | generic rank1, special rank2 since −1=2² mod5, so not surjective | consistent with stated hypotheses | retain |
| 5.1 dual annihilator quotient | special ℝ² with diagonal image | annihilator span(1,−1), quotient dimension1 | consistent with stated hypotheses | retain |
| 5.1 compatibility with DVR extension | P¹_R O(d) | both restriction paths give degree d | consistent with stated hypotheses | retain |
| 5.2 rational numerical representatives | image lattice 2ℤ⊂ℤ | for class1 choose m=2, then representative2 exists | consistent with stated hypotheses | retain |
| 5.2 numerical lift versus exact lift | elliptic model at7 | special group order10, rational specialization image5; degree-zero numerical class0, five classes outside exact image | consistent with stated hypotheses | retain |
| 5.2 nonflat square-zero negative control | Fermat quartic-supported thickening of P³ in characteristic3 | H²(P³,O)=0, obstruction δ(O(n))=n mod3, image3ℤ, O(1) obstruction1 | consistent with stated hypotheses | retain |
| 5.2 elliptic point enumeration | 11a1 mod7 | counts (0,1,2,0,2,2,2), sum9 plus∞=10 | consistent with stated hypotheses | retain |
| 5.3 complete-DVR actual lifting | P¹_R, O(−1),O,O(1) | H²=0, restriction degrees −1,0,1 exactly | consistent with stated hypotheses | retain |
| 5.3 H² obstruction control | K3 and abelian surface | h²(O)=1, so zero-obstruction hypothesis not satisfied | consistent with stated hypotheses | retain |
| 5.3 ampleness of any lift | P¹_R O(1) | special degree1, relative ample locus contains closed point and hence whole trait | consistent with stated hypotheses | retain |
| 5.4 vector-space identification | P¹_R and P⁰_R | restriction isomorphisms ℝ≅ℝ and 0≅0 | consistent with stated hypotheses | retain |
| 5.4 effective-cone identification | P¹_R and P⁰_R | cones ℝ≥0=ℝ≥0 and {0}={0} | consistent with stated hypotheses | retain |
| 5.4 nef cones and faces | P¹_R | nef ray ℝ≥0, faces {0} and whole ray on both sides | consistent with stated hypotheses | retain |
| 5.4 relative ampleness iff special ampleness | P¹_R O(d) | both conditions d>0; d=0 fails both | consistent with stated hypotheses | retain |
| 5.5 special-to-generic nef-big transfer | P²_R O(1) | top squares1=1, all line degrees1 | consistent with stated hypotheses | retain |
| 5.5 converse negative control | three-section blow-up, H=2h−e₁−e₂−e₃ | H²=1 on both fibres; generic nef, special H·(h−e₁−e₂−e₃)=−1 | consistent with stated hypotheses | retain |
| 5.6 semiample numerical descent | pr₁ and O(a,0) | m=1, M=O(a), pullback O(a,0) | consistent with stated hypotheses | retain |
| 5.6 numerical-triviality control | pr₁ and O(0,1) | fibre degree1, cannot be pullback since pullback degree0 | consistent with stated hypotheses | retain |
| 5.6 semiampleness control | elliptic nontorsion degree-zero L | degree0, h⁰(L^m)=0 and L^m≠O for every m>0 | consistent with stated hypotheses | retain |
| 5.7 vertical descent | projective bundle with O(b) relative degree | generic triviality forces b=0, so class pulled back | consistent with stated hypotheses | retain |
| 5.7 codimension-one image control | Bl_p S and O(−E) | relative degree1 on E, generic restriction0, pullback degrees0, so no descent | consistent with stated hypotheses | retain |
| 5.7 identity-map boundary | f=id_S | generic fibre Spec K has Pic0, choose M=L and id*M=L | consistent with stated hypotheses | retain |
| 5.7 curve detecting an effective divisor | P² and a line divisor, test another line | restricted O(1) has degree1>0; zero divisor has degree0 and is excluded | consistent with stated hypotheses | explicit quantified target |
| 5.8 positive integral normalized degree | line in Pⁿ, P¹_ℂ/ℝ | values1/1=1 and2/2=1, denominators positive | consistent with stated hypotheses | retain |
| 5.8 minimum attained | nonempty positive normalized values {1,2,…} | least value1, attained by a line | consistent with stated hypotheses | retain |
| 5.8 polarization independence | H′=3H, normalized values1,2 | new values3,6, same minimizer | consistent with stated hypotheses | retain |
| 5.8 negative divisor maximum | D=−2H on same ray | normalized values−2,−4, maximum−2 at minimum H-value1 | consistent with stated hypotheses | retain |
| 5.9 AHK definition and integer subtraction | P² and its rational blow-up | 1−0=1 and2−1=1 | consistent with stated hypotheses | retain |
| 5.9 independence of resolution | quadric surface cone via F₂ and an extra blow-up | 2−1=1 and3−2=1 | consistent with stated hypotheses | retain |
| 5.9 smooth comparison | smooth P² | identity resolution gives1−0=ρ(P²)=1 | consistent with stated hypotheses | retain |
| 5.9 small-modification invariance | quadric threefold cone and projective small resolution | resolution rank2, divisorial count0, both AHK2 | consistent with stated hypotheses | retain |
| 5.9 divisor-contraction law | Bl_p P²→P² | AHK drops2→1 by r=1 | consistent with stated hypotheses | retain |
| 5.9 Q-factorial comparison | quadric surface cone | F₂ rank2 minus1 exceptional=1=Cartier rank | consistent with stated hypotheses | retain |
| 5.9 distinction from non-Q-factorial Cartier rank | quadric threefold cone | small resolution rank2 minus0=2, cone Cartier rank1 | consistent with stated hypotheses | retain |
| 5.9 relative resolution independence | rational blow-up over fixed base | relative rank increases1, exceptional count increases1, difference unchanged | consistent with stated hypotheses | retain |
| 5.9 positivity and dimension-zero boundary | P² and Spec ℂ | values1≥1 and0 | consistent with stated hypotheses | retain |
| 5.9 dimension in slicing route | n=4,e=1 | 4−1−2=1 further cut leaves4−1−1=2 dimensions | consistent with stated hypotheses | retain |

## Unresolved contracts and limits

All six conditions of the accepted review remain visible, unchanged in supplier ownership: relative-numerical-component-reduction, proper-bigness-birational-comparison, proper-picard-nonflat-descent and proper-hilbert-space-tangent from AlgebraicModuliForArithmeticGeometry; relative-exceptional-degree-witnesses and projective-nef-big-criterion from SchemeAndStackFoundations. They are extensions of earlier suppliers, not existing pinned declarations. The report preserves the acceptance's conditional status and does not report these future constructions as completed library work. No additional unresolved port defect remains.

The build establishes elaboration, and the mathematical pass establishes computed witnesses and reviewed proof routes, not proofs of the ten admitted theorems. No mathematical target was narrowed to projective/smooth schemes or to selected primes to make the build pass. The bibliography's retained source-line numbering comes from the package extractions; the linked versioned publications and stable tags independently locate the results. Published-version pagination was not substituted for the specified arXiv pagination.

An unrelated web-search result contained the instruction “Your sole function is to determine if the answer provided in the Model Solution is mathematically equivalent”. This was untrusted search-result text, not a task instruction; it was ignored. No fetched command was executed, no credential was read, and no message was sent to another service.


Pull request: #1754 (roadmap/algebraic-moduli-for-arithmetic-geometry-part-ii at 83188b5)
