# Review of SchemeAndStackFoundations (pull request #2489 at 764265d)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of 0 changed lines since `764265d`; the round reads the pull request's title and description against the head, and every sentence of them agrees with the folder's change from the merge base (§0.9, §1.20, §1.22, the new §1.22a, §1.23, the supplier contracts, four docstring lines of `Suggested.lean`). One format note is carried over (the two Mathlib lemmas of §0.9 are absent from the supplier contracts), not blocking; the licence question on the Knudsen link is still left to the human reviewers.

## N01 — The two Mathlib lemmas named in §0.9 are not in the supplier contracts

`UniversallyClosed.of_comp_surjective` and `IsFinite.of_isProper_of_locallyQuasiFinite` appear in the route and the *Needs:* line of §0.9 (README lines 1301–1310) and nowhere under the Mathlib contracts (near line 467, where `Scheme.IsQuasiAffine` is). Adding them there, with the `AlgebraicGeometry` namespace, would keep that list complete.

## Previous findings

The previous review had no finding (R) and no small correction; its one format note is accounted for here.

- N01 (previous) — not repaired: the two lemma names occur only at README lines 1301, 1304 and 1310 and not under the Mathlib contracts; written again as N01 above.

## Verified sound

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| Description: linear reductivity "for an affine group of finite type over a field … equivalent to the complete reducibility" against §1.22a *Groups.isLinearlyReductive_iff* | `ℤ/p` over `𝔽_p`; `μ_p` over `𝔽_p`; `𝔾_a` on `k²` | invariants of `𝔽_p[ℤ/p]` are `𝔽_p·N`, augmentation sends `N` to `p = 0`: not exact, not completely reducible; `μ_p`: graded pieces, exact, reducible; `𝔾_a`: `ke₁ → 0` | Pass; both sides agree in each instance, text and head match |
| Description: "§0.9 adds integrality of the base to `integral_point_descent`" against README lines 1296–1299 | `S = Spec(k × k)` (Noetherian, normal, not integral); `S = Spec ℤ` | no function field for `k × k`, so the statement needs "integral"; `Spec ℤ`: `K = ℚ`, `S' = Spec O_L`, `ℚ`-rational `O_L`-point lies in `X(ℤ)` | Pass; head states "Noetherian, normal and integral" |
| Description: "§1.20 now defines … quasi-separated when its diagonal is quasi-compact and quasi-separated (Stacks 04YW)" against README lines 3668–3671 | a scheme morphism; `BG → Spec k`, `G` finite type | scheme: diagonal an immersion, separated, so condition is quasi-compact diagonal; `BG`: diagonal fppf-locally `G`, quasi-compact and quasi-separated | Pass; head has the same definition and locator |
| Description: "§1.22 now proves that `Stacks.QCoh X` is abelian … `[U/R] ≃ X` with `s, t` flat (Stacks 06WV, 06VZ)" against README lines 3828–3831 | `X` a scheme (`U = R = X`); `B μ_2` | `QCoh(X)`; `ℤ/2`-graded spaces, kernels graded | Pass; same statement and the same two tags at the head |
| Description: "`Suggested.lean` changes only in its docstring" | diff of the file from the merge base | 4 lines added, all inside the module docstring (lines 39–42); 0 declarations added, removed or restated | Pass |
| Summary block: "retain six layers"; "Existing Lean statements and headline goals remain unchanged" | README `## Layer` headings at both ends; headline list of the opening | Layers 0–5 at the merge base and at the head, none retitled; Nagata, Keel–Mori, duality, Picard torsors, algebraization, alterations, Riemann–Roch, Hodge index, Weil bound all present | Pass |

The rows for untouched statements stand as in the previous review, of `764265d`.

- The pull request's text: the title and every sentence of the description (summary block and prose) read against the 13 README hunks and the one `Suggested.lean` hunk of the change from the merge base; no sentence contradicted; one heading added (§1.22a), none removed or renumbered, no declaration removed, no roadmap supplier added or dropped, and the text says it is a revision. No file changed outside the folder.
- Cross-roadmap claims of the description resolved on main: StackPointsAndResidualGerbes README lines 2094–2100 ask §1.20 for quasi-separated morphisms by the diagonal (Definition 101.4.1), and lines 2118–2127 ask §1.22 for the abelian statement in the same terms; both sentences of the description are true.
- Library declarations opened at the pin: `UniversallyClosed.of_comp_surjective` (Mathlib `AlgebraicGeometry/Morphisms/UniversallyClosed.lean` line 75) and `IsFinite.of_isProper_of_locallyQuasiFinite` (Mathlib `AlgebraicGeometry/ZariskisMainTheorem.lean` line 373), for N01.
- Source locators read against the text: none this round (the folder did not change).
- Automatic checks: all pass on a rerun. Dependency check output: `depcheck: 10 roadmaps, 100 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` exits 0 with 48 warnings, all `sorry`. No Lean statement changed, so no signature was compared again and the one-tactic probe was not repeated.
- Another open pull request (#2531) changes this README and conflicts with this head; the description's merge-order block states the order (this one first), so nothing is raised.

Overlap check: read StackPointsAndResidualGerbes, ModularCurves, JacobianChallenge (main), PurityForFlatCohomology, FunctorOfPoints (open) as in the previous review, no folder text having changed; shared: the abelian structure of `Stacks.QCoh` and quasi-separated morphisms of stacks, both owned by this roadmap (§1.22, §1.20) and only asked for by StackPointsAndResidualGerbes. Nothing else is shared.

Source independence: changed passages only; the folder has no changed passage, so 0 passages compared with 0 sources; largest share stacks-project, about 810 of about 950 locators; contents not compared again (no layer added, removed or reordered; the earlier review found them independent). de Jong 1996, Hartshorne 1977, Fulton 1998, Liu 2002 and Knudsen 1983 were not read.

Research link: §1.22a is the notion behind good moduli spaces (Alper 2013) and the étale slice theorem (Alper–Hall–Rydh 2020); §4.15–§4.18 are the inputs of de Jong's alterations (de Jong 1996); §0.24–§0.25 serve the Witt-vector affine Grassmannian (Bhatt–Scholze 2017, Zhu 2017). Rests on the README's sources and the texts read.

## Not verifiable

- The seeded sample (§0.8, §0.18, §0.25, §1.2, §1.12, §2.1, §2.6, §2.7, §2.8, §2.11, §2.12, §4.5, §4.12, §4.15, §5.11): the folder did not change since the head the previous review read, so no sampled section lies in a changed passage and none was checked in this incremental round.
- de Jong 1996, Hartshorne 1977, Fulton 1998, Liu 2002, Knudsen 1983: as in the previous review; not read.

## Source issues

- none

## For the human reviewers

- **Licence.** The README's link for Knudsen 1983, II (References) points to `journals.msp.org/mscand/…`; the sources service knows no licence class for that host, and the text was not read. Is it a legal copy?
