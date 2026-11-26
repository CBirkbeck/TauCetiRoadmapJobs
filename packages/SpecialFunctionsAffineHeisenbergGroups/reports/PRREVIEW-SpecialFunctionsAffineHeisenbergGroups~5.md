# Review of SpecialFunctionsAffineHeisenbergGroups (pull request #2936 at 0eca050)

**Verdict:** accepted

**Summary.** Accepted: the change since the previous review turns six mentions of SpecialFunctionsConfluent and ThetaKernelsForUnitaryDualPairs into links and alters no statement; both roadmaps are now on main, the links point at their folders there, and the cited sections were read again at main. The previous small correction (an out-of-date pull request number in the description) is repaired. There is no small correction and one format note, not blocking. As before, none of the six cited books could be read legally; that and two licence notes are left for the human reviewers.

## N01 — In the route of 2.6 two code spans are broken over a line end

In the route for the differential relations of 2.6 (lines 555–556) the spans holding `F_ε(λ) ↦ −ε(λ − 1) F_ε(λ − 1)` and the kernel `e^{(μ − λ)τ − tx/2} K(λ, μ; g_1(r))` each start on one line and close on the next, so a line-based reader sees `_{`-style subscripts and a braced exponent outside any code span. Keeping each span on one line, or setting the two formulas as an indented code block, says the same mathematics.

## Previous findings

- C01 — repaired: the description now lists "ThetaKernelsForUnitaryDualPairs (in the RiemannHypothesisForDirichletLFunctions family) §3.45(i)–(ii)" under "On main", with no pull request number; the `depends-on` block names only #2694 SpecialFunctionsGroupModels.

The previous review had no finding (R) to carry.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 3.4, the supplier statement consumed at `N = 1` (the changed links cite it): `H(z, w) = z conj w` for `W = ℝe ⊕ ℝf`, `ω(e, f) = 1`, `Je = f` | `H(x, y) = ω(x, Jy) − iω(x, y)` on `(e,e)`, `(f,e)`, `(e,f)`, `x = ae + bf` | `H(e,e) = 1`; `H(f,e) = i = i·conj 1`; `H(e,f) = −i = conj i`; `ω(x, Jx) = a² + b² > 0` | holds; agrees with the supplier's §3.45 on main | none |
| Supplier contract for ThetaKernelsForUnitaryDualPairs §3.45: `U_w G(z) = G(z + w) e^{−πH(z,w) − πH(w,w)/2}` preserves the Fock norm | weight `e^{−π|z|²}`, `H(z,w) = z conj w` | `|U_w G(z)|² e^{−π|z|²} = |G(z+w)|² e^{−π(|z|² + 2Re(z conj w) + |w|²)} = |G(z+w)|² e^{−π|z+w|²}` | unitary by translation invariance; formula as on main (README line 254 there) | none |
| Scope bullet and contract for SpecialFunctionsConfluent (changed links): §§1.4, 1.6, 2.4, 4.2 | headings and DLMF numbers on main | 1.4 Tricomi's function; 1.6 Whittaker's normal form (13.14.1–13.14.3); 2.4 (13.16.1, 13.16.5, 13.16.10–13.16.12); 4.2 (13.15.15–13.15.26 contains 13.15.16, .18, .21, .25) | all present where cited | none |

The rows for the statements the change does not touch stand as in the previous review, of `b1d7382`.

- Changed passages: 6 (two in the summary, two scope bullets, two supplier-contract headings); each only adds a link. No layer, heading id, target or Lean declaration is added or removed; `Suggested.lean` is unchanged; no file outside the folder changes.
- Source locators checked against the text: 0; the change adds none, and the six books were not readable (not fetched again).
- Library declarations opened at the pin: none new; the changed lines cite none.
- Cross-roadmap citations resolved on main (`98881db`): SpecialFunctionsConfluent §§1.4, 1.6, 2.4, 4.2 (README lines 289, 369, 499, 685); ThetaKernelsForUnitaryDualPairs §3.45(i)–(ii) (line 245); LaguerreJacobi §§1.1, 2.3, 2.4; SpecialFunctionsHypergeometric §6.3; AsymptoticExpansions §4.1; MetaplecticAutomorphicForms §0.15. Both link targets exist on main; SpecialFunctionsGroupModels remains an open new roadmap.
- Dependency check: `depcheck: 106 roadmaps, 1218 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: exit 0, 47 `sorry` warnings, the output of the closing `#check`s, nothing else; single `import Mathlib` plus the Tau Ceti modules, no `set_option`, no sorried definition. Signatures and the one-tactic probe stand as at the previous review, the file being unchanged.
- Pull request text read against the head: suppliers on main and open agree with main and the open list; 47 declarations and 47 warnings agree; no sentence contradicted, no change left unstated.
- Overlap check: read SpecialFunctionsGroupModels, SpecialFunctionsMotionGroupsBessel, SpecialFunctionsSU11MatrixElements, SpecialFunctionsHigherSpheres, SpecialFunctionsRankOneSymmetricSpaces, SpecialFunctionsConfluent, SpecialFunctionsBessel, SpecialFunctionsParabolicCylinder (scopes as at the previous review; the change touches no ownership); nothing shared beyond what is cited: the oscillator matrices, their law and Haar measure, owner SpecialFunctionsGroupModels §0.2; the Whittaker functions, owner SpecialFunctionsConfluent §1.6.

Source independence: changed passages only: 6 passages compared with 0 sources, since no cited text could be read; the passages are link targets around unchanged roadmap names, with no source wording to share; largest share Vilenkin–Klimyk Vol. 1, roughly 35 to 45 of about 110 page locators; arrangement not compared again (no layer added, removed or reordered) and not tested against that book's table of contents.

Research link: the headline targets are the matrix-element and kernel theory of the `ax + b`, triangular, Heisenberg and oscillator groups of Vilenkin–Klimyk (1991, 1993), Miller (1968) and Wawrzyńczyk (1984), and the one-variable case of the Fock model used by ThetaKernelsForUnitaryDualPairs; they feed the Askey-scheme Charlier theory named under Downstream consumers. Rests on the README; no source was read.

## Not verifiable

- Vilenkin–Klimyk Vols. 1 and 2, Klimyk–Vilenkin (Encyclopaedia of Mathematical Sciences 59), Wawrzyńczyk, Dieudonné (CBMS 42) and Miller (1968): not readable legally at the earlier reviews (paywalled, or no accepted host); not fetched again, the change adding no locator. The locators of the sampled sections 0.1–5.1, and the misprints the README attributes to these books, remain unchecked against the printed text; the stated formulas were checked by computation at the earlier reviews.

Automatic checks set aside as false positives: the rule against choice in the body of a definition, raised for the `L²` multiplier representation, a copy of the supplier's definition that picks a representation unique when it exists; the rule against a section heading with no declaration under it, raised for the closing block of `#check`s that pins library names; a lead that the kernel statement of the oscillator matrix realization is declared nowhere, which this roadmap's own Lean file declares (line 442).

## Source issues

- none

## For the human reviewers

- **Not tested.** No cited book could be read legally, so wording and arrangement were not compared with any source; Vilenkin–Klimyk Vol. 1 has the largest share of page locators (roughly 35–45 of about 110), concentrated in Layers 1–2 of `README.md`.
- **Licence.** `README.md`, "Prior formalization", says the roadmap reuses names and conventions of the author's own repository `bjbraams/lean-SFVK` (stated Apache-2.0), files `SFVK/AffineHeisenberg/*.lean`; the declarations of `Suggested.lean` appear to be taken from it.
- **Licence.** Miller's 1968 book appears to be offered on its author's university page; the sources service did not accept that address, so it was not read.
