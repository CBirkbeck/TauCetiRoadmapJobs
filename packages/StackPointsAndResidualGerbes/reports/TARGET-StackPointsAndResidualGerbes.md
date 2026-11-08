# TARGET-StackPointsAndResidualGerbes: triage report

Verdict: `design`, name `StackPointsAndResidualGerbes`, no base, no owner. The brief is
`packages/StackPointsAndResidualGerbes/target.md`; the manifest is
`packages/StackPointsAndResidualGerbes/sources.toml`.

## What was searched

- **Consolidation against the board.** Every open target and design listed in the job brief was
  compared by object. None plans points of stacks, stabilisers at points, gerbe morphisms or
  residual gerbes. `TARGET-VirtualFundamentalClasses` (#6027) needs residual gerbes for
  zero-cycles and is a consumer, not an overlap. `TARGET-QuasicoherentSheavesOnPrestacks` (#2534)
  is about QCoh by Kan extension, no overlap. The two board designs whose READMEs mention
  residual gerbes, `FunctionFieldArithmeticPartII` (GC1-PERMANENCE, a zero-dimensional
  Deligne–Mumford fact) and `MotivicStructuresInModuliOfCurves` (central rigidification), use
  them as facts and define nothing; they are listed as consumers.
- **Ownership on main.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md` §1.7 (points of
  algebraic spaces), §1.19 (algebraic and DM stacks), §1.20 (inertia, `automorphismGroup`,
  `Stacks.points` with its topology, locally Noetherian and separated stacks, presentations),
  §1.21 (quotient stacks, `BG`, root stacks), §1.22 (`Stacks.QCoh`), §1.23 (coarse spaces,
  Keel–Mori, tame stacks). It defines `|𝒳|` and the automorphism group of an object; it has no
  finite type points, no stabiliser-at-a-point statements, no gerbe morphisms, no residual
  gerbes, no closed substacks and no tangent or normal spaces. Its `Suggested.lean` declares
  nothing of the stack layer. The board design `SchemeAndStackFoundationsPartII` is flat
  cohomology and does not touch these objects, which also rules out a Part II under that name.
- **Open pull requests.** `roadmaps grep` on the phrases "residual gerbe", "Luna", "slice
  theorem", "BG_x", "Isom(x", the tags 06ML, 04XE, 04XG, "quasi-DM", "quasi-compact inertia",
  "one-point", "finite type point", "regular gerbe", "normal space", "infinitesimal
  neighbo", "Laumon", "Rydh", "Olsson". Hits: `LanglandsParameterStacks` (#1202) uses the
  residual gerbe at a parameter in two Checks of its §1.16 without defining it;
  `AlgebraicModuliForArithmeticGeometry` (#853) owns banded gerbes on a site (Layer 4, §4.1
  `IsGerbe`) and rigidification (§5.1), whose fibre it identifies with `BG_x` by hand, but
  defines no residual gerbe; `EquivariantIntersectionTheory` (#1685) and `GroupSchemesOverABase`
  (#1522) mention stabilisers of quotient stacks only. The tags 06ML and 04XE occur nowhere;
  04XG occurs only in SchemeAndStackFoundations §1.20.
- **Libraries.** The pinned Mathlib has no algebraic stacks (`Mathlib/AlgebraicGeometry` has
  schemes, group schemes under `Group/`, no stacks; `CategoryTheory/Sites/Descent/IsStack.lean`
  gives the pseudofunctor-level stack predicate). Tau Ceti's only `Stack` namespace is the real
  algebraic geometry CAD stack, unrelated.
- **Merge order.** SchemeAndStackFoundations is on main; AlgebraicModuliForArithmeticGeometry is
  at position 32, LanglandsParameterStacks at 61, MotivicStructuresInModuliOfCurves at 325,
  FunctionFieldArithmeticPartII at 362. A new roadmap inserted after its last supplier (position
  32 if it imports the site-level gerbe predicate) precedes all listed consumers.

## Sources

Fetched through the sources service, all certified: Stacks Project Properties of Algebraic
Stacks (`stacks-04XE`, `stacks-06ML`; §100.4 and §100.11 read in full), Morphisms of Algebraic
Stacks (`stacks-06QB`, `stacks-06RD`; §§101.4, 101.18, 101.19, 101.28, 101.29, 101.31, 101.51
read), Alper–Hall–Rydh arXiv:1504.06467v3 (`ahr2020`; Theorems 1.1–1.2, §1.5, §3.1), Alper's
*Stacks and Moduli* draft of 2026-01-05 (`alper-moduli`; §§4.5.2–4.5.3, 7.4.5), Rydh's étale
dévissage paper arXiv:1005.2171v2 (`rydh2011`; Appendix B), Rydh's Noetherian approximation paper
arXiv:0904.0227v4 (`rydh2015`). Two findings on the filed source list:

- The target attributes the residual-gerbe appendix to Rydh's Noetherian approximation paper.
  That paper's Appendix B is "Standard limit results" and never discusses residual gerbes; the
  appendix in question is Appendix B, "Algebraicity of points on quasi-separated stacks", of the
  étale dévissage paper (J. Algebra 331, 2011), which the Stacks Project footnote to Definition
  100.11.8 cites as [Ryd10, Appendix B]. Both are in the manifest with corrected `cited_for`.
- Laumon–Moret-Bailly (`lmb2000`) and Olsson (`olsson2016`) resolve only to paywalled pages and
  are recorded as `uncertified`, cited by locator. The service first wrote Olsson to
  `needs-references.toml` because the AMS host is in no licence class; since the text is
  paywalled and the target itself says "cite by locator", it was moved to the manifest as
  uncertified and the missing-list was removed. Nothing is parked on a human.

## Why `design`

The target is a coherent, self-contained theory (finite type points, stabilisers, gerbe
morphisms, residual gerbes, tangent and normal spaces) that nothing owns, with every statement
available from the open Stacks Project text plus two arXiv papers and an author-page draft. It
continues SchemeAndStackFoundations in the sense of building on it, but a Part II is ruled out:
the name `SchemeAndStackFoundationsPartII` is taken by a flat-cohomology design on the board,
and the base roadmap is a multi-layer foundations roadmap whose stack layer is one of twenty-five
sections, so "starts where the base stops" has no single meaning. A focused roadmap that
imports §§1.19–1.23 by name is the right shape, and the suggested name fits and is free (not on
main, not in any pull request, not a package other than the one this job created).

The generality was raised: the filed rational-point proposition (algebraically closed `k`,
`𝒳` locally of finite type over `k`) becomes a Check of T9, which is stated for any field and any
finite type point through the residue field `κ(x)` and the non-neutral gerbe
(`alper-moduli` Exercise 7.4.40, `rydh2011` Theorem B.2). The Luna étale slice theorem itself is
excluded from the scope: the target asks only for the vocabulary to state it.

## Risks flagged for the design

Listed in the brief: the absence of any Lean carrier for algebraic stacks in Mathlib, Tau Ceti
or SchemeAndStackFoundations's `Suggested.lean` (the acceptance test must carry a minimal
carrier), closed substacks not owned by SchemeAndStackFoundations, the decency argument behind
the residue field, paywalled comparison texts, and the choice between importing the site-level
gerbe predicate from AlgebraicModuliForArithmeticGeometry (a pull request) or owning it.

No fetched text contained instructions; nothing suspicious to report.
