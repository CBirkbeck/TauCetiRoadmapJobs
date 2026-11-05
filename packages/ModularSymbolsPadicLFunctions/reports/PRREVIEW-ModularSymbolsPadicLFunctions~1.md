# Review of ModularSymbolsPadicLFunctions (pull request #968 at 62f31bc)

**Verdict:** needs changes

## R01 (P1) — General Hecke duality must retain the opposite algebra

Location: `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:1007`: “the transpose reverses composition, which is harmless because the Hecke algebra is commutative.”

Claim: this comparison allows every finite-index Γ and a coefficient monoid Σ containing Γ, but then uses commutativity of their Hecke algebra.

Witness: take Γ=Γ(3), Σ=SL₂(ℤ). Double cosets form SL₂(𝔽₃). For S=[[0,−1],[1,0]], T=[[1,1],[0,1]], ST=[[0,2],[1,1]] and TS=[[1,2],[1,0]] modulo 3; their double cosets differ.

Repair: formulate the general transpose comparison as a right action, equivalently an action of the opposite Hecke algebra. Restrict the commutativity assertion to the particular commutative Hecke subalgebras supplied in §§0.3–0.5. Add the Γ(3) test: transposition sends ST to TᵗSᵗ, while identifying this with SᵗTᵗ fails. The underlying tensor–Hom comparison can remain at its stated generality.

## R02 (P2) — Specify the coefficient sheaf on the coarse quotient

Location: `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:1031`: “the orders of the torsion stabilisers are invertible on V” and “identify Symb_Γ(V) with H¹_c(Y_Γ,Ṽ).”

Claim: the general comparison uses the coarse quotient supplied by FuchsianOrbifolds and local-coefficient duality, without defining Ṽ at elliptic points. Invertibility of stabilizer orders does not make an arbitrary coefficient representation descend to a local system there.

Witness: for Γ=SL₂(ℤ), V=V₂(ℂ), S acts by X↦Y, Y↦−X. At i the invariant stalk is ℂ(X²+Y²), dimension 1; on the free locus it has dimension 3. All stabilizer orders are invertible.

Repair: define the invariant direct-image coefficient sheaf (or the orbifold coefficient object) and state its comparison and descent to the coarse space, including the compact-support and Hecke maps. Use ordinary local-system duality on the torsion-free cover, then the proved invariant-sheaf descent. State local constancy on the coarse quotient only when isotropy acts trivially. The repaired object must have ranks 1 and 3 in the displayed test, and rank 1 everywhere for trivial coefficients. This also supplies the object used for infinite-dimensional E_k in §2.3. FuchsianOrbifolds's main conventions explicitly supply a coarse orbit quotient; ModularCurvesPartII §14.12 supplies the torsion-free comparison, not this extra descent statement.

## R03 (P2) — Finite-precision Eisenstein observations do not supply full eigenlifts

Location: `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:2212`: “Construct a plus Hecke eigenlift of the plus Eisenstein symbol”; lines 2214–2216 also require a nonzero minus distribution eigensymbol in the specialization kernel.

Claim: §3.4 presents these as applications of PS Examples 8.6–8.7 and the preceding cuspidal critical-slope results.

Witness: PS lines 1695–1702 and 1724–1725 locate the Eisenstein eigenvectors in the finite-precision modules F_k(M). Theorem 5.14 concerns cusp forms. The roadmap's multiplicity theorem at line 2064 also assumes a decent cuspidal refinement.

Repair: supply a theorem/proof route constructing the genuine Eisenstein distribution eigenlifts with these exact level, sign, U₁₁ and U_p eigenvalues, and name its inputs in *Needs*. Cite a theorem about genuine distributions rather than treating the finite-precision calculation as that theorem. Test the resulting construction at Γ₀(33): specialization must be 0 for the minus vector, the vector itself nonzero, U₃e=3e and U₁₁e=e. This is a source-support gap, not a claim that the desired eigenvectors do not exist.

## R04 (P2) — The recorded dependency gate still fails

Location: `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:365`, with the corresponding *Needs* at line 2029 and layer dependencies at line 2256.

Claim: the head is not eligible for acceptance while the mandatory gate reports an upward supplier.

Witness: the gate reports `UPWARD: ModularSymbolsPadicLFunctions (#109) -> ClassFieldTheory (#265)`. The movable check refuses insertion after that supplier because EllipticCurveModularityPartII is already a consumer at #216.

Repair: resolve the dependency identity against the main-branch ClassFieldTheory input and rerun the gate. The README explicitly says **main**, and the review contract permits main suppliers: I regard the reported upward edge to the open revision as a false positive, not evidence of a mathematical cycle. Do not add dependence on that revision or move existing class field theory into this roadmap. Acceptance still requires a passing gate or a corrected gate result from the worker. No tooling or order file was changed in this review.

## R05 (P3) — Update stale supplier locators and declaration names

Location: `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:365`: “Layers 5 and 11: local and global reciprocity”; lines 1418–1419 cite `AL5.pStabilizedCoeff` and its members; lines 1797 and 2274 cite `AL5.OrdinaryGl2EulerFactor`.

Claim: those are the locations/names of the consumed results.

Witness: main ClassFieldTheory Layer 5 excludes reciprocity at line 1212; local reciprocity is in Layers 6–7. AutomorphicLFunctionsAndLocalFactors AL.5 has the named prose targets at lines 2947 and 2984, but neither cited AL5 declaration exists there or in its Lean file.

Repair: cite main ClassFieldTheory Layers 6–7 and 11 in all three places. Replace the stale AL5 identifiers by AL.5's “Complex period and stabilization dictionary” and “Refined GL₂ Euler factors and conductor tests”, identifying the coefficient recurrence, L-series identity and ordinary interpolation factor in prose. These mathematical inputs exist; no new target or declared gap is needed. Retesting the reference lookup resolves to those actual targets, with the same two Euler factors.

## R06 (P3) — API names claim declarations that Suggested.lean does not contain

Location: `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:423`: “API: slashVk … slashVk_mul … slashVk_one”; the same pattern recurs throughout the layers.

Claim: backticked local API identifiers identify declarations of this roadmap's acceptance file.

Witness: Suggested.lean declares only vkRep, H1par, periodValue, eichlerShimura, coefficientField, twistedPeriod and critical_values_algebraic. It contains no slashVk, slashVk_mul or slashVk_one.

Repair: rewrite the local API catalogues as prose bullet lists of properties, retaining backticked local declaration names only for those seven actual declarations. Keep the mathematical APIs and Checks in the README; do not add API lemmas to Suggested.lean. The repaired §0.1 can say that the right action preserves the homogeneous submodule, is unital and respects multiplication, while naming vkRep only for the kept left representation.

## Verified sound

The review read all 76 bold-titled targets, their APIs and Checks, all 15 conventions, and all seven Lean declarations. The evidence below distinguishes direct calculations, source verification and unresolved source support; calculations are tests of statements, not substitutes for proofs. No changes were made to the pull-request worktree. The outside-folder diff is empty. No copied source passage, computational algorithm target, sorry'd data, stand-in headline, `set_option`, unauthorized import or namespace collision was found. The main ModularForms roadmap is being extended on its Hom/cohomological side, not replaced: its Layer 8 at lines 764–805 supplies the homological coinvariants and period functional.

**Build and signatures.** Built the three imported Tau Ceti modules, then elaborated `TauCetiRoadmap/ModularSymbolsPadicLFunctions/Suggested.lean`; it succeeds with exactly the two expected sorry warnings. A scratch copy with `#check @name` for all seven declarations also succeeds. FiniteIndex, the newform carrier, nonzero levels/conductors, primitive-character condition, exponent bound and nonzero periods remain in the elaborated signatures. No lost section hypothesis was found. Scratch one-tactic probes with simp, rfl and infer_instance close neither theorem; reading the pinned period-map and cohomology interfaces supplies no single existing theorem proving either endpoint. No padding finding is raised.

**Headline inventory.** The README promises: (1) cohomological Eichler–Shimura and its operator/multiplicity refinements; (2) rational Drinfeld–Manin splitting; (3) signed/integral period comparisons and critical-value algebraicity; (4) Stevens control, small-slope existence/interpolation/uniqueness and ordinary integrality; (5) critical eigenlifts, critical-slope L-functions, secondary/family comparison and CM decency inputs; (6) supersingular zeros and signed decomposition; (7) tame twisting, coefficient transport and Euler depletion. The two statable endpoint signatures are eichlerShimura and critical_values_algebraic. Their cocycle and cusp-integral formulas fix the actual maps/coordinates. Suggested.lean lines 21–35 explicitly name the other endpoints and the missing Hom-side Hecke actions, eigenlines/lattices, distribution stages, charts, Selmer and analytic-function carriers. No additional statable headline was identified in this audit.

**Seeded source sample (15 sections).** All references were sought through the sources service; no manifest was edited. Eleven of the thirteen reference-list works were retrieved legally. Source keys below identify the line-numbered extractions. Two additional proof-route works, Kisin and Rubin, resolved only to uncertified publisher citations.

| Sample | Locator and text inspected | Result |
|---|---|---|
| §0.2 | PS §§2.2–2.5, pp.8–14, lines 318–338, 430–591; Wiese Definition 5.6/Theorem 5.7, p.56 | Integral Manin relations and proper-subgroup presentation supported; corrected translation sign and D∞ value retained. |
| §0.3 | PS §2.1, p.7, lines 281–299; Pollack-AWS §2.10, pp.11–12, lines 665–701 | Γ₀ Hecke formulas and invertibility-of-2 condition supported. The unrelated general commutativity assertion is R01. |
| §0.5 | Wiese §7.1, Proposition 7.9, pp.72–73, lines 3711 onward; §§7.2–7.3, pp.74–78 | The σ_ℓ term and character convention match after the stated upper-left/lower-right inversion. |
| §0.8 | Shokurov Theorem 4.3/Corollary 4.4 and proof, pp.637–639, lines 1243–1318; Nakamura Lemma 3.1, p.34, lines 1448–1462; §3.2, pp.45–46, lines 2020–2052; Sharifi Theorem 3.4.16, lines 1319–1330 | Rational splitting and inverse-adjoint formulas supported; integral splitting not claimed. Shokurov's damaged formula extraction is noted below. |
| §1.1 | PS §6.3, p.28, lines 1293–1317; Pollack-AWS §2.12, p.13, lines 714–733 | Basis dependence and period normalization supported; saturation is an additional algebraic construction with its hypotheses stated. |
| §2.1 | PS §6.1, p.26; Bellaiche §2.2, pp.17–19, lines 665–717 | Weight k+2, roots, sum of slopes k+1 and distinction from the actual bad-prime U_p eigenvalue respected. |
| §2.2 | PS Proposition 3.1 and §3.3, pp.15–17, lines 630–755 | Bounded/subexponential moments agree; r<p repair excludes the pole at −1/p. |
| §2.3 | PS Theorem 4.5, p.20, lines 889–915; §5.1, pp.21–22; PS-critical Lemmas 5.1–5.2, pp.11–12 | Difference-equation and U_p smoothing inputs read; PS-critical unavailable. The explicit −c obstruction calculation was independently checked. R02 affects its geometric interface. |
| §2.4 | PS Theorem 5.12 and Theorem 5.14, pp.25–26, lines 1182–1239 | Strict small-slope bound and failure at theta-critical boundary supported. |
| §3.0 | Bellaiche Proposition 2.12, Proposition 2.15(iv), Theorem 2.16, pp.18–21, lines 701–837; §§3.1–3.2; Theorems 2–3, pp.9–10, lines 376–417 | Cuspidal/distinct-root/decency assumptions and generalized versus eigenline distinction supported. Kisin's Artinian period input and Rubin's CM argument remain uncertified. |
| §3.1 | PS Definition 6.4/Proposition 6.5, p.29, lines 1379 onward; Bellaiche §1.4.3, p.8, lines 294–317 | Non-theta-critical eigenlift and critical interpolation supported after the roadmap's weight/value/sign corrections. |
| §3.2 | Bellaiche §1.4.3, p.8, lines 299–317; Theorem 3, p.10, lines 400–417 | Primary vanishing and distinction from secondary interpolation supported for the stated cuspidal case. |
| §3.4 | PS Examples 8.6–8.8, pp.35–36, lines 1673–1742; Bellaiche Proposition 2.15(iv), p.20, lines 769–787 | Numerical/full-distribution distinction gives R03. The CM no-eigenlift conclusion has the later theoretical input the roadmap names. |
| §4.2 | Pollack-SS §§3–5: unavailable; Sprung Proposition 4.25/Lemma 4.26, pp.907–908, lines 1090–1133 | Half-log inversion correction supported independently; the zero and signed-decomposition theorems are not source-certified here. |
| §4.4 | Pollack-AWS §6, pp.27–28, lines 1490–1568; Pollack-SS §7: unavailable | Unit linear coefficient and Dirac restriction supported. The supersingular examples' coefficients were computed directly; their cited analytic theorem remains unavailable. |

**Adversarial calculations: one row for each of the 76 named targets.** “Pass” means the displayed test did not refute the stated claim; “partial” explicitly reserves the unverified analytic/arithmetic conclusion. Toy operator models test quantifiers and distinctions rather than pretending to construct a modular eigensymbol.

| Target (README line) | Instances and computed values on the two sides | Result / change |
|---|---|---|
| Free group algebras over a finite-index subgroup (407) | S₃, Γ=C₃; and Γ=G. ℤ[S₃] has two ℤ[C₃] coset basis vectors, ranks 6=2·3; identity inclusion gives 1=1. Zero coefficients give 0=0. | Pass; no change. |
| The coefficient modules `V_k` (415) | k=1, T: X↦X, Y↦Y−X; cI gives c rather than c⁻¹. k=0 gives 1↦1. Zero ring gives module 0, without a nontrivial-ring rank assertion. | Pass. |
| The Hecke monoid `Σ₀(N)` (440) | diag(2,1): det=2; upper-left unit modulo 3, not modulo 4. diag(0,1): det=0, excluded. At N=1 the unit condition imposes no extra restriction. | Pass. |
| Manin's presentation of `Δ₀` (475) | D={0}−{∞}: D+SD=0; D+τD+τ²D=0 by cancellation at 0,1,∞. For trivial coefficients at full level, 2v=3v=0 forces v=0. | Pass. |
| Oriented cusp divisors (492) | d(∞,0) has coefficients (+1 at 0,−1 at ∞); d(0,∞)=−d(∞,0); d(a,a)=0. Degree is 1−1=0. | Pass. |
| Modular symbols (506) | V=0 gives Hom=0. For SL₂(ℤ), V₁(ℚ), central −I forces v=−v, hence 0. The analogous central equation in characteristic 2 is v=v. | Pass; central invariants retained. |
| Modular symbols as functions on cosets (534) | Boundary F(a/c)=(aX+cY)²: P=Y²−X², ρ(T)P=Y²+2XY; P′+ρ(S)P′=X²+Y²≠0. Identity representative change gives P=P. | Pass; images need not be equal submodules. |
| A modular symbol is determined by its values on the fundamental-domain generators (556) | Γ₀(2): (1−T⁻¹)D∞={0}−{−1}=D′. Reversed sign gives {−1}−{0}. Γ₁(5), k=1: central subgroup size 1, four cusp invariant lines. | Pass; corrected sign/properness retained. |
| Hecke operators on modular symbols (597) | Level 11: T₂ eigenvalues 3,−2,−2 give x³+x²−8x−12; T₃ eigenvalues 4,−1,−1 give x³−2x²−7x−4. U₁₁ cusp value 1; forbidden extra diagonal is outside Σ₀(11). | Pass for the stated Γ₀ algebra. |
| The involution at infinity (635) | ι sends 2↦−2↦2, X↦X, Y↦−Y; k=1 central −I contributes −1 when switching the literature involution. | Pass. |
| The plus/minus decomposition (653) | Swap on ℤ²: ± vectors (1,1),(1,−1) span index 2. Over ℚ the projectors sum to I; over 𝔽₂ both signs coincide, intersection dimension 2. | Pass; invertibility hypothesis necessary. |
| Boundary symbols (673) | Γ₀(11), V=ℚ: cusp functions dimension 2, constants dimension 1, boundary-symbol image dimension 1. Full level has one cusp and image dimension 0. | Pass. |
| Cohomological Hecke adapter (708) | Identity double coset acts by 1; trivial H⁰ coefficients give T₂=3 and U₂=2. Restriction/corestriction of index d gives multiplication by d, not 1/d. | Pass. |
| The map from modular symbols to group cohomology (734) | Coboundary with V₁ and v=X: c(T)=0, c([[1,0],[−1,1]])=−Y; its H¹ class is 0 on every cusp. Basepoint change is another coboundary. | Pass. |
| The boundary exact sequence for modular symbols (756) | Γ₀(11), k=0: dimensions VΓ=1, B=2, Symb=3, H¹=3, cusp H¹ sum=2; boundary image=1 and parabolic image=2. | Pass; no terminal surjectivity silently added. |
| Parabolic cohomology (781) | The preceding nonzero cocycle has class 0 and is parabolic, despite value −Y at a cusp stabilizer. Zero module has H¹par=0. | Pass; tests classes rather than pointwise vanishing. |
| Modular symbols modulo Eisenstein symbols are parabolic cohomology (826) | Level 11: dim(Symb/Eis)=3−1=2=dim H¹par. At full level with trivial ℚ coefficients both sides are 0. | Pass. |
| Descent of modular symbols from a normal subgroup (841) | SL₂(ℤ)→SL₂(𝔽₂)=S₃, coefficients 𝔽₂: sign gives nonzero H¹ class restricting to 0 on Γ(2), index 6=0 in 𝔽₂. Over ℚ division by index is allowed. | Pass; invertibility is not omitted. |
| Diamond operators on modular symbols (870) | N=5, ε(2)=i: lower-right 2 gives i, upper-left identification gives −i. Products give i²=−1=ε(4). | Pass. |
| Hecke operators on `Γ₁(N)`-symbols (900) | Good ℓ with ε(ℓ)=i: diagonal summand coefficient i, not 1; for trivial character it becomes 1. At a bad prime the diagonal summand is absent. | Pass. |
| Modular symbols with character (928) | Central −I: allowed character parity ε(−1)=(−1)^k. In k=1, ε(−1)=1 over ℂ forces v=−v and v=0; ε(−1)=−1 does not. | Pass. |
| The character decomposition of `Γ₁(N)`-symbols (948) | C₂ over ℚ: (1+s)/2+(1−s)/2=1 and the product is 0. Over 𝔽₂, 2=0 so these projectors are undefined; roots and inverse group order are required. | Pass. |
| Modular symbols commute with flat base change (960) | SL₂(ℤ), V₁: integral symbol space 0, whereas modulo 2 the Manin value X+Y is nonzero and satisfies S/τ relations. Thus 0⊗𝔽₂=0≠𝔽₂; ℤ→𝔽₂ is not flat. | Pass. |
| The invariant pairing between `V_k` and `Sym^k` (985) | k=1: ⟨X,Y⟩=1, ⟨Y,X⟩=−1. k=2: ⟨XY,XY⟩=−1/2. k=3 over ℤ₂: binomials 1,3,3,1 are units, giving an invertible antidiagonal even though 6 is not a unit. | Pass. |
| Hom-side symbols are the dual of homological symbols (1001) | JX=−Y: J(T·X)=−Y=T·JX; diag(2,1) gives −2Y on both sides. For Γ(3), ST≠TS modulo 3, so transposes cannot use blanket commutativity. | R01; retain opposite algebra. |
| Hom-side symbols and geometric cohomology (1029) | Γ₀(11), trivial ℚ: H¹c rank 3, parabolic rank 2. SL₂(ℤ), V₂(ℂ): S-invariants at i rank 1 versus generic rank 3, despite 2,3 invertible. | R02; define invariant sheaf. |
| The period symbol of a cusp form (1066) | Weight 2 level 11: ∞→0 gives L(f,1)≈0.25384186, reverse gives its negative; k=1, j=1 Mellin coefficient is −L(f,2)/(2πi). | Pass. |
| Dimension of parabolic cohomology (1110) | Γ₁(11), k=0, μ=60,c=10: H¹=11, H¹par=2. Γ₁(5), k=2, μ=12,c=4: 6 and 2. Γ₁(4), k=1, μ=6,c₁=2: 2 and 0; counting all 3 cusps gives −1. | Pass; source cusp correction necessary. |
| Petersson detection of period cocycles (1124) | For f=Δ, g=0, pairing with its conjugate has nonzero scalar times ⟨Δ,Δ⟩>0; same-holomorphic pairing is 0. The two mixed tests separately force both coordinates of a kernel element to 0. | Pass; not merely separate injectivity. |
| The Eichler–Shimura isomorphism (1140) | SL₂(ℤ), k=0: dimensions 0+0=0. k=10: Δ and its conjugate give 1+1=2. Γ₀(11), k=0: 1+1=2, with one signed line each. | Pass; formula, not arbitrary isomorphism, is specified in Lean. |
| Cuspidal and Eisenstein eigensystems are distinct (1168) | Level 11: Eisenstein/cusp eigenvalues at 2 are 3 and −2, difference 5; at 3 they are 4 and −1, difference 5. Distinct over ℚ, coincident modulo 5. | Pass; no integral separation inferred. |
| Newform eigenspaces of modular symbols are one-dimensional (1190) | Level 11 newform gives one line per sign. Raising to a distinct good-prime old level gives the two degeneracy copies before specifying U_p; dimension 2 is not dimension 1. | Pass; full refined eigenvalues/newness matter. |
| Rational separation of parabolic and boundary Hecke supports (1212) | Toy rational T=[[0,1],[0,2]]: eigenvalues 0 and 2 separated; modulo 2 both are 0. Polynomial e=1−T/2 is available over ℚ, not ℤ₂. | Pass; rational separation only. |
| The rational Drinfeld–Manin splitting (1232) | Same T: e=[[1,−1/2],[0,0]], e²=e, e(1,0)=(1,0), e(0,1)=(−1/2,0). Integral commuting retraction would require 1+2s=0, impossible in ℤ. | Pass. |
| Period lines and periods (1305) | Replace φ by 2φ: Ω becomes Ω/2 and Ωφ=(Ω/2)(2φ). For k=0 at ∞→0 the plus symbol is 2L≈0.50768372, not L. | Pass. |
| Saturated integral lattices and integral periods (1327) | A saturated line ℤ_p e has quotient 0 in its rational-line intersection; pℤ_p e has quotient 𝔽_p. Generators e and ue change periods by u⁻¹; pe changes by p⁻¹. | Pass; not all lattices are saturated. |
| The twisted Mellin formula for modular symbols (1362) | Primitive cubic χ modulo 7, χ(3)=exp(2πi/3), n=2: Σχ(a)exp(2πi·2a/7)=−0.16756280+2.64043987i=χ̄(2)τ(χ); χ(2)τ(χ)=−2.20290660−1.46533358i. | Pass; bar discriminated. |
| Algebraicity of critical values with the parity sign (1387) | Sign (−1)^(k−j)χ(−1): (k,j)=(0,0) gives χ(−1), (1,0) gives −χ(−1), (1,1) gives χ(−1). Rescaling Ω by λ rescales coordinates by λ⁻¹ in the same field. | Pass; simultaneous all-twist quantifier retained. |
| `p`-stabilisations of a newform (1406) | Level 11 at 3: a₃=−1, roots α+β=−1, αβ=3. Stabilized q³ coefficient −1−β=α; at q⁹ it is −2+β=α². α=β produces the same stabilized form, not two independent eigenvectors. | Pass; stale supplier names R05. |
| L-functions of `p`-stabilised forms (1440) | At j=0,k=0, β/p=1/α: stabilization factor 1−β/p=1−1/α. Exchanging α,β swaps the factor. It is only one of the two p-adic interpolation factors. | Pass; R05 locator repair. |
| The interpolation dictionary (1460) | k=j=0, χ=1: conversion contributes −1/(2πi), and at n=0 the stabilized-to-primitive factor is (1−1/α)². Reversing the cusp divisor flips the global sign. | Pass. |
| Refinements and their slopes (1508) | x²+x+3 at p=3 has slopes 0 and 1, sum 1. x²+19 at p=19 has slopes 1/2,1/2. At p=11 dividing level, eigenvalue a₁₁=1, slope 0, with no good-prime polynomial imposed. | Pass. |
| The refined eigenline (1532) | Companion [[2,−1],[1,0]] has repeated root 1: ker(U−1) dimension 1, ker((U−1)²) dimension 2. Distinct-root case has two distinct eigenlines. | Pass; generalized space not called a line. |
| Distribution modules with the weight-`k` action (1550) | Moments c_j=1/(j+1): |c_(p^m−1)|=p^m, unbounded but subexponential. c_j=p^(−j) grows p^j and fails D†. Matrix [[1,0],[p,1]] has pole −1/p of radius p; δ₀|β(1,p)=δ₁. | Pass; radius and opposite action matter. |
| Specialisation to polynomial coefficients (1610) | k=1: ρ(δ_a)=Y−aX, so δ₀↦Y and δ₁↦Y−X. A moment functional supported in degree k+1 maps to 0 but is nonzero. | Pass. |
| Lifting classical symbols to overconvergent ones (1628) | At k=0, Δμ evaluated on z equals μ(1). For e_(k+2), (e_(k+2)|(C_c−1))(z^(k+1))=−c; p=2,c=2 gives −2≠0 in ℚ₂. Applying U_p after lifting φ alone specializes to U_pφ, not φ. | Partial: algebraic obstruction passes; R02 geometric interface and unavailable PS-critical. |
| Slope decomposition of the fibre of specialisation (1689) | Toy U=diag(1,p): U^(n!) tends to diag(1,0), separating slopes 0 and 1. A generalized λ-block with λ≠0 is invertible; λ=0 is not. | Pass. |
| Stevens' control theorem in small slope (1711) | k=0: slope 0<1 is admitted, slope 1 is excluded. A theta-critical CM primary line has specialization rank 0, so a boundary-slope isomorphism would compare ranks 1 and 0. | Pass; strict inequality essential. |
| Values of slope-`h` eigensymbols are `h`-admissible (1744) | δ₁ has norm 1≤r^(−h) for every h>0 and 0<r≤1; positive upper growth does not imply unboundedness. λ=0 would require division by 0 and is excluded. | Pass. |
| The p-adic L-function of a small-slope refinement (1752) | Evaluation on −D gives −Φ(D); scalar cΦ gives cΦ(D). δ₀ restricted to ℤ_p× is 0 despite δ₀(1)=1 on ℤ_p. | Pass. |
| Interpolation and uniqueness of the p-adic L-function (1777) | n=0,k=j=0,χ=1: unramified factor (1−1/α)²; a ramified character has χ(p)=0 so the two parenthesized factors are 1, leaving α^(−n). A finite-order character kills log, showing why the growth bound matters. | Pass. |
| Ordinary p-adic L-functions as integral measures (1810) | Integral δ₁ has norm 1. Multiplying by p⁻¹ gives norm p and loses integrality while preserving boundedness. A unit α has |α^(−n)|=1 for every n. | Pass; lattice normalization needed. |
| Projective Banach model for signed symbols (1851) | Complex A --t→ A: H⁰=0; fiber at t=0 has H⁰=K, H¹=K. Thus finite-free terms do not imply H⁰ base change. Degree-zero concentration rules this model out. | Pass; concentration is an explicit target, not assumed. |
| Local analytic Hecke charts (1883) | K[t]/t² has one geometric point but K-dimension 2; replacing by its reduced quotient changes length 2 to 1 and loses the generalized vector. | Pass. |
| The theta exact sequence (1917) | k=0: derivative-dual δ₀ has values 0 on 1 and 1 on z, so it lies in specialization kernel but is nonzero. Antiderivatives have denominators n+1, unbounded at n=p^m−1; dagger rather than bounded dual is required. | Pass. |
| Galois and crystalline-period adapter for the local chart (1946) | K[η]/η²-free rank-one period has K-length 2, whereas a residue-only line has length 1. Weight 2 determinant χ_cyc dualizes to χ_cyc⁻¹, crystalline determinant p instead of p⁻¹. | Partial; conventions pass, Kisin source uncertified. |
| CM adjoint-Selmer vanishing (1993) | Over the CM field End(χ⊕χᶜ) decomposes as 1⊕1⊕χ/χᶜ⊕χᶜ/χ, dimensions 1+1+1+1=4 versus trace-zero dimension 3. Opposite nonzero weights give infinite-image quotients. | Partial; arithmetic vanishing not recomputed; Rubin uncertified; R04–R05 citations. |
| Criticality and decency (2031) | Weight maps t↦t and t↦t² have ramification indices 1 and 2 at 0, despite identical residue fields. Small slope 0<1 is noncritical; the split CM boundary case has slope 1 and zero primary specialization. | Pass in the displayed local tests. |
| Critical eigensymbol multiplicity (2064) | K[t]/t² regular module: generalized length 2, eigenspace ker(t)=Kt length 1; specialization mod t kills t and sends 1 to 1. e=1 gives both dimensions 1. | Pass. |
| Secondary and family L-functions (2088) | e=2: changing top vector 1 to 1+ct sends L₁ to L₁+cL₀; flag 0⊂Kt⊂K[t]/t² unchanged. e=1 has one function and no secondary quotient. | Pass. |
| The critical-slope p-adic L-function of a non-`θ`-critical refinement (2119) | Specialization on a non-theta-critical line sends chosen Φ to φ≠0. Replacing Φ by cΦ sends both specialization and L to c times their values; fixed φ forces c=1. | Pass; no interpolation-only uniqueness claimed. |
| Interpolation at critical slope (2150) | Boundary slope h=k+1 admits L and L+c·log^[k] with the same classical values: at γ^jζ the jth logarithmic factor is log ζ=0. Values alone therefore leave c arbitrary. | Pass; critical normalization uses the eigenlift. |
| Interpolation does not determine critical-slope L-functions (2160) | k=0: log(ζ)=0 for every p-power root of unity; at γ it is log γ≠0. Hence 0 and log have equal finite-order interpolation values but are unequal functions of order 1. | Pass. |
| `θ`-critical single forms (2172) | In K[t]/t² the primary vector t specializes to 0 and the top vector 1 to 1. This gives zero primary classical values without making the generalized top interpolation zero. | Pass. |
| Comparing critical and arithmetic L-functions through families (2185) | On reduced K⟨t⟩, analytic difference zero on a Zariski-dense set is 0. In K[η]/η², η evaluates to 0 at every point but η≠0. A pointwise-assigned value L(x)+1 differs by 1 and is not jointly analytic. | Pass; hypotheses distinguish the countermodels. |
| Critical-slope examples (2209) | ℤ₃[[T]][x]/(x²−T−9) has basis 1,x. T=0 splits with roots ±3; T=3 gives √12=2√3, a quadratic field. Finite-precision eigenrelations give residual 0 modulo 3^M, not residual 0 in ℚ₃. | R03; no genuine eigenvector manufactured by this test. |
| The two Euler factors at `p` (2273) | k=j=0,χ=1: distribution factor 1−1/α times stabilization factor 1−1/α gives (1−1/α)². Ramified χ gives 1·1. | Pass; R05 source names. |
| p-adic L-functions with a tame twist (2297) | p=3,M=2: no primitive character of conductor 2·3^ν, so constants 0 and 1 pass the empty interpolation test. M=4 with the odd primitive character gives actual conductor 4·3^ν. | Partial; primitivity repair passes, Pollack-SS unavailable. |
| A zero `U_p`-eigenvalue is outside finite-slope interpolation (2333) | α=0: α^(−n) is not a normalization for n>0. If U_pΦ=0 and λ≠0 with U_pΦ=λΦ then Φ=0, so a nonzero finite-slope eigenlift cannot have λ=0. | Pass. |
| Both refinements at a good supersingular prime, and their zeros (2349) | Level 11,p=19: x²+19 has slopes 1/2,1/2 and α∉ℚ₁₉. p=2: x²+2x+2 has roots −1±i with ratio −i of order 4. Zero/zero branches are bounded yet have infinitely many zeros. | Partial; elementary tests pass, Pollack-SS unavailable. |
| Pollack's half-logarithms (2395) | k=0,p=3: constants (1/3,1/3), linear coefficients (−1/8,−1/24); p²T times product has coefficients 1,−1/2. Inversion plus unit (1+T)^(3/4) gives linear +1/8. At ζ₃−1 the minus factor is 0 and plus is 1/3. | Pass for computed identities; full growth/zeros not source-certified. |
| Pollack's `±` decomposition of the supersingular p-adic L-function (2433) | Odd p: Lα=G⁺+αG⁻, L−α=G⁺−αG⁻, so half sum=G⁺ and difference/(2α)=G⁻. Zero signed component has infinitely many zeros. At p=2 the stated elliptic factor α/2 differs from α by 2. | Partial; algebra passes, integrality and dyadic theorem unverified. |
| Coefficient embeddings and conjugate period coordinates (2463) | Embedding i↦−i sends algebraic coordinate 1+i to 1−i. Replacing φ by 2φ sends coordinate c to c/2 and period Ω to Ω/2; no value for σ(Ω) is required or defined. | Pass. |
| Euler depletion and primitive/imprimitive comparison (2498) | aℓ=3,χ(ℓ)=2,ℓ=k=2,ε=1: j=1 gives 3/4 and j=2 gives 27/32; ε=0,j=0 gives 1/4. Level 11 at ℓ=3: a₂₇−a₃a₉+3a₃=5−2−3=0. | Pass; inverse twist/exponents/bad term distinguished. |
| Weight-two examples at level 11 (2538) | 1490719231≡1 modulo 11, opposite sign ≡10; constant 0 with unit linear coefficient gives μ=0,λ=1. δ₀ on units is 0. Weighted ω² residue sum is 5 modulo 11. | Pass; invariants insensitive to unit parameter change. |
| Supersingular examples at level 11 (2561) | Direct eta-product expansion: a₂=−2, a₃=−1, a₁₁=1, a₁₉=a₂₉=0. Thus p=2 is supersingular with a₂≠0; p=19,29 have a_p=0, slopes 1/2 each. | Partial; signed decomposition excludes the p=2 example as stated. |

**Additional definition/convention tests.** These cover the seven kept Lean declarations and the auxiliary action predicates; the 15 numbered conventions are also exercised by the rows on coefficients, orientation, Hecke/diamonds, periods, twists, slopes, radii and transport above.

| Definition | Computed positive and negative controls | Result |
|---|---|---|
| vkRep (Lean 47) | T sends Y to X+Y, while the right slash sends Y to Y−X; transpose/opposite composition gives the left action. S and T do not commute. | Correct distinction. |
| H1par (Lean 56) | Coboundary c(C)=−Y has restriction class 0; a trivial-coefficient cocycle with nonzero value on a cusp generator has nonzero restriction class. | Correct kernel-of-classes definition. |
| periodValue (Lean 65) | k=0 gives one coefficient, 2πi∫f. k=1 gives Y·2πi∫f+X·2πi∫zf; equal endpoints give 0. | Finite range prevents natural-subtraction junk; the two headline uses impose cusp-form hypotheses. |
| eichlerShimura (Lean 73) | Δ contributes a nonzero holomorphic class; both summands together have dimension 2. Zero map has rank 0 and cannot be the asserted equivalence. | Nonvacuous endpoint. |
| coefficientField (Lean 90) | Level-11 rational coefficients/trivial character generate ℚ; adjoining a value i generates ℚ(i), not ℚ. | Uses all coefficients and character values. |
| twistedPeriod (Lean 98) | m=1,j=0 gives the single untwisted integral, not an empty sum; cubic χ modulo 7 gives the conjugated Gauss identity above. m=0 is excluded by NeZero. | No division-by-zero or real-character-only test. |
| critical_values_algebraic (Lean 105) | k=1,j=0 and j=1 choose opposite signs for fixed χ. Ω=0 is explicitly excluded; one pair of periods precedes all m,χ,j quantifiers. | No conclusion hidden in hypotheses. |
| IsSigma0Action (§0.3) | Trivial action has act(1)=1; zero action has act(1)=0≠1. At T, using ρ rather than ρ⁻¹ changes Y−X to Y+X. | Contract rejects zero and inverse conventions. |
| Cocycle/coboundary predicates (§0.4) | c(γ)=ρ(γ)X−X satisfies c(γδ)=c(γ)+ρ(γ)c(δ); C gives −Y≠0 but H¹ class 0. | A single witnessing v is required, rather than a new v for each γ. |

**Library ownership at the pins.** Mathlib was inspected at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following 18 groups of declarations were opened; paths are relative to their library repositories. These are supplied objects, not requested redevelopments.

| Pinned file and line | Declaration / scope verified |
|---|---|
| TauCeti/NumberTheory/ModularForms/BinaryForms.lean:71,97,128 | binaryFormRep uses column substitution; binaryFormAdjugateRep uses adjugation. vkRep is the required transpose/opposite specialization. |
| Same file:193,235,275,320 | linearFormPow, binaryFormDual, intertwining and injectivity with regular binomial coefficients. No blanket integral perfectness was imported. |
| TauCeti/NumberTheory/ModularForms/GeodesicIntegral/BetweenCusps.lean:319,338,344,389,447 | cuspIntegral, equal-endpoint zero, antisymmetry and additivity with the actual integrability/holomorphic endpoint hypotheses. An arbitrary function alone does not imply these laws. |
| TauCeti/NumberTheory/ModularForms/ModularSymbols/Basic.lean:97,130,140,285,332 | degreeZero, its group actions, symbolRep and homological symbol coinvariants. The existing carrier is not Hom-side equivariant symbols. |
| TauCeti/NumberTheory/ModularForms/ModularSymbols/Hecke/Basic.lean:89,95 | symbolIntRep and symbolIntRep_tmul carry the adjugate coefficient action. The J rotation was checked at T and diag(2,1). |
| TauCeti/NumberTheory/ModularForms/ModularSymbols/Period/Pairing.lean:101; Period/Map.lean:94 | rawPairing and periodMap land in the dual of the homological module and carry their actual integral orientation. |
| TauCeti/NumberTheory/ModularForms/ModularSymbols/Period/Injective.lean:148 | periodMap_injective for finite-index groups and weight w+2; this is not cohomological surjectivity or the two-summand theorem. |
| TauCeti/NumberTheory/ModularForms/Newforms/MultiplicityOne.lean:228 | finrank_cuspFormsNewEigenspace_eq_one requires a nonzero eigenform in the new character space. |
| TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Eigenvector.lean:157 | Good-prime recurrence includes character membership, coprimality and the conditional divisibility term. |
| TauCeti/NumberTheory/ModularForms/HeckeSlash/BadPrime/Eigenvector.lean:65 | Bad-prime U recurrence requires p prime and p dividing level; no quadratic good-prime term. |
| TauCeti/NumberTheory/ModularForms/Degeneracy.lean:1041 | qExpansion_levelRaise uses expansion by d with NeZero d, strict-period and level-inclusion hypotheses. |
| TauCeti/RepresentationTheory/Homological/GroupCohomology/Corestriction.lean:124,153,396 | Existing corestriction, cor∘res=index and transitivity; the roadmap adds the conjugation/cusp adapter. |
| Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean:968 | H1π sends actual cocycles to their classes. |
| Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean:402,552 | H1InfRes_exact is only the stated initial exactness; resNatTrans supplies the restriction maps used by H1par. |
| Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean:58 | coindIso has the supplied coinduced representation and direction Hⁿ(G,Coind A)≅Hⁿ(S,A). |
| Mathlib/NumberTheory/ModularForms/Bounds.lean:492; LFunction.lean:134,178 | CuspFormClass.qExpansion_isBigO requires arithmetic Γ; ModularForm.L and CuspForm.Λ_eq_mellin are actual L/Mellin interfaces, not twisted-form carriers. |
| Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:508; Cyclotomic/Eval.lean:41 | Cyclotomic prime-power geometric sum and value p apply at positive prime-power exponent; Φ₁(1)=0 is not replaced by p. |
| Mathlib/RingTheory/PowerSeries/Binomial.lean:47 | binomialSeries is the formal series carrier; analytic convergence of half-log inversion units remains a roadmap assertion. |

**Resolved supplier contracts and duplication audit.** Searches by objects were run with `roadmaps grep`, against the pins, main, the board packages and the supplied sibling heads. `roadmaps show` was used for the current supplier texts. Main ModularForms, FuchsianOrbifolds and AlgebraicTopology were read for the repository shape and relevant contents. No other readable Suggested.lean uses either fully qualified headline name. Downstream PeriodsAndSpecialValues (§supplier contract, line 160), ModularIwasawaMainConjectures (lines 99 and 320) and EllipticCurveModularityPartII (line 61) explicitly consume these period/symbol outputs.

| Supplier | Resolved input and boundary |
|---|---|
| ModularForms (main) | Layers 0,4–5,7–8,8G,10C: Eisenstein/newform and L-series inputs; homological symbols and period injection; dimensions. Hom-side H¹par/ES is this roadmap's additional endpoint. |
| FuchsianOrbifolds (main) | Layers 2–4, lines 235,263,286: finite polygons, cusp neighborhoods, coarse quotient. Its conventions at line 137 explicitly distinguish coarse charts from a free covering; R02 is the missing coefficient descent. |
| AlgebraicTopology (main) | Stages 2,4,6 at lines 326,499,946: relative chains, cellular models and local-coefficient duality. These are inputs, not new foundations here. |
| PadicMeasuresIwasawaAlgebras (main) | §§0.1–0.2,1.7,3a.1,4.2,4.5: measures, completed algebras and branch/Iwasawa structure. Generic measure and bounded-series carriers are deferred. The explicit μ/λ discussion is also in §4.4. |
| ClassFieldTheory (main) | Layer 5 is local duality; finite local reciprocity starts at line 1220 (Layer 6), normalization/conductors at line 1312 (Layer 7), global reciprocity at line 1683 (Layer 11). R04–R05. |
| IntegralHeckeAndGaloisDeterminants | §§0.5,1.3,1.5, lines 863,2202,2538: trace comparisons, split absolutely irreducible henselian reconstruction and coefficient descent. Reconstruction cannot be applied merely to a reducible residual determinant. |
| ArithmeticGaloisRepresentations | §7.2, lines 4192–4220: full End representation by conjugation and distinct trace-zero/quotient versions. The roadmap correctly uses the full adjoint. |
| ArithmeticGaloisDuality | §§R02.2.1–2.2 and “Inflation–restriction for compact and rational coefficients” at line 1467; D7 local-field duality at line 5891. Stable-lattice topology is retained. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | §§R07.P2–P5 at lines 1349–1474 and P7.1–P7.5 at lines 1527–1660: finite-field period realization and labelled Sen adapters. They do not silently provide the Artinian-family theorem, which is a target here. |
| SelmerIwasawaCohomology | §§2.1–2.2, lines 355–392: global kernels with specified local maps; §4.9, line 1933: crystalline finite local condition and propagated lattice conditions. It does not supply the infinite-image CM main-conjecture argument. |
| ArithmeticLocallySymmetricSpaces | §ALS.3.1, line 2604, including derivedInvariants at line 2632. The resolver's missing-name warning is not a missing supplier target. |
| LocallyAnalyticDistributions | Layer 0, Layer 1, §§2.1,2.3,3.3,4.1–4.2,4.7–4.8,4.15–4.16: analytic stages, generic duals, growth uniqueness, Mellin and finite-slope complexes. The special weight action and modular-symbol complex are owned here. |
| ModularCurvesPartII | §§14.1–14.4a,14.8,14.11–14.12, lines 3499–3803: geometric coefficient systems, support/boundary comparison, Hecke and coefficient-dual pairings on the specified fine/torsion-free levels. §§7.1,9.1–9.3,11.1 supply Hodge/ordinary geometry. |
| LocalGaloisDeformationRings | §§F.1.1–F.1.10, lines 208–501, and §1.15, line 1478: lifting/deformation functors and characteristic-zero Artinian coefficient categories. The refined crystalline-period condition is not imported as an unrestricted theorem. |
| AutomorphicLFunctionsAndLocalFactors | AL.5 complex stabilization dictionary and ordinary refined factors exist in prose at lines 2947–2990. R05 repairs their stale identifiers rather than duplicating these targets. |
| AlgebraicModularFormsAndSerreWeights | R15.5A.2, line 1609: actual semisimple higher-weight Galois representation, arithmetic-Frobenius polynomial, coefficient field and lattice. The dual/crystalline convention here is explicit. |
| PadicPeriodRings | §§1.5,3,4.1–4.3: topological period carriers, crystalline structures and invariant functors. CM vanishing and the family-period theorem remain local targets, not falsely attributed to the carrier supplier. |
| Other open ownership | OverconvergentAutomorphicForms, lines 668 and 951, owns geometric Hilbert positive-radius modules/cusp modules with variable weights. The fixed-integral-weight classical-form comparison in §3.0 must use a compatible specialization; it does not duplicate the two Lean endpoints. Period and analytic L-function consumers found in the sibling heads import this roadmap. |

The general fixed-weight and Hom-side constructions here are earlier inputs to their consumers. No new upward supplier was introduced to use a later generalization. A declaration-level collision was not found. The search is not a certification of unpublished files outside the supplied/readable heads.

**Dependency output (rerun, exit 1).** The count changed with the worker's index; the same single edge remains. These are tool results, not pull-request numbers:

```text
not movable: ModularSymbolsPadicLFunctions consumes ClassFieldTheory (#265) and is consumed by EllipticCurveModularityPartII (#216), which comes first: moving ModularSymbolsPadicLFunctions after ClassFieldTheory would put a supplier after a consumer, a cycle through ModularSymbolsPadicLFunctions
UPWARD: ModularSymbolsPadicLFunctions (#109) -> ClassFieldTheory (#265) at README lines [365, 2024, 2248]
depcheck: 163 roadmaps, 1177 edges, 1 problem(s)
```

The supplied push gate has `depcheck=1`, every other reported scanner count zero, `outside-folder=0`, `stray-files=0`, and `build=0`: FAIL. The independent build passes as described above. The upward edge's source lines are those printed by the tool; the actual ClassFieldTheory references are at README lines 365, 2029 and 2256. The main-versus-open-revision false-positive analysis is R04.

## Not verifiable

- **PS-critical**, author-version §2.1 and §5.1, Lemmas 5.1–5.2, pp.11–12: the cited BU author URL failed certificate verification through the sources service. The HTTP form returned to that endpoint; the candidate Pollack GitHub author-page copy returned 404. The compact-support source proof was not read. The independent moment-obstruction calculation above does not certify that locator.
- **Pollack-SS**, §§2–5 and §7, especially Propositions 2.8/2.11, Theorems 3.3/3.5/5.1/5.6 and Lemmas 4.1/4.5/4.7: the cited BU author copy failed certificate verification; both candidate GitHub author URLs returned 404. No assertion that the odd/dyadic signed-integrality statements match the source is made. Sprung verifies the inversion correction only.
- **Kisin**, “Overconvergent modular forms and the Fontaine–Mazur conjecture”, DOI 10.1007/s00222-003-0293-8, period theorem and Proposition 8.7 used in §3.0: sources service marked the publisher citation uncertified. Bellaiche's proof was read, but it is not a substitute for checking this Artinian-coefficient theorem.
- **Rubin**, “The main conjectures of Iwasawa theory for imaginary quadratic fields”, DOI 10.1007/BF01239508, the imaginary-quadratic main-conjecture input behind §3.0: publisher citation uncertified. Bellaiche's CM-vanishing argument identifies the needed result but does not make the full infinite-image proof verifiable here.
- **Shokurov**, Theorem 4.3(a), printed p.637: the legal institutional scan's extracted displayed formula at lines 1247–1248 is damaged. Corollary 4.4 and its separation proof at lines 1275–1305 are readable and support the route; the exact displayed formula was not certified from that extraction.
- The finite-precision Eisenstein observations do not establish the genuine distribution claims: R03. The report does not claim numerical tests prove the global CM Selmer vanishing, projective-family concentration, or the supersingular zero theorems.

The missing-reference file preserves the two unresolved author-copy requests; resolved Sprung/Shokurov fetch failures were removed. Kisin and Rubin are recorded here as uncertified rather than reopening a paywalled request. This review is complete with these limitations and is not parked for a source response.

## Source issues

- **Error** in PS at §2.1, printed p.7: the source calls the coefficient sheaf locally constant on the quotient for arbitrary coefficients with invertible torsion orders; it should use the orbifold or invariant-image sheaf unless isotropy acts trivially; affects a stated result.
- **Misprint** in PS at §2.4, printed p.11: the order-two edge relation uses the unprimed edge; it should use the one-element-orbit primed edge; affects the proof.
- **Error** in PS at Theorems 2.6 and 2.9, printed pp.12–13: the translation side uses T⁻¹−1; it should use 1−T⁻¹ with the source's displayed definitions of the other divisors; affects a stated result.
- **Error** in PS at Corollaries 2.7 and 2.10, printed pp.12,14: the compatibility equation has the corresponding reversed sign and uniqueness omits the D∞ value; it should reverse that equation's right side and prescribe φ(D∞)=v∞; affects a stated result.
- **Misprint** in PS at Corollary 2.10, printed p.14: the order-three relation mixes primed and double-primed generators and the final values use unexplained m symbols; it should use the double-primed generator throughout and the prescribed v values; affects a stated result.
- **Error** in PS at §3.3, printed pp.16–17: the analytic weight action is presented without excluding radii meeting the denominator pole; it should restrict these disc stages to r<p; affects a stated result.
- **Error** in PS at §6.2 equation (1), printed p.27: the displayed interpolation omits the conductor-one Euler correction and does not match equation (2)'s signed normalization; it should include the factor 1−p^j/α at conductor one and the compatible period sign; affects a stated result.
- **Misprint** in PS at Definition 6.4 and Proposition 6.5 equation (3), printed p.29: the coefficient index is used as the modular weight, and the L-value is evaluated at 1 for every j; it should use modular weight k+2 and L-value at j+1; affects a stated result.
- **Error** in PS at §8.4 footnote (7), printed p.36: changing coefficient splitting fields of specializations is asserted to imply nonfreeness over Λ; it should make no such inference, since a monic quadratic quotient is free with such fibers; affects the proof.
- **Error** in Wiese at Proposition 4.16, printed pp.51–52: all cusps are counted for every weight; it should count regular cusps only at odd coefficient degree, and all cusps at even degree; affects a stated result.
- **Misprint** in Wiese at proof of Proposition 4.16, printed p.52: the order-three invariant dimension omits the polynomial representation's dimension; it should be (weight−1)μ/3; affects the proof.
- **Misprint** in Bellaiche at §1.4.3 equation (5), preprint p.8: the Euler denominators use the other root α for the β-refinement; it should use β in those denominators; affects a stated result.
- **Misprint** in Bellaiche at proof of Lemma 2.11, preprint p.18: the final extension group repeats χ₂ in both positions; it should be Ext¹_f(χ₂,χ₁), as specified immediately before; affects the proof.
- **Error** in Pollack-SS at Lemma 4.6, printed p.538, as documented by Sprung lines 1120–1133: the half-logarithms are said to be invariant under inversion; they should acquire the specified nonconstant analytic units; affects a stated result; corrected in print at Sprung Lemma 4.26, p.908.
