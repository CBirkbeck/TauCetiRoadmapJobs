# Review of HilbertModules (pull request #2625 at 5b7542c)

**Verdict:** accepted

**Summary.** Accepted: no finding. The three small corrections of the previous review are repaired and the repairs are sound: the nonunital GNS vector of §3.4 converges by the stated estimate, the pre-imprimitivity completion of §3.5 carries the hypotheses the theorem needs, and §5.10 takes the sheaf Z from the Tau Ceti pin with the right universe. There is one small correction, to the opening paragraph of the pull request's description, and one format note carried over, neither blocking. The human reviewers have the same two licence questions and one unread text as before.

## C01 — The description's opening sentence says the planned mathematics changes only under "What it adds", and its own later sections list more

The first paragraph of the description ends: "Apart from the statements listed under "What it adds", the mathematics it plans is unchanged by this update." A reader who stops there does not learn that targets of the old README left the plan. The description's section on what the pins have says so itself, and the head agrees: norm recovery against the unit ball is now Mathlib's `CStarModule.norm_eq_csSup`, the generic open-cover Čech machinery that the old H5 owned is now a Tau Ceti supplier contract, and §5.10 takes the sheaf Z from `TopCat.locallyConstantSheaf` instead of constructing it (README line 1008–1011). The section "Statements whose content changed" lists eleven further statements.

The sentence would be right as: "Apart from what is listed under "What it adds", "Statements whose content changed" and "What the old README marked as in the library, and what the pins have", the mathematics it plans is unchanged by this update."

## N01 — One Mathlib name is still written without its namespace

`cechComplexFunctor` (Convention 8 at line 107, §5.10 at lines 1000 and 1020, the Layer 5 Dependencies at line 1129, the Mathlib contract at line 1539, and the description) is `CategoryTheory.cechComplexFunctor` at the pin; the bare name does not resolve.

## Previous findings

The previous review raised no finding; its three small corrections and one format note are accounted for here.

- C01 (GNS contract unital only) — repaired: §3.4 names `PositiveLinearMap.gnsNonUnitalStarAlgHom`, takes `ξ_ω` for nonunital A as "the limit in `H_ω` of the classes `[e]`" along the approximate unit, and the contracts name each declaration.
- C02 (sheaf Z already at the pin) — repaired: "The locally constant integer-valued functions Z are Tau Ceti's sheaf of commutative rings `TopCat.locallyConstantSheaf X R` for R = ℤ, lifted to the universe of X"; the Tau Ceti contract names it.
- C03 (pre-imprimitivity completion) — repaired: §3.5 defines the `A₀`–`B₀` pre-imprimitivity bimodule and asks to prove that "its separated completion for the B-valued inner product (§1.2) is an A–B imprimitivity bimodule"; the consumer entry cites it.
- N01 (bare `cechComplexFunctor`) — not repaired: written again above as N01.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §3.4 nonunital GNS vector: `‖[1] − [e]‖² = ω̃((1 − e)²) ≤ 1 − ω(e)` | A = c₀, ω = Σ 2⁻ⁿδₙ, e = 1_{≤N}; C₀((0,1]), ω = δ₁, e(1) = 0.9; unital A | 2⁻ᴺ = 2⁻ᴺ (equality); 0.01 ≤ 0.1; unital: limit of [e] is [1], the pin's `gnsVector` | true: 0 ≤ 1−e ≤ 1 gives (1−e)² ≤ 1−e |
| §3.4 `π_ω(a)ξ_ω = [a]`, `⟨ξ_ω, π_ω(a)ξ_ω⟩ = ω(a)` | general a, e along the approximate unit | ‖[ae] − [a]‖² = ω((ae−a)*(ae−a)) ≤ ‖ae − a‖² → 0; ⟨[e],[a]⟩ = ω(ea) → ω(a) | true |
| §3.4 library inputs | `tendsto_nhds_opNorm`, `gnsNonUnitalStarAlgHom`, `gnsVector`, `approximateUnit` | first: `[NonUnitalCStarAlgebra A]`, limit ‖f‖ along an increasing approximate unit; second nonunital; third `[CStarAlgebra B]`, class of 1; basis 0 ≤ x, ‖x‖ < 1 | present at the pins as described |
| §3.5 pre-imprimitivity completion | Mₙ–ℂ on ℂⁿ; kernel of A → L_B(X); variant without the two bounds | ‖ax‖² ≤ ‖a‖²‖x‖², `_A⟨xb,xb⟩` = \|b\|²xx*; a acting as 0 gives a·`_A⟨x,y⟩` = 0 on a dense span, a = 0; without bounds the A₀-action need not extend | true; the listed hypotheses are those OperatorAlgebraDynamics cites |
| §5.10 sheaf Z | X = ∅; signature at the pin | functions ∅ → ℤ: one element, the zero ring, value 0; pin: `X : TopCat.{u}`, `R : Type u`, `[CommRing R]`, so ℤ needs the lift | true |
| C01 (description) | old targets against the head | norm recovery, generic Čech machinery and Z are no longer targets; eleven statements listed as made more precise | opening sentence too narrow |

The rows for the untouched statements stand as in the previous review, of `14016f0`; `Suggested.lean` is unchanged since that head.

- Library declarations opened at the pins (6): `PositiveContinuousLinearMap.tendsto_nhds_opNorm` (`Mathlib/Analysis/CStarAlgebra/PositiveLinearFunctional.lean`, line 48), `PositiveLinearMap.gnsNonUnitalStarAlgHom` and `gnsStarAlgHom` (`Mathlib/Analysis/CStarAlgebra/GelfandNaimarkSegal.lean`, lines 196 and 246), `CStarAlgebra.approximateUnit` (`Mathlib/Analysis/CStarAlgebra/ApproximateUnit.lean`, line 215), `PositiveLinearMap.gnsVector` (`TauCeti/Analysis/CStarAlgebra/GNS.lean`, line 72), `TopCat.locallyConstantSheaf` and `TopCat.isSheaf_locallyConstantRingCatPresheaf` (`TauCeti/Topology/Sheaves/LocallyConstant.lean`, lines 176 and 90).
- Cross-roadmap citations resolved on main (1807a89), 2: VonNeumannAlgebras V0 supplies states with "unitization/restriction" (its README, line 164–167), which supports "states and their extension to the unitization"; OperatorAlgebraDynamics (line 304–312) expects the pre-imprimitivity completion from Layer 3, now stated in §3.5.
- Source locators: the changed passages add none. The sample target §5.10 falls in the change; its new sentence rests on the Tau Ceti pin, checked above.
- Automatic checks: every check passed. Dependency check output: `depcheck: 182 roadmaps, 2071 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The diff outside the folder is empty.
- Elaboration: `lake env lean` on `Suggested.lean` gives three `sorry` warnings (lines 56, 69, 81) and nothing else; the four elaborated signatures agree with the README as in the previous review.
- Description against the head: 54 numbered sections and 54 *Needs:* lines, 35 Checks lists with 58 bullets, eleven roadmap contracts (all eleven were suppliers of the README on main: none added or dropped), fifteen consumers, four headline bullets in the summary, Lean declarations unchanged; the §3.4, §3.5 and §5.10 entries match the head. One sentence too narrow (C01).

Overlap check: read TracesOnCStarAlgebras, SpectralManifolds, FreeProbability, GeneralizedCohomology and QuantumFoundations (open, by vocabulary), CStarAlgebras, OperatorAlgebraDynamics and OperatorKTheory (main, by vocabulary); the list by results and headings is empty. Ownership stands as in the previous review; the change adds one shared object, the completion of a pre-imprimitivity bimodule, owned here (§3.5) and consumed by OperatorAlgebraDynamics, which attributes it to this roadmap. The sheaf of locally constant functions is Tau Ceti's and is cited, not restated.

Source independence: changed passages only: 3 passages (§3.4 GNS vector, §3.5 pre-imprimitivity bimodule, §5.10 sheaf Z) compared with the 4 cached sources (Rieffel 1988, Hatcher, Kaad–Lesch, Dixmier–Douady), none shared: none of them contains the statements; Raeburn–Williams, which §3.5 cites and which has the largest share of the locators (23 of 62 source mentions in the layers), could not be read. No layer was added, removed or reordered, so the arrangement was not compared again.

Research link: Layer 7's sum criterion (Kaad–Lesch 2012, Theorem 7.10) is, by that paper's §7 (line 1082–1083), the regularity input for the Kasparov product of unbounded modules; Layer 5 is the Dixmier–Douady classification (Dixmier–Douady 1963; Raeburn–Williams 1998). Rests on the Kaad–Lesch text and the README's references.

## Not verifiable

- Raeburn–Williams, *Morita Equivalence and Continuous-Trace C*-Algebras*: paywalled and not in the manifest; the Chapter 3 citation that closes §3.5, which now also covers the pre-imprimitivity completion, was not read. The statement was checked by argument instead (table above).
- Williams, Blackadar, Roe, Teschl and Pierrot: not readable, as in the previous review; the change does not touch the passages that cite them.

## Source issues

- none

## For the human reviewers

- Licence: the README links Roe's notes on a wpmucdn.com host under sites.psu.edu (`TauCetiRoadmap/HilbertModules/README.md`, References); the sources service could not classify it as the author's page.
- Licence: the README links Teschl's book at www.mat.univie.ac.at/~gerald (References); the service refused it because the URL does not name the author. A human can confirm it is Teschl's own page.
- Not tested: Raeburn–Williams has the largest share of the locators (23 mentions). Neither its text nor its table of contents could be read, so wording and arrangement were not compared with it.
