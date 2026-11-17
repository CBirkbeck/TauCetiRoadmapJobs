# FIX-DESIGN-QuasiRiemannHypothesis~2: repair of the design review

Review answered: `REV-DESIGN-QuasiRiemannHypothesis` (15 findings: 1 P1, 6 P2, 8 P3). Files changed:
`packages/QuasiRiemannHypothesis/design/README.md`, `packages/QuasiRiemannHypothesis/design/plan.json`
(55 targets, now 139 tests), `packages/QuasiRiemannHypothesis/sources.toml`. Source displays that the
OCR text garbles were read from the cached page images of the same files (`openai2026quasiRH`,
`patterson1977`) and are cited by printed page.

## F01 (P1) — applied

§4.6: `χ_n(p) χ_p(n) = R 1` → `χ_n(p) · conj(χ_p(n)) = R(p, n) 1_{(n,p)=1}`, with a sentence that it is
§4.5 times `conj χ_p(n)`, and the witness as a Check (`(−ω²)ω = −1 = R`; bare product `−ω`). The printed
`openai2026quasiRH` p. 17 shows the bar; the "not verifiable" item is settled.

Same pattern (bars lost in extraction), repaired everywhere, each checked against the printed page:
§9.1 `D`, `L₀`, `C_V` now use `ᾱ` (p. 25); §10.1 `T_(m,v,η)` uses `ᾱ(cn³)`, `Ḡ(cn³)` and the expansion
is of `Ḡ` (pp. 45–46); §10.3 `L^S(x, η χ̄_•(u))⁻¹` and `D_p = η(p) χ̄_p(u) q_p^(−x)` ((7.13), (7.12), p. 53);
§10.5 identity likewise. New Checks pin each conjugate (§9.1: `α = ᾱ·α²`, an infinite-order twist;
§10.3: `J_0 ∋ −D_p` cancels only with the bar). §9.2's `α(μ)` is unbarred in print (p. 25) and stays.

## F02 (P2) — applied

§8.1: Patterson's character renamed `κ_P` (level `3`, not divisible by `9`); new statement
`κ(σ) = (c/a)_n⁻¹` on `Γ(N) ∩ SL₂(𝓞_K)` with route (Hilbert-symbol product formula), hence `κ_P = κ̄` on
`Γ(9) ∩ SL₂(𝓞)`; the reviewer's `Γ(9)` witness added as a Check. `κ` → `κ_P` in §§8.2, 8.4, 8.6, 8.7; §8.5
gains the `κ̄` clause.

Evidence: `patterson1977` line 130 (printed p. 127) derives `(b/d)_3 = (c/d)_3⁻¹ = (c/a)_3 (c/ad)_3⁻¹`.

## F03 (P2) — applied

§3.2 tail bound `≤ T₁^(−N) ‖w‖_{J+N,sep}` → `≤ (2π)^d T₁^(−N) ‖w‖_{J+N,sep}`, with its one-line route.
Same object: §3.1's rescaling bullet said the phase is `e^(−ikt)`; for `w_k(x) = w(e^k x)` it is `e^(ikt)`
(`(w_k)_log(u) = w_log(u + k)`), now stated. `plan.json` 3.1/3.2 updated.

## F04 (P2) — applied differently

Contract now says ZerosOfLFunctions §3.4's strip bound is for one record (uniform only at `σ = 1/2`) and
is not consumed; §§1.3, 3.1, 3.4 are consumed for Stirling and finite order. §5.2 gets its own
Phragmén–Lindelöf route via Mathlib `PhragmenLindelof.vertical_strip`, three Checks, new *Needs:*.

Why differently: the suggested `Q^(−3/5) ℒ(s)/(s + 2)^(6d/5)` proves only `Q^(3/5)(3 + |t|)^(6d/5)`,
weaker than the stated `(Q(3 + |t|)^d)^(3/5)`. The edge on `Re s = −1/10` is `Q^(3/5)(3 + |t|)^(3d/5)`
(conductor exponent `1/2 − σ`, gamma quotient `|t|^((d/2)(1−2σ))`, source line 910 for `d = 2`), so
`H(s) = Q^(−3/5) ℒ(s)(s + 2)^(−3d/5)` (principal branch, `|(s+2)^(−3d/5)| = |s+2|^(−3d/5)`) is bounded on both
edges by `C_K`, and the stated bound follows unchanged.

## F05 (P2) — applied

Each pointer is now a statement in the roadmap's notation, locator kept: §8.6 the three cosets,
nine series with shifts `β_(a,b)`, gamma factor, (7.4) relations, six functional equations; §9.2 `ϑ_t`, `ζ_t`
with `τ^±`, `σ_p`, `ε_p`, `ω_(p,j)`, `κ_F`, the integrated form (5.5) and (5.6); §10.2 `Q`, `Ω`, `A`, `ν_σ`, `B`;
§10.3 `F(v, A, H)`, `F_(η,u)`, `K_η`, `P_p`, `P*_p`, `J_0…J_5`; §10.5 Definition 10.1 data and one quantified
bullet with its bound per Lemma 10.2–10.6. Checks added to §§8.6, 9.2, 10.2, 10.3, 10.5.

## F06 (P2) — applied

"Status of the source" paragraph → the suggested four-line "**The sources.**" paragraph; "Size of the
two supplier blocks" paragraph deleted; Downstream consumers "now unconditional at `11/12` through
§10.7" → "unconditional at `11/12` by §10.7". A search for other process words found none.

## F07 (P2) — applied differently

Added to "Consumed, not redefined" and to the LFunctions contract: Layer 5 `gaussSum`, `gaussSum_mul`,
`norm_gaussSum`. "Owned here" and §4.1 keep only the variant for powers of the power residue symbol,
"in general not residue characters" (`χ_p³(−1) = −1` at the unit `−1`, while residue characters of `F`
are trivial on units). The additive-character bullet is deleted in favour of the citation.

Why differently: the shift-law bullet stays, cited to Mathlib `gaussSum_mulShift`. LFunctions'
`gaussSum_mul` is stated for `Grossencharacter.residueCharacter` (LFunctions README lines 998–1008), so it
does not cover this variant. The prime bullet now states its hypothesis as `y𝔭𝔡` prime to `𝔭`.

## F08 (P3) — applied

§4.4 Check `e(1/λ²)` → `e(1/λ)`, with `e(1/λ) = exp(2πi Tr(1/λ²)) = exp(−4πi/3) = ω` and the note that
`e(1/λ²) = 1` (`Tr(1/λ³) = 0`) would give `√3`. Recomputed: `Γ(λ) = i`.

## F09 (P3) — applied

§7.1 "`M_r` sees `L^orig(s + iv, ψ)⁻¹`" → "with `MW_v(s) = MW(s + iv)`, against `MW(s)`, `M_r` sees
`L^orig(s − iv, ψ)⁻¹`", plus the Check `Σ μ(n) n^(iv) n^(−s) = ζ(s − iv)⁻¹` (pole at `1 + iv`).

## F10 (P3) — applied

Layer 6 Examples and §10.2: `min(1, r₊)/Y` → `min(1, 1/r₊)/Y`, with the inequality chain and
`δ⁻² ≤ max(1, r₊²)Y²`; the `1/√91` witness is now a Check. Lemma 6.2's page `47` → `48` (pp. 48–49 for the
proof). The review's "misprint" note is wrong: printed p. 49 reads `δ_Y = min(1, r₊⁻¹)/Y`; only the OCR
dropped the exponent.

## F11 (P3) — applied

`Real.fourierIntegral` (§§3.1, 3.4, Layer 3 Dependencies, Mathlib contract, `plan.json` 3.1) →
`VectorFourier.fourierIntegral` and `Real.fourier_eq` (`Mathlib/Analysis/Fourier/FourierTransform.lean`
lines 81, 434), plus `MeasureTheory.Integrable.fourierInv_fourier_eq` (`Inversion.lean` line 166). §1.3's
"Tau Ceti's rectangle integrals" → `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`
(`CauchyIntegral.lean` line 313).

## F12 (P3) — applied

All `patterson1977` locators are now printed pages (scan page `N` = printed `N + 123`, checked at lines
74, 926, 1112, 1151): §8.1 pp. 125–128; §8.3 p. 129; §8.4 pp. 130–131; §8.5 p. 152; §8.6 pp. 145–147,
Table II p. 129; §8.7 pp. 152–153, (8.8)–(8.9) p. 154, Table III p. 151, Theorem 6.1 p. 143, Corollary 5.2
p. 142, Theorem 9.1 p. 160. `sources.toml` locator and `version_note` updated to match.

## F13 (P3) — applied

Added *Needs:* lines to all 26 listed sections, taken from the `plan.json` prerequisites and the routes.
Three Checks each added to §3.4 (`K_W(x) = W(1/x)` at `m ≡ 1`, `m(s) = s`, Gaussian and indicator), §5.1
(`𝔯 = 𝓞`, `1 − 2^(−s)` on `Re s = 0`, `σ = −1`), §7.2 (floor bin, constant `M_j`, the count
`I − 1 > 1/ε`) and §9.2 (`B_p` at `j_p = 4`, `𝓜_{0,0}(V_G) = √π e^(1/16)`, gamma-quotient poles). §1.1 gets
the non-meromorphic Check (`s ↦ s̄`, junk order `0`).

## F14 (P3) — applied

§4.3 route and the CharacterSumsOverFiniteFields contract/prerequisites now cite §3.4's duplication
formula at `χ = H`, `η = H³`, with `g(H²)g(H⁴) = P`; the derivation of `γ_1 = H(4)⁻¹γ_2²γ_3` was rechecked.
The BianchiModularForms contract reads "§0.3 (for `Γ₀(𝔫, 𝔞)` and `PSL₂(𝓞_K)`; finite-index subgroups
inherit it)". "Not owned here" now says Kubota-character forms are outside AutomorphicSpectralTheory
§§1.15a–1.15c, and §8.4 adds the classical-form remark for trivial `χ`.

## F15 (P3) — applied

Deleted `kazhdanpatterson1984`, `yoshimoto1987`, `thornerzaman2019`, `bcss2025` and `quanta2026quasiRH`
from References. Their `sources.toml` entries keep their keys with `cited_for = []`, so each work keeps one
key for its lifetime. No statement needed them: the Chebotarev step for unit rows follows from §2.1 and
ClassFieldTheory Layer 11.

## Checks run

Dependency check (exact output):

```text
candidate: QuasiRiemannHypothesis is not in the merge order yet; checked as if placed after BianchiModularForms (the intake inserts it when its design is accepted)
depcheck: 261 roadmaps, 2605 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` on the edited README: no cross-roadmap citation and no Lean
name found nowhere. The Mathlib names it does not check were checked by hand at the pin, with file and
namespace: `PhragmenLindelof.vertical_strip`, `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`,
`VectorFourier.fourierIntegral`, `Real.fourier_eq`, `MeasureTheory.Integrable.fourierInv_fourier_eq`,
`integral_gaussian`, `gaussSum_mulShift`, `meromorphicOrderAt_of_not_meromorphicAt`. There is no
`Suggested.lean` at the design stage, so nothing was elaborated and no `#check` file was needed. No gate
failures were listed for this round.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §4.6 identity | `(p, n) = (1+3ω, −2+3ω)`; `n = p`; `n = 1` | `χ_n(p) = −ω²`, `χ_p(n) = ω²`; with bar `−1 = R`, bare `−ω`; `0 = 0`; `1·1 = τ(p,1) = 1` | holds with bar | F01 |
| §8.1 `(c/a)_n = (c/d)_n⁻¹` | `γ = (1+3ω, −3ω²; 3, 1−3ω)` (`Γ₁(3)`); `Γ(9)` witness; `c = 0`; `GL₂` with `det = ω` | `ω` vs `3⁴ ≡ 3 = ω²` (`𝔽₁₃`); `ω` vs `5² ≡ 4 = ω²` (`𝔽₇`); both `1`; `ad = ω + bc` leaves `(ω/c)_3 ≠ 1` | holds on `SL₂` only | scoped to `SL₂` |
| §8.6 functional equations | `l = 0`, `b = 0`; poles; cosets | `4/3 ↔ 2/3`; `ξ_a(s,0,0)` symmetric about `1`; `λ³/9 = −λ/3 ∉ 𝓞` | consistent with (7.5) | statement written out |
| §3.2 tail bound | `d = 1`, `J = N = 0`, `T₁ = 1`, twisted bump | sides `∫|φ̂|` vs `(2π)⁻¹∫|φ̂|`; with `(2π)^d` equal in the limit | fixed | F03 |
| §3.1 rescaling | `w_k(x) = w(e^k x)` | `∫ w_log(u+k) e^(−itu) du = e^(ikt) ŵ(t)` | sign fixed | F03 pattern |
| §5.2 strip growth | `K = ℚ, ψ = 1, σ = −1/10`; `K = F`; `σ = 11/10`; `s = 1`; edge ratio | `|ζ| ≍ |t|^(3/5)`; `Q^(3/5)(3+|t|)^(6/5)`; `≤ ζ_K(11/10)`; `Res ζ_K/2`; `(3+|t|)/|s+2| ≤ 3/1.9·√2 ≈ 2.23` | holds with `(s+2)^(−3d/5)`; `6d/5` too lossy | F04 |
| §5.1 Checks | `𝔯 = 𝓞`; `(2)` at `Re s = 0`; `(p)` at `σ = −1` | `D = 1`; zeros at `2πik/log 2`; `|D(−1)| = p − 1` | hypotheses needed | Checks added |
| §7.1 twist | `K = ℚ`, `ψ = 1`, `W y^(iv)` | `Σ μ(n) n^(iv−s) = ζ(s − iv)⁻¹`, pole `1 + iv` | sign `s − iv` | F09 |
| §7.2 bins | no zeros; constant `M_j`; `I − 1` failures | bin `(1, a₀)`; bin `1`; `M_I > a₀ + 1 + ε > 1` | holds | Checks added |
| §4.1 variant | `χ_p³` at `p = 1+3ω`; `j ≡ 0`; `𝔠 = 𝓞` | `χ_p(−1)³ = −1` on a unit; `g_0 = −1`; `g_j = 1` | not a residue character | F07 |
| §4.3 duplication route | `χ = H`, `η = H³`; `ψ ↦ ψ(a·)` | `γ_1 = H(4)⁻¹γ_2²γ_3`; both sides scale by `H(a)` | holds for any nontrivial `ψ` | F14 |
| §4.4 `Γ(λ)` | squares mod `λ`: `0, 1, 1` | `e(1/λ) = ω`, `Γ(λ) = i`; `e(1/λ²) = 1` gives `√3` | fixed | F08 |
| §6/§10.2 separation | `r₊ = 13`, `Y = 1`, `v = 1+3ω`, `v' = 4+3ω`, `dv' − d'v = 1` | distance `1/√91 ≈ 0.1048`; `1/13 ≈ 0.0769` | `min(1, 1/r₊)/Y` | F10 |
| §9.1 conjugate | `α` vs `ᾱ` | `α = ᾱ · α²`, `α²` of infinite order | bar forced | F01 pattern |
| §9.2 `B_p`, `V♯`, `𝓜` | `j_p = 4`; `V_G`; `t = 0`, poles | `−q_p^(−1/2)` off `p`, `q_p^(1/2)(1 − q_p⁻¹)` on `p`; `√π e^(1/16) ≈ 1.8868`; quotient `1`, poles `−5/6, −7/6` | holds | Checks added |
| §10.2 low estimate | `X = Y = Z^(1/2)` | `Z^(−1/2) · Z^(1/4) · Z^(1/2+ε/2) = Z^(1/4+ε/2)`; mass `Y^(−3)·O(Y)·r₊Y = O(Y⁻¹)` | holds | statement written out |
| §10.3 `D_p` | `j = 0`, `ρ_p = χ_p(u)` non-real | `J_0 ∋ −η(p) ρ̄_p q_p^(−x) = −D_p`; without bar `η(p)(ρ − ρ̄) q_p^(−x) ≍ q_p^(−7/8)` | bar forced | F01 pattern |
| §10.5 exponents | probe data; small rows; large rows; moved bin | `C(s) = s − 2/3`, `C(11/12) = 1/4`; `13/150 − 1/4 + 1/50 = −43/300`; `7/4 + 501/1000 − 4 = −1.749`; `Re x + Re w = 1 + 10ε`, `Re w ≥ −0.006` | holds | statement written out |
| §3.4 kernels | `m ≡ 1`; `m(s) = s`; `e^(−πx²)`; indicator of `[0,1]` | `K_W(x) = W(1/x)`; `(y∂_yW)(1/x)`; `f̂ = f`, `s_0 = 1`; `s_1 = ∞`, `(1+|ξ|)²|sinc|` unbounded | holds | Checks added |
| §1.1 junk order | `s ↦ s̄` | meromorphic nowhere, order `0` everywhere, zero at `0` | vacuous for non-meromorphic `f` | Check added |
| §10.6 margins | `46E*` vs `m₀/4` | `4.6·10⁻⁵ < 2.083·10⁻⁴` | unchanged | none |

## Ownership and overlap

The only new consumed objects are LFunctions Layer 5 `gaussSum`, `gaussSum_mul` and `norm_gaussSum` (on
main), CharacterSumsOverFiniteFields §3.4 (an open roadmap that is earlier in the merge order and already
a supplier), and ZerosOfLFunctions §§1.3 and 3.1 (on main). The strip bound uniform in the conductor
(§5.2) is owned here: ZerosOfLFunctions states it only at `σ = 1/2`, and no other roadmap states it.
AutomorphicSpectralTheory §1.15a is cited only to mark a boundary, not as a supplier. the overlap index
lists no pull request that changes or drops an id of this roadmap. No `Suggested.lean` declaration exists,
so no qualified name clashes.

## For the maintainer

- Notation change: Patterson's character is now `κ_P`, and `κ` means only Kubota's `(c/d)_n`. No other
  roadmap cites this one; it is not on main.
- Beyond F01, the extraction lost conjugation bars in §§9.1, 10.1, 10.3 and 10.5. The corrected forms
  follow the printed source, and new Checks show why each bar is forced. A reviewer comparing against
  the OCR text should use the page images.
- The review's "Source issues" misprint at Lemma 6.2 is an OCR artifact: printed p. 49 has `r₊⁻¹`.
- Lemma 6.2 is on p. 48, not p. 47 (corrected in §10.2 and the Layer 6 Examples).
- No text was missing, so `needs-references.toml` was not written.
