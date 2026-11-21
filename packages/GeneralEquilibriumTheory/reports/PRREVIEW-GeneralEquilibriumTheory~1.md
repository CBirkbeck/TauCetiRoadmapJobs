# Review of GeneralEquilibriumTheory (pull request #2927 at 156c3fa)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, route and Check was recomputed by hand (including the Debreu–Scarf theorem without convexity and the core inclusion without local nonsatiation, which go beyond the cited notes) and none is false; all 23 locators into Border's seven notes were read at their pages and hold. There is one small correction (the free-disposal equilibrium is not Border's equilibrium with a disposal technology unless utilities are locally nonsatiated) and two format notes, none blocking. Three points are left for the human reviewers: the sources are unpublished lecture notes of one author, two results are stated more generally than any cited source, and two counterexamples are Border's.

## C01 — The free-disposal equilibrium of 1.3 agrees with Border's equilibrium for the production set `−ℝ^ℓ₊` only when the surplus has value zero

In 1.3 (README line 131) the definition is attributed to "Border, *Arrow–Debreu–McKenzie*, §10, with the production set `−ℝ^ℓ₊`, for nonnegative prices". In Border's §10 the firm maximizes profit over `−ℝ^ℓ₊`, which forces `p ≥ 0` and also `p · (∑ x − ∑ ω) = 0`; the definition here asks only for `∑ x ≤ ∑ ω`. One consumer with `u = 0`, `ω = (1, 1)`, `p = (1/2, 1/2)`, `x = 0`: every budget point is demanded and `0 ≤ ω`, so `(p, x)` is a free-disposal equilibrium here, while the disposal firm's profit `p · (x − ω) = −1` is not its maximum `0`, so it is not Border's equilibrium. Under local nonsatiation the two agree by budget exhaustion, and every theorem that uses the notion assumes it, so no stated result changes. The smallest change: "…for nonnegative prices and locally nonsatiated utilities, where the surplus has value zero by budget exhaustion".

## N01 — The Conventions do not say that endowments are nonnegative, and one Check uses it

The Summary puts `ωᵢ` in the orthant; the Conventions and the Lean signatures take `ω i : Fin ℓ → ℝ` freely. The second Check of 5.1 ("the core of an economy with one consumer is `{ω}`") needs `ω ≥ 0`: for `ω = (−1, 0)` there is no allocation and the core is empty. A clause in the Conventions ("endowments are nonnegative in the prose; the theorems do not need it") would settle it.

## N02 — "they were not consulted" in the References is process narrative

The last bullet of the References says of the original papers that "they were not consulted". "Cited for attribution only, without locator" says the same thing timelessly.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 `IsStrictlyQuasiconcave` | `min`, `x₁+x₂`, `√(x₁x₂)` on boundary | utilities `1,1,1`; `2,2,2`; `0,0,0` at endpoints and midpoint | not strict, as README says; implies quasiconcave |
| 1.2 simplex, allocation, Pareto | `Fin 0`, `Fin 1`; `u = −(x₁−1)²`, `ω=(2,0)` | empty; `{1}`; only allocation `ω`, utility `−1` | agree |
| 1.3 three equilibria | `u₁=x₁+x₂,u₂=min`, `ω=(1,0),(2,1)`, `p=(0,1)`; `u=x₁−x₂`, `p=(1,0)`, `(1,−1)` | min costs `0`, `1` = incomes; demand empty for 1; demand `{(1,0)}`; `(1,1)` demanded at `(1,−1)` | agree; see C01 |
| Layer 1 examples | Cobb–Douglas, Leontief | incomes `27/17, 24/17`; demands `(9/7,9/5)+(12/7,6/5)=(3,3)`; excess demand `(7−17t)/(6t)` | agree |
| 2.1 Gale–Nikaido–Debreu | `ℓ=0,1`; constant `{(1,1)}`; two-branch `ζ` | fixed point gives `q·z ≤ p·z ≤ 0`; `p·z=0` on both branches, `z ≤ 0` only at `t=1`, `t=0` | true; Checks true |
| 3.1 free-disposal existence | route step 5; boundary endowment; nonconvex `u₁` | demand of 2 for good 2 is `1+t > 1`; `u₁(a,2a)=1/(2−t) > 1/2`; at `(1,0)` need `x₂ ≥ 3 > 2` | true; Checks true |
| 3.2 Walrasian existence | `u=x₁−x₂`, `ω=(1,1)`; `ℓ=1` | demand `{(1/t,0)}`, good 2 never clears; `p·s=0` so `x+s` affordable | true |
| 4.1 first welfare | `u₁=0`, `u₂=x₁+x₂`, `p=(1/2,1/2)`; no consumers | `x=ω` equilibrium; `(0,0),(2,2)` improves `2→4` | true; negative control true |
| 4.2 cheaper point | income `0` at `p=(0,1)` | segment to cheaper point costs `< p·xᵢ`, still better | true |
| 4.3 second welfare | `u₁=x₁²+x₂²`, `u₂=min`, `(d,d)`; no consumers, `ℓ=0` | Pareto optimal (`max(a,b) ≤ d ⇒ a²+b² ≤ 2d²`); cheapest `√2 d·min p` `<` `d(p₁+p₂)`; shortfall `(√2−1)/2 = 0.207` | true; Check true |
| 5.1 core, replica | one consumer; box `ω=(3,1),(1,3)` | `u(ω)=√3`; diagonal core `√3 ≤ t ≤ 4−√3` | agree; see N01 |
| 5.2 Walrasian in core | 4.1 Check economy | blocking `y a` unaffordable, sum `p·∑y > p·∑ω` | true without local nonsatiation |
| 5.3 equal treatment | linear `u`, `n=2`, bundles `(3,0),(0,3),(3/2,3/2)²`; average equal to worst bundle | sum `(6,6)`; all on `x₁+x₂=3`; average strictly beats worst by induction | true; Check true |
| 5.4 Debreu–Scarf | box `n=1,2,6`; `t=1.8`; `u=x₁²+x₂²`; `u=√x₁+√x₂`; `ι` empty; `ℓ=0` | `√35−4=1.916`; `√483−20=1.977`; `2(2.15,1.55)+(2.7,1.9)=(7,5)`, `√3.3325=1.8255`, `√5.13=2.265`; `√4.1=2.025` | true in both directions without convexity; coalition has `∑kⱼ = n` members |

- Source locators checked against the text: 23 of 23, in the seven notes (Border-Core, Border-Walrasian, Border-Arrow-Debreu, Border-FirstWelfare, Border-SecondWelfare, Border-Correspondences, Border-FixPt).
- Library declarations opened at the pin: 19, all present where cited (for example `UpperHemicontinuousOn`, `Mathlib/Topology/Semicontinuity/Defs.lean:648`; `geometric_hahn_banach_of_nonempty_interior_point`, `Mathlib/Analysis/LocallyConvex/Separation.lean:185`; `Convexity.StdSimplex.range_toFun_comp_weights`, `Mathlib/Geometry/Convex/ConvexSpace/Defs.lean:111`). Mathlib and Tau Ceti have no Walrasian equilibrium, Pareto optimality of allocations, or strict quasiconcavity.
- Cross-roadmap citations resolved: 9 (ConsumerTheoryDuality 1.1, 1.2, 1.3 with the three definitions identical character for character and `dotProduct_eq_of_mem_marshallianDemand`; KakutaniFixedPointAndContinuousGames 1.1, 2.2, 3.1 with the hypotheses as quoted; RegretMinimizationAndEquilibria `simplex` on main; UtilityRepresentationTheorems 2.3; CooperativeGames 2.1).
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`; no UPWARD or CYCLE line. Both open suppliers add new roadmap folders.
- Elaboration: `Suggested.lean` elaborates with nine `sorry` warnings and nothing else; the 21 elaborated types were compared with the README statements and agree (`replica` does not carry `[Fintype ι]`, which it does not need).
- One-tactic probe (`simp`, `tauto`, `infer_instance`, `exact?`) on a scratch copy: none of the nine theorems closes. All nine README headlines are stated; nothing is padding.
- Pull-request text against the head: title and description agree with the change (new roadmap, 9 theorems, 12 definitions, 4 copied, suppliers as listed); nothing outside the folder changes.
- Overlap check: read ConsumerTheoryDuality, KakutaniFixedPointAndContinuousGames, RevealedPreference, HousingMarketsAndAssignmentGames, FairDivision, RegretMinimizationAndEquilibria (the third list is empty); budget sets, local nonsatiation and Marshallian demand are owned by ConsumerTheoryDuality and the simplex by RegretMinimizationAndEquilibria, both cited; the Walrasian equilibrium of HousingMarketsAndAssignmentGames and the Pareto optimality of FairDivision are notions for indivisible goods, not the objects here; nothing else shared.

Source independence: 10 passages compared with 7 sources, none shared beyond formulas and standard names; largest share Border-Walrasian, 6 of 23 locators; contents compared with Border-Walrasian (theorem, one example per assumption, proof outline): independent. The order 5.1–5.4 is that of the results of Border-Core, forced by 5.2 needing 5.1 and 5.4 needing 5.2, with different hypotheses in each.

Research link: The headline targets are the existence theorem of Arrow and Debreu (1954), the lemma of Gale (1955), Nikaidô (1956) and Debreu (1956), and the core limit theorem of Debreu and Scarf (1963), as attributed in the README's References and in the bibliographies of Border-Walrasian and Border-Core.

## Not verifiable

- The proof of the Gale–Nikaido–Debreu lemma that Border-Walrasian refers to (Border's 1985 book, Theorem 18.1) was not read; the README gives its own route from Kakutani's theorem, which was checked by hand.
- The original papers named in the References carry no locator and were not read.

## Source issues

- **Gap** in Border-Core at Theorem 5, proof, p. 4: the source says continuity makes each set of improving net trades open, hence their convex hull open, giving a strictly negative point of the hull; it should be open only relative to the net trades that keep the bundle in the orthant, so a further argument is needed; affects the proof.
- **Misprint** in Border-SecondWelfare at the definition of strictly convex preferences, p. 6: the source says a weakly preferred point gives strictly preferred proper mixtures, with no condition that the two points differ; it should be required that they are distinct; affects nothing.

## For the human reviewers

- **Scope.** All 23 locators point to seven unpublished lecture notes of one author (Border, Caltech page); the README's References name the refereed originals (Arrow–Debreu 1954, Debreu–Scarf 1963 and others) without locators and say they were not consulted.
- **Scope.** 5.4 (no convexity, equilibrium rather than quasi-equilibrium) and 5.2 (no local nonsatiation) are stated more generally than Border-Core Theorems 5 and 2; no cited source states these forms. The routes were checked by hand in this review.
- **Licence.** The seven notes were read from the author's own page and carry no stated licence. The counterexample economies in the Checks of 1.3 and 3.1 are Border's (Border-Walrasian, Assumptions 2c and 3, p. 4), cited, with the computations redone.
