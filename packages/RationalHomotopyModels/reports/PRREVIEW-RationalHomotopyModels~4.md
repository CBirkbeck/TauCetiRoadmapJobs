# Review of RationalHomotopyModels (pull request #2298 at dffc64c)

**Verdict:** needs changes

## R01 (P2) — The narrowed characteristic convention leaves Layer 1's structure theorems without a hypothesis they need

**Location:** `TauCetiRoadmap/RationalHomotopyModels/README.md:103–104`: “The universal property of 1.1 and every theorem of Layers 2–7 assume `[CharZero K]`”. Now unscoped: 1.1 “Then `A ≅ ΛV`” (257) and Restriction (275); 1.2 “`Q(A) … ≅ V`” (301), Sullivan inclusions (307), Indecomposables (315).

**Claim:** Neither the `CharZero` list nor the arbitrary-field list covers these statements, so they now read as holding over any field. `IsFreeGradedCommutative` has no odd-squares-zero field, and over `𝔽₂` all five fail.

**Witness:** `K = 𝔽₂`, `A = 𝔽₂[u]`, generators `u` (degree 1) `< u²` (degree 2), `d = 0`: `IsSullivanAlgebra` holds (`u^a (u²)^b`, `a ≤ 1`, are the powers of `u`). Yet `u² ≠ 0`, `Q(A) = (u)/(u²)` is one-dimensional, and `𝔽₂[u]` is not free on `u`.

**Repair:** Replace lines 103–108 by: “`K` is a field. The identification `A ≅ ΛV`, the universal property and the restriction and product statements of 1.1, the API of 1.2, and every theorem of Layers 2–7 assume `[CharZero K]`. The definitions of Layer 1 and 7.1 and the criteria of 1.2 and 1.3 are stated over an arbitrary field, and the criteria hold there: each one reduces a statement about a derivation, or about two `φ`-derivations, to the generators. Spaces use `K = ℚ` unless `K` is named. Witness: over `𝔽₂` the algebra `𝔽₂[e]`, `|e| = 1`, is graded-commutative (all signs are `+1`) with `e² ≠ 0`. So graded commutativity alone does not make odd squares zero, and on the generators `e`, `e²` this algebra satisfies the definition of 1.1 without being `ΛV`. Over `ℚ`, `e² = −e²` gives `e² = 0`.” An alternative repair adds `∀ i, Odd (deg i) → x i * x i = 0` to `IsFreeGradedCommutative` in both 1.1 and `Suggested.lean`. That excludes `𝔽₂[e]` on `e`, `e²`, and the Layer 1 API then holds over every field.

## Previous findings

- R01 — repaired: lines 205–206: “Layer 8: Massey products and their comparison with the transferred operations (7.4).” In 7.4: “*Needs:* 7.1, 7.3; DGAInfinity Layer 3 (formality as a DG algebra) and Layer 8 (Massey products); …”.
- R02 — repaired: lines 103–106: “the definitions of Layer 1 and 7.1 and the two criteria of 1.2 and 1.3 are stated over an arbitrary field”. This now agrees with the Lean signatures, but the narrowed `CharZero` scope introduced R01.

## Verified sound

| Statement | Instances | One side | Other side | Result; change |
|---|---|---|---|---|
| Ground-field convention against `Suggested.lean` | the 20 elaborated `#check @` types | `CharZero K` in `existsUnique_algHom` and in all 10 theorems of Layers 2–7 | no `CharZero` in `isMinimal_iff`, `exists_dgAlgHom_iff` or the 7 definitions | Lists match Lean; R01 concerns the README facts that neither list covers |
| 1.1 `IsFreeGradedCommutative`, characteristic 2 | `𝔽₂[u]` on `u < u²`; `ℚ[u]` on `u < u²` | `𝔽₂`: basis `u^a (u²)^b`, signs `+1`, so every field holds | `ℚ`: `u·u = −u·u` forces `u² = 0`, contradicting the basis | Not `ΛV` in characteristic 2; R01 |
| 1.1 `existsUnique_algHom`, characteristic 2 | `Λ(e₁) → 𝔽₂[s]`, `|s| = 1`, `e ↦ s` | `𝔽₂[s]` is graded-commutative, all signs `+1` | `e² = 0` but `s² ≠ 0`, so no algebra map | `CharZero` needed, as the convention says |
| 1.2 `isMinimal_iff` over `𝔽₂` | `𝔽₂[u]`, generators `v = u² < u`, `du = u²` | `d(u) = u² ∈ A⁺·A⁺`, `d(v) = 0`: minimal | `d(u^(2b+1)) = u^(2b+2) ∈ A⁺·A⁺`, so `d(A⁺) ⊆ A⁺·A⁺` | Both sides hold; the criterion does not depend on the characteristic |
| 1.2 Indecomposables, `𝔽₂` | the same algebra | 2 generators | `Q(A) = (u)/(u²)`, dimension 1 | Basis claim fails; R01 |
| 1.3 `exists_dgAlgHom_iff` over `𝔽₂` | `𝔽₂[u]`, `du = u²`, into `𝔽₂[s]` (`dB = 0`, `u ↦ s`) and into `𝔽₂` (`u ↦ 0`) | `dB(φ u) = 0`; `0` | `φ(du) = s² ≠ 0`; `0` | First map not DG, second DG: both sides agree |
| 7.1 `IsFormal` over any field | `d = 0` algebra over `𝔽₂`; the Heisenberg algebra over `ℚ` | `M = A`, both maps the identity | `[xz] ≠ 0` while `x·H¹ = 0` | Definition does not use `CharZero`; accepts the first, rejects the second |
| 7.4 Massey products, DGAInfinity Layer 8 | Heisenberg `⟨x, y, y⟩`; `xy = dz`, `y² = 0` | defining system `z`, `0`, giving `±[zy] = ∓[yz] ≠ 0` | indeterminacy `x·H¹ + H¹·y = 0` | A nonvanishing Massey product on a non-formal model; Layer 8 states the comparison with `m₃` |
| 7.4 formality, DGAInfinity Layer 3 | main README 355–356; README 7.1 | `A∞` quasi-isomorphism to `(H, m₂)` | a formal commutative algebra is formal once commutativity is forgotten | Citation resolves |

The adversarial rows for untouched statements stand as in the previous review, of `4280e56`.

- Gate, run at this head: every check is 0 except `depcheck: NOT IN ORDER: RationalHomotopyModels`. That is the design-stage placement, which is not a finding. The worker's gate at this head: every check 0, build OK.
- Dependency check with the candidate order: `depcheck: 242 roadmaps, 2196 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- `lake env lean` on `Suggested.lean`: 13 `sorry` warnings and nothing else. The file is unchanged since `4280e56`.
- Signatures: all 20 elaborated types compared with the new convention. `CharZero` appears in 11 theorems and is absent from 2 theorems and the 7 definitions.
- Cross-roadmap citations resolved on main: 2, DGAInfinity Layer 3 (README 353–393) and Layer 8 (README 520–549, Massey products at 534–537).
- Source hypotheses on the characteristic: Morgan1978 lines 214–215 (`k` is `ℚ`, `ℝ` or `ℂ`), lines 1024–1029 (Definition 5.2), and Hess2007 line 243 (Definition 1.10) all work in characteristic zero. The arbitrary-field criteria rest on the derivation argument, rederived above.
- Ownership: a grep for Massey products over main and the open heads finds DGAInfinity (main) as the owner. ProfiniteCohomologyPartII treats Massey products in profinite group cohomology, which is a different object.
- Pull request text: the title and description agree with the head (DGAInfinity Layers 0, 1, 3, 4, 8; a field of characteristic zero; 13 headlines). There is no change outside the folder.

Overlap check: read EllAdicHomotopyTypesAndWeights, KanQuillen, SuperconnectionsAndMathaiQuillenForms, DeRhamCohomologyAndDuality, DGAInfinity and SymplecticFieldTheory. Sullivan algebras and polynomial forms belong to this roadmap (EllAdicHomotopyTypesAndWeights consumes them). `A∞` formality and Massey products belong to DGAInfinity, which is cited. Nothing else is shared.

Source independence: changed passages only; 3 passages compared (the convention, the DGAInfinity contract and the 7.4 `*Needs:*` line). None carries a source locator and none shares wording with a source. Largest share: Hess2007, 23 of about 80 locators, as before. Contents were not compared again because no layer was added, removed or reordered (independent at `4280e56`). FHT2001 and DGMS1975 could not be read.

## Not verifiable

- FHT2001 §3 (the 1.1 locator, whose characteristic hypothesis R01 concerns): settled uncertified, so it was checked by computation only.
- DGMS1975 §6, Main Theorem and Corollary 1 (7.4, the Massey statement): settled uncertified, not read.

## Source issues

- none

## For the human reviewers

- **Not tested.** FHT2001 and DGMS1975 are settled uncertified, and Quillen 1969 and Bousfield–Gugenheim 1976 have no open text. The wording and locators of Layers 5–7 were compared only with Hess2007, Morgan1978, Sullivan1977 and the Félix–Halperin survey.
- **Licence.** No public formalisation resembling `Suggested.lean` was found among the pinned libraries or the open roadmaps; nothing outside them was searched.
