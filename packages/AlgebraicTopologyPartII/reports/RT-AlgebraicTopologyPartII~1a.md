<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1073#issuecomment-6399923375 -->
Red team round 1 pass a (codex) of a8a4623

Verdict: needs_changes

1. **F01** (P2) The strong Pham retraction is a statable missing headline

   **Location:** `packages/AlgebraicTopologyPartII/README.md:702,719`; `packages/AlgebraicTopologyPartII/Suggested.lean:16`. The README requires “the homotopy fixes every skeleton point.”

   **Claim:** The roadmap owns the explicit Fermat retraction, but the acceptance file only mentions the unavailable finite-join identification and contains no retraction theorem.

   **Witness:** `Mathlib/Topology/Homotopy/Basic.lean:541` supplies `ContinuousMap.HomotopyRel`. Fibre and skeleton are explicit subtypes of `Fin n → ℂ`; their inclusion is continuous. No join carrier is needed.

   **Exact repair:** “Define X={z : Fin n→ℂ | ∑ᵢ zᵢ^k=1} and S={z:X | ∀i, (zᵢ^k).im=0 ∧ 0≤(zᵢ^k).re}. For n,k≥2, state an admitted theorem asserting a continuous r:X→S with r∘ι=id and a homotopy relative to ι(S) from id_X to ι∘r.” Keep the join identification in the not-statable list. This is the specified strong geometric retraction, not its bouquet or rank corollary.

   **Retest:** At n=k=2, (1,0) is fixed throughout; (√2,i) is in X but not S, so the identity map cannot satisfy the endpoint condition. The existing bouquet equivalence provides neither this inclusion nor this relative homotopy. The previous repair's deletion of route/corollary signatures does not justify omitting this independent geometric endpoint.

2. **F02** (P2) Pham's retraction is restricted to equal exponents

   **Location:** `packages/AlgebraicTopologyPartII/README.md:702`. “For k≥2,n≥2, X={z∈ℂ^n:∑z_i^k=1}”.

   **Claim:** The geometric retraction and positive-value product are planned only for the diagonal equal-exponent case, despite the general finite-join target immediately preceding them.

   **Witness:** PHAM lines 118–125 introduce independently indexed positive exponents; PHAM lines 204–221 construct the equivariant retraction for that indexed family. The source is not restricted to a common k.

   **Exact repair:** “For n≥2 and integers k_i≥1, X={∑ᵢz_i^{k_i}=1} strongly deformation retracts onto S={z∈X | every z_i^{k_i} is real and nonnegative}, equivariantly for ∏ᵢμ_{k_i}. The skeleton is the join of the μ_{k_i}. Positive-value scaling z_i↦t^{-1/k_i}z_i identifies {∑ᵢz_i^{k_i}=t>0} with X×(0,∞); its bouquet count is ∏ᵢ(k_i−1).” Carry this generality into the retraction acceptance theorem; keep the common-k examples as Checks.

   **Retest:** k=(2,3) gives the complete bipartite skeleton K₂,₃, with 6−5+1=2 circles; coordinate scaling gives t^{-1}z₁²+t^{-1}z₂³=1. k=(1,3) has a singleton join factor and bouquet count 0. Neither case is covered by the current common-k statement.

3. **F03** (P1) Filtered-coefficient comparison is attributed to a supplier that does not state it

   **Location:** `packages/AlgebraicTopologyPartII/README.md:1048,1102`. “exact filtered-colimit comparison from MotivesAndAlgebraicCycles §7.6a”.

   **Claim:** The passage from finitely generated or finite coefficients to arbitrary G-modules is supplied by that section.

   **Witness:** `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:1382`–1391 contains no coefficient-colimit comparison. The actual generic owner is `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3402`, `cohomology_filtered_colimits`, with finite-cover, finite-intersection and terminal-object hypotheses.

   **Exact repair:** “Consume SchemeAndStackFoundations §2.5, cohomology_filtered_colimits. For the finite semialgebraic open-cover site verify its basis, cofinal-cover, finite Čech-intersection and terminal-object hypotheses. Deduce the equivariant comparison using the degreewise finite-rank resolution of C₂, and the relative comparison using the extension-by-zero sequence. Use these comparisons for the coefficient-colimit passages in §§11.1 and 11.5.” Add this supplier and the local specialization target to their Needs lines; alternatively declare the precise specialization as a matching supplier gap.

   **Retest:** For M=colim ℤ/2ʳ=ℚ₂/ℤ₂ with trivial action at a point, the odd positive groups have colimit ℤ/2 and the even positive groups have colimit 0, agreeing with M[2] and M/2M. Exactness of filtered colimits alone would not identify these with derived sections. The finite-site hypotheses exclude the infinite-discrete counterexample ⊕ℤ→∏ℤ in the supplier's Check.

4. **F04** (P3) Stable-diagonal truncation uses the wrong support inequality

   **Location:** `packages/AlgebraicTopologyPartII/README.md:509`. “The support lower bound excludes m(n−3)>j”.

   **Claim:** The lower compact-support bound proves stabilization of the sum over m.

   **Witness:** n=4,m=2,j=0 asks for compact degree 6. The lower bound is 3≤6 and excludes nothing; the upper bound 6>4 gives vanishing.

   **Exact repair:** “The upper support bound H_c^a(PConf_m)=0 for a>2m excludes m(n−3)>j, since a=m(n−1)−j. Treat m=0 by its degree-zero exception.”

   **Retest:** For (n,m,j)=(4,2,0), a=6>4; at (4,1,1), a=2=2m and the contribution 1 is retained.

5. **F05** (P2) Euler-factorization agreement points forward to a theorem that depends on it

   **Location:** `packages/AlgebraicTopologyPartII/README.md:445,447,477`. Section 3.1 requires agreement with the Möbius quotient, then sends its proof to §3.2; §3.2 Needs §3.1.

   **Claim:** Section 3.1 is completed before the Möbius formula of §3.2, including the quotient's divisibility and equality with the constructed exponents.

   **Witness:** The unique integral factorization can be built without division; identifying its exponents with the specified quotient is exactly §3.2's formula. Thus that part of §3.1 consumes its own downstream consumer.

   **Exact repair:** “Section 3.1 constructs the unique positive-index integral Euler-factorization sequence. Section 3.2 proves the Möbius formula, divisibility of its numerator, and equality with eulerExponent. Only after §3.2 may eulerExponent replace the constructed sequence in later products.” Remove quotient agreement from §3.1's deliverables and forward proof reference.

   **Retest:** At even n,N=2, coefficient cancellation first gives e₁=−2,e₂=−1; §3.2 then proves numerator −2 is divisible by 2 and yields e₂=−1. Neither step needs its own conclusion as input.

6. **F06** (P3) The connectivity locator points to a mapping-space comparison

   **Location:** `packages/AlgebraicTopologyPartII/README.md:732`. “BS, §7, Lemma 7.2, pp.940–941”.

   **Claim:** This locator supports π₂X=π₃X=0 and simple connectivity of the Fermat double loop for n≥5.

   **Witness:** BS lines 2174–2194 identify a nonempty constrained mapping space with Ω²X. They state no vanishing of π₂X or π₃X and no simple-connectivity conclusion.

   **Exact repair:** Replace this citation by “PHAM, Part I §2, deformation-retraction lemma, pp.337–338; §§5.2–5.3 and the supplied native homotopy-loop shifts.” If BS Lemma 7.2 is retained as motivation, label it explicitly as the separate downstream mapping-space comparison.

   **Retest:** X≃S⁴ at n=5,k=2 has π₂=π₃=0; X≃S³ at n=4,k=2 has π₃=ℤ. The corrected argument distinguishes them; the cited mapping-space equivalence alone does not.

7. **F07** (P2) The adjacent cyclic reduction statement needs n positive

   **Location:** `packages/AlgebraicTopologyPartII/README.md:1383`. “For n even and A=ℤ/n” and “Under their standard 𝔽₂ identifications”.

   **Claim:** Both sign-coefficient groups H¹(C₂,A) and H²(C₂,A) have the indicated 𝔽₂ identifications for every even n. The global convention permits n=0; this separately quantified statement has no reference to §15.1's positive degree.

   **Witness:** At n=0, A=ℤ, so H¹(C₂,ℤ(1))=ℤ/2 but H²(C₂,ℤ(1))=ℤ[2]=0. There is no H²≅𝔽₂ identification. This also follows from the roadmap's own §7.3.

   **Exact repair:** Replace the opening by “For a positive even integer n and A=ℤ/n with sign action, …”. Add: “At n=0 the groups are ℤ/2 and 0; the degree-two 𝔽₂ identification is unavailable, so this case is excluded.”

   **Retest:** n=2,4,6 give degree-one reduction 1,1,1 and degree-two reduction 1,0,1; n=0 no longer enters the assertion. Section 15.6 already imposes positive even n.

8. **F08** (P3) The lifting criterion's only Check tests no mathematical assertion

   **Location:** `packages/AlgebraicTopologyPartII/README.md:1364`. “No Brauer class is a hypothesis”.

   **Claim:** This is the sole Check for the obstruction-to-lifting criterion. It cannot distinguish that criterion from the false assertion that every a lifts.

   **Witness:** In a constant fixed-point model with n=2 and two fixed sheets, H²(C₂,ℤ(1)⊕Q(1))=0 but H²(C₂,ℤ/2)=𝔽₂. Its nonzero class has nonzero pulled-back Bockstein and does not lift.

   **Exact repair:** Replace this Check with: “For two fixed sheets over a fixed point, the nonzero a has pulled-back Bockstein (1,1) in H³(C₂,ℤ(1)²) and cannot lift. For two exchanged sheets, P=ℤ[C₂], Q(1)=ℤ with trivial action: the nonzero ζ∈H²(C₂,Q(1)) maps to a=1, while upstairs H³=0. For n=1, ℤ/n=0 and a=η=ζ=0 is a lift.” These are constant local models of the mixed sequence, not claims about a zero-dimensional replacement of the surface theorem.

   **Retest:** The obstruction and image are respectively nonzero/zero in the first model, zero/all of 𝔽₂ in the second, and zero/zero in the third. The unqualified lifting assertion fails the first test. Both two-sheet models occur for the finite map p(x,y)=(x²,y) between smooth connected complex surfaces, on small conjugation-invariant balls about (1,0) and (−1,0), respectively.

## Verified sound

Read all 1,515 README lines and all 169 Lean lines. The declaration ledger has **15 rows: 11 definitions/abbreviations and four theorems**. The README ledger has **74 target rows: 16 bold supplier-contract targets and 58 numbered targets**. All **78 Check blocks, comprising 202 bullets**, were read; the concrete cases are recomputed below. Instructions such as “do not assert” are not counted as numerical tests. The tables record 74 target-level instance tests and 15 declaration-level tests, often with several values per row. A passing instance is evidence about that instance, not a proof of the general theorem. Rows referring to findings remain unresolved.

Compared all 15 supplied elaborated signatures with the actual definitions and README: **zero lost section binders**. There is no standing `variable` block. The signatures below explicitly record their instance contexts. No Lean command was run: the supplied elaboration artifact was used under the read-only/no-build instruction.

The four admitted theorems are substantive acceptance statements. None is a one-tactic consequence, definition unfolding, small-value computation or boundary-case lemma at the pins. The 11 supporting definitions all occur in these theorems. The field, topology, finite-dimensionality and homotopy-equivalence hypotheses are retained. In particular, both numerical homotopy/cohomology statements assert finite dimensionality; infinite-dimensional `finrank = 0` cannot make them vacuous.

### Declaration and binder ledger

Here `C(X,Y)` means continuous maps, `Sᵈ` is the native norm-one sphere in ℝᵈ⁺¹, and all unstated indices in the Lean signatures are natural numbers. No characteristic-zero instance is silently assumed on the finite field F.

| Declaration; README section; context | Instances and computed values on both sides | Result / change |
|---|---|---|
| `orderedConfiguration`; §2.4; m:ℕ, subtype of `Fin m → ℂ` | m=0: one empty injection; m=1: every complex coordinate; m=2: (0,1) injective, (0,0) not injective | Product/subspace topology agrees; no change |
| `configurationPermutation`; §2.4; m, σ∈S_m, native continuous map | σ=(123), τ=(12): σ·(τ·(a,b,c))=(c,b,a)=(στ)·(a,b,c); m=0 identity; (12)² acts identically | Inverse-coordinate convention gives a left action; no change |
| `configurationTraceFormula`; §2.4; F:Type, `[Field F] [Fintype F]`, m, arbitrary χ:Multiset ℕ→ℚ | q=2, χ=1, m=0,1,2,3: polynomial counts 1,2,2,4 equal trace sums. At q=3,m=3 the indicators of partitions 111,21,3 give 1,9,8; the character formulas give (27−27+6)/6=1, (27−9)/2=9, (27−3)/3=8 | Inverses have the same full cycle partition; m=0 denominator 0!=1; no change |
| `eulerExponent`; §3.1; n,N,r:ℕ, integer division | r=0: empty divisor sum and integer 0/0 both give 0. N=0 gives 0. N=2, r=1,2,3: even n gives −2,−1,−2; odd n gives 2,−3,2 | Total definition sound; quotient agreement/order requires R05 |
| `unitSphere`; §4.4; s:ℕ | s=0 gives {−1,1}; s=1: ‖(1,0)‖=1 but ‖0‖=0; s=2 gives S² rather than S¹ | Dimension and radius fixed; no change |
| `sphereBouquet`; §4.3; s,N:ℕ, x:unitSphere s | N=0 is one wedge point; N=1 is Sˢ; N=2,s=2 has H₂ rank 2, whereas S²∧S² has H₂ rank 0 | Native pointed quotient, not smash; no change |
| `IsTame`; §4.1; implicit n, f:MvPolynomial (Fin n) ℂ | f=z₁ has gradient norm 1; n≥2 constant f has noncompact critical locus and fails. For x²y−x at (t,1/(2t)), gradient=(0,t²) tends to 0 while the point escapes. n=0 constant f satisfies the definition with compact whole singleton | The theorem's n≥2 excludes the last boundary; no change |
| `jacobianAlgebra`; §4.2; implicit n,f | f=x³+y³−1 gives ℂ[x,y]/(x²,y²), basis 1,x,y,xy; f=x gives zero algebra; x³−3x+y² gives ℂ[x]/(x²−1) | Nilpotents retained, zero algebra allowed; no change |
| `milnorNumber`; §4.2; implicit n,f | The preceding three algebras have finranks 4,0,2. A constant polynomial in positive dimension has infinite-dimensional Jacobian algebra but native finrank 0 | Finite-dimensionality is separately asserted in the headline; no change |
| `fiberMilnorNumber`; §4.2; implicit n,f,a:ℂ | For x³+y³−1, multiplication by f is −1: μ⁻¹=4, μ⁰=0. For x³−3x+y²: μ⁻²=μ²=1. On ℂ[t]/t³, multiplication by t² has generalized zero space dimension 3, kernel and quotient dimension 2 | The native maximum generalized eigenspace is the correct object; no change |
| `polynomialFiber`; §4.2; implicit n,f,a | f=z₁ gives {z₁=a}≅ℂⁿ⁻¹; constant c at a≠c gives empty fibre; x²+y²−1 at 0 contains (1,0), not (0,0) | Native equation/subspace carrier; no change |
| `tameFibreBouquet`; §4.2; explicit n≥2, f, hf:IsTame f, a, x:Sⁿ⁻¹ | f=x³−3x+y²: a=0 yields 2−0=2 circles; a=±2 yields 2−1=1 circle. f=z₁ yields 0−0=0 summands, hence a point. Fermat critical value −1 yields μ−μ=0 | Natural subtraction agrees with μᵃ≤μ; no change |
| `rationalBouquetRanks`; §4.5; s,N,k,x; Y:Type `[TopologicalSpace Y]`, y:Y, actual homotopy equivalence to bouquet Sˢ⁺² | Two S²: π₂,π₃,π₄ rational ranks 2,3,2 equal signed exponents 2,−(−3),2. One S³: rank 1 in degree 3, 0 otherwise. N=0: ranks and exponents 0 | No missing pointed-equivalence assumption: connected simply connected bouquet permits basepoint transport; no change |
| `doubleLoopFactor`; §5.1; n,N,r with explicit n≥4,r>0 | n=4,N=1: r=1 gives 1+t, r>1 gives 1. n=5,N=1: r=1 gives (1−t²)⁻¹, r=2 gives 1+t⁵. n=4,r=2 begins in degree 3 | `binomialSeries` uses (1+X)^a; the substituted sign gives the claimed factor; no change |
| `doubleLoopBetti`; §5.1; s,N,j,x; Y `[TopologicalSpace Y]`, y, actual equivalence to bouquet Sˢ⁺³ | N=0: coefficients 1,0,0,…; n=4,N=1: 1,1,0,…; n=5,N=1 through degree 8: 1,0,1,0,1,1,1,1,1. j=0 uses empty product 1 on both sides | r>j has least possible degree r−1≥j, with equality r=j+1 only when n=4; then r(n−2)−1=2j+1>j. Thus omitted factors cannot contribute; no change |

### README target ledger: supplied carriers

These 16 targets are explicitly marked as consumed supplier contracts; restating their required interface here is not a second ownership claim. Semialgebraic tests use the finite-cover site, not the ordinary order topology over a non-Archimedean field.

| Bold target; README line | Instances and computed values | Result / change |
|---|---|---|
| Ordered/unordered configurations; 127 | Empty index: both spaces singleton even for X=∅. One-point X,m=2: both empty. (0,2) over ℤ has difference 2, not a unit. Zero ring: formal coefficient-tuple functor singleton, injective two-tuple functor empty | General-topology/zero-ring extension is declared; no finding |
| Configuration permutation torsor; 146 | m=0,1: group order 1, identity cover. T²+T over 𝔽₂: distinct roots 0,1, two ordered sheets, although 2!=0 | Constant étale S₂ still has two elements in characteristic 2; no change |
| Plane/disc comparison; 153 | z=0 maps to 0; z=1 maps to 1/2, whose inverse is 1; boundary ‖w‖=1 makes inverse denominator 0 and is excluded | Open-disc convention sound |
| Real/complex semialgebraic loci; 183 | A¹(C)=R², fixed coordinates y=0 give R. x²+1 has two conjugate complex points, zero real points. A square-zero thickening has the same point locus as its reduction | Finite-type/separated and field hypotheses retained |
| Equivariant cohomology; 200 | Fixed point sign coefficients: H¹=𝔽₂. Free two-point orbit: H⁰=ℤ, H¹=H²=0. Empty support: every group 0 | Derived invariants distinguished from ordinary invariants |
| Real-locus pair; 217 | Spec R: pair groups 0 but supported H⁰=ℤ,H²=𝔽₂. Spec C over R: pair equals ambient, H⁰=ℤ and higher groups 0 | Pair versus support not conflated |
| Free descent/dimension; 234 | Free orbit and point quotient have (H⁰,H¹,H²)=(ℤ,0,0). Fixed point instead has H²=𝔽₂; dropping freeness fails | Declared quotient/site/dimension gaps cover missing inputs |
| Ordinary comparison over ℝ; 241 | Point: both H⁰=ℤ. Circle: both (H⁰,H¹)=(ℤ,ℤ). Open interval: both H⁰=ℤ, H¹=0, although the interval is not compact | No arbitrary-real-closed singular comparison asserted |
| Twists/regular coefficients; 247 | ℤ(1) action −1, ℤ(2) action +1; on 𝔽₂ both +1. H²(C₂,ℤ[C₂])=0 versus H²(C₂,ℤ²_triv)=𝔽₂² | Regular, diagonal action matters |
| Fixed mod-two coordinates; 264 | Point gives one 𝔽₂ in each degree. S¹ gives dimensions 1 in degree 0 and 2 in every positive degree. Empty Y gives zero in every degree | Tensor/Künneth coordinates have required low-degree terms |
| Orientation sheaf; 270 | det(conjugation on ℂ)=−1, on ℂ²=+1. RP² has sign monodromy −1, reduced modulo 2 becomes +1 | Orientation twist consistent with Gysin |
| Exceptional inverse image; 287 | Identity: f!F=F, counit id. Open interval inclusion: restriction. Closed pt↪ℝ: i!ℤ=ℤ[−1], whereas i*ℤ=ℤ[0] | Relative support distinguishes exceptional from ordinary pullback |
| Orientation formula/finite duality; 304 | ℝ→pt gives ℤ[1] and H_c¹=ℤ. Point with ℤ/4: ⟨1,1⟩=1/4 and both adjoints are isomorphisms. Infinite ⊕𝔽₂: dual ∏𝔽₂ and bidual evaluation not onto | Finite stalk restriction corrects the source's excess generality |
| Semialgebraic Gysin/trace; 311 | pt→S¹ sends 1 to generator in degree 1; S¹→pt integrates generator to 1; identity shifts degree by 0 | Real shift c has correct direction |
| Equivariant purity/Gysin; 318 | pt→P¹: complex shift 2, real shift 1, complex source twist −1. Conjugation determinant on normal complex line is −1 | Two shifts are not interchanged |
| Steenrod operations; 325 | RP²: Sq¹a=a²≠0, Sq²a=0. S¹: Sq¹a=a²=0. Unit: Sq⁰1=1, positive squares 0 | Instability and Bockstein normalization agree |

### README target ledger: numbered targets

For cohomology rows, omitted negative degrees mean zero. A trace or pairing row computes the specified map, not just the cardinality of its source.

| Target; README line | Instances and computed values on both sides | Result / change |
|---|---|---|
| 2.1 Split arrangement purity; 382 | Empty arrangement in A¹: ordinary H⁰=ℚℓ, compact H²=ℚℓ(−1). PConf₂: ordinary ranks (1,1) in degrees (0,1), compact ranks (1,1) in (4,3); Frobenius q on ordinary H¹ | Correct ordinary/compact degree and Tate conventions |
| 2.3 Tensor permutation character; 395 | N=2,m=2: identity trace 4, transposition 2s_n. m=3: identity 8, three-cycle 2. m=N=0: tensor-unit trace 1=0⁰ | Nonabelian S₃ and zero tensor tested |
| 2.4 Configuration trace; 408 | q=2,m=2: squarefree monics 2=q²−q=4−2. q=3,m=3 partition indicators give 1,9,8 as in Lean ledger; m=0 gives χ(∅) | Full cycle type includes fixed points |
| 3.1 Integral Euler factorization; 443 | Even n,N=1: e₁=−1, product 1−T. Odd n,N=1: e₁=1,e₂=−1, product (1−T²)/(1−T)=1+T. N=0 product 1 | Arithmetic sound; R05 proof order |
| 3.2 Möbius formula; 466 | Even n,N=2 numerators −2,−2,−6 divided by 1,2,3 give −2,−1,−2. Odd n numerators 2,−6,6 give 2,−3,2 | Positive denominators and divisibility pass these tests |
| 3.3 Squarefree Euler product; 479 | c=1: coefficients 1,q,q²−q; c=−1: 1,−q,0; c=0: 1,0,0. These equal (1−qU²)/(1−qU), 1−qU, 1 respectively | Constant polynomial has factor count 0 and weight 0⁰=1 |
| 3.4 Twisted multiplicities; 492 | m=1: only H_c² contributes N; coefficient s_nN times external sign s_n gives N. m=0,i=0 gives 1; i≠0 gives 0 | No negative coefficient interpreted as a dimension |
| 3.5 Stable diagonal; 505 | n=4,N=1,j=d=1: both sides 1. n=5,N=1,j=2,d=1: both 1. j=d=0: both 1. n=4,m=2,j=0 demands compact degree 6>4 | Identity survives; R04 repairs the vanishing argument |
| 4.1 Tameness; 530 | Linear f: gradient 1 outside any compact set. Constant n≥2: critical set ℂⁿ not compact. x²y−x on (t,1/2t): gradient norm ‖t‖²→0 | Correct positive lower bound; no critical-points-only shortcut |
| 4.2 Tame fibre bouquet; 553 | Fermat cubic in two variables: μ=4, μ⁻¹=4, μ⁰=0; bouquet counts 0 and 4. x³−3x+y²: counts 1 at ±2 and 2 at 0. Linear: count 0, contractible | Source's connected-fibre range n≥2 retained |
| 4.3 Hilton decomposition; 576 | N=2 word counts at weights 1,2,3 are 2,1,2. For S² summands, weight-two sphere is S³, contributing one bracket in π₃; two sphere Hopf generators give total rank 3 | Integral theorem locator uncertified; these structural tests pass |
| 4.4 Rational spheres; 597 | S² ranks 1 at 2,3, zero elsewhere; S³ rank 1 at 3, zero elsewhere; S⁰ is two points and outside the simply connected rank statement | Source parity and native sphere dimension agree |
| 4.5 Rational bouquet ranks; 624 | Two S² give ranks 2,3,2 in degrees 2,3,4; one S³ gives 1 only in degree 3; empty bouquet gives zero positive groups | Same values as Lean formula |
| 4.6 Rational double-loop algebra; 639 | X=pt: ℚ only in degree 0. S³: exterior degree 1, series 1+t. S⁴: polynomial degree 2 times exterior degree 5, series (1+t⁵)/(1−t²). S²: π₀Ω²=ℤ, outside connected case | Declared rational H-space gap retained |
| 5.1 Betti series; 665 | S³: b₀=b₁=1, b₂=0; S⁴: b₀=1,b₁=0,b₂=1,b₅=1; empty bouquet: b₀=1, others 0. These match factors in declaration ledger | n≥4 corrects BS's n=3 failure |
| 5.2 Finite joins; 688 | Two two-point sets: K₂,₂ has 4−4+1=1 circle. Sizes (2,3): K₂,₃ has 6−5+1=2 circles. Three two-point sets: S². Singleton factor: product count 0, contractible | Empty factors excluded; no change |
| 5.3 Pham/Fermat geometry; 700 | n=k=2: (1,0) belongs to skeleton, (0,0) not fibre; (√2,i) has powers (2,−1), belongs only to fibre. k=(2,3) gives two circles; k=(1,3) gives zero | R01 statable retraction; R02 independent exponents |
| 5.4 Double-loop connectivity; 730 | n=5,k=2: X≃S⁴, π₂=π₃=0, Ω²X connected and simply connected. n=4,k=2: π₁Ω²X=π₃S³=ℤ | Correct threshold; R06 locator |
| 7.2 Conjugation class; 768 | Fixed point: sign H¹=𝔽₂, ω=1, 2ω=0; untwisted H¹=0. Free orbit: H¹=0 and pulled-back ω=0 | Nonvanishing asserted only at classifying point |
| 7.3 Cyclic convention; 788 | u₀,u₁,u₂,u₃=1,−1,−1,1; in even degree u₁(σ−1)=(1−σ)u₀. Trivial ℤ gives H⁰,H¹,H²=ℤ,0,𝔽₂; sign gives 0,𝔽₂,0 | Differential signs and degree-zero exception correct |
| 7.5 Integral fixed coordinates; 800 | Point i=j=0 gives ℤ, whose reduction to 𝔽₂ is not iso. j=i=1 gives 𝔽₂. Nontrivial L on S¹ has H⁰(L)=0,H¹(L)=𝔽₂; the q=0 term retains this torsion | Stated odd-j/high-degree condition essential |
| 7.6 Twisted Bockstein; 812 | At point, reduction β(ωᵏ)=kωᵏ⁺¹: k=0,1,2 give 0,ω²,0. S¹ trivial L gives β_L1=0; sign-monodromy L gives nonzero a | Monodromy term cannot be dropped |
| 8.5 Borel approximation; 847 | V=pt,s=1: H⁰(C₂,ℤ)=ℤ=H⁰(RP¹,ℤ); H¹(C₂,ℤ)=0 versus H¹(RP¹,ℤ)=ℤ at the excluded boundary | Strict i<s and descended local system required |
| 9.1 Norm/Gysin coordinates; 872 | Fixed point degree 0: forgetful 1↦1, mod-two norm 1↦2=0, ω-cup 1↦ω. pt→RP¹ sends p=0 generator to p=1 | Real codimension convention correct |
| 9.2 Self-intersection γ; 885 | Point γ=1. RP²: γ=1+a+a², inverse 1+a, product 1 modulo a³. Empty locus: zero ring, unique total class | Unit and inverse conventions consistent |
| 9.3 Mod-two support splitting; 908 | X=A¹: degree 0 support 0→ambient 𝔽₂→complement 𝔽₂; degree 1 support 𝔽₂→ambient 𝔽₂→complement 0 | Retraction has correct shift; no change |
| 9.4 Integral support splitting; 920 | A¹,d=1,j=0,i=2: support and ambient 𝔽₂, complement 0. Wrong parity j=i=1: support ℤ maps to ambient 𝔽₂, cannot be injective | Parity restriction excludes the counterexample |
| 9.5 Low coordinates; 932 | i≤d: zero target. d=2,i=4,j=1: p=1 survives, p=2 is excluded; on RP² target is 𝔽₂ generated by a | Strict endpoint and parity agree |
| 10.1 Complement duality; 957 | X=Spec C/R: free compact quotient point; ℤ/4 pairing (1,1)↦1/4 gives both duals ℤ/4. Spec R: complement and pair zero | Properness and finite coefficients retained |
| 10.2 Profinite duality; 969 | Same free orbit with M=ℤ: completion ℤ̂, torsion dual ℚ/ℤ. M=ℤ/4: completion and finite double dual both ℤ/4 | No assertion ℤ≅ℤ̂ |
| 10.3 Corrected localization; 981 | d=1: windows Hⁱ⁻¹ and Hⁱ, not equal windows. P¹,i=0: right window H⁰(RP¹)=𝔽₂, complement H⁰=𝔽₂. d=2,i=2: windows H⁰⊕H¹ and H¹⊕H² | γ⁻¹ correction needed on RP² |
| 10.4 Boundary trace; 1004 | P¹: degree-one real generator traces to 1, unit to 0. P²,z=a: deg(aγ⁻¹)=deg(a+a²)=1, but deg(a)=0. Empty real locus: 0=0 | Corrected, not raw, real degree |
| 10.5 Self-duality; 1017 | RP²,d=i=2,x=1,y=a: deg(xyγ)=1 versus raw degree 0. γγ⁻¹=(1+a+a²)(1+a)=1 modulo a³ | Opposite corrections cancel in adjunction |
| 11.1 Affine restriction; 1042 | G_m has ordinary H¹(ℂ*,ℤ)=ℤ at d=1. Spec C/R dimension 0: degree-zero restriction ℤ→0 fails, all positive maps 0→0. xy=0 and square-zero thickened A¹ have ordinary positive cohomology 0 | Strict bound sound; R03 coefficient-colimit supplier |
| 11.2 Real-empty Lefschetz; 1059 | Real-empty conic quotient RP², degree-two divisor: boundary Gysin ℤ→ℤ/2 is surjective but not injective; groups above dimension 2 vanish | Boundary not promoted to isomorphism |
| 11.3 Lefschetz image criterion; 1072 | P¹ with real point divisor: H⁰(pt,𝔽₂)→H¹(RP¹,𝔽₂) is 1↦1. Real-empty divisor: 0→𝔽₂ not surjective | Positive-coordinate obstruction is substantive |
| 11.4 Injectivity criterion; 1085 | Real-empty conic above degree 2: map 0→0 injective; at degree 2 the ℤ→ℤ/2 example has kernel 2ℤ | i>d+1 distinguishes boundary |
| 11.5 Relative torsion vanishing; 1098 | A¹ pair contracts equivariantly to fixed line: groups 0. G_m,𝔽₂, degree-one restriction matrix [[1,0],[1,1]] has determinant 1 and cokernel 0, so relative H²=0 | Boundary argument works; R03 arbitrary-coefficient passage |
| 12.2 Steenrod-conjugated Gysin; 1123 | Identity: Sq·id·Sq⁻¹=id. pt→P¹: real Gysin a, Sq(a)=a since a²=0; complex degree-two ordinary coordinate equals a in real degree one | Corrected degrees and operations agree |
| 12.3 γ and characteristic classes; 1136 | RP²: pairing (1), characteristic 1, square 1=χ mod2. Torus: alternating form, characteristic 0, square 0. Klein bottle: diag(1,1), characteristic (1,1), square 0=χ mod2 | Disk has w₁=0,χ=1 but is excluded by closedness |
| 12.4 Surface curves; 1151 | Zero homology class represented by empty union. On disjoint two tori, a nonzero class on each component requires at least two circles, not one. Parallel essential circles have mod-two intersection 0; meridian/longitude intersect once | No connected-representative overclaim |
| 13.1 Admissible complement classes; 1176 | d=2: low odd-coordinate window empty, relevant twisted degree-zero support group 0. d=3: low window p=0, obstruction a single 𝔽₂ coordinate | Reduced condition and integral class not conflated |
| 13.2 Near-top cup-ω; 1189 | P²: ordinary H³=0 has order 1 (odd). The p=1 𝔽₂ coordinate maps identically from H_G³(ℤ(2))[2] to H_G⁴(ℤ(3)) and then H_G⁵(ℤ(4)) | Zero odd-order group included |
| 13.3 Real-empty quartic; 1202 | Primitive middle rank (3⁵−3)/4=60. Even traces 1−1+1−1=0; fixed-point-free trace forces a−b=0, with a+b=60, hence a=b=30 | Integral torsion not determined by rank |
| 14.1 Cover sign system; 1227 | Split circle cover: monodromy +1. Connected double circle cover: −1. Exchanged sheets at fixed point: stabilizer −1, after ℤ(1) twist +1 | Ordinary monodromy and stabilizer action distinct |
| 14.2 Cover extension/Bockstein; 1250 | Split cover: e=β_L1=0. Connected double cover: both nonzero class of H¹(S¹,𝔽₂). Fixed-point sign extension class has order 2 | Twisted coefficient boundary correct |
| 14.3 Ramified trace triangle; 1263 | Branch model z²: trace ℤ→ℤ is ×2, kernel 0,cokernel 𝔽₂. Punctured sign system H⁰=0,H¹=𝔽₂. Empty branch: (a,b)↦a+b | Branch multiplicity and cone degree agree |
| 14.4 Ext stalks; 1287 | Trivial ℤ: H¹=0,H²=𝔽₂. Sign ℤ: H¹=𝔽₂,H²=0. Regular ℤ[C₂]: H¹=H²=0 | Free abelian does not imply cohomologically acyclic; gap accepted |
| 15.1 Trace quotient; 1312 | n=1: Q=0; n=2: quotient generator negated by sheet swap; adding diagonal b changes sum by nb, reduction unchanged | Positive n and adjunction assumptions present |
| 15.2 Trace-zero operator; 1335 | n=2,3,4 on first basis class gives (−1,1),(−2,1,1),(−3,1,1,1): all traces 0, all reductions diagonal 1. n=3 opposite sign reduces to diagonal 2 | Target monicity, not source monicity, used |
| 15.3 Lift criterion; 1356 | Two exchanged sheets: Q(1) trivial, nonzero ζ maps to a=1 and upstairs H³=0. Two fixed sheets: source H²=0, a=1 has nonzero diagonal Bockstein | The criterion survives; R08 supplies these missing Checks |
| 15.4 Corrected lift; 1368 | n=4,η=0,ζ=[1,0,0,0]: a=3, b=(3,−1,−1,−1), reduction (3,3,3,3), trace 0=4η. Wrong plus sign reduces (1,1,1,1) | Minus sign necessary |
| 15.5 Adjacent reduction; 1381 | n=2,4,6: H¹ reduction 1,1,1; H² reduction 1,0,1. n=0: H¹=𝔽₂,H²=0, not two copies of 𝔽₂ | R07 positive-n hypothesis |
| 15.6 Circle extension; 1393 | One regular stalk,n=2: (𝔽₂⊕ℤ)/⟨(1,2)⟩=ℤ/4. Two regular stalks,n=4: E=𝔽₂². In constant ℤ/4, quotient unit lifts to 1, boundary 0, but no homomorphic section 𝔽₂→ℤ/4 | Section lift is not an abelian-sheaf splitting |
| 16.1 Equivariant Ehresmann; 1429 | Product action (b,z)↦(−b,τz): radial transport identity commutes with τ at b=0. Colliding divisor points change cardinality 2→1 and are not preserved automatically | Pair preservation not inferred from ordinary transport |
| 16.2 Stratified transport; 1442 | xy=t: singular-point stratum maps only to 0, derivative rank 0 versus required rank 1. Constant stratified pair: product transport preserves each stratum | Changing node excluded by hypotheses |
| 16.3 Finite-index image; 1455 | Point target H²=0, index 1. Trivial action on S²,j=0: image ℤ,index 1. Antipodal S²,j=1: H²(RP²,or)=ℤ pulls back to 2ℤ⊂H²(S²,ℤ), index 2 | Genuine topological witness for finite index without surjectivity |
| 16.4 Common-lift chase; 1468 | Split cover with fixed sheets: g=0, twisted κ split injective, ζ=0, both chased terms 0. ℤ[G]⊗ℤ[G] has two free basis orbits, H²=0; trivial rank-four module instead gives 𝔽₂⁴ | Both terms degree 4 with coefficient L; equality is modulo specified image |

### Conventions and excluded-input checks

| Convention/input | Computed comparison | Consequence |
|---|---|---|
| Parity at n=0,1,2 | ε_n=1,0,1 and s_n=−1,+1,−1 | Replacing n+1 by truncated n−1 would incorrectly give s₀=+1 |
| Full cycles and inseparability | (12)(3) has two cycles of sizes 2,1; T²+T over 𝔽₂ has partition 1,1; T² has a repeated root and fails Squarefree | No good-characteristic or m!-invertibility shortcut |
| Geometric Frobenius | At q=2, ordinary G_m eigenvalues 1,2 and compact eigenvalues 1,2 in shifted degrees give −1+2=1 point; arithmetic eigenvalue would be 1/2 | Tate and compact-support conventions agree with suppliers |
| Non-Archimedean geometry | Closed interval: 1 edge,2 vertices, χ=1. Open interval: only open edge in finite model, still ordinary H⁰=ℤ. Point in R²: dimension 0, not 2 | Finite semialgebraic site, not arbitrary ordinary open covers |
| Total functions | r=0 exponent 0/0=0; constant-polynomial infinite Jacobian has finrank 0; zero ring polynomial has natDegree 0 even for a formal positive degree | Positive-index/finite-dimensional/formal-coefficient restrictions prevent junk values entering theorems |
| Nilpotents | ℂ[t]/t³ with operator t²: generalized zero space 3, kernel 2; Spec R[x,ε]/ε² has same reduced locus as A¹ | Algebraic nilpotents retained where needed; topological invariance used only for point spaces |
| Unit ideal / rank zero | Jacobian ideal of z₁ is (1), quotient 0, Milnor number 0; empty bouquet remains a point | Zero ring/algebra not silently ruled out |
| Irrelevant arithmetic boundary classes | ℂ and ℚ coefficients have characteristic 0; F finite field has q≥2. Thus q=1, a DVR coefficient ring, and inseparable finite-field extensions do not inhabit those theorem binders | No fabricated tests of nonexistent instances |

### Headline coverage and ownership

| Headline family | Acceptance status at the pins |
|---|---|
| Configuration trace with arbitrary rational class function | `configurationTraceFormula`; native ordinary singular formulation is faithful |
| Tame-fibre bouquet and rational bouquet ranks | `tameFibreBouquet`, `rationalBouquetRanks`; actual Jacobian and homotopy carriers |
| Full numerical double-loop Betti product | `doubleLoopBetti`; finite coefficient product exactly represents each coefficient of the infinite product |
| Strong Pham retraction onto the explicit skeleton | Statable but missing: R01. General exponent family missing in the README: R02 |
| Arrangement purity, compact trace, configuration multiplicities, stable diagonal | Named in module docstring; étale/compact-support representation and comparison carriers missing |
| Full Hilton basic-product maps and finite-join identification | Named in module docstring; missing Whitehead-word indexing/maps and topological finite join. The concrete retraction needs neither missing carrier |
| General rational H-space/double-loop algebra | Named in module docstring; missing free graded-commutative algebra and comparison. The numerical native statement is separately present |
| Support splittings, low-coordinate surjectivity, complement duality, corrected localization and self-duality | Named in module docstring; missing arbitrary-real-closed equivariant supported sheaf carriers/maps |
| Affine/Lefschetz results, near-top cup-ω, quartic rank | Named in module docstring; missing semialgebraic equivariant comparison carriers |
| All-degree Wu, γ/Stiefel–Whitney, transverse surface representatives | Named in module docstring; missing supported operations/characteristic classes or embedded-circle homology class map |
| Ramified trace triangle, corrected integral lift, circle obstruction, common-lift chase | Named in module docstring; missing equivariant sheaf cokernels/trace and derived maps |
| Equivariant Ehresmann, stratified pairs, finite-index equivariant image | Named in module docstring; supplier smooth-fibre/local-trivialization, control-data and equivariant comparison interfaces missing |

The rational-sphere special case and Fermat numerical bouquet corollaries need not be reintroduced as separate acceptance theorems: they would duplicate the general rank/bouquet tests. R01 instead concerns the specified inclusion and a homotopy fixed on its skeleton, data that a bare bouquet homotopy equivalence does not state.

**Sibling checks:** 17 cited supplier families resolved and their relevant sections inspected; the 51 explicitly supplied open sibling heads were searched in both README and Suggested files (**102 files**, none missing). Object searches also covered main/Completed, board packages, and the prescribed roadmap search service. Searches included configuration carriers/torsors, arrangements, semialgebraic sites and purity, rational H-spaces, Pham/tame fibres, trace quotients, circle obstruction, and the four headline Lean names. No second declaration in the searched roadmaps had one of the package's fully qualified names. Search hits concerning Fuchs–Pham logarithms, arithmetic configuration minors, definable arcs, and central circle extensions do not own the objects here.

| Supplier citation checked | Resolution / hypothesis comparison |
|---|---|
| AlgebraicTopology Stages 2–8 | Main: relative/local-coefficient theory, CW/wedges, Stage 5 finite-cover action and supplied Serre interface, Stage 6 products/duality, Euler and Whitehead. The inverse-pullback convention agrees with the S₃ test |
| SchemeAndStackFoundations §§2.7,2.19,2.23 | Generic support, adjoints, equivariant derived invariants and forgetful/coinduction injectivity exist. §2.5 additionally owns the missing explicitly cited coefficient-colimit theorem: R03 |
| InverseGaloisAndArithmeticFundamentalGroups §IG.5.1 | Ordered/unordered Hausdorff configurations, unit-difference discriminant opens and all-characteristic torsors exist. General topological carriers/zero-ring formal coefficients are a declared extension |
| MotivesAndAlgebraicCycles §§7.6a–7.6b | Semialgebraic loci/cohomology, signs, supports, orientation, purity, fixed-locus decompositions and operations exist. Extensions to quotient/finite-Borel/coefficient interfaces are explicitly declared; coefficient-colimit attribution is the separate R03 |
| EtaleDualityAndPerverseSheaves §§3.5–3.8,4.7,6.5 | Betti/support/trace comparisons and compact Frobenius interface occur in these sections; §4.7 gives quartic rank (3⁵−3)/4=60. Configuration-specific compatibility is a declared gap |
| ComplexComparisonPartII §C−1.1 | Scheme analytification is supplied; no second analytification is planned here |
| StableHomotopyKTheory §§3.36–3.37 | Connected abelian CW Serre-class theorem; path-connected finite-type rational Hurewicz primitive theorem with homotopy associativity for Hopf form. The homotopy-commutative free-algebra refinement is declared |
| AffineMorseLefschetz A2–A3,A4.1 | Smooth affine CW/vanishing and finite compatible ℝ triangulation supplied; singular affine and real-closed extensions not silently attributed to the smooth ℝ theorem |
| RealAnalyticGeometry §R2.1 | Bounded affine triangulation with analytic simplex maps; no unrestricted non-Archimedean singular comparison |
| RealAlgebraicGeometry Layers 3,6 | Polynomial semialgebraic sets and projection/definability, not a sheaf-cohomology site |
| DifferentialGeometry Layers 2,3,10 | Orientation-cover, flow and stated Sard interfaces; no unsupported relative transversality inferred from Sard alone |
| GeometricTopology Layer 1 | Smooth manifold/tangent bridge, distinct from the new equivariant transport conclusion |
| SmoothBundlesConnections B1 item 5 | Proper surjective smooth submersion, Hausdorff second-countable finite-dimensional boundaryless setting; fixed model over connected base, componentwise local statement otherwise |
| CharacteristicClasses C2 item 3,C3 item 2 | Oriented Euler evaluation; mod-two Whitney, orientation-cover w₁ and top Euler reduction. The characteristic-element calculation on nonorientable surfaces uses these with Wu, not oriented integral evaluation alone |
| TangentialBordism B4 item 3 | Closed-manifold Wu formula w=Sq(v), giving v₂=0 and w₂=w₁² on a closed surface |
| MorseNovikov N6 | Smooth closed connected-manifold fixed-point trace; arbitrary-real-closed replacement is explicitly assigned by gap |
| QWittVectors §1.4a, supplied open head | Factors (1−a_rTʳ)⁻¹ are Witt coordinates, not integer exponents of (1−Tʳ); no duplicate construction |

The new owners left here are the arrangement/permutation specialization, integer Euler exponents, bouquet/Pham/rational-double-loop calculations, rank-one fixed-locus refinement, corrected localization formulas, and specific trace/cover calculations. Their generic prerequisites remain with the suppliers just listed. No ownership move to a later roadmap is required by these findings.

**Declared gaps:** all 12 slugs occur exactly once in the README contract list and exactly once in `design/plan.json`; every supplier name and entire `needs` sentence agrees byte-for-byte. None has supplier `none`. Each describes a coherent interface with explicit domain/coefficient/range hypotheses. The current absence of those requested extensions is not raised as a defect. The finite-group resolution, fixed-point trace and field-extension requirements are retained rather than replaced by good-characteristic or ℝ-only cases.

The read-only dependency command returned exactly:

```text
depcheck: 52 roadmaps, 588 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. This checks cross-roadmap direction; it does not resolve the target-level ordering issue R05.

### Pinned-library and policy checks

Manifest revisions inspected: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Pinned object | Evidence and scope |
|---|---|
| `GenLoop` | `Mathlib/Topology/Homotopy/HomotopyGroup.lean:97`: continuous cubical maps with the boundary condition; no Hausdorff or CW instance is in the definition |
| `ContinuousMap.HomotopyRel` | `Mathlib/Topology/Homotopy/Basic.lean:541`: maps and a homotopy fixed on a set, sufficient for R01 |
| `TauCeti.WedgeSum` | `TauCeti/Topology/WedgeSum.lean:72`: pointed quotient with a separate wedge point; N=0 is a point, not empty |
| Native singular cohomology | `TauCeti/AlgebraicTopology/Cohomology/Basic.lean:129`: functorial cohomology on native topological carriers; no equivariant semialgebraic site supplied by this file |
| Full permutation partition | `TauCeti/GroupTheory/Perm/Partition.lean:96`: full cycle type retains singleton cycles |
| Frobenius factorization | `TauCeti/FieldTheory/GaloisGroups/FrobeniusOrbits.lean:106`: squarefree split polynomial, algebraic extension and q-power root action; the squarefree hypothesis is not optional |
| Tensor character and invariants | `Mathlib/RepresentationTheory/Character.lean:68,113`: `char_tensor` and `card_inv_mul_sum_char_eq_finrank`; averaging uses invertible group order, satisfied over ℚ |
| Generalized eigenspace | `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:556`: `maxGenEigenspace`; not merely the ordinary eigenspace or quotient by f−a |
| Artinian factors | `Mathlib/RingTheory/Artinian/Module.lean:616`, `Mathlib/RingTheory/Artinian/Ring.lean:63`: nilradical-power product decomposition and nilpotence retain local multiplicities |
| Formal binomial series/substitution | `Mathlib/RingTheory/PowerSeries/Binomial.lean:47`, `Mathlib/RingTheory/PowerSeries/Substitution.lean:157`: coefficients use choose(a,n), hence (1+X)^a; positive substituted order is explicit in the Lean binders |
| Möbius inversion | `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:206`: named divisor-sum inversion exists at this pin |
| Cyclic resolution | `Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean`: `homResolutionIso`, `groupCohomologyIsoEven`, `groupCohomologyIsoOdd`; even/odd formulas are positive-degree formulas with H⁰ handled separately |

The pull-request diff is confined to `packages/AlgebraicTopologyPartII/` (eight files in the existing head diff). No package file was edited for this review. The Lean file has exactly one `import Mathlib` and three existing, used Tau Ceti module imports; the required namespace and layer comments are present. All four admitted results use `theorem`, none uses `lemma`. There is no `set_option`, sorry'd data, empty Prop field, `True` placeholder, admitted example, executable algorithm or external-roadmap import. The 15 Lean names occur in the README. No pull-request number or repair-process narrative was found in the README or Lean docstrings.

### Source-locator audit

**49 locator groups were located and compared in 11 accessible source texts**, with page/version conventions checked against the provided extractions. This is a count of the groups enumerated below, not a claim that every proof in the sources was independently reconstructed. R06 is an incorrect supporting locator; the other groups locate the intended result or proof step, subject to the source corrections below. Five settled inaccessible works retain their declared status.

| Source | Groups counted | Locator and extraction evidence |
|---|---:|---|
| BS | 8 | §1 p.894 (line 55); Lemma 2.8 proof p.907 (line 644); Lemma 3.9 proof p.919 (line 1197); Lemma 7.2 pp.940–941 (line 2174: R06); Definition 7.3/equation 7.2 pp.941–942 (line 2211); Lemma 7.4 pp.942–943 (line 2250); Corollary 7.5/equation 7.3 pp.943–944 (line 2322); Lemma 7.6 pp.944–945 (line 2354) |
| BW v3 | 13 | §§1.1.1–1.1.3 pp.8–10 (line 290); Proposition 1.1/Fact 1.2/equation 1.16 pp.11–12 (line 403); equations 1.17–1.22 pp.12–14 (line 456); §1.2.1 p.14 (line 533); equations 1.29–1.32 p.15 (line 553); §§1.2.5–1.2.6 pp.16–17 (line 610); §1.3 pp.17–21 (line 646); §1.4 pp.21–24 (line 809); §1.5 pp.25–26 (line 951); §1.6 pp.28–31 (line 1080); Lemma 3.5 pp.41–42 (line 1659); Lemma 3.15 pp.46–47 (line 1838); Lemma 5.9 p.62 (line 2471) |
| B19 | 9 | §§2.1–2.3 pp.71–75 (line 362); §3.2 pp.77–78 (line 559); §4.2 diagrams 4.3–4.5 pp.82–83 (line 773); Proposition 6.6 proof pp.93–95 (line 1253); §7.1 pp.97–98 (line 1354); Lemma 7.2 p.98 (line 1422); Lemma 7.3 pp.98–99 (line 1444); Lemma 7.5/equations 7.5–7.9 pp.99–100 (line 1472); Proposition 7.4 proof p.103 (line 1640, embedded-loop reduction) |
| CEF | 2 | Proposition 3.3 pp.19–20 (line 860); Theorem 3.7 pp.21–22 (line 964); author-manuscript pagination |
| SERRE | 2 | Chapter V §3 Proposition 3 pp.492–494 (line 2595); §6 Lemma 7/Corollary 2 pp.497–498 (line 2818); odd/even sphere ranges retained |
| PHAM | 1 | Part I §2, pp.337–338 (line 175), with general exponent setup at line 118 and deformation retraction at line 204; R02 |
| BROUGHTON | 4 | Theorem 1.2 p.219 (line 115); equation 2.1 p.220 (line 152); Definition 3.1/Proposition 3.2 proof pp.225–226 (line 353); §4 Proposition 4.1/Corollary 4.2/Lemma 4.3 and theorem proof pp.228–232 (lines 501–654) |
| EP v3 | 2 | Theorem 4.1 pp.46–47 (line 2127); Theorem 4.7 pp.49–50 (line 2190); the finite-weak-global-dimension condition on a different intervening result is not transferred to the adjunction theorem |
| MATHER | 3 | §7 control data (line 474); §10 controlled flows (line 792); §11 Proposition 11.1, original p.62/PDF p.34 (line 969); equivariance is the roadmap's added construction, not the quoted proposition |
| MILNOR-STASHEFF | 2 | Corollary 11.12 p.130 (line 3155); Theorem 11.14 pp.132–133 (line 3200) |
| GM | 3 | Part II introduction p.148 (line 5428); §1.1* special cases p.152 (line 5587); Chapter 4 p.177 (line 6483), supporting the singular-affine extension rather than silently applying smooth Morse theory |

## Not verifiable

- HILTON, Theorem A and Corollary 4.10: settled `uncertified`; the full basic-product theorem was not read. The small word-count/rank tests and the distinction from smash products were computed independently.
- DIMCA, Lemma 4: settled `uncertified`; no claim of having checked its text. The Ehresmann extension is assessed against the stated smooth/proper/submersion hypotheses and the accessible supplier contract.
- BRUMFIEL, pp.163–169: settled `uncertified`; the arbitrary-real-closed fixed-point theorem remains conditional on its declared supplier gap. The ℝ quartic trace computation was checked independently.
- SCHEIDERER, Corollary 18.11: settled `uncertified`; the accessible BW argument and the concrete boundary-cokernel test were checked, but not this book's proof.
- KRASNOV, Theorem 2.1: settled `waived`; no new access request. The roadmap's all-degree semialgebraic claim is still dependent on the declared operations/purity supply.
- OCR in BROUGHTON and MATHER damages some formulas. The identified statements, surrounding hypotheses and readable proof steps were checked; unreadable glyphs are not promoted to source misprints. In particular, this review does not certify every analytic estimate in Broughton's deformation construction or every control-data identity in Mather.
- No Lean build or fresh scratch elaboration was run, as explicitly prohibited. The existing artifact's 15 elaborated types were compared with the unchanged file; compilation of a repaired acceptance theorem remains for the repair worker.
- Ownership searches against the 51 explicitly provided open heads were performed. No exhaustive ownership audit of additional open pull requests without supplied checkouts is claimed; search-service results were used as leads for the named suppliers, not as a substitute for those unavailable full audits.
- The unused SULLIVAN manifest entry has empty `cited_for`; it supplies no current target. Its loop-model discussion was not counted as a verified locator.

The inaccessible statuses are settled; no new missing-reference request was created. The report can be acted on without obtaining those texts. No previous repair finding marked “not actionable in this package” is re-raised here.

## Source issues

- **Misprint** in BS at Lemma 2.8 proof, printed p.907 (BS line 665): the source says the ordered configuration space has dimension m−1; it should be its translation quotient that has dimension m−1; affects the proof.
- **Misprint** in BS at Lemma 7.4 proof, printed p.942 (BS lines 2266–2268): the source says compact-support groups enter the ordinary-weight trace sum; it should be ordinary cohomology in the first two expressions, before applying duality; affects the proof.
- **Misprint** in BS at Lemma 7.4 proof, printed p.943 (BS line 2319): the source says the final product has factors with exponent one; it should be exponent −e_k(N), as in the preceding display; affects the proof.
- **Error** in BS at equation (7.3), printed p.943 (BS lines 2333–2339): the source says the entire bivariate product equals one fixed-j diagonal; it should be the extracted diagonal, with other monomials retained outside that extraction; affects the proof.
- **Error** in BS at Lemma 7.6, printed pp.944–945 (BS line 2354): the source says the full double-loop Betti product holds for n>2; it should be n≥4 for this full-space statement, since Ω²S² has infinitely many components; affects a stated result.
- **Error** in BW at equation (1.16), internal printed p.12 (BW lines 450–455): the source says finite exponent suffices for two-sided perfect algebraic duality; it should be finite stalks for that duality, excluding an infinite direct sum of 𝔽₂ at a point; affects a stated result.
- **Misprint** in BW at §1.2.6, internal printed p.17 (BW line 645): the source says the real Gysin domain is cohomology of X(R); it should be cohomology of the source Y(R); affects a stated result.
- **Error** in B19 at Lemma 7.3, printed pp.98–99 (B19 lines 1444–1445): the source says the integral lift is p*η+ψζ; it should be p*η−ψζ with its stated ψ and preceding a=η−φζ; affects a stated result.
- **Gap** in B19 at diagram (7.4) proof, printed p.99 (B19 line 1465): the source says source restriction monicity extends equality of two maps; it should be target restriction monicity for p*(ℤ/n), established by local non-disconnection upstairs, that permits extending equality; affects the proof.
- **Error** in B19 at diagrams (7.8)–(7.9), printed p.100 (B19 lines 1503–1520): the source says the degree-two unit survives the displayed reduction comparison for every even n; it should be scaled by n/2 modulo 2 in degree two, while degree-one reduction remains identity; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a8a46238676a77a7dc43287c9481158afb300720", "job": "RT-AlgebraicTopologyPartII~1a", "model": "gpt-6-astra", "worker": "chris-35"} -->
