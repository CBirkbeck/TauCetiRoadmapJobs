# FIX-PKG-InverseGaloisAndArithmeticFundamentalGroupsPartII~4

Repair round for the review `REV-PKG-InverseGaloisAndArithmeticFundamentalGroupsPartII~3`, which
has three findings (F01–F03). Files changed:
`packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md` and
`packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/Suggested.lean` (the body of `shiftHom`,
the proof of `shiftHom_sigma` and two docstrings). `metadata.toml`, `sources.toml` and
`design/plan.json` are unchanged: no gap was added or removed. The ownership question with
ArithmeticStatisticsPartVIII §5.16 from earlier rounds was not re-raised by the review and is not
touched here.

## REV-PKG-InverseGaloisAndArithmeticFundamentalGroupsPartII~3/F01 (P2) — applied

Verified at the pinned Tau Ceti (`2fd255d`):
`TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean` line 494 defines
`natAdd (n : ℕ) {m : ℕ} : BraidGroup (m + 1) →* BraidGroup (n + m + 1)` by `lift` on
`σ_i ↦ σ_(Fin.natAdd n i)`, and line 499 proves `natAdd_sigma`. This is the block inclusion that
`shiftHom` rebuilt with `lift` for every `n ≥ 1`. Nothing about its injectivity or image is pinned.

Change in Suggested.lean: the `lift` construction becomes the all-`n` adapter
`| 0 => 1 | _ + 1 => natAdd m`. `shiftHom_sigma` is now proved by cases, with `Fin.elim0` and
`natAdd_sigma`. The docstrings of `shiftHom` and of the module now say what is Tau Ceti's.

The review's adapter used `rw [Nat.add_succ]` inside the definition. That is not needed and was not
used: `natAdd m : BraidGroup (n+1) →* BraidGroup (m+n+1)` is accepted at the type
`BraidGroup (n+1) →* BraidGroup (m+(n+1))` by definitional unfolding. So no cast enters the
definition, and `shiftHom 2 (n+1) = natAdd 2` holds by `rfl` (tested).

README changes:
- Scope and ownership: the owned item now reads "the gluing maps along the block inclusion of
  braid groups (extended to the trivial group `B_0`)", and the Tau Ceti item adds `natAdd`,
  `natAdd_sigma`.
- From Tau Ceti: a new bullet states `natAdd`'s contract and that it is defined only for at least
  one strand.
- §0.4: the inclusion is attributed to Tau Ceti, and `shiftHom` is defined as its extension to
  `n = 0`.
- §0.4 *Needs*: `lift` becomes `natAdd`, `natAdd_sigma`.
- §0.4 Checks: the `m = 1` Check now gives native indices and the contrast with the inclusion that
  keeps the index. A new `n = 0` Check covers the case Tau Ceti does not.
- §2.3: the shifted inclusion `B_(n−q−1) → B_n` is attributed to `TauCeti.BraidGroup.natAdd (q + 1)`
  for `q ≤ n − 2`, and to the trivial homomorphism for `q = n − 1`. Its *Needs* line now lists
  `natAdd` and `natAdd_sigma`. Injectivity and the image `L_(n,q)` stay targets here, because they
  are not pinned.

## REV-PKG-InverseGaloisAndArithmeticFundamentalGroupsPartII~3/F02 (P3) — applied

Verified by computation. Classical `σ_1` acts at positions 0 and 1 by `(a, b) ↦ (a b a⁻¹, a)`, and
its inverse by `(a, b) ↦ (b, b⁻¹ a b)`. On `((12), (23))` they give `((13), (12))` and
`((23), (13))`. The old Check said the positive move only inverts the suffix conjugation, so it
predicted `((23); (13))`, the same as the correct face because `(23)` is an involution. It
therefore described the wrong tuple and distinguished nothing.

§3.3 Check, old → new: "gives the conjugation `g_i^((g_(i+1) ⋯ g_q)⁻¹)`" becomes the two explicit
faces `((23); (13), x)` for `σ_1⁻¹` and `((13); (12), x)` for `σ_1`. It is followed by the general
form: for `i < q`, `s_(q,i)` puts `(g_i ⋯ g_(q−1)) g_q (g_i ⋯ g_(q−1))⁻¹` in position `i` and
prefixes `g_(q−1)` unconjugated. The main row statement of §3.3 and the A₄ Check of §1.11 are
unchanged.

## REV-PKG-InverseGaloisAndArithmeticFundamentalGroupsPartII~3/F03 (P3) — applied

Verified. In §4.4, `X` is the total space `Hur_n` or `CHur_n`, so `k[X]` is the permutation module
on the points of a space. For `G = 1`, `n = 1` that module has uncountable dimension, while
`H_0(Conf_1; k) = k`.

§4.4 proof sketch, old → new: `H_p(B_n; k[X/G]) ≅ H_p(B_n; k[X])_G` becomes
`H_p(B_n; k[F/G]) ≅ H_p(B_n; k[F])_G`. Here `F` is the fibre over the base configuration
(`HurwitzFibre c full n`), `F/G` is `UnmarkedFibre c full n`, and `k[F]_G = k[F/G]`. Exact
coinvariants commute with `H_p(B_n; −)`, and §0.5 identifies the two sides with `H_p(X/G; k)` and
`H_p(X; k)_G`. *Needs* gains §0.3.

A new Check covers `G = 1`, `n = 1` (fibre against total space), and `S₃`, `n = 2` with
dimensions 5, 2, 2.

## Pattern search

- Block inclusion: `grep` for `shiftHom`, `natAdd`, `block inclusion`, `shifted inclusion` and
  `strandIncl` over README and Suggested.lean. Every construction of a strand-shifting braid
  homomorphism is either §0.4 or §2.3, and both are now attributed. The other uses of `shiftHom` are
  §0.7 (`markedStabilizer`, `unmarkedStabilizer`), §3.1, §4.5 and the Lean consumers `glue_smul`,
  `glueRepHom`, `markedStabilizer`, `unmarkedGlueSum_smul`, `unmarkedStabilizer` and
  `hurwitz_homological_stability`. They use only its type and `shiftHom_sigma`, and both are
  unchanged.
- Positive versus inverse face braid: `grep` for `inverse` and `s_(q,i)`. Only §3.3 compares the two
  braids on tuples. §2.4 and §2.5 compare left and right multiplication of cosets, which is a
  different convention and is correct.
- Total space versus fibre as coefficient basis: `grep` for `k[X`, `X/G`, `X//G` and `H_p(X`. In
  §0.5, lines on `k[X]` take `X` to be a `B_n`-set, and the Suggested.lean module docstring says
  "fibre `X`". Only §4.4 used a total space, and it is the line repaired.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| `shiftHom` (new body) | `n = 0`; `m = 1, n = 2`; `n + 1`; `m = 0` | `shiftHom 5 0 b = 1` by `rfl` (B_0 trivial). `shiftHom 1 2 σ_0 = σ_1` in B_3 (Lean `rw [shiftHom_sigma]; rfl`). `shiftHom 2 (n+1) = natAdd 2` by `rfl`. `m = 0`: `σ_i ↦ σ_(0+i)`. | Correct. The wrong model "keep the index" (`strandIncl`/`castAdd`) gives `σ_0 ↦ σ_0` and is excluded by `shiftHom_sigma`. The trivial hom for all `n` is excluded because `σ_m` maps to a transposition under `permHom`, so it is `≠ 1`. |
| `shiftHom_sigma` | `n = 0, 1` (index type `Fin 0`, as `0 − 1 = 1 − 1 = 0`); `n = 3, m = 2, i = 1` | Vacuous at `n = 0, 1`; at `n = 3`: `σ_1 ↦ σ_3` in B_5, `Fin.natAdd 2 1 = 3` | Elaborates. Statement unchanged. |
| `hurwitzAction_shift` (proof re-checked) | `m = 1, n = 2, t = (g), s = (a, b)`, braid `σ_0` | LHS: `σ_1` on `(g, a, b)` = `(g, a b a⁻¹, a)`; RHS: `(g) ++ (a b a⁻¹, a)` | Equal. Elaborates unchanged. |
| §2.3 shifted inclusion attribution | `n = 3, q = 0`; `n = 2, q = 0`; `q = n − 1` | `natAdd 1` on B_2: native `σ_0 ↦ σ_1` (classical σ_2), image `⟨σ_2⟩ = L_(3,0)`. `n = 2`: `natAdd 1` on trivial B_1, image trivial = `L_(2,0)` (empty range 1..0). `q = n − 1`: B_0 → B_n trivial = `L_(n,n−1)`. | Consistent with the Checks and Examples of Layer 2. |
| §3.3 positive-face Check | `q = 1, i = 0`, `((12),(23))`; `q = 2, i = 0, 1` symbolic | `σ_1⁻¹`: `((23);(13))`; `σ_1`: `((13);(12))`. `q = 2, i = 0`: `σ_1σ_2` gives `(g_0g_1 g_2 (g_0g_1)⁻¹, g_0, g_1)` against the correct `(g_1, g_2, g_0^(g_1 g_2))`. `q = 2, i = 1`: `σ_2` gives `(g_0, g_1 g_2 g_1⁻¹, g_1)`. | General formula verified on all three. |
| §4.4 braid-group form | `G = 1, n = 1`; `S₃` transpositions `n = 2`; `G = C₂` | Fibre: `H_0(B_1; k[pt]) = k`; total-space basis uncountable. `S₃`: `H_0(B_2; k[c²])` dim 5 (orbits 1,1,1,3,3), conjugation swaps the two size-3 orbits (products `(123)`, `(132)`) and permutes the constants, so coinvariants dim 2. `k[c²/G]` has 2 points with trivial `B_2`-action, dim 2. `C₂`: conjugation trivial, `F/G = F`. | Correct. Also, `k[F]_G = k[F/G]` holds for any permutation module; invertibility of `|G|` is used only for exactness. |

## Checks

- Elaboration: `lake env lean packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/Suggested.lean`,
  run from the content checkout, gave exit 0. The only warnings are the two expected
  `declaration uses 'sorry'` warnings, at `hurwitz_homological_stability` (line 506) and
  `uniform_betti_bound` (line 523). The imported `TauCeti.GroupTheory.SpecificGroups.Braid.Basic`
  object file was present, so no module build was needed.
- Signatures: I put a scratch copy with `#check @name` for all 40 declarations, plus four test
  `example`s for `shiftHom`, in one scratch file. It elaborated with exit 0 and the same two
  warnings, and no errors. Every elaborated type is unchanged from the previous signature list. In
  particular, `shiftHom : (m n : ℕ) → BraidGroup n →* BraidGroup (m + n)` and the `shiftHom_sigma`
  statement are identical. No section binder is lost.
- Dependency direction:

  ```text
  depcheck: 236 roadmaps, 2135 edges, 0 problem(s)
  ```

  There are no UPWARD, CYCLE or moved lines.
- Citations: `roadmaps resolve` on the README lists no cross-roadmap citations found nowhere, and
  no Lean names found nowhere. The previous `HurwitzFibre.smul_tuple` lead no longer appears; that
  declaration is at Suggested.lean line 309.
- Ownership: the only ownership change is that the block inclusion is now cited from Tau Ceti at
  the pin. No object moved between roadmaps, and no open pull request was consulted for these
  three findings beyond the supplied overlap report, which lists no conflicting heads or dropped
  ids.
- Sources: no new source was cited, so no fetch was made and nothing was added to
  `needs-references.toml`.

## For the maintainer

- `shiftHom` keeps its name and type, so no other roadmap is affected. It is now definitionally
  `TauCeti.BraidGroup.natAdd m` on braid groups with at least one strand.
- No gate failures were listed for this round.
