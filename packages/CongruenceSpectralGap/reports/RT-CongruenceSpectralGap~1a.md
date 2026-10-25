<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/957#issuecomment-6392991546 -->
Red team round 1 pass a (codex) of 4e34392

Verdict: needs_changes

1. **F01** (P3) The level-one area is attributed to the wrong supplier layer

   **Location:** `packages/CongruenceSpectralGap/README.md:62`, “Layer 2 supplies measurable domains, covolume independence and the level-one area”; repeated at lines 130, 145 and 147.

   **Claim:** FuchsianOrbifolds Layer 2 already supplies the level-one modular specialization used to normalize μΓ.

   **Witness:** `TauCetiRoadmap/FuchsianOrbifolds/README.md:235` supplies general polygon/covolume theory; its level-one specialization is Layer 6, item 1, at line 349. The two sections are distinct on main.

   **Exact repair text:** Replace the relevant supplier sentence with: “Layer 2 supplies measurable domains, covolume independence and polygon Gauss–Bonnet. Layer 6, item 1, supplies the level-one modular polygon and signature; together these give area π/3.” Add “FuchsianOrbifolds Layer 6, item 1” to §0.1's source and Needs clauses and to the corresponding supplier summary.

   **Repair test:** The modular signature has genus 0, one cusp and elliptic orders 2 and 3, so Gauss–Bonnet gives 2π(−2+1+1/2+2/3)=π/3. Effective index six then gives 2π for Γ(2), as required by both existing Checks.

2. **F02** (P3) Three zero Checks do not discriminate the defined objects

   **Location:** `packages/CongruenceSpectralGap/README.md:165`, “Δ0=0”; line 188, “0 belongs to the mean-zero subspace”; line 438, “G=0 gives F₂=0”.

   **Claim:** These bullets count as Checks of the quotient operator, mean-zero subspace and dual kernel.

   **Witness:** Both the zero operator and −Δ send 0 to 0; the zero subspace contains 0; the identically zero dual-kernel model also gives 0 when G=0. These are linearity/kernel/zero-integrand restatements.

   **Exact repair text:** Delete these three Check bullets. Keep the corresponding zero laws in the prose/API where useful. The other three Checks in each of §§0.2, 0.3 and 3.2 remain.

   **Repair test:** The surviving operator Checks reject exclusion of constants, the negative operator and the zero operator respectively. The surviving subspace Checks reject the whole space, real-mean kernel and zero space. The surviving dual-kernel Checks distinguish β−s, the factor 1/s and reflected support: for normalized support [3,4], x=1/5 gives 1 and x=2 gives 0.


3. **F03** (P1) The Kloosterman sheaf route has unowned conductor inputs

   **Location:** `packages/CongruenceSpectralGap/README.md:560`, “using compact/ordinary comparison and duality”; its Needs clause is at line 579.

   **Claim:** The listed foundations, weight theorem and additive-character gap suffice for the stated convolution route to lissity, rank and Swan conductor.

   **Witness:** `katz-gkm line 2489` uses Deligne’s Swan-constancy criterion for lissity; `katz-gkm line 2812` and `katz-gkm line 2816` use curve Euler–Poincaré for rank and Swan conductor. Neither input is among the named suppliers or declared gaps.

   **Exact repair text:** Add before §4.2b: “Import the break decomposition and Swan conductor from ArithmeticGaloisRepresentations §3.1. Import the ℓ-torsion affine-curve Euler characteristic theorem from InverseGaloisAndArithmeticFundamentalGroups, ‘Euler characteristic of ℓ-torsion local systems on affine curves’. Extend it to lisse finite-dimensional Eλ-sheaves on smooth connected curves U over an algebraically closed field of characteristic different from ℓ, with smooth proper completion C: χ_c(U,L)=rank(L)χ_c(U,Eλ)−Σ_{x∈C∖U}Sw_x(L). Include compatibility with coefficient extension (Katz §2.3.1, printed page32; katz-gkm line1352). This earlier target owns the rational-adic extension otherwise planned as EtaleDualityAndPerverseSheaves §5.2, curveEulerPoincareSwan.”

   Add a separate prerequisite target: “For a smooth proper family of curves over a smooth connected curve in characteristic p, a boundary consisting of disjoint sections, and a lisse finite-dimensional Eλ-sheaf L on the complement, ℓ≠p, prove that constancy of the sum of the boundary Swan conductors implies lissity of every compact direct-image cohomology sheaf on the base. Apply this criterion to the multiplication family compactified in P¹×Gₘ.” Cite Katz §5.2.1, pp.65–66, and give the general criterion its own source locator. Add both targets and ArithmeticGaloisRepresentations §3.1 to §4.2b’s Needs clause; record the ownership transfer instead of citing the later roadmap as a supplier. Establish the rank-one Artin–Schreier Swan calculation explicitly from that conductor API.

   **Repair test:** For the convolution of rank-k Kl with Lψ, the fibre on Gₘ has rank k and Swan conductors k at zero and 1 at infinity. Its Euler characteristic is 0−k−1=−(k+1); the vanishing of H_c⁰ and H_c² gives rank H_c¹=k+1. Their sum k+1 is constant as the multiplication parameter varies, so the lissity criterion applies. The Swan-product formula then gives 1·1=1 at infinity. Already k=1 needs these inputs to obtain rank 2 rather than an unsupported rank assertion.

4. **F04** (P3) The min–max theorem has the wrong section number

   **Location:** `packages/CongruenceSpectralGap/README.md:30`, “§4.3, p.119”; repeated at lines 193, 216, 270, 724, 743 and 771, and in `packages/CongruenceSpectralGap/sources.toml`.

   **Claim:** Teschl’s Theorem 4.10 and its form-domain observation are in §4.3 of the specified 2009 edition.

   **Witness:** `teschl line 5043` is the printed heading “4.4. Estimating eigenspaces”, immediately preceding Theorem 4.10 at `teschl line 5044` and its form-domain observation at `teschl line 5053`.

   **Exact repair text:** In every locator for Theorem 4.10, replace “§4.3” by “§4.4”; retain theorem number, printed page 119 and the source-line locators. Make the same replacement in its existing manifest entry.

   **Repair test:** The corrected locator reaches the operator min–max equality at page 119 and the immediately following extension to Q(A); it no longer points into the previous section.

## Verified sound

Read all 771 README lines and all 81 Lean lines: **4 declarations**, comprising **1 definition and 3 theorems**, and **28 numbered target sections**. The README has no additional bold-named targets; its bold Summary is covered by the headline inventory below. Tested **98 Check bullets**, with the three nondiscriminating bullets recorded in R02. Inspected **16 distinct cited locator groups in four accessible works**; the Teschl section number is defective as recorded in R04, while the theorem/page/line destinations exist. Also inspected the internal Katz proof steps used for R03. Checked the citations to **16 supplier roadmaps**, read three additional conductor owners, and searched the **47 supplied sibling heads** by object and for declaration-name collisions. These counts do not certify the unavailable LRS text or discharge the seven declared supplier gaps.

The supplied elaborated-signature record was compared with every declaration and README counterpart. All binders below are explicit; there are no section-variable blocks and no dropped instances. No elaboration or build was run during this read-only pass. The file has one `import Mathlib`, the required namespace and layer order, real-bodied data, three honest `sorry` proofs, no `set_option`, no `lemma`, and no process narrative. The read-only diff at the reviewed head lists seven changed files, all within `packages/CongruenceSpectralGap/`; the plan diff changes only its top-level gaps list.

The following tables distinguish a numerical/model test from a proof. An admissible model passing a test is evidence for its normalization, not a claimed construction of a presently unavailable automorphic representation. “Retain” means that the test supplied no additional finding; source and dependency qualifications are listed separately.

### Lean declarations and retained context

| Declaration; section; line in Suggested.lean | Complete relevant context | Instances and computed sides | Result; change |
|---|---|---|---|
| `hyperKloosterman`; §4.2a; 35 | F : Type u, Field F, Fintype F; k : ℕ; ψ : AddChar F ℂ; r : Fˣ. No positivity or nontriviality binder in the definition. | k=0: empty sum/product gives 1 at r=1, 0 elsewhere. F₂: k=1 gives −1, k=2 gives 1. F₃, k=2: (r=1,−1) gives (−1,2). | Total definition and field/unit coercions agree; retain. |
| `hyperKloosterman_bound`; §4.2b; 44 | Same native field instances; k≥1; ψ≠1; unit r; exponent is real (↑k−1)/2, not natural subtraction/division. | F₄ trace character: k=1 norms (1,1,1)≤1; k=2 norms (3,1,1)≤4; k=3 norms (5,3,3)≤12. Without ψ≠1, F₅,k=3 gives 16>15. Without k≥1, F₂,k=0,r=1 gives 1>0. | True normalization and necessary guards; R03 concerns the proof route. |
| `gauss_power_even_average_bound`; §4.3; 55 | q : ℕ, Fact q.Prime, NeZero q, q>2; k : ℕ, k≥1; r : (ZMod q)ˣ. Characters are all complex Dirichlet characters filtered by χ≠1 and χ(−1)=1. | q=3,k=1 or 2: LHS 0. q=5,k=2,r=1 or 2: LHS norm 5≤8√5+1. q=7,k=0,r=1 would give 2>1. | Conjugation, rank, prime and unit binders agree; retain. NeZero is the explicit native-carrier instance. |
| `congruence_eigenvalue_bound`; §5.3; 71 | Γ≤SL₂(ℤ); IsCongruenceSubgroup Γ; u : ℂ→ℂ; ContDiffOn ℝ 2 on Im>0; invariance, global boundedness on ℍ, nonconstancy on ℍ; λ : ℝ; pointwise positive hyperbolic eigen-equation. | r=1/5 gives λ=1/4−1/25=21/100. Omitting nonconstancy permits u=1, λ=0. Omitting boundedness permits E(z,3/2), λ=−3/4. Omitting congruence permits Γ={1}, u(z)=exp(iz), norm exp(−y)≤1, λ=0. | All three counterexamples fail the corresponding actual binder. Values outside ℍ cannot satisfy nonconstancy on ℍ or change derivatives on its open interior. Retain. |

### Headline coverage and one-tactic probe

| README headline | At the pins | Acceptance-test disposition and witness |
|---|---|---|
| General raw hyper-Kloosterman bound, §4.2b | Finite fields, units, AddChar and finite sums exist. | Stated; F₅ trivial-character value 16>15 shows the actual nontriviality binder matters. No pinned bound for this all-rank product fibre was found. |
| Even Gauss-power average bound, §4.3 | Dirichlet characters and Gauss sums exist. | Stated; exact projection plus principal subtraction yields 0 at q=3,k=2. It needs the deep hyper-Kloosterman estimate, not one pinned simplification. |
| Congruence gap, §5.3 | The classical eigenfunction version uses the native Laplacian and SL₂ action. | Stated; constant λ=0 is excluded. The README proves its agreement with the spectral version using the maximal domain and boundedness of small cuspidal eigenfunctions. |
| Quotient positive spectral bottom, spectral clipping and form Rayleigh gap, §§0.4,0.7,5.3–5.4 | The canonical quotient energy domain and Friedrichs realization are missing. | Explicitly named as unavailable in module lines 10–15; no free-Prop or arbitrary-operator substitute. Empty small spectrum gives 1/4, not the constant eigenvalue 0. |
| Exceptional cuspidal dictionary and adjoint, §§1.1–1.3 | Native cuspidal occurrence spaces, canonical parameters and lift are missing. | Named in module lines 16–18. Required parameter computation is ±1/5 → {2/5,0,−2/5}. |
| Forced zero and exact two-kernel identity/estimates, §§2.2,3.3–3.4 | Canonical Rankin–Selberg functions and parameter families are missing. | Named in module lines 19–22. Total Γℝ(0)=0 cannot replace its meromorphic residue 2. |
| First moment and dyadic nonvanishing, §§4.4–4.5 | Same missing automorphic carriers. | Named in module lines 19–22. d=9 gives strict nonvanishing boundary 4/5. |
| Spherical parameter inequality, §5.1 | Canonical unitary cuspidal GLₘ data are missing. | Named in module lines 16–18; m=3 bound is 2/5. |
| Kloosterman sheaf realization/purity, §4.2b | Native rational-adic direct image and lisse sheaves are missing. | Named in module lines 24–25; geometric trace is +1 when raw rank-two sum at F₃,r=1 is −1. |
| Metric comparison, §5.5 | Canonical quotient form/operator is missing. | Named in module lines 10–13; κ=4 multiplies the Rayleigh value by 4, with energy unchanged. |

The exact Gauss identity, cutoff inversion API and the real arithmetic of §5.2 are intermediate statements, not omitted deep headlines. The last gives 21/100 from r≤1/5 by elementary arithmetic and correctly stays out of Suggested.lean. None of the three retained theorems is a definition restatement, boundary Check or one-library-lemma result; there is no padding deletion to request.

### Target and API computations

Here A denotes the positive quotient area, Q(u) the real energy and H⁰ the complex mean-zero space. For finite-dimensional spectral model tests use Δ=diag(0,21/100,1/4) on ℂ³ with the first coordinate the constants; this tests the infimum APIs, not an asserted quotient spectrum. For cutoff tests, φ is smooth, multiplicatively normalized and supported in [3,4] unless specified otherwise.

| Statement | Instances tried; computed left and right sides | Result; change |
|---|---|---|
| §0.1 measure construction and effective quotient | Γ(1): area π/3; erroneous central doubling 2π/3. Γ(2): effective index 6 gives 6π/3=2π. Γ(3): effective index 12 gives 4π. | Retain mathematics; R01 corrects the supplier. |
| §0.1 independence of fundamental domain | F and γF have ∫dA=π/3 on both sides at level one; disjointly taking two copies has 2π/3 and fails the fundamental-domain hypothesis. | Retain. |
| §0.1 finiteness, positivity, proof independence | A=π/3 and 2π are finite and >0; changing a proof has the same quotient map and same A, not a new measure. | Retain. |
| §0.2 energy and closure | Constant cusp cutoff: missing squared L² mass ≤w/R; energy =w/R times ∫₁²(χ′)². Both tend to 0. Constant energy becomes 0 in the closure. | Retain; no cusp Dirichlet boundary condition. |
| §0.2 self-adjoint partial operator | Spectral model has Δ*=diag(0,.21,.25)=Δ, dense full domain; ⟨iu,Δiu⟩=.21 for u in the .21 eigenspace, equal to ⟨u,Δu⟩. | Retain; complex, not real-only, form. |
| §0.2 nonnegative pairing | Unit .21 eigenvector gives .21≥0; changing Δ to −Δ gives −.21<0. | Retain. |
| §0.2 kernel iff constants | Constant vector has Δ=0; the two nonconstant model eigenvectors have Δ=.21u,.25u≠0. A free-chart nonconstant bump has positive energy, hence nonzero Laplacian. | Both directions consistent; R02 only deletes the zero Check. |
| §0.2 maximal domain and torsion-free descent | N=1 gives torsion-free Γ(3); an L² constant has distributional expression 0∈L² and lies in the domain. Γ/Γ(3) includes a central kernel, but averaging is still an idempotent isometry projection. | Retain; distributional testing is upstairs in invariant charts. |
| §0.3 complex integral and Cauchy–Schwarz | u=1 gives A=√A·√A; u=i gives iA with norm A. Taking Re∫ would wrongly kill iA. | Retain. |
| §0.3 closed kernel equals constants-perpendicular | ⟨1,u⟩=∫u; for u=1 the two sides equal A≠0, for a mean-subtracted bump both equal 0. | Both directions consistent; R02 zero Check. |
| §0.3 reduction, domain and spectral projections | In the model, H⁰={(0,z,w)}; Δ and each diagonal spectral projection preserve first coordinate 0. Constant projection before/after Δ gives 0=0. | Retain. |
| §0.4 nonempty bounded-below Rayleigh set | Mean-zero unit eigenvectors give .21 and .25; every model quotient is (.21 abs(z)²+.25 abs(w)²)/(abs(z)²+abs(w)²)≥.21≥0. | Retain. |
| §0.4 equality of operator/form/spectral infima | In the model all three infima are .21; continuous-only model on [1/4,∞) has each infimum .25. Zero-dimensional mean-zero space would give an empty set and is excluded by the nonzero-space argument/contract. | Retain conditional on form-core gap. |
| §0.4 quotient upper comparison | For .25 eigenvector, λ′=.21≤.25; for .21 eigenvector equality .21=.21. Continuous threshold supplies λ′≤.25. | Retain; no division by zero. |
| §0.5 total clipped definition | S=∅,{.21},{1/3} gives inf({.25}∪S)=.25,.21,.25. For unbounded-below S=−ℕ the real conditional infimum is junk; no comparison is asserted without boundedness. | Retain. |
| §0.5 upper member comparison | S={1/3}, r=1/3: .25≤1/3; lower bound exists. | Retain. |
| §0.5 lower comparison | S={.21}, c=.20: .20≤.25 and .20≤.21 give .20≤inf=.21. For S=∅, c=.26 fails the threshold hypothesis .26≤.25. | Retain. |
| §0.6 residual/continuous/cuspidal decomposition | Γ(1),Γ(2) have respectively 1,3 cusp channels; constants have eigenvalue 0, continuous t=0,1 has λ=.25,1.25. A residual value .20 violates the supplier contract. | Retain conditional on two principal-level gaps. |
| §0.6 finite-group invariants | Deck S₃ regular representation: full dimension 6; invariants of a transposition have dimension 3; full invariants dimension 1. Passing to an intermediate group must not keep dimension 6. | Retain; tests a nonabelian group. |
| §0.7 Rayleigh/clipping equality | Small set {.21}: Rayleigh inf .21 equals clipped inf .21; empty small set: .25=.25. A value exactly .25 is excluded from the open small set without changing the result. | Retain. |
| §1.1 exceptional constituent and parameter | r=.20 gives λ=.25−.04=.21 for either common sign parity. r=0,.50 gives λ=.25,0 and fails strict exceptionality. | Retain. |
| §1.1 level/constituent passage | Γ=Γ(3) stays Γ(3), not Γ₀(3); commuting invariant projection sends Δu=λu to ΔPu=λPu, with λ=.21 unchanged when Pu≠0. | Retain conditional on stated classical comparison. |
| §1.2 self-twist induction and temperance | Real characters abs(·)^(it₁), abs(·)^(it₂) have real exponents (0,0). Imaginary quadratic unitary induction has bounded unitary Weil image; common real shift σ=1 gives central absolute exponent 2≠0. | Retain; no erroneous discrete-series gamma-shift test. |
| §1.2 exclusion of exceptional self-twist | Complementary real exponents (.20,−.20) differ from the tempered (0,0); self-twist branch cannot supply the exceptional representation. | Retain. |
| §1.3 adjoint and central twist | At r=.20, ratios give (.40,0,−.40). Common sign squares cancel. Twisting by θ multiplies Sym² and det by θ², so quotient factor θ²/θ²=1. | Retain. |
| §2.1 full finite coefficients and Tauberian normalization | b(1)=1; a ramified character times its inverse has local factor (1−p^−s)^−1 with coefficient at p equal to 1, whereas deletion would give 0. | Retain conditional on all-prime positivity gap. |
| §2.1 twisted coefficients and conductor | m=2 gives d=4, conductor fq⁴ and local L_q=1. At p≠q, b(p²) changes to b(p²)χ(p)², not 0. | Retain conditional on character-transport gap. |
| §2.1 epsilon normalization | f=4 gives abs(τπ)=2; at s=.50, 2q^(d/2)/(2q^(d/2))=1. Incorrect abs(τπ)=1 gives 1/2. | Retain. |
| §2.1 gamma parity and meromorphic FE | An odd real sign shifts Γℝ(s−μ) to Γℝ(s+1−μ); even χ gives shift 0. At a regular point s=.50 the conductor factor is (fqᵈ)^−.50 on both sides of the normalized equation. | Retain; poles handled as germs. |
| §2.2 maximal diagonal gamma pole | μ={.20,−.20}: self-pair shifts {.40,0,0,−.40}; at s=.40 one gamma argument is 0; residue of that factor is 2 and completion forces a finite-function zero. | Retain. |
| §2.2 location and order of forced zero | All shifted gamma poles have Re≤.40 in the same model; an order-e pole requires vanishing order at least e. β₀=0 fails the extra β₀>0 hypothesis. | Retain. |
| §3.1 first kernel and defining tail | x=1 gives tail 1; x=5 gives tail 0. The zero cutoff gives 0 at both points; normalization excludes it in analytic applications. | Retain. |
| §3.1 Mellin-tail inversion | At s=2, ∫₀ʸx dx=y²/2; Fubini gives mellin(F₁,2)=mellin(φ,2)/2, exactly the 1/s factor. | Retain. |
| §3.1 lower-support plateau | With a=3, x=1 or 3 gives 1 on both sides; the endpoint contribution has measure zero. | Retain. |
| §3.1 upper-support vanishing | With b=4, x=4 or 5 gives tail 0=0; the Ioi endpoint causes no extra mass. | Retain. |
| §3.1 dilation | c=2,x=2: F₁(φ(·/2),2)=F₁(φ,1)=1; dy instead of dy/y would insert factor 2. | Retain. |
| §3.2 dual-kernel definition | G=1, x=.20 gives F₂=1 and x=2 gives 0; reflected support is [1/4,1/3], not [3,4]. | Retain. |
| §3.2 zero-ratio API | G=0 gives integral 0 and F₂=0; this is a valid API law, a nondiscriminating Check. | Retain API; R02. |
| §3.2 linear-ratio identity | G(w)=w gives βF₁(φ∘inv,x)−φ(1/x); wrong β+s gives the same first term plus φ(1/x), a difference 2φ(1/x)≠0 inside reflected support. | Retain. |
| §3.3 large-x estimates | F₁ vanishes above 4. Shift F₂ to Re s=B+1 to obtain x^−(B+1)≤x^−B for x≥1; poles have Re≤σ+β₀−1<1, so none crossed to the right of 2. | Retain. |
| §3.3 small-x estimate and uniformity | σ=.50,β₀=.40,ε′=.10 gives powers x^−.50 and x^−.50 in the dual integral, each integral 2. π,β,φ fixed means no q or Y enters these constants. | Retain. |
| §3.3 collided poles | d=4 plus 1/s gives order≤5 and log degree≤4; t⁴e^−εt is bounded for t=−log x≥0. Without ε loss, t⁴ is unbounded. | Retain. |
| §3.4 exact functional equation | Y=2→4 doubles nY/(fqᵈ); at β=.50 both n powers are n^−.50. The residue at s=0 is k(0)Lχ(β)=1·Lχ(β). | Retain conditional on finite-function strip gap. |
| §3.4 absolute convergence | Primal tail has finite support. For dual n→∞ choose B>Re β+1, giving n^(Re β−1−B) with exponent<−2, against partial sums O(n). | Retain. |
| §4.1 average, agreement and zero APIs | L≡1,fπ=1,Q=3 gives 1; equal selected value gives the same 1 even if off-index values change. All selected values 0 gives 0. Q=0,1,2 gives 0. | Retain. |
| §4.2 even-character orthogonality | q=5: a=0,±1,±2 gives 0,1,−1; q=3 all branches give 0 because ±1 exhaust the units. | Retain. |
| §4.2 smoothed identity | Weight supported at n=1,q=5: direct sum 1; RHS (5−1)/2−1=1. Wrong partial subtraction gives 2. | Retain. |
| §4.2a rank-one and zero-rank sums | k=1 fibre is (r), sum ψ(r); k=0 empty fibre constraint gives 1 at r=1 and 0 otherwise. | Retain. |
| §4.2a field-isomorphism transport | F₄ Frobenius exchanges a,a+1; trace character is unchanged. Rank-two values at a,a+1 are both −1, so transport gives −1=−1. | Retain. |
| §4.2a additive-character scaling | F₃,a=−1,k=2 gives a²r=r; values remain (−1,2). k=1,r=1 gives ψ(−1) on both sides, unlike ψ(1). | Retain. |
| §4.2a trivial-character count | F₅,k=3: choose two units freely, 4²=16; nontrivial-character bound would be 15. | Retain. |
| §4.2b direct-image concentration and rank | k=1 multiplication is identity, R⁰ is rank 1 and other degrees 0. Convolution k=1→2 has Euler characteristic −2 and rank H_c¹=2. | Correct claimed values; R03 supplies missing prerequisites. |
| §4.2b local conditions | Rank-one Artin–Schreier sheaf: Swan at 0 is 0, at ∞ is 1. Rank-k convolution recurrence gives rank k+1 and Swan 1, including p=2. | R03; no coprimality condition on k. |
| §4.2b trace, purity and base extension | k=2,F₂,r=1: raw 1, trace −1. Over F₄, trace character gives raw at 1 equal 3, trace −3; rank stays 2, weight stays 1, eigenvalue norms become 2. | Retain normalization. |
| §4.2b numerical Deligne bound | F₃,k=2,r=−1: norm 2≤2√3; F₄,k=2,r=1: norm 3≤4. | Retain. |
| §4.3 exact Gauss identity | q=3,k=1: −1−(−1)=0; k=2: (−1+2)−1=0. q=5,k=2,r=1: 2·3−1=5, and r=2: 2·(−2)−1=−5. | Retain; raw rather than signed sheaf trace. |
| §4.3 bound and principal correction | q=5,k=2: norm 5≤8√5+1. k=0,q=7,r=1 gives identity 2=3(1+0)−1, but 2>1 contradicts the bound without k≥1. | Retain. |
| §4.4 first-moment error | d=4,σ=.90 gives exponent 1.25; d=9,σ=.80 gives 2 and σ=.90 gives 1.50. | Retain. |
| §4.4 smoothing balance | Y=Q^((d+1)/2): QY^(1−σ) and Q^(1+(d+1)/2)Y^−σ both have exponent 1+(d+1)(1−σ)/2. For d=4, Y/Q=Q^1.5→∞ and Y/Q⁴=Q^−1.5→0. | Retain. |
| §4.4 primal divisor argument | n=2: n−1=1 has 0 prime divisors, n+1=3 has 1; τ(1)+τ(3)=1+2=3 bounds them. n=1 instead has n−1=0 and infinitely many prime divisors, so is separated. | Retain. |
| §4.4 dual arithmetic argument | Choose q=5,f=2,n=1: r=n/f=3 mod 5; χ(f)conjχ(n)=χ(2)=conjχ(3). At n=5 every χ(n)=0. | Retain. |
| §4.4 dyadic main coefficient | Half the integral of t/log t on [Q,2Q] has coefficient (4−1)/4=3/4, matching half the weighted-prime coefficient 3/2. | Retain. |
| §4.5 nonvanishing and quantifiers | m=3,σ=.90 gives exponent1.5; choose ε=.25 and error/main is O(Q^−.25 log Q)→0. At σ=.80 exponent2 leaves no such ε. Complex summands 1+i and −1 sum to i≠0. | Retain existence, not positivity or every-twist nonvanishing. |
| §5.1 parameter inequality | m=2 gives .50−.20=.30; m=3 gives .50−.10=.40. At β₀=.80 equality is outside the strict contradiction region, so only ≤ is concluded. | Retain. |
| §5.2 arithmetic target | r=.20 gives .25−.04=.21; r=0 gives .25; r=−1 gives −.75 despite 2r≤.40, and violates r≥0. | Retain in README only. |
| §5.3 arbitrary-congruence gap | Empty small set gives .25≥.21. Exceptional r=.20 gives .21≥.21. Γ(2) and Γ(3) retain the same threshold despite areas 2π,4π. | Retain. |
| §5.3 classical eigenfunction form | u=1 forces λ=0 and fails nonconstancy. E(z,3/2) has λ=−.75 and fails boundedness. u=exp(iz),Γ={1},λ=0 fails congruence. | Retain actual binders. |
| §5.4 operator and form inequalities | u=0 gives 0≥0; unit .21 eigenvector gives .21≥.21; 2iu gives .84≥.84. Constant 1 gives 0<.21A and fails mean zero. | Retain conditional on form-core comparison. |
| §5.5 measure/metric/operator comparison | κ=4: inverse metric ×4, volume ÷4, energy ×1, operator ×4, curvature −4; κ=0 is degenerate and κ<0 is not positive definite. | Retain κ>0. |
| §5.5 infimum and scale-independent ratio | Q=.21 and squared norm1 become Q=.21 and squared norm.25: quotient .84=4·.21; .84/4=.21. Threshold .25 becomes1. | Retain. |
| Final consumer arithmetic, line 749 | (.21)(π/3)/(8π)=21/2400=7/800; no geometric comparison is inferred from this scalar identity. | Retain scope boundary. |

### Every README Check

Line numbers refer to `packages/CongruenceSpectralGap/README.md`. Each row corresponds to one of its 98 Check bullets, in order.

| Line | Instance | Computed sides | Result; change |
|---|---|---|---|
| 140 | Γ(1), effective area | π/3 versus incorrect 2π/3 | Retain; R01 locator |
| 141 | Γ(1), Γ(2), zero measure | π/3>0, 2π>0, incorrect 0≯0 | Retain |
| 142 | F and γF; two overlapping copies | π/3=π/3; doubled domain 2π/3≠π/3 fails hypothesis | Retain |
| 143 | Γ(2) | 6·π/3=2π versus incorrect π/3 | Retain |
| 165 | Zero vector | Δ0=0 also for −Δ and the zero operator | R02 delete Check |
| 166 | Constant 1 | Norm squared A, energy 0, Δ1=0; cusp cutoff energy O(1/R)→0 | Retain |
| 167 | Unit positive eigenvector | Re⟨u,Δu⟩=.21>0; −Δ gives −.21<0 | Retain |
| 168 | Nonconstant free-chart bump | Energy E>0, so Δu≠0; zero operator would give E=0 | Retain |
| 188 | Zero vector | Complex integral 0=0, also true for the incorrect zero space | R02 delete Check |
| 189 | Constant 1 | Integral A=π/3≠0 at level one | Retain |
| 190 | Constant i | Integral iπ/3≠0 while its real part is 0 | Retain |
| 191 | Bump b with integral B | Integral of b−B/A is B−(B/A)A=0; norm is positive because b is nonconstant | Retain |
| 212 | No exceptional eigenvalue | Continuous bottom .25 gives inf .25=.25 | Retain |
| 213 | Unit lowest eigenvector in model | Numerator .21, denominator1; lower bound .21 and attained quotient .21 give inf .21 | Retain |
| 214 | Constants removed versus retained | Positive bottom≥.21; incorrect whole-space inf is 0<.21 | Retain |
| 234 | S=empty | Inserted singleton inf .25; real bare empty inf 0 | Retain |
| 235 | S={.21} | min(.25,.21)=.21 | Retain |
| 236 | S={1/3} | min(.25,1/3)=.25≠1/3 | Retain |
| 250 | Γ(1), u=1 | One cusp; (3/π)(π/3)=1 | Retain |
| 251 | Γ(2), u=1 | Three cusps; (1/(2π))(2π)=1; one channel would miss two | Retain |
| 252 | s=.50+it, t=0,1 | s(1−s)=.25+t² gives .25,1.25; residual .20 is excluded | Retain |
| 266 | Empty small spectrum | inf{.25}=.25 | Retain |
| 267 | Small spectrum {.21}, or only threshold eigenvalue | inf{.25,.21}=.21; threshold .25 not in open small set gives .25 | Retain |
| 268 | Zero constant eigenvalue | 0 not in (0,.25); inserting0 makes inf0 instead of positive bottom | Retain |
| 296 | r=.20, parity0 or1 | .25−.04=.21 in both cases | Retain |
| 297 | r=0,.50 | λ=.25,0, both outside (0,.25) | Retain |
| 298 | Principal Γ(3), commuting projection P | Cover is identity; ΔPu=.21Pu from Δu=.21u | Retain |
| 314 | Real quadratic unitary induction | Real parts (0,0) versus complementary (.20,−.20) | Retain |
| 315 | Imaginary quadratic character with k=1,t=0 | Weil image unitary; modulus1, despite a possible nonzero real gamma shift | Retain |
| 316 | Real shift σ=1,0 | Central absolute exponents2σ are2,0; only0 is unitary | Retain |
| 332 | r=.20 | Adjoint exponents .40,0,−.40 | Retain |
| 333 | Two common sign factors at a negative real argument | (−1)/(−1)=1; remaining norm exponent2r=.40 | Retain |
| 334 | Twist with θ²≠1 | Raw Sym² factor θ²; inverse determinant θ^−2; product1 | Retain |
| 362 | m=2, unramified twist prime q=5 | d=4; local L=1; conductor factor5⁴=625, not25 | Retain |
| 363 | f=4 at s=.50 | abs(τπ)=2 gives norm1; incorrect norm1 for τπ gives1/2 | Retain |
| 364 | Ramified ρ paired with ρ⁻¹, p≠q | Product character1 has L=(1−p^−s)^−1; p coefficient1 transports to χ(p), not0 | Retain |
| 365 | Odd versus even real character | Γℝ(s−μ) becomes Γℝ(s+1−μ) for odd χ; shift0 for even χ | Retain |
| 381 | r=.20 | Shifts .40,0,0,−.40; at β₀=.40 one argument0, hence a pole | Retain |
| 382 | β₀=0 | Strict hypothesis0>0 is false; no forced-zero assertion used | Retain |
| 383 | s=0 versus punctured s→0 | Total Γℝ(0)=0; limit sΓℝ(s)=2; meromorphic order−1 | Retain |
| 416 | c=2, support[3,4], x=2 | Both multiplicative tails equal1; ordinary dy dilation would multiply by2 | Retain |
| 417 | Normalized support[1,2], x=.50 | Multiplicative tail1; indicator with ordinary mass1 instead has tail log2≠1 | Retain |
| 418 | Support≤2, x=3 | Integration tail meets no support, integral0 | Retain |
| 438 | G=0 | F₂=0 also in the identically-zero wrong model | R02 delete Check |
| 439 | G(w)=w; x within reflected support | Correct βF₁−φ(1/x), wrong βF₁+φ(1/x), difference2φ(1/x)≠0 | Retain |
| 440 | G=1, support[3,4], x=.20 | Correct reflected tail1; dropping1/s gives φ(5)=0 | Retain |
| 441 | G=1, support[3,4], x=2 | Correct reflected tail0; unreflected tail1 | Retain |
| 457 | σ+β₀=1 | Power is x^−ε; with x=e^−t, logarithm t is bounded by Cεe^(εt), but not by a constant | Retain |
| 458 | d=4, pole at0 | Order at most4+1=5; logarithm degree≤4, t⁴e^−εt bounded | Retain |
| 459 | σ=.50,β₀=.40,ε′=.10 | Both powers x^−.50; each integral on(0,1) equals2 | Retain |
| 475 | Y=2 versus4 | Dual arguments2n/(fqᵈ),4n/(fqᵈ); ratio2, not1/2 | Retain |
| 476 | β=.50 | Primal n^−β=n^−.50; dual n^(β−1)=n^−.50; χ and conjugateχ remain distinct generally | Retain |
| 477 | φ=0 | k(0)=0, both kernels0, RHS0; normalization requires1 and fails | Retain |
| 509 | Q=0,1 or fπ=0 | Empty interval, no characters at2, or every prime dividing0 each gives average0 | Retain |
| 510 | L=1,fπ=1,Q=2 | Only prime3; number of even nonprincipal characters0; sum0 | Retain |
| 511 | L=1,fπ=1,Q=3 | Only prime5; one selected character; sum1 | Retain |
| 512 | L=1,fπ=5,Q=3 | Prime5 removed; empty sum0 | Retain |
| 528 | q=3, all residue classes | At0 value0; at±1,(3−1)/2−1=0; no other units | Retain |
| 529 | q=5, residues0,±1,±2 | Character sums0,1,−1 equal three formula branches | Retain |
| 530 | q=5,n=1 | 2−1=1; incorrect omitted subtraction gives2 | Retain |
| 549 | k=0,r=1 or≠1 | Empty product fibre contributes1 or0 | Retain |
| 550 | F₂,k=1,2 | Only tuple of units gives ψ(k)=−1,1 | Retain |
| 551 | F₃,k=2,r=1,−1 | Raw values−1,2; signed sheaf traces1,−2 | Retain |
| 552 | F₅,k=3,trivial ψ | 4²=16>3·5=15 | Retain |
| 572 | k=1,nontrivial ψ | Rank1, trace sign+1, normψ(r)=1, bound1 | Retain |
| 573 | F₃,k=2,r=1,−1 | Raw−1,2; trace1,−2; norms1,2≤2√3 | Retain |
| 574 | F₂,k=2 | Raw1, trace−1, norm1≤2√2 | Retain |
| 575 | F₂,k=0,r=1 | Raw1; proposed RHS0; 1≤0 false | Retain guard |
| 593 | q=3,k=1,r=1 | Kl₁(1)+Kl₁(−1)=−1; RHS−1−(−1)=0=LHS | Retain |
| 594 | q=3,k=2,r=1 | RHS(−1+2)−1=0=LHS | Retain |
| 595 | q=5,k=2,r=1,2 | Gauss square5; weighted values5,−5; norm5≤8√5+1 | Retain |
| 596 | q=7,k=0,r=1 | Identity2=3(1+0)−1; proposed bound1<2 | Retain guard |
| 612 | d=4,σ=.90 | 1+5(.10)/2=1.25<2 | Retain |
| 613 | d=9,σ=.80,.90 | Exponents1+10(.20)/2=2, and1+10(.10)/2=1.50 | Retain |
| 614 | Dyadic weighted-prime integral | Half of (4−1)/2 is3/4; not1/2 | Retain |
| 615 | n=1 | Every prime divides n−1=0; divisor bound for positive integers has no input at0 | Retain |
| 631 | m=3,σ=.80,.90 | Boundary1−2/10=.80 excluded; .90>.80 included | Retain |
| 632 | m=2,σ=.60 | Boundary1−2/5=.60; exponent1+5(.40)/2=2 | Retain |
| 633 | Complex values1+i,−1 | Sum i≠0, and summands need not be positive; adding a zero term shows not every term need be nonzero | Retain |
| 661 | m=3 | .50−1/10=.40 | Retain |
| 662 | m=2 | .50−1/5=.30; .25−.09=.16=4/25 | Retain |
| 663 | β₀=1−2/(m²+1) | β₀>boundary is false at equality; resulting bound is≤, not< | Retain |
| 679 | r=.20 | 2r=.40; λ=.25−.04=.21 | Retain |
| 680 | r=0,.30 | λ=.25,.16; .60≤.40 false for second instance | Retain |
| 681 | r=−1 | 2r=−2≤.40 but λ=−.75<.21; r≥0 false | Retain guard |
| 699 | Three constants | 3/16=75/400;21/100=84/400;1/4=100/400; improvement9/400 | Retain |
| 700 | Empty small spectrum | λ′=.25≥.21 | Retain |
| 701 | Witness N=0 or noncongruence Γ | Nonzero-level condition is false at0; no positive principal subgroup is contained in a noncongruence Γ | Retain |
| 702 | u=1,Γ=SL₂(ℤ) | Δu=0; equation forcesλ=0<.21; hnc false | Retain guard |
| 703 | E(z,3/2) | λ=(3/2)(−1/2)=−3/4; cusp growth y^1.5 unbounded | Retain guard |
| 704 | y^s, s=2 and .50+it | Positive operator gives−2y² and(.25+t²)y^s; opposite sign changes threshold to−.25 | Retain |
| 720 | u=0 | Energy0 and .21·norm²=0; no zero denominator | Retain theorem boundary |
| 721 | Unit equality model and2iu | Both sides .21; after scaling both .84=21/25 | Retain |
| 722 | u=1 at level one | LHS0; RHS(.21)(π/3)=7π/100>0; mean≠0 | Retain guard |
| 738 | κ=1 | Measure, operator and Rayleigh factors1; threshold.25, gap.21 | Retain |
| 739 | κ=4 | Measure factor1/4, operator4, energy1, threshold1, gap.84 | Retain |
| 740 | Norm²1,energy.21,κ=4 | New norm².25,energy.21; quotient .21/.25=.84 | Retain |
| 741 | κ=0,−1 | Zero scaling parameter has no inverse positive metric; κ=−1 makes gκ=−g negative definite | Retain guard |

### Convention, degeneracy and definition audit

| Convention or boundary | Computed witness | Result |
|---|---|---|
| Effective projective action, including a nonabelian deck group | −I acts identically on ℍ; SL₂(ℤ)/Γ(2)≅S₃ has order6. Its regular invariants have dimensions6,3,1 for the trivial subgroup, a transposition subgroup, and S₃. | Kernel removal and intermediate invariants are essential and specified. |
| Positive Laplacian versus Mathlib's Laplacian | Mathlib Δ(x²+y²)=4; hyperbolic positive Δ(y²)=−2y². At y^(.50+it), eigenvalue=.25+t². | Signs agree in geometry, the supplier's Casimir normalization and the Lean equation. |
| Complex inner product and whole mean | Q(iu)=Q(u); ∫i=iA≠0 whereas Re∫i=0. | No real-only mean or energy substituted. |
| Gamma and infinity normalization | Γℝ(0)=0 as a total function; meromorphic residue2. For μ={.20,−.20}, rightmost self-pair pole=.40. | Germ argument avoids total-function junk. |
| Positive Fourier and geometric Frobenius conventions | exp(2πi/3)=−1/2+i√3/2. Principal Gauss sum=−1. Rank-two F₃ raw sum−1 corresponds to geometric trace+1. | Sign is fixed beyond the even-character average, which alone cannot detect conjugating the exponential. |
| Mellin measure and contour | Indicator of [1,2] has ordinary mass1 but multiplicative mass log2. With ds=i dt, (2πi)^−1ds=(2π)^−1dt. | No omitted i, residue normalization or reflection. |
| Empty sets, zero vectors and rank | Empty small spectrum→.25; zero Rayleigh vector excluded before dividing, but form inequality0≥0 includes it. Hyper rank0 at r=1 gives1 versus bound0. | Different empty/zero conventions are not conflated. |
| Zero rings, q=1, arbitrary cardinalities | Field supplies 0≠1 and Fintype supplies finite cardinality≥2; q prime excludes0,1. F : Type u is retained without ULift. | These invalid inputs cannot enter the numerical finite-field bound. |
| Small primes and non-prime finite fields | F₂ rank2 sum1; F₃ rank2 sums−1,2; F₄ rank2 sums3,−1,−1. Finite fields are perfect, so their finite extensions introduce no inseparable exception. | Characteristic2 and ranks divisible by characteristic are included. |
| Denominators and positivity | Nonzero vector norm²>0; f,fπ,q>0; κ>0; x,Y>0. A generic average with fπ=0 is0, but analytic fπ is positive. | No use of 0 to a negative power or 0/0 in a claimed comparison. |
| Noncompact geometry | Cusp width w gives area above R equal w/R; cutoff energy is O(w/R). | Finite area is used without treating the cusp quotient as compact. |
| Coefficients and irrelevant algebraic degeneracies | Rank-zero sheaf would have trace0, while rank-one Artin–Schreier has trace norm1. ℓ=p is explicitly excluded. All sheaf bases here are smooth finite-type curves/tori; a square-zero thickening is not such a base. | No arbitrary nonreduced/DVR/zero-module hypothesis is silently admitted. |

The ten definition/construction families have Check counts 4,4,4,3,3,3,4,4,4,4 for §§0.1,0.2,0.3,0.4,0.5,3.1,3.2,4.1,4.2a,4.2b respectively. Removing R02's three bullets leaves at least three per family. The finite numerical scratch calculation additionally compared the exact Gauss identity at all units for q=3,5,7 and k=0,1,2,3: 48 instances, with agreement up to numerical roundoff. The exact low-rank values in the tables establish the cited sign/constant witnesses independently of that floating-point experiment.

### Supplier resolution, ownership and dependency direction

All supplier locators below were resolved against main or the current head available to the roadmap tool, rather than a remembered section number. File paths in this table are relative to their roadmap repository. Each row records the contract used, including its relevant limitation.

| Supplier and checked locations | Resolution |
|---|---|
| `TauCetiRoadmap/FuchsianOrbifolds/README.md:193`, Layers0–3; line349, Layer6.1 | Effective action, charts, polygon covolume and cusp geometry exist. Modular specialization is Layer6.1, giving R01. |
| `TauCetiRoadmap/DifferentialGeometry/README.md:910`, Layer12 | Gradient/divergence, Hessian, volume and Green identities are present. Constant scaling uses these definitions; inverse metric factor4 cancels volume factor1/4 in dimension2. |
| `TauCetiRoadmap/PDE/README.md:223`, LaneA.1; line322, LaneE.20 | Weak derivatives/Sobolev constructions and local elliptic improvement exist. The package expressly owns the initial L²-to-W¹,² mollifier step instead of attributing it to the W¹,²-to-W²,² theorem. |
| `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md:799`, SA-C; line1202, SA-E01–E13 | Actual partial domains, reducing restrictions, spectral support and form bounds exist; no bounded-operator stand-in. |
| `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:23`, UO-A01–A03; line172, UO-D06 | Spectral integrals and semibounded closed-form representation exist; the particular operator/form/spectral infimum comparison is explicitly declared as a gap. |
| `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:191`, §§0.6–0.7; lines1286,1313,2352,2363,2395,2417,2522 | Operator transport, §1.16 expression, §1.16a Γ₀(N), §§4.3–4.4 orthosum/residual, §4.6 twists, §4.8 level-one expansion and §4.14a residual blocks resolve. All-principal-level specialization remains the declared gap. |
| `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:418`, §§2.5–2.7; lines496,568,679,688 | Weil parameters/generic unitary classification, classical components, factorization and arbitrary-congruence Maass carrier exist. The named `maassClassicalEquiv` at §4.5 is level one; the package acknowledges this and declares its extension. |
| `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:898`, ALS.F.6 | Cuspidal carriers, rapid decay, discrete constituent decomposition and finite multiplicity supply actual occurrence. It is not inferred from a bare representation definition. |
| `TauCetiRoadmap/GlobalNumberFields/README.md:433`, Layers6,9–10 | Norm-one compactness, unique real shift/unitary part and infinity types exist. Quadratic scalar norm exponent is2σ, yieldingσ=0 under unitarity. |
| `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:2144`, R17.4.13 | Adjoint lift, local parameter, self-duality and self-twist/cuspidality branch exist. Exponents are ratios (.40,0,−.40), not uncorrected Sym² with a residual central twist. |
| `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1337`, AL.1; lines2044,2071,2141,2239,2250,2263,2338–2374, AL.3 | Named archimedean/local/global factors, Whittaker genericity, pole/functional-equation/boundary statements, `rsDatum`, `IsNicePinned` and `LDatum` resolve. The three extra contracts are declared, not misrepresented as implemented. |
| `TauCetiRoadmap/ZerosOfLFunctions/README.md:475`, Layer1; line710, Layer3.3 | Gamma asymptotics and finite-function polynomial strip bounds resolve. Its plus-shift convention is used with shifts −μⱼ−conj μₖ here. Completed boundedness alone is not used to kill finite-function contours. |
| `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2618`, §7.12; line3595, DWP.10 | Cohomological weight bounds, purity of the compact-to-ordinary image and finite-field applications exist. They do not supply R03's conductor/lissity inputs. |
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md`, F.0–F.6 and F.10.1–F.10.2b | Rational-adic carriers, compact direct images, base change, duality and geometric trace conventions resolve. They contain neither the missing conductor formula nor the Swan-constancy criterion. |
| `Completed/ArithmeticDirichletSeries/README.md:256`, Layer6 | Abel/Perron summation is the completed earlier owner; it supplies the partial-summation route. |
| `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:2947`, §3.26 | τ(n)≤Cεn^ε is uniform for n≥1, not a bound on the number of divisors of0. The package separates n=1 accordingly. |

Seven gap slugs match exactly between `design/plan.json` and the README contracts: `form-rayleigh-core`, `all-level-spectral-realization`, `principal-level-classical-constituents`, `all-prime-self-pair-positivity`, `self-pair-local-character-transport`, `finite-rs-polynomial-strips`, and `additive-character-sheaf-weight`. Every supplier is named. Each is one coherent missing comparison/analytic record/specialization, with its required normalization; none was found already provided at the cited generality. In particular, the existing Γ₀(N) and level-one adapters do not supply arbitrary principal levels, and a generic weight theorem does not construct the specified Artin–Schreier trace sheaf. These gaps are accepted conditionally, not findings.

The citation resolver's sole unresolved Lean name, `LFunctions.AnalyticLFunctionData`, is a planned supplier record explicitly requested in `gap:finite-rs-polynomial-strips`; the package never imports it into Suggested.lean. Its absence at the pins is therefore not a missing-declaration finding.

Ownership searches covered main, Completed, board packages and the supplied sibling heads using both roadmap grep and local searches for the underlying objects. There is no competing fully qualified declaration name for any of the four Lean declarations. Ordinary character orthogonality, gamma, Mellin inversion, prime counting, local energy and spectral theory are consumed from their owners, not redeclared as acceptance-test padding.

`packages/KloostermanMomentsAndPotentialAutomorphy/design/README.md` overlaps in KM.0's raw sum and KM.1's raw sheaf/trace/purity construction. CongruenceSpectralGap is at merge-order position107; that design is at256, followed by KloostermanSheavesAndBesselIsocrystals at257. Record ownership of the raw sum and all-rank raw sheaf realization here, as §§4.2a–4.2b already do; the later design retains moments, normalization and monodromy. Eliminating the last unit identifies its rank-(n+1) fibre with this package's k=n+1 fibre; at F₃,rank2 both raw formulas give −1 and2. No upward supplier edge should be added for this overlap. R03 separately records the required earlier ownership of the rational-adic curve Euler characteristic.

The cited EtaleCohomologyFoundations F.0–F.6/F.10 and DeligneWeightsAndPurity §7.12 contain no Swan-constancy criterion or Euler–Poincaré-with-Swan theorem. Local conductors already belong to `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:2506`, §3.1. The torsion formula is a target of `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:6590`, “Euler characteristic of ℓ-torsion local systems on affine curves”; the rational-adic extension is at `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:4914`, §5.2. The last roadmap is later in the merge order (123 versus 107), so adding it as a supplier would be an upward dependency. The registry ownership search found no supplied Swan-constancy theorem. The current additive-character gap specifies trace, weight and tensor compatibility, not these general conductor theorems.

The read-only mechanical dependency check returned exactly:

```text
depcheck: 48 roadmaps, 535 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The within-package order also has no cycle: §0.4's numerical upper bound waits for §0.6, while §0.6 uses §0.2 and the declared adelic comparison, not §0.4; §0.7 then combines them. The parameter proof uses §2.2 and §4.5, not itself. Galois/conductor prerequisites missing from the text are R03; their absence is not detected by a graph built only from stated edges.

### Pinned-library evidence

Pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, as recorded in the content manifest. These are the declarations checked at those pins, with the actual hypotheses relevant here.

| Pinned file:line and declaration(s) | What the native object supplies and does not supply |
|---|---|
| `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:163`, `CongruenceSubgroup.IsCongruenceSubgroup`; line180, `.finiteIndex` | Some nonzero principal level is contained in Γ; finite index follows. N=0 is not a witness. |
| `Mathlib/GroupTheory/GroupAction/Defs.lean:349`, `MulAction.orbitRel.Quotient`; `Mathlib/Algebra/Group/Action/End.lean:184`, `MulAction.toPermHom` | Orbit quotient and effective permutation image; neither asserts a measure or free action. |
| `Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean:44`, `UpperHalfPlane.volume_def`; `TauCeti/Analysis/Complex/UpperHalfPlane/PoincareMetric.lean:181`, `UpperHalfPlane.riemannianVolume_eq_volume` | Density y⁻² and the actual metric-volume comparison. |
| `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:630`, `MeasureTheory.IsFundamentalDomain.quotientMeasure_eq` | Equality uses actual fundamental domains, countable group and the measurable invariant action; it does not remove central isotropy automatically. |
| `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89`, `MeasureTheory.Lp`; `Mathlib/LinearAlgebra/LinearPMap.lean:41`, `LinearPMap` | Almost-everywhere classes with finite Lp norm; separately, a submodule domain and linear map. Neither selects a canonical quotient Friedrichs operator. |
| `Mathlib/Analysis/MellinTransform.lean:90`, `mellin`; line95, `mellinInv`; line153, `mellin_comp_inv`; `Mathlib/Analysis/MellinInversion.lean:92`, `mellinInv_mellin_eq` | Actual integral conventions. Inversion retains CompleteSpace, x>0, Mellin convergence, vertical integrability and continuity at x. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:45`, `Complex.Gammaℝ`; lines75,104, `Gammaℝ_eq_zero_iff`, `Gammaℝ_residue_zero` | Total value0 at the pole, punctured residue2. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean:426`, `Complex.Gamma_ne_zero`; line521, `Complex.differentiable_one_div_Gamma` | Nonvanishing away from the exceptional integers and entire reciprocal, not a nonzero total value at poles. |
| `Mathlib/NumberTheory/DirichletCharacter/Orthogonality.lean:68`, `DirichletCharacter.sum_characters_eq` | Full character sum under nonzero-modulus/domain/enough-roots hypotheses. Even/nonprincipal projection still has to be proved. |
| `Mathlib/NumberTheory/GaussSum.lean:72`, `gaussSum`; `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean:83`, `ZMod.stdAddChar`; lines89,95, evaluation and `ZMod.isPrimitive_stdAddChar` | Positive exponential and raw finite sum. The principal Gauss sum is−1 at a prime. |
| `Mathlib/Analysis/InnerProductSpace/Laplacian.lean:138`, `InnerProductSpace.instLaplacian`; `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:282`, `UpperHalfPlane.SLAction` | Real trace of the second derivative and the native SL₂ action; the −y² multiplier is supplied in the theorem equation. |
| `TauCeti/Analysis/InnerProductSpace/LinearPMap/SelfAdjoint.lean:76`, `IsSelfAdjoint.isFormalAdjoint`; line82, `LinearPMap.IsFormalAdjoint.im_inner_self_apply` | Formal pairing under the actual inner-product/completeness hypotheses; not construction of a self-adjoint domain. |
| `TauCeti/Analysis/PDE/EnergyForm/Sobolev.lean:372`, `TauCeti.PDE.energyFormH1`; line600, `energyFormH1L0` | Local real Euclidean energies; complexification and quotient descent remain package targets. |
| `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:301`, `TauCeti.LSeries.wienerIkehara` | Nonnegative real coefficients, actual Dirichlet-series agreement and continuous pole-subtracted boundary extension imply inclusive partial-sum asymptotic. |
| `TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/PrimeIdealTheorem.lean:46`, `TauCeti.primeCount_univ_isEquivalent_div_log`; `Mathlib/NumberTheory/NumberField/Basic.lean:427`, `Rat.ringOfIntegersEquiv` | Prime-ideal counting for number fields, with the rational ring-of-integers identification for the stated ℚ specialization; weighted dyadic counting follows by the supplied Abel route. |

### Accessible source locator record

| Work and locator group | Readable source evidence | Computation or scope comparison |
|---|---|---|
| gj78 Definition3.1.3 | gj78 line528 | Three-dimensional lift is the adjoint normalization; common scalar twists cancel. |
| gj78 Proposition3.2 | gj78 line538 | Local three-dimensional parameters agree with trace-zero endomorphisms. |
| gj78 §3.7 | gj78 line721 | Self-twist/induction branch supports the cited dichotomy. |
| gj78 Theorem9.3, printed534 | gj78 line2151 | Global lift and cuspidality distinction agree with the imported owner. |
| gj78 Remark9.9, printed541 | gj78 line2384 | Cited self-twist discussion is in the specified destination. |
| teschl §2.3, printed70–72 | teschl line2910 and line2933 | Densely defined Hermitian semibounded forms, not arbitrary partial maps. |
| teschl Theorem2.12 | teschl line2914 | Friedrichs semibounded extension; requires the form/domain input. |
| teschl Theorem2.13 | teschl line2960 | Closed-form representation; source formula slips are recorded below, not imported as identities by this package. |
| teschl Theorem4.10 and form-domain observation | teschl line5044 and line5053 | Operator/form min–max discussion exists; section4.4, not4.3 (R04). |
| katz-gkm §4.0, printed47–48 | katz-gkm line1845 and line1871 | Raw product fibres; rank-zero finite sum is a separate totalized definition. |
| katz-gkm Theorem4.1.1 | katz-gkm line1902, line1905 and line1910 | Rank, purity and geometric trace sign; all multiplicative characters trivial and exponents bᵢ=1 allow every characteristic and rank≥1. |
| katz-gkm §4.3, printed59–60 | katz-gkm line2266 and line2288 | Rank-one Artin–Schreier trace convention matches the positive raw additive character. |
| katz-gkm Theorem5.1(1)–(8), printed63–64 | katz-gkm line2392, line2412, line2416, line2424 and line2430 | Rank k+1, Swan1, weight increment1 and trace sign− under convolution. Its proof additionally uses the unlisted inputs in R03. |
| bms02 §2.1, arXiv-v3 printed4 | bms02 line151 | Actual minimal/maximal distributional domains. |
| bms02 AssumptionB, arXiv-v3 printed5 | bms02 line196 | Local regularity needed for the maximal-domain route. |
| bms02 Corollary2.10, arXiv-v3 printed7 | bms02 line245 and line253 | Complete-metric D*D, specialized to D=d. The package supplies the torsion-free cover/descent and local hypotheses. |

## Not verifiable

- `lrs95` is settled **uncertified**. Its theorem, lemma, equation and page locators, and the README's assertions about the source's cutoff normalization and principal subtraction, could not be compared with the text. They were not fetched or re-requested. The displayed mathematics was independently tested as above; that does not certify the claimed published locators or establish errata in that inaccessible work.
- No new Lean run was authorized by the read-only pass. The four supplied elaborated signatures were inspected; full compilation or kernel checking of this revision was not independently repeated, and no proof of an admitted headline is claimed.
- The seven declared supplier contracts remain conditional. Existing source/roadmap text was checked; future implementations, comparisons and agreement proofs cannot be validated now. R03 identifies additional prerequisites outside those seven contracts.
- Ownership searches cover main, Completed, the board packages, the supplied 47 sibling heads and the registry results inspected above. No assertion is made about unprovided or unpublished work. Full proofs in suppliers were not red-teamed as separate packages.

## Source issues

- **Misprint** in teschl at Theorem2.13, equation(2.60), printed page72 (teschl line2966): the source says the vector representing the original form must be shifted by −(1−γ)ψ; it should be unshifted, or the represented form must explicitly be the shifted form; affects a stated result.
- **Misprint** in teschl at proof of Theorem2.13, printed page72 (teschl line2970): the source says a nonnegative operator satisfies ‖Aψ‖²≥‖ψ‖²; it should be ‖(A+I)ψ‖²≥‖ψ‖², since A=0 refutes the displayed bound; affects the proof.
- **Gap** in teschl at proof of Theorem4.10, equation(4.31), printed page118 (teschl line5040): the source says choosing one eigenvector establishes the lower bound for an infimum; it should be a spectral-support lower bound for every unit vector in the orthogonal complement; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4e34392efa92413ea8f5127af7f7bf044b4843cc", "job": "RT-CongruenceSpectralGap~1a", "model": "gpt-6-astra", "worker": "chris-6"} -->
