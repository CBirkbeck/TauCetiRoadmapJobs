# FIX-RT-IntegralIwasawaTheoryPartII~1: repair of red-team round 1 (passes a and b)

Files changed: `packages/IntegralIwasawaTheoryPartII/README.md`, `packages/IntegralIwasawaTheoryPartII/Suggested.lean`, `packages/IntegralIwasawaTheoryPartII/sources.toml`, `packages/IntegralIwasawaTheoryPartII/design/plan.json` (top-level `gaps` only: three entries added).

## RT-IntegralIwasawaTheoryPartII~1a/F01 (P1) — applied

§F.5 constructs only `ℰ(1, χ)` for odd `p`; the reversed family appears only in a Check there. New `gap:reversed-ordinary-eisenstein-family` at NoncommutativeAndEquivariantIwasawa §F.5, declared in the README contract and in `plan.json`, and cited in 2.2, the Scope and Layer 2 Dependencies. The dyadic gap is kept. I checked that `ν_1(E(χ,1)) = E_1(1,χ_S)` holds exactly when every `χ(𝔮) = 1`.

## RT-IntegralIwasawaTheoryPartII~1a/F02 (P1) — applied

4.1: "completion of an excellent reduced local ring is reduced" → `A`, a localization of `T` (finite over the complete `Λ`), is excellent; `A → Â` is regular, so `Â` is reduced. This is SchemeAndStackFoundations §0.21 (`excellent_examples`, `regular_map_completion`), on main. I added the supplier contract, a Scope bullet, and *Needs*/Dependencies entries.

## RT-IntegralIwasawaTheoryPartII~1a/F03 (P2) — applied differently

`Suggested.lean` now states `isIso_coinfNatTrans_app_of_isZero_groupHomology_res`. It is stated for any normal subgroup `S` and commutative ring `k`, with the hypothesis that positive-degree `S`-homology vanishes, not for `G × ℤʳ` with a freeness binder. This is the true generality (see 1b/F04), and freeness implies the hypothesis by README 0.7(i). The docstring names it and lists §§2.3 and 2.6 among the non-statable headlines.

## RT-IntegralIwasawaTheoryPartII~1a/F04, RT-IntegralIwasawaTheoryPartII~1b/F02 (P1) — applied

Confirmed: every cited supplier stops at weight `≥ 2`, and none multiplies forms. I added `gap:weight-one-hilbert-eisenstein-series` (OrdinaryAutomorphicForms §2.12) and `gap:weight-one-hilbert-forms-and-products` (§F.5, weight-one spaces and products). New target 2.2b covers weight-one forms times shifted families, cleared at `k = 2` by `d_2 = (1+T) − u`, with three Checks. I replaced 2.2's "No new construction" and updated the *Needs* of 2.2, 2.3, 2.5 and 2.5a.

## RT-IntegralIwasawaTheoryPartII~1a/F05 (P2) — applied

5.8's inference is replaced by a two-step proof.

- (i) Baker–Brumer applied to a complement of `ker ℓ` gives `ker ℓ̄ = ker ℓ ⊗ ℚ̄`.
- (ii) On minus units, `ker ℓ ⊆ ker ord_𝔓`: take the norm to the decomposition field, apply `algebraicLog_kernel`, and use `|τ(y)| = 1`.

I added three Checks: the relation space `(1,1)` vs `(1,−1)/2`, `λ ≠ 0` on `ℚ(i)`, and the plus-part `p`-unit `p`.

## RT-IntegralIwasawaTheoryPartII~1a/F06 (P2) — applied

0.6 now puts `μ_ℓ` on `Γ_{ℓ,p} = Γ_ℓ ∩ GL_n(ℤ[1/p])`, with values in the scaled measure module `M_p` (CD14 §4.1, lines 1063–1089). `Ψ` and `Ψ_ℓ` keep `Γ` and `Γ_ℓ`. 0.8 pulls the cocycle back along multiplication matrices in `Γ_{ℓ,p}` (CD14 p. 29, line 1381). I updated the API and added the Check `(5,3)`: `3 ∈ Γ_{5,3}`, `2 ∉ Γ_{5,3}`.

## RT-IntegralIwasawaTheoryPartII~1b/F01 (P1) — applied

2.4 now reads `W = ε(𝔫)·(ℒ_χ/ℒ_{χ⁻¹})·L(χ⁻¹,0)/L(χ,0)`, with `ν_k(ε(𝔫)) = ⟨N𝔫⟩^{k−1}`. The exponent `+1` follows DDP Prop. 2.7 and (79), and my constant-term computation shows DDP Prop. 2.3's printed exponent is the misprint. New target 2.5a covers the tame-cusp constants. I rewrote the 2.5 and 2.6 routes and updated the 2.4 Checks: `W = ε(Frob₂)²`, `ε(𝔫)²W⁻¹`, and the control `−15`. Two Corrections bullets added; `w`, `c` and Layers 3–5 are unchanged.

## RT-IntegralIwasawaTheoryPartII~1b/F03 (P3) — applied

`TauCeti.absoluteGaloisGroupMap`, `TauCeti.inertiaSubgroup` and `TauCeti.ClassFieldTheory.mem_inertiaSubgroup_of_mk_eq_artinMap` exist at the pin. The docstring now says only that §1.9 lacks the Iwasawa logarithm. I added the three names to the Tau Ceti contract, the Scope, the 1.1 route and *Needs* (a change of embedding conjugates the map), and the Layer 1 Dependencies.

## RT-IntegralIwasawaTheoryPartII~1b/F04 (P3) — applied differently

0.7 is restated for any normal subgroup `S ⊴ G` over a commutative ring `k`, rather than only for `E_+ × T`. (i) Shapiro gives vanishing on free or projective modules. (ii) The edge isomorphism is proved by a double complex under vanishing positive-degree `S`-homology. The Koszul and regular-sequence material and the Tau Ceti Koszul rows are deleted, and the `r = 2` Check is replaced by an `S₃`/`A₃` Check.

## RT-IntegralIwasawaTheoryPartII~1b/F05 (P3) — applied

Remark after 3.9: "for `r = 1`" → "for `r = s = 1`, where `W_2 = E[π]/(π²)`". For `s ≥ 2` it now says that `π` and `y` are independent in `𝔪/𝔪²` and that `U_𝔩 ↦ 1 + log_p⟨N𝔩⟩y` modulo `𝔪²`. The correction bullet for Remark 3.7 is restricted to `r = s = 1`.

## Checks run

- **Elaboration:** `lake env lean packages/IntegralIwasawaTheoryPartII/Suggested.lean`, run from the content checkout, exit 0. Its only message is `Suggested.lean:62:8: warning: declaration uses 'sorry'`. No `TauCeti.*` import, so nothing needed building.
- **Signature check:** I put `#check @…isIso_coinfNatTrans_app_of_isZero_groupHomology_res` in a scratch copy and elaborated it. Every binder is present: `{k G : Type u} [CommRing k] [Group G] (S) [S.Normal] (A : Rep k G)`, the hypothesis on `Rep.res S.subtype A` for `0 < q`, then `IsIso ((groupHomology.coinfNatTrans k S n).app A)`. No `variable` context is involved; nothing changed.
- **Dependency check:**

```text
depcheck: 237 roadmaps, 2148 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line.
- **Citation resolver:** no unresolved cross-roadmap citations or Lean names.
- **Gate failure `tex=4`:** the constant `c_λ(0, E_k(χ, ω^{1−k})|A) = κ_λ · ⟨N𝔫⟩^{1−k} · 2^{−[F:ℚ]} f_{χ⁻¹}(1 − k)` of 2.5a sat in a fenced block indented inside a list item. The check does not treat such a block as code, so it read its four superscript and subscript groups as TeX. The formula is now an inline code span in the same bullet. The later phrase "the first display" now reads "the constant of the first item". The mathematics is unchanged. `Suggested.lean` is untouched, so its elaboration result above still holds. No other fenced block in `packages/IntegralIwasawaTheoryPartII/README.md` is indented, and no TeX-like text is left outside code.

## Adversarial pass (new and changed statements)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Lean edge iso | `S = ⊥` | hypothesis automatic; coinflation `Hₙ(G,A) → Hₙ(G,A)` is the identity | holds |
| Lean edge iso | `S = G` | `n > 0`: `0 → 0`; `n = 0`: `A_G → A_G` | holds |
| Lean edge iso | `G = S = ℤ`, `A = ℂ_p` | hypothesis fails (`H₁ = ℂ_p`); `ℂ_p → 0` is not an isomorphism | hypothesis needed |
| Lean edge iso | `G = S₃`, `S = A₃`, `A = ℂ_p[S₃]` | `ℂ_p, 0, 0, …` on both sides | holds |
| 0.7(i) | `T = ℤ`, `M = ℂ_p[T]` vs `ℂ_p` | `H₁ = ker(1 − π)`: `0` vs `ℂ_p` | freeness needed |
| 0.6 `Γ_{ℓ,p}` | `n = 1`, `ℓ = 5`, `p = 3` | `3 ∈ Γ_{5,3}`, `3⁻¹` acts via `λ = 3`; `2 ∈ Γ_5`, `1/2 ∉ ℤ[1/3]` | restriction needed |
| 1.1 choice of embedding | conjugation by `g` at `𝔮 ∈ R` | local homomorphism scaled by `χ⁻¹(g)`, matching 0.4's row scaling | consistent |
| 2.2b | `F = ℚ`, `χ_4` | `θ²/4`: coefficients `1, 1, 0, 1, 2` at `n = 1..5`, constant `1/4`; `(U₅ − 1)`: `1` at `n = 1` and `5` | holds |
| 2.2b clearing factor `d_2` | `ν_2(d_2)`, `ν_1(d_2)` | `0`; `−p` (`−4` at `p = 2`) | unit at weight one |
| 2.2b constants | modulus `4` vs modulus `1` formula | `1/4` vs `1/2`; `F̃` constant `0` vs `−ℒ_χ/2` | modulus matters |
| 2.4 `W` | `χ = χ⁻¹` | `ε(𝔫)²W⁻¹ = W ⇒ W = ε(𝔫)`; bare inversion would force `ε(𝔫)² = 1` | consistent |
| 2.4 `W` | `ℚ(i)`, `p = 5` | `⟨4⟩ = −4`; `ν_3(W) = 16`; `w = 1` | Case 2 |
| 2.4 negative control | `W = 1` | `1 − (−4)^{k−1}`; `−15` at `k = 3` | nonzero |
| 2.5 constants, `𝔫 = 1` | component `λ` | `ℒ − ℒ − χ⁻¹(λ)L(χ⁻¹)ℒ/L(χ) + χ⁻¹(λ)ℒ_{χ⁻¹}W = 0` | cancels |
| 2.5 constants, `𝔫 ≠ 1` | component `λ` | `ℒ − L(χ)ℒ/L(χ) + 0 = 0` | cancels |
| 2.5a exponent | `N = 4`, `p = 5`, `k = 3`, `φ = ω⁻²` | `φ(4)⁻¹4⁻³ = 1/64 = 4⁻¹⟨4⟩⁻²`; the `k`-independent factor `(1/2)χ(−α)τ(χ)` is the same at all `k` | exponent `1 − k`, so `a_k ∝ ⟨N⟩^{k−1}` |
| 2.5a at `𝔫 = 1` | factor | `⟨1⟩^{k−1} = 1`, agrees with DDP (71) | consistent |
| 2.6 congruences | `T_𝔩`, `U_𝔩` (`𝔩 \| 𝔫`), `U_𝔮` | `χ(𝔩) + ε ≡ 1 + χε ≡ 1 + χ(𝔩)`; `ε(𝔩) ≡ 1`; `1 = 1` | inseparable |
| a/F01 gap, weight one | coefficients at `𝔞 = 𝔞_p𝔞′` | `χ(𝔞_p)Σ_{𝔯 \| 𝔞′}χ(𝔯)` vs `Σ_{𝔯 \| 𝔞′}χ(𝔯)` | equal iff all `χ(𝔮) = 1` |
| 3.9 remark | `r = s = 1`, `w = 1` | `y = π/2`, `U_𝔩 ↦ 1 + ½log⟨N𝔩⟩π` | holds |
| 3.9 remark | `r = 1`, `s = 2` | basis `1, π, y, y²`; `π² = (w+1)y²/w` | not a polynomial in `π` |
| 5.8 step (ii) | `ℚ(i)`, `p = 5` | `u₀ⁿ = 5ᵃζ` gives divisors `(n, −n)` vs `(a, a)`, so `n = 0` | `λ ≠ 0` |
| 5.8 step (ii) | `F = ℚ(√2)`, `H = F(i)`, `p = 3` (inert in `F`, split in `H`) | `D` fixes `√−2`; in `ℚ(√−2)`, `3 = 𝔭𝔭̄`; `z = yσ(y)` has divisor `2h(𝔭 − 𝔭̄) ≠ 0` and `\|z\| = 1` | `ℓ ≠ 0` |
| 5.8 negative control | the `p`-unit `p` | `ℓ_𝔓(p) = 0`, `ord_𝔓(p) = e ≥ 1`, `\|p\| ≠ 1` | needs the minus part |
| 4.1 | the nodal `Λ_H` | completion reduced with two minimal primes | consistent with `Â` reduced |

## Notes for the maintainer

- **Ownership.**
  - Group-homology edge isomorphism: no other owner on main or in the open pull requests (searched for Lyndon, coinflation, Hochschild–Serre and `groupHomology`; Mathlib lists Hochschild–Serre only as a TODO).
  - 2.2b and 2.5a are specific to this application.
  - The weight-one series, the weight-one spaces with products, and the reversed family go to their natural owners through gaps. Those suppliers must now state these extensions.
  - Board packages beyond the index were not checked.
- **Sources.** Only cached texts were used; nothing was fetched and `needs-references.toml` was not written. `sources.toml` now has DDP11 locators for Prop. 2.1–2.7, (48)–(51), (58), (68), (71) and (79), CD14 locators for §4.1 and §5.2, and new `cited_for` sections. I dropped a Deligne–Ribet citation from a gap line rather than add an uncached key.
- **Renamed or dropped names.** No id was dropped. 2.2b and 2.5a are new. The Tau Ceti Koszul names are no longer cited. No roadmap cites this one.
- **Stray file.** A mistyped command created an empty file `jobs-placeholder` in the project state directory, outside the job's folders. I checked it was empty and deleted it; nothing else was touched.
