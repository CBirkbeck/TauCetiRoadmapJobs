# Review of GL2ModularityLiftingPartII (pull request #2137 at 35ff3e0)

**Verdict:** accepted

Incremental re-review of the 27 lines changed since 494737a (README only). No finding remains: the three findings of the previous review are repaired, the repairs introduce no new problem, the gate passes and the dependency check reports no problem. The acceptance is conditional on the 20 declared gaps, which the change does not touch.

## Previous findings

- R01 — repaired: README lines 15, 269, 719, 727, 735, 941, 950, 958 cite ModularityAndLanglandsExtensions §1.5 (CG18 Lemma 4.14); a new supplier contract states the quotient form for R_min; the restated ℤₚ-extension argument is gone.
- R02 — repaired: §6.1 (line 871) is stated for "the weight-one coefficients ω⊗L_σ", says "Nothing is asserted in weight n ≠ 1", and adds the n = 2 negative control as a Check (line 882); *Needs:* now lists §1.1.
- R03 — repaired: line 161 attributes the two-character formula to AlgebraicModularFormsAndSerreWeights §2.16 and keeps CG18 Remark 3.4 for the orbit of ∞ only; line 253 says CG18 Lemma 5.9(1) asserts the vanishing and where its proof fails at p = 3.

## Verified sound

**Scope of this round.** `git diff 494737a 35ff3e0` touches only `TauCetiRoadmap/GL2ModularityLiftingPartII/README.md` (16 insertions, 11 deletions). `Suggested.lean`, `metadata.toml` and the manifest are unchanged. The diff against `origin/main` outside the folder is empty and the worktree is clean.

**Gate, dependency check, elaboration.**
- Gate re-run at 35ff3e0: every counter 0, result OK; the worker's `gate.md` also records `build=0`.
- Dependency check, verbatim: `depcheck: 235 roadmaps, 2133 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. The edge count rose by one (2132 → 2133): the new edge to ModularityAndLanglandsExtensions, merge-order line 196, against line 267 for this roadmap.
- `lake env lean` on `Suggested.lean`: the only output is the `sorry` warning on the two theorems (lines 140 and 182). The file is byte-identical to the one the previous review elaborated and `#check`ed, so its signature comparison and one-tactic probes stand.
- `overlaps.md`: no dropped id, no conflicting head, no revision-only id.

**R01 repair, checked against the supplier and the source.**
- ModularityAndLanglandsExtensions §1.5 at its open head (README line 549) states exactly what the new contract says: number field F, finite k of characteristic p, finite S excluding the places above p, absolutely irreducible continuous ρ̄ on G_(F,S), universal ring R with finitely many Q̄ₚ-points, all of finite image; conclusion R[1/p] reduced. The roadmap is not on the never-cite list, and the pull request's `depends-on` and `merge-order` blocks already name it.
- The quotient form is correct. The proof (cg18 lines 2835–2874) uses: R Noetherian complete local (l. 2836); finitely many points, so R[1/p] is semi-local with residue fields finite over ℚₚ (ll. 2837–2845); traces generate R and its quotients (ll. 2852–2854); an E[ε]/ε²-point over a finite-image point is a split self-extension, by the absence of ℤₚ-extensions unramified at p and outside S (ll. 2858–2872). For a quotient R' of R, the first passes to R', the second is assumed for R' itself, the third is stated for quotients in the source, and an E[ε]/ε²-point of R' is one of R. So the contract's sentence "No finiteness of the Q̄ₚ-points of R itself is assumed" is justified, and the Scope clause "differs only in that the finiteness hypotheses are verified for R_min rather than for R" is accurate.
- The locator "pp. 366–368; cg18 line 2823" holds: the lemma starts at l. 2823 on PDF page 70 (printed 366) and the proof ends on PDF page 72 (printed 368).
- Layer 4 and Layer 6 Dependencies (lines 735, 958) carry the new edge, matching the *Needs:* lines of §4.5 and §6.5 (lines 727, 950). The supplier subsection sits in `## Exact supplier contracts` (line 267).

**R02 repair, recomputed.**
- The identities quoted in §6.1 are those of §1.1 (line 382–386) and of CG18 Lemma 3.5: the U_x matrix [[T_x, x⟨x⟩],[−x⁻¹, 0]] is cg18 lines 916–919; π₁*trπ₁W_x = xU_x + W_x is cg18 lines 958–960 multiplied by x; W_x² = x⟨x⟩ is cg18 line 890 and is the lower-right entry (x+1)⟨x⟩ = x⁻¹·(x+1)·x⟨x⟩ of §1.1's pairing matrix.
- The weight-n polynomial X²−T_xX+xⁿ⁻¹⟨x⟩ is cg18 line 805.
- §6.2, the only consumer of §6.1 (line 900), is stated on ω⊗L_(σ*) and ω⊗L_σ^sub, weight one. §§5.3–5.4 (lines 821, 838) keep ωⁿ⊗L_σ for the bundle and Hecke constructions, which is not what §6.1 restricts.

**R03 repair, checked against the sources.**
- AlgebraicModularFormsAndSerreWeights §2.16 at its open head states `a_x=ψ₁(x)+ψ₂(x)x^(n−1)` with ψ₁ψ₂ = ε, the specialisations 1+ε(x)x^(n−1) over ∞ and ε(x)+x^(n−1) over 0, and that the single-orbit formula of CG18 Remark 3.4 does not cover the full boundary. The README's attribution agrees.
- CG18 Remark 3.4 is at cg18 line 794 on PDF page 20 (printed 316); it asserts transitivity at ll. 797–798 and gives only 1+χ(x)x^(n−1) at l. 803.
- CG18 Lemma 3.7 starts at cg18 line 1009 (printed 321); part (2) is l. 1014 (printed 322). Its proof appeals to Remark 3.4 (ll. 1027–1028).
- CG18 Lemma 5.9(1) is cg18 line 3236 (PDF page 80, printed 376); the proof's unlocalized H₃(Y₀(Q),k) = 0 is l. 3246 (printed 377).
- Remark, no change requested: Lemma 3.7(2) is stated with K/O coefficients; the README's "its weight-one case" is cited for the supplier statement that also covers O and O/πᵐ.

**Seeded sample.** None of the fifteen sampled targets (0.1, 1.4, 1.5, 3.2, 3.3, 3.4, 3.5, 4.2, 5.2, 6.2, 7.3, 8.1, 8.3, 10.3, 10.6) lies in a changed passage. Two touch one: §6.2 cites the changed §6.1 (checked above) and §4.2 is an input of the changed §4.5 route, which uses it unchanged (R_min finite over O). The README flags no locator as unverified.

**Adversarial table.** Rows for the changed statements first, with values computed this round; the remaining rows are carried from the review at 494737a, whose statements the diff leaves untouched.

| Statement | Instance | Values computed | Result | Change |
|---|---|---|---|---|
| §6.1 weight-one U_x matrix | x = 2, T_x = 0, ⟨x⟩ = 1 over ℚ | [[0,2],[−1/2,0]]² = [[−1,0],[0,−1]] = −⟨x⟩I; charpoly X² + (2)(1/2) = X²+1; weight two would need X²+2¹·1 = X²+2, so U² = −2I ≠ −I | sound | changed statement |
| §6.1 W_x² = x⟨x⟩ against §1.1 pairing | x = 2, ⟨x⟩ = 3 | lower-right entry x⁻¹·(x+1)·W_x² = (1/2)(3)(6) = 9 = (x+1)⟨x⟩ = 3·3 | sound | changed statement |
| §6.1 π₁*trπ₁W_x = xU_x + W_x | CG18 form (1/x)π₁*trπ₁W = U + (1/x)W, x = 2 | multiply by 2: π₁*trπ₁W = 2U + W | sound | changed statement |
| Contract for §1.5, quotient form (§§4.5, 6.5) | R' = O (one point); R' = O[ε]/ε²; R' = k | O[1/p] = K reduced; O[ε]/ε² has an E[ε]/ε²-point with non-scalar trace part only if H¹(G_(ℚ,S), ad V) ≠ 0, which is 0 for finite-image V (inflation from a finite group in characteristic 0, no ℤₚ-extension unramified at p), so it is excluded; k[1/p] = 0 is reduced | sound | changed statement |
| Contract: finiteness for R not needed | tangent space of R' at x ⊂ tangent space of R at x | only the points of R' enter: dim m/m² at x for R' ≤ that for R = dim H¹(ad V_x) = 0 | sound | changed statement |
| Line 161 two cusp orbits | X₁(5); n = 1, χ(x) = −1 | 4 cusps, diamonds (ℤ/5)ˣ/±1 of order 2, orbits {above ∞}, {above 0}: 2 orbits, not 1; traces 1+χ = 0 and χ+1 = 0 | sound | changed statement |
| Line 253 H₃(3) | stabilizer C₃, k = 𝔽₃ | dim Hᵢ(C₃,𝔽₃) = 1 for every i ≥ 0, so H₃ = 𝔽₃ ≠ 0 while the coarse point has H₃ = 0; for p ≥ 5 orders 1, 2, 3, 4, 6 are prime to p | sound | changed statement |
| `IsUnramifiedAt` | ℓ = 1; trivial ρ at ℓ = 7 | span{1} = ⊤ is not lain over by any prime, so the predicate is vacuously true; trivial ρ: inertia ≤ ker = ⊤. Both proved in a scratch copy | sound | carried from the review at 494737a |
| `twist` | diag(2,3), η = 2, 𝔽₇ | diag(4,6); trace 3 = 2·5; det 3 = 2²·6; with a single η in the determinant, 2·6 = 5 | sound | carried from the review at 494737a |
| `IsAdicallyContinuous` | field k; O[ε]/ε² | for k, m = 0, so the basis is {⊤, ⊥} and the topology is discrete; for O[ε]/ε², m² = (π², πε) | sound | carried from the review at 494737a |
| `IsReducibleOn` | S₃ standard rep over 𝔽₅ | the two eigenlines of the 3-cycle are swapped by a transposition, so there is no invariant line; for H = 1 every line is invariant | sound | carried from the review at 494737a |
| `inertiaInvariants` | ℤ/9, diag(4,1) | (4−1)a = 3a = 0, giving 3Ae₁ ⊕ Ae₂, which is not free of rank 1 | sound | carried from the review at 494737a |
| `IsWeightOneResidual` vs CG18 §3.1 | oddness at p = 3 | det diag(1,−1) = −1 = 2 ≠ 1; c = 1 is impossible since ι(i) is not real; reducibility over k̄ matches CG18 once O is enlarged | sound | carried from the review at 494737a |
| `IsMinimalLift` vs Def. 3.1 | ℤ/9 with k = 𝔽₃; Teich(χ̄)ψ ⊕ 1; Steinberg lift [[1,b],[0,1]] | 4² = 7 ≠ 1 is rejected; det^(|k|−1) = ψ^(|k|−1) ≠ 1; for b a unit the invariants are Ae₁, a summand on every quotient | sound | carried from the review at 494737a |
| `minimal_weight_one_modularity` | p = 3, ρ = ρ₀⊗ψ², η = ψ (cubic, conductor 7) | ηρ = ρ₀ is minimal; (det ρ)² = ψ² ≠ 1 so only the twisted form applies; ℓ = p is allowed since N is prime to p and ρ is unramified at p | sound | carried from the review at 494737a |
| `minimal_lift_finite_image` | A = k; A = O[ε]/ε² | A = k forces ρ = ρ̄, which is finite; {I + aεE₁₂} is infinite but is not the image of a minimal lift once R_min is finite | sound | carried from the review at 494737a |
| §0.1 auxiliary prime | p = 3, class (1,2) | ratio 1 ∉ {2, 2⁻¹ = 2}; r ≡ 2 ≢ 1 | sound | carried from the review at 494737a |
| §0.2 Hecke formula | j = 1, x = 2, n = 1, ⟨x⟩ = 3, a₂ = 4, a₀ = 1 | a₁(T₂f) = 4; ℕ-division junk 1/2 = 0 would give 7 | sound | carried from the review at 494737a |
| §0.4 Ψ scalar | n = 2, x = 2, section eigenvalue 2 | 2⁻¹·2 = 1 | sound | carried from the review at 494737a |
| §1.1 U matrix | x = 2, T = 0, ⟨x⟩ = 3 over ℚ | [[0,6],[−1/2,0]]; charpoly X²+3; det ψ^∨ψ = x⁻¹(α−xβ)(β−xα), checked symbolically (= cg18 l. 990) | sound | carried from the review at 494737a |
| §1.2 / §1.3 | over 𝔽₅: x = 1, roots 1,2; x = 2, roots 1,1 | det[[2,3],[3,4]] = −1 = 4 = −(1−2)²; 2⁻¹·1 = 3; U = [[2,2],[2,0]], (U−1)² = 0, U−1 ≠ 0 | sound | carried from the review at 494737a |
| §1.5 defect | Δ = 1, M = O/π; M = Sʳ | Tor₀ = Tor₁ = k, so d = 0 = 0 − 0; d = r | sound | carried from the review at 494737a |
| §2.1 Uₚ matrix | T = 0, ⟨p⟩ = 3 | Uψ(f,g) = ψ(Tf + ⟨p⟩g, −f), so (0,1) ↦ (3,0); U² = −3I | sound | carried from the review at 494737a |
| §2.4 faithfulness | a + bU | [[a+bT, b⟨p⟩],[−b, a]]: the lower-left entry gives bM = 0, then aM = 0 | sound | carried from the review at 494737a |
| §3.1 Wiese | J = [[1,1],[0,1]]; S₃ over 𝔽₅ | N ≅ M ≅ L; (J−1)² = 0 ≠ J−1 | sound | carried from the review at 494737a |
| §3.3 normalisation | c = 2, U = 6 over 𝔽₇ | 2⁻¹·6 = 4·6 = 3 | sound | carried from the review at 494737a |
| §3.5 square root | ℤ/9; ℤ/4 | roots ≡ 1 mod 3: 1² = 1, 4² = 7, 7² = 4, so 7 is unique; mod 4, 1² = 3² = 1 | sound | carried from the review at 494737a |
| §5.1 x = 5, p = 3 | θ₀ of order 8, λ of order 5 | ⟨Res_T Θ(θ₀), θ₀⟩ = (16 − 20 + 4)/24 = 0; a(θ) = 2; a(θ/θ^σ) = 1; 5 ≡ −1 mod 3 | sound | carried from the review at 494737a |
| §5.4 cusp duality | e = 5, i = 2 | q⁻²O[[q⁵]]·q⁵ = q³O[[q⁵]] | sound | carried from the review at 494737a |
| §7.2 type | A = O·1 + πO⁴; B = O[t]/∏(t−iπ) | A/π = k[x₁,x₂,x₃]/(x)² with socle dim 3; B/π = k[t]/t⁴ with socle dim 1; both have generic fibre K⁴ | sound | carried from the review at 494737a |
| §7.3 generation | Φ = C₃; orders | squares are 1, g², g; O×O ⊋ {a ≡ b mod π}, index \|k\| | sound | carried from the review at 494737a |
| §7.4 count | Gross bounds | {3,4} ∩ 2ℤ = {4}, so multiplicity 2 | sound | carried from the review at 494737a |
| §8.2 type P | a(ψ) = 1, N(v) ≡ 1 mod p | π(Teich(ψ)ξ, ·) has a Γ₀(v²) newvector, so it lies at level Γ_p(v²); this justifies the matched-type design | sound | carried from the review at 494737a |
| §8.5 Hensel | 𝔽₇, α = 2, β = 4 | αβ = 1; trace 6; 2α − 6 = 5; 2β − 6 = 2 | sound | carried from the review at 494737a |
| §9.2 determinants | 𝔽₇, roots 2,4 | (1+1)² − 6² = −32 ≡ 3 = −(2−4)²; α² − 1 = 3 | sound | carried from the review at 494737a |
| §9.3 stabilisers | F imaginary quadratic | ζ + ζ⁻¹ ∈ F ∩ ℝ = ℚ, so orders are 1, 2, 3, 4, 6; diag(i,1) has order 4 over ℚ(i) | sound | carried from the review at 494737a |
| §10.3 complete intersection | q = 1, f₁ = π² | O/π²: dimension 0, length 2 | sound | carried from the review at 494737a |
| §10.4 rank | dims 2, 3 | 1·2·3 = 6 | sound | carried from the review at 494737a |
| §10.5 vs CG18 Thm 1.2 | p = 3 | the source allows p ≥ 3; the README's p ≥ 5 plus H₃(3) matches the Lemma 5.9(1) error | sound | carried from the review at 494737a |
| §10.6 Kummer test | 𝔽₁₉ˣ = ⟨g⟩, α = g³ | α⁶ = g¹⁸ = 1; α² = g⁶ ≠ 1 | sound | carried from the review at 494737a |
| Conventions: reciprocity | φ(Frob) = 2 over 𝔽₇ | Art_geom value 2⁻¹ = 4 | sound | carried from the review at 494737a |
| Conventions: Frobenius | 𝔽₂₇ | t³ = t+1; t⁹ = (t+1)³ = t+2 | sound | carried from the review at 494737a |

**Headlines (unchanged).** Stated: minimal weight-one modularity in twist-minimal form (`minimal_weight_one_modularity`) and finite image (`minimal_lift_finite_image`). The module docstring names the others as not statable at the pins, as recorded in the review at 494737a. No padding: 7 real-bodied definitions, all used by the two theorems.

**Library declarations.** No changed passage names a library declaration; the 21 declarations opened at the pins in the review at 494737a stand, and the manifest is unchanged.

**Cross-roadmap citations resolved this round (3).** ModularityAndLanglandsExtensions §1.5 (open head, README line 549); AlgebraicModularFormsAndSerreWeights §2.16 (open head); ClassFieldTheory Layers 11–12 (main). The others are carried from the review at 494737a.

**Gaps.** Unchanged: 20 slugs, each in `plan.json` and in a `What … must provide (gap:…)` line under its supplier. Line 253 now describes gap:localized-three-primary-stabilizers without changing its `needs` sentence (line 255).

**Pull request description.** Its `depends-on` and `merge-order` blocks list ModularityAndLanglandsExtensions; "the dependency gate shows 0 problem(s)" and "the outside-folder diff has 0 path(s)" agree with this head.

## Not verifiable

- CG22 (correction, Invent. Math. 227, pp. 855–856) is uncertified and cited by locator only; no changed passage depends on it.
- The two items carried from the review at 494737a (the CDT input behind GL2AutomorphicRepresentationsAndTransfer R16.3.9; the σ ↔ σ* swap of §6.4) are in untouched text and were not re-examined.

## Source issues

- **Misprint** in cg18 at proof of Lemma 3.5, pp. 318–319: the source says U_x∘V_x = π₁*∘⟨x⟩, twice; it should be x⟨x⟩π₁*, as its own sum of x terms each x⟨x⟩f divided by x and its matrix A show; affects nothing.
- **Error** in cg18 at Remark 3.4, p. 316: the source says (ℤ/NQℤ)ˣ acts transitively on the cusps of X_Δ(Q), so every boundary trace is 1+χ(x)x^(n−1); it should allow ψ₁(x)+ψ₂(x)x^(n−1) per cusp orbit, since the cusps above ∞ and 0 of X₁(ℓ) are distinct orbits; affects the proof.
- **Error** in cg18 at proof of Lemma 5.9(1), p. 377: the source says H₃(Y₀(Q),k) = 0 for all p ≥ 3; it should exclude p = 3, where orbifold homology at a C₃ stabilizer has H₃(C₃,𝔽₃) ≠ 0; affects a stated result.
- The six other items listed in the review at 494737a (Theorem 3.11 matrix, Corollary 1.5, three in the proof of Theorem 4.8, §5.2.1(5)(b)) concern untouched text and are unchanged.
