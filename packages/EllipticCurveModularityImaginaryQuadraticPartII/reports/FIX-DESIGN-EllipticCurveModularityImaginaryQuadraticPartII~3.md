# FIX-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~3

One review (`REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~2`): two P3 findings, both
about numerical Checks. Both were correct about the defect. The replacement the review suggested
was itself wrong for the protected prepared datum, so the repairs differ from the suggested text
(details below). Files changed: `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md`
(§4.3, §5.1, §5.2, §5.4 Checks) and `design/plan.json` (the four matching tests). `sources.toml` is
unchanged.

## F01 (P3) — applied differently

The defect is real. Condition (ii) of §5.1 requires the residue field of `v̄` to be larger than `𝔽₅`
(CN23 line 4246; CaptainSude26 line 277). A five-adic place of `F⁺` with local degree one has residue
field `𝔽₅`, so the old third Check claimed (ii) at places where it fails. The README's own fourth
Check says this.

The suggested repair is not a valid instance either: unramified places with residue degrees
`(2, 2, 6)` or `(2⁵)` at `d = 10`. In a protected prepared datum, `μ₅ ⊂ F`. Five lies below `S₅`, so by
condition (i) it splits in an imaginary quadratic subfield of `F`. CN23 line 4239 draws the same
consequence: every place of `S` is split over `F⁺`. So `F⁺_v̄ = F_v ⊇ ℚ₅(ζ₅)`, and the ramification
index `e(v̄)` is divisible by four. With `f(v̄) ≥ 2`, every five-adic local degree of `F⁺` is a multiple
of four and at least eight. In particular, no five-adic place of `F⁺` is unramified.

Old → new (README §5.1 third Check; `plan.json` 5.1 `datum_degree_condition`): "`[F⁺:ℚ] = 8`, degrees
`(1,1,6)` / `(1⁸)`" → the constraint just described. At `[F⁺:ℚ] = 40`, with `(e,f) = (4,2), (4,2), (4,6)`,
(ii) holds at the two degree-8 places (`24 > 20`) and fails at the degree-24 place (`8 < 20`). Five
places with `(e,f) = (4,2)` satisfy (ii) everywhere (`24 > 20`). No `[F⁺:ℚ] < 40` satisfies (ii)
everywhere.

## F02 (P3) — applied differently

The defect is real. The three Checks evaluate the formulas at `d = 1`, but every statement they
illustrate assumes `μ₅ ⊂ F`, so `d ≥ 2`. The formulas themselves are right.

- §4.3, applied as suggested. Old → new: "`d = 1, t = 1, r = 3`" → "`F = ℚ(ζ₅)`, `d = 2`, `t = 1`,
  `r = 6` (the least `r` with `g ≥ 0`), `g = 0`, matching CrystallineLocalGlobalCompatibilityCM §9.3's
  `q − 3[F⁺:ℚ] − 1 + |S|` at `(6, 2, 1)`". The Check also notes that no `d = 1` field contains `μ₅`.
  §4.3 does not assume conditions (i) or (ii), so `ℚ(ζ₅)` is an admissible instance.
- §§5.2 and 5.4, applied differently. The suggested `d = 10` with ten five-adic places of local
  degree two is impossible by the argument under F01: local degrees of `F` above five are multiples
  of four and at least eight. Old → new: "`d = 1`, `dim R^loc_χ = 6`" and "`d = 1`, deficit one" →
  the smallest configuration of §5.1 (`d = 40`, ten five-adic places of `F` of local degree 8,
  `R = ∅`, `t = 10`). Then `dim R^loc_χ = 1 + 10·(3+8) = 111 = 1 + 3t + 2d`, the deficit is `40 = l₀`,
  and at `r = 111` we get `dim R_∞ = 111` and `dim S_∞ = 151`.
- `R = ∅` is allowed: CN23 line 4229 says "possibly empty".
- `plan.json`: `presentation_d1` was renamed `presentation_cyclotomic_five` and its statement updated.
  The statements of `problem_local_dim` and `lifting_deficit` were updated. The test count is
  unchanged.

**Pattern search.** I checked every other numerical Check and Example in Layers 4–8, in both the
README and `plan.json`, for the same defect. The second Check of §4.3 (`d = 2, t = 3, r = 10`) is a
valid instance: `d = 2` with `μ₅ ⊂ F` forces `F = ℚ(ζ₅)`. Its values `14, 6, 20, 22` were recomputed.
The `ℚ(ζ₅)` Checks of §§6.1, 7.5, 8.1 and the imaginary quadratic Check of §6.2 are deliberate
non-examples or are consistent with their statements. No other occurrence was found.

## Checks run

- **Dependency check** (command as in the brief):

  ```
  candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
  depcheck: 243 roadmaps, 2402 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line.
- **Citation resolver.** It reports the same three leads as before: `LeHung26, §4.4` (line 340),
  `OpenAI26, §9.4` (line 449) and `CaptainSude26, §4` (line 800). All three are source locators,
  not roadmap citations, so they are false positives. It finds no Lean names "found nowhere".
- `plan.json` parses as JSON. No LaTeX delimiters or machine paths were introduced.
- **`#check` comparison: not applicable.** The design plans no `Suggested.lean` declaration, and
  this round adds none.
- **Gate failures:** none were listed for this round.
- **Cross-roadmap citation.** The new §4.3 Check cites CrystallineLocalGlobalCompatibilityCM §9.3.
  I checked it at the head of that roadmap's open pull request: its formula is
  `g = q − 3[F⁺:Q] − 1 + |S|` with `T = S`. That roadmap's §9.10 gives `q₀ = l₀ = [F⁺:ℚ]`.
- **Ownership against open work.** This round adds no new object; the edits are Checks only.

## Adversarial pass on the changed statements

Values were computed by hand and by a short enumeration script in the scratch directory. The script
enumerates multisets of local degrees and evaluates condition (ii) at each place.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Five-adic degrees in a protected prepared datum | `μ₅ ⊂ F`; (i) at 5; `ℚ(ζ₂₀) ⊃ ℚ(i)` as a model | 5 splits in `E` ⇒ `v ≠ v^c` ⇒ `F⁺_v̄ = F_v`; `e(ℚ₅(ζ₅)) = 4`; in `ℚ(ζ₂₀)`: `e = 4`, `f = 1`, `g = 2`, so `ℚ(ζ₂₀)⁺` has one place, local degree 4 | local degrees ∈ `4ℤ`, `≥ 8` once `f ≥ 2` | new first sentence of §5.1 Check |
| §5.1 (ii), old Check | `(1,1,6)`, `(1⁸)` at `d = 8` | sums `6 > 4` but residue `𝔽₅` | false | replaced |
| §5.1 (ii), suggested | `(2,2,6)`, `(2⁵)` at `d = 10` | sums `6 > 5`, `2 < 5`; `e = 1` contradicts `4 \| e` | not instances | not used |
| §5.1 (ii), new | `(8,8,24)`, `(8⁵)` at `d = 40`; `d = 36` | best complement sums `24, 24, 8` and `24` (each place); `d = 36`: `(8,8,8,12)` fails at 12 (`16 < 18`), no partition works; `d > 32` from `8 + 8 < d/2` | mixed / everywhere; minimal `d = 40` | Check rewritten |
| §4.3 count | `ℚ(ζ₅)`: `d = 2`, `t = 1`, `r = 6`; `d = 2`, `t = 3`, `r = 10` | `g = 6 − 6 − 1 + 1 = 0`; `dim R^loc = 1 + 3 + 4 = 8 = dim R_∞`, `dim S_∞ = 10`, deficit 2; CLGC count `6 − 6 − 1 + 1 = 0`; second: `14, 6, 20, 22` | consistent | first Check rewritten |
| §5.2 local base | `d = 40`, ten places of degree 8, `R = ∅` | `1 + 10·(3 + 8) = 111`; `1 + 3·10 + 2·40 = 111` | consistent | Check rewritten |
| §5.4 deficit | `d = 40`, `t = 10`, `r = 111` | `g = 111 − 120 − 1 + 10 = 0`; `R_∞ = 111 = 111 + 40 − 40`; `S_∞ = 1 + 39 + 111 = 151 = 111 + 40`; deficit `40` | `= l₀ = [F⁺:ℚ]` (CLGC §9.10) | Check rewritten |
| `r = 111` least | Wiles' formula at `Q = ∅` | `dim H_∅ ≥ 3d + 1 − t = 111` | any admissible `r ≥ 111` | phrased "least value with `g ≥ 0`" |

## Notes for the maintainer

- No name that other roadmaps cite changed. The only rename is the `plan.json` test
  `presentation_d1` → `presentation_cyclotomic_five`, a catalogue name that nothing cites.
- The minimal-degree observation (`[F⁺:ℚ] ≥ 40` for a protected prepared datum) also applies to
  CrystallineLocalGlobalCompatibilityCM §9.1 whenever `p = 5` and the `ζ₅ ∈ F` alternative of its
  clause (10) is used. That roadmap's Checks there are qualitative and are not affected.
- No source was fetched and no `needs-references.toml` was written. Every locator used is in the
  cached texts: CN23 lines 4229, 4237–4246; CaptainSude26 lines 267–277, 480–482.
