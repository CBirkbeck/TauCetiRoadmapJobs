# Review of RevealedPreference (pull request #2926 at a0ec855)

**Verdict:** accepted

**Summary.** Accepted: no finding. The four headline statements (Richter, Houthakker in Richter's form, Afriat, Samuelson) were rechecked by hand through their routes, including the degenerate cases (empty index type, `ℓ = 0`, non-differentiable demand), and every worked Check was recomputed and agrees. There is one small correction (two Checks of 2.2 are true only under the standing hypotheses that neighbouring Checks drop) and one format note, neither blocking. For the humans: the Fostel–Scarf–Todd paper, which carries the locators of 2.2, could not be read from an accepted place, and the sources are lecture notes, a survey and a discussion paper rather than the primary articles.

## C01 — Two Checks of 2.2 hold only under the theorem's standing hypotheses, which the Checks around them drop

The Checks of 2.2 move in and out of the hypotheses of the theorem (zero prices, a negative bundle, `ℓ = 0`), so a reader takes each sentence at face value, and two of them then contradict their neighbours. "A constant utility rationalizes every data set" (first Check, line 265) fails for the one-good data `p¹ = 1`, `x¹ = −1` of the fifth Check, which says that no utility rationalizes it: rationalization includes `xᵗ ≥ 0`. "With no observations all four conditions hold" (line 282) fails for `ℓ = 0`, where by the sixth Check no utility is locally nonsatiated, so condition 1 is false.

Adding the hypothesis to each is enough: "a constant utility rationalizes every data set with nonnegative bundles", and "with no observations and at least one good, all four conditions hold".

## N01 — Four Checks report computer searches rather than values a reader can recompute

The last Checks of 1.2, 1.3, 2.2 and 3.2 record exhaustive searches (864,501 and 435,897 choice structures; 46,656 and 65,536 data sets; a price grid). The house rule keeps large computations out of the README. The counts are right (65 pairs `(B, c)` give `∑_{k≤4} C(64+k, k) = 864,501`; 32 univalent pairs give `C(37, 5) = 435,897`; 42,798 and 54,066 data sets satisfy GARP, recomputed), so nothing is false; a sentence saying what a smaller instance shows by hand would serve the same purpose.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 definitions `revealedPreferred`, `strictlyRevealedPreferred`, `RationalizedBy`, `SatisfiesCongruence`, `SatisfiesSARP` | 3-cycle `{x,y},{y,z},{x,z}` with choices `{x},{y},{z}`; repeated budget `{a,b}` with `{a}`, `{b}` | 3-cycle: `W x z`, `z` chosen, `x` not: congruence false; weak axiom true. Repeat: `W b a`, `b ∉ c₁`: false | agree with README | none |
| 1.1 cyclic relation rationalizes the 3-cycle | `R = {xy, yz, zx}` + reflexive | best of `{x,y}` is `x`, of `{y,z}` is `y`, of `{x,z}` is `z`; `R x y, R y z, ¬R x z` | total, not transitive, as stated | none |
| 1.2 Richter (`exists_totalPreorder_rationalizedBy_iff_congruence`) | `ι` empty; `c = ∅` on `{a,b}`; `c = ∅` on `ℕ` with `≥`; budget `{a}`, `c = {a,b}`; route step by step | `ι = ∅`: both true. `c = ∅`: congruence vacuous, no finite rationalizer; `≥` on `ℕ` rationalizes. `[y] ≠ [x]` gives `¬R x y` | true; both hypotheses needed | none |
| 1.3 Houthakker (`exists_totalPreorder_rationalizedBy_iff_sarp`) | univalent `c i = {aᵢ}`; two copies of `{a,b}` with `{a,b}`, `{a}`; one-step cycle `S x x` | `V`-step is `=` or `S`; chain `x→y` plus `S y x` is a strict cycle; `S x x` impossible. Non-univalent: `S = {a→b}`, congruence false | true; univalence needed | none |
| 1.3 three-good data | `p·x` table | rows `4,5,3` / `3,4,5` / `5,3,4`; own cost `4`; cycle `1→3→2→1` strict; each pair one-way | SARP false, weak axiom true | none |
| 2.1 `directlyRevealedPreferred`, `SatisfiesGARP`, `SatisfiesAfriatInequalities`, `Rationalizes` | tie `p=(1,1)`, `x=(1,0),(0,1)`; violation `p¹=(1,2), x¹=(3,0), p²=(1,4), x²=(0,1)` | tie: all costs `1`, GARP true, `0 ≤ 0`. Violation: costs `3,2` and `3,4`, `a₁₂ = a₂₁ = −1`, so `lam₁+lam₂ ≤ 0` | agree; direction matches Varian Def. 1, 4 | none |
| 2.2 Afriat (`afriat_tfae`) | each arrow by hand; `ι = ∅`; `ℓ = 0`; `p = 0`; `p = (1,0)`; `x = −1`; exact induction on 46,656 and 65,536 data sets | `u xᵗ = φ t`; `u y ≤ φ t` on the budget. GARP sets 42,798 and 54,066; induction always succeeds with `lam ≥ 1` | true; `ℓ > 0`, `p ≫ 0`, `x ≥ 0` each needed | C01 |
| 3.1 `SatisfiesWARP` | `(q,n) = (p,m)` without the `≠` clause; Cobb–Douglas; `x = m p/(p·p)` | no `≠`: `m < m`. Second demand: `(1,1)` and `(3/5,6/5)`, costs `9/5 ≤ 2` and `3 ≮ 3` | axiom false for it; equivalent to Border Def. 1 without exhaustion | none |
| 3.2 Samuelson (`slutskyMatrix_negSemidef_of_warp`) | non-differentiable point; `ℓ = 0`; `ℓ = 1`; Cobb–Douglas at `((2,3),5)`; `m p/|p|²` at `((1,1),2)`; `x = 2m/p` | `S = 0` if not differentiable. C–D: `[[−5/18, 5/27],[5/27, −10/81]]`, `S p = p S = 0`. Second: `[[½,−½],[−½,½]]`, form `2`. Third: `2m/p² > 0` | true; `g'(0) = S w`, Euler gives `S p = 0`, differentiating `q·x = n` gives `p S = 0` | none |
| Copied definitions `budgetSet`, `LocallyNonsatiated`, `marshallianDemand`, `slutskyMatrix` | compared with ConsumerTheoryDuality's `Suggested.lean` at its open head | bodies identical character for character (its lines 33–43, 187–190) | verbatim, as stated | none |

- Source locators checked against the text: 13 in Border's choice notes (text lines 232–274, 308, 413–446, 485–488, 580–584, 1013), 5 in Border's Slutsky note (lines 16–36, 63–83, 88–140), 6 in Varian (lines 38–45, 65–67, 182–198); 12 in Fostel–Scarf–Todd not checked.
- Library declarations opened at the pin: `extend_partialOrder` (`Mathlib/Order/Extension/Linear.lean:28`), `Antisymmetrization` (`Mathlib/Order/Antisymmetrization.lean:124`), `HasFDerivAt.apply_self_eq_smul_of_eventuallyEq` (`Mathlib/Analysis/Calculus/LineDeriv/Basic.lean:285`), `fderiv_zero_of_not_differentiableAt` (`FDeriv/Basic.lean:234`), `HasFDerivAt.comp` (`FDeriv/Comp.lean:103`), `HasFDerivAt.sum` (`FDeriv/Add.lean:416`), `ConcaveOn.inf` (`Analysis/Convex/Function.lean:621`), `le_of_tendsto` (`Topology/Order/OrderClosed.lean:133`), and Tau Ceti's `isCyclicallyMonotone_pairingCost_iff_exists_fenchelConjugate` (`TauCeti/MeasureTheory/OptimalTransport/CTransform/Rockafellar.lean:87`). Neither library has revealed preference relations, GARP, the Afriat inequalities or a Slutsky matrix.
- Cross-roadmap citations resolved at the open heads: ConsumerTheoryDuality 1.1, 1.2, 5.1, 5.2 (and its scope line excluding revealed preference), UtilityRepresentationTheorems conventions, SocialChoice 1.1 (`WeakPref` with field `rel`), ConvexAnalysisAndDuality 4.4.
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`; the one supplier, ConsumerTheoryDuality, is an open pull request adding a new roadmap, named in the description.
- Elaboration: `Suggested.lean` elaborates, `sorry` the only warning (4 declarations); elaborated types of all 18 declarations compared with the README, no binder lost; single `import Mathlib`, no `set_option`, no sorried data.
- One-tactic probe: none of the 4 theorems closes with `rfl`, `simp`, `simp` with the definitions unfolded, `tauto` or `aesop`. All four README headlines are stated; none is a stand-in.
- Automatic checks: all passed. Pull request text read against the head: title and description agree with it (new roadmap, 4 theorems, 14 definitions, one open supplier).
- Overlap check: read ConsumerTheoryDuality, GeneralEquilibriumTheory, UtilityRepresentationTheorems, SocialChoice (HousingMarketsAndAssignmentGames searched by object, no hit; no close roadmap on main); budget sets, local nonsatiation, Marshallian demand and the Slutsky matrix are owned by ConsumerTheoryDuality and copied here as its, total preorders as plain relations by UtilityRepresentationTheorems; revealed preference, Afriat and the weak axiom are stated by no other roadmap, and ConsumerTheoryDuality lists them as outside its scope.

Source independence: 14 passages compared with 3 sources (Border's two notes, Varian), none shared beyond formulas; largest share Border's choice notes, 13 of about 36 locators; contents compared with its 17 sections: independent (Layer 1 draws on its sections 5, 6, 8 and 12 only, Layers 2 and 3 on other texts). The Fostel–Scarf–Todd text (about 12 locators) could not be read.

Research link: Afriat's theorem and GARP underlie the empirical revealed-preference literature that Varian (2006) surveys; Richter (1966) and Kihlstrom, Mas-Colell and Sonnenschein (1976) are the sources Border attributes 1.2 and 3.2 to. Rests on the README's references and on Varian's and Border's texts.

## Not verifiable

- Fostel, Scarf and Todd, *Two New Proofs of Afriat's Theorem* (Cowles Foundation Discussion Paper 1415): the Cowles Foundation's host is in no licence class the sources service accepts, the published version (*Economic Theory* 24, 2004) is paywalled, and no author's page copy was found; its locators in 2.1 and 2.2 (Definition 1, p. 2; the inequalities and Theorem 1, p. 3; Claims 1 and 2, pp. 4–5; the formulas of p. 6) and the page agreement of the technical report were not read. The route attributed to it was recomputed independently and is sound.

## Source issues

- **Error** in Varian, *Revealed Preference* (2006, author's copy) at Definition 2, p. 2: the source says that direct revelation of one observed bundle over another excludes the reverse, with no distinctness clause; it should require the two bundles to differ, since every bundle is directly revealed preferred to itself; affects nothing.
- **Misprint** in Varian, *Revealed Preference* (2006, author's copy) at Theorem 1, condition 3, p. 7: the source says the inequalities hold with a run of garbled letters after them; it should read "for all s, t"; affects nothing.

## For the human reviewers

- **Scope.** The subject is economic theory (topic `math.OC`). The README's sources are two sets of lecture notes (Border), a survey (Varian) and a discussion paper; its References say the primary articles (Richter 1966, Afriat 1967, Samuelson 1938) were not consulted.
- **Licence.** The Fostel–Scarf–Todd text is cited from the Cowles Foundation's own site (`cowles.yale.edu`), a host the sources service could not classify; the published version is paywalled.
- **Not tested.** Wording and arrangement were not compared with Fostel–Scarf–Todd (about 12 of 36 locators, the second largest share); the largest, Border's choice notes, was read in full at its locators.
