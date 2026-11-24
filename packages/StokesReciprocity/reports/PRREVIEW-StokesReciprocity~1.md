# Review of StokesReciprocity (pull request #3049 at 07e667c)

**Verdict:** needs changes

**Summary.** Needs changes, for one reason: `Suggested.lean` omits the S4 headline theorems (box dissipation identity, symmetry and positive semidefiniteness of the response matrix), which are statable with the definitions already in the file, and its docstring does not name the S5 general-domain theorem as not statable. Every identity, sign convention and acceptance example I recomputed is correct, the three sorried analytic statements are true as written, and the supplier citations resolve on main. There are three small corrections and three format notes, none blocking. The two cited books are paywalled, so their section locators are unverified, and the scope question is left to the human reviewers.

## R01 (P2) — The S4 headline theorems are statable at the pins but absent from `Suggested.lean`, and its docstring names no headline as not statable

`Suggested.lean` is what the finished roadmap is tested against. As it stands an implementation that stops after S3 passes it, although the title and S4 promise dissipation and the boundary-response matrix; the README (line 8) and the module docstring (lines 10–12) both say the file is only "a subset of the interfaces".

The roadmap's headlines are: the local reciprocal identity (S2), the general box boundary-work identity and box reciprocity (S3), the box dissipation identity and the symmetric, positive semidefinite response matrix (S4), and reciprocity on bounded `C¹` domains (S5). The first three are stated. The S4 ones are statable now: `boxBoundaryWork`, `contraction`, `symGradientMatrix`, `velocityGradient` and `velocityDivergence` are in the file, and `Matrix.PosSemidef` is at the pin (`Mathlib/LinearAlgebra/Matrix/PosDef.lean`). The S5 theorem is not statable: the pinned Tau Ceti has no `C¹`/Lipschitz-domain predicate and no outward-normal carrier (PDE §1.6 and GeometricMeasureTheory G6 are still targets), and the docstring does not say so.

The smallest change: add, with the hypotheses of `box_reciprocity`, (i) for an incompressible solution `(u,p,f)`, `boxBoundaryWork a b μ u u p + ∫ u·f = 2 * μ * ∫ contraction (e(u)) (e(u))`; (ii) for a finite family `(u α, p α)` of zero-force incompressible solutions, that `Matrix.of fun α β => boxBoundaryWork a b μ (u α) (u β) (p β)` is symmetric for every real `μ` and `Matrix.PosSemidef` for `0 ≤ μ`. In the docstring, name the S5 reciprocity theorem as not statable and say which carrier is missing, and reword README line 8 and the docstring so that the file is described as the statement of the headline theorems.

## C01 — The S4 dissipation identity is displayed without the incompressibility it needs

S4 (lines 215–221) displays `B_Q(u;u,p) + ∫Q u·f dx = 2μ ∫Q e(u):e(u) dx` and adds only "The equality holds for arbitrary real `μ`". S3 has just stressed that the general identity needs no incompressibility, so a reader may take the same for this one. Setting `v = u` in the S3 identity gives the right side `∫Q (2μ e(u):e(u) − p div u)`; with `u(x) = x`, `p = 1`, `μ = 0`, `f = 0` the left side is `−d|Q|` and the displayed right side is `0`. The conventions make `div u = 0` part of "solution", so nothing stated is false, but the sentence should say "for an incompressible solution `(u,p)` with force `f`". The same applies to the single-flow identity at line 149 of S2, which without `div u = 0` carries the extra term `− p div u`.

## C02 — `contraction_eq_sum` closes in one tactic

On a copy of the file, `simpa [contraction, Matrix.trace, Matrix.mul_apply] using Finset.sum_comm` proves it, so as a target it asks an implementer for nothing. If it is kept as a sanity check that the trace spelling is the component sum, mark it as one; otherwise the README sentence in S1 already carries it. (`reciprocal_contraction` and `dissipation_contraction` do not close by `simp` with the definitions unfolded.)

## C03 — Mathlib's gradient is not in the file named for it

The supplier paragraph (lines 69–70) places "gradient and the vector-valued Laplacian" in `Mathlib/Analysis/InnerProductSpace/Laplacian.lean`. At the pin that file has the Laplacian (line 139); `gradient` is in `Mathlib/Analysis/Calculus/Gradient/Basic.lean` (line 83). Name both files.

## N01 — Form of `Suggested.lean`

The file imports five `Mathlib.<submodule>` lines where the house form is the single line `import Mathlib`; the namespace is `StokesReciprocityRoadmap` rather than `TauCetiRoadmap.StokesReciprocity`; the nine definitions and two of the theorems have no docstring; the module docstring's title would be "…: target signatures".

## N02 — The book locators stand only in the reference list

No statement in S1–S5 carries a locator; the sections of Kim–Karrila (§1.2, §2.2, §2.3) are given once under the references. Putting each at its claim (the stress and equations in the conventions, dissipation in S4, reciprocity in S3) lets a reader match statement to source, and a section or page of Happel–Brenner for reciprocity would give that entry a locator at all.

## N03 — Supplier section ids

PDE's section is "1.6 … (A6)"; the README writes "PDE A.6". Citing it as "PDE §1.6 (A6)" matches the heading a reader will search for.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `reciprocal_contraction` (S1 identity) | general `A,B`; `d=0` | LHS `−p trB + q trA + μΣ(AᵢⱼBᵢⱼ+AⱼᵢBᵢⱼ−BᵢⱼAᵢⱼ−BⱼᵢAᵢⱼ)`, last sum 0; `d=0`: 0=0 | true | none |
| `dissipation_contraction` | `A=E₁₂` (trace 0) | LHS `μ(A:A+A:Aᵀ)=μ`; RHS `2μ·½=μ` | true | none |
| `contraction_eq_sum` | one-tactic probe | closes by `simpa … using Finset.sum_comm` | padding | C02 |
| Bridge `Div σ = −∇p + μΔu + μ∇div u` | components | `Σⱼ∂ⱼ(−pδᵢⱼ+μ(∂ⱼuᵢ+∂ᵢuⱼ)) = −∂ᵢp+μΔuᵢ+μ∂ᵢdiv u` | true for `C²` | none |
| `local_reciprocity` / `div J` formula | product rule; pointwise hypotheses | `div J = v·Divσᵘ − u·Divσᵛ − p div v + q div u`; with equations at `x`: `u·g − v·f` | true; pointwise `div=0` suffices | none |
| `box_boundary_work` | Example 4 data with `v=e₁`; `n=0` | `B=2μ|Q|`, `∫v·f=−2μ|Q|`, RHS `∫2μ e(u):e(v)=0`; `n=0`: face measure is Dirac, endpoint values | true | none |
| `box_reciprocity` | Example 4; `d=1` | Ex. 4: both sides 0; `d=1`: `−v(p(b)−p(a))+v∫p' = 0` each side | true | none |
| `boxBoundaryWork` vs Mathlib box theorem | face maps, signs | same `insertNth`/`succAbove` faces, `+` at `bᵢ`, `−` at `aᵢ`; integrand `Σⱼ vⱼσⱼᵢ = (σᵀv)ᵢ` | matches | none |
| S4 dissipation identity | `u=x, p=1, μ=0, f=0` | LHS `−d|Q|`, RHS 0 without `div u=0`; equal with it | needs stated hypothesis | C01 |
| S4 response matrix, congruence | Example 6 | `R=μ|Q|[[1,1],[1,1]]`; `CᵀRC=μ|Q|diag(4,0)`; direct: `e(u₁+u₂):e=2`, `2μ·2|Q|` | true | R01 (absent from Lean) |
| Pressure-shift invariance (S3) | `p→p+c` | `B` changes by `−c∫_{∂Q}v·n = −c∫div v`, zero iff total flux zero | true | none |
| Example 5 (ball, annulus) | sphere moments | `∫_{|x|=R}(x₁²+x₂²)dS=2R|B_R|`; outer `4μ|B_R|`, inner `−4μ|B_r|`, sum `4μ|Ω|=2μ·2|Ω|` | true | none |
| Orthogonal covariance (S1, S2) | `A↦OAOᵀ` | `σ↦OσOᵀ`, `σn↦Oσn`, `tr((OAOᵀ)ᵀOBOᵀ)=tr(AᵀB)` | true, reflections included | none |
| Normal/traction sign convention | internal solid boundary | `σn`, `n` out of fluid, is force on fluid; on solid `−σn` | consistent | none |
| S5 supplier contract | GMT G2, G6; PDE §1.6 | G6 has Gauss–Green (compact support `C¹` fields) and `C¹`-domain normal comparison; §1.6 has chart shrinking, finite cover, `C¹`⇒Lipschitz | resolves on main | none |

- Source locators checked against the text: 0 of 4 (both books paywalled).
- Library declarations opened at the pin: 8 (`integral_divergence_of_hasFDerivAt_off_countable` DivergenceTheorem.lean:266; `PiLp.continuousLinearEquiv` PiLp.lean:1141; `PiLp.volume_preserving_ofLp`/`toLp` Haar/InnerProductSpace.lean:134, 139; `Matrix.trace_transpose` Trace.lean:71; `Matrix.trace_mul_comm` Trace.lean:156; `laplacian` Laplacian.lean:139; `gradient` Gradient/Basic.lean:83; `Matrix.PosSemidef` PosDef.lean).
- Cross-roadmap citations resolved: 3 (GeometricMeasureTheory G2, G6; PDE §1.6), all on main.
- Dependency check: `depcheck: 128 roadmaps, 1407 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: the definitions and the three algebraic statements elaborate on a probe copy with `sorry` the only warning; the targeted build passed in the automatic checks; the 16 elaborated signatures were compared with the README, none lost a binder.
- Automatic checks: only the import form failed (N01).
- Pull-request text: title and description agree with the head (new roadmap, six `sorry`s counted, no change outside the folder).
- Overlap check: read IncompressibleFlows, IncompressibleFluids, QuaternionicAnalysis, LocalVariationalFieldTheory; nothing shared (the first two are whole-space or periodic evolution theory with no stress, traction or boundary work).

Source independence: 0 passages compared with 0 sources (neither book could be read legally); largest share Kim–Karrila, 4 of 4 locators; contents not compared with its table of contents, but the README's own locators put dissipation (§2.2) before reciprocity (§2.3), the reverse of S3–S4, and S1, S2, S5 have no cited counterpart.

Research link: The Lorentz reciprocal theorem and energy dissipation identity of Stokes flow, as in Kim–Karrila 1991 (§2.2–2.3) and Happel–Brenner 1983, which the README says underlie resistance and mobility relations (Kim–Karrila Ch. 5); rests on the README's reference list only.

## Not verifiable

- Kim and Karrila, *Microhydrodynamics* (1991), §1.2, §2.2, §2.3, Chapter 5: no legal copy found; the publisher page is paywalled.
- Happel and Brenner, *Low Reynolds Number Hydrodynamics* (1983): the DOI resolves only to a paywalled page; the README gives no locator.
- The description's claim that a repository script validates 107 roadmap entries was not run.
- Ownership against open pull requests was checked through the roadmap search over their heads, not by reading each.

## Source issues

- none

## For the human reviewers

- Scope: the headline results are classical textbook identities of low-Reynolds-number fluid mechanics (two textbooks of 1983 and 1991 are the only sources); S1–S4 are calculus identities on a box. Whether this is within the project's scope is yours to decide.
- Not tested: Kim–Karrila carries all four locators and neither its text nor its contents page could be read, so wording and arrangement were not compared with it.
- The description states the README and `Suggested.lean` were drafted by an AI system and that no independent review preceded this one.
