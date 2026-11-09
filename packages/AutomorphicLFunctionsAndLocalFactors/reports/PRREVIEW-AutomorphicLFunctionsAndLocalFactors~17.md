# Review of AutomorphicLFunctionsAndLocalFactors (pull request #924 at 84e5fc4)

**Verdict:** needs changes

This is an incremental re-review of the 16 lines changed since d35fbb7. All of them are in `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md`, and all of them put backticks around Mathlib names that were previously written as plain text. Each of those names exists at the pin with the meaning the sentence gives it, and the change introduces no defect.

One finding remains: R01, about the pull-request description, is carried because it is still not repaired. It is P3 and does not block. It needs no edit to the folder. Line numbers refer to `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md` (written `:N`) unless `Suggested.lean` is named.

## R01 (P3) — The pull-request description still contradicts the README (carried from the previous review's R01, not repaired)

**Location.** The description is unchanged since d35fbb7. It still says:

- the consumers "take rank-one Hecke continuation and the global standard L-function from here";
- "The common adelic Tate/Fourier prefix … consumed from ArithmeticGaloisRepresentations §2.7";
- #248 (LFunctions) and #253 (ZerosOfLFunctions) "must merge first, and the merge-order block below lists them";
- #785 (ReductiveGroupsPartII) is among the "open pull requests of ours".

**Claim.** The description misstates ownership and dependencies. The human who gives final approval reads it.

**Witness.**

- `:2501`: the consumers' "rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a".
- `:11`: AnalyticNumberTheoryPartII §§5.3g–5.3j own the Fourier analysis and local zeta integrals.
- LFunctions, ZerosOfLFunctions and ReductiveGroupsPartII are folders on main (d974e46).
- The merge-order block names neither #248 nor #253.

**Repair.** Edit only the description; the folder needs no change.

- Change "take rank-one Hecke continuation and the global standard L-function from here" to "take the global standard L-function from here; their rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a".
- Replace the §2.7 sentence with "The local and adelic Fourier analysis and local zeta integrals are AnalyticNumberTheoryPartII §§5.3g–5.3j; the rank-one scalar comparison uses ArithmeticGaloisRepresentations §2.7".
- Delete the LFunctions/ZerosOfLFunctions sentence.
- Remove ReductiveGroupsPartII from the list of open pull requests.

**Tested.** With these edits, every remaining statement in the description matches `:11`, `:13`, `:25–27` and `:2501` and the folders on main at d974e46.

## Previous findings

- R01 — not repaired: the description still says the consumers "take rank-one Hecke continuation and the global standard L-function from here" and that LFunctions and ZerosOfLFunctions "must merge first". It is carried as R01 above.

## Verified sound

### Gate, dependency check, scope and elaboration (run on this head)

**Gate.** `gate … --base origin/main` exits 0 and prints the line below. The worker's run on this head also reports `build=0`.

```text
gate AutomorphicLFunctionsAndLocalFactors: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

**Dependency check.** It exits 0 and prints `depcheck: 239 roadmaps, 2340 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. This roadmap is at line 94 of the merge order. The diff changes no `*Needs:*` line and no supplier citation.

**Scope.**

- `git diff --stat origin/main...HEAD` shows nothing outside the folder.
- The folder holds exactly `README.md`, `Suggested.lean` and `metadata.toml`.
- `git diff --stat d35fbb7 HEAD` changes only `README.md`, so `Suggested.lean` is byte-identical to the file the previous review read.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 9 s. It prints exactly 14 warnings, all `declaration uses sorry`, at lines 75, 80, 91, 125, 138, 164, 222, 294, 370, 386, 432, 527, 610 and 686. These are the same lines as at d35fbb7.

**Signature leads.** The two `signatures.md` leads are the `hbesselK` hypotheses of `AL0.BesselHalfOrderDerivative` and `AL0.BesselLaplaceMellin`. Both are false positives: in the elaborated type, `hbesselK` appears as an anonymous premise `(∀ ν c, besselK ν c = …) →`. The file is unchanged, so the full `#check @` audit of the 33 declarations (r15) and the one-tactic probe (r16, unsolved goals at all 14 `sorry`s) still apply.

### The changed passages (8 lines; each name `#check`ed at the pin in a scratch file)

| Line | Target | Name now in backticks | Pinned declaration | Agrees with the sentence |
|---|---|---|---|---|
| `:262` | AL.0.1.1 | `AddSubgroup W` | `Algebra/Group/Subgroup/Defs.lean:302`, needs `[AddGroup W]` | W is an additive commutative group (`:264`) |
| `:264` | AL.0.1.1 | `AddChar R Circle` | `Algebra/Group/AddChar.lean:72`; `Circle` at `Analysis/Complex/Circle.lean:53` | `AddChar (A) [AddMonoid A] (M) [Monoid M]` |
| `:275`, `:327` | AL.0.1.1, AL.0.1.4 | `ZMod.toCircle` | `Analysis/SpecialFunctions/Complex/CircleAddChar.lean:50`, `AddChar (ZMod N) Circle` under `[NeZero N]` | A scratch `example` proves `(ZMod.toCircle (1 : ZMod 2) : ℂ) = -1` from `ZMod.toCircle_apply` and `Complex.exp_pi_mul_I` |
| `:433` | AL.0.1.11 | `IsTopologicalAddGroup` | `Topology/Algebra/Group/Defs.lean:100` | it makes translation a homeomorphism, which is the step AL.0.1.11 uses at `:431` |
| `:481` | AL.0.3.1 | `TemperedDistribution` | `Analysis/Distribution/TemperedDistribution.lean:53`, `𝓢(E, ℂ) →Lₚₜ[ℂ] F`; notation `𝓢'(E, F)` at line 61 | with E = F (ℝ or ℂ) and target ℂ, this is the continuous dual of `SchwartzMap`, as stated (and at `:74`) |
| `:532` | AL.0.3.7 | `SchwartzMap` | `Analysis/Distribution/SchwartzSpace/Basic.lean:75`, needs `[NormedSpace ℝ E]` | finite-dimensional real spaces, as stated |
| `:2280` | AL.4.1.1 | `Matrix.charpolyRev` | `LinearAlgebra/Matrix/Charpoly/Coeff.lean:290`, `det (1 - X • M.map C)` | equals `P_{t,r}(T)=det(1−T r(t))` |

Checks of the change itself:

- Every changed line keeps its wording apart from the backticks, except `:433`, which now reads "a topological additive group (`IsTopologicalAddGroup`)". That is the same hypothesis written out in words.
- No line of the folder cites AL.0.1.1, AL.0.1.4, AL.0.1.11, AL.0.3.1, AL.0.3.7 or AL.4.1.1 in a way the diff affects.
- The newly backticked names are Mathlib names, not names of this roadmap, so they are not covered by the `readme-ids-missing` check. Each was resolved by `#check` above.
- The remaining unbackticked dotted names (`:17`, `:913`) are planned names cited by ClassicalArithmeticCompletion. They are correctly left out of backticks because `Suggested.lean` does not declare them.

### Seeded sample: Check for the theta-Mellin formula (AL.3.5.1, `:1707–1709`; untouched, re-read)

- CogdellColumbia lines 256–267 (§1.1.3, printed p.4) define the theta series without the ξ=0 term. They define E as `|det g|^s` times the Mellin integral against `|a|^(ns)η(a)`, for Re(s)>1.
- Lines 271–290 (printed p.5) give the continuation, the poles, the functional equation and the sum over `P′(k)\GLn(k)` of the section F for the partition (n−1,1).
- The Check's value is `3¹·5·2^(2·1)=60`. Omitting n gives `3·5·2=30`.
- The locator "§1.1.3, pp.4–5" is correct. The README flags no locator as unverified.

### Adversarial table

Rows marked **new** were computed on this head for the changed passages. All other rows are carried from the previous report (r16, at d35fbb7), which carried the rows marked "(r15)" from r15. The diff leaves all of those statements untouched.

| Statement | Instances | Values computed (each side) | Result |
|---|---|---|---|
| **new** AL.0.1.1 carrier `AddSubgroup W` (`:262`) | ℝ, ψ=e(x), multiplication pairing, U=ℤ | U⊥=ℤ, an additive subgroup; 1∈U⊥, but ½·1 ∉ U⊥ since e(½)=−1; so not an ℝ-submodule, as stated | Pass |
| **new** AL.0.1.1 Check `:275` | R=V=W=ℤ/2, `ZMod.toCircle`, U=V | ψ(1)=exp(2πi·1/2)=−1 (Lean `example` at the pin); U⊥={w : ψ(w)=1}={0}; the wrong model ψ=1 gives {0,1} | Pass |
| **new** AL.0.1.4 Check `:327` | ℤ/2, V discrete, W indiscrete, U=V | ψ(L(1,w))=(−1)^w; the preimage of 1 is {(0,0),(0,1),(1,0)}, not of the form A×{0,1}, so not open; U⊥={0}, not open in W | Pass |
| **new** AL.0.1.11 hypothesis `:433` | ℚ_p, U=ℤ_p, f=1_{ℤ_p}, self-dual μ | Ff(0)=Ff(1)=1; Ff(1/p)=∫_{ℤ_p}ψ(x/p)dx=0, constant on the open coset 1/p+ℤ_p; translation is continuous by `IsTopologicalAddGroup` | Pass |
| **new** AL.0.3.1 `TemperedDistribution` (`:481`) | F=ℝ, δ₀, Gaussian | `𝓢'(ℝ,ℂ)` is `TemperedDistribution ℝ ℂ`; δ₀(e^(−πx²))=1; for F=ℂ, `NormedSpace ℝ ℂ` exists | Pass |
| **new** AL.0.3.7 `SchwartzMap` family (`:532`) | f_s=e^(−sx²), t=1, s=1 | quadrature of ∂_s∫₀^∞e^(−sx²)x^(t−1)dx = −0.443113; closed form −(t/2)Γ(t/2)/(2s^(t/2+1)) = −0.443113 | Pass |
| **new** AL.4.1.1 `Matrix.charpolyRev` (`:2280`) | r(t)=diag(2,3), q=5, s=1 | `charpolyRev`=(1−2T)(1−3T); P(0.2)=0.24, L=4.16667=(1−0.4)⁻¹(1−0.6)⁻¹; the wrong model `charpoly` gives 0.198413 | Pass |
| AL.0.1.4, theorem under joint continuity (r16) | U={0}; ℚ_p, U=ℤ_p | U⊥=W, open; U⊥=ℤ_p, open | Pass |
| AL.0.1.4, circle lemma (r16) | θ=0.4π; θ=0.1 | k=2, cos=−0.809; k=16, cos(1.6)=−0.0292 | Pass |
| AL.0.1.4 Check `:326` (r16) | ℝ, ψ=e, U=ℤ | U⊥=ℤ, not open; U not compact | Pass |
| AL.0.1.11 Check `:439` (r16) | `e^(−πx²)`, ψ=e(x) | Ff(0)=1, Ff(1)=0.043214; support ⊄ {0} | Pass |
| AL.1.3.5 ρ, ramified (r16) | ℚ₃ quadratic, ω(3)=1, ν=0 | γ=−i·3^(1/2−s); s=0.3: 0.80274i both sides; ρ₀=𝔤 gives −0.80274i | Pass |
| AL.1.3.5 ρ, unramified (r16) | q=3, ν=1, s=0.3 | 1.53396 both sides | Pass |
| AL.1.3.5 Check `:1006` (r16) | ℚ₃ datum | 𝔤=−i; Tate's ψ_p gives +i | Pass |
| GJ docstring γ at n=0 (r16) | χ=1, Φ=1_O, q=5, s=0.7 | 1.764826 both sides | Pass |
| "neither implies the other" (r16) | χ=1, f=1_O | rank one at s=½ versus GJ with c=5 | Pass |
| AL.3.9.2 / AL.3.9.4 locators (r16) | CogdellFields 3357–3386; GelbartShahidi2001 445–450, 492–493 | m=n, n−1 done in Cogdell; GS covers all ranks | Pass |
| AL.4.2.1 *Needs:* (r16) | heading scan | 7 of 7 resolved | Pass |
| AL.3.5.1 theta–Mellin (sample, re-read again here) | point mass, n=2, \|det\|=3, θ=5, \|a\|=2, s=1 | 60; 30 without n | Pass |
| `AL0.pointSupported_finiteJet` (r15) | δ₀′, f=x·e^(−x²) | N=0 fails, N=1 works | Pass |
| `AL0.BesselHalfOrderDerivative` (r15) | c=1 | 0.166597 both sides | Pass |
| `AL0.BesselLaplaceMellin` (r15) | m=1, t=0.3, s=1.2 | 0.03091 against 0.030923 | Pass |
| `hbesselK` against AnalyticNumberTheoryPartI `besselK` (r15) | its Suggested.lean:626 | identical bodies | Pass |
| `archimedeanEigenSpace` convention (r15) | ℝ, χ(a)=a⁻¹ | δ₀′ scales by a⁻¹ | Pass |
| `finiteEigenSpace_finrank` (r15) | χ=1; χ=\|·\|⁻¹ | ℂδ₀; dimension 1 | Pass |
| `localZetaIntegral_functionalEquation` (r15) | 𝔽₃((t)), χ=1, f=1_O | γ=(1−3^(−s))/(1−3^(s−1)) | Pass |
| `hmod` pins a (r15) | x=0; x=ϖ | 0; q⁻¹ | Pass |
| `archimedeanLocalFunctionalEquation` (r15) | ℝ, ℂ Gaussians | Γ_ℝ(s); πΓ_ℂ(s) | Pass |
| `AL2.godementJacquetLocal` statement (r15) | trivial GL₂ representation, 1_{M₂(O)} | Re s>½; P(0)=1 | Pass |
| GJ dual transform (r15) | `(−Y)` | exponent (1−s)+n/2 | Pass |
| `casselmanNewvector` (r15) | unramified PS; Steinberg; n=c−1 | n+1; n; 0 | Pass |
| `newvectorLevelExists`, `hinf` (r15) | ramified χ∘det | excluded | Pass |
| `localK1 F 0` (r15) | unit ideal | GL₂(O) | Pass |
| `whittakerUniqueness` (r15) | GL₁; trivial GL₂ | rank 1; rank 0 | Pass |
| `rsIntegrand` (r15) | y′=yu | factor 1 | Pass |
| W̃ character (r15) | `w ᵗu⁻¹ w⁻¹` | ψ⁻¹-Whittaker | Pass |
| `rankinSelbergLocal` exponent (r15) | GL₂×GL₁ | 12; 24 | Pass |
| `rankinSelbergLocalEqualRank` (r15) | GL₁×GL₁ | 60 | Pass |
| AL.3.2.3 Check, ramified (r15) | ℚ₃ quadratic | 3/2; 1 | Pass |
| `genericNewform` (r15) | GL₁; χ∘det of GL₃ | a line; excluded | Pass |
| AL.3.5.2 residues (r15) | n=2 | −κΦ(0)/2; κΦ̂(0)/2 | Pass |
| AL.1.3.1 Check (r15) | ℚ₃, ν=1 | 𝔤=−i; −3i at s=0 | Pass |
| AL.1.6.1 Check (r15) | χ₄ | −2i; product 1 | Pass |
| AL.0.3.1 alternating Check (r15) | 𝔽₃((t)) | f̂̂(a)=1, f(−a)=0 | Pass |
| AL.0.3.1 Mat₂ Check (r15) | ν=1 | 3⁻²; 27 | Pass |
| AL.2.1.8 (r15) | factorization | (qα−β)(α−qβ) | Pass |
| AL.1.4.4 table (r15) | real discrete, k=2 | ε=−1; shift ½ | Pass |
| AL.2.2.4 central character (r15) | K₀(p^c) | last row (g₂₁,1) | Pass |
| AL.3.10.3 Check (r15) | ℙ¹/𝔽₃, t²+1 | q_v=9 | Pass |
| AL.3.12.2 degrees (r15) | χ(V⊗V∨) | (2g−2)n²+2d | Pass |
| AL.3.16.1 (r15) | r=0.7 | 0.21911 | Pass |
| AL.5.4.1 (r15) | p=3, k=0, j=1 | −4/3 | Pass |
| AL.5.2.2 (r15) | y²=x³−x, p=3 | 0; −3≠1 | Pass |

### Ownership, overlaps and citations

- The diff adds no object, no target, no supplier citation and no `*Needs:*` entry.
- `overlaps.md` lists:
  - no open pull request that changes this roadmap;
  - no id this README cites that another pull request drops;
  - no id that only an open revision defines.
- `citations.md` lists no cross-roadmap citation found nowhere. Its Lean-name leads are of two kinds:
  - names declared in this roadmap's own `Suggested.lean`, which the gate's `readme-ids-missing=0` confirms;
  - supplier names that r15 resolved.
- The ownership checks of the earlier reports against the closest open roadmaps stand.

## Not verifiable

- **Ownership against every open pull request.** I checked it only through `overlaps.md` and the earlier reports' targeted searches. The changed lines introduce no object, so I ran no new search.
- **Tate's thesis.** The previous report's item stands for the untouched AL.1.3.5 convention (no extracted text, and no OCR on this worker). The diff does not touch AL.1.3.5.

## Source issues

- none
