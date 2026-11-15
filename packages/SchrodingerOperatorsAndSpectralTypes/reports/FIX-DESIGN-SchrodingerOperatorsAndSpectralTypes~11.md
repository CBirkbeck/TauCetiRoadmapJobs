# Repair report: FIX-DESIGN-SchrodingerOperatorsAndSpectralTypes~11

Findings of `REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~10` (three, all P3). Files changed:
`packages/SchrodingerOperatorsAndSpectralTypes/design/README.md` and
`packages/SchrodingerOperatorsAndSpectralTypes/design/plan.json`. `sources.toml` is unchanged: every
locator added is in `teschl`, already recorded.

## F01 (P3) — applied

Verified. RelativisticQuantumFieldTheory, RicciFlow, SpectralManifolds and PositiveMass are at lines
214, 215, 233 and 290 of `merge-order/ORDER.txt`, all earlier than this roadmap. `roadmaps grep`
finds neither this roadmap's name nor "Kato–Rosenblum" in any roadmap on main or at an open head. A
roadmap earlier in the merge order cannot consume this one.

`## Downstream consumers`: the two bullets naming those roadmaps → the reviewer's two bullets naming
subjects (scattering theory of Schrödinger operators, Layer 1; spectral geometry and heat kernels of
complete noncompact manifolds, 3.6, 3.7, 3.9). The duplicate subjects are dropped from the third
bullet. `plan.json` `consumers` → `[]`. The section titles were checked: 3.6 self-adjointness, 3.7
kernel and bottom of the spectrum, 3.9 bounded potentials. Nothing else in the README or plan names
the four roadmaps.

## F02 (P3) — applied

Verified. For `A = 5` on `ℂ` and `λ = 5`, every `μ_f = |f|²δ₅` is carried by `{5}` and charges no
annulus, so the old route gave no vector for `σ_pp`. The statement itself is true.

Route of 1.4(1): added the `σ_sc` case (atomless, so the annulus argument applies to `P_sc f_n`).
Added the `σ_pp` case: if `P_A({λ}) ≠ 0`, take a nonzero `f ∈ ran P_A({λ})`, which has
`μ_f = ‖f‖²δ_λ`. Otherwise `‖P_A({λ})P_pp f_n‖² = 0` and the annulus argument applies. Also fixed in
the same sentence: the vectors are `P_A(J_m)P_ac f_n`, and choosing each `n` beyond the previous `m`
makes the annuli distinct. The old text said "disjoint annuli" but gave no choice that makes
them so.

## F03 (P3) — applied differently

Verified that "Glazman's lemma" was a route input with no statement, no owner and no locator.
The suggested repair has a flaw. Its "lower bound" (teschl Theorem 4.12(i)) and its "upper bound"
(`L ∩ ran P_A([λ,∞)) = 0`, so `P_A((−∞,λ))` is injective on `L`) both prove `dim L ≤ dim ran P_A((−∞,λ))`.
The reverse inequality was never proved. Teschl line 5075–5077 is exactly that injectivity argument.

Route of 1.6: "Glazman's lemma" → the variational count, stated and proved here for every
self-adjoint `A` and real `λ`. Bound `≥`: teschl Theorem 4.12(i), via SA-E11 on the 1.3 restriction
to `ran P_A([λ,∞))`. Bound `≤`: the ranges of `P_A([λ−m, λ−1/m])` lie in `dom A` (UO-A01–UO-A02),
increase densely, and SA-E13 bounds the form on each. One sentence derives the count. *Needs:* and
plan 1.6b gain UO-A01–UO-A02. New Check and plan test `variational_count` (`λ = 4`, and strictness
at `λ = 3`).

Ownership: `roadmaps grep` finds "Glazman" nowhere. VariationalMethods 4.4 states the counting
function for compact form pairs only (discrete spectrum, a Hilbert basis of eigenvectors; its README
line 800). The Scope section already says this at lines 83–89: VariationalMethods owns the
compact case and 1.6 is the general statement. The route step allows essential spectrum and needs no
eigenbasis, so this roadmap owns it.

## Adversarial pass (changed and added statements)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.4(1) route, `σ_pp` with an atom | `A = 5` on `ℂ`, `λ = 5` | `P_A({5}) = 1 ≠ 0`; `f = 1`, `μ_f = δ₅`, charges `(5−ε, 5+ε)` for every `ε` | correct | added |
| 1.4(1) route, `σ_pp` without an atom | `A = diag(1/k)` on `ℓ²`, `λ = 0` | `P_A({0}) = 0`; `δ_{1/k}` charges `J_m` iff `m < k ≤ m+1`, so `m = k−1`; distinct `k` give distinct annuli; `f = Σ k⁻¹e_k`, `μ_f = Σ k⁻²δ_{1/k}` charges every `(−ε, ε)` | correct | added |
| 1.4(1) route, distinct annuli | same `A`, `f₁ = f₂ = e_3` (`1/3 ∈ I_{1/2} ⊂ I_1`) | both steps may pick `J_2` (`1/3 ∈ J_2`, `2 ≥ 1, 2`); the two vectors are both `e_3`, not orthogonal, and the nonzero weights `1, −1` cancel them; choosing `n₂ > m₁ = 2` forces `m₂ ≥ 3` and orthogonal pieces | "disjoint" was asserted with no choice ensuring it | clarified |
| 1.4(1) route, `σ_sc` | `M_x` on `L²` of the Cantor measure, `λ = 0` | Cantor measure atomless: `μ_{P_sc f}({0}) = 0`, the annulus argument applies | correct | added |
| Glazman `≥` | `diag(1,3,5)`, `λ = 4`, `L = span(e₁,e₂)` | `P((−∞,4))` is the projection onto `span(e₁,e₂)`, identity on `L`; a nonzero `ψ ∈ L ∩ span(e₃) = 0` does not exist | correct | added |
| Glazman `≤` | `diag(1,3,5)`, `λ = 4`, `B_m = [4−m, 4−1/m]` | `m = 1`: `{3}`, range `span(e₂)`; `m = 3`: `[1, 11/3]`, range `span(e₁,e₂)`; dimensions `1, 1, 2, 2, …` → `2`; form `≤ 11/3 < 4` | correct | added |
| Glazman strictness | `diag(1,3,5)`, `λ = 3` | `dim ran P((−∞,3)) = 1`; `e₂` has form `3 = 3‖e₂‖²`, so it is excluded under `<` and the supremum is `1`; with `≤`, `span(e₁,e₂)` would give `2` | strict form is required | Check added |
| Glazman, degenerate | `ℋ = 0`; `λ ≤ inf σ(A)`; `A = M_x` on `L²(ℝ)`, `λ = 0` | `0 = 0`; `P((−∞,λ)) = 0`, and form `≥ inf σ ‖ψ‖² ≥ λ‖ψ‖²` admits only `L = 0`; `∞`: `span{1_{[−j−1,−j]}}`, `j ≤ k`, has form `Σ|c_j|²(−j−½) < 0` | correct, no lower bound needed | stated for every self-adjoint `A` |
| Count via obstacles | `diag(1,3,5)`, `λ = 3` | `d = 1`; `L = span(e₁)` gives `μ₁ ≤ 1 < 3`; obstacle `e₁` leaves `span(e₂,e₃)`, form `≥ 3`, so `μ₂ ≥ 3`; `#{μ_n < 3} = 1` | correct | added |
| Count via obstacles | `−1 ⊕ H₀`, `λ = −1/2` | `d = 1`; `μ₁ = −1 < −1/2`; obstacle `(1,0)` leaves `0 ⊕ L²`, form `≥ 0 ≥ −1/2`, `μ₂ ≥ −1/2`; count `1` | correct | none |
| Count, `d = 0` | `M_x` on `L²[0,1]`, `λ = −1` | no obstacles; every unit `ψ` has form `≥ 0 > −1`, so `μ₁ ≥ −1`; count `0 = dim ran P((−∞,−1))` | correct | none |
| `k`-dimensional `L` ⇒ `μ_k < λ` | `L = span(e₁,e₂)`, `λ = 4`, obstacle `φ = e₁+e₂` | kernel of `ψ ↦ ⟪φ,ψ⟫` on `L`: `e₁ − e₂`, unit form `(1+3)/2 = 2 ≤ c = 3 < 4`, so `μ₂ ≤ 3` | correct | added |
| Ranges in `dom A` | `M_x` on `L²(ℝ)`, `B = [−2, −1]` | `ψ ∈ ran P(B)` is carried by `B`; `∫ x²|ψ|² ≤ 4‖ψ‖² < ∞` | correct | UO-A01–UO-A02 cited |
| Downstream consumers | four named roadmaps | merge-order lines 214, 215, 233, 290, all earlier; no citation of this roadmap anywhere | overclaim | applied (F01) |

## Pattern search

- F01: no other mention of RelativisticQuantumFieldTheory, SpectralManifolds, PositiveMass or
  RicciFlow in the README or plan.
- F02: 1.5 is the only other single-vector or annulus argument, and it uses 1.4(1) pointwise.
  Nothing else to change.
- F03: every named result in the README was listed (Green's formula, Poincaré inequality, Pearson's
  theorem, Weyl's theorem, Rellich theorem, Weyl criterion, Rosenblum's lemma, Duhamel's formula,
  Shterenberg's theorem). Each is either stated where it is used, a section of its own (1.8), or
  owned by a named supplier item (UO-E04; Weyl criterion = `gap:weyl-criterion`). Glazman's lemma
  was the only bare name.

## Checks

Dependency check, output of the prescribed command:

```
candidate: SchrodingerOperatorsAndSpectralTypes is not in the merge order yet; checked as if placed after QuantumFoundations (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2246 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` on the README now reports no cross-roadmap citation
and no Lean name found nowhere.

`Suggested.lean`: the package is at the design stage and has no Lean file. No `#check` scratch was
elaborated, and no Lean command was run.

`plan.json` parses as JSON after the edits. Changes: `consumers` emptied; 1.6b gains prerequisites
UO-A01 and UO-A02, a locator note and the test `variational_count`. Both UO items are already in the
UnboundedOperators supplier `sections` and in the README contract (line 322, "UO-A01–UO-A02").

No gate failures were listed for this round.

## For the maintainer

- No name that another roadmap cites changed. No id was dropped or renumbered.
- No new source was cited. `needs-references.toml` was not written.
- Ownership against open pull requests was checked by object with `roadmaps grep` ("Glazman",
  spectral-projection dimension counts, variational counts). The only related statement is
  VariationalMethods 4.4 (main), for compact form pairs, and the Scope section already separates it
  from 1.6.
- No suspicious instruction was found in the review text.
