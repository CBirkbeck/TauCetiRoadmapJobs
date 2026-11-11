# FIX-PKG-ProetaleCohomologyOfPAdicCurvesAndTowers~5

This round repairs the four findings of `REV-PKG-ProetaleCohomologyOfPAdicCurvesAndTowers~4`. There is one review, so the finding ids are unqualified.

Files changed:
- `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md`
- `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/sources.toml`: two locator extensions on existing keys, and no new key.

`Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged. No finding needed a Lean change or a new supplier gap.

## F01 (P3) — applied

The §4.1 dagger-disc Check changed from `ℚ_p ⊗ (O(Y^†)^{**}/C^×)` to `ℚ_p ⊗ (O(Y^†)^{**}/(1 + m_C))`. It now says that `O(Y^†)^{**} ∩ C^× = 1 + m_C`, with the witness from the review:
- `|p − 1| = 1`, so `p ∉ O^{**}`;
- `1 + p² ∈ O^{**}`, and its logarithm is constant, so its class is zero in `O(Y^†)/C`.

Pattern search: `C^×` occurs nowhere else as a quotient of principal units. §3.5 already uses `1 + m_C`. The completed tensors `ℤ_p ⊗̂ O^{**}` and `ℚ_p ⊗̂ O^{**}` of §§3.4–3.5 kill `1 + m_C` automatically, because that group is p-divisible.

## F02 (P2) — applied differently

The finding's premise is wrong: connectedness is already a standing hypothesis.
- The Layer 2 preamble already read "Throughout Layers 2–4 a curve is a smooth connected separated rigid analytic curve". This transfers CDN-CURVES lines 129 and 806–807.
- So the targets cited at §§3.3 and 4.1 are already the connected versions, and they hold as stated.

The repair makes the hypothesis visible and adds the disjoint-union form the reviewer asked for:
- **Layer 2 preamble.** It now says that an affinoid is connected, and that connectedness is what makes the constants a single copy. Finite disjoint unions are treated componentwise, with `H⁰_dR = C^m`, `O_C^m`, `(1 + m_C)^m` and `((F¹A_cris)^{φ=p})^m` in place of the single copies. Countable unions stay in §4.2.
- **Conventions.** A new bullet states the same, with the two-disc witness.
- **§4.1.** It now opens with "affinoid curve (connected…)". A new Check covers `D ⊔ D`: `(0, 1)` has `d = 0` and is nonzero modulo `C`, but is zero modulo `C²`.
- **§3.3.** The H⁰ Check now gives the value on two disjoint discs.

Audit of the other one-copy constants:
- Already connected or already componentwise: §2.3, §3.3's `O(Y_S)/O_C`, §3.5, §4.2, §5.3 (`ℤ_p^{π₀}`), §5.5 (`Ω^{r−1}/ker d`), §6.5 (`O(H²)/C`, which is connected) and §7.3 (`O/H⁰_dR`).
- None needed a change.

## F03 (P1) — applied

`Syn(Y_S, 1)` changed from "the total complex of the cone of `1 − φ/p`" to "the mapping fibre `Cone(1 − φ/p)[−1]`".
- The cone and shift follow Mathlib's `CochainComplex.mappingCone` and `CochainComplex.shiftFunctor` (checked at the pin; both added to the Mathlib contracts).
- So `Syn^n = F¹C^n ⊕ C^{n−1}` and `d(x, y) = (dx, −(1 − φ/p)x − dy)`.
- Degree 0 is `∏F¹O(Ỹ_i)`. Degree 1 is `Ω¹ ⊕ F¹O_PD`, plus `O(Ỹ_i)`.

This matches CDN-CURVES lines 3591–3611.

New Checks:
- **Degrees.** On the closed disc, `H^{−1} = 0` and `H⁰ = ℤ_p t` for p odd. The unshifted cone has `H^{−1} = ℤ_p t`.
- **Signs.** With `f = 1 + pT` and `φ(T) = T^p`, the pair `(x, y)` is a cocycle. The other sign convention gives `2(1 − φ/p)x`, whose coefficient at `T = 0` is `2p ≠ 0`.

Pattern repair (recomputing the H⁰ Check on the changed complex):
- `(F¹A_cris)^{φ=p}` is `ℤ_p t` only for p odd.
- For p = 2, `t^{p−1} ∈ pA_cris` puts `t/2` in `F¹A_cris` with `φ(t/2) = 2·(t/2)`. Proof: `ω = π/φ^{−1}(π) ≡ φ^{−1}(π)^{p−1}` mod p; `ω^p ∈ p!A_cris`; hence `π^{p−1} ∈ pA_cris`, and so `t ∈ 2A_cris` at p = 2.
- The H⁰ Check, the Layer 2 preamble and the new degree Check are qualified accordingly.
- No §3.3 theorem changes: the regulator isomorphism is claimed only for p > 2.

## F04 (P2) — applied

New §1.4 (*Uniformizer normalizations of semistable period data*) in Layer 1:
- It is stated for a σ-semilinear `(φ, N_raw)` module, with `N_p = N_raw/e`, the two embeddings and a map `ι_HK^ϖ` attached to the uniformizer.
- It defines `ℓ_b`, `D_raw`, `D_p`, `A_e`, `Ψ_ϖ` and `ι_HK^{(p)}`, and proves the scaling, unit-factor and Hyodo–Kato-map identities.
- Independence of `ϖ` is proved under the transport law, using the finite exponential and cocycle of CohomologyComparisons §4.5.
- It has four Checks: `A₂(e₁ + ue₀) = e₁ + 2ue₀`; `Ψ₁₂(u) = u − ℓ₄`; the sign of the correction (the wrong sign gives `ι^3(e₁ + 2log₃4·e₀)`); and `N = 0` with `ϖ = p`.

Knock-on changes:
- The Layer 5 preamble is now a specialization of §1.4.
- §§4.3, 5.2, 5.4, 5.5, the CohomologyComparisons contract, Scope, "How to read the build" and the Needs and Dependencies lines now cite §1.4.
- No "Layer 5 preamble" citation remains.

## Checks

- **Lean.** `lake env lean packages/ProetaleCohomologyOfPAdicCurvesAndTowers/Suggested.lean` exits 0. Its only warning is `Suggested.lean:124:8: declaration uses 'sorry'`. There is no TauCeti import, so no module build was needed.
- **Signatures.** I put `#check @name` for all 8 declarations in one scratch copy and elaborated it once (exit 0), then compared each type with the README. All 8 match and no binder is lost: the headline keeps `Fact p.Prime`, `NormedAlgebra ℚ_[p] K`, `FiniteDimensional`, `Field A` and `CharZero A ∨ CharP A p`. Nothing changed.
- **Dependency check** (full output):
  ```text
  depcheck: 236 roadmaps, 2155 edges, 0 problem(s)
  ```
  There is no UPWARD, CYCLE or moved line. The new edge, Layer 1 → CohomologyComparisons §4.5, points to order position 181, below this roadmap's 265.
- **`roadmaps resolve`.** It lists two leads, both unchanged since earlier rounds:
  - ModpRepresentationsOfGL2OverLocalFields §0.3: a board package at order 264, an earlier supplier;
  - PadicLocalLanglandsForGL2QpPartII §4.1: a board package at order 383, a downstream consumer.

  No Lean names are unresolved; the earlier `Semistable.aOmega` lead no longer appears.
- **Ownership.**
  - CohomologyComparisons §4.5, read with `roadmaps show`, owns `N_norm` and the `ρ` transport, but not the unit factor `ϖ^e/p` or `ι_HK^{(p)}`.
  - `roadmaps grep` for `ϖ^e/p`, `π^e/p`, `eu − ℓ`, `u ↦ eu` and "normalized Hyodo–Kato map" finds no other owner, on main or in the open roadmap pull requests. So this roadmap owns §1.4.
  - No id that another roadmap cites was dropped: they cite only §§0, 6 and 7.
- **Style.** There is no LaTeX, machine path or process wording in the README. `sources.toml` parses.

## Adversarial pass (new or changed statements)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §4.1 principal units | `p`, `1 + p²`, two discs | `abs(p−1) = 1` excluded; `abs(p²) < 1` included; `log(1 + p²) = p² − p⁴/2 + …` is constant; constants on two discs are `(1 + m_C)²` | Repaired |
| §4.1 / Layer 2 connectedness | `D ⊔ D`, `f = (0, 1)` | `ker d` on `O/C` has dimension 1; on `O/C²` it has dimension 0; `H⁰_syn` has rank 2 against 1 | Componentwise form added |
| §3.3 fibre degrees | closed disc, p odd | `Syn^{−1} = 0`; `H⁰ = ℤ_p t`. Unshifted cone: `H^{−1} = ℤ_p t`, regulator in `H⁰` | Fixed |
| §3.3 differential sign | `f = 1 + pT`, `φT = T^p` | `dy = (φ/p)x − x`, so `−(1 − φ/p)x − dy = 0`. Other sign: coefficient `2p ≠ 0` at `T = 0`. Mathlib cone `(−da, fa + db)`, shifted by `[−1]`, gives `(dx, −fx − dy)` | Consistent |
| §3.3 H⁰ at p = 2 | p = 2, 3 | p = 3: `ℤ_3 t`. p = 2: `π ∈ 2A_cris`, so `t = Σ ±2^n a^n/n ∈ 2A_cris` (as `v_2(2^n/n) ≥ 1`), giving `t/2 ∈ (F¹A_cris)^{φ=2}` | Qualified |
| §1.4 `ℓ_b` | b = 4 at p = 3; b = −1 | `θ(ℓ_4) = log₃4`, `v₃ = 1`; −1 is Teichmüller, so `ℓ_{−1} = 0` | Holds |
| §1.4 scaling | e = 2 | `A₂(e₁ + ue₀) = e₁ + 2ue₀`; `D_p(e₁ + 4ue₀) = −3e₀`; `D_p(e₁ + 2ue₀) = −e₀` | Holds |
| §1.4 Ψ, ι^(p) | e = 1, ϖ = 12 | `Ψ(u) = u − ℓ₄`; horizontal `exp(uN_p)(b ⊗ m)` maps to `θ(b)ι^ϖ(exp(−log a·N_p)m)` | Holds |
| §1.4 independence | ϖ to ϖw | `e·log w − (log a + e·log w) = −log a`; `ι^{(p)}` from 3 and from 12 both equal `ι^3`; the wrong sign gives `ι^3(e₁ + 2log₃4·e₀)` | Holds |
| §1.4 G_K | Kummer cocycles | `c_a = e·c_ϖ − c_p`, so `gΨ(u) = Ψ(gu) = eu_ϖ − ℓ_a + c_p t` | Holds |
| §1.4 degenerate | N = 0; e = 1 with ϖ = p | `ι^{(p)} = ι^ϖ`; `a = 1`, `ℓ₁ = 0`, all three maps are the identity | Holds |

## For the maintainer

- **No Lean name changed.** §1.4 is a new section; no existing id moved.
- **Source issues** (not copied into the README):
  - CDN-CURVES differential sign. The differential at line 2093 and the coboundaries at lines 2109 and 2121 use `(1/p) log(ũ^p/φ(ũ))`. Lines 532, 2106 and 3616 print `(1/p) log(φ(ũ)/ũ^p)`, which is a cocycle only for the opposite differential. The README uses Mathlib's convention, under which its regulator formula is a cocycle, and records the source variant.
  - CDN-CURVES H⁰ at p = 2. Lines 2096 and 3676 state `H⁰_syn = ℤ_p t` for every p; at p = 2 the group contains `t/2`.
- **Open pull requests.** Ownership against them was checked with `roadmaps grep` and `roadmaps show`.
- **Untrusted text.** The review text contained no suspicious instructions.
