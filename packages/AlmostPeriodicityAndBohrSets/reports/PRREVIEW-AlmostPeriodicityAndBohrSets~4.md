# Review of AlmostPeriodicityAndBohrSets (pull request #3191 at 5b8ff51)

**Verdict:** accepted

**Summary.** Accepted: no finding. The one small correction of the previous review is repaired: step 1 of the proof of 5.5 now takes `W = −A`, with `−A` in the role of the set `A` of 2.2 and `S = A`, and the parameters it states (`μ(S − A) ≤ 1`, `K ≤ 2/α`, `μB/μW ≤ 2/α`, value `1` at `0`, support in `2A − 2A`) were recomputed and hold. There are no small corrections and no format notes. Two points remain for the human reviewers (reused Lean shapes, and the books of Layers 8–10 that could not be read).

## Previous findings

- C01 — repaired: step 1 of 5.5 reads "with `−A` as the set called `A` there, `S = A`, so that `μ(S − A) ≤ 1` and `K ≤ 2/α`, and `B = A + A`, `W = −A`, so that `μB/μW ≤ 2/α`". The repair introduces no new problem.

The previous review had no finding (R) and no format note.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 5.5 proof, step 1: hypotheses of 2.2 | 2.2's `A := −A`, `S := A`, after `μA ≥ α/2`, Haar probability | 2.1 needs `μ(S + A₂.₂) ≤ K μA₂.₂`: `S + (−A) = A − A`, `μ ≤ 1`, `μ(−A) = μA ≥ α/2`, so `K = 2/α ≥ 1` works | holds | none |
| 5.5 proof, step 1: `g = μ_{−A} ⋆ 1_{A+A} ⋆ μ_{−A}` | value at `0`; support; `ℤ/5`, `A = {1}` | `g(0)` = average of `1_{A+A}(a + a')` over `a, a' ∈ A` = `1`; support in `−A + (A+A) − A = 2A − 2A`; `ℤ/5`: `−A = {4}`, `A+A = {2}`, `4+2+4 = 0`, `g(0) = 1` | holds (the earlier `W = A` gave `0`) | none |
| 5.5 proof, step 1: sizes | `B = A + A`, `W = −A`, `ε ≈ 1/L` | `μB/μW ≤ 1/(α/2) = 2/α`, `m = ⌈log(2/α)⌉ ≈ L`; `k ≈ 256e²·L·L² = O(L³)`; `K^k = e^{O(L·L³)} = e^{O(L⁴)}`; `μT ≥ μA/(2K^k) = e^{−O(L⁴)}` | holds | none |
| 2.2 (cited by the change) | reading of `g = μ_A ⋆ 1_B ⋆ μ_W`, `T ⊆ S`, periods in `T⁻¹ * T` | additive form: periods `T − T ⊆ A − A`; matches the use in step 1 and the iteration of 2.3 (`j ≈ L`, error `jδ`) | consistent | none |

The rows for the untouched statements stand as in the previous review, of `2e0cc0a`.

- Source locators checked against the text: none reopened this round; the changed passage is a parameter assignment in the roadmap's own sketch and cites no new locator. Sanders 2012 §3 and Sanders 2013 §§7–8 stand as read in the earlier rounds.
- Library declarations opened at the pins: none; the diff touches no Lean statement and no library name.
- Cross-roadmap citations resolved: the diff touches none; the citation resolver reports none missing (its two unresolved Lean names, the chord set of a Bohr set and the measure convolution notation, are in untouched text passed earlier).
- Automatic checks: all passed. Dependency check: `depcheck: 94 roadmaps, 1056 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: 20 `sorry` warnings, nothing else. The file is unchanged since `2e0cc0a`, so the signature comparison and the one-tactic probe of the previous review stand.
- Pull request text read against this head: no sentence contradicted; the change is inside one proof sketch, adds no supplier and removes no section or declaration.

Overlap check: read FourierAnalyticAdditiveCombinatorics, CompactGroupsPartII, SidonSetsAndLinearEquations, CompactGroups, AmenableGroups, BanachSpaceTheory; compact abelian characters, coefficient and Parseval: owner CompactGroupsPartII §5.1, cited here; Bogolyubov in finite abelian groups: owner FourierAnalyticAdditiveCombinatorics Layer 4, which leaves Bohr sets and Chang's lemma to others; nothing else shared. The diff changes no ownership; the overlap listing reports no dropped id and no other pull request changing this roadmap.

Source independence: changed passages only; 1 passage (step 1 of the proof of 5.5) considered, a parameter assignment that the mathematics forces, not compared again with the text of a source; largest share Sanders2012, 10 of about 25 locators, as in the previous review; the diff adds, removes and reorders no layer, so the arrangement was not compared again (independent in the earlier review). The books cited for Layers 8–10 could not be read.

Research link: Layers 2 and 5–7 are the Croot–Sisask lemma (Croot–Sisask 2010) and the Bogolyubov–Ruzsa and Freiman–Ruzsa bounds of Sanders 2012 and 2013, with Ruzsa's and Green–Ruzsa's modelling; Layer 11 is Følner 1954 and Beiglböck–Bergelson–Fish 2010 per the README's References. Rests on the README and on the five texts read in the earlier rounds.

## Not verifiable

- de Leeuw–Glicksberg 1961 (10.5): no legal copy found in the earlier rounds; not sought again, the diff does not touch it.
- Ruzsa 2009, Theorem 3.5 (7.3): book chapter not held; read only as quoted in Sanders 2012, Lemma 11.2.
- The other texts listed in the earlier reviews (Namioka–Asplund, Følner, Beiglböck–Bergelson–Fish, Grothendieck, Eberlein, Ellis, Namioka, Chang, Bourgain, the books of Layers 8–10, LeanAPAP, openai/math): not sought again; the diff does not touch what they are cited for.

## Source issues

- none

## For the human reviewers

- **Licence.** `BohrSet` in `Suggested.lean` is said to follow LeanAPAP's `BohrSet`, and the description's Provenance paragraph names openai/math at `adc7f124`; both are stated to be Apache-2.0. Neither repository was opened.
- **Not tested.** Layers 8–10 cite three books (Burckel; Berglund–Junghenn–Milnes; Ruppert) that could not be read; wording and arrangement were not compared with them.
