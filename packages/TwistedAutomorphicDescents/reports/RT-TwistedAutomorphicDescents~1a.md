<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1535#issuecomment-6428766492 -->
Red team round 1 pass a (codex) of 8b40b31

Verdict: needs_changes

1. **F01** (P1) Cuspidality does not ensure convergence on a split torus

   **Location:** packages/TwistedAutomorphicDescents/README.md:283, “at least one of them cuspidal”; also :102 and :406–414.

   **Claim:** The displayed Bessel periods converge absolutely for arbitrary moderate-growth automorphic forms whenever either input is cuspidal, including split SO₂ stabilizers.

   **Witness:** Take F=Q, V=H⊥<1>, W=H, j=0, f=g=1. SO(W)=Gₘ has no proper parabolics, so g is cuspidal; N=1 and P=Q=∫dt/t=∞.

   **Exact repair text:** “Define the ordinary periods on the domain where B_O(f)g is integrable (respectively B_O(f)conj(g)). Prove cuspidal convergence with the required decay in the stabilizer’s split center. For split SO₂, cuspidality alone supplies no central decay. Construct a separate regularized-period comparison for divergent moderate-growth data, with a specified truncation and correction terms, before using such data in the unfolding, Euler product or residue theorems. An ambient function may descend through a central quotient only when its restriction has the required central equivariance.” Amend gap:bessel-restriction-growth to request these precise central-domain comparisons instead of universal convergence, and propagate the ordinary/regularized distinction through §§2.1–4.7.

   **Retest:** The constant pair above is excluded from the ordinary integral’s domain because its absolute integral is infinite; it remains in scope for the separately specified regularized theory. This is also a counterexample to the blanket convergence sentence in JZ2020 line 1135 at the package’s stated split-torus generality.

2. **F02** (P1) Full pole order detects inclusion of blocks, not equality without equal rank

   **Location:** packages/TwistedAutomorphicDescents/README.md:636, “of order r … exactly when τ≅φ_(π′)∨”.

   **Claim:** For the general induction of §2.1, the r-block numerator has an r-fold pole if and only if the entire standard parameter equals τ∨.

   **Witness:** On split SO₂ take a cubic Hecke character χ. Its standard parameter is χ⊞χ⁻¹. With a=1, τ=χ⁻¹, the numerator is ζ_F(s+1/2)L_F(s+1/2,χ⁻²): order 1, but ranks 1≠2.

   **Exact repair text:** “For pairwise distinct cuspidal blocks τ_i and a multiplicity-free generic standard parameter φ_(π′), the pole order at s=1/2 equals the number of τ_i whose ordinary dual occurs in φ_(π′). It equals r exactly when every τ_i∨ occurs. If additionally a equals the standard dimension of π′, this is equivalent to τ≅φ_(π′)∨.” Add the cubic-character example as a negative-control Check. Retain the equal-rank specialization used in §§4.5–4.7.

   **Retest:** In the witness, one matching block gives order 1 although the second parameter has an extra block. Under a=N, an inclusion of all blocks with equal total degree becomes equality.

3. **F03** (P2) The support-partition definition drops the valid unitary rank-one case

   **Location:** packages/TwistedAutomorphicDescents/README.md:950, “For a=N≥2”; consumers :972 and :1025.

   **Claim:** The weak-support and central-value existence statements use p¹ for all positive-rank relevant data, but its defining section admits only a≥2.

   **Witness:** U₁ with W=0 has d=a=1, m=j=k₀=0. Its ambient group is U(1,1), and p=p¹=[1,1], of size 2. Section 4.1 explicitly constructs this residue/descent.

   **Exact repair text:** “In the unitary branch allow a=N≥1; in the orthogonal branches retain a=N≥2. For a=1 relevance forces m=j=k₀=0 and p=p¹=[1,1].” Update the first §6.1 Check to include this second coincidence, and use the expanded definition in §§6.2–6.4. Add this positive-rank boundary case as a Check.

   **Retest:** For τ=φ_ξ on U₁, the residue ξ∘det has index-zero restriction ξ; the missing p¹ coefficient is now exactly that restriction. No zero-rank inducing datum is introduced.

4. **F04** (P3) Two source locators point to the wrong material

   **Location:** packages/TwistedAutomorphicDescents/README.md:23, “retain the Gram matrix of (2.1)”; :31, “§6.1 … line 2310”.

   **Claim:** JZ2020 (2.1), printed p.748, specifies the Gram matrix; line 2310 locates §6.1.

   **Witness:** JZ2020 line 422 is basis (2.1), line 434 is matrix (2.2), both p.749. Section 6.1 starts at line 2353; line 2310 discusses previously proved generic cases on p.791.

   **Exact repair text:** “Use the ordered basis (2.1) and Gram matrix (2.2), JZ2020 §2.1, p.749 (JZ2020 line 422, line 434).” Replace the p.748 locator for this normalization accordingly. In the residue convention replace “JZ2020 line 2310” by “JZ2020 line 2353”.

   **Retest:** The hyperbolic block of (2.2) is [[0,1],[1,0]], giving values 2 and −2 on e+f and e−f, as required by the existing Check.

5. **F05** (P1) Complete isotropic flags and isotropic subspaces have different Levis

   **Location:** packages/TwistedAutomorphicDescents/README.md:146, “flag parabolics and their Levi factors”; :154–158 connects this to the complete Bessel flag.

   **Claim:** The stabilizer of the displayed length-j isotropic flag has Levi Res_(E/F)(GL_j)×Isom(V_(j))°.

   **Witness:** In split SO₇, stabilize <e₁>⊂<e₁,e₂>. The Levi is GL₁²×SO₃, dimension 5. GL₂×SO₃, dimension 7, stabilizes only <e₁,e₂> and can move <e₁>.

   **Exact repair text:** “Distinguish the parabolic preserving only the j-dimensional isotropic subspace, with Levi Res_(E/F)(GL_j)×Isom(V_(j))°, from the parabolic preserving every member of the complete length-j isotropic flag, with Levi (Res_(E/F)(GL₁))^j×Isom(V_(j))°. The Bessel unipotent N_j is attached to the latter flag; the Eisenstein parabolic P_a preserves only the a-dimensional isotropic subspace.” Use these precise names in §§0.1, 0.3 and 2.1–2.3.

   **Retest:** At j=2, the matrix interchanging e₁ and e₂ lies in the GL₂ Levi of the subspace stabilizer and fails to preserve the first flag member. At j=1 the two parabolics agree. JZ2020 line 454 distinguishes the subspace parabolic; line 814 uses the complete-flag parabolic for the Bessel character.

6. **F06** (P1) The auxiliary-induction input to orthogonal uniqueness is not supplied

   **Location:** packages/TwistedAutomorphicDescents/README.md:351–353, “auxiliary supercuspidal choice, Bernstein-support exclusion and irreducible induced representation”.

   **Claim:** SR.3.1–SR.3.2 provide the auxiliary irreducibility needed to reduce every admissible orthogonal Bessel pair to codimension one.

   **Witness:** TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:2584–2586 requires cuspidal Levi data. Here σ_W can be a principal series of SO₃; τ⊗σ_W is not cuspidal. TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md:87 declares the stronger avoidance input only for unitary groups.

   **Exact repair text:** Add “What SmoothRepresentationsOfLocalGroups must provide (gap:orthogonal-auxiliary-induction): For every finite extension k/Q_p, relevant orthogonal pair W⊂V of codimension 2j+1 with j≥1, and irreducible admissible π_V,σ_W, choose a generic supercuspidal GL_(j+1)(k) inertial class absent from the relevant Bernstein supports of π_V∨ and an unramified twist τ for which the unnormalized induction of τ⊗σ_W to SO(V⊥(-ke)) is irreducible.” Record the same slug, supplier and SR.3.1–SR.3.2 section in plan.json and consume it in §1.4. Also explicitly import the generic-supercuspidal mirabolic restriction comparison from the already declared GL supplier contract behind GanGrossPrasadUnitaryGroups §2.4 when implementing the reduction.

   **Retest:** With σ_W a noncuspidal irreducible SO₃ principal series, the new contract applies; the existing cuspidal-Levi generic-irreducibility theorem still does not. GGP2012 line 2480–2484 uses precisely the stronger auxiliary choice.

7. **F07** (P2) Local outer equivalence does not identify a global two-element orbit

   **Location:** packages/TwistedAutomorphicDescents/README.md:1090 and :1098, “modulo the prescribed even-SO outer equivalence”; “Restricted tensor factorization identifies the global isomorphism class”.

   **Claim:** Uniqueness modulo outer conjugation separately at every place implies that a global constituent equals π or its single rational outer conjugate π⋆.

   **Witness:** At two places with nonfixed classes, local outer choices give (π_u,π_v), (π_u⋆,π_v), (π_u,π_v⋆), (π_u⋆,π_v⋆). The diagonal rational outer orbit contains only the first and fourth.

   **Exact repair text:** “For even SO, retain an oriented global parameter and its two coherent global orientations. Require exact local distinguished-member uniqueness on the packet localized from each chosen orientation, with enhancement labels before quotienting by outer conjugation. Prove that every constituent of the descent belongs to one of these two coherently oriented global packets. Within each, exact local equality gives global equality by restricted tensor factorization; the rational outer action exchanges the two orientations.” Add the oriented-packet comparison as a named prerequisite or a precise supplier-gap extension, and state the strengthened premise in §§7.2–7.5. Do not infer this comparison from equality of standard GL parameters.

   **Retest:** The mixed local choices (⋆,1) and (1,⋆) no longer qualify merely because their local outer orbits agree. This finding concerns the unsupported inference; it does not claim every mixed restricted tensor is automorphic.

8. **F08** (P3) Several Checks only repeat specifications or describe proof bookkeeping

   **Location:** packages/TwistedAutomorphicDescents/README.md:188, “The ones exponent is d−2ℓ−1”; :322, “First occurrence is maximal”; :571 and :1104–1105.

   **Claim:** These bullets count as discriminating mathematical Checks.

   **Witness:** A wrong partition with leading part 2ℓ+3 still has the stated ones exponent; at d=5,ℓ=1 it totals 7, not 5. The proof-bookkeeping bullets evaluate no mathematical instance.

   **Exact repair text:** Delete the redundant Check bullets at lines 188, 225, 241, 261, 322, 324, 534, 571, 674, 832, 833, 1003, 1104, 1105 and 1152; their mathematical requirements already appear in the definitions, APIs, proof routes or neighboring computed Checks. In §7.2 add: “At two nonfixed even-SO places, independently choosing an outer label gives four tuples; a single global rational outer involution gives only two. Equality of the two local outer orbits therefore does not identify a global orbit.” Apply R07 to make this a negative control for the repaired hypothesis. Keep the existing numerical partition, maximal-index and character tests.

   **Retest:** The retained §0.2 test gives size 5 for [3,1,1] and rejects [5,1,1], of size 7. The retained §1.2 test distinguishes max{0,2}=2 from min{0,2}=0. The added §7.2 test distinguishes 4 local choices from 2 coherent choices.

## Verified sound

The entire README (1,177 lines) and Suggested.lean (72 lines) were read. The inventory is 49 numbered target sections, three additional bold target occurrences (one repeats the global part of §1.4), 234 Check bullets, and 23 headline entries in the Lean module docstring. There are zero Lean declarations, definitions, instances, section variables or `include` blocks. Consequently there are zero elaborated signatures to compare; no Lean process was run. There is no sorry'd data, placeholder theorem, one-tactic padding, duplicate fully qualified Lean name, extra import or `set_option` in this file.

The following table records the adversarial instances, including the necessary definition and convention subcases. “Consistent” means the displayed calculation or logical test agrees with the target; it is not a certification of the future analytic or classification proof. Locations are in packages/TwistedAutomorphicDescents/README.md. All arithmetic uses characteristic zero; residue characteristic 2 remains allowed. A zero ring, characteristic-2 coefficient field, inseparable quadratic extension, degenerate form and zero-dimensional V fail the standing hypotheses. Empty W, trivial groups and index zero are tested explicitly. Scheme finiteness, nonreduced schemes and universe changes do not occur in these statements.

| Statement / location | Instances and computed values on both sides | Result / change |
|---|---|---|
| Conventions, :21–23 | SO₅: d=5,N=4; U₅: d=N=5. Nonsplit quasi-split SO₄: r=1 versus floor(d/2)=2. On a Hermitian line h(i,1)=i and h(1,i)=−i; hyperbolic values h(e±f,e±f)=±2. | Values consistent; Gram locator R04. |
| Character convention, :23–25 | x=δ gives Tr(x/δ)/2=1; x=1 gives 0. Split δ=(t,−t) gives (x₁−x₂)/(2t). For ψ(1)=ζ and supported values (1,i,0), the unnormalized sum is 1+iζ⁻¹ and its conjugate is 1−iζ; probability-normalized sums divide both by 3. | Inverse character and factor 2 consistent. |
| Period and base-change conventions, :25–27 | On volume-one U₁ with χ²≠1: P(χ,χ)=0, Q(χ,χ)=1, P(χ,χ⁻¹)=1. Multiplying the second vector by i gives iP and −iQ. β(ϖ)=i gives BC(β)=(i,−i), BC(β∨)=(−i,i). | Consistent; no ordinary self-duality inferred. |
| Right translations, :25 | For the universal action law take S₃, a=(12), b=(23), and f the indicator of ab=(123). Then R(a)R(b)f(1)=f(ab)=1, whereas R(ba)f(1)=0. On C₃ the inverse-character values are ζ and ζ⁻¹. The identity translation gives R(1)f=f. | Right-action order and inverse-character convention distinguished. |
| Induction and local factor conventions, :29–33 | GL₂ upper B with absolute value 4 gives δ=4, δ^(1/2)=2 versus inverse 1/2. q=2,T=1/2, roots 1,−1 give determinant 3/4 and factor 4/3. q=1 is excluded by q≥2. | Consistent. |
| Critical and central conventions, :29–35 | (d,m,j,a)=(5,2,1,4): k=2 and 10−4−1=5. (a,j)=(1,2): truncated k=0 gives m+1, not m+5. SO₁: N=0 cannot satisfy a=N>j. Split SO₂: ∫₁∞dt/t=∞. | Domain guard works; same central divergence refutes R01's period claim. |
| §0.1 coordinate comparison, :146 | SO₇ complete length-2 flag: Levi dimension 1+1+3=5; 2-subspace stabilizer: 4+3=7. Length 1: both give GL₁×SO₅. | R05. |
| §0.1 framed relevant pair, :148 | W=0,V=<1>: d=1,j=0, complement dimension 1. W=0,V=0: no nonzero-norm line. Replacing a specified embedding by an unmarked abstract isomorphism loses its actual image subspace. | Consistent domain and transport distinction. |
| §0.1 orthogonal Bessel datum, :154 | Split d=4,r=2: ℓ=2 leaves dimension 0 and fails 5≤4; ℓ=1 leaves a hyperbolic plane with norm(e+f)=2. Over Q₂ and Q₃ the value 2 is still nonzero. | Consistent; flags need R05 terminology. |
| §0.2 partition, :173 | (d,ℓ)=(5,1): [3,1,1], sum 5, length 3=d−2ℓ. (3,0): [1,1,1], sum 3; defining stabilizer space dimension 2, group dimensions SO₂=1 and U₂=4. (4,2): proposed leading part 5>4. | Consistent, R08 removes repeated exponent Check. |
| §0.3 rational orbit/character, :196 | Hyperbolic q(x,y)=2xy at (1,1/2),(1,−1/2) gives 1,−1; perpendicular generators have −1,1. The geometric partition is [3,1] in both cases. At ℓ=0 the zero orbit's stabilizer is the ambient group, while the chosen Bessel space has dimension d−1. | Distinction retained. |
| §0.4 normal form, :217 | κ=2 gives norm(e+f)=2, norm(e−f)=−2. A determinant −1 extension followed by a perpendicular reflection has determinant (+1). Anisotropic Q-form <1,1,1>, vectors (1,0,0),(1,1,0), gives complement determinants 1,2; no hyperbolic normal form at r=0. | Consistent; actual kernel retained. |
| §0.5 stabilizer/Witt index, :232 | Real V_an=<1>,κ=1: <1,−1> has Witt index 1; κ=−1: <1,1> has index 0. A hyperbolic plane minus an anisotropic line has index 0. Unitary scalar −1 centralizes N but sends e to −e. | Correct sign and pointwise/full-stabilizer distinction. |
| §0.6 prescribed ambient datum, :247 | (5,2,1,4): X dimension 10,k=2, complement 5. a=j+1: k=0,X dimension d+1. Label involution exchanges σ₁,σ₂ and applying it twice returns σ₁. | Consistent; specified embedding, not dimension alone. |
| §1.1 Fourier image, :279 | At N=1, B(f)=f restricted to H. Zero source gives zero image; maps (x,y)↦x and (x,y)↦y distinguish copies in a multiplicity space. ψ inversion and conjugation give the two C₃ sums above. | Algebraic image tests consistent. |
| §1.1 Hilbert carrier/support, :281 | Zero image has empty support and zero closure. Constant split-torus function has squared norm ∞; a singleton character in an atomless direct integral has spectral measure 0. | The explicit carrier safeguards are necessary and consistent. |
| §1.1 periods, :283 | f=g=1, SO₃⊃split SO₂, index 0: cuspidality of g is vacuous and P=Q=∞. Anisotropic U₁ character pair gives P=0,Q=1 instead. | R01. |
| §1.2 first occurrence, :308 | Supported indices {0,2}: maximum 2, minimum 0. Zero realization: support ∅ and no maximum. Anisotropic positive-dimensional V: only index 0. Split d=4: largest valid index 1, not r=2. | Consistent; R08 prunes repeated quantifiers. |
| §1.3 first-occurrence cuspidality, :331 | Torus proper-parabolic family is ∅, so all its constant terms vanish vacuously, while the split constant has L² norm ∞. Zero Fourier map gives every constant term 0. | Cuspidality is correctly separated from L² membership here. |
| §1.4 local orthogonal uniqueness, :349 | SO₁×SO₀ irreducible trivial pair: Hom dimension 1; two copies give dimension 2. Trivial N-action with ψ(n)=−1 gives 2b=0, hence b=0 over C. Real j=1 signatures (1,2) pass, (1,1) fail dimension 3. | Bound's controls consistent; unowned auxiliary input R06. |
| §1.4 global decomposition and bold global image, :343,:362 | Hypothetical σ⊕σ has two independent projections; σ⊕ρ, σ≠ρ, has one projection to each. A countable Hilbert sum admits a vector with coordinates 2⁻ⁿ, squared norm 1/3, outside the finite algebraic sum. | Multiplicity argument's algebraic controls consistent; depends on R06 and verified carrier. |
| §1.5 Generic Summand proposition, :374 | Two realizations with witness in one: existential count 1 is enough, universal assertion would require 2. Supported indices {0,2}: a witness at 0 fails first occurrence. U₁ gives Q=1,P(χ,χ)=0. | Existential and dual conventions consistent. |
| §2.1 zeta integral, :406 | Scaling test vector by i gives iZ, a Hermitian replacement gives −iZ. Index 0 gives restriction. Modulus 4 contributes factor 2, not 1. Split-torus constant test can have infinite integral. | Linear convention consistent; convergence R01, parabolic R05. |
| §2.2 functional factorization, :428 | Local evaluations 2,3 and global value 30 give c=5; dropping c gives 6≠30. Zero functional gives 0 for all vectors and cannot normalize a nonzero reference value. | Consistent. |
| §2.3 relative Bruhat cells, :442 | a=1,r_W=0: at ℓ=0 inequalities permit only (0,1); at ℓ=1 they permit (0,0),(1,1). Open β=max(a−ℓ,0) gives 1 and 0 respectively. | Numerical filtering consistent; residual rational quotient is retained. |
| §2.4 open-cell reduction, :456 | C₂ nontrivial-character average (1−1)/2=0; trivial-character average (1+1)/2=1. At a=ℓ=1 the (1,1) cell has α>0 and is removed; (0,0) survives. | Correct character exclusion; not a proof of all cells. |
| §2.5 Whittaker transform, :470 | β=1 gives β−1=0. ψ(n)=i times ψ(n)⁻¹=−i gives 1; using the inverse twice gives −1. For a 2-dimensional σ, target values (1,0),(0,1) cannot be represented by one scalar-valued transform. | Consistent twists, character and target carrier. |
| §2.6 inner datum/period, :493 | a=3,ℓ=2 gives a−ℓ−1=0; a=ℓ=2 gives ℓ−a=0 in the other model. An involution exchanging σ₁ and σ₂ sends input σ₁ to output σ₂, then back. Compact SO₂(R) has norm-one points, split SO₂(R) has positive parameter t. | Consistent; no unmarked transport of rational forms. |
| §3.1 local zeta integral, :519 | b↦2b sends Z↦2Z; b=0 gives Z=0. At a=ℓ the inner index is 0. Algebraic discontinuous functionals fail the stipulated continuous archimedean Hom domain. | Consistent; R08 removes duplicate rescaling Check. |
| §3.2 Euler product, :542 | c=5, local factors 2,3 give Z=30; global zero-period branch gives 0 without division. Finite exceptional set ∅ gives product 1 before c and the complete spherical product. | Consistent normalization. |
| §3.3 L-ratio definition, :556 | Roots x=1,y=−1: exterior-square weight −1, symmetric-square weights 1,−1,1. Asai sign m=1 is − and m=2 is +. q=2,T=1/2: ratio 4/(4/3)=3; opposite numerator dual after determinant twist gives 1/3. | Formula controls consistent; q=2 not excluded. |
| §3.3 dual-Levi cross weights, :576 | (χ₁,χ₂,μ)=(2,3,5): correct weights 2/5,15; wrong weights 10,3/5. At (i,−i,i), correct weights 1,1 give factor 4; wrong −1,−1 give 4/9. | Distinguishes the two unitary label conventions. |
| §3.4 spherical calculation, :580 | Sum at X=Y=1/3 is (1−1/9)/(1−1/3)²=2; opposite dual gives 1/2 after the stated twist. Two roots 1,−1,T=1/2 give 4/3. Fixed-space dimension 0 supplies no normalized spherical vector. | Concrete factors consistent; uniform integral proof remains a target. |
| §3.5 shifted regularity, :597 | α=1/3,β=1/4: 1−α−β=5/12; 3/2−α−β=11/12; 2−2α=4/3. At α=β=1/2 the first is 0 and fails Re(z)>0. | Strict bounds used correctly. |
| §3.6 nonvanishing and matrix identity, :611 | b=2 and W(1)=1/2 give 1; b=0 admits no reciprocal. Displayed p,u have determinants 1, preserve J, and pu(1,0,1)=(1,0,1). Corrected block equation: −1/2=1/2−1; printed omission would assert −1/2=1/2. | Concrete negative control sound; source proof needs correction. |
| §4.1 dual dictionary and self-pair, :636 | U₁: P(χ,χ)=0,Q=1,P(χ,χ⁻¹)=1. z=i,T=1/2 gives self-pair factor 2 versus wrong factor 2/3. For split SO₂ standard χ⊞χ⁻¹, τ=χ⁻¹ yields pole order 1 but degrees 1≠2. | Dual formulas consistent; equal-rank omission R02. |
| §4.1 rank-one residue, :640 | a=1,m=j=k=0: ambient dimension 2, index-zero descent of ξ∘det is ξ. At a split place ξ(ϖ)=i: output parameter (i,−i), test parameter (−i,i). | Consistent positive-rank boundary; must reach §6.1 (R03). |
| §4.2 Laurent residue, :658 | E=A/t²+B/t+C,r=2 gives lim t²E=A. If A=0,B=1 the same coefficient is 0, while the usual residue is 1. A nonzero map can have a zero section in its kernel. | Correct one-variable order-r coefficient. |
| §4.3 maximal pole criterion, :681 | Type product t⁻² times cross factor 3 gives order 2 and leading coefficient 3; cross factor t gives order 1 and order-2 coefficient 0. Distinct τ₁,τ₂ have two type poles; repeated blocks introduce additional cross poles and are excluded. | Pole arithmetic consistent; global operator nonvanishing expressly required. |
| §4.4 normalized product, :695 | (1/t)/(2/t)=1/2 as a germ; multiplying by a spherical quotient 1 changes nothing. Product t·t⁻¹=1 is regular although t⁻¹ is not. S=∅ gives product 1. | Correct removable-value and finite-product distinction. |
| §4.5 critical holomorphy, :717 | (6t⁻²+3t⁻¹)/(2t⁻²)=3+(3/2)t, value 3; denominator 2t⁻¹ instead leaves a pole. Self-pair weight χ⁻¹χ=1 versus χ²≠1. | Consistent under its explicit a=N hypothesis. |
| §4.6 reciprocal periods, :731 | c=2, normalized product 3, leading ratio 5 give leading period 30; setting any factor 0 gives 0. k and j can differ: (d,m,a,j)=(5,2,4,1) has k=2. | Controls consistent, including use of k in the twist. |
| §4.7 period to central value, :746 | χ∨μ∨=c(χμ), so completed factors are unchanged by simultaneous Galois permutation; χμ∨ instead has weights χμ⁻¹. For μ=i and χ a cubic value, these three weights distinguish the unauthorized single dual. U₁ P=0,Q=1 uses χχ∨=1. | Parameter transport consistent. |
| §5.1 residual parameter, :771 | a=6,W=SO₃: ambient form dimension 15, standard dimension 12+2=14. ν₂ has alternating sign −; tensor with sign ε gives −ε. On diag(2,1/2) of SL₂, ν₂ has eigenvalues 2,1/2 versus 1,1 for two trivial copies. | Sign, rank and nontrivial SL₂ action distinguished. |
| §5.2 square integrability, :793 | ∫₁∞t^(2λ)dt/t=−1/(2λ) for λ<0: λ=−1/2 gives 1; λ=0 gives ∞. A nonzero Laurent coefficient alone does not select either value. | Negative-exponent requirement retained. |
| §5.2 inner-form classification premise, :795 | Two spectral copies of one parameter give multiplicity 2 versus one parameter label. Two residual members with Levis M₁,M₂ require two support records, not one. ν₂ dimension 2 prevents generic-parameter cuspidality from being applied as though ν₁. | Independent spectral premise; no descent conclusion embedded. |
| §5.3 critical index, :818 | (5,2,1,4): k=2,p=[5,1⁵], sum 10. (6,1,2,6): k=3,p=[7,1⁶], sum 13. (a,j)=(1,2): truncated 0 gives m+1≠m+5. | Arithmetic sound with j<a; R08 prunes repeats. |
| §5.4 higher vanishing, :840 | A trivial local action with character −1 imposes v=−v, giving zero complex coinvariants. In characteristic 2, 2v=0 imposes no constraint; that coefficient field is excluded. | Valid local obstruction; universal Jacquet calculation is not inferred from this example. |
| §5.5 critical cuspidality, :854 | Zero critical image has every proper constant term 0, even if R contains a vector r≠0. Two residual members still need two support computations. | Correct absence of nonvanishing conclusion. |
| §5.6 outer stability, :870 | diag(−1,−1)(e+(κ/2)f)=−e−(κ/2)f. Two simultaneous character-coordinate sign changes multiply to +1. A swap on {π,π⋆} squares to identity; a fixed class gives orbit size 1. | Correct distinction between fixing line, vector and character. |
| §5.7 good-place parameter, :885 | a=6,m=1,r_W=0: k=3 gives dimension 6, wrong k=2 gives 8. μ₁=2,μ₂=3 gives 1−5T+6T² versus degree-1 truncation. Odd W unitary a=4,k=2 gives U₄, not U₅; a=5 weights μ₁,μ₂,1,μ₂⁻¹,μ₁⁻¹ give degree 5. | Corrected source indices/weights agree. |
| §5.8 critical structure, :903 | Zero image yields zero constituents; fixed outer class gives multiplicity 1; two inequivalent classes give 1+1, not multiplicity 2 of one class. | Conditional structure controls consistent; no nonvanishing asserted. |
| §5.9 descent definition, :917 | R=0 implies B(R)=0. A nonzero R with zero B also gives D=0. (d,m,a,j)=(5,2,4,1) uses [5,1⁵] of total 10, with stabilizer dimension 5. | Defined image does not build in nonvanishing. |
| §6.1 support partitions, :950 | a=4,m=2: p=[5,5],p¹=[5,1⁵], totals 10. a=6,m=1: [7,5,1] and [7,1⁶], totals 13. Odd-small-SO a=2,m=1 gives equal [3,1,1]. Unitary a=1,m=0 gives equal [1,1] but is omitted. | Existing a≥2 arithmetic sound; missing domain R03. |
| §6.1 upper-support proposition, :950 | For support ∅, ∀p in support,p≤bound is true, while p¹∈support is false. For [5,5] versus [5,1⁵], prefix sums begin (5,10) versus (5,6). | Upper bound is distinct from existence. |
| §6.2 weak support, :972 | One σ with coefficient 1 and another with coefficient 0 satisfy the existential statement (one witness), not a universal statement (two required). Zero residual module gives coefficient 0 for every datum, hence no witness. | Quantifier correct; p¹ at unitary rank 1 needs R03. |
| §6.3 known cases, :994 | n=1, smaller SO₂ has dimension 2, ambient dimension 4n+2=6, a=2,k=1,p¹=[3,1³]. A GL₂⊞GL₂ input has degree 4 and two blocks; it does not meet a cuspidal-GL₄ hypothesis. | Scope of JLXXZ preserved; no unitary analogue silently imported. |
| Bold distinct-isobaric support, :1007 | n=2: degrees 2+2=4,a=4,m=2,j=1,k=2,p¹=[5,1⁵], total 10. n=1: two positive even degrees have sum ≥4>2, so there is no such input. | Explicit hypothesis, not supplied theorem; empty n=1 range acknowledged. |
| §6.4 value to period, :1025 | Support for (χ∨,μ) asks L(χ∨μ∨)=L(c(χμ))=L(χμ); support for (χ,μ) would instead ask L(χμ∨). Partition [5,1⁵] has size 10 and stabilizer dimension 5. | Dual transport consistent, subject to R03's domain repair. |
| §6.5 torus criterion, :1040 | Anisotropic norm-one torus at R has absolute value 1; split positive component has ∫₁∞dt/t=∞. Simple transfer has one block; τ₁⊞τ₂ has two and needs the additional support proposition. | Both directions correctly retain distinct-isobaric condition. |
| §7.1 recovery proposition, :1065 | Fixed orbit has required module π (one class), not π⊕π (two copies). Nonfixed orbit has π⊕π⋆, not lone π. At ξ(ϖ)=i, output ξ and bilinear test ξ⁻¹ have opposite local labels. | Definition and dual controls consistent. |
| §7.2 recovery theorem, :1088 | At two nonfixed places: independent local outer labels give 2×2=4 tuples; diagonal rational outer action gives only 2. Local-orbit equality does not collapse 4 to 2. | R07. |
| §7.2 exact local proposition, :1090 | An actual distinguished singleton has size 1; quotienting each two-element outer orbit gives one quotient label while leaving two possible representatives. Two places give four lifts of one tuple of quotient labels. | Premise is weaker than the global inference; R07 and R08. |
| §7.3 regular recovery, :1111 | U₄ regular [4] has power ranks (3,2,1,0); Bessel [3,1] has (2,1,0,0), smaller U₁ and ambient dimension 9. SO₄ [4] fails even-part parity while [3,1] is regular. U₂ index 0 is restriction; translating a nonzero f to have f(1)≠0 makes restriction nonzero. | Regular/Bessel distinction sound; higher even-unitary comparison remains its own proof obligation. |
| §7.4 subregular summand, :1127 | SO₆ [3,3] differs from Bessel [3,1³], whose stabilizer space has dimension 3. U₅ [4,1] differs from [3,1,1], whose stabilizer dimension is 2. SO₃ n=1: [1,1,1],j=0,smaller dimension 2. | Rational split-SO₃ and unitary collapse are correctly separate obligations. |
| §7.5 subregular recovery, :1143 | SO₈: [5,3] prefixes (5,8) dominate [4,4] prefixes (4,8), with two very-even labels retained; regular [7,1] dominates [5,3]. U₅: [4,1] prefixes (4,5) dominate [3,2] (3,5); support {[5],[4,1]} has maximal set {[5]}. | Dominance controls sound; recovery still depends on R07. |

The 234 Check bullets were screened for truth, domain, discrimination and duplication; the table records their numerical and logical controls in 66 rows. Fifteen redundant or bookkeeping bullets are identified in R08. In particular, the existing split-SO₂ Check itself supplies R01's counterexample. No numerical Check was treated as proof of an automorphic headline.

The 23 headlines, with their missing carriers, are exactly the first-occurrence cuspidality and two multiplicity statements (§§1.3–1.4); spherical integral, shifted regularity and local nonvanishing (§§3.4–3.6); pole/value, critical holomorphy, reciprocity and period/value (§§4.3, 4.5–4.7); residual membership, higher vanishing, critical cuspidality, outer stability, Satake comparison and critical structure (§§5.2, 5.4–5.8); known support, central-value existence and torus criterion (§§6.3–6.5); and the four recovery results (§§7.2–7.5). All 23 are named in Suggested.lean. Searches at both pins found algebraic representations, ordinary modular-form Eisenstein series and analytic Bessel functions, but no classical-group automorphic-realization, Bessel-period, Arthur-packet or Casselman–Wallach carrier needed by these statements. No statable headline omission was established. The relative quadratic flag calculation of §2.3 is an intermediate geometric target, not a substitute acceptance theorem.

Eight pinned declaration contracts were checked against their definitions and binders:

| Declaration | Pinned file and line | Verified scope |
|---|---|---|
| Nat.Partition | Mathlib/Combinatorics/Enumerative/Partition/Basic.lean:52 | Multiset of positive naturals summing to n; no form or rational orbit. |
| Representation.IntertwiningMap | Mathlib/RepresentationTheory/Intertwining.lean:36 | Linear map commuting with actions; no topology, continuity or admissibility field. |
| MeromorphicOn | Mathlib/Analysis/Meromorphic/Basic.lean:494 | Pointwise MeromorphicAt predicate on a set in the normed-space context; no locally convex automorphic construction. |
| TauCeti.RegularFormClass.wittDecomposition | TauCeti/LinearAlgebra/QuadraticForm/Witt/Decomposition.lean:262 | Equality of regular form classes; does not choose the required embedded-complement isometry. |
| QuadraticMap.IsometryEquiv.exists_extension | TauCeti/LinearAlgebra/QuadraticForm/Witt/Extension.lean:50 | Field, invertible 2, finite-dimensional ambient space, nondegenerate restricted subspace; no ambient nondegeneracy premise. |
| TauCeti.equivalent_of_equivalent_prod | TauCeti/LinearAlgebra/QuadraticForm/Witt/Cancellation.lean:196 | Cancelled summand finite-dimensional and nondegenerate; field with invertible 2. |
| TauCeti.QuadraticMap.specialOrthogonalGroup | TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean:373 | Orthogonal subgroup intersected with determinant kernel. Outside finite free modules determinant has a junk convention; this roadmap's finite-dimensional field spaces avoid it. |
| TauCeti.QuadraticMap.det_reflection | TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean:887 | Finite free module and invertible Q(v); determinant −1. |

Supplier/ownership checks resolved 15 roadmap identities against main, the supplied heads, or the accepted board design. Object searches used `roadmaps grep` as well as the main, Completed, package and supplied sibling trees. No second owner for the package-specific twisted-residue comparison was found. The orthogonal relative Bessel datum and local uniqueness have no existing earlier construction in those trees; references to a future GanGrossPrasadUnitaryGroups Part II do not constitute such a target. Existing unitary relative objects and ordinary GRS descent are imported, while this package retains the comparison with its own prescribed rational coefficient.

| Supplier or ownership comparison | Sections / targets resolved | Outcome |
|---|---|---|
| ReductiveGroups | Layers 0, 3, 7, 7b | Generic algebraic group, parabolic and split Bruhat ownership retained; R05 concerns this package's flag specialization. |
| ReductiveGroupsPartII | RG2.4 | Local adjoint modulus retains its actual nonarchimedean hypotheses; real induction's determinant modulus is supplied by AutomorphicFormsOnReductiveGroups §2.3. Hermitian continuation is declared. |
| GeometryOfNumbersAndQuadraticArithmetic | §2.9 | Field Hermitian carrier and adjoint are distinct from odd-residue classification. |
| LieHighestWeightPartII | N0 nilpotent-orbit; N2 classical-partitions | Present in packages/LieHighestWeightPartII/design/README.md:75 and :349. Rational and dominance supplements are declared gaps; no missing-head finding. |
| GanGrossPrasadUnitaryGroups | §§1.1–1.3, 2.1–2.6, 3.9–3.11, 4.1–4.4, 7.1 | Actual unitary carriers and proved ranges retained. Its local-bernstein contract is unitary; it cannot discharge R06's orthogonal input. |
| SmoothRepresentationsOfLocalGroups | SR.0.1–SR.0.4, SR.2.1–SR.2.3, SR.3.1–SR.3.3, SR.4.1–SR.4.4; SR.5 mirabolic comparison | Ordinary induction/Jacquet/Satake inputs exist; twisted and spherical supplements are declared. Auxiliary irreducibility drift is R06. |
| AutomorphicFormsOnReductiveGroups | §§2.3, 2.6–2.7, 3.4–3.5, 4.1–4.3 | Half-modulus/right action, continuous globalization, restricted tensors and fixed-character cuspidal carriers agree. Split central decay is not a consequence of cuspidality: R01. |
| AutomorphicLFunctionsAndLocalFactors | AL.3 whittaker-model, rs-global-poles, rs-global-functional-equation, rs-boundary-nonvanishing, isobaric-strong-multiplicity-one; AL.4 l-group-local-factor, local-parameter-comparison, satake-factor-operations | Named targets exist; local ramified/classical comparisons remain scoped. All-place signed factors and completed type comparisons are declared gaps. |
| AutomorphicSpectralTheory | §0.15; §§1.1–1.5, 2.4–2.14 including 2.4a; §§4.1–4.4 | Common-denominator Laurent operators, smooth sections and negative-exponent residue criterion exist. Spherical scalar 3/2 times normalizer 2/3 equals 1. Noncuspidal smaller-datum continuation is declared separately. |
| EndoscopicTransferAndUnitaryTraceComparison | §§11.2–11.4 | Local packet carrier, positive exponents and CM/pure-inner global scope retained. |
| ModularityAndLanglandsExtensions | §§3.3–3.4, 3.8, 3.12, 3.15–3.18, 3.23–3.25, 5.4 | Parameter, classification and GRS owners resolved. Residual and general-inner-form extensions are declared. Local outer quotient data do not by themselves give R07's diagonal global orbit. |
| OrthogonalSpinGroups | Layers 0–2 | General orthogonal-group ownership; no duplicate relative Bessel construction. |
| RepresentationTheory/ClassicalGroups | Layer 6 | Finite-dimensional branching, not admissible local Bessel uniqueness. |
| ClassicalGroupsPartII | CG.0–CG.3, supplied head | Rational GSp representations/characters, not these relative constructions. |
| Completed RestrictedProducts | Layers 0–3 | Restricted products, functorial maps and rational diagonals; these are not rebuilt here. |

All 16 declared gap slugs occur in both design/plan.json and the exact README supplier contracts, with the same named suppliers. None has supplier `none`. Their absence as implemented supplier theorems is not a finding. R01 instead refutes an asserted universal convergence contract; R06 identifies an additional missing prerequisite. The scalar and character witnesses do not replace any gap by an assumed descent conclusion.

Forty-eight numbered source statements were located and their relevant hypotheses inspected in seven legally cached works, alongside the equations and page markers used by the package:

| Source | Numbered locators inspected | Count / result |
|---|---|---|
| JZ2020 | Proposition 2.2, Conjecture 2.3, Lemma 2.4, Propositions 2.5–2.6; Propositions 4.1–4.3, Corollaries 4.4/4.6, Theorems 4.5/4.7/4.8; Proposition 5.2, Theorem 5.3, Propositions 5.4–5.6, Theorem 5.7; Propositions 6.1–6.4, Lemma 6.5, Theorem 6.6, Conjectures 6.7–6.8, Proposition 6.9, Theorem 6.10, Corollary 6.11; Theorem 7.1, Corollary 7.2, Proposition 7.3, Corollary 7.4; Proposition A.1, Proposition B.1, Theorem B.2 | 37. Printed pages checked against extraction markers; defects below and R04 are retained, not certified away. |
| Zhang2022 | Theorem 1.1, Proposition 2.1 | 2. PDF pp.2–4; §§3–5 pp.4–7 read. Split GL computation is explicitly not supplied by the stated nonsplit theorem. |
| AGRS2010 | Theorem 1′ | 1. arXiv v1, p.2, O-group adjacent theorem; SO reduction is still required. |
| JSZ2010 | Theorem A | 1. arXiv v2, pp.1–2; O-group, signature/rank and continuous representation scope retained. |
| GGP2012 | Theorem 14.1(i), Theorem 15.1, Corollary 15.3 and following remark | 3. Published pp.57, 59–63; auxiliary choice in GGP2012 line 2480 is the R06 input. |
| JLXXZ2016 | Theorem 1.2(3),(6), Proposition 3.3 | 2. arXiv v2, p.5 and p.20; cuspidal GL input is not a distinct-isobaric theorem. |
| JLS2016 | Proposition 8.4, Theorem 11.2 | 2. arXiv v2, pp.18 and 21–22; O/Sp/metaplectic special expansion does not supply the unitary assertion. |

The requested dependency check exited 0, with no UPWARD, CYCLE or moved line:

```text
depcheck: 56 roadmaps, 650 edges, 0 problem(s)
```

HEAD was confirmed as 8b40b31. The read-only `git diff --stat origin/main...HEAD` lists eight changed files, all under packages/TwistedAutomorphicDescents. The review changed only this report and scratch notes. The settled, frozen design/sourceIssues item E4 discussed in the last repair report was not reopened; both published L-ratio displays print the same unmarked arguments.

## Not verifiable

- GRS2011 is settled as uncertified. Theorems 5.1, 5.4, 5.6 and 7.3 were checked as the cited locators in JZ2020, but the book's statements and proofs were not certified. No new request for this text was made.
- The full analytic extensions proposed here are future targets: all-place continuation, split-torus regularization/decay, uniform spherical evaluation, and the corrected Appendix A quotient/Jacobian argument are not proved by checking their finite-dimensional witnesses. Zhang2022's OCR also loses some displayed symbols; its readable scope and theorem identifiers were checked, not every reconstructed displayed integrand.
- The rational split-SO₃ extraction and independent odd-unitary collapse of §7.4, and the even-unitary regular-to-Bessel comparison of §7.3, cannot be certified solely from JLS2016's special-expansion theorem. They are explicitly owned proof obligations here; no counterexample to those separately stated targets was established.
- Conclusions conditional on the 16 declared supplier gaps, Generic Summand, weak support, the distinct-isobaric SO₂ proposition, exact local GGP or inner-form classification remain conditional. Their current absence is not an additional defect.
- No Lean elaboration was performed under the read-only/no-build instruction. There are no package declarations requiring a `#check @name` signature audit; the eight imported declaration contracts were checked textually at the pins. No claim is made to have rerun the repair worker's previous build.

## Source issues

- **Error** in JZ2020 at §2.4, (2.13), printed p.758, JZ2020 line 815: the source says the displayed pointwise flag-and-vector subgroup is the connected character stabilizer; it should be distinguished from the extra connected norm-one central torus in the unitary Levi; affects a stated result.
- **Error** in JZ2020 at §2.4, paragraph after Lemma 2.4, printed p.759, JZ2020 line 854: the source says the anisotropic-kernel case is insensitive to the chosen vector; it should be retain the vector as data: norms 1 and 2 in <1,1,1> over Q give complementary torus discriminants −1 and −2; affects a stated result.
- **Misprint** in JZ2020 at Proposition 2.5, printed p.759, JZ2020 line 859: the source says representation of the opposite-norm line gives the smaller anisotropic kernel; it should be representation of the chosen vector's line, y_κ, rather than y_−κ; affects a stated result.
- **Error** in JZ2020 at §4.1, convergence after (4.7), printed p.766, JZ2020 line 1135: the source says one cuspidal input suffices for absolute convergence; it should be impose split-central integrability or supply regularization, since the split-SO₂ constant is cuspidal and has infinite integral; affects a stated result.
- **Misprint** in JZ2020 at Proposition 6.4 proof, printed p.796, JZ2020 line 2521: the source says the displayed normalizer fixes w₀; it should be sends w₀ to −w₀ and preserves the character through the compensating flag signs; affects the proof.
- **Misprint** in JZ2020 at Lemma 6.5 proof, printed pp.798–799, JZ2020 line 2619 and line 2666: the source says the split-odd smaller-group calculation attains the stated output at critical index a/2+r_W−1; it should be use a/2+r_W, which gives output dimension a; affects the proof.
- **Misprint** in JZ2020 at Lemma 6.5 proof, printed p.798, JZ2020 line 2630: the source says odd-unitary smaller data yield U_(a+1); it should be U_a, since 2a+m−2k−1=a at the displayed critical index; affects the proof.
- **Misprint** in JZ2020 at (6.6), printed p.799, JZ2020 line 2687: the source says the unitary inducing list ends before μ_floor(a/2); it should be retain that final character, giving the required a standard weights; affects the proof.
- **Gap** in JZ2020 at Proposition 6.9, printed p.805, JZ2020 line 2985: the source says the anisotropic-SO₂ support case is supplied by the cited twisted Jacquet–Langlands construction; it should be supply the distinct-isobaric extension separately, since JLXXZ2016 Theorem 1.2 assumes cuspidal τ; affects the proof.
- **Gap** in JZ2020 at §7.2, printed p.809, JZ2020 line 3197: the source says Whittaker-generic recovery uses empty smaller data in every displayed classical case; it should be retain a U₁ character and prove the regular-to-[2n−1,1] comparison for even unitary groups; affects the proof.
- **Error** in JZ2020 at Appendix A, (A.14), printed p.814, JZ2020 line 3421: the source says the upper-right block equation omits the quadratic YY′ contribution; it should be C E₂=(I−g)E₁+YY′E₂ in the corresponding coefficient convention; affects the proof.
- **Misprint** in JLS2016 at Definition 10.4, printed p.21, JLS2016 line 817: the source says the orthogonal special expansion is an orthogonal-special symplectic partition; it should be an orthogonal-special partition, without the extra symplectic condition; affects a stated result.
- **Gap** in JZ2020 at Theorem 5.7 proof, printed p.791, JZ2020 line 2293: the source says nonvanishing survives removal of the ordinary dual on σ alone; it should be retain that dual in the Hermitian convention, or dualize both factors using the functional equation; affects the proof.
- **Error** in JZ2020 at §6.1 before Proposition 6.2, printed p.793, JZ2020 line 2379: the source says every index κ≤a+r_W defines an admissible partition; it should be also require 2κ+1≤2a+m, excluding κ=a+r_W when m=2r_W; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "8b40b31a0c84cd9678cd75fa920ba1d4339911ea", "job": "RT-TwistedAutomorphicDescents~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
