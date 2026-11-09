# Review of NoncompactQuantumSymmetry (pull request #1015 at 4e793e8)

**Verdict:** needs changes

This is an incremental re-review of the 30 lines (18 insertions, 12 deletions, all in `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md`) changed since a304a46; `Suggested.lean` and `metadata.toml` are byte-identical to the head the previous review read, and nothing outside the folder changed. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with five `sorry` warnings and nothing else. Both new repairs (the Tau Ceti selector for central circle extensions, the CStarAlgebras and UnboundedOperators supplier rows) are correct. The two findings below are the two carried from the previous review that this head does not address; both are P3 and neither touches the folder's mathematics.

## R01 (P3) — Three OperatorAlgebraDynamics ids exist only at that roadmap's open revision #1137, which the description does not name

Carried from R03 of the previous review (R07 and R05 of the two before). No repair report marks it not actionable.

**Location:** README `:195` (supplier row "OperatorAlgebraDynamics D1.BorelPrefix, D1.TwistedBorel, D4.Harmonic"), `:1284`, `:1596`, `:1882` and the other occurrences the overlap report lists (D1.BorelPrefix at `:19, :195, :282, :406, :1284, :1595, :1904, :1928, :2222, :4391`; D1.TwistedBorel at `:1910`); `Suggested.lean:21`.

**Claim:** an id this roadmap cites that only an open revision defines is named, as a revision that merges first, in the description or its merge-order paragraph.

**Witness:** the overlap report (computed from main 172efce and the open heads) lists D1.BorelPrefix and D1.TwistedBorel as defined by #1137 at its head and not on main. The description's revision line reads "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1145", and its merge-order chain ends "#1063 (MetaplecticAutomorphicForms) → #1145 (SmoothBanachRepresentations) → this pull request"; #1137 appears in neither. #1145 adds the new folder SmoothBanachRepresentations and is not a revision of a roadmap on main.

**Repair:** nothing in the folder changes. Name #1137 (OperatorAlgebraDynamics) in the description's revision line and in its merge-order chain before this pull request.

## R02 (P3) — Size: split into a Part II

Carried from R04 of the previous review (R08 of the one before). No repair report addresses it.

**Location:** the folder. The README has 9,496 lines (699,245 bytes), up from 9,490. Layer 8 (M5) spans `:3869–6507` and Layer 9 (M6) spans `:6508–9464`.

**Witness:** the consumers at open heads use Layer P, M0, M2/M4 and the helicity models, not the M5 all-sequence tables or the M6 pair, exchange and tree tables: QuantumFoundations (#1771 `:65–66`), RelativisticQuantumFieldTheory (#1772 `:60–64`), QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (#1842 `:121`, `:244`).

**Repair:** as in the previous review. Move M5.DeSitterNullZero and M5.DeSitterRemainingTransitions, M5.StructuralModelComposition and the M6 tables after M6.MeasuredPair into "NoncompactQuantumSymmetry, Part II", whose introduction says that the base roadmap stops at M5.DeSitterFiber (`:4985`) and the M6.MeasuredPair interface.

## Previous findings

- R01 — repaired: `:1603–1609` now applies `TauCeti.exists_measurable_forall_mem` to `M(x)=q⁻¹{x}` (closed cosets of 𝕋, nonempty, `{x : M(x)∩U≠∅}=q(U)` open) and normalizes by `s(1)=1`; the nested-balls sentences are gone. Each hypothesis of the pinned theorem is checked in row 35.
- R02 — repaired: row `:201` now lists C2.2's nonzero irreducibility predicate, C2.3 (`K(H)⊆π(A)`, equal kernels ⇒ equivalence, no separability), C2.AnnHull's `hull(Ann I)=closure(U_I)`, C5.2 and C6.2/C6.5; Layer 8 Dependencies `:6506` list the same. Every item exists on main (rows 37–38).
- R03 — not repaired: the description still names only #1145 (R01 above).
- R04 — not repaired: 9,496 lines (R02 above).

## Verified sound

**Gate** (my run on this head): `gate NoncompactQuantumSymmetry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate records the same with `build=0`.

- `git diff --stat a304a46..HEAD`: one file, `README.md`, 18 insertions and 12 deletions; nothing outside the folder; `Suggested.lean` unchanged.
- The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**Dependency check** (`--movable`): `depcheck: 238 roadmaps, 2353 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. NoncompactQuantumSymmetry is line 154 of the merge order; CStarAlgebras is line 7. UnboundedOperators is not on main and not in the order: it is the new folder `TauCetiRoadmap/OperatorTheory/UnboundedOperators/` of #1027, which the description's merge-order chain already names.

**Build.** `lake env lean` on `Suggested.lean` (12.5 s) warns `declaration uses sorry` at `:89`, `:137`, `:161`, `:234` and `:273`, and nothing else.

**Signatures.** I re-elaborated the worker's `#check @name` file for all 14 declarations. The five "dropped `[IsClosed (H : Set G)]`" leads are false: `[IsClosed ↑H]` occurs six times in the elaborated types (`InducedModelData`, `isotropy`, `rnDerivative`, `sectionAction`, `exists_inducedRepresentation`, `exists_induced`). The file is unchanged since the previous review, whose full comparison with the README stands.

**Padding and headlines.** `Suggested.lean` is byte-identical to a304a46; the previous review's one-tactic probe (none of the five `sorry`s closes) and headline list (Wigner, Glimm in three forms, Becker–Kechris, the `Lp` induced representation, Mackey imprimitivity stated; the composition-series form, the Fell/hull-kernel homeomorphism and the M1–M6 carriers named in the docstring as not statable) carry forward unchanged.

**Seeded sample.** None of the fifteen sampled targets falls in a changed passage: the changes are the two supplier rows (`:201–202`), two M1 selector paragraphs (`:1603–1609`, `:1744–1750`), one sentence of M5.PoincareDual (`:4883–4885`, which begins at `:4690`) and the Layer 8 Dependencies (`:6506`). The sampled M5 targets were checked by the previous review (its rows 14–21); their text is untouched.

**Adversarial table.** Rows 1–34 are the previous report's rows for statements the diff leaves untouched (each cited by its number there); rows 35–40 are computed here for the changed statements.

| # | Statement | Instance | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 1–29 | `separable_typeI_tfae` and its three predicates; the M3 momentum model, time reversal, generators and `F_ℏ`; the actual stabilizer geometry and cocycle; M5.LittleDual.CoefficientSequence; M5.CompactInductionSupport and its Echterhoff locators; M5.InducedLorentzSupport (trivial row, Haar and limit, D_n row); shared compact-subgroup exclusion; all-sequence classification; the M6 momentum, massive/null, pair-geometry, principal-input, exchange, Young-field and tensor-coherence rows; M2.DerivedDI | as in the previous report | as in the previous report, rows 1–29 (text unchanged at this head, line numbers shifted by at most 6) | Pass (carried) |
| 30 | Selector `:1604–1609` (previous row 30) | nested-balls route | re-planned a pinned theorem | Fail then; repaired now: row 35 |
| 31 | CStarAlgebras contract (previous row 31) | C2.3 | absent from the row then | Fail then; repaired now: rows 37–38 |
| 32–34 | Brennich, ABF24 and BekkaDeLaHarpe2019 locators (previous rows 32–34) | as there | as there | Pass (carried) |
| 35 | Circle-extension Borel section `:1603–1609` | `q:E→G` open continuous surjective, kernel 𝕋 central closed, E Polish; `M(x)=q⁻¹{x}`; Z=G with its Borel σ-algebra | pinned `TauCeti.exists_measurable_forall_mem` (`Selection.lean:151`) needs `[PolishSpace E]`, `IsClosed (M x)`, `(M x).Nonempty`, `MeasurableSet {x | (M x ∩ U).Nonempty}` for open U. `M(x)=e·𝕋` for any e with q(e)=x: a translate of the closed kernel, closed; nonempty by surjectivity; `{x : M(x)∩U≠∅}={q(e) : e∈U}=q(U)`, open since q is open. Normalization: `s′=s` off `{1}`, `s′(1)=1∈q⁻¹{1}=𝕋`; `s′⁻¹(B)=(s⁻¹(B)∖{1})∪({1} if 1∈B)` is Borel. Degenerate G={1}: `M(1)=𝕋`, `s′(1)=1` | Pass |
| 36 | G⁺-valued section `:1744–1750` | G lcsc Hausdorff (`:1681`), `ε:G→ℤ/2` continuous, `G⁺=kerε`, H closed, `X=G/H`, `M(x)=q⁻¹{x}∩G⁺` | ℤ/2 discrete, so G⁺ is clopen; `q⁻¹{x}=gH` closed (H closed), so `M(x)` is closed; `M(x)≠∅ ∀x` iff G⁺ meets every coset iff `G⁺H=G` iff G⁺ transitive; `{x : M(x)∩U≠∅}=q(U∩G⁺)`, open since `U∩G⁺` is open and q is open; G is Polish (lcsc Hausdorff group), so the pinned theorem applies and the section lands in G⁺, hence `ε(s(x))=0` and the isotropy element `s(gx)⁻¹ g s(x)` has grade ε(g). Equivalences: an odd `h∈H` gives `G=G⁺∪G⁺h⊆G⁺H`; conversely `G=G⁺H≠G⁺` gives an odd `g=g⁺h` with `h=(g⁺)⁻¹g` odd. Negative control `H⊆G⁺`, ε≠0: `G⁺H=G⁺≠G`, `M(x)=∅` on the odd coset class, the theorem does not apply, and X has the two G⁺-orbits the text states. ε=0 recovers the ordinary section of `:1306` | Pass |
| 37 | CStarAlgebras row `:201`, items | each cited section on main | C2.2 `:568` (`IsIrreducible` at its `Suggested.lean:102`, body identical to `IsIrreducibleRep` at `Suggested.lean:109–112` here: `∃ a, π a ≠ 0` and closed invariant subspaces trivial); C2.3 `:616` (one nonzero compact in π(A) ⇒ `K(H)⊆π(A)`; equal kernels ⇒ equivalence; no separability); C2.AnnHull `:695`, `hull(Ann(I))=closure(U_I)` at `:715`; C5.2 `:1143–1153` (`C₀(X)⊗min A≅C₀(X,A)` for lch X, `C(X)⊗min C(Y)≅C(X×Y)` by `f⊗g↦f(x)g(y)` with pullback naturality); C6.2 `:1297–1305` (nuclear ⇔ `A⊗max B→A⊗min B` iso for every B); C6.5 `:1414–1422` (explicit CP approximations for `C₀(X)`). Consumers: `:716–720` (C2.3), `:4468`, `:4477`, `:4504` (AnnHull), `:4883–4885` (C5.2, C6) | Pass |
| 38 | Layer 8 Dependencies `:6506` | ids listed | "CStarAlgebras C1/C2 (with C2.AnnHull), C5.2 and C6.2/C6.5" equals the set the row `:201` names and the set Layer 8 cites (`:4468`, `:4477`, `:4504`, `:4883–4885`) | Pass |
| 39 | UnboundedOperators row `:202` | UO-E03 at the #1027 head (`OperatorTheory/UnboundedOperators/README.md:881–895`); UO-B04 `:417`, UO-B05 `:435` | UO-E03: symmetric S with dense invariant `D⊂⋂dom(Sⁿ)` and `‖Sⁿx‖≤C_xR_xⁿn!` is essentially self-adjoint; a finite family pairwise commuting on D with mixed-word bounds `‖S₁^{n₁}⋯S_k^{n_k}x‖≤C_xR_x^{|n|}|n|!` has strongly commuting self-adjoint closures and a joint PVM. This is the row's statement word for word in content. Consumers `:855`, `:974` (vectors analytic for the closure of dπ(Z), with UO-E03's factorial bounds), `:985`, `:1196`, `:1219`: the "analytic-vector and central closures" the consumer cell names. UO-B04/B05 (joint PVM, multiparameter Stone with `U(t)=exp(iΣt_jA_j)`) unchanged from the previous head | Pass |
| 40 | Radial tensor comparison `:4880–4885` | `C₀((0,∞)×L/K)⋊L≃C₀(0,∞)⊗(C₀(L/K)⋊L)`, L acting trivially on (0,∞) | `C₀((0,∞)×L/K)≅C₀((0,∞),C₀(L/K))≅C₀(0,∞)⊗min C₀(L/K)` by C5.2 with X=(0,∞) locally compact Hausdorff; the trivial-action factor passes out of the crossed product up to `⊗max` (D1's tensor comparison), and `C₀(0,∞)` nuclear (C6.5) makes `⊗max=⊗min` (C6.2). Degenerate K=L: both sides `C₀(0,∞)⊗C*(L)`. X a point in `widehat(C₀(X)⊗B)≃X×B̂`: both sides B̂ | Pass |

**Library declarations opened at the pins.**

- Tau Ceti `MeasureTheory/MeasurableSpace/Selection.lean:151` (`exists_measurable_forall_mem`: `[PolishSpace X] [BorelSpace X]`, `hclosed`, `hne`, `hM` for open U; conclusion `∃ f, Measurable f ∧ ∀ z, f z ∈ M z`).
- The previous review's list (Nondegenerate, Adjoin, Unitary/Basic, Action/Covariant, CrossedProduct/Full and Multiplier, TensorAction, StarProjection) is unaffected: `Suggested.lean` and the README passages citing them are unchanged.
- The citation tool's five Lean-name leads: four are this roadmap's own `Suggested.lean` declarations (`exists_inducedRepresentation :234`, `rnDerivative`, `sectionAction`, `exists_induced :273`, all in the elaborated-signature list), the fifth is InductionRestriction's `Gassmann.almostConjugate_iff_permutation_equiv` (`RepresentationTheory/InductionRestriction/Suggested.lean:729` on main).

**Cross-roadmap citations resolved.**

- CStarAlgebras on main: C2.2 `:568`, C2.3 `:616`, C2.AnnHull `:695–734`, C5.2 `:1143`, C6.2 `:1297`, C6.5 `:1414`.
- UnboundedOperators at the #1027 head: UO-B04 `:417`, UO-B05 `:435`, UO-E03 `:881`; the roadmap is not on main (`roadmaps grep 'UO-E03'` finds it only there and in its consumers #1771, #1772 and this one).
- Overlaps: no open pull request changes this roadmap; no id this README cites is dropped; D1.BorelPrefix and D1.TwistedBorel are defined only by #1137 (R01).

**Ownership.** The change adds no construction: every new sentence consumes a named supplier section or the pinned selection theorem. The previous review's searches (Glimm, Wigner, imprimitivity, the SL(2) Plancherel cases) stand for the untouched text.

**Remarks on untouched text** (no change requested): `:2177` cites "CStarAlgebras C5" without a subsection, while the row now cites C5.2; `:1747` gives "G⁺ is clopen" as the reason the values are closed, where closedness of the coset `gH` (H closed) is the other half, stated two paragraphs earlier at `:1716`.

## Not verifiable

- Mackey1958 §6: settled as uncertified; cited by locator only.
- The README flags no locator as unverified, and no changed passage cites a source: the changes cite Tau Ceti and roadmap sections only, all resolved above.
- Brennich (1970), Lang, Primet, Fell, Bacry–Lévy-Leblond and Nelson lie in untouched text; the previous reviews' notes on them stand.

## Source issues

- none
