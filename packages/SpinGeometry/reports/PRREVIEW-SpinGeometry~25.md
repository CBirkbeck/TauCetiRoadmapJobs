# Review of SpinGeometry (pull request #1780 at 4e5e6a0)

**Verdict:** accepted

Incremental re-review of the 66 lines of `TauCetiRoadmap/SpinGeometry/` changed since `a2b366b` (9 insertions, 57 deletions). The four findings of the previous report are repaired, the repairs introduce no new problem, the gate passes and the file elaborates. No finding remains.

## Previous findings (PRREVIEW-SpinGeometry~23 at `a2b366b`)

- R01 — repaired: `Suggested.lean:33–36` now reads "the pins have no second Stiefel–Whitney class of a real vector bundle (their Stiefel–Whitney classes are those of quadratic forms over fields) and no twist of a principal `Spin(n)`-bundle by a principal `ℤ/2`-bundle".
- R02 — repaired: the section `QuaternionicKernelParity` and the docstring clause are gone; `README.md:1583` says "apply the G6.7-owned parity theorem (a conjugate-linear J with J²=−1 …" and `:1612–1613` "the parity theorem stated in this item", with no backticked name.
- R03 — repaired: `README.md:431–432` cites only `trace_mulLeft_eq_two_pow_mul_scalarTrace` for the regular trace; `:437` reads "e_I (`basis_eq_prod_map_sort`; Nicolaescu §12.1.2, p. 629)".
- R04 — repaired: the description now says #1674's `Suggested.lean` "states the rank-two Spin criterion of its G4.4a (`nonempty_spinStructure_iff_exists_eulerClass_eq_two_smul`) with the definition `SpinStructure`" and lists the five declarations this head adds.

## Verified sound

**Gate.** Worker's run at `4e5e6a0`: every check passed, `build=0`. My run: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty; the worktree is clean.

**Dependency check.** `gate --depcheck … --name SpinGeometry --movable --pr 1780` prints `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.

**Pins.** `lake-manifest.json` pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`; the checkouts under `.lake/packages` are at those revisions.

**Elaboration and signatures.** `lake env lean` on `TauCetiRoadmap/SpinGeometry/Suggested.lean` exits 0 with exactly two `declaration uses sorry` warnings (lines 72, 107). `#check @name` on a scratch copy for the five declarations (`cliffordMultiplication`, `IsGeometricAction`, `cliffordMultiplication_anticommutator`, `diracInFrame`, `diracInFrame_eq`): the types are those of the previous report, unchanged by this diff. `diracInFrame` keeps `[∀ x, NormedAddCommGroup (W x)]` and `[∀ x, InnerProductSpace ℂ (W x)]` (instances 7 and 8 of the elaborated type; `W x` occurs in the result type), so the tool's "lost binder" lead is again a false positive.

**One-tactic probe.** Each `sorry` replaced on a scratch copy by `first | (simp; done) | (rfl; done) | (infer_instance; done) | (exact?; done) | (simp [cliffordMultiplication, IsGeometricAction, diracInFrame] at *; done) | (unfold diracInFrame; simp [OrthonormalBasis.sum_repr]; done) | sorry`: both theorems keep their `sorry`. Neither is padding.

**Headlines.** The file states the two statable headlines (G1.2 polarized relation, G6.1 frame independence). Its docstring names the Tau Ceti theorems that prove the G1–G2 algebra and lists five not-statable headlines with their missing carriers. The sentence "each admitted with `sorry`" (line 8) is now true of every theorem in the file.

**Changed passages, checked in full.**
- R01's reason at the pin (Tau Ceti `2fd255d9`): the only files matching `StiefelWhitney` are the ten under `TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/` (classes of quadratic forms over fields); no vector-bundle `w₂` exists, and nothing under `TauCeti/Topology/FiberBundle/` twists a principal bundle by a principal ℤ/2-bundle (as read in the previous report). The docstring no longer denies the principal-bundle and frame-bundle carriers the pin has.
- R03's locator: the statement that the ordered monomials of an orthonormal basis form a basis of the Clifford algebra is at `nicolaescu` lines 29358–29362, under page marker 641, printed p. 629. It supports the ordered-product-basis sentence it is now attached to.
- R02's removal: `roadmaps grep` finds `even_finrank_of_conjLinear_square_neg` only in main's copy of this roadmap's `Suggested.lean`; no other roadmap, on main or at an open head, cites the name, so dropping the declaration breaks no citation. The README names nothing in backticks that the file does not declare (`readme-ids-missing=0`).
- R04: #1674's `Suggested.lean` at its head declares `structure SpinStructure` (line 79) and `theorem nonempty_spinStructure_iff_exists_eulerClass_eq_two_smul` (line 117) and nothing else; its docstring has the sentences about the pointwise contraction (line 40) and abstract parity (line 49) that the description says the rebase revises. No fully qualified name is declared by both heads.

**Overlaps (`overlaps.md`, each item rechecked).**
- #1674 conflicts in both files; the order "#1674 → this pull request" is in the description's merge-order block.
- ComplexKahlerGeometry `#k5-compact-hermitian-elliptic-theory-and-serre-duality` (`README.md:195`): each of the four revisions that drop the anchor maps the id. #1234: "K5 is now Layer 5" (line 366); #1807: line 551 maps `K5` and the anchor to Layer 5; #1808: line 567 maps `K5` → Layer 5 and `K5a` → 5.1–5.8; #1854: the former-numbering table row at line 529. All keep the heading "Layer 5: … (K5)". The citation needs no change.
- No id of SpinGeometry that this pull request drops is cited elsewhere; `citations.md` lists nothing found nowhere.

**Seeded sample.** The targets of the sample that fall in the changed passages are G1.3 (the moved Nicolaescu locator, verified above) and G6.7 (the parity statement, recomputed below). The other Nicolaescu locators are untouched and stand as verified in the previous report (17 of 18 agreed; the eighteenth was R03, now repaired).

**Adversarial table.** Rows for the passages this diff changes carry values computed this round; the rows for untouched statements are carried from PRREVIEW-SpinGeometry~23, which lists their values.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| G6.7 parity theorem, now prose (`README.md:1583–1586`, Check `:1616–1618`) | J(z₁,z₂)=(−z̄₂,z̄₁) on ℂ²; J(z)=az̄ on ℂ; V=0 | J²(z₁,z₂) = J(−z̄₂,z̄₁) = (−z₁,−z₂), dimension 2 even; on ℂ, J²z = a·conj(a z̄) = \|a\|²z ≠ −z, so none in dimension 1; V=0: dimension 0 even, J=0 satisfies J²=−1 vacuously; general: J = A∘conj gives A·Ā = −1, so \|det A\|² = (−1)^(dim V), forcing dim V even | Pass; Spin-equivariance not used, as the text says |
| G1.3 ordered-product basis with the moved locator (`README.md:434–439`) | Cl(0,1), b=(e); Q=0 on ℝ | basis {1, e} = {e_∅, e_{1}}, empty coordinate of x+ye is x = τ; τ(reverse(e)e) = Q(e) = −1 resp. 0, matching δ·ΠQ(e_i); source at p. 629 states the monomial basis for an orthonormal basis | Pass; the locator supports the basis statement, the degenerate case rests on the Tau Ceti citation |
| G1.3 regular trace, locator removed (`README.md:431–432`) | Cl(0,1); Q=0 on ℝ | L_(x+ye) = [[x,−y],[y,x]], trace 2x = 2¹τ; Q=0: [[x,0],[y,x]], trace 2x | Pass; cited to `trace_mulLeft_eq_two_pow_mul_scalarTrace` alone |
| Docstring, not-statable list (`Suggested.lean:26–40`) | each carrier at the pin | no vector-bundle w₂ (only quadratic-form classes), no ℤ/2-twist of principal bundles, no Dirac operator, bundle Sobolev space, KO or spinor bundle; principal and frame bundles exist and are no longer denied | Pass |
| G1.2 `cliffordMultiplication_anticommutator` (Lean 72), untouched | c(e₁)=iZ, c(e₂)=iY | carried from ~23: polar form gives −2⟨v,w⟩; (e₁,e₁): 2(iZ)² = −2Id; (e₁,e₂): −(ZY+YZ) = 0 | Pass (carried) |
| G1.2 `IsGeometricAction` (Lean 65), untouched | V=ℝ, c(e)=i; c(e)=1 | carried from ~23: i² = −1 = Q(e), ⟨is,t⟩ = −⟨s,it⟩; c=1 fails both clauses | Pass (carried) |
| G6.1 `diracInFrame_eq` (Lean 107), untouched | rotated frame; (2e₁,e₂); n=0 | carried from ~23: Σ B(b_j,b_j) frame-independent for orthonormal b; (2e₁,e₂) gives 4c₁∇₁+c₂∇₂; empty sum 0 | Pass (carried) |
| G1.1, G1.2 Fock, G1.3 evaluation, G1.4, G2.1–G2.3, G3.1, G3.3, G4.2, G5.0, G5.3, G6.0, G6.1 circle, G6.6, G6.7 volume, untouched | as in ~23 | carried from the 22 remaining rows of the table of PRREVIEW-SpinGeometry~23 | Pass (carried) |

**Declared gaps.** None are declared (no readable `design/plan.json`).

## Not verifiable

- Lawson–Michelsohn, *Spin Geometry*, and Atiyah–Bott–Shapiro, *Clifford modules*, are recorded `uncertified` in the manifest and are cited by locator only; no changed passage cites them.

## Source issues

- none
