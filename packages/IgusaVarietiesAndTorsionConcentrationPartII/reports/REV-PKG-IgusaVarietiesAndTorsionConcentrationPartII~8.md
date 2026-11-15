<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13063#issuecomment-6901759837 -->
Review (claude) of 035f452

Verdict: needs_changes

1. **F01** (P3) §§9.6 and 10.6 pass from a Galois parameter to a principal series with no named supplier

   **Location.** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md`, §9.6, route: "the semisimple parameter of `Π⁰_{𝔭_i}|det|^{(1−n)/2}` is `⊕_a χ_{i,a}` through local class field theory … the representation induced from them is therefore irreducible and generic". §10.6, route: "local–global compatibility at `𝔭_i` … and the hypothesis make `π_{𝔭_i}` a generic principal series".

   **Claim.** The gap contract and §10.4 give `WD(r)^{F-ss} ≅ rec(Π⁰_w|det|^{(1−n)/2})`. To conclude that `Π⁰_w` is the principal series induced from the characters, the route needs three properties of `rec`: rank-one reciprocity, additivity on the constituents of a normalized induction, and that a supercuspidal of `GL_m`, `m ≥ 2`, has an irreducible parameter. Local class field theory gives only the first. No supplier section is named for the other two, in the routes, the `*Needs:*` lines or the supplier contracts. §10.6 names nothing at all for this step: its `*Needs:*` line has no SmoothRepresentationsOfLocalGroups SR.5.2 either, and the Layer 10 Dependencies have no SmoothRepresentationsOfLocalGroups entry.

   **Witness.** EndoscopicTransferAndUnitaryTraceComparison at its head owns them: "### 10.20 Functoriality of the semisimple parameter" (rank-one reciprocity, normalized-induction constituent sum), "### 10.21 Supercuspidal trace parameters" (bijection onto irreducible parameters), "### 10.30 Identification with the classical correspondence". The README cites none of the three.

   **Exact repair.**

   1. §9.6, replace "through local class field theory, no two of these characters differ by `|·|^{±1}`, and the representation induced from them is therefore irreducible and generic (SmoothRepresentationsOfLocalGroups SR.5.2 «Modular generic segments», in characteristic zero)" by: "so no constituent of the supercuspidal support of `Π⁰_{𝔭_i}` has rank `≥ 2` (a supercuspidal of rank `m ≥ 2` has an irreducible `m`-dimensional parameter, EndoscopicTransferAndUnitaryTraceComparison §10.21), and `Π⁰_{𝔭_i}|det|^{(1−n)/2}` is a constituent of the normalized induction of the characters `ψ_a` with `rec(ψ_a) = χ_{i,a}` (§10.20 there: rank-one reciprocity and the constituent sum; §10.30 identifies that parameter with `rec`). No two `ψ_a` differ by `|·|^{±1}`, so the induced representation is irreducible and generic (SmoothRepresentationsOfLocalGroups SR.5.2 «Modular generic segments», in characteristic zero), and `Π⁰_{𝔭_i}` is that principal series."
   2. §9.6 `*Needs:*`: add "EndoscopicTransferAndUnitaryTraceComparison §§10.20, 10.21, 10.30".
   3. §10.6, after "make `π_{𝔭_i}` a generic principal series at every nontrivial `i`" add ", by the argument of §9.6 (EndoscopicTransferAndUnitaryTraceComparison §§10.20, 10.21, 10.30; SmoothRepresentationsOfLocalGroups SR.5.2 «Modular generic segments»)". §10.6 `*Needs:*`: add those four items.
   4. Supplier contracts, EndoscopicTransferAndUnitaryTraceComparison: add a bullet "§§10.20, 10.21 and 10.30: the semisimple parameter is additive on the constituents of a normalized induction and is geometric reciprocity in rank one; it is a bijection from supercuspidals of `GL_m(F)` onto irreducible `m`-dimensional parameters; it is the semisimplification of `rec`."
   5. Layer 9 Dependencies: add §§10.20, 10.21, 10.30 to the EndoscopicTransferAndUnitaryTraceComparison list. Layer 10 Dependencies: add the same three, and "SmoothRepresentationsOfLocalGroups SR.5.2".

   **Repair tested.** `GL_2`, parameter `χ_1 ⊕ χ_2` with `χ_1/χ_2 ≠ ε^{±1}`: §10.21 excludes a supercuspidal (its parameter is irreducible of dimension 2); §10.20 makes `Π⁰` a constituent of `ψ_1 × ψ_2`; SR.5.2 makes that induction irreducible, so `Π⁰ = ψ_1 × ψ_2`. Control: the trivial representation has parameter `|·|^{1/2} ⊕ |·|^{−1/2}` with ratio `|·|`, which the hypothesis excludes, as the Examples of Layer 9 require. Both suppliers are earlier in the merge order and already cited, so the dependency check is unchanged.

2. **F02** (P3) three `*Needs:*` lines and the Layer 8 Dependencies omit inputs their statements or routes name

   **Location.** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md`:

   - §8.3 `*Needs:*`: "BunGAndNewtonStrata §§1.13, 1.23, 1.30"; §8.9 `*Needs:*` has no BunGAndNewtonStrata entry; Layer 8 Dependencies: "BunGAndNewtonStrata §§1.13, 1.23, 1.30".
   - §11.6 `*Needs:*`: "this roadmap §§8.5, 8.6, 8.7, 8.9, 9.6, 10.6, 11.1–11.5; IgusaVarietiesAndTorsionConcentration §§4.5, 5.5".

   **Claim.** §8.3(5) and its API assert that the identifications preserve the `μ`-ordinary class, and §8.9(3) asserts that `b₀` is `μ`-ordinary. That class is defined in the Conventions by BunGAndNewtonStrata §§1.25–1.26, which neither `*Needs:*` line nor the Layer 8 Dependencies name. §11.6, step 2, says "By §11.5 and Chebotarev with Brauer–Nesbitt"; the uniqueness clause of §11.5 does not cover the step, because `r` is known to have the right polynomials only outside `S′_fin ∪ {ℓ}`, a density-one set and not every place above `Spl_{𝒦/ℚ} ∖ (S ∪ {ℓ})`.

   **Witness.** README Conventions: "the Hodge average `(μ⁻¹)◇` of BunGAndNewtonStrata §1.26 … (BunGAndNewtonStrata §§1.25–1.26)". §11.5 `*Needs:*` has "ArithmeticGaloisRepresentations §§1.8, 5.9"; §11.6's does not. Every other route citation of Layers 8–11 is in its `*Needs:*` line (29 targets compared).

   **Exact repair.**

   1. §8.3 `*Needs:*`: "BunGAndNewtonStrata §§1.13, 1.23, 1.25, 1.26, 1.30".
   2. §8.9 `*Needs:*`: add "BunGAndNewtonStrata §§1.25, 1.26".
   3. Layer 8 Dependencies: "BunGAndNewtonStrata §§1.13, 1.23, 1.25, 1.26, 1.30".
   4. §11.6 `*Needs:*`: add "ArithmeticGaloisRepresentations §§1.8, 5.9".

   **Repair tested.** §8.3 Check 3 computes the `μ`-ordinary Newton point `((−1/2, −1), (−1/2, −1))` as the Frobenius average of `((0, −1), (−1, −1))`: that is §1.26's Hodge average and nothing in §§1.13, 1.23, 1.30. In §11.6, with `q ∈ Ram(ϖ) ∖ (S ∪ {p, ℓ})` the polynomial of `r̄` at `v | q` is not known, so the comparison with `ρ_{𝔪^∨}` is the density-one statement of ArithmeticGaloisRepresentations §§1.8 and 5.9.

Two findings, both P3, both about inputs that a proof route uses and its `*Needs:* ` line (or the route itself) does not name. The five findings of round 7 are repaired. No finding re-raises one that a repair report marked "not actionable in this package". The mathematics of every statement I recomputed holds.

## Verified sound

### Round-7 findings and their repairs

| Finding | Status; repaired passage | Verification |
|---|---|---|
| F01 (P2), Matsushima with a maximal compact subgroup | **Repaired.** Conventions: "`K_∞ ≅ ∏_{τ∈Φ} U(p_τ) × U(q_τ)` is the maximal compact subgroup of the centralizer of `h`"; "`e = [K_max : K_∞] = #π_0(G(ℝ))`"; "the Euler–Poincaré function of `(𝔪_G, K_∞)` is `Σ_χ χ·f_max`". §10.3 Checks carry the negative control. | Recomputed below (rows on `e`, the splitting, `ep`). ArithmeticLocallySymmetricSpaces ALS.0.4 at its head defines `X^G` with `K_∞ = G(F_∞)^θ` and the variant `X̃^G` with deck group `π_0(K_∞)`; ALS.5b.4 is stated for `X_K`. AutomorphicSpectralTheory §§6.19–6.20 use the full `K_∞`; its line "Combining `franke_comparison` … proves `franke_input`" gives the hypothesis of ALS.5b.4. |
| F02 (P2), §8.6(1) for local systems | **Repaired.** "for the operators and the maximal ideals of `𝕋^{S′}`, with `L_{V^∨}(d)` on the dual side. The operators of `𝕋^S` at the primes of `S′ ∖ S` need not act". | On the round-7 witness `T_{i,v} ∉ 𝕋^{S ∪ {q}}`; the statement is the one §11.8(2) uses. |
| F03 (P3), variant clause for §§9.1, 9.3 | **Repaired.** Scope: "EndoscopicTransferAndUnitaryTraceComparison §§8.22, 14.4 and 14.5 state the stable Igusa trace identity and its spectral factorization for the rank-`2n` quasi-split datum". | Read the three sections at the supplier's head: `G_{2n}`, the data of the non-compact paper, "For the CSnc test functions". |
| F04 (P3), "ACC+" | **Repaired.** "for the predicate `FiniteModelDecomposedGenericPrime`". | Declared in AutomorphicGaloisRepresentationsPartII `Suggested.lean` at its head; "ACC+" occurs nowhere in the package's README or Lean file. |
| F05 (P3), `Shin11` `cited_for` | **Repaired.** `cited_for = ["Exact supplier contracts: gap auxiliary-character-finite-avoidance", "10.2"]`. | `[Shin11]` occurs in the gap contract, §10.2 and the References. The other four keys match their occurrences. |

The repaired pattern elsewhere: every use of `K_∞`, `ep` and "cohomological for the trivial representation" in Layer 10 now refers to the pair of the Conventions; every local-system statement (§§8.6, 8.9, 11.8) restricts the Hecke operators to the primes where the levels agree.

### Principles

General library (both cases, every rank and signature, wholly definite data, `ℓ = 2` and `ℓ ∈ S` not excluded). Part II, with the parent's stopping point in the second paragraph. One direction of supply (dependency check below). No copied passage, no algorithm, no sorry'd data, no `set_option`. No pull-request number, date, round label, machine path, HTML anchor or LaTeX delimiter in the README (searched for 20 process words: none).

### Source sample (15 seeded targets; every text readable; the author flagged none as unverified)

| Target | Locator read | Result |
|---|---|---|
| 8.1 | CS17 lines 4363–4379 (pp. 756–757), 3258–3293 (p. 730), 443–447 (p. 660), 4059–4062 (p. 749) | Cases 1 and 2 with their hypotheses; footnote 27; the Shimura-datum assertion at line 3281 and condition (3) at line 447 are as the README says. |
| 8.3 | CS17 lines 3678–3713 (p. 740), 3978–4036, footnote 30 at 4056 | Decomposition, `S_i`, single point for central `μ_i`; line 4034 has no translation (the README's correction). |
| 8.5 | CS17 lines 4465–4478 (p. 759) | The dual eigensystem is used there; the rule is the README's. |
| 8.6 | CS17 lines 4465–4467, 4476–4478; line 3250 (p. 729) | Both dualities are invoked; statements are the README's. |
| 8.7 | CS17 lines 149–153 (p. 652), 4326–4331 (p. 755), 4409–4413 (p. 757) | Arithmetic Frobenius, ratios `{1, q}`, `ℓ ≠ p`; "at most one `τ`". |
| 9.1 | CS17 lines 3419–3422, 3485–3498, 3551–3562, 3588–3594 | Formula, constants `1/2`, acceptable `φ_p`, `[F⁺:ℚ] ≥ 2`. |
| 9.3 | CS17 lines 3740–3756, 3796–3829 | Three traces; arbitrary `φ_p`; both directions of the corollary. |
| 9.5 | CS17 lines 4007–4050 (pp. 747–748) | Lemma 5.5.8 at line 4037; `J_b ≅ GL_{n−q} × GL_q` for the ordinary class. |
| 9.6 | CS17 lines 3978–4009, 3950–3966 | Hypotheses and conclusion agree; the local step is Remark 5.5.6 (the declared gap). |
| 10.2 | CS17 lines 4073–4078; Shin09 line 879 (author p. 20) | Identity with nonzero constants; the lemma is in Shin09. |
| 10.3 | CS17 lines 4082–4090 | Formula and index set; the explicit `c(π_f)` is the README's. |
| 11.5 | CS17 lines 4384–4408, 89–100, 4436–4474 | Statement agrees; elimination of the auxiliary bad primes is the README's. |
| 11.6 | CS17 lines 4409–4416, 4475–4497, 4339–4345 | Statement and the four steps of the route; Lemma 6.2.2 at line 4339, p. 756. |
| 11.7 | CS17 lines 84–115, 4422–4434 | Both hypotheses, footnote 2, Remarks 6.3.2–6.3.3 and footnote 33. |
| 11.8 | CS17 lines 101–103, 131–133 | One sentence each; statements and proofs are the README's. |

Also read: Shin-BCU lines 13–21 and 41–54; Shin11 lines 3470–3480 (p. 1722); Shin09 lines 570–575 (author p. 13) and 703 (p. 16); Shin12 lines 978–981 (author p. 20); CS17 lines 3636–3659, 3714–3734, 4244–4248. No source was fetched; the manifest was not edited; `needs-references.toml` was not written.

### Adversarial pass (values computed this round)

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| Conventions, `e` and `q(G)` | `GU(1,1)`; `n = 1`; signatures `(1,1)` and `(2,0)` at two places | `e = 2`, `(5 − 2 − 1)/2 = 1 = d`; `e = 1`; `e = 1` (`ν < 0` would turn `(2,0)` into `(0,2)`) | holds; none |
| Conventions, splitting function | `γ ∈ G(ℚ)` with `ν(γ) = −5`, `𝒦 = ℚ(i)`; two lifts `x, xw` of a point of `X^G` | `sgn = −1`, `ω_f(−5) = ω(−5)/ω_∞(−5) = −1`, product `+1`; the lifts have opposite signs, so each fibre meets each class once | well defined, fibres map bijectively; none |
| Conventions, `H^*(K_∞) = ⊕_χ H^*(K_max; χ)` | trivial module, `GU(1,1)` | `(1, 0, 1) = (1, 0, 0) + (0, 0, 1)`; the swap acts by `−1` on `Λ²𝔭^*` | holds; none |
| 8.1 dimension and SV3 | `(1,2), (0,3)`, `n = 3`; quaternion datum over `ℚ(i)`; `n = 1` | `d = 2` (all four embeddings would give 4); invariants `1/2 + 1/2 ≡ 0`, `d = 0`, SV3 fails; SV3 holds with `d = 0` | holds; none |
| 8.3(5) | `S_i = {(1,1), (2,0)}`, `n = 2` | `κ = −3`, after `p` (valuation 2) `−1 = −p_τ`; pairings `1 + 0` and `1/2 + 1/2` against `d = 1` | holds; **R02** on the `*Needs:*` line |
| 8.4 Satake image | general `n`; `n = 2` | exponent `i(i−1)/2 + i(n−i)/2 = i(n−1)/2`; `S(T_1) = q^{1/2}(x_1 + x_2)` | holds; none |
| 8.5(1)–(2) | `n = 2`, `q = 7`, `ℓ = 11`, roots `{1,2}`; `{3,6}`; degree character mod 3 and 5 | `T = (3, 5)`, dual `(5, 9)`, `X² − 5X + 8`, roots `{7, 9}`; `{6, 3}`; `X² + 2` with `{1,2} ↦ {2,1}`, and `X² − X` with root `0` | holds exactly when `q ∉ 𝔪`; none |
| 8.6(1), repaired | `K′ = K`; `K′_q` principal congruence, `q ∈ S′`; `d = 0` | constant coefficients; `T_{i,v} ∉ 𝕋^{S′}`; pairing `V × V^∨ → 𝔽_ℓ` on a finite set | holds; none |
| 8.7 predicate | `n = 0`; `n = 1`; `{3,3}`, `{1,2}`, `{1,7}` at `q = 7`, `ℓ = 11` | no pairs; no pairs; ratios `1` (false), `{2, 6}` (true), `{7, 8}` (false) | the definition determines the predicate; none |
| 8.8(a) headline | `n = 0`; trivial `r`, `n = 2`; `n = 1`, `F = L = ℚ`, `k = 𝔽_3` | all completely split primes `≠ ℓ`; predicate false everywhere (ratio 1), so the hypothesis is needed; all primes `≠ 3` | true, not vacuous; none |
| 8.8(a) route | two primes with the same class `C ⊂ Gal(L̃/F^gal)` | the classes of the Frobenius elements at the places of `F` are `{gσg⁻¹ : g ∈ H∖G}` for both; `p ≡ p₀` mod `ℓ` | holds; none |
| 8.8(b) headline | `v₀` of degree 2 | class of `Frob_{v₀}` in `Gal(L_r(ζ_ℓ)/F)` fixes `r(Frob)` and `q_v` mod `ℓ`; degree-one places have density 1 | true; none |
| 9.1 constants | `n = 2`: `(2)`, `(1,1)` | weights `1`, `1/2` | holds; none |
| 9.3 | `φ_p = 0`; two terms with coefficients `1, −1` | both sides `0`; total `0`, and (2) asserts nothing | holds; none |
| 9.5 | `GL_2`, `(1,1)`; definite factor | ordinary: slopes `(−1, 0)`, `J = GL_1 × GL_1`, `d_b = 1`; basic: slope `−1/2`, `J = D^×`, `d_b = 0`; point | holds; none |
| 9.6 | `GL_2`, `χ_1 ⊕ χ_2`; trivial representation | needs supercuspidals excluded and additivity on induction; ratio `|·|` excluded by the hypothesis | holds; **R01** on the unnamed inputs |
| 10.1 isotypic degrees | `(d_v, e_i) = (2,1), (2,2), (4,2)` | index `2, 1, 2`; `m_ie_i` a multiple of `2, 2, 4`; `dim_F W = m_i d e = s e d²/g` gives `m_i = s d/g` | holds; none |
| 10.2 elliptic sign | diagonal torus of `GU(1,1)`; the swap `w` | `ν = |λ|² > 0`; eigenlines of `w` are isotropic, centralizer has a split part, so `w` is not elliptic | `f_EP` has `e` times the elliptic integrals; none |
| 10.3 `ep` and `c(π_f)` | trivial `π_∞`: Shimura curve, Harris–Taylor `n = 3`, `n = 1`; discrete series of `U(2,2)` | `2, 3, 1`; `6` parameters in `3` pairs, `dim H^4 = 2 = e`; `c = (−1)^{2q} e (εd)⁻¹ Σ m` | holds; none |
| 10.3 negative control | trivial `π_f` on the Shimura curve | partner `π_∞ = 1` only (real approximation); `K_∞` gives `2 = h^0 + h^2`, `K_max` gives `1` | holds; none |
| 11.5 | `q ∈ Ram(ϖ) ∖ (S ∪ {p, ℓ})`, `D = {q}` | second construction has `q ∉ S ∪ {p′} ∪ Ram(ϖ′)`; the two agree on a density-one set | holds, conditional on the gaps; none |
| 11.6 | minimal `b` with `d_b = d`; no `b` at all | every other `b′` has `d ≤ d_{b′} ≤ d`; then `RΓ(𝒮_{K^p})_{𝔪′} = 0` by §11.3(a) | holds; **R02** on the `*Needs:*` line |
| 11.7 | `F⁺` real quadratic, `n = 3`, `p` split or inert in `F⁺` | `(e, f, g) = (1,1,4)` or `(1,2,2)`; `d = 2` | holds; none |
| 11.8(1)–(2) | perfect complex with reduction in degree `d`; rows of Hochschild–Serre | `H^i/ℓ ↪ H^i(𝔽_ℓ) = 0` for `i ≠ d`, `H^d[ℓ]` a quotient of `H^{d−1}(𝔽_ℓ) = 0`; only the row `b = d`, so `i ≥ d`; `i ≤ d` by duality | holds; none |
| Gap `auxiliary-character-finite-avoidance` | `𝒦 = ℚ(i)`, `F⁺ = ℚ(√5)` | `2` ramifies in `𝒦` and is inert in `F⁺`, so `2 ∉ Spl_{F/F⁺}` and no `ϖ` exists without the hypothesis | precise; none |

### Lean file

- Elaboration from the content checkout with `lake env lean`: exit 0; the only output is `declaration uses 'sorry'` at lines 79 and 91. One `import Mathlib`, no `TauCeti.*` import, no `set_option`, no sorry'd data, 97 lines, `theorem` only.
- `#check @name` for the four declarations in one scratch copy: each type keeps `[NumberField F] [NumberField L] [Algebra F L] [IsGalois F L] [Field k] [Finite k] {n : ℕ}` and `r`; both theorems keep their existential hypothesis. They agree with README §§8.7–8.8. Nothing changed.
- One-tactic probe on both sorried theorems, 14 tactics each (`simp`, `rfl`, `infer_instance`, `exact Set.infinite_univ`, `simpa using h`, `aesop`, `simp_all` unfolding both definitions, `decide`, `exact Set.infinite_of_not_bddAbove (by simp)`, `exact Set.infinite_coe_iff.mp inferInstance`, `exact h.elim fun _ _ => Set.infinite_univ`, `trivial`, `omega`, `exact Set.Infinite.mono (by simp) Set.infinite_univ`): 28 of 28 fail. No padding.
- Headline theorems of the Summary: §§11.5–11.7 (Theorems 6.3.1 and 1.1), §11.8, §9.6, §10.6 with their trace identities, and §8.8. Only §8.8 is statable at the pins, and both parts are stated. The module docstring names the others with the missing carriers (the pinned Tau Ceti and Mathlib have no PEL datum, Igusa variety or étale cohomology of a Shimura variety). No stand-in.
- Backticked names of the roadmap's own: `IsStrongGenericAt`, `IsCompletelySplitStrongGenericPrime`, `infinite_setOf_isCompletelySplitStrongGenericPrime`, `infinite_setOf_isStrongGenericAt_degree_one`; all four are declared, and no other roadmap declares them. `LocallySymmetric.FrankeInput` is attributed to ArithmeticLocallySymmetricSpaces ALS.5b.4, where it is defined.

Pinned declarations resolved with `#check` in the same scratch file: `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`), `NumberField.maximalRealSubfield`, `HeckeRing` (`Mathlib/NumberTheory/HeckeRing/Defs.lean:189`), `IsArithFrobAt`, `Ideal.inertia` (`Mathlib/RingTheory/Ideal/Defs.lean:154`), `Ideal.primesOver`, `Ideal.LiesOver` (`Mathlib/RingTheory/Ideal/Over.lean:128`), `Localization.AtPrime`, `IsLocalization`, `Module.Free`, `HeckeCosetModule.instRingHeckeRing` (`TauCeti/NumberTheory/HeckeRing/Associativity.lean:484`), `HeckeAntiInvolution.ofAmbient`, `HeckeAntiInvolution.onHeckeCoset`. Neither library contains "DecomposedGeneric" or "StrongGeneric".

### Duplication, ownership and suppliers

- All 122 section citations resolve to a heading at the supplier's current head (main for SchemeAndStackFoundations and SmoothRepresentationsOfLocalGroups, the open head for the other 18 roadmaps), and the nine «…» titles of AutomorphicGaloisRepresentationsPartII, AL.3 «Strong multiplicity one», SR.5.2 «Modular generic segments» and §5.10 «Deligne–Serre eigenvalue lifting» resolve to a heading or bold label.
- Read in full this round: ArithmeticLocallySymmetricSpaces ALS.0.4, ALS.5b.4; AutomorphicSpectralTheory §§4.7, 5.10, 6.19, 6.20; EndoscopicTransferAndUnitaryTraceComparison §§6.3, 6.23, 6.29, 8.22, 10.20, 10.21, 10.30, 14.4, 14.5; AutomorphicGaloisRepresentationsPartII AG2.2 «Galois assembly for discrete unitary transfer», «The Caraiani–Scholze discrete normalization», AG2.7 «Strong local decomposed genericity», «Unitary discrete-parameter export»; TorsionCohomologyInfrastructure §3b.2.
- AutomorphicGaloisRepresentationsPartII declares `FiniteModelDecomposedGenericPrime` (ratio `≠ p` only) and `infinitelyManyDecomposedGenericPrimes`. `IsCompletelySplitStrongGenericPrime r p` implies it (`ℓ ∉ v` gives `p ≠ ℓ`; `q_v = p`), and `{3, 3}` separates them. Different names; the Scope says how they differ.
- TorsionCohomologyInfrastructure §3b.2 owns Shin's base change for the similitude group of `U(n, n)`, a hermitian space; EndoscopicTransferAndUnitaryTraceComparison §6.23 treats division algebras in the Harris–Taylor signature. Neither gives the general division-algebra statement, so `gap:division-algebra-unitary-base-change` asks for nothing already provided.
- The three gap slugs and their `needs` agree between the README and `design/plan.json`; each has a named supplier and section. EndoscopicTransferAndUnitaryTraceComparison §6.3 at its head gives finiteness of `Ram_ℚ(ϖ)` only (`Spl_` occurs 0 times there).
- No roadmap on main has this name. `scratch/overlaps.md` lists no competing change, dropped id or revision-only id. No open roadmap states [CS17] Theorem 6.3.1, Theorem 5.5.7 or Corollary 5.6.3, and none cites this roadmap. The board's package index (AnalyticNumberTheory, LawrenceVenkateshMethod) holds nothing on these objects.

Overlap check: read IgusaVarietiesAndTorsionConcentration, AutomorphicGaloisRepresentationsPartII, TorsionCohomologyInfrastructure, EndoscopicTransferAndUnitaryTraceComparison, PotentialAutomorphyInfrastructurePartII; the local genericity predicate is owned by AutomorphicGaloisRepresentationsPartII AG2.7 and cited; the rank-`2n` Hecke algebra, dual ideal and Igusa duality by the parent, and the rank-`2n` Igusa trace identity and factorization by EndoscopicTransferAndUnitaryTraceComparison §§8.22, 14.4, 14.5, each with a variant clause in the Scope; nothing else shared.

Dependency check, complete output:

```text
depcheck: 239 roadmaps, 2262 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `roadmaps resolve` reports no unresolved citation and no unknown Lean name.

### Shape

Four layers (8–11), 29 targets; each layer ends with Examples and Dependencies; every target has a `*Needs:*` line and a locator. Definitions with API and Checks: §8.1 (9 Checks), §8.3 (5), §8.4 (4), §8.5 (7), §8.7 (6), §8.9 (6), §9.4 (4), §10.3 (4), §10.5 (4).

Arrangement: 72 of 86 locators are to CS17. Its contents (CS17 lines 41–52): §5.1 Setup, 5.2 stable trace formula, 5.3 base change, 5.4 transfer at `p`, 5.5 generic principal series, 5.6 simple Shimura varieties, 6.1–6.3. Layer 8 draws on §§1, 5.1, 5.4, 6.2 and 6.3 and has no single counterpart; §§8.9 and 11.1 have none; Layer 9 merges §§5.2–5.5; Layer 10 is §5.6; Layer 11 is §6.3 with §1. The order 9, 10, 11 is forced: Layer 10's Dependencies name §§9.2 and 9.5, and Layer 11's name Layers 8–10. No one-to-one run.

Source independence: 31 passages compared with 5 sources, none shared beyond hypothesis lists the mathematics forces (longest common run 7 words, at CS17 line 4367); largest share CS17, 72 of 86 locators; contents compared with CS17: independent.

## Not verifiable

- No cited text was unreadable.
- Supplier sections not listed above as read in full were resolved by heading only this round; rounds 6 and 7 read EndoscopicTransferAndUnitaryTraceComparison §§6.9, 6.15, 6.25, 8.21, 10.32, 14.1–14.3, PELModuli §M3.4 and the parent's §5.1.

## Source issues

- **Misprint** in CS17 at Lemma 5.4.3, printed p. 741: the source says the reduction of an unlabelled local representation vanishes; it should name the labelled endoscopic representation of the hypothesis; affects a stated result.
- **Misprint** in CS17 at Theorem 5.5.7 and Corollary 5.6.3, printed pp. 747 and 750: the source says a complex embedding is composed with the p-adic-to-complex isomorphism; it should use the inverse isomorphism; affects a stated result.
- **Misprint** in CS17 at Theorem 5.5.7, printed p. 747: the source says base change at p in the vanishing statement; it should be base change outside the finite set, as in its proof; affects a stated result.
- **Misprint** in CS17 at Theorem 6.3.1(1), printed p. 757: the source says the similitude factor at q is the p-adic units and numbers; it should be the q-adic ones; affects a stated result.
- **Misprint** in CS17 at §5.6, printed p. 749: the source says the acceptable-function extension is Lemma 6.4 of Shin's 2011 Annals paper; it should be Lemma 6.4 of Shin's Igusa point-counting paper; affects nothing.
- **Misprint** in CS17 at proof of Theorem 6.3.1, printed p. 759: the source says Theorem 5.5.5 gives the Galois representation; it should be Corollary 5.5.5; affects nothing.
- **Error** in CS17 at Lemma 5.5.1, printed p. 742: the source says every contributing archimedean component is cohomological for the trivial representation; it should say for the coefficient systems of the Lefschetz functions, nontrivial for proper endoscopic groups; affects a stated result.
- **Gap** in CS17 at §5.1, printed p. 730: the source says every such positive PEL datum is a Shimura datum in its own sense; it should exclude wholly definite data of rank at least two; affects the proof.
- **Gap** in CS17 at proof of Theorem 5.5.7, printed p. 748: the source says the restriction-of-scalars Kottwitz set equals that of the one noncentral embedding; it should include the central translation from the other embeddings; affects the proof.
- **Gap** in CS17 at proof of Theorem 6.3.1, printed p. 758: the source says nonvanishing at finite level in the least degree gives nonvanishing at infinite level in that degree; it should say in some degree no larger; affects the proof.
- **Gap** in CS17 at §5.6, printed p. 749: the source says the appendix base-change theorem gives Galois representations for the division-algebra group; it should justify the passage from hermitian spaces to division algebras; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "035f4521ad747d7fed24e4d605202f0b72219750", "job": "REV-PKG-IgusaVarietiesAndTorsionConcentrationPartII~8", "model": "fable", "worker": "chris-x89"} -->
