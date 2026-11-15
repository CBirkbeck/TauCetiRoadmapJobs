# Review of MaassForms (pull request #1717 at 19038d8)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 19038d8; this round reads the pull request's title and description against the head. No finding.

## Previous findings

The previous report (of 19038d8) had no finding, and no repair report marks anything "not actionable in this package". Nothing to account for or re-raise.

## Verified sound

### The pull request's text against the head

| Sentence of the title or description | What the head shows | Result |
|---|---|---|
| Title "feat: roadmap for maass forms"; the file list calls `README.md` "the roadmap" | The folder is absent on main; 2601 insertions, 0 deletions, 3 files. | Agrees: it adds a roadmap, removes and renumbers nothing. |
| "for every positive level N and Dirichlet character χ" | README 25: "with N positive and `χ` a Dirichlet character modulo `N`"; every theorem carries `[NeZero N]`. | Agrees. |
| "9 layers and 39 milestones" | `## Layer 0` … `## Layer 8`: 9; headings `### k.n`: 39 (5+2+5+5+7+3+4+5+3). | Agrees. |
| "from Fourier–Whittaker expansions and the cuspidal spectrum to the Atkin–Lehner–Li newform theorem and strong multiplicity one" | §§2.3, 3.4, 4.5–4.6; `fourierMode_eq`, `finiteDimensional_maassCuspSpace`, `IsNewform.eq_of_eventually_eq`, the three conductor branches. | Agrees. |
| "establishes Selberg's 3/16 bound and Weyl's law, and gives newform L-functions entire continuation and functional equations" | `selberg_three_sixteenths`, `weyl_law` (even `χ`), `exists_completedLFunction`, `completedLFunction_functional_equation`. | Agrees. |
| "restriction to L²(N, χ) from the congruence spectral gap roadmap's self-adjoint realization"; "transports the supplied self-adjoint operator and compact cuspidal resolvent" | README 103–119 and §§3.1–3.2, 3.4: CongruenceSpectralGap §§0.2, 0.5b consumed, restricted to the `χ`-isotypic subspace of `L²(Γ₁(N)\ℍ)`. | Agrees. |
| "Selberg's 3/16 as a corollary of the consumed 21/100 bound" | §5.3: `congruence_eigenvalue_bound` at `Γ₁(N)`; `21/100 = 84/400 > 75/400 = 3/16`. | Agrees. |
| "Weyl's law uses the supplied trace formula" | README 160, 194, 387 and §5.5: AutomorphicSpectralTheory Layer 6 consumed, no trace formula proved. | Agrees. |
| "local newvector comparisons connect classical coefficients to automorphic L-functions" | README 389–399: AL.2.2.4–AL.2.2.5, AL.3.7.1 consumed for §4.6 and §6.1. | Agrees. |
| "Maass examples over ℚ and ℚ(i)" for the LFunctions roadmap | §6.4 (degree-2 card) and §7.5 (degree-4 card, conductor 16); README 1896 "feed LFunctions Layer 0". | Agrees. |
| "Mathlib's upper half-plane and analysis APIs and Tau Ceti's character spaces, Hecke cosets and Atkin–Lehner matrices" | README 313–376: `UpperHalfPlane`, `functionCharSpace`, `HeckeRing.GL2.Gamma0.*`, `IsAtkinLehnerMatrix`. | Agrees. |
| "Picard group PSL₂(ℤ[i]) on hyperbolic three-space"; "the LMFDB invariant and certificate layer" | Layers 7 and 8; README 76 "certificate semantics", §8.3 the two spectral estimates. | Agrees. |
| "`Suggested.lean`: what can be stated over Mathlib and the pinned Tau Ceti; the other targets are specified in the README" | One `import Mathlib` and four `TauCeti.*` modules; the docstring names five headlines as not statable, each with its missing carrier. | Agrees. |
| "`metadata.toml`: arXiv topic `math.NT`" | `topic = "math.NT"`. | Agrees. |
| Suppliers still open (the prose names the congruence spectral gap roadmap; the `depends-on` block is generated) | Open: AutomorphicFormsOnReductiveGroups, AutomorphicLFunctionsAndLocalFactors, AutomorphicSpectralTheory, CongruenceSpectralGap, KleinianGroups. On main: ModularForms, LFunctions, FuchsianOrbifolds, PDE, SelfAdjointSpectralTheory, OrthogonalL2Bases. | No supplier added or dropped that the text leaves out. |

### Adversarial row for a statement the description cites

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| `selberg_three_sixteenths` ("3/16 as a corollary of the consumed 21/100 bound") | supplied endpoint; odd `χ` mod 3; constant `1`; `N = 0` | `21/100 − 3/16 = 9/400 > 0`; `t = √(1/4 − 21/100) = 1/5 ≤ 1/4 = √(1/4 − 3/16)`. Odd `χ`: cusp space `⊥`, hypothesis false. Constant: `λ = 0 < 3/16`, cusp integral `N ≠ 0`, excluded. `N = 0` excluded by `[NeZero N]`. | Pass; no change. |
| `weyl_law` ("Weyl's law") | `N = 1, 2`; odd `χ` mod 3 | `N = 1`: `(π/3)/(4π) = 1/12 = 1/12`. `N = 2`: `π/(4π) = 1/4 = 3/12`. Odd `χ`: count `0`, limit `0 ≠ 4/12`; `hχ : χ (-1) = 1` excludes it. | Pass; no change. |

The rows of the previous review, of 19038d8, stand for every other statement: the folder is byte-identical.

- Gate, rerun at 19038d8: `gate MaassForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0`.
- Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/MaassForms/Suggested.lean`: 32 `declaration uses sorry` warnings, no other diagnostic; 2 signatures re-read against §§5.3 and 5.5 (`selberg_three_sixteenths`, `weyl_law`), both agree.
- Outside the folder: the diff against main is empty; the worktree is clean.
- Description sentences checked against the head: 15, none contradicted; counts recomputed: 9 layers, 39 milestones, 68 headings, 3 files.
- Cross-roadmap citations: the resolver lists none unresolved; its 14 Lean-name leads are 7 `IsNewform.*` declarations present in `Suggested.lean` and 7 LMFDB knowl or column identifiers.
- Overlaps tool: no other open pull request changes this roadmap, no dropped id in either direction, no id that only an open revision defines.
- Source locators: none opened; no passage changed.

Overlap check: read BianchiModularForms, CongruenceSpectralGap, ModularForms; nothing shared (BianchiModularForms cites MaassForms Layer 7 and §2.1 (v) as owner of the `PSL₂(ℤ[i])` weight-0 theory and the Bessel Mellin transform; CongruenceSpectralGap leaves the level-one Maass carrier to AutomorphicFormsOnReductiveGroups §4.5, which this roadmap cites; ModularForms states no Maass target).

Source independence: changed passages only; 0 passages changed, so none compared; the arrangement was not compared again (no layer added, removed or reordered); the largest share of source mentions is the LMFDB's knowls and pages.

## Not verifiable

- Whether the pull request is "one of 23 roadmaps … opened as drafts": a statement about other pull requests, not about this folder; not checked.
- Inherited unchanged: **iwaniec-spectral**, **iwaniec-topics**, **bump**, **iwaniec-kowalski**, **booker-strombergsson-then**, **atkin-lehner**, **atkin-li**, **huxley**, **elstrodt-grunewald-mennicke**, **hejhal**, **maass**, **roelcke**, **roelcke-ii**, **selberg**: no legal full text was readable; their locators remain uncertified.

## Source issues

- none

## For the human reviewers

- **Licence.** `TauCetiRoadmap/MaassForms/README.md` 1902–1937 (Worked examples) gives spectral parameters, Hecke eigenvalues and error sizes taken from five LMFDB form pages (`1.1`, `1.3`, `2.1`, `26.1`, `19.205`); the LMFDB's licence terms for its data were not read.
- **Not tested.** The textbook sources listed under "Not verifiable" (iwaniec-spectral first among them) could not be read legally in any round, so wording and arrangement were never compared with them.
