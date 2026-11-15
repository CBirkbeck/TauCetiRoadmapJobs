# Review of HeisenbergImprimitivity (pull request #1149 at 185669b)
Folder: `TauCetiRoadmap/HilbertModules/HeisenbergImprimitivity/`
**Verdict:** accepted

Incremental re-review of 0 changed lines since 185669b. This round checks the title and description as they stand now, against the head and main e6f6358. No finding.

## Previous findings

- R01 — repaired: the summary block now reads "Its two-torus dictionary realises the Schwartz imprimitivity model of the noncommutative two-torus for every nonzero θ and compares it with NoncommutativeGeometry’s module and Powers–Rieffel projection." HilbertModules is no longer called a user.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Summary block: "realises the Schwartz imprimitivity model … for every nonzero θ"; prose: "at θ = 0 the construction does not apply" (§6.3) | general θ≠0; θ=0 | `σ((l,u),(nθ,−m))=e(−ml−unθ)=1` for all m,n gives `l∈ℤ`, `u=j/θ`: `D_θ` as README line 834, `c_E=|θ|`, `c_D=1/|θ|`, product 1. θ=0: `E_0={0}×ℤ`, quotient `ℝ×𝕋` not compact | agrees | none |
| Summary block: "module dimension covol(E) = covol(D)⁻¹" (§5.2, §6.1) | `M=ℝ`, `D=2ℤ×(1/3)ℤ`; `M=ℤ/2`, `D=0` | `e(2au−bn/3)=1` for all a,b gives `E=3ℤ×(1/2)ℤ`; `c_D=2/3`, `c_E=3/2`. Finite: `c_E=|F|/|E|=2/4=1/2=|D|/|F|` | agrees | none |
| Summary block: "the cocycle calculus … permits 2-torsion" (§1.1) | `M=ℤ/2`, `x=(1,χ₀)`, `y=(0,χ₁)` | `β(x,y)=χ₁(1)=−1`, `β(y,x)=χ₀(0)=1`, `σ(x,y)=−1`; no square root of β is used (README line 253) | agrees | none |
| Summary block: "both coefficient algebras unital with finite traces"; "all locally compact Hausdorff abelian groups" | README lines 22–26, 75–76; `M=ℤ/2`, `D=0` | D and `E=D^⊥` discrete, so both algebras unital with the canonical trace; `A=C*(G,conj β)≅M₂(ℂ)`, `τ_A(p)=1/2` | agrees | none |
| Summary block: "Spectral invariance follows from smooth gauge vectors and Mathlib’s smooth inversion" (§5.1) | README lines 682–691; Mathlib at the pin | `contDiffAt_ringInverse` at `Mathlib/Analysis/Calculus/ContDiff/Operations.lean:779`; the README composes it with the gauge orbit | agrees | none |
| "Suppliers, all on main" | headings on main e6f6358 | HilbertModules H1 126, H2 179, H3 262; OperatorAlgebraDynamics 933, 1659; AmenableGroups Layer 6 391; ThetaSeries 1A 432, 1C 462, 1D 468, 1E 473, 2A 489, 2C 507; NoncommutativeGeometry N6 1478, N7 1670 | all present | none |
| "Adds the roadmap … the pull request adds only the two child files"; topic | `git diff --stat origin/main...HEAD`; parent `metadata.toml` on main | `README.md` +893, `Suggested.lean` +119, nothing else; `topic = "math.OA"`; the folder has no metadata file; main has no `HeisenbergImprimitivity` folder | agrees | none |
| Validation paragraph | `lake env lean` on `Suggested.lean`; declaration list | `sorry` warnings at lines 84, 105, 114 and nothing else; 10 declarations: 7 definitions with bodies, 3 theorems; docstring lines 23–34 name the two groups of headlines not statable | agrees | none |
| "Layer 6 computes … a lattice in ℝ × ℤ/2 that is not a product, an embedding of ℤ² into ℝ × ℤ/q" | §6.1 last Check; §6.2 at q=2, a=b=c=d=1 | `c_D=1·1·2·1=2`, `c_(D^⊥)=(1/4)·2=1/2`; `β=e((1+1/2)nr)`, covolume `q|ab|=2` | agrees | none |

The diff changes no statement, so the rows for the folder's statements stand as in the previous review, of 185669b.

- Gate at this head: every check 0 (`build=0`, `depcheck=0`, `outside-folder=0`), OK.
- Dependency check: `depcheck: 245 roadmaps, 2212 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: three `sorry` warnings (lines 84, 105, 114), no other message. The file is unchanged, so the signature comparison of the earlier review stands.
- Declarations opened at the pins: Tau Ceti `SchwartzMap.tsum_eq_tsum_dual_fourier` (`TauCeti/Analysis/Fourier/PoissonSummation.lean:309`); Mathlib `contDiffAt_ringInverse` (`Mathlib/Analysis/Calculus/ContDiff/Operations.lean:779`).
- Citations: 14 supplier headings resolved on main e6f6358; the parent's child link (line 119) and its H5 mention (line 479) of this roadmap; NoncommutativeGeometry's Powers–Rieffel projection and 0<θ<1 module (lines 1733, 1744); OperatorKTheory 7.5 (line 23).
- Overlap check: read CompactQuantumMetricSpaces, ThetaInvariantsOfEuclideanLattices, OperatorAlgebraDynamics, HilbertModules, OperatorKTheory; `C*(G,ω)` is OperatorAlgebraDynamics', the Euclidean lattice Poisson formula Tau Ceti's (ThetaSeries 1A), completions HilbertModules'; nothing is owned twice. No open pull request changes this roadmap or drops an id it cites.
- Remark (generated blocks, outside this check): the `depends-on` and `merge-order` blocks still list #1145 SmoothBanachRepresentations as an open supplier, while the README never names it and the dependency check finds no open supplier.
- Source independence: changed passages only; the folder diff is empty, so 0 passages compared with 0 sources; the arrangement was not compared again because no layer was added, removed or reordered.

## Not verifiable

- Hewitt–Ross, *Abstract Harmonic Analysis I*, Theorem 24.10 (§1.2): recorded as `uncertified` and cited by its locator only; the change does not touch it.
- The description's account of AI assistance: no file of the head records it.
- "Mathlib's module-system advisory on `import Mathlib`" in the targeted build: the build was not replayed this round (the gate records `build=0`); the direct elaboration shows only the three `sorry` warnings.

## Source issues

- none

## For the human reviewers

- none
