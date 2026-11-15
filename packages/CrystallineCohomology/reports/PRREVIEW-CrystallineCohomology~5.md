# Review of CrystallineCohomology (pull request #857 at b97c462)

**Verdict:** accepted

No findings. Incremental re-review of 4 changed lines since `5231bad`, with the title and description read against this head.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/CrystallineCohomology/README.md:7293` and `:7562` now read “the product formula `Tr_{X×Y}=Tr_X⊗Tr_Y`”, inside a code span; the gate reports `tex=0`.
- R02 — repaired: the description now says “This pull request adds the new roadmap `TauCetiRoadmap/CrystallineCohomology`: README.md, Suggested.lean and metadata.toml”, which matches the base-to-head diff (3 files added, 0 deletions).

## Verified sound

The diff changes no statement; the rows are for the two statements the changed text cites. ε_d = `(−1)^{d(d−1)/2}` (README:7230).

| Statement | Instances tried | Left-side value | Right-side value | Result; change |
| --- | --- | --- | --- | --- |
| Trace product identity in *Proper smooth crystalline trace*, README:7292–7293 | (d,e) = (0,0), (1,1), (2,1), (2,2); X=Y=ℙ¹ with class h₁h₂; X=Y=point | ε_(d+e) = 1, −1, −1, 1; Tr_(ℙ¹×ℙ¹)(h₁h₂)=1; point: Tr(1)=1 | `(−1)^{de}ε_dε_e` = 1, −1, −1, 1; Tr(h)·Tr(h)=1; 1·1=1 | Equal in every instance; only the code span changed |
| Same identity on a non-pure class | ℙ¹×ℙ¹, class (h₁+h₂)² | Tr_(X×Y) = 2 (coefficient of h₁h₂ in 2h₁h₂) | Künneth components: 2·Tr(h)Tr(h)=2 | Equal; no change |
| Product-trace reference in *Diagonal class and crystalline coevaluation*, README:7562 | X=ℙ¹, [Δ]=h₁+h₂; X=point | pr₂,*([Δ])=1, pr₂,*([Δ]·h₁)=h₂; point: [Δ]=1 | Identity correspondence: 1↦1, h↦h; 1↦1 | Equal; sign (−1)^i trivial for i=0,2; only the code span changed |

The adversarial rows for untouched statements stand as in the previous review, of `5231bad`.

- Changed passages: 2 lines, both the same formatting repair; the cited target title *Proper smooth crystalline trace* resolves to README:7196, and the sign law used at README:7292 is the API bullet at README:7232. None of the seeded sample targets lies in a changed passage.
- Title and description read against the head, 14 claims checked: the title equals the README title; the three `Suggested.lean` declarations named (block decomposition, monodromy nilpotence, Φ–N structure) are the three the file declares; §§CR.DDR.* headings exist; CR.4.6 holds the cusp computation and its Check (README:6481, 6497) and consumes DiamondsAndVStacks D6.9; LocalPurity, PurityOfBranchLocus, AbhyankarLemma and DiamondsAndVStacks are on main; the connection carrier shared with ComplexComparisonPartII and FormalConnectionsOpers is README:129–133; “p need not be nilpotent on S” is README:250.
- Cross-roadmap claims of the description resolved at open heads: AbelianSchemesAndArithmeticModuli §A4.CR.7.2 (its README:2143), LocallyAnalyticDistributions §0.CR.6.6 (its README:14, 42), DerivedDeRhamCohomology §§PD.1, PD.2, PD.4–PD.7 (no §PD.3 exists there, so the description's range “§§PD.1–PD.7” names the same sections as the README); ArithmeticGaloisDuality and AlgebraicModuliForArithmeticGeometry cite this roadmap as consumers.
- Remark, no change asked: the description's “Section-level suppliers” sentence is a selection and says the README's supplier contracts are definitive; the README also consumes DGAInfinity, JacobianChallenge, EllipticCurves and EtaleCohomologyFoundations, all on main, so no merge-order consequence.
- Gate rerun at `b97c462`: every counter zero (`tex=0`, `depcheck=0`, `outside-folder=0`), `OK`. Dependency check: `depcheck: 245 roadmaps, 2215 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/CrystallineCohomology/Suggested.lean`: two warnings, both `declaration uses sorry` (lines 49 and 82), nothing else. The file is unchanged since `5231bad`; the three elaborated signatures match the README statements with no lost binder.
- Files changed outside the folder against the base: none (`git diff --stat origin/main...HEAD` outside the folder is empty; the files listed since `5231bad` come from merging main).
- Overlaps: no other open pull request changes this roadmap; no cited id dropped; no second copy on main.

Overlap check: read DerivedDeRhamCohomology, PrismaticCohomologyPartIV, AInfCohomology, PrismaticCohomology, PrismaticCohomologyPartII, DerivedModuleAlgebra, EnhancedDerivedSheaves, PerfectoidSpaces; ownership is as in the previous review (PD and derived de Rham constructors: DerivedDeRhamCohomology; module completion: DerivedModuleAlgebra; enhanced descent: EnhancedDerivedSheaves; integral perfectoid predicate: PerfectoidSpaces); the change shares nothing new.

Source independence: changed passages only; 2 passages compared with 0 sources, none shared: the change adds only code-span delimiters around one formula and no wording, so there was no source text to set beside it. Largest share Stacks Project, 82 of 370 locators, as counted in the previous review; no layer was added, removed or reordered, so the contents comparison was not reopened.

## Not verifiable

- CTSS (carried from the previous review): no legal full text found by the sources service; its bibliography entry stands as a citation by locator only. Untouched by this change.

## Source issues

- none

## For the human reviewers

- Kato's course-page copy has an unresolved host classification; the passages at `TauCetiRoadmap/CrystallineCohomology/README.md:9042` and `:9108` keep their Kato citations, with Beilinson §§1.7–1.8 as the independently read supporting source (carried from the previous review).
