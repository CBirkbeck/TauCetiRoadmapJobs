# Review of DysonBrownianMotion (pull request #2118 at 57a8382)

**Verdict:** needs changes

Seven findings: three P2, four P3. The gate fails on `imports`. The mathematics of every Check
and of both Lean headlines recomputed correctly; the findings are about ownership, missing
statements and form.

## R01 (P2) — §3.2 and the Summary identify `μ_t` with `ν ⊞ SC_t` for laws on which the supplier does not define `⊞`

**Location.** `TauCetiRoadmap/DysonBrownianMotion/README.md` lines 267–268: "Identify `μ_t` as
`ν ⊞ SC_t` through the subordination form of RandomMatrices §6.3 and the Pastur equation of
RandomMatrices §7.1"; also the Summary, lines 12–14.

**Claim.** For every `ν` admitted by §3.1 (weak limit, bounded `n⁻¹ ∑ log(1 + λᵢ(0)²)`), the
limit is the free convolution of RandomMatrices.

**Witness.** RandomMatrices §6.3 (README line 811 on main) defines free additive convolution
"on compactly supported real probability measures", and §7.1 (line 866) assumes uniformly
bounded norm. `ν` = standard Cauchy satisfies §3.1 (`∫ log(1+x²) dν = 2 log 2`) and is not
compactly supported.

**Repair.** Either (a) add "for compactly supported `ν` and uniformly bounded initial
spectra" to §3.2 and to the Summary sentence, keeping §3.1 at AGZ's generality; or (b) own the
extension here: define `ν ⊞ SC_t` for an arbitrary probability measure `ν` as the unique
probability measure whose transform solves `m(z) = ∫ (x − z − t m(z))⁻¹ dν(x)` on `Im z > 0`,
with existence, uniqueness and agreement with RandomMatrices §6.3 on compact support as API,
and three Checks. On the Cauchy instance (b) gives `m_t(z) = −1/(z + i + t m_t(z))`, a quadratic
with one root in the upper half-plane; (a) excludes it.

In the same section, "deduce the Ornstein–Uhlenbeck limit by deterministic time change and
scaling" names no statement. State it: if `λ` solves the Brownian system then
`Y(t) = e^(−t/2) λ(e^t − 1)` solves the system with drift `−Yᵢ/2`, so the Ornstein–Uhlenbeck
limit at time `t` is the image of `ν ⊞ SC_(e^t − 1)` under `x ↦ e^(−t/2) x` (I checked: the
interaction term scales by `e^(−t/2) · e^t · e^(−t/2) = 1`, the noise by `e^(−t/2) · e^(t/2) = 1`).

## R02 (P2) — §0.1 plans again what StochasticCalculus S1.2 owns

**Location.** README lines 129–132: "State and prove the adapters to that interface: Brownian
motion on a finite-dimensional real inner-product space from independent scalar Brownian
coordinates in an orthonormal basis, its independence of the basis, and brackets".

**Claim.** These are adapters that this roadmap owns.

**Witness.** StochasticCalculus README, S1.2, lines 919–921 at its open head: "Construct
centered vector Brownian motion for every finite-dimensional real inner-product space V; prove
independent orthonormal components, linear-isometry transport, covariance". The first sentence
of §0.1 consumes exactly this from S1.2–S1.3.

**Repair.** Delete the construction and the basis independence from the "State and prove"
sentence (they are consumed, as the sentence before says). Keep as owned only what S1.2, S4.3
and S5.5 do not state: the bracket of two linear functionals `[⟨u,W⟩,⟨v,W⟩]_t = ⟨u,v⟩t` for a
non-orthonormal pair, and the localized Hilbert–Schmidt integrand classes at collision and exit
times. The first two Checks of §0.1 test the bracket and stay; if nothing owned remains beyond
the bracket, fold it into §2.1 and drop Layer 0.

## R03 (P2) — §1.1 never states the system it solves, and §1.2 states no existence theorem

**Location.** README line 156: "Construct the ordered-particle equation for every real
`β ≥ 1`; prove global strong existence, uniqueness and no collisions from strictly ordered
starts"; line 172: "For the Ornstein–Uhlenbeck drift `-λᵢ/2`, prove the Gaussian beta density
… invariant".

**Claim.** §1.1 is the roadmap's first end theorem.

**Witness.** The equation appears only in §2.2 (line 218), a later layer, and there with
"`β = 1, 2`". §1.1 gives no equation, noise, filtration or class of initial data; §1.2 adds a
drift to it and proves invariance for a system whose existence, uniqueness and noncollision no
target states.

**Repair.** In §1.1 write the system, `dλᵢ = √(2/(βn)) dBᵢ + n⁻¹ ∑_{j≠i} (λᵢ−λⱼ)⁻¹ dt` for
`i = 1, …, n`, real `β ≥ 1`, `B` an `n`-dimensional Brownian motion relative to the filtration
of Convention 1, and state the three theorems separately with their data: (i) for a
deterministic start in the open chamber, a unique strong solution with paths in the open
chamber, and uniqueness in law (AGZ Lemma 4.3.3); (ii) for a deterministic start in the closed
chamber, a unique strong solution that lies in the open chamber at every `t > 0` and depends
continuously on the start (AGZ Proposition 4.3.5); and in §1.2 (iii) the same two statements
for the system with the added drift `−λᵢ/2`, with the route (the time change of R01, or the
proof of Lemma 4.3.3 with the Lyapunov function unchanged). The `n = 2` Check then reads off
(i): gap equation `dr = √(4/(βn)) dW + (2/(nr)) dt`, Bessel dimension `1 + 2(2/n)/(4/(βn)) =
β + 1`.

## R04 (P3) — gate `imports`: `Suggested.lean` imports another roadmap's module

**Location.** `TauCetiRoadmap/DysonBrownianMotion/Suggested.lean` line 3:
`import TauCetiRoadmap.RandomMatrices.Suggested`.

**Claim.** The file imports `Mathlib` and individual `TauCeti.*` modules only.

**Witness.** Gate at 57a8382: `imports=1 … FAIL`, rule "then only the individual `TauCeti.*`
modules it uses". The worker's signature elaboration from main failed for the same reason (no
object file for that module).

**Repair.** Delete line 3 and `open TauCetiRoadmap.RandomMatrices`, and give the noise matrix
its body in this file (a real body on native carriers; another namespace, so no clash):

```lean
def matrixBrownian (β n : ℕ) (d : Fin n → ℝ) (B : Fin n × Fin n → ℝ≥0 → Ω → ℝ) (t : ℝ≥0)
    (ω : Ω) : Matrix (Fin n) (Fin n) ℂ :=
  Matrix.diagonal (fun i ↦ (d i : ℂ)) + Matrix.of fun i j ↦ ((Real.sqrt n)⁻¹ : ℂ) *
    if β = 1 then
      (if i < j then (B (i, j) t ω : ℂ) else if j < i then (B (j, i) t ω : ℂ)
        else (Real.sqrt 2 * B (i, i) t ω : ℝ))
    else
      (if i < j then ((B (i, j) t ω : ℂ) + B (j, i) t ω * Complex.I) / (Real.sqrt 2 : ℂ)
        else if j < i then ((B (j, i) t ω : ℂ) - B (i, j) t ω * Complex.I) / (Real.sqrt 2 : ℂ)
        else (B (i, i) t ω : ℂ))
```

I elaborated this shape at the pins with only `import Mathlib` and
`import TauCeti.Analysis.Matrix.SpectralMeasure` (noise matrix as a separate `def`, the
Hermitian proof being the diagonal lemma `.add` the `lt_trichotomy`/`split_ifs`/`simp_all`
proof used for `gaussianEnsemble_isHermitian` on main; `sorry` the only warning). Then change
README lines 90–91 and 198–200 so that `gaussianEnsemble` and `gaussianEnsemble_isHermitian`
are no longer listed as consumed declarations (RandomMatrices §5.1 stays cited for the
normalization), the module docstring line 10–11, and the pull-request description's
"It imports `TauCetiRoadmap.RandomMatrices.Suggested`".

## R05 (P3) — README shape: no `### Examples`, no `## Downstream consumers`, no API list for the two definitions

**Location.** README Layers 0–3 (each ends with `### Dependencies` only); §2.1 lines 195–201;
end of file.

**Claim.** Every layer ends with `### Examples` and `### Dependencies`; each definition lists
its API as bullets; the README has `## Downstream consumers`.

**Witness.** `grep -c '^### Examples'` on the README gives 0; RandomMatrices on main has one per
layer (e.g. its line 1240). §2.1 defines matrix Brownian motion and §1.1 the Dyson system with
Checks but no API bullets; lines 111–112 promise "measurability or continuity, invariances"
without listing them.

**Repair.** Add `### Examples` to each layer (the `ν = δ₀` semicircle flow of main's Layer 10
belongs in Layer 3). Add API bullets to §2.1: joint measurability and almost sure path
continuity; `H(t) − H(s)` independent of the past with the law of `√(t−s)` times GOE/GUE;
invariance in law under orthogonal (`β = 1`) and unitary (`β = 2`) conjugation; Brownian
scaling `H(ct) ~ √c H(t)`; the bracket formula. Add `## Downstream consumers` (RandomMatrices
§7.1 is the static counterpart; say which roadmaps consume §3.1, or that none does yet).

## R06 (P3) — two transform conventions, `G` and `m`, with no stated relation

**Location.** README line 247 (`G_t(z) = ∫ (z-x)⁻¹ dμ_t(x)`) and line 277
(`m(z) = ∫ (x − z − t m(z))⁻¹ dν(x)`).

**Claim.** §3.2 passes from the equation for `G` to the Pastur equation for `m`.

**Witness.** The Conventions have no resolvent-sign item. RandomMatrices Convention 4 fixes
`m_μ(z) = ∫ (x-z)⁻¹ dμ` and says the opposite-sign transform "equals `-m(z)`; the translation is
proved before" use.

**Repair.** Add a Convention: "`G_t = −m_{μ_t}` in the sign of RandomMatrices Convention 4;
under it `∂_t G = −G ∂_z G` becomes `∂_t m = m ∂_z m`, which is the `t`-derivative of the
Pastur equation `m_t(z) = m_ν(z + t m_t(z))`." Witness on `ν = δ₀`: Pastur gives
`t m² + z m + 1 = 0`, and `G = −m` gives `t G² − z G + 1 = 0`, whose decaying root is the
`(z − √(z²−4t))/(2t)` of the first Check of §3.1.

## R07 (P3) — §2.2 narrows Dyson's theorem to a diagonal start

**Location.** README line 219: "the collision time is almost surely infinite, from any real
diagonal start at positive times"; line 214: "For distinct starting eigenvalues derive the
eigenvalue equation".

**Claim.** This is AGZ Theorem 4.3.2.

**Witness.** agz lines 12547–12572: the theorem takes any start `X(0)` in the symmetric or
Hermitian space with eigenvalues in the closed chamber, and concludes that the eigenvalue
process is a weak solution of (4.3.3) lying in the open chamber at all `t > 0`. Only Corollary
4.3.11 (line 13224) is stated for real diagonal starts.

**Repair.** State §2.2 for every start in the real symmetric (`β = 1`) or complex Hermitian
(`β = 2`) space, including coincident eigenvalues, with both conclusions (the eigenvalue
process is a weak solution of the system of §1.1 with the start's ordered spectrum, and lies in
the open chamber at every positive time); name the reduction to a diagonal start by the
conjugation invariance of §2.1 as a step; and say that `Suggested.lean` states the diagonal
case. A complex Hermitian non-real start with `β = 1` noise stays excluded.

## Verified sound

**Gate and build.** Gate at 57a8382: every scanner 0 except `imports=1` (R04); `depcheck=0`,
`build=0`, `outside-folder=0`. `git diff --stat origin/main...HEAD` outside the folder is
empty. `lake env lean` on `Suggested.lean` from the pull request's worktree: two `sorry`
warnings, nothing else. Dependency check output: `depcheck: 234 roadmaps, 2264 edges, 0
problem(s)`.

**Signatures.** `#check @name` for the four declarations, elaborated once: `matrixBrownian`
and `matrixBrownian_isHermitian` carry `β n d B t ω`; `matrixBrownian_eigenvalues_strictAnti`
carries `[MeasurableSpace Ω]`, `hβ`, `[IsProbabilityMeasure P]`, `hB`, `hindep`;
`matrixBrownian_hydrodynamic_limit` carries `hd`, `hlog`, `[IsProbabilityMeasure ν]`,
`[IsProbabilityMeasure P]`, `hB`, `hindep`. No binder lost; nothing changed.

**Padding probe.** Both sorried theorems are AGZ Theorem 4.3.2 and Corollary 4.3.11; neither
is a definition unfolding or a library lemma (library near-matches: no hit with either
conclusion). `matrixBrownian_isHermitian` is proved and is needed as a term in both headlines.

**Headlines.** (1) Dyson's theorem: the noncollision half is stated; the equation half needs a
stochastic integral, absent from Mathlib and from `TauCeti/Probability` at the pins (searched
for an Itô integral and a strong-solution predicate: none), and the docstring says so. (2)
`β ≥ 1` existence: same carrier, named in the docstring. (3) Hydrodynamic limit: stated, limit
characterized by (4.3.25). (4) `ν ⊞ SC_t`: no free convolution of measures at the pins
(`TauCeti/Probability/FreeProbability` has cumulants, laws and semicircular elements, no `⊞`),
named in the docstring.

**Adversarial table.**

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| Convention 3, inner product `(βn/2) Re tr(AB)` | `tr(AH) = ⟨(2/(βn))A, H⟩` | bracket `(2/(βn))² (βn/2) tr(AB) t = (2/(βn)) tr(AB) t` | agrees with §2.1 |
| §2.1 normalization vs AGZ (4.3.1) | `β=1`: off-diagonal `B/√n`, diagonal `√2 B/√n`; `β=2`: `(B + iB̃)/√(2n)`, diagonal `B/√n` | variances `t/n`, `2t/n`; `t/n`, `t/n` = `2t/(βn)` | agrees with agz line 12521 and with the body of `gaussianEnsemble` on main |
| §2.1 Check 1 | `n=1`, `A=E₁₁` | `2t` (`β=1`), `t` (`β=2`) | correct |
| §2.1 Check 2 | `β=2, n=2, A=E₁₂+E₂₁` | `(2/4)·2t = t`; `Var(2 Re H₁₂) = t` so `Var Re H₁₂ = t/4 = ½·t/2` | correct |
| §2.1 Check 3 | `t=4`, `d=0` | entry variance `4/n`, so `2 ×` GOE, not `4 ×` | correct |
| §0.1 Check 2 | inner product `2xy` on `ℝ` | `⟨1,W⟩ = 2W`, `[2W] = 2t` so `[W] = t/2` | correct |
| §1.1 Check, `n=2` gap | `r = λ₁−λ₂` | noise² `2·2/(βn) = 4/(βn)`, drift `2/(nr)`; Bessel dimension `1 + 2(2/n)/(4/(βn)) = β+1`; avoids 0 iff `β+1 ≥ 2` | correct |
| §1.2 Check 1 | `n=1` | `σ²/(2θ) = (2/β)/1 = 2/β`; `exp(−βx²/4)` has variance `2/β` | correct |
| §1.2 Check 2 | general `n` | `(βn)⁻¹ ∂ᵢ log p = n⁻¹∑(xᵢ−xⱼ)⁻¹ − xᵢ/2`; `σ²/2 = 1/(βn)` | drift = `(σ²/2)∇ log p`, invariant; matches RandomMatrices §5.2 weight `exp(−βn∑xᵢ²/4)∏|xᵢ−xⱼ|^β` |
| §2.2 Check 2 | `n=2` | drift of `λ₁` `= 1/(2(λ₁−λ₂))`; `[λ₁+λ₂] = 2·2t/(βn) = 2t/β = Var tr H` | correct |
| §2.2 Check 3 | `∑λᵢ²` | Itô drift `(2/n)·n(n−1)/2 + n·2/(βn) = n−1+2/β`; entries `n(n−1)/n + 2/β` | both sides equal; without `n⁻¹`: `n(n−1)+2/β` |
| §3.1 Check 1 | `ν=δ₀` | `G = (z−√(z²−4t))/(2t)` solves `tG² − zG + 1 = 0`; `semicircleReal 0 t` = image of the radius-1 law under `x ↦ 2√t x`, variance `t` | correct; agz line 13725 at `t=1` |
| §3.1 Check 3 | sign `+G∂_zG` | `(−z+√(z²+4t))/(2t) = 1/z − t/z³ + …`, second moment `−t` | correct |
| §3.2 Check 2 | `ν=(δ₋₁+δ₁)/2` | `0` enters the support iff `∫u⁻² dν = 1 > 1/t`, i.e. `t > 1` | merge at `t=1`, correct |
| §3.2 Check 3 | Pastur at `t=0` | `m = ∫(x−z)⁻¹dν` | correct |
| §3.2 identification | Cauchy `ν` | `∫log(1+x²)dν = 2 log 2 < ∞`, support `ℝ` | outside the supplier's `⊞`: R01 |
| `matrixBrownian_eigenvalues_strictAnti` | `n=0,1`; `d` constant; `β=2` | `n ≤ 1`: `StrictAnti` on at most one index holds; coincident `d`: AGZ Thm 4.3.2 allows the closed chamber; `IsBrownianReal` gives a.s. continuity, so "for all `t>0`" inside `∀ᵐ` is the source's `P(∀t>0 …)=1` | true as stated |
| `matrixBrownian_hydrodynamic_limit` | `t=0`; `Im z<0`; arbitrary coupling of `B n` | at `t=0` both sides are `∫(z−x)⁻¹dν`; integrand bounded by `1/|Im z|`, so every integral exists; lower half-plane by conjugation; convergence in probability needs no coupling; Lévy–Prokhorov is a metric on finite measures, so `μ t` is determined | true as stated, AGZ Prop 4.3.10 + Cor 4.3.11 |
| R01 time change | `Y(t)=e^(−t/2)λ(e^t−1)` | interaction factor `1`, noise factor `1`, extra drift `−Y/2` | repair statement correct |

**Sources (seeded sample, all seven targets).** Read in the authors' online copy (id `agz`,
fetched through the sources service from the third author's page; not in the roadmap's
manifest):

- Definition 4.3.1 — agz line 12521; Theorem 4.3.2 and (4.3.3) — lines 12556–12570, with the
  remark on coincident starts at 12573; Lemma 4.3.3 (`β ≥ 1`, open chamber, strong and weak
  uniqueness) — line 12588; Proposition 4.3.5 (closed chamber, open at `t>0`, continuity in the
  start) — lines 12952–12957; Proposition 4.3.10 with (4.3.23)–(4.3.25) — lines 13196–13220;
  Corollary 4.3.11 (`β = 1, 2`, real diagonal starts, almost sure convergence) — line 13224;
  Exercise 4.3.18 — line 13725; Appendix H — line 193. Hypotheses and conclusions agree with
  §§1.1, 2.1, 2.2, 3.1 after the order reversal of Convention 2.
- Tao §3.1 is "Brownian motion and Dyson Brownian motion" (cached author copy, contents line 33).

**Library declarations opened at the pins.** `ProbabilityTheory.IsPreBrownianReal`
(`Mathlib/Probability/BrownianMotion/Basic.lean:75`) and `IsBrownianReal` (`:302`, adds almost
sure continuity only, index `ℝ≥0`); `MeasureTheory.levyProkhorovDist`
(`Mathlib/MeasureTheory/Measure/LevyProkhorovMetric.lean:167`);
`Matrix.isHermitian_diagonal_of_self_adjoint` (`Mathlib/LinearAlgebra/Matrix/Hermitian.lean:177`);
`Matrix.spectralMeasure` (`TauCeti/Analysis/Matrix/SpectralMeasure.lean:115`, a
`ProbabilityMeasure ℝ`); `TauCeti.Probability.semicircleReal`
(`TauCeti/Probability/Distributions/Semicircle/LocationScale.lean:39`, centre and variance).

**Cross-roadmap citations resolved.** RandomMatrices on main: Conventions 4–5, §§1.1, 1.2,
3.1–3.3, 4.3, 5.1–5.3, 6.3, 7.1 all exist with the cited content; the same numbers hold at the
head of its open revision. StochasticCalculus at its open head (a new folder, earlier in the
merge order): S1.2 (line 893), S1.3 with `IsFilteredBrownian` (953), S3.2–S3.4 (1456–1559),
S4.1–S4.3 with the bracket rule (1778), S5.1 open-domain formula (1841), S5.5 vector Lévy
(1944), S9.1 vector coefficients and `IsStrongSolution` (2901), S9.2 Lyapunov nonexplosion
(2972), `timeMeasure` (line 50). `roadmaps resolve` and `overlaps` list nothing.

**Ownership.** No other open roadmap plans Dyson Brownian motion (`roadmaps grep` for the
object: this folder, RandomMatrices only). RandomMatrices on main still has Layer 10 (README
lines 1171–1246) with the same four targets; its open revision deletes that layer and names
this roadmap as owner (its README lines 39–42), and the description states that it merges
first. With that order there is one owner; this folder must not merge before that revision.
Main's §10.2 uses the unnormalized inner product `(β/2) Re tr(AB)` next to the normalized
equation; this roadmap's Convention 3 is the consistent one.

## Not verifiable

- Potters–Bouchaud chs. 8–9: the book is behind a paywall; no legal copy found (the sources
  cache has none). The chapter locators are cited for orientation only and no target rests on
  them alone.
- Printed page numbers of AGZ: the copy read is the authors' online version, whose pagination
  may differ from the printed book; the README cites by theorem number, which is unaffected.

## Source issues

- **Misprint** in agz at Exercise 4.3.18, printed page 275 of the online copy: the source says
  the hint is to use "Lemma 4.3.25", which does not exist; it should be equation (4.3.25);
  affects nothing.
- **Misprint** in agz at Corollary 4.3.11, printed page 265: the source says the first
  eigenvalue is evaluated at `T` and omits a closing bracket in the eigenvalue vector; it
  should be evaluated at `t`, with the bracket closed; affects nothing.
