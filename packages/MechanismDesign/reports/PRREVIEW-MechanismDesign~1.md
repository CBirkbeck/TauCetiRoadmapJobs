# Review of MechanismDesign (pull request #2856 at f2f563a)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of the four layers was recomputed (the one-bidder sandwich and its converse, second-price and Vickrey with arbitrary tie-breaking, Groves and VCG, the Fubini and layer-cake route to the virtual-welfare identity with the lowest-type term, the optimality argument and its single-item form) and every numerical Check re-derived by hand; all agree, and every locator into the two texts is where the README says. There are two small corrections, both to the pull request's description, and two format notes; none blocks. The humans who approve have two facts to weigh: the sources are lecture notes and a book manuscript, and the primary papers were not consulted.

## C01 — The description says four neighbouring roadmaps each list mechanism design or auctions as outside their scope; KakutaniFixedPointAndContinuousGames does not

The description reads: "RegretMinimizationAndEquilibria …, PotentialGamesAndPriceOfAnarchy …, CooperativeGames … and KakutaniFixedPointAndContinuousGames … border it; each lists mechanism design or auctions as outside its scope". A reader checking the boundary finds the exclusion in three of them (RegretMinimizationAndEquilibria README line 766 on main; PotentialGamesAndPriceOfAnarchy README lines 618–619 and CooperativeGames README line 975 at their open heads) but nothing in KakutaniFixedPointAndContinuousGames, whose scope section (README lines 397–431 at its open head) mentions neither word. The README of this roadmap is already right: it says only that the existence of Bayes–Nash equilibria of auctions "is not treated here". Text that would be right: "the first three list mechanism design or auctions as outside their scope; KakutaniFixedPointAndContinuousGames states no part of it". SocialChoice, by the same author and open, also borders it (its README line 563 excludes auctions and payments, and this README excludes Arrow and Gibbard–Satterthwaite); the description could name it too.

## C02 — The description attributes to Hartline's Lemma 3.3.1 a failure that its own setting excludes

The description says the lemma "puts no condition on tie-breaking (ties may be broken arbitrarily, p. 68), and then a pointwise maximizer need not be monotone". In the lemma's proof (p. 66) the allocation is one fixed surplus maximizer applied to the profile of virtual values, so a tie is resolved as a function of the virtual values and the composite with a nondecreasing virtual value function is monotone; the remark on p. 68 is about that rule. What fails is the stronger statement the roadmap wants, for a maximizer chosen profile by profile in value space, and the README's References paragraph and the first Check of 4.4 say exactly that. Text that would be right: "Hartline's Lemma 3.3.1 is for a fixed maximizer applied to virtual values; for a maximizer chosen at each value profile, nondecreasing virtual values are not enough (Check of 4.4), so the roadmap assumes strict monotonicity, as Roughgarden does."

## N01 — Four Checks report runs on random inputs rather than a value a reader can recompute

The "Brute force" Checks of 1.2 (line 151), 2.1 (line 222), 2.2 (line 247) and 3.3 (line 322) say that a search over "400 random monotone step functions" or "random tie-breaking" found no violation. A reader cannot reproduce a random run, and the bullets state no computed value. The grid versions are deterministic once "random tie-breaking" becomes "every tie-breaking on the grid" or one named rule; the 1.2 bullet would read better as one named step function with its values.

## N02 — One item of the *Needs:* line of 1.2 has no name

"the convergence of Riemann sums of a monotone function to its integral" (line 155–156) follows two Mathlib names, so it reads as a Mathlib declaration, but none is named. For the uniform partition the upper and lower sums differ by `(b/n)(g(b) − g(0))`, so it is a short step of the proof; saying "proved here" for that item would settle it.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 Myerson's payment | step at `t`; `min(z,1)` at `b = 1/2, 2`; `x ≡ −1` | `b − (b − t) = t`; `1/4 − 1/8 = 1/8`, `2 − 3/2 = 1/2`; `−b + b = 0`, utility `−1` | agrees with Checks |
| 1.1 wrong payment `b·x` | step at `1/2`, value `1`, bids `3/4` and `1` | utilities `1/4` and `0` | not DSIC, as stated |
| 1.2 one-bidder lemma | both orders `(z,y)`, `(y,z)`; converse for `b < v`, `b > v`; `g = 1` on `[1,2)` | sandwich `z Δg ≤ Δq ≤ y Δg`; shortfall `∫_b^v (g(t) − g(b)) dt ≥ 0` both signs; `(5/2 − 3/2)(0 − 1) = −1` | true both directions |
| 1.3 `exists_isDSIC_iff_isMonotoneAlloc`, `isDSIC_myersonPayment`, `IsDSIC.payment_eq` | `ι` empty; one bidder; `p = myersonPayment + 1` | empty: vacuous both sides; one bidder is 1.2; shifted rule has `p(0) = 1`, formula gives `1 + myerson` | true; normalization by bid `0` exact |
| 2.1 `isDSIC_secondPrice` | `r > B`, `r ≤ B`, tie `z = B`, bids `(3,3)`, one bidder | threshold `T = max r B`; utility `v − T` or `0`; tie gives `0` either way; payment `max(r, others) ≤ b i` | true for every `w` |
| 2.2 `vickrey_welfare` | fractional `y`, `∑ y < 1` | `∑ b y ≤ max b · ∑ y ≤ max b = b (w b)` | true |
| 2.2 `vickrey_dominant_iff` | `β > v`, `β < v` with other bid `(v+β)/2`; one bidder; reserve `r > v` | `v − B < 0` against `0`; `0` against `v − B > 0`; one bidder: every bid gives `v` | iff holds; both hypotheses needed |
| 3.2 `isDSICGeneral_groves` | `h` depending on own report (one agent, outcomes `a`, `c`) | truthful `1 − 1 = 0`; report `(−5, 0)` gives `0 + 5 = 5` | true; `hh` needed |
| 3.3 `vcgPayment_properties` | one agent, one outcome, value `−1`; `ι` empty; Vickrey as VCG on `Option ι` | pivot `0`, payment `0`, utility `−1`; winner pays highest other bid, loser `0` | true; sign hypothesis needed |
| 4.1 BIC and first-price Check | values `3/2`, `3`, with and without truncation | `m ↦ v m − m²/2` on `[0,1]`: `1`, `5/2` at `m = 1`; untruncated `3 − 3/2 = 3/2 < 5/2` | agrees |
| Conventions: clamping to `[a, h]`; gap example | `v > h`, `v < a`; value `3/2` in the gap | extra term `(v − h)(X(h) − X(m)) ≥ 0`, `(v − a)(X(a) − X(m)) ≥ 0`; gain `3/2 − 1 = 1/2` | true |
| 4.2 `interimPay_eq_of_isBIC` | arbitrary (non-probability) `μ`, junk integrals | statement is 1.2 for the real functions `X`, `P`; difference of payments constant, zero at `z₀` | true as stated, no measure hypothesis needed |
| 4.2 `integral_payment_eq_of_isBIC` | first- and second-price, two uniform bidders | both interim payments `z²/2`: `0.045, 0.245, 0.5`; expected `1/6` each | true; Fubini needs `μ i` probability |
| 4.3 `integral_payment_eq_virtualWelfare` | uniform posted price; exponential rate 2; uniform on `[1,2]`; gap law; two Lomax laws | `r(1 − r)`: `0.1875, 0.25, 0.16`; `e⁻¹/2`; `0.080831 + 0.067668 = 0.148499`; `0 = 1 − 1`; `3/4` vs `1`; `−9.24, −99.3, −999.3`; `11.37, 146.0, 1496` | identity and every Check agree |
| 4.4 `sum_integral_payment_le_myerson` | two-profile exchange; density `0.8`/`0.1`; fixed fee `c` | `(φ(v') − φ(v))(xs(v') − xs(v)) ≥ 0`; `φ = 2z − 1.25`, `2z − 3`, zeros `0.625`, `1.5`; revenue `+ n c` | true; strictness and the bid-`0` constraint needed |
| 4.5 `sum_integral_payment_le_secondPrice` | two uniform bidders, reserve `r`; bid at `0` with `r = 0` | `2r²(1 − r) + ∫_r^1 2y(1 − y) dy = (1 + 3r² − 4r³)/3`: `1/3`, `5/12`; derivative `2r − 4r²` | true; payment at bid `0` is `0`, so it equals Myerson's |
| `HasPositiveDensityFrom` | uniform on `[1,2]` with `a = 0` and `a = 1` | `a = 0` fails `pos` on `(0,1)`; `a = 1` holds | determines `a` as the bottom of the support |

- Source locators checked against the text: 34 (22 in Roughgarden's Lectures 2, 3, 5, 7; 12 in Hartline, chapters 2 and 3); all at the stated place, with the stated hypotheses.
- Library declarations opened at the pin: 29 Mathlib names of the supplier contracts, each resolved to the module the README gives (for example `Monotone.intervalIntegrable`, IntervalIntegral/Basic.lean line 536; `MeasureTheory.Integrable.integral_eq_integral_meas_lt`, Layercake.lean line 509; `MeasureTheory.measurePreserving_piEquivPiSubtypeProd`, Constructions/Pi.lean line 715, which needs σ-finite factors).
- Duplication: no file of the pinned Mathlib or Tau Ceti mentions auctions, incentive compatibility or virtual values; no roadmap on main or open states any target of this one.
- Cross-roadmap citations: none is a supplier; five neighbours read for scope.
- Dependency check: `depcheck: 172 roadmaps, 1998 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (13); the automatic checks all passed. `#check` of the 29 declarations: definitions drop unused `[Fintype ι]` or `[DecidableEq ι]` only; no hypothesis lost.
- One-tactic probe (`simp` with all definitions unfolded, `rfl`, `simp_all`, `aesop`) on the 13 theorems: none closes. All headline theorems of the README are stated; the one-bidder lemma is README-only and the docstring says so.
- No change outside the roadmap folder.

Overlap check: read PotentialGamesAndPriceOfAnarchy, SocialChoice, KakutaniFixedPointAndContinuousGames, CooperativeGames, RegretMinimizationAndEquilibria; nothing shared.

Source independence: 18 passages compared with 2 sources (Roughgarden's four lectures, Hartline's chapters 2 and 3), none shared; largest share Roughgarden-CS364A, 22 of 34 locators; contents compared with Roughgarden-CS364A (Layer 1 ↔ Lecture 3, Layer 2 ↔ Lecture 2, Layer 3 ↔ Lecture 7, Layer 4 ↔ Lecture 5 with Hartline 2.7, 2.10, 3.3): independent, the order differs and Layer 4's scope is not one lecture's.

Research link: The headline targets are the theorems of Vickrey (1961), Clarke (1971), Groves (1973) and Myerson (1981, Optimal auction design, Math. Oper. Res.), the base of auction theory; rests on the README's References and on the attributions in Roughgarden's Lectures 2, 3, 5, 7.

## Not verifiable

- Myerson (1981), Vickrey (1961), Clarke (1971), Groves (1973): cited without locators and not read; the attributions were checked only against the two texts. In particular "Myerson, 1981, for the lowest-type term" (4.3) rests on no text read.
- The four "Brute force" Checks: random runs, not rerun; the statements they test were verified by proof instead.

## Source issues

- **Gap** in Roughgarden-CS364A at Lecture 5, Step 3 and (4), p. 5: the source divides by the density with no positivity assumption; it should be assumed positive almost everywhere where mass remains above (density 1/2 on [0,1] ∪ [2,3], price 3/2: 3/4 against 1); affects a stated result.
- **Gap** in Hartline-MDnA at (3.3.3), p. 65: the source states the identity for every allocation satisfying the equilibrium characterization, dividing by the density; it should require the density positive almost everywhere where mass remains above; affects a stated result.
- **Error** in Roughgarden-CS364A at Lecture 7, the remark after (4), pp. 3–4: the source says the rebate is always nonnegative, with valuations of any sign; it should assume nonnegative valuations (one agent, one outcome valued −1: rebate −1); affects a stated result.

## For the human reviewers

- Scope: both sources are unrefereed texts on their authors' pages (lecture notes of 2013; a book manuscript dated 2021); the refereed papers of Vickrey, Clarke, Groves and Myerson are named without locators and were not consulted (README References).
- Licence: Roughgarden's notes carry "provided for personal use only" (first page of each lecture); the roadmap cites them by locator and no passage is shared.
