# Review of AdelicHeightsAndSuccessiveMinima (pull request #2883 at 3fc2cd2)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/AdelicHeightsAndSuccessiveMinima/`
**Verdict:** accepted

**Summary.** Accepted: no finding. Both ownership findings of the earlier review are repaired. Layer 3 now cites SubspaceTheorem §4.2 for the `K`-minimum and its approximation-body case, and owns only the other balanced bodies. Layer 2 now owns only names and elementary properties of DiophantineApproximationAndTranscendence §2.5's height. Every statement and Check I computed holds, including a new negative control at real places. There are two small corrections and one format note, none blocking: the description still describes the earlier head, and the family index here differs from the one five sibling pull requests carry. The human reviewers are asked about the family's end theorem, which rests on an unrefereed announcement of 20 November 2026.

## C01 — The description still describes the earlier head

Three sentences of the description are false at this head, so a reader of the pull request gets the wrong list of deliverables and suppliers.

- The second paragraph ends "Its headline theorems are these." and nothing follows. It would read: "Its headline theorems are the values of the height at `A = 1` and on the whole space, and the two halves of Minkowski's second theorem over `K` for balanced bodies."
- "`Suggested.lean` states 6 headline theorems with `sorry` proofs and 4 definitions" and lists `adelicSubspaceHeight_span_image` and `adelicSubspaceHeight_eq_mul_euclideanDual`. The file now states four theorems, and those two are gone: they are §2.5's. It also says the docstring names "which other headlines are not statable", but the docstring (lines 12–14) says both headlines are statable. It would read: "`Suggested.lean` states 4 headline theorems with `sorry` proofs (`adelicSubspaceHeight_one`, `adelicSubspaceHeight_top` and the two halves of Minkowski's second theorem over `K`) and 4 definitions with real bodies; its docstring lists the README clauses it does not state."
- "other roadmaps that are still in open pull requests merge first". Every supplier (DiophantineApproximationAndTranscendence, SubspaceTheorem, SuccessiveMinima) is on main, as the generated dependency block says. It would read: "Its suppliers are all on main."

## C02 — The family index here differs from the one every sibling pull request carries

The description says the index "is carried, with identical content, by every pull request of the family". At the heads of #2877, #2880, #2894, #2898 and #2924, `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` is one and the same text. This head's version differs from it in 65 lines:
- line 9 names no source for the formal proof, where the siblings name Levent Alpöge's announcement with links;
- several members have other one-line descriptions;
- three members (HeckeIdealsAndTaylorWilesRelations, BernoulliBoundsForClassGroupEigenspaces, FiniteReductiveGroups) stand at other places in what the index calls the merge order.

The siblings' entry for this roadmap still reads "with their duality and behaviour under extension", which this head assigns to DiophantineApproximationAndTranscendence §2.5. Whichever pull request merges second conflicts with the first, or silently replaces its index. Carry one index across the family: for instance, rebase on the siblings' version and change only this roadmap's entry (lines 46–49 here). Alternatively, say in the description which pull request carries the index.

## N01 — Symmetry is implied by balancedness

In 3.1 (line 98) and in the lower bound of `Suggested.lean` (`hBsymm`, line 129), symmetry follows from balancedness with `a = −1`. It could be dropped, or kept with a word that it is implied.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Earlier R01 (Layer 3 vs SubspaceTheorem §4.2) | lines 94, 100, 178; Lean names | §4.2 read as "an approximation body"; minimum cited from §4.2; Lean names now `…_of_isBalancedOverCompletions`, `…_le_of_convex`, no collision | repaired |
| Earlier R02 (Layer 2 vs DAT §2.5) | lines 23, 176, 178; Lean docstring 34–36 | names and elementary API owned; extension invariance and dual identity "Not owned here"; both theorems removed from Lean | repaired |
| Earlier C01, C02, N02 | lines 116–122, 134–135, 178, 198 | lower real half named at pin; Bombieri–Vaaler Thm 3, Thm 6, (3.16) cited at claims; namespaces `TauCeti.` added | repaired |
| Earlier C03, C04, N01 | description; family index; line 11 | description unchanged; index diverges; layer numbering explained at line 11 | C01, C02 here; N01 dropped |
| 2.5a `adelicHeight` (sample) | `ℚ`, `n = 2`, `A_∞ = diag(1, e^(−c))`, `A_p = 1`, `x = e₂` | infinite `(e^(−2c))^(1/2) = e^(−c)`, finite 1; total `e^(−c)` = Check | holds |
| `adelicHeight`, complex exponent | `ℚ(i)`, `A = 1`, `x = (1, 1)` | `mult/d`: `√2^(2/2) = √2`, value over `ℚ`; `1/d`: `2^(1/4)` | Check separates |
| `adelicHeight`, `n = 1` | `ℚ`, `A_∞ = 2`, `A_p = 1`, `x = 3/2` | `|3|_∞ = 3`, `|3/2|_2 = 2`, `|3/2|_3 = 1/3`: product `2` = `ideleNorm 2` | holds |
| `adelicHeight` at `x = 0` | any `A` | infinite factor `0`, finprod of infinite support `1`: value `0` = `height2 0` | consistent |
| Minors matrix vs `TauCeti.plucker` | Cauchy–Binet with `A[I,J]_(a,b) = A(I a, J b)` | `Σ_J det A[I,J]·plucker(x)_J = plucker(Ax)_I` | orientation agrees |
| `adelicSubspaceHeight`, `U = 0` | any `A` | `p = 0`: one empty minor `1`, Plücker vector `1`; height `1` | matches README |
| `adelicSubspaceHeight_one` | `ℚ`, `U = ℚ(2,2)`; `U = ⊥` | minors of `1` are `δ_IJ` (zero row otherwise); `√8·½ = √2` = `height2`; `⊥`: `1` = `subspaceHeight_bot` | holds |
| `adelicSubspaceHeight_top` | `ℚ`, `n = 1`, `A_∞ = 2`; `L = ℚ(i)` | over `ℚ`: `2 = ideleNorm 2`; over `ℚ(i)`: `|2|^(2/2) = 2`, product formula removes Plücker coordinate | holds |
| `_top`, local degrees | `v` real, `w` complex; finite `w | v` | `Σ_(w|v) mult w = [L:K]·mult v`; `Σ e f = [L:K]`: exponents `mult v/d`, `1/d` | equals `ideleNorm^(1/d)` |
| `_top`, `n = 0` | `ι` empty | LHS: empty minor `1`, Plücker `1`, height `1`; RHS `ideleNorm 1 ^ (1/d) = 1` | holds |
| Change of basis (README) | `ℚ`, `A = diag(1, e^(−c))`, `g` the swap, `x = e₂` | `g⁻¹x = e₁`, `(Ag)e₁ = Ae₂`: both `e^(−c)` | holds |
| Dual-height identity (cited) | `ℚ`, `A_∞ = diag(1, e^(−c))`, `U = ℚe₁`, `ℚe₂` | `e₁`: `1` vs `e^(−c)·e^c`; `e₂`: `e^(−c)` vs `e^(−c)·1` | holds |
| `successiveMinimum` | `ℤ ⊂ ℚ`, `B = [−1, 1]`; `l ≥ n` | `μ 0 = inf{t ≥ 1} = 1`; `l ≥ n`: `sInf ∅ = 0` | matches README |
| `IsBalancedOverCompletions` | disc; rectangle `ε < 1`; `ℚ(√2)`, `{|x₁−x₂| ≤ ε, |x₁+x₂| ≤ 1}` | disc kept; `a = i` sends `1` to `i ∉ B`; `a = (1,0)` sends `(½,½)` out for `ε < ½` | separates, real places too |
| 3.1 lower bound (sample) | `ℚ`, `ℤ`, `[−1,1]`; `ℚ`, `ℤ²`, disc | `2 ≤ 1·2`; `2²/2!·1 = 2 ≤ π` | holds |
| Lower bound, `n = 0` | `ι` empty | LHS `covol = μ{0}`; `0 ∈ interior B` forces `B = {0}`: RHS `μ.real {0}` | equality |
| Lower bound, control (complex) | `ℚ(i)`, `ℤ[i]`, rectangle `ε < ½` | LHS `1·4/2·1 = 2`; RHS `μ₀²·4ε = 4ε < 2` | fails; balancedness excludes |
| Lower bound, control (real) | `ℚ(√2)`, `ℤ[√2]`, box above, `c_K = √2`, `μ₀ = 2` | LHS `½·2·2√2 = 2√2`; RHS `4·2ε = 8ε` | fails for `ε < √2/4`; excluded |
| 3.1 upper bound (sample) | rectangle (not balanced); `B = {0}`; `B = ∅` | `1·4ε ≤ 4·1`; `{0}`, `∅`: all `μ = 0`, `0 ≤ covol` | holds without balancedness |
| Third comparison | `ℚ(i)`, `ℤ[i]`: rectangle; disc | rectangle `λ₁ = 1/ε > 1 = c_K μ₀`; disc `λ₁ = 1 = c_K μ₀` | needs balancedness, as stated |
| `μ l ≤ λ (d l)` | pinned extraction lemma: `j`-th pick at position `≤ d·j`; `ℤ[i]`, disc | `μ₀ = 1 ≤ λ₀ = 1` | route sound |
| Bombieri–Vaaler Thm 3 (p. 18) | BombieriVaaler1983 lines 325–356 | `S_v` nonempty, open, convex, symmetric, bounded; `(λ₁⋯λ_L)^d V ≤ 2^(dL)` | matches lines 116–118 |
| Bombieri–Vaaler Thm 6, (3.16) | lines 507–523 (pp. 22–23) | (3.16): `S_v = αS_v`, `|α| = 1`, complex `v`; constants with `π^(sL)`, `L!`, `(2L)!`, `|Δ|` | matches lines 118–121 |
| "(3.16) = balancedness for convex products" | circled, convex, symmetric factor | `ax = |a|·(a/|a|)x` stays; real factors: symmetric convex is balanced | true |
| C02 family index | five sibling heads vs this head | siblings mutually identical; this head differs in 65 lines, three members reordered | diverges |

- Source locators checked against the text: 3 (Bombieri–Vaaler Theorem 3, condition (3.16), Theorem 6); 2.5a carries no source locator of its own (it cites Roy–Thunder through DAT §2.5).
- Library declarations opened at the pins: Tau Ceti `MinkowskiSecond.lean:626, :728`, `ZLattice/SuccessiveMinima.lean:111`, `Extraction/Basic.lean:106`, `ApproximationDomain.lean:141, :224`, `MixedImage.lean:120`, `ExteriorPower/Plucker.lean:104`, `Arakelov/Basic.lean:65`, `Arakelov/Subspace/Basic.lean:86, :292, :322, :349`, `Ideles/Norm/Basic.lean:283`, `Adeles/Extension.lean:184`; Mathlib `ProductFormula.lean:98`, `House.lean:38`.
- Cross-roadmap citations resolved: DAT §§2.5, 2.8 (main); SubspaceTheorem §§4.1–4.3 (main and #2678); SuccessiveMinima §2.1 `minkowski_second_lower` (main); SlopesOfHermitianVectorBundles §§1.1, 1.3, 1.6, 4.1, 4.3, 4.3a (#2880).
- Automatic checks: all passed; none set aside. Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: four `declaration uses sorry` warnings and nothing else. Elaborated types of all eight declarations compared with the README: no binder lost, generality equal.
- One-tactic probes (`simp`, `rfl`, `positivity`, `norm_num` and `simp` unfolding the four definitions) fail on all four theorems: none is padding.
- Pinned Tau Ceti has no adelic height, no `K`-minimum and no balancedness predicate (searched by object); DAT's and SubspaceTheorem's `Suggested.lean` on main declare none of these objects.

Overlap check: read SlopesOfHermitianVectorBundles (#2880), SubspaceTheorem (main and #2678), GlobalNumberFields (#1339), HeightsForLogSingularMetrics (#2894), SuccessiveMinima, HeightsAndUnits and DiophantineApproximationAndTranscendence §§2.5, 2.8. Shared objects and their owners:
- The `K`-minimum, and Minkowski over `K` for approximation bodies: owned by SubspaceTheorem §4.2 and cited here; 3.1 owns only the other balanced bodies.
- The height `H_A`, with its extension invariance and dual identity: owned by DAT §2.5 and cited here; 2.5a owns the names and the elementary API.
- The adele extension map and the idele norm: owned by GlobalNumberFields, realised in Tau Ceti and cited from Tau Ceti.
- The real lower Minkowski bound: SuccessiveMinima §2.1, realised in Tau Ceti and cited.

SlopesOfHermitianVectorBundles only consumes 2.5a and 3.1. HeightsForLogSingularMetrics and HeightsAndUnits share nothing with this roadmap.

Source independence: 8 passages compared with 1 source, none shared beyond a list of hypotheses that can be written one way only. The passages are Bombieri–Vaaler's Theorem 3 with its hypotheses, (3.2), (3.16), and Theorem 6 with its proof, set against 3.1's prose, Checks and route, overview (2), and the docstrings of `successiveMinimum` and `IsBalancedOverCompletions`. Largest share: BombieriVaaler1983, 2 of 3 locators (the third is Bombieri–Gubler App. C.2). Contents compared with Bombieri–Vaaler §§I–V: independent. Roy–Thunder and Bombieri–Gubler were not read.

Research link: 3.1 is Bombieri and Vaaler's adelic Minkowski second theorem (1983, Theorems 3 and 6), extended to bodies balanced over the completions. SlopesOfHermitianVectorBundles uses it for the successive minima of Hermitian vector bundles. 2.5a names the twisted height of Roy and Thunder's absolute Siegel lemma (1996). This rests on the README's References and on Bombieri–Vaaler.

## Not verifiable

- Roy and Thunder, An absolute Siegel's lemma (1996): not in this roadmap's manifest. The earlier round found that GDZ serves only the cover sheet of this Crelle article and that the DOI leads to a paywall; I did not search again. The roadmap cites it only through DAT §2.5.
- Bombieri and Gubler, Heights in Diophantine Geometry (2006), Appendix C.2: only the publisher's page; cited only through SubspaceTheorem §4.2.

## Source issues

- none

## For the human reviewers

- Scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, line 9) takes the Riemann hypothesis for Dirichlet L-functions as its end theorem and "follows a complete formal proof". It cites nothing; the description names an announcement of 20 November 2026, with no refereed source.
- This sub-roadmap's own mathematics rests on Bombieri–Vaaler (1983), Roy–Thunder (1996) and Bombieri–Gubler (2006). It does not depend on that announcement.
- Two roadmaps will carry two proofs of Minkowski's second theorem over `K`: SubspaceTheorem §4.2 on main for approximation bodies, and 3.1 here for all balanced bodies, by the same route (README lines 94, 124–136).
