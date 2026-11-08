# Review of AutomorphicLFunctionsAndLocalFactors (pull request #924 at f4dd981)

**Verdict:** needs changes

Full review of the head after the move of the Fourier, Hecke, Bessel and paired-Hadamard material to AnalyticNumberTheoryPartI and AnalyticNumberTheoryPartII. Seven findings, all P3; none blocks. The gate passes, the dependency check reports no problem, the file elaborates, and the sampled source supports its Check (values below). Line numbers are `README.md` unless marked `Suggested.lean`.

## R01 (P3) — Equal-characteristic finite places: the Lean headlines cover them, but the README's local Fourier input does not

**Location:** `README.md:499` ("`S(F)` is AnalyticNumberTheoryPartII §5.3g's local Schwartz–Bruhat space for `V=F`"); `:501` and `:814` ("F is a completion `k_v` of a number field k"); `Suggested.lean:17` ("The local-field statements allow both characteristics").

**Claim:** The README supplies every input of the finite-place headlines `TateZeta.finiteEigenSpace_finrank` (`Suggested.lean:221`), `TateZeta.localZetaIntegral_functionalEquation` (`:137`) and `AL2.godementJacquetLocal` (`:331`).

**Witness:** These three are stated for every `IsNonarchimedeanLocalField`, including `𝔽₃((t))`. AnalyticNumberTheoryPartII §5.3g opens "Let F be a number field and v a place", and AL.1.2.6, AL.1.3.1, AL.1.3.3, AL.2.1.5 (`:1199`) and AL.3.3.2 cite only §5.3g for inversion.

**Repair:** In AL.0.3.1, define `S(F)` at every finite place as SmoothRepresentationsOfLocalGroups SR.1.1's `C_c^∞(F)`. At number-field completions this is §5.3g's space. Widen the hypotheses lines of AL.0.3.1 and AL.1.1.1–AL.1.3.5 to every nonarchimedean local field. For equal characteristic, add three inputs to those five *Needs:* lines: Fourier transform of a coset indicator (AL.0.1.8), Fourier inversion for a subgroup indicator (AL.0.1.13), and the self-dual residue characters of Curve additive analysis (AL.3.10.1). Say in Scope and ownership that AL.0.1 is the characteristic-free form of §5.3g's lattice formulas, which AL.0.1.7, AL.0.1.8 and AL.0.1.13 restate.

Tested on `F=𝔽₃((t))` with `ψ(x)=ψ₀(res(x dt))`. Since `res(t⁻¹dt)=1`, `O⊥=O`. With `μ(O)=1`, AL.0.1.7 gives `F(1_O)=1_O`, and AL.0.1.13 applies because `μ(O)μ(O⊥)=1`. Tate's argument for `S′(1)=ℂδ₀` then runs unchanged.

## R02 (P3) — Four open roadmaps cite ids this head deletes, and the README gives no old → new numbering

**Location:** The deleted targets AL.0.2, AL.0.3.2–AL.0.3.5, AL.0.4, AL.0.5.1, AL.1.5.2–AL.1.5.3, AL.1.6.2, AL.1.7.1–AL.1.7.2 and AL.2.5. `README.md:15` says only "their rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a".

**Claim:** The consumers' citations still resolve after the move.

**Witness:** These README lines cite AL.1.6.2, AL.1.5.3 or AL.0.2, which no longer exist:
- AutomorphicSpectralTheory `README.md:42, 1234`;
- GL2AutomorphicRepresentationsAndTransfer `:51, 289, 313, 319`;
- DirichletPadicLFunctions `:157` (anchor `#al162-hecke-continuation-and-functional-equation`) and `:298`;
- GrossZagierAndArithmeticHeights `:107`.

**Repair:** Add one line per moved id to Scope and ownership:
- AL.0.2 and AL.0.3.2–AL.0.3.5 are AnalyticNumberTheoryPartII §5.3g;
- AL.0.4 is §5.3h;
- AL.0.5.1 is AnalyticNumberTheoryPartI §2.1a;
- AL.1.5.2, AL.1.5.3 and AL.1.6.2 are AnalyticNumberTheoryPartI §2.3a;
- AL.1.7.1–AL.1.7.2 are its §2.22a;
- AL.2.5 is its §§0.29–0.29b.

Tested: each new home states the old content.
- §2.3a's finite-order bullet is AL.1.5.3's LFunctions comparison, with the same root number and primitive conductor.
- §2.22a has `Q=|D_E|/|D_F|`, root number 1 and the correction `−(g/2)(γ+log 4π)` of AL.1.7.1–AL.1.7.2.

The pull-request description's summary block still makes two stale claims:
- the consumers "take rank-one Hecke continuation … from here";
- that continuation "is the n = 1 case of the Godement–Jacquet matrix integral".

Align it with `README.md:11`.

## R03 (P3) — AL.3.9.4 takes the Hecke datum's strip bound from a "Godement–Jacquet realization" its new supplier does not have

**Location:** `README.md:1838` ("using AnalyticNumberTheoryPartI §2.3a's Hecke continuation and functional equation and the strip estimates for its Godement–Jacquet realization").

**Claim:** The boundedness on finite vertical strips that pinned niceness (AL.3.9.3) requires has a stated source.

**Witness:** AnalyticNumberTheoryPartI §2.3a proves continuation "by Hecke's theta method" and states no vertical-strip bound. The global standard L-function (AL.2.4.1, `:1342`) asserts convergence, continuation and the equation, but no strip bound.

**Repair:** Replace the clause with: "… and boundedness of `Λ_H(ω,·)` on finite vertical strips. Prove this bound here from the `n=1` global integral of The global standard L-function (AL.2.4.1), split at `|a|=1`; each half is bounded on finite strips. Identify the result with §2.3a's `Λ_H` by agreement on `Re(s)>1`."

Tested on `ω=χ₄` over `ℚ`, the odd quadratic character of conductor 4. Then `Λ_H(s)=4^(s/2)Γ_ℝ(s+1)L(s,χ₄)` is entire, with `N=4` and `ε=1`. The halves `∫_{|a|≥1}` of the theta integrals for `Φ` and `Φ̂` are dominated by their values at the strip's real endpoints. This bounds `Λ_H` on `−1≤Re(s)≤2`.

## R04 (P3) — The AnalyticNumberTheoryPartI contract names two declarations that exist nowhere and two sections nothing here consumes

**Location:** `README.md:56`. Three passages:
- "§2.1a, the K-Bessel kernel `besselK` with `besselK_neg` and `besselK_one_half`";
- "§§0.29–0.29b, centered growth `IsCenteredOrderOne` and the paired Hadamard theorem";
- "§2.22a, the CM quadratic completion".

**Claim:** The row lists, by name, what this roadmap consumes.

**Witness:** AnalyticNumberTheoryPartI's `Suggested.lean` declares only `besselK` (its line 589); its §2.1a states evenness and the half-order value as unnamed bullets. `roadmaps grep` finds both names only here and in AnalyticNumberTheoryPartII. No target here cites §§0.29–0.29b or §2.22a.

**Repair:** Write "§2.1a, the K-Bessel kernel `besselK`, its evenness `K_(−ν)=K_ν` and half-order value `K_(1/2)(x)=√(π/(2x))e^(−x)`". Delete the §§0.29–0.29b and §2.22a clauses; their content left with AL.2.5 and AL.1.7.1–AL.1.7.2, which R02's mapping records.

Tested: quadrature of the cosh integral gives `K_(1/2)(1)=0.4610685044=√(π/2)e^(−1)`. AL.2.6.1 uses the evenness for `K_(ir)=K_(−ir)`.

## R05 (P3) — Checks deleted with the moved material: AL.0.3.1 is left with one Check and a duplicated API bullet, AL.2.4.1 with one Check

**Location:**
- `README.md:505–506` (the two API bullets "`r(a)f(x) = f(xa)`, a group action of `F^×` by linear maps." and "`(r(a)f)(x) = f(xa)`.");
- `:510`, AL.0.3.1's only Check;
- `:1350`, the only Check of AL.2.4.1, while `:1344` keeps `n=1` in its scope.

**Claim:** Every definition keeps its API and at least three discriminating Checks.

**Witness:** The diff deletes AL.0.3.1's three membership Checks and AL.2.4.1's two `n=1` Checks. Two conventions are now untested: the inverse in `r′(a)λ=λ∘r(a⁻¹)`, and AL.2.4.1's `n=1` normalization.

**Repair:** In AL.0.3.1, delete the second bullet and add three Checks:
- `r(ϖ)1_O=1_(P⁻¹)`; the inverse convention gives `1_P`.
- For `λ(f)=∫f ω d^×x` on `C_c^∞(F^×)`, `r′(a)λ=ω(a)λ`, as AL.1.1.3's Check requires. Without the inverse, the value is `ω(a)⁻¹λ`.
- Over `ℝ` with `f=e^(−πx²)`, `(r(2)f)^=½·r(½)f̂`; both sides are `½e^(−πy²/4)`. This is §5.3g's scaling law.

In AL.2.4.1, restore two Checks:
- For `n=1`, `K=ℚ` and `Φ=e^(−πx²)⊗1_Ẑ`, `Z=Γ_ℝ(s)ζ(s)`, with residues −1 at 0 and +1 at 1. This is §2.3a's `completedRiemannZeta` Check.
- `ω=|·|^(it)` moves the poles to `−it` and `1−it`.

## R06 (P3) — The previous review's R01 is only partly repaired: `AL2.gjZetaIntegral` still carries an unused `[TopologicalSpace F]`

**Location:** `Suggested.lean:311` ("def gjZetaIntegral {F : Type*} [Field F] [TopologicalSpace F] [MeasurableSpace F] (n : ℕ)").

**Claim:** The signature carries only what its type needs.

**Witness:** `#check @AL2.gjZetaIntegral` prints the binder anonymously (`[TopologicalSpace F] →`), so the type never uses it. `Units.instMeasurableSpace` needs no topology.

**Repair:** Delete the binder. Tested: a scratch copy without it elaborates, `godementJacquetLocal` included.

Keep the same binder on `TateZeta.localZetaIntegral` (`:131`). Its `χ : Fˣ →ₜ* ℂˣ` uses the unit topology, and the elaborated type names the binder `inst_1`. The previous review's remark that it could go was wrong.

## R07 (P3) — `Suggested.lean` has commented-out `open` lines that catalogue another roadmap's declarations

**Location:**
- `Suggested.lean:64–66` ("-- The K-Bessel kernel is AnalyticNumberTheoryPartI §2.1a's, not importable here: -- open TauCetiRoadmap.AnalyticNumberTheoryPartI (besselK)");
- `:226–229` and `:237–240`;
- the module docstring paragraph `:20–26`.

**Claim:** The file holds acceptance statements and a module docstring, with no catalogue of names or process comment.

**Witness:** `:239–240` lists `IsCenteredOrderOne`, `pairedHadamard_factorization` and two more; `:228–229` lists four Hecke names. No declaration in this file uses any of them.

**Repair:** Delete the three comment blocks. Reduce the docstring paragraph `:20–26` to one sentence: "The two Bessel statements take AnalyticNumberTheoryPartI §2.1a's K-Bessel kernel as an argument with its defining integral; that roadmap's `besselK` satisfies the hypothesis by `rfl`."

Tested: AnalyticNumberTheoryPartI's `besselK` (its `Suggested.lean:589`) has exactly the body of `hbesselK` (`:68–70`).

## Previous findings

- **R01, partly repaired.** The README half is repaired: AL.2.1.2 (`README.md:1120`) now says `gjZetaIntegral` takes "the Haar measure dg, the modulus `|·|_F`, the coefficient function `β` and the test function `Φ` as arguments". The Lean binder at `Suggested.lean:311` remains (R06 above).

## Verified sound

**Gate and dependency check.** The worker's gate at f4dd981 reports every count 0 and `build=0`, OK. I re-ran it on this head: every count 0, `OK`, exit 0. Dependency check, run by me:

```text
depcheck: 235 roadmaps, 2434 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. AnalyticNumberTheoryPartI (line 49) and AnalyticNumberTheoryPartII (line 50) precede this roadmap (line 93) in the merge order. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`. Imports are the single line `import Mathlib`.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with exactly 12 `declaration uses sorry` warnings, at lines 74, 79, 90, 124, 137, 163, 221, 274, 331, 405, 421 and 467. The file has 27 declarations: the 36 of the previous head minus the nine moved to AnalyticNumberTheoryPartI.

**`#check` audit.** One scratch file with `#check @` for all 27 declarations elaborated (exit 0). I compared each elaborated type with its README statement:
- `godementJacquetLocal`, `genericNewform`, `whittakerUniqueness` and the GL₂ pair carry `IsNonarchimedeanLocalField`, irreducibility, smoothness and admissibility explicitly.
- The `GL2Blueprint` section variables reach both theorems.
- The two binders the signatures scan flags as lost are false positives: `hbesselK` is present as the unnamed hypothesis of both Bessel theorems.
- The only unused binder is R06's.

**One-tactic probe.** On a scratch copy, every `sorry` was replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | (decide; done) | (exact le_rfl) | (norm_num; done) | (aesop; done)`. All 12 theorems fail, so none is padding.

**Seeded sample.**

| Target and locator | What was read, and the outcome |
|---|---|
| Check for the theta-Mellin formula (`README.md:1673–1675`, AL.3.5.1; Cogdell, Columbia lectures, §1.1.3, pp.4–5) | Read the author-page PDF `people.math.osu.edu/cogdell.1/columbia-www.pdf`, cached text `af30e112…`. **Lines 256–267 (p.4):** `E(g,s;Φ,η)=|det g|^s ∫_{k^×\𝔸^×} Θ′_Φ(a,g)|a|^{ns}η(a)d^×a` for `Re s>1`, with `η` a unitary idele-class character and `Θ′` omitting `ξ=0`. **Lines 273–277 (p.5):** meromorphic continuation; possible simple poles at `s=iσ, 1+iσ` with `η=|·|^{−inσ}`; the equation `E(g,s;Φ,η)=E(ᵗg⁻¹,1−s;Φ̂,η⁻¹)`. **Lines 279–289:** the section `|det g|^s∫_{𝔸^×}Φ(ae_ng)|a|^{ns}η(a)d^×a` summed over `P′(k)\GLₙ(k)`, with `P′` the `(n−1,1)` parabolic. The README states the same exponent, parabolic and polar set; the page locator is right (p.4 begins at line 194, p.5 at line 271). **The Check:** `3·5·2^{2·1}·1=60`; omitting `n` gives `3·5·2=30`. Verified. |

**Supplier citations resolved at the heads `roadmaps show` serves.**
- **AnalyticNumberTheoryPartI (#1126 at 979e68c):**
  - §2.1a (its README line 1184): `besselK` for `ν∈ℂ`, `x>0`; its `Suggested.lean:589` has the body of `hbesselK`.
  - §2.3a (lines 1321–1345): `heckeContinuation`, `heckeFiniteFactor`, `heckeArchFactor` and `heckeConductorScale` (its `Suggested.lean:676–723`) are statement for statement the declarations deleted here. §2.3a also has the unbalanced equation `Λ(s,ω)=W(ω)A^{1/2−s}Λ(1−s,ω⁻¹)` cited by AL.1.6.1 and AL.2.4.1, and the LFunctions comparison of the old AL.1.5.3.
  - §2.22a (line 1703) and §§0.29–0.29b (lines 727–753; Lean 386–432) carry the old AL.1.7.1–1.7.2 and AL.2.5.
- **AnalyticNumberTheoryPartII (#1167 at 26d0e1f):**
  - §5.3g (line 657): the standard character, self-dual measures, `S(V)`, inversion and partial transforms.
  - §5.3h (line 674): the adelic `S(V_𝔸)`, the self-annihilator, compact-uniform periodisation and Poisson summation.
  - §5.3j (line 693): `d^×x_v` with `O_v^×` of mass `N(𝔇_v)^{−1/2}` (the `q^{−d/2}` of `README.md:27`) and the local zeta integral on `Re s>0` for unitary characters (AL.1.1.2).
  - Its line 3105 lists this roadmap as a consumer only.
- **ArithmeticGaloisRepresentations (#856):** the headings Local-constant Gauss sum (2209), Standard-test-function evaluations (2296) and Root-number product formula (2357) exist, so the three link anchors resolve. `tateLocalConstant`, `finiteStandardEvaluation`, `rootNumber_eq_prod_tateLocalConstant`, `Conductor.artinConductor` and `Conductor.artinConductorNat` are named in its README.
- **Other suppliers:** InverseGaloisAndArithmeticFundamentalGroups (#850) has `VanishingCycles.etaleTraceFormula`. Main has `ClassicalAlgebraic.smoothTrace` and `curveDuality`, and ClassFieldTheory's `characterConductorExp` and `unitFiltration_characterConductorExp_le_ker`.
- **AutomorphicLFunctionsAndLocalFactorsPartII (#1756):** it cites AL.1.3.1, AL.3.2.1, AL.3.3.2 and AL.3.7.2, all present.

**Ownership.**
- Hecke continuation now has one owner, AnalyticNumberTheoryPartI §2.3a.
- AnalyticNumberTheoryPartII calls itself the single owner of Tate's local zeta integrals, but states no local functional equation and no eigendistribution theory (searched). So AL.1.3.2 and AL.1.2.5 are not duplicated.
- AnalyticNumberTheoryPartI states no Godement–Jacquet theory, so AL.2.4.1's `n≥1` theorem specializes §2.3a and does not restate it.
- Ownership against open pull requests other than these suppliers and the consumers named in R02 was not checked.

**Adversarial calculations.** Rows marked "carried" are unchanged statements whose values were computed in the previous reports and recomputed here.

| Statement | Instances | Computed values | Result | Change |
|---|---|---|---|---|
| AL.3.5.1 Check (sampled), `:1673` | point mass, `n=2`, `|det g|=3`, `θ₀=5`, `|a|=2`, `s=1` | `3·5·2^{2}=60`; without `n`: `30` | Pass | None |
| AL.3.5.1 API `E(zg)=η(z)⁻¹E(g)` | central idele `z` | substituting `a′=az`: `|z|^{ns}·|z|^{−ns}η(z)⁻¹` | Pass | None |
| AL.3.5.2 zero modes | `n=1`, `g=1`, `η=1`; `n=2` | `∫_{|a|≤1}|a|^{n(s−iσ)}d^×a=κ/(n(s−iσ))`; terms `−κΦ(0)/s`, `κΦ̂(0)/(s−1)`; at `n=2` residues `−κΦ(0)/2`, `κΦ̂(0)/2` | Pass | None |
| `Suggested.lean:74` `BesselHalfOrderDerivative` | `c=1, 2, 0.3` | LHS (difference quotient of the cosh integral) `0.1665972456`, `0.0247486376`, `1.4034805271`; RHS `0.1665972476`, `0.0247486378`, `1.4034805732`; flipping the sign gives `−0.16660` | Pass | None |
| `:79` `BesselLaplaceMellin` | `(m,t,s)=(1,½,2)`, `(2,¼,1.5)` | LHS `4.6627424734e−3`, `3.0772530337e−3`; RHS the same; exponent `s` in place of `s+½` gives `1.6529e−2`, `1.5427e−2` | Pass | None |
| `:67–71` `hbesselK` | AnalyticNumberTheoryPartI's `besselK` | same body (its line 589), so the hypothesis is `fun _ _ => rfl`; `K_{1/2}(1)=0.4610685044=√(π/2)e⁻¹` | Pass | R07 |
| `:90` `pointSupported_finiteJet` | `δ₀`; `δ₀′`; empty support; `E=0` | `N=0`; `N=1` and not `0` (`f=xe^{−x²}`: `f(0)=0`, `δ₀′f=1`); `T=0`; `f(0)=0` forces `f=0` | Pass | None |
| `:124` `archimedeanEigenSpace.finrank` | `ℝ`: `χ=1`; `χ(a)=a⁻¹`; `χ=|·|` | `δ₀(f∘e_a)=f(0)`; `(f∘e_a)′(0)=a⁻¹f′(0)`; `∫f(a⁻¹x)dx=|a|∫f`; one line each | Pass | None |
| `:137` `localZetaIntegral_functionalEquation` | `ℚ_p`, `χ=1`, `f=1_O`, `ν(O^×)=μ(O)=1`; `ℚ₃` quadratic `χ`, `χ(3)=1` | `Z=(1−p^{−s})⁻¹`; `Zhat(1−s)=(1−p^{s−1})⁻¹` via `F⁻f(−x)=1_O`; `γ=(1−p^{−s})/(1−p^{s−1})`; Gauss sum `ψ₀(1/3)−ψ₀(2/3)=−i√3`, `γ=ε=−i·3^{1/2−s}` | Pass | R01 (`𝔽₃((t))` not covered) |
| `:163` `archimedeanLocalFunctionalEquation` | `ℝ`, `e^{−πx²}`; `ℂ`, `e^{−2π|z|²}`, `2dxdy/|z|²` | `Z=Γ_ℝ(s)`, `γ=Γ_ℝ(1−s)/Γ_ℝ(s)`; `Z=2π∫e^{−2πu}u^{s−1}du=(2π)^{1−s}Γ(s)=πΓ_ℂ(s)` | Pass | None |
| `:221` `finiteEigenSpace_finrank` | `χ=1`; `χ=|·|`; ramified; `F=𝔽₃((t))` | `ℂδ₀` (`r′(ϖ)λ₀=λ₀−δ₀` is not invariant); Haar `dx`; `z₀`; same proof in characteristic 3 | Pass | R01 |
| `:274` `genericNewform` | `n=0`, `χ` of conductor `c` | `newformLocalK1 F 0 m=1+P^m` (`O^×` at `m=0`); invariants nonzero iff `m≥c`; rank 1; empty sum gives `ψ(0)=1` | Pass (carried) | None |
| `:331` `godementJacquetLocal` | trivial `GL₂`, `Φ=1_{M₂(O)}` | `Z=(1−q^{−s−½})⁻¹(1−q^{½−s})⁻¹`, `P=(1−q^{−½}T)(1−q^{½}T)`, `Q=1`, `m=0`, `c=½`, `ε=1`, `k=0` | Pass (carried) | None |
| `:405`, `:421` GL₂ newvectors | Steinberg `c=1`; principal series `c=0`; `c=3`, `n=1` | dimensions `0,1,2` at `n=0,1,2` (`0+1−1=0`); `n+1`; `1+1−3` truncates to `0=max(0,−1)` | Pass (carried) | None |
| `:467` `whittakerUniqueness` | `n=0`; trivial `GL₂`; `W⊕W` | whole dual of a line, rank 1; `ℓ(v)=ψ(x)ℓ(v)` with `ψ(x)≠1` forces rank 0; `W⊕W` excluded by irreducibility | Pass (carried) | None |
| `:311` `gjZetaIntegral` | binder audit | `#check` shows `[TopologicalSpace F]` unused; elaborates without it | Defect | R06 |
| `:131` `localZetaIntegral` | binder audit | `inst_1 : TopologicalSpace F` is used by `Fˣ →ₜ* ℂˣ` | Pass | None |
| AL.2.4.1 at `n=1`, `:1344` | `ℚ`, `ω=1`; `ω=χ₄` | `A=1`, `Λ=Λ_H=completedRiemannZeta`, residues `−1, +1`, `ε=1`; `A=4`, `ε(s)=W·4^{½−s}`, `W=1` | Pass | R05 (Checks lost) |
| AL.1.6.1 root number | `χ₄` | `χ(1)ψ₀(¼)+χ(3)ψ₀(¾)=(−i)−(i)=−2i`, normalized `−i`; times `i` at `∞` gives `1=W` (AnalyticNumberTheoryPartI's Check) | Pass | None |
| AL.1.3.1 Checks, `ℚ₃` | `c=1`; `ν=0` and `ν=1` | `𝔤=3^{½}·⅓(ψ₀(⅓)−ψ₀(⅔))=−i`; `ε=−i·3^{1−2s}`, `−3i` at `s=0`; without `ν`: `−i√3` | Pass (carried) | None |
| Character signs | §5.3g, ArithmeticGaloisRepresentations §2.7, `:25`, `:893` | `ψ_ℝ=e^{2πix}` and `ψ_p=e^{−2πi{x}_p}` in all three; `ψ(1/6)=e^{2πi(1/6−1/2−2/3)}=1` | Pass | None |
| AL.0.3.1 action | `r(ϖ)1_O`; `λ=∫·ω d^×x`; scaling a Gaussian | `1_(P⁻¹)`; `r′(a)λ=ω(a)λ` (without the inverse: `ω(a)⁻¹λ`); both sides `½e^{−πy²/4}` | Pass, untested in README | R05 |
| AL.3.9.4 Hecke datum, `:1838` | `χ₄` | `N=4`, `ε=1`, `c=½`, `Λ(s)=4^{½−s}Λᵈ(1−s)` | Pass; strip input unsourced | R03 |
| AL.2.6.4 `W_{0,ν}(x)=√(x/π)K_ν(x/2)` | `ν=½` | `√(x/π)·√(π/x)e^{−x/2}=e^{−x/2}=W_{0,½}(x)` | Pass | None |

Every row computes its values. The table covers the sampled target, all 12 headline theorems, both Bessel hypotheses, and every target a finding touches (AL.0.3.1, AL.1.2.5, AL.1.3.2, AL.2.1.5, AL.2.4.1, AL.3.9.4 and `gjZetaIntegral`).

## Not verifiable

- **Godement–Jacquet, LNM 260, Theorem 3.3.** Paywalled; cited by locator and not read. `godementJacquetLocal` was checked instead on the trivial-`GL₂` and rank-one instances above.
- **Sources outside the seeded sample** were not re-read at this head; their passages are unchanged or only renumbered. The roadmap's manifest records no sources, so the Columbia text is cited above by its cache hash.
- **Ownership against open pull requests** beyond AnalyticNumberTheoryPartI, AnalyticNumberTheoryPartII, ArithmeticGaloisRepresentations, AutomorphicLFunctionsAndLocalFactorsPartII and the R02 consumers was not checked.

## Source issues

- none
