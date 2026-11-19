# Review of ComplexKahlerGeometry (pull request #2536 at 4a51aa5)

**Verdict:** accepted

**Summary.** Accepted, with one small correction that does not block. Section 2.5 now takes the Čech refinement maps, their homotopy independence and the cover colimit from Tau Ceti, and K4.P takes the refinement action on frame cocycles from there too. The names, hypotheses and directions match the pinned declarations, and they agree with the frame convention `e_j=e_i g_ij`. The description now states 4.5's softness, the target 2.5 drops and the move of ownership away from TopologicalSheafCohomology's scope sentence, so all three previous points are repaired. The small correction is that the same Tau Ceti pin also carries the long exact sequence of the cover colimit, finite-cover Leray and the compact-normal shrinking lemma; 2.5's route uses or generalises these but does not name them. Two licence questions about sources are left to the humans.

## C01 — Section 2.5 names Tau Ceti's general Čech maps and colimit, but not the pinned Čech results its own route uses or generalises

An implementer of 2.5 who follows Demailly IV (5.19)–(5.21) needs the long exact sequence of the cover colimit before the paracompact lifting lemma can be used. Nothing in 2.5 (lines 508–515) or the new Tau Ceti entry (lines 3569–3578) points to the copy at the same pin, so they would likely rebuild it. At the Tau Ceti pin:

- `TauCeti/CategoryTheory/Sites/SheafCohomology/Cech/LongExactSequence.lean` provides `TauCeti.CategoryTheory.cechCohomologyδ` (line 79) and `cechCohomology_exact₁`–`₃` (lines 160, 136, 144). They give the colimit long exact sequence for an abelian coefficient sequence whose Čech complexes are short exact on every family. Demailly's (5.19) is this sequence applied to the presheaf of liftable sections, followed by the lifting lemma (5.20).
- `Cech/ModuleCat.lean` line 43 provides `isZero_cechCohomology_obj_of_forall_exists_homologyMap_eq_zero`: the colimit vanishes once every class dies on a finer family. This is the form in which the lifting lemma is used.
- `TauCeti/Topology/Sheaves/Cech/LocallyZero.lean` line 70 provides `TauCeti.Topology.exists_cechComplexMap_f_eq_zero_of_locally_eq_zero`. It is the refinement-kills-cochains statement on compact normal spaces, of which 2.5's "paracompact shrinking" is the locally finite generalisation.
- `TauCeti/Topology/Sheaves/Leray.lean` line 293 provides `TauCeti.Topology.homologyCechComplexIsoH`, which is Leray's theorem for covers with `[Finite ι]`. 2.5's (5.17) at line 505 is the same statement for arbitrary covers.

Nothing is stated twice, and every 2.5 statement remains true. The smallest repair would add the first two to the consume sentence and to the Tau Ceti entry. It would also add one clause saying that 2.5's Leray and shrinking statements extend the pinned finite-cover and compact-normal cases. A further option is to state (5.21) for the pin's Čech cohomology of a space, `TauCeti.Topology.cechCohomology` (point-neighbourhood covers). On a paracompact M it is identified with the locally finite colimit by `TauCeti.CategoryTheory.cechCohomologyIso` (`Cech/Cofinal.lean` line 169), and RealAnalyticGeometry R3.2 would then receive the canonical object.

## Previous findings

- R01 — repaired: "Consume Tau Ceti's refinement maps of Čech complexes and their independence up to cochain homotopy (`…cechComplexMap`, `…cechComplexMapHomotopy`, `…cechComplexHomologyMap_eq`) and its Čech cohomology over a system of covers (`…cechCohomologyDiagram` … `…cechCohomology`)" (2.5, lines 508–513), with the four names plus `cechCohomology` in the Tau Ceti entry (lines 3569–3578).
- C01 — repaired: the description now reads "4.5 proves that the sheaf of continuous functions is soft, takes the softness of the smooth one from B6.1's module form" and "It no longer states fine-implies-acyclic as its own target", and names "the Scope and ownership entry".
- C02 — repaired: the description says that TopologicalSheafCohomology's scope sentence should name SmoothBundlesConnections B6.1 as owner of soft-sheaf acyclicity, and that TopologicalSheafCohomology does not consume K2. On main, line 12 is unchanged; that sentence sits in that roadmap's own folder.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 2.5 refinement maps, `cechComplexMap` (Basic.lean 278, 285) | point; V=(X,X), U=(X); two maps U⟶V | `d(a,b)=b−a` (δ₀−δ₁); `T₀(a,b)=a`, `T₁(a,b)=b`, differ on (0,1); `T₁−T₀=h∘d`, h the (0,1) component | sound | none |
| 2.5 `cechComplexHomologyMap_eq` (419), `cechComplexMapHomotopy` (377) | same | on H⁰ = diagonal (a,a) both maps give a; raw maps unequal, so the homotopy is needed | sound | none |
| 2.5 cover colimit, `cechCohomologyDiagram` (Colimit.lean 92), `cechCohomology` (127) | S¹ with ℤ; M=∅ | two-arc cover Ȟ¹=ℤ=H¹(S¹;ℤ); on ∅ the empty family refines all, colimit 0 = derived | sound | none |
| 2.5 system "locally finite covers ordered by refinement" | `hE : i≤j → Nonempty (E j⟶E i)` | refinement gives index map with inclusions; covers as subsets of `Opens M`, index in `Type u`, `HasProducts.{u}` and small J hold | sound | none |
| 2.5 (5.19)–(5.21) route vs pinned LES | `0→ℤ→𝒪→𝒪×→1` on ℂ×, one-set cover | z∉exp(2πi𝒪(ℂ×)): not short exact on that family; on two slit planes z lifts; pinned LES needs short exactness | C01 | C01 |
| 2.5 Leray (5.17), line 505 | pin `homologyCechComplexIsoH` | pin has `[Finite ι]` (Leray.lean 293); 2.5 is for arbitrary covers (countable locally finite on non-compact M) | generalises pin | C01 |
| K4.P refinement on frame cocycles (line 1073) | `e_j=e_i g_ij`; f: U_i⊂V_f(i) | `g_ik=g_ij g_jk`; ordered `dg=g_jk−g_ik+g_ij`; i=j=k forces g_ii=1; `e′_i=e_f(i)` gives `g′_ij=g_f(i)f(j)`, the factor at `φ.f∘a` | sound | none |
| Tau Ceti entry hypotheses (3569–3578) | Basic.lean 104–107, 396; Colimit.lean 78–80, 120 | `Preadditive`, `HasProducts.{w}`, `HasFiniteProducts C`; homology for last three; `HasColimitsOfShape J A` for the colimit; no sheaf condition | sound | none |
| Demailly IV (5.17), (5.21) locators | `demailly-agbook` lines 10439–10442, 10512–10513 | Leray for acyclic covers, p. 209; paracompact Čech = derived, p. 211 | sound | none |

Rows for untouched statements stand as in the previous review, of 1b8217e. No Lean declaration changed.

- Source locators checked against the text: 3 (`demailly-agbook` IV (5.17) p. 209, IV (5.19)–(5.21) pp. 210–211, V (8.2) p. 264, lines 10439, 10475–10515 and 13017).
- Library declarations opened at the Tau Ceti pin: 17.
  - `CategoryTheory/Sites/SheafCohomology/Cech/`: Basic.lean 278, 285, 377, 401, 419; Colimit.lean 92, 101, 127; LongExactSequence.lean 79, 136, 144, 160; ModuleCat.lean 43; Cofinal.lean 169.
  - `Topology/Sheaves/`: Leray.lean 293; Cech/LocallyZero.lean 70; Cech/Colimit.lean 70.
- Cross-roadmap citations resolved: TopologicalSheafCohomology (main) line 12 and §§1.1–1.3; RealAnalyticGeometry (main) R3.2 items 5–6, which consume the K2 colimit theorem through a cofinal family of locally finite Stein covers.
- Dependency check: `depcheck: 200 roadmaps, 2206 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Gate rerun on this head: every scanner reports 0, including `outside-folder`; result OK.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 27 `sorry` warnings and nothing else. The file is unchanged since 1b8217e, so the `#check @name` binder comparison and the one-tactic probe of the previous review stand.
- Changes outside the folder: none.

Overlap check: TopologicalSheafCohomology, SmoothBundlesConnections, CalibratedGeometry and ComplexComparisonPartII on main; TeichmullerGeometry, SchrodingerOperatorsAndSpectralTypes and RelativisticQuantumFieldTheory at their open heads. Ownership by object:
- Čech refinement maps, their homotopy and the cover colimit: owner Tau Ceti at the pin, now consumed. TopologicalSheafCohomology §§1.1–1.2 also plans these, but that is a matter for its own folder.
- Paracompact Čech/derived comparison: owner ComplexKahlerGeometry 2.5, as TopologicalSheafCohomology line 12 says.
- Compact Hausdorff module comparison: owner TopologicalSheafCohomology §1.3; it is a different statement.
- Soft-sheaf acyclicity: owner SmoothBundlesConnections B6.1.
- The open roadmaps consume only K1, K4, K5a and K5b and share no Čech object.

Source independence: changed passages only. 4 passages were compared with `demailly-agbook` IV §5 and the pinned Tau Ceti docstrings: 2.5's consume sentence, K4.P's refinement clause, the Tau Ceti entry and 2.5's *Needs* line. None share wording beyond standard declaration descriptions. The diff adds, removes and reorders no layer, so the contents comparison with `demailly-agbook` stands as in the previous review: independent.

Research link: Layer 8's Iwasawa-manifold computation and nilmanifold comparisons are the base of Angella (2012)'s study of the cohomologies of the Iwasawa manifold and its small deformations. K7.FlatDegreeZero's unitary-character lines are the elliptic input of Berwick-Evans and Tripathy (2021)'s de Rham model of equivariant elliptic cohomology. This rests on the README's References and `angella-iwasawa` §4.

## Not verifiable

- Nothing in the changed passages: their locators are all in `demailly-agbook`, which was read.
- The uncertified works listed in the previous review (`koszul-malgrange`, `hormander-alpdo1`, `webster-nn`, `griffiths-harris`, `wells-dacm`, `raghunathan-discrete-subgroups`, `nomizu-nilmanifolds`) are cited only in text this change does not touch.

Automatic checks set aside as false positives: as in the previous review, the citation scan lists two names as found nowhere: `TauCeti.Analysis.Distribution.DeltaSeries` and `TauCeti.Geometry.Symplectic.Manifold.AlmostComplex.Eigenbundle`. Both are module paths whose files exist at the Tau Ceti pin. The scan searches declarations, not modules.

## Source issues

- **Misprint** in demailly-agbook at Chapter IV, (5.22), p. 211: the source says the sign rule for alternate cochains applies to permutations of {1,…,q}; it should be permutations of {0,…,q}, since the cochain is indexed by α₀,…,α_q; affects nothing.

## For the human reviewers

- **Licence.** `knutson-borel-weil` and `rainer-advanced-complex-analysis` are unpublished lecture notes read from their authors' university pages. `hormann-steinbauer-distributions` is a dated draft of lecture notes on an author's page.
- **Licence.** `ballmann-kahler` (EMS, 2006) is read from a third party's course page (people.maths.ox.ac.uk), not from the publisher or the author.
