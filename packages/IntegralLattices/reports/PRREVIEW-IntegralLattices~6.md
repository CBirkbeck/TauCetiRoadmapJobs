# Review of IntegralLattices (pull request #1239 at 6cbd696)

**Verdict:** accepted

Incremental re-review of the 23 lines changed since b0defd8 (13 in the README, 10 in `Suggested.lean`, nothing outside the folder). The change repairs the single finding of the previous review, the basis named for `d16PlusGram`, and adds one README Check about that basis. No finding remains, new or carried.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/IntegralLattices/Suggested.lean:600–605` and `README.md:2077–2080` now name the basis `h, e₁ − e₂, …, e₁₄ − e₁₅, e₁₄ + e₁₅`, the `D₁₅` diagram with `e₁₄ + e₁₅` attached to `e₁₃ − e₁₄`, `(e₁₄ − e₁₅)·(e₁₄ + e₁₅) = 0`, `h·(e₁₄ + e₁₅) = 1`, `h` orthogonal to the chain. Recomputed exactly: the Gram matrix of those sixteen vectors equals the file's matrix in all 256 entries. The repair introduced no new problem (the new Check, `README.md:2095–2101`, is verified below), and no copy of the old description (`A₁₅`, `e₁₅ + e₁₆` as a basis vector) survives anywhere in the folder: the only remaining mention of `e₁₅ + e₁₆` is the negative control inside the new Check.

## Verified sound

**The changed passages.** `README.md:2074–2101` (6D statement and Checks) and `Suggested.lean:600–605` (the docstring of `d16PlusGram`); the matrix itself, `e8SumE8Gram`, `d16Plus_sameGenus_not_isometric_e8SumE8` and `gramIsometric_e8SumE8_sum_U_d16Plus_sum_U` are unchanged (their elaborated types in the worker's signature transcript are the closed statements on `Fin 16` and `Fin 18` checked last round; the only effect of the change on the file is a two-line shift of every `sorry` warning after line 600). `README.md:2152` (6H) cites `d16PlusGram` only as a block of the rank-18 matrices and is unaffected. The new Check names no Lean counterpart, uses Unicode with ASCII in code spans, contains no process word, and its negative control (the `A₁₅` chain) is a plausible wrong model that the determinant excludes, as the house style asks.

**Gate and build.** The gate on this head, run by me: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate on the same head adds `build=0`. `lake env lean` on `TauCetiRoadmap/IntegralLattices/Suggested.lean`: exit 0, 29 warnings, all `declaration uses 'sorry'` (lines 107, 207, 224, 267, 279, 324, 338, 353, 371, 393, 439, 446, 467, 480, 518, 532, 549, 566, 573, 582, 591, 635, 645, 656, 677, 692, 765, 790, 828), nothing else. `git diff --stat origin/main...HEAD` outside the folder: empty. Dependency check:

```text
depcheck: 228 roadmaps, 2152 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The `*Needs:*` line of 6D (2C, 3F, 5A, 6B) is unchanged and internal.

**Signatures.** The worker's transcript of the 64 declarations reports none with a lost binder; `d16PlusGram : Matrix (Fin 16) (Fin 16) ℤ` and `e8SumE8Gram : Matrix (Fin 16) (Fin 16) ℤ` are closed definitions with real bodies, and the 6D theorem's elaborated type is the five-clause conjunction the README states (even diagonal, `det = 1`, positive definite, `GramSameGenus`, `¬ GramIsometric`). Nothing in the change alters a type, so the `#check` comparison of the previous review stands.

**Headlines and padding.** Unchanged since b0defd8: the headline list and the padding probe (every admitted declaration survives `first | rfl | (simp; done) | infer_instance | decide | (norm_num; done)`) are those of the previous report and were not rerun, since no declaration's statement changed.

**Library declarations opened at the pins.** None newly needed by the change; the matrix is written out explicitly and the 6D statement uses `Matrix.det`, `Matrix.toQuadraticForm'` and `CartanMatrix.E 8` (`Mathlib/LinearAlgebra/Matrix/Cartan/Basic.lean:55`, opened last round) as before.

**Cross-roadmap citations.** The change adds none; the worker's resolver reports no cross-roadmap citation found nowhere, and its 15 Lean-name leads are all this roadmap's own declarations, each present in `Suggested.lean`. Ownership against the open pull requests for `d16Plus`, `D₁₆⁺` and `e8SumE8Gram` was searched by object last round (only ThetaSeries, which consumes this roadmap's 6D); the change adds no object.

**Seeded sample (B1–B8).** None of the eight targets lies in the changed lines; their rows below carry the values computed in the previous report (b0defd8). Cox and Cohen remain uncertified in the manifest and Conway–Sloane waived, so the sample is checked by computation, as before.

**Adversarial pass.** Exact rational arithmetic for the changed statement; the untouched rows cite the previous report.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 6D `d16PlusGram` basis description (changed) | the basis `h, e₁ − e₂, …, e₁₄ − e₁₅, e₁₄ + e₁₅`, `h = (½, …, ½)` | its Gram matrix equals the file's matrix in all 256 entries; `h·(e₁₃ − e₁₄) = 0`, `h·(e₁₄ − e₁₅) = 0`, `h·(e₁₄ + e₁₅) = 1`; symmetric, every diagonal entry even; leading principal minors `4, 8, 12, …, 60, 1`; the `D₁₅` block (rows and columns 2–16) has determinant `4` and `4·(4 − 15/4) = 1`; all sixteen vectors lie in `D₁₆⁺` (coordinate sums `0`, `2` and `8`), so a determinant-1 sublattice of the determinant-1 lattice is the whole lattice | pass |
| 6D new Check, negative control (changed) | the chain `e₁ − e₂, …, e₁₄ − e₁₅, e₁₅ + e₁₆` with `h` | chain Gram determinant `16`; with `h`, `16·(4 − 15/16) = 49 = 7²`, index 7; this Gram matrix differs from the file's matrix in exactly the four entries `(14,16), (16,14)` (`0` vs `−1`) and `(15,16), (16,15)` (`−1` vs `0`), so the sentence "a Gram matrix with the `−1` at `(e₁₄ − e₁₅)·(e₁₅ + e₁₆)` would not be unimodular" is exact | pass |
| 6D genus and non-isometry (unchanged) | `E₈²` vs `D₁₆⁺` | as in the previous report: both even, det 1, signature `(16,0)`, `U⁸` over `ℤ₂`, same genus; root spans of index `1` and `2` | pass (previous report) |
| 6H (unchanged) | `E₈² ⊕ U` vs `D₁₆⁺ ⊕ U` | rank 18, det `−1`, signature `(17,1)`, indefinite even unimodular: isometric by 6A | pass (previous report) |
| 7C odd value, 7C ranges, 5A, 4F, N1, 7E values, 7E junk value, 7E metric, 5B Checks, 4G, 1H/1I, `GramSameGenus`/`IsGenusMass` at `n = 0` (unchanged) | as listed in the previous report | the sixteen 7C counts (`4, 12; 8, 24, 8; 4, 12; 2, 2, 2; 2, 2; 48, 48; 12, 12`), `Icc 1 0 = ∅`, the `(16,0,0)` invariants, `ℤ[√2]ˣ`, `sphereArea 0 = 0`, `1, 1, 2π, 8π²`, Gauss sums `1 + i` and `−i√3`, index `1 ≠ p`, signs `6`, `2` | pass (previous report) |
| B1–B8 (unchanged, seeded sample) | `A₂`, `U`, `⟨1,−2⟩`, `!![4,1;1,6]`; `Δ = 12, −3`; `m = 5, 8, 1`; `Δ = −4, 12, 1`; `Δ = −3, −23` | `(c, Δ) = (2,−3), (2,1), (1,8), (2,−23)`; `h(−3) = 1`, `√3·𝒪₁₂` the nontrivial narrow class; genera `{1,4}`, `{2,3}`; automorphism orders `2, 4, 12, 8, 4`; reduced-form counts `1, 1, 3, 3`; `T_L(ℤ)` of order `4`, infinite, `{±1}`; measures `π/2`, `log(2 + √3)`, `1`; masses `1/12`, `3/4` | pass (previous report) |

## Not verifiable

- Serre, *A Course in Arithmetic* V.1.4.3 (the `Γ₁₆` construction cited by the changed docstring): the cache holds only a whole-book scan from a course page, which is not a publisher or author copy; the construction was verified by the determinant and root-span computation above instead.
- The items listed under this heading in the previous report (O'Meara, Cassels, Cohen, Milnor–Husemoller, Wall, Gan–Yu, SPLAG, Ebeling, Kitaoka, Kneser, Cox, Kawauchi–Kojima) are unchanged and untouched by this change.

## Source issues

- none
