# FIX-RT-ModularFormsPartII~2: repair of red-team round 2 (passes a and b)

Six findings in two reviews, with no overlap. All six were confirmed on the mathematics and are repaired. Edited: `packages/ModularFormsPartII/README.md`, `packages/ModularFormsPartII/Suggested.lean` (two statements now use Mathlib's `Subgroup.adjoinNegOne`), and `packages/ModularFormsPartII/design/plan.json` (top-level `gaps`, only the `needs` of the existing slug `udc-all-prime-cuspidal-model-of-full-level`). `sources.toml` and `metadata.toml` are unchanged.

## RT-ModularFormsPartII~2a/F01 (P2) — applied

Confirmed: nothing tied the parameter along ε to `q_N` (`s = q_N/ϖ` gives unbounded denominators). Gap (same slug, README and `gaps[1].needs`): for `N ≥ 6`, functions on the completion along ε map into `𝓞_K[[q_N]]`, via ModularCurvesPartII §§4.1, 4.8, 4.11 and contraction. §9.2 uses this germ; blow-up added as §9.1 Check; §§4.1, 4.8, 4.11 added to contract, Needs, Dependencies.

## RT-ModularFormsPartII~2a/F02 (P3) — applied

Confirmed (`X₁(11) → X₀(11)`: degree 5, genus 1, R = 0; now a Layer 9 Example). §9.2: N ≤ 5 by Riemann–Hurwitz in genus 0; N ≥ 6: H has all widths N, a primitive element regular along ε times a polynomial in j is congruence (§6.6), §1.8 gives `H = ±Γ(N)`; then normalization. Needs: +§§1.3, 1.8, FuchsianOrbifolds Layers 4–5, UniversalCovers; −BelyiMaps Layer 6.

## RT-ModularFormsPartII~2a/F03 (P3) — applied

Confirmed at the pins: Mathlib `Subgroup.adjoinNegOne` (`ArithmeticSubgroups.lean:220`) and the widths and regularity of `Cusps.lean:224–329`; Tau Ceti `MulDiscriminant.lean:49–85`. Added to both contracts, Conventions (`±G`), §1.3 (signed width = `widthInfty`, strict = `strictWidthInfty`; `H′` Check: 4 and 2), §1.4 Needs, Layer 1 Dependencies. `Suggested.lean`: `G ⊔ Subgroup.zpowers (-1)` → `G.adjoinNegOne` in `wohlfahrt_Gamma_le`, `ihara_generation` (same subgroup).

## RT-ModularFormsPartII~2a/F04 (P3) — applied differently

Confirmed. Four §6.2 Checks added, recomputed: series `1 − 6q + 33q²`, inverse `1 + 6q + 3q²` (wrong `η(τ)²`: `q^(5/6)(1 − 8q + 46q²)`); weight −1 against `λη(τ/2)²/16`; period 24 (`h₀(τ + 12) = −h₀(τ)`); `ε²` on Γ(12). The suggested "`f = 1`, `k = 1`" illustration was replaced: 1 is not a weight-1 form.

## RT-ModularFormsPartII~2b/F01 (P2) — applied

Confirmed: finite order does not give a congruence kernel (order-5 character of `h^(1/5)`, §6.8). ModularForms §0.2 contract gains the Kronecker form (on main). §6.2: `ε²` trivial on Γ(12) (c > 0, c < 0, c = 0), so `h₀` has trivial multiplier on Γ(24), not "a congruence subgroup"; §6.7: `ε⁸` trivial on Γ(3). Same pattern repaired in §§6.3, 7.10.

## RT-ModularFormsPartII~2b/F02 (P3) — applied

Confirmed: no roadmap on main writes "(main)" after a roadmap's name. Deleted at README lines 11 and 25. "UniversalCovers (Completed)" is kept: it names the repository's `Completed/` folder, and main uses the same form ("HopfRinow (Completed)" in RiemannianGeometry).

## Adversarial pass (statements added or changed)

Values were computed by hand and confirmed numerically: η by its product, at `τ = −d/c + 0.2/|c| + i/|c|`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §6.2 `h₀` weight −1, trivial multiplier on `Γ(24)` | `T²⁴`; `[[1,0],[24,1]]`; `[[1,24],[24,577]]`; `[[1,−24],[−24,577]]`; `[[−23,24],[−24,25]]` (c < 0); `T¹²` | `h₀(γτ)(cτ+d)/h₀(τ)` = 1, 1, 1, 1, 1; `T¹²`: −1 | true; level 24 sharp against 12 |
| §6.2 `ε²` trivial on `Γ(12)` | `[[1,0],[12,1]]`; `[[1,12],[12,145]]`; `[[1,−12],[−12,145]]`; `T⁶`; `T¹²` | Kronecker numerator −12 ⇒ `ε = −1`, `ε² = 1`; numerics 1, 1, 1; `T⁶`: −1; `T¹²`: 1 | true; Γ(6) and Γ(4) fail |
| §6.2 series | through `q⁵` | `h₀/q^(11/12) = 1 − 6q + 33q² − 134q³ + 494q⁴`; inverse `1 + 6q + 3q² − 46q³ − 65q⁴`; `xη(τ/2)²/q^(13/12) = 1 − 10q + 59q²` | integral, constant term 1 |
| §6.7 `ε⁸` trivial on `Γ(3)` | `[[1,3],[3,10]]`; `[[1,−3],[−3,10]]` (c < 0); `[[4,3],[9,7]]`; `[[1,0],[3,1]]`; `[[−2,3],[3,−5]]`; T | 1, 1, 1, 1, 1; `ε⁸(T) = −1/2 + 0.8660i = exp(2πi/3)` | true; order 3 |
| §7.10 multiplier of `λ/(16Δ(τ/2))` | b even, `γ′ ∈ SL₂(ℤ)` | `Δ(γ′(τ/2)) = (2c·τ/2 + d)¹²Δ(τ/2) = (cτ+d)¹²Δ(τ/2)`; λ is Γ(2)-invariant | trivial on Γ(2) |
| §1.3 widths via Mathlib | `H′`, `g = [[1,0],[1,1]]` | `g(−T²)g⁻¹ = [[1,−2],[2,−3]] ∈ H′`; `gT⁴g⁻¹ = [[−3,4],[−4,5]] ∈ H′`; `gTg⁻¹ = [[0,1],[−1,2]] ∉ Γ(2)`; strict periods 4ℤ, periods 2ℤ | `strictWidthInfty = 4`, `widthInfty = 2`, irregular |
| gap clause (N ≥ 6) | smooth chart with parameter `q_N`; blow-up at a point of ε | contraction: `Ô_ε → 𝓞[[q_N]]`; blow-up: `s′ = q_N/ϖ`, `[q_Nⁿ]Σ s′ᵐ = ϖ⁻ⁿ` | holds on the minimal model and fails on the blow-up, which is not minimal (−1 curve) |
| §9.2, N ≤ 5 | unramified degree d over genus 0 | `2g′ − 2 = −2d` ⇒ `g′ = 1 − d ≥ 0` ⇒ d = 1 | true |
| §9.2, N ≥ 6 | `X₁(11) → X₀(11)` (not full level); full level | `0 = 5·0 + R` ⇒ R = 0, nontrivial; for `X(N)` all widths N ⇒ `L(H) ∣ N` ⇒ §1.8 ⇒ `Γ(N) ≤ H` | the argument needs full level, as stated |
| §9.2 pole clearing | pole of g at j-value `j₀ ∈ ℚ̄` | `P(j) = ∏(dj − dj₀)^m`, `dj₀` integral; `j = Q⁻¹ + 744 + ⋯` integral ⇒ `gP(j)` has algebraic-integer Laurent coefficients, a pole only at cusps | the §6.6 API (pole at ∞ allowed) applies |
| `wohlfahrt_Gamma_le`, `ihara_generation` (`adjoinNegOne`) | `H′`, N = 2; `G = ±Γ(N)` | `{g ∣ g ∈ G ∨ −g ∈ G} = G ⊔ ⟨−1⟩`, since −1 is central of order 2 | same statements |

## Checks

- **Elaboration.** `lake env lean packages/ModularFormsPartII/Suggested.lean` (run from the content checkout): exit 0. The only output is 15 warnings "declaration uses `sorry`", one per theorem; there are no errors.
- **Signatures.** I ran `#check @name` for all 24 declarations, once in a scratch copy, for both the old and the new file, and diffed the outputs. Exactly two types changed, `wohlfahrt_Gamma_le` and `ihara_generation`: `G ⊔ Subgroup.zpowers (-1)` and `Gamma N ⊔ Subgroup.zpowers (-1)` became `G.adjoinNegOne` and `(Gamma N).adjoinNegOne`, in every place they occur. The other 22 elaborated types are identical. The file has no `variable` or `include`, so no binder can be lost. Each type agrees with its README statement.
- **Library names.** Newly cited names, checked at the pins with `#check`: `Subgroup.adjoinNegOne`, `Subgroup.strictPeriods`, `Subgroup.periods`, `Subgroup.strictWidthInfty`, `Subgroup.widthInfty`, `Subgroup.IsRegularAtInfty`, `Subgroup.isRegularAtInfty_of_neg_one_mem` and `TauCeti.kroneckerSym` all elaborate. The `MulDiscriminant.lean` olean is not built on this host, and I did not build it because it is not an import of `Suggested.lean`. Its four names were read in the pinned source instead: `mulDiscriminant` line 49, `mulDiscriminant_injective` line 66, `discriminant_slash` line 72, `mem_range_mulDiscriminant_iff` line 85.
- **Dependency check.** `depcheck: 242 roadmaps, 2267 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README found no cross-roadmap citation or Lean name of this roadmap that exists nowhere.
- **plan.json.** Comparing the JSON with `gaps` masked shows that nothing else changed. The three slugs, suppliers and sections are unchanged.

## For the maintainer

- **ModularCurvesPartII.** The gap `udc-all-prime-cuspidal-model-of-full-level` keeps its slug and section (Layer 11, §11.4). It now also asks for the integral Tate parameter along the cusp section for `N ≥ 6`, with the route through its §§4.1, 4.8 and 4.11, read at its open head.
- **Names and numbering.** No Lean name changed, and no section was renumbered. NoncongruenceModularForms' citations of W1.8 and §§6.3–6.6 are unaffected: the statements are the same subgroups and theorems.
- **Ownership and sources.** No new construction is claimed. Riemann–Hurwitz is cited to FuchsianOrbifolds Layer 5 item 3 (main), and the Kronecker form to ModularForms §0.2 (main). No new source is cited, and nothing is requested from the sources service. Ihara1994 stays uncertified and was not read.
- No passage of either review was suspicious.
