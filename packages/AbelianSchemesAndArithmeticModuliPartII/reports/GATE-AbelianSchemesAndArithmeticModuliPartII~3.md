## H01 (CBirkbeck) — applied

F3.11 in `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:2859` replaces maximal-order existence followed only by prime-to-p conductor changes with F3.7 applied to R⊗ℤ_ℓ at every exceptional prime, including p, and identifies the endomorphism order through the multiplier identity and integral Tate at every prime (Waterhouse line 1198, Waterhouse line 1206, Waterhouse line 1211). F3.8's theorem is unchanged; its prerequisites now name the integral Hom comparisons, and its Checks at line 2801 include the nonmaximal-at-5 example and a characteristic-two case.

## H02 (CBirkbeck) — applied

B2.9 in `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:1376` replaces the bare open-embedding prerequisite with the pinned sphere-separation, closed-ball-complement and reduced-H₀ comparisons, stereographic charts and the compact-to-Hausdorff embedding theorem, together with the proof from Hatcher, Theorem 2B.3, p.172 (Hatcher line 3337, Hatcher line 3343; GH line 1363). The supplier contract at line 237 uses rational coefficients for connectivity, the ownership clause at line 42 places the general extension in the shared topology API and specifies compatibility with PlanarTopology Layer 2, and the Checks distinguish empty/zero-dimensional domains, a vanishing derivative, noninjectivity, boundary and unequal dimensions.

## H03 (CBirkbeck) — answered

LieGroupoidsPoisson G0.1 and SmoothBundlesConnections B6.0 are actual section-level prerequisites, as stated in `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:303`, B2.10 and B2.11, and as verified in those suppliers' respective sections. The live PR description still omits both and asserts that no other author's open PR is a dependency; its dependency list and merge-order claim need to include those early sections while distinguishing their later consuming applications, and this finding remains unfixed because PR-text edits are expressly outside this job's authorization.

## Ownership, citations and pinned interfaces

The checked main copy is `a07e2024f391f3022520c3f8ad194912b3eab614`; the reviewed roadmap head is `e2d97c3aa272b638af5a59152c58c13e95bf901f`. Mathlib and Tau Ceti were verified at the manifest pins `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Ownership searches covered main, the board packages, the indexed open roadmaps and all twelve supplied sibling checkouts. PlanarTopology Layer 2 owns the dimension-two statement; B2.9 supplies the arbitrary-dimensional extension on the shared carriers, rather than depending on planar topology or rebuilding its other theorems. The other sibling matches concerned generic integer orders, Galois-stable lattices or Lattès maps, not realization of prescribed finite-field abelian endomorphism orders. F3's abelian-variety adapter remains here, consuming the parent's quotients and the finite-flat/Dieudonné supplier. No ownership moved, no supplier was added from later in the order, and no Lean declaration was added or renamed.

Cross-roadmap references were resolved against main or the named new-roadmap heads. In particular, the fourteen initial unresolved-name leads are planned exports at the cited supplier sections: the parent A3.9/A4.3, JacobianChallengePartII §§2.6/7.2, GeometryOfNumbersAndQuadraticArithmetic §2.7, SchemeAndStackFoundations §§1.18/4.15, AlgebraicModuliForArithmeticGeometry §5.2, and ShimuraVarieties §§5.2/5.5–5.8; they were not reported as missing pinned declarations. LieGroupoidsPoisson G0.1 supplies the smooth normal form and fibre API; SmoothBundlesConnections B6.0 supplies the metric good covers before its bundle applications.

| Pinned input used by the repair | Verified location and content |
| --- | --- |
| Sphere-complement comparison and separation | `TauCeti/AlgebraicTopology/Singular/JordanBrouwer.lean:198`, `:212`: the homology isomorphism and the two-path-component theorem retain continuity, injectivity and the dimension relation. |
| Closed-ball complement | `TauCeti/AlgebraicTopology/Singular/CubeComplement.lean:286`: coefficients in a module, Hausdorff target, finite-dimensional source and acyclic point complements; applied to a sphere. |
| Reduced H₀ | `TauCeti/AlgebraicTopology/Singular/Reduced.lean:216`: coproduct indexed by all path components except that of the chosen basepoint; use the nonzero coefficient field ℚ. |
| Stereographic charts | `Mathlib/Geometry/Manifold/Instances/Sphere.lean:335`, `:342`, `:346`: source is the complement of one pole and target is the whole Euclidean space. |
| Compact continuous injection | `Mathlib/Topology/Separation/Hausdorff.lean:685`: `Continuous.isClosedEmbedding` requires compact source and Hausdorff target. |
| Open path components | `Mathlib/Topology/Connected/LocallyPathConnected.lean:86`: `IsOpen.pathComponentIn` requires local path connectedness. |
| Open-embedding interface | `Mathlib/Topology/Maps/Basic.lean:763`: `Topology.IsOpenEmbedding.of_continuous_injective_isOpenMap` consumes continuity, injectivity and openness; it does not prove invariance of domain itself. |

## Elaborated signatures

I compared all seven supplied mechanical `#check @name` elaborations with the README: `resultantRecognition` (F2.2), `AbelianVarietiesOfDimension`, `AbelianIsogenyClasses`, `AbelianIsomorphismClasses` (F6.0), `weilPolynomialCount` (F6.2), `isogenyClassAsymptotic` (F6.5) and `isomorphismClassCount` (F6.4). The scratch signature file contains all seven checks; no binder or README/Lean generality mismatch was found, so no signature changed and `Suggested.lean` is byte-identical to the reviewed head.

The three class carriers retain `[Field k]`; the asymptotic retains `[Finite k]`, and the prime-field bound retains `[Fact p.Prime]`. The resultant theorem carries the DVR, irreducible uniformizer, density, monicity and nonzero-resultant conditions explicitly. The polynomial count retains q≥2 and g≥1, while both geometric counts assert finiteness as part of the conclusion. At the pin, the abelian-variety fields are the group object, properness and geometric integrality (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`), with dimension defined at line 118; the isogeny property is `(@IsFinite ⊓ @Surjective : MorphismProperty Scheme).inverseImage Hom.toSchemeFunctor` (`TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:56`), which adds no separability condition.

## Adversarial mathematics pass

The table records the repaired statements and their proof inputs, followed by the retained acceptance declarations. Numerical tests distinguish wrong models; the general assertions also use the source and hypothesis checks above.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Sphere separation and complement homology | Two points S⁰ embedded in S¹ | Complement has 2 open arcs; reduced H₀ has rank 2−1=1 over ℚ | Two path components, one coefficient copy | Exact supplier contract |
| Closed-ball complement acyclicity in the proof | Embedded interval [−1,1] in S¹ away from infinity | Exterior is 1 arc containing infinity; reduced H₀ rank 1−1=0 | Nonempty path-connected exterior | Named input and infinity witness |
| Reduced H₀ determines connectivity | One point versus two points; also zero coefficients | Over ℚ: ranks 0 versus 1; over the zero module: 0 versus 0 | Zero coefficients cannot detect components | Explicit ℚ coefficients |
| B2.9, empty domain and dimension zero | U=∅; U=ℝ⁰ | Images ∅ and {0}; both have open image, cardinalities 0 and 1 | Both included | Added Check |
| B2.9 without differentiability assumptions | x↦x³ on (−1,1) | Image (−1,1); f′(0)=0; f(±1/2)=±1/8 | Open embedding despite zero derivative | Added Check |
| B2.9 requires injectivity | x↦x² on (−1,1) | f(1/2)=f(−1/2)=1/4; image [0,1) misses −ε/2 in every small ball about 0 | Conclusion fails when injectivity is dropped | Negative Check |
| B2.9 requires an open boundaryless domain | Inclusion [0,1)→ℝ | 0 is in image; −ε/2 is not for every 0<ε<1 | Image not open | Negative Check |
| B2.9 requires equal dimensions | x↦(x,0):ℝ→ℝ² | (0,0) is in image; (0,ε/2) is not; interior is ∅ | Continuous injection is not open | Negative Check |
| B2.9 component-to-open-map step | Identity interval inside the compactified line | Boundary complement splits into interior/exterior with component counts 1+1=2; each open subinterval maps to itself | Proves openness of every open image subset | Proof route supplied |
| Chartwise boundaryless manifold consequence | Identity and (x,y)↦(−x,y) on (−1,1)² | Both images equal (−1,1)²; transition inverse composed with transition is identity | No orientation, global Hausdorff or countability premise is used | Explicit local generality |
| Prime-field linear-dual convention used at p | Rank-one étale realization; identity marking | (F,V)=(1,p), FV=p; transposition leaves (1,p), whereas Cartier duality would give (p,1) | Correct linear dual and transport direction retained | Applied F3.5, no convention change |
| F3.8 admissibility of the p=5 example | K=ℚ(ζ₅), π=√5 ζ₅, V=√5 ζ₅⁻¹ | πV=5; π²=5ζ₅²; every complex modulus is √5; [K:ℚ]=4 and simple dimension is 2 | Actual nonreal prime-field Weil class | Added Check |
| F3.8 nonmaximality at p | Same order R; v(5)=4 | v(π)=v(V)=2, but v(1−ζ₅)=1; scalar residues modulo the valuation-2 ideal cannot have valuation 1 | R₅≠O_K,₅ | Added negative control against prime-to-p-only route |
| Integer-order calculation for the same example | Basis 1,ζ₅,ζ₅²,ζ₅³ | π=(2,1,2,0), V=(1,−1,−1,1); πV=(5,0,0,0), π²=(0,0,5,0); determinant-minor gcd gives [O_K:R]=5 | The exceptional order defect is at 5 | Independent calculation; no additional target |
| Prime-to-p preservation | A model with maximal order at 5 and a prime-to-5 isogeny | The 5-divisible-group map is an isomorphism; resulting local order remains O_K,₅, whereas required order has index 5 | Such isogenies cannot reach R | Replaced restricted route |
| F3.8, small characteristic | p=2, π=1+i, V=1−i | πV=2; v(2)=2 and v(π)=v(V)=1; R=ℤ[i]=O_K | All-prime route also covers p=2 | Added Check |
| Multiplier identity in both directions | R_ℓ itself; x∈R_ℓ; x=1−ζ₅∉R₅ | For x∈R_ℓ, xR_ℓ⊆R_ℓ; conversely x·1=x; excluded x sends 1 outside R₅ | (R_ℓ:R_ℓ)=R_ℓ, including nonmaximal orders | Explicit identity and Check |
| F3.7 finite-support use in F3.11 | Reference order O_K; target R of index 5; also R=reference order | Defect support {5} in the example, ∅ in the identity case; all other completions agree | Finite-support realization applies | Keep reference lattices outside exceptional set |
| F3.11 stability and recovery of the global order | R_ℓ and R₅ above | πR_ℓ,V R_ℓ⊆R_ℓ; integral endomorphism multipliers equal R_ℓ at every ℓ; intersection inside K is R | Realizes the specified order; R=O_K gives maximal order | Uses all-prime integral Tate |
| `resultantRecognition` | P=Q=1; over ℤ₂, P=X, Q=X+2, ψ=X+4; P=X, Q=X² | First test valuations 0=0; second resultants 4 and 2 give 2≠1; third resultants 4 and 16 give 2≠4 | Detects different polynomials and multiplicities | Signature retained |
| Density and DVR hypotheses of recognition | D=𝔽₂⊂𝔽₂[[t]], P=X+t, Q=X+t+t²; zero ring or field as O | Against constant-field tests both valuations equal the multiplicity of X; P−Q=t²≠0; a field has maximal ideal 0, contradicting the pinned DVR hypothesis | Density is essential; fields and zero rings excluded | No binder loss or narrowing |
| `AbelianVarietiesOfDimension` | Zero variety, E, E×E | Dimensions 0,1,2; membership at g=0,1,2 respectively, with E excluded at g=0 and E×E at g=1 | Native dimension subtype agrees with F6.0 | Definition retained |
| `AbelianIsogenyClasses` | Identity in dimension 0; [p] on E in characteristic p; the two F₅ curves y²=x³+ax with a=1,4 | Identity degree 1; [p] degree p² despite inseparability; point counts 4 and 8, traces 2 and −2 | Inseparable isogeny included; distinct F₅ classes remain distinct | Definition retained |
| `AbelianIsomorphismClasses` | Same F₅ curves; change only the polarization; dimension 0 | Point counts 4≠8 prohibit an F₅-isomorphism; polarization-only change gives the same quotient point; dimension-zero count 1 | Ground field and unpolarized objects are retained | Definition retained |
| `weilPolynomialCount` | g=1, q=2,3,5; repeated-root example at (q,g)=(2,2) | Counts 5,7,9 have squares 25≤50, 49≤75, 81≤125; (X²+2)² has coefficients (4,0,4,0,1), constant 4 and reciprocal coefficient identities 4=4, 0=0, 4=4 | Bounds and repeated-root inclusion agree | Signature retained |
| `isogenyClassAsymptotic` | g=0; base fields of cardinality 2 and 4 | Dimension-zero count 1 gives log 1/0=0 under total real division; limiting constants log 2/4 and log 4/4=log 2/2 | Endpoint does not impose a false positive-g formula; fixed field matters | Explicit field/finiteness binders retained |
| `isomorphismClassCount` | g=0, p=2 or 3; attempted p=4 | log 1=0 and g²=0 in dimension 0; 4=2·2 violates primality | Small primes included; composite parameter excluded; bound is at infinity | Explicit prime and finiteness conditions retained |

## Sources

Waterhouse Theorem 6.1 and its p-lattice step were read at Waterhouse line 1194, Waterhouse line 1198 and Waterhouse line 1206. The topology argument was read at Hatcher line 3337 and Hatcher line 3343, and its use in the family argument at GH line 1363. Tits remains settled as uncertified and was not requested again. No missing legal text remains.

Hatcher, TateHonda and MilneJV have legal cached texts and supplemental manifest records prepared for the worker. The existing `packages/AbelianSchemesAndArithmeticModuliPartII/sources.toml` was left untouched because it is outside the authorized edit set; the supplemental records preserve the following single keys and bibliographic data.

| Key | Work and locator | Legal copy; cache SHA-256 | Certified source record |
| --- | --- | --- | --- |
| Hatcher | Allen Hatcher, *Algebraic Topology*, 2002; Theorem 2B.3, p.172; B2.9 | https://pi.math.cornell.edu/~hatcher/AT/ATch2.pdf ; `7d18d52c9ae10ec5275f967451f98352b3098a04f251423a67a11b88724f464c` | author-page; fetched 2026-10-22T19:53:19Z |
| TateHonda | John Tate, *Classes d’isogénie des variétés abéliennes sur un corps fini (d’après T. Honda)*, 1971; §3 Lemmas 1–3 and §4 Lemmas 4–6, pp.100–105; F3.2 | https://numdam.org/item/SB_1968-1969__11__95_0.pdf ; `a23d9cd18c2ccc155285428ca02f284bc546711c9eb9fe43555dd020fdd328f3` | open-repository; fetched 2026-10-22T19:55:20Z |
| MilneJV | James S. Milne, *Jacobian Varieties*, author version 2021; Theorem 12.1, p.38, §13, pp.40–44; B4.1 | https://www.jmilne.org/math/xnotes/JVs.pdf ; `36c3f09c7462dbbd4ae1f8b81a02bd9ff84f03c5a346351d7d5d78fc3f173486` | open-repository; fetched 2026-10-22T19:55:21Z |

## Build and gates

Commit: `fe15b14` — `AbelianSchemesAndArithmeticModuliPartII: review repairs (all-prime order realization and invariance-of-domain inputs)`. Only the permitted README changed; nothing was pushed.

`lake build TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII.Suggested` exited 0, with the four expected declaration-uses-`sorry` warnings at `Suggested.lean:59`, `:90`, `:102`, `:112` and no other warnings or errors. Exact completion line:

```text
Build completed successfully (8985 jobs).
```

The first full gate reported only the uncommitted README as dirty; after committing, the required full gate exited 0. Exact final summary:

```text
gate AbelianSchemesAndArithmeticModuliPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The required movable dependency check exited 0, with no UPWARD, CYCLE or moved line; its complete output is:

```text
depcheck: 13 roadmaps, 101 edges, 0 problem(s)
```
