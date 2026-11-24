# Review of CongruenceModulesOfThetaLifts (pull request #3027 at 374b9ce)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/CongruenceModulesOfThetaLifts/`
**Verdict:** accepted

**Summary.** This is an incremental re-review of 11 changed lines since `71bbefa`. The change rewrites the paragraph on `*Corollary of:*` lines. It says that the general theorem is proved by the roadmap that owns it, that the clauses the line names are deduced from it, and that the route given with the section is a second proof. The text agrees with the family index and with the only such section here, 7.7d:
- the bounds of 7.7d follow from PadicHodgeRegulators §1.5 as stated;
- that section is recorded in the Dependencies and in the supplier contracts.

There is no finding. The previous review's two small corrections and two format notes are in text the change did not touch, and they are carried below. None of them blocks. Two questions remain for the human reviewers, as before: the main source is unrefereed, and the formal proof was not opened.

## C01 — The general form of 7.16a (2) is called both this roadmap's own formulation and "not a statement of this section"

This point is carried from the previous review: the change leaves the passages as they were. An implementer cannot tell whether (2) is to be proved for every definite unitary group of the setting of 7.16, or only when `E/F` is unramified at every finite place and `V` is the standard Hermitian space.

The README gives two readings:
- The Labels paragraph (line 197) and the Origin of 7.16a (line 1879) call that form "this roadmap's own formulation". By the paragraph on statements of the formal proof (line 190), such a form is "proved by the route written here".
- The remark after (3) (line 1928) says it is not a statement of the section.

Either repair would settle it:
- State the general form as a target, with a `*Needs:*` line that cites the remark of BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1.
- Drop it from the Origin and from the Labels paragraph.

## C02 — One sentence of the description does not hold for 7.16a (2)

The description says that where the proof has only a special case of a general theorem, "the section now states the proof's form and the general roadmap the general theorem." In this folder, 7.16a (2) assumes that `E/F` is unramified at every finite place and that `V` is standard. Its general form appears in no general roadmap: it survives only in the remark after (3). The same holds for its supplier BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1. Its statement (line 1255 of that README) makes the same two assumptions, and its general form is likewise only a remark (line 1245).

Adding this sentence would make the description accurate: "In a few sections the general form is kept only as a remark and is stated nowhere as a target, for instance CongruenceModulesOfThetaLifts 7.16a (2) and BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1."

## N01 — Two arXiv preprints from 2026 are called "nearest published results"

This point is carried from the previous review. The Origins of 7.8a (line 1277) and 7.16 (line 1790) use that phrase for Čoupek–Gazaki–Marmora (arXiv:2603.26035) and Bhatt–Gee–Kisin (arXiv:2607.08660). The References list both as arXiv preprints (lines 2374–2380). "Nearest results in the literature" would be accurate.

## N02 — "and on main" in the Dependencies of Layer 7 (line 2026) is process wording

This point is carried from the previous review. "And outside this family" would say the same thing and would not go out of date.

## Previous findings

- None: the previous review (of `71bbefa`) raised no finding. Its small corrections and format notes are accounted for below.
- C01 (small correction) — not repaired. The Labels paragraph still reads "the form of 7.16a (2) in its remark are this roadmap's own formulations" (line 197), while the remark still says "is not a statement of this section" (line 1929).
- C02 (small correction) — not repaired. The description says the general roadmap states the general theorem. 7.16a (2) still assumes `E/F` unramified everywhere and `V` standard, and the general form is still only a remark.
- N01 (format note) — not repaired. Lines 1277 and 1790 still read "nearest published results" before the two 2026 arXiv preprints.
- N02 (format note) — not repaired. Line 2026 still reads "and on main SelmerIwasawaCohomology §§4.9, 4.10, PadicFamilies §1.7 …".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 7.7d, `j_u ≤ n_u·m` deduced from PadicHodgeRegulators §1.5 (the clause the new paragraph says is deduced) | `E_u = ℚ_ℓ` (`n_u = 1`), `m = 1`; jumps `{−1, 2, 3}` | `j_u = dim D_dR/Fil⁰ + dim H⁰ = 1 + 0 = 1 ≤ n_u·m = 1` | holds | none |
| same, with `H⁰ ≠ 0` | `W ⊇ ℚ_ℓ`, jumps `{0, 2, 3}` | `0 + 1 = 1 ≤ 1`, since `dim H⁰ ≤ #zero jumps` at each embedding, so the sum is at most `Σ_τ #{jumps ≤ 0} ≤ n_u·m` | holds | none |
| same, negative control | jumps `{−1, −2, 3}` (a non-low weight that is not positive) | `2 + 0 = 2 > 1`: the positivity of the non-low weights is needed, and 7.7d's route assumes it | holds | none |
| 7.7d, `dim H¹_f(E_ū, W^*(1)) ≤ n_u·m` | `[E_ū:ℚ_ℓ] = 2` unramified, `m = 1`; jumps `{−1, 1, 4}` at both embeddings | `2·1 + 0 = 2 ≤ n_u·m = 2` | holds | none |
| Sign convention of §1.5 against the route of 7.7d ("negative weights count") | `V = ℚ_p(1)` over `K` | `D_dR = K·t⁻¹` and `Fil⁰ = 0`, so `dim H¹_f = [K:ℚ_p]`; this matches §1.5's own Check. The jump `−1` counts | holds | none |
| New paragraph: "*Needs:* lists the route's needs; the deduction needs the named section" | 7.7d | `*Needs:*` = {7.6, 7.7a, 7.7b, SelmerIwasawaCohomology §4.9, SelmerLengthBoundsAndLocalLifting §4.10c(1)}: the route's inputs. PadicHodgeRegulators §1.5 is in the Dependencies (line 2027), the Scope (line 2072) and the contracts (line 2236) | holds | none |
| New paragraph against the family index | index lines 66–71 at head | Both say: proved in the owning roadmap, covered clauses deduced, the Method label gives the formal proof's form. Only this README adds the "second proof" clause, which is consistent with 7.7d | holds | none |
| 7.16a (2), general form (C01, C02) | Labels paragraph, Origin, remark; §16.1 at head | Line 197 says "own formulation" and line 1929 says "not a statement". §16.1 (line 1255) assumes `[E⁺:ℚ] ≥ 2`, unramified everywhere and the standard form | inconsistent wording; no result touched | C01, C02 |

The rows for the sampled targets and the headline theorems stand as in the previous review, of `71bbefa`: the change touches no statement.

- Source locators: the changed paragraph cites no source. PadicHodgeRegulators §1.5 was opened on main (its README, line 161): the dimension formula for de Rham `V` over a finite `K/ℚ_p`, with its Checks. No locator in the README is flagged as unverified.
- Library declarations: none opened. `Suggested.lean` declares nothing and is unchanged since `71bbefa`.
- Cross-roadmap citations resolved:
  - PadicHodgeRegulators §1.5, on main.
  - BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1, at this head (line 1239).
  - SelmerLengthBoundsAndLocalLifting: line 917 at this head and lines 789–793 on main, which cite the same §1.5.
  - The family index (lines 66–71), at this head.
- Automatic checks: the worker's checks all passed. The dependency check prints `depcheck: 132 roadmaps, 1481 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no warnings. With no declarations, there was no `#check` to compare.
- Files changed outside the folder: none beyond the folders the pull request owns. `git diff origin/main...HEAD`, with those folders excluded, is empty.
- Overlap check: read SelmerLengthBoundsAndLocalLifting and ThetaChainsOnDefiniteUnitaryGroups (from the list on main), ThetaLiftsForDefiniteUnitaryGroups (open) and LengthBoundsInPadicFamilies (results). The one object the change bears on is the Bloch–Kato dimension formula. Its owner is PadicHodgeRegulators §1.5 on main, and both this roadmap (7.7d) and SelmerLengthBoundsAndLocalLifting cite it. The other shared objects stand as in the previous review.
- Overlaps: no other open pull request changes this roadmap, drops an id it cites or defines one only it cites.
- Source independence: changed passages only. One passage was compared (the convention on `*Corollary of:*` lines), which paraphrases no source. The largest share of the locators is [FormalProof], 128 of 139, unchanged. The contents were not compared, since no layer was added, removed or reordered.
- Research link: the targets bound congruence modules of theta lifts between definite unitary groups. They follow Hida (1981, 1986) and Ribet (1976), Bloch–Kato (1990), Bellaïche–Chenevier (2009) and weight elimination (Emerton–Gee–Herzig 2013; Le–Le Hung–Levin 2019), as steps of Alpöge's announced proof of GRH for Dirichlet L-functions (2026). This rests on the README's summary and References.

## Not verifiable

- Bloch–Kato (1990), Corollary 3.8.4, cited in the Origin of 7.7d: the Grothendieck Festschrift is paywalled and is not in the sources cache. The deduction in 7.7d was checked against PadicHodgeRegulators §1.5 instead.
- Yamana (2014), Theorem 10.1 (2), cited in the Origin of 7.5a: it is paywalled, as before.
- The *Method of the formal proof* labels: they describe [FormalProof], which was not opened.

Automatic checks set aside as false positives: the check that a pull request changes nothing outside the roadmap folder under review (an edit elsewhere would reach other roadmaps unreviewed), run by hand on this folder alone, lists 118 changed files. Every one lies in another folder this pull request owns and reviews separately, so none is a change outside the pull request's own folders; when those folders are counted as its own, the check passes.

## Source issues

- none

## For the human reviewers

- Scope: 12 of the 20 sections are labelled "particular to this proof". Their only references are [FormalProof] (a Lean repository) and [Announcement] (Alpöge, 20 November 2026), and neither of them is refereed (README, References).
- Not tested: [FormalProof] holds 128 of the 139 locators and was not opened. The wording and arrangement checks and the Method labels were not compared against it.
