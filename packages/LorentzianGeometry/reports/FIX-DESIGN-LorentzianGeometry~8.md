# Repair of LorentzianGeometry (design, round 8)

Findings settled: the three of `REV-DESIGN-LorentzianGeometry~7` (F01 P2, F02 P3, F03 P3). One file was edited: `packages/LorentzianGeometry/design/README.md`, in two places of "Exact supplier contracts". `plan.json` and `sources.toml` are unchanged. No layer, target, Lean name, section id, supplier roadmap or Check was added, removed or renumbered.

## F01 (P2) — not actionable in this package: the repair renames this roadmap and gives most of it to another text that claims the same folder, and choosing between the two is a scope decision for the humans

No edit. The facts in the finding are right. I checked them against the head of the open pull request, read with `roadmaps show LorentzianGeometry --pr 2232`, both README and `Suggested.lean`:

- The other text adds the same folder, `TauCetiRoadmap/LorentzianGeometry/`. Its Suggested.lean uses the same namespace, `TauCetiRoadmap.LorentzianGeometry`.
- Its "Names" paragraph in Conventions assigns the same Lean names this design uses: `LinearMap.BilinForm.IsLorentzian`, `IsTimelike`, `IsNull`, `IsCausal` and `TauCeti.Manifold.LorentzianMetric`, `TimeOrientation`.
- Its §6.1 defines `IsLorentzian b := b.IsSymm ∧ b.Nondegenerate ∧ sigNeg b.toQuadraticMap = 1`, the same definition as §1.1 here.
- By object, its sections match ours as the review's table says:
  - its §6.2–§6.3 match Layer 1;
  - its §2.2–§2.5 and §7.1–§7.3 match Layer 2 and Layer 3;
  - its §3.2 matches §3.5–§3.6;
  - its §2.7 and §8.1–§8.2 match Layer 4;
  - its §9.2–§9.3 match §5.1–§5.4;
  - its Layers 10–12 cover the causality theory that our Scope gives to a Part II.
- Its Scope places "characteristic hypersurfaces of hyperbolic operators" outside that roadmap, so §5.5 has no counterpart there.

Even so, no edit to this package's three files can carry out the repair:

1. **Step 1 renames the roadmap and its folder.** The name `LorentzianGeometry` is fixed outside the files I may edit. It is the board package `packages/LorentzianGeometry/`, the name of this job, and the `--only LorentzianGeometry` of the gate. Until the rename happens, a README called LorentzianGeometry that cites "LorentzianGeometry §6.1" for its own Layer 1 would be citing itself. The supply rules cannot read that as an edge, so step 2 cannot come before step 1.
2. **Which text owns the subject is undecided.** The review says so itself ("which text owns the subject is a human decision"), and lists it under "For the human reviewers". The brief treats a scope change as not actionable here.
3. **Overlap rule ("another open pull request that changes this roadmap").** The tooling treats the open pull request as a change to this roadmap: it is missing from the job's list of the 239 open pull requests whose roadmaps may be cited, and `scratch/overlaps.md` lists it under "Other open pull requests that change this roadmap". Neither text is on main or in `ORDER.txt`. One of them has to be rebased on the other: either it becomes a revision of the other's README, keeping or mapping every id, or it is renamed and narrowed to what the other does not own. The open pull request is the older text and the only one in a pull request, so the supply rules point to rebasing this design on it, as the review's repair does. Keeping one text or the other is still the authors' decision.

The previous round reported the same collision to the maintainer. This is the first time it is raised as a finding.

## F02 (P3) — applied

Supplier contracts, From Mathlib:

- **Old:** "(same file, line 291: left separation, the right condition following from symmetry)".
- **New:** "(same file, line 291: an abbreviation of `LinearMap.Nondegenerate`, separation on both sides, `b(u, ·) = 0 → u = 0` and `b(·, w) = 0 → w = 0`; on a finite-dimensional space either side implies the other, `LinearMap.BilinForm.Nondegenerate.ofSeparatingLeft`, `Mathlib/LinearAlgebra/Matrix/BilinearForm.lean:513`)".

Verified at the pin:

- `Mathlib/LinearAlgebra/BilinearForm/Properties.lean:291–292` is `abbrev Nondegenerate (B : BilinForm R M) : Prop := LinearMap.Nondegenerate B`.
- The comment at lines 276–277 records the change from the one-sided version.
- `LinearMap.Nondegenerate` is `SeparatingLeft B ∧ SeparatingRight B` (`Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:547–548`).
- `Nondegenerate.ofSeparatingLeft` is at `Mathlib/LinearAlgebra/Matrix/BilinearForm.lean:513`, under `[IsDomain R₂] [Module.Free R₂ M₂] [Module.Finite R₂ M₂]` (line 511). A finite-dimensional real space satisfies all three.

Pattern: no other passage of the README or `plan.json` describes nondegeneracy as one-sided. The only other use of a one-sided condition is in the torsion converse lemma (line 54), and it needs only injectivity of `u ↦ b_x(u, ·)`, which the two-sided condition gives.

## F03 (P3) — applied

Supplier contracts, From Tau Ceti: added a bullet after the regular-value bullet. In summary, it says:

- `TauCeti.mtangentConeAt` (`TauCeti/Geometry/Manifold/TangentCone.lean:86`) is the tangent cone of a subset `s ⊆ M` at `y`, read in the extended chart at `y`.
- It is Mathlib's `tangentConeAt` of `(extChartAt I y).symm ⁻¹' s ∩ range I` at `extChartAt I y y`, a subset of `E = TangentSpace I y`.
- It works over any model with corners and assumes no smoothness of `s`.
- It gives §5.1's tangent hyperplane.

Verified at the pin: the definition is at lines 86–87, with `I` explicit (line 80) as §5.1 writes it. The `plan.json` prerequisite `tauceti:TauCeti.mtangentConeAt` of 5.1 was already present.

Pattern: I ran a script over every `*Needs:*` line and every `mathlib:`/`tauceti:` prerequisite in `plan.json` (88 names), comparing each with the contracts. The only missing name was `TauCeti.mtangentConeAt`. The script also flagged `ι̂` (line 520), but that is a mathematical symbol for the lift, not a declaration.

## Adversarial pass (every statement changed)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Contract: `Nondegenerate` is two-sided | §1.2's `b(u, w) = u⁰w¹ − u¹w⁰` on `ℝ²` | `b(u, ·) = u⁰e¹ − u¹e⁰ = 0 ⇒ u = 0`; `b(·, w) = w¹e⁰ − w⁰e¹ = 0 ⇒ w = 0`; `det [[0, 1], [−1, 0]] = 1` | nondegenerate in the pinned sense; the §1.2 Check stands (`b⁻¹(e¹, −e⁰) = 1 = b(e₀, e₁)`) | none |
| same | `b(u, w) = u⁰w⁰` on `ℝ²` | `b(e₁, ·) = 0`, `b(·, e₁) = 0`, `det diag(1, 0) = 0` | degenerate on both sides | none |
| same, "either side implies the other" needs finite dimension | finitely supported sequences, `b(u, w) = Σ uᵢ w_{i+1}` | `w = e_{j+1}` gives `uⱼ = 0`, so left-separating; `b(·, e₀) = 0`, so not right-separating | the two sides differ; `Module.Finite` excludes this case | none |
| same, zero space | `V = 0`, `b = 0` | nondegenerate vacuously (`not_nondegenerate_zero` needs `Nontrivial`); `sigNeg = 0 ≠ 1` | not Lorentzian, matching Conventions ("forces `dim V ≥ 1`") | none |
| Contract: `mtangentConeAt` | `M = ℝ²`, `I = 𝓘(ℝ, ℝ²)`, `H = {t = x}`, `y = 0` | cone `= ℝ(1, 1)`; `f = t − x`, `ker df = ℝ(1, 1)` | span equals kernel | none |
| same, corner (§5.1 Check) | quadrant, `H = {x = 0}`, `y = 0` | `range I ∩ H = {(0, s) : s ≥ 0}`, cone the ray `ℝ_{≥0}e_y`, span `ℝe_y = ker dx` | holds; the span is needed, since the cone is a ray | none |
| same, degenerate corner (§5.1 Check) | quadrant, `{x + y = 0}` | `range I ∩ H = {0}`, cone `{0}`, span `0 ≠ ker d(x + y)` | excluded, as §5.1 says | none |
| same, vertex (§5.1 Check) | light cone `{t = |x|}`, `n ≥ 1`, at `0` | rays `(1, ±ω)`: sum `(2, 0)`, difference `(0, 2ω)`; span `ℝ^{1+n}` | not a hypersurface at the vertex, as stated | none |
| F01 | no statement changed | none | none | none |

## Checks run

- **Dependency check** (after the edits):

  ```
  candidate: LorentzianGeometry is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
  depcheck: 245 roadmaps, 2231 edges, 0 problem(s)
  ```

  There is no UPWARD and no CYCLE line. The supplier roadmaps are unchanged: HopfRinow, DifferentialGeometry, PDE, PseudodifferentialOperators, RiemannianGeometry and LocalVariationalFieldTheory, all on main.
- **Citations** (`roadmaps resolve` on the edited README): no cross-roadmap citation and no Lean name is found nowhere.
- **House style**: grep of the README for `\(`, `\[`, `$$`, machine paths and pull-request numbers gives 0 hits.
- **`Suggested.lean` and the `#check` comparison**: not applicable. This is the design stage and the package has no `Suggested.lean`. Nothing was elaborated, and no Lean name changed.
- **Gate failures listed in the brief**: none.
- **Sources**: nothing was fetched, no citation was added, and no `needs-references.toml` was written.

## For the maintainer

- **Two texts for one folder.** The open roadmap pull request "Add semi-Riemannian foundations and Lorentzian causality roadmap" (13 layers) and this design both add `TauCetiRoadmap/LorentzianGeometry/`. They use the same namespace and the same Lean names for Lorentzian forms, metrics and time orientations. Only one can merge under that name. Two outcomes are possible:
  - **This design becomes a revision of the other text.** Main gets the open pull request's README, with this design's changes made inside it.
  - **This design is renamed and narrowed** to what the other text leaves out, citing it by section. The review proposes this, for example around the wave operator `□_g` of a Lorentzian metric and its characteristics (§5.5), plus the differences its step 3 lists.

  Either way the package's name changes or the design is merged into the other text, so the decision cannot be made inside this package. Since this round marks F01 not actionable, a re-raise goes to a human.
- **Shared manifest and reports.** `packages/LorentzianGeometry/sources.toml` and `packages/LorentzianGeometry/reports/` also hold the other pull request's reviews and manifest entries, with `cited_for` ids in its own numbering. The review raises this only for the human reviewers, so I left those entries untouched.
- **Names other roadmaps cite**: none changed.
- **Ownership against open pull requests**: checked against the other `LorentzianGeometry` text through `roadmaps show --pr 2232`. That pull request is not among the 239 roadmaps listed for this job. `scratch/overlaps.md` reports no dropped or revision-only id.
- **Suspicious text**: none found in the review or in the pull-request text I read.
