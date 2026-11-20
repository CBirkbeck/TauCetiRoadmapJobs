# Review of CotangentLagrangian (pull request #2687 at 1aad417)
Folder: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/`
**Verdict:** accepted

**Summary.** Accepted: the folder has not changed since the previous review of `1aad417`, and this round read the pull request's description against the head and found no sentence the head contradicts and no change left unstated. The previous small correction (the IntegrableSystems sentence of the description) is repaired. Two format notes are carried over, none blocking, and nothing is left for a human to decide.

## N01 — Several targets still carry no locator

As in the previous reviews: the Kodaira–Thurston target of §2.2 (Cannas da Silva has the example with b₁ = 3 at p. 102), the symplectic neighbourhood theorem of §4.6, the transverse composition of §3.0 and the polar diffeomorphisms of §2.0. A locator into a standard text for each would let a reader check the hypotheses.

## N02 — A sentence of §4.1 writes r*η where the paragraph has r*(i*η)

In §4.1 the target reads dβ = η − r*(i*η) (line 967), with r the retraction onto Q; the sentence on the Tau Ceti operator says its differential "is η − r*η" (line 974), which reads r as the self-map (q, p) ↦ (q, 0). Writing η − r*(i*η) in line 974 too would keep one meaning of r in the paragraph.

## Previous findings

The previous report had no findings (no R-numbered remark); its small correction and format notes are accounted for here.

- C01 (previous) — repaired: the description now reads "The consumer citation of IntegrableSystems reads I5.2, the id that section has on main", as README line 1195 has it.
- N01 (previous) — not repaired: the four targets still have no locator; written again as N01 above.
- N02 (previous) — not repaired: line 974 still reads "its differential is η − r*η for a closed C¹ form η"; written again as N02 above.

## Verified sound

The description, sentence by sentence against the head: the section order (overview with four headline bullets, numbered Conventions, four layers, Downstream consumers, Scope and ownership, Exact supplier contracts, References) is the README's; the "Former numbering" paragraph is at line 1274 and covers C1, C2, C2.0, C2.1, C2.2, C3, C3.1, C4; the four explicit anchors are at lines 239, 291, 428, 946; the Checks number 41 (counted per section: 7 in Layer 1, 12 in Layer 2, 10 in Layer 3, 12 in Layer 4); the ten supplier subsections and the nine consumers are those listed; Gotay is in the References and cited in §4.8.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Description on §1.4: fibre translation by α changes the forms by π*α and −π*dα | T*ℝ², α = x dy | τ(x, y, p_x, p_y) = (x, y, p_x, p_y + x); τ*λ = λ + x dy; τ*ω = ω + dy ∧ dx = ω − dx ∧ dy = ω − π*dα. α = dy: τ*ω = ω | description, README §1.4 and its Check agree | none |
| Description on §2.2: L_Z ω = ω gives ψₜ*ω = eᵗω, and ψₜ*θ = eᵗθ when ι_Z ω = −θ | T*ℝ, Z = p ∂_p, ω = dq ∧ dp, θ = p dq | ι_Z ω = −p dq = −θ; L_Z ω = d(−p dq) = dq ∧ dp; ψₜ(q, p) = (q, eᵗp): ψₜ*ω = eᵗ dq ∧ dp, ψₜ*θ = eᵗ p dq | agree with README lines 490–496 | none |
| Description: the Weinstein map for the circle in the plane (Check of §4.7) | p = (1 − r²)/2 and the wrong variant p = 1 − r | dθ ∧ dp = dθ ∧ (−r dr) = r dr ∧ dθ = dx ∧ dy; r = 1 gives p = 0. Variant: dθ ∧ (−dr) = dr ∧ dθ = (1/r) dx ∧ dy | the Check is true and separates the two | none |
| Description: `Suggested.lean` statements unchanged, eleven declarations | the file at the head against main, comments stripped | identical text outside comments; 3 `abbrev` (lines 78, 82, 88) and 8 `theorem` (lines 103–278); section comments Layer 1, Layer 3, Layer 4 | as described | none |
| Description: the IntegrableSystems citation reads I5.2 | README line 1195; IntegrableSystems on main | main heading "I5.2. Finite action, quotient and periodic-orbit dictionary" (its line 534) | resolves | none |

The rows for the untouched statements stand as in the previous review, of `1aad417`.

- Source locators checked against the text: 0; the folder did not change and no target of the seeded sample falls in a changed passage.
- Library declarations opened at the pinned Tau Ceti: 13, each named in the description and found: `hasTrivialRadical_sp` (`Algebra/Lie/Symplectic/Killing.lean` 160), `killingForm_apply` (293), `killingForm_cartanInvolution_self_neg` (311), `contMDiff_cartanInvolution` and `mfderiv_conj_symJ_one_apply` (`Geometry/Lie/Symplectic/Cartan.lean` 50, 64), `GLSymplecticFin` (`LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Basic.lean` 423), `apply_flowOf_of_interior_eq` (`Geometry/Symplectic/Liouville/Flow.lean` 98), the surface criterion (`Geometry/Symplectic/Manifold/Surface.lean` 69), `conormal_id` and `conormal_const` (`Geometry/Manifold/VectorBundle/Cotangent/Conormal.lean` 177, 188), and the three relative Poincaré declarations (`Analysis/Calculus/DifferentialForm/Relative.lean` 96, 192, 269).
- Cross-roadmap citations resolved on main: HeegaardFloer §4.1 (F2.1), §4.6h (F2.6h), §5.1 (F3) (its lines 2437, 3320, 3476); ComplexKahlerGeometry §6.3 (K6.1) (2283); SmoothBundlesConnections §B1.2, §B1.4, §B2.1 and Layers 2–5 (502, 578, 829, 827–1403); IntegrableSystems I5.2 (534). All ten suppliers are on main and were cited by the README on main.
- Automatic checks: run again on this head, all pass. Dependency check output: `depcheck: 182 roadmaps, 2071 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes only the two files of the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives eight `declaration uses sorry` warnings (lines 103, 135, 164, 181, 199, 221, 258, 278) and no other message; no Lean text changed, so the binder comparison and the one-tactic probe of the earlier reviews stand.
- Headlines: unchanged; the eight stated theorems and the docstring's five items not statable are as the earlier reviews read them.

Overlap check: read ContactGeometry, IntegrableSystems and HamiltonianReduction (with the family index SymplecticGeometry) as in the previous review; the overlap facts list no dropped id, no second copy and no other pull request changing this roadmap; nothing shared.

Source independence: changed passages only: 0 passages compared with 0 sources (the folder did not change); largest share CannasDaSilvaLSG, 15 of 16 locator sites; contents not compared again, since no layer was added, removed or reordered (previous result: independent).

Research link: Layer 4 is Weinstein's Lagrangian neighbourhood theorem (Weinstein, 1971) and Gotay's coisotropic embedding theorem (Gotay, 1982), as CannasDaSilvaLSG pp. 48–49 cites them and Gotay1982 proves; §2.2's example is Thurston's (1976). FukayaTheory, HeegaardFloer and TaubesGromov consume Layer 4. Rests on CannasDaSilvaLSG, Gotay1982 and the README's Downstream consumers.

## Not verifiable

- The description's sentence that every library name the README on main cited exists at the pin was not checked again name by name; the 13 declarations the description itself names were.

## Source issues

- none

## For the human reviewers

- none
