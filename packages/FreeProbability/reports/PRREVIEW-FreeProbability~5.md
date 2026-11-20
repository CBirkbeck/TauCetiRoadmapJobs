# Review of FreeProbability (pull request #2575 at e462df3)

**Verdict:** accepted

**Summary.** Accepted: there are no findings. This is an incremental re-review of the 13 lines added since `37bca01`, a table in Scope and ownership that maps the former labels F1–F8 to Layers 1–8; the mapping is correct against the roadmap on main, and every citation of this roadmap by another roadmap on main uses one of those eight labels. No statement changed, and the description of the pull request already states the mapping. There are no small corrections and seven format notes, all carried over from the previous review, none blocking. Two points remain for the human reviewers: Nica–Speicher, the source cited most, could not be read, and the licence of a linked external formalization was not checked.

## N01 — The geodesic characterization of §2.2 is inside Speicher's Remark 7.6, not after it

README line 260 and the References entry say "p. 85, after Remark 7.6". The remark begins on p. 84 and runs to the statement in question on p. 85 (Spe19 lines 3459–3482); "Remark 7.6, p. 85" finds it.

## N02 — In §4.5, "C*-algebras, not necessarily unital" can be read as contradicting the unital hypothesis

README line 710. It is the inclusion that need not be unital (Blanchard–Dykema, Theorem 1.3, BD99 line 207); "a not necessarily unital inclusion `B ⊆ B̃` of unital C*-algebras" would say so.

## N03 — Several targets cite a range of Nica–Speicher lectures, not a numbered result

"Lectures 1–7" in §§1.1, 1.2, 6.1 and 6.3 (README lines 138, 153, 183, 1001, 1036) and "Lectures 16–18" in Layer 5 (lines 809, 898, 918, 940, 963), including the headline `sSeries_momentSeries_mul`. A theorem number would let a reader find each statement.

## N04 — The first Example of Layer 1 cites one lemma for two identities

README lines 198–199: `TauCeti.IsFreelyIndependent.apply_mul_mul_mul_of_ne` gives `φ(abab) = 0`; the identity `φ(a²b²) = φ(a²)φ(b²)` is `TauCeti.IsFreelyIndependent.apply_mul_of_ne`.

## N05 — The second Check of §5.3 uses `F(w) = w/(1 − cw)` without defining `F`

README line 884. It is `G(1/w)`; in §6.2 the same letter is the distribution function.

## N06 — The hypothesis `hs` of `tendsto_integral_trace_gueMatrix_word` is not used by its conclusion

`Suggested.lean` line 201. It is harmless and matches the README's "selfadjoint standard semicircular elements"; a clause in the docstring would say why it is kept.

## N07 — §8.7 says "limiting laws" without saying in which sense

README line 1478. The route is by moments, so "whose normalized-trace moments converge to those of `μ`, `ν`" would match it.

## Previous findings

The previous review, of `37bca01`, had no findings (no R01) and no small corrections. Its seven format notes concern text this change does not touch:

- N01–N07 — not repaired: the passages read as before; carried as N01–N07 above, none blocking.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| The table "Former label → Now" (Scope and ownership, README lines 1659–1670) | the eight `## Fk.` headings of the README on main against the eight `## Layer k:` headings at this head | titles agree pairwise for k = 1,…,8 (F3 "Hilbert free products, Fock space, and operator algebras" ↔ Layer 3; F8 "Gaussian and Haar random-matrix asymptotic freeness" ↔ Layer 8); 8 rows, 8 layers | correct; agrees with the sentence opening "How to read the build" (line 57) |
| Citations that the table serves | all citations "FreeProbability F…" on main: CategoricalOperatorAlgebras (F2, F3–F4), FactorRigidity (§§F3–F4), IntegralHeckeAndGaloisDeterminants (§F8), OperatorAlgebraDynamics (F3), QuantumGroups (F1, F3, F6), Subfactors (F3–F4) | every cited label is one of F1–F8; none cites a sub-label; cited content found at §§3.4–3.7, 3.6, 4.4–4.6, 8.4 | all resolve through the table |
| §3.6 norm `2√3` on `F₂` (cited as "F3" by OperatorAlgebraDynamics and QuantumGroups) | `F₂` (4-regular tree); `F₁ = ℤ` (2-regular) | `2√(4−1) = 3.464… < 4`, so the full and reduced norms differ; `2√(2−1) = 2 = ` degree, no obstruction for ℤ | holds, as the Check of §3.6 says |

The rows for untouched statements stand as in the previous review, of `37bca01`.

- **Source locators checked against the text:** none new: the change adds no locator and no statement. The sections of the seeded sample are untouched; their locators stand as checked at the earlier heads.
- **Library declarations opened at the pins:** none new: the change names no declaration.
- **Cross-roadmap citations resolved:** the change adds none outward; inward, 23 lines in six roadmaps on main cite labels F1–F8 and all are covered by the table.
- **Automatic checks:** every check passed when run again on this head. Dependency check: `depcheck: 182 roadmaps, 2073 edges, 0 problem(s)`, no UPWARD or CYCLE line. Nothing changed outside the folder.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives eight `sorry` warnings and nothing else; the file is unchanged since `37bca01`, so the binder comparison and the one-tactic probes of the previous review stand.
- **Headlines:** unchanged: eight theorems, three not statable ones named in the module docstring.
- **Pull request text:** read against this head. Its sentence "Other roadmaps cite this one as "FreeProbability Fk"; that resolves to Layer k" describes the new table; the counts and lists verified at `37bca01` are untouched. Nothing to correct.

Overlap check: read RandomMatrices, AmenableTracesOnCStarAlgebras, OperatorAlgebraDynamics, OperatorKTheory and Subfactors (scopes as read at the earlier heads; the change adds no object and moves no ownership). RandomMatrices §§6.2–6.5 owns the bounded scalar core and is cited; this roadmap owns the F₂ norm obstruction and the full Fock space; nothing else shared. The overlap listing reports no dropped id at this head.

Source independence: changed passages only: 1 passage (the table of former labels) compared with 0 sources, since it states no mathematics and cites none; largest share Nica–Speicher, 35 of about 94 citations, text not readable; no layer added, removed or reordered, so the arrangement stands as compared earlier: independent.

Research link: Layers 3–4 build the reduced and amalgamated free products of Voiculescu and of Blanchard–Dykema (1999), with Dykema's faithfulness theorem (1997), which FactorRigidity and Subfactors consume; Layer 8 states asymptotic freeness without norm bounds (Collins 2002) and the Weingarten asymptotics (Collins–Śniady 2004). Rests on the sources read and the README's References.

## Not verifiable

- Nica–Speicher, *Lectures on the Combinatorics of Free Probability* (Cambridge University Press, 2006): no legal copy; the changed passage does not cite it.
- Biane, *Some properties of crossings and partitions* (Discrete Math. 175, 1997): paywalled; the changed passage does not cite it.

## Source issues

- none

## For the human reviewers

- Not tested: Nica–Speicher, the source cited most (35 of about 94 citations in `TauCetiRoadmap/FreeProbability/README.md`), has no legal copy. Wording was not compared with it; arrangement was compared with its public table of contents only.
- Licence: Scope and ownership (README lines 1651–1656) links an external Lean project (SemicircleLaw on GitHub) and a Zulip thread as related formalizations. `Suggested.lean` was not compared with that repository and its licence was not read.
