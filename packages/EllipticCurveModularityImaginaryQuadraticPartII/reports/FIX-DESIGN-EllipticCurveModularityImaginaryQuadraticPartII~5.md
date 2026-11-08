# FIX-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~5

The review of round 4 had one finding (F01, P2). It is right: ArithmeticGaloisRepresentations owns
the trace-zero adjoint, and §3.1 here defined it again. §3.1 now imports that object and keeps only
two facts the supplier does not state. The suggested repair was used with one correction, so it is
marked *applied differently*. The suggestion named `LieAlgebra.SpecialLinear.sl (Fin 2) k` as "the
carrier on which ArithmeticGaloisRepresentations §7.7 computes `H¹(SL₂(F), ad⁰)`". That roadmap
uses a different carrier, the Mathlib trace kernel, so the repair names that one.

Files changed: `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md` and
`design/plan.json`. `sources.toml` is unchanged.

## F01 (P2) — applied differently

**Verified.** At its open head, ArithmeticGaloisRepresentations §7.2 says that it owns the
trace-zero adjoint and its pairing consequences. Its API includes *ContinuousRep.adZero*, the
perfect invariant trace pairing, the splitting `ad = A·1 ⊕ ad⁰` when `n ∈ A^×`, and base change. The
roadmap is a new-folder pull request and comes earlier in the merge order. Its §7.9 declares
`ResidualImage.adZeroRep (r : G →* GL n k)`, for any group and any field, on
`LinearMap.ker (LinearMap.trace k (n → k))`, built with `Representation.linHom` (its
`Suggested.lean`, Layer 7). The same section uses this declaration for `H⁰` and `H¹` in
`IsAdequate`, and for its Check that `SL₂(F_5)` is not adequate.

**Correction to the suggested repair.** The suggestion named the wrong carrier, as described above.
A second point: §7.2 works with profinite `Γ`, and `SL(2, k)` is profinite only when `k` is finite.
So for an arbitrary field `k` the exact identification is §7.9 `ResidualImage.adZeroRep` of
`Matrix.SpecialLinearGroup.toGL`, and §7.2 applies when `k` is finite.

**Changes.** Old → new:
- §3.1: definition "Define … on `LieAlgebra.SpecialLinear.sl (Fin 2) k` … built with
  `Rep.ofDistribMulAction`", with five API bullets → theorem "The adjoint representation of `SL₂`,
  specialised". It imports `ad⁰` from AGR §7.9 (and §7.2 for finite `k`) and proves two facts: `−1`
  acts trivially, and `H⁰(SL(2, k), ad⁰) = 0` when `2 ∈ k^×`.
- §3.1 hypothesis: "odd characteristic" → `2 ∈ k^×`. This is more general (it includes
  characteristic 0), and the proof works as written.
- §3.1: the trace form, its perfectness and base change are now cited from AGR §7.2.
- §3.1 Checks: Check 1 adds that `U` alone fixes the line `k e`. Check 3 now tests the hypothesis
  `2 ∈ k^×`: in characteristic two, `H⁰ = k·1 ≠ 0`.

The same pattern elsewhere:
- Scope, Layer 3 bullet (line 42): replaced as the review proposed, with AGR §§7.2 and 7.9 named.
- Scope, "Imported, never re-planned" (line 67): a sentence records the adjoint as imported from AGR
  §§7.2, 7.7 and 7.9.
- Conventions, `ad⁰` bullet (line 125): now cites AGR §7.2 and §7.9. "every odd characteristic" →
  "whenever `2` is invertible".
- Mathlib contracts (line 164): the `LieAlgebra.SpecialLinear.sl` and `Rep.ofDistribMulAction` rows
  are gone. One `Matrix.SpecialLinearGroup.toGL` row replaces them.
- AGR supplier row (line 256): adds §7.2, §7.9 and Layer 1. Layer 1 was already cited in §1.2 and
  listed in `plan.json`.
- §3.2 *Needs:* (line 587): adds AGR §§7.2 and 7.9.
- §3.5(b) (line 670): "via the trace form of ArithmeticGaloisRepresentations §7.2". Its *Needs:*
  (line 683) adds AGR §7.2.
- Layer 3 Dependencies (line 707): updated to match.

`plan.json` changes:
- Target 3.1:
  - `kind` is now `theorem`, and the name `sl2AdjointRep` → `sl2_adjoint_neg_one_trivial_invariants_eq_bot`.
  - `statement` and `hypotheses` follow the README.
  - `prerequisites`: AGR §7.2, AGR §7.9, `mathlib:Matrix.SpecialLinearGroup`,
    `mathlib:Matrix.SpecialLinearGroup.toGL`.
  - `api` is empty, as for every other theorem target. Its two surviving facts are in the statement.
  - Tests `adjoint_U_action` and `adjoint_char_two` are updated. The four tests remain.
- Target 3.2: the statement names the imported `ad⁰`. Prerequisites add AGR §§7.2 and 7.9.
- Target 3.5: prerequisites add AGR §7.2.
- AGR supplier entry: adds §7.2 and §7.9, and its `what` is updated.
- Totals: 28 targets (3 definitions), 91 tests, 1 gap.

No other target or roadmap uses `sl2AdjointRep`. A grep of `plan.json` and the README found no
other use, and the review says the same.

## Adversarial pass on the changed statements

Values come from a brute-force search over `SL₂(𝔽_p)` for `p = 2, 3, 5, 7` (pure Python, run in the
job's scratch directory) and from hand computation.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 3.1 `−1` acts trivially | `p = 2, 3, 5, 7`, all of `ad⁰` | `(−1)X(−1)⁻¹ = X` for every trace-zero `X`; for `p = 2`, `−1 = 1` | holds in every characteristic | — |
| 3.1 invariants vanish, `2 ∈ k^×` | `X = [[a,b],[c,−a]]` | `UX − XU = [[c,−2a],[0,−c]]`, `UᵀX − XUᵀ = [[−b,0],[2a,b]]`; joint fixed space `{0}` for `p = 3, 5, 7`; `SL₂(𝔽_p)` invariants `{0}` (orders `24, 120, 336`) | holds | hypothesis "odd characteristic" → `2 ∈ k^×` |
| 3.1 boundary, characteristic two | `p = 2`, `SL₂(𝔽₂)` of order 6 | invariants `{0, 1} = 𝔽₂·1`; `U`-fixed space has 4 elements (`k e ⊕ k·1`); `tr 1 = 2 = 0` | the hypothesis is needed; new Check 3 | Check 3 rewritten |
| 3.1 `U` alone | `p = 3, 5, 7` | `U`-fixed space has `p` elements, the line `k e` | the transpose is needed | added to Check 1 |
| 3.1 Check 1, action of `U` | `𝔽₅`, `e, h, f` | `Ad(U)h = [[1,3],[0,4]] = h − 2e`; `Ad(U)f = [[1,4],[1,4]] = f + h − e`; `Uf = [[1,0],[1,0]]`, trace 1 | conjugation is not left multiplication | — |
| 3.1 Check 2, `diag(2,3)` | `𝔽₅` | `e ↦ 4e`, `h ↦ h`, `f ↦ 4f`; `det = 6 = 1` | correct | — |
| 3.1 Check 4, nilpotence | `𝔽₅` | `(D−1)²f = 3e = −2e ≠ 0`; `(D−1)³f = 0`; `Ad(U)⁵ = Ad(U⁵) = 1` | correct | — |
| Trace form (Conventions, §7.2 import) | basis `e, h, f` over `ℤ` | Gram `[[0,0,1],[0,2,0],[1,0,0]]`, det `−2`; `tr(X·1) = tr X = 0` puts `ad⁰` in the orthogonal of `k·1`; with `2 ∈ k^×`, `M₂ = k·1 ⊕ ad⁰` is an orthogonal sum of a perfect pairing, so it is perfect on `ad⁰` | the self-duality used in §3.5(b) follows from AGR §7.2 | §3.5 *Needs* adds AGR §7.2 |
| Identification of the carrier | AGR `Suggested.lean`: `adZeroRep (r : G →* GL n k)` | carrier `LinearMap.ker (LinearMap.trace k (n → k))`, action `g X g⁻¹` through `Representation.linHom`; `G` is any group and `k` any field | the identification for arbitrary `k` is §7.9; §7.2 needs `Γ` profinite, which holds for finite `k` | carrier corrected from the review's `sl` |
| Base change (used in §3.2 over `k ⊇ 𝔽₅`) | `Γ = SL₂(𝔽₅)`, finite | the tautological representation over `k'` restricted to `SL₂(𝔽₅)` is the base change of the one over `𝔽₅`; AGR §7.2 base change and §7.7 coefficient change apply to the finite group | consistent | — |
| 3.2 unchanged statement on the imported object | `𝔽₅` | `(D−1)ad⁰ = span(e, h)` (`(D−1)h = −2e`, `(D−1)f = h − e`), so `H¹(⟨U⟩)` is spanned by `[f]` | unchanged | *Needs* only |

## Checks run

- **Dependency check** (the command in the brief):

  ```
  candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
  depcheck: 237 roadmaps, 2358 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line. ArithmeticGaloisRepresentations is earlier in
  `merge-order/ORDER.txt` and was already a supplier.
- **Citation resolver** (`roadmaps resolve` on the README) gives the same three leads as before:
  - `LeHung26, §4.4` (line 355)
  - `OpenAI26, §9.4` (line 464)
  - `CaptainSude26, §4` (line 826)

  Each is a manifest source id followed by a section sign, so it is a source locator, not a roadmap
  citation. The resolver found every Lean name, including the new `ResidualImage.adZeroRep`.
- **Pinned declarations**, checked at the Mathlib pin:
  - `Matrix.SpecialLinearGroup.toGL` (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`:369,
    namespace `Matrix.SpecialLinearGroup`)
  - `LinearMap.trace` (`Mathlib/LinearAlgebra/Trace.lean`:75)
  - `Representation.linHom` (`Mathlib/RepresentationTheory/Basic.lean`:655)
- **Lean.** The design package has no `Suggested.lean`, and the README's Lean paragraph is unchanged.
  None of the three headlines (2.5, 6.2, 8.1) mentions §3.1, so no `#check` comparison applies.
- **Sources.** No new source. The only locator used is CaptainSude26 line 187, which is unchanged.
  No `needs-references.toml` was written.
- **Ownership.** I grepped the roadmaps on main and the open heads (`roadmaps grep`) for the trace-zero
  adjoint by object. Only ArithmeticGaloisRepresentations owns it, at §7.2 and §7.9.
  ArithmeticGaloisDuality cites it from there. The overlaps file lists no open pull request that
  changes this roadmap and no dropped or revision-only id.

## Notes for the maintainer

- The plan target 3.1 is renamed (`sl2AdjointRep` → `sl2_adjoint_neg_one_trivial_invariants_eq_bot`)
  and is now a theorem. No roadmap cites the old name, and the section number §3.1 is kept.
- This roadmap now relies on ArithmeticGaloisRepresentations §§7.2 and 7.9 at the head of its open
  pull request. That roadmap is already a supplier through §§4.3, 6.3 and 7.7. If it renames
  `ResidualImage.adZeroRep` or renumbers §7.2 or §7.9, §3.1 and the Conventions bullet must follow.
