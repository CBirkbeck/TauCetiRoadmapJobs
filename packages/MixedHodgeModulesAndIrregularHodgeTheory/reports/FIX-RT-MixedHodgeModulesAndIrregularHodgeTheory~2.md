# Repair report: FIX-RT-MixedHodgeModulesAndIrregularHodgeTheory~2

This round covers the findings of red-team passes `RT-MixedHodgeModulesAndIrregularHodgeTheory~2a` and `~2b`. They do not overlap, so each finding has its own section. No section, layer or target id changed. The only id removed is the supplier gap `gap:blowup-exceptional-divisor`, which no roadmap cites. `Suggested.lean` is unchanged.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2a/F01 (P1) — applied differently

Witness holds; nobody owns D-module local transforms. §2.4 gains **Theorem (regular formal stationary phase)**: smooth on `G_m`, `⊕ E^{ct} ⊗ R_c` at `∞`, regular at `0`, with `F^{(0,∞)}` and the comparison at `∞` (BE04, Sab08), four Checks; `ℱ` and §9.7 use it. Differently: an output-zero germ identity is false (`O` vs `O(∗0)`); regularity at `0` follows by inversion.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2a/F02 (P3) — applied

Witness holds (Sai88 lines 359–363; Remarque 1.2.15, lines 739–757). §4.1: "compatible when … exact." → adds that two filtrations are always compatible and that for vector spaces compatibility is distributivity, with these locators. Three Checks: coordinate planes in `ℂ³` (2 = 2), three lines in `ℂ²` (1 ≠ 0), repeated steps (1 = 1).

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2b/F01 (P2) — applied

Verified on main: RoS §1.5, "A permissible blowup has smooth ambient space and updated SNC boundary", with centres allowed inside boundary components. `gap:blowup-exceptional-divisor` and the unused SchemeAndStackFoundations §5.5 deleted (README, `design/plan.json`). RoS §1.5 added to Scope (marked ideal `(I_Ξ, 1)`), the contracts and §8.8 (route, Needs, Dependencies). The centre is a coordinate stratum by Yu lines 1423–1425.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2b/F02 (P3) — applied

Replacements, each recomputed:
- §2.3: `M ⋆ 0` → `δ_a ⋆ O = O` (no `Tor₁`).
- §6.1: zero object → `j_*L[1]`, `T = −1`, with `RΓ = 0`.
- §6.3: `E ⊗_E 0` → `K ⊗^H K = K[1]`, off the heart.
- §7.4: `pℚ_{P¹}` → `x²`, jump `1/2`.
- §2.4: `ℱ(0) = 0` deleted.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2b/F03 (P3) — applied

Both omissions hold.
- §8.10: SchemeAndStackFoundations §4.11, SchemeKTheoryOperations §5.7 and RoS §1.5 added (route, Needs, Dependencies).
- §7.3: "Hodge-norm estimates of 3.2" → "of ShimuraVarieties §3.5b.2 on the power cover of 3.2", also in Needs and Dependencies.

Pattern: 4.2 added to §4.4, 4.3 to §5.3, 4.6 to §6.7; every Dependencies clause aligned with its Needs line.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2b/F04 (P3) — applied

Witness holds (Sai88 5.1.6, lines 3352–3367: the largest family, conditions for every `g`). "Treated by the Kashiwara clause" → for `g ≡ 0` on `Z`, Kashiwara's equivalence (Springer §9.2) gives `ψ_g M = 0`, `φ_{g,1} M = M`, `N_φ = 0`; circular in the induction, automatic in Saito's form. Test: `δ_0`, `g = x`.

## RT-MixedHodgeModulesAndIrregularHodgeTheory~2b/F05 (P3) — applied

Verified: Kash84 §7 runs from line 1166 (p. 355) to line 1270 (p. 359). MT's appendix begins at line 1952 (p. 35). Changes: §1.5 "§7, pp. 355–358" → "pp. 355–359"; References MT "pp. 34–40" → "pp. 35–40". The other MT locators (p. 39; pp. 36–40) were rechecked and are correct.

## Checks run

- `lake env lean packages/MixedHodgeModulesAndIrregularHodgeTheory/Suggested.lean` (run from the content checkout) produced only `157:8: warning: declaration uses 'sorry'`. There are no errors, no `TauCeti.*` imports and no builds were needed.
- `#check @…` for all 13 declarations in a scratch copy gave elaborated types identical to the supplied signature table. Each matches its README statement (10.1, 10.3); no binder was lost and nothing changed.
- Dependency check: `depcheck: 239 roadmaps, 2175 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README finds no unresolved citations or Lean names. The new source key was named `Sab08` rather than a CamelCase name, which the resolver had misread as a roadmap.
- Sources: two new entries were fetched legally from arXiv. They are `Sab08` (arXiv:0706.3570v2) and `BE04` (arXiv:math/0312343v1, whose preprint numbering is cited). The `Sai88` locator gained the compatibility passages. The manifest has 25 entries, matching the 25 References. No `needs-references.toml` was written.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 2.4 stationary phase, (a)–(c) | `δ_c`; `O`; `O(∗0)`; `j_!O`; Kummer `α ∉ ℤ`; `E^{aτ}`; `j_!O_{A¹∖{0,1}}`; `0` | `E^{ct}`; `δ_0`; `D/D(t∂_t)`; `D/D(∂_t t)`; `D/D(t∂_t+1+α)`; `δ_{−a}`, singular at `−a`; rank 2; `0` | holds; `E^{aτ}` is the negative control for regularity at `∞` |
| 2.4 rank `rank N + m_c(K) − m_c(C)` | `O(∗0)`, `j_!O`, `O`, `δ_c`, `j_!*L` | `1+0−0`, `1+1−1`, `1+0−1`, `0+1−0`, `rank L − dim ker(T−1)` | equals `FT` ranks `1,1,0,1` and `rank(T−1)`, as in Sab08 (5.17) |
| 2.4 germ at `t = 0` (the false identity, caught and removed) | `O` vs `O(∗0)` | same germ at `∞`; germs at `0` of rank `0` vs `1` | not a function of the germ at `∞`; stated as a Check |
| 2.4 `F^{(0,∞)}` slope rule | `E^{1/τ}` (slope 1); trivial germ | slope `1/2`, rank `1+1 = 2`; trivial rank 1 | Sab08 Remark 5.3(2), BE04 Proposition 3.14(i) |
| 2.4 `ℱ` slopes `{0,1}` | `δ_2`, `O_{G_m}`, `j_!*O_{G_m}` | slope 1; rank 1, slope 0; `0` | holds |
| 2.3 `δ_a ⋆ O = O` | `a = 0, 2`; `O ⋆ O` | degree 0 only; `O[1]` | separates one constant factor from two, and convolution from the diagonal product |
| 6.1 `j_*L[1] ∈ EMHS` | `T = −1` | `H⁰ = ker(−2) = 0`, `H¹ = coker(−2) = 0` | holds; agrees with 9.6 Check (`Π M = M`) |
| 6.3 `K ⊗^H K` | `K = j_!ℚ[1]` | `Δ^*(j×j)_!ℚ[2] = j_!ℚ[2] = K[1]`, vs `K ⊗_E K = K` | holds |
| 7.4 jump `1/2` | `(A¹, x²)` on `P¹` | degree-1 term `O(−1+⌊2−2λ⌋)`: `H⁰ = ℂ` for `λ ≤ 1/2`, `0` for `1/2 < λ ≤ 1` | `a < −1/2`: `0 → ℂ`; `a ≥ −1/2`: bijective |
| 4.1 compatibility | `ℂ³` planes; three lines in `ℂ²`; `A = B` | `(2,2)`, `(1,0)`, `(1,1)` | distributive, not distributive, distributive |
| 4.3, case `g ≡ 0` | `δ_0`, `g = x` | `gr^V_{[0,1)} = 0`, `gr^V_1 = ℂδ`, `N_φ δ = −(x∂_x+1)δ = 0` | holds |
| RoS §1.5 in 8.8 and 8.10 | `Bl_0 A²` with `(I_0, 1)`; `D₁ ∩ D₂` for `1/x ⊞ 1/y` | cosupport `{0}`, a coordinate subspace; a stratum of the boundary | permissible, so the blow-up is smooth with SNC boundary |
| 7.3 citation | flat frame `|t|^{1/2}`, index `1/4` | `⌈1/4 − 1/2⌉ = 0` vs `⌈1/4⌉ = 1` | unchanged; the estimate is now owned by ShimuraVarieties §3.5b.2 |

## For the maintainer

- Ownership: I searched main and all open heads for "stationary phase", "local Fourier" and "Fourier–Laplace". No roadmap owns D-module local Fourier transforms. FourierDeligneTransform has ℓ-adic ones and puts stationary phase in its Part II, so this roadmap owns the regular formal stationary phase.
- The content repository's open pull request for this same roadmap carries an older text. One must be rebased on the other before merge.
- Downstream: KloostermanMomentsAndPotentialAutomorphy cites §2.4. Its id and its regular-input statement are unchanged.
