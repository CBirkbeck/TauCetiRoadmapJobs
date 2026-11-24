# Review of EndoscopicTransferAndUnitaryTraceComparison (pull request #3027 at 6f088b9)

**Verdict:** accepted

**Summary.** An incremental re-review of the 30 lines changed since `e47c8ec`. Accepted, with one small correction and one format note, neither blocking. The two small corrections of the previous review are repaired: §§10.1 and 10.25 now take the Weil constant in every dimension from ClassicalArithmeticCompletion §7.12b and its monodromy determinant from GL2AutomorphicRepresentationsAndTransfer §R16.0.1, with the formula written out, and §7.10a names the correspondences and operators of EtaleDualityAndPerverseSheaves §§6.2–6.3 in place of undeclared library names. The change also makes §1.3 consume its centralizer facts from ReductiveGroups §7.1, which the description does not say (C01). Two points are left for the human reviewers: that handover, and the licence question carried from the previous review.

## C01 — The description does not say that the centralizer facts of §1.3 are no longer targets of this roadmap

On `main`, §1.3 has the reductivity of `G_δ⁰`, the connectedness of `G_δ` for simply connected `G_der` and the torus criterion for strongly regular elements as its own targets ("The centralizer facts used here are also targets"). At this head the same paragraph (line 142) reads "These facts are not targets of this section" and takes them from ReductiveGroups §7.1 (a), (c), (d), (e); the *Needs:* lines of §§10.1 and 10.25 also gain ClassicalArithmeticCompletion §7.12b and GL2AutomorphicRepresentationsAndTransfer §R16.0.1. The description mentions this folder only for §10.26a, and mentions the move of the centralizer theory only from the side of OrbitMeasuresOnAdelicGroups 4.1 ("4.1 no longer cites EndoscopicTransferAndUnitaryTraceComparison §1.3").

A sentence such as the following would be right: "In EndoscopicTransferAndUnitaryTraceComparison, §1.3 keeps the statements on centralizers of semisimple elements and now consumes them from ReductiveGroups §7.1 instead of proving them; §§10.1 and 10.25 cite ClassicalArithmeticCompletion §7.12b and GL2AutomorphicRepresentationsAndTransfer §R16.0.1 for the Weil–Deligne local constant."

## N01 — In §10.26a (line 4037), "the constituents of `V−(dim V)·1`" has no constituents when `V` is a sum of trivial characters

Carried unchanged from the previous review. Read as a virtual representation, `V−(dim V)·1` is then zero, so "the largest break" is a maximum over nothing; with `V=1` and `χ` unramified the conclusion `(V⊗χ)^{I_F}=0` would fail. The *Hypotheses* paragraph and the first Check fix the intended reading. Wording such as "the largest break of the constituents of `V` and of the trivial character" would say it in the statement.

## Previous findings

The previous review (of `e47c8ec`) had no finding; its two small corrections and its format note are accounted for here.

- C01 (§10.1 sends the higher-rank Deligne constant to ArithmeticGaloisRepresentations §2.7) — repaired: line 3482 reads "`ε(s,D,ψ)=ε(s,(V,r),ψ)·det(−q^{−s}r(Φ)|V^I/(ker N)^I)`"; line 3504 cites §2.7 "for the rank-one constant", §7.12b "in every dimension" and §R16.0.1 for the monodromy determinant.
- C02 (§7.10a names `TauCeti.EtaleDuality.CohCorr`) — repaired: line 2861 reads "its cohomological correspondences `Hom_c(K,K)` from §6.2 … operator `RΓ_c(u)`, composition and pushforward of §6.2, the trace map `Tr_c` and local terms `LT_β` of §6.3"; `CohCorr` occurs nowhere in the folder.
- N01 (§10.26a, constituents of `V−(dim V)·1`) — not repaired: line 4037 unchanged; raised again as N01.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / supplier or source) | Result | Change |
|---|---|---|---|---|
| §10.1 Weil–Deligne constant `ε(s,D,ψ)` (changed) | `Sp(2)`: `r(Φ)=diag(1,q⁻¹)`, `Ne₀=e₁`, `ψ` of conductor 0; `N=0` | `ker N=⟨e₁⟩`, `V^I/(ker N)^I=⟨e₀⟩`, `Φ=1` there: `ε=1·(−q^{−s})`; normalized `St`: `−q^{1/2−s}`, conductor 1. `N=0`: factor 1 | agrees with §10.25's Check (conductor 1) and the known Steinberg constant | none |
| §10.1 against GL2AutomorphicRepresentationsAndTransfer §R16.0.1 | twist by `ω^s`; `ω(Φ)` | R16.0.1: constant of `(r⊗ν_W^s,N)`, `r(Φ)Nr(Φ)⁻¹=q⁻¹N` so `ν_W(Φ)=q⁻¹`; README: `ω(Φ)=q^{deg Φ}=q⁻¹`, factor `−q^{−s}r(Φ)` | the same object | none |
| §§10.1, 10.25 *Needs:* lines and scope paragraph (changed) | ArithmeticGaloisRepresentations §§2.5, 2.7; ClassicalArithmeticCompletion §7.12b | §2.5 has `det(1−X r(F)|(ker N)^{r(I)})`; §2.7 defines constants of quasi-characters only; §7.12b is "Weil local constants" | each cited for what it states | none |
| §1.3 centralizer facts (seeded; changed) | ReductiveGroups §7.1 (a), (c), (d), (e); `PGL₂`, `diag(1,−1)`; scalar in `GL₂` | (a) reductive, roots `α(s)=1`; (c) connected if `G^der` simply connected; (d) commutative ⇒ maximal torus; (e) defined over `k`. `PGL₂`: disconnected in both texts | every clause supported where cited | none |
| §1.3 locator, Labesse §2.3 (seeded) | Numdam text, printed pp. 52–53 | §2.3 opens p. 52; Définition 2.3.1 and Steinberg's connectedness remark p. 52; Lemmes 2.3.2–2.3.3 pp. 52–53; Définition 2.3.4 p. 53 | locator holds | none |
| §7.10a supplied operators (changed) | EtaleDualityAndPerverseSheaves §§6.2, 6.3, 6.4 | §6.2: `Hom_c(F₁,F₂)=Hom(c₁^*F₁,c₂^!F₂)`, `RΓ_c(u)` for `c₁` proper, `RΓ_c(v∘u)=RΓ_c(v)∘RΓ_c(u)`; §6.3: `Tr_c`, `LT_β` for proper open `β`; §6.4 names trace additivity | same legs, same properness hypothesis | none |
| §10.26a hypothesis (untouched) | `V=1`, `χ` unramified | `V−(dim V)·1=0`: no constituents; `(V⊗χ)^{I_F}=V≠0` | wording, fixed by the Hypotheses paragraph | N01 |

The rows of the previous review for untouched statements stand as in that review, of `e47c8ec`.

- Cross-roadmap citations resolved: 9 section ids in 5 roadmaps (ReductiveGroups §7.1 at this head; EtaleDualityAndPerverseSheaves §§6.1, 6.2, 6.3 at this head; GL2AutomorphicRepresentationsAndTransfer §R16.0.1, ClassicalArithmeticCompletion §7.12b, ArithmeticGaloisRepresentations §§2.5, 2.6, 2.7 on `main`), each under the title the line gives.
- Supplier text read: ReductiveGroups §7.1 with its route and Checks; GL2AutomorphicRepresentationsAndTransfer README lines 80–100; ArithmeticGaloisRepresentations §§2.5, 2.7 openings; EtaleDualityAndPerverseSheaves lines 6143–6256, 6415–6446, 6609–6619.
- Source locators checked against the text: 1 (Labesse, *Cohomologie, stabilisation et changement de base*, §2.3, Numdam copy, lines 1881–1934), for §1.3, the only seeded target in a changed passage.
- Roadmap as record: no heading removed or retitled since `e47c8ec` or against the merge base; §1.3 keeps its id, subject and every statement; `Suggested.lean` unchanged.
- Changes outside the folder: all lie in the pull request's own roadmap folders or family index files.
- Overlap check: read AutomorphicSpectralTheory, IgusaVarietiesAndTorsionConcentration (and Part II), AutomorphicGaloisRepresentationsPartII, GlobalShtukasAndFunctionFieldLanglands, ModularityAndLanglandsExtensions; nothing shared by the change. Centralizers of semisimple elements: owner ReductiveGroups §7.1, cited by §1.3. No other open pull request changes this roadmap; it drops no id and cites none that an open pull request drops.
- Automatic checks: the worker's run passed every check. Dependency check output: `depcheck: 129 roadmaps, 1463 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/Suggested.lean` exits 0 with no output; the file declares nothing (its docstring names every headline as not statable), so there is nothing to `#check` or probe.

Source independence: changed passages only; 1 passage (the centralizer paragraph of §1.3) compared with 1 source (Labesse §2.3), none shared; the other changed lines cite roadmap sections and no source. Largest share of the linked locators: Shin, *Galois representations arising from some compact Shimura varieties*, 29 of 455; contents not compared, since the change adds, removes and reorders no layer.

Research link: §10.26a is Deligne–Henniart's twist formula for local constants (1981). §10.27 uses it in Henniart's highly ramified argument, by which the trace-defined local Langlands correspondence for `GL_n` (Scholze, cited in §10.1) is shown to match pair `ε`-factors. Rests on README §§10.1 and 10.27 and on DeligneHenniart1981 lines 19–30.

## Not verifiable

- Jacquet–Shalika 1985, cited in an untouched paragraph of §10.27 (line 4065): the linked copy is on a personal web space whose owner the link does not establish as an author, so it was not opened.

## Source issues

- none

## For the human reviewers

- Record: §1.3 on `main` has the centralizer facts as its own targets; this head keeps the statements and consumes them from ReductiveGroups §7.1 (line 142). No recorded decision names this handover. ReductiveGroupsPartIII (README line 984, on `main`) still cites §1.3 for the reductivity.
- Licence: the README links Jacquet–Shalika, *A lemma on highly ramified ε-factors* (§10.27, line 4065; References), to a Columbia mathematics web space under `~hj`; whether that is an author's page was not settled, and the copy was not read.
