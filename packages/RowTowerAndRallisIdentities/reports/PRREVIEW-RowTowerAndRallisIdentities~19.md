# Review of RowTowerAndRallisIdentities (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RowTowerAndRallisIdentities/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 30 lines changed since `3bddf73`; no statement changed and no finding remains, so the folder is accepted. The rewording of the J.-S. Li ranges in 5.5, 5.6 and 5.8g is correct, and the corrected credit in 5.8f was read in the formal proof at the cited commit: the three declarations, their files and their two hypothesis bundles are as stated. One small correction: the same range of commits widened VonNeumannAlgebras V9.IntegrableDiscreteSeries to every unimodular locally compact group, so the three lines of this folder that were edited to describe it as second-countable now describe it more narrowly than it is. Two format notes are carried over unchanged. For the human reviewers: Barnes (1980) is still unread.

## C01 — Three passages describe VonNeumannAlgebras V9.IntegrableDiscreteSeries as a statement for second-countable groups; at this head that section is stated for every unimodular locally compact group.

A reader of 5.2a is told that the supplier has exactly the generality of this section, and an implementer who needs the projector for a group that is not second-countable would conclude that no roadmap states it. At this head V9.IntegrableDiscreteSeries opens "Let G be a unimodular locally compact group with a fixed Haar measure" (`TauCetiRoadmap/VonNeumannAlgebras/README.md`, line 2534; "second-countable" was removed there after the previous review), while 5.2a keeps "unimodular second-countable locally compact group" (line 522). Against this: the Origin of 5.2a says the supplier "states it, with its source, in the same generality (Barnes proves it without second countability)" (lines 507–508); the parenthesis of the `*Corollary of:*` line gives the supplier's statement for a "unimodular second-countable locally compact group" (line 518); and so does the contract under From TauCetiRoadmap.VonNeumannAlgebras (line 2640). The deduction is unaffected: 5.2a is the case of a second-countable group, and the parenthesis states a true consequence of the supplier.

Smallest change: in the Origin, "states it, with its source, for every unimodular locally compact group, and this section is its case of a second-countable group" (the sentence the previous head had, which is now true); and drop "second-countable" from the `*Corollary of:*` parenthesis and from the contract line, which describe the supplier.

## N01 — "*Sources:* ingredients (Rallis; Hecke)" in 5.6 (line 960) and "*Sources:* ingredients (Shimura; …)" in 5.11 (line 2291) keep the word "ingredients" from the tag they replace; "*Sources:* (…), for the ingredients" would read like the other sections.

## N02 — Several Origin labels that call a statement published or adapted name a work without a theorem or section number: Wallach (1984) and DeGeorge–Wallach (1978) in 5.3, J.-S. Li (1990) in 5.2, J.-S. Li (1992) in 5.5–5.7 and 5.8g, and Shimura, Deligne, Milne and Harris in 5.10a. A number for each, as 5.2a gives for Barnes and 5.3 for Muić, would let a reader check the attribution.

## Previous findings

The previous review raised no finding (no R-numbered remark). Its two small corrections and two format notes, at this head:

- C01 (supplier generality in 5.2a) — partly repaired: the three lines were edited as suggested, but the supplier was widened in the same range of commits, so they now understate it; C01 above.
- C02 ("Weil's convergent range" for J.-S. Li) — repaired: 5.5 and 5.6 read "in the range `dim Y_1 > 2 dim Y_0` of the step `i = 0`"; 5.8g "for the first step of the column, whose larger rank exceeds twice the smaller".
- N01 — not repaired: N01 above.
- N02 — not repaired: N02 above.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 5.5, 5.6 Origin: Li (1992) in the range `dim Y_1 > 2 dim Y_0` at step 0; GQT at `i ≥ 1` | `m=4, k=8, r=11, f=4, t=313` | ranks `11, 324, 637, 950, 1263`; step 0: `324 > 22`; step 1: `637 ≤ 648`, so inside `n < m ≤ 2n` | holds | none |
| 5.8g Origin: first core step "larger rank exceeds twice the smaller", later steps at most twice | base rank `r+1 = 12`, step `r+5 = 16`, `m = 4` | ranks `12, 28, 44, 60, 76`; `28 > 24`; `44 ≤ 56`, `60 ≤ 88`, `76 ≤ 120` | holds | none |
| 5.2a `*Corollary of:*` and Origin against V9.IntegrableDiscreteSeries | hypotheses side by side at this head; `𝕋` with `σ = z^n`; a discrete uncountable group | supplier: unimodular; 5.2a: unimodular, second-countable; `𝕋`: `∫ z^{−n}ρ(z)dz` projects on the `z^n`-part; uncountable discrete group: in the supplier's scope only | deduction holds; description of supplier too narrow | C01 |
| 5.8f credit: `sums_mem_bottomField` under the two bundles, quotients in a number field | [FormalProof], `BottomFieldIsNumberField.lean` l. 18–21 at commit `40e56bab` | premises `ThetaLocalInputs` and `∀ D, NormSum.Inp D`; conclusion: `M` with `FiniteDimensional ℚ M` and `SumsIn W (algebraMap M ℂ) X` for a bottom triple | holds | none |
| 5.8f credit: `bottom_classSums_algebraic`, `bottom_twistedClassSums_algebraic` | `ClassSumKernelIsAlgebraic.lean` l. 100; `BottomTwistedClassSumsAlgebraic.lean` l. 42; proof of `sums_mem_bottomField` l. 22–25 | both applied to `hP hI hL hX`, one for `X.I`, one for `X.I'`: the two integrals of (L7) | holds | none |
| 5.8f credit: "both of which it supplies where it applies them" | `NormSum.inp_all`; `published_results_first`; `CharacterBoxes/MainConclusion.lean` l. 8 | `inp_all : ∀ D, Inp D` is a theorem; `ThetaLocalInputs` is built from the literature bundle, itself constructed in the main conclusion | holds | none |
| 5.8f: the names the diff removes | declaration index of the proof | `sumsIn_bottom` and `bottom_triangle_period_algebraic`: absent; the three new names: present as theorems | correction true | none |
| Headlines (1)–(3) | module docstring of `Suggested.lean`; elaboration | none statable at the pins; each named with the carriers it lacks; no declaration, so no probe applies | holds | none |

The rows for the untouched statements stand as in the previous review, of `3bddf73`.

- Source locators checked against the text: 3 files and 5 declarations of [FormalProof] at commit `40e56bab` (all three paths exist there); the seeded sample falls in the changed passages only at 5.6 (Origin) and 5.8f, both covered above.
- Cross-roadmap citations resolved at this head: VonNeumannAlgebras V9.IntegrableDiscreteSeries (lines 2534–2545); ThetaChainsOnDefiniteUnitaryGroups §§2.5, 3.3 as cited in the 5.8f passage (unchanged).
- Library declarations opened: none needed (`Suggested.lean` declares nothing; the diff names no library declaration).
- Dependency check: `depcheck: 122 roadmaps, 1403 edges, 0 problem(s)`; no upward or cyclic line.
- Elaboration of `Suggested.lean`: no message, exit 0. The `#check` comparison of signatures does not apply: the file has no declaration.
- The automatic checks, run again with the board's merge-order file: every text check 0; the only count is the 130 paths outside this folder, all in the folders and family indexes the pull request owns.
- Changes outside roadmap folders against `main`: none.
- Overlap check: read ThetaChainsOnDefiniteUnitaryGroups, SeesawForThetaChains, GluedTargetAndDivisionInequality (as in the previous review; the diff adds no object); the projector of 5.2a is owned by VonNeumannAlgebras V9.IntegrableDiscreteSeries, cited; nothing else shared.

Source independence: changed passages only; 5 passages compared with 2 sources ([FormalProof], three Lean files; VonNeumannAlgebras V9 as the cited supplier text), none shared (the passages give declaration names and paths, not text); largest share [FormalProof], 94 of about 116 locators; arrangement not compared (no layer added, removed or reordered).

Research link: 5.5–5.7 and 5.8g are cases of the Rallis inner product formula (Rallis 1984; J.-S. Li 1992; Gan, Qiu and Takeda 2014) and 5.2 of the tower property (Rallis 1984; Wu 2013), for the unitary theta chains of Alpöge's formal proof of GRH for Dirichlet L-functions (2026). Rests on the README's Origin labels and GanQiuTakeda14 §§1.7, 11.4.

## Not verifiable

- Barnes (1980), Lemma 1 and Proposition 1 (5.2a): not in the sources cache; cited through a publisher DOI, and no legal copy was looked for beyond it. That Barnes needs no second countability is taken from the supplier's own source parenthesis.
- J.-S. Li (1992): cited by work only, with no locator; the range `dim Y_1 > 2 dim Y_0` attributed to it was checked for consistency with the chain's ranks, not against the paper.
- The pull request's description is cut short where it was read and does not name this folder in the part read; nothing in that part is contradicted by the change.

## Source issues

- none

## For the human reviewers

- The two recorded decisions concern sections that leave a family roadmap; this folder removes none, so neither was needed here.
- Licence: Barnes (1980), Proc. Edinburgh Math. Soc. 23, backs 5.2a and VonNeumannAlgebras V9.IntegrableDiscreteSeries; no legal copy was read, so Lemma 1 and Proposition 1 are unchecked.
- Not tested: the source with the largest share of locators is [FormalProof], an unrefereed Lean formalisation announced 2026-11-20 and published without a licence; only the three files of the changed 5.8f credit were read this round.
