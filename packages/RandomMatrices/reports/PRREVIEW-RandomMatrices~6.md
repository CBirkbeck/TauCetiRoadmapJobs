# Review of RandomMatrices (pull request #1971 at 5d55d20)

**Verdict:** needs changes

The change this pull request makes is sound. §8.4 now consumes the Airy function and the Airy kernel from SpecialFunctionsAiry, and every id it cites resolves at that roadmap's head (see Verified sound). The gate still fails at this head on two items that the folder carries over from main: R01 (`dropped`, 10 lines) and R02 (`depcheck`, one UPWARD line). This is a full review of the folder, so it also lists the defects found elsewhere in it. R03 matters most for the text this pull request rewrites: the docstring bullet it edits calls the `F₂` limit unstatable because the Airy function is missing, but the Airy function is a two-line definition at the pins.

## R01 (P1) — Layer 8 takes its configuration spaces from PointProcesses, which may not be cited as a supplier

Location: `TauCetiRoadmap/RandomMatrices/README.md` lines 64–70, 175, 213, 963, 969, 1008, 1010, 1022–1023 and 1100. Line 963 reads: "Laplace-functional uniqueness and weak convergence of laws from PointProcesses Layers 0–6 at `S = ℝ` and `S = ℂ`".

Claim: the gate's `dropped` check fails on these 10 lines. PointProcesses is on the project's list of roadmaps that may not be cited as suppliers. Layer 8 takes four things from it:
- configuration spaces with the vague topology;
- Laplace-functional determination of laws;
- factorial moment measures and correlation functions;
- weak convergence of laws on configuration spaces.

Nothing else owns these, so the process-level statements of §§8.1, 8.3 and 8.4 have no owner. StochasticCalculus, the only other roadmap that names `PointMeasure`, consumes it from PointProcesses too.

Witness: gate `dropped (10)`. In `roadmaps grep 'PointMeasure|LocallyFiniteMeasure'`, every hit outside RandomMatrices is in PointProcesses itself or in a consumer of it (StochasticCalculus README lines 155 and 208, "From TauCetiRoadmap.PointProcesses"). The pinned Mathlib and Tau Ceti have no `PointMeasure`, `LocallyFiniteMeasure` or point process.

Repair: move the notion down into this roadmap. Add a §8.0 "Configuration spaces on ℝ and ℂ" that owns exactly what §§8.1–8.4 use, each as a target with a locator (AGZ §4.2, Definitions 4.2.1 and 4.2.3, Lemma 4.2.5):
- the locally finite integer-valued measures on `S = ℝ, ℂ`, with the vague topology, its Borel structure and measurability of `N ↦ N(B)`;
- correlation functions relative to Lebesgue measure;
- determination of a law by its Laplace functionals on nonnegative `C_c` functions;
- convergence in law from convergence of those functionals.

Then write "§8.0" for "PointProcesses Layers 0–6" in lines 963, 969, 1008, 1010, 1022–1023 and 1100, replace "PointProcesses" by "§8.0" in the diagram at line 213, and delete the entries at lines 64–70 and 175.

Alternative: if the author would rather not own configuration spaces, restate the process conclusions of §§8.1, 8.3 and 8.4 as convergence of joint count laws `(N(B₁),…,N(B_k))` on bounded Borel sets and of gap probabilities, which is the form of AGZ Theorems 3.1.1 and 3.1.4 (AGZ lines 4549, 4624). Then drop the `PointMeasure` statements.

Either repair takes the gate's `dropped` count to 0.

## R02 (P2) — the dependency check reports Layer 10's StochasticCalculus edge as UPWARD

Location: README line 1208 ("*Needs:* StochasticCalculus S1.2–S1.3, S3.2–S3.4, S4.1–S4.3, S5.1, S5.5, S9.1–S9.2") and line 1259 ("Layers 0–3, 5–6; StochasticCalculus").

Claim: RandomMatrices is on main, but its Layer 10 supplier StochasticCalculus is unmerged; it sits at line 209 of the merge order. So a roadmap on main depends on unmerged work. This pull request did not introduce the edge; it is already on main. But the gate fails on it for every change to this folder.

Witness: `UPWARD: RandomMatrices (on main) -> StochasticCalculus (#209) at README lines [1208, 1259]`, then `depcheck: 238 roadmaps, 2351 edges, 1 problem(s)`. Merge-order line 209 is `StochasticCalculus`.

Repair, one of two:
- In a separate pull request, move Layer 10 to a "RandomMatrices, Part II" (Dyson Brownian motion) placed after StochasticCalculus. In this folder, replace Layer 10 by one Scope sentence that defers §§10.1–10.4 to the Part II, and delete the Layer 10 line of the build diagram (line 215), the Layer 10 clause of line 201, and the StochasticCalculus rows (lines 86–89, 155–156, 187–188). The check then reports `0 problem(s)`.
- Get a human waiver of this exact line. I think it may be a false positive: the review brief lists StochasticCalculus among the roadmaps this one may consume, and the rule fires only because the consumer is already on main.

Without one of the two, the gate stays red.

## R03 (P2) — three headline theorems the docstring calls unstatable are statable at the pins

Location: `TauCetiRoadmap/RandomMatrices/Suggested.lean` lines 24–30: "the Tracy–Widom limits `F₂` and `F₁`, and the sine and Airy limits of GUE and GOE: neither Mathlib nor Tau Ceti has the Airy function …; … Mathlib has no large deviation principle". README lines 13–15 list these limits and the LDPs among the end theorems.

Claim: three of these headlines need only a few short definitions with real bodies on native carriers:
- the GUE soft-edge limit `P(n^(2/3)(λ_max − 2) ≤ s) → F₂(s)` (AGZ Theorems 3.1.4–3.1.5);
- the GUE bulk gap probability (AGZ Theorem 3.1.1);
- the speed-`n` largest-eigenvalue LDP of GOE and GUE (§9.5; AGZ Theorem 2.6.6).

AGZ itself defines `F₂` and the gap limit as Fredholm series (AGZ line 4676, (3.1.6); line 4555, (3.1.1)). The Airy function is two lines through Mathlib's `Complex.regularizedHGFun` (`Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean` line 192), exactly as SpecialFunctionsAiry's `Suggested.lean` defines it (its line 64). An LDP is a predicate (AGZ Definition D.1, AGZ line 20252). The bullet this pull request rewrites names a missing carrier, but none is missing.

Witness: I elaborated a scratch file that imports this module, with `lake env lean`. The definitions `airyAi`, `airyKernel`, `fredholmDet`, `sineKernel` and `LargeDeviationPrinciple`, and the theorems `gue_largest_eigenvalue_tracyWidom`, `gue_bulk_gap` and `gaussianEnsemble_largest_eigenvalue_ldp`, all elaborate under the defaults with `sorry` as the only warning.

Repair: add these as local copies in this namespace. Their docstrings should name SpecialFunctionsAiry 1.1 and 8.5 as the owners of `Ai` and `K_Ai`; SpecialFunctionsBessel and SpecialFunctionsConfluent already handle local copies of `airyAi` this way. This is the tested form:

```lean
noncomputable def airyAi (x : ℝ) : ℝ :=
  ((3 : ℂ) ^ (-(2 / 3 : ℂ)) * Complex.regularizedHGFun 0 {2 / 3} ((x : ℂ) ^ 3 / 9) -
    (3 : ℂ) ^ (-(4 / 3 : ℂ)) * x * Complex.regularizedHGFun 0 {4 / 3} ((x : ℂ) ^ 3 / 9)).re
noncomputable def airyKernel (x y : ℝ) : ℝ :=
  ∫ t in Set.Ioi (0 : ℝ), airyAi (x + t) * airyAi (y + t)
noncomputable def fredholmDet (K : ℝ → ℝ → ℝ) (A : Set ℝ) : ℝ :=
  ∑' k : ℕ, ((-1 : ℝ) ^ k / k.factorial) *
    ∫ x in Set.univ.pi (fun _ : Fin k ↦ A), (Matrix.of fun i j ↦ K (x i) (x j)).det
theorem gue_largest_eigenvalue_tracyWidom {Ω : Type*} [MeasurableSpace Ω]
    (P : Measure Ω) [IsProbabilityMeasure P] (G : ∀ n : ℕ, Ω → Fin (n + 1) × Fin (n + 1) → ℝ)
    (hG : ∀ n, HasLaw (G n) (Measure.pi fun _ ↦ gaussianReal 0 1) P) (s : ℝ) :
    Tendsto (fun n : ℕ ↦ P.real {ω | ((n + 1 : ℕ) : ℝ) ^ ((2 : ℝ) / 3) *
        ((⨆ i, (gaussianEnsemble_isHermitian 2 (n + 1) (G n ω)).eigenvalues i) - 2) ≤ s})
      atTop (𝓝 (fredholmDet airyKernel (Set.Ioi s))) := by
  sorry
```

The bulk gap uses `sineKernel x y = if x = y then 1 else sin(π(x−y))/(π(x−y))`, the scaling `(n+1)·√(4−E²)/(2π)·(λᵢ − E)` for `|E| < 2`, compact `A`, and the limit `fredholmDet sineKernel A`. The LDP is AGZ's (D.1)–(D.3), with `ENNReal.log` into `EReal`, applied at speed `n + 1` to the law of `⨆ i, eigenvalues i` with rate `if 2 ≤ x then ENNReal.ofReal ((β/2) ∫₂ˣ √(t²−4) dt) else ⊤`.

Name the new declarations in README §§8.4, 9.1 and 9.5, since every Lean name must appear in the README.

Rewrite the docstring bullets so they give only reasons that hold:
- `F₁` needs the Hastings–McLeod solution, whose existence is a theorem;
- the Airy and sine point-process limits need the configuration space of R01;
- ⊞, ⊠ and the Itô integral are still missing for the free-probability limits and Dyson Brownian motion.

The speed-`n²` beta-gas LDP can be stated the same way once `E_V` is defined as in AGZ (2.6.4)–(2.6.5), as an integral of a function bounded below. I did not elaborate that one.

## R04 (P3) — six definitions have fewer than three Checks, and §8.4 writes Airy's equation in the threshold variable

Location:
- the eigenvalue point process, §8.1 (lines 971–974);
- the ensemble kernels, §8.2 (lines 985–989);
- `F₂`, §8.4 (lines 1052–1056);
- the Pfaffian, §8.5 (lines 1069–1073);
- logarithmic capacity, §9.4 (lines 1157–1161);
- the `β ≥ 1` Dyson process, §10.3 (lines 1237–1241);
- line 1042, "its equation `Ai'' = s Ai`".

Claim: each of these definitions has two Checks. `F₂` has only one of its own: the new bullet checks the supplier's kernel `K_Ai`, not `F₂`. In line 1042, `s` is also the threshold in `L²(s,∞)` four lines later.

Witness: the lines cited. SpecialFunctionsAiry writes the equation as `w″ = z w` (its README line 8).

Repair: add one discriminating Check to each (values computed):
- §8.1: `diag(1,1)` gives the process `2δ₁`, of mass 2. A definition through distinct eigenvalues gives `δ₁`.
- §8.2: the CUE kernel `(2π)⁻¹ ∑_{k<n} e^{ik(θ−φ)}` has `K(θ,θ) = n/(2π)` and `∫₀^{2π} K(θ,θ) dθ = n`. At `n = 2` these are `1/π` and `2`.
- §8.4: `F₂(s) → 0` as `s → −∞` (AGZ Theorem 3.1.5), and `1 − F₂(s) ≤ ∫_s^∞ K_Ai(x,x) dx`, since `P(λ_max > s) ≤ E N(s,∞)`. A determinant on `L²(−∞,s)` fails both.
- §8.5: `Pf(BABᵀ) = det B · Pf A`. For `A = [[0,1],[−1,0]]` and `B = diag(2,1)`, `BABᵀ = [[0,2],[−2,0]]`, whose Pfaffian is `2 = 2 · 1`.
- §9.4: `cap(cE) = c · cap(E)` for `c > 0`, so `cap[0,1] = 1/4`; a finite set has capacity `0`.
- §10.3: at `n = 2` the gap `r = λ₁ − λ₂` solves `dr = √(4/(βn)) dW + (2/(nr)) dt`. That is `√(4/(βn))` times a Bessel process of dimension `β + 1`, which avoids `0` exactly when `β ≥ 1`. A wrong drift constant moves the threshold.

At line 1042, write `Ai''(x) = x Ai(x)`.

## R05 (P3) — two headlines are narrower than the theorems they cite

Location:
- `wigner_semicircle_ae`: `Suggested.lean` lines 148–158 (binders `hmean`, `hdiag`) and README lines 625–628, citing "T Theorem 2.4.2; Bai 1999, Theorem 2.1".
- `least_singular_value`: `Suggested.lean` lines 329–337 ("i.i.d. real entries of variance one", `∫ x, x ^ 2 ∂ν = 1`) and README lines 1272–1275, citing Rudelson–Vershynin 2008, Theorem 1.2.

Claim:
- Bai's Theorem 2.1 assumes i.i.d. upper entries with `E|x₁₂ − Ex₁₂|² = σ²` and an i.i.d. real diagonal with no moment condition. It needs neither centring nor `hdiag`. The Lean statement is Tao's form: Tao's Wigner ensemble has mean-zero, unit-variance upper entries and a diagonal of bounded mean and variance.
- RV2008 Theorem 1.2 takes rows that are i.i.d. copies of a vector of independent centred entries with variances at least 1. The entries need not be identically distributed.

Witness: Bai1999 lines 125–129; T lines 5869–5876 and 5960; RV2008 lines 117–124. Instance: let column `j` have law `N(0, 1 + (j mod 2))`. Each entry has sub-Gaussian proxy 2 and variance at least 1, and the rows are i.i.d. RV2008 Theorem 1.2 covers this matrix, but the Lean hypothesis `HasLaw (ξ ij) ν P` for a single `ν` excludes it.

Repair:
- For the semicircle law, either state Bai's form (drop `hmean` and `hdiag`, and replace `hvar` by `∫ z, ‖z − ∫ w, w ∂ν‖ ^ 2 ∂ν = 1`), or keep the binders and cite Tao Theorem 2.4.2 alone.
- For the least singular value, quantify over independent entries whose rows are i.i.d. copies, with `1 ≤ ∫ x, x ^ 2 ∂νⱼ`, and keep the i.i.d. unit-variance case as a README Check.

## R06 (P3) — §6.4 is narrower than AGZ Lemma 5.3.32, and FreeProbability F6 on main states the general form

Location: README lines 838–843: "the free central limit theorem for freely independent identically distributed bounded centred self-adjoint variables of variance 1"; no claim-level locator.

Claim: AGZ Lemma 5.3.32 needs only:
- freeness in a space with a tracial state;
- `sup_j |φ(a_jᵏ)| < ∞` for every `k`;
- `φ(aᵢ) = 0` and `φ(aᵢ²) = 1`.

It does not need identical distribution. FreeProbability F6 on main states this extension (its lines 553–561). Its supplier table (lines 113–114) calls the scalar limit theorems "a single common implementation" with this Layer 6. So §6.4 keeps the narrower theorem, and the general one is restated by a roadmap that treats this layer as a co-owner.

Witness: AGZ lines 17752–17760. Instance: free, centred, variance-1 variables alternating between a standard semicircular and `(δ₋₁ + δ₁)/2`. These are bounded but not identically distributed. The lemma gives the semicircle limit for them; §6.4 as written does not cover them.

Repair: state §6.4 at Lemma 5.3.32's generality, with that locator, and keep the i.i.d. case as a Check. Give the free Poisson limit its locator (AGZ §5.3.3, exercise at AGZ line 17611; see Source issues). In Scope and ownership, add one sentence on what FreeProbability F1–F6 extends, so that F6 can cite §6.4 instead of restating it. FreeProbability already consumes this roadmap, so citing F6 from here would close a cycle.

## R07 (P3) — claim-level locators missing or pointing at the wrong theorem

Location and claim:
- §2.1 (lines 378–385): Bernstein's bound `2 exp(−t²/(2(v+bt/3)))`, McDiarmid's `2 exp(−2t²/∑cᵢ²)`, Efron–Stein and the moment-generating-function definition of sub-exponential are in neither cited text. "Bernstein" and "Efron" occur in neither T nor AGZ. T Theorem 2.1.10 (T line 3050) is McDiarmid with unspecified constants `C, c`, and T's sub-exponential condition (T line 743) is a tail bound.
- §4.3 (line 625): the triangular-array law cites AGZ Theorem 2.1.21, which is the i.i.d. case with `r₂ < ∞` (AGZ lines 1169–1170). The Lindeberg condition is Bai Theorem 2.4 (Bai1999 lines 334–342).
- §9.1 (lines 1110–1114): the LDP, goodness, exponential tightness and the contraction principle are in AGZ Appendix D (Definitions D.1–D.3 and Theorem D.7, AGZ lines 20252–20344), not in §2.6, which is all the layer's Sources line cites.
- §9.5 (lines 1165–1169) has no locator. It is AGZ Theorem 2.6.6 (AGZ line 4131), whose printed rate has the wrong sign (Source issues).
- These claims have only the layer's Sources line:
  - §3.1: AGZ Theorem 2.4.3 (line 2210);
  - §7.1: AGZ Theorem 5.4.5 (line 18154);
  - §8.3: AGZ Lemma 4.2.13 (line 11127), Corollary 4.2.24 (line 11496) and Theorem 4.2.25 (line 11502);
  - §8.4: AGZ Theorems 3.1.1, 3.1.4 and 3.1.5 (lines 4549, 4624, 4684);
  - §10.3: AGZ Lemma 4.3.3 and Proposition 4.3.5 (lines 12588, 12952);
  - §11.2: T (2.179) and Theorem 2.8.3 (T lines 10031, 10034).

Witness: the source lines given with each item.

Repair: put the locators above in parentheses at each claim. Write "(Bai 1999, Theorem 2.4)" at line 625. For §2.1, cite a text that states the sharp constants and the MGF definition, and add it to References (for example Boucheron–Lugosi–Massart's *Concentration Inequalities* or Vershynin's *High-Dimensional Probability*; I did not read either, so take the theorem numbers from the copy you cite).

## R08 (P3) — the Exchangeability link is broken and the citation names nothing

Location: README line 62, "[Exchangeability](../Exchangeability/README.md) owns exchangeability and conditional-i.i.d. representation theory", and line 174, "Exchangeability: the joint-law transport interface".

Claim: the roadmap lives at `Completed/Exchangeability/README.md`, so the link points at nothing at this head. "The joint-law transport interface" names no section or declaration, and §0.2's *Needs:* line (line 257) lists only Mathlib.

Witness: `TauCetiRoadmap/Exchangeability/` does not exist at 5d55d20; `Completed/Exchangeability/README.md` line 130 defines `ConditionallyIIDWith`.

Repair: link `../../Completed/Exchangeability/README.md`, as line 48 does for OrthogonalL2Bases. Then either name what §0.2 consumes in its *Needs:* line, or delete the supplier from lines 62–63 and 174.

## Verified sound

**The change in this pull request.** I resolved every cited id in SpecialFunctionsAiry at its head (618ca5a):
- 1.1, definitions and Maclaurin series (README line 347; `airyAi` is `Suggested.lean` line 64);
- 1.2, equation and uniqueness (line 370);
- Layer 2, integral representations (lines 481–551);
- 3.2 (line 585) and 3.4 (line 620), the expansions;
- 3.6 (line 708): the recessive characterization and `0 < Ai(x) ≤ Ai(0) e^{−(2/3)x^{3/2}}` for `x ≥ 0`;
- 8.5 (line 1379): `K_Ai` in closed form, its diagonal `Ai′² − x Ai²`, and `|K_Ai(x,y)| ≤ C² e^{−x−y}` on `[s,∞)²`.

`TauCeti.airyAi` and `TauCeti.Real.airyAi` are the names its Conventions give (lines 145–150). Its `Suggested.lean` declares local copies `airyAi` (line 64), `Real.airyAi` (line 95) and `airyKernel` (line 180).

Its Scope section (lines 109–113) records the takeover from RandomMatrices §8.4, and its downstream line 1626 names RandomMatrices. It cites RandomMatrices only as a consumer, so there is no cycle. It claims nothing RandomMatrices keeps: there is no Tracy–Widom, Fredholm or Painlevé text in it. The removed Check `Ai(0) = 3^{−2/3}/Γ(2/3)` is now the first Check of its 1.1.

SpecialFunctionsAiry's Scope lists "3.4–3.6" as taken over, while this roadmap cites the subset 3.2, 3.4 and 3.6. That is consistent, since a consumer may cite a subset.

The edge is declared in the description ("Depends on #1928"). SpecialFunctionsAiry is not in the merge order, so the dependency check does not see it. #1928 must merge first, and the link `../SpecialFunctionsAiry/README.md` resolves only after that.

**Gate.** The worker's gate fails only on `dropped=10` (R01) and `depcheck=1` (R02). My depcheck run prints the single line quoted in R02 and then `depcheck: 238 roadmaps, 2351 edges, 1 problem(s)`. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Build.** `lake env lean` on `Suggested.lean` exits 0 with 11 `sorry` warnings, one per headline, and nothing else.

**Signatures.** I ran `#check @name` on all 24 declarations in one scratch file. Every elaborated type matches its README statement, and every `Ω`, `MeasurableSpace Ω` and `IsProbabilityMeasure` binder appears in the printed types. In the density theorem, `↑n − 1` is real subtraction, and `0 ^ 0 = 1` in `rpow` makes the `n = 0` case consistent.

**One-tactic probe.** I replaced every `sorry` by `first | (simp; done) | rfl | infer_instance | (norm_num; done) | positivity` in a scratch copy. All 11 headlines fail, so none is padding. The four proved `IsHermitian` helpers are proof arguments that the headline statements need.

**Degenerate cases elaborated.**
- `marchenkoPastur 0 = dirac 1` closes by `simp`.
- `eigenvalueMeasure` of a `0 × 0` matrix is `0`.
- `sampleCovariance` of a `3 × 0` matrix is `0`.
- `gaussianEnsemble 2 1 g 0 0 = g(0,0)` and `gaussianEnsemble 1 1 g 0 0 = √2 g(0,0)`.
- `semicircleReal a 0` reduces to `betaMeasure (3/2) (3/2) univ • δ_a = δ_a`.

**Library declarations opened at the pins** (file and line):
- `MeasureTheory.resolventTransform` (`Mathlib/MeasureTheory/Measure/ResolventTransform.lean` 108);
- `HasSubgaussianMGF` (`Mathlib/Probability/Moments/SubGaussian.lean` 598: integrability of `exp(tX)` for every `t` and `mgf ≤ exp(c t²/2)`; it says nothing on measurability);
- `eigenvalues₀` and `eigenvalues₀_antitone` (`Mathlib/Analysis/Matrix/Spectrum.lean` 60, 63);
- `LinearMap.singularValues : ℕ →₀ ℝ` (`Mathlib/Analysis/InnerProductSpace/SingularValues.lean` 95; decreasing, with junk `0` beyond the rank, so index `N − 1` is `s_min`);
- `Matrix.toEuclideanLin` (`Mathlib/Analysis/InnerProductSpace/PiL2.lean` 1219);
- `Complex.regularizedHGFun` (`Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean` 192);
- `betaMeasure` (`Mathlib/Probability/Distributions/Beta.lean` 132);
- `ProbabilityTheory.cond` (`Mathlib/Probability/ConditionalProbability.lean` 75);
- `Complex.volume_ball` (`Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean` 421);
- `gaussianReal` (`Mathlib/Probability/Distributions/Gaussian/Real.lean` 220);
- `HasLaw` (`Mathlib/Probability/HasLaw.lean` 39);
- `ENNReal.log` (`Mathlib/Analysis/SpecialFunctions/Log/ENNRealLog.lean` 45);
- `TendstoInDistribution` (`Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean` 64: the limit is a random variable on a probability space, so `id` under `gaussianReal 0 v` is the intended law);
- `posSemidef_vecMulVec_star_self` (`Mathlib/LinearAlgebra/Matrix/PosDef.lean` 459);
- `isHermitian_mul_conjTranspose_self` (`Mathlib/LinearAlgebra/Matrix/Hermitian.lean` 286);
- Tau Ceti `empiricalMeasureOfFintype` (`TauCeti/Probability/Process/EmpiricalMeasure.lean` 224).

Neither pinned library has an Airy function, a Fredholm determinant of an integral operator, an LDP or a point process (grep). Mathlib's `Fredholm` files concern Fredholm operators.

**Cross-roadmap citations resolved** (13 roadmaps):
- StandardDistributions on main: Layers 0, 3, 4, 5, 6, 7 (lines 169, 361, 491, 547, 759, 969); 10.20 (line 1989, `(betaMeasure (3/2) (3/2)).map (2*·-1)`); 12.1 (line 2143, `cond volume (ball c r)`); `wishartGramMeasure` (line 886).
- OrthogonalL2Bases, Completed: Parts A and B (lines 147, 245).
- LaguerreJacobi at its open head: Part A (line 219), A3 (258), Part B (277), B3 (293), `laguerreMeasure` (279).
- RepresentationTheory/CompactGroups: Layer 0 (line 205) and `weyl_integration_formula` (line 420).
- OptimalTransport: Layers 0–3 (lines 346–504).
- OperatorTheory: PD-A51, PD-A52, PD-A53 (PolarDecomposition lines 254, 257, 260); PA-B40 (PrincipalAngles line 295); SSP-D06, SSP-D13, SSP-D14 (SpectralSubspacePerturbation lines 428, 444, 447); OI-B01, OI-B19, OI-B23, OI-B29, OI-B30 and Part C (OperatorIdeals lines 300, 332, 352, 349, 350, 530).
- SuccessiveMinima: 0.1.2 `hermitian_gram_hadamard` (line 188).
- StochasticCalculus at its open head: S1.2–S9.2 named in its README (lines 47, 192, 324, 2466, 2556, 3018); `IsFilteredBrownian`, `timeMeasure` and `IsStrongSolution` in its `Suggested.lean` (lines 50, 84, 572).
- FreeProbability on main, a downstream consumer: lines 103–118 cite this roadmap's Layers 1, 3, 5 and 6.
- SpecialFunctionsAiry: above.
- Exchangeability: R08.
- PointProcesses: R01.

**Ownership by object.** SpecialFunctionsAiry is the only owner of `Ai`, `Bi` and `K_Ai`; SpecialFunctionsBessel and SpecialFunctionsConfluent consume them. Tracy–Widom, Hanson–Wright, matrix Bernstein, Marchenko–Pastur, the circular law, Dyson Brownian motion and the least singular value occur only here; FreeProbability's overlap is R06. SatoTateGroups and QuantumGroups use the semicircle law through StandardDistributions 10.20 and FreeProbability. `scratch/overlaps.md` lists no open pull request that changes this roadmap and no dropped id; I checked both against `roadmaps overlaps`.

**Sources read at their locators** (9 texts: AGZ and T from the authors' pages, Bai1999 from Statistica Sinica, Soshnikov2000, BGN2011, RV2008, RV2013, TVK2010 and Tropp2012 from arXiv). Sampled targets:
- 2.1: T lines 743 and 3050, and no Bernstein in either book → R07.
- 3.1: AGZ Theorem 2.4.3 at line 2210, with the sign `ℑS_μ(i) = ∫(1+x²)⁻¹dμ` at line 2227 matching Convention 4.
- 3.3: AGZ §2.1.1, and StandardDistributions 10.20.
- 3.4: Bai1999 (2.12), lines 452–464.
- 4.1: T lines 5869–5876.
- 5.1: AGZ (2.5.1) at lines 2563–2570, and (2.5.4) at line 2595.
- 6.1: AGZ Definitions 5.2.1 and 5.2.9 and Lemma 5.2.19 (lines 16065, 16284, 16543).
- 6.4: AGZ Lemma 5.3.32 and the exercise at line 17611 → R06.
- 7.1: AGZ Theorem 5.4.5 at line 18154.
- 8.3: Soshnikov2000 (1.13)–(1.14) and Lemmas 1–2 at lines 255–331, Remark 2 at line 385, and AGZ Lemma 4.2.13 and Theorem 4.2.25.
- 8.5: AGZ Theorems 3.1.5–3.1.7 at lines 4684–4739, whose GOE normalization (line 4704) matches Convention 5.
- 9.1: AGZ Appendix D → R07.
- 9.2: AGZ (2.6.1)–(2.6.6) at lines 3532–3595.
- 10.3: AGZ Theorem 4.3.2, Lemma 4.3.3 and Proposition 4.3.5 at lines 12556–12592 and 12952.
- 11.2: T §2.8.3 at lines 9987–10056.

Headline locators read: Bai1999 Theorems 2.1, 2.5, 2.12, 2.15 and 2.16 (lines 128, 452, 992, 1214, 1221); RV2008 Theorem 1.2 (line 117); T Theorem 2.4.2 (line 5960); AGZ Theorem 2.5.2 (line 2588). All sampled targets are supported as written, apart from the locator and generality notes in R05–R07.

**Adversarial table** (values computed on each side):

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. 4, resolvent sign | `A = diag(1,−1)`, `z = i` | `½(1/(1−i) + 1/(−1−i)) = ½((1+i)/2 + (−1+i)/2) = i/2`, `Im > 0`; AGZ's `ℑS(i) = ∫(1+x²)⁻¹ > 0` has the same sign; `(z−A)⁻¹` gives `−i/2` | agrees | none |
| 3.1 remainder bound | `r = 1`, `μ = δ₁`, `z = i`; general `r` | `R₁ = (1+i)/2 − i = (1−i)/2`, `|R₁| = 0.707 ≤ 1`; `1/(x−z) = −∑_{k<r} xᵏ z^{−k−1} + (x/z)ʳ/(x−z)`, `|x−z| ≥ Im z` | true | none |
| 3.1 atom and two-point Checks | `δ₀`; `(δ₋₁+δ₁)/2` | `η Im m(iη) = η · η⁻¹ = 1`; `½(1/(−1−z) + 1/(1−z)) = z/(1−z²)` | true | none |
| 3.3 `semicircleReal` | `v = 1`; `z = i`; `v = 0` | mass `(2π)⁻¹ · 2π = 1`; `m₄ = 2 = C₂`; `m = i(√5−1)/2 ≈ 0.618i` or `−i(√5+1)/2`; Lean reduces to `betaMeasure univ • δ_a` | true | none |
| 3.3 body vs StandardDistributions 10.20 | `y = 2x−1` | `x(1−x) = (1−y²)/4`, density `∝ √(1−y²)`; `Var(a + 2√v y) = 4v · ¼ = v` | matches | none |
| 3.4 `marchenkoPastur` | `y = 1`; `y = 2`; `y = 1, z = 2`; Bai (2.12) | `(2π)⁻¹∫₀⁴√((4−x)/x)dx = (2π)⁻¹ · 2π = 1`; atom `½`; `2m² + 2m + 1 = 0 ⇒ m = −½ + i/2`; Bai: `√((b−x)(x−a))/(2πxyσ²)`, atom `1 − 1/y` | true | none |
| 4.1 constructors | `n = 2`; `E trₙH²`; `Wₙ/n`; `X = (1, i)` | `2^{−1/2}[[η₀, ξ₀₁], [ξ̄₀₁, η₁]]`; `(nσ² + n(n−1))/n² → 1`; `→ 0`; `S = 2/2 = 1` | true | none |
| 5.1 GOE/GUE vs AGZ (2.5.1) | `exp(−trH²/4)`, `exp(−trH²/2)`; `n = 2` | GOE: off-diagonal variance `1`, diagonal `2`; GUE: diagonal `1`, real and imaginary parts `½` each; `E trₙH² = 1 + 1/n` and `1`; `Im H₀₁ = g(1,0)/2` | matches | none |
| `gaussianEnsemble_eigenvalue_density` | `n=1, β=2`; `n=1, β=1`; `n=2, β=2`; `n = 0` | `Z = √(2π)`; `Z = √2 · √(2π) = 2√π`, i.e. `N(0,2)`; `Z = ¼ · 2π · 2 = π` and `∫∫e^{−x²−y²}(x−y)² = π`, chamber mass `(π/2)(2/π) = 1`; both sides are the Dirac mass at the single point | true | none |
| density constant vs AGZ (2.5.4) | `x = y/√n` | AGZ's constant becomes `(βn/2)^{−n/2−βn(n−1)/4}(2π)^{n/2}∏Γ(1+jβ/2)/Γ(1+β/2)`, using `∏Γ(1+jβ/2)/Γ(1+β/2) = n!∏Γ(jβ/2)/Γ(β/2)` | matches | none |
| 6.1 Checks | `φ(p) = p(1) − p(0)`; `φ(x) = 0`, `φ(x²) = −1` | `φ(1) = 0`; `φ(x*x) = −1 < 0` | true | none |
| 6.4 free CLT | AGZ Lemma 5.3.32 | source: bounded moments, `φ(aᵢ) = 0`, `φ(aᵢ²) = 1`, not i.d.; README: i.d. | narrower | R06 |
| 6.4 free Poisson | rate `λ` | `κₙ(λ · MP_{1/λ}) = λⁿ λ^{1−n} = λ`; edges `(√λ ± 1)²`; continuous mass `min(1, λ)` | true | Source issues |
| 7.1 Pastur equation | `ν = δ₀`; `t = 0` | `m = 1/(−z − tm) ⇒ tm² + zm + 1 = 0`; `m = m_ν` | true | none |
| 8.3 Checks | `1_{x=y}`; `λφ⊗φ`; sine kernel | Poisson void probability `e^{−1} ≠ det(I − 0) = 1`; `1 − λ∫_Bφ²`, and `1 − λ < 0` for `λ > 1`; `ρ₂ = 1 − (sin πr/(πr))² → 0` | true | none |
| 8.4 new `K_Ai` Check | `x = 0`; tail | `Ai′(0)² = (3^{−1/3}/Γ(⅓))² = 0.066987…`, the reversed quotient gives `−0.067`; `∫_s^∞ K(x,x) dx ≤ C² e^{−2s}/2` | true | none |
| 8.4 `F₂` | Fredholm series | `k`-th term `≤ (∫_s^∞ K(x,x))ᵏ/k! → 0`, so `F₂ → 1`; only one Check of its own | thin | R04 |
| 8.5 Tracy–Widom relations | AGZ (3.1.7), (3.1.13) | `F₂ = exp(−∫(x−s)q²)`; `F₁/√F₂ = exp(−½∫q) ⇒ F₁² = F₂ e^{−∫q}` | true | none |
| 8.5 Pfaffian Check | `2 × 2`, `4 × 4` | `Pf = a`; `a₁₂a₃₄ − a₁₃a₂₄ + a₁₄a₂₃`, whose square is `det` | true | none |
| 9.1 Checks | constant `δ₀`; Gaussian mean; `Real.log 0 = 0` | rate `0` at `0`, `∞` elsewhere; `x²/2`; `μ(F) = 0` would give `0 ≤ −inf_F I`, false when `inf_F I > 0` | true | none |
| 9.2 growth condition | AGZ (2.6.2) with `V_AGZ = βV/2`; `β = 2`, `c log(1+|x|)` | `liminf V/log|x| > 2β′/β`; `c > β′ ≥ 2 ⇔ c > 2` | true | none |
| 9.2 energy Check | `V = x²/2`, standard semicircle `σ` | `∫log|x−y| dσ = x²/4 − ½`; `∬ = ¼ − ½ = −¼`; `E_V = ½ + ¼ = ¾` | true | none |
| 9.3 rate | AGZ (2.6.5) | `∫V_AGZ − (β/2)Σ − c = (β/2)(E_V − min E_V)` | true | none |
| 9.5 rate | `x = 2`; `x ↓ 2`; AGZ Theorem 2.6.6 | `J(2) = 0`; `(β/2) · (4/3)(x−2)^{3/2} = (2β/3)(x−2)^{3/2}`; corrected AGZ form `V − β∫log|x−y|dσ + α = β − β/2 − β/2 = 0` at `x = 2`, derivative `(β/2)√(x²−4)` | README right | Source issues |
| 10.3 Ornstein–Uhlenbeck invariance | `n = 1`; general `n` | `(2/β)/(2 · ½) = 2/β`, the variance of `e^{−βx²/4}`; drift `= (βn)⁻¹∇log p` for `log p = β∑log|xᵢ−xⱼ| − βn∑xᵢ²/4` | matches §5.2 | none |
| 10.3 collision threshold | `n = 2` gap | `dr = √(4/(βn)) dW + 2/(nr) dt`, a scaled `BES(β+1)`, which hits `0` iff `β < 1` | matches "β < 1 excluded" | R04 (as a Check) |
| 11.2 Checks | `δ₀`; `circularLaw`; `diag(a,b)` | `log|z|`; `Δ((|z|²−1)/2) = 2 = 2π · π⁻¹`, value `0 = log 1` at `|z| = 1`; `½ log|det(A − z)|` | true | none |
| 2.1 sub-exponential Checks | `N(0,1)`; `Exp(1)`; Cauchy | `e^{λ²/2} ≤ e^{K²λ²}` iff `K² ≥ ½`; `e^{−λ}/(1−λ)`, `∞` at `λ = 1`, and `−λ − log(1−λ) ≤ λ²` for `|λ| ≤ ½`, so `K = 2` works; Cauchy has no mean | true | none |
| `hanson_wright` | `A = E₁₂ + E₂₁`, Rademacher, `K = 1`; `K = 0`; RV2013 | `XᵀAX = ±2`, `1 ≤ 2e^{−c/2} ⇒ c ≤ 2 log 2`; Lean's `t²/0 = 0` makes the bound `2`; RV's `K⁴`, `K²` correspond to proxy `K²`, `K` | true | none |
| `matrix_bernstein` | `Xₖ = εₖEₖₖ`, `t = 1`; `d = 0`; Tropp Theorem 1.4 | `2m e^{−3/8} ≈ 1.37m ≥ 1`; `d = 0`: `0 ≤ 0` for `t > 0`, `1 ≤ 0` at `t = 0` | `0 < t` needed and present | none |
| `wigner_semicircle_ae` | Bai 2.1; Tao 2.4.2 | Bai: no centring, diagonal without moments; Tao: mean `0`, diagonal of bounded mean and variance, which is the Lean form | narrower than Bai | R05 |
| `wigner_extreme_eigenvalues_ae` | Bai 2.12 (i)–(iv) | `E(w₁₁⁺)² ≤ Eη² < ∞`; `Eξ = 0` real and `≤ 0`; variance `1`; fourth moment; the minimum, via `−W`, needs `E(w₁₁⁻)² ≤ Eη²` | true | none |
| `marchenkoPastur_ae` | `y = ¼`; `n = 0` term | support `[¼, 9/4]`; `(0)⁻¹ • 0 = 0` | true | none |
| `sampleCovariance_extreme_eigenvalues_ae` | Bai 2.15–2.16; `y = ¼` | max `→ 9/4`, min `→ ¼`; the `y ≥ 1` case is guarded | true | none |
| `gaussianEnsemble_spike_ae` | `θ = 1`, `θ = 2`; BGN | `θ = 1`: branch `2 = 1 + 1/1`, continuous; `θ = 2`: `5/2`; any coupling is fine because the deviation probabilities are summable | true | none |
| `gaussianEnsemble_linear_statistic_clt` | `f = x`, `x²`; `β = 1, 2` | `a₁ = 2`, variance `2/β`, directly `n · (2/n)` and `n · (1/n)`; `a₂ = 2`, variance `4/β`, directly GUE `Var χ²_{n²}/n² = 2` and GOE `(8n + 4n(n−1))/n² → 4` | true | none |
| `least_singular_value` | `N = 1` Gaussian; Rademacher `2 × 2`; RV2008 1.2 | `P(|ξ| ≤ ε) ≈ 0.798ε`; singular with probability `½`, so `c ≥ 2^{−1/2}`; the source allows non-i.d. entries with variance `≥ 1` | narrower | R05 |
| `circular_law_ae` | `n = 1`; TVK 1.13 | `δ_{ξ₀₀}` of mass `1`; `volume(ball 0 1) = π` | true | none |
| `eigenvalueMeasure` | `[[0,1],[0,0]]`; `[[0,−1],[1,0]]`; `n = 0` | `δ₀`; `(δ_i + δ_{−i})/2`; `0` | true | none |
| `spectralMeasure` | `diag(1,−1)`, `[[0,1],[1,0]]` | both `(δ₁ + δ₋₁)/2` | true | none |
| GUE edge (R03 witness) | AGZ (3.1.6) | AGZ's `N^{2/3}(λ_N/√N − 2)` for unit-variance GUE equals `n^{2/3}(λ_max(Hₙ) − 2)` | statable | R03 |
| GUE bulk gap (R03 witness) | AGZ (3.1.1) at `E = 0` | AGZ: kernel `sin(x−y)/(π(x−y))`, density `1/π` for `√N λ`; README scaling `nρ(0)` with `ρ(0) = 1/π` gives unit density and kernel `sin π(x−y)/(π(x−y))` | statable | R03 |
| Layer 8 suppliers | gate | `dropped (10)`, no other owner | unowned | R01 |
| Layer 10 suppliers | depcheck | one UPWARD line | inherited | R02 |
| 4.3 locator | AGZ 2.1.21 vs Bai 2.4 | AGZ: i.i.d., `r₂ < ∞`; Bai: Lindeberg condition (2.9) | wrong locator | R07 |

Counts: 44 rows; 24 declarations checked with `#check`; 11 headlines probed with one tactic; 8 statability witnesses elaborated; 17 Mathlib and Tau Ceti declarations opened; 13 roadmaps' citations resolved; 15 sampled targets and 9 headline locators read in 9 texts.

## Not verifiable

- Potters–Bouchaud (PB), Cambridge University Press 2020. The sources service found only the Cambridge Core landing page (DOI 10.1017/9781108768900), on a host with no licence class, and I know of no open copy. The PB formulas cited for the Pastur equation, the companion transform, shrinkage and spikes were checked instead by the computations in the table.
- Johansson 1998 (Duke Math. J. 91, DOI 10.1215/S0012-7094-98-09108-6): Project Euclid has a landing page with no PDF. I checked §8.6 and `gaussianEnsemble_linear_statistic_clt` against AGZ and the direct variance computations above.
- The two concentration texts suggested in R07 were not read.

## Source issues

- **Misprint** in AGZ at Theorem 2.6.6, printed page 82 (AGZ lines 4136–4141): the source says the rate for `x ≥ x*` is `β∫log|x−y|σ(dy) − V(x) − α`, which decreases to −∞; it should be `V(x) − β∫log|x−y|σ(dy) + α`, zero at `x*` and increasing; affects nothing.
- **Misprint** in AGZ at the free Poisson exercise of §5.3.3, printed page 368 (AGZ lines 17611–17616): the source says the limit for `λ < 1` is `(1−λ)δ₀ + λp̃`, but `p̃` already has mass `λ`, so the total is `1 − λ + λ²`; it should be `(1−λ)δ₀ + p̃`; affects nothing.
