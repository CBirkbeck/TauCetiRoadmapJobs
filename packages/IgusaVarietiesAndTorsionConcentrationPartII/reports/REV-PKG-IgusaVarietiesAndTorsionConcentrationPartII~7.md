<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13063#issuecomment-6899907188 -->
Review (claude) of 046ab50

Verdict: needs_changes

1. **F01** (P2) §10.3 computes Matsushima's formula with a maximal compact subgroup, which is wrong when `p_τ = q_τ` for every `τ`

   **Location:** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:30` (Conventions): "`K_∞` is a maximal compact subgroup of `G(ℝ)`"; line 517 (§10.3): "`K_∞` a maximal compact subgroup of `G(ℝ)`"; line 522: "`H^*(S_K(ℂ), ℂ) = ⊕_a ⊕_π m_a(π) π_f^K ⊗ H^*(𝔪_G, K_∞; π_∞)`"; also lines 132, 141, 529, 576.

   **Claim:** `S_K(ℂ)` is built from `X`, the `G(ℝ)`-class of `h` (§8.1, PELModuli §M3.4), and `X = G(ℝ)/Cent(h)`. `Cent(h) = ℝ_{>0} × ∏_{τ∈Φ} U(p_τ) × U(q_τ)` is connected. When `p_τ = q_τ` for every `τ`, `G(ℝ)` has elements of negative similitude, and a maximal compact subgroup contains the compact part of `Cent(h)` with index 2. Matsushima's formula for `S_K(ℂ)` then needs the smaller group, and the formula, `ep` and `c(π_f)` of §10.3 are off by the component group.

   **Witness:** Case 1, `n = 2`, `F = 𝒦`, signature `(1, 1)`: `G(ℝ) = GU(1,1)`, `X = ℍ^±`, `S_K` a Shimura curve. For trivial `π_f` the true coefficient in `[H(Sh)]` is `2` (`H^0` and `H^2`); with maximal `K_∞`, `ep(1) = 1`. ArithmeticLocallySymmetricSpaces ALS.0.4 names the two spaces (`X^G` and its connected variant `X̃^G = G(F_∞)/K_∞°A_∞`).

   **Exact repair:**

   1. Line 30: replace "where `K_∞` is a maximal compact subgroup of `G(ℝ)`" by "where `K_∞ ≅ ∏_{τ∈Φ} U(p_τ) × U(q_τ)` is the maximal compact subgroup of the centralizer of `h` in `G(ℝ)`, so that `X = G(ℝ)/K_∞A_{G,∞}^0`. It is the identity component of a maximal compact subgroup `K_max` of `G(ℝ)`, and `K_∞ = K_max` unless `p_τ = q_τ` for every `τ`, when the index is 2".
   2. Same line: replace "and it is the pair of AutomorphicSpectralTheory §6.19 and ArithmeticLocallySymmetricSpaces ALS.5b.4" by "`H^*(𝔪_G, K_∞; π_∞) = ⊕_χ H^*(𝔪_G, K_max; π_∞ ⊗ χ)` over the characters `χ` of `G(ℝ)/G(ℝ)^0 ≅ K_max/K_∞`, so the Euler–Poincaré function of this pair is `Σ_χ χ·f` for the function `f` of AutomorphicSpectralTheory §6.19, and the comparison of ArithmeticLocallySymmetricSpaces ALS.5b.4 is applied on the connected variant `X̃^G` of ALS.0.4". Make the same change in the two contract bullets (lines 132 and 141).
   3. Line 517: "`K_∞` a maximal compact subgroup of `G(ℝ)`" → "`K_∞` as in the Conventions".
   4. Line 529 (Check): the cohomology is concentrated in degree `q(G)`, "of dimension 1 when some `p_τ ≠ q_τ`, and of dimension 2 when `p_τ = q_τ` for every `τ` (the restriction of `π_∞` to `G(ℝ)^0` is then a sum of two discrete series), so `ep(π_∞) = (−1)^{q(G)}` or `2(−1)^{q(G)}`". Line 576 (Examples): `c(π_f) = e·(ε_G d(G_ℝ))⁻¹ Σ_a Σ_{π_∞} m_a`, with `e = 1` or `2` accordingly.
   5. Add the witness as a negative-control Check of §10.3.

   **Repair tested:** on the witness, `K_∞ = U(1) × U(1)`, `H^*(𝔪_G, K_∞; ℂ) = H^*(ℙ¹)`, `ep(1) = 1 + 1 = 2`, the true coefficient. A weight-two discrete series has `dim H^1 = 2` (holomorphic and antiholomorphic forms), which gives `dim H^1(S_K) = 2g`; the maximal compact group gives `g`. When some `p_τ ≠ q_τ` (Harris–Taylor, `n = 1`, every wholly definite datum) `K_∞ = K_max` and nothing changes. §10.2's identity and §§10.5–10.6 keep their statements: only the constants change.

2. **F02** (P2) §8.6(1) asserts duality for local systems on which `𝕋^S` does not act

   **Location:** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:317`: "The same holds for `𝔽_ℓ`-local systems `L` on `S_K` attached to finite `𝔽_ℓ[K/K′]`-modules, with `L^∨(d)` on the dual side."

   **Claim:** The statement is for "every maximal ideal `𝔪 ⊂ 𝕋^S`", with `K′ ⊂ K` unrestricted. A double coset at a prime `q` acts on `H^*(S_K, L_V)` only when `K′_q = K_q`.

   **Witness:** `K′ = K_SK′_qK^{S∪{q}}` with `q ∈ Spl_{𝒦/ℚ} ∖ (S ∪ {ℓ})`, `K′_q` the principal congruence subgroup and `V` a nontrivial representation of `K_q/K′_q`: `T_{i,v}` (`v | q`) lies in `𝕋^S` and has no action on `H^*(S_K, L_V)`. §11.8(2) (line 684) restricts to `𝕋^{S′}`.

   **Exact repair:** replace the sentence by: "The same holds for the local system `L_V` of a finite `𝔽_ℓ[K/K′]`-module `V`, where `K′ ⊂ K` is a normal compact open subgroup with `K′_q = K_q` for every `q` outside a finite set `S′ ⊇ S`, for the operators and the maximal ideals of `𝕋^{S′}`, with `L_{V^∨}(d)` on the dual side. The operators of `𝕋^S` at the primes of `S′ ∖ S` have no action on `H^*(S_K, L_V)`."

   **Repair tested:** on the witness `S′ = S ∪ {q}` and `T_{i,v} ∉ 𝕋^{S′}`, so every operator in the statement acts; this is the form §11.8(2) uses.

3. **F03** (P3) Scope does not say how §§9.1 and 9.3 differ from EndoscopicTransferAndUnitaryTraceComparison §§8.22, 14.4 and 14.5

   **Location:** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:11` ("Several variants are kept on purpose…") and line 16.

   **Claim:** The paragraph of kept variants names the parent's sections and AG2.7's. It does not name the supplier's Igusa trace identity and spectral factorization, of which §§9.1 and 9.3 are the compact rank-`n` forms.

   **Witness:** EndoscopicTransferAndUnitaryTraceComparison at its head: "### 8.22 Unitary specialization and the endoscopic coefficients" (quasi-split `G_{2n}`), "### 14.4 The signed source Igusa trace identity", "### 14.5 Finite spectral factorization with virtual coefficients", each for the data of the non-compact paper. The README cites none of the three.

   **Exact repair:** add to line 11: "EndoscopicTransferAndUnitaryTraceComparison §§8.22, 14.4 and 14.5 state the stable Igusa trace identity and its spectral factorization for the rank-`2n` datum of signature `(n, n)`. §§9.1 and 9.3 are their forms for a compact Case 2 datum of rank `n` and arbitrary signature, proved from the same supplier sections (§§8.21, 6.25, 6.22, 14.3)."

4. **F04** (P3) "ACC+" is used without a definition or a reference

   **Location:** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:11`: "states the same existence theorem for the ACC+ predicate `FiniteModelDecomposedGenericPrime`".

   **Claim:** The abbreviation names a work that is in neither the References nor `sources.toml`, and it is defined nowhere in the README.

   **Witness:** "ACC+" occurs once in the README (line 11); the References list five works, none with that key.

   **Exact repair:** write "for the predicate `FiniteModelDecomposedGenericPrime`" (the name is declared in AutomorphicGaloisRepresentationsPartII `Suggested.lean`, line 73 at its head).

5. **F05** (P3) `sources.toml` records `Shin11` as cited for §11.5, where the README does not cite it

   **Location:** `packages/IgusaVarietiesAndTorsionConcentrationPartII/sources.toml`, entry `id = "Shin11"`: `cited_for = ["Exact supplier contracts: gap auxiliary-character-finite-avoidance", "11.5"]`.

   **Claim:** `[Shin11]` occurs three times in the README: line 83 (the gap contract), line 508 (§10.2, as the label [CS17] prints) and the References. §11.5 does not cite it.

   **Witness:** README lines 633–645 (§11.5) contain no `[Shin11]`.

   **Exact repair:** `cited_for = ["Exact supplier contracts: gap auxiliary-character-finite-avoidance", "10.2"]`.

Five findings: two P2 and three P3. The four findings of round 6 are repaired. None of the five re-raises a finding that a repair report marked "not actionable in this package".

## Verified sound

### Round-6 findings and their repairs

| Finding | Status; repaired passage | Verification |
|---|---|---|
| F01 (P2), Layer 9 used the choice of `ϖ` without recording the gap | **Repaired.** Line 36: "such a `ϖ` exists by gap:auxiliary-character-finite-avoidance with `D = ∅`"; line 410: "The existence of such a `ϖ` depends on gap:auxiliary-character-finite-avoidance"; the gap is in the *Needs* of §§9.1, 11.4, 11.5 and the Dependencies of Layers 9 and 11. | EndoscopicTransferAndUnitaryTraceComparison §6.3 at its head gives finiteness only; `Spl_` occurs 0 times there. The gap's `needs` in `design/plan.json` has the same hypothesis. |
| F02 (P3), unkeyed "Shin's 2012 paper" | **Repaired.** Line 500: "[CS17] follows [Shin12] §6 (CS17 line 4065), whose standing condition (B2) (author p. 20, Shin12 line 981)"; References line 730. | Shin12 line 981 is (B2), on author p. 20; Shin09 line 879 is Lemma 6.4, author p. 20. |
| F03 (P3), R15.5 cited by a non-heading | **Repaired.** Line 165: "R15.5, §5.10 «Deligne–Serre eigenvalue lifting»". | Heading "### 5.10 Deligne–Serre eigenvalue lifting" at the supplier's head; its hypotheses are those the contract states. |
| F04 (P3), §8.9 without a locator | **Repaired.** Line 366 carries CS17 lines 4030–4032 and Shin09 Definitions 5.2 and 5.3. | Read at those lines: one-point set for central `μ_i`; positivity of `⟨v, h(√−1)w⟩`; Definition 5.3 at Shin09 line 703, author p. 16. |

Repaired pattern in the rest of the package: every «…» title was resolved again to a heading or bold label of its supplier; every use of `S′_fin ⊂ Spl_{F/F⁺}` names the gap; every keyed source is in the References and the manifest (R05 is the one mismatch).

### Principles

General library (both cases, every rank and signature, `ℓ = 2` and `ℓ ∈ S` not excluded); Part II with the parent's stopping point stated (line 5); single direction of supply (depcheck below); no copied passage, no algorithm, no sorry'd data, no `set_option`; no pull-request number, date, round label, machine path, HTML anchor or LaTeX delimiter in the README.

### Source sample (15 seeded targets; all texts readable; none flagged unverified by the author)

| Target | Locator read | Result |
|---|---|---|
| 8.3 | CS17 lines 3678–3713 (p. 740), 3978–4036 with footnote 30 | Decomposition, `S_i`, singleton for central `μ_i` as stated; the translation by `p^{c_i}` is the README's correction (line 4034 has none). |
| 8.5 | CS17 lines 4465–4478 (p. 759) | Dual eigensystem used for `𝔽_ℓ`-cohomology; the README's rule has the matching hypothesis `q ∉ 𝔪`. |
| 8.6 | CS17 lines 4465–4467, 4476–4478 (p. 759); line 3250 (p. 729) | Both dualities are used there; the precise statements are the README's (R02 on the last sentence). |
| 8.7 | CS17 line 149 (p. 652), line 4326 (p. 755), lines 4409–4413 (p. 757) | Ratios `{1, q}`, arithmetic Frobenius, `ℓ ≠ p`; at most one `τ` per `S_i`. |
| 9.1 | CS17 lines 3419–3422, 3485–3498, 3551–3562, 3588–3594 | Formula, `ker¹`, `τ(G)`, `ε = 1/2` for `(n/2, n/2)`, acceptable `φ_p`, `[F⁺:ℚ] ≥ 2`. |
| 9.3 | CS17 lines 3740–3756, 3796–3829 | Three-trace terms, arbitrary `φ_p`, both directions of the corollary. |
| 9.6 | CS17 lines 3978–4009, 3950–3966 | Hypotheses and conclusion agree; the local–global step is the declared gap. |
| 10.2 | CS17 lines 4073–4078; Shin09 line 879 | Identity with nonzero constants; the lemma is in Shin09. |
| 10.3 | CS17 lines 4082–4090 | Formula and index set agree; the explicit `c(π_f)` is the README's (R01). |
| 10.4 | CS17 lines 4091–4093; Shin-BCU lines 13–20, 41–54 | The source's theorem is for a hermitian `F`-space; the division-algebra case is the declared gap. |
| 11.1 | CS17 lines 4442–4461 (pp. 758–759) | The source localizes Igusa cohomology at `𝔪` without comment; the lemma is the README's own. |
| 11.3 | CS17 line 3236 (p. 729), lines 4442–4448, 4491–4497 | Stalk formula and both Leray steps. |
| 11.5 | CS17 lines 4387–4408, 89–100, 4436–4474 | Statement agrees; elimination of the auxiliary bad primes is the README's. |
| 11.7 | CS17 lines 84–115, 4422–4434 | Both hypotheses and their reduction to auxiliary pairs. |
| 11.8 | CS17 lines 101–103, 131–133 | Both remarks are one sentence each; the statements and proofs are the README's. |

Also read: Shin11 lines 3470–3477 (Lemma 7.1, p. 1722), Shin12 lines 978–981, Shin09 lines 570–575 and 703, CS17 lines 3258–3297, 3636–3659, 3714–3734, 4037–4050, 4244–4248, 4326–4345, 4363–4383. No source was fetched; the manifest was not edited.

### Adversarial pass (values computed this round)

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| 8.3(5) central translation | `n = 2`, `S_i = {(1,1), (2,0)}` | `κ` after Shapiro `−3`; after `p` (valuation 2) `−1`; target `−p_τ = −1` | holds; none |
| 8.3 Newton average | `((0,−1), (−1,−1))` and its average | `2ρ`-pairings `1 + 0` and `1/2 + 1/2`; `d = 1 + 0` | holds; none |
| 8.5(1)–(2) | `n = 2`, `q = 7`, `ℓ = 11`, roots `{1,2}`; roots `{3,6}` | `T = (3, 5)`, dual `(5, 9)`, `X² − 5X + 8`, roots `{7, 9} = {7·1, 7·6}`; `{3,6} ↦ {28, 14} = {6, 3}` | holds; none |
| 8.5 negative control | degree character, `q = 5`, modulo 5 and 3 | `X² − 6X + 5`: mod 5 `X² − X`, root `0`, rule undefined; mod 3 `X² + 2`, `{1,2} ↦ {2,1}` | holds exactly when `q ∉ 𝔪`; none |
| 8.5 transport `ῑ` | `χ : 𝕋^S → 𝔽_9`, `χ(T_{1,v}) = a`, `a² = −1` | `χ ∘ ι = χ³`; root through `ῑ⁻¹` is `a⁻¹ = −a ≠ a` | Check correct; none |
| 8.6(1) | `d = 0`; `𝔪 ∌ ℓ`; `K′_q ≠ K_q` | pairing on functions on a finite set; both sides `0`; `T_{i,v}` has no action on `H^*(S_K, L_V)` | constant coefficients hold; **R02** |
| 8.6(2) → 11.4(2) | `RΓ(I)_𝔪 = F[−d_b]`, `F` free | `RHom(F[−d_b], ℤ_ℓ)[−2d_b] = F^∨[−d_b]` | holds; none |
| 8.7 `IsStrongGenericAt` | `n = 0`, `n = 1`; `{3,3}`, `{1,2}`, `{1,7}` at `q = 7`, `ℓ = 11` | no pairs; ratios `1` (false), `{2, 6}` (true), `{7, 8}` (false) | definition determines the predicate; none |
| 8.7 dependence on `𝔭` only | two `ι_p` inducing the same `𝔭` | they differ by `Gal(ℚ̄_p/ℚ_p)` and by `γ ∈ Gal(ℚ̄/E)`; `γ` preserves the signature function, so each `S_i` keeps its signatures | holds; none |
| 8.8(a) headline | `n = 0`, `F = L = ℚ`; trivial `r`, `n = 2` | set = primes `≠ ℓ`, infinite; eigenvalues `{1,1}`, predicate false everywhere, so `h` is needed | true, not vacuous; none |
| 8.8(b) headline | `v₀` of degree 2, unramified in `L_r(ζ_ℓ)` | class of `Frob_{v₀}` fixes `r(Frob)` up to conjugacy and `q_v` mod `ℓ`; degree-one places have density 1 among places | true; none |
| Gap `auxiliary-character-finite-avoidance` | `R = Ram(𝒦/ℚ)`; `𝒦 = ℚ(i)`, `F⁺ = ℚ(√5)` | consistency on `𝔸_ℚ^× ∩ 𝒦^×ℂ^×U^R`: `k/k̄` is a root of unity equal to 1 at `R`, so `k ∈ ℚ^×` and `ω(a)ϖ_∞(z) = sgn(z)² = 1`: a `ϖ` with `Ram_ℚ(ϖ) ⊂ Ram(𝒦/ℚ) ⊂ Spl ∩ S` exists; in the second case 2 is inert in `F⁺`, so `2 ∉ Spl` | gap is satisfiable under its hypothesis and not without it; none |
| 9.1 constants | `n⃗ = (n)`, `(n₁ ≠ n₂)`, `(n/2, n/2)` | `ι(G, G_n⃗)τ(G_n⃗) = τ(G)·{1, 1, 1/2}` | holds; none |
| 9.3(1) coefficient systems | `n⃗ = (1,1)`; general proper `n⃗` | characters `(z/z̄)^{(±1−δ)/2}`, not both trivial; shifts needed `n₂/2` and `−n₁/2` have opposite signs, available `{0, δ/2}` have one sign | "trivial exactly when `n⃗ = (n)`" holds; none |
| 9.4 Check | `n = 2`, `q = 7`, trivial `Π⁰_v` | eigenvalues `7, 1`; `S(T_1) = 8`, `S(T_2) = 1`; `X² − 8X + 7` | holds; none |
| 9.5 | `GL_2`, `(1,1)`: ordinary and basic; definite factor | `J = GL_1 × GL_1` and `D^×`; `J_{b_i} = G_i` | holds; none |
| 9.6 | characters with ratio `≠ ε^{±1}`; `N` | unlinked, so the only representation with that support is the irreducible principal series; `N = 0` for a sum of characters | holds, conditional on the gaps; none |
| 10.1 local index | `(d, e) = (2,1), (2,2), (4,2)` | index `2, 1, 2`; `m·e` multiple of `lcm = 2, 2, 4`; non-split `v`: `inv = 0` by corestriction | holds; none |
| 10.2–10.3 | `n = 1`; Harris–Taylor; `n = 2`, `F = 𝒦`, `(1,1)` | `ep(1) = 1`; `q(G) = n − 1`; maximal compact gives `ep(1) = 1` against the true `2`, and `dim H^1 = g` against `2g` | **R01** |
| 10.4 | `n = 2`, `q = 7`, trivial `Π⁰_v`; `n = 1` | `{7, 1}`; factor `q^0` | holds, conditional on the gap; none |
| 11.1 | `S′ = S ∪ {p}`; `M` finite | `M_𝔐` localized at `𝔪′` is `M_𝔐` or `0` according as `𝔐 ∩ 𝕋^{S′} = 𝔪′` | holds; the hypothesis `ℓ ∉ S′ ∖ S` is not used (note, no change) |
| 11.2(a) | `V ≠ 0` smooth, `V^{K_p} = 0` | then `E_2^{0,j₀} = 0`, so only "some `j ≤ i`" follows | holds; none |
| 11.3 | stalks in degrees `≥ d` | `a ≥ 0`, `b ≥ d` gives `a + b ≥ d` | holds; none |
| 11.4(4) Deligne–Serre | `κ(𝔪^∨) = 𝔽_{ℓ²}` | `κ ⊗_{𝔽_ℓ} κ = κ × κ`; identity factor gives a vector with eigenvalues in `κ` | holds; none |
| 11.4(3) no cancellation under `BC^{S′}` | two constituents with equal base change | both coefficients have sign `(−1)^{d_b}` | holds; none |
| 11.5 | `q ∉ S ∪ {ℓ}`, `D = {q}` | `q ∉ S ∪ {p, ∞} ∪ Ram(ϖ)` | holds, conditional on the gaps; none |
| 11.7 worked example | `F⁺` real quadratic, `p` split in `𝒦` | `(e,f,g) = (1,1,4)` or `(1,2,2)` | holds; none |
| 11.8(1)–(2) | `O^r[−d]`; row `b = d` only | reduction in degree `d`; `H^i = 0` for `i < d`, and for `i > d` by duality at `𝔪^∨` | holds; none |

### Lean file

- Elaboration from the content checkout: exit 0; the only output is `declaration uses 'sorry'` at lines 79 and 91. One `import Mathlib`, no `TauCeti.*` import, no `set_option`, no sorry'd data, 97 lines.
- `#check @name` for all four declarations in one scratch copy: every type keeps `[NumberField F] [NumberField L] [Algebra F L] [IsGalois F L] [Field k] [Finite k] {n : ℕ}` and `r`, and both theorems keep their existential hypotheses. They agree with README §§8.7–8.8. Nothing changed.
- One-tactic probe on both sorried theorems, ten tactics each (`simp`, `rfl`, `infer_instance`, `exact Set.infinite_univ`, `simpa using h`, `aesop`, `simp_all` unfolding both definitions, `exact Set.infinite_of_not_bddAbove (by simp)`, `decide`, `exact?`): 18 fail, and `exact?` returns only the sorried statement itself. No padding.
- Headline theorems: §§11.5–11.8, §§9.6 and 10.6 with their trace identities, and §8.8. Only §8.8 is statable at the pins; both parts are stated. The module docstring names the others with the missing carriers. No stand-in.
- Backticked names of the roadmap's own: `IsStrongGenericAt`, `IsCompletelySplitStrongGenericPrime`, `infinite_setOf_isCompletelySplitStrongGenericPrime`, `infinite_setOf_isStrongGenericAt_degree_one`; all four are declared. No other roadmap declares them (searched main and the open heads).

Pinned declarations opened: `Mathlib/NumberTheory/NumberField/CMField.lean:70` (`IsCMField`); `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:126` (`maximalRealSubfield`); `Mathlib/NumberTheory/HeckeRing/Defs.lean:189` (`HeckeRing`); `Mathlib/RingTheory/Frobenius.lean` (`IsArithFrobAt`); `Mathlib/RingTheory/Ideal/Defs.lean:154` (`Ideal.inertia`); `Mathlib/RingTheory/Ideal/Over.lean:128`, `:379` (`LiesOver`, `primesOver`); `TauCeti/NumberTheory/HeckeRing/Associativity.lean:484` (`instRingHeckeRing`); `TauCeti/NumberTheory/HeckeRing/Commutativity.lean:51–52`. Neither library contains "DecomposedGeneric" or "StrongGeneric".

### Duplication, ownership and suppliers

- Every cited section resolved to a heading at the supplier's current head (main for SchemeAndStackFoundations and SmoothRepresentationsOfLocalGroups, the open head otherwise): 111 section citations over 20 roadmaps and the nine named AG2 targets. Read in full where a hypothesis matters: EndoscopicTransferAndUnitaryTraceComparison §§6.3, 6.9, 6.15, 6.25, 8.21, 8.22, 10.32, 14.1–14.7; AG2.2 «The Caraiani–Scholze discrete normalization» (general rank `N`), AG2.7 «Unitary discrete-parameter export»; AlgebraicModularFormsAndSerreWeights §5.10; AutomorphicSpectralTheory §§6.19–6.20; ArithmeticLocallySymmetricSpaces ALS.0.4, ALS.5b.4; PELModuli §M3.4; parent §5.1.
- AutomorphicGaloisRepresentationsPartII declares `FiniteModelDecomposedGenericPrime` and `infinitelyManyDecomposedGenericPrimes` (its `Suggested.lean` lines 73–95): a weaker predicate, different names; the README says how they differ.
- No roadmap on main has this name (no second copy). `scratch/overlaps.md` lists no competing change, dropped id or revision-only id. The board's package index holds no package on these objects.
- The three gap slugs agree between the README and `design/plan.json`; each has a named supplier and section, is precise, and asks for nothing the supplier states at its head.

Overlap check: read IgusaVarietiesAndTorsionConcentration, AutomorphicGaloisRepresentationsPartII, TorsionCohomologyInfrastructure, EndoscopicTransferAndUnitaryTraceComparison, PotentialAutomorphyInfrastructurePartII; the local genericity predicate is owned by AutomorphicGaloisRepresentationsPartII AG2.7 and cited; the rank-`2n` Hecke algebra, dual ideal and Igusa duality are owned by the parent, and the rank-`2n` Igusa trace identity and spectral factorization by EndoscopicTransferAndUnitaryTraceComparison §§8.22, 14.4, 14.5 (R03: the variant clause is missing); nothing else shared.

Dependency check, complete output:

```text
depcheck: 246 roadmaps, 2260 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `roadmaps resolve` reports no unresolved citation and no unknown Lean name.

### Shape

Four layers (8–11), 29 targets; each layer ends with Examples and Dependencies. Definitions with API and Checks: §8.1 (9), §8.3 (5), §8.4 (4), §8.5 (7), §8.7 (6), §8.9 (6), §9.4 (4), §10.3 (3), §10.5 (4). Every theorem has its hypotheses and a locator.

Arrangement: 72 of 86 locators are to CS17. Layer 8 draws on CS17 §§1, 5.1, 5.4, 6.2, 6.3 and has no single counterpart; §§8.9, 11.1 and 11.8 have none; Layer 9 spans §§5.2–5.5, Layer 10 is §5.6, Layer 11 is §6.3 with §1. The order 9, 10, 11 is forced: Layer 10's Dependencies name §§9.2 and 9.5, and Layer 11's name Layers 8–10. No one-to-one run of sections.

Source independence: 25 passages compared with 5 sources, none shared beyond hypothesis lists the mathematics forces (longest common run 6 words, at CS17 line 3720); largest share CS17, 72 of 86 locators; contents compared with CS17: independent.

## Not verifiable

- No cited text was unreadable. Supplier sections not listed as read in full were resolved by heading and first paragraph only.
- Whether ArithmeticLocallySymmetricSpaces ALS.5b.4 is stated for the connected variant `X̃_K` as well as for `X_K` (R01, repair 2): I read ALS.0.4 and the head of ALS.5b.4, not its whole proof.

## Source issues

- **Misprint** in CS17 at Lemma 5.4.3, printed p. 741: the source says the reduction of an unlabelled local representation vanishes; it should name the labelled endoscopic representation of the hypothesis; affects a stated result.
- **Misprint** in CS17 at Theorem 5.5.7 and Corollary 5.6.3, printed pp. 747 and 750: the source says a complex embedding is composed with the p-adic-to-complex isomorphism; it should use the inverse isomorphism; affects a stated result.
- **Misprint** in CS17 at Theorem 5.5.7, printed p. 747: the source says base change at p in the vanishing statement; it should be base change outside the finite set, as in its proof; affects a stated result.
- **Misprint** in CS17 at Theorem 6.3.1(1), printed p. 757: the source says the similitude factor at q is the p-adic units and numbers; it should be the q-adic ones; affects a stated result.
- **Misprint** in CS17 at §5.6, printed p. 749: the source says the acceptable-function extension is Lemma 6.4 of Shin's 2011 Annals paper; it should be Lemma 6.4 of Shin's Igusa point-counting paper; affects nothing.
- **Misprint** in CS17 at §5.2, printed p. 735: the source says the auxiliary character comes from Proposition 7.1 of Shin's 2011 paper; it should be Lemma 7.1 there; affects nothing.
- **Misprint** in CS17 at proof of Theorem 6.3.1, printed p. 759: the source says Theorem 5.5.5 gives the Galois representation; it should be Corollary 5.5.5; affects nothing.
- **Error** in CS17 at Lemma 5.5.1, printed p. 742: the source says every contributing archimedean component is cohomological for the trivial representation; it should say for the coefficient systems of the Lefschetz functions, nontrivial for proper endoscopic groups; affects a stated result.
- **Gap** in CS17 at §5.1, printed p. 730: the source says every such positive PEL datum is a Shimura datum in its own sense; it should exclude wholly definite data of rank at least two; affects the proof.
- **Gap** in CS17 at proof of Theorem 5.5.7, printed p. 748: the source says the restriction-of-scalars Kottwitz set equals that of the one noncentral embedding; it should include the central translation from the other embeddings; affects the proof.
- **Gap** in CS17 at proof of Theorem 6.3.1, printed p. 758: the source says nonvanishing at finite level in the least degree gives nonvanishing at infinite level in that degree; it should say in some degree no larger; affects the proof.
- **Gap** in CS17 at §5.6, printed p. 749: the source says the appendix base-change theorem gives Galois representations for the division-algebra group; it should justify the passage from hermitian spaces to division algebras; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "046ab50a5ce8d0fa1586c3f7804ae63fb29828dc", "job": "REV-PKG-IgusaVarietiesAndTorsionConcentrationPartII~7", "model": "fable", "worker": "chris-x89"} -->
