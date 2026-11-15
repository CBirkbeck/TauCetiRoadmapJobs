# GATE-HeightsRationalPointsAndObstructionsPartII~1: answers to human review

Head before: `7ef1ff6`. Head after: `653f2ec2` (one commit, README only; `Suggested.lean` unchanged).

## H01 (mycaule) — applied

The overlap is real, so the README now cites the repository: a new `## Provenance` section after `## References` (`TauCetiRoadmap/HeightsRationalPointsAndObstructionsPartII/README.md` lines 2177–2186; before this there was no citation) names AxiomMath/Mordell at commit `82a30cb`, its licence (Apache-2.0) and the fact that it is not a dependency. A table maps the four targets this roadmap owns that the repository meets (§5.1, and the curve cases of §§5.4, 5.5 and 5.8) to the repository files, and says how each repository statement differs from the target. Most of `Height/` (63 `.lean` files) and `NeronTate/` (23 `.lean` files) formalizes what this roadmap imports from Mathlib `Projectivization.logHeight` and from HeightsRationalPointsAndObstructions Layer 0 and §§5.10–5.11, not targets this roadmap owns. The section says so instead of claiming that these targets duplicate the repository.

Evidence, checked against the file tree and module docstrings at `82a30cb`:

- **Counts.** `Mordell/Height` has 63 `.lean` files and `Mordell/NeronTate` has 23, the reviewer's numbers.
- **What the repository proves.** It formalizes Faltings' theorem over number fields along Bombieri's version of Vojta's proof (its README, statement `Faltings.finite_setOf_comp_eq_id_of_two_le_genus`). Licence: Apache-2.0 (root `LICENSE`). It builds against Lean v4.35.0, Mathlib `dfa4f38` and AxiomMath/Stacks. The pins are Lean v4.36.0-rc2 and Mathlib `1b1ccf4`, without AxiomMath/Stacks.
- **What `Height/` maps to.** Weil heights on ℙⁿ over ℚ̄ (`Height/Weil/*`) correspond to Mathlib `Projectivization.logHeight`. Heights of classes in Pic⊗ℚ with Northcott (`Height/Class/*`, `Height/Machine/*`) correspond to HeightsRationalPointsAndObstructions §0.16. Siegel's lemma (`Height/Siegel/*`) corresponds to its §5.10c, and Gelfond's product inequality (`Height/Polynomial/Gelfond.lean`) to its §5.10d.
- **What `NeronTate/` maps to.**
  - Tate's limit (`TateLimit.lean`) → parent §0.18.
  - Existence, uniqueness, functoriality, additivity and translation of Néron–Tate heights (`Existence.lean`, `Uniqueness.lean`, `Functoriality.lean`, `Additivity.lean`, `Translate.lean`) → parent §0.19.
  - Nonnegativity and Northcott for ample even classes (`Nonneg.lean`, `Northcott.lean`) → parent §0.20.
  - The polar form (`Bilinear.lean`) → parent §0.21.
  - The Néron form of a Jacobian, its Cauchy–Schwarz inequality and Mumford's formula (`Pairing/*`, `MumfordFormula/*`) → parent §§5.10e–5.11.
- **Where it meets targets owned here.**
  - **§5.1.** `NeronTate/PositiveDefinite.lean` (`Faltings.neronTateBilinear_posDef`) proves positive definiteness on ℝ⊗Γ only for finitely generated Γ. Its form is the unhalved polar form B_c.
  - **§§5.4, 5.5 and 5.8 for curves.** These are `BombieriVojta/Conclusion/Theorem1.lean`, `BombieriVojta/Mumford/Main.lean` with `GapPrinciple.lean`, and `BombieriVojta/Conclusion/Theorem2.lean`. In each, the constants (γ, c₃) exist after fixing the curve and its auxiliary bases.
  - **Elsewhere.** The repository has no heights over function fields: every height module assumes `[Algebra.IsAlgebraic ℚ k]`. No module path contains "uniform", "Bogomolov", "Rémond", "equidistribution" or "Ueno". So Layers 0–4, 6 and 7–12 have no counterpart beyond these rows.

`BombieriVojta/` was not named in the comment. It carries the same overlap pattern, so it is covered too.

No roadmap on main and no open roadmap pull request cites AxiomMath/Mordell (`roadmaps grep -i 'AxiomMath/Mordell|Mordell/(Height|NeronTate|BombieriVojta)'` finds nothing). The bulk of the overlap is with HeightsRationalPointsAndObstructions Layer 0 and §§5.10–5.12. A provenance note belongs in that roadmap too, but this job may not edit it.

## Adversarial pass on the added text

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Curve-norm convention: ⟨x,x⟩ = ĥ_(θ+[−1]*θ)(x) = 2ĥ(x) | point of principal height a; x = 0; torsion x | 2a = 2·a (agrees with the JacobianChallengePartII Check "principal height a ↦ twice-theta height 2a"); 0 = 0; 0 = 0. θ+[−1]*θ and Θ₂ are symmetric and algebraically equivalent, so they differ by a symmetric class of Pic⁰, which is 2-torsion and hence 0 in Pic⊗ℚ | holds | none |
| §5.1 row: unhalved polar form has diagonal 2ĥ_c for even c | general even c; E: y²=x³−2, P=(3,5), c=[O(O)] | B_c(x,x) = ĥ_c(2x) − 2ĥ_c(x) = 4ĥ_c(x) − 2ĥ_c(x) = 2ĥ_c(x); for E, B(P,P) = native canonicalHeight(P) = 2ĥ_(O(O))(P) (parent §0.21 Check), while §5.1 gives ⟨P,P⟩ = ĥ_L(P) | holds | none |
| §5.1 row: "finitely generated rather than finite rank" is a real difference | Γ = A(ℚ̄)_tors; Γ = division hull of ℤP | the first has rank 0 and is not finitely generated: §5.1 gives Γ_ℝ = 0, while the repository's hypothesis `AddGroup.FG Γ` fails. The second has rank 1 and is not finitely generated: §5.1 gives dimension 1, and the repository does not apply | holds | none |
| §5.4 row: same shape for X a curve | c₄ = 4; c₄ = 8; g = 1 | §5.4's angle hypothesis 1 − 1/c₄ = 3/4 matches the repository's ¾ at c₄ = 4 and is 7/8 > ¾ at c₄ = 8, so the repository's conclusion excludes §5.4's configurations above its threshold. Both exclude g = 1 (`hg : 2 ≤ genus`) | holds | none |
| §5.5 row: Mumford inequality and gap principle for curves | z = w; t = ∣w∣/∣z∣ ∈ [1,2] | z = w is excluded in both. In §5.5 the D₁-fibre through (x,x) contains the diagonal, so it is not isolated. The repository's step (1+t²)/4 − 3t/4 = (t²−3t+1)/4 takes the values −1/4 at t = 1, −5/16 at t = 3/2 and −1/4 at t = 2, so it is ≤ −1/4 on [1,2], as its gap-principle proof needs | holds | none |
| §5.8 row: count 7^ρ(1+log γ/log 2) | ρ = 0; ρ = 1 with γ = 2 | ρ = 0: bound 1 + log γ/log 2 ≥ 1, actual count 0, since every point of J(K) is torsion with norm 0 < γ; §5.8 gives c⁰ = 1. ρ = 1, γ = 2: 7·2 = 14 | consistent | none |
| "heights over algebraic extensions of ℚ only" | `Height/Weil/Basic.lean`, `Height/Class/Basic.lean`, `NeronTate/Basic.lean`; ℂ(t) | all three assume a field algebraic over ℚ; ℂ(t) is not, so there is no counterpart for Layers 7–11 | holds | none |
| Toolchain and dependencies | repository `lean-toolchain` and `lake-manifest.json`; the pins' `lean-toolchain` and `lake-manifest.json` | v4.35.0 vs v4.36.0-rc2; Mathlib `dfa4f38` vs `1b1ccf4`; extra package `Stacks` from github.com/AxiomMath/Stacks | holds | none |
| Markdown table well-formed | each added row | 3 columns per row; no ASCII vertical bar inside cells (a first draft wrote the §§5.4–5.5 bound with vertical-bar norms, which split the cells; it now reads "the squared norm of P₀ is at most") | fixed in draft | wording |

## Notes

- **Lean.** `Suggested.lean` is unchanged, so its three elaborated signatures in the job's `signatures.md` (from head `7ef1ff6`, same file) still apply. I compared each with its README statement:
  - `uniform_maninMumford_curves` ↔ §3.6;
  - `uniform_mordellLang_curves` ↔ §6.8 (rank ≤ ρ, monotone since B ≥ 1);
  - `uniform_rationalPoints_curves` ↔ the degree-free consequence of §6.8, as README line 1238 says.

  Smoothness, properness, geometric integrality, dimension one, `IsAlbanese` and `J.dim = g` are present in all three. No binder was lost and nothing changed. No `#check` scratch file was elaborated, because only the two commands in the brief may be run.
- **Ownership.** The repair adds no target, so ownership is unchanged. Ownership against open pull requests was checked with `roadmaps grep` for the cited repository (no hits).
- **Sources.** The repository is cited as an existing formalization, pinned to its commit URL, in the way of the provenance sections of ModularCurves, AbhyankarLemma and CoboundaryExpansion on main. It is not a literature source, so no `sources.toml` entry was added (that file is outside this job's edit scope). No text was missing and `needs-references.toml` was not written.
- **Untrusted text.** The review comment contains only the overlap claim and two links. It contains no instructions.

## Build and gate

- Build: `lake build TauCetiRoadmap.HeightsRationalPointsAndObstructionsPartII.Suggested` → `Build completed successfully (18262 jobs).` The only warnings are the three expected ``declaration uses `sorry` `` (lines 61, 79, 100).
- Gate (after commit): `gate HeightsRationalPointsAndObstructionsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 239 roadmaps, 2255 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- Citation resolver: no cross-roadmap citations and no Lean names found nowhere.
