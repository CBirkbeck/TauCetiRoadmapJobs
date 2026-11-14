# Review of BorelEquivalenceRelations (pull request #1616 at b4d6f21)

**Verdict:** needs changes

## R01 (P3) — The description presents the widened Alexandrov converse as unchanged

**Location:** Description, *Other content changes*: "Alexandrov's converse keeps the roadmap's `T6` form."

**Claim:** This is the previous review's R03. The description has not changed since `6ca8a4f`. On main the converse is stated for a metrizable ambient space; this head widens it to `T6` spaces. A reader of the description cannot tell that the statement changed.

**Witness:** Main `Suggested.lean:76–77` states `isGδ_of_polishSpace_subtype` with `[TopologicalSpace.MetrizableSpace X] … [PolishSpace s]`. Head `README.md:266` reads "a subset of a `T6` space (in particular of a metrizable space)".

**Repair:** Replace the bullet with: "Alexandrov's converse is widened from a metrizable to a `T6` ambient space. It is consumed from `TauCeti.isGδ_of_isCompletelyMetrizableSpace`, which is stated for perfectly normal Hausdorff spaces; `T6Space` supplies both hypotheses by instance search. The forward direction is Mathlib's `IsGδ.polishSpace`."

## Previous findings

- R01 — repaired: `README.md:631–633` "(B. D. Miller, *Forceless, ineffective, powerless proofs*, Lecture I, Exercise 16 (Souslin), p. 8, …)"; 702–703 "(Harrington–Kechris–Louveau 1990, Corollary 1.2, p. 905, for Gδ relations …)"; URL at 927; 943 "and, by Corollary 1.2, for 5.2".
- R02 — repaired: `README.md:58` "| Layer | Covers |"; 67–69 "Tau Ceti implements every item of the *Covers* column except the perfect set theorem for analytic sets (4.2) and the smoothness of closed relations (5.2)"; 803–805 rewritten.
- R03 — not repaired: the description still reads "Alexandrov's converse keeps the roadmap's `T6` form." This is R01 above.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| 4.2 `AnalyticSet.exists_nat_bool_injection_of_not_countable` against Miller Ex. 16 (`README.md:628–635`) | `A = ℚ ⊆ ℝ`; `A = ℝ∖ℚ` | ℚ: Ex. 16 alternative (1), and `hunc` fails. ℝ∖ℚ: alternative (2) for the subspace gives a Cantor copy inside `A` | target is Ex. 16 (2) for `↥A`: agrees |
| 4.2, subspace transfer | `↥A` as a space; maps into `↥A` versus into `X` | `↥A` is a continuous image of `ℕ → ℕ` (Miller's ω-Souslin). Continuity into `↥A` is continuity into `X` with range in `A` | "for the subspace `A`" is correct; `[T2Space X]` matches Miller's Hausdorff hypothesis |
| 4.2, probes | `exact?` with the target out of scope; `simp_all` | `exact?` cannot close the goal; `simp_all` makes no progress | not padding |
| 5.2 `isSmooth_of_isClosed` against HKL Cor. 1.2 (`README.md:701–706`) | `\|x\| = \|y\|` on ℝ; closed against Gδ | closed in the metrizable `X × X`, hence Gδ, hence smooth by Cor. 1.2; `\|·\|` reduces it to equality on ℝ | HKL's smoothness (a Borel separating family) is `Setoid.isSmooth_iff_countablySeparated`: agrees |
| 5.2, negative controls | E₀ on `ℕ → Bool`; Vitali on ℝ | both dense, both meagre in the square (`TauCeti.isMeagre_eZero`; countable sections), so not Gδ (a dense Gδ is comeagre); both not smooth | consistent with Cor. 1.2 |
| 5.2, probes | `exact?` with the target out of scope; `simp [Setoid.isSmooth_iff_countablySeparated]` | `exact?` fails; `simp` leaves `MeasurableSpace.CountablySeparated (Quotient E)` | not padding |
| Scope paragraph, `README.md:67–71` | 12 *Covers* items across Layers 0–5; the two exceptions | all 12 at the pin (bullet below); neither exception is at either pin | true |
| Kind 3 against 67–71 and 803–807 | the lists at 224–233, 69–70 and 804–805 | each gives 4.2, 5.2 and worked examples 3, 5 and 8; example 5 uses Mathlib `QuotientAddGroup.leftRel` with Tau Ceti `Setoid.IsSmooth` | consistent; no private carrier (819–820) |
| Description against head (R01) | Alexandrov converse | main: `[MetrizableSpace X]`; head: `T6` | widened, not kept |

Rows for the untouched statements stand as in the previous review, of `6ca8a4f`.

- **Gate and dependency check.** The gate at `b4d6f21` reports every counter 0 and `OK`. The dependency check reports `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing changed outside the folder, and `Suggested.lean` is byte-identical to `6ca8a4f`.
- **Elaboration.** `lake env lean` gives two `declaration uses sorry` warnings and nothing else. `#check @` of both theorems matches `README.md:628–630` and 701–702; no binder is lost.
- **Source locators.** Two were checked against the text:
  - `Miller-Lectures` lines 299–302: Ex. 16 on printed p. 8, from the author page.
  - `HKL1990` lines 106–108: Cor. 1.2 on p. 905, proved from Thm. 1.1 at lines 727–728, from the AMS open backfile.
- **Tau Ceti declarations opened at `2fd255d9`.**
  - `Instances/CantorSpace.lean:370` (`flipAt`)
  - `Polish/Graph.lean:77`, `MeasurableSpace/Card.lean:38`, `Data/Set/Countable.lean:53`
  - `BaireMeasurableMap.lean:122`, `BorelColoring.lean:185`, `InvariantSeparation.lean:117`
  - `SmallFamily/Basic.lean:258`, `WitnessExtension.lean:90`, `GZeroDichotomy.lean:382`
  - `Silver.lean:163,184`, `EZero.lean:162`
- **Seeded sample.** Of the 15 sampled targets, 4.2 and 5.2 fall in the changed passages and were checked as above. The other 13 are unchanged and carry no locator; they stand as checked against their pinned declarations in the previous review.

Overlap check: read CountableStructureSpaces, CountableModelCounting, HanfNumbers, RandomGraphs, InfinitaryLogic and InfinitaryModelExistence. Nothing is shared. A grep of main and every open head for the two open targets finds only this roadmap; FiniteEquivalenceRelations's closed equivalence relations are on schemes.

Source independence (changed passages only): 4 passages compared (`README.md:67–71`, 628–635, 701–706, 803–807) with 2 sources (`Miller-Lectures`, `HKL1990`). The longest shared run is 5 words ("equivalence relation on a Polish space"), which the statement forces. The largest share of the locators is `Miller-Lectures` and `HKL1990`, 1 of 2 each. The contents were not compared again, since no layer was added, removed or reordered.

## Not verifiable

- **References without locators.** Kechris 1995, Gao 2009, KST 1999, Miller 2012, Silver 1980, Burgess 1978, Kuratowski–Ulam 1932 and Mycielski 1964 were not fetched: the README gives no locator in them to check.
- **Provenance.** Revision `518a366` of `cameronfreer/infinitary-logic`, and the Provenance table's claims about it, were not opened.
- **Integration build.** The description's integration build `73a55196` cannot be reproduced from this worktree.

## Source issues

- **Misprint** in Miller-Lectures at Lecture I, Exercise 15, p. 8: the source says the derivative can be eliminated "at the expensive of" invoking countable choice; it should be "at the expense of"; affects nothing.

## For the human reviewers

- **Licence.** `Miller-Lectures` is marked "DRAFT" and hosted under `/unpublished/` on the author's page. It is the only locator for 4.2 (`README.md:631`).
- **Licence.** `README.md:880–893` names `cameronfreer/infinitary-logic` (Apache-2.0, `518a366`) as the proof-script source for most layers and asks ported files to credit it. The repository was not opened. Its rows 0.4 and 5 (900, 910) list neither statement of `Suggested.lean`.
