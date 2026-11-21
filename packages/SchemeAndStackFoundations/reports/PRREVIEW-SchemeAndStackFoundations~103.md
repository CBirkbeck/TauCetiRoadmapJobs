# Review of SchemeAndStackFoundations (pull request #2489 at 764265d)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 22 lines changed since `de90162`: §1.22 now states that `Stacks.QCoh X` is abelian for an algebraic stack, which repairs both small corrections of the previous review, and the new sentence was checked against the two Stacks tags it cites and holds. The title and description were read against this head and describe it correctly. One format note remains (the two Mathlib lemmas of §0.9 are still absent from the supplier contracts), not blocking; the licence question on the Knudsen link is still left to the human reviewers.

## N01 — The two Mathlib lemmas named in §0.9 are not in the supplier contracts

`UniversallyClosed.of_comp_surjective` and `IsFinite.of_isProper_of_locallyQuasiFinite` appear in the route and the *Needs:* line of §0.9 (README lines 1301–1310) and nowhere under the Mathlib contracts (near line 467, where `Scheme.IsQuasiAffine` is). Adding them there, with the `AlgebraicGeometry` namespace, would keep that list complete.

## Previous findings

The previous review had no finding (R); its two small corrections and its format note are accounted for here.

- C01 (previous) — repaired: "Prove that `Stacks.QCoh X` is abelian for an algebraic stack `X`, with kernels and cokernels computed on `U` under *QCoh.presentationEquiv* for a presentation `[U/R] ≃ X` with `s, t` flat" (§1.22, lines 3828–3831); §1.22a now cites "(§1.22; Stacks, Lemma 96.15.1 (06WV))" and its *Needs:* line no longer names the gap.
- C02 (previous) — repaired: the description has the bullet "§1.22 now proves that `Stacks.QCoh X` is abelian for an algebraic stack `X` … (Stacks 06WV, 06VZ)", which is what the head states.
- N01 (previous) — not repaired: the two lemma names occur only at lines 1301, 1304 and 1310; written again as N01 above.

## Verified sound

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| §1.22: `Stacks.QCoh X` abelian, kernels and cokernels on `U` for `[U/R] ≃ X` with `s, t` flat | `X` a scheme (`U = R = X`); `X = ∅`; `BG`, `G = ℤ/p` over `𝔽_p`; `BG`, `G = μ_2` | `QCoh(X)`; zero category; `O(G)`-comodules, kernel is the vector-space kernel with induced coaction; `ℤ/2`-graded spaces, kernel graded | Pass; Stacks 06WV (2) has no hypothesis beyond algebraic stack, 06VZ assumes `s, t` flat |
| §1.22: locator "Lemma 96.15.1 (1)–(2) (06WV); Lemma 78.12.6 (06VZ)" | both tags read | 06WV (1): `QCoh(O_X)` ≃ quasi-coherent modules on `(U, R, s, t, c)`; (2): abelian. 06VZ: abelian for flat `s, t`; kernel and cokernel on `U` built in its proof | Pass; "computed on `U`" is from the proof of 06VZ, valid at the stated generality |
| §1.22: "such as §1.20's smooth groupoid presentation" | §1.20 `stack_presentation` (line 3706) | every algebraic stack is `[U/R]` for a smooth groupoid; smooth implies flat, so a flat presentation always exists | Pass; statement not vacuous |
| §1.22 *Needs:* now lists §1.20 | *Needs:* of §1.20 | §1.20 needs §1.7, §1.18–§1.19 only; no reference to §1.22 | Pass; no cycle |
| §1.22a: "Epimorphisms are those of the abelian category `Stacks.QCoh Y` (§1.22; …)" | §1.22 at this head; 06WV (3) | §1.22 states abelian; (3): inclusion into all modules right exact, not exact, as the next sentence of §1.22a says | Pass; previous C01 repaired |
| §1.22a *Needs:* line (3958) | §1.18–§1.22 covers §1.22 | gap reference removed; the statement it stood for is now in §1.22 | Pass |

The rows for untouched statements stand as in the previous review, of `de90162`.

- Source locators read against the text: 2 Stacks tags (06WV, 06VZ), read at the Stacks Project site; the cached extraction of `stacks-project` holds no text.
- Library declarations opened at the pin: none new; the diff names none (`CoGrothendieck` on the *Needs:* line of §1.22 is unchanged).
- Cross-roadmap citations resolved: StackPointsAndResidualGerbes on main, README lines 2118–2127, asks §1.22 for this statement in the same terms and with the same two locators; the head now supplies the abelian part. Its other requests (structure sheaf, tensor product, right exactness of pullback) are not touched by this change.
- Search of main and every open head for an abelian statement on `Stacks.QCoh`: only this roadmap (§1.22) states it; StackPointsAndResidualGerbes cites it.
- Automatic checks: all pass on a rerun. Dependency check output: `depcheck: 170 roadmaps, 2031 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` exits 0 with 48 warnings, all `sorry`. The diff changes no Lean statement, so no signature was compared again and the one-tactic probe was not repeated.
- The pull request's text: title and each sentence of the description read against the diff from the merge base (13 hunks of the README, 4 docstring lines of `Suggested.lean`, one heading added, none removed, no layer changed): each change is stated (§0.9, §1.20, §1.22, §1.22a, §1.23, supplier contracts, the docstring), and no sentence is contradicted by the head. No file changed outside the folder.
- Another open pull request (#2531) changes this README and conflicts with this head; the description states the order (this one first), so nothing is raised.

Overlap check: read StackPointsAndResidualGerbes, AlgebraicModuliForArithmeticGeometry, JacobianChallenge (main), PurityForFlatCohomology, FunctorOfPoints (open) for the changed passages; shared: the abelian structure of `Stacks.QCoh` on an algebraic stack, owned by this roadmap's §1.22 and now stated there (StackPointsAndResidualGerbes asks for it and states nothing itself). Nothing else is shared.

Source independence: changed passages only; 2 passages compared with 1 source (Stacks Project, tags 06WV, 06VZ), none shared; largest share stacks-project, about 810 of about 950 locators; contents not compared again (the diff adds, removes and reorders no layer; the earlier review found them independent). de Jong 1996, Hartshorne 1977, Fulton 1998, Liu 2002 and Knudsen 1983 were not read.

Research link: §1.22a is the notion behind good moduli spaces (Alper 2013) and the étale slice theorem (Alper–Hall–Rydh 2020); §4.15–§4.18 are the inputs of de Jong's alterations (de Jong 1996); §0.24–§0.25 serve the Witt-vector affine Grassmannian (Bhatt–Scholze 2017, Zhu 2017). Rests on the README's sources and the texts read.

## Not verifiable

- The seeded sample (§0.7, §0.16, §0.21, §0.23a, §1.4, §1.17, §1.24, §2.2, §2.4, §3.5, §3.6, §4.4, §4.20, §5.1, §5.4): none of these sections is in or cited by the changed passages, so none was checked in this incremental round.
- de Jong 1996, Hartshorne 1977, Fulton 1998, Liu 2002, Knudsen 1983: as in the previous review; no changed passage cites them.

## Source issues

- none

## For the human reviewers

- **Licence.** The README's link for Knudsen 1983, II (References) points to `journals.msp.org/mscand/…`; the sources service knows no licence class for that host, and the text was not read. Is it a legal copy?
