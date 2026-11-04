<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1225#issuecomment-6401224511 -->
Review (claude) of d6cdad7

Verdict: accepted
Conditional on the announced gaps: `scalar-variable-determinant`, `localized-three-primary-stabilizers`, `integral-principal-types`, `conductor-rigidified-descent`, `diamond-cover-cartan-leray`, `minimal-torsion-bad-hecke`, `taylor-wiles-sets`, `defect-one-presentations`, `rational-minimal-conditions`, `bianchi-local-types`, `integral-ordinary-hasse`, `scalar-conductor-comparison`, `jacobian-residual-isotypy`, `carayol-diamond-quotient`, `principal-local-selectors`, `bianchi-classical-dictionary`, `selected-root-residual-only`, `non-neat-bianchi-boundary`, `vexing-norm-twist-selector`, `scalar-variable-global-type`

1. **F01** (P3) §5.1's repaired level sentence contradicts its own formula, and its negative control is unexplained

   **Location:** `packages/GL2ModularityLiftingPartII/README.md:723`: "The exponent records both the minimal type and the determinant twist; it is not inferred from c_x/2 alone." Also line 740: "The even-conductor construction applied directly to θ instead gives (16−20+4)/24 = 0".

   **Claim:** With the package's own definitions, n_x = max(m_x, a(λ)) equals c_x/2 for every vexing prime, so the sentence asserts a distinction that does not exist. The repair changed the coefficient representation (correctly), not the level, and the level is exactly the source's (cg18 lines 1839–1842: kernel at exponent c_x/2).

   **Witness:** For E/ℚ_x unramified, a(λ∘N) = a(λ) (N maps 1+xⁿO_E onto 1+xⁿℤ_x). With θ₀ conductor-minimal under norm twists, a(θ) = max(a(θ₀), a(λ)): if a(λ) < a(θ₀) then a(θ) = a(θ₀); if a(λ) > a(θ₀) then a(θ) = a(λ); if equal, minimality gives a(θ) ≥ a(θ₀) and the product bound gives ≤. A minimal lift has θ|I = Teich(θ̄|I), so a(θ) = a(θ̄) and c_x = a(Ind θ̄) = 2a(θ̄). Hence n_x = a(θ) = c_x/2. In the package's own witness, max(1, 2) = 2 = 4/2. The number "(16−20+4)/24 = 0" is the multiplicity of θ₀ in the restriction of the depth-zero cuspidal representation of GL₂(𝔽₅) to the nonsplit torus 𝔽₂₅× (central contribution 4·4 = 16, noncentral −20 − Σθ₀⁴ = −20 + 4; recomputed independently); the README does not say that this is what it computes, nor how it is "the even-conductor construction applied directly to θ".

   **Exact repair:** Replace the sentence at line 723 by: "n_x = c_x/2: the conductor of the minimal lift at x is 2·max(a(θ₀), a(λ)), so the source's level is retained and only the coefficient representation changes." In the Check at line 740, say what the 0 is: "the depth-zero type Θ(θ₀) restricted to the nonsplit torus does not contain θ₀ (central contribution 16, noncentral −16), so a selector built from Θ(θ₀) without the λ∘det twist has zero Hom into Π₀⊗(λ∘det)". Repair test: with the sentence replaced, the formula n_x = max(m_x, a(λ)) at line 723 and the Check "m_x = 1, n_x = 2" at line 740 are unchanged and consistent with V_x at cg18 line 1842.

2. **F02** (P3) The Lean modularity headline omits the comparison at ℓ = p although p does not divide the level

   **Location:** `packages/GL2ModularityLiftingPartII/Suggested.lean:163`: `Nat.Coprime ℓ (N * p) → IsUnramifiedAt ρ ℓ ∧ …`; README lines 680 and 922: "every prime ℓ coprime to Lp".

   **Claim:** Under the hypotheses, ρ is unramified at p (ηρ is minimal, hence unramified outside S(η̄ρ̄) ∌ p; η is unramified at p), and the newform realizing ρ has level the Artin conductor of ρ, prime to p. So the Frobenius comparison at ℓ = p is true and statable with the same carriers; the stated set of primes is smaller than necessary. This is not a stand-in and not a weakening of the headline "ρ is modular of weight one": the stated primes already determine f (`HeckeRing.GL2.Newform.eq_of_forall_prime_eigenvalue_eq` at the pin, `TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean:96`), and the coefficient at p then follows from the supplier's Deligne–Serre comparison (AutomorphicGaloisRepresentations §§2.8–2.10). Hence P3, not P2.

   **Witness:** Instance: ρ with ρ(Frob_p) = diag(2,3) over 𝔽₇ in the Checks at README line 690; the newform has a_p(f) = ι(5) and nebentypus value ι(6) at p, excluded from the stated conclusion only by the factor p in `N * p`.

   **Exact repair:** In `Suggested.lean:163` replace `Nat.Coprime ℓ (N * p)` by `Nat.Coprime ℓ N`; in README lines 680 and 922 replace "coprime to Lp" by "coprime to L" and add "(L is prime to p)". Repair test: the signature still elaborates (the only change is the coprimality argument), and the Check at line 690 now covers ℓ = p.

3. **F03** (P3) The Bianchi vexing-prime exclusion is implicit in §8.1 and absent from Scope

   **Location:** `packages/GL2ModularityLiftingPartII/README.md:7`: "all Bianchi S/P/M/H types"; line 1043: "irreducible D_x, reducible inertia and N(x)≢−1 mod p M".

   **Claim:** The Bianchi theorems (§§8–10) exclude residual ramification at x with N(x) ≡ −1 mod p, ρ̄|D_x irreducible and ρ̄|I_x reducible, exactly as cg18 Theorem 1.3(4) (cg18 lines 232–233), because that case is not S, P, M or H. The Scope paragraph never says so; a reader comparing with the weight-one half ("all vexing primes", line 7) will read the Bianchi statements as covering vexing primes too. The source says the exclusion could presumably be lifted with CDT-type modifications of Conjecture A; no roadmap plans that, so it is a stated scope limit, not an unowned prerequisite.

   **Witness:** Instance: F = ℚ(i), p = 3, x = (2+i) of norm 5 ≡ −1 mod 3, with ρ̄|D_x induced from a regular tame character of the unramified quadratic extension of F_x, so ρ̄|D_x is irreducible and ρ̄|I_x reducible: this ρ̄ meets every hypothesis of §8.1 except membership in {S, P, M, H}, and no sentence of Scope names it.

   **Exact repair:** Add to Scope (after line 7): "Over F the Bianchi datum excludes vexing primes: residual ramification at x with N(x) ≡ −1 mod p, ρ̄|D_x irreducible and ρ̄|I_x reducible, as in CG18 Theorem 1.3(4); the weight-one theory over ℚ includes them through Layers 5–6." Repair test: §8.1's four cases are unchanged; the instance above is now named as out of scope at the one place the brief reserves for scope statements.

Package head reviewed: `d6cdad7` (round-4 repair). Files: `packages/GL2ModularityLiftingPartII/README.md` (1362 lines), `Suggested.lean` (211 lines, unchanged since round 3), `metadata.toml`, `sources.toml`, and the top-level `gaps` of `design/plan.json`. All six round-3 findings are repaired (table below); the repairs introduced no blocking defect. Three P3 notes remain, none of which changes a theorem, a gap contract or a Lean signature. Acceptance is conditional on the twenty declared supplier gaps listed in `review.json`.

## Verified sound

### Round-3 findings: disposition

The round-4 repair report marks all six findings applied and none "not actionable"; no re-raise applies. For each I quote the repaired passage (≤ 40 words), checked the repair against the supplier or by computation, and then looked for the same pattern elsewhere.

| Finding | Repaired passage and fresh check | Disposition |
|---|---|---|
| F01 (P2) vexing selector drops conductor hypothesis | README:189: "supply the full CDT lattice and minimal inertial selector for Wσ* only when a(θ/θ^σ) = a(θ)"; README:191 declares `gap:vexing-norm-twist-selector`; §5.1 (line 723) builds θ = θ₀(λ∘Norm), inflates Θ(θ₀) and tensors by λ∘det; §6.3 (885, 889, 898) and Layers 5–6 Dependencies cite the gap. Supplier check: GL2AutomorphicRepresentationsAndTransfer at `69bcab7`, R16.2.11 (rendering line 757) and R16.3.9 (958, 960) take `a(θ/θ^σ)=a(θ)=n≥1` as an explicit input, so the gap is genuinely missing supply. Witness recomputed: a(θ) = 2, a(θ/θ^σ) = 1, a(Ind θ) = 4; character sum 16 − 20 + 4 = 0; untwisting by λ∘det preserves the Hom, dimension 1. Every vexing prime is covered: for ρ̄|D_x absolutely irreducible, θ̄/θ̄^σ is ramified (an unramified θ̄/θ̄^σ is σ-fixed of order ≤ 2, forcing θ̄|O_E× to factor through the norm and θ̄ = θ̄^σ), so a(θ₀) ≥ 1, and the minimal θ₀ satisfies a(θ₀/θ₀^σ) = a(θ₀). Both Lean headlines still quantify over all vexing primes. | Repaired; R01 is a prose slip in the repaired passage |
| F02 (P2) global type-three not requested | README:215: "prove that the matching ordinary eigenvalue-adorned global quotient … is finite flat Cohen–Macaulay of type three …, including verification of the O-Tor-independent local Cohen–Macaulay factors and the numerical relation bound"; identical sentence in `plan.json` gaps; §§7.2–7.5 (968, 985, 1001, 1017) and Layer 7 Dependencies (1037) condition the unrestricted branch on it. Supplier placement: GL2ModularityLifting at `1e734ab`, §4.2 (rendering 1090–1104) carries the KW-II CM/Gorenstein/CI clause with "dim(B[[x]]) = j+1+r" and the system of parameters including π, the exact shape requested. Orders recomputed: A = O·(1,1,1,1)+πO⁴ has basis 1, πe₁, πe₂, πe₃ with x_ix_j = δ_ijπx_i, A/πA = k[x₁,x₂,x₃]/(x)², socle dimension 3; B = O[t]/∏(t−iπ) has B/πB = k[t]/t⁴, socle dimension 1; both rank 4, generic fibre K⁴. | Repaired |
| F03 (P2) finiteness already owned by PMCS §8.8 | README:9: "PotentialModularityAndCompatibleSystems §8.8 owns O-finiteness of the fixed-character scalar ordinary ring and its eigenvalue-adjoined version, including p = 3"; contract at 205–207; §7.2 Needs (981) and Layer 7 Dependencies (1037). Supplier check: PMCS at `29f6025`, §8.8 "The Calegari–Geraghty finiteness application" (rendering 1735) states O-finiteness of R_φ and of its Frobenius-eigenvalue-adjoined ring for the scalar, twist-minimal, unramified-at-p datum, with PSL₂(𝔽₃) at p = 3 included. Merge order: PMCS line 197, this roadmap line 289, GL2ModularityLifting line 195; no upward edge. The narrowed `gap:scalar-conductor-comparison` (213) no longer asks for finiteness. ≤ 2m-generator Check (978) is correct. | Repaired |
| F04 (P2) Katz witness needs residual modularity | README:277: "Apply ClassicalSerreModularity R27.5/hypothesis-H-and-theorem-9-1 to the standing S-type residual representation to obtain modularity. SerreWeightAndLevelOptimisation §3.13 then supplies its conductor-level Katz weight-one witness"; contract 123; Needs 294; Dependencies 342. Supplier checks: ClassicalSerreModularity at `6c79d1c`, target `R27.5/hypothesis-H-and-theorem-9-1` (rendering 846) states modularity of every S-type ρ̄ and says weight and level are R27.6; SerreWeightAndLevelOptimisation at `c9bed25`, §3.13 (906–912) requires "residual modularity and unramifiedness at p" for its conductor-level existence branch. Order: CSM 187 < 289. S₃ Check recomputed over 𝔽₅: transposition det 4 = −1, 3-cycle trace 4 = −1 and det 1, −108 ≡ 2 mod 5. The Lean headlines carry no modularity-witness hypothesis. | Repaired |
| F05 (P3) tensor determinant | README:862: "the scalar block A=[[2,3],[3,4]] has determinant 4, while the rank-four tensor matrix A⊗I₂=… has determinant 4² = 1 in 𝔽₅". Recomputed: det A = 8−9 ≡ 4, det(A⊗I₂) = 16 ≡ 1; displayed 4×4 matrix is the Kronecker product. | Repaired |
| F06 (P3) dependency summaries | Layer 1 Dependencies (439) now lists `Matrix.charpoly`, `Matrix.aeval_self_charpoly`; Layer 10 (1351) lists "ALS.5b.5–ALS.5b.8 (cuspidal comparison)"; Layer 6 (939) adds "§R15.2 (Eisenstein boundary eigensystems)" consumed by §6.1. Each external input now occurs in its layer summary; I re-compared all eleven summaries against their external Needs lines and found no remaining omission. | Repaired |

### Principles, shape and scope

Read the whole README (54 numbered targets, every API list, Check, proof route and Needs line, all eleven Examples/Dependencies pairs), the Lean file, the manifest and the plan's gaps. No route-specific shortcut, no re-planned roadmap, no copied passage, no computational algorithm, no sorry'd data, no `set_option`, no process narrative, no LaTeX delimiters, no pull-request numbers, no machine paths (mechanical scan: 0 hits each; the six `lemma` hits are the supplier target name `BT.3/lemma-9-6`). The shape matches the upstream form: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–10 each ending in Examples and Dependencies, Downstream consumers, References. Every target has a locator, a Needs line and at least three Checks (mechanical count over all 54). `metadata.toml` is `math.NT`. The Bianchi vexing exclusion is R03.

### Sources and the seeded sample

Both cached texts were read at the locators below; cg22 is settled uncertified and was not requested. Nothing was copied; nothing was added to `sources.toml`.

| Target | Locator opened | Comparison |
|---|---|---|
| 0.3 Dual coherent homology | cg18 lines 1029–1046 (§3.2.4, p. 322) | H_i := dual of H^i with Ω¹⊗L*, i = 0,1; Verdier duality to H^{1−i}; pushforward dual to pullback; non-equivariance of D for ω^n deferred to the twisted map. Matches 0.3–0.4. |
| 1.4 Coherent diamond-cover descent | cg18 lines 1076–1104 (Prop. 3.8 proof, pp. 323–324) | Tor_i^S(H_j(X_Δ),O) ⇒ H_{i+j}(X₀); M_Δ ≅ H₀(X₀)_m; right-exact segment ending in Tor₁ → 0. Matches. |
| 3.3 Scalar local comparison | cg18 lines 1662–1689 (Lemma 3.24, Def. 3.25, pp. 337–338) | Surjection T⊗_{R†}R̃† ↠ T̃ sending α to U_p; J_glob = Ann(T̃/T); J ⊂ J_glob; doubled quotients unramified. Matches 3.2–3.3. |
| 3.4 Three Frobenius cases | cg18 lines 1384–1396 (§3.5, p. 331) and Def. 3.1 at 584–595 | Case 1 uses both ordinary projections and T_p = U_p + ⟨p⟩U_p⁻¹ without assuming T_p ∈ T. Matches. |
| 4.2 Minimal weight-one R = T | cg18 lines 1706–1722 (Thm 3.26, p. 339) | q = dim H¹_∅(ad⁰ρ̄(1)) ≥ 1, S_N = O[(ℤ/p^N)^q], R_∞ with q−1 variables, freeness of H₀(X,ω)_{m_∅}. Matches 4.1–4.2. |
| 4.4 Minimal modularity lifting | cg18 lines 305–312 (Cor. 1.5, p. 304), 288–296 (Thm 1.4), 315 (Serre modularity remark) | The Lean headline assumes Definition 3.1 minimality up to a finite-order twist, which is what Theorem 1.4 proves; Corollary 1.5(1) as printed is weaker (see Source issues). The Serre-modularity remark supports F04. |
| 5.5 High-weight vanishing | cg18 lines 2163–2176 (Cor. 3.29, pp. 349–350) | H¹ = 0 for n > 1 with L_σ, n > 2 with L_σ^sub; base change via the π^m sequence. Matches. |
| 5.6 Hecke with type coefficients | cg18 lines 1957–1972 (§3.9.1, pp. 344–345) | Flatness of π_i gives π_i^*L_σ ≅ (f_*(O⊗W_σ))^G independently of i; correspondences act on invariant pushforwards. Matches. |
| 6.3 Galois with vexing coefficients | cg18 lines 2286–2300 (Thm 3.30 step (4), pp. 353–354) and §3.9 levels 1823–1854 | ρ_Q over T_m with Frobenius traces, η-twist minimal outside Q; embedding into H⁰(X_V)⊗W_σ. V_x at vexing x is the kernel at exponent c_x/2 (R01). Matches. |
| 7.1 Multiplicity character datum | cg18 lines 2586–2600 (Thm 4.8, p. 361) | Twist-minimal conductor, N* = N or Np, T generated by all T_l including p, scalar case multiplicity two. Matches. |
| 9.1 Bianchi diamond-cover datum | cg18 lines 3219–3234 (§5.3.1, p. 376) | Δ_Q = ∏(O_F/x)×, p-power quotient Δ, O[Δ] local, Shapiro H₁(Y₀,O[Δ]) ≅ H₁(Y_Δ,O). Matches. |
| 9.4 Balanced Bianchi homology | cg18 lines 3268–3282 (Prop. 5.10, pp. 377–378) | Balanced via 0 → Tor₁(M,O)/ϖ → Tor₁(M,k) → M_Δ → M_Δ → M⊗k → 0 and r = rank M_Δ. Matches. |
| 10.1 Bianchi Taylor–Wiles system | cg18 lines 3324–3340 (Thm 5.11 and proof, pp. 379–380) | Hypotheses: m_∅ proper, Conjecture A for all Q; q from Prop. 5.2, R_∞ with q−1 variables. The printed untwisted adjoint at line 3334 is the errata item already recorded in round 3. Matches 10.1. |
| 10.5 Minimal semistable lifting | cg18 lines 192–204 (Thm 1.2, p. 301), 225–241 (Thm 1.3, p. 302), 3311–3322 (§5.4) | Semistable, cyclotomic determinant, finite flat/ordinary at v|p, absolutely irreducible over F(ζ_p), modular at N(ρ̄), minimal. Theorem 1.3(4) excludes Bianchi vexing primes (R03). Matches. |
| 10.6 GL/PGL obstruction | cg18 lines 3377–3392 (§5.5, pp. 380–381) | Class group ℤ/p makes T_m expected O[ℤ/p], so R_min → T_m not surjective. Matches; the Kummer exponent refinement is the package's. |

Also opened: Conjecture A at cg18 lines 3145–3162 (clauses (1)–(3) as in §8.4); Theorem 4.8's proof at 2697–2718 (system of parameters including ϖ, R̃ finite over O, matching the new §7.2 route sentence); §3.1 at 569–578 (standing hypothesis ρ̄^{I_x} ≠ 0 and its twist remark).

### Supplier order, ownership and citations

Dependency check, run as the brief prescribes with `--movable`, exact output:

```text
depcheck: 56 roadmaps, 644 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Merge-order positions: IntegralHeckeAndGaloisDeterminants 29, DeformationAndDerivedPatchingAlgebra 72, ArithmeticLocallySymmetricSpaces 77, ModularCurvesPartII 87, LocalGaloisDeformationRings 88, GlobalGaloisDeformations 90, AlgebraicModularFormsAndSerreWeights 104, GL2AutomorphicRepresentationsAndTransfer 105, SerreWeightAndLevelOptimisation 182, AutomorphicGaloisRepresentations 184, ClassicalSerreModularity 187, GL2ModularityLifting 195, PotentialModularityAndCompatibleSystems 197, AutomorphyLiftingBeyondTaylorWiles 281, this roadmap 289. ClassFieldTheory is on main; its open pull requests are revisions and were not used.

Every cross-roadmap citation was resolved again at the cited head through the roadmap service (rendering line numbers; the rendering has a one-line header):

| Supplier (head) | Sections resolved |
|---|---|
| ClassicalSerreModularity (`6c79d1c`) | "Arithmetic interfaces for the theorem statements" (132–140, with `GQ`, `IntBar`, `IsFrobAt`, `IsUnramifiedAt` declared in its `Suggested.lean` at 45, 48, 56, 60); `R27.5/hypothesis-H-and-theorem-9-1` (846) |
| PotentialModularityAndCompatibleSystems (`29f6025`) | §8.8 (1735–1752): O-finiteness of R_φ and its eigenvalue-adjoined ring, p = 3 and PSL₂(𝔽₃)/PSL₂(𝔽₅) included |
| SerreWeightAndLevelOptimisation (`c9bed25`) | §3.4 (720), §§3.10–3.13 (844, 866, 886, 906) |
| GL2AutomorphicRepresentationsAndTransfer (`69bcab7`) | R16.2.7 (697), R16.2.11 (755; conductor equality at 757, 759), R16.3.9 (956; 958, 960, 963), R16.4 (980), R16.6.5 (1291), R16.6.6 (1303) |
| GL2ModularityLifting (`1e734ab`) | §3.7 (1024), §4.1 (1058), §4.2 (1090; KW-II CM clause and parameter count) |
| LocalGaloisDeformationRings (`11b2c65`) | §§2.1–2.5 (1726–1797), §2.19 (2073), §4.1 (2612), §6.7 (3215), §6.18 (3470), §7.5 (3953) |
| GlobalGaloisDeformations (`b0adf32`) | §§3.3–3.7 (408–575), §§5.1–5.8 (1118–1400), Layer R04.6 (1462), §§6.2–6.8 (1507–1731) |
| ArithmeticLocallySymmetricSpaces (`7dca7ea`) | ALS.0.8 (1370), ALS.0.10 with (iv) Y_Δ(Q) (1439–1458), ALS.1 (1658), ALS.2 (2108), ALS.3 (2544), ALS.3.14 (3241), ALS.4 (3302), ALS.4.10 with `LocallySymmetric.IsEisensteinCG` (3656, 3681), ALS.4.12 with neatness and ♠ and clause (b) (3741–3760), ALS.5a.2 (3925), ALS.5a.6 (4070), ALS.5b.5 (4324), ALS.5b.8 (4519) |
| AlgebraicModularFormsAndSerreWeights (`4e550b1`) | R15.1 (159), R15.2 (339) with "Eisenstein boundary eigensystems" (674), R15.3 (698) with "Weight-one T_p with torsion coefficients" (879) and "Twisted duality and the supersingular boundary" (981) |
| AutomorphicGaloisRepresentations (`81e9d0f`) | §§2.8–2.10 (1357–1380), §3.7 (1579), §§4.1–4.6 (1885–1925), §5.1 (2311), §§6.8–6.9 (2666, 2699), §6.12 (2767) |
| IntegralHeckeAndGaloisDeterminants (`1383569`) | §1.3 (2202), §1.6 with "Cayley–Hamilton recognition of isotypic modules" (2596–2598), §§2.1–2.2 (2830, 2895) |
| ModularCurvesPartII (`35be0c8`) | §17.2 (4615) |
| DeformationAndDerivedPatchingAlgebra (`a3b5dea`) | §3.1 (527), §§3.4–3.5 (616, 645), §3.9 (703), §§5.1–5.5 (1020–1087) |
| ClassFieldTheory (main) | Layer 7 (1312), Layer 11 (1683), Layer 12 (1724) |
| AutomorphyLiftingBeyondTaylorWiles | No README exposed by the service; the roadmap is in the merge order (line 281) and its board design (`packages/AutomorphyLiftingBeyondTaylorWiles/design/README.md`) carries BT.3/lemma-9-6 (lines 798, 944). The residual-only extension remains the declared gap. |

The three resolver leads (`LocallySymmetric.IsEisensteinCG`, `TauCeti.SerreConjecture.IntBar`, `IsFrobAt`) are supplier targets or supplier signature definitions, as above; the acceptance test imports none of them. No cited roadmap exists nowhere.

Ownership of the two new gap deliverables was checked by object through the roadmap service over main and the indexed open heads and the board index: the norm-twisted compact type has no owner besides GL2AutomorphicRepresentationsAndTransfer's conductor-equality branch (the only "norm twist" hits elsewhere are Hecke-character material in LFunctions); the global type-three statement has no owner (the only Cohen–Macaulay type-three hits are LocalGaloisDeformationRings §6.18, the local ring). Both gaps therefore ask for something not provided. Ownership against open pull requests that the service does not expose (AutomorphyLiftingBeyondTaylorWiles) was not checked beyond its board design.

### Declared supplier gaps

All twenty slugs have identical supplier and `needs` sentence in README and `plan.json` (mechanical comparison, 20/20), every slug used in a Needs line is declared, and every declared slug is consumed by at least one Needs line. No supplier is `none`. The two gaps added at the package stage: `vexing-norm-twist-selector` is precise (character decomposition, conductor condition on θ₀, inflation level n, lattice, contragredient convention, multiplicity-one clause), minimal (GL2ART R16.2.11/R16.3.9 stop at a(θ/θ^σ) = a(θ)) and placed at the earlier owner; `scalar-variable-global-type` is one theorem with its hypotheses (scalar, unramified at p, twist-minimal, the variable-determinant family, full support) and its two internal verifications, minimal (no owner found), placed at GL2ModularityLifting §4.2 whose KW-II clause has exactly that shape. `scalar-conductor-comparison` was narrowed to the presentation, numerical bound and component comparison; its finiteness part now comes from PMCS §8.8.

### Pinned declarations opened

Pins from `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (both confirmed as the checked-out revisions).

| Pinned file and line | Checked | Consequence |
|---|---|---|
| `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104,134` | `Newform` extends `EigenformAwayFromLevel` with `isNew` and `isNorm`; `dirichletLift` is the nebentypus as a Dirichlet character | The headline's determinant clause reads the nebentypus at ℓ; weight is the integer 1 |
| `…/Newforms/StrongMultiplicityOne.lean:96` | equality from equal nebentypus and equal eigenvalues at all primes coprime to N | Supports R02's non-blocking classification |
| `…/ModularForms/Eigenform.lean:65` | `IsEigenformAwayFromLevel` existential eigenvalue family at good indices | Alone admits the zero form, as the README says |
| `TauCeti/Algebra/MonoidAlgebra/Exactness.lean:115,120` | `augmentation`, `augmentation_single` for a monoid | Coefficient sum; [g] ↦ 1 |
| `TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean:51,74` | density and infinitude of the Frobenius set of a conjugacy class | Used in §0.1 |
| `Mathlib/RepresentationTheory/Homological/GroupHomology/Shapiro.lean:65` | `groupHomology.indIso` | Shapiro only; no boundary vanishing |
| `Mathlib/RingTheory/Frobenius.lean:54,200` | `AlgHom.IsArithFrobAt`, `mul_inv_mem_inertia` | Arithmetic direction; inertia coset |
| `Mathlib/RingTheory/Ideal/Defs.lean:154,157` | `Ideal.inertia`, `mem_inertia` | Difference criterion |
| `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:54,87` | `scalar`, `scalar_commute` | Twist is a homomorphism |

### Computed adversarial table

Values below were recomputed by hand and in an isolated scratch script (character sum, determinants, socles, S₃ matrices, pairing determinants, 𝔽₂₇ Frobenius, Hensel derivatives, 𝔽₁₉ Kummer powers). Conditional inputs stay conditional; rows are tests of the stated formulas and Checks, not proofs of the planned theorems.

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| Lean `IsMinimalLift` vs cg18 Def. 3.1 | the four clauses | (1) det^{|k|−1} = 1 ↔ Teichmüller (Hensel, p ∤ |k|−1); (2) unramified outside S(ρ̄); (3) reduction injective on ρ(I_x) ↔ ρ(I_x) ≅ ρ̄(I_x); (4) rank-one direct summand at ramified reducible D_x (a reducible D_x is never vexing, so S−T is automatic) | Clause-by-clause agreement | Retain |
| Lean modularity headline vs Cor. 1.5 | ρ|I_x = Teich(χ̄)ψ ⊕ 1, x ≡ 1 mod p, ψ of order p | Cor. 1.5(1): dim ρ^{I_x} = 1 = dim ρ̄^{I_x} holds; any twist μ with rank-one invariants has μ ∈ {1, (Teich(χ̄)ψ)⁻¹}, whose determinants Teich(χ̄)ψ, Teich(χ̄)⁻¹ψ⁻¹ are not Teichmüller; so no Definition-3.1 twist exists | Package's minimality-up-to-twist is what Theorem 1.4 proves; source's (1) overreaches | Source issue; retain |
| Lean headline prime set | ℓ = p with p ∤ N | Comparison at p true (ρ unramified at p, N prime to p) but excluded by `N * p` | Statable, omitted | R02 |
| Twist conventions | diag(2,3), η = 2 over 𝔽₇ | twist diag(4,6): trace 3 = 2·5, det 3 = 4·6; η⁻¹ = 4 since 2·4 = 1 | Laws hold | Retain |
| Oddness after twist | η of finite order, c² = 1 | η̄(c)² = η̄(c²) = 1, so det(η̄ρ̄)(c) = det ρ̄(c) = −1 | Hypotheses on ρ̄ and η̄ρ̄ consistent | Retain |
| 0.2 S₃ datum | X³−2 over 𝔽₅ | transposition det 4 = −1; 3-cycle trace 4 = −1, det 1; −108 ≡ 2 mod 5; ramified at 2 (D₂ = S₃ irreducible, 2 ≢ −1 mod 5) and 3 (I₃ = S₃ irreducible): no standing condition triggered | Odd, absolutely irreducible, unramified at 5 | Retain |
| 0.2 coefficient | j = 1, x = 2, n = 1, ⟨2⟩ = 3, a₂ = 4, a₀ = 1 | guarded 4; unguarded 4 + 3 = 7 | Guard needed | Retain |
| 0.3 degrees | L = ω, i = 0, 1 | H₀ = H¹, H₁ = H⁰ (cg18 line 1030) | Shift correct | Retain |
| 1.2 selected root | x = 1, roots (1,2) and (1,1) over 𝔽₅ | pairing det 4·2 − 9 ≡ 4 = −(1−2)²; repeated: 0 | Distinct roots essential | Retain |
| 1.3 harmless multiplicity | x = 2, roots (1,1); (2,1) over 𝔽₅ | det 3 = 2⁻¹(1−2)²; (2,1): 0 since α = xβ | Forbidden ratio detected | Retain |
| 1.4 descent | Δ = 1; k over O[C₃] | Tor₁ = 0; Tor₁ = k | Edge term needed | Retain |
| 2.1 Hasse matrix | T = 0, ⟨p⟩ = 3 | U(0,1) = (3,0); U² = −3I | Column convention | Retain |
| 3.3 normalization | c = 2, U_p = 6 over 𝔽₇ | c⁻¹U_p = 4·6 ≡ 3 | Normalized eigenvalue | Retain |
| 3.4 Frobenius cases | diag(1,2), [[1,1],[0,1]], I over 𝔽₅ | (trace, det) = (3,2), (2,1), (2,1); eigenspace dims 1 vs 2 | Discriminant cannot split cases | Retain |
| 3.5 square root | 4 in 1+3ℤ/9 | unique root ≡ 1: 7 (7² = 49 ≡ 4) | p odd needed | Retain |
| 4.2 R = T | R = T = k, H = k; H = 0 | free rank 1, annihilator 0; H = 0 annihilator R | Nonzero H needed | Retain |
| 4.4 Frobenius comparison | diag(2,3) over 𝔽₇ | a_ℓ = 5, nebentypus 6; inverse convention 5/6 = 2, 1/6 = 6 | Arithmetic direction fixed | R02 (ℓ = p only) |
| 5.1 selector datum | x = 5, p = 3, θ₀ order 8, λ order 5, a(λ) = 2 | a(θ) = 2, a(θ/θ^σ) = 1, a(Ind θ) = 4; m_x = 1, n_x = 2 = c_x/2; θ₀⁻⁴ nontrivial on 𝔽₂₅×, θ₀⁴ trivial on 𝔽₅×; torus sum 16 − 20 + 4 = 0; twisted Hom 1 | Witness correct; level equals source's | R01 |
| 5.1 generality | a(λ) <, =, > a(θ₀) | a(θ) = a(θ₀), a(θ₀), a(λ) respectively; always max | n_x = c_x/2 | R01 |
| 5.5 thresholds | n = 2 full; n = 2 sub | dual obstruction cusp weight 0 → 0; full weight 0 → constants | n > 1 vs n > 2 | Retain |
| 5.6 transpose | diamond 2 over 𝔽₇ | transpose 4, twice 2 | Inverse diamond | Retain |
| 6.1 tensor determinant | A = [[2,3],[3,4]] over 𝔽₅ | det A = 4; det(A⊗I₂) = 16 ≡ 1; displayed 4×4 is A⊗I₂ | Both units | Retain (F05 repaired) |
| 6.3 typed representation | x = 5, p = 3 datum | twisted type Hom 1; untwisted-type Hom 0 | Norm twist needed | Retain |
| 7.1 characters | Φ = C₃; C₂ | squaring permutes (0,1,2) ↦ (0,2,1); on C₂ both squares trivial | p odd | Retain |
| 7.2 integral type | A, B rank-four orders | socles 3 vs 1, equal length 4, equal generic fibre K⁴ | Generic data insufficient | Retain (F02 repaired) |
| 7.2 parameter count | B[[z₁..z_g]] ↠ R̃^□, r relations, j framings | dim B + g = j + 1 + r ↔ (relations, framings, π) a system of parameters; cg18 line 2717 | Matches GL2ML §4.2 | Retain |
| 7.2 finiteness | m generators of R_φ | R̃_φ ≤ 2m generators; quotient ≤ 2m | PMCS §8.8 suffices | Retain (F03 repaired) |
| 7.4 multiplicity | Gross bounds | {3,4} ∩ 2ℤ = {4}; 4/2 = 2 | Correct | Retain |
| 8.1 Bianchi datum | N(x) ≡ −1, D_x irreducible, I_x reducible | not S, P, M (needs N(x) ≢ −1) or H | Excluded, as cg18 Thm 1.3(4) | R03 |
| 8.5 Hensel | roots 2, 4 of X²−6X+1 over 𝔽₇ | both roots check; derivatives 5, 2 units; repeated root derivative 0 | Distinct roots | Retain |
| 9.1 Shapiro | Δ = C₃ | regular module rank 3; coinvariants rank 1; augmentation [g] = 1 | Matches cg18 line 3234 | Retain |
| 9.3 stabilizers | C₃ at p = 3; F = ℚ(i) | H₃(C₃,𝔽₃) dim 1 vs 0 for a point; unit order 4 invertible mod 3 | Separate hypotheses | Retain |
| 9.4 defect | Δ = 1, M = Oʳ ⊕ kˢ | Betti (r+s, s), d = r | Matches Prop. 5.10 | Retain |
| 10.1 variables | q = 1 | A_∞ = O; S_a one augmentation variable | No negative count | Retain |
| 10.3 CI | q = 1, f₁ = π²; f₁ = 0 | O/π² dim 0 length 2; O dim 1 fails hypothesis | Dimension hypothesis needed | Retain |
| 10.5 O-point | π-killed T | π ↦ 0 in T but π ≠ 0 in O | Nonzero generic fibre forced | Retain |
| 10.6 Kummer | 𝔽₁₉× = ⟨2⟩, α = 2³ = 8 | α⁶ = 1, α² = 7 ≠ 1 | Ninth-power test needed | Retain |
| 𝔽₂₇ Frobenius | t³ = t + 1 | t³ = t+1, t⁹ = t+2 | Directions distinguished | Retain |
| Gap sync | 20 slugs | README supplier/needs = plan supplier/needs, 20/20; all consumed | Declared where read | Retain |

### Headline coverage, elaboration and padding

Headlines and their treatment are unchanged from round 3 and were re-read against the module docstring: the two statable headlines (minimal weight-one modularity lifting and finite image, both twist-general and including vexing primes) are stated; balanced coherent homology, Hasse doubling, torsion local–global compatibility, minimal R = T with and without types, type-bundle freeness and cusp duality, global scalar type and twisting, scalar multiplicity two, localized Bianchi amplitude and balancedness, conditional Bianchi R = T, dimension-zero complete intersection and generic rank, and minimal semistable Bianchi lifting are each named in the docstring with the missing carrier. I confirmed by object search at the pins that no Katz torsion module, Jacobian torsion with Galois action, arithmetic Bianchi homology or minimal deformation ring exists there.

`lake env lean` on the package's `Suggested.lean`, run from the content checkout: exit 0; the only output is the two `declaration uses sorry` warnings at lines 136 and 178 (19 s; the Tau Ceti Newform object file was present, no build needed). A scratch copy with `#check @name` for all nine declarations elaborated the nine types; the explicit DVR, finite ℤ_p-algebra, characteristic-zero, local-map, completeness, finite-residue-field and characteristic binders, and for the CNL theorem Noetherianity and the commuting residue identifications, all survive; both theorems keep continuity of ρ and η, finite image and unramifiedness-at-p of η, and the normalized residual/minimal conditions. (One extra `#check` of a projection name I guessed wrongly errored; it is my scratch line, not a package declaration.) No binder change is needed. The one-tactic probe (`simp`, `rfl`, `infer_instance`, `exact Set.finite_range _`, `exact Set.toFinite _`) closes neither headline. Seven real-bodied definitions, two admitted theorems, one `import Mathlib` plus the one used Tau Ceti module, no `lemma`, no `set_option`, no sorry'd data, no examples. No padding.

## Not verifiable

- **cg22, pp. 855–856:** settled as `uncertified` in the manifest; cited by locator only; not requested again.
- **cg20 published pagination:** the cached author PDF has no final pagination; Lemma 8.14 was not in this round's sample and the published pages 865–866 were not independently checked.
- **AutomorphyLiftingBeyondTaylorWiles at an open head:** the roadmap service exposes no README; BT.3/lemma-9-6 was resolved in the board design only. Ownership against that open pull request beyond its design was not checked.
- **The meaning of "(16−20+4)/24" in §5.1's Check:** the arithmetic is verified; its description as "the even-conductor construction applied directly to θ" is not derivable from the README or the supplier text (R01).

## Source issues

- **Gap** in cg18 at Corollary 1.5, p. 304 (cg18 lines 305–312): the source says modularity of weight one follows from Theorem 1.4 under Diamond's invariant-dimension condition with no determinant clause; it should require Definition 3.1 minimality up to a finite-order twist, since a lift with inertial characters Teich(χ̄)ψ ⊕ 1 at x ≡ 1 mod p, ψ of p-power order, satisfies (1) but admits no twist with Teichmüller determinant and rank-one invariants; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d6cdad7", "job": "REV-PKG-GL2ModularityLiftingPartII~4", "model": "fable", "worker": "fable-rev116"} -->
