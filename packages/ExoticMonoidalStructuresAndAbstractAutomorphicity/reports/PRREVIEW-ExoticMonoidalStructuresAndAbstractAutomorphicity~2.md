# Review of ExoticMonoidalStructuresAndAbstractAutomorphicity (pull request #1737 at a342646)

**Verdict:** needs changes

The previous review (at `aa1db54`) listed no finding, so there is nothing to mark repaired; the whole folder was reviewed again at this head.

## R01 (P2) — §5.6 drops the unit hypothesis on the ⊛-algebra

**Location** `TauCetiRoadmap/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md` line 749: "For any commutative ⊛-algebra A, the finite-support Hom underlineHom(E,A) … is an ordinary quasi-unital commutative Zsph-algebra: f⋆g=mA∘(f⊛g)∘Δ."

**Claim** Without a unit on A the convolution algebra need not be quasi-unital, and "Enhanced Φ⁻A is a firm Z-algebra" has no unit to supply local units either. The README distinguishes unital from nonunital elsewhere (§5.5, §6.4, §8.6), so "commutative ⊛-algebra" does not imply a unit.

**Witness** A = E with zero multiplication is a commutative associative ⊛-algebra; underlineHom(E,E) = Zsph with f⋆g = 0, so C⊗C C = Zsph⊗ℂ Zsph → C is the zero map. Dor23 line 1763 assumes "unital and commutative".

**Repair** Replace the sentence opening by "For any commutative unital ⊛-algebra A, with unit u:Iunit→A, …", add `Mathlib CategoryTheory.CommMon` to the Needs line, and add the negative-control Check: "E with zero multiplication is commutative and associative but has no unit (m∘(u⊛id) = λ would be zero while λ is invertible and E ≠ 0); its convolution on Zsph is zero and not quasi-unital." For unital A the local units are (u∘ε∘e_c)⋆f = f for f supported on the blocks of e_c, as in the first Check of §11.3.

## R02 (P3) — two AutomorphicLFunctionsAndLocalFactors citations name sections that are not there at its head

**Location** README lines 11, 59, 61, 75 and the Needs and Dependencies lines: "AL.0, Local Schwartz–Bruhat spaces and finite Fourier levels" (9 occurrences) and "AL.3, Curve additive analysis" (24 occurrences).

**Claim** At the head of AutomorphicLFunctionsAndLocalFactors, Layer AL.0 has no section of the first name, and Curve additive analysis is a section of AL.0, not of AL.3; a reader following the citation into AL.3 finds nothing, and the build order implied (AL.3 before Layer 0 here) is wrong.

**Witness** AutomorphicLFunctionsAndLocalFactors README at its open head: line 261 "Layer AL.0: Local and adelic Fourier analysis", line 263 "AL.0.1 Annihilators and compact-open Fourier identities", line 482 "AL.0.3", line 580 "AL.0.6.1 Curve additive analysis", line 41 "AL.3.10.1 → AL.0.6.1".

**Repair** Outside the gap sentences (whose wording is the plan's), replace "AL.0, Local Schwartz–Bruhat spaces and finite Fourier levels" by "AL.0.1, Annihilators and compact-open Fourier identities, and AL.0.3.1" and "AL.3, Curve additive analysis" by "AL.0.6.1, Curve additive analysis"; in Scope and ownership write "Its AL.0.6.1, Curve additive analysis, owns the completion-valued adeles, …".

## R03 (P3) — invertible sheaves, their tensor products and duals are in the pinned Tau Ceti, not owned by AlgebraicVectorBundles §§L0B–L0C

**Location** README line 13: "AlgebraicVectorBundles §§L0B–L0C own line bundles and their tensor products." and line 95: "Consume §§L0B–L0C: invertible sheaves and their tensor products, duals, sections and tensor functoriality on the curve."

**Claim** The supplier is cited for carriers it does not state: on main its labels L0B and L0C resolve to its Layers 2–3 (flat pullback, base change of internal Hom, powers and determinant), and it lists the invertible-sheaf carriers itself under "From Tau Ceti". The library declarations belong in this README's "From Tau Ceti" contract by name and file.

**Witness** Pinned Tau Ceti: `TauCeti.AlgebraicGeometry.InvertibleSheaf` (TauCeti/AlgebraicGeometry/LineBundle/Basic.lean, line 112), `InvertibleSheaf.tensorProduct` (LineBundle/TensorProduct.lean, line 63), `InvertibleSheaf.dual` (LineBundle/Dual.lean, line 44). AlgebraicVectorBundles README on main, lines 323–325 and 352–358.

**Repair** Add to "From Tau Ceti": "Invertible sheaves, their tensor product and dual are `TauCeti.AlgebraicGeometry.InvertibleSheaf`, `InvertibleSheaf.tensorProduct` and `InvertibleSheaf.dual` (TauCeti/AlgebraicGeometry/LineBundle/Basic.lean, line 112; TensorProduct.lean, line 63; Dual.lean, line 44)." In line 13, the AlgebraicVectorBundles contract, the §11.1 proof route and its Needs line, cite these declarations for the line-bundle carriers and keep AlgebraicVectorBundles only for what its Layers 2–3 state; if nothing of Layers 2–3 is used, delete that contract subsection.

## R04 (P3) — wrong line for `TauCeti.DiscreteRep`

**Location** README line 39: "(TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean, lines 256, 601, 615 and 816)".

**Claim** The four line numbers are given for four declarations named in another order, and the one for `TauCeti.DiscreteRep` is off by one.

**Witness** At the pin, line 614 is `structure DiscreteRep where`; line 615 is the docstring of its field `V`. Lines 256, 601 and 816 are `IsSmoothDiscrete`, `SmoothDiscreteTopRep` and `discreteRepEquivSmoothTopRep`.

**Repair** Write "(…/SmoothDiscrete/Basic.lean: `DiscreteRep` line 614, `SmoothDiscreteTopRep` line 601, `IsSmoothDiscrete` line 256, `discreteRepEquivSmoothTopRep` line 816)".

## R05 (P3) — ν denotes three objects, two of them inside §1.4

**Location** README line 303: "μ extends uniquely to a middle G-equivariant isomorphism ν:Ṽ⊗G Y⊗G V≅K(V(−1))(1)" and line 313: "Over F = 𝔽₃((t)), ν(t) = 1/3 and ν⁻¹(t) = 3".

**Claim** ν is the conductor exponent (Conventions, line 19; §4.2), the norm character |·|F (line 87) and the Kirillov isomorphism (§1.4, §12.1). In §1.4 "ν⁻¹(t) = 3" reads as the inverse of the isomorphism just defined.

**Witness** Line 19 "The conductor ν is the largest integer with e(π⁻νO) = 1"; line 87 "write ν = |·|F"; line 1449 "ZJL(jν(β⊗Ψ),s)".

**Repair** Rename the isomorphism κ in §1.4 (statement and last Check) and §12.1 ("ZJL(jκ(β⊗Ψ),s)"). In the third Check of §1.4 write the norm out: "|t| = 1/3 and |t|⁻¹ = 3 … Normalized I(|·|¹ᐟ²,|·|⁻¹ᐟ²) has Steinberg subobject and trivial quotient". The contract paragraph keeps its local "write ν = |·|F".

## R06 (P3) — the description says the Lean states definitions and theorems; the file declares nothing

**Location** Pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti; every target is in the README."

**Claim** The head contradicts the sentence: a reader expects declarations to check.

**Witness** `TauCetiRoadmap/ExoticMonoidalStructuresAndAbstractAutomorphicity/Suggested.lean` lines 39–41: an empty namespace; the worker's change summary counts 0 Lean declarations.

**Repair** Replace by: "`Suggested.lean` declares nothing: no headline theorem is statable at the pins, and its module docstring names each one with the carrier it lacks; every target is in the README."

## R07 (P3) — the description reports a `sorry` warning that the build does not produce

**Location** Pull request description: "Validation: the targeted Lake build succeeds with `sorry` as the only warning".

**Claim** The file contains no `sorry`, so the build of this head gives no warning.

**Witness** `lake env lean` on `TauCetiRoadmap/ExoticMonoidalStructuresAndAbstractAutomorphicity/Suggested.lean` at `a342646`: exit 0, empty output.

**Repair** Replace by: "Validation: the targeted Lake build succeeds with no warning (the file has no declaration and no `sorry`)".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.1 Determinant pairing | (1,2,3,4),(5,6,7,8); E₀₀,E₁₁; 𝔽₂ | au+dr−bt−cs = 8+20−14−18 = −4; positive cross terms 60; Gram determinant (1)(−1)(−1)(1) = 1; B(m,m)=0 over 𝔽₂ | sound | none |
| 0.4 Triality kernel | middle w twice; middle −I | \|y\|²·\|y\|²·\|y\|⁻⁴ = 1 with m↦−m; Dor23 (2.7) at t=−1 gives Ψ(−m,y) | agree; matches Dor23 lines 608, 780, 884 | none |
| 1.2 Singular orbit | E² terms (0,0),(1,0),(0,1) | Tor₀(V,Q)=0 kills (i,0); residual action on Tor₁ factors through det, Ṽ_SL₂=0 kills (0,1) | sound; fills a step Dor23 line 850 only asserts | none |
| 1.4 Kirillov spectral extension | 𝔽₃((t)); I(\|·\|¹ᐟ²,\|·\|⁻¹ᐟ²) | constants lie in I(χ₁,χ₂) iff (χ₁,χ₂)=(\|·\|⁻¹ᐟ²,\|·\|¹ᐟ²); so stated induction has St sub, 1 quotient; Whittaker dims 1, 0 | matches Dor23 line 416 | R05 (notation) |
| 2.2 Exotic tensor product | M=0; double swap on E₀₁ | 0; E₀₁→E₁₀→E₀₁ | matches Dor23 lines 976, 1002, 1005, 1013 | none |
| 2.3 Weak tensor data | unitor 2λ on Vect | λ∘s=λ on ℂ⊗ℂ holds for 2λ; unit square forces unit comparison 2·id | sound | none |
| 2.4 Whittaker unit | f=1_GL₂(O) over 𝔽₃((t)) | W(1)=1; W(u(t⁻¹)): b∈−t⁻¹+O, e(−b)=ζ; W(diag(t⁻¹,1))=0 | sound | none |
| 3.3 Unit and centre | ψ(f) at X=Iunit | s=id gives f⊛id=id⊛f; λ(id⊛f)λ⁻¹=f | sound, no associator used | none |
| 3.5 Degeneracy-free equivalence | St; 0→1→E→St→0 | Φ⁻St dim 1 but Ext¹(St,1)≠0; Hom(E,1)=0 | matches Dor23 lines 1289–1292, 1318–1325 | none |
| 4.3 Spherical centre equivalence | End(c-Ind from SL₂(O)), characters χ≠χ′ of O× | on diag(πᵃ,πᵇ): f(diag(u,1)·g·diag(u⁻¹,1))=f(g) forces χ(u)=χ′(u), cross terms 0; χ-part ℂ[x^±,y^±]^S₂ | finite-support End = Zsph, full End a product; Dor23 lines 1538–1546 | none |
| 5.1 Idempotent coherence | Cantor pairing; c·α on Vect | θ(θ(0,0),1)=2, θ(0,θ(0,1))=5; a(2)=5, θ(a(0),1)=2; pentagon c³=c² | hypotheses of GH11 line 481 kept | none |
| 5.4 Frobenius category trace | M=Iunit; Vect | Φ⁻(Iunit⊛N)=Φ⁻N; ev(M,N)=M⊗N | matches Dor23 lines 1730–1740 | none |
| 5.6 Spherical algebra | A=E, m=0; unital A | C=Zsph, f⋆g=0, C⊗C C→C zero; with unit (u∘ε∘e_c)⋆f=f | false as written | R01 |
| 6.1 Normalization module | (a,d)=(π,1), (λ,y)=(1,1) | both sides \|λ²y\|⁻¹f(aλy,dλ⁻¹); weights q⁻¹·q=1; unweighted q⁻¹ against 1 | sound; Dor21 lines 742, 832 | none |
| 6.2 Normalized induction | adjunction direction | Hom_T(L⊗T rW,V)=Hom_T(rW,Hom(L,V))=Hom_G(W,i Hom(L,V)); no √q | matches Dor21 lines 973–989 | none |
| 8.1 Theta functional | indicators at (E₀₁,1),(E₁₀,1), coefficients 2, 3 | Θ=5, after transpose 5; rational mirabolic: \|a\|=1, e(bq det ξ)=1 | matches Dor23 lines 2078–2100 | none |
| 8.2 Theta multiplication | 𝔽₃(t), b=t⁻¹ at t=0, Ψ isolating (I₂,1) | value 1 at Γ·1; Θ(u(b)Ψ)=e(b)=ζ, residue of t⁻¹dt is 1 | matches Dor23 line 2170 | none |
| 8.3 Poincaré unit | u∈U(F) | θ(u)=1, summand independent of representative; dual ∫φ(ug)θ(u)du | matches Dor23 lines 2239, 2250–2262 | none |
| 8.4 Petersson unit identity | unipotent integral | ∫_{A/F} e(b(q det ξ−1))db = 1 if q det ξ=1, else 0 | matches Dor23 lines 2284, 2295 | none |
| 8.5 Automorphic ideal | Poincaré image; nonnegative indicator | ∫θ over U(F)\U(A) is 0, so p=0; indicator has p>0 | matches Dor23 lines 2350, 2411–2427 | none |
| 9.2 Realization | limit of modules V_i, K=ker(Iunit→I) | K⊛V→V→V_i factors through K⊛V_i→V_i=0, so K⊛V→V is 0 | sound; Dor23 line 2451, Dor21 lines 161–171 | none |
| 9.3 Matrix Schwartz module | reference vector, g=diag(π_v,1); a∈A× | Q(g·Ψ)(0)=q_v=\|det g\|⁻¹QΨ(0); \|a\|·\|a\|⁻¹=1 | sound | none |
| 10.2 Weyl lifting | S(uz,v)S(1,z) | D(uz,vz)+D(uz²,v)+D(v,uz²)+D(vz,uz) on both sides; prime degrees N, N−m, 2N−m | sound; replaces the step at Dor21 line 2460 | none |
| 11.1 Spin structure | ord_v(ω)=2k; dt at ∞ | (π⁻ᵏO)^⊥=π⁻²ᵏ⁺ᵏO; ord=−2 gives πO∞ | sound; Dor23 lines 2507, 2530 | R03 (carrier citation) |
| 11.3 Spin convolution | u=η_I∘ε_A; f=1_A−1_B | u⋆f=f, 2⋆ gives 2f; p(f⋆f)=0, p(f²)=2·1_D | matches Dor23 line 2550 | none |
| 11.4 Invariance | g=diag(π,1) | q²·q⁻²=1 | matches Dor23 line 2562 | none |
| 12.1 Local zeta comparison | substitute y↦y det g | ∫∫β(g)Φ(g)f(y/det g)\|y\|^{s+1/2} = Z_GJ(β,Φ,s)·∫f\|y\|^{s+1/2}; exponent s−1/2 plus 1 from j | matches Dor23 lines 453–471 | R05 (notation) |
| 12.2 Global zeta comparison | formula against source | same three integrals as Dor23 lines 2183–2203; rational \|a\|=1 | sound | R02 (citation) |

- Source locators checked against the text: 15 of 15 sampled targets and 12 further ones (about 40 passages of Dor23, 9 of Dor21, 2 of GH11); the README flags none as unverified.
- Library declarations opened at the pins: 7 in Mathlib (`Matrix.det_fin_two` Determinant/Basic.lean:809, `Matrix.trace` Trace.lean:43, `Matrix.trace_transpose` :71, `Matrix.trace_mul_comm` :156, `Rep.coinvariantsTensor` Coinvariants.lean:410, `CategoryTheory.CommMon` CommMon_.lean:26, `CategoryTheory.Mod` Mod.lean:227; `SymmetricCategory` is at Braided/Basic.lean:366 under its attribute on 365) and 8 in Tau Ceti (R03, R04, `D4Tripled.trialityAutomorphism` Triality.lean:142).
- Cross-roadmap citations resolved at the suppliers' heads: 9 roadmaps, 63 section ids and 6 named targets (jacquet-subrepresentation, admissibility-of-irreducibles, mirabolic-derivatives, derivative-exactness, segment-representations, `presentableTensor` in §E5:presentability.2); two stale (R02), one misattributed (R03).
- Declared gaps: the 16 slugs of the brief are each stated once under the named supplier; for the 6 spot-checked against their suppliers' heads (balanced tensor, firm enrichment, theta characteristic, determinant pushforward, unipotent generation, ordinary presentable tensor) the supplier does not yet provide the object.
- Gate at this head: every check passes. Dependency check: `depcheck: 219 roadmaps, 1950 edges, 0 problem(s)`. Outside-folder diff: empty.
- Elaboration of `Suggested.lean`: exit 0, no output. It has no declaration, so there is no signature to compare and no padding to probe; its docstring names every headline of the Summary as not statable with the carrier missing.
- Ownership: `roadmaps grep` over main and the open heads for abstractly automorphic, weak symmetric monoidal, exotic tensor, idempotent theorem, Kirillov, theta characteristic, Eilenberg–Watts, normalization module: no second owner.
- Overlap check: read AutomorphicLFunctionsAndLocalFactorsPartII, ExceptionalThetaCorrespondencesForG2, SmoothRepresentationsOfLocalGroups, AutomorphicLFunctionsAndLocalFactors; nothing shared (the type-D₄ triality of the G₂ roadmap is the diagram automorphism, not the GL₂ matrix kernel).

Source independence: 27 passages compared with 3 sources, none shared; largest share Dor23, 46 of 62 locators; contents compared with Dor23: independent (Layers 3, 4, 5 have the scope of its §§3.4, 3.5, 3.6, in an order forced by the Needs lines 4.3 → §3.2 and 5.2 → §§3.5, 4.3; Layer 0 takes Lemma 2.17 from §2.3, Layer 2 merges §§3.2–3.3, Layer 8 merges §§4.3–4.5, Layer 12 draws on §§2.1 and 4.1, Layers 6 and 10 come from Dor21).

## Not verifiable

- Arm67 (existence of a rational theta characteristic): settled as uncertified; cited by locator through Dor23 line 2512 and owned by the FunctionFieldArithmetic gap.
- Dor20Z Claim A.3 (invertibility of S(F) over S(F×)): outside the sample; its line 1060 was not opened this round.

## Source issues

- **Misprint** in Dor23 at Warning 3.25, printed page 25: the source calls the Steinberg representation "trivial" when naming the extension; it should be the nonsplit extension of St by the trivial representation 1_G; affects nothing.
- **Misprint** in Dor23 at Construction 3.44, printed page 32: the source says the distribution is left SL₂(O)-invariant and right θ-equivariant; it should be left θ-equivariant under U and right SL₂(O)-invariant; affects nothing.
- **Error** in Dor23 at Remark 3.47, printed page 33: the source requires hKh⁻¹∩U to equal the kernel of θ; it should be the conductor lattice u(π^(−ν(e))O), since the kernel of e need not be an O-lattice; affects a stated result.
- **Misprint** in Dor23 at the proof of Proposition 4.9, printed page 43: the source writes the Fourier integral in the Poisson formula over M₂(F); it should be over M₂(A); affects nothing.
- **Misprint** in Dor23 at the Petersson pairing before Proposition 4.16, printed page 45: the source integrates over GL₂(A); it should be over GL₂(F)\GL₂(A); affects nothing.
- **Gap** in Dor23 at the proof of Lemma 2.20, printed page 17: the source states that the spectral-sequence term at (0,1) vanishes without argument; it should note that the residual action on Tor₁(V,S(F×)) factors through the determinant; affects the proof.
- **Error** in Dor21 at the proof of Lemma C.4.9, printed page 52: the source takes, by Chebotarev, a place whose uniformizer lies in an arbitrary ray class; it should use only classes of large degree, since classes of degree zero or of the opposite sign contain no uniformizer; affects the proof.
- **Gap** in Dor21 at Remark C.4.5, printed page 49: the source chooses a place of degree one; it should use an idele of degree one, since a curve over a finite field need not have a rational point; affects the proof.

## For the human reviewers

- Scope: 61 of 62 locators are to three papers of one author; Dor23 is refereed (Forum of Mathematics, Pi, 2023), while Dor21, the only source of Layers 6 and 10, and Dor20Z are arXiv preprints (v1); I did not search for published versions.
- Scope: the proof route of §10.2 (README line 1247, the four-term convolution identity with large-degree primes) is in no cited source; it replaces the argument at Dor21 line 2460, which fails for classes of non-positive degree.
- Acceptance test: `Suggested.lean` has no declaration. The §5.1 idempotent coherence theorem is statable at the pins with one structure of Mathlib data and was stated in the package-stage file; the docstring (lines 9–11) classes it as supporting, not a headline.
- Licence: Arm67 is uncertified (paywalled, cited by locator only); the existence of a rational theta characteristic in §11.1 rests on it through the FunctionFieldArithmetic gap.
