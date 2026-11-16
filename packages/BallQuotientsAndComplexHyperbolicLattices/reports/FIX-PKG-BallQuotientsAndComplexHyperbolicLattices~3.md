# FIX-PKG-BallQuotientsAndComplexHyperbolicLattices~3

Repair of the single finding of `REV-PKG-BallQuotientsAndComplexHyperbolicLattices~2` (P3). One file changed: `packages/BallQuotientsAndComplexHyperbolicLattices/README.md`. Only `*Needs:*` lines, `### Dependencies` lines and one Mathlib supplier-contract sentence changed. No statement, Check, locator or Lean declaration changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## REV-PKG-BallQuotientsAndComplexHyperbolicLattices~2/F01 (P3) — applied

What changed: §7.1 "§5.2" → "§§5.2–5.3 (…)" plus Mathlib `MulAction.orbitRel.Quotient`. §7.2 now also needs ComplexKahlerGeometry K6.0. §8.1 now also needs §7.2 and FuchsianOrbifolds Layer 3. §8.2 now also needs §7.2. Layer Dependencies lines: 6 "Layers 1–2 and 4–5", 7 "Layers 1–2 and 5" (with K6.0), 8 "Layers 1–2 and 6–7", 9 "Layers 2 and 6–8", 10 "Layers 1–2, 4–7 and 9".

**Verification.** The README's own rule (README line 150) says a target's *Needs:* line names, item by item, what its statement and proof route use. I recomputed every *Needs:* line by script and checked each hit by hand:

- **§7.1.** Its second API bullet says X_Γ is compact exactly when Γ is cocompact, and that its ω-volume is the covolume. That is §5.3. Neither §5.3 nor anything that needs it is in the closure of the old line (§5.2 → §§1.4, 3.4, 4.1 → …). The statement also names Mathlib `MulAction.orbitRel.Quotient`, which the line did not list.
- **§7.2.** The statement cites "ComplexKahlerGeometry K6.0" for the descended Kähler metric, but the line omitted it.
- **§8.1.** Layer 8's standing hypothesis is X = X_Γ for a neat Γ (README line 603). The open embedding of Ω_b(N) ∖ T_b into X needs X to be a complex manifold. That is §7.2, applied because a neat lattice is torsion-free (§6.4). Before the edit, no subsection of Layer 7 was in the closure of the §8.1 line. The first API bullet uses FuchsianOrbifolds Layer 3's cusp coordinate. That layer is on main, headed "Layer 3: cusps and q-coordinates", where the q-coordinate is item 4.
- **§8.2.** The statement glues X itself, so it needs §7.2.
- **Layer lines.** Each layer's direct uses of earlier layers, recomputed from the *Needs:* lines, give exactly the review's table:

  | Layer | old line | before the edit | after the edit |
  |---|---|---|---|
  | 6 | 2, 4–5 | {1, 2, 4, 5} | {1, 2, 4, 5} |
  | 7 | 5–6 | {1, 2, 5} | {1, 2, 5} |
  | 8 | 6–7 | {1, 2, 6} | {1, 2, 6, 7} |
  | 9 | 6–8 | {2, 6, 7, 8} | {2, 6, 7, 8} |
  | 10 | 2, 4, 7, 9 | {1, 2, 4, 5, 6, 7, 9} | {1, 2, 4, 5, 6, 7, 9} |

  None of §§7.1–7.4 uses Layer 6, so the Layer 7 line drops it. The neat-lattice remark in Layer 7's Examples paragraph is an illustration, not a target. Layers 1–5, 11 and 12 agree before and after: {}, {1}, {1, 2}, {1, 2}, {1, 2, 3, 4}, {1, 5, 9, 10}, {3, 5, 6, 8, 9, 10, 11}.

**Same defect elsewhere (all repaired).**

*Subsection *Needs:* lines.* Each item below is used by the statement or route but was missing from the line:
- §1.1: Tau Ceti `TauCeti.Matrix.isCompact_unitaryGroup` (third bullet, compactness of U(1) × U(n)).
- §1.6: Mathlib `Matrix.ProjectiveSpecialLinearGroup` and `UpperHalfPlane` (both in the statement).
- §5.1: Mathlib `QuotientGroup.measurableSpace` (in the statement).
- §5.3: §1.4 (the statement reads the volume "through §§1.4 and 2.2").
- §6.1: §1.5 (the route uses "Γ_b acts cocompactly on horospheres (§1.5)").
- §6.2: Mathlib `Group.FG` and `Group.IsFinitelyPresented` (in the statement).
- §9.1: §6.4. Layer 9's Γ is neat, and the route uses §7.2, which requires torsion-freeness. Before the edit, the closure of the §9.1 line reached no subsection of Layer 6.
- §12.2: §6.4 (the route says "Reduce to neat Γ by §§6.4 and 10.6").

*Dependencies lines.* Each item below was named in the *Needs:* line of one of the layer's own subsections but missing from the layer line:
- Layer 2: Mathlib `Real.arcosh`, and Tau Ceti's Levi form.
- Layer 4: Mathlib eigenvectors and the Jordan decomposition, discrete subgroups, nilpotent groups and subgroups of finite index.
- Layer 5: Mathlib covolume, Haar measure, the quotient σ-algebra, commensurability and proper discontinuity.
- Layer 6: Mathlib lying over, characteristic polynomials, algebraic closures, and finitely generated and finitely presented groups.
- Layer 7: Tau Ceti `TauCeti.isLocalDiffeomorph_quotientMk` and Mathlib orbit quotients.
- Layer 9: ComplexKahlerGeometry K3 and K6.0 (used by §§9.1–9.3).
- Layer 10: ComplexKahlerGeometry K3, ComplexComparisonPartII §C0.6 and Mathlib one-variable removable singularities (used by §§10.2 and 10.5).
- Layer 11: Mathlib `Subgroup.Commensurable`.
- Layer 12: RiemannianGeometry R5a (used by §12.1).

*Mathlib supplier contract.* It now lists `UpperHalfPlane` (Mathlib/Analysis/Complex/UpperHalfPlane/Basic.lean:28) and `Matrix.ProjectiveSpecialLinearGroup` (Mathlib/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:36), which §1.6 consumes.

*Left as is, with reasons.*
- §5.2's parenthetical "FuchsianOrbifolds Layer 0 for n = 1" points to where the case n = 1 is treated. The general proof does not use it, so adding it to the *Needs:* line would block an implementer for no reason.
- Forward pointers such as "§1.4's" in §1.2, "part of §2.2" in §1.6 and "(§5.3)" in a §5.1 bullet are not uses.
- The script's remaining hits are section numbers of other works: AdelicAlgebraicGroups §§3.4 and 4.3 in §11.3, BaldiUllmo2023 §3.2, and WitteMorris2015 "§4.1".

**Citations re-resolved.** Every library name added was opened at the pins:
- `TauCeti.Matrix.isCompact_unitaryGroup`: TauCeti/Topology/Algebra/UnitaryGroup.lean:104.
- `Matrix.ProjectiveSpecialLinearGroup`: line 36.
- `UpperHalfPlane`: Basic.lean:28.
- `QuotientGroup.measurableSpace`: Constructions.lean:138.
- `Group.FG`: Finiteness.lean:693.
- `Group.IsFinitelyPresented`: FinitelyPresentedGroup.lean:95.
- `MulAction.orbitRel.Quotient`: GroupAction/Defs.lean:349.
- `Real.arcosh`: Arcosh.lean:61.
- `Subgroup.Commensurable`: Commensurable.lean:58.
- `TauCeti.isLocalDiffeomorph_quotientMk`: Quotient.lean:253.

The newly cited roadmap sections exist on main: FuchsianOrbifolds "Layer 3: cusps and q-coordinates", ComplexKahlerGeometry "6.1 Local Kähler and curvature identities (K6.0)", and RiemannianGeometry "R5a. Immersion geometry and first variation". The two ComplexComparisonPartII sections added to the Layer 10 line, §§C0.6 and C4.4, were already cited by §10.5 and resolve at that roadmap's open head. `roadmaps resolve` on the edited README reports no cross-roadmap citation and no Lean name found nowhere.

## Adversarial pass on the changed text

No mathematical statement changed. The table checks each dependency claim that was added or removed, on an instance.

| Statement (dependency claim) | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §7.1 bullet needs §5.3: X_Γ compact ⇔ Γ cocompact; vol_ω(X_Γ) = covolume | n = 1: Γ = {1}; a genus-2 surface group; Γ(2)/{±1} | {1}: X = B and G both non-compact. Genus 2: X and G/Γ (the unit tangent bundle) both compact. ω-area (curvature −2) = π(2g − 2) = 2π. Γ(2)/{±1}: 6 · (π/3)/2 = π, as in §8.4's Check | the bullet needs §5.3 | §5.3 added to the line |
| §7.2 needs K6.0: ω_Γ is a Kähler metric | n = 1, image of Γ(3) | X is a 4-punctured sphere. ω = i h dw∧dw̄ with h = (1 − \|w\|²)⁻² (§2.2 at n = 1) is Γ-invariant, closed and positive, so it descends to a Kähler metric in K6.0's sense | needed | K6.0 added |
| §8.1 and §8.2 need §7.2 (and §6.4 for torsion-freeness) | Neat: image of Γ(3), n = 1. Not neat: PSL(2,ℤ). Rotation [diag(1, i)] in PU(1,1) | Γ(3): torsion-free, X a manifold, τ = 3, Ω_b(N) a disc. PSL(2,ℤ): local degree 2 at i (§7.2's third Check), so X is not a manifold. [diag(1, i)]: lift eigenvalues 1, i; Ad eigenvalues 1, 1, i, −i, not neat. For γ of finite order in a neat group: Ad(γ) is diagonalizable with all eigenvalues 1, so Ad(γ) = 1 and γ = 1 (centre-free G) | both use the manifold X | §7.2 added to both |
| §8.1 bullet needs FuchsianOrbifolds Layer 3 | n = 1, Γ(3) at ∞ | q = exp(2πiv/3), the width-3 q-coordinate of that layer | needed for the bullet | added |
| §9.1 needs §6.4 | Neat Γ(2)/{±1}, n = 1 | Torsion-free, so §7.2 gives the complete metric that §C1.4 needs. The Check of §9.1 for an incomplete metric shows completeness is used | needed | added |
| §6.1 needs §1.5 | n = 2, Γ_b = ⟨n_(λ,0), n_(iλ,0)⟩ (§8.1's fourth Check) | N acts simply transitively on {ρ = c}; Γ_b is a lattice in N with Λ_b = ℤ[i]λ and τ = 4λ², so it acts cocompactly on the horosphere | route uses §1.5 | added |
| §12.2 needs §6.4 | Γ = PSL(2,ℤ), n = 1 | The route passes to the neat Γ(3)/{±1} (index 12). Without §6.4 no neat subgroup is available | route uses §6.4 | added |
| Layer 7 does not need Layer 6 | §§7.1–7.4 for any discrete Γ, e.g. Γ = {1, [diag(1, −1, −1)]} | §7.1's Check needs only §5.2 (finite stabilisers). No cusp, lattice or neatness hypothesis appears in §§7.1–7.4 | Layer 6 unused | Layer 6 dropped |
| Layer lines = union of direct uses | All twelve layers | Values in the table under F01 | equal for all twelve | five lines changed |
| §1.6 uses `Matrix.ProjectiveSpecialLinearGroup (Fin 2) ℝ` and `UpperHalfPlane` | h_t ↦ C h_t C⁻¹ | The Cayley conjugate of the U(1,1) element h_t is real, in SL(2,ℝ), and acts on `UpperHalfPlane` | names are in the statement | added to Needs and the contract |

## Checks run

- **Elaboration.** `lake env lean packages/BallQuotientsAndComplexHyperbolicLattices/Suggested.lean`, run from the content checkout, exits 0. It gives seven warnings, all `declaration uses sorry`, at lines 101, 131, 160, 169, 175, 184 and 208. There is no `TauCeti.*` import, so nothing was built.
- **`#check @name`.** I ran it for all 16 declarations in one scratch copy:
  - `indefiniteUnitaryGroup`, `projectiveUnitaryGroup`, `ballMap`, `biholomorphic_ball_iff`, `ballDist`, `IsParabolic`, `margulis_lemma`, `IsLattice`
  - `IsCuspPoint`, `IsLattice.exists_finset_cuspPoint_orbits`, `IsLattice.compactSpace_quotient_iff`, `IsLattice.isFinitelyPresented`
  - `selberg_lemma`, `conjugationMap`, `IsNeat`, `IsLattice.exists_neat`

  The elaborated types are those of the worker's elaborated-signature list and of the README statements. No binder was lost. Nothing changed, since `Suggested.lean` was not edited.
- **Dependency check** (the `gate --depcheck` command of the brief):

      depcheck: 239 roadmaps, 2253 edges, 0 problem(s)

  There are no UPWARD, CYCLE or moved lines. Every supplier named in the edited lines was already a supplier of this roadmap (FuchsianOrbifolds, ComplexKahlerGeometry, RiemannianGeometry, ComplexComparisonPartII), so no new edge was added.
- **Citations.** `roadmaps resolve` on the edited README reports "Cross-roadmap citations found nowhere: None" and "Lean names found nowhere: None".

## Gate failures

None were listed for this round.

## For the maintainer

- No Lean name changed, and no id that other roadmaps cite was renumbered or removed. The change affects only the order in which layers can be implemented: Layer 7 no longer waits on Layer 6; Layers 6–10 now name Layers 1–2 (and Layer 10 names Layers 5–6) as before only implicitly.
- No new target was added, so no ownership question arises. The overlap check lists no open pull request that changes this roadmap and no cited id that one drops.
- No source was fetched and `needs-references.toml` was not written. No text read in this round contained instructions.
