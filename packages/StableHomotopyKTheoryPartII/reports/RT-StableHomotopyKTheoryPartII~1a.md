<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1597#issuecomment-6425887189 -->
Red team round 1 pass a (codex) of e5cae53

Verdict: needs_changes

1. **F01** (P1) The geometric norm comparison has no exact supplier contract

   **Location:** `packages/StableHomotopyKTheoryPartII/README.md:293`, “Construct the geometric map B≃Φ^(C_p)(N_e^(C_p)B)”.

   **Claim:** The proof uses a genuine multiplicative norm and its geometric diagonal equivalence as inputs to the Singer augmentation comparison.

   **Witness:** `TauCetiRoadmap/RefinedTraceMethods/README.md:942` supplies genuine spectra and geometric fixed points; line 1108 supplies representation spheres. Neither states Φ^G N_e^G≃id. The Borel norm has source homotopy orbits, not Sp.

   The cited §§2.11–2.13 were read at the supplied head. KTheoryFiniteLocalFields §4.0 includes the word “norms” among its genuine foundations, but gives neither this indexed smash signature nor its geometric diagonal theorem. Object searches of the named suppliers, main, package READMEs and open-roadmap index found no exact export for that comparison. The distinction already matters for B=ΣS: its p-fold tensor is S^ρ, whose geometric fixed points are ΣS, not Σ^pS.

   **Exact repair text:** Add before §2.6: “Construct the genuine indexed smash N_e^G:Sp→GSp for every finite group G, on cofibrant orthogonal models and then derived, with underlying G-spectrum the permutation smash over G. Prove the natural monoidal diagonal equivalence Φ^G N_e^G(B)≃B, including suspension and replacement compatibility. Its isotropy-separation comparison to the Borel Tate spectrum is the map used in §2.6.” Make this an explicit target with source locator and Checks, or declare the same precise construction as a gap to RefinedTraceMethods §2.11; replace the implicit invocation in §2.6 with that target/contract.

   **Repair test:** B=0 gives 0; B=S gives the genuine sphere and geometric fixed points S; B=ΣS gives S^ρ and ΣS since dim(ρ^G)=1. This supplies the actual comparison needed without assuming Segal.

2. **F02** (P1) Freeness over the exhaustive A_p(n) chain is asserted as supplied

   **Location:** `packages/StableHomotopyKTheoryPartII/README.md:63`, “this includes freeness of A_p over A_p(n)”.

   **Claim:** TangentialBordism B4 and BordismFormalGroups F6.3 already provide the finite Hopf chain and freeness used in §2.4.

   **Witness:** `TauCetiRoadmap/BordismFormalGroups/README.md:1004` develops E(Q_i), T_t and Margolis free-module criteria. It does not state the exhaustive A_p(n) chain or A_p-freeness over it; agm85 line 217 specifies the different chain needed here.

   TangentialBordism B4.7 supplies the Milnor basis and B4.8 freeness over the exterior Milnor-primitive subalgebra. These do not constitute the asserted named A_p(n) contract. Searches by object, not just notation, found no such target at the cited versions.

   **Exact repair text:** Replace the unsupported supplier assertion by: “What BordismFormalGroups must provide (gap:steenrod-finite-hopf-chain): For each prime p, the Milnor dual quotients define an exhaustive chain A_p(n), n≥−1, of finite sub-Hopf algebras of A_p, and A_p is free as a left and right module over each A_p(n).” Give the defining quotients, including the prime-two version, using agm85 §2, printed p.439, lines 214–230. Add the matching slug, supplier BordismFormalGroups and section F6.3 to the plan gaps, and cite this contract in §2.4. This leaves finite Steenrod Hopf algebra ownership with its existing supplier.

   **Repair test:** At odd p, A_p(−1)=𝔽_p and A_p(0)=Λ(β), with dimensions 1 and 2; at p=2, A_2(0)=Λ(Sq¹), dimension 2. These are the stages that the localized bimodule uses, unlike T_t alone.

3. **F03** (P2) Integral Tate splittings cannot be specified as HF_p-modules through const

   **Location:** `packages/StableHomotopyKTheoryPartII/README.md:746`, “Choose these splittings … as H𝔽_p-modules through const”.

   **Claim:** The same scalar-map prescription defines the mod-p and integral splittings.

   **Witness:** For R=Hℤ, const/can has source Hℤ; for R=H𝔽_p it has source H𝔽_p. No unital map H𝔽_p→Hℤ exists: π₀ would send p·1=0 to p≠0.

   The displayed integral additive decomposition is valid, but the specified scalar structure does not follow from const. The subsequent proof correctly proposes an integral two-term resolution, which should be the actual statement's construction too.

   **Exact repair text:** “For H𝔽_p, take the H𝔽_p-module splitting induced by const/can and the normalized monomials. For Hℤ, take the Hℤ-module splitting obtained from the complete cyclic complex, decomposed into two-term complexes with differential p; each piece is quasi-isomorphic to the corresponding shift of H𝔽_p. The integral assertion is a splitting of Hℤ-modules and underlying spectra, not a scalar restriction along an H𝔽_p→Hℤ constant map.”

   **Repair test:** At p=2 the two-term pieces have homology ℤ/2 in even Tate degrees and zero in odd degrees, so π₀=𝔽₂ and π₁=0, as required. No nonexistent scalar map is used.

4. **F04** (P3) The cited sphere Segal Check is absent from AInfCohomology

   **Location:** `packages/StableHomotopyKTheoryPartII/README.md:97`, “The sphere Segal equivalence appearing as its Check”.

   **Claim:** AInfCohomology AI.7.2's Tate-diagonal Checks include the sphere Segal equivalence.

   **Witness:** `TauCetiRoadmap/AInfCohomology/README.md:3855` checks only the sphere map S→S^(hC_p)→S^(tC_p); the other Checks concern mixed induced terms and Hℚ. There is no sphere completion assertion there.

   **Exact repair text:** “The supplied sphere Check fixes the map S→S^(hC_p)→S^(tC_p). Its identification as p-completion is proved in §2.7 here and is not an input.”

   **Repair test:** The supplied Check fixes 1↦1; §2.7 additionally computes π₀ of the target as ℤ_p. The corrected sentence distinguishes these assertions.

5. **F05** (P3) The representation-suspension Checks do not distinguish the claimed normalization

   **Location:** `packages/StableHomotopyKTheoryPartII/README.md:688`, “π_i of the left side is π_(i−1)R^(tC₂)=𝔽₂”.

   **Claim:** The listed Checks discriminate the normalized representation-suspension comparison. The first merely repeats the preceding n=0 identity assertion, and the second does not distinguish a trivial dimension-two shift.

   **Witness:** For R=H𝔽₂, both ΣR^(tC₂) and Σ²R^(tC₂) have π_i=𝔽₂ for every integer i. The first Check repeats README line 679; the second passes the excluded model.

   **Exact repair text:** Replace the first Check with: “For R=S, p=3 and n=0, the comparison sends 1∈π₀=ℤ₃ to 1; rescaling it by −1 instead sends 1 to −1.” Replace the second with: “For R=S, p=2 and n=1, the correct target is ΣS₂^∧, with π₁=ℤ₂. Replacing the permutation sphere by a trivially acted-on dimension-two sphere gives Σ²S₂^∧, with π₁=0.” Retain the inverse-twist Check.

   **Repair test:** §2.7 gives S^(tC₂)≃S₂^∧, which is connective: π₁ΣS₂^∧=π₀S₂^∧=ℤ₂, whereas π₁Σ²S₂^∧=π₋₁S₂^∧=0.

## Verified sound

Read the complete 1028-line README and 62-line Suggested.lean. Inventory: **37 numbered mathematical targets**, **139 Check bullets** (122 local and 17 supplier Checks), **0 Lean declarations**, **0 Lean section variables or instances**, and **14 headline entries** in the Lean module docstring. All 37 targets and all 139 Check bullets were examined; computed witnesses are below. The tables record sound instances rather than claiming a formal proof of every universal assertion. R01–R05 identify the exceptions in ownership, scalar specification, citation and discrimination.

### Suggested.lean inventory and headline coverage

| Declaration / context | Instance / computed values | Result / change |
|---|---|---|
| No declarations; one `import Mathlib`; empty `TauCetiRoadmap.StableHomotopyKTheoryPartII` namespace | Declared constants=0, section variables=0, instances=0, sorry'd data=0, options=0 | No signature can lose a binder. No `#check @name` or elaboration is applicable. No Lean command was run. |
| §2.2 inverse-limit Adams; §2.4 Singer Tor; §2.6 realization; §§2.7,3.4 finite/general Segal | At HF_p: Ext concentrated at (0,0)=𝔽_p; diagonal on HF_p gives HF_p, on S gives S_p^∧ | Five headline entries name the missing spectral, Steenrod-module and continuous-cohomology carriers. |
| §4.1 Weyl refinement; §4.8 spherical Witt; §5.6 all-degree comparison; §6.3 total Steenrod | W at p=2 has order 1; W(𝔽₄) has rank 2; twist −ρ+ρ=0; P¹ at p=3 has degree 4 | Four headline entries name coherent actions, E∞ spherical algebras, twists and stable operations. Native Witt vectors do not supply spherical Witt vectors. |
| §§7.3–7.5 KU Adams and the two counterexamples | β↦pβ, β⁻¹↦β⁻¹/p; p=2 Tate-orbit dimensions 3 versus 1; unbounded Segal mod 2 gives 0 versus 𝔽₂ | Two headline entries name KU, residual actions, spectral Tate and localization. |
| §§8.1–8.3 free-loop totalization, controlled Tate limits and free-loop Segal | Y=* gives S; Y=S² has fiber connectivity tending to infinity; n=0 fixed-point comparison is identity | Three headline entries name the missing spectral totalization, connectivity and genuine cyclotomic carriers. |

The finite-set pro-constancy lemma is a supporting argument, not a substitute acceptance theorem. No statable headline was found omitted, and no padding declaration exists. Searches of the pinned Mathlib and Tau Ceti for spectra, spectral Tate, Singer and Steenrod carriers found no carrier for these fourteen entries. Algebraic Tate cohomology and space-level Eilenberg–MacLane constructions do not fill that gap.

### Computed target ledger

Here S denotes the sphere spectrum, HF_p an Eilenberg–MacLane spectrum, ρ the permutation representation, and T_p(X)=(X^⊗p)^(tC_p). Every row includes the hypotheses that restrict its test inputs; zero spectra and zero rings are allowed where the construction permits them. p=1, degree-zero “finite field extensions”, and non-simply-connected spaces are negative controls, not inputs to prime/field/simply-connected assertions. Unrelated scheme finiteness, inseparability and DVR hypotheses do not occur in these targets.

| Statement and context | Instances tried | Values computed on both sides / wrong-model value | Result / change |
|---|---|---|---|
| §1.1 cyclic coefficients; prime p, trivial action; t=u⁻¹,e=b/u,u=βb | p=2,3; b↦2b at p=3; e↦−e; integral coefficients | HF₂: π_i=𝔽₂ all i. Odd p: degrees(t,e)=(-2,-1), weights(a,1), βe=1. Hℤ at p=2: (π₀,π₁)=(𝔽₂,0). Rescaling gives (t',e')=(2t,e), t'²=t²; negating e gives βe'=-1 | Weights, factor 2, and normalization distinguish the inverse/sign choices. |
| §2.1 H_c^*(Y)=colim H^*(Y_n); specified countable inverse tower | Constant identity tower; zero; Singer tower of S at 2 | Constant: colim=H^*(Y), zero=0. Singer: Σ𝔽₂[x±] has classes in every integer degree; H^*(S₂^∧) has no negative classes | Correctly distinguishes continuous cohomology from cohomology of the limit. |
| §2.2 inverse-limit Adams; each stage bounded below and degreewise finite type | Zero; constant HF_p; Singer stages of S at 2 | Zero: E₂=0 and π=0. HF_p: Ext_A(A,𝔽_p)=𝔽_p in (0,0), abutment π₀=𝔽_p. Singer stage lower bounds 1,0,−1,… | No uniform lower bound silently added; source convergence hypotheses retained. |
| §2.3 Singer module and augmentation; arbitrary graded left A_p-module M | M=0,𝔽_p; negative binomial exponent; p=2,3 | R_+(0)=0. ε(Σx⁻¹)=1 at 2; ε(Σxy⁻¹)=1 odd. Sq¹(x⁻¹)=1 since binom(-1,1)=1 mod 2. β(xy⁻¹)=1 | Twisted action is not the ordinary tensor action. Negative-index operations vanish in augmentation. |
| §2.4 Tor-equivalence; arbitrary M; Ext target N bounded below and degreewise finite | M=0; M=N=𝔽_p; shifted M=Σ⁻¹𝔽_p | Tor comparison is 0→0 for M=0. Degree-zero Hom of R_+(𝔽_p) to 𝔽_p and of 𝔽_p to itself both have dimension 1. Shift moves internal degree by −1 on both sides | Mathematical source supports generality; freeness prerequisite needs R02. |
| §2.5 U_n(B)=Σ^(1+n)D_Cp(Σ⁻ⁿB); bounded-below finite-type B | B=0; n=0; B=S, p=2,3 | U_n(0)=0. U₀=ΣD_Cp(B). For S, ΣTh(-n reduced ρ) has bottom degree 1-(p−1)n: 1,0,-1 at p=2; 1,-1,-3 at p=3 | Greenlees index is not an extra suspension. |
| §2.6 topological Singer identification and augmentation | B=0,S; p=2 and odd p | Zero cohomology maps to zero. Degree-zero Singer generators Σx⁻¹ and Σxy⁻¹ map to 1, as does ε | Comparison matches the source, but its genuine norm input needs R01. |
| §2.7 finite-type Segal; bounded below, mod-p degreewise finite type | S; HF_p; Hℚ | S: π₀ target=ℤ_p and π_i=0 for i<0, matching completion. HF_p: both sides HF_p. Hℚ: completion=0 and Tate=0 | All primes retained. |
| §3.1 finite-set tower with finite inverse limit L; uniform stage per coordinate | Constant two-point tower; empty tower; {a,b}←{a}; binary strings | Limits have sizes 2,0,1 respectively; stabilized images sizes 2,0,1. Binary strings have finite stages but limit size 2^ℵ₀, so finite-limit hypothesis fails | Empty L included; stabilization index independent of number of copied summands. |
| §3.2 T_p^(n)(X)=(τ≤n X^⊗p)^t; fixed integer n | X=0, HF_p, HF_p⊕HF_p; n<0 and n→∞ | 0 maps to 0; truncation of connective HF_p^⊗p is 0 for n<0. Two diagonal summands survive and mixed free C_p-orbits contribute 0; limit recovers T_p(HF_p)≃HF_p | Fixed-stage coproduct statement is distinct from interchanging an arbitrary limit. |
| §3.3 arbitrary-dimensional vector-space input HV | Dimensions 0,1,2 and uncountable κ | Δ gives 0→0, 𝔽_p→𝔽_p, 𝔽_p²→𝔽_p² on π₀; at κ the result is ⊕_κ𝔽_p on both sides, not ∏_κ𝔽_p | No countability or finite-dimensional shortcut. |
| §3.4 bounded-below Segal without finite type | S; Σ⁻¹HF_p; H(⊕_κ𝔽_p); KU at 2 as negative control | π₀(S completion)=ℤ_p; shifted HF_p has π₋₁=𝔽_p on both sides; large HV keeps ⊕_κ. KU completion /2 has π_even=𝔽₂, while T₂(KU)/2=0 | Lower bound is essential; missing cardinality restriction is intentional. |
| §4.1 unit-normalized lax W refinement; arbitrary spectra/E∞ rings | p=2,3; sphere unit; S[ℕ] generator z | Orders(W)=1,2. Sphere unit maps 1↦1; z maps to z^p, not z. Since p−1 is a p-local unit, W-invariants are exact | Uniqueness is of coherent lax refinement, not of arbitrary underlying functions. |
| §4.2 Ω∞ diagonal factorization | Zero; Hℤ at p=2 on 2; sphere unit | Zero gives the one-point space on both routes. Pre-Tate power gives 2²=4, versus additive 2. Unit gives 1, versus transfer value p | Space-level factorization does not assert a spectrum-level pre-Tate lift. |
| §4.3 norm-sequence splitting; π_i for i≥1, set section at i=0 | Zero; HF_p; HF₂ in degree zero | Zero sequence all 0. HF_p degree-zero kernel and quotient are 𝔽_p; for HF₂ the middle group is ℤ/4, so 2·section(1)=transfer(1)≠0 | The degree-zero section cannot be an additive splitting. |
| §4.4 degree-zero power; E∞ R and space X | 0,1,2 for Hℤ; a∈𝔽_p; restriction to trivial group | P(0)=0,P(1)=1; p=2 restriction P(2)=4 but P(1)+P(1)=2; a^p=a over 𝔽_p; restriction of P(x) equals x^p | Multiplicative, generally nonadditive; empty space gives zero group. |
| §4.5 Young transfer ideal; prime p | Hℤ; HF_p; p=5, input 1+1 | gcd(binomial(p,i),0<i<p)=p. HF_p transfer ideal=0. At 5, indices 5,10,10,5 generate (5); 2⁵−2=30 is 0 mod 5 but nonzero mod 120 | Full Young ideal is required; trivial-subgroup transfer alone fails. |
| §4.6 degree-zero Frobenius comparison | Hℤ at 2; H(𝔽₃[z]); X empty | Both routes send 2 to 0 mod 2; both send z to z³≠z; empty cohomology is 0 on both routes | Distinguishes Frobenius from const. |
| §4.7 ordinary rings and finite p-complete spectra | ℤ at 3, ℚ, zero ring, 𝔽₄; S_p^∧ | 2↦2³=2 mod 3; rational/zero targets=0; a∈𝔽₄ satisfies a↦a²=a+1. Sphere Frobenius=identity. Completed p-inversion telescope=0, but colim π₀Maps(S_p^∧,S_p^∧)=ℚ_p | Finite-cell completion, not categorical compactness, is the correct sphere condition. |
| §4.8 spherical Witt; finite k/𝔽_p of degree d≥1, marked étale lift | d=1; k=𝔽₄; general Teichmüller element | Rank 1 lift=S_p^∧ and F=id. Rank 2 lift has [a]↦[a²], F²=id. In degree d, F^d=id on π₀ and hence on marked étale lift | Conditional on the declared finite-field Witt contract; no new gap finding. |
| §5.1 parametrized representation spheres and virtual twisted cohomology | V=0; virtual rank −1 at a point; Möbius line; swaps | Zero twist gives ordinary R^n; rank −1 gives π₁R. Möbius integral cochains have differential 2 and H¹=ℤ/2, whereas trivial line gives ℤ. Swapping degree-one spheres has sign −1; degree-two spheres +1 | Genuine orientation local system retained; arbitrary virtual rank allowed. |
| §5.2 representation Thom adjunction; integer n, arbitrary R | n=0; n=−1,p=2; R=ΣHℤ or Σ²Hℤ; group restriction | n=0 gives Borel cohomology. Restriction of −ρ gives rank −p, hence π_pR. For the two test R at p=2, values are 0 and ℤ; incorrect π₁ would give ℤ and 0 | Corrected negative-rank Check agrees with both sides. |
| §5.3 Rezk power; every n∈ℤ, E∞ R | Zero class; n=0 unit; n=1; n=−1 | Zero↦0, unit↦1; target twist at n=1 has rank p, with sign −1 for p=2 transposition. At n=−1 target is S^(−ρ); tensor with S^ρ has rank 0 | Space-level construction has source and target with the required twist. |
| §5.4 relative tensor/Tate suspension; arbitrary E∞ R | n=0; R=HF₂,n=1; n=−1 followed by 1; R=S negative control | n=0 comparison=id. HF₂: both correct shift 1 and wrong shift 2 have all π_i=𝔽₂. Opposite twists compose to rank 0, positive twice has rank 4 at 2. For S: correct π₁=ℤ₂, wrong π₁=0 | The theorem's shift is correct; replace nondiscriminating Check by R05. |
| §5.5 extended-power Thom equivalence; virtual V over X | X=*, V=0,1,−1; p=2 | V=0: both sides Σ∞_+BΣ_p. V=1: negative twist rank −2 and determinant −1; trivial rank-two model has determinant +1. V=−1: Thom object ΣS, extended-power twist +ρ of rank p | Homotopy orbit/fixed-point roles agree by adjunction, not by identifying them. |
| §5.6 all-degree Frobenius/power comparison; no boundedness on R | n=0,Hℤ,p=2; n=1, u∈H¹(RP∞;𝔽₂); n=−1 | Both n=0 routes: 2↦0. Both n=1 routes: u+u²s with total degrees 1 and 2−1=1. Negative twist plus positive twist has rank 0 on both routes | Scope does not inherit the Segal boundedness condition. |
| §6.1 coefficient decompositions; p=2 and odd p | p=3 invariant monomials; integral p=2; sum versus product | Degrees of t²,t²e give suspensions 4,5, not 2,3. Hℤ Tate (π₀,π₁)=(𝔽₂,0), HF₂ Tate=(𝔽₂,𝔽₂). Per fixed homotopy degree exactly one or zero summands contribute, so direct sum→product is an isomorphism on π_i | Additive decompositions valid; integral scalar prescription needs R03. |
| §6.2 Euler-normalized ordinary power; right coefficients, x homogeneous degree n | p=2,u; p=3,v∈H²(CP∞), x,z∈H¹(BC₃²); p=5 | p=2: u(u+b)/b=u+u²s. p=3: v(v+u)(v+2u)/(-u²)=v−v³t². βx=y gives x−ye; product (x−ye)(z−we)=xz+(yz−xw)e=F(xz). At p=5, (2!)²=4=−1 and the i-th even sign is (−1)^i | Both signs supported by BMMS; unsigned source formula fails these computations. |
| §6.3 spectrum-map components with left suspension convention | i=0,1 at p=3; units at 2; x, xz, v; suspension ι×x | Unit gives identity/reduction 1. −P¹v=−v³=2v³, θ₁v=0. θ₀x=−y and θ₀(xz)=yz−xw. β(ι×x)=−ι×βx, so (−1)^(n+1)β(ι×x)=(−1)^nι×βx. At 2 Sq¹u=u²≠0 though positive π_*HF₂=0 | Degree-dependent odd coefficient is compatible with the explicitly chosen suspension rule; a π₀-only comparison would miss nonzero operations. |
| §7.1 cyclic tensor power; finite CW pairs, virtual complexes | 0,1; rank-two at p=2; virtual −1; line L | P(0)=0,P(1)=1. Rank two gives 3·trivial+sign, total rank 4 and transposition trace 2. P₂(−1)=sign, trace −1. Line gives L^p | Complex Koszul signs are essential; polynomial power of a virtual rank is not the construction. |
| §7.2 periodic KU Tate; C_p and C_(p²), x=L−1 | p=2,3; x=0; W-invariants | At 2: C₂ gives ℚ₂ dimension 1, C₄ gives ℚ₂⊕ℚ₂(i) dimension 3; odd π=0. At 3: ℚ₃(ζ₃) dimension 2, W-invariants ℚ₃ dimension 1. Correct series at x=0 is 0; wrong (x−1)^p−1 gives −2 at odd p | Constant map identifies invariant target with KU_p^∧[1/p]. |
| §7.3 KU Frobenius=localized stable ψ^p; compact spaces finite CW retracts | H=1+β on S², β²=0; Bott inverse; virtual −1 | (1+β)^p=1+pβ; β↦pβ and β⁻¹↦β⁻¹/p have product 1. Virtual −1 has p-cycle character −1 | No integral ring endomorphism of periodic KU with β↦pβ is claimed. |
| §7.4 unbounded Tate-orbit counterexample; residual extension action | KU, p=2,3; Hℚ control | π_even KU^(tC_(p²)) has ℚ_p-dimension p²−1, while iterated target has dimension p−1: 3 versus 1 at 2, 8 versus 2 at 3. Hℚ Tate=0 | Extending residual action to the circle gives trivial action on π_*; unbounded KU is a counterexample. |
| §7.5 unbounded tensor-Segal counterexample at 2 | KU degrees −2,0,2; S control | KU₂^∧/2 has 𝔽₂ in all three degrees; T₂(KU) rational, hence /2=0 in all three. T₂(S) has π₀=ℤ₂, so rationality does not extend to all inputs | Raw finite-height Tate descent, not K(1)-acyclicity alone, supplies rationality. |
| §8.1 free-loop totalization; based simply connected Y, any cardinality | *, S², S¹ negative control, ∨_κS²; n=1,2 | *=constant S and comparison=id. S² normalized fiber bottoms n,n+2 give (1,3),(2,4). S¹ gives constant first bottom 0. Arbitrary wedge has same n,n+2 bounds independent of κ | Growing connectivity justifies passing from finite models; no finite-type restriction inserted. |
| §8.2 limit/Tate comparison; finite G, connectivity of limit-to-stage fiber→∞ | Constant tower; comparison fibers ΣⁿHF_p; free-loop S² | Constant fibers=0, all comparisons=id. ΣⁿHF_p homotopy orbits have no π_i for i<n, hence π₀=0 for n≥1. S² bounds (1,3),(2,4) grow; S¹ bound 0 does not | Norm cofiber comparison uses finite exactness after separately comparing orbits and fixed points. |
| §8.3 free-loop cyclotomic Segal; simply connected Y; genuine comparisons n≥1 | Y=*; S² and ∨_κS²; n=0,1,2 | Sphere Frobenius target π₀=ℤ_p; genuine C_p sphere π₀ has rank 2. S²/wedge fiber bounds n,n+2. n=0 is identity; n=1,2 require one/two restriction pullbacks | Statement is p-completion/p-adic equivalence, not an integral genuine-fixed-point equivalence. |

### Supplier, convention and ownership ledger

The **10 distinct named roadmap suppliers** were resolved at main or their current open heads, including all subsection families below; repeated Needs citations use the same checked targets. The two missing exports and stale Check are R01, R02 and R04. No declared supplier gap was treated as a missing present-day implementation.

| Contract / file | Sections checked; computed witness | Result |
|---|---|---|
| `TauCetiRoadmap/StableHomotopyKTheory/README.md` | Layer 5; 7.9,7.14–7.19,7.21–7.26. Zero tower has lim=lim¹=0; constant HF_p Adams page has one 𝔽_p at (0,0); differential (s,t)↦(s+r,t+r−1) changes stem by −1 | Spectra, rationality, completion and convergence contracts are present. |
| `TauCetiRoadmap/GeneralizedCohomology/README.md` | G2.8, G3.8–3.9, G4.2,G5.3–5.4. D_G(0)=0 for k≥1 but D₀(0)=S; D₁(E)=E; D_(S₃)(S)=Σ∞_+BS₃ with π₀=ℤ. Degree-one swap −1, degree-two swap +1 | Extended powers and Thom/completion comparisons are imported, not rebuilt. |
| `TauCetiRoadmap/TangentialBordism/README.md` | B4 items 1,2,7,8. Sq¹u=u², Sq²u=0; P¹v=v^p,P²v=0; Sq¹Sq¹=0,Sq¹Sq²=Sq³; at 3 P¹P¹=2P². Dual degree dimensions at 2: 1,1,1; at 3 degrees τ₀=1,ξ₁=4 | Steenrod composition and dual conventions match; its exterior freeness is not R02's finite-chain freeness. |
| `TauCetiRoadmap/BordismFormalGroups/README.md` | F6.1,F6.3,F6.5. Trivial-group norm=id and Tate=0; induced sphere Tate=0; integral C₂ norm on π₀=2 and Tate π₀=ℤ/2. Height-one descent target E(0)=Hℚ, height-two target E(1) | Borel finite norm is present; it is not R01's genuine indexed smash norm. R02 identifies the finite-chain omission. |
| `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md` | 4.0,4.4,4.5. Integral cyclic differential alternates 0,p; mod-p differential=0. At p=2, Hℤ Tate π₁=0 while HF₂ Tate π₁=𝔽₂ | Genuine models, restriction comparison and algebraic/spectral Tate bridge present. |
| `TauCetiRoadmap/AInfCohomology/README.md` | AI.7.2 spectral diagonal and finite Tate orbit lemma. Mixed tensor orbit under C_p contributes 0; sphere unit maps 1↦1; Hℚ Tate=0 | Map and bounded-below orbit lemma supplied. Sphere completion is not one of its Checks: R04. |
| `TauCetiRoadmap/RefinedTraceMethods/README.md` | 2.1,2.3–2.6,2.8,2.10–2.13,2.16,5.1,6.1. Sphere representation Φ^G(S^ρ)=ΣS; β↦pβ,β⁻¹↦β⁻¹/p; Y=* cyclic bar=S. Finite-field contract at 𝔽₄ gives rank 2, a↦a+1,F²=id | Read supplied head; gap slug matches design and README. Genuine indexed smash remains R01. |
| `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` | E3 and E5:abstract. At p: X→*, p_! computes colimit and p_* limit; identity map has both adjoints=id; over a point virtual rank −1 gives [ΣS,R]=π₁R | Coherent adjoints/module conventions match the parametrized construction. |
| `TauCetiRoadmap/AlgebraicTopology/README.md` | Stage 6. For two degree-one classes β(xz)=β(x)z−xβ(z), whereas for degree-two x the second sign is +1 | Ordinary products are consumed with the stated Koszul convention. |
| `TauCetiRoadmap/TopologicalKTheory/README.md` | T1–T5, specifically T2.5 and T4. ψ^p([L])=[L]^p; on S², β=[H]−1 has β²=0, so ψ^pβ=pβ | Bundle and Bott conventions agree with the KU comparison. |
| Native inverse systems | Empty set system has sections=∅, not an automatically nonempty carrier. Constant two-element system has two sections and evaluation bijective | The seven cited cofiltered-system results and sections definition retain their actual hypotheses; no construction is duplicated in Suggested.lean. |
| Native Frobenius/Witt vectors | Over 𝔽_p, a^p=a; over 𝔽₄, a²=a+1. Witt Frobenius on W(𝔽_p) is id; on W(𝔽₄) it has order 2 | Characteristic-p coefficient formula is not asserted for arbitrary coefficient rings. |
| Boundary conventions | π_i=[ΣⁱS,E]; Rⁿ(*)=π₋ₙR. Rank 0 gives untwisted R, rank −1 gives π₁R. binom(-1,1)=-1; negative lower index gives 0; p=1 excluded | No natural subtraction/division junk value appears. Inverted u,t,β are units in the stated localizations. |
| Uncountable inputs and nonabelian test | D_(S₃)(S)=Σ∞_+BS₃, π₀=ℤ; ⊕_κHF_p retains finite support on π₀, not product support; ∨_κS² retains bottom degree 2 | Universe restriction admits these inputs; no hidden finite-basis or abelian-group substitution. |

Object searches used the roadmap service on main/open heads and local package files, including Singer constructions, Steenrod operations, geometric norms, extended powers, spherical Witt lifts, Tate coefficients, virtual Thom objects, Adams operations and free-loop comparisons. No duplicate Lean fully qualified name is possible with zero declarations. General perfect-base spherical lifts in `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md:145` are later in the merge order; the present finite-field étale comparison stays here and is not imported upward. Broader completed/formally étale lifting remains in that later roadmap. The sphere fixed-point counterexample already owned by RefinedTraceMethods §2.3 is imported, not redeclared. The prior repair's supplier-side Segal ownership concern is not re-raised as a package finding.

### Pinned declarations and source resolutions

The eight finite-system names resolve to `Mathlib/CategoryTheory/Types/Basic.lean:222` (sections) and `Mathlib/CategoryTheory/CofilteredSystem.lean:79`, `:125`, `:230`, `:255`, `:262`, `:312`, `:323`. In particular, `eventually_injective` is inside the section carrying finite nonempty stages and surjective transition maps, and also assumes a finite section set. It cannot be applied directly to arbitrary non-surjective original towers. `frobenius` is at `Mathlib/Algebra/CharP/Lemmas.lean:321`, with `[CommSemiring R] [ExpChar R p]`. Witt Frobenius and its two cited coefficient specializations are at `Mathlib/RingTheory/WittVector/Frobenius.lean:218`, `:255`, `:275`. The characteristic-p formula has its additional characteristic assumption. Native `WittVector` is the coefficient-sequence ring exposed by `Mathlib/RingTheory/WittVector/Basic.lean`; it contains no spherical spectrum or étale spectral lifting theorem.

Source count: **11 manifest entries opened; all 37 principal target locator chains resolved** to the indicated results or proof passages. This count treats one target's chain as one check, not every repetition in API bullets as a new verification. The following ledger groups those 37 resolutions. It distinguishes a correct locator from a source statement requiring the normalization corrections recorded below. The precise OCR limitations are listed under Not verifiable.

| Targets / reference | Locator and extraction witness | Resolution |
|---|---|---|
| §1.1; §6.1 | ns18 IV.1, coefficient displays, pp.332–333, line 5098; cyclic integral complex supplied separately | Weights and coefficients support the normalized computation; odd suspension factors in the source require correction. Integral scalar structure is R03. |
| §2.1 | lnr12 Definition 2.3, line 400 | Continuous cohomology is a colimit over stages. |
| §2.2 | lnr12 Proposition 2.2 and proof, pp.864–869, line 265 | Individual boundedness/finite type, complete inverse-limit Adams convergence. |
| §2.3 | lnr12 Definition 3.1 and augmentation, pp.875–877, line 641 | Laurent exponents, twisted action, zero negative operations and augmentation signs agree. |
| §2.4 | lnr12 Proposition 3.3 and Theorem 3.4, following line 641; agm85 Theorem 1.3 line 90 and §2 line 214 | Arbitrary-M Tor theorem and bounded-below finite-type Ext consequence; finite Hopf chain explicitly occurs in the proof. |
| §2.5 | lnr12 Definition 4.3/Lemmas 4.4–4.6; Proposition 5.7, p.902, line 1935 | Σ^(1+n) and Greenlees stage 1−(p−1)n match. |
| §2.6 | lnr12 Theorem 5.9, p.902, line 1964; proof p.903; Definition 5.10 line 2002; Proposition 5.12 line 2038 | Statement starts on p.902, not p.903; package locator has been repaired. Genuine comparison uses additional geometric data, R01. |
| §2.7 | lnr12 Theorem 5.13, p.905, line 2109 | Finite-type bounded-below Segal theorem. |
| §3.1 | ns18 Lemma III.1.8, p.289, line 3331 | Finite inverse limit, not merely finite stages, is used. |
| §§3.2–3.4 | ns18 proof of Theorem III.1.7, pp.288–291, line 3271 onward | Truncated tensor Tate, uniform pro-constancy and bounded-below extension; no finite-dimensional restriction survives. |
| §4.1 | ns18 Lemma IV.1.3 and Corollary IV.1.4, pp.325–326, line 4868 | Lax monoidal Weyl refinement, including suspension-spectrum factorization. |
| §§4.2–4.3 | ns18 Proposition IV.1.5 and Corollary IV.1.6, pp.326–327, after line 4900 | Underlying-space factorization; positive-degree splitting and degree-zero set section distinguished. |
| §§4.4–4.5 | bmms86 VIII.1 Propositions 1.1–1.4, scan pp.130–132, line 4297; ns18 Remark IV.1.11 line 4972 | Extended powers give Young-subgroup mixed transfers. The latter source's trivial-subgroup ideal alone is insufficient. |
| §4.6 | ns18 Corollary IV.1.10, p.328, line 4966 | Map direction and multiplicative Frobenius comparison agree. |
| §§4.7–4.8 | ns18 Example IV.1.2, pp.324–325, line 4843 | Ordinary Frobenius and finite-field spherical Witt example; package correctly avoids the source's categorical-compactness example. |
| §§5.1–5.3 | ns18 all-degree framework and Lemma IV.1.19, pp.333–338, line 5174 onward | Virtual representation twist and Thom adjunction; negative degrees retained. |
| §5.4 | ns18 Lemma IV.1.17 and proof, p.334, line 5194 | Relative tensor functor's exactness gives suspension by n, not np. |
| §5.5 | ns18 Lemma IV.1.20 and proof, pp.338–339, line 5338 | Extended-power Thom identification. |
| §5.6 | ns18 Lemma IV.1.18 and Theorem IV.1.21, pp.335,339, line 5397 | All-degree Frobenius/power comparison. |
| §§6.2–6.3 | bmms86 VIII.2 Proposition 2.4(vi), scan p.134, line 4481; Euler normalization scan p.135, line 4501; ns18 IV.1.15–16 lines 5132,5155 | Euler division gives (−1)^i; right odd coefficients give (−1)^(n+i). Corrected expressions have direct multiplicativity witnesses above. |
| §7.1 | bmms86 VIII.4 Theorem 4.1, Proposition 4.2, Lemma 4.3, scan pp.141–142, line 4664 | K-theory power comparison and cyclic tensor action. |
| §§7.2–7.4 | ns18 Example I.2.3(iii), p.220, line 640; Proposition IV.1.12, pp.329–330, line 5002 | Cyclotomic fields, ψ^p and residual-action counterexample. The p-series typo in the first locator is not copied. |
| §7.5 | ns18 proof of Theorem III.1.7, p.288, before line 3331; supplied finite-height descent | Rational tensor-Tate counterexample is strengthened by the explicit supplier contract for raw Tate. |
| §8.1 | kuhn04 Theorems 6.2,6.6, preprint pp.15–16, line 596; malkiewich17 Proposition 2.22 and full proof, preprint pp.14–15, line 609 | Finite-input comparison plus growing fiber connectivity supports arbitrary simply connected inputs; version-specific numbering is recorded. |
| §8.2 | ns18 proof of Theorem IV.3.7, p.355, line 5996 | Orbit-limit interchange uses increasing connectivity, then exact Tate. |
| §8.3 | ns18 Theorem IV.3.7 and proof, pp.354–355, line 5978; IV.3.2–3; II.4.9 | Free-loop Frobenius completion and genuine fixed-point comparisons. |
| Supplier operations | milnor58 Theorems 2–3, pp.159–162, lines 406,493; Cartan exposés 14–16, lines 131,153,114 respectively | Result locations and scope visible; complete symbolic certification of these scans is limited as stated below. BMMS and LNR independently fix the formulas actually used here. |
| Correction | ns19-correction pp.215–218, line 18 onward | Typesetting correction inspected; it does not repair the five issues listed below. |

### Direction and package policy

Read-only dependency gate output, exit status 0:

```text
depcheck: 56 roadmaps, 645 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The declared `gap:finite-field-witt-etale-frobenius` is identical in README and `design/plan.json`, names RefinedTraceMethods §6.1, and has the prime/finite-field/degree hypotheses needed for its one étale-lifting contract. Native Witt coefficient formulas do not already provide it. Acceptance of §4.8 remains conditional on that contract.

Read-only `git diff --stat origin/main...HEAD` at e5cae53 changes seven files, all inside `packages/StableHomotopyKTheoryPartII/`: README, Suggested.lean, design plan, metadata, two package reports and sources manifest (1641 insertions, 1 deletion). No outside-folder change, prohibited Lean option, computational algorithm, `lemma` declaration, sorry'd data, roadmap-module import, or pull-request/process narrative in README/Suggested was found. No file outside this review report and scratch notes was edited. No build, Git mutation, issue/PR write or message was performed.

## Not verifiable

- No Lean elaboration was run, as required by the read-only pass. This creates no missing signature check: Suggested.lean has zero declarations, so there is no elaborated type to compare. Future spectral implementations and theorem proofs are not present at the pins.
- The cached Cartan and Milnor extractions lose symbols in some displayed formulas (for example milnor58 line 493). The theorem locations, scope and low-degree consequences were checked, but every original index/sign in those scans was not certified. Local PDF-rendering tools were unavailable. No missing-source request is appropriate: all eleven cited texts are legally cached and their manifest entries are certified, not missing.
- The supplier gap remains a declared future export, not a present theorem. Its precision, ownership and matching slug were checked; its implementation cannot be verified now.
- Ownership was checked against the supplied sibling heads, main, local packages and the roadmap service's current index. No claim is made about undisclosed drafts or open work without readable files. No additional remote pull requests were sought.
- The prior repair identifies a supplier-side Segal dependency inside RefinedTraceMethods. This package consumes that existing owner and does not use its sphere counterexample to prove §2.7. Replanning that supplier was outside this pass; the settled package finding was not reopened.

## Source issues

- **Misprint** in ns18 at Example I.2.3(iii), printed p.220 (ns18 lines 649,660): the source says the multiplicative p-series uses x−1; it should be (1+x)^p−1, and likewise for p², when x=L−1; affects nothing.
- **Error** in ns18 at Example IV.1.2(ii), printed p.325 (ns18 lines 4852–4857): the source says the p-complete sphere exemplifies the categorical-compact hypothesis; it should be covered by a finite-cell-complete or dualizable hypothesis, since the completed p-inversion telescope refutes compactness; affects nothing.
- **Error** in ns18 at Remark IV.1.11, printed p.328 (ns18 line 4972): the source says the trivial-subgroup transfer ideal makes power additive; it should be the ideal generated by proper Young-subgroup transfers; p=5 gives ideals (120) and (5), respectively; affects nothing.
- **Misprint** in ns18 at the displays before and in Theorem IV.1.15, printed pp.332–333 (ns18 lines 5120,5126,5136,5140): the source says odd-primary suspensions use i(p−1) and i(p−1)+1; it should be 2i(p−1) and 2i(p−1)+1; affects nothing.
- **Error** in ns18 at Proposition IV.1.16, printed p.333 (ns18 lines 5167–5170): the source says the odd-prime total operation has unsigned power and Bockstein coefficients; it should be Euler-normalized coefficients (−1)^i and (−1)^(n+i), with degree-n input and Tate coefficients on the right; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e5cae53d723ef8212222feb7e9e31657e515e7ee", "job": "RT-StableHomotopyKTheoryPartII~1a", "model": "gpt-6-astra", "worker": "chris-30"} -->
