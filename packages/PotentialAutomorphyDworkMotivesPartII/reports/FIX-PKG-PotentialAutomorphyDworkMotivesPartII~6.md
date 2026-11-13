# FIX-PKG-PotentialAutomorphyDworkMotivesPartII~6

Repair of the five findings of the package review, round 5 (one P1, one P2, three P3). All five were verified and applied. Files changed: `packages/PotentialAutomorphyDworkMotivesPartII/README.md`, `packages/PotentialAutomorphyDworkMotivesPartII/sources.toml` (new key `WATERHOUSE69`), and the top-level `gaps` list of `packages/PotentialAutomorphyDworkMotivesPartII/design/plan.json` (one new entry). `Suggested.lean` is unchanged: no finding touches a Lean statement.

## F01 (P2) — applied

Verified. The Fermat cubic over 𝔽₂₅ with ℓ = 5 is supersingular: `#X(𝔽₅) = 6` (trace 0), `#X(𝔽₂₅) = 36` (trace −10), and the coefficient of `(xyz)⁴` in `(x³+y³+z³)⁴` is 0. So its geometric `H¹` with ℚ₅ coefficients is 0, not 2. DMOS82 line 2312 (Proposition 7.10, p. 50) takes ℓ prime to the characteristic.

§2.1 old → new: "ℓ-adic over a characteristic-zero coefficient field" → geometric `H^{N−2}_ét(X_k̄, E)` for ℓ invertible in `k`; the integral étale rings now need their residue characteristics invertible in `k`; *Needs* gains EtaleCohomologyFoundations §F.3; the proof sketch names the smooth proper base change step; there is a new negative-control Check (𝔽₂₅, ℓ = 5 versus ℓ = 7). Pattern: the §2.7 proof now says that the fibre at `t = 0` lies over `ℤ[1/N, ζ_N][1/l]`. §§2.2, 2.3, 3.1, 6.1 and 6.8 already invert ℓ, so they are unchanged.

## F02 (P1) — applied

Verified. EllipticCurves Layer 3 on main (README lines 716–745) has the dichotomy and the trace criterion but no existence statement. No roadmap on main or earlier in the order states the existence of ordinary and supersingular curves over 𝔽_p. Fixed equations do not cover every p: at p = 11, j = 0 and j = 1728 are both supersingular.

New gap `gap:ordinary-and-supersingular-curves-over-prime-fields` on EllipticCurves Layer 3, with the same slug in the plan's `gaps` and in the README contracts. Its primary locator is Waterhouse, Theorem 4.1, p. 536 (WATERHOUSE69 lines 619–629). §9.7 gains the statement, a *Needs* entry, the gap line, the lifting proof and a Check (p = 11 and p = 13). §§9.11 and 9.12 cite the gap.

## F03 (P3) — applied

Verified. A two-element 𝔽₂-module has trivial automorphism group, while the square-root torsor has monodromy of order 2, so the old example was not a lisse sheaf of `ℤ/ℓᶜ`-modules.

§9.5 Check old → new: the "sheaf of square roots" became `π_*𝔽₂` for `z ↦ z²`. At `y = 1` the invariants have dimension 2. Every `y′ ∈ 1 + 5ℤ₅` is a square by Hensel's lemma. At `y′ = 2` the action is `[[0,1],[1,0]]` and the invariants have dimension 1. The torsor is now stated as a non-instance. I found no other place that uses a torsor as a module.

## F04 (P3) — applied

Verified: QIAN23 lines 673–681 contain the argument, and Lemma 3.6 starts at line 682. The paper has no Definition 3.6.

§0.4 and §4.7 old → new: "Qian, after Definition 3.6, arXiv v1 p. 15" → "Qian, the paragraph preceding Lemma 3.6, arXiv v1 p. 15". Those were the only two README occurrences. `design/plan.json` repeats the old locator in two node `locator` fields (lines 865 and 3310). This job may edit only that file's `gaps` list, so they are unchanged.

## F05 (P3) — applied

Verified. At the pin, `TauCeti/AlgebraicGeometry/FiniteEtale/Basic.lean:66` defines `TauCeti.FiniteEtaleScheme`, inside `namespace TauCeti` (line 41). EtaleCohomologyFoundations (main, README lines 202–206) builds §F.0.2 on this carrier.

Old → new: "the finite étale carrier … is that roadmap's own" became "on Tau Ceti's carrier `TauCeti.FiniteEtaleScheme`". The geometric fibre functor, `π₁` and the monodromy equivalence remain §F.0.2's, consumed through the two declarations. The From Tau Ceti contract gains a carrier bullet. Suggested.lean is unchanged.

## Checks

- **Elaboration.** `lake env lean packages/PotentialAutomorphyDworkMotivesPartII/Suggested.lean`, run from the content checkout, exited 0. The only warnings were five `declaration uses 'sorry'` lines, at lines 93, 112, 132, 151 and 186. The file imports only `Mathlib`, so no Tau Ceti build was needed.
- **Signatures.** I made a scratch copy of the file with `#check @name` for all ten declarations (`qianIndexSet`, `selfDualIndexSet`, `ZeroShapedDatum`, `ZeroShapedDatum.indexSet`, the four hypergeometric-group theorems, `qianGauss`, `zeroShaped_gauss_product`) and elaborated it once (exit 0). Each elaborated type matches its README statement. No binder was lost, and nothing changed, since the Lean file was not edited.
- **Dependency check** (`gate --depcheck … --movable`), run after the last edit, exit 0:

```text
depcheck: 206 roadmaps, 1914 edges, 0 problem(s)
```

  It printed no UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name missing everywhere. The five leads in the worker's citation file are all supplier or acceptance-file names: `VanishingCycles.finiteEtaleGaloisCategory` and `VanishingCycles.lisseMonodromyEquiv` are EtaleCohomologyFoundations §F.0.2 (main, lines 203 and 213). `VanishingCycles.etaleTraceFormulaFinite` is InverseGaloisAndArithmeticFundamentalGroups §IG.0.T2 (open head, line 533). `ZeroShapedDatum.indexSet` and the field `ZeroShapedDatum.injOn_nonzero` are declared in Suggested.lean (lines 82 and 79).
- **File validity.** `plan.json` parses as JSON and `sources.toml` parses as TOML.

## Gate failures

None were listed for this round.

## Adversarial pass (changed statements)

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §2.1, étale clause (ℓ invertible in `k`) | `k = 𝔽₂₅`, `N = 3`, ℓ = 5 and 7; `k = 𝔽₄`, ℓ = 2; `k ⊇ ℚ(ζ₃)`, ℓ = 3 | ℓ = 5: `#X(𝔽₅) = 6`, trace 0; `#X(𝔽₂₅) = 36`, trace −10; Hasse coefficient 0; `X[5](k̄) = 0`, so `H¹ = 0` against a predicted 2 (excluded now). ℓ = 7: 1 + 1 = 2. `𝔽₄`, ℓ = 2: `#X(𝔽₂) = 3`, trace 0, supersingular (excluded). Characteristic 0, ℓ = 3 ∣ N: dimension 2 over `ℚ₃(ζ₃)` (allowed) | Hypothesis added; negative-control Check added. |
| §2.1, `p ∣ N` boundary | `N = 3`, `k = 𝔽₉` | `x³ + y³ + z³ = (x + y + z)³`, a non-reduced hypersurface | Already excluded by "prime to `N`"; unchanged. |
| §2.1, integral étale clause | `O = ℤ[1/6, ζ₃]`; λ ∣ 5 and λ ∣ 7, over `k = 𝔽₂₅` | λ ∣ 5 is a prime of `O`, but `H¹(X_k̄, O_λ) = 0`, not rank 2 (excluded now); λ ∣ 7 gives rank-one summands, 1 + 1 = 2 | Residue characteristic must be invertible in `k`. |
| §2.1, rank count kept | `N = 5` | `(4⁵ − 4)/5 = 204` | Unchanged. |
| §2.7, rank of `V^ℚ_λ` at `t = 0` | Qian `N = 401`, `n = 3`, λ ∣ 401 and λ ∣ 2 | The base `ℤ[1/401, ζ][1/l]` inverts `l`; rank `#B = #{1, 2, 398} = 3` | §2.1 applies with ℓ = `l`; wording made explicit. |
| §9.5, general-form Check | `π_*𝔽₂` on `𝔾_m/ℚ₅`; `y = 1`, `y′ ∈ 1 + 5ℤ₅`, `y′ = 2` | Invariant dimensions 2, 2, 1; squares of `𝔽₅^×` are `{1, 4}`; Galois action `[[0,1],[1,0]]`; `#Aut` of a two-element 𝔽₂-module = 1, torsor monodromy order 2 | Correct carrier; the torsor is stated as a non-instance. |
| Gap: ordinary and supersingular curves over `𝔽_p` | p = 2, 3, 11, 13 | p = 2: `y² + y = x³` has 3 points, trace 0; `y² + xy = x³ + 1` has 4 points, trace −1. p = 3: `y² = x³ − x` has 4 points, trace 0; `y² = x³ + x² + 1` has 6 points, trace −2. p = 11: `x³ − x` and `x³ + 1` have 12 points each, trace 0; `x³ + x + 1` has 14, trace −2. p = 13: `x³ − x` has 8, trace 6; `x³ + 1` has 12, trace 2; `x³ + x + 4` has 14, trace 0. Waterhouse Thm 4.1 with q = p covers every β with β² ≤ 4p (conditions (1), (4) for p = 2, 3, and (5)) | True for every prime; no fixed equations suffice. |
| §9.7, lifting to `ℤ_p` | `y² = x³ + x + 4` over `ℤ₁₃` | `Δ = −6976 ≡ 5 (mod 13)`, so `v₁₃(Δ) = 0` and the reduction is the given supersingular curve | Unit discriminant gives good reduction of the stated type. |
| §9.7, consumers §§9.11–9.12 | m = 2, p > 2nm + 1 ≥ 5 | Σ^ord, Σ^ss and v ∣ r get curves of the required types; v ∣ p₀q uses `A` (§9.9) | Gap cited at both consumers. |
| F05 carrier statement | Identity `Spec ℚ → Spec ℚ` | Finite and étale, so an object of `TauCeti.FiniteEtaleScheme`; the carrier has no fibre functor field | Ownership corrected; §F.0.2 inputs unchanged. |
| F04 locator | QIAN23 lines 673–682 | Block argument at 673–681; Lemma 3.6 at 682 | Locator corrected at both sites. |

## Ownership and sources

- **Ownership of the existence theorem (F02).** I searched by object (Deuring, Waterhouse, Honda, trace-zero existence, supersingular existence) across main and the open heads.
  - EllipticCurves (main) does not state it.
  - AnticyclotomicLocalUnits (open) declares a wider gap on the same section, `gap:supersingular-trace-classes`, which includes trace-zero existence over every `𝔽_p` with p ≥ 5.
  - EndoscopicTransferAndUnitaryTraceComparison §8.3 (open, earlier in the order) states Honda–Tate in general, from which trace 0 and trace 1 classes of dimension 1 follow by the dimension formula.
  
  EllipticCurves, on main and the owner of the ordinary/supersingular notions, is the natural owner, so the gap names it rather than routing an elliptic-curve fact through endoscopy.
- **Source added.** `WATERHOUSE69` (Waterhouse, *Abelian varieties over finite fields*, 1969, Theorem 4.1, p. 536) was fetched from Numdam through the sources service, certified as open-repository, and its manifest entry completed with authors, title, venue and locator. The fetch also reordered the `cited_for` line of the existing `DICKSON01` entry, with no content change. No text was found missing, so `needs-references.toml` was not written.
- **Open pull requests.** Ownership against them was checked through the open-head index (`roadmaps grep` and `roadmaps show`).

## Notes for the maintainer

- **Overlapping gaps on EllipticCurves Layer 3.** The new `gap:ordinary-and-supersingular-curves-over-prime-fields` overlaps the trace-zero part of AnticyclotomicLocalUnits' `gap:supersingular-trace-classes`. One EllipticCurves target (Deuring–Waterhouse traces over `𝔽_p`) satisfies both.
- **Stale locators in `design/plan.json`.** The two node `locator` fields at lines 865 and 3310 still read "after Definition3.6". They are outside what this job may edit and should be corrected when the plan is next regenerated.
- **No names changed.** No name that other roadmaps cite changed, and no section was renumbered.
- **No suspicious instructions.** Nothing in the review or the fetched texts tried to give instructions.
