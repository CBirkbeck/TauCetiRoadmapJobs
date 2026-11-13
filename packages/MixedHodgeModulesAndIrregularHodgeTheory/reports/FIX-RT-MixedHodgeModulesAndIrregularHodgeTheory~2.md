# Repair report: FIX-RT-MixedHodgeModulesAndIrregularHodgeTheory~2

This round settles the findings of red-team passes `RT-MixedHodgeModulesAndIrregularHodgeTheory~2a` and `~2b`. The two reviews do not overlap, so each finding has its own section. All seven findings hold, and all are applied. No section, layer or target id changed, and `Suggested.lean` is unchanged. The only id removed is the supplier gap `gap:blowup-exceptional-divisor`, which no roadmap cites.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2a/F01 (P1) — applied

Changes:
- "by formal stationary phase" → **Theorem (regular formal stationary phase)** in §2.4, before `ℱ`: smooth on `G_{m,t}`, `⊕ E^{ct} ⊗ R_c` at `∞` with `rank R_c = rank(T_c − 1)`, regular at `0`.
- `F^{(0,∞)}`, its model and the comparison at `∞` are proved here (BE04, Sab08; SchemeAndStackFoundations §4.9).
- `ℱ` and §9.7 consume the theorem.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2a/F02 (P3) — applied

Changes in §4.1:
- "compatible when … exact" now adds that two filtrations are always compatible, and that for vector spaces compatibility is distributivity of the generated lattice (Sai88 lines 353–363 and 739–757).
- Three Checks added: coordinate planes in `ℂ³` (`2 = 2`), three lines in `ℂ²` (`1 ≠ 0`, not compatible), and repeated steps (`1 = 1`).

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2b/F01 (P2) — applied

Changes:
- `gap:blowup-exceptional-divisor` → ResolutionOfSingularitiesCharacteristicZero §1.5 (on main: "A permissible blowup has smooth ambient space and updated SNC boundary"), applied to the marked ideal `(I_Ξ, 1)`.
- The new citation appears in Scope, the contracts, §8.8 (route, Needs) and the Dependencies.
- The gap's contract paragraph, its `design/plan.json` entry and the unused SchemeAndStackFoundations §5.5 are deleted.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2b/F02 (P3) — applied

Vacuous Checks replaced and recomputed:
- §2.3: `M ⋆ 0 = 0` → `δ_a ⋆ O = O`.
- §6.1: zero object → `j_*L[1]`, `T = −1`.
- §6.3: `E ⊗_E 0 = 0` → `K ⊗^H K = K[1]`.
- §7.4: empty statement → jump `1/2` of the `x²` summand.
- §2.4: `ℱ(0) = 0` deleted; three Checks remain.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2b/F03 (P3) — applied

Changes:
- §8.10 Needs and Dependencies gain SchemeAndStackFoundations §4.11, SchemeKTheoryOperations §5.7 and ResolutionOfSingularitiesCharacteristicZero §1.5.
- §7.3: "Hodge-norm estimates of 3.2" → "of ShimuraVarieties §3.5b.2, applied on the power cover of 3.2"; the citation is added to its Needs and Dependencies.
- The same pattern is aligned elsewhere: every Dependencies clause now matches its Needs line (4.4, 5.3, 6.7).

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2b/F04 (P3) — applied

Change in §4.3: "treated by the Kashiwara clause" → for `g ≡ 0` on the strict support, Kashiwara's equivalence (SpringerResolutionAndCharacteristicCycles §9.2) gives `ψ_g M = 0`, `φ_{g,1} M = M` and `N_φ = 0`.
- The condition is therefore circular in the induction and automatic in Saito's largest-family formulation (Sai88 5.1.6, lines 3352–3367).
- Test case: `δ_0`, `g = x`.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2b/F05 (P3) — applied

Changes:
- §1.5: Kash84 "§7, pp. 355–358" → "pp. 355–359". Printed page = PDF page + 318, and §8 begins at Kash84 line 1271 on p. 359.
- References: MT "pp. 34–40" → "pp. 35–40". The appendix starts at MT line 1952, after the p. 35 marker at line 1938.

## How the findings were verified

The branch head already carried an earlier repair of this job. Each finding was re-verified against that text, the cached sources and the sibling roadmaps. One defect remained in the 2a/F01 repair: the definition of `F^{(0,∞)}` used "an algebraic model" whose existence had no owner, and the route of the comparison at `t = ∞` named no inputs. This round adds both to the proof route of the §2.4 theorem:
- **The model.** By the refined Turrittin–Levelt decomposition (Sab08, Proposition 3.1 and Corollary 3.3, p. 7, Sab08 lines 304–335, the refined form of PadicDifferentialEquationsAndRigidCohomology §RD.6.52a), `R = ⊕ ρ_+(E^φ ⊗ R′)` with `φ ∈ u⁻¹ℂ[u⁻¹]`. The connection `ρ_+(ℂ[u^{±1}]^r, u∂_u + uφ′(u) + A)` is a model, regular at `∞`.
- **The comparison.** BE04, Corollary 2.2, Lemma 2.4, Corollary 2.5 and Remark 2.6, with Lemma 3.3 for slopes `≤ 1` at `∞`. Its inputs are the good lattice pairs of §RD.6.52a and the theorem on formal functions, SchemeAndStackFoundations §4.9 (on main, already a supplier).

§4.9 was added to the 2.4 Needs line, the Layer 2 Dependencies, the Scope bullet and the SchemeAndStackFoundations contract. The `Sab08` and `BE04` locators were extended in References and `sources.toml`.

Locators checked this round: BE04 lines 110–123, 152–187, 196–200, 251–255, 297–316 and 480–487; Sab08 lines 18–36, 304–335, 652–668, 900–940 and 1024–1041; Sai88 lines 353–363, 739–757 and 3352–3367; Kash84 page heads at lines 1111–1286; MT lines 1938–1952 and 2013–2169. ResolutionOfSingularitiesCharacteristicZero §§1.3–1.5 and SchemeAndStackFoundations §4.9 were read on main, and PadicDifferentialEquationsAndRigidCohomology §§RD.6.52a–RD.6.53 at its head.

## Checks run

- **Elaboration.** `lake env lean packages/MixedHodgeModulesAndIrregularHodgeTheory/Suggested.lean`, run from the content checkout, gives only `157:8: warning: declaration uses 'sorry'`. There are no errors. The only import is `import Mathlib`, so nothing needed building.
- **Signatures.** I put `#check @name` for all 13 declarations in one scratch file and elaborated it once. Each elaborated type is identical to the supplied signature table and matches its README statement (10.1, 10.3). No binder was lost and nothing changed.
- **Dependency check.** Output: `depcheck: 239 roadmaps, 2175 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README: cross-roadmap citations found nowhere: none. Lean names found nowhere: none.
- **Gaps.** Six gap slugs remain. Each appears in `design/plan.json` and in the README contracts.
- **Sources.** The manifest has 25 entries, matching the 25 References. No `needs-references.toml` was written.
- **Gate failures.** None were listed for this job.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 2.4, model of `R` | trivial `R`; `E^{1/τ}`; `El(u², u⁻¹, 1)`; Kummer `A = α` | `O(∗0)`, `FT = j_!O_{G_m,t}`, germ rank 1, slope 0; `∂_τ − τ⁻²`, regular at `∞` (`w∂_w` acts by `w`), `F^{(0,∞)}` slope `1/2`, rank `2`; `p = 2`, `q = 1`: slope `1/3`, rank `2 + 1 = 3`; `τ∂_τ − α`, regular at both ends | holds |
| 2.4, `φ ∈ u⁻¹ℂ[u⁻¹]` (negative control) | `φ = u` | `uφ′ = u`, pole at `∞`; model `E^τ` has slope 1 at `∞`, not regular | restriction needed; it is what the elementary form allows (El depends on `φ` mod `ℂ[[u]]`) |
| 2.4, stalk at `c` from translate by `−c` twisted by `E^{ct}` | `δ_2` | translate `δ_0`, `FT = O`, `⊗ E^{2t}` = `E^{2t} = FT δ_2`; twist `E^{−2t}` gives `FT δ_{−2}` | direction pinned |
| 2.4, stalk at `∞` vanishes for slopes `≤ 1` | `E^{aτ}` (slope 1, `S = ∅`); `E^{τ²}` (slope 2) | `FT = δ_{−a}`, germ at `t = ∞` is `0` = empty sum; `FT = D/D(2∂_t + t) = E^{−t²/4}`, germ nonzero although `S = ∅` | slope hypothesis necessary and present |
| 2.4 (b), rank `rank N + m_c(K) − m_c(C)` | `O(∗0)`, `j_!O_{G_m}`, `O`, `δ_c`, `j_!O_{A¹∖{0,1}}`, Kummer | `1`, `1 + 1 − 1`, `1 − 1 = 0`, `0 + 1`, `1` at each of `c = 0, 1` (total 2), `rank(T_0 − 1) = 1` | equals `FT` ranks `1, 1, 0, 1, 2, 1`; Sab08 (5.17) |
| 2.4 (a), (c) | `N = O`; `N = E^{aτ}` excluded | `FT = δ_0`, zero on `G_m`, zero germ at `0`; `δ_{−a}` singular at `−a ∈ G_m` | regularity at `∞` necessary |
| 2.3 `δ_a ⋆ O` | `a = 0, 2`; `O ⋆ O` | `E^{at} ⊗^L δ_0 = δ_0`, `Tor₁ = 0`, so `O` in degree 0; `δ_0 ⊗^L δ_0`: `Tor₀ = 0`, `Tor₁ = δ_0`, so `O ⋆ O = O[1]` | separates one constant factor from two |
| 6.1 `j_*L[1] ∈ EMHS` | `T = −1` | `H⁰ = ker(−2) = 0`, `H¹ = coker(−2) = 0`; composition factor not `δ_a V` or `pℚ ⊗ V` | in `EMHS`, not generated by the `Π δ_a V` |
| 6.3 `K ⊗^H K` | `K = j_!ℚ[1]`, `⊗^H = Δ^*(− ⊠ −)` as in 5.1 | `Δ^*(j × j)_!ℚ[2] = j_!ℚ[2] = K[1]` vs `K ⊗_E K = K`; 5.1 Check `pℚ ⊗^H pℚ = pℚ[d]` agrees | holds |
| 7.4 jump `1/2` | `x²` summand `j_*L[1]` | `F^λ_irr = ℂ` for `λ ≤ 1/2`, `0` above; `a = −λ`: `0 → ℂ` for `a < −1/2`, bijective for `a ≥ −1/2` | agrees with 8.9 and 8.10 Checks |
| 4.1 compatibility | planes in `ℂ³`; three lines in `ℂ²`; `A = B` | `(2, 2)`; `(1, 0)`; `(1, 1)` | distributive; not distributive; distributive |
| 4.3, `g ≡ 0` on support | `δ_0`, `g = x` | `gr^V_{[0,1)} = 0`, `gr^V_1 = ℂδ`, `N_φ δ = −(x∂_x + 1)δ = 0` | holds |
| RoS §1.5 in 8.8 and 8.10 | `Bl_0 A²`, `(I_0, 1)`; `D₁ ∩ D₂` for `1/x ⊞ 1/y` | cosupport `{0}`, a coordinate stratum of the axes; stratum of the boundary; §1.5 allows centres inside boundary components | permissible, so smooth with SNC boundary |
| 7.3 citation | frame norm `\|t\|^{1/2}`, index `1/4` | `⌈1/4 − 1/2⌉ = 0` vs `⌈1/4⌉ = 1` | unchanged; estimate owned by ShimuraVarieties §3.5b.2 |
| Kash84 page range | page heads | PDF 37 = p. 355 (§7 at line 1166), PDF 41 = p. 359 (§8 at line 1271) | pp. 355–359 |

## For the maintainer

- **Ownership.** I searched main, the open heads and the board packages for "stationary phase", "local formal Fourier", "Fourier–Laplace", "Bloch–Esnault" and "local Laplace". The hits are harmonic-analysis local Fourier transforms (AutomorphicLFunctionsAndLocalFactors and its consumers) and unrelated Fourier–Laplace multipliers. No roadmap owns the `D`-module local Fourier transforms, so this roadmap owns the regular formal stationary phase, as stated in §2.4.
- **A consumer's gap.** The board package KloostermanMomentsAndPotentialAutomorphy declares `gap:irregular-stationary-phase` against this roadmap's former "Layer T" (now §§9.3–9.8). It asks for the inverse-Fourier vanishing cycles at the points `c_i` of a holonomic module whose germ at `∞` is `⊕ E^{c_i t} ⊗ R_i` plus other slopes. That is wider than the regular theorem §2.4 now states. No finding of this round asks for it, so it was not added. Whether this roadmap or a Part II supplies it is a decision for the owners of the two packages.
- **Downstream.** KloostermanMomentsAndPotentialAutomorphy cites §2.4. Its id and its regular-input statement are unchanged.
- **Open pull request.** The content repository's open pull request for this same roadmap carries an older text. One of the two must be rebased on the other before merge.
- **Source key.** The new source keys are `Sab08` and `BE04`. The finding proposed `SabStationary`; the resolver reads CamelCase keys as roadmap names.
