<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13063#issuecomment-6902723140 -->
Review (claude) of 5160e70

Verdict: needs_changes

1. **F01** (P3) supplier contracts, `*Needs:*` lines and Layer 8 Dependencies disagree in nine ids

   **Location.** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md`:

   - §8.5 `*Needs:*`: "IgusaVarietiesAndTorsionConcentration §5.1"; §8.6 `*Needs:*`: "IgusaVarietiesAndTorsionConcentration §§1.3, 1.7, 5.2"; Layer 8 Dependencies repeat both.
   - §9.3 `*Needs:*`: "EndoscopicTransferAndUnitaryTraceComparison §§5.1, 6.1, 6.8, 6.10, 6.22, 8.11, 14.2, 14.3"; Layer 9 Dependencies repeat §5.1.
   - Supplier contract, PELModuli: "§§M0.2, M0.6, M0.7, M0.9, M0.13, M0.16–M0.17 and M0.27".
   - Layer 8 Dependencies: "AutomorphicGaloisRepresentationsPartII AG2.0, AG2.7" and "Mathlib `NumberField.IsCMField`, `HeckeRing`, `IsArithFrobAt`, `Module.Free`; Tau Ceti `HeckeCosetModule.instRingHeckeRing`, `HeckeAntiInvolution.ofAmbient`".

   **Claim.** A section consumed by a target has a contract entry saying what is assumed of it, and an entry of a contract or of a Layer's Dependencies is needed by some target of that layer. Comparing the three places mechanically (20 supplier roadmaps and the two libraries, four layers) gives nine mismatches, all in Layers 8 and 9:

   1. The parent's §§5.1 and 5.2 are in two `*Needs:*` lines and in the Layer 8 Dependencies, but the subsection "From TauCetiRoadmap.IgusaVarietiesAndTorsionConcentration" has no entry for either (its bullets are §§0.11, 0.12, 0.24, 1.1–1.2, 1.3, 1.4, 1.4a, 1.6, 1.7–1.8, 3.14, 3.17, 4.5, 5.5).
   2. EndoscopicTransferAndUnitaryTraceComparison §5.1 is in the §9.3 `*Needs:*` line and the Layer 9 Dependencies, but that supplier's subsection has no entry for it (it goes from §1.16 to §6.1).
   3. PELModuli §§M0.9 and M0.17 are in the contract and in no `*Needs:*` line and no Layer Dependencies. §8.1 uses both: its pieces are indexed by the finite set `ker¹(ℚ, G)`, and its canonical models live over the reflex field `E`.
   4. AutomorphicGaloisRepresentationsPartII AG2.0 is in the Layer 8 Dependencies and in no `*Needs:*` line of Layer 8. §8.4 uses it: the Conventions say `P_v` is "matched with geometric Frobenius as in AutomorphicGaloisRepresentationsPartII AG2.0".
   5. Five library names in `*Needs:*` lines of Layer 8 are missing from its Dependencies: `NumberField.maximalRealSubfield` (§8.1), `Ideal.inertia`, `Ideal.primesOver`, `Ideal.LiesOver` (§8.7), `HeckeAntiInvolution.onHeckeCoset` (§8.5).

   **Witness.** In the README, "M0.9" and "M0.17" each occur once (the contract bullet); "AG2.0" occurs in the Conventions, the contract and the Layer 8 Dependencies only; `Ideal.inertia` occurs in the Mathlib contract and the §8.7 `*Needs:*` line only. The parent at its head has "### 5.1 Dual Hecke ideals and their Galois systems" and "### 5.2 Hecke-equivariant Poincaré duality"; EndoscopicTransferAndUnitaryTraceComparison at its head has "### 5.1 The supplied residual block and its endoscopic label".

   **Exact repair.**

   1. Under "From TauCetiRoadmap.IgusaVarietiesAndTorsionConcentration" add: "§§5.1 and 5.2: for the rank-`2n` datum, the involution `ι` with `𝔪^∨ = ι(𝔪)` and the dual Galois system, and Hecke-equivariant Poincaré duality on finite-level Igusa varieties, `RΓ_c(Ig, Λ)_{𝔪^∨} ≅ RHom_Λ(RΓ(Ig, Λ)_𝔪, Λ)[−2d_b](−d_b)`. §§8.5 and 8.6(2) run the same arguments for the data of this roadmap."
   2. Under "From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison" add, before the §6.1 bullet: "§5.1: the discrete representations `ρ ⊠ b` of `GL_m(𝔸_F)` attached to a unitary cuspidal `ρ` of `GL_a(𝔸_F)`, `ab = m`, with existence, uniqueness and multiplicity one. They are the discrete `Π_M` of §9.3."
   3. §8.1 `*Needs:*`: "PELModuli §§M0.2, M0.6, M0.7, M0.9, M0.12, M0.13, M0.16, M0.17, M1.9, M2.10, M3.1, M3.4, M4.3, M5.5". Layer 8 Dependencies: add M0.9 and M0.17 to the PELModuli list.
   4. §8.4 `*Needs:*`: add "AutomorphicGaloisRepresentationsPartII AG2.0".
   5. Layer 8 Dependencies, last clause: "Mathlib `NumberField.IsCMField`, `NumberField.maximalRealSubfield`, `HeckeRing`, `IsArithFrobAt`, `Ideal.inertia`, `Ideal.primesOver`, `Ideal.LiesOver`, `Module.Free`; Tau Ceti `HeckeCosetModule.instRingHeckeRing`, `HeckeAntiInvolution.ofAmbient`, `HeckeAntiInvolution.onHeckeCoset`."

   **Repair tested.** Each of the nine ids is then in the contract, in a `*Needs:*` line and in its Layer's Dependencies. Layers 10 and 11 already agree (no id in one place only). No supplier roadmap is added, so the dependency check is unchanged. On the instance of item 3: §8.1 writes `S_K = ⊔_{a ∈ ker¹(ℚ, G)} S_K^{(a)}`, and PELModuli §M0.9 at its head is the section that "supplies the finite, all-place kernel"; §M0.17 identifies the PEL reflex field with that of the Shimura datum under SV3, the hypothesis under which §8.1 invokes §M4.3.

2. **F02** (P3) the manifest entry of `CS17` omits two README sections that cite it

   **Location.** `packages/IgusaVarietiesAndTorsionConcentrationPartII/sources.toml`, `CS17`: `cited_for = ["Summary", "Conventions", "8.1", …, "11.8", "Exact supplier contracts: gap unitary-discrete-local-comparison"]`.

   **Claim.** The list names each README section that cites the work. `[CS17]` is also cited, with locators, in "Scope and ownership" and in seven further bullets of "Exact supplier contracts", among them the other gap contract of the same supplier.

   **Witness.** README, Scope: "the Caraiani–Scholze discrete normalization of [CS17] Corollary 5.5.5" and "[CS17] Lemma 5.5.8". Contracts: "[CS17] Theorem 4.4.4", "[CS17] Corollary 6.1.4", "[CS17] Lemma 6.2.2", "[CS17] Lemma 5.4.2", "[CS17] §5.6 (CS17 line 4092)" in gap:division-algebra-unitary-base-change.

   **Exact repair.** In the `CS17` entry replace `"Exact supplier contracts: gap unitary-discrete-local-comparison"` by `"Scope and ownership", "Exact supplier contracts"`. Change nothing else in the entry.

   **Repair tested.** After the change every README section containing `[CS17]`, outside the layer Examples and the References (36 headings), has its label in the list; the other four keys already match (`Shin-BCU`: §10.4 and its gap; `Shin11`: its gap and §10.2; `Shin09`: contracts, §§8.9, 10.2, 11.4; `Shin12`: §10.1).

Two findings, both P3, both bookkeeping: the three places that list a supplier input (the supplier contracts, the `*Needs:*` lines, the Layer Dependencies) disagree in nine ids, and the `CS17` entry of the manifest omits two README sections that cite it. Both round-8 findings are repaired. No finding re-raises one that a repair report marked "not actionable in this package". Every statement I recomputed holds, the Lean file elaborates with `sorry` as its only warning, and no maintainer note was left for this roadmap.

## Verified sound

### Round-8 findings and their repairs

| Finding | Status; repaired passage | Verification |
|---|---|---|
| F01 (P3), §§9.6 and 10.6 pass from a parameter to a principal series with no named supplier | **Repaired.** §9.6: "Let `(ρ_1, …, ρ_k)` be the supercuspidal support of `π` … (SmoothRepresentationsOfLocalGroups SR.3.1 «Cuspidal support»). Then `σ_ss(π) = ⊕_j σ_ss(ρ_j)` (… §10.20 …), and `σ_ss` of a supercuspidal … is irreducible of dimension `m` (§10.21 there)". §10.6: "by the argument of §9.6 applied to the component `Π⁰_{𝔭_i} ≅ π_{𝔭_i}`". Both `*Needs:*` lines, the contract bullet and the Layer 9 and 10 Dependencies carry §§10.20, 10.21, 10.26, 10.30, SR.3.1 and SR.5.2. | Read the four sections at the supplier's head: §10.20 "rank-one geometric reciprocity; normalized-induction constituent sum"; §10.21 "a bijection from supercuspidal … to irreducible continuous `n`-dimensional … with finite inertia image"; §10.26 "Forgetting `N` and taking Weil semisimplification gives `σ_ss(π)`"; §10.30 "`LLC_WD(π)=C_geo(π)`". SR.3.1 on main: "Every irreducible V is a subquotient of i_P σ for some cuspidal datum", `i_P` normalised. The fix's own correction (the principal series is `π`, so `Π⁰` is induced from `ψ_a|·|^{(n−1)/2}`) is right: `Π⁰ = π|det|^{(n−1)/2}`. |
| F02 (P3), three `*Needs:*` lines and the Layer 8 Dependencies omit inputs | **Repaired.** §8.3: "BunGAndNewtonStrata §§1.13, 1.23, 1.25, 1.26, 1.30"; §8.9: "BunGAndNewtonStrata §§1.25, 1.26"; §11.6: "ArithmeticGaloisRepresentations §§1.8, 5.9; BunGAndNewtonStrata §§1.25, 1.26"; Layers 8 and 11 Dependencies follow. | BunGAndNewtonStrata §1.25 "unique maximum … ordinary exactly when its Newton point equals `μ◇`", §1.26 "existence is guaranteed for quasi-split `G`". ArithmeticGaloisRepresentations §1.8 has the form §11.6 needs when `ℓ ≤ n`: "semisimple representations with equal characteristic polynomials at every `g` are isomorphic, in any characteristic". |

The repaired pattern in the rest of the package is R01: the fix round compared routes with `*Needs:*` lines, not the contracts and the Layer Dependencies with them.

### Principles

General library (both cases, every rank and signature, wholly definite data, no prime excluded beyond `ℓ ≠ p`). Part II, the parent's stopping point in the second paragraph. One direction of supply (dependency check below). No copied passage, no algorithm, no sorry'd data, no `set_option`. No pull-request number, date, round label, machine path, HTML anchor or LaTeX delimiter in the README (searched 22 patterns).

### Source sample (15 seeded targets; all five texts read; the author flagged none as unverified)

| Target | Locator read | Result |
|---|---|---|
| 8.2 | CS17 lines 3236–3240 (p. 729), 3288–3297 (pp. 730–731), 4361–4379 (pp. 756–757) | Theorem 4.4.4 at line 3236; good models at an unramified prime split in `𝒦`; the properness argument is the README's. |
| 8.3 | CS17 lines 3678–3713 (pp. 740–741), 3978–4036 (pp. 747–748), footnote 30 at 4056 | Product decomposition, `S_i`, the single point for central `μ_i`; line 4034 identifies the two Kottwitz sets with no translation, as the README says. |
| 8.4 | CS17 lines 4380–4383, 4387–4408 (p. 757) | `𝕋^S`, `T_{i,v}`, the polynomial with `q_v^{i(i−1)/2}`; the `p`-adic similitude factor at `q` is printed at lines 4402 and 4407. |
| 8.5 | CS17 lines 4465–4467 (p. 759) | The "dual" eigensystem is used there; the rule and its proof are the README's. |
| 8.7 | CS17 lines 149–153 (p. 652), 4326–4331 (p. 755), 4409–4413 (p. 757) | Arithmetic Frobenius, ratios outside `{1, q}`, `ℓ ≠ p`; "at most one `τ`". |
| 9.5 | CS17 lines 4007–4009, 4021–4050 (pp. 747–748) | Lemma 5.5.8 at line 4037; `J_b ≅ GL_{n−q} × GL_q` with `n − q = p_τ` for the ordinary class. |
| 10.2 | CS17 lines 4073–4078 (p. 749); Shin09 line 879 (author p. 20) | Identity with two nonzero constants; the lemma on acceptable functions is in Shin09. |
| 10.3 | CS17 lines 4082–4090 (p. 749) | Formula and index set; the explicit `c(π_f)` is the README's. |
| 11.1 | CS17 lines 4441–4450 (p. 758), 4457–4461 (p. 759) | The source localizes Igusa cohomology at `𝔪 ⊂ 𝕋^S` there and does not state the contraction; the lemma and its proof are the README's (see Source issues). |
| 11.2 | CS17 lines 4436–4441 (p. 758), footnote 34 at 4453 | Hochschild–Serre between the two levels; the weakening to "some `j ≤ i`" is the README's correction. |
| 11.3 | CS17 lines 4442–4448 (p. 758), 4495–4497 (p. 760), 3236, 4300–4302 | Leray for `π_HT` and the stalk identification. |
| 11.4 | CS17 lines 4244–4248 (p. 753), 4259–4262 (p. 754), 4457–4474 (p. 759) | Corollary 6.1.4, split injective transitions, pro-`p` invariants, flatness, the dual eigensystem. |
| 11.6 | CS17 lines 4409–4416 (p. 757), 4475–4497 (pp. 759–760), 4339–4343 (p. 756) | Statement and the four steps. |
| 11.7 | CS17 lines 84–115 (p. 651), 4422–4434 (p. 758) | Both hypotheses, footnote 2, Remarks 6.3.2–6.3.3 with footnote 33. |
| 11.8 | CS17 lines 101–103, 131–133 | One sentence each in the source; statements and proofs are the README's. |

Also read: CS17 lines 41–52 (contents), 3258–3293, 3714–3756, 3945–3966, 4059–4067, 4102–4111; Shin09 lines 570–575 (author p. 13) and 703 (p. 16); Shin11 lines 3470–3474 (p. 1722); Shin-BCU lines 13–17 and 41–53; Shin12 lines 978–981 (author p. 20). No source was fetched, the manifest was not edited, and `needs-references.toml` was not written.

### Adversarial pass (values computed this round)

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| §9.6 route, repaired | `GL_2`, `q = 7`, unramified `χ_1, χ_2` with geometric Frobenius `1, 2`; trivial representation; supercuspidal | `ψ_a(ϖ) = 1, 2`, ratio `2 ∉ {7, 1/7}`, so `ψ_1 × ψ_2` is irreducible and `Π⁰` has Satake parameters `1/√7, 2/√7`; trivial: Frobenius `1, 7`, ratio `ε^{±1}`, excluded by (ii); supercuspidal: irreducible 2-dimensional parameter, not `χ_1 ⊕ χ_2` | holds; none |
| §9.6, cyclotomic ↔ `|·|` | `ϖ ↦ Φ_geo` | `ε(Φ_geo) = q⁻¹ = |ϖ|`; (ii) is over ordered pairs, so both `|·|` and `|·|⁻¹` are excluded | holds; none |
| §9.6, monodromy | `r|_{G_w} = ⊕ χ_a`, `ℓ ≠ p` | by Grothendieck's monodromy theorem a one-dimensional representation has `N = 0`, so the semisimplified comparison loses nothing | holds; none |
| §10.6 route, repaired | Case 1, `B` split above `p`; definite `G_ℝ`; `n = 1` | `Π⁰_{𝔭_i} ≅ π_{𝔭_i}` through §10.4; no nontrivial `i`; a character | holds; none |
| §8.3(5) | `S_i = {(1,1), (2,0)}`, `n = 2` | bound `diag(t², t)`, `κ = −3`; after `p·I_2` (valuation 2), `−1`; pairings `(0+1)+(−1+1) = 1` and `2·(1/2) = 1 = d` | holds; none |
| §8.4 Satake image | general `n`; `n = 2` | `S(T_i) = q^{i(n−i)/2} e_i`, and `i(i−1)/2 + i(n−i)/2 = i(n−1)/2`; `X² − √q(x_1+x_2)X + q x_1x_2` | holds; none |
| §8.5(1)–(2) | `n = 2`, `q = 7`, `ℓ = 11`, roots `{1, 2}`; `{3, 6}`; degree character mod 5 and mod 3; `𝔽_9`, `n = 1` | `T = (3, 5)`, dual `(5, 9)`, `X² − 5X + 8`, roots `{7, 9}` (sum 16 ≡ 5, product 63 ≡ 8); `{6, 3}`; `X² − X` with root `0`, and `X² + 2` with `{1, 2} ↦ {2, 1}`; `a ↦ a³ = −a` | holds exactly when `q ∉ 𝔪`; none |
| §8.6(1) | `Λ = ℤ/ℓ^r`; `𝔪 ∌ ℓ` | `H^i_𝔪 ≅ Hom(H^{2d−i}_{𝔪^∨}, Λ)(−d)`; both sides `0` | holds; none |
| §8.7 predicate | `n = 0`; `n = 1`; `{3,3}`, `{1,2}`, `{1,7}` at `q = 7`, `ℓ = 11` | `v` maximal and `ℓ ∉ v` only; same, plus inertia; ratios `1` (false), `{2, 6}` (true), `{7, 8}` (false) | the definition determines the predicate; none |
| §8.8(a) headline | `n = 0`; trivial `r`, `n = 2`; `Q = ⊥` | all completely split `p ≠ ℓ`; ratio `1`, predicate false everywhere, so the hypothesis is not implied; `⊥` lies over `v` only for `v = ⊥`, not maximal in `𝓞 F` | true, not vacuous; none |
| §8.8(a) route | a prime `p` with the Frobenius class of `p₀` in `Gal(L̃/ℚ)`; `L` ramified at `p₀` | trivial on the Galois closure of `F`, same classes `{r(Frob_v)}`, `p ≡ p₀` mod `ℓ`; the predicate asks only `r(inertia) = 1`, and the route uses the field cut out by `r` | holds; none |
| §8.8(b) headline | `v₀` of degree 2 | the class of `Frob_{v₀}` in `Gal(L_r(ζ_ℓ)/F)` fixes `r(Frob)` and `q_v` mod `ℓ`; degree-one places have density 1 | true; none |
| §8.8(b), choice of `ι_p` | `v` of degree one over `p ∉ S` | `F_v = ℚ_p`, so `S_i = {τ₀}` for `𝔭_i = v`; `τ₀c` lies over `u^c`; every other `S_j` is definite | holds; none |
| §9.4 API | `n = 2`, `q = 7`, trivial `Π⁰_v` | parameters `(√7, 1/√7)`, eigenvalues `7, 1`, `X² − 8X + 7` | holds; none |
| §9.5 | `GL_2`, `(1,1)` | ordinary: slopes `(−1, 0)`, `J = GL_1 × GL_1`, `d_b = 1`; basic: slope `−1/2`, `J = D^×`, `d_b = 0` | holds; none |
| §10.1 local index | `B` of degree `n`, `0 < n₁ < n`; a non-split place of `F/F⁺` | if every `d_v | n₁` then `n = lcm d_v | n₁`, impossible; `inv_v = 0` there (corestriction), so `d_v > 1` only at split places | holds; none |
| §10.3 `ep` | `n = 1`; Shimura curve, trivial `π_∞`; full pair | `1`; `2 = h⁰ + h²` with `e = 2`; `1 − 1 = 0` | holds; none |
| §11.1 | finite `M = ⊕_𝔐 M_𝔐`; `𝔐 ∩ 𝕋^{S′} = 𝔫 ≠ 𝔪′` | `t ∈ 𝔫 ∖ 𝔪′` is nilpotent on `M_𝔐` and inverted, so `(M_𝔐)_{𝔪′} = 0`; for `𝔫 = 𝔪′` the localization is `M_𝔐` | holds; none |
| §11.2(a) | least `j₀` with `H^{j₀}(𝒮_{K^p})_𝔪 ≠ 0` | rows `b < j₀` vanish, so `H^i(S_K)_𝔪 = 0` for `i < j₀` | holds; none |
| §11.4(2) | `RΓ_𝔪 = M[−d_b]`, `M` free | `RHom(M[−d_b], ℤ_ℓ)[−2d_b] = M^∨[−d_b]` | holds; none |
| §11.6 | minimal `b` with `d_b = d`; no `b` | every other `b′` has `d ≤ d_{b′} ≤ d`; all stalks vanish and §11.3(a) applies | holds; none |
| §11.8(2)–(3) | neat `K`, centre; `ξ` nontrivial | a unit `x` with `x x^c ∈ ℚ` has `x x^c = 1`, is a root of unity, hence trivial in neat `K`: the cover has group `K/K′`; `K′_ℓ ≠ K_ℓ`, so `ℓ ∈ S′` (a stated restriction) | holds; none |
| R01 item 3 | §8.1, `ker¹(ℚ, G)` and `E` | PELModuli §M0.9 is the section for the finite kernel, §M0.17 for the reflex field under SV3; neither is in a `*Needs:*` line | finding R01 |
| Gap `auxiliary-character-finite-avoidance` | `𝒦 = ℚ(i)`, `F⁺ = ℚ(√5)` | `2` ramifies in `𝒦` and is inert in `F⁺`, so no `ϖ` exists without the hypothesis | precise; none |

### Lean file

- Elaboration from the content checkout with `lake env lean`: exit 0; the only output is `declaration uses 'sorry'` at lines 79 and 91. One `import Mathlib`, no `TauCeti.*` import, no `set_option`, no sorry'd data, 97 lines, `theorem` only.
- `#check @name` for the four declarations (the worker's elaborated signatures, and my scratch copy): each keeps `[NumberField F] [NumberField L] [Algebra F L] [IsGalois F L] [Field k] [Finite k] {n : ℕ}` and `r`; both theorems keep their existential hypothesis. They agree with README §§8.7–8.8. Nothing changed.
- One-tactic probe on both sorried theorems, 18 tactics each in one scratch file (`simp`, `rfl`, `infer_instance`, `exact Set.infinite_univ`, `simpa using h`, `aesop`, `simp_all` unfolding both definitions, `decide`, `trivial`, `omega`, `tauto`, `norm_num`, and six `exact` terms from `Set.Infinite` and `Nat.infinite_setOf_prime`): 36 of 36 fail. No padding.
- Headline theorems of the Summary: [CS17] Theorems 1.1 and 6.3.1 (§§11.5–11.7), their integral and coefficient forms (§11.8), Theorem 5.5.7 (§9.6) and Corollary 5.6.3 (§10.6) with their trace identities, and the auxiliary primes (§8.8). Only §8.8 is statable at the pins, and both parts are stated. The module docstring names the others with the missing carriers. No stand-in.
- Backticked names of the roadmap's own: `IsStrongGenericAt`, `IsCompletelySplitStrongGenericPrime`, `infinite_setOf_isCompletelySplitStrongGenericPrime`, `infinite_setOf_isStrongGenericAt_degree_one`; all four are declared, and no roadmap on main or open declares any of them. `FiniteModelDecomposedGenericPrime` is attributed to AutomorphicGaloisRepresentationsPartII, whose `Suggested.lean` declares it; `LocallySymmetric.FrankeInput` to ArithmeticLocallySymmetricSpaces ALS.5b.4, whose README names it.

Pinned declarations opened: `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean`), `NumberField.maximalRealSubfield` (`Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:126`), `HeckeRing` (`Mathlib/NumberTheory/HeckeRing/Defs.lean:189`), `AlgHom.IsArithFrobAt` and `IsArithFrobAt` (`Mathlib/RingTheory/Frobenius.lean:55` and `:184`), `Ideal.inertia` (`Mathlib/RingTheory/Ideal/Defs.lean:154`, an abbreviation of the `AddSubgroup.inertia` the Lean file writes), `Ideal.LiesOver` and `Ideal.primesOver` (`Mathlib/RingTheory/Ideal/Over.lean:128` and `:379`), `Localization.AtPrime`, `IsLocalization`, `Module.Free` (resolved with `#check`), `HeckeCosetModule.instRingHeckeRing` (`TauCeti/NumberTheory/HeckeRing/Associativity.lean:484`), `HeckeAntiInvolution.ofAmbient` and `.onHeckeCoset` (`TauCeti/NumberTheory/HeckeRing/Commutativity.lean`). Neither library contains "DecomposedGeneric" or "StrongGeneric".

### Duplication, ownership and suppliers

- All 128 section ids cited resolve to a heading at the supplier's current head: main for SchemeAndStackFoundations, SmoothRepresentationsOfLocalGroups and IntegralHeckeAndGaloisDeterminants, the open head for the other 17. The nine «…» titles of AutomorphicGaloisRepresentationsPartII lie in the layers they are cited under, AL.3 «Strong multiplicity one» is AL.3.7, SR.3.1 «Cuspidal support» and SR.5.2 «Modular generic segments» are bold labels on main, and R15.5 is AlgebraicModularFormsAndSerreWeights' own identifier for its Layer 5, with "### 5.10 Deligne–Serre eigenvalue lifting".
- Read in full this round: EndoscopicTransferAndUnitaryTraceComparison §§5.1 (opening), 10.18, 10.20, 10.21, 10.26, 10.30; SmoothRepresentationsOfLocalGroups SR.3.1 «Cuspidal support», SR.5.2 «Modular generic segments»; BunGAndNewtonStrata §§1.25, 1.26; ArithmeticGaloisRepresentations §1.8 and §5.9 (opening); the parent's §§4.5, 5.1, 5.2, 5.5; PELModuli §§M0.9, M0.17; AutomorphicGaloisRepresentationsPartII AG2.1a «The compact unitary PEL instance».
- AutomorphicGaloisRepresentationsPartII AG2.1a «The compact unitary PEL instance» fixes one datum (Shin's, odd `n ≥ 3`, signature `(1, n−1)` at one place and `(0, n)` elsewhere) with Drinfeld level at a split place and its Kuga powers. It is an instance of Case 2 of §8.1; this roadmap owns the general Cases 1 and 2 at hyperspecial level, built on PELModuli §M5.5, and states none of AG2.1a's level structures. A more special statement elsewhere is no second owner.
- The three gap slugs and their `needs` agree between the README and `design/plan.json`; each has a named supplier and section, is precise, and asks for nothing provided (EndoscopicTransferAndUnitaryTraceComparison §6.3 gives finiteness only; AG2.2's assembly is for rank `2n` and B = F; AG2.7's export is for a supercuspidal summand).
- No roadmap on main has this name, and none on main or open cites it. `scratch/overlaps.md` lists no competing change, dropped id or revision-only id. No open roadmap states [CS17] Theorem 5.5.7, Corollary 5.6.3 or the compact Theorem 6.3.1 (searched by theorem number and by "simple Shimura variet"). The board's package index (AnalyticNumberTheory, LawrenceVenkateshMethod) holds nothing on these objects.

Overlap check: read IgusaVarietiesAndTorsionConcentration, AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison, TorsionCohomologyInfrastructure, PotentialAutomorphyInfrastructurePartII, SmoothRepresentationsOfLocalGroups; the local genericity predicate is owned by AutomorphicGaloisRepresentationsPartII AG2.7 and cited; the rank-`2n` Hecke algebra, dual ideal and Igusa duality by the parent, and the rank-`2n` Igusa trace identity by EndoscopicTransferAndUnitaryTraceComparison §§8.22, 14.4, 14.5, each with a variant clause in the Scope; the semisimple parameter of `GL_m` by EndoscopicTransferAndUnitaryTraceComparison §§10.18–10.30 and cited; nothing else shared.

Dependency check, complete output:

```text
depcheck: 239 roadmaps, 2271 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `roadmaps resolve` reports no unresolved citation and no unknown Lean name.

### Shape

Four layers (8–11), 29 targets; each layer ends with Examples and Dependencies; every target has a `*Needs:*` line and a locator. Definitions with API and Checks: §8.1 (9 Checks), §8.3 (5), §8.4 (4), §8.5 (7), §8.7 (6), §8.9 (6), §9.4 (4), §10.3 (4), §10.5 (4).

Arrangement: 72 of 86 locators are to CS17. Its contents (CS17 lines 41–52): 5.1 Setup, 5.2 stable trace formula, 5.3 base change, 5.4 transfer at `p`, 5.5 generic principal series, 5.6 simple Shimura varieties, 6.1–6.3. Layer 8 draws on §§1, 5.1, 5.4, 6.2 and 6.3 and has no single counterpart; §§8.9 and 11.1 have none; Layer 9 merges §§5.2–5.5; Layer 10 is §5.6; Layer 11 is §6.3 with §1. The order 9, 10, 11 is forced: Layer 10's Dependencies name §§9.2 and 9.5, and Layer 11's name Layers 8–10. No one-to-one run.

Source independence: 24 passages compared with 5 sources, none shared beyond hypothesis lists the mathematics forces (longest common run 7 words, at CS17 line 94); largest share CS17, 72 of 86 locators; contents compared with CS17: independent.

## Not verifiable

- No cited text was unreadable.
- Supplier sections not listed above as read in full were resolved by heading only this round; earlier rounds read ArithmeticLocallySymmetricSpaces ALS.0.4, ALS.5b.4, AutomorphicSpectralTheory §§4.7, 5.10, 6.19, 6.20 and EndoscopicTransferAndUnitaryTraceComparison §§6.3, 6.23, 8.22, 14.4, 14.5.

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
- **Gap** in CS17 at proof of Theorem 6.3.1, printed pp. 758–759: the source says infinite-level and Igusa cohomology are localized at an ideal of the Hecke algebra that includes the factor at p; it should use its contraction to the factors away from p; affects the proof.
- **Gap** in CS17 at §5.6, printed p. 749: the source says the appendix base-change theorem gives Galois representations for the division-algebra group; it should justify the passage from hermitian spaces to division algebras; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5160e7006a5578c1d0591fb3b04d2d2c1def255b", "job": "REV-PKG-IgusaVarietiesAndTorsionConcentrationPartII~9", "model": "fable", "worker": "chris-x79"} -->
