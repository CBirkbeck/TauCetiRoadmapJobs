# Review of PDE (pull request #1614 at 0084802)

**Verdict:** needs changes

🤖 Independent AI review. Six findings, two blocking (both P2). The recorded gate passes every check and the dependency check reports no problem. `Suggested.lean` elaborates at the branch pin with the single intended `sorry` warning. The pull request adds Lane G (mixed and Neumann boundary conditions) to the PDE roadmap on main and changes nothing outside `TauCetiRoadmap/PDE/`.

**The previous review, finding by finding.** The previous review of this folder is of pull request #93 at fd8e87f, a different pull request that rewrites the whole README; this head is main's README plus Lane G, and none of #93's text is in it. Its findings are therefore checked against this head only where their subject exists here.

- R01 (PDE–GeometricMeasureTheory cycle): the mutual citation is main's text, unchanged by this pull request (`README.md:80–87` and `:253–255` consume GMT G2; `TauCetiRoadmap/GeometricMeasureTheory/README.md:57` and `:279–281` on main consume PDE Lane A). Inherited, recorded under R06, not counted against this pull request.
- R02 (interval-operator supplier), R05 (dyadic Besov X0), R08 (weak Hopf dimension): specific to #93's text; nothing corresponding is in this head.
- R03 (inventory versus the pinned library), R06 ("standard kernel bounds" in B.10), R10 (README shape, per-definition Checks): main's text; Lanes B–D are recorded as done in `STATUS.md`. Inherited, not raised.
- R04 (no headline stated) and R11 (coordinate API padding in `Suggested.lean`): still true of the on-main part of `Suggested.lean` (`:54–243`); this pull request adds one sorried theorem. Inherited, recorded under R06.
- R07 (empty domain and a first eigenvalue): main's acceptance criterion is unchanged; the new G.32 assumes `Ω` connected, which excludes the empty domain. Recorded under R06 for the inherited criterion.
- R09 (locators on sampled targets): applies to the new Lane G text, which carries no theorem locators. Raised as R04 below.

## R01 (P2) — Lane G cites three Tau Ceti declarations that exist at neither pin

**Location:** `TauCetiRoadmap/PDE/README.md:533–535` ("`Set.IsLipschitzDomainWith`", "the trace is `TauCeti.W1p.frontierTrace`") and `:552–554` ("one inclusion of which is `TauCeti.W1p.w1p0Submodule_le_ker_frontierTrace`").

**Claim:** The Lane G contract names its Lipschitz-domain predicate, its trace operator and the zero-trace inclusion as existing Tau Ceti declarations ("As in Lane A.6's Tau Ceti implementation"). None of the three exists at the pinned Tau Ceti, and the citation cannot be checked at the pin.

**Witness:** A grep of the pinned Tau Ceti of this pull request's manifest (a91d3aa, 2026-10-05) and of main's manifest (358314d, 2026-10-07) finds no `frontierTrace`, no `IsLipschitzDomain` and no `LipschitzDomain` directory under `TauCeti/Analysis/Sobolev/`; the pinned trace-free Rellich is `TauCeti.W1p0.isCompactOperator_valueL` (`RellichKondrachov.lean`, header: "the corresponding statement for all of `W^{1,p}(Ω)` requires a boundary-regular extension operator and is not claimed here"). The names are real upstream: the library's documentation pages for `Analysis/Sobolev/LipschitzDomain/Trace/Frontier` and `.../LipschitzDomain/Basic` list `TauCeti.W1p.frontierTrace` (hypotheses `p ≠ ⊤`, `IsLipschitzDomainWith L`, `IsBounded Ω`, target `Lᵖ` of the Euclidean Hausdorff measure of dimension `finrank ℝ E` restricted to the frontier), `w1p0Submodule_le_ker_frontierTrace`, and by now also `ker_frontierTrace` and `mem_w1p0Submodule_iff_frontierTrace_eq_zero`; `PROGRESS.md` dates them to Tau Ceti d96e9ce (2026-10-25), after both pins. The worker's `roadmaps resolve` flags exactly these three names.

**Repair:** Cite A.6's objects as this roadmap's own targets rather than as pinned declarations: "the Lipschitz-domain predicate of A.6 (with its constant `L`)" and "A.6's trace operator `W^{1,p}(Ω) → Lᵖ(∂Ω, μHE[n−1])`, bounded for `1 ≤ p < ∞` on bounded Lipschitz domains", and for G.29's last bullet "A.6's identification `ker(trace) = W^{1,p}_0`", without backticked library names, or keep the names and say in one clause that they are A.6's implementation at a Tau Ceti revision later than the pin. Either way the Lean file stays as it is: it uses only `TauCeti.W1p0`, which is at both pins. The G.28 description of the predicate (affine isometry, open cylinder, region above a Lipschitz graph, one constant for all charts) agrees with the upstream docstring, so no mathematics changes.

## R02 (P2) — G.32 asserts a compact self-adjoint inverse in the pure Neumann case, where the operator has no inverse

**Location:** `TauCetiRoadmap/PDE/README.md:573–576`: "As D.19 … a compact self-adjoint inverse and an eigenfunction basis; … for `Γ = ∅` it is `0`, with exactly the constants as eigenfunctions."

**Claim:** For `Γ = ∅` the route "as D.19" is not available as written: the Neumann realisation of `−Δ` on a connected `Ω` has the constants in its kernel, so it has no inverse, compact or otherwise. The eigenfunction basis and the eigenvalue `0` are correct; the stated route to them is not.

**Witness:** `Ω = (0,1)`, `Γ = ∅`, `u = 1`: `u ∈ H¹_∅(Ω) = H¹(Ω)`, `∫ u' v' = 0` for every `v ∈ H¹(Ω)`, so `u` is a nonzero weak solution of the homogeneous Neumann problem and `−Δ_N` is not injective. By contrast with `Γ = {0}` the form `∫ u' v'` is coercive on `H¹_Γ` (item 30), so the D.19 route applies verbatim there.

**Repair:** State the route for `Γ = ∅` through the resolvent: `(−Δ_N + 1)⁻¹ : L²(Ω) → L²(Ω)` exists by Lax–Milgram on `H¹(Ω)` with the form `∫ ∇u·∇v + ∫ uv`, is compact by Rellich on `H¹(Ω)` (A.6, bounded Lipschitz `Ω`) and self-adjoint; its eigenvalues `μ_k ∈ (0,1]` give the Neumann eigenvalues `λ_k = 1/μ_k − 1 ≥ 0`, with `λ = 0` exactly on the constants because `∫ |∇u|² = 0` forces `u` constant on connected `Ω`. Keep "a compact self-adjoint inverse" for the case `μHE[n−1] Γ > 0` only. On the instance above, `(−Δ_N + 1)⁻¹` has eigenvalues `1/(1 + m²π²)`, `m ≥ 0`, the first being `1` on the constants.

## R03 (P3) — The Poincaré-normalization bullet omits connectedness for `W^{1,p}_Γ`

**Location:** `TauCetiRoadmap/PDE/README.md:103–107`: "holds … on `W^{1,p}_Γ(Ω)` for a boundary part `Γ` of positive measure (Poincaré–Friedrichs, Lane G) … for `Ω` bounded".

**Claim:** As a summary the clause is false without connectedness (or "every component of `Ω` meets `Γ`"); G.30 itself carries "bounded connected", so this is the summary bullet only.

**Witness:** `Ω = (0,1) ∪ (2,3)`, `Γ = {0}`, `u = 1` on `(2,3)` and `0` on `(0,1)`: `u` is the restriction of a smooth compactly supported function whose support misses `closure Γ`, so `u ∈ W^{1,p}_Γ(Ω)`; `∇u = 0`, `‖u‖_p = 1`, and no `C` satisfies `‖u‖_p ≤ C‖∇u‖_p`. On `(0,1)` alone with `Γ = {0}` the inequality holds with `C = 1`.

**Repair:** Write "for a boundary part `Γ` of positive measure and `Ω` connected (Poincaré–Friedrichs, Lane G)". The same remark applies to the inherited Poincaré–Wirtinger clause in the same bullet ("modulo constants" needs `Ω` connected, as Tau Ceti's `Poincare/Wirtinger/W1p.lean` states it for bounded convex `Ω`).

## R04 (P3) — Lane G's targets carry no locators, and two hypotheses drift from their suppliers

**Location:** `TauCetiRoadmap/PDE/README.md:536–576` (items 28–32), `:624–629` (the two new references).

**Claim:** No Lane G item has a theorem, section or page locator; the two new references are cited only as works. The trace characterisation of G.29 is stated for all `1 ≤ p < ∞` and all `n` with no source; G.29's second bullet says "for Lipschitz `Ω` (from A.6's extension operator)" while A.6's extension is for bounded Lipschitz domains; G.29 restricts the definition to `1 ≤ p < ∞` while `Suggested.lean` defines it for every `p ≥ 1` including `∞`.

**Witness:** `bauer-pauly-schomburg-2016` lines 329–338 (printed p. 6) define strong Lipschitz domains and strong Lipschitz boundary parts exactly as G.28 does (rigid motion, graph `x₃ < ξ(x′)`, `Γ_τ` over `x₁ < ζ(x₂)`), and lines 309–322 (Definitions 2.3, 2.5, 2.6) define the weak (bi-Lipschitz) pairs; its Lemma 3.1 (lines 414–424) proves closure = trace-zero space for weak Lipschitz pairs in `ℝ³` with `p = 2` only, crediting the proof to Jochmann. Gröger 1989 resolves only to a paywalled page (uncertified). `Suggested.lean:258` takes `(p : ℝ≥0∞) [Fact (1 ≤ p)]` with no `p ≠ ∞`.

**Repair:** Attach locators: G.28 to Bauer–Pauly–Schomburg §2.1, printed p. 6 (strong pairs) and Definitions 2.3–2.6, p. 5 (weak pairs); G.29's trace characterisation to Lemma 3.1, p. 7, stating that it covers `p = 2`, `n = 3`, and name the source for general `p` and `n` or state the general case as this roadmap's own theorem with the reflection-and-mollification route; add the arXiv identifier (1511.06697) to the reference entry; write "bounded Lipschitz `Ω`" in G.29's second bullet; and either say in G.29 that the definition makes sense for every `p` (with the theorems for `p < ∞`) or restrict the Lean definition. Add a non-example for admissibility as a Check: on the unit square, `Γ = {0} × ⋃_k (1/(2k+1), 1/(2k))` is relatively open in the boundary but no chart at `(0,0)` puts it over one side of a Lipschitz graph, so it is not admissible; and record that at the corner `(0,0)` the admissible chart of the acceptance Check is the one rotated by `π/4`, with base of dimension one and interface a single point.

## R05 (P3) — `Suggested.lean` form: stale docstring, an unused duplicate abbreviation, an unused hypothesis

**Location:** `TauCetiRoadmap/PDE/Suggested.lean:12` ("the build lanes (A–F)"), `:264–266` (`W1pVanishingOn`), `:269–271` (`hp : p ≠ ∞`).

**Claim:** The module docstring does not mention Lane G and does not name the Lane G headlines that are not statable at the pins or what each lacks. `W1pVanishingOn` is an `abbrev` for `w1pVanishingOnSubmodule` of the identical type (`Submodule ℝ (W1p volume Ω p)`, both elaborated), used by no statement; the `W1p0` pattern it imitates has two declarations because `w1p0Submodule` is a `ClosedSubmodule` and `W1p0` its `toSubmodule`, which is not the case here. The hypothesis `p ≠ ∞` of `w1pVanishingOnSubmodule_frontier` is not needed: the generating set of `w1pVanishingOnSubmodule Ω p (frontier Ω)` is the set of jets of test functions of `Ω` for every `p` (a `φ` with `tsupport φ` disjoint from `frontier Ω` has `tsupport φ ∩ Ω = tsupport φ ∩ closure Ω` compact, and the weak gradient of a jet whose value is `φ` a.e. is `∇φ` by uniqueness of weak derivatives), and `W1p0` is defined at the pin for every `p ≥ 1`.

**Witness:** Elaborated types from a scratch `#check` file: `@W1pVanishingOn` and `@w1pVanishingOnSubmodule` print the same binders and result type. The one-tactic probe on the sorried theorem (`rfl`, `simp [w1pVanishingOnSubmodule, W1p0, w1p0Submodule]`, `ext u; simp [...]`) fails in all three forms, so the theorem is not padding.

**Repair:** Extend the docstring: Lane G's trace characterisation, Poincaré–Friedrichs, the mixed and Neumann problems and the mixed spectra are not statable at the pins because the Lipschitz-domain predicate, the frontier trace and Rellich on `W^{1,p}(Ω)` are absent there; the stated identification `w1pVanishingOnSubmodule_frontier` is the one Lane G statement the pins support. Delete `W1pVanishingOn` and make `README.md:547` read "(Lean: `w1pVanishingOnSubmodule Ω p Γ`)". Drop `hp`, or keep it with the README's `1 ≤ p < ∞` and say so in the docstring.

## R06 (P3) — Inherited from main, outside this pull request's change

**Location:** `TauCetiRoadmap/PDE/README.md:80–87`, `:253–255`, `:603–604`; `TauCetiRoadmap/PDE/Suggested.lean:54–243`.

**Claim:** Three defects of the on-main roadmap persist at this head and are listed so the record is complete; the pull request neither introduces nor touches them. (i) PDE A.6 consumes GeometricMeasureTheory G2 while GeometricMeasureTheory on main consumes PDE Lane A (its `README.md:57`, `:279–281`): a two-roadmap cycle in prose that the dependency check, which reads `*Needs:*` lines only, cannot see. (ii) The parabolic-carrier section of `Suggested.lean` consists of proved coordinate and metric API (nine `rfl` proofs, `dist_eq_parabolicDist` one `simpa` from `WithLp.prod_dist_eq_add`), and no Lane A–F headline is stated; `PROGRESS.md` records a native `TauCeti.ParabolicSpaceTime` upstream, which is at neither pin. (iii) The acceptance criterion "the first Dirichlet eigenvalue of `−Δ` is positive" needs `Ω` nonempty.

**Witness:** `Ω = ∅` gives `L²(Ω) = {0}` and no eigenvalue; `Ω = (0,π)` gives first eigenpair `(1, sin x)`.

**Repair:** For this pull request, none required. For the roadmap: break the GMT edge by one owner of the Lipschitz graph measure, delete the coordinate API from `Suggested.lean` (the README keeps it), and add "nonempty" to the criterion.

## Verified sound

**Scope and gate.** HEAD is `00848027ffbefcb93b738e124d3974aaa4c8a656`; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/PDE'` is empty; inside the folder the diff is `README.md` (+65/−2) and `Suggested.lean` (+31). The worker's gate at this head passes every check (set_option, latex, prnum, sorry-data, residue, imports, readme-ids, depcheck, stray-files, build all 0). No source passage, algorithm, sorry'd data, `set_option`, `lemma`, pull-request number or process word in the two files. The folder's `STATUS.md`, `PROGRESS.md` and `metadata.toml` are main's generated files, not stray files. Two open pull requests revise this folder (#93 at 39cbb30 rewrites the README in layer form; this one adds Lane G to main's lane form); whichever merges second must be rebased onto the other, which is the operator's call, not a finding.

**Elaboration at the branch pin** (Tau Ceti a91d3aa, Mathlib 6b7abb3c; checked before and after each run): `lake env lean` on `Suggested.lean` gives exactly one diagnostic, `Suggested.lean:269:8: declaration uses 'sorry'`. The scratch `#check` file printed the elaborated types of `w1pVanishingOnSubmodule`, `W1pVanishingOn`, `w1pVanishingOnSubmodule_frontier`, `TauCeti.W1p0`, `TauCeti.w1p0Submodule` and `TauCeti.W1p.ofTestFunctionₗ`; the theorem keeps every section binder including `[FiniteDimensional ℝ F]` (required by `W1p0`), and the two definitions drop it because `W1p` does not need it, which is harmless. Main's manifest pins Tau Ceti 358314d; the content pin lacks built object files for `TauCeti.Analysis.Sobolev.W1p.Zero` (the worker's signature extraction failed there), so library facts were verified textually at that pin and elaborated at the branch pin; every pinned declaration below exists at both.

**Library declarations opened at the pins.** `TauCeti.W1p` (`Analysis/Sobolev/W1p/Basic.lean:375` at a91d3aa, `:355` at 358314d; a submodule of `Sobolev1JetLp` cut out by the weak integration-by-parts identities); `TauCeti.w1p0Submodule` and `TauCeti.W1p0` (`W1p/Zero.lean:123`, `:147`, both pins; closure of the range of `W1p.ofTestFunctionₗ`); `TauCeti.Wkp.value` (`Wkp/Basic.lean:236`); `energyFormH1L` on `W1p mu Omega 2` and `energyFormH1L0` on `W1p0` (`Analysis/PDE/EnergyForm/Sobolev.lean:524`, `:600`), so G.31's "energy form of D.16" on `H¹(Ω)` has a pinned carrier; Rellich only on `W1p0` (`RellichKondrachov.lean` header); Poincaré–Wirtinger on `W^{1,p}` of bounded convex sets (`Poincare/Wirtinger/W1p.lean` header). Mathlib: `Mathlib/Analysis/Normed/Operator/Compact/FredholmAlternative.lean:164` (`hasEigenvalue_or_mem_resolventSet`) and `:221` (`hasEigenvalue_iff_mem_spectrum`); `IsCoercive.continuousLinearEquivOfBilin` (`InnerProductSpace/LaxMilgram.lean:105`); `Metric.Snowflaking` (`Topology/MetricSpace/Snowflaking.lean:64`).

**Seeded sample.** "Fredholm alternative for compact operators" (`README.md:7`, `Suggested.lean:17`): the Mathlib file above exists at the pin and states the alternative for a compact operator and `μ ≠ 0`; the inventory's claim is supported. "Carleson project" (`README.md:214`, `:637`): the repository `fpvandoorn/carleson` exists and its landing page describes a formalised generalised Carleson theorem on doubling metric measure spaces; the landing page does not mention the maximal function or Vitali covering, so the README's claim about what can be vendored was not verified beyond the repository's existence (Lane B is recorded as done in Tau Ceti, with `TauCeti.maximalFunction` at the pin). "Lane A comes first" (`README.md:642–647`): a planning claim, not a sourced one; Lane G's declared inputs (`README.md:647`, "needs only Lanes A and D") agree with its items: G.29 uses A.6's trace and extension, G.30 A.6's Rellich, G.31 D.16–D.18 and A.5, G.32 D.19. Every A.6 input Lane G uses is beyond the pins (R01).

**Ownership and duplication.** `roadmaps grep` over the 438 open pull requests and main for `W1pVanishingOn`, "Poincaré–Friedrichs", "mixed boundary", "Neumann (problem|Laplacian|eigen|boundary|condition)" finds no other owner of mixed or Neumann boundary value problems or of `W^{1,p}_Γ`; the hits are ShimuraCompactifications' "mixed boundary data" (unrelated), OperatorTheory's von Neumann criterion, and SobolevPolynomialApproximation (#1612), whose "Poincaré–Friedrichs inequalities" are Tau Ceti's zero-boundary Poincaré, not the `W^{1,p}_Γ` version. SobolevDifferentialForms (#1609) cites PDE Lane A.6's `Set.IsLipschitzDomainWith` the same way this README does (same pin drift, that folder's own review). The pinned Tau Ceti has no object for functions vanishing on part of the boundary; at `Γ = frontier Ω` the new submodule duplicates `w1p0Submodule` by design and the stated theorem identifies them.

**Supplier order.** PDE is on main. The dependency check:

    depcheck: 204 roadmaps, 1497 edges, 0 problem(s)

No UPWARD or CYCLE line. Lane G's citations are internal (Lanes A and D), Mathlib and Tau Ceti; the only cross-roadmap edges in the README are main's GMT citations (R06).

**Adversarial table.** Instances computed on each side.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| G.28 admissible boundary part | `Γ = ∅`; `Γ = ∂Ω`; unit square, `Γ = {0}×(0,1)` at `(0,0)`; `Γ = {0}×⋃_k(1/(2k+1),1/(2k))`; `n = 1` | over none / over all of the base; at the corner the chart rotated by `π/4` has graph `t = |s|` (constant 1) and `Γ` over `{s < 0}`, one side of the point `s = 0`; the oscillating `Γ` has no chart at `(0,0)`; for `n = 1` the base is a point and only "all/none" occur | definition discriminates; agrees with BPS p. 6 strong pairs | Check (R04) |
| G.29 `W^{1,p}_Γ` definition | `Γ = ∂Ω`; `Γ = ∅`; `Ω = (0,1)∪(2,3)`, `Γ = {0}`; `p = ∞` | `Γ = ∂Ω`: `tsupport φ ∩ closure Ω = tsupport φ ∩ Ω` compact, generating set = jets of test functions of `Ω`; `Γ = ∅`: all of `C_c^∞(F)|_Ω`; `1_{(2,3)} ∈ W_Γ` with `∇ = 0`; `p = ∞`: same generating sets | sound; `hp` unused | R03, R05 |
| G.29 bullet 1 (= `W_0`), Lean theorem | `Ω = ∅` (`⊥`); `Ω = univ`; general `Ω`; one-tactic probe | `⊥`: both sides are the whole zero space; `univ`: both sides the closure of `C_c^∞(F)`; general: generating sets equal (above); `rfl`, `simp`, `ext; simp` all fail | true at every `p`; not padding | none |
| G.29 bullet 2 (`W_∅ = W`) | bounded Lipschitz `Ω`; half-space | extension then density of `C_c^∞(ℝⁿ)` in `W^{1,p}(ℝⁿ)`; A.6's extension is for bounded domains, the half-space needs the segment-condition route | hypothesis drift | R04 ("bounded") |
| G.29 bullet 3 (trace characterisation) | `Γ = ∂Ω`; `u = φ|_Ω` with `tsupport φ ∩ closure Γ = ∅`; `p = 2`, `n = 3` | `Γ = ∂Ω`: `ker(trace) = W_0` (upstream `ker_frontierTrace`); easy inclusion: `trace(φ|_Ω) = φ|_{∂Ω} = 0` on `Γ`; hard inclusion: BPS Lemma 3.1 for `p = 2`, `n = 3` | sound; general `p`, `n` unsourced | R04 |
| G.30 Poincaré–Friedrichs | `Ω = (0,1)`, `Γ = {0}`; `Γ = ∅`, `u = 1`; disconnected instance of R03 | `u(x) = ∫_0^x u'` gives `‖u‖_p ≤ ‖u'‖_p`, `C = 1`; `u = 1`: `1 ≤ C·0` false; disconnected: false, excluded by "connected" | sound as stated in G.30 | R03 (summary bullet) |
| G.31 coercive case | `c ≥ 0`, `μ(Γ) > 0`, connected; `c = 0`, `Γ = ∅` | `a(u,u) ≥ λ‖∇u‖² ≥ λ/(1 + C²)‖u‖²_{H¹}`; `Γ = ∅`, `c = 0`: `a(1,1) = 0`, not coercive | sound | none |
| G.31 pure Neumann iff | `Ω = (0,1)`, `h = 0`, `f = cos πx`; `f = 1`; `b = 1`, `u = x` | `∫f = 0`, `u = cos(πx)/π² + c` solves; `f = 1`: `u'(1) − u'(0) = −1 ≠ 0`, no solution; with drift `a(u,1) = ∫ u' = 1 ≠ 0`, so `b = 0` is needed and is assumed | sound | none |
| G.32 spectra | unit square, `Γ = {0}×(0,1)`; `Ω = (0,1)`, `Γ = ∅` | eigenvalues `(k+½)²π² + m²π²`, minimum `π²/4` at `sin(πx/2)` (`u(0) = 0`, `u'(1) = 0`); Neumann on `(0,1)`: `(mπ)²`, `λ₁ = 0` on constants, `−Δ_N` not injective | eigenvalue claims sound; "inverse" false for `Γ = ∅` | R02 |
| Acceptance Check (`README.md:603–607`) | as G.32 row; `Γ = ∅`, `u = 1` | `π²/4`, `sin(πx/2)`; `‖1‖_p = 1 > C·0` | agrees with G.30–G.32 | none |
| Poincaré bullet (`README.md:103–107`) | `Ω = (0,1)∪(2,3)`, `Γ = {0}` | `‖1_{(2,3)}‖_p = 1`, `‖∇‖_p = 0` | false without "connected" | R03 |
| Lean binders and generality | `#check` of the three declarations | theorem keeps `FiniteDimensional`, `BorelSpace`, `IsAddHaarMeasure`, `Fact (1 ≤ p)`, `p ≠ ∞`; defs admit any `Γ : Set F` and `p = ∞`; `F` general versus README's `WithLp 2 (ℝ × E)` (docstring says so) | Lean wider than README, nothing false | R04, R05 |

**Cross-roadmap citations resolved.** GeometricMeasureTheory G2, G3–G6 (on main, `README.md:57`, `:279–281`); Isoperimetry I3, I5 (on main). Lane G cites no other roadmap.

## Not verifiable

- Gröger, Math. Ann. 283 (1989) (`groger-1989`): the DOI resolves only to a paywalled Springer page; the GDZ volume page for Math. Ann. 283 is a script shell with no article text. Recorded uncertified. The README cites it as a general reference without a theorem, so nothing in Lane G depends on a locator into it.
- The contents of the Carleson repository beyond its landing page (maximal function, Vitali covering, Calderón–Zygmund machinery): not read; the claim is main's text.
- `TauCeti.W1p.frontierTrace`, `Set.IsLipschitzDomainWith`, `w1p0Submodule_le_ker_frontierTrace`: verified to exist only in the library's online documentation (post-pin); they are at neither pin and their files could not be opened here (R01).

## Source issues

- none
