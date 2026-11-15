# Review of HeightsRationalPointsAndObstructionsPartII (pull request #1821 at 653f2ec)

**Verdict:** accepted

Incremental re-review of the 21 README lines changed since 4a579da (the Layer 12 headings and introduction, and the new `## Provenance` section), and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: line 2082 introduces Layer 12 before §12.1 and cites §12.2, §12.3, §3.6, §3.5; `### 12.2 Uniform Manin–Mumford …` (line 2099) and `### 12.3 Uniform Bogomolov …` (line 2114) are sections again, each with one "Throughout" line (ℂ at 2103, ℚ̄ at 2118).

## Verified sound

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| Layer 12 introduction, line 2082: "bielliptic cases of §3.6 and §3.5 respectively" | resolve both citations, both Needs lines, both base fields | §3.6 is uniform Manin–Mumford for curves (line 658), §3.5 uniform Bogomolov (line 642); §12.2 Needs §3.6 and is over ℂ; §12.3 Needs §3.5 and is over ℚ̄ | order of "respectively" correct; headings run 12.1–12.4 |
| §12.2 and §12.3 statements (headings restored, text unchanged) | Stoll's curve; torsion against the height count | 16 points per common x-value, B = 16·B₀; 34 torsion points have height 0 ≤ b, so the §12.3 count is ≥ 34 over ℚ̄ | as in the review of 4a579da; one standing hypothesis per section |
| Provenance: "⟨x,x⟩=ĥ_(θ+[−1]*θ)(x) … which is 2ĥ" | ĥ_θ = q + ℓ (quadratic plus linear); a point with ĥ = 1; θ symmetric and a translate | Repository form ĥ_θ(x+y) − ĥ_θ(x) − ĥ_θ(y): diagonal 4q + 2ℓ − 2q − 2ℓ = 2q = ĥ_θ(x) + ĥ_θ(−x). Conventions: ĥ = ĥ_Θ₂/2, Θ₂ = O(2θ) (line 121): diagonal 2 against ⟨P,P⟩ = 1 here | correct; agrees with Conventions line 21 (unhalved pairing gives diagonal 2) |
| Provenance row 5.1 | the Lean statement in `NeronTate/PositiveDefinite.lean`; even class | Γ carries a finite-generation instance and injects into A(K), K algebraic over ℚ; B(z,z) = ĥ_c(z) + ĥ_c(−z) = 2ĥ_c(z) for c even; §5.1 has Γ of finite rank and ⟨P,P⟩ = ĥ_L(P) | row correct on both sides |
| Provenance row 5.4, X a curve | the Lean conclusion of `Conclusion/Theorem1.lean`; §5.4 with dim X = 1 | Repository: γ > 1 exists; γ ≤ norm(z) and γ·norm(z) ≤ norm(w) give ⟨z,w⟩ ≤ (3/4)·norm(z)·norm(w). §5.4, two points: cone constant 1 − 1/c₄, growth c₄, bound c₅·max{1,h(X),c_NT,h₁}: its contrapositive with c₄ = 4 | row correct; γ is a maximum of curve-dependent quantities there |
| Provenance row 5.5, X a curve | `Mumford/Main.lean`, `Mumford/GapPrinciple.lean`; §5.5 | Repository: norm(z)²/2g + norm(w)²/2g − ⟨z,w⟩ ≥ −c₃(1 + norm(z) + norm(w)), c₃ depending on the curve and embeddings; gap: c ≤ norm(z) ≤ norm(w), angle > 3/4 gives 2·norm(z) < norm(w) | row correct |
| Provenance row 5.8, curves | `Conclusion/Theorem2.lean`; the cap count; §5.8 curve form | 7^ρ caps; in a cap norms double and stay below γ times the smallest: at most 1 + log γ/log 2 points; ρ = rank of J(K). §5.8: threshold c·max{1,h(C),c_NT,h₁}, count c^(rk Γ), c = c(n, deg C) (line 966) | row correct on both sides |

The rows for all untouched statements stand as in the previous review, of 4a579da.

- Repository facts of the Provenance paragraph checked at commit `82a30cb`: Apache-2.0 licence; `lean-toolchain` v4.35.0 (the pin here is v4.36.0-rc2); Mathlib `56a0058` (the pin here is `1b1ccf4`); dependency AxiomMath/Stacks, absent from `lake-manifest.json` here; directories `Mordell/Height` (Weil, Class, Siegel, Polynomial, …) and `Mordell/NeronTate` (Existence, Uniqueness, Functoriality, Additivity, Nonneg, Northcott, PositiveDefinite, MumfordFormula, Pairing); the five linked files exist. 5 statements read (table above).
- Library and supplier citations of the changed text resolved, 4: Mathlib `Projectivization.logHeight` (`Mathlib/NumberTheory/Height/Projectivization.lean` line 54); HeightsRationalPointsAndObstructions Layer 0 (height classes, the Weil machine and canonical heights), §5.10 (Vojta's inequality for curves, with Siegel's lemma at §5.10c) and §5.11 (Mumford's gap), at that roadmap's open head. The section adds no supplier and no `*Needs:*` edge.
- Shape: a secondary `## Provenance` section after `## References` is the form the repository `README.md` asks for (lines 339–342) and the one SubspaceTheorem uses on main; four other open roadmaps record the same repository at the same commit.
- Seeded sample: none of the fifteen targets lies in the changed passages; they are untouched since 4a579da.
- Gate, run at 653f2ec: every counter 0, `OK`; the worker's run adds `build=0`. No file changed outside the folder against the pull request's base.
- Dependency check: `depcheck: 237 roadmaps, 2250 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/HeightsRationalPointsAndObstructionsPartII/Suggested.lean` exits 0 with three "declaration uses `sorry`" warnings (lines 61, 79, 100) and nothing else; the file is unchanged since 4a579da.
- Pull request text: title and description read against this head; the 14 claims checked in the previous review stand (thirteen layers = Layers 0–12, three headlines, folder of three files, the bielliptic family as a worked case), and the change removes, renumbers or adds no section they name, no declaration and no supplier. The Provenance section is stated by the README itself as not a dependency.

Overlap check: read ArakelovGeometryAndAbelianHeightsPartII, HeightsRationalPointsAndObstructions, ArithmeticDynamics; nothing shared (the change adds no owned object; the Provenance section assigns the Weil and Néron–Tate material to Mathlib and to HeightsRationalPointsAndObstructions, which this roadmap already cites for it).

Source independence: changed passages only; 3 passages compared with 2 sources (the Layer 12 introduction with dky-2020; the Provenance paragraph and its table with the README and five files of AxiomMath/Mordell at `82a30cb`), none shared; the arrangement was not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- Unchanged from the previous reports: the explicit constants of remond-2000-vojta Théorème 1.2 (display formulas lost in the extraction) and the uncertified remond-2000-decompte and david-philippon-2007; the diff touches none of them.
- "Gelfond's product inequality" in `Mordell/Height`: the directory listing shows a `Polynomial` subdirectory, whose files were not opened.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` line 2179 records AxiomMath/Mordell (Apache-2.0, commit `82a30cb`) and says adaptation is coordinated with its authors; that repository's README says its modules were written by AI agents and not yet reviewed by humans. `Suggested.lean` shares no declaration with it.
