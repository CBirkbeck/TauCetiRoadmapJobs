# FIX-DESIGN-VirtualFundamentalClassPartII~17

Findings of REV-DESIGN-VirtualFundamentalClassPartII~16: one, P3. It is right. Four of its five
repairs are applied as worded. The fifth, 9.2, is applied with a wider class than the review asks
for, because the narrower one would break 9.3's route.

## F01 (P3) — applied differently

Changed:

- **1.1:** "along morphisms `𝒩 → ℳ` representable by schemes (… a scheme proper and surjective …)" →
  "… of stacks …, a scheme of finite type over `k`, proper and surjective …".
- **6.1, 9.1, 9.3 API:** "along `X′ → X`" / "`M′ → M`" → "from a stack (Convention 1)", each with what
  the compatibility means.
- **9.2:** "every `M′ → M`" → "every `u : M′ → M` from a scheme or a stack of Convention 1".
- The plan's 1.1 `statement`, `resolutionComparison.functorial`, `RelativeSpaceOfMaps.open_etale`,
  `prestableUpperShriek` and `mapsObstructionTheory.baseChange` are changed to match.

**Verification.** The review is right that each clause admits a source outside the class where its
conclusion is defined. Take `𝒩 = M′ = X′ = ⊔_ℕ Spec k` over `Spec k`. It is étale and representable by
schemes, but it is not quasi-compact, so it is not a stack of Convention 1. For 1.1 the review's
parenthetical also left out finite type over `k`, which the definition of a proper cover needs. With
`𝒩` a stack, finite type follows: `X ×_ℳ 𝒩 → 𝒩` is proper, so of finite type, and `𝒩` is of finite type
over `k`.

**Why 9.2 is applied differently.** The review proposes the class "a stack of Convention 1 or a
locally Noetherian scheme", which is where StableReduction Layer 2 states base change (its Base
convention). That class is too narrow for this roadmap:

- 9.3's route uses 9.2's base change (and the projection formula) along `g : T → M` for **every**
  square-zero extension `T → T̄` with `T̄` affine.
- 7.1 allows extensions of arbitrary schemes, and 7.2 states condition 3 for every affine `T̄`.
  For example, `T = Spec R` with `R = k[x_1, x_2, …]/(x_1, x_2, …)²` is not Noetherian.
- With the review's class, that step of 9.3 would have no supplier.

The true and general statement is base change along every morphism from a scheme. It is supplied by
SchemeAndStackFoundations §2.18 `torIndependent_baseChange` (on main): for a qcqs `f` that is
Tor-independent of the base change, `Lg^*Rf_* ≅ Rf′_*Lg′^*`. It applies on étale charts because the
charts of `π` are flat and proper. For non-Noetherian `M′`, the projection formula for `π′` is the same
section's `projectionFormula`. StableReduction Layer 2 still supplies the locally Noetherian case and
perfectness on `M`.

9.2's Serre duality bullet had the same unqualified "compatible with base change". It is now limited
to stacks of Convention 1, which is what the 9.3 API bullet uses. 9.3's route does not use Serre
duality on `T`.

**Checks added (all computed; see the table).**

- **1.1:** `⊔_ℕ Spec k` is excluded; `Spec K` is included.
- **6.1:** the ℙ¹ example pulled back to a point.
- **9.1:** `⊔_ℕ Spec k → Spec k` lifts uniquely but is excluded.
- **9.2:** the non-flat, non-Noetherian base change `Spec R → 𝔸¹` with `t ↦ x_1`.
- The matching plan tests: `baseChange_nonRepresentable`, `P1_nonChainAutomorphism`, `pointTarget`
  and the new `nonNoetherianBaseChange`.

**Same pattern, other places.**

- 1.1's "products `ℳ ×_k ℳ′`" left `ℳ′` unqualified. It now reads "with a stack `ℳ′`" (plan too).
- In the SchemeAndStackFoundations contract, §2.18 now names `projectionFormula` and
  `torIndependent_baseChange`.
- Checked and left unchanged, because each conclusion is an identity in Chow groups, which 2.1–2.2
  define only for stacks:
  - 3.3 push–pull (`ψ : 𝒢′ → 𝒢`);
  - 3.4 and 4.1 products (`ℱ′ → ℱ`, `𝒢′ → 𝒢`);
  - 4.2, whose clauses already say "from a stack" and "of algebraic stacks locally of finite type";
  - 4.3, which says "from a stack".
- 8.1's smooth base change was settled last round. 9.2's "étale base change on `M`" refers to `M_ét`.
- The StableReduction contract already says "over locally Noetherian bases".

## Checks run

- **Dependency check** (output verbatim):

      candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
      depcheck: 235 roadmaps, 2227 edges, 0 problem(s)

  There is no UPWARD and no CYCLE line.
- **Citation resolver** on `packages/VirtualFundamentalClassPartII/design/README.md`: no cross-roadmap
  citation and no Lean name found nowhere. The two names now cited, `projectionFormula` and
  `torIndependent_baseChange`, were also read in SchemeAndStackFoundations §2.18 on main.
- **`plan.json`** parses. Its formatting is unchanged (a one-space-indent round trip reproduces the
  file byte for byte), and the diff touches only the entries named above plus one added test.
- **`Suggested.lean`:** none at the design stage. No `#check` elaboration applies, and none was run.
- **Gate failures:** none were listed for this round.
- **Style:** a search of the added lines found no LaTeX delimiters, process words or paths.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 passage along `𝒩 → ℳ` | `𝒩 = ⊔_ℕ Spec k → Spec k`; `Spec K → Spec k`, `K/k` finite; `Spec k → BG` with `X = Spec k` | not quasi-compact, so excluded; base change `Spec K`, finite type, proper cover; `X ×_{BG} Spec k = G`, finite of degree `\|G\|` over `Spec k`, a proper cover | holds in the stated class | F01 |
| 1.1 products | `ℳ′ = ⊔_ℕ Spec k`; `ℳ′ = BH` with cover `Spec k` | excluded; `X × Spec k → ℳ × BH` proper and surjective, `X` of finite type | holds with `ℳ′` a stack | pattern |
| 6.1 pullback | `X = Spec k`, `F• = 0`, `H• = [O → O]`, `u : Spec K → Spec k`; the ℙ¹ example at a closed point | `u^*P = 𝔸¹_K = 0 ×_{Spec K} 𝔸¹_K`, rank `1` both ways; `u^*ξ = 0` in `Hom_{D(k)}(k, k[1]) = 0`, `P_pt = F_1 × F_0 = k²`, rank `2 = 1 + 1`, the fibre of `O(3)²` | holds; the global nonsplit extension splits at a point | F01, Check |
| 9.1 étale stability | `M′ = ⊔_ℕ Spec k → M = Spec k = 𝔅`, `X = Spec k`; `M′ = Spec K → Spec k`, `K/k` finite separable | lifting sets are singletons on both sides, but `M′` is not quasi-compact, so excluded; `Spec K → Spec k` étale, singletons, a relative space of maps | holds for `M′` a stack | F01, Check |
| 9.2 base change (wider class) | `u : Spec R → 𝔸¹`, `t ↦ x_1`, `R = k[x_1, x_2, …]/(x_1, x_2, …)²`, `𝒞_M = C × 𝔸¹`, genus `g`; the review's `Spec k[x_1, x_2, …] → Spec k` | `t·x_1 = x_1² = 0`, so not flat; `m/m²` of infinite dimension, so not Noetherian; `Rπ′_*O = R ⊕ R^g[−1] = Lu^*(k[t] ⊕ k[t]^g[−1])`; flat case `RΓ(C, V) ⊗_k A` both ways | holds for every scheme, by Tor independence | F01 (differently), Check |
| 9.3 route needs the wider class | `T̄ = Spec(R ⊕ R)` (trivial extension, `J = R`), `T = Spec R` as above, `g : T → M` | `T` not Noetherian; the identification `H^i(𝒞_T, F_T^*T_X ⊗ π^*J) = Ext^i_T(g^*E, J)` uses `Rπ_{T*}F_T^*T_X = Lg^*Rπ_*F^*T_X`, which needs base change and the projection formula over `T` | the review's class would leave this step unsupplied | reason for "differently" |
| 9.2 Serre duality base change | `M′ = Spec K → M`, `K/k` finite; `C × M`, `V = O`, genus `g` | `Rπ′_*O = K ⊕ K^g[−1]`, whose dual has `H⁰ = K` and `H^{−1} = K^g`; `Rπ′_*ω[1] = (K^g ⊕ K[−1])[1]` has `H^{−1} = K^g` and `H⁰ = K`; both sides agree and are the base change of the same statement over `M` | holds on stacks of Convention 1 | pattern |
| 9.3 `φ` base change | the `ℙ¹ → ℙ^r` space `M`, `u` a `k`-point `[F]` | `E′ = H⁰(ℙ¹, F^*T)^∨` of rank `(r + 1)(d + 1) − 1`; `L_{pt/k} = 0`, so `φ′ = 0 = (u^*Ω_M → 0) ∘ u^*φ` | holds | F01 |
| 9.3 `φ` base change, non-flat | the `L` with doubled origin example, `u : Spec k → L` at `0₁` | `E = Ω_L`, `φ = id`; `E′ = (RΓ(ℙ¹, O) ⊗ T_{0₁})^∨ = k`, `φ′ : k → L_{pt/k} = 0` is `0`, which is `u^*id` followed by `u^*Ω_L → 0` | holds | F01 |

## For the maintainer

- **Names:** no name that another roadmap cites changed. One test was added to the plan
  (`nonNoetherianBaseChange`).
- **Suppliers:** no new supplier and no new edge. SchemeAndStackFoundations §2.18 was already a
  supplier of 9.2 (its *Needs:* and the plan's prerequisites); it is now cited by declaration name.
- **Ownership:** no new construction was introduced, so no ownership question arises. Ownership against
  the open pull requests is as the review recorded it.
- **Sources:** no source was fetched and `sources.toml` is unchanged. The Tor-independent base change
  is cited through SchemeAndStackFoundations §2.18, whose own locator is the Stacks project, §36.22.
  No `needs-references.toml` was written.
- **Suspicious text:** none in the review.
