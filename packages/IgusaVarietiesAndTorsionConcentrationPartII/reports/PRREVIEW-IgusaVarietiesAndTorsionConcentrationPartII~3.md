# Review of IgusaVarietiesAndTorsionConcentrationPartII (pull request #2439 at 744b2d9)

**Verdict:** accepted

No findings. The head is the one the previous review read (0 changed lines); that review listed no finding, so there was none to check for repair. Everything below was recomputed on this head.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §8.1 SV3 criterion | `n = 1`; `n = 2` with `(1,1)`; `n = 2` with `(2,0)/(0,2)` | `G^ad` trivial, SV3 vacuous. `h = diag(z, z̄)`, adjoint acts by `z/z̄ ≠ 1`, `d = 1`. `h` scalar, `G^ad(ℝ)` compact, SV3 fails | true |
| §8.1 quaternion example | `D` ramified at `{5, ∞}`, `F = ℚ(i)` | `5 = (2+i)(2−i)` splits, so index 2 at both places; `β = i` gives `β* = −β` and a definite form: signatures `(2,0)`, `(0,2)` | Case 1 datum exists |
| §8.3 central translation | `n = 2`, `S_i = {τ, τ′}`, `(1,1)` and `(2,0)`, `c_i = 1` | Shapiro bound `diag(t², t)`: `κ = −3`. `μ_{i,τ}⁻¹`: `κ = −1`. Scalar `p`: determinant valuation `2`; `−3 + 2 = −1` | true; without it false |
| §8.3 `μ`-ordinary point | same example | `(μ⁻¹)_dom = ((0,−1),(−1,−1))`, average `((−½,−1),(−½,−1))`; `⟨2ρ,·⟩`: `1 + 0 = ½ + ½ = 1 = d` | true |
| §8.4 Satake image of `P_v` | general `n`; `n = 2` | `T_i ↦ q^{i(n−i)/2} e_i`; `i(i−1)/2 + i(n−i)/2 = i(n−1)/2`, so `∏(X − q^{(n−1)/2}x_j)`. `n = 2`: `e_2 = q·x_1x_2 = q·S(T_2)` | true |
| §8.5(1)–(2) dual roots | general `n`; `n = 2`, `q_v = 7`, `ℓ = 11`, roots `{1,2}` | Exponent `i(i−1)/2 + n(n−1)/2 − (n−i)(n−i−1)/2 = i(n−1)`. `(T_1, T_2) ≡ (3, 5)`; dual `(5, 9)`; `X² − 5X + 8`, roots `{7, 9}` | true |
| §8.5 hypothesis `q ∉ 𝔪` | `deg`, `q = 5`, `n = 2`; `𝔪_5`, `𝔪_3` | `deg P_v = X² − 6X + 5`. Mod 5: roots `{0,1}`, rule undefined. Mod 3: `{1,2} ↦ {2,1}` under `λ ↦ 2λ⁻¹` | hypothesis needed |
| §8.6 duality (sampled) | `d = 0`; `ℓ ∉ 𝔪`; `𝔪 = deg⁻¹(ℓ)` | Finite set: `T`, `ι(T)` transposes. Both sides `0`. `deg ∘ ι = deg`, so `𝔪^∨ = 𝔪`: `H⁰`, `H^{2d}` both carry it | true |
| §8.7 strong genericity (sampled) | `q_v = 7`, `ℓ = 11`: `{3,3}`, `{1,2}`, `{1,7}`; `n = 1` | `{3,3}`: ratio `1` fails, `3 ≠ 21 ≡ 10` weak holds. `{1,2}`: ratios `2, 6`. `{1,7}`: ratio `7`. `n = 1`: no pairs | true |
| §8.7 dependence on `u` | `ρ̄ = 1 ⊕ χ ⊕ χ²`, `χ(Frob) = 2` at `𝔭_1`, `1` at `𝔭_1^c` | Through `u`: `{1,2,4}`, ratios `{2,4,6,3}`, none in `{1,7}`. Through `u^c`: `{1,1,1}`, ratio `1` | existential form needed |
| §8.8(a), Lean `infinite_setOf_isCompletelySplitStrongGenericPrime` | `n = 0, 1`; `L` ramified above `p₀` with inertia in `ker r`; `ℓ = 2` | Pair condition empty: splitting, `p ≠ ℓ`, `r` unramified. `L_r` unramified at `p₀`. Same class: `p ≡ p₀` mod `ℓ`, Frobenius in `Gal(L̃/F̃)` | true |
| §8.8(b), Lean `infinite_setOf_isStrongGenericAt_degree_one` | `v₀` of degree `f > 1`; `F = ℚ` | Class in `Gal(L_r(ζ_ℓ)/F)` fixes `r(Frob)` and `q_v` mod `ℓ` (`q_{v₀} = p₀^f`). Density `#C/[L_r(ζ_ℓ):F] > 0` on degree-one primes | true |
| Lean: implication to the supplier predicate | `IsCompletelySplitStrongGenericPrime` versus `FiniteModelDecomposedGenericPrime` | `ncard = [F:ℚ]` forces `e = f = 1`, `#(𝓞 F/v) = p`; `ℓ ∉ v` gives `p ≠ ℓ`. Converse fails at `{3,3}` | implies, not conversely |
| §8.9 integral localization | `ℤ[T]/(T⁴−1)`, `ℓ = 5`, `𝔪 = (5, T−2)` | `i ≡ 2`. On the `−i`-line `T + 2` acts by `2 − i ≡ 0` mod 5, nonzero. Ordinary: `ℤ_5 ⊕ ℚ_5`; idempotent: `ℤ_5` | true |
| §9.2 Newton reduction (sampled) | `GL_2`, basic class, `J_b = D^×` | Irreducible `Ind`: `LJ = 0`. Trivial representation: `1 = Ind − St ↦ 0 − 1_{D^×} ≠ 0` | genericity needed |
| §9.3 spectral expansion (sampled) | `φ_p = 0`; two terms with coefficients `1, −1`; `n⃗ = (1,1)` | Both sides `0`. Total coefficient `0`, (2) silent. Archimedean characters `(z/z̄)^{(±1−m)/2}`, `m` odd: distinct, not both trivial | true |
| §9.4 `r`-part | `n = 2`, `q_v = 7`, trivial `Π⁰_v` | Satake `(√7, 1/√7)`, scaled `(7, 1)`; `X² − 8X + 7`; `S(T_1) = 8`, `S(T_2) = 1` | true |
| §9.5 / §9.6 | `GL_2`, signature `(1,1)`; definite `G_ℝ` | Ordinary: slopes `(−1, 0)`, `J_b = GL_1²`. Basic: slope `−½`, `J_b = D^×`. Definite: one class, statement empty | true |
| §10.1 proper endoscopic terms vanish (sampled) | `n = 2`, `n⃗ = (1,1)`, `d_v = 2`; central `γ` | `d_v ∣ m_ie_i` (index `d_v/gcd(d_v,e_i)` divides `m_i`); `deg P_1 = 1`, not a multiple of `2`. Central: `(X−γ)^n`, `e = 1`, `m = n` | true |
| §10.1 local factor at the chosen `v` | `v` not split over `F⁺` | Corestriction preserves local invariants, so a second-kind involution forces `inv_v(B) = 0` there; `d_v > 1` only at split `v` | factor is `GL_{n/d_v}(D_v)` |
| §10.2 stable Lefschetz identity (sampled) | `n = 1`, `ℚ(i)`; compact Shimura curve | Reduced pair: `ep(1) = 1`; full pair `1 − 1 = 0`. Curve: `ep(1) = 2` for `K_∞`, `1` for `K_max` | conventions pinned |
| §10.3 Matsushima formula (sampled) | Harris–Taylor; one-dimensional `π_∞` | `dim G(ℝ)/K_∞ = n² − 1 − (n−1)² + 1 = 2(n−1) + 1`; `q(G) = n − 1 = d`. `∏binom(n, p_τ) = n` | true |
| §10.4 Galois representations (sampled) | `n = 1`; `n = 2` | `∏(X − q_v^{(n−1)/2}x_j)`: `X − x`; `X² − q^{1/2}(x_1+x_2)X + q·x_1x_2`, equal to the image of `P_v` | true, on the gap |
| §10.5 `r`-part (sampled) | two `π_f` with opposite `c(π_f)`; `n = 2` trivial factor | Sum `0` although each term is nonzero. Eigenvalues `7, 1` | sub-sum form needed |
| §10.6 (sampled) | definite `G_ℝ`; `GL_2` factor | `B(G, μ⁻¹)` one point, statement empty. Basic factor excluded by §9.2 with `n⃗ = (n)` | true |
| §11.2(c) self-dual lattice in `V ⊕ V` | `t̄t = −1`, `e = (1,t)`, `f = (1,−t)/2`; pro-`q₁` Iwahori | `H(e,e) = 1 + t̄t = 0`, `H(f,f) = 0`, `H(e,f) = (1+1)/2 = 1`. `∏(u_j − 1) = q₁E_{11}` | true |
| §11.5 Galois representations (sampled) | `q ∈ Ram(ϖ) ∖ (S ∪ {p,ℓ})`; two auxiliary primes | One construction is silent at `q`; a second with `D = {q}`, `p ≠ q` agrees on density one. Two primes remove `p`, not `Ram(ϖ)` | true, on the gaps |
| §11.6 concentration (sampled) | Worked example `d = 2`; `d = 0`; dual roots `{7,9}` | Minimal `b` ordinary gives `d_b = 2`, so every contributing `d_{b′} ≥ 2`, hence `= 2`. `d = 0`: only `H⁰`. Ratios `2, 6` | true |
| §11.7 Theorem 1.1 (sampled) | `F⁺` real quadratic, `p` split or inert in `F⁺` | Split: `(e,f,g) = (1,1,4)`, (2) asks four primes, auxiliary pair one. Inert: `(1,2,2)`, outside (2), reached by §11.6 | true |
| §11.8 integral and twisted forms (sampled) | `𝔪 ∋ ℓ`; `𝔪_2 ∌ 3`; `V = 𝔽_ℓ`, `K′ = K` | `H^i(ℤ_ℓ)_𝔪/ℓ ↪ H^i(𝔽_ℓ)_𝔪 = 0`, Nakayama on a finite module. Ordinary localization at `𝔪_2` is `ℚ_3`. (2) is §11.6 | true |

- Source locators checked against the text: 62 (CS17 50, Shin11 6, Shin09 3, Shin12 1, Shin-BCU 2), among them every locator of the fifteen sampled targets. All agree; the misprints the README corrects are under Source issues.
- Library declarations opened at the pins: 14. Mathlib `IsArithFrobAt` (`RingTheory/Frobenius.lean:41`), `Ideal.inertia` (`RingTheory/Ideal/Defs.lean:154`), `Ideal.LiesOver` and `Ideal.primesOver` (`RingTheory/Ideal/Over.lean:128`, `:379`), `NumberField.IsCMField` (`CMField.lean:70`), `HasDirichletDensity` (`DirichletDensity.lean:81`), `HeckeRing` (`HeckeRing/Defs.lean`); Tau Ceti `instRingHeckeRing` (`HeckeRing/Associativity.lean:484`), `HeckeAntiInvolution.ofAmbient` (`Commutativity.lean:135`), `hasDirichletDensity_frobeniusPrimeSet` and `infinite_frobeniusPrimeSet` (`Chebotarev/Density/Chebotarev.lean:51`, `:74`), `hasDirichletDensity_inter_compl_higherDegreePrimes_iff` and `HasDirichletDensity.infinite` (`DirichletDensity/Negligible.lean:254`, `:101`), `mem_frobeniusPrimeSet_mk_iff_exists_isArithFrobAt` (`Chebotarev/FrobeniusPrimeSet.lean`).
- Cross-roadmap citations resolved: 137 sections or named targets in 19 roadmaps, on main or at their open heads; the bodies of 30 were read against what the README assumes of them (parent §§3.17, 4.4, 4.5, 5.1, 5.2, 5.4, 5.5, 7.6; EndoscopicTransferAndUnitaryTraceComparison §§6.3, 6.8, 6.9, 6.15, 6.25, 8.11, 10.32, 14.2; AutomorphicGaloisRepresentationsPartII AG2.2 and AG2.7 targets; BunGAndNewtonStrata §§1.30, 1.32; PerfectoidShimuraVarieties §2.2; AlgebraicModularFormsAndSerreWeights §5.10). `LocallySymmetric.FrankeInput` is the hypothesis ArithmeticLocallySymmetricSpaces ALS.5b.4 names on main.
- Gate at 744b2d9: every check passed. Dependency check: `depcheck: 256 roadmaps, 2432 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changes outside the roadmap folder.
- Elaboration of `Suggested.lean`: two `sorry` warnings (lines 83 and 98), nothing else. `#check @` types of the 4 declarations compared with §§8.7–8.8: no binder lost, generality equal. One-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`) closes neither theorem; no padding. Every other headline needs carriers absent at the pins, and the module docstring names them.
- Declared gaps: the 3 slugs agree between `design/plan.json` and the README; each names its supplier section, and the supplier text read (§6.3 gives only finiteness of `Ram_ℚ(ϖ)`; AG2.2 assembles rank `2n` with `B = F`; the AG2.7 export keeps the supercuspidal summand only) does not already provide them. The acceptance is conditional on these gaps.
- Pull request text: title, summary block and prose read against this head; no sentence is contradicted, and the text says the pull request adds the folder with its three files.
- Shape: README sections in order; every definition has its API and at least four Checks; Layers 8–11 each end with Examples and Dependencies.

Overlap check: read IgusaVarietiesAndTorsionConcentration, AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison, TorsionCohomologyInfrastructure, PotentialAutomorphyInfrastructure, ArithmeticLocallySymmetricSpaces, ArithmeticGaloisRepresentations. Shared objects and owners: the local strong-genericity predicate and the weak existence theorem, AG2.7 (this roadmap owns the global finite-realization predicate and its strong existence theorems, and says how they differ); `θ`, `ϖ`, the stable–twisted identity and Newton reduction, EndoscopicTransferAndUnitaryTraceComparison; rank-`2n` Hecke algebra, dual ideal and Igusa duality, the parent (the rank-`n` compact forms here are named as variants); Shin's compact datum, AG2.1a (one Case 2 datum of §8.1). No other roadmap states [CS17] Theorems 5.5.7 or 6.3.1 or Corollary 5.6.3.

Source independence: 22 passages compared with 5 sources, none shared beyond formulas and hypothesis lists the mathematics forces (longest common run 5 words); largest share CS17, 76 of 95 citations; contents compared with CS17: independent (Layer 8 draws on its §§5.1, 5.4, 6.2, 6.3 and introduction, Layer 9 merges §§5.2–5.5, Layer 11 splits the proof in §6.3; only Layer 10 ↔ §5.6, its order forced by the Needs lines 10.1 → 10.2 → 10.3 → 10.5 → 10.6).

## Not verifiable

- none

## Source issues

- **Misprint** in CS17 at §5.3, printed p. 736: the source writes `g^♯` as `Φ_n⃗ ᵗg^c Φ_n⃗⁻¹`, which reverses products; it should be `Φ_n⃗ ᵗ(g^c)⁻¹ Φ_n⃗⁻¹`; affects nothing.
- **Misprint** in CS17 at Theorem 5.5.7, printed p. 747, and Corollary 5.6.3, printed p. 750: the source defines `S_i` through `ι_p ∘ τ` with `ι_p` from `ℚ̄_p` to `ℂ`, a composite that is not defined; it should be `ι_p⁻¹ ∘ τ`; affects nothing.
- **Misprint** in CS17 at Theorem 5.5.7, printed p. 747: the source states the vanishing for the base change `BC^p`; it should be `BC^S`, the base change outside `S` that its proof uses; affects a stated result.
- **Misprint** in CS17 at Lemma 5.4.3, printed p. 741: the source states the conclusion for `Red^b_n⃗(π_p)`; it should be for the representation `π^n⃗_p` of the hypothesis; affects nothing.
- **Misprint** in CS17 at Theorem 6.3.1(1), printed p. 757: the source writes the similitude factor of `G(ℚ_q)` and of `T_{i,v}` as `ℚ_p^×` and `ℤ_p^×`; it should be `ℚ_q^×` and `ℤ_q^×`; affects nothing.
- **Misprint** in CS17 at §5.6, printed p. 749: the source cites Lemma 6.4 of Shin's 2011 paper for the extension from acceptable functions; it should be Lemma 6.4 of Shin's 2009 paper, as on its p. 743; affects nothing.
- **Error** in CS17 at §5.1, printed p. 730: the source says the unitary PEL datum always gives a Shimura datum in the sense of its §2.1; it should exclude signatures definite at every place in rank at least two, where the adjoint real group is compact; affects the proof.
- **Error** in CS17 at Lemma 5.5.1, printed p. 742: the source says every `Π^n⃗_∞` is cohomological for the trivial representation; it should be for the coefficient systems `Ξ(φ_n⃗)` of its p. 737, trivial only when `n⃗ = (n)`; affects nothing.
- **Gap** in CS17 at the proof of Theorem 5.5.7, printed p. 748: the source identifies `B(G_i, μ_i⁻¹)` with `B(GL_n/F_{𝔭_i}, μ_{i,τ}⁻¹)` directly; it should first translate by a central power of `p` when `S_i` contains embeddings of signature `(n, 0)`; affects the proof.
- **Gap** in CS17 at the proof of Theorem 6.3.1, printed p. 758: the source deduces nonvanishing at infinite level in the same least degree from Hochschild–Serre; it should claim only some degree at most that one, since `K_p` is hyperspecial, not pro-`p`; affects the proof.
- **Misprint** in CS17 at Remark 6.3.3, printed p. 758: the source says a single embedding has `p_τq_τ ≠ 0`; it should be the two embeddings `τ₀` and `τ₀c`, of which one lies over the chosen place of `𝒦`; affects nothing.

## For the human reviewers

- none
