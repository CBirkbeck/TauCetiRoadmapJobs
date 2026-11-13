# Review of GL2ModularityLiftingPartII (pull request #2137 at fdda916)

**Verdict:** accepted

No finding. The acceptance is conditional on the 20 declared supplier gaps and on the two named hypotheses the README keeps explicit (Conjecture A at every auxiliary level; H₃(3) at p = 3).

## Verified sound

| Statement | Instance | Values computed | Result | Change |
|---|---|---|---|---|
| §0.6 coefficient bundles (cg18 lines 1925–1935) | G = 1, rank-one W; μ_e acting by q ↦ ζq | L = O_X, L^sub = O_X(−C); χᵢ-eigenspace qⁱO[[qᵉ]]. Source: G = ∏GL₂(ℤ/x^(c_x/2)), sections = Hom_G(W_σ*, forms) | sound | none |
| §0.8 cusp duality (cg18 lines 2116–2119) | e = 5, i = 2; i = 0 | dual q⁻²O[[q⁵]], times q⁵ gives q³O[[q⁵]]; contragredient index e−i = 3. For i = 0: q⁵O[[q⁵]], not qO[[q⁵]] | sound | none |
| §0.9 high-weight vanishing (cg18 lines 2163–2181) | n = 2, full and subcuspidal; traces at x = 2 | dual of ω²⊗L_σ is ω⁰⊗L^sub_σ*, weight-0 cusp forms = 0; dual of ω²⊗L^sub_σ is ω⁰⊗L_σ*, constants allowed, so n > 2. 1+2ⁿ⁻¹ = 3/2, 2, 3 | sound | none |
| §1.2 selected-root comparison (cg18 lines 856–861) | 𝔽₅, x = 1: roots (1,2); roots (1,1) | T = 3, ⟨x⟩ = 2: det[[2,3],[3,4]] = −1 = 4 = −(1−2)²; T = 2, ⟨x⟩ = 1: det[[2,2],[2,2]] = 0 | sound | none |
| §1.1/§1.3 pairing determinant | symbolic; 𝔽₅, x = 2, α = β = 1 | x⁻¹(x+1)²αβ − (α+β)² = x⁻¹(α−xβ)(β−xα); value 2⁻¹·1 = 3; U = [[2,2],[2,0]], (U−1)² = [[5,0],[0,5]] = 0, U−1 ≠ 0 | sound | none |
| §1.5 balanced homology (cg18 lines 1065–1075) | general M; M = O/π, Δ = 1; M = Sʳ | dim M_Δ/π − dim M_Δ[π] − dim Tor₁(M,O)/π = rank M_Δ − dim Tor₁(M,O)/π; 1 − 1 = 0 = 0 − 0; r | sound | none |
| §2.1/§2.3 Uₚ on the double | T = 0, ⟨p⟩ = 3; a + bU killing ψ(M²) | U(1,0) = (0,−1), U(0,1) = (3,0), U² = −3I; (a+bU)(f,g) = ((a+bT)f + b⟨p⟩g, −bf + ag), so bM = 0 then aM = 0 | sound | none |
| §3.1 doubled-representation criterion (cg18 lines 1486–1495; wiese14 lines 509–514) | R a field, L indecomposable, M semisimple / uniserial / irreducible | M semisimple forces L semisimple of dimension 2 with character constituents, decomposable: excluded; M uniserial: L has simple head, a coordinate M → L is onto, hence iso; M irreducible: L ≅ M | sound | none |
| §4.3 Hecke data (cg18 lines 3126–3144, 3191–3197) | uniformizer uπ with residual diamond c ≠ 1 | U_(uπ) = ⟨u⟩U_π, residual value cα ≠ α; Eisenstein condition T_λ − 2 at split primes of one abelian extension, as Definition 5.5 | sound | none |
| §4.4 Conjecture A contract (cg18 lines 3145–3167, 121–127; scholze15 lines 3844–3851, 3926–3934) | T with nilpotent I ≠ 0; Q = ∅ only; ρ̄ ordinary non-flat | representation over T/I is not one over T; N = N([F:ℚ], n) with Iᴺ = 0 and only unramified polynomials in Scholze; flat clause conditioned on ρ̄ flat | sound | none |
| §4.5 Hensel root | 𝔽₇, α = 2, β = 4; α = β = 1 | αβ = 8 = 1, trace 6, 2α − 6 = 5, 2β − 6 = 2; repeated root: 2 − 2 = 0 | sound | none |
| §4.6 Kummer exponent | p = 3, h = 9, 𝔽₁₉ˣ = ⟨g⟩, α = g³ | (19−1)/9 = 2: α² = g⁶ ≠ 1; cubic test α⁶ = g¹⁸ = 1 | sound | none |
| §5.3 amplitude and boundary (cg18 lines 3235–3267) | torsion orders in PGL₂(F); C₃ at p = 3; two components | order n needs ζ_n + ζ_n⁻¹ ∈ F: n ∈ {1,2,3,4,6} (√5, √2, √3 ∉ F); dim H₃(C₃,𝔽₃) = 1; [[0,2],[2,0]] has eigenvalues ±2; cusp units of order 2, 4 for F ≠ ℚ(√−3) | sound | none |
| §6.2 minimal R = T (cg18 lines 1706–1717) | R = T = k, H = k; H = 0 | free of rank 1 with πH = 0; for H = 0 every element acts by zero, so nonzeroness is needed | sound | none |
| §6.4 R = T with types (cg18 lines 2191–2285) | σ versus σ* | sections of L_σ = Hom_G(W_σ*, forms); (L_σ*)^∨(−C) ≅ L_σ^sub, so H₀(ω⊗L_σ*) is the dual of H⁰((ω⊗L_σ^sub)_(K/O)); diamond 2 ↔ 4 in 𝔽₇, 5/6 = 2 | sound | none |
| §6.5 variable count (cg18 lines 2986–2998) | q from Proposition 5.2 | q = dim H¹_∅(F, ad⁰ρ̄(1)) ≥ 1, tangent dimension ≤ q − 1; the proof of Theorem 5.11 prints the untwisted module (see Source issues) | sound | none |
| §6.7 dimension-zero complete intersection (cg18 lines 3372–3375) | q = 1, f₁ = π²; f₁ = 0 | dim O = 1, O/π² has dimension 0 and length 2; O/(0) has dimension 1, hypothesis fails | sound | none |
| §7.2 finite image (cg18 lines 326–329, 2823–2834) | A = k[[t]]; A = O[ε]/ε²; torsion of size s | image of R_min (finite over O) in k[[t]] is a finite k-domain, so k and ρ ≅ ρ̄; {I + aεE₁₂} infinite; at most s⁴ lifts of a matrix | sound | none |
| §7.4 Bianchi lifting (cg18 lines 192–204, 225–241) | p = 3; π-torsion T | source states p ≥ 3; README states p ≥ 5 and p = 3 under H₃(3), matching the failure at cg18 line 3246; an O-point of a ring killed by πᵐ is impossible | sound | none |
| §8.2 type | A = O·1 + πO⁴ | πe₄ = π − x₁ − x₂ − x₃, rank 4; x_ix_j = δ_ijπx_i; A/π = k[x]/(x)², length 4, socle dimension 3 | sound | none |
| §8.3 character twisting (cg18 lines 2772–2799) | Φ = C₃; O×O ⊋ {a ≡ b mod π} | squares 1, g², g exhaust the basis; index \|k\| with equal generic fibre K² | sound | none |
| §8.4 multiplicity two (cg18 lines 2586–2606, 2801–2805; wiese07 lines 73–84, 337–339) | Gross bounds | dim G⁰[m] = 3, dim Gᵉ[m] = 1, 3 ≤ dim G[m] ≤ 4, {3,4} ∩ 2ℤ = {4}, 4/2 = 2; Wiese: multiplicity 1 iff Frobenius nonscalar, level Np, p odd | sound | none |
| `minimal_weight_one_modularity` | ρ = ρ₀⊗η⁻¹ with ρ₀ minimal; ℓ = p; oddness | conductor of ρ prime to p (ρ₀, η unramified at p); a_p = tr ρ(Frob_p) included; det ρ(c) = ±1 ≡ −1 with p odd gives −1; `first \| rfl \| simp \| simp_all \| infer_instance \| trivial` leaves the goal open | sound | none |
| `minimal_lift_finite_image` | A = k; A = k[[t]]; undoing η | A = k forces ρ = ρ̄; k[[t]] as above; image of ρ has size at most \|im ηρ\|·\|im η\|; `exact Set.toFinite _` and `exact Set.finite_range _` fail | sound | none |
| `IsMinimalLift` against cg18 lines 584–595 | k = 𝔽₃ in ℤ/9; ℓ = 2, p = 3 | 4² = 7 ≠ 1 rejected, 1² = 1 kept; 2 % 3 = 2 = p − 1; \|k\| − 1 ≥ 1, no truncated subtraction; four clauses = Definition 3.1(1)–(4) | sound | none |
| `IsUnramifiedAt`, `twist` | trivial ρ at ℓ = 7; `twist 1 ρ` | both proved in a scratch copy (`intro Q _ _; simp`, `ext g : 1; simp [twist]`); diag(2,3) twisted by 2 over 𝔽₇: trace 3 = 2·5, det 3 = 4·6 | sound | none |
| §0.1 auxiliary prime | p = 3, class (1,2) | ratio 1 ∉ {2, 2⁻¹ = 2}; r ≡ 2 ≢ 1 | sound | none |
| §0.5 vexing datum | x = 5, p = 3, θ₀ of order 8, λ of order 5 | θ₀^(1−5) has order 2, a = 1 = a(θ₀); a(θ) = 2; a(Ind θ) = 2·2 = 4, n_x = 2 = c_x/2; 5 ≡ −1 mod 3 | sound | none |

- Previous review (at 35ff3e0): accepted with no finding, so there is nothing to re-check finding by finding. The 1018-line change regroups the layers and adds three sources; the internal section references of Scope, the supplier contracts, How to read the build and the route paragraphs (about 40) were re-resolved against the new numbering, all correct.
- Source locators checked against the text: 30 passages of cg18 (all 15 sampled targets, Definition 3.1, Propositions 3.8 and 5.2, Lemmas 3.5, 3.17, 5.6, 5.8, 5.9, Theorems 1.2, 1.3, 3.26, 3.30, 4.8, 5.11, Remarks 3.4, 4.9, 4.12, 5.7), wiese14 line 509, wiese07 lines 73 and 337, scholze15 lines 3844 and 3926. Printed pages agree (extraction page + 296). The README flags no locator as unverified.
- Library declarations opened at the pins: 19, all present where cited (for example `Representation.invariants`, `Mathlib/RepresentationTheory/Invariants.lean:73`; `Matrix.GeneralLinearGroup.scalar_commute`, `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:88`; `Matrix.det_fin_two`, `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:815`; `TauCeti.MonoidAlgebra.augmentation_single`, `TauCeti/Algebra/MonoidAlgebra/Augmentation.lean:55`; `HeckeRing.GL2.Newform.dirichletLift`, `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:43`).
- Cross-roadmap citations resolved at main or the open heads: 81 section ids across 17 roadmaps, none missing. Newly cited TorsionCohomologyInfrastructure §4.6 states exactly the quotient-by-nilpotent-ideal representation the README contrasts with Conjecture A; IntegralHeckeAndGaloisDeterminants §1.6 contains the target "Cayley–Hamilton recognition of isotypic modules"; ClassicalSerreModularity has `R27.5/hypothesis-H-and-theorem-9-1`; SerreWeightAndLevelOptimisation line 17 leaves the multiplicity-two upper bound to this roadmap.
- Declared gaps: 20 slugs in `design/plan.json`, the same 20 in the README. One `needs` sentence differs only in its locator (README "§3.5", plan "BT.3/lemma-9-6"); the supplier's head has §3.5, Lemma 9.6, and no BT.3 id.
- Gate re-run at fdda916: every counter 0, OK (the worker's record adds `build=0`). Dependency check, verbatim: `depcheck: 222 roadmaps, 1972 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Nothing changed outside the folder.
- `lake env lean` on `Suggested.lean`: two `sorry` warnings (lines 141, 183), nothing else. `#check @name` for all 9 declarations: every binder of the README statement is present; no declaration closes with one tactic; no declaration shares a fully qualified name with another roadmap's file.
- Remark, no change requested: the standing paragraph of §4.6 (README line 926) still lists the stabilizer and duality hypotheses of Layer 5, which §4.6 and its `*Needs:*` line do not use.

Overlap check: read SerreWeightAndLevelOptimisation, AutomorphyLiftingBeyondTaylorWiles, GSp4NonregularModularityLifting, GL2ModularityLifting, CompletedCohomologyAndLocalGlobalCompatibility, ModularForms; nothing shared (the multiplicity-two upper bound is owned here, its lower bound and the ordinary-projection injection by SerreWeightAndLevelOptimisation §§3.12, 3.14; the selected-root comparison by AutomorphyLiftingBeyondTaylorWiles §3.5; CG18 Lemma 4.14 by ModularityAndLanglandsExtensions §1.5; scalar O-finiteness by PotentialModularityAndCompatibleSystems §8.8).

Source independence: 35 passages compared with 4 sources (cg18, wiese14, wiese07, scholze15), none shared beyond statements the mathematics forces; largest share cg18, 65 of 71 locators; contents compared with cg18: independent (Layer 0 ↔ §§3.1–3.2, 3.9.1; Layer 1 ↔ §§3.2, 3.9.2; Layer 2 ↔ §§3.4–3.6; Layer 3 ↔ §§3.3, 3.5–3.7, 3.9.2; Layer 4 ↔ §§5.1–5.3, 5.5; Layer 5 ↔ §5.3.1; Layer 6 ↔ §§3.8, 3.9.2, 5.4; Layer 7 ↔ §§1, 4.2, 5.4; Layer 8 ↔ §4.1: no one-to-one run in order).

## Not verifiable

- cg22 (the published correction, pp. 855–856): paywalled and settled as uncertified; cited by its locator only.
- cg20 line 2540 (Lemma 8.14): outside this round's sample; not reopened.
- Ownership against open pull requests was checked through the roadmap index (449 heads); no file of another roadmap declares one of this file's names.

## Source issues

- **Misprint** in cg18 at proof of Theorem 5.11, p. 379: the source says q is the dimension of the Selmer group of the untwisted adjoint; it should be the dual Selmer group of the Tate-twisted adjoint, as in Proposition 5.2; affects nothing.
- **Misprint** in cg18 at proof of Lemma 3.5, pp. 318–319: the source says U_x∘V_x equals π₁* composed with the diamond, twice; it should be x⟨x⟩π₁*, as its own sum of x terms and its matrix show; affects nothing.
- **Error** in cg18 at Remark 3.4, p. 316, reused in the proof of Theorem 3.30 step (2), p. 351: the source says the diamond (respectively type) group is transitive on the cusps; it should treat each cusp orbit with its own character pair; affects the proof.
- **Error** in cg18 at proof of Lemma 5.9(1), p. 377: the source says the unlocalized degree-three homology with residual coefficients vanishes for all p ≥ 3; it should exclude p = 3, where an order-three stabilizer contributes; affects a stated result.
- **Gap** in cg18 at Conjecture A(4), p. 375: the source, as extracted, says the representation is finite flat at every place above p; it should condition this on the residual representation being finite flat, since §5.1 admits ordinary non-flat ones; affects a stated result.
- **Gap** in cg18 at proof of Theorem 4.8, p. 366: the source says an injection of torsion-free modules that is an isomorphism over K gives the integral tensor decomposition; it should prove surjectivity on Hecke generators; affects the proof.
- **Gap** in cg18 at proof of Theorem 4.8, p. 366: the source says the m-torsion dimension is the sum of the connected and étale ones; it should say between 3 and 4, with evenness forcing 4; affects the proof.
- **Misprint** in scholze15 at Corollary V.4.4 (arXiv v2, p. 103): the source says the displayed characteristic polynomial is that of the residual representation; it should be that of the representation over the local Hecke quotient; affects nothing.

## For the human reviewers

- **Licence.** The README cites Wiese 2007, Wiese 2014 and Scholze 2015 (README lines 1365–1367); the package's `sources.toml` records only cg18, cg20, cg22. The three texts were read from arXiv (math/0612318v1, 1102.2302v2, 1306.2070v2).
- **Scope.** The Bianchi theorems (§§6.6–6.8, 7.4) assume Conjecture A at every auxiliary level and, at p = 3, hypothesis H₃(3); the unrestricted scalar results (§§8.2–8.5) assume three declared gaps. Whether conditional targets of this kind belong in the roadmap is a human decision.
