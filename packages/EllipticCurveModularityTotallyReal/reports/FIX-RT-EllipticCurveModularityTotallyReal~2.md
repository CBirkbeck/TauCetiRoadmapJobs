# FIX-RT-EllipticCurveModularityTotallyReal~2

Repair round for red-team round 2. There were two passes.

- Pass a (`RT-EllipticCurveModularityTotallyReal~2a`) has verdict *accepted* and raises no finding.
  It lists a LeHung26 misprint (LeHung26 line 201: the cubic member of the tower is introduced
  before 3 ∣ n is assumed). The roadmap already requires `3 ∣ n` for the cubic endpoint (§§1.2 and
  1.6), so nothing needs to change.
- Pass b (`RT-EllipticCurveModularityTotallyReal~2b`) raises one finding, F01 (P2). It is right
  and is applied.

Only `packages/EllipticCurveModularityTotallyReal/README.md` changed (§4.3). `Suggested.lean`,
`metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## RT-EllipticCurveModularityTotallyReal~2b/F01 (P2) — applied

Old (§4.3): "`π_E = AI_{KT/K}(ξ)`, unitarily normalized", and "the good polynomials of `AI(ξ)` and
of `Ind ξ_ι` agree". New: `ξ(w) = ξ_w(ϖ_w)`, `ξ^u = ξ·‖·‖_{KT}^{1/2}` (unitary),
`π_E = AI(ξ^u) = AI(ξ) ⊗ ‖det‖_K^{1/2}`. The proof now derives the shifted local parameter, the
archimedean type and the central character. A new Check pins the twist at 5 and at 3.

**Verification.** I checked each step of the witness myself.

- **Supplier.** GL2AutomorphicRepresentationsAndTransfer R17.4.16, read at its open head:
  - `AI_{K/F}(θ)` has local parameter `Ind θ_w` and central character `η_{K/F}·θ|_{𝔸_F^×}`.
  - Twisting satisfies `AI(θ·χ∘N) = AI(θ) ⊗ χ`.
  - That roadmap's `rec` is the unshifted normalized-induction one (its Conventions).
- **Reciprocity and weight.** AutomorphicGaloisRepresentationsPartII AG2.0 normalizes `Art` to send
  uniformizers to geometric Frobenius. It also gives `ι ∘ r_{ℓ,ι}(χ)|_{W_v} ∘ Art_v = χ_v`,
  `r_{ℓ,ι}(‖·‖) = ε_ℓ` and `|χ| = ‖·‖^{−wt(χ)/2}`.
- **What `AI(ξ)` would give.** At the split prime 5 for `y² = x³ − x`, `AI(ξ)` has Satake
  parameters `−1 ± 2i`, of product 5. The shifted parameter `rec(π₅ ⊗ |det|^{−1/2})` then has
  trace `√5·(−2) = −2√5 ≠ a₅ = −2`, and the central character is `‖·‖⁻¹`.
- **Source.** OpenAI26 lines 1209–1210 states the `|det|^{1/2}` normalization explicitly.
- **Parent roadmap.** EllipticCurveModularityImaginaryQuadratic §8.6 says "algebraic-to-unitary
  norm twist".

**Changes to the reviewer's text.**
1. The statement defines `ξ(w) = ξ_w(ϖ_w)`, the geometric Frobenius eigenvalue on `ξ_ι` by AG2.0.
   For consistency it renames the proof's "good place v of KT" to w.
2. The proof states why `ξ^u` is unitary: ξ has weight 0 + 1 = 1 in AG2.0's sense, so
   `|ξ| = ‖·‖^{−1/2}`.
3. It adds the archimedean type, which the finding did not cover. At a real place of K, `ξ^u_∞` is
   `z ↦ (z/|z|)^{±1}`, which induces to `D_{2,0}`: R16.2.13 with m = 1 and t = 0. For ξ itself,
   `z̄^{−1} = (z/|z|)|z|^{−1}` gives `D_{2,0} ⊗ |det|^{−1/2}` (t = −1/2). Without this,
   "type `(2,0)`" was asserted with no reason.
4. It defines `η_{KT/K}` at first use.
5. The determinant step is spelled out: the determinant of an induced character is `η` times the
   character composed with the transfer, and the transfer corresponds to `𝔸_K^× ⊂ 𝔸_{KT}^×`.
6. The reviewer's Check is reworded. Its inert-prime clause now derives `ξ(3𝒪) = −3`
   (`Frob₃²` acts on each line by `(±√−3)² = −3`) and computes the central character at 3.

**Pattern search.**
- "unitarily", "AI(", "AI_{" and "automorphic induction" appear nowhere else in the README.
- The Summary (line 27), "Kept variants" (§4.3 as the counterpart of §8.6), §4.4 ("the cuspidal
  induction of §4.3") and the Layer 4 Examples name no character and make no normalization claim.
  They are correct as they stand.
- The `Suggested.lean` docstring says only that the pins lack "quadratic automorphic induction of
  algebraic Hecke characters", which is still true. It is unchanged.
- The same phrasing is in `design/README.md` line 1166 and the §4.3 statement in
  `design/plan.json` line 891. Both are outside what this job may edit (only the plan's `gaps` list
  is editable).

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed (both sides) | Result / change |
|---|---|---|---|
| `ξ(w) = ξ_w(ϖ_w)` is the geometric Frobenius eigenvalue on `ξ_ι` | `y² = x³ − x`, `KT = ℚ(i)`, w above 5; wrong model with arithmetic `Art` | AG2.0: `ξ(w) ∈ {−1 ± 2i}`, sum −2 = `a₅`. Arithmetic normalization would give `ξ(w)⁻¹ = (−1 ∓ 2i)/5`, sum `−2/5 ≠ a₅` | holds; geometric normalization stated |
| `ξ^u` is unitary | w above 5 (q = 5); w above 3 (q = 9); weight | `\|−1 ± 2i\|/√5 = 1`; `\|−3\|/√9 = 1`; HT weights at τ, τc are 0 and 1, so wt = 1 and `\|ξ\| = ‖·‖^{−1/2}` | holds |
| `AI(ξ^u) = AI(ξ) ⊗ ‖det‖_K^{1/2}` | R17.4.16 twist with `χ = ‖·‖_K^{1/2}`; split place 5 | `‖N x‖_K = ‖x‖_{KT}`, so `χ∘N = ‖·‖_{KT}^{1/2}`; at 5, `‖(x,y)‖ = \|x\|₅\|y\|₅ = \|xy\|₅` | holds |
| Shifted parameter = `Ind ξ_w` (split place) | 5, three candidate twists | `AI(ξ^u)`: parameters `(−1 ± 2i)/√5`, shifted trace −2 = `a₅`. `AI(ξ)`: −2√5. `AI(ξ‖·‖^{−1/2})`: parameters `√5(−1 ± 2i)`, product 25, shifted trace −10 | only `ξ^u` matches |
| Shifted parameter = `Ind ξ_w` (inert place) | 3, residue field 𝔽₉ | `ξ_w(3) = −3`; Frob₃ on `Ind ξ_w` is `[[0, −3], [1, 0]]`, polynomial `X² + 3 = X² − a₃X + 3` with `a₃ = 0`. With `AI(ξ)`: the line value −9 gives `X² + 9` | only `ξ^u` matches |
| Archimedean type `(2,0)` | real place of K, `ξ_∞ = z̄^{−1}` or `z^{−1}` | `ξ^u_∞ = z̄^{−1}\|z\| = z/\|z\|` → `D_2` (R16.2.13, m = 1, t = 0). `ξ_∞ = (z/\|z\|)\|z\|^{−1}` → `D_2 ⊗ \|det\|^{−1/2}`. `z^{−1}` gives the conjugate character, same induction | holds |
| `ξ\|_{𝔸_K^×} = η‖·‖_K⁻¹` and trivial centre | K = ℚ at 5 and 3; K = ℚ(√2), KT = ℚ(ζ₈) at the place above 3 | ℚ, 5: `ξ(w)ξ(w̄) = 5 = η(5)·5`; centre `1·5·(1/5) = 1`. ℚ, 3: `ξ(3𝒪) = −3 = (−1)·3`; centre `(−1)(−3)/3 = 1`. ℚ(√2): 3 is inert (2 is a nonsquare mod 3), q_v = 9; 3 has order 2 mod 8, so v splits in ℚ(ζ₈); `ξ(w) = ξ(w̄) = −3`, product `9 = η(ϖ_v)‖ϖ_v‖⁻¹`; centre `9/9 = 1`. With `AI(ξ)` the centre is 5, 3 and 9 there: `‖·‖⁻¹` | holds; with `AI(ξ)` it fails |
| Cuspidality `ξ^u ≠ (ξ^u)^c` | `‖·‖_{KT}` is c-invariant | `ξ^u/(ξ^u)^c = ξ/ξ^c ≠ 1` (HT weights differ) | holds |
| Point counts in the Check | `y² = x³ − x` over 𝔽₃ and 𝔽₅ | 𝔽₃: x³ − x = 0 for every x, so 3 + 1 = 4 points, `a₃ = 0`. 𝔽₅: x = 0, 1, 4 give 1 point each, x = 2, 3 give 2 each, so 7 + 1 = 8 points, `a₅ = −2`, roots of `X² + 2X + 5` are `−1 ± 2i` | agree |
| Degenerate branch | `T ⊂ K` | impossible for totally real K; the isobaric case stays out of scope (existing Check) | no change |

All other Checks of §4.3 use `y² = x³ − x`, `y² = x³ + 1` and the field-of-definition statements.
None of them uses the normalization of `π_E`, and I recomputed them unchanged: 6 points over 𝔽₅
for `y² = x³ + 1`, `[i]^*ω = iω`, `ℚ(√2, i) = ℚ(ζ₈)`, and Frobenius pullback 0 over 𝔽₂ and 𝔽₃.
§4.2(1) (trivial central character) and §4.4 now agree with §4.3.

## Checks run

- **Elaboration.** `lake env lean packages/EllipticCurveModularityTotallyReal/Suggested.lean`
  from the content checkout: exit 0. The only messages are `declaration uses 'sorry'` at 58:8
  (`realCyclotomic_isCMField`) and 80:8 (`three_five_switch`). No `TauCeti.*` object file was
  missing.
- **Signatures.** I appended `#check @…realCyclotomic_isCMField` and `#check @…three_five_switch`
  to a scratch copy of the file and elaborated it once: 0 errors. Both elaborated types are
  identical to those in the worker's signature list and match README §1.1 item 4 and §2.3. No
  binder was lost, and nothing changed.
- **Dependency check.**

  ```text
  depcheck: 236 roadmaps, 2156 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. The edit adds no supplier: GL2AutomorphicRepresentationsAndTransfer
  R16.2.13 and R17.4.16 and AutomorphicGaloisRepresentationsPartII AG2.0 were already in §4.3's
  *Needs:* line and in the supplier contracts.
- **Citation resolver** (`roadmaps resolve` on the README): no cross-roadmap citations and no Lean
  names found nowhere. The three `ArithmeticGaloisRepresentations` names the worker's list showed
  before were already explained as that roadmap's planned declarations.

## Ownership, sources, gates

- **Ownership.** No new object. Quadratic automorphic induction stays with
  GL2AutomorphicRepresentationsAndTransfer R17.4.16 (read at its open head), and the ℓ-adic
  character with AutomorphicGaloisRepresentationsPartII AG2.0 (read at its open head).
- **Sources.** No new source was fetched and `sources.toml` is unchanged. The new text relies on
  the existing locator OpenAI26 lines 1200–1215, and I read lines 1209–1215 for the twist and the
  central character. Nothing was added to `needs-references.toml`.
- **Gate failures.** None were listed for this round.
- **Untrusted text.** Neither review contained instructions; nothing suspicious to quote.

## For the maintainer

- `design/README.md` line 1166 and `design/plan.json` line 891 still say "`AI_{KT/K}(θ)`, unitarily
  normalized". They are design-stage copies this job may not edit. The package README is the
  roadmap.
- No name or id that other roadmaps cite changed: §4.3 keeps its number and heading, and
  `Suggested.lean` is unchanged.
