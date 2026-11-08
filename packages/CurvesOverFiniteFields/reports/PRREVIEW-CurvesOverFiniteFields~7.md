# Review of CurvesOverFiniteFields (pull request #1729 at ab3bbe0)

**Verdict:** accepted

Incremental re-review of the 12 lines of `TauCetiRoadmap/CurvesOverFiniteFields/README.md` changed since `24a1c2b` (the attribution of the two equality clauses of Serre's bound, 3.2, to the right instances of Serre's Theorem 4.10(b), with the `b_1` values of the two worked-example witnesses). `Suggested.lean` is unchanged. The head repairs the previous review's only finding, introduces no new problem, the gate passes, the dependency check reports no problem, no file outside the folder changes, and every value in the changed passage recomputes. No finding remains, new or carried.

## Previous findings

- R01 — repaired: lines 1114–1117 now read "the case `b_1 = −n·m/2`, which is Theorem 4.10(b) applied to `(−1)^n P(−T)`, as Serre remarks after the theorem; the lower equality … the case `b_1 = n·m/2` of Theorem 4.10(b) on `P` itself", with `b_1 = 3 − 5 = −2` and `b_1 = 3 − 1 = 2` for `1.2.c` and `1.2.ac`. Serre, *Lectures on N_X(p)*, Theorem 4.10 (cache `bdba7daa` lines 1641–1646) writes `P = x^n − b_1 x^{n−1} + ⋯` and makes (b) the case `b_1 = nm/2` with conclusion `α² − mα + q^w = 0`; lines 1653–1654 give the `b_1 = −nm/2` case by applying (b) to `(−1)^n P(−x)`; §4.7.2.2 lines 1740–1741 state the upper equality with `α² + mα + q = 0`. With `b_1 = q + 1 − N_1` (line 1111), the upper equality is `b_1 = −gm = −nm/2` and the lower is `b_1 = +nm/2`: exactly as the passage now says.
- R02 (of the review at `f56efad`, carried as repaired) — repaired: lines 41–43 ("imports nothing from the function-field side beyond FunctionFieldArithmetic §5.6's polynomial predicate `IsLPolynomialData`, consumed by 1.11") are unchanged by this diff; FunctionFieldArithmetic is at 353 in the merge order, this roadmap at 354.
- R03 (of the review at `f56efad`, the sibling's repair) — repaired on the sibling's side: AbelianVarietiesOverFiniteFields at head `34fabf0c` has no `### 1.0` heading any more, its line 103 says the Weil-polynomial invariants "are CurvesOverFiniteFields" Layer 1's, its supplier table (line 320) consumes this roadmap's Layer 1, and its `Suggested.lean` declares none of `IsWeilPolynomial`, `weilPower`, `pRank`. Lines 29–31, 61–64 and 88 here are unchanged, and the supply direction they state is the one the sibling now cites.

## Verified sound

### Gate, dependency check, outside-folder diff, elaboration

Gate run on this head (`--base origin/main`); the worker's run with the targeted build is in `scratch/gate.md` with `build=0`:

```text
gate CurvesOverFiniteFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check with the merge order and `--movable`:

```text
depcheck: 239 roadmaps, 2428 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line (CurvesOverFiniteFields at line 354, after FunctionFieldArithmetic at 353; AbelianVarietiesOverFiniteFields at 392). `git diff --stat origin/main...HEAD` outside the folder is empty; `git diff --stat 24a1c2b..HEAD` is the README alone (7 insertions, 5 deletions).

`Suggested.lean` is byte-identical to the file the previous two reviews read. Elaborated with `lake env lean` in 15 s: 22 `declaration uses 'sorry'` warnings, no other warning or error. The previous review's `#check @name` probe of all 36 declarations (types compared with the README, no lost section binder) and its padding probe (all 22 `sorry`s fail `first | rfl | simp | infer_instance | exact?`) stand, the file being unchanged; the worker's `scratch/signatures.md` for this head reports 0 lost binders.

### The changed passage

3.2, lines 1108–1120. Serre's Theorem 4.10 read at cache `bdba7daa` lines 1641–1654 (p. 46) and §4.7.2.2 at lines 1715–1743 (p. 48). The passage's four claims and their locators:

- `|b_1| ≤ nm/2` is 4.10(a), line 1644; the normalisation `P = x^n − b_1 x^{n−1} + ⋯` is line 1641, so `b_1` is the root sum, the trace `a` of line 1728, and `N_X(q) = q + 1 − a` (line 1727) gives `b_1 = q + 1 − N_1` as line 1111 states.
- The bound `|N_X(q) − q − 1| ≤ gm` is line 1737; the upper-equality clause `α² + mα + q = 0` is lines 1740–1741.
- "the case `b_1 = −n·m/2`, which is Theorem 4.10(b) applied to `(−1)^n P(−T)`, as Serre remarks after the theorem": lines 1653–1654 (the parenthetical remark following (c), before the proof). The roots of `(−1)^n P(−T)` are `−α`, its `b_1` is `−b_1 = nm/2`, and (b) gives `(−α)² − m(−α) + q = 0`, i.e. `α² + mα + q = 0`.
- "the case `b_1 = n·m/2` of Theorem 4.10(b) on `P` itself" with `α² − mα + q = 0`: lines 1645–1646 verbatim in content.

The two witnesses: `1.2.c` has `P = T² + 2T + 2`, `N_1 = 5`, `b_1 = 3 − 5 = −2 = −nm/2`; `1.2.ac` has `P = T² − 2T + 2`, `N_1 = 1`, `b_1 = 3 − 1 = 2 = nm/2` (worked examples at lines 1302–1320, unchanged, consistent). Parentheses of the long locator parenthetical balance (the double `))` at line 1120 closes "(and `b_1 = 3 − 1 = 2`)" and "(the bound …").

### Seeded sample

3.2 is the only sampled target the diff touches; it was inspected as above. The other sampled targets (1.1, 1.2, 1.5, 1.6, 1.7, 1.8, 2.2, 2.3, 2.4, 3.1, 3.4, 4.1, 4.2, 4.3) are untouched by the diff, and the full review's inspection of each carries forward (its seeded-sample table, confirmed again by the review at `24a1c2b`).

### Adversarial mathematics table

Rows for untouched statements carry forward from the previous review (same instances and values). The rows marked "this round" were recomputed now in a pure-Python script (roots by the quadratic formula, `b_1` as the root sum, `m = ⌊√(4q)⌋`, `n = 2g`, and the `b_1` of `(−1)^n P(−T)` as `−b_1`).

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 3.2 upper equality attribution (this round) | `1.2.c`: `T²+2T+2`, `q=2`; `1.3.d`: `T²+3T+3`, `q=3` | `m=2`, `b_1=−2`, `N_1=5`, `N_1−q−1=+2=gm`, `nm/2=2`, `max|α²+2α+2|=0.000`, `max|α²−2α+2|=5.657`, `b_1` of `P(−T)` `=+2=nm/2`; `m=3`, `b_1=−3`, `N_1=7`, `N_1−q−1=+3=gm`, `max|α²+3α+3|=0.000`, `b_1` of `P(−T)` `=+3` | upper equality is `b_1=−nm/2`, i.e. (b) on `(−1)^n P(−T)`: as the passage says | none |
| 3.2 lower equality attribution (this round) | `1.2.ac`: `T²−2T+2`; `1.3.ad`: `T²−3T+3`; `1.4.ae`: `T²−4T+4`, `q=4` | `b_1=+2=nm/2`, `N_1=1`, `N_1−q−1=−2=−gm`, `max|α²−2α+2|=0.000`, `max|α²+2α+2|=5.657`; `b_1=+3=nm/2`, `N_1=1`, `max|α²−3α+3|=0.000`, `max|α²+3α+3|=10.392`; `m=4`, `b_1=+4=nm/2`, `N_1=1`, `max|α²−4α+4|=0.000`, `max|α²+4α+4|=16.000` | lower equality is `b_1=+nm/2`, (b) on `P` itself: as the passage says | none |
| 3.2 non-equality control (this round) | `1.2.ab`: `T²−T+2` | `b_1=+1`, `N_1=2`, `N_1−q−1=−1`, neither `±2`; `max|α²+2α+2|=4.243`, `max|α²−2α+2|=1.414` | neither quadratic vanishes off the equality cases | none |
| 3.2 witnesses' `b_1` values (this round) | `1.2.c`, `1.2.ac` | `3−5=−2`, `3−1=+2`, matching the root sums `−2`, `+2` | the two parenthetical values are right | none |
| `1.2.ac`, `1.2.c` worked examples | as in the previous review | `L=1∓2T+2T²`, roots `1±i` / `−1±i`, `N_1=1` / `5`, `N_1−3=∓2` | unchanged by this diff, consistent with 3.2 | none |
| Layer 1 home clause | as in the previous review | FunctionFieldArithmetic §5.6 predicate on `(q, g, N, P)`, consumed at lines 940, 998 | unchanged | none |
| Convention 7, `IsWeilPolynomial` / `IsWeilSymmetric`; Convention 1 `hex` witness | as in the previous review | root moduli `1.41421`; `(T−1)(T−2)` false; `𝔽₄(t)` over `𝔽₂` has `genus=0`, `N_1=0`, `|0−3| ≤ 0` false | unchanged | none |
| 1.4 real Weil polynomial, spec, Weil iff real-rooted, `aroots_map_div` | as in the previous review | thirteen `h` values; `E₂`: `X²−2X+2`; `T²−4T+2` roots `3.414, 0.586` | unchanged | none |
| 1.5 `irreducible_real_root`, parity | as in the previous review | `T²−2`, `T∓2` at `q=4`; `(T²−2)E₂` has `P(0)=−4≠4` | unchanged | none |
| 1.6 `pRank`, ordinary iff, `IsSupersingular`, slopes, elevation | as in the previous review | ranks `2,1,0,1,3,0`; slopes `[0,1/2,1/2,1]`, `[0,1/3,2/3,1]`; elevations `0,1,1,0,1,2,4,6,9` | unchanged | none |
| 1.7 angles, `2·card = 2g+m`, rank zero iff supersingular | as in the previous review | thirteen angle lists; `α²/2=i` torsion for `E₂`; `2X²+3X+2` for `O₂` | unchanged | none |
| 1.8 CM theorem | as in the previous review | `ℚ(i)`, `ℚ(√−7)`, `ℚ(ζ₁₂)`; `T²−2` excluded by `hreal` | unchanged | none |
| 1.10 Weil powers, product sign, power sums, twists, Weil roots | as in the previous review | `T²+4`, `(T+4)²`, `(T+64)⁴`; `(T−2)(−T−2)=−(T²−4)`; `2,2,0,−4,−8`; `{T²−2}`, `{T²∓2T+2}`, `∅` | unchanged | none |
| 1.11 virtual counts, Hasse–Weil, Möbius sums, recovery | as in the previous review | `1.2.ab`: `2,8,14,16`; `(T²−2)²`: `64 ≤ 64`; `q=0` pair `T⁴`, `T⁴+T`; `q=1` pairs with all `A_r=0` | unchanged | none |
| 2.1–2.4 | as in the previous review | `T²−2T+2`, `P(0)=2`; `s=2,1,−3,−5`, `N₂=8` | unchanged | none |
| 3.1 cosine form, class-number bounds | as in the previous review | `3−2√2cos(π/4)=1`; `0.1716 ≤ 1 ≤ 5.828`; `h=1`, `g ≥ 1 ⟹ q ≤ 4` | unchanged | none |
| 3.2 bound table and proof route | as in the previous review | `(⌊HW⌋, Serre, ⌊Ihara⌋)` for eight `(q,g)`; `m+1∓x = 1, 5` | unchanged | none |
| 3.3 Ihara; 3.5 Hermitian instance | as in the previous review | `S²−gS=2 ≤ 6`; `q₀³+1 = 9, 28, 65, 126` | unchanged | none |
| 4.1 coordinate and supersingularity comparisons; 4.2 zeta; 4.3 dictionary | as in the previous review | cusp `q+1`, node `q`; `2 ∣ −2`, `3 ≤ 2` fails; `N_2/2=5/2`; `X²−(2/3)X+2` | unchanged | none |
| Lean binders | all 36 declarations | as in the previous review (file unchanged) | identical | none |

### Library declarations and cross-roadmap citations

Opened this round: Serre's lectures at cache `bdba7daa` (lines 1636–1660, 1712–1745); AbelianVarietiesOverFiniteFields at `34fabf0c` (README lines 103, 181, 190, 320, 528–557; `Suggested.lean` grepped for the three Layer 1 names: none); the merge order (353, 354, 392). The Lean file's four `TauCeti.*` imports and every name it uses elaborate at the branch pin (this round's `lake env lean`); the full review's list of pinned declarations (`genus`, `IsWeierstrassCoordinates`, `pointCount`, `frobeniusTrace`, `IsSupersingular`, `classNumber`, `Place.degree`, `IsFunctionField`, and the Mathlib names) is unchanged by this diff. Ownership against open work: the diff adds no object; the sibling's §1.0, the only second builder the full review found, is gone at the sibling's head. Overlaps file for this head: no open pull request changes this roadmap, no cited id is dropped, nothing cited is defined only by an open revision.

## Not verifiable

- **Stichtenoth 2009** Theorem 5.3.1, **Serre 1983** and **Ihara 1981**: as in the previous reviews, no legal full text; the README marks the locators uncertified and the statements were checked against Serre's lectures and by computation.
- Ownership against open pull requests whose files the brief did not supply was not checked beyond the full review's `roadmaps grep`.

## Source issues

- none
