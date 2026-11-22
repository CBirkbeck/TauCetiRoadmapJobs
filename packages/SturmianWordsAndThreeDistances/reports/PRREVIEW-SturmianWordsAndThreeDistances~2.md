# Review of SturmianWordsAndThreeDistances (pull request #2959 at d3a01d4)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review (the unrestricted identity `{−kα} = 1 − {kα}`) is repaired, and the three small corrections and two format notes were taken up without introducing a false statement. The new route to uniform distribution through ProbabilisticAndMetricNumberTheory was checked against that roadmap's statements and is sound. One small correction remains, not blocking: `weyl_criterion` is in §2.4 of the supplier, not §2.5. The two points for a human (a single opened source, a survey; an author-page copy) stand.

## C01 — `weyl_criterion` is in ProbabilisticAndMetricNumberTheory §2.4, not §2.5

The route of 2.1 (lines 158–164), the *Needs:* lines of 2.1 and 3.2 (lines 178–179, 302), the scope paragraph (lines 423–424) and the supplier contract (line 482) all place `weyl_criterion` in §2.5. On main, that roadmap proves `weyl_criterion` in "2.4 Weyl criteria for Haar and arbitrary limits"; §2.5, "Linear and polynomial sequences", has `linear_equidistribution_tfae` and `uniformDistribution_mod_one_tfae` only. A reader who opens §2.5 for the criterion does not find it. Write "§2.4 `weyl_criterion`" in those five places (and "§2.4 and §2.5" in the Dependencies of Layers 2 and 3, lines 191 and 317, and in the pull request's description, which says "§2.5 supplies `linear_equidistribution_tfae` and `weyl_criterion`").

## Previous findings

- R01 — repaired: "Since `k(1 − α) − (−kα) = k` is an integer, `{−kα} = {k(1 − α)}` for every real `α`"; the identity with `1 − {kα}` now carries "If `kα` is not an integer".
- C01 — repaired: "differ exactly at the positions `n` for which exactly one of `nα + ρ`, `(n + 1)α + ρ` is an integer", with the both-integer case (constant word `α`) stated and true.
- C02 — repaired: "the Sturmian sequences that Alessandri–Berthé §2, p. 6, define as codings of rotations"; the Rotation-coding bullet, the Fibonacci Check and the References now say §2, pp. 5–6.
- C03 — repaired: the route cites `linear_equidistribution_tfae` and `weyl_criterion` at `d = Unit`, then the third condition of `uniformDistribution_mod_one_tfae`; one section number is off (C01 above).
- N01 — repaired: "Theorem 8 (p. 11), states only the first part … the sum relation is in the statement of the three distance theorem, §3, p. 11".
- N02 — repaired: the parenthesis "(Proved here.)" is gone; no second reference was added, which was an offer only.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions: `{−kα} = {k(1 − α)}` for every real `α` | all `α = p/q`, `|p| ≤ 13`, `q ≤ 6`, `0 ≤ k ≤ 8` (1458 cases); `α = 1/2`, `k = 2` | both sides equal in all cases; `{−1} = 0 = {1}`; `1 − {kα}` when `kα ∉ ℤ`, `0` otherwise | holds |
| 1.1 "exactly one … is an integer" | `α`, `ρ` rational, denominators `≤ 4`, `n < 12` (40128 cases) | words differ at `n` iff exactly one integer: 0 exceptions; both integers 10560 times, always `α, ρ ∈ ℤ`, both letters `α` | holds |
| 1.1 integer `α`, any `ρ` | same family | lower and upper letters both `α` | holds |
| 2.1 route: (iii) of `linear_equidistribution_tfae` at `d = Unit` | `TorusIrrational (fun _ => [α])` unfolded | `k () • [α] ≠ 0` in `ℝ/ℤ` iff `k()·α ∉ ℤ`; true for irrational `α`, `k ≠ 0` | holds |
| 2.1 route: `weyl_criterion` to the third condition | frequency `fun _ => k`, point `n • α + ρ` | `mFourier = ∏` over `Unit` `= fourier k [nα + ρ]`; both averages `(n + 1)⁻¹ ∑` over `range (n + 1)` | same normalisation, agrees |
| 3.2 irrational, upper word | `−iα − ρ = i • (−α) + (−ρ)` | slope `−α` irrational; same three steps apply | holds |
| 3.2 Consequence against source | Theorem 8 and §3 statement, p. 11 | Theorem 8: at most three values only; sum relation in the three distance theorem, source lines 467–470 | locators right |

The rows for the untouched statements stand as in the previous review, of `149f1f3`.

- Source locators checked against the text: 5 changed ones (AlessandriBerthe1998 lines 205–237 for §2, pp. 5–6; line 245 for the start of §2.1; lines 435–436 for Theorem 8; lines 446–449 for the points `{k(1 − α)}`; lines 467–470 for the three distance theorem), all right.
- Library declarations opened at the pin: `Int.fract_neg_eq_zero` (`Mathlib/Algebra/Order/Floor/Ring.lean` 363), `Int.fract_neg` (551), `UnitAddTorus.mFourier` (`Mathlib/Analysis/Fourier/AddCircleMulti.lean` 53), `Fintype.prod_unique` (`Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean` 1056).
- Cross-roadmap citations resolved on main: ProbabilisticAndMetricNumberTheory `linear_equidistribution_tfae` (§2.5, conditions in the order cited), `uniformDistribution_mod_one_tfae` (§2.5), `weyl_criterion` (§2.4: C01), `TorusIrrational`, `torusHaar`.
- `Suggested.lean` is unchanged since `149f1f3`; elaboration: three `sorry` warnings, nothing else.
- Dependency check: `depcheck: 168 roadmaps, 1959 edges, 0 problem(s)`. No change outside the folder.
- Automatic checks: all passed.
- Pull-request text read against the head: the supplier paragraph names the three theorems now used; no sentence contradicted apart from the section number of C01.

Overlap check: read CombinatoricsOfWords, Equidistribution, ProbabilisticAndMetricNumberTheory; nothing shared (CombinatoricsOfWords leaves infinite and Sturmian words outside its scope; Equidistribution owns the points and gaps, ProbabilisticAndMetricNumberTheory the equidistribution theorems, all cited here and not restated).

Source independence: changed passages only; 4 passages compared with 1 source, none shared beyond the twelve-word statement of Theorem 8, which the mathematics forces; largest share AlessandriBerthe1998, 12 of 13 locators; contents not compared again (no layer added, removed or reordered). Lothaire's text was not read.

Research link: The source (Alessandri–Berthé 1998) presents the factor-frequency theorem as equivalent to the three distance theorem of Sós (1958), after Berthé (1996), and the complexity and balance characterisations as Morse–Hedlund (1940) and Coven–Hedlund (1973); rests on AlessandriBerthe1998 §§2.1, 2.3 and its bibliography.

## Not verifiable

- Lothaire, *Algebraic Combinatorics on Words*, Chapter 2, cited for the names "lower" and "upper mechanical word": not read (a commercial book; the roadmap itself says it was not opened).

## Source issues

- **Misprint** in AlessandriBerthe1998 at Theorem 1, p. 3: the source says the points `iα`, `0 ≤ i ≤ n − 1`, cut the circle into `n + 1` intervals; it should be `0 ≤ i ≤ n` (or `n` intervals); affects nothing.

## For the human reviewers

- Scope: the only source opened is one survey (AlessandriBerthe1998, Enseign. Math. 1998); it states the balance theorem of 4.2 without proof, and the README supplies its own proof. Lothaire is cited for terminology and was not opened.
- Licence: AlessandriBerthe1998 was read from a copy on the page of one of its authors (V. Berthé); the README uses that copy's page numbers, not the journal's (103–132).
