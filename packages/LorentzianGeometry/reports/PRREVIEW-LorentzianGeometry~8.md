# Review of LorentzianGeometry (pull request #2232 at 42109b8)

**Verdict:** accepted

**Summary.** Accepted: the 47 changed lines since `fc070ae` are correct and no finding remains. The new reduction of §2.7 (a `C^l`-extension of a connected second-countable manifold may be taken second countable) is sound and closes the gap that §12.4's auxiliary complete Riemannian metric had on an extension quantified over all connected Hausdorff targets; the §12.2 locator, the R4.7 contract and the two newly named roadmaps resolve. One small correction, to the pull request's description, not blocking; nothing is left for a human to decide.

## C01 — The description still calls the consumer of the acoustical metric "a hyperbolic-PDE roadmap", and does not say that the README now names CompressibleEulerEquations and SymmetricHyperbolicSystems

A reader of the description cannot tell that the README now hands the fluid side to two named roadmaps that are open pull requests placed after this one. The description says "takes acoustical metrics on `ℝ × Σ` as the model (§7.3), with a hyperbolic-PDE roadmap as its consumer"; at this head "Scope and ownership" (README lines 82–84) assigns the compressible Euler equations to CompressibleEulerEquations and linear symmetric hyperbolic systems on `ℝ × ℝⁿ` to SymmetricHyperbolicSystems, §7.3 (line 1339) and "Downstream consumers" (lines 2353–2357) name CompressibleEulerEquations, and the RiemannianGeometry contract (line 360) now lists R4.7.

Text that would be right: "… (§7.3), with CompressibleEulerEquations as its consumer (§6.1, §6.3, §7.3, §8.2, §12.6); linear symmetric hyperbolic systems are left to SymmetricHyperbolicSystems. Neither is a supplier." and, in the supplier sentence, "RiemannianGeometry (R1.3, R2–R3, R4.7, R5a)".

## Previous findings

- none: the previous report, of `fc070ae`, has no finding to account for.

## Verified sound

| Target | Instances | Roadmap value | Computed or source value | Result |
| --- | --- | --- | --- | --- |
| §2.7 second-countable target (README lines 805–810; Conventions line 212) | `M = (1, 2)`, `g = −dt²`, `M̃` the open long ray with a continuous metric; `p = 2`, `U = (1.5, 2.5)` | `ι(M) ∪ U` connected, Hausdorff, second countable, a `C^l`-extension | `closure ι(M) \ ι(M) = {2}`; `ι(M) ∪ U = (1, 2.5)`, an interval, `≠ ι(M)` since `2 ∈ U`; the long ray itself is not second countable | sound |
| Same, each step | general `M̃` | `ι(M)` nonempty, open, not closed; `U` second countable | `ConnectedSpace M` gives nonempty; open and `≠ M̃` in connected `M̃` is not clopen; `U ≅` open subset of finite-dimensional `E`; union of two second-countable open sets is second countable | sound |
| Same, controls | `M̃ = M ⊔ N` disconnected; `Suggested.lean` lines 118–123 | connectedness of `M̃` is used | `ι(M)` is clopen, `closure ι(M) \ ι(M) = ∅`, the step fails; `IsInextendible` carries `[T2Space M'] [ConnectedSpace M']`, `M' : Type u`, and an open subset of `M'` stays in `Type u` | hypothesis used, in scope |
| §12.4 "by §2.7 the extension may be taken second countable, so `h` exists" (lines 2012–2013) | `isInextendible_zero_of_isGloballyHyperbolic` (line 348), `minkowski_isInextendible_zero` (line 358) | `M` connected and second countable | line 349 has `[SecondCountableTopology M] [ConnectedSpace M]`; `ℝ × F` is both; a connected Hausdorff manifold with a Riemannian metric is metrizable, so without §2.7 `h` need not exist | sound; the reduction is needed |
| §12.2 `int D(A)` globally hyperbolic for closed achronal `A` (line 1937) | Minkowski `ℝ^{1+1}`, `A = {t = 0, |x| ≤ 1}`; `A` a point | globally hyperbolic | `int D(A) = {|t| < 1 − |x|}`; for `p = (−a, 0)`, `q = (a, 0)`, `a < 1`, `J⁺(p) ∩ J⁻(q) = {|t| ≤ a − |x|}`, compact; point: `int D(A) = ∅`, the source's excluded case, vacuous here | sound; `minguzzi2019` line 4210, page 99 |
| RiemannianGeometry R4.7 in the contract (line 360) and §6.2 (lines 1202–1203) | `(cosh s, sinh s)`, `(−cosh s, sinh s)` | future unit hyperboloid `= {v ∈ C((1,0)) | form = −1}` | `−cosh² s + sinh² s = −1`, `|sinh s| < cosh s`: in the cone; the second has form `−1` and `v.1 < 0`: excluded | sound; R4.7 on main names the future unit hyperboloid (RiemannianGeometry README lines 2687, 2721) |
| "Downstream consumers" and scope (lines 82–84, 1339, 2353–2357) | CompressibleEulerEquations and SymmetricHyperbolicSystems at their open heads | Euler consumes §6.1, §6.3, §7.3, §8.2, §12.6 and owns quasilinear systems; linear systems on `ℝ × ℝⁿ` are SymmetricHyperbolicSystems' | the Euler README's `From TauCetiRoadmap.LorentzianGeometry` lists exactly these five sections and says quasilinear systems "are owned here"; SymmetricHyperbolicSystems' scope says "on `ℝ × ℝⁿ`" and excludes quasilinear systems | agrees on both sides |

The rows for the untouched statements stand as in the previous review, of `fc070ae`.

- Source locators checked against the text: 3 (`minguzzi2019` line 4210, Theorem 3.45, page 99; lines 3713 and 3716, Propositions 3.15 and 3.16, page 87); `gallowaylingsbierski2018` lines 153 and 189 read for the auxiliary complete Riemannian metric and Lemma 2.1. Of the seeded sample only §12.2 falls in a changed passage.
- Library declarations opened: none new; `Suggested.lean` is unchanged, and lines 105–123 (`IsExtension`, `IsInextendible`) and 348–362 were read against the new prose.
- Cross-roadmap citations resolved: 4. RiemannianGeometry R4.7 on main (`1b7b481`); CompressibleEulerEquations and SymmetricHyperbolicSystems at their open heads (`d30bd0f`, `6a5cca3`), named as consumer and as owners of excluded material, not as suppliers; RelativisticQuantumFieldTheory §1.1 at its new head `564db65` (README line 309; `Spacetime`, `minkowskiSquare`, `causalFuture`, `causalPast` at `Suggested.lean` lines 63, 69, 79, 84).
- Automatic checks: the worker's run at `42109b8` passed every check, with the targeted build. Dependency check rerun against the candidate order: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line; LorentzianGeometry stands right after RelativisticQuantumFieldTheory. Rerun against main's order alone, the same check says only that the roadmap is not yet listed there, which is not a defect. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 0 errors and 8 `sorry` warnings (lines 151, 304, 312, 323, 348, 358, 427, 473), nothing else.
- Pull request text read against the head: the title, the summary block, the supplier list (nine `From …` subsections, none added or dropped), the stated and not-statable lists; one sentence is out of date (C01).
- Overlap check: read CompressibleEulerEquations, RelativisticQuantumFieldTheory, RiemannianGeometry and, beyond the lists, SymmetricHyperbolicSystems; the acoustical form (§7.3) and domains of dependence in a subset (§12.6) are owned here and cited by CompressibleEulerEquations; `LinearSystem` is SymmetricHyperbolicSystems'; the flat `causalFuture` and `causalPast` are RelativisticQuantumFieldTheory §1.1's. No object has two owners; no dropped id, no second copy, no other pull request changes this roadmap.
- Source independence: changed passages only; 3 passages compared with 2 sources (`minguzzi2019` line 4210, `gallowaylingsbierski2018` lines 153 and 189), none shared beyond a statement of a dozen words; the arrangement was not compared again (no layer added, removed or reordered).
- Research link: §12.4 states the `C⁰`-inextendibility theorems of Sbierski (2018) and Galloway–Ling–Sbierski (2018); §12.3 and §13.3 the Bernal–Sánchez splitting and the Hawking and Penrose singularity theorems; §12.6–§12.7 and §7.3 serve Dafermos–Luk (2017) and Luo–Yu (2023). Rests on the README's sources.

## Not verifiable

- The description's "Annals definitions 50 and 51" names a list that neither the folder nor the repository's top-level files identify.
- `oneill1983` is settled as uncertified: "Theorem 14.55A", on which the description's Hawking sentence rests through §13.3, was not read.

## Source issues

- none

## For the human reviewers

- none
