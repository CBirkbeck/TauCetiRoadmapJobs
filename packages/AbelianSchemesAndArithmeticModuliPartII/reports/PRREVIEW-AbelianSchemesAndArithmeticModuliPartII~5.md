# Review of AbelianSchemesAndArithmeticModuliPartII (pull request #1405 at f3700c9)

**Verdict:** needs changes

## R01 (P2) — Reconcile the eight declared gaps with the README's ownership

Location: `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:114`, “The independent prerequisite extensions belong here”; `packages/AbelianSchemesAndArithmeticModuliPartII/design/plan.json`, top-level `gaps`.

Claim: the ownership conflict reported as R01 in the previous review remains unchanged. The plan assigns eight contracts to suppliers, while the README assigns six locally and imports overlapping parts of the other two from HeightsRationalPointsAndObstructions. None of the eight slugs appears in the README. The lattice exponents also disagree.

Witness: eight plan slugs, zero matching README contracts; F4.4 states exponents 4Δ and 4Δ, versus 2Δ and Δ in its gap. Heights §§1.10 and 5.8 already own general Lang–Néron and uniform torsion closures.

| Declared slug | Declared supplier | Conflicting assignment at this head |
|---|---|---|
| fixed-part-theorem | ShimuraVarieties §3.5b.1 | B2.4, README:1425 |
| kuga-definable-inputs | ShimuraVarieties P.1/§§3.5a–d | B2.6 and B3.1, README:1494, :1933 |
| fine-curve-level-moduli | PELModuli M6 | B4.1, README:2155 |
| local-semisimple-lattice-bounds | GeometryOfNumbersAndQuadraticArithmetic §2.5 | F4.4, README:3003, with different exponents |
| cm-hermitian-mass-asymptotic | GeometryOfNumbersAndQuadraticArithmetic §3.3 | F5.7, README:3225 |
| algebraic-betti-ax-type | ShimuraVarieties P.1/§§3.5a–d | B2.15, README:1734 |
| uniform-manin-mumford | AbelianSchemesAndArithmeticModuli A6 | HeightsRationalPointsAndObstructions §5.8, imported at README:116 |
| lang-neron-modulo-trace | AbelianSchemesAndArithmeticModuli A6 | Heights §§1.9–1.10 for the general theorem; B2.3 for bounded-degree torsion |

Repair: choose one owner for each contract and reconcile that choice with the intake. For retained supplier assignments, restore matching “What <Supplier> must provide (gap:<slug>): …” paragraphs under the exact supplier contracts and consume those results instead of constructing them locally. For intended local ownership, record the decision for the maintainer/intake to withdraw the stale gap. Withdraw or repoint the requests already covered by Heights, separating the bounded-degree consequence from the general Lang–Néron theorem. Align the lattice contract with the supported 4Δ bounds unless stronger bounds are separately justified. This does not request an unauthorized change to the frozen design.

Repair checks: at (ℓ,Δ)=(2,2), the README allows (256,256), whereas the gap requests (16,4); a bound by 256 does not discharge either smaller bound. Importing Heights preserves the constant example A=E over ℂ(t): trace E, quotient by trace points 0. Uniform torsion closure needs one coset for V×A and zero for an empty fibre. The eight contracts should then have exactly one consistent owner and, wherever retained as gaps, matching README slugs.

The older repair reports' settled findings about implementing supplier mathematics outside this package remain settled. This finding does not require those suppliers to be implemented before acceptance; it concerns contradictory ownership, redundant requests and unequal contracts. No available subsequent repair record resolves previous R01.

## Previous findings

- R01 — not repaired: README:114–122 still assigns the prerequisites locally, while the plan retains eight supplier gaps and the README names none of their slugs. Heights imports and the two 4Δ lattice bounds remain unchanged.
- R02 — repaired: README:850–885 and :969–1001 now specify the maps, three API bullets each and four Checks each. The inverse-unit normalization, degree-two moment, connection sign and shuffle coefficient agree with KS.

## Verified sound

This is an incremental re-review of 73 changed lines since ac897bd. Only README P2.5 and P3.2 changed; Suggested.lean is byte-for-byte unchanged. I reviewed their complete additions, their local inputs and consumers P2.1/P2.4, P3.1/P3.3–P3.5 and P4.2–P4.3, the relevant supplier interfaces, and both previous findings. The unchanged mathematical checks are explicitly carried forward from the [previous review][previous], not represented as a fresh full review.

**Gate and elaboration.** The worker's supplied gate passes all checks, including its targeted build. The independently rerun gate passes all text, dependency and scope checks; an explicit targeted build of `TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII.Suggested` also succeeds. Direct `lake env lean` elaboration succeeds with exactly three `sorry` warnings and no other diagnostics. The outside-folder diff is empty and the worktree remains clean. No pull-request file was changed. The prescribed dependency command exits 0 with:

```text
depcheck: 204 roadmaps, 1496 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The eight contracts in R01 require reconciliation even though the dependency graph itself passes.

**Sources, conventions and the seeded sample.** Both changed source citations were read in the supplied legal KS extraction, corresponding to the README's linked arXiv v4. These checks certify the stated normalization, not merely a theorem title:

| Changed passage / dependent input | Source locator and what was verified |
|---|---|
| P2.5 splitting and composition | KS line 700, Theorem 2.8, p.16; KS line 731, Corollary 2.9, p.17; KS line 740 gives the inverse map at the unit. The source and target are the two completed coefficient modules; dual étaleness supplies invertibility. Composition inserts the same map at x and e, so normalization cancels it. |
| P2.5 moments and truncations | KS line 606–632, §2.1, p.14; KS line 656, Definition 2.6, p.15; KS line 741–749, Definition 2.10, p.17. Iterated coproduct and the split first neighbourhood give the degree-b factorization and coefficient 2 on t². The source does not assert an integral moment isomorphism in positive characteristic. |
| P3.2 identity tensor and sign | KS line 1308–1329, Definitions 3.2–3.3, pp.30–31. Tangent vectors and dual differential forms are distinguished. The smooth connection is over ℂ, with +ν and the stated Hodge components. |
| P3.2 horizontal comparison | KS line 1360–1409, Theorem 3.5 and proof, p.32. The comparison preserves the unit-fibre moment map and propagates through symmetric tensor levels. Truncation commutes with the connection. |
| P3.4 Dolbeault consumer | KS line 1417, Corollary 3.6, p.33. The anti-holomorphic connection gives the ordinary coefficient's bundle-valued resolution; it is not a replacement by scalar forms. |
| P4.2 integral consumer | KS line 2784–2794, equations (5.2.1)–(5.2.4), p.60, and KS line 2805, Lemma 5.11. Integral injections and generic-fibre isomorphisms remain distinct; the new characteristic-zero Checks do not invert factorials in the integral statement. |

The brief's 15 seeded occurrences comprise seven parent-roadmap occurrences, two each of ComplexComparisonPartII, FiniteFlatGroupsAndIntegralPadicHodgeTheory and DeligneWeightsAndPurity, and one each of SchemeAndStackFoundations and JacobianChallengePartII. Within this incremental scope, the parent and ComplexComparison interfaces used by the changed passages were reopened; the other unchanged sample checks and computed rows are carried forward below. No new unverified locator was introduced. Tits remains settled as uncertified.

**Resolved supplier and consumer interfaces.** Roadmaps were located using `roadmaps show`/`roadmaps grep`; the relevant text was then read. Existing-roadmap revisions were not substituted for main. The supplied main roadmaps DerivedModuleAlgebra and SchemeAndStackFoundations were also read for the standing roadmap shape.

| Repository-relative locator | Interface checked this round |
|---|---|
| `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1081`, A2.2 | Dual and doubly rigidified Poincaré bundle; the two unit rigidifications agree. This supplies the normalization used in P2.5. |
| Same file :1388, A3.1 | Relative isogenies are finite, flat and surjective, with kernel and base-change API. No separability restriction was silently imposed on all isogenies. |
| Same file :1851 and :1899, A4.2–A4.3 | Universal vector extension, connection moduli and Hodge duality. A♮ is E(A∨); the homological coefficient H is dual to H¹_dR. |
| Same file :2510, A5.1 | Complex uniformization and the lattice of rank 2g. It supplies the analytic abelian carrier, not the new completed connection. |
| `TauCetiRoadmap/ComplexComparisonPartII/README.md:1018`, C0.3; :1259, C1.1 | Finite-rank holomorphic bundle/sheaf comparison and bundle-valued local Dolbeault resolution on finite-dimensional Hausdorff second-countable complex manifolds. The complex abelian setting satisfies these restrictions. |
| `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:717`, §1.10; :2391, §5.8 | Finite generation modulo trace for regular finitely generated extensions; a finite collection of abelian subvarieties and a uniform coset count in families, including empty fibres. These substantiate the redundant requests in R01. |
| `TauCetiRoadmap/AutomorphicPadicLFunctionsPartII/README.md:13`, :320 | P0–P4 are imported; torsion specialization uses the rigidified splitting, dual-étale hypothesis and degree-zero augmentation. This is a downstream application, not a second owner or supplier. |

**Ownership and pinned declarations.** Searches by completed Poincaré coefficients, torsion splittings, smooth tensor connections and moments were made in the pinned geometry sources, main/open roadmap index and board packages. No competing owner of the changed constructions was found. The parent owns the uncompleted geometry and universal extension; this Part II owns completed coefficients and their normalized splitting/smooth comparison. The downstream AutomorphicPadicLFunctionsPartII imports them. No Lean declaration or fully qualified name was added.

Mathlib pin: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Eight declarations were reopened:

| File and line at the pin | Definition or restriction checked |
|---|---|
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`, :118 | `AbelianVariety` bundles a proper geometrically integral group object over a field; `dim` is topological Krull dimension. Neither is a completed relative coefficient bundle. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:56`, :61 | `isogenies` and `IsIsogeny` mean finite and surjective; they include inseparable maps. |
| `TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean:85` | `symmetricTensors` is the flip equalizer in a tensor square; it is not an all-degree shuffle algebra or a connection. |
| `TauCeti/LinearAlgebra/TensorPower/Basic.lean:38`, :59 | `oneEquiv` identifies degree one with the module; `splitAt` retains k≤n. |
| `Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean:679` | `reindex` uses the inverse permutation. Its pure-tensor formula at :687 agrees. |

**Headline coverage and Lean form.** The unchanged headline list at README:519–530 comprises P0.5; P2.8; P3.3–P3.4; P4.2–P4.3; B1.4, B2.3–B2.4, B2.21–B2.23 and B3–B4; F3.2/F3.4–F3.5/F3.7–F3.8/F3.10; F4.8; F5.7–F5.9; F6.3–F6.6; and F2.2. These are the shuffle comparison, completed cohomology, logarithm/smooth and ordinary CM comparisons, Betti/degeneracy results, finite-field realization/classification, bounds and counts.

The three statable endpoints remain `resultantRecognition`, `isogenyClassAsymptotic` and `isomorphismClassCount`. The module docstring names the missing carriers for the others, including the P3.4 smooth comparison affected by this repair. The additions do not make a missing geometric carrier native or justify a substitute theorem. The only other declarations are the dimension subtype and the two class quotients.

A scratch copy with `#check @name` for all six actual declarations was elaborated this round. All required DVR, irreducibility, density, monicity, finite-field and primality hypotheses remain present and agree with the README. Nothing changed or was lost. The scanner's seventh item, `and`, occurs in prose and is not a declaration of this file. The previous review's nine one-tactic padding probes (`simp`, `rfl`, `infer_instance` for the three unchanged theorems) and pinned single-lemma search are carried forward; no proof or statement changed to warrant repeating them.

**Computed adversarial pass.** The following fresh rows cover the changed definition, every added API assertion and all eight new Checks, plus the surviving finding and dependent convention comparisons. The table has 161 rows: 20 fresh rows and 141 carried rows. The carried rows follow verbatim in substance, each attributed to the previous review. Finite tests do not prove the general theorems; they detect incorrect normalization, scope and degeneracy.

| Statement | Instances and computed values on the two sides | Result / change |
|---|---|---|
| P2.5 normalized splitting, README:850 | At e, degree-one map [m] is m and its unit inverse is 1/m: m=1,2,4 gives 1,1,1. A raw map gives 1,2,4. | Repaired; KS line 740. |
| P2.5 filtered isomorphism and augmentation, :854 | On k[[t]]/(t³), the unit splitting has matrix diag(1,1,1). Augmentation of a+bt+ct² is a on both sides; filtration ideals (t),(t²) are preserved. | Retain the filtered and rigidified statement. |
| P2.5 composition independence, :857 | φ=[2], ψ=[2]: on degree b=1,2, the normalized composites are 4⁻ᵇ4ᵇ=1, matching 2⁻ᵇ2ᵇ=1. More generally (vu)⁻¹(vw)=u⁻¹w. | Retain with both duals étale; no commutativity of arbitrary maps is needed. |
| P2.5 degree-b moment factorization, :861 | For a+bt+ct², moments through degree 2 are (a,bh,2ch^[2]); modulo t² the first two remain (a,bh). A t³ term contributes 0 through degree 2. | Retain b-th infinitesimal factorization. |
| P2.5 identity and dimension-zero Check, :867 | φ=id: induced maps on degrees 0 and 1 are 1 and id. At dim A=0 the coefficient ring is k and all positive-degree modules are 0; augmentation(1)=1. | Check discriminates the zero map. |
| P2.5 [2]/[4] Check, :870 | Degree 1: (1/2)2=(1/4)4=1. Degree 2: (1/4)4=(1/16)16=1. Unnormalized coefficients are 2,4 and 4,16. | Check discriminates an omitted inverse. |
| P2.5 inseparable negative control, :874 | Relative Frobenius pulls t back to t^p. Modulo t² this is 0 at p=2 and p=3, while id on the nonzero cotangent line is 1. Every proposed inverse composite is 0≠1. | Dual-étale hypothesis excludes the example. |
| P2.5 separate moment normalization Check, :878 | Δ(t²)=t²⊗1+2t⊗t+1⊗t² gives moment₂(t²)=2h^[2]; moments₀,₁(t²)=0. For 1 the moments are (1,0,0). | Repaired; the splitting is identity but the degree-two moment is not. |
| P3.2 definition of V_n and ∇_n, :969 | For elliptic H of dimension 2, V₀,V₁,V₂ have ranks 1,3,6. With ν(∂t)=h, ∇₁(a+bh)(∂t)=a′+(b′+a)h. | Source/target and degree truncation explicit. |
| P3.2 Leibniz and +1, :977 | f=t,s=1,n=1: ∇(t)=dt+t h dt, and s df+f∇s=dt+t h dt. At t=0 the degree-zero coefficient is 1; ∇1 has degree-one coefficient +1. | Opposite sign gives −1, trivial connection 0. |
| P3.2 flatness and associated graded, :979 | With constant ν=h ds+k dt, dν=0; ν∧ν=(h·k−k·h)ds∧dt=0. On a graded constant h^[b], the degree-b component of ∇ is 0=d(h^[b]). | Retain degree filtration; raising terms vanish on the associated graded. |
| P3.2 horizontal projections, :982 | Project V₂→V₁: ∇₂h=2h^[2]dt maps to 0=∇₁h. Project V₁→V₀: ∇₁1=h dt maps to 0=∇₀1. | Both truncation and augmentation are horizontal. |
| P3.2 unit-fibre comparison, :983 | The moment of the rigidified scalar 1 is (1,0,…,0). A comparison multiplying that vector by 2 gives (2,0,…,0) and fails. | Unit normalization retained at all levels. |
| P3.2 n=0 / H=0 Check, :988 | ∇₀f=df; ∇₀1=0. When H=0, V_n=k at every n and ν=0, so ∇_n=d. | Check covers both degeneracies. |
| P3.2 first-level sign Check, :990 | (∇₁1)(∂t)=h; replacing +ν by −ν gives −h and deleting ν gives 0. For h≠0 over ℂ these are distinct. | Repaired sign witness. |
| P3.2 second-level shuffle Check, :993 | h·h=2h^[2]; thus (∇₂h)(∂t)=2h^[2]. Ordinary polynomial multiplication gives h^[2]; truncation to V₁ gives 0. | Repaired multiplicity witness. |
| P3.2 curvature Check, :996 | For distinct h,k, both products are h⊗k+k⊗h, so difference 0. For h=k, both are 2h^[2], again difference 0. | Retain; flatness alone is supplemented by the sign Check. |
| P3.4 and P4.2–P4.3 consumers | Elliptic smooth levels retain ranks 3 and 6 and coefficient 2. Over O_C₂, multiplication by 2 is injective but not invertible; over C₂ it is invertible. Translation by 0 gives the identity splitting and moment₂(t²)=2h^[2]. | No integral/generic-fibre convention changed. |
| R01 gap contracts | Plan has 8 slugs; matching README paragraphs number 0. At ℓ=2, Δ=2, gap bounds are (16,4), README bounds (256,256). | Still inconsistent; this computation does not assert the stronger bounds are mathematically false. |
| R01 existing Heights inputs | A=E over ℂ(t): trace quotient E(ℂ(t))/E(ℂ)=0. Full fibre torsion closure is A, one coset; empty fibre closure is empty, zero cosets. | Existing imports preserve the intended boundary cases; redundant requests need reconciliation. |
| P0.1 invariant tensors | n=0 gives R; n=1 gives M. For M=R²,n=2, fixed coefficients satisfy a₁₂=a₂₁, giving 3 basis elements; e₁⊗e₂ alone is not fixed. For M=0,n>0 the module is 0. | Retain; no division by n!.  [Previous review][previous]. |
| P0.2 completion | M=R: each degree has rank 1; the sequence (1,1,…) belongs to the product but not the direct sum. Modulo degrees ≥3 both give (1,1,1). | Retain degree completion.  [Previous review][previous]. |
| P0.3 shuffle product | h^[1]·h^[1]=2h^[2]; h^[1]·h^[2]=3h^[3]. In F₂ the first is 0 while h^[2]≠0; in F₃ the second is 0. | Retain integral shuffle coefficients.  [Previous review][previous]. |
| P0.4 degree two | Flip on R²⊗R² exchanges the two mixed basis vectors; both invariant definitions give their sum and the two diagonal tensors, rank 3. | Retain comparison with native square.  [Previous review][previous]. |
| P0.5 arbitrary-module divided-power map | γ₂(h) maps to h⊗h; γ₁(h)² and its image are respectively 2γ₂(h) and 2h⊗h. Over F₂ both products are 0, but the degree-two generators remain nonzero for free rank one. | Retain multiplicativity; do not infer invertibility for arbitrary M.  [Previous review][previous]. |
| P0.6 multigrading | (R⊕R) in degree 2 has pieces (2,0),(1,1),(0,2), ranks 1+1+1=3. At degree 0 only (0,0) survives, rank 1. | Retain.  [Previous review][previous]. |
| P0.7 construction route | Symmetrization of x² and xy gives 2x⊗x and x⊗y+y⊗x; diagonal coefficient 2 versus mixed coefficient 1. | Retain orbit multiplicities.  [Previous review][previous]. |
| P1.1 dual/connection notation | Elliptic A: rank ω_A∨=1, rank H=2; Lie(A♮) and Hom(H,k) both have dimension 2. A=0 gives 0 in both positive-rank terms. | Retain E(A∨) and duality direction.  [Previous review][previous]. |
| P2.1 moments | For additive formal coordinate t, degree-n moment of tⁿ is n!h^[n]: coefficients 1,1,2,6 at n=0,1,2,3. Mod 2, coefficient 2 vanishes. | Retain rational isomorphism only.  [Previous review][previous]. |
| P2.2 finite coefficients | Elliptic level 2: ordinary rank 1+1+1=3, connection rank 1+2+3=6; last kernels ranks 1 and 3. Level 0 gives rank 1 in each. | Retain distinct carriers.  [Previous review][previous]. |
| P2.3 transform/completion | Elliptic d=1: twisted completed cohomology is k in degree 1 and 0 in degree 0. For d=0 it is k in degree 0. | Retain shift [−d], proper/Noetherian inputs.  [Previous review][previous]. |
| P2.4 isogeny maps | Identity induces 1; [n] on the linear coefficient induces n. In characteristic p, Frobenius on a formal parameter has linear coefficient 0, not an invertible map. | Retain dual-étale condition.  [Previous review][previous]. |
| P2.6 equivariance | For automorphisms γ,δ, pullback composition reverses the corresponding map order; inverse maps yield the action cocycle. For γ=−1 on degree one, inverse coefficient is −1 and its square is 1. | Retain inverse in equivariance map.  [Previous review][previous]. |
| P2.7 comultiplication | Δ(t²)=t²⊗1+2t⊗t+1⊗t². The (1,1) component is 2, hence 0 in F₂ rather than an isomorphism. | Retain n! invertibility.  [Previous review][previous]. |
| P2.8 cohomology | d=1: (H⁰,H¹)=(0,k); d=0: H⁰=k. Replacing the ordinary coefficient by the connection coefficient is not licensed by this computation. | Retain ordinary formulation.  [Previous review][previous]. |
| P2.9 route | For conormal rank 1, degree-two symmetrization has coefficient 2; rank 2 mixed monomial has coefficient 1. Determinant line and its inverse tensor to O, leaving the shift −d. | Retain derived-limit comparison.  [Previous review][previous]. |
| P3.1 square-zero class | Elliptic H=k² and M=k: Hom(H,M)=k². M=H sends id to the 2×2 identity, whereas the split extension maps to the zero matrix. | Retain identity-class normalization.  [Previous review][previous]. |
| P3.3 logarithm comparison | H=0 gives O with unique unit splitting; H=k² gives extension image I₂, split connection gives 0₂. | Retain characteristic-zero and splitting.  [Previous review][previous]. |
| P3.4 tensor/Dolbeault model | Elliptic level 1 has ranks 3 for connection and 2 for ordinary truncation; level 2 has 6 and 3. In a holomorphic frame, ∂̄²=0; a holomorphic constant has ∂̄=0. | Retain bundle-valued comparison.  [Previous review][previous]. |
| P3.5 route/sign | Two commuting coefficient shifts give ν∧ν=(S₁S₂−S₂S₁)dz₁∧dz₂=0. The first extension still has I₂, excluding the flat split class 0₂. | Retain both flatness and class check.  [Previous review][previous]. |
| P4.1 ordinary completion | In characteristic-zero dual numbers, (1+ε)^(pⁿ)=1+pⁿε≠1; modulo pʳ, n≥r kills the linear term. | Retain reduction before the limit.  [Previous review][previous]. |
| P4.2 trivialization/moments | Multiplicative formal logarithm starts T−T²/2. At p=2 its quadratic denominator is nonintegral; over C_p it is defined. Degree-two integral moment has coefficient 2, injective in O_Cp but not a unit at p=2. | Retain integral injection/generic isomorphism distinction.  [Previous review][previous]. |
| P4.3 translation | In additive formal coordinates translation by u sends t to t+u; translation by 0 is identity and successive translations give t+u+v. | Retain translation diagram and torsion hypotheses.  [Previous review][previous]. |
| P4.4 route | Mod pʳ, pⁿε=0 for n≥r; before reduction pⁿε≠0. Projecting the connection to the ordinary factor leaves d(t)=dt. | Retain completed-base-change order.  [Previous review][previous]. |
| B0.1 periods | For lattice (2,i), w=2a+ib gives a=Re(w)/2,b=Im(w). At w=2, coordinates (1,0) become 0 in the torus; at w=i they are (0,1), also 0. | Retain real coordinates and integral transition matrices.  [Previous review][previous]. |
| B0.2 birational rank | A birational change is an isomorphism on a dense open, so a rank-2 Jacobian there remains rank 2; exceptional points can have rank 0. | Retain generic, not everywhere, assertion.  [Previous review][previous]. |
| B0.3 route | Lattice translation (a,b)↦(a+1,b) changes the lift by (1,0) and the torus point by 0; derivative is I₂. | Retain descent.  [Previous review][previous]. |
| B1.1 Betti form | Polarization type (1,2) gives periods 2 and 4 for the normalization 2Σd_i da_i∧db_i; [n]* scales it by n², values 0,1,4 at n=0,1,2. | Retain normalization.  [Previous review][previous]. |
| B1.2 kernel/rank | On constant E×S, fibre directions have Betti rank 2 and horizontal base directions rank 0; the pulled-back symplectic form has the same kernel. | Retain semipositive restriction hypotheses.  [Previous review][previous]. |
| B1.3 nondegeneracy | A fibre E has complex dimension 1 and rank 2; a constant section over a curve has dimension 1 and rank 0; a point has dimension 0 and rank 0. | Retain dimension-zero convention.  [Previous review][previous]. |
| B1.4 rank/form criterion | On a fibre with form 2da∧db, top power is nonzero and rank=2. On a constant section, form=0 and rank=0<2. | Retain both directions.  [Previous review][previous]. |
| B1.5 top power | For type (1,2), (2da₁∧db₁+4da₂∧db₂)²=16 da₁∧db₁∧da₂∧db₂. On rank-2 tangent data in complex dimension 2 the square is 0. | Retain.  [Previous review][previous]. |
| B1.6 route | Pullback by [−1] gives coefficient (−1)²=1, by [2] coefficient 4; rank is unchanged for nonzero scalar multiplication. | Retain scaling and rank compatibility.  [Previous review][previous]. |
| B2.1 curve degeneracy | Zero section: total complex dimension 1, Betti rank 0, positive-dimensional constant-Betti fibre. A point: dimension 0, fibre dimension 0. | Retain positive-dimensional fibre condition.  [Previous review][previous]. |
| B2.3 bounded-degree torsion | Constant E/ℂ(t): trace E, quotient 0, infinitely many torsion points of degree 1. Twist ty²=x³−x becomes constant over degree 2, giving infinitely many torsion points of degree ≤2 despite zero original-field trace. | Retain zero geometric trace; R01 ownership.  [Previous review][previous]. |
| B2.4 fixed part | Constant elliptic family: invariant lattice rank 2, constant part dimension 1. Monodromy −I has invariant rank 0, changing to rank 2 on its double cover. | Retain finite-cover comparison; R01.  [Previous review][previous]. |
| B2.5 integer characters | In R/Z: annihilators of the whole circle, {0}, and {0,1/2} are 0, Z, and 2Z. Double annihilators recover each closed subgroup. | Retain disconnected subgroup case.  [Previous review][previous]. |
| B2.6 semirational counting | Arc (0,t) has rational first coordinate of height 1 for every t; the varying real second coordinate cannot be counted as a finite set of rational points. | Retain block alternative; R01.  [Previous review][previous]. |
| B2.7 word growth | Two free positive generators give 2ᵏ distinct words of length k, while entry heights grow at most Cᵏ. Thus word count is H^(log 2/log C), not logarithmic in H. | Retain bounded-height growth input.  [Previous review][previous]. |
| B2.8 Tits input | U=[[1,2],[0,1]], V=[[1,0],[2,1]] give UV=[[5,2],[2,1]], VU=[[1,2],[2,5]]. GL₁ is abelian and cannot contain this free pair. | Characteristic/virtual-solvability hypotheses retained; source uncertified.  [Previous review][previous]. |
| B2.9 invariance of domain | x↦x³ maps (−1,1) onto (−1,1); x↦x² maps it to [0,1), not open, and is not injective. In dimension 0, empty and singleton images are open. | Retain equal dimensions and injectivity.  [Previous review][previous]. |
| B2.10 constant rank | (x,y)↦x has rank 1 and fibres dimension 1=2−1. x↦x² has rank 0 at 0 and 1 elsewhere, so no constant-rank neighborhood at 0. | Retain local constant rank and regularity.  [Previous review][previous]. |
| B2.11 good covers | Nonempty convex intersections contract to a point and have π₁=0. An annulus has π₁=Z, so arbitrary coordinate opens do not suffice. Empty intersections require no centre. | Retain good-cover construction.  [Previous review][previous]. |
| B2.12 fixed Hom | Trivial monodromy on Z² yields Hom(Z²,Z²)=M₂(Z), rank 4 before the Hodge condition. −I invariants on Z² are 0; integral Hodge Hom remains a stricter condition than rational linear Hom. | Retain integral/Hodge conditions.  [Previous review][previous]. |
| B2.13 generic specialness | A constant genus-2 curve in its constant Jacobian is a trace image despite not being a torsion coset; zero-trace case leaves torsion translates only. | Retain GH definition.  [Previous review][previous]. |
| B2.14 Ax-type sets | The parabola (t,t²) has second derivative (0,2), so is not an affine line; a translated line has second derivative 0. Semialgebraic arcs alone do not force a coset without the Ax-type hypothesis. | Retain algebraic-origin hypothesis.  [Previous review][previous]. |
| B2.15 abelian Ax adapter | A translated elliptic subtorus lifts locally to an affine complex line, real dimension 2. A point lifts to dimension 0. An arbitrary real arc need not produce either algebraic coset. | Retain independent Ax input; R01.  [Previous review][previous]. |
| B2.16 transport | Parallel transport in a Betti chart preserves coordinate b; an N-torsion coordinate satisfies Nb=0 before and after transport. For b=1/2,N=2 the value is 0. | Retain transport domain.  [Previous review][previous]. |
| B2.17 free monodromy | The hyperbolic matrix [[2,1],[1,1]] has eigenvalues (3±√5)/2 but cyclic Zariski closure a torus; hyperbolicity alone supplies no free subgroup. | Retain semisimple nontrivial algebraic-monodromy argument.  [Previous review][previous]. |
| B2.18 invariant fibre subvarieties | Whole elliptic fibre has dimension 1; its invariant zero point has dimension 0; the orbit of a point of order 2 has at most 4 points. A finite orbit is not a positive-dimensional subtorus. | Retain irreducibility/components in the conclusion.  [Previous review][previous]. |
| B2.19 homology/trace | Constant elliptic family: fixed homology rank 2 and trace dimension 1, with rank=2·dimension. With zero fixed homology the connected constant part has dimension 0. | Retain finite-cover/trace comparison.  [Previous review][previous]. |
| B2.20 virtual invariance in kernels | Zero section over a curve lies in the kernel of the identity and has total dimension 1 but fibre dimension 0. | Retain fibrewise statement, not a false total-dimension bound.  [Previous review][previous]. |
| B2.21 maximal special pieces | Whole constant E has one maximal special piece E; a torsion point has one point piece; the empty set has zero. Uniform closure counts are 1,1,0. | Retain Heights input; R01 redundant gap.  [Previous review][previous]. |
| B2.22 degeneracy ⇒ specialness | A torsion section has rank 0 and is special; constant trace curves can have positive fibre dimension and remain generically special. | Retain trace part, not torsion-only conclusion.  [Previous review][previous]. |
| B2.23 full-rank points | Non-special curve has generic real rank 2; a torsion section has rank 0 and is excluded. Rank-2 locus is open, unlike a claim at every point. | Retain generic/open conclusion.  [Previous review][previous]. |
| B2.24 route | For a rank-2 fixed elliptic lattice, the constant part has dimension 1; after quotienting it the fixed rank is 0. Bounded-degree torsion of a constant factor would still be infinite. | Retain geometric trace quotient before torsion bound.  [Previous review][previous]. |
| B3.1 mixed Kuga carriers | V=0 recovers the pure datum. For a fibre E, quotient by translations through E is a point; quotient by {±1} is P¹, not an abelian quotient. | Retain connected normal subgroup condition; R01.  [Previous review][previous]. |
| B3.2 pure growth | Hyperbolic ball parameter T has area π(T+T⁻¹−2), zero at T=1. For integer translations the distance inequality is N²<T+T⁻¹−2; modular fundamental area π/3. | Retain normalizations and strict domain.  [Previous review][previous]. |
| B3.3 Ax–Schanuel growth | For full elliptic uniformization graph: ambient algebraic product dimension 2, graph dimension 1, difference 1 equals the bi-algebraic image dimension 1. | Retain mixed graph, not pure-only count.  [Previous review][previous]. |
| B3.4 stabilizer bigness | For a full elliptic fibre the translation stabilizer has dimension 1; for a point the connected translation stabilizer has dimension 0. | Retain actual stabilizer of the relevant analytic/algebraic locus.  [Previous review][previous]. |
| B3.5 normal quotient induction | Quotient of an elliptic fibre by itself lowers dimension 1→0; quotient by 0 leaves 1. A nonnormal finite action can yield genus 0 instead. | Retain normal quotient and dimension decrease.  [Previous review][previous]. |
| B3.6 weakly optimal data | A weakly special Y has defect 0. A proper weakly special subvariety also has defect 0, so equality of defects does not meet a strict optimality comparison. | Retain strictness.  [Previous review][previous]. |
| B3.7 t-degeneracy | A point admits no positive-dimensional subvariety and its degeneracy union is empty; a torsion section over a positive-dimensional base can be entirely degenerate. | Retain positive-dimensional witnesses.  [Previous review][previous]. |
| B3.8 closed degeneracy locus | Empty and whole-locus examples are Zariski closed. A single branch critical point can have derivative rank 0 without containing a positive-dimensional degeneracy witness. | Retain distinction from pointwise rank-drop locus.  [Previous review][previous]. |
| B3.9 quotient criterion | For X=E over a point, generic rank 2: rank<2l is false at l=1 and true at l=2. Identity quotient has image dimension 1, so 1<l gives the same two truth values. | Retain strict inequality and all quotient data.  [Previous review][previous]. |
| B3.10 route | Blow up a base point: exceptional P¹ can have constant modular image of dimension 0 despite base dimension 1. | Retain modular-image, not base-dimension, criterion.  [Previous review][previous]. |
| B4.1 full-level curves | Hyperelliptic involution acts by −I on homology: mod 2 it is I, mod 3 it is not. Identity Torelli comparison has sign +1 and translation 0. | Retain level ≥3; R01 ownership.  [Previous review][previous]. |
| B4.2 dominant product | Product of two elliptic fibre directions has rank 2+2=4 and dimension 2; a diagonal has rank 2 and dimension 1. | Retain dominance/dimension hypotheses.  [Previous review][previous]. |
| B4.3 fibre-power induction | Constant B×S with dim B=dim S=1, m=2: rank 4=2m dim B, modular-image dimension 2, total dimension 3. A claim of rank 6 would fail. | Retain generically finite modular-image condition for total-dimension corollary.  [Previous review][previous]. |
| B4.4 universal curve differences | g=2,M=4 over a fixed curve: C⁵ has dimension 5; generic difference image has dimension 5 and Betti rank 10 in J⁴ of dimension 8. | Retain M≥3g−2 and quasi-finite moduli hypothesis.  [Previous review][previous]. |
| B4.5 fibre-power criterion | For constant full elliptic family and m=2, rank 4 equals twice image dimension 2, not twice total dimension 3. | Retain image dimension.  [Previous review][previous]. |
| B4.6 differences | B³→B², (x₀,x₁,x₂)↦(x₁−x₀,x₂−x₀), has kernel diagonal B, image dimension 2 and rank 4 for elliptic B. For genus-2 C, C−C=J has dimension 2. | Retain sign and dimensions.  [Previous review][previous]. |
| B4.7 route | Differences eliminate a common translation: (x₁+t)−(x₀+t)=x₁−x₀. Reversing the convention multiplies each coordinate by −1. | Retain supplier [y]−[x] convention.  [Previous review][previous]. |
| F0.1 compact lattice limits | Maps ℓⁿ·id on Z_ℓ converge to 0; intersection of images ℓⁿZ_ℓ is 0. Constant identity sequence has image/intersection Z_ℓ. | Retain compactness and specified limit.  [Previous review][previous]. |
| F0.2 Frobenius polynomial | For E/F₅ with P=X²+2X+5, product E² has P²=X⁴+4X³+14X²+20X+25; reciprocity pairs 4 with 20=5·4. | Retain product and reciprocal normalization.  [Previous review][previous]. |
| F0.3 Weil numbers | π=1+i has conjugate norms √2 and is integral; 1 has norm 1≠√2. q=1 is excluded. | Retain integrality beyond pure-weight condition.  [Previous review][previous]. |
| F0.4 isotropic image | Standard alternating plane: span(e₁) has dimension 1 and restricted pairing 0; whole plane has pairing(e₁,e₂)=1. | Retain isotropic condition and Tate finiteness hypothesis.  [Previous review][previous]. |
| F0.5 point counts | q=2,t=1 gives #E(F₂)=2; trace of π² is 1−4=−3, giving #E(F₄)=5−(−3)=8. | Retain det(1−πʳ), r≥1.  [Previous review][previous]. |
| F0.8 construction route | g=1: integer polynomial has degree 2, constant q, and reciprocal root pair α,q/α. g=0: polynomial 1, degree 0, point count 1. | Retain imported integer/semisimple inputs.  [Previous review][previous]. |
| F2.1 shifted factors | P=X²(X−1), test X+πⁿ: resultant is π^(2n) times a unit, valuation 2n; multiplicity 2 is the slope. | Retain nonzero tests for sufficiently large n.  [Previous review][previous]. |
| F2.2 resultant recognition | P=X,Q=X², test X+πⁿ yields valuations n and 2n. P=X,Q=X+π, test X+π² gives 2 and 1. P=Q gives identical values. | Retain both separating tests and dense image.  [Previous review][previous]. |
| F2.2 density negative control | D=F₂⊂F₂[[t]], P=X+t,Q=X+t+t²: for every nonzero constant-coefficient test, both valuations equal its zero-root multiplicity; nevertheless P≠Q. | Density hypothesis excludes the example.  [Previous review][previous]. |
| F2.3 integer tests | Z→Z₂ and Z→Z₃ surject modulo pᴺ; at N=0 the ideal is the unit ideal. P=1 gives all resultants 1 and valuation 0. | Retain arbitrary DVR statement separately from specialization.  [Previous review][previous]. |
| F2.4 route | Over Z, P=2X+1,Q=2X+2 have size-(1,1) resultant 2. Mod 2 the fixed-size resultant is 0, but the default size-(0,0) resultant of 1 and 0 is 1. | Retain fixed Sylvester sizes and nonzero resultants.  [Previous review][previous]. |
| F1.1 degree/length | [p] on dimension g has degree p^(2g); Dieudonné cokernel length is 2g. At g=0 both valuation and length are 0. | Retain all p, including 2.  [Previous review][previous]. |
| F1.3 characteristic polynomial | On E², the unipotent map [[1,1],[0,1]] has polynomial (X−1)⁴ but is not semisimple. Frobenius semisimplicity is a separate imported assertion. | Retain polynomial comparison for arbitrary endomorphisms.  [Previous review][previous]. |
| F1.4 block algebra | Degree a=1 gives the centre itself. At a=2 a splitting representation U=[[0,θ],[1,0]] satisfies U²=θI; algebra dimension is 4. | Retain cyclic relation, not U²=I.  [Previous review][previous]. |
| F1.5 Frobenius adapter | F=σ,V=pσ⁻¹ gives FV=p and Fᵃ=1 over the degree-a unramified coefficient field. | Retain semilinearity and q-Frobenius power.  [Previous review][previous]. |
| F1.6 central simplicity | The split degree-2 cyclic algebra is M₂(K): centre dimension 1, algebra dimension 4. Degree 1 gives K and invariant 0. | Retain central simplicity; not necessarily division.  [Previous review][previous]. |
| F1.11 local invariant | a=2, local degree 1, ord(π)=1 gives invariant 1/2 modulo Z; a=1 with integral valuation gives 0. | Retain normalized slope and local degree.  [Previous review][previous]. |
| F1.12 route | Contravariance sends uv to C(v)C(u); noncommuting 2×2 elementary matrices have distinct products. Polynomial determinant is unchanged by transpose. | Retain reversed composition without changing charpoly.  [Previous review][previous]. |
| F3.1a prescribed slopes | Gaussian split prime gives slopes 0 and 1. Real π=√2 has slope 1/2; adjoining i gives local degree 4 and two selected embeddings, ratio 2/4. | Retain real and ramified cases.  [Previous review][previous]. |
| F3.1b CM algebraization | For Q(i), ξ=i gives E(i,1)=2, E(1,i)=−2 and determinant 4. Replacing ξ by 2i gives determinant 16, so positivity alone does not fix a principal polarization. | Retain specified lattice/form and signs.  [Previous review][previous]. |
| F3.1c power effectivity | π=2,q=4 and π₀=2√−2,q₀=8 give π³/π₀²=−1; squaring kills it: π⁶=π₀⁴=64, q⁶=q₀⁴=4096. | Retain integrality at every finite place before Kronecker.  [Previous review][previous]. |
| F3.1d descent | Restriction from degree-2 field sends P_B(T)=(T−2)² to P_B(T²)=(T²−2)²; dimension doubles 1→2. | Retain induced module and separable extension.  [Previous review][previous]. |
| F3.2 Honda–Tate | π=1+i: centre degree 2,index 1, dimension 1. π=√2: centre degree 2,index 2, dimension 2; T²−2 alone cannot be an elliptic Frobenius polynomial. | Retain division-algebra index.  [Previous review][previous]. |
| F3.4 prime-field nonreal case | Nonreal ordinary elliptic π has slopes 0,1, hence invariants 0 modulo Z and commutative End⁰. Real √p gives a nonzero invariant and is excluded. | Retain nonreal hypothesis.  [Previous review][previous]. |
| F3.5 linear-dual p-realization | For rank-one block (F,V)=(1,p), integral linear dual retains (1,p); Cartier dual has (p,1). Characteristic polynomial of F remains X−1. | Retain linear dual, not Cartier dual.  [Previous review][previous]. |
| F3.7 lattice realization adapter | Marking p⁻¹id gives supplied contravariant lattice pC, whose integral dual is p⁻¹D. Identity gives C and D. | Retain inverse and dual directions.  [Previous review][previous]. |
| F3.8 order realization | At p=5, π=√5ζ₅ in Q(ζ₅) has local valuation 2, whereas a maximal-order uniformizer has valuation 1; containing π need not mean maximal order. | Retain admissible-order hypothesis and characteristic-prime condition.  [Previous review][previous]. |
| F3.10 marked/unmarked quotient | Marking p and then p⁻¹ returns the identity lattice. For arbitrary u, covariant action is dual of C(u), while the contravariant marked action is C(u⁻¹). | Retain both actions and orbit comparison.  [Previous review][previous]. |
| F3.11 route | g=0 yields one marked tuple and one unmarked class; repeated Frobenius factors remain nonzero-dimensional blocks for g>0. | Retain native carriers and all-prime finite support.  [Previous review][previous]. |
| F4.1 adelic class set | G=G_m over Q at maximal compact gives the ideal class set of Z, cardinal 1. Trivial group also gives one double coset. | Retain rational-left/compact-right convention.  [Previous review][previous]. |
| F4.2 p-component | Ordinary rank-two block F=diag(1,p), V=diag(p,1) has FV=pI. F-stability alone does not replace the displayed V-stability condition. | Retain both integral operators.  [Previous review][previous]. |
| F4.3 ordered unequal roots | P=(X²+p)² has ordinary discriminant 0, but eight ordered unequal-root differences give D_*=(4p)⁴. Scalar-root polynomial gives empty product 1. | Retain D_* distinct from discriminant.  [Previous review][previous]. |
| F4.4 local bounds | diag(0,ℓ) has Δ=2 and two lattice-orbit types; bound ℓ⁸≥2. A glued lattice has compact stabilizer index ℓ−1≤ℓ⁸. At ℓ=2 bound 256, versus stale 16/4. | Mathematics retained; R01 contract mismatch.  [Previous review][previous]. |
| F4.5 stabilizers/finite support | One bad prime with v_ℓ(D_*)=2 gives ℓ⁸; all other primes contribute 1. No bad primes gives product 1. | Retain almost-everywhere standard lattices.  [Previous review][previous]. |
| F4.6 reduced norms | Q(i) has class number 1. Q(√3) has ordinary class number 1 but narrow class number 2, so discarding positivity changes the class-set bound. | Retain archimedean norm condition.  [Previous review][previous]. |
| F4.7 double coset map | In S₃ with Γ=K=⟨(12)⟩ and a=(123), Γ\G/K and Γ\G/a⁻¹Ka have class sizes 2,4. Right multiplication by a respects both classes; conjugation fails. | Retain repaired right-multiplication bijection.  [Previous review][previous]. |
| F4.8 coarse count | For two unequal roots, D_*≤(2√p)²; raising to exponent 8 gives (2√p)¹⁶. Scalar case contributes D_*=1. | Retain stated coarse exponent, not a sharp claim.  [Previous review][previous]. |
| F4.9 route | Empty prime support gives stabilizer product 1, not 0. Repeated roots give disc(P)=0 but D_*>0 as in F4.3. | Retain finite-support and unequal-root arguments.  [Previous review][previous]. |
| F5.1 Lang | On an abelian variety d(F−id)=−I, including p=2 where −1=1≠0. On a constant Z/2 group F−id=0 and is not onto. | Retain smooth connected group hypothesis.  [Previous review][previous]. |
| F5.2 norm-unit quotient | Q(i)/Q: norms of units are {1}; units of Q that are norms are also {1}. Quotient cardinal 1. Norm(±i)=1. | Retain units-that-are-norms distinction.  [Previous review][previous]. |
| F5.3 density | The nine quadratic square classes are independent: prime valuations and the negative sign force all nine exponents to vanish. There are 512 sign patterns; one has no split field, giving density 511/512. | Retain finite ramified exclusions.  [Previous review][previous]. |
| F5.4 CM elliptic existence | π=2+i has norm 5, trace 4 and point count 5+1−4=2; full ring is Z[i]. Inert primes do not supply this ordinary split construction. | Retain splitting assumption for this target.  [Previous review][previous]. |
| F5.5 point groups | q=2,t=±1 gives 2 or 4 points, both 2-powers; over F₄ the same curves have 8 points. This refutes an unrestricted odd-prime conclusion. | Retain odd characteristic and separate p=2 treatment.  [Previous review][previous]. |
| F5.6 line bundles | On E, O(0) has degree 1 and positive polarization; O(−0) has degree −1 and the opposite homomorphism. A symmetric map need not be ample. | Retain positivity and finite-field descent.  [Previous review][previous]. |
| F5.7 unitary mass | Gaussian rank 1: one class, automorphism order 4, mass 1/4. Rank 0 gives one class and mass 1. Factorial products at ranks 1,2,3 are 1,1,2; asymptotic log product has coefficient 1/2. | Retain corrected 1/2 and all local factors; R01 ownership.  [Previous review][previous]. |
| F5.8 polarizations on CM powers | For E with End=Z[i], rank-one positive unimodular Hermitian form is [1], one polarization orbit; [2] has determinant 2 and is not principal. | Retain unimodular/positive conditions.  [Previous review][previous]. |
| F5.9 squarefree bound | E has simple-factor multiplicity 1; E² has multiplicity 2 and is excluded. Dimension zero is an empty factor list, empty product 1. | Retain squarefree nonreal scope.  [Previous review][previous]. |
| F5.10 route | Hermitian form H(i,i)=conj(i)i=1; replacing conjugate transpose by transpose gives −1. Weighted class count 1/4 differs from unweighted 1 already at rank 1. | Retain involution and mass-to-class comparison.  [Previous review][previous]. |
| F6.0 dimension carrier | Zero abelian variety has dimension 0; E and E² have dimensions 1 and 2. The field carrier excludes zero rings. | Retain native finite-dimension subtype.  [Previous review][previous]. |
| F6.0 isogeny quotient | [p] has degree p^(2g), including inseparable cases. Isomorphic curves are isogenous; polarizations do not change the underlying class. | Retain finite-surjective predicate and quotient closure.  [Previous review][previous]. |
| F6.0 isomorphism quotient | Over F₅, y²=x³+x and y²=x³−x have 4 and 8 points, so cannot be F₅-isomorphic. Changing only a polarization does not create a new unpolarized class. | Retain native isomorphisms.  [Previous review][previous]. |
| F6.3 upper count | log((4g+1)^g q^(g(g+1)/4))/g² = log(q)/4 + log(4g+1)/g + log(q)/(4g). The final two terms tend to 0. | Retain fixed q and g→∞.  [Previous review][previous]. |
| F6.4 coarse isomorphism bound | Lee's bound gives log B(p,g)/g² ≤34log2+(69/4)(1+o(1))log p. For fixed p this is bounded. At g=0, count=1 and log=0. | Retain O_p(g²); no unsupported sharp exponent.  [Previous review][previous]. |
| F6.5 finite-n lower bound | q=2 gives r(q)=1/2; factor r(q)q^(n/2)−n is √2/2−1<0 at n=1, 0 at n=8, and 6 at n=10. | Retain genuine lower bound even when vacuous at small n.  [Previous review][previous]. |
| F6.5 asymptotic headline | Logarithm of the factorial/polynomial corrections is O(g log g), divided by g² tends to 0; upper and lower leading coefficients both log(q)/4. At g=0 Lean's 0/0=0 does not affect atTop. | Retain finiteness conjunct and full finite-field scope.  [Previous review][previous]. |
| F6.6 excluded ppav proportion | Numerator log=O(g²), denominator log≥(1/2)g²log g+O(g²); log ratio tends to −∞ and ratio to 0. | Retain stated prime-density hypothesis.  [Previous review][previous]. |
| F6.7 route | Combining bounds preserves the leading coefficient 1/4 for isogenies and 1/2 for the Hermitian denominator; g=0 contributes log1=0. | Retain independent class-finiteness inputs.  [Previous review][previous]. |
| Seed: SchemeAndStackFoundations | Proper elliptic family with coherent coefficients: formal-functions comparison retains the completed module; square-zero tangent thickening has ε²=0 and one extra tangent direction, unlike the reduced point. | No omission of proper/coherent/Noetherian conditions established.  [Previous review][previous]. |
| Seed: parent universal extension | Elliptic universal connection: Lie dimension 2 and vector kernel dimension 1; replacing A♮ by A gives dimension 1, the wrong object. | Resolved A4.2–A4.3.  [Previous review][previous]. |
| Seed: parent Rosati/Riemann conventions | λ principal and [n]: Rosati([n])=[n]. In Q(i), conjugation sends i→−i and i·i†=1; E(i,1)=2 while E(1,i)=−2. | Resolved A3.9/A5/A6.14.  [Previous review][previous]. |
| Seed: parent Hom and polynomial | Hom(0,E)=0; End(E) has positive rank. [n] on elliptic E has charpoly (X−n)² and degree n²; n=0 gives determinant 0. | Resolved A6.2/7/10/11.  [Previous review][previous]. |
| Seed: parent reducibility/semisimplicity | E² decomposes into two elliptic factors; scalar Frobenius −3 has semisimple action and commutant M₂, dimension 4 despite repeated roots. | Resolved A6.5/8/21.  [Previous review][previous]. |
| Seed: parent level and restriction | −I is identity mod 2 but not mod 3. Degree-2 separable restriction multiplies dimension 1→2; nonreduced restriction is not covered. | Resolved A6.18/32/33.  [Previous review][previous]. |
| Seed: ComplexComparisonPartII | On a trivial rank-2 holomorphic bundle, ∂̄ acts componentwise, kernel is two holomorphic functions and ∂̄²=0. | Bundle-valued C1.1, not scalar-only.  [Previous review][previous]. |
| Seed: FiniteFlat, étale and p-realization | In characteristic p, μ_p has rank p but only one geometric point; the constant Z/p has p points. Contravariant F,V satisfy FV=p; Cartier dual swaps them. | R07.1.2 not applied to nonétale μ_p; R07.2.10 retained.  [Previous review][previous]. |
| Seed: FiniteFlat, commutant | For scalar −3 over F₉ and L=Q₃(i), F=[[0,−3],[1,0]]σ has L-linear commuting matrices [[a,−3σ(b)],[b,σ(a)]], a,b∈L: Q₃-dimension 4, not 8. | Retain Witt-linearity and polynomial descent.  [Previous review][previous]. |
| Seed: Jacobian | (x,y)↦[y]−[x] gives 0 at x=y; exchanging x,y negates it. Three points give ([x₁]−[x₀],[x₂]−[x₀]), two target coordinates. | Resolved §2.6/§5.3/§7.2.  [Previous review][previous]. |
| Seed: DWP purity and Frobenius | π=(1+√−7)/2 has norm √2 and trace 1; π⁻¹ has norm 1/√2. The determinants of 1−π and 1−π⁻¹ are 2 and 1 respectively. | Resolved both sampled DWP occurrences.  [Previous review][previous]. |

## Not verifiable

- Tits, *Free subgroups in linear groups*, Theorem 1, printed p.250, and Theorem 3, printed p.251: carried forward as settled `uncertified`. The legal text is not in the supplied readable sources and was not requested again.
- This is the specified incremental review. Unchanged source checks and mathematical rows are attributed to the previous report; the full roadmap and every paper were not recertified from scratch. All newly cited KS passages were readable. No new source request is pending, and declared supplier gaps were not treated as missing texts.
- Ownership was checked against the provided open-head index and available sibling files for the changed objects. That is not a claim to have re-reviewed the unrelated contents of those open roadmaps.

## Source issues

The following previously reported misprint was encountered again while checking the dependent integral comparison. No new source mistake was found in the added P2.5/P3.2 locators; the other unchanged errata remain recorded in the previous review.

- **Misprint** in KS at proof of Lemma 5.11(1), linked version p.61 (KS line 2821): the source says both first-level splittings follow from equation (5.2.1); it should cite (5.2.1) and (5.2.2); affects nothing.

[previous]: packages/AbelianSchemesAndArithmeticModuliPartII/reports/PRREVIEW-AbelianSchemesAndArithmeticModuliPartII~4.md
