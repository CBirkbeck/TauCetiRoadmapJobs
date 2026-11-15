# FIX-PKG-ModularFormsPartII~8

Findings of `REV-PKG-ModularFormsPartII~7` (four, all P3). Only `packages/ModularFormsPartII/README.md` changed; `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## F01 (P3) — applied

Verified: the `*Needs:*` lines of §5.1 (§§2.2, 2.4) and §5.4 (§§2.2, 3.1) name Layer 2, which the Dependencies line omitted. A script read every layer's `*Needs:*` lines against its Dependencies line: Layer 5 was the only one missing a layer. Old → new: "Layers 1, 3 and 4; …; Mathlib Chebyshev bounds." → "Layers 1–4; …; Mathlib Chebyshev bounds and `CongruenceSubgroup.Gamma0`". §5.2 names `CongruenceSubgroup.Gamma0`, and the old line did not list it.

## F02 (P3) — applied

Verified: in §6.9 the product's index and the root parameter were the same letter `n`, so at `n = 8` the formula read as a single factor. Old → new: `∏ ((1 + q^(2n))/(1 + q^(2n−1)))^(8/n)` → `∏_{m≥1} ((1 + q^(2m))/(1 + q^(2m−1)))^(8/n)`. The same clash was in §6.8: `∏_{n≥1}` sat next to the root `h^(1/n)`. It is now `q ∏_{m≥1} ((1 + q^(2m))/(1 + q^m))²⁴`. The other products (§§2.1, 3.3, 6.2, 6.7, 7.10 and the contracts) have no clash.

## F03 (P3) — applied

Verified: the statement of Lemma 4.2.3 is CDT25 lines 1766–1771, on extraction page 29 (journal p.655). Its proof starts at line 1775, after the page-30 marker at line 1772 (p.656). Old → new in §5.1: "Lemma 4.2.3, p.656" → "Lemma 4.2.3, pp.655–656". This now matches §§3.6 and 3.7. No other locator for this lemma exists in the package.

## F04 (P3) — applied

Verified: `Γ′` was unused, and §7.3 defines vector-valued forms only for `SL₂(ℤ)`. Old → new: the bullet now states `F(Mγτ) = (cτ + d)^k ρ(AγA⁻¹) F(Mτ)` on `Γ₀(M) = SL₂(ℤ) ∩ A⁻¹SL₂(ℤ)A`, with `A = diag(M, 1)`, and induces as in §7.5 with `γ ↦ ρ(AγA⁻¹)`. `ρ(T)` is semisimple because its M-th power is block diagonal with parabolic blocks. §7.11 needs no change.

## Checks run

- **Elaboration.** `lake env lean packages/ModularFormsPartII/Suggested.lean`, run from the content checkout: exit 0. There are 13 warnings, all `declaration uses sorry`, at lines 75, 97, 145, 164, 171, 181, 195, 211, 242, 257, 285, 309 and 324. The `TauCeti.NumberTheory.ModularForms.QExpansion.Laurent` object file was already built.
- **Signatures.** I put `#check @name` for all 22 declarations in one scratch copy and elaborated it once: exit 0, and all 22 types printed. The file is unchanged and no README statement with a Lean counterpart changed, so the comparison with the README is unchanged. The §7.3 bullet is prose about `IsVectorValuedForm`, and its definition did not change.
- **Dependency check** (`gate --depcheck … --movable`):

```text
depcheck: 246 roadmaps, 2250 edges, 0 problem(s)
```

  It shows no UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` on the README reports no unresolved citations and no Lean names found nowhere. The repairs add no cross-roadmap citation and no supplier, so no ownership question arises. Ownership against open pull requests is unchanged from the previous round: no new object is introduced.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §6.9 `λ^(1/n) = 16^(1/n) q^(1/n) ∏_{m≥1}((1 + q^(2m))/(1 + q^(2m−1)))^(8/n)` | `n = 8, 4, 2, 1`; series to `q⁹` | `∏_{m≥1}(1 + q^(2m))/(1 + q^(2m−1)) = 1 − q + 2q² − 3q³ + 4q⁴ − 6q⁵ + 9q⁶ − 12q⁷ + 16q⁸ − 22q⁹`; its 8th power is `1 − 8q + 44q² − 192q³ + 718q⁴ − 2400q⁵ + ⋯`, which is `x/q` of §2.1 (Check there: `1, −8, 44, −192, 718`); `8/n ∈ ℤ` exactly for `n ∣ 8` | True; integral for `n ∣ 8` | Index renamed m |
| §6.8 `q ∏_{m≥1}((1 + q^(2m))/(1 + q^m))²⁴ = q ∏_{m odd}(1 + q^m)^(−24)` | both sides to `q⁹` | Both give `1, −24, 300, −2624, 18126, −105504, 538296, −2471424, 10400997, −40674128`. The worked example's `u^(1/24) = 1 − q + q² − 2q³ + ⋯` and `u^(1/5)` (denominators `5, 25, 125, 625`) are unaffected | True | Index renamed m |
| §7.3 transformation law of `F(Mτ)` | `M = 2`, `γ = [[1, 0], [2, 1]]`; `γ = T`; `γ = [[1, 0], [1, 1]]`; `M = 1` | `AγA⁻¹ = [[a, Mb], [c/M, d]]`: `[[1, 0], [1, 1]]` and `ATA⁻¹ = T²`, integral; automorphy factor `(c/M)(Mτ) + d = cτ + d`; `[[1, 0], [1, 1]] ↦ [[1, 0], [1/2, 1]]`, not integral, so the group is exactly `Γ₀(M)`; at `M = 1`, `A = I` and the bullet is the definition | True | Bullet restated |
| §7.3 induced form is a vector-valued form for `SL₂(ℤ)` | `−I`; `ρ(T)`; growth; `M = 1, 2` | `A(−I)A⁻¹ = −I`, so the induced `ρ(−I)` is block diagonal with `ρ(−I) = 1`. For `γ_i T^M γ_i⁻¹ ∈ Γ(M)` (trace 2, `≠ I`), `A·A⁻¹` keeps trace 2, so its image is conjugate in `SL₂(ℤ)` to `T^m` with `m ≠ 0`, and its `ρ` is conjugate to `ρ(T)^m`, which is semisimple. An invertible X with `X^M` semisimple: `X = su` (Jordan), so `u^M = 1` and `u = 1`. At `M = 2`, `γ_i = S`: `ST²S⁻¹ = [[1, 0], [−2, 1]]` and `A[[1, 0], [−2, 1]]A⁻¹ = [[1, 0], [−1, 1]]`, trace 2. Growth: write `Aγ_i = gB` with `g ∈ SL₂(ℤ)` and B upper triangular, so `Im Bτ` is a positive multiple of `Im τ` and the factors are polynomial | True; the converse failure (a non-semisimple `ρ(T)` such as `[[1, 1], [0, 1]]`) stays excluded by the §7.3 Check | — |
| Layer 5 Dependencies | sections named by the five `*Needs:*` lines | §§1.7, 1.8, 2.2, 2.4, 3.1, 3.6, 3.7, 4.3 (plus 5.x) lie in Layers 1–4; the other eight Dependencies lines each contain the layers their `*Needs:*` lines name (script) | True after repair | Line repaired |
| §5.1 locator | CDT25 page markers | Line 1726 is page 29 (p.655) and line 1772 is page 30 (p.656); the statement is lines 1766–1771 (p.655) and the proof lines 1775–1792 (p.656) | `pp.655–656` exact | Locator repaired |

## Gate failures

None were listed for this round.

## For the maintainer

- No Lean name changed, and no id that other roadmaps cite changed: section numbers and headings are unchanged.
- The supplier gaps are not repeated on the layers' Dependencies lines anywhere in the README. The gaps are `udc-rational-cusp-of-twisted-full-level` (Layer 5), `udc-bombieri-andre-katz` (Layer 7) and `udc-all-prime-cuspidal-model-of-full-level` (Layer 9). They are recorded under "Exact supplier contracts" and in `design/plan.json`, as before. No finding asked for this and it was not changed.
- No source was fetched; `needs-references.toml` was not written.
