# GATE-RepresentationTheory~5: answers to human review

Scope note. Both unanswered reviews (roed-math, 2026-10-20T04:31Z on head `6a256ea`, and 2026-10-20T19:54Z on head `5dac6d9`) are about `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md` and `ClassicalGroups/Suggested.lean`. This job may edit only the family index `TauCetiRoadmap/RepresentationTheory/README.md` and `TauCetiRoadmap/RepresentationTheory/Suggested.lean`. Neither of those files contains any of the defects raised, so no review point was repaired in them. The only change is a new `TauCetiRoadmap/RepresentationTheory/Suggested.lean` that the gate requires (commit `41d01d3`). It holds `import Mathlib`, the module docstring and an empty `namespace TauCetiRoadmap.RepresentationTheory`. It declares nothing: the family page is an index that owns no theorem, and every headline theorem is stated in a sub-roadmap's own `Suggested.lean`. Each point below was checked against the branch head `31218ba`. Points already repaired at head are marked *answered*, with the line where the repair sits. Three points (H09, H10, H11) are correct and still unrepaired. They are also marked *answered*, because the brief's four labels have no "valid, not repaired" option. Their repair has to go in `ClassicalGroups/README.md` (and `ClassicalGroups/Suggested.lean`) in a job allowed to edit that roadmap.

## H01 (roed-math) — answered
This was correct for `6a256ea` and is repaired at head: the "equivalently integral GT coefficients" clause is gone. `ClassicalGroups/README.md` lines 663–695 now fix Molev's unnormalised vectors (Thm 2.3/2.7). They fix the highest vector by a lexicographically-first-coefficient-1 rule and give the matrix-unit formulas. They separate the contravariant-norm convention (Prop. 2.4), say explicitly "not a claim that the algebraic basis has integral coefficients", and record the GL₃ adjoint coefficient product `1/2`. Recomputed: `[E₃₂,H]=−X` and `[E₂₃,X]=E₂₂−E₃₃=−½H+½K`, so the product of the rescaled coefficients is `(−a/b)(−b/2a)=1/2`.

## H02 (roed-math) — answered
This was correct for `6a256ea` and is repaired at head. `ClassicalGroups/README.md` lines 699–714 define the column-ordered Capelli determinant `A_k(u)` and take generator `(k,r)` to be its `u^(k−r)` coefficient. They also give the eigenvalue `e_r(P_(1,k),P_(2,k)−1,…,P_(k,k)−k+1)` and assign centrality, generation, block compatibility and the determinant shift. `ClassicalGroups/Suggested.lean` lines 303–357 (`gtGenerator`, `gtEigenvalue`, `capelliGenerator_eq_gtGenerator`) match.

## H03 (roed-math) — answered
This was correct for `6a256ea` and is repaired at head by Layer 3A (`ClassicalGroups/README.md` lines 406–548). That layer gives:
- explicit maximal tori and group character lattices `ℤ^r`;
- types B/C/D with their roots;
- the integer dominance conditions (D: `λ_(r−1) ≥ |λ_r|`);
- the statement that the `sl₂` weight-1 module does not descend to SO₃ (SO₃ weight `m` ↦ `sl₂` weight `2m`);
- the small-rank cases SO₀–SO₄ and Sp₀, Sp₂;
- a direct exterior-power construction of every admissible irreducible.

Its group/Lie comparison input is still defective; see H09.

## H04 (roed-math) — answered
This was correct for `6a256ea` and is repaired at head. `ClassicalGroups/README.md` lines 375–376 and 437–440 now say that RootSystems supplies only root, coroot and Weyl geometry. The weight lattice, dominant integral weights and ρ comparison are built in Layer 3A with LieHighestWeight, "not claimed as outputs of RootSystems".

## H05 (roed-math) — answered
This was correct for `6a256ea` and is repaired at head. Layer 6B (`ClassicalGroups/README.md` lines 727–823) builds primed rows, Hom-space bases and evaluation maps resolving symplectic multiplicities, and line 720 refers to it. The cited obstruction holds: `ℂ⁴↓Sp₂ ≅ ℂ² ⊕ 1 ⊕ 1`, because Sp₂ acts on one symplectic plane and fixes the complementary plane pointwise.

## H06 (roed-math) — answered
The dependency stands. `ClassicalGroups/README.md` lines 574–588 consume SchurWeyl Layer 7 at commit `149fe79` (`LRTableau`, reading word, product formula). Main's SchurWeyl README has a Layer 7 (line 323) but no `LRTableau`. The revising SchurWeyl pull request is still open at `a9501b7` and still defines `LRTableau inner outer ν` with `c = Nat.card (LRTableau …)` in its Layer 7. So that revision, or an equivalent merged supplier, has to land before ClassicalGroups merges. This is a merge-plan prerequisite, not an edit.

## H07 (roed-math) — answered
This was correct for `6a256ea` and is repaired at head. `ClassicalGroups/README.md` line 40 reads "**image of the Brauer algebra**, equivalently its quotient by the action kernel". Line 552 repeats "image/quotient … identify its kernel and stable faithful range". The O₁ example checks out: the commutant of O₁ = {±1} on `(ℂ¹)^{⊗2}` is 1-dimensional, against `dim B₂(1) = 3`.

## H08 (roed-math) — answered
This was correct for `6a256ea` and is repaired at head. `ClassicalGroups/Suggested.lean` lines 82 and 94 now say the imported native finite-dimensional instances are consumed. `char_tensorPowerRep` (line 95) carries no extra `FiniteDimensional` hypotheses.

## H09 (roed-math) — answered
This is correct and **not repaired at head**. `ClassicalGroups/README.md` line 481 consumes "LieHighestWeight Layer9's connected rational fixed-vector comparison" at smooth connected affine reductive scope. LieHighestWeight Layer 9 on main has only the GLₙ bridge, and that bridge consumes ClassicalGroups Layers 2–4 ("For its polynomial comparison consume the concrete Schur modules of ClassicalGroups Layers 2–4"). That gives the cycle Layer 3A → LHW 9 → CG 4 → 3A, as stated. The generic comparison appears only in the open LieHighestWeight revision (its line 1803 and its ordering paragraph). The brief excludes a revision pull request as a supplier, and ReductiveGroups on main supplies only the tangent/Cartier cut (Layer 2, Layer 5P), not `Hom_G(V,W) ≃ Hom_Lie(G)(dV,dW)`. The repair is the reviewer's first option: in `ClassicalGroups/README.md` Layer 3A, own the generic statement (or its SO/Sp specialisations) on ReductiveGroups Layer 2/5P inputs. That repair is outside this job's editable files.

## H10 (roed-math) — answered
This is correct and **not repaired at head**. `ClassicalGroups/README.md` lines 550–552 still only say to "retain the separate index-two SO extension/induction problem" and to "give the actual component action … before deciding extension versus induction". No component representative, extension/induction result or O₂ case is stated. The proposed contract is mathematically right:
- `O_(2r+1) = SO_(2r+1) × {±I}`, since `−I` is central with determinant `−1` in odd dimension.
- A reflection in O_(2r) swaps `u_r ↔ v_r` and sends `λ_r ↦ −λ_r`.
- `O₂ = G_m ⋊ μ₂` has two characters over the zero weight and a 2-dimensional induced irreducible for each pair `±m`, `m > 0`.

InductionRestriction's Clifford correspondence on main is for finite ambient groups, so it does not cover this. The repair belongs in `ClassicalGroups/README.md` Layer 3A and is outside this job's editable files.

## H11 (roed-math) — answered
This is correct and **not repaired at head**. `ClassicalGroups/README.md` lines 717–725 still dispose of `SOₙ ↓ SOₙ₋₁` with "the classical orthogonal Gelfand-Tsetlin construction". There are no B/D pattern carriers, embeddings, normalisation or basis targets. `ClassicalGroups/Suggested.lean` has no orthogonal pattern, branching or basis declaration. The two interlacing rules quoted (Molev §4: `λ_r ≥ |μ_r|` for `𝔬_(2r+1) ↓ 𝔬_(2r)`, and `μ_(r−1) ≥ |λ_r|` for `𝔬_(2r) ↓ 𝔬_(2r−1)`) are the standard ones. An orthogonal Layer 6C (or a narrower scope claim) is needed in `ClassicalGroups/README.md`, outside this job's editable files.

## H12 (roed-math) — answered
Same dependency as H06. The SchurWeyl revision carrying Layer 7's `LRTableau` contract is still open (head `a9501b7`), and the ClassicalGroups citation at `149fe79` is unchanged. It stays an integration prerequisite of ClassicalGroups.

## Adversarial pass

No statement was added or changed. The rows below are the computations behind the verdicts.

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| H01: GT coefficients cannot all be integers | `sl₃` adjoint, H=diag(1,−1,0), K=diag(1,1,−2), X=E₃₂ | `[E₃₂,H]=−X`; `E₂₂−E₃₃=−½H+½K`; rescaled product `1/2` | reviewer right; repaired at head |
| H03: Lie weight 1 does not descend to SO₃ | SL₂ → SO₃ = SL₂/{±I}, standard L(1) | `−I` acts by `−1 ≠ 1` | reviewer right; head line 472 records it |
| H05: Sp branching not multiplicity-free | standard Sp₄ ↓ Sp₂ | `4 = 2 + 1 + 1`, trivial multiplicity 2 | reviewer right; Layer 6B repairs it |
| H07: Brauer action not faithful | O₁ on `(ℂ¹)^{⊗2}` | commutant dim 1 vs `dim B₂(1) = 3` | reviewer right; repaired at head |
| H09: supplier scope | LHW Layer 9 on main | GLₙ-only bridge consuming CG Layers 2–4 | cycle confirmed; not repaired |
| H10: odd O splits | `−I ∈ O_(2r+1)` | `det(−I) = (−1)^(2r+1) = −1`, central | contract right; not repaired |
| H10: O₂ irreducibles | `G_m ⋊ μ₂`, weight `m` | orbit `{m,−m}`; induced dim 2 for `m>0`, two characters for `m=0` | contract right; not repaired |

`#check` comparison: not needed. The new family-index `Suggested.lean` declares nothing, and no other Lean declaration was added or changed.

## Ownership against open work
Checked by object for the generic fixed-vector comparison: on main, it is in neither LieHighestWeight nor ReductiveGroups. Among open pull requests, it is only in the LieHighestWeight revision, which the brief excludes as a supplier. The `LRTableau` supplier is open only in the SchurWeyl revision.

## Sources
No new source was fetched and `sources.toml` is unchanged. The reviewer's Molev arXiv:math/0211289 locators (§§2, 4) are already cited in `ClassicalGroups/README.md` line 1234 for §§2.1–2.4 and 3.1–3.4. A §4 citation will be needed when H11 is repaired. `needs-references.toml` was not created.

## Build and gate

- `lake build TauCetiRoadmap.RepresentationTheory.Suggested`: `Built TauCetiRoadmap.RepresentationTheory.Suggested`, `Build completed successfully (8976 jobs).`
- Gate: `gate RepresentationTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 162 roadmaps, 1169 edges, 0 problem(s)`, with no UPWARD or CYCLE line.

No suspicious instructions were found in the review text.
