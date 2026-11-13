# Review of PadicFamiliesPartII (pull request #2280 at de1cae2)

**Verdict:** needs changes

## R01 (P1) — Own the low-weight vanishing used in doubling

**Location:** `TauCetiRoadmap/PadicFamiliesPartII/README.md:1056`: “then `Zg = βg` and Corollary 5.4.5 forces `g = 0`”.

**Claim:** The first branch of §6.2 uses Hasse commutation and low-weight Z-eigenform vanishing, neither stated as a target nor supplied by its dependencies. The quadratic relation and scalar-weight-two divisor traces do not supply these results at the shifted weight.

**Witness:** BCGP21 line 5895, line 5906 and line 5953 separately prove Hasse commutation, low-weight divisor factorization and vanishing. Dividing a weight-two form by Ha gives weight `3−p`: 0 at p=3, −2 at p=5; §§4.8–4.10 treat weight two.

**Repair:** Add before §6.2: “For integral weights κ, the normalized operators satisfy `Z_{κ+(p−1)e_w}Ha_w = Ha_w Z_κ` and the analogous identity for `U_Iw`. If `l_w ≤ 0`, `U_Kli` factors through the ideal of `D_w`; consequently a global section of `ω^κ`, also with −D, satisfying `Zg = βg`, β≠0, vanishes (BCGP21 Propositions 5.4.2–5.4.3 and Corollary 5.4.5, pp. 121–122).” Include the operators at these weights and the Hasse-division proof, with dependencies on §4.4 and the Hasse geometry of §4.7; cite this target in §6.2. Its range includes both shifted weights 0 and −2.

## R02 (P2) — Restore the two active solid-category supplier contracts

**Location:** `TauCetiRoadmap/PadicFamiliesPartII/README.md:1147`: “with values in the derived category of solid E-vector spaces with a λ-smooth action of `B(ℚ_p)` (LocallyAnalyticRepresentationsOfLocalGroups §3.5)”; slope localization follows at line 1149.

**Claim:** The cited supplier defines λ-smoothness for a global continuous character, whereas §§7.1b and 7.3 allow an arbitrary infinitesimal weight. Its group algebra also does not supply the positive-monoid algebra. Both required gaps exist in the design but disappeared from the README contracts and Needs lines.

**Witness:** PR #2294, `TauCetiRoadmap/LocallyAnalyticRepresentationsOfLocalGroups/README.md:704`, requires a character M→E×; §3.4, line 687, requires a group. For E=ℚ₃ and weight 1/3 on Gₘ, a character would require χ(4)³=4, impossible modulo 9.

**Repair:** Restore `gap:infinitesimal-lambda-smooth` and `gap:solid-positive-monoid` under the LocallyAnalyticRepresentationsOfLocalGroups supplier, using their existing `design/plan.json` contracts: Lie algebra action through arbitrary λ on derived locally analytic solid representations, and solid modules over the positive monoid with localization to the torus. Cite them in §§7.1b, 7.3 and Layer 7 Dependencies. Distinguish the latter algebra as a monoid algebra. Keep weight 1/3 and a monoid generator acting by zero as negative controls for the narrower supplied categories.

## Verified sound

| Statement | Instances tried | Computed values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions | ℤ[0], shift by 1; cyclotomic line | H⁻¹(ℤ[1])=ℤ, H⁰=0; Sen(Qₚ(1))=1, dual=−1 | signs agree | none |
| §1.1 Morita degrees | p=3; height-one étale, multiplicative, supersingular groups | Degrees 0, 1, 1/4; allowed interval [0,1]; matrix multiplicity 2 would wrongly double endpoints | agrees | none |
| §1.2 normalized U | Type C, d=1, a=1,2; type A, a=b=d=1 | Exponents 1,3,1; at p=3 scalars 1/3,1/27,1/3 | agrees | none |
| §1.3 monotonicity | ℤ/3→μ₃ over ℤ₃[ζ₃]; multiplicative endpoint | Degrees 0→1; endpoint 1→1; equality only in second case | agrees | none |
| §1.4 bands | da=1, n=0, ν=1/2, η=1/4; η=ν | Band [1/2,3/4], destination [3/4,1]; η=ν permits N=0 | endpoints agree | none |
| §2.1 slope region | n=3,c=4,s=1/2,ε=1/16; boundary s=1 | Exponents −1/4 and 1/4; first contracts, boundary fails 4<4 | agrees | none |
| §2.2 first extension | α=3, U f=3f, N=1,2 | 3⁻¹·3f=f=3⁻²·9f; α=0 has no inverse | agrees | none |
| §2.3 bad complements (sample) | Counts 0,1,2; k=2 on a curve | N=1 lies in V₁ and outside V₂; dim B₂=1, dim X²=2 | filtration and coordinate-map correction agree | none |
| §2.4 first-good paths | N=1,2 | N=1: G+B; N=2: GG+GB+BG+BB, four words once each | agrees | none |
| §2.5 contraction | n=3,c=4,s=0,ε=1/8 | Exponent −1/2; q=3⁻¹ᐟ²<1; c=3 instead gives 3/8>0 | agrees | none |
| §2.6 path sums | Scalar bad/α=3; good f/α=1; p=3 | f₁=1,f₂=4; \|f₂−f₁\|₃=1/3; N-term tail norm=3⁻ᴺ | geometric estimate agrees | none |
| §2.7 all walls | h=1, da=2; bad operator zero | Initial degrees (1,2], final [0,2]; one place step; all f_N=f₁ | range agrees | none |
| §2.8 dimension one, headline | Modular curve, weight 4; q⁻¹ at cusp | Slope bound 4−1=3; ord_cusp(q⁻¹)=−1 excludes regular extension | boundary distinction agrees | none |
| §2.9 classicality, headline | Siegel weights (6,6),(6,3) | Bounds 6−3=3 and 3−3=0; slope 0 admitted only in first | strict inequalities agree | none |
| §3.1 spherical reduction | ℤ₃-flat coefficient; multiplication by 6 | [O→³O]: H⁻¹=0,H⁰=O/3; 6 mod 3=0 by either reduction | previous R02 repaired | none |
| §3.2 rank-zero vanishing | p=2,3; nilpotent block N²=0 | r thresholds 6,12; ordinary projector of N is 0 | threshold and ordinary removal agree | none |
| §3.3 amplitude, headline | Perfect two-term [E→⁰E] | H⁰=E,H¹=E,H²=0; amplitude [0,1] does not imply concentration | agrees | none |
| §3.4 away-p Hecke | q=1,T₀=1,T₁=T₂=4; ℓ=2 | Polynomial coefficients 1,−4,6,−4,1; trace scalars 1/8,1/64 | normalization agrees | none |
| §3.5 Euler characteristic, headline | [Λ→⁰Λ]; p=3; singular k=4 | χ=1−1=0 with two rank-one cohomologies; two components; λ₁=−5 | agrees | none |
| §4.1 partial Igusa tower | Two places; I empty, singleton, full | Torus ranks 4,3,2=2d−\|I\| | rank formula agrees | none |
| §4.2 universal coefficients | (k,l)=(2,2),(4,2); tensor (4,2),(6,2) | Sym⁰ rank 1, Sym² rank 3; tensor rank 3·5=15 | agrees | none |
| §4.3 commuting U | Two places, I={v₁} | Product U₁,₂U₂,₁U₂,₂; raw factor 3⁻³·3⁻⁶=3⁻⁹ | mixed factors agree | none |
| §4.4 first operators | l=1,2,3; p=3 | U_Kli=3U_Iw+Z, U_Iw+Z, U_Iw+3Z respectively | both branches meet at l=2 | none |
| §4.5 fixed-weight amplitude | \|I\|=0,1,2 | Supported lengths 1,2,3; cohomological intervals [0,0],[0,1],[0,2] | endpoints agree | none |
| §4.6 Satake integrality | p=3,k=4; α=1/3,β=3 | αβ=1; parameter slopes −1,1,2,4 versus Hodge 0,0,3,3; sums both 6 | negative control excludes unit-product shortcut | none |
| §4.7 partial Frobenius | p=3; divisor and ambient space | Degrees 3²=9 and 3³=27; F*ω=ω³ | degrees differ as required | none |
| §4.8 first divisor trace | p=3, Norm(x_w)=3; two-coordinate Frobenius | Scalar 3³/3³=1; Cartier trace(x²y² dx∧dy)=dx∧dy; function trace=0 | trace type agrees | none |
| §4.9 second divisor operator (sample) | p=3; trivialized δ=1 | deg F²=81; traces x⁸y⁸→x²y²→1; multiplier exponent 1−9=−8 | composite trace and inverse twist agree | none |
| §4.10 quadratic relation | U_Iw=2,Z=3,U_Kli=5,U₂=6 | 2²−5·2+6=0; 3²−5·3+6=0 | both roots agree | none |
| §5.1 Hida family complex | [Λ→ᵀΛ], Λ=ℤₚ[[T]], fibre T=0 | Fibre H⁰=H¹=ℤₚ; H⁰(original)⊗Λ/T=0 | derived fibre necessary | none |
| §5.2 congruence and dévissage | p=3, \|Jᶜ\|=2; n=2; empty Jᶜ | Trace multiplicity 9, kernel order 3⁸; 2²=4≠1²+1=2; empty product=1 | corrected recursion and empty case agree | none |
| §5.3 derived control, headline | d=2, \|I\|=1; I empty | Variables 2d−\|I\|=3, amplitude [0,1]; I empty gives four variables, [0,0] | agrees | none |
| §5.4 geometric/analytic coefficients | Weight (2,2); p=3, ε=1/3 | Algebraic fibre rank 1 versus analytic functions of unbounded degree; degree lower bound 2/3 | distinct carriers retained | none |
| §5.5 Coleman amplitude (sample) | Cubes of dimension 0,1,2 | Vertices 1,2,4; face-complex degrees 0,0..1,0..2; unrestricted four-chart Čech bound would be 3 | cubical bound agrees | none |
| §5.6 compact mixed action | p=3; Klingen and Iwahori kernels | Exponents 1+1+2=4 versus 1+2+3=6; trace scalars 1/27 and 1/729 | different operators retained | none |
| §5.7 BGG comparison | p=3, order m=5; source eigenvalue 1 | Target eigenvalue 1/243, slope −5; equivariant twist 243 restores slope 0; reflected all-degree bound 2 | corrected direction agrees | none |
| §5.8 small slopes | (2,2),(4,2),(6,2); P=(X+1)²,U=−1 | Combined bounds −2,0,2; only last admits slope 0; Q=−X−2 gives UQ(U)=1 | geometric/analytic distinction agrees | none |
| §5.9 Euler comparisons | Dimensions an=(1,2),geo=(1,1),M=(1,1) | χ_an=−1≤χ_geo=0≤χ_M=0; maps alone do not force equality | localized equality is additional | none |
| §5.10 ordinary comparison (sample, headline) | h_s=(2,3),h_t=(4,2); equal-Euler case | χ_s−χ_t=−3=−(2+1); equality with a,b≥0 forces a=b=0 | endpoint proof agrees | none |
| §6.1 companion (sample) | T=5,U=6,(x,y)=(2,3) | C=(28,−2); C²=(128,−28); diag(T)C−diag(U)(x,y)=(128,−28) | identity agrees | none |
| §6.1 noncommuting operators | T=E₁₂,U=diag(1,2),x=(1,2),y=(3,4) | C=(5,8;−1,−2); C²−diag(T)C+diag(U)=0; inverse returns (1,2;3,4) | no commutation needed | none |
| §6.2 vanished divisor branch | Weight 2 divided by Ha; p=3,5 | New weights 0,−2; divisor-trace targets remain at 2 | missing low-weight input | R01 |
| §6.3 doubling, headline | Kernel eigenline, u=6,ξ=3 | g=−f/3; U_Kli f=5f; Zf=3f; U_Iw f=2f; αβ=6 | reduction to §6.2 agrees | R01 prerequisite |
| §6.4 refinements (sample) | M=𝔽₅,α=2,β=3; M=0 excluded | T=0,U=1; eigenvectors (1,2),(1,3), determinant 1; C²+1=0 | splitting and nonzero condition agree | none |
| §7.1 BGG category (sample) | GL₂,Q=G; λ=ε₁ and det | On [E₁₂,E₂₁], ε₁=1, det=0; only det defines the Levi character | domain restriction agrees | none |
| §7.1a HCS | Torus module weight (1,1); twist ε₁ | Central scalar 2 becomes horizontal −2; diag(p,1) twist multiplies by p | dual sign and twist agree | none |
| §7.1b derived HC | V[1]; modular curve, ℓ(w)=0 | H⁻¹(V[1])=V; contravariant image has H¹=F(V); bound [1,1] | degree reversal agrees | none |
| §7.1b categories | E=ℚ₃,λ=1/3; positive generator U=0 on E | Unit cubes mod 9 are ±1, not 4; dim E=1, localization at U has dimension 0 | narrower supplier APIs insufficient | R02 |
| §7.2 localization (sample) | GL₂ standard module; diag(2,1) | Homology H₀,H₁ eigenvalues 1,4; cohomology H⁰,H¹ eigenvalues 2,1/2 | homology coefficients required | none |
| §7.2 central character | det∈O₀-alg; scalar matrix | Actual horizontal value −2; characters indexed by λ=0 give 0; λ=(1,1) gives −2 | infinitesimal-character hypothesis excludes wrong block | none |
| §7.3 CC (sample) | Source inclusion E→E²; coefficient shift [1] | Dual map (a,b)↦a; CC(M[1])=CC(M)[−1]; cohomological degree increases by 1 | variance agrees; category contract missing | R02 |
| §7.4 comparison (sample) | Zero coefficient; first-factor inclusion E→E² | Both compared complexes vanish at coefficient 0; dual map sends (a,b) to a on both realizations | normalization agrees | none |
| §7.5 Eichler–Shimura, headline | Modular curve, generic Verma; two Bruhat cells | At identity H₁=E,H₀=0; at other cell H₀=E,H₁=0; reversal shifts first coefficient to +1 | derived indexing agrees | none |
| §7.6 ordinary degrees, headline | d=1,p-index=0,1; d=3 | 2p+q−d=q−1,q+1; genus two gives q−3,q−1,q+1,q+3 | indexing agrees | none |
| §7.7 boundary vanishing (sample, headline) | Boundary constituent of rank 1 or 2; irreducible residual rank 4 | Proper constituent ranks 1,2<4; localized boundary=0; compact→ordinary cone=0 | residual hypothesis separates boundary | none |
| §7.8 four-piece filtration, headline | λ=(1,1;2) | Sen values −2,−2,−3,−3; two repeated blocks of size 2 | agrees | none |
| §8.1 Cousin complex | Two one-dimensional terms, differential c=0 or 1 | c=0 gives kernel E,cokernel E; c=1 gives both 0 | differential matters | none |
| §8.2 repeated Sen block | Θ=aI+E₁₂ and Θ=aI | Both graded scalars a,a; nilpotent ranks 1 versus 0; N²=0 | graded eigenvalues do not imply splitting | none |
| §8.3 local comparison | f=1/(1+x) | ((1+x)∂+1)f=0; (x∂+1)xⁿ=(n+1)xⁿ | stated source-proof obstruction is real | none |
| §8.4 Sen–Cousin (sample, headline) | N=E₁₂ and cN, c=2 over ℚ₂ | Both kernels span e₁, images span e₁, ranks 1; c=0 gives rank 0 | nonzero scalar essential | none |
| §8.5 balanced eigenspaces (sample) | E[T]/T²; four bounds n=1 | T-torsion dimensions 1→1→1, last map 0; total 4=1+1+1+1 saturates all bounds | balance repairs nonexact torsion | none |
| §8.6 de Rham classicality, headline | w=0; semisimple block and Jordan block | Sen values −1,−2; semisimple N=0 versus Jordan rank 1; Cousin cN vanishes only first | finite-dimensional obstruction agrees | none |
| §9.1 four modules (sample) | Unramified quadratic O; character χ of order 3 | ℤₚ rank 1 becomes rank 2, O-rank 1; χ⁻¹=χ²≠χ | coefficient extension and inversion agree | none |
| §9.2 projectivity, headline | p=2, C₂ torsion; length-one two-term complex | 1/2∉ℤ₂; [E→⁰E] has H⁰=H¹=E, so amplitude alone leaves extra degree | integral and concentration hypotheses retained | none |
| §9.3 classical fibre (sample, headline) | ν=(0,−2), lengths 0,1,2,3 | Weights (5,3),(5,1),(2,−2),(0,−2); λ(t)λ(t)⁻¹=1 | weights and smooth twist agree | none |
| §9.4 Coleman fibre, headline | Same four weights; only M-dominance | Differences 2,4,4,2 are all ≥0; latter weights need not be classical dominant | wider specialization distinguished | none |
| §9.5 duality, headline | κ=(5,3); lengths 0,3 and 1,2 | κ∨=(0,−2); complementary lengths sum to 3; (κ∨)∨=(5,3) | agrees | none |
| §9.6 group-ring projectivity, headline | Δ=C₃, R=𝔽₃[C₃] | Invariants span 1+g+g²; coinvariants dimension 1; norm map [1]↦1+g+g² is bijective | norm, not averaging, works | none |
| §9.7 central character, headline | p=2,r=7; p=3,r=7,11 | Quotient orders 3,3,5; units at p respectively yes,no,yes | case split agrees | none |

- Previous R01 repaired: line 293 says “Layer 6 uses Layer 4's divisor traces and quadratic relation”; the regrouping crosses BCGP21 §§4–6, and lines 53–80 map moved ids.
- Previous R02 repaired: line 529 says “the reduction coefficient is the perfect complex `[O →ᵖ O]` in degrees −1 and 0”; [O→³O] has H⁻¹=0 and H⁰=O/3; §2.18 is now a dependency.
- Sources: 15/15 seeded target dossiers checked at their cited statements, printed pages and hypotheses; 0 README locators marked unverified; 5 further passage comparisons (§§3.1, 4.4, 5.7, 6.2, 7.1b) against P20, AIP15, BCGP21 and BCGP25.
- Pins: 11 declarations opened—`Mathlib/Algebra/Module/LinearMap/End.lean:33`, `Mathlib/LinearAlgebra/Prod.lean:95` and `:199`, `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:72`, `Mathlib/Algebra/Polynomial/AlgebraMap.lean:259`, `Mathlib/Algebra/Module/Projective.lean:71`, `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87`, `Mathlib/RingTheory/Artinian/Module.lean:307`; `TauCeti/Algebra/Lie/HighestWeight/Verma.lean:195`, `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/Basic.lean:174`, `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/Isomorphism.lean:106`. No native Shimura-cohomology headline carrier found.
- Suppliers: 27 contract subsections inspected against main, supplied open heads or the HigherHidaAndColemanTheory package; 13 README gap contracts present, with the 2 active omissions in R02; 0 overlap-tool conflicts or dropped-id warnings.
- Lean: 0 declarations, hence 0 binder-signature or one-tactic probe subjects; every headline family is named with its missing carriers in Suggested.lean. Worker gate: all counters 0, OK; targeted build passed; separate `lake env lean` exited 0 without output.
- Dependency output: `depcheck: 239 roadmaps, 2175 edges, 0 problem(s)`; 0 UPWARD or CYCLE lines.
- PR text and scope: 0 outside-folder changes; 0 removed Lean declarations; title, summary block and prose checked against the new-folder diff and reorganized head, with no additional finding.

Overlap check: read GSp4NonregularModularityLifting (lifting applications), AutomorphicBundlesPartII (classical coherent comparisons and relative vanishing), AlgebraicModularFormsAndSerreWeightsPartII (integral spherical correspondence), OverconvergentAutomorphicForms (general analytic coefficient sheaves), PerfectoidShimuraVarieties (period towers and Levi torsors). These shared inputs stay with those owners; the mixed Hilbert specialization, doubling, BGG completed-cohomology comparison and four-module conclusions belong here. Main's closest-roadmap list is empty; no second copy found.

Source independence: 20 passages compared with 5 sources (BPS, BCGP21, BCGP25, P20, AIP15), no copied expression or reused source material found. Largest share: BCGP21, 84 of 225 explicit source-citation labels before References. Its contents were read: Layer 4 now combines coefficient and divisor prerequisites from §§4–5, Layer 5 combines control and comparison from §§4 and 6, and Layer 6 takes the doubling conclusion from §5.8; Needs lines force 4→5 and 4→6. The former consecutive source divisions are no longer the layer structure.

## Not verifiable

- HigherHidaAndColemanTheory has no main or supplied open-PR head; its cited sections were checked in `packages/HigherHidaAndColemanTheory/README.md`.
- No sampled source text was inaccessible; no additional source request is needed.

## Source issues

- **Gap** in BPS at Lemma 4.4.3, HAL p. 24: the source says the product of quotient maps is finite étale; it should be each coordinate map is finite étale, since the product target has larger dimension; affects the proof.
- **Misprint** in BCGP21 at Proposition 5.7.4, following paragraph, p. 130: the source says the restricted positive-weight section is δ⁻¹; it should be δ, with its inverse supplying the negative-weight multiplier; affects nothing.
- **Error** in BCGP21 at Remark 5.8.7, p. 135: the source says the operator algebra is local for every finite-dimensional M; it should be for nonzero M, since End(0) is the zero ring; affects a stated result.
- **Error** in BCGP21 at §6.4, p. 154: the source says the operator after the differential gains p to the differential order; it should be the differential after the operator gains that factor; affects the proof.
- **Misprint** in P20 at Proposition 13.3.3.1, p. 90: the source says the reflected equivariant operator is p^(−k−1)U; it should be p^(k+1)U, consistent with AIP15 Proposition 7.2.3; affects the proof.
- **Misprint** in BCGP25 at the paragraph after Definition 4.6.35, p. 88: the source says the contravariant functor preserves the cohomology index; it should be H^i of the image uses H^(−i) of the input; affects nothing.
- **Gap** in BCGP25 at Proposition 3.6.15, proof, pp. 66–67: the source says (1+x)∂+1 is injective on analytic germs; it should be nonvanishing on the constrained comparison fibre, since 1/(1+x) is killed; affects the proof.
- **Error** in BCGP25 at the proof of Lemma 3.4.6, pp. 53–54: the source says finite-dimensional representations of a semisimple group and its Lie algebra are equivalent; it should be those Lie-algebra representations integrable to that group; affects the proof.
- **Misprint** in BP26 at §1.1, p. 2: the source says M_µ is the unipotent radical of P_µ; it should be its Levi quotient, which indexes the algebraic coefficient representations; affects nothing.

## For the human reviewers

- **Scope.** Layers 7–9 use BCGP25, cited as arXiv:2502.20645v1 without a journal reference (`TauCetiRoadmap/PadicFamiliesPartII/README.md:1520`). The other principal classicality and coherent-cohomology sources have journal references.
- **Licence.** P20 and BP26 use author-hosted versions; their pagination/version conventions are recorded at `TauCetiRoadmap/PadicFamiliesPartII/README.md:1518` and line 1522. No source passages or figures are proposed for reuse.
