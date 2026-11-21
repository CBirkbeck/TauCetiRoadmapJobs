# Review of SchemeAndStackFoundations (pull request #2489 at de90162)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 30 lines changed since `6c65b01`; both small corrections of the previous review are repaired, and the new sentences (the two Mathlib lemmas in the route of §0.9, the comodule identification for `BG` through *QCoh.presentationEquiv*, the longer *Needs:* line of §1.22a) were recomputed and hold. Two small corrections and one format note remain, none blocking: §1.22a now says that it depends on a statement (that `Stacks.QCoh` of an algebraic stack is abelian) which this roadmap's own §1.22 is the named owner of and does not make, and the description does not mention it. The licence question on the Knudsen link is still left to the human reviewers.

## C01 — §1.22a depends on the abelian structure of `Stacks.QCoh`, which this roadmap's own §1.22 owns and still does not state

In §1.22a (README lines 3862–3864) the new sentence reads "§1.22 does not state that this category is abelian, and this section depends on that statement, which StackPointsAndResidualGerbes requests of §1.22". The dependence is real and it is right to name it: "preserves epimorphisms … so the condition is exactness", *.descend* and the comodule comparison all use kernels and cokernels in `Stacks.QCoh`. But the supplier that request names is this roadmap, so an implementer of §1.22a is pointed at a statement that exists in no layer, here or elsewhere: StackPointsAndResidualGerbes (main, README lines 2118–2127) only says what §1.22 must prove, and no open roadmap proves it. The sentence is also bound to the present state of §1.22 and becomes false the day §1.22 gains the statement.

The smallest repair is one sentence in §1.22: for an algebraic stack `X`, `Stacks.QCoh X` is abelian, with kernels and cokernels computed on `U` under *QCoh.presentationEquiv* for a presentation `[U/R] ≃ X` with `s, t` flat (Stacks, Lemma 96.15.1 (1)–(2) (06WV); Lemma 78.12.6). I read Lemma 96.15.1 at tag 06WV: part (2) is the abelian statement, part (3) the non-exactness of the inclusion into all modules that §1.22a already uses. Then lines 3862–3864 become "(§1.22)" and the *Needs:* line (3955) drops the gap. If the statement is meant to arrive with the rest of that request (structure sheaf, tensor products, right exactness of pullback), the sentence could instead say only "the abelian structure of `Stacks.QCoh` (Stacks, Lemma 96.15.1 (2))" without describing what §1.22 lacks.

## C02 — The description does not say that §1.22a rests on a statement the roadmap does not yet make

The description lists what §1.22a defines and proves and ends "**Depends on** … none". Since this head, §1.22a and its *Needs:* line name a dependence on the abelian structure of `Stacks.QCoh`, absent from §1.22. A reader of the description should know it; a line under "Not included" would do: "the statement that `Stacks.QCoh` of an algebraic stack is abelian, which §1.22a uses and §1.22 does not yet state". It goes away if C01 is repaired in §1.22.

## N01 — The two Mathlib lemmas now named in §0.9 are not in the supplier contracts

`UniversallyClosed.of_comp_surjective` and `IsFinite.of_isProper_of_locallyQuasiFinite` appear in the route and *Needs:* line of §0.9 (lines 1301–1310) but not under the Mathlib contracts near line 467, where `Sheaf.H` and `IsQuasiAffine` are; adding them there, with the `AlgebraicGeometry` namespace, would keep the list complete.

## Previous findings

The previous review had no finding (R); its two small corrections are accounted for here.

- C01 (previous) — repaired: "so `Z → S` is proper (Stacks, Lemma 29.42.9 (03GN); Mathlib `UniversallyClosed.of_comp_surjective`, applied to the surjection `S' → Z` and the integral `S' → S`)", and both names on the *Needs:* line (1309–1310).
- C02 (previous) — repaired: "*Needs:* §1.1, §1.9, §1.10, §1.11, §1.18–§1.22, §2.6; … Mathlib `IsAffineHom`, `IsQuasiAffine`, `Flat`, `LocallyOfFinitePresentation`, `Sheaf.H`" (lines 3955–3957). The repair added the gap reference discussed in C01 above.

## Verified sound

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| §0.9 `integral_point_descent`, properness step | `f : S' → Z` surjective, `g : Z → S`, `f ≫ g` integral | Mathlib lemma needs `UniversallyClosed (f ≫ g)`, `Surjective f`, gives `UniversallyClosed g`; Stacks 03GN adds separated, finite type: `Z ⊂ X` closed | Pass; previous C01 repaired |
| §0.9 finiteness step | `Z → S` proper, residue fields algebraic | Mathlib lemma needs `IsProper`, `LocallyQuasiFinite`, gives `IsFinite`; `Z → S` of finite type with algebraic fibres is locally quasi-finite | Pass |
| §1.22a comodule identification via *QCoh.presentationEquiv* | `G = 1`; `G = μ_2`; `G = ℤ/p` over `𝔽_p`; cocycle on `G × G` | vector spaces on both sides; `ℤ/2`-gradings; `𝔽_p[ℤ/p]`-modules, `N ↦ p = 0`, invariants not exact; cocycle is coassociativity | Pass; Stacks 06WT has no hypothesis beyond a groupoid in spaces |
| §1.22a invariants as pushforward | `W` trivial comodule, `V` any | `Hom_G(W, V) = Hom_k(W, V^G)`, so the right adjoint of the trivial-comodule functor is `V ↦ V^G` | Pass |
| §1.22a "abelian category `Stacks.QCoh Y`" | Stacks 06WV parts (2), (3) | (2) abelian for an algebraic stack; (3) inclusion right exact, not exact; neither stated in §1.22 | True as mathematics; C01 |
| §1.22a *Needs:* line | §1.10, §1.11, `Sheaf.H` | sections exist (lines 3183–3186 for §1.11); `CategoryTheory.Sheaf.H` at `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:57`; neither section cites §1.22a | Pass; previous C02 repaired |

The rows for untouched statements stand as in the previous review, of `6c65b01`.

- Source locators read against the text: 3 Stacks tags for the changed passages (06WV, 06WT, 03GN), read at the Stacks Project site.
- Library declarations opened at the pin: `UniversallyClosed.of_comp_surjective` (`Mathlib/AlgebraicGeometry/Morphisms/UniversallyClosed.lean:75`), `IsFinite.of_isProper_of_locallyQuasiFinite` (`Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:373`), `Sheaf.H` (`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:57`).
- Cross-roadmap citations resolved: StackPointsAndResidualGerbes on main, README lines 2118–2127 (the request to §1.22) and its plan entry of the same slug, supplier SchemeAndStackFoundations §1.22. Every open head and main searched for the slug and for an abelian statement on `Stacks.QCoh`: only this roadmap and StackPointsAndResidualGerbes mention it.
- Automatic checks: all pass on a rerun. Dependency check output: `depcheck: 172 roadmaps, 2060 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` exits 0 with 48 warnings, all `sorry`. The diff changes no Lean statement, so no signature was compared again and the one-tactic probe was not repeated.
- The pull request: no file changed outside the folder; no layer or heading removed; title and description read against this head (C02).
- Another open pull request (#2531) changes this README and conflicts with this head; the description states the order (this one first), so nothing is raised.

Overlap check: read StackPointsAndResidualGerbes, AlgebraicModuliForArithmeticGeometry, JacobianChallenge (main), QuasicoherentSheavesOnPrestacks, PurityForFlatCohomology, FunctorOfPoints (open) for the changed passages; shared: the abelian structure of `Stacks.QCoh` on an algebraic stack, owned by this roadmap's §1.22 (StackPointsAndResidualGerbes asks for it there and states nothing itself). Nothing else is shared.

Source independence: changed passages only; 4 passages compared with 1 source (Stacks Project, tags 06WV, 06WT, 03GN), none shared; largest share stacks-project, about 810 of about 950 locators; contents not compared again (the diff adds, removes and reorders no layer; the previous review found them independent). de Jong 1996, Hartshorne 1977, Fulton 1998, Liu 2002 and Knudsen 1983 were not read.

Research link: §1.22a is the notion behind good moduli spaces (Alper 2013) and the étale slice theorem (Alper–Hall–Rydh 2020); §4.15–§4.18 are the inputs of de Jong's alterations (de Jong 1996); §0.24–§0.25 serve the Witt-vector affine Grassmannian (Bhatt–Scholze 2017, Zhu 2017). Rests on the README's sources and the texts read.

## Not verifiable

- EGA IV₃, Theorem 8.11.1, p. 41 (§0.9, beside the new Mathlib name): not opened in this round; the step was checked against the Mathlib declaration instead.
- de Jong 1996, Hartshorne 1977, Fulton 1998, Liu 2002, Knudsen 1983: as in the previous review; no changed passage cites them.

## Source issues

- none

## For the human reviewers

- **Licence.** The README's link for Knudsen 1983, II (References) points to `journals.msp.org/mscand/…`; the sources service knows no licence class for that host, and the text was not read. Is it a legal copy?
