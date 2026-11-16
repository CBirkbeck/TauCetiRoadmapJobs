# FIX-DESIGN-CompressibleEulerEquations~6

Repair of the six findings of `REV-DESIGN-CompressibleEulerEquations~5` (all P3). Files changed:
`packages/CompressibleEulerEquations/design/README.md`, `packages/CompressibleEulerEquations/design/plan.json`,
`packages/CompressibleEulerEquations/sources.toml`. The design stage has no `Suggested.lean`, so no Lean
statement changed, nothing was elaborated, and the `#check` comparison had nothing to run on.

## F01 (P3) — applied

Verified: §5.4 re-listed `A⁰ ≥ λ₀I` without symmetry; the Jordan block `A⁰ = I`,
`A¹ = [[0, 1], [0, 0]]`, `B = 0` met every listed hypothesis and `(g − th′, h)` leaves `Hᵏ_Λ`.
Old → new: "for coefficients … `A⁰ ≥ λ₀I`" → "for a `LinearSystem n N` of SymmetricHyperbolicSystems
§1.2 satisfying `LinearSystem.IsSymmetricHyperbolic` with constant `λ₀` (`A⁰`, `Aⁱ` symmetric,
`A⁰ ≥ λ₀I`) … by §4.2 `L` is an operator of §5.1". The §5.4 Check now computes the Jordan block.
Same pattern repaired in plan 5.1.1 and 5.4 hypotheses (5.4 gains `target:5.1` and a `jordan_block` test).

## F02 (P3) — applied

Verified on main: PDE §7.1 (README line 2686) and §7.2 (lines 2726–2729) plan periodic Besov spaces on
`𝕋^d = ℝ^d/ℤ^d`. Old → new: "plans no hyperbolic system, no Moser estimate and no periodic Sobolev space"
→ "every statement is scalar; no hyperbolic system, no Moser estimate in `Hᵏ` (§7.3 is paraproducts in
`𝒞^s`); §7.1–§7.2's periodic `B^k_{2,2}` is full-rank `Hᵏ_Λ` up to norm equivalence". New §4.1 Check
and plan test `besov_comparison`.

## F03 (P3) — applied

Verified: `2e^{3t} > 1` iff `t > −(ln 2)/3 ≈ −0.231`; at `t = −1`, `2e^{−3} ≈ 0.0996 ≤ 1`.
Old → new: "`e^{3t}` … `> 1` and is not" → "on `[0, 1]` at least `2 > 1`, not causal there; on
`(−∞, −(ln 2)/3]` causal". Same pattern: "`x(t) = 2t` is not" → "not on any interval of positive
length (on a one-point interval every map is causal)". Plan 3.2 tests `material_curve`, `static_examples` updated.

## F04 (P3) — applied

Verified: `ψA⁰ + (1 − ψ)λI = λI + ψ(A⁰ − λI)`; with `A⁰ = 2I`, `λ = 1`: `ψ = 1/2` gives `1.5I ≥ I`,
`ψ = −1` gives `0`. Old → new: "a smooth cutoff `ψ` equal to `1` near a point" → "`0 ≤ ψ ≤ 1`, equal
to `1` near `p ∈ (0, T) × E`, compactly supported in an open subset of `(0, T) × E` where `u`, `A⁰`,
`Aʲ` are `C¹`". Added: the cut-off system is `C¹` on `ℝ × E` and keeps the predicate with `λ`.

## F05 (P3) — applied

Verified: §7.3's *Needs:* lists §3.3 (slabs); its route uses `J⁻_{C_y}(p)`.
Old → new: Layer 7 Dependencies "Layers 2, 4, 5 and 6" → "Layers 2, 3 (§3.3, for §7.3), 4, 5 and 6";
How to read "(Layers 4–6)" → "(Layers 2 and 4–6, and §3.3 for uniformly local data)".

Same pattern, against each layer's *Needs:* lines: How to read now gives Layer 6 "(Layers 2, 3 and 5)" and Layer 8
"(Layers 1–3, 6 and 7, and LorentzianGeometry §12.6)"; Layer 8 Dependencies add LorentzianGeometry
§12.6, which §8.4 needs.

## F06 (P3) — applied differently

Verified: `ONeill1983` occurred only under References. The target placed it at the future domain of
dependence, beside HawkingEllis1973 §6.5 (`target.md` line 143). It is waived and is cited by its
recorded locator, so I restored that citation rather than deleting the entry. Old → new: §3.3 "(… HawkingEllis1973 at
§6.5)" → "(… HawkingEllis1973 at §6.5; ONeill1983, Ch. 14, causality in Lorentz manifolds)"; plan 3.3
locator gains "ONeill1983 Ch. 14"; manifest `cited_for` "References" → "3.3".

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.4 hypotheses (symmetric predicate) | Jordan block, `n = 1`, `Λ = 2πℤ`, data `(g, h)` with `h` coefficients `∼ |m|^{−k−1}` | `w₂ = h`, `w₁ = g − th′`; `Σ|m|^{2k}|m|^{−2k−2} < ∞`, `Σ|m|^{2k+2}|m|^{−2k−2} = ∞`: `w₁(t) ∉ Hᵏ` for `t > 0`; `A¹ᵀ ≠ A¹` | excluded by the predicate | F01 |
| §5.4 ⇒ §5.1 bounds | `2k > n + 2` ⇔ `2(k − 1) > n` | `Hᵏ_Λ ⊆ C¹_b`, `Hᵏ⁻¹_Λ ⊆ C_b` (§4.2, `j = 1`, `j = 0`): `A⁰`, `∇A⁰`, `∂_tA⁰`, `Aⁱ`, `∇Aⁱ`, `B` bounded and continuous | holds | clause added |
| §5.4 background-speed Check under the new hypothesis | `A⁰ = e^{sin x}`, `A¹ = M`, `N = 1` | `1 × 1` matrices are symmetric; `λ₀ = e^{−1}`; `22πM` against `24eπ` unchanged | holds | none |
| Local identity cutoff | `A⁰ = 2I`, `λ = 1`, `ψ ∈ {1/2, 1, 0, −1}` | `1.5I`, `2I`, `I`, `0` | `ψ ≥ 0` needed, `ψ ≤ 1` harmless | F04 |
| Cutoff support in time | coefficients extended in `t` by their values at `0`, `T` (§5.1), not `C¹` across `t = 0` | `ψ` supported in `(0, T) × E` makes the cut-off coefficients `λI`, `0`, `0` near `t ∈ {0, T}`, hence `C¹` on `ℝ × E`; the supplier's identity is on `(0, T) × ℝⁿ` | holds | support stated in `(0, T) × E` |
| `e^{3t}` for field `(1, x)` | `t = 1, 0, −0.231, −1` | `2e³ ≈ 40.2`, `2`, `1.00`, `0.0996` | causal exactly on `t ≤ −(ln 2)/3` | F03 |
| `x(t) = 2t`, field `(1, 0)` | `J = [0, 1]`, `J = {0}` | `|2 − 0| = 2 > 1` on a set of positive measure; on `{0}` the a.e. condition is vacuous | not causal / causal | pattern of F03 |
| PDE §7.2 comparison | `cos 2πy`, `1` on `𝕋 = ℝ/ℤ`; `cos x`, `1` on `ℝ/2πℤ` | `χ(±1) = 1`; for `j ≥ 1`, `|2^{−j}ξ| ≤ 1/2` and `|2^{−j−1}ξ| ≤ 1/4`, so `ψ_j = 0`; Besov `1/2`, `1`; here `π + π = 2π`, `2π`; ratios `4π`, `2π` | equivalent, not proportional | F02 Check |
| PDE ownership sentence | PDE Scope line 118, §7.3 lines 2787–2800 | "every statement below is scalar"; §7.3 estimates are in `𝒞^α`, `𝒞^β` | accurate | F02 |
| Layer dependency lists against *Needs:* | §6.1–§6.2, §7.1–§7.3, §8.1–§8.4 | Layer 6: §2.1, §2.2, §3.3, §5.2; Layer 7: §2.1, §2.2, §3.3, §4.2–§4.4, §5.1–§5.4, §6.2; Layer 8: §1.2, §1.3, §2.2, §3.1–§3.3, §6.1, §6.2, §7.2, §7.3, LorentzianGeometry §12.6 | lists now complete | F05 and pattern |
| ONeill1983 placement | manifest locator, target brief | locator "Ch. 14", status waived; `target.md` line 143 cites it for the domain of dependence | cited by locator only, no text claimed | F06 |

## Checks run

Dependency check (`gate --candidate … --only CompressibleEulerEquations`):

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2229 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` on the edited README: no cross-roadmap citation and no
Lean name found nowhere (the round-5 lead on `LinearSystem.IsSymmetricHyperbolic` no longer appears;
the name is declared in SymmetricHyperbolicSystems' `Suggested.lean` at its open head, which I read).
`plan.json` parses; `sources.toml` parses. Every one of the 21 manifest keys is cited in the README body
and listed under References.

No gate failures were listed for this round.

## Notes for the maintainer

- New cross-roadmap citations: PDE §7.1, §7.2, §7.3 (on main, checked at main `1a19c9f`). No
  supplier edge: PDE is cited only in Scope and in a Check, not consumed.
- Ownership: Hᵏ_Λ for period groups of every rank stays here. The full-rank case agrees with PDE
  §7.2's periodic `B^k_{2,2}` and IncompressibleFlows Layer 0 up to norm equivalence; both are Checks
  of §4.1. MathematicalStatisticsNonparametric (open) §6.2, "periodic Sobolev classes as
  ellipsoids", is a sequence-space ellipsoid on the one-dimensional torus, a different object. Ownership
  against the other open pull requests was checked with `roadmaps grep`.
- Not changed, for a later round to weigh: Tau Ceti at the pin has `TauCeti.W1p.mul`,
  `TauCeti.W1p.norm_mul_le` and `TauCeti.W1p.mulL`
  (`TauCeti/Analysis/Sobolev/W1p/SupercriticalMultiplication.lean:500,515`): `W^{1,p}(ℝⁿ)` is an
  algebra for `p > n`. At `p = 2`, `n = 1`, `Λ = 0`, `k = 1` this is a special case of §4.3's
  "`Hᵏ_Λ` is an algebra when `2k > n`". §4.3 is a different, general statement and is not a
  duplicate. A one-clause citation could be added there.
- No ids were renumbered or dropped; no name other roadmaps cite changed. No missing source.
  `needs-references.toml` was not created.
- No suspicious instructions were found in the review text.
