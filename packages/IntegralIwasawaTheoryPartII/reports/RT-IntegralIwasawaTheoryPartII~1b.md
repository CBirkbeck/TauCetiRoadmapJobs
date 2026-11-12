<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13146#issuecomment-6791903053 -->
Red team round 1 pass b (claude) of 1ccbef4

Verdict: needs_changes

1. **F01** (P1) 2.5–2.6 are false for `R′ = ∅`, `𝔫 ≠ 1`: the coefficient of `E(χ, 1)` lacks the tame-conductor factor

   **Location.** `packages/IntegralIwasawaTheoryPartII/README.md:487` (2.4, "`W = (ℒ_χ/ℒ_{χ⁻¹}) · L(χ⁻¹, 0)/L(χ, 0)`"), `:499` (2.5, "`+ E(χ, 1) W`"), `:518` (2.6, "when `R′ = ∅` the paired family removes `η = χ` as well").

   **Claim.** With this `W`, there is `t ∈ T̃_(1)` with `t·e·F̃` cuspidal and `ν_1(t)E_1(1, χ_S) = E_1(1, χ_S)`; the component along the pair `η = χ` is removed by "the paired family".

   **Witness.** DDP11 lines 1211–1233 (Proposition 2.7, p. 467) and 1304–1306 ((79), p. 469): the coefficient of `E_k(χ, ω^{1−k})` in `e(E_1(1, χ)G_{k−1})` is `L(χ⁻¹, 0)/L_p(χ⁻¹ω, 1−k) · ⟨N𝔫⟩^{k−1}`, obtained at the cusps of DDP11 (58) when `𝔫 ≠ 1`, not from the standard constants (those of `E_k(χ, ·)` are `0` when `𝔣_χ = 𝔫 ≠ 1`, README 2.2a last API bullet). Hence the `E_k(χ, ω^{1−k})`-coefficient of `ν_k(e·F̃)` is `ν_k(W)(1 − ⟨N𝔫⟩^{k−1}) ≠ 0` for `k ≠ 1`. An operator `t` killing the family `E(χ, 1)` acts on `E(1, χ)` by a scalar in `πΛ_(1)`: the eigenvalue pairs of the generators on `(E(χ,1), E(1,χ))` are `(χ(λ)+ε(λ), 1+χε(λ))`, `(ε(𝔩), 1)` for `𝔩 | 𝔫`, `(1, 1)` for `𝔮 | p`, all congruent modulo `π`. So no `t` with `ν_1(t)E_1(1,χ_S) = E_1(1,χ_S)` exists. Instance: `F = ℚ`, `H = ℚ(√−3)`, `p = 7` (`𝔫 = (3)`, `R′ = ∅`, `r = 1`, `⟨3⟩^{k−1} ≠ 1`); also the README's own example `H = ℚ(i)`, `p = 5` (`𝔫 = (4)`). Over `F = ℚ` every instance has `𝔫 ≠ 1`. DKV16 lines 608–635 ((29)–(31), pp. 848–849) omit the factor; the README copies that.

   **Repair.**

   1. In 2.4 replace the definition of `W` by: "`W = ε(𝔫)^{±1} · (ℒ_χ/ℒ_{χ⁻¹}) · L(χ⁻¹, 0)/L(χ, 0) ∈ Frac(Λ)`, where `ε(𝔫) = ∏_{𝔩 | 𝔫} ε(𝔩)^{v_𝔩(𝔫)} ∈ Λ^×` has `ν_k(ε(𝔫)) = ⟨N𝔫⟩^{k−1}` and `ν_1(ε(𝔫)) = 1`, the exponent being the one for which `ν_k(W)` is the coefficient `a_k(χ, ω^{1−k})/a_k(1, χω^{1−k})` of the new target below (Dasgupta–Darmon–Pollack Proposition 2.7, p. 467, and (79), p. 469, print `+1`; the exponent is to be derived from the constant-term formula, since Proposition 2.3 as printed gives `−1`)". Since `ε(𝔫)` is a unit congruent to `1` modulo `π`, the valuation `s − t`, `w`, `c`, the three Artin algebras and all of Layers 3–5 are unchanged; add the sentence saying so. Interchanging `χ` and `χ⁻¹` still inverts `W`.
   2. Add a target before 2.6 (for instance 2.5a), "Constant terms at the tame cusps": for `R′ = ∅`, `𝔫 ≠ 1` and every `k ≥ 3` near `1`, with `A` the matrices of DDP11 (58), p. 462: `c_λ(0, E_k(η, ψ)|A) = 0` for the ordinary pairs unless `(η, ψ) = (χν⁻¹, ω^{1−k}ν)` with `ν` of conductor `1`; the value in that case; `c_λ(0, E_1(1, χ)|A)`; `c_λ(0, 𝒢_{k−1}|A) = 1`; hence the coefficient of `E_k(χ, ω^{1−k})` in `e(E_1(1, χ)ν_{k−1}(𝒢))`. Cite DDP11 Propositions 2.3–2.5 and 2.7, pp. 462–467, and state that they are proved there only when one prime of `F` lies above `p` and for the Eisenstein-built `G_{k−1}`; the statement for all primes above `p` and for Ventullo's `𝒢` is proved here (the local computation at `𝔫` is unchanged; `𝒢` has tame level one). *Needs:* 2.2, 2.2a, 2.3, the weight-one series of R02, NoncommutativeAndEquivariantIwasawa §F.5 (change of cusp).
   3. In 2.5, replace "when `R′ = ∅` both primitive constant terms of 2.2 occur and the added family `E(χ,1)W` cancels the second" by: "when `R′ = ∅` and `𝔫 = 1` both constant terms of the modulus-one weight-one series occur and `E(χ,1)W` cancels the second; when `𝔫 ≠ 1` the weight-one series has the single constant `2^{−[F:ℚ]}L(χ, 0)` and `E(χ, 1)` has zero standard constants, so the standard constants vanish without the third term, which is there to cancel the `η = χ` component (2.5a)".
   4. In 2.6, replace "when `R′ = ∅` the paired family removes `η = χ` as well" by: "when `R′ = ∅` the `η = χ` component of `ν_k(e·F̃)` is `ν_k(W) − (ν_k(ℒ_χ)/L(χ,0))·a_k(χ, ω^{1−k}) = 0` by 2.5a (for `𝔫 = 1` by the standard constants on the narrow class components, `χ` being a nontrivial character of `Cl⁺(F)`)"; add 2.5a to its *Needs*.
   5. In 2.4 Check 2, replace "`W = 1`, `w = 1`" for `H = ℚ(i)`, `p = 5` by "`W = ε((4))^{±1}`, a unit with `w = 1`"; add the negative control "with `W = 1` the `E_k(χ, ω^{1−k})`-component of `ν_k(e·F̃)` is `1 − ⟨4⟩^{±(k−1)} ≠ 0` for `k ≠ 1`".
   6. Add to "Corrections to the sources": "Dasgupta–Kakde–Ventullo (29)–(31), pp. 848–849: the coefficient of `E_k(χ, ω^{1−k})` carries the factor `⟨N𝔫⟩^{±(k−1)}` of Dasgupta–Darmon–Pollack (79), p. 469; it is `1` at weight one, so the Artin algebras are unaffected, but Theorem 3.2 fails without it when `𝔫 ≠ 1`."

   Tested on the refuting instance: for `H = ℚ(√−3)`, `p = 7`, the corrected `ν_k(W)` equals `a_k(χ, ω^{1−k})/a_k(1, χω^{1−k})` by construction, so the `η = χ` component is `0` and `t` is the product of the operators `T_λ − η(λ) − η⁻¹χε(λ)` over `η ∉ {1, χ}`, normalized at weight one.

2. **F02** (P1) the weight-one Hilbert Eisenstein series and the product of a classical form with a family have no owner

   **Location.** `packages/IntegralIwasawaTheoryPartII/README.md:499` (2.5: "`F̃ = E(1, χ) − E_1(1, χ_{R′}) 𝒢^♭ ℒ_χ / D_χ`"); `:444` ("No new construction of … Hilbert modular forms occurs here"); `:124` (contract: "`E_k(η, ψ)` of parallel weight `k ≥ 2`").

   **Claim.** `E_1(1, χ_{R′})·𝒢^♭ ∈ M(𝔫, χ)_(1)` with `ν_k = E_1(1, χ_{R′})·ν_{k−1}(𝒢)`, the constants of `E_1(1, χ_{R′})` being `2^{−[F:ℚ]}D_χ`; all inputs supplied by §F.5 and §2.12(a).

   **Witness.** OrdinaryAutomorphicFormsAndModularityLifting §2.12(a) states `E_n(φ₁, φ₂)` only "for parallel weight `n ≥ 2`"; NoncommutativeAndEquivariantIwasawa §F.5 constructs form spaces for "integral parallel weight `k≥2`" and names no multiplication of forms or of a family by a form; PadicFamilies §5.10: "`ν_1` is not required to be classical". The same product is used in 2.3 (powers `f^s`).

   **Repair.** Add a target 2.2b "Weight-one Eisenstein series and products" and remove the sentence "No new construction of Deligne–Ribet functions or Hilbert modular forms occurs here":

   - "For a totally odd narrow ray class character `η` of modulus `𝔟`, construct the holomorphic Hilbert modular form `E_1(1, η)` of parallel weight one, level `𝔟` and character `η`, with `c(𝔪, E_1(1, η)) = ∑_{𝔯 | 𝔪, (𝔯, 𝔟) = 1} η(𝔯)` and standard constants `2^{−[F:ℚ]}L_𝔟(η, 0)` when `𝔟 ≠ 1` and `2^{−[F:ℚ]}(L(η, 0) + η⁻¹(t_λ)L(η⁻¹, 0))` when `𝔟 = 1` (Dasgupta–Darmon–Pollack Proposition 2.1, (48)–(49), p. 459, which covers `k = 1`; Dasgupta–Kakde–Ventullo §3.1, p. 847 and footnote 6)."
   - "Prove that for a weight-one form `g` of level `𝔟 | 𝔫_S` and character `χ` and a family `𝒢′` of tame level one and character `ω⁻¹` over `Λ_(0)`, the coefficientwise product on each narrow-class component defines `g·𝒢′^♭ ∈ M(𝔫, χ)_(1)` with `ν_k(g·𝒢′^♭) = g·ν_{k−1}(𝒢′)` for `k ≥ 3` near `1`, and standard constants the products of the standard constants."
   - Declare, under "From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa": "What NoncommutativeAndEquivariantIwasawa must provide (gap:weight-one-hilbert-forms-and-products): the §F.5 spaces `hilbertForms` with `hilbertQExpansion` also in parallel weight one, and the multiplication `M_k × M_{k′} → M_{k+k′}` of classical Hilbert modular forms (levels intersected, characters multiplied) with its `q`-expansion formula at every cusp of every component", with the same slug added to the top-level `gaps` of `design/plan.json`.
   - Add 2.2b to the *Needs* of 2.3, 2.5 and (through R01) 2.5a, and to the Layer 2 Dependencies.

3. **F03** (P3) `Suggested.lean` says the pins lack decomposition and inertia subgroups; they have them, and 1.1 does not cite them

   **Location.** `packages/IntegralIwasawaTheoryPartII/Suggested.lean:24–27` ("lacks the Iwasawa logarithm and the decomposition and inertia subgroups of the absolute Galois group of a number field at its completions; … do not supply these"); `README.md:326` (1.1, "local restriction is the pullback along the decomposition embeddings", no pinned name).

   **Claim.** The pinned Tau Ceti has no decomposition or inertia subgroups of an absolute Galois group.

   **Witness.** Pinned Tau Ceti: `TauCeti.absoluteGaloisGroupMap` (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Map.lean:82`, the continuous map `G_L → G_K` of an embedding of separable closures, used for `G_{K_v} → G_K` in `TauCeti/NumberTheory/NumberField/LocalGlobal/AbsoluteGaloisGroup.lean`); `TauCeti.inertiaSubgroup` (`TauCeti/NumberTheory/LocalField/Unramified/Inertia/Basic.lean:112`).

   **Repair.** In the docstring replace that bullet's reason by: "lacks the Iwasawa logarithm on finite extensions of `ℚ_p`; the decomposition maps `TauCeti.absoluteGaloisGroupMap` and the inertia subgroup `TauCeti.inertiaSubgroup` exist at the pins and are the carriers of README §1.1". In the README, add to "From Tau Ceti": "`TauCeti.absoluteGaloisGroupMap` (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Map.lean`): the continuous map `G_{F_𝔮} → G_F` attached to an embedding of separable closures; `TauCeti.inertiaSubgroup` (`TauCeti/NumberTheory/LocalField/Unramified/Inertia/Basic.lean`): the inertia subgroup of the absolute Galois group of a nonarchimedean local field, with `TauCeti.ClassFieldTheory.mem_inertiaSubgroup_of_mk_eq_artinMap` (`…/ClassFieldTheory/Local/Unramified.lean`)"; in 1.1 replace "the decomposition embeddings" by "the maps `TauCeti.absoluteGaloisGroupMap` at the completions" and add both names to its *Needs*; in the scope bullet for Tau Ceti (`README.md:28`) add the two names. The headline of §1.9 stays unstatable (no logarithm), so no declaration is added.

4. **F04** (P3) 0.7 states Spiess's vanishing and edge isomorphism only for a free abelian `T` through a Koszul resolution the conclusions do not need

   **Location.** `README.md:258–263` ("for a group `E_+`, a free abelian group `T` of finite rank `r` … the Koszul complex computes `H_•(T, M)`"), `:268`, and the scope bullet `:18`.

   **Claim.** Vanishing of `H_q(T, M)` and the isomorphism `H_n(E_+ × T, M) ≅ H_n(E_+, M/IM)` need `T` free abelian of finite rank and the regular sequence `1 − π_i`.

   **Witness.** For any group `T`, a free `ℂ_p[T]`-module is `Ind_1^T` of a vector space, so `H_q(T, M) = 0` for `q > 0` by Mathlib's `groupHomology.indIso` (the README's own correction at `:853` says this); the double-complex argument of the second bullet uses only a projective resolution of `ℤ` over `ℤ[T]` and this vanishing. Instance: `T = S₃`, `E_+ = 1`, `M = ℂ_p[S₃]`: both sides are `ℂ_p` in degree `0` and `0` above.

   **Repair.** Restate 0.7's two statements at their generality: "for groups `E_+` and `T`, `U = E_+ × T`, and a `ℂ_p[U]`-module `M` with `H_q(T, M) = 0` for all `q > 0` (in particular `M` projective, or flat, over `ℂ_p[T]`): (i) if `M` is free over `ℂ_p[T]` then `H_q(T, M) = 0` for `q > 0` and `H_0(T, M) = M/IM` (Shapiro, `groupHomology.indIso`, and direct sums); (ii) the natural map `H_n(U, M) → H_n(E_+, M/IM)` is an isomorphism for every `n`", keeping the double-complex route with `K_•` any projective resolution of `ℤ` over `ℤ[T]` (Mathlib's standard resolution). Delete the regular-sequence and Koszul-resolution targets, the Tau Ceti Koszul rows of the supplier contract and scope (`:29`, `:67`), and Check 2 of 0.7; keep Check 1 with the complex `M → M` written directly, and add the `S₃` instance as a Check that commutativity and finite rank are not used. 0.8 is unchanged (it applies the statement to `T = ⟨π_1, …, π_r⟩`).

5. **F05** (P3) the remark after 3.9 holds only for `s = 1`, and contradicts its last sentence

   **Location.** `README.md:630` ("For `r = 1`, `w ∉ {0, −1}`, the image of `U_𝔩` for `𝔩 | 𝔫` is `1 + (w/(1 + w)) log_p⟨N𝔩⟩ π` modulo `π²` … No division by `w + 1` occurs"); `:843`.

   **Claim.** In `W_2` with `r = 1`, `y ≡ wπ/(1 + w)`.

   **Witness.** `r = 1`, `s = 2`: by 3.5 the classes of `π` and `y` are independent in `𝔪/𝔪²` (basis `1, π, y, y²`), and `y ↦ λπ` defines a map `W_2 → E[π]/(π²)` for every `λ ∈ E`. The relation `wπ = (w + 1)y` holds only when `s = 1` (3.2 Check 1).

   **Repair.** Replace the paragraph by: "For `r = s = 1` and `w ∉ {0, −1}`, `W_2 = E[π]/(π²)` with `y = wπ/(1 + w)`, and the image of `U_𝔩` for `𝔩 | 𝔫` is `1 + (w/(1 + w)) log_p⟨N𝔩⟩ π`, which need not be `1`. The proof of 3.9 itself never divides by `w + 1`." In the correction at `:843` insert "for `r = s = 1`".

## Verified sound

Dependency check (0 UPWARD, 0 CYCLE):

```text
depcheck: 237 roadmaps, 2147 edges, 0 problem(s)
```

Counts: `Suggested.lean` declarations read: 0 (the file has none; docstring read in full, one false library claim, R03); README targets read: 52 (0.1–0.9, 1.1–1.9, 2.1–2.6 and 2.2a, 3.1–3.10, 4.1–4.9, 5.1–5.8), every line; locators verified against the cached texts: 43 (DKV16 17, DDP11 6, CD14 15, Lin12 3, V15 2); Checks recomputed: 76; sibling citations checked: 11 roadmaps, 27 sections present at main or at the open head, 14 declaration names present, statements compared for §F.5, §§5.9a–5.13, §2.12, DirichletPadicLFunctions §0.6, ClassFieldTheory Layer 7 (cyclotomic normalization), ModularForms §0.1, IntegralIwasawaTheory §§4.2, 6.0, 6.3, 9.3, Chebotarev Layer 10; pinned declarations grepped: 30 Mathlib and Tau Ceti names, all present with the stated content. The five declared gaps have the same slugs in `design/plan.json` and in the README. The pull request changes only the package folder. No `lemma`, `set_option`, pull-request number or process narrative in the README or the Lean file.

Ownership against open work: searched main and the open heads by object for the Gross–Stark theorem, Gross's regulator, the Sczech–Eisenstein cocycle, Spiess's theorems, the Hilbert Eisenstein complement and the group cap product. No other owner: OrdinaryAutomorphicFormsAndModularityLifting §2.12 says the cusp–Eisenstein decomposition "is not stated here", ClassicalSerreModularity does not state it, and the cap products of AlgebraicTopology and AutomorphicPadicLFunctionsPartII are singular, not group-homological. This roadmap is the owner of all of them.

Computed pass (statement; instance; values; result):

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| Reciprocity convention | `ℚ_5`, `x = 2`; `ℚ_2`, `x = 2` | `rec(2): ζ_5 ↦ ζ_5²`, `Art(2): ζ_5 ↦ ζ_5³`; `Art(2): ζ ↦ ζ²` (pinned `localArtinMap_Q2_zeta5`), `rec(2): ζ ↦ ζ³` | agrees |
| 0.1 partition | `ℚ(i)`, `p = 2, 3, 5` | `χ(2) = 0`, `χ(3) = −1`, `χ(5) = 1`; `r = 0, 0, 1` | agrees |
| 0.4 `det(−L)/det O` | `O = (2), L = (3)`; `diag(2,3), diag(5,7)`; right multiply by `diag(4,1)`; `0 × 0` | `−3/2`; `35/6`; `140/24 = 35/6`; `1` | agrees |
| 0.5 `D_χ` | `ℚ(i)`, `p = 3` | `(1/2)(1 − (−1)) = 1` | agrees |
| 0.6 smoothing factor | `χ_4`, `𝔠 = (3)`, `p = 2` | `⟨3⟩ = −3`; factor `1 + 3(−3)^{−s}`: `4` at `0`, `0` at `1` | agrees |
| 0.6 interpolation | `s = −k` | `χω^{−k}(𝔠)N𝔠^{1+k} = χ(𝔠)N𝔠⟨N𝔠⟩^k` | agrees |
| 0.6 full weight | `ℚ`, `p = 3`, `𝔠 = (2)`, `k = 1` | `(1 − 4)(1 − 3)(−1/12) = −1/2`; principal branch `0` on even `k` | agrees |
| 0.7 Checks | `r = 1`, `M = ℂ_p[T]`, `ℂ_p`; `E_+ = ℤ` | `H_1 = 0, ℂ_p`; `H_1(U, M) = H_1(E_+, ℂ_p) = ℂ_p` | agrees |
| 0.8 identity | general `J`, `n` | `(1 − π_i)(1_{J₀}g_n) = 1_J g_n + 1_{J₀}D_ig_n − 1_J D_ig_n` | agrees |
| 0.8 example | `ℚ(√5)`, `p = 11` | `(4+√5)⁴ = 761 + 336√5 ≡ 1 (8)`; `48² ≡ 5 (121)`; `52^{10} ≡ 100 (121)`, `log_{11} 52 ≡ 22`, `c ≡ 88` | agrees |
| 1.9 | `r = 1` | `XO + YL = 0 ⇒ x/y = −ℓ(u)/o(u)` | agrees |
| 2.1 | `f = as^n` | `ν_k(π) = (u^{k−1} − 1)/log u`, leading coefficient `(−1)^n a` | agrees |
| 2.2 `U_𝔮 − 1` | coefficient at `𝔪𝔮` | `c(𝔪𝔮) − c(𝔪) = c(𝔪, E_1(1, χ_{J∪𝔮}))` | agrees |
| 2.2a Checks | level `8`, `25`, `6`, `4`, `p²` | `σ_3 = 1, 9, 73, 585`; `E_4 − 9E_4|B_2 + 8E_4|B_4`; `1 + 11³ = 1332`; `T_3`: `−8, 8`; `U_2`: `1, 4`; `p + 1` cusps | agrees |
| 2.4 `w` | `s = t` | `w = L^*_an(χ)/L^*_an(χ⁻¹)` | agrees up to the unit of R01 |
| 2.5–2.6 | `R′ = ∅`, `𝔫 ≠ 1` (`ℚ(√−3)`, `p = 7`) | `η = χ` coefficient `ν_k(W)(1 − ⟨3⟩^{k−1}) ≠ 0`; generators' eigenvalue pairs congruent mod `π` | **fails: R01** |
| 2.5 product | weight one | no supplier for `E_1` as a form or for the product | **R02** |
| 3.1–3.6 dimensions | `r = s = 1`; `r = 2, s = 3`; `r = t = 1, s = 2` | `2`; `6` and `8`; `3`; `(−1)^{s+1}a/c = (−1)^{t+1}b` | agrees |
| 3.7 `Y` | eigenvalues | `(χ(𝔮) − 1)(1 − ε(𝔮))` on `E(χ,1)`, `0` on `E(1,χ)`; residue `−(χ(𝔮) − 1)log⟨N𝔮⟩` | agrees |
| 3.9 remark | `r = 1`, `s = 2` | `π`, `y` independent in `𝔪/𝔪²` | **R05** |
| 4.3 cocycle | `b(στ′) = a b + b d` | `κ(στ′) = κ(σ) + χ⁻¹(σ)κ(τ′)` | agrees |
| 4.4 Check 3 | `(1 + LX)²` | difference `2L²y′z′` | agrees |
| 4.6, 5.1, 5.3, 5.4 entries | first column of `ρ(σ)M = M·[[χεη⁻¹, ∗], [0, η]]` | `b = (A/C)(λ − a)`, `c = (C/A)(λ − d)`; entries `ℓz + oε_i`, `ℓy + oε_i` | agrees |
| 5.2 sign | `s = r` | `det L = (−1)^r L_an det O` | agrees |

## Not verifiable

- Sc93 Theorem 4, W86 Proposition 1.5, Br82 Chapters V §3 and VII §6, AL13 Proposition 3.11 and Theorem 3.6: settled as uncertified; cited by locator only, text not read.
- No Lean was elaborated (this pass runs no Lean): the empty namespace of `Suggested.lean` was read, not built; `signatures.md` and `library-matches.md` have no entries.
- The sign of the exponent of `⟨N𝔫⟩` in R01: DDP11 Propositions 2.3 and 2.7 disagree as printed, and the underlying Eisenstein constant-term computation was not redone here.
- ArithmeticGaloisDuality §§R02.1.3–R02.4.3, D7.6, D7.7 and IntegralHeckeAndGaloisDeterminants §§1.3, 1.4: headings and subjects confirmed at the open heads; their hypotheses were not compared line by line with Layers 1 and 4.
- The generalization of DDP11 Propositions 2.3–2.5 from one prime above `p` to several (the target R01 adds) is not in any cached source.
- Ownership against board packages not in the index (three listed, none related) was not checked beyond that index.

## Source issues

- **Error** in DKV16 at (29)–(31), pp. 848–849: the source says the coefficient of the second Eisenstein family is the ratio of the two `p`-adic and the two complex values only; it should be that ratio times the unit interpolating `⟨N𝔫⟩^{±(k−1)}` of DDP11 (79); affects a stated result.
- **Gap** in DKV16 at Theorem 3.2, p. 849: the source says the cuspidal projection is proved in DDP11 Corollary 2.10 and Proposition 3.4; it should be noted that those treat one prime above `p` and assume Leopoldt, so several primes need new cusp computations; affects the proof.
- **Misprint** in DKV16 at footnote 6, p. 847: the source says the modulus-one weight-one constant of the series for `η` is given by values of `χ`; it should be the same formula with `η` in place of `χ`; affects nothing.
- **Error** in DKV16 at Remark 3.7, p. 855: the source says the level operators at primes dividing `𝔫` map to `1`; it should be `1 + (w/(1 + w)) log_p⟨N𝔩⟩π` for `r = s = 1`; affects nothing.
- **Misprint** in DDP11 at Propositions 2.3 and 2.7, pp. 462 and 467: the source says the cusp constant and the resulting coefficient both carry `⟨N𝔫⟩^{k−1}`; it should be opposite exponents, since the coefficient is a quotient by that constant; affects a stated result.
- **Gap** in CD14 at the proof of Theorem 5.1, p. 31: the source says freeness gives homological dimension one and so degeneration; it should be that a free module has vanishing positive-degree homology, which gives the edge isomorphism; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1ccbef4c2b370f801a1c6751951be8729f9d2c73", "job": "RT-IntegralIwasawaTheoryPartII~1b", "model": "fable", "worker": "chris-l"} -->
