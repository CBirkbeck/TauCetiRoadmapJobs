# Review of ArithmeticStatisticsPartVII (pull request #1178 at 28c3435)
**Verdict:** accepted

No findings. Incremental re-review of the 38 changed lines since `ddbc3d0` (8 insertions, 30 deletions, all in `README.md`), and of the pull request's title and description against this head.

## Previous findings

- R01 — repaired: the description now says “the multiplicative large sieve with constant `H−1+Q²`, `SieveApplications.sharp_primitive_largeSieve` of SieveMethodsAndPrimePatterns §2.9. That section also owns the Hilbert inequality … and the sharp additive large sieve”, as `README.md:17` does.
- R02 — repaired: the summary block reads “Its arithmetic sections state the Cohen–Lenstra and Cohen–Martinet conjectures as propositions …”.
- R03 — repaired: “This pull request adds the new roadmap folder `TauCetiRoadmap/ArithmeticStatisticsPartVII` (README, `Suggested.lean`, `metadata.toml`) and changes nothing outside it.”

## Verified sound

| Statement (changed, or cited by the changed text) | Instances and computed values on both sides | Result |
|---|---|---|
| `README.md:47`, the supplier contract for `SieveApplications.sharp_primitive_largeSieve` | Supplier head, `Suggested.lean:250`: `Q H : ℕ`, `1≤Q`, `1≤H`, `M : ℤ`, `a : Fin H → ℂ`, points `M+j+1`, constant `H−1+Q²`: the same binders and range as the README. | Contract equals the supplier's statement. |
| same, values | `Q=H=1`: `|a₁|²≤(1−1+1)|a₁|²`, equality. `Q=2,H=100,a≡1`: `10000≤103·100=10300`; with the imprimitive character mod 2, `15000`. `Q=3,H=2,M=0,a=(1,1)`: `4+(3/2)·0=4≤20`. | Holds; primitivity filter needed. |
| `README.md:1037`, Lemma 14 from the large sieve with `H=NL²` | An integer `L` with `Q²≤NL²≤4Q²` exists for all `1≤Q<120`, `N≤Q²` (0 failures; `Q=5,N=24`: `L=2`, `96`). `H=NL²≥1`. `‖c‖²=‖a‖²/L` by squarefree support. | Hypotheses of the supplier met. |
| same, constant | `(H−1+Q²)‖c‖²≤5Q²‖a‖²/L≤5Q√N‖a‖²`; share of `ℓ≤L` prime to `p` or `4p`, `L<400`, `p<60`: least value `1/4` (`L=4`, modulus 12). So `C₁≤16·5=80`. | Absolute, effective `C₁`. |
| `README.md:17, 2514, 2518`, ownership | Supplier §2.9 at its head: Hilbert `π/δ` (`README.md:2405`), additive `N−1+δ⁻¹` for `0<δ≤1` (`:2415`), primitive `H−1+Q²` (`:2431`). This README states none of the three; no anchor `#multiplicative-large-sieve` remains. | One owner. |

The rows for the untouched statements stand as in the previous review, of `ddbc3d0`.

- Gate, run on this head: every check 0, `OK` (the worker's run: `build=0`). `lake env lean` on `Suggested.lean`: exit 0, nine `declaration uses sorry` warnings (lines 74, 99, 112, 124, 139, 145, 170, 189, 206), nothing else. The diff changes no Lean line.
- Dependency check: `depcheck: 245 roadmaps, 2246 edges, 0 problem(s)`; no UPWARD or CYCLE line. SieveMethodsAndPrimePatterns is line 57 of the merge order, this roadmap line 147; `git diff --stat origin/main...HEAD` outside the folder is empty.
- Source locators checked against the text, 1: Kane Lemma 14 and its proof, p. 12 (Kane lines 618–656): positive integers `Q`, `N` with `Q²≥N`, squarefree support, the convolution with squares, inequality (5) with constant `Q²+NM²−1`. It supports `:1037` as written. No section of the seeded sample contains a changed line.
- Cross-roadmap citations resolved, 4 (all the diff adds): SieveMethodsAndPrimePatterns §2.9 at `:17`, `:47`, `:1037`–`:1039`, `:2514`–`:2518`, against that roadmap's open head (`README.md:2403`, `Suggested.lean:250`). The lead `SieveApplications.sharp_primitive_largeSieve` of the citation list is that declaration. The other 11 leads are this file's own declarations, on unchanged lines.
- Removed text leaves nothing dangling: reference [57] was the last entry, no `[Montgomery]` link and no Mathlib Gauss-sum name remains in the README; `DirichletCharacter.IsPrimitive` and `Nat.totient` are named at `:47`.
- Title and description read sentence by sentence against the head: new folder, single layer numbered 5, §5.9 and its imported analytic inputs, the Lean and validation claims (as measured above) all hold.
- Overlap check: read SieveMethodsAndPrimePatterns (scope, §§2.3, 2.9, consumers), ArithmeticStatisticsPartVI, AnalyticNumberTheoryPartI; the Hilbert inequality `π/δ` and the two sharp large sieves are owned by SieveMethodsAndPrimePatterns §2.9 alone, the weighted `3π/2` form by AnalyticNumberTheoryPartI §1.5a; the scopes of the other closest roadmaps stand as read before.
- Source independence: changed passages only; 5 passages compared with 1 source (Kane), none shared (longest common run 3 words, “multiplicative large sieve”); the diff removes one target and no layer, so the arrangement was not compared again.
- Remark: the generated `depends-on` block of the description does not list #1495 (SieveMethodsAndPrimePatterns), now a supplier that is still open; the generated `merge-order` block does place it before this pull request.

## Not verifiable

- KED-ANT-16, Theorem 16.2, the supplier's own locator for the sharp primitive large sieve, was not opened: this roadmap cites the supplier, not that text.
- Carried from the previous review: LOWW's published pagination; Rubin Proposition 3.14; AnalyticNumberTheoryPartI §0.34's sources; Kane's published numbering; DeJong, CM90, vanKampen, Silverman, Cassels1965, Oesterlé, Schaefer1996. No changed passage cites them.

## Source issues

- none

## For the human reviewers

- **Supplier still open.** §5.9 now rests on SieveMethodsAndPrimePatterns §2.9, a roadmap not on main (open pull request, merge-order line 57); the description's generated `depends-on` block does not list it, its `merge-order` block does.
- **Not tested.** The arrangement was not compared with a table of contents this round (no layer changed); the wording check covers the five changed passages only.
