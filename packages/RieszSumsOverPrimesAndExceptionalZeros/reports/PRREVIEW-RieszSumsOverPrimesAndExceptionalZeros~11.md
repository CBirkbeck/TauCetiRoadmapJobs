# Review of RieszSumsOverPrimesAndExceptionalZeros (pull request #3027 at 3f8c596)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RieszSumsOverPrimesAndExceptionalZeros/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 5 lines changed since `23a54c4`: headline (3) and 2.9b (iv) (c′) now take `B = 4dM²`, which is what the formal proof's declaration has, and the added claim that `dM²` gives an equivalent statement was recomputed and holds. No finding; one small correction (the docstring of the Lean statement still calls the `dM²` form the form of the formal proof) and one format note carried from the previous review, neither blocking. The standing of the formal proof as a source is left to the human reviewers as before.

## C01 — The docstring of `card_primes_norm_one_mod_shortInterval_ge_of_discr_eq_neg_prime` calls `B = d M²` the form of the formal proof, while 2.9b (iv) (c′) now gives that form as `B = 4dM²`

A reader who sets the Lean statement beside the bullet of 2.9b (iv) (c′) that carries its name finds two different `B` and cannot tell whether the file was left behind. The README (line 888) has `B = 4|d_K| M² = 4dM²`; the docstring in `Suggested.lean` (line 172) has "`B = d M²`" and the statement has `|discr K| * M ^ 2` (lines 181 and 183). The two are equivalent, as the README's parenthesis says (computed below), so nothing stated is false; the docstring only fails to say which of the two it states.

One clause in the docstring would do: "…and `B = d M²` (the formal proof has `4dM²`; the statements are equivalent, for other `A, c, c′`, as 2.9b (iv) (c′) says)". Stating the theorem with `4 * |discr K| * M ^ 2` would do as well.

## N01 — In the module docstring of `Suggested.lean` (lines 20–21), "also this roadmap's own except for that bound, which the family uses" reads as if the family used the bound for `G_1`; what it uses is 1.4i (c′). "…(1.4i (c′)), which the family uses, also this roadmap's own except for that bound" would say it.

## Previous findings

- N01 — not repaired: `Suggested.lean` lines 20–21 are unchanged, "also this roadmap's own except for that bound, which the family uses"; written again above as a format note. The previous report had no finding and no small correction.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 2.9b (iv) (c′) and headline (3): `B = 4dM²` is the formal proof's | `GlobalTheory.T.normPrimesImagQuad_short_interval_lower_bound`; `ShortNorms/ShortNorm.lean` lines 10–11 | there: `log(4·d·M²) ≤ c√(log X)`, `1 ≤ X`, `100 ≤ d`, `3 ≤ M`, bound `c′hX/((4dM²)^A log X)` | as the README now says | none |
| 2.9b (iv) (c′): "with `dM²` in place of `B` the statement is equivalent, for other `A, c, c′`" | least case `d = 103`, `M = 3`: `dM² = 927`, `B = 3708`; both directions | `log 4/log 927 = 0.203`, so `B ≤ (dM²)^1.21`; `(A, c, c′)` for `B` gives `(1.21A, c/1.21, c′)` for `dM²`; conversely the same constants, as `dM² ≤ B` | holds, gap bullet included | none |
| 2.9b: route from (iv) (c), "`A = 2` and a smaller `c`" | `B′ = dM²`, `X < X₀`, `X = 1` | `c′hX/(B′² log X) ≥ c′hX/(B² log X)`; `log B ≥ log 3708 = 8.2 > c√(log X₀)` for small `c`, so `1 ≤ X < X₀` is vacuous; `c_ε B′^(−1/2−ε) ≥ cB^(−2)` | holds with `B = 4dM²` | none |
| `card_primes_norm_one_mod_shortInterval_ge_of_discr_eq_neg_prime` (Lean, unchanged) | against the README bullet with `B = 4dM²` | Lean has `|discr K|·M² = dM²`; equivalent by the row above | true statement; docstring wording is C01 | C01 |
| Headline (3), wider form: "with `B = \|d_K\| M²`, `B²` in place of `B^A` and `X ≥ X₀`" | 2.9b (iv) (c), README lines 1037–1042; `card_primes_norm_one_mod_shortInterval_ge` | `B = \|d_K\| M²`, `c′hX/(B² log X)`, `X₀ ≤ X` in both | agree | none |

The rows for the untouched statements stand as in the previous review, of `23a54c4`; the diff changes one statement of the README (the value of `B` in 2.9b (iv) (c′) and in headline (3)) and no Lean signature.

- Source locators checked against the text: 2 (the formal proof at `Development/AutomorphicArithmetic/ShortNorms/ShortNorm.lean` lines 10–11 and `Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/NormPrimesImagQuadShortIntervalLowerBoundStatement.lean` line 8, both with `4 * d * M ^ 2`).
- Seeded sample: of its ten targets only 2.9b falls in the changed passages; checked as above. The others are unchanged.
- Cross-roadmap citations resolved: 3 citing roadmaps read at this head. ThetaChainsOnDefiniteUnitaryGroups (§2.7 route and its supplier contract) has `B = 4dM²`; the supplier contract of ThetaChainsAndFrobeniusPrimeSums for §2.9b (iv)(c′) still has `B = d·M²`, which is the equivalent form the README's parenthesis names (that folder has its own review).
- Elaboration: `Suggested.lean` elaborates with seven `sorry` warnings and nothing else. The automatic checks all passed.
- Dependency check: `depcheck: 122 roadmaps, 1401 edges, 0 problem(s)`.
- Record: no layer, item or heading is removed or renumbered (the diff touches two sentences).
- Outside the folder: the pull request changes nothing outside `TauCetiRoadmap/`, and there only folders it owns and the two family indexes.
- Pull request's text: the description does not speak of the value of `B`; no sentence of it is contradicted by this head.

Overlap check: as in the previous review (read AnalyticNumberTheoryPartI, QuadraticTwistSelectionOverPrimes, RiemannHypothesisStatementsAndConsequences, ZerosOfLFunctions; LiCoefficientsArithmeticFormula and SpecialFunctionsGamma name none of these objects). Shared: the character prime number theorem with the exceptional term, the one-modulus repulsion and Linnik's theorem, owner AnalyticNumberTheoryPartI §§1.4e, 1.7a, 1.7b, restated here under `*Corollary of:*` lines; Riesz sums, owner RiemannHypothesisStatementsAndConsequences §8.4a. Nothing else is shared, and the change touches none of these.

Source independence: changed passages only; 2 passages compared with 1 source (the formal proof), none shared beyond the formula `4dM²`; largest share Linnik1944a/b and Bombieri1987, 4 each of about 40 locators; the diff adds, removes and reorders no layer, so the contents were not compared.

Research link: 1.7b is Linnik's theorem with the Deuring–Heilbronn repulsion (Linnik 1944; Bombieri 1987) and Gallagher's theorem (Gallagher 1970; Thorner–Zaman 2019, Th. 1.4); 1.4g (b) is Iwaniec–Kowalski Th. 5.27, used by Bennett–Siksek (2020); 2.9b adapts Thorner–Zaman 2019. Rests on the README and the texts read.

## Not verifiable

- Koukoulopoulos 2019, Iwaniec–Kowalski 2004, Lagarias–Montgomery–Odlyzko 1979, Fogels 1964, Turán 1953, Thorner–Zaman 2019: not read in this round. The text citing them is unchanged.
- Davenport 1980 and Stark 1974: settled as uncertified, cited by locator.
- [Announcement]: not read.

## Source issues

- none

## For the human reviewers

- The decision on GeneralizedRiemannHypothesisFromWindowBounds was applied: this README does not name it as a consumer of 2.41a, and no section of this roadmap moved.
- The decision on published theorems was applied: no section is removed here; 1.4g (b), 1.7b (i) and (iii) keep their statements under `*Corollary of:*` lines, and AnalyticNumberTheoryPartI §§1.4e, 1.7a, 1.7b state them.
- Licence: the value of `B` in 2.9b (iv) (c′) was checked against [FormalProof], read in a clone of its public GitHub repository, which carries no licence; the README cites declaration names and statements in its own words, no code.
