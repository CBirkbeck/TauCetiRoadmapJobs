# Review of BaseChangeAndGaloisRepresentationsForUnitaryGroups (pull request #3027 at c832fa9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BaseChangeAndGaloisRepresentationsForUnitaryGroups/`
**Verdict:** accepted

**Summary.** This is an incremental re-review of the 15 lines changed since `f3b4ab1`. They rewrite the convention paragraph "Corollaries of general theorems" (lines 38–45). The process narrative is gone: the paragraph now says the general theorem is proved in its own roadmap and the section is deduced from it. A route that is not that deduction is a second proof, and the `*Needs:*` line lists what that route needs. The paragraph agrees with all seven sections that carry a `*Corollary of:*` line, and with the family index. There is no finding. One new small correction (C05): for 13.0a, the paragraph's "not the general theorem in full" does not hold. The previous review's four small corrections and its format note are in passages the change leaves alone; they are carried as C01–C04 and N01. None of these blocks. The two points for the human reviewers still stand.

## C01 — The statement of 10.29a follows from its own remark, but the section has no Corollary-of line (carried, unchanged)

Take `r_n = rec_n`, the trace-defined correspondence of the remark (line 230). It has every property the statement asks for (line 216):
- properties 1–5, the twist rule and the duals, from EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30;
- injectivity;
- tameness at depth zero, from 10.35 (d);
- over `ℚ_p`, the inertial formula, from 10.34 (iii) with `q = p`.

Yet the route for the statement (line 256) is still the construction by cases. The rewritten convention (line 40) now says that what a Corollary-of line covers "is deduced from" the general theorem. Would a line *Corollary of:* the remark (EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30, with 10.34 (iii) and 10.35 (d)), for `r_n = rec_n`, be added?

## C02 — The Method label of 10.35 says that (c) and "depth zero ⇒ tame" hold by construction, which the label itself makes true only over `ℚ_p` (carried, unchanged)

Lines 663–667 say that on a depth-zero supercuspidal over a field not isomorphic to `ℚ_p`, the map's value is "not a twist of a tame representation". Yet they then say that clause (c) and the direction "depth zero ⇒ tame" of (d) hold by construction. Would the sentence read "Clauses (a), (b) and, over a field isomorphic to `ℚ_p`, (c) and the direction 'depth zero ⇒ tame' of (d) hold by construction"?

## C03 — The comparison of 16.1 with AG2.7 (line 1280) says the de Rham comparison at `ℓ` "holds for every block", which is now only in the remark (carried, unchanged)

Above `ℓ`, the statement of 16.1 asserts only crystallinity, and only where `Π` is unramified. De Rham at every `w ∣ ℓ` is in the remark (line 1313). Insert "(in the remark; in the statement, crystalline where `Π` is unramified above `ℓ`)".

## C04 — One sentence of the description does not hold for this roadmap (carried; the sentence is reworded but says the same)

The description says that "the section now states the proof's form and the general roadmap the general theorem". That does not hold here for 16.1: its general form is this roadmap's own remark (line 1313), and no general roadmap states it. For 10.29a, the remark (line 230) restates beside the statement what EndoscopicTransferAndUnitaryTraceComparison proves. Headlines (1) and (4) are these remarks. Suggested text: "… and the general roadmap the general theorem or, where none states it, a remark in the same section does (BaseChangeAndGaloisRepresentationsForUnitaryGroups 16.1)."

## C05 — The rewritten convention says the proof needs "only that case, not the general theorem in full", but for 13.0a the case is the whole general theorem

A reader of 13.0a is told the proof of the Riemann hypothesis uses less than Radford's theorem, and it does not. In the paragraph on corollaries (lines 41–42), the contrast holds for six of the seven sections with the line:
- 10.0a allows any subgroup `H`, where InductionRestriction §6.2 asks for `H` elementary;
- 10.27 is the rank-one case of EndoscopicTransferAndUnitaryTraceComparison §10.26a;
- 14.0a, 14.2, 15.1 and 15.2 are cases of the theorems their lines name.

13.0a is the exception. Its statement (line 737) is the same as AnabelianGeometryAndNonabelianChabauty §2.0a: any field of characteristic zero, any linearly ordered alphabet. Its Method label gives no narrower form. Would the clause read "needs no more of the general theorem than that case (for 13.0a, all of it)"? The family index (line 202) has the same sentence.

## N01 — The citation of [FormalProof] in 10.27 (line 178) is the only one without a file path (carried, unchanged)

## Questions for the author

- The Origin label of 13.8a (line 742) credits the comparison of simple trace formulas for inner forms of unitary groups to "Kottwitz, Clozel, Harris and Taylor, Labesse". It gives no works and no locators. Which works and statements are meant? The References list these authors only for other purposes, so there was nothing to open.

## Previous findings

- none: the previous report (of `f3b4ab1`) raised no finding. Its small corrections C01–C04 and its format note N01 are not repaired, because the change does not touch their passages. They are carried above with their numbers, at line numbers one higher.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Convention on corollaries (lines 38–45) against 13.0a | alphabet `{a}`; `{a<b}`; characteristic 2 | `a⧢ⁿ = n!·aⁿ`; degree 2: monomials `a⧢a, a⧢b, b⧢b, ab`, 4 words; degree 3: 8 monomials, `2³` words; char 2: `a⧢a = 0` | 13.0a = §2.0a word for word; "not … in full" fails | C05 |
| same, against 10.0a and InductionRestriction §6.2 | `G = S_3`, `H = S_3` (not elementary), `χ = ε`; classes `(1,(12),(123))` | `ε − 1 = (0,−2,0)`; `Ind_{C_2}ε − Ind_{C_2}1 = (3,−1,0) − (3,1,0) = (0,−2,0)` | 10.0a strictly weaker; route Deligne's, label says it differs | none |
| same, against 10.27 and EndoscopicTransfer §10.26a | `V = ξ_w·|·|^s`, then `V = |·|^s`; `a(χ) = 2`, `ξ_w` tame | breaks `1 > 2·0`; `ε(s,χξ)/ε(s,χ) = ξ_w(c_χ)`; over `ℚ_3`, `v(c_χ) = 2` | rank-one case; route is [FormalProof]'s, as the convention says | none |
| same, against 14.0a and AL.3.7.1a | `n = 1`, `π = χ`; `π = π₀⊗|det|^t`, `π₀` unitary | `χ(g⁻¹) = χ⁻¹(g)`; `φ₀(ᵗg⁻¹)|det g|^{−t}` spans `π₀^∨⊗|det|^{−t} = π^∨` | twist deduction; *Needs:* lists the route's AL.3.4.3 and AL.3.7.1 | none |
| same, against 14.2 | `n = 2`, `π_w = π_θ̃`, `θ` of order 3, `q = 2` | route 1 (14.1 + 10.35 (c)) and route 2 both give `θ∘t₂ ⊕ θ²∘t₂`; route 2 labelled [FormalProof]'s | route 1 is the deduction; *Needs:* covers both | none |
| same, against 15.2 | `n = 2`, `w = 0`; `a_τ = (0,0)` and `(2,0)` | `HT_τ = {1,0}` → `{1−h} = {0,1}`; `HT_τ = {3,0}`, `a_{τc} = (0,−2)` → `{1,−2} = {1−h}` | case of AG2.0 with AG2.6; label says route differs | none |
| 10.29a (C01) | `n = 1`; depth-zero `π_θ̃` of `GL_2(ℚ_p)` | `r_1 = rec_1 = χ∘Art_geo⁻¹`; inertia `θ∘t₂ ⊕ θ^p∘t₂`, 10.34 (iii) with `q = p` | the remark implies the statement | C01 |
| 10.35 Method label (C02) | `F = ℚ_p`; `F` unramified quadratic over `ℚ_p`; depth-zero `π_θ̃` of `GL_2(F)` | over `ℚ_p` the value is tame; over the quadratic field it is "not a twist of a tame representation" | "by construction" holds only over `ℚ_p` | C02 |
| 16.1 (C03) | `n = 2`, `Π` trivial of weight 0 | `P_w = (X − q)(X − 1)`, `r = 1 ⊕ ε_ℓ⁻¹`, crystalline, HT `{0,1}`; de Rham at every `w ∣ ℓ` only in the remark | line 1280 overstates the statement | C03 |

The rows of the previous review for the untouched statements stand as they were in that review, of `f3b4ab1`.

- **Source locators checked against the text: 2.**
  - Hof99 Theorem 2.2, p. 3 (Hof99 line 119; setting at lines 23–29), for 13.0a.
  - Cog04 Lecture 5: the remark after Proposition 5.1 (Cog04 lines 1810–1811, p. 38) and Proposition 5.3 (iii) (lines 1944–1946, p. 39), for 14.0a.
- **Cross-roadmap citations resolved: the seven `*Corollary of:*` targets.**
  - At this head: InductionRestriction §6.2 (README line 950), EndoscopicTransferAndUnitaryTraceComparison §10.26a (line 4035), AnabelianGeometryAndNonabelianChabauty §2.0a (line 4484), AutomorphicLFunctionsAndLocalFactors AL.3.7.1a (line 1638).
  - On main: AutomorphicGaloisRepresentationsPartII AG2.5 *Caraiani's full away-prime compatibility* (line 1642), AG2.6 *Full polarized local–global compatibility at `ℓ`* (2234) and *Polarized admissibility at the coefficient prime* (2019), AG2.0 *The Hodge–Tate multiset attached to a weight* (570).
- **Cited suppliers changed since `f3b4ab1`.**
  - FiniteReductiveGroups changed by 251 lines, with no heading changed. In the sections cited here (§§5.2, 5.10, 5.11, 6.1–6.4), only the Origin label of 6.1 changed.
  - LocalFactorsOfTwistsAndTypes received the same convention paragraph.
- **Library declarations opened:** none. `Suggested.lean` has no declarations and is unchanged since `f3b4ab1`.
- **Record and scope of the change:** the change touches no heading and no statement. Against the merge base `74a09b7`, no layer is removed, retitled or added. Against main, 119 files changed, all in folders the pull request owns; nothing changed outside them.
- **Automatic checks:** the worker's run passed at this head. Rerun by hand, every check gives 0 except the outside-folder check (below). Dependency check: `depcheck: 124 roadmaps, 1392 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with no messages (module docstring only).
- **Overlap check:** read FiniteReductiveGroups, LocalFactorsOfTwistsAndTypes, CongruenceModulesOfThetaLifts, ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs, UniformWildKernelBounds and EndoscopicTransferAndUnitaryTraceComparison. Since `f3b4ab1` they changed only in their convention paragraphs and, for FiniteReductiveGroups, as above. The change adds no object. Radford's theorem has a single owner, AnabelianGeometryAndNonabelianChabauty §2.0a; 13.0a is this roadmap's record item (on main at the merge base) with a Corollary-of line citing it. The other owners are as in the previous review. The overlaps report lists no conflicting head and no dropped id.

Source independence: changed passages only. 1 changed passage (the convention on corollaries, lines 38–45) was compared with the family index (lines 200–204, the same pull request). For the sections it governs, it was compared with Hof99 Theorem 2.2 and Cog04 Lecture 5. The passage cites no source and shares no source wording. The largest share is [FormalProof], with 32 file-path locators, as in the previous review. Contents not compared: the change adds, removes and reorders no layer.

Research link: Layers 10 and 14–16 state two things. The first is the explicit depth-zero local Langlands correspondence (Henniart 1992; Bushnell–Henniart 2005). The second is the properties of the Galois representations of polarized cuspidal representations and of definite unitary groups (Shin 2011; Chenevier–Harris 2013; Caraiani 2012; BLGGT 2014; Guerberoff 2011). This rests on the README's Summary and References, BLGGT14 Thm 2.1.1 and Gue11 §2.5.

## Not verifiable

- [FormalProof]: no copy was read. Its declaration names and file paths were not checked. Neither was any *Method of the formal proof* label, nor the convention's claim that the proof of the Riemann hypothesis needs only the cases the Corollary-of lines cover.
- DeBacker–Reeder 2009, Harris–Kudla–Sweet 1996, Kudla 1994 (uncertified) and Radford 1979 (uncertified): as in the previous review; the change does not touch them.
- Ownership against other open pull requests: checked only through the overlaps report and the closest roadmaps named above.

Automatic checks set aside as false positives: the check for files changed outside the roadmap folder, rerun by hand without the list of the pull request's folders, lists 117 files. All of them are in other roadmap folders that this pull request changes as its own, and the diff outside those folders is empty. The worker's run passed.

## Source issues

- none

## For the human reviewers

- Scope: the statements of 10.27, 10.29a and 16.1 (README lines 172, 216, 1255) are the forms particular to [FormalProof], an announced Lean formalization (References, last entries). The general or published forms are kept as remarks (lines 230, 1313) or stated in EndoscopicTransferAndUnitaryTraceComparison §10.26a.
- Not tested: [FormalProof], the source with the largest share of locators, was not read. Parts 1 and 2 of the source check were therefore not run against it.
