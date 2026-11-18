# Review of GL2ModularityLiftingPartII (pull request #2137 at 330f0af)

**Verdict:** accepted

**Summary.** Accepted: a full re-read of the roadmap found no false statement, no unsupported result and no unsound dependency; every Check and worked example was recomputed, and the fifteen sampled targets were read against Calegari–Geraghty 2018, Wiese 2007, Wiese 2014 and Scholze 2015 at their locators. There is one small correction (a redundant hypothesis in the two Lean headlines) and one format note, neither blocking. The acceptance is conditional on the 20 declared supplier gaps and on the two hypotheses the text keeps explicit (Conjecture A at every auxiliary level; H₃(3) at p = 3); two points are left for the human reviewers.

## C01 — In both Lean headlines the hypothesis `hres` follows from `htwres` and the hypotheses on η, so it asks for nothing

A reader of `minimal_weight_one_modularity` and `minimal_lift_finite_image` (`Suggested.lean`, lines 152–156 and 198–202) sees the residual conditions twice, once for ρ̄ and once inside `IsWeightOneResidual` for the twist η̄ρ̄, and may take them for independent assumptions. They are not. From `htwres`: `3 ≤ p` is the same clause; the entries of ρ̄(g) = η̄(g)⁻¹·(η̄ρ̄)(g) are continuous because `hηcont` and the open kernel of the residue map make η̄ continuous into the discrete field; a line is invariant under ρ̄ exactly when it is invariant under a scalar multiple; inertia at p lies in the kernels of η (`hηunram`) and of η̄ρ̄, hence of ρ̄; and for the complex conjugation c of the oddness clause, ι(c(c z)) = star(star(ι z)) = ι(z) with ι injective gives c² = 1, so det(η̄ρ̄)(c) = η̄(c)²·det ρ̄(c) = det ρ̄(c).

The statements are true as written. The smallest change, if one is wanted: say in the two docstrings (and in the sentence of §7.3 beginning "Precisely") that the conditions on ρ̄ are restated for readability and follow from those on the twist; or drop `hres`.

## N01 — Six lines of `Suggested.lean` exceed 100 characters

The signatures of `IsAdicallyContinuous`, `IsWeightOneResidual` and `IsMinimalLift` and the binders of ρ̄, ρ in the two theorems run past the line limit; breaking after `→*` would bring them within it.

## Verified sound

Earlier findings: the previous review, of `fdda916`, accepted with no finding, so there is nothing to repair. The change since then is a pure reordering (scope and supplier contracts moved to the end, the guide to the layers moved up under "How to read the build") plus one supplier change: qualitative Serre modularity is now cited from SerreModularityByCompatibleSystems `S5/qualitative-serre-theorem` in §0.2 (proof route and Needs), the Layer 0 Dependencies, Scope and ownership and the supplier contracts, in place of ClassicalSerreModularity R27.5. A sorted-line comparison of the two READMEs shows no other changed sentence.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.2 supplier of residual modularity (changed) | `S5/qualitative-serre-theorem` at the open head of SerreModularityByCompatibleSystems, README line 289 | Supplier: every odd irreducible ρ̄ into GL₂(𝔽̄_p), every p, weight ≥ 2, no weight or level asserted. Consumer: uses modularity only, then SWLO §3.13 for the Katz witness | agrees; merge order 266 < 288 | none |
| §0.5 vexing datum | x = 5, p = 3, θ₀ of order 8, λ of order 5 | a(θ) = 2, a(θ/θ^σ) = a(θ₀⁻⁴) = 1, a(Ind θ) = 4, n_x = 2 = c_x/2; pairing (16 − 20 + 4)/24 = 0; cg18 lines 1784–1786, 1823–1824, 1926 | agrees | none |
| §0.6 invariant pushforward | G = 1; cusp inertia μ_e | L = O_X, L^sub = O_X(−C); χ_i-part q^i·O[[q^e]]; definition at cg18 lines 1941–1942, 2141 | agrees | none |
| §0.8–0.9 duality and vanishing | e = 5, i = 2 and i = 0; n = 2 | q⁻²·q⁵ = q³ = sub line of χ₃; i = 0: q⁵O[[q⁵]]. Dual of H¹(ωⁿ⊗L_σ): cusp forms of weight 2 − n upstairs, 0 for n ≥ 2; sub version: full weight 0 contains constants at n = 2; cg18 lines 2163–2181 | agrees | none |
| §0.10 transpose | diamond 2 over 𝔽₇ | T^t = ⟨x⁻¹⟩T; 2⁻¹ = 4, 4⁻¹ = 2; cg18 lines 1957–1985, 2252 | agrees | none |
| §1.1 degeneracy matrices | x = 2, T = 0, ⟨x⟩ = 3 over ℚ; general x | U = [[0,6],[−1/2,0]], det = ⟨x⟩; pairing det = x⁻¹(x+1)²⟨x⟩ − T²; π₁*tr π₁W = xU + W checked by summing over the x + 1 subgroups; cg18 lines 873–917, 960 | agrees | none |
| §1.2 selected root | 𝔽₅, x = 1, (α,β) = (1,2) and (1,1) | det[[2,3],[3,4]] = 8 − 9 = 4 = −(1−2)²; repeated root: det[[2,2],[2,2]] = 0; cg18 lines 856–861, 893–894 | agrees | none |
| §1.3 harmless prime | 𝔽₅, x = 2, α = β = 1; α = 2, β = 1 | x⁻¹(α−xβ)(β−xα) = 3·1 = 3; (U−1)² = [[5,0],[0,5]] = 0, U ≠ 1; second case α = xβ, det 0; cg18 lines 974–1000 | agrees | none |
| §1.5 defect formula | Δ = 1, M = O/π; M = Oʳ⊕kˢ | Tor₀, Tor₁ with k: 1, 1, d = 0 = 0 − 0; r + s and s, d = r; general: d = rank N₀ − dim N₁/π from 0→N₁/π→Tor₁(M,k)→N₀[π]→0 | agrees | none |
| §1.7 contragredient ideal | 𝔽₇, trace 5, det 6 | 5·6⁻¹ = 5·6 = 30 = 2; from Ψ∘⟨x⁻¹⟩T_x = T_x∘Ψ the dual T-value is α(⟨x⁻¹⟩T_x); cg18 lines 2223–2285 | agrees (source has ⟨x⟩, see Source issues) | none |
| §2.1, §2.3 doubling | T = 0, ⟨p⟩ = 3; 𝔽₅, T = 3, ⟨p⟩ = 2 | Uψ(f,0) = ψ(Tf,−f), Uψ(0,g) = ψ(⟨p⟩g,0): [[T,⟨p⟩],[−1,0]], U² = −3I; a + bU = [[a+bT,b⟨p⟩],[−b,a]] = 0 forces b = a = 0; X²−3X+2 = (X−1)(X−2); cg18 lines 1265–1278, 1442–1474 | agrees | none |
| §3.1 doubled-representation criterion | L̄ indecomposable; N̄ indecomposable | Two non-isomorphic coordinates M̄→L̄ give two distinct stable lines spanning L̄; dually two kernels in N̄; both versions hold; cg18 lines 1486–1495, wiese14 lines 509–514 | agrees | none |
| §4.6 class-group obstruction | p = 3, h = 9, 𝔽₁₉ˣ = ⟨g⟩, α = g³; C₃ | α⁶ = g¹⁸ = 1, α² = g⁶ ≠ 1; ninth powers are {1, g⁹}; rank O[C₃] = 3 against 1; cg18 lines 3377–3429 | agrees (source states the p-th power test only) | none |
| §5.3 stabilizers | PGL₂ over imaginary quadratic F; C₃ at p = 3 | order n needs ζ_n + ζ_n⁻¹ ∈ F ∩ ℝ = ℚ: n ∈ {1,2,3,4,6}; dim H₃(C₃,𝔽₃) = 1; diag(i,1) has order 4; cg18 lines 3235–3267 | agrees | none |
| §6.1 Taylor–Wiles system | q = 1 | A∞ = O with 0 variables; q ≥ 1 and q − 1 variables at cg18 lines 638–646; system at lines 1706–1752 | agrees | none |
| §6.5–6.6 Bianchi R = T | T = k, H = k²; q | free of rank 2, generic fibre 0, so no rank-one or flatness claim; hypotheses match cg18 lines 3324–3328; q uses ad⁰ρ̄(1) as cg18 line 2986 | agrees | none |
| §6.8 generic rank | local dimensions 2 and 3 | 1·2·3 = 6; S-only Γ₀ level 1·1 = 1; cg18 lines 239–240, 3372–3373 | agrees | none |
| §8.2 type three | A = O·1 + πO⁴; B = O[t]/∏(t − iπ) | A/π = k[x₁,x₂,x₃]/(x)², length 4, socle 3; B/π = k[t]/t⁴, socle 1; three canonical generators at cg18 lines 2762–2771 | agrees | none |
| §8.4 multiplicity two | Ta G⁰ free of rank 1, Ta Gᵉ its dual | G⁰[m] = (ω/mω)^∨ of dimension 3, Gᵉ[m] = (T/m)^∨ of dimension 1; left exactness: 3 ≤ dim ≤ 4; even, so 4 and multiplicity 2; cg18 lines 2597–2600, 2801–2805; wiese07 lines 337–339 | agrees | none |
| §8.5 diamond quotient | p = 3; induction from ℚ(√−3) | both excluded in cg18 lines 2807–2812; full-level multiplicity one iff Frobenius nonscalar at wiese07 line 339 | agrees | none |
| `minimal_weight_one_modularity` | ℓ = p; twist datum p = 3, ψ of conductor 7; nebentypus convention | N prime to p, so ℓ = p is included: ρ unramified at p and a_p = tr ρ(Frob_p). ρ = ρ₀⊗ψ², η = ψ: ηρ = ρ₀, (det ρ)² = ψ² ≠ 1. Tau Ceti: f∣γ = χ(d_γ)f, so χ(ℓ) = det ρ(Frob_ℓ) in weight 1 | agrees with §§7.1, 7.3 | none |
| `minimal_lift_finite_image` | A = k; ℤ/9 determinant; O[ε]/ε² | A = k: image of continuous ρ̄ finite. 4² = 7 ≠ 1 in ℤ/9, lift rejected. {I + aεE₁₂} infinite with trivial field specializations, so reducedness of R_min[1/p] is needed; cg18 lines 326–329, 2823–2834 | agrees with §§7.2, 7.3 | none |
| `hres` (C01) | complex conjugation c; inertia at p | c² = 1 from injectivity of ι, η̄(c)² = 1, det(η̄ρ̄)(c) = det ρ̄(c); ρ̄(g) = η̄(g)⁻¹(η̄ρ̄)(g) = 1 on inertia | implied by `htwres`, `hηcont`, `hηunram` | C01 |

- Source locators read at the text: 31 in cg18, 1 in wiese07, 1 in wiese14, 2 in scholze15; all fifteen sampled targets confirmed (theorem number, printed page = extraction page + 296, hypotheses).
- Library declarations opened at the pins: 17 (Mathlib `Representation.invariants` Invariants.lean:73, `Ideal.inertia` Ideal/Defs.lean:154, `IsArithFrobAt.mul_inv_mem_inertia` Frobenius.lean:201, `GeneralLinearGroup.scalar` and `scalar_commute` Defs.lean:55, 88, `Matrix.charpoly` and `aeval_self_charpoly` Charpoly/Basic.lean:140, 222, `Matrix.det_fin_two` Determinant/Basic.lean:815, `groupHomology.indIso` Shapiro.lean:65; Tau Ceti `MonoidAlgebra.augmentation`, `augmentation_single` Augmentation.lean:50, 55, `Newform` Newform.lean:104, `dirichletLift` :134, `cuspFormCharSpace` DiamondOperators.lean:291, `IsEigenformAwayFromLevel` Eigenform.lean:65, `Newform.eq_of_forall_prime_eigenvalue_eq` StrongMultiplicityOne.lean:163, Chebotarev.lean:51, 74). No Jacobian of a modular curve with Hecke and Galois action, no Katz forms and no deformation ring exist at the pins, as the module docstring says.
- Cross-roadmap citations resolved: 53 section or target citations across 17 roadmaps, on main or at the open heads (SerreModularityByCompatibleSystems, ClassicalSerreModularity, ModularityAndLanglandsExtensions §1.5, PotentialModularityAndCompatibleSystems §8.8, GL2ModularityLifting §§3.7, 4.1–4.2, AutomorphicGaloisRepresentations, AutomorphyLiftingBeyondTaylorWiles §3.5, TorsionCohomologyInfrastructure §4.6); none missing.
- Declared gaps: 20 slugs, each stated once under its supplier in the supplier contracts, matching the declared list; each names a supplier and a single deliverable.
- Dependency check, verbatim: `depcheck: 199 roadmaps, 2183 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. No change outside the roadmap folder.
- Elaboration: `lake env lean` on `TauCetiRoadmap/GL2ModularityLiftingPartII/Suggested.lean` gives two warnings, `sorry` at lines 141 and 183, and nothing else. The elaborated types of the 9 declarations were compared with §§7.1–7.3 and the Conventions; no binder lost.
- Headlines and padding: the two statable headlines (weight-one modularity, finite image) are stated; the twelve others are named in the module docstring with the missing carrier. One-tactic probe on a copy of the file: `simp`, `rfl` and `infer_instance` each fail on both theorems. The seven definitions have real bodies and are used by the headlines.
- Pull request text: title and description read against the head; no sentence contradicted. The pull request adds the folder (3 files); the supplier change is reflected in its dependency list. The automatic checks all passed on this head.

Overlap check: read SerreWeightAndLevelOptimisation (main and its open revision), AutomorphyLiftingBeyondTaylorWiles, GL2ModularityLifting, GSp4NonregularModularityLifting, CompletedCohomologyAndLocalGlobalCompatibility, AlgebraicModularFormsAndSerreWeights, ModularityAndLanglandsExtensions; nothing shared. The scalar lower bound is SerreWeightAndLevelOptimisation §3.12's (which says it is not the upper bound) and the upper bound is §8.4 here; CG18 Lemma 4.14 is ModularityAndLanglandsExtensions §1.5's and is cited; AutomorphyLiftingBeyondTaylorWiles owns the GLₙ Conjecture B method of CG18 §§8–9, this roadmap the weight-one and PGL₂ Conjecture A theorems of CG18 §§3–5.

Source independence: 24 passages compared with 4 sources (cg18, wiese07, wiese14, scholze15), none shared beyond formulas and standard names; largest share cg18, 73 of 84 line locators; contents compared with cg18: independent (its §3.9 on vexing primes is spread over Layers 0, 1, 3, 6 and 7, its §3.8 and §5.4 are joined in Layer 6, its §4.2 sits in Layer 7 and its §4.1 comes last as Layer 8).

Research link: The headline targets are Theorems 1.3 and 1.4, Corollaries 1.5 and 1.6 and Theorem 4.8 of Calegari–Geraghty 2018, with Wiese 2007 for the scalar lower bound and Scholze 2015 as the contrast for Conjecture A; rests on the README's sources and on cg18, wiese07, scholze15 as read.

## Not verifiable

- cg22 (the published correction, Invent. Math. 227, pp. 855–856): paywalled and settled as uncertified; cited by its locator only.
- cg20 Lemma 8.14 (cited once, in the supplier contract for SerreWeightAndLevelOptimisation §3.14): outside the sample and not reopened this round.

## Source issues

- **Misprint** in cg18 at proof of Lemma 3.5, p. 318 (cg18 line 900): the source says U_x composed with V_x equals π₁* composed with ⟨x⟩; it should be x⟨x⟩π₁*, as its own computation and matrix on p. 319 give; affects nothing.
- **Gap** in cg18 at proof of Lemma 3.5, p. 320 (cg18 line 966): the source cancels π₁* on the right of an operator identity by full faithfulness; it should be proved on all of the level-x module, by summing over the subgroups of order x; affects the proof.
- **Misprint** in cg18 at proof of Theorem 3.11, p. 328 (cg18 lines 1265–1275): the source says ψ has second column ⟨p⟩V_p and gives the U_p matrix with entries 1 and −⟨p⟩; it should be the matrix with entries ⟨p⟩ and −1 for that ψ; affects nothing.
- **Misprint** in cg18 at proof of Theorem 3.30, step (3), p. 353 (cg18 line 2276): the source says the dual ideal sends T_x to the value of ⟨x⟩T_x; it should be the value of ⟨x⁻¹⟩T_x, by its own relation for Ψ; affects nothing.
- **Gap** in cg18 at Corollary 1.5, hypothesis (1), p. 304 (cg18 lines 307–309): the source says equal one-dimensional inertia invariants suffice; it should also exclude a new p-power inertial character, which is not minimal in Definition 3.1; affects a stated result.
- **Gap** in cg18 at proof of Theorem 4.8, p. 366 (cg18 lines 2803–2805): the source says the m-torsion dimension is the sum of the connected and étale ones; it should use left exactness, giving 3 or 4, then evenness; affects the proof.
- **Error** in cg18 at §5.5, p. 381 (cg18 lines 3423–3429): the source says a class of p-power order h splits when α is a p-th power residue; it should be an h-th power residue when h exceeds p; affects nothing.
- **Gap** in cg18 at proof of Lemma 5.9(1), p. 377 (cg18 line 3246): the source says degree-three homology with residue-field coefficients vanishes; it should be argued after localization when p = 3, where order-three stabilizers contribute; affects a stated result.
- **Misprint** in cg18 at proof of Theorem 5.11, p. 379 (cg18 line 3334): the source says q is the dimension of the Selmer group of ad⁰ρ̄; it should be that of the dual Selmer group of ad⁰ρ̄(1), as in Proposition 5.2; affects nothing.

## For the human reviewers

- **Licence.** The README cites Wiese 2007, Wiese 2014 and Scholze 2015 (`TauCetiRoadmap/GL2ModularityLiftingPartII/README.md`, References), which the package's `sources.toml` does not record; they were read from arXiv (math/0612318v1, 1102.2302v2, 1306.2070v2).
- **Scope.** The Bianchi theorems (§§6.6–6.8, 7.4) assume Conjecture A at every auxiliary level and, at p = 3, hypothesis H₃(3); the unrestricted scalar results (§§8.2–8.5) assume three declared gaps. Whether conditional targets of this kind belong is a human decision.
