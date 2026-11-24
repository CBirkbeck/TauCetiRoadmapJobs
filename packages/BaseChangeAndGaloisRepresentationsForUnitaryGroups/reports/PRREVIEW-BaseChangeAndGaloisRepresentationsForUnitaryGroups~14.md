# Review of BaseChangeAndGaloisRepresentationsForUnitaryGroups (pull request #3027 at f3b4ab1)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BaseChangeAndGaloisRepresentationsForUnitaryGroups/`
**Verdict:** accepted

**Summary.** This is an incremental re-review of the 8 lines changed since `71bbefa`. All four changed lines repoint the citation of Brauer's theorem in degree zero from InductionRestriction Layer 6.1 to InductionRestriction §6.2. The repointing is correct. Once main's layout of InductionRestriction is merged, its §6.1 is the virtual-character lattice and its §6.2 is Brauer's theorem in degree zero, with `H` elementary and `χ` linear. 10.0a, with `H` an arbitrary subgroup, is a corollary of it. There is no finding. The previous review's four small corrections and its format note are untouched by this change; they are carried below as C01–C04 and N01, and none of them blocks. One question to the author is carried. The two points for the human reviewers still stand.

## C01 — The statement of 10.29a follows from its own remark, but the section has no Corollary-of line (carried, unchanged)

Take `r_n = rec_n`, the trace-defined correspondence of the remark (line 229). It has every property the statement asks for (line 215):
- properties 1–5, the twist rule and the duals, from EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30;
- injectivity;
- tameness at depth zero, from 10.35 (d);
- over `ℚ_p`, the inertial formula, from 10.34 (iii) with `q = p`.

Yet the route (line 255) still asks for the construction by cases. Would a line *Corollary of:* the remark (EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30, with 10.34 (iii) and 10.35 (d)), for `r_n = rec_n`, be added?

## C02 — The Method label of 10.35 says that (c) and "depth zero ⇒ tame" hold by construction, which the label itself makes true only over `ℚ_p` (carried, unchanged)

Lines 662–666 say that on a depth-zero supercuspidal over a field not isomorphic to `ℚ_p`, the map's value is "not a twist of a tame representation". Yet they then say that clause (c) and the direction "depth zero ⇒ tame" of (d) hold by construction. Would the sentence read "Clauses (a), (b) and, over a field isomorphic to `ℚ_p`, (c) and the direction 'depth zero ⇒ tame' of (d) hold by construction"?

## C03 — The comparison of 16.1 with AG2.7 (line 1279) says the de Rham comparison at `ℓ` "holds for every block", which is now only in the remark (carried, unchanged)

Above `ℓ`, the statement of 16.1 asserts only crystallinity, and only where `Π` is unramified. De Rham at every `w ∣ ℓ` is in the remark (line 1312). Insert "(in the remark; in the statement, crystalline where `Π` is unramified above `ℓ`)".

## C04 — One sentence of the description does not hold for this roadmap (carried, unchanged)

The description says the section "now states the form the proof has, and the general roadmap states the general theorem". For 16.1 and 10.29a, the general form stays in this roadmap as a remark (lines 229, 1312), and headlines (1) and (4) are those remarks. Suggested text: "… and the general roadmap states the general theorem or, where none does, a remark in the same section states it (BaseChangeAndGaloisRepresentationsForUnitaryGroups 10.29a, 16.1)."

## N01 — The citation of [FormalProof] in 10.27 (line 177) is the only one without a file path (carried, unchanged)

## Questions for the author

- The Origin label of 13.8a (line 741) credits the comparison of simple trace formulas for inner forms of unitary groups to "Kottwitz, Clozel, Harris and Taylor, Labesse", with no works and no locators. Which works and statements are meant? The References list these authors only for other purposes, so there was nothing to open.

## Previous findings

- none: the previous report (of `71bbefa`) raised no finding. Its small corrections C01–C04 and its format note N01 are not repaired, since this change does not touch them, and are carried above with their numbers.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 10.0a, now a corollary of InductionRestriction §6.2 | `G = S_3`, `ρ` standard; classes `(1, (12), (123))` | `ρ − 2 = (0,−2,−3)`; `Ind_{C_3}ω − Ind_{C_3}1 = (0,0,−3)`; `Ind_{C_2}ε − Ind_{C_2}1 = (0,−2,0)`; the sum agrees | true, with `H` elementary | none |
| same | `G = Q_8`, `ρ` the 2-dimensional representation | `Ind_{C_4}χ = ρ`, `Ind_{C_4}1 = 1 + χ_a`; `ρ − 2 = (ρ − 1 − χ_a) + (χ_a − 1)`; `C_4` and `Q_8` are 2-groups | true | none |
| same, degenerate | `G` trivial; `G` cyclic, `ρ = χ` linear | `ρ − dim ρ = 0`, the empty sum; `χ − 1 = Ind_G^G χ − Ind_G^G 1` | true | none |
| §6.2 against Del73 Prop. 1.5, p. 510 (lines 225–228) | a virtual `y = Σ n_i χ_i` with `Σ n_i = 0` | `Ind y = Σ n_i (Ind χ_i − Ind 1)`; Del73 needs roots of unity of order the exponent of `G`, which ℂ contains | locator and statement hold | none |
| 10.0a against §6.2 (direction) | `H` elementary versus `H` any subgroup | §6.2's set of generators is a subset of 10.0a's, so 10.0a follows; the converse is not claimed | corollary correct | none |
| Supplier contracts: InductionRestriction ids | ids at this head and at `71bbefa` | head: Layer 3 Mackey (l. 448), 4 irreducibility (525), 5 Clifford (687), 6 Brauer induction (840), §6.1 lattice (921), §6.2 degree zero (950); at `71bbefa`, 6.1 was degree zero | every cited id resolves; the old id would now name the lattice | none |
| 10.29a (C01) | `n = 1`; depth-zero `π_θ̃` of `GL_2(ℚ_p)` | `r_1 = rec_1 = χ∘Art_geo⁻¹`; inertia `θ∘t_2 ⊕ θ^p∘t_2`, as in 10.34 (iii) with `q = p` | the remark implies the statement | C01 |
| 10.35 Method label (C02) | `F = ℚ_p` and `F` unramified quadratic over `ℚ_p`; depth-zero `π_θ̃` of `GL_2(F)` | over `ℚ_p` the value is tame; over the quadratic field it is "not a twist of a tame representation" | "by construction" holds only over `ℚ_p` | C02 |
| 16.1 (C03) | `n = 2`, `Π` trivial of weight 0 | `P_w = (X − q)(X − 1)`, `r = 1 ⊕ ε_ℓ⁻¹`, crystalline, HT weights `{0,1}`; de Rham at every `w ∣ ℓ` only in the remark | line 1279 overstates the statement | C03 |

The rows of the previous review for the untouched statements stand as they were in that review, of `71bbefa`.

- **Source locators checked against the text: 1.** Del73 Prop. 1.5 and Scholie 1.6, p. 510 (Del73 lines 216–246).
- **Cross-roadmap citations resolved at this head.**
  - InductionRestriction: Layers 3, 4, 5, 6 and §§6.1, 6.2.
  - Cited sections of suppliers changed since `71bbefa`: AL.2.1.2–AL.2.1.5, AL.3.2–AL.3.3, AL.3.4.3, AL.3.7.1, AL.3.7.1a; AutomorphicSpectralTheory §§4.5, 6.18, 7.0a–7.0b; AnabelianGeometryAndNonabelianChabauty §2.0a; ArithmeticGaloisDuality §R02.4.6; AutomorphicFormsOnReductiveGroups §§2.4, 7.4–7.5.
  - Where those suppliers changed: AL.3.3.8a (widened to every characteristic), AL.3.9.7, AutomorphicSpectralTheory §§4.5a (new) and 6.4a, ArithmeticGaloisDuality §D7.6a, and some Dependencies and scope lines. None of these changes a cited statement.
- **Library declarations opened at the pin:**
  - `TauCeti.IsElementary.isNilpotent` (TauCeti/GroupTheory/Elementary.lean:441);
  - `FDRep.exists_character_eq_indClassFun_of_isNilpotent` (TauCeti/RepresentationTheory/Induction/Monomial.lean:81);
  - `TauCeti.ClassFunction.indVirtualCharacters_eq_virtualCharacters_isElementary` and `TauCeti.ClassFunction.character_mem_indCharacterSpanInt_isElementary` (TauCeti/RepresentationTheory/Induction/Brauer/Induction.lean:82, 127).
  - The pin has no degree-zero form, so 10.0a duplicates nothing.
- **Record:** the change touches no heading and no statement. Against the merge base `74a09b7`, no layer is removed, retitled or added.
- **Outside the folder:** against main, the diff outside the pull request's own folders is empty. The other files changed since `71bbefa` come from the merge of main.
- **Automatic checks:** all passed at this head. Dependency check: `depcheck: 127 roadmaps, 1420 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with no messages. The file is unchanged since `71bbefa` and has no declarations (module docstring only), so there is no signature to compare.
- **Overlap check:** read FiniteReductiveGroups, LocalFactorsOfTwistsAndTypes, EndoscopicTransferAndUnitaryTraceComparison and CongruenceModulesOfThetaLifts; none of them changed since `71bbefa`, and their owners are as in the previous review. For the one object this change concerns, Brauer's theorem in degree zero, the owner is InductionRestriction §6.2 (README line 950). Searched on main and at the open heads: ClassicalArithmeticCompletion (main, line 16122) uses it only as a route step, and no other roadmap owns it.

Source independence: changed passages only. 4 changed passages compared with 1 source (Del73 Prop. 1.5 and Scholie 1.6), none shared; the source is in French, and only the formula is common. The largest share is [FormalProof], 32 file-path locators, as in the previous review. Contents not compared: the change adds, removes and reorders no layer.

Research link: Layers 10 and 14–16 state the explicit depth-zero local Langlands correspondence (Henniart 1992; Bushnell–Henniart 2005) and the properties of the Galois representations of polarized cuspidal representations and of definite unitary groups (Shin 2011; Chenevier–Harris 2013; Caraiani 2012; BLGGT 2014; Guerberoff 2011). This rests on the README's Summary and References, BLGGT14 Thm 2.1.1 and Gue11 §2.5.

## Not verifiable

- [FormalProof]: no copy was read. Its declaration names and file paths were not checked, and neither was any *Method of the formal proof* label, among them that of 10.0a.
- DeBacker–Reeder 2009, Harris–Kudla–Sweet 1996, Kudla 1994 (uncertified) and Radford 1979 (uncertified): as in the previous review; the change does not touch them.
- Ownership against other open pull requests: only the overlaps report and a search of the open heads for the one object the change concerns were used.

Automatic checks set aside as false positives: the check for files changed outside the roadmap folder, rerun by hand without the list of the pull request's folders, lists 117 files. All of them are in other roadmap folders that this pull request changes as its own, and the diff outside those folders is empty; the worker's run passed.

## Source issues

- none

## For the human reviewers

- Scope: the statements of 10.27, 10.29a and 16.1 (README lines 171, 215, 1254) are the forms particular to [FormalProof], an announced Lean formalization (References, last entries). The general or published forms are kept as remarks (lines 229, 1312) or stated in EndoscopicTransferAndUnitaryTraceComparison §10.26a.
- Not tested: [FormalProof], the source with the largest share of locators, was not read. Parts 1 and 2 of the source check were therefore not run against it.
