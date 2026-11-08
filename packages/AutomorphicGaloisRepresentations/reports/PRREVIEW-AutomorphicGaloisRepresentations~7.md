# Review of AutomorphicGaloisRepresentations (pull request #1007 at f8d3cf8)

**Verdict:** needs changes

There is one P3 finding and nothing blocking. It comes from the rewrite of the `Suggested.lean` docstring that came with the repair of the previous R01. All three previous findings are repaired. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates; its only warning is the single `sorry`.

This is an incremental re-review of the 91 lines changed since 0ae744f. It checks the changed passages and anything that cites them, the gate, the elaboration, and the seeded sample where it falls in the changed passages.

## R01 (P3) — The docstring gives quaternionic level forms as the missing carrier for §§0.2e–0.3, but they can be defined at the pins

**Location:** `TauCetiRoadmap/AutomorphicGaloisRepresentations/Suggested.lean`, lines 23–28: "…are statements about the analytic and overconvergent quaternionic form spaces of README §§0.2a–0.2c and their Hecke operators, which need quaternionic level forms on the finite adelic units of a quaternion algebra".

**Claim:** For each headline that cannot be stated, the docstring must name the carrier that is missing. This sentence names the level forms `M_D(U,A)`, but those can be defined at the pins with a real body:
- the finite adelic units are `(FiniteAdeleRing (𝓞 F) F ⊗[F] D)ˣ`;
- their topology is given by `IsModuleTopology` (`Mathlib/Topology/Algebra/Module/ModuleTopology.lean:133`);
- the module of level forms is a 15-line `Submodule`.

The Fredholm side is also at the Tau Ceti pin:
- `ContinuousLinearMap.charPowerSeries` on (Pr) modules, `TauCeti/Analysis/Normed/Operator/Nonarchimedean/PrModule/Basic.lean:91`;
- `ContinuousLinearMap.fredholmDet`, `…/Nonarchimedean/FredholmDet.lean:84`;
- the `IsPrCompact` slope theory in `…/Nonarchimedean/Slopes.lean`.

What is actually missing is the analytic weight module `A_{κ,r}` of README §0.2a with its slash action of `Σ₀(ϖ_v^t)` on restricted power series, `h ↦ n(cz+d)ν(det γ)h((az+b)/(cz+d))`. Defining that action needs a theorem inside the definition: the substituted series must be restricted, and the action law must hold (Buzzard-Eigenvarieties lines 2583–2587, p. 72). Without it there are no analytic stages `M_D(U,A_{κ,r})`, and hence no `U_P`, `Θ_τ` or `H_κ` on them. The conclusion "not statable" stands; the reason given is wrong.

**Witness:** GL2AutomorphicRepresentationsAndTransfer's `Suggested.lean` at its open head, lines 275–295, defines `quaternionDiagonal` and `quaternionLevelForms` with real bodies on `FiniteAdeleRing (𝓞 F) F ⊗[F] D`. A scratch copy elaborates under `import Mathlib` at this roadmap's Mathlib pin without error.

**Repair:** Replace "which need quaternionic level forms on the finite adelic units of a quaternion algebra" with:

> which need the analytic weight modules `A_{κ,r}` of README §0.2a with the slash action of `Σ₀(ϖ_v^t)` by substitution into restricted power series, absent at these pins (the level forms themselves are definable on Mathlib's `FiniteAdeleRing`, and Tau Ceti has the Fredholm series of compact operators on (Pr) modules)

Keep "; its geometric realization theorems need Shimura cohomology" as it is.

**Tested:**
- The scratch level-form probe elaborates with no error, so the old reason is refuted.
- I grepped the pinned Mathlib and Tau Ceti for any matrix, Möbius or slash action on `PowerSeries.IsRestricted` or `MvPowerSeries.IsRestricted` series. None of the ten Tau Ceti files that use `IsRestricted` defines a substitution action, so the replacement names an object that really is absent.
- The rest of the paragraph holds: there are no p-adic period rings at the pins (grep for `BdR`/`Bcris`: none).

## Previous findings

- R01 — repaired: `Suggested.lean` declares only `ordinaryGoodPrimes` and `fixedSquarefreeForm_ordinary_density_one`. README line 645 reads "Suggested.lean states the ordinary-prime density theorem of §7.7…", and §§0.2e–0.2f carry no Lean names.
- R02 — repaired: README lines 809–813 read "For `|w|≤1` the same formula converges on all of `ℤ₂^×=1+2ℤ₂`, since `log(1+2ℤ₂)=4ℤ₂` (`v₂(log 3)=2`), but `log(−1)=0` makes it trivial on `−1`…".
- R03 — repaired: README lines 949–955 read "`u` acts by `N_{F/ℚ}(u)^w=±1` (§R17.3.8a) … `ε=1+√2` has norm `−1` and acts by `−1` when `w` is odd, while `ε²` acts by 1".

The rewritten docstring paragraph that came with the R01 repair is the subject of this report's R01. The previous report marked no finding "not actionable", so nothing is re-raised.

## Verified sound

### Gate, dependency check, Lean

- **Gate**, rerun on this head: every check is 0, then `OK`, exit 0. The summary line of the rerun omits `build`. The worker's gate at this head reports `build=0`, and my own elaboration (below) succeeds.
- **Files:** nothing changed outside the folder (`git diff --stat origin/main...HEAD` outside the folder is empty). The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- **Dependency check:** the output is `depcheck: 245 roadmaps, 2490 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0. Its only warning is `declaration uses 'sorry'` at line 72.
- **Pins:** the docstring's Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…` equal the `lake-manifest.json` revisions.
- **Signatures:** I ran `#check @` on both declarations in one scratch file.
  - `ordinaryGoodPrimes : {N : ℕ} → [NeZero N] → HeckeRing.GL2.Newform N 2 → Set (HeightOneSpectrum (𝓞 ℚ))`.
  - `fixedSquarefreeForm_ordinary_density_one` keeps `[NeZero N]`, `Squarefree N` and `f.χ = 1`.
  - No binder was lost, and both types agree with README §7.7 (lines 3713–3720). I changed nothing.
- **One-tactic probe** on the §7.7 theorem:
  - `simp` makes no progress;
  - `rfl` fails ("`ordinaryGoodPrimes f` is not definitionally equal to … 1");
  - `infer_instance` fails ("type class instance expected").

  It is not padding, and `ordinaryGoodPrimes` is the one definition it needs.
- **Form:** one module docstring, `namespace TauCetiRoadmap.AutomorphicGaloisRepresentations` and `theorem`. There is no `set_option`, `lemma`, `#eval` or sorry'd data. The imports are `Mathlib` plus `TauCeti.NumberTheory.ArithmeticDirichletSeries.NaturalDensity` (for `NumberField.Set.HasNaturalDensity`) and `TauCeti.NumberTheory.ModularForms.Newforms.Fields` (for `TauCeti.CoefficientField`); both are used.
- **Names:**
  - `roadmaps grep` finds the two names in no other roadmap.
  - It finds the three deleted names (`lt_of_slope_sum_le`, `bol_identity`, `eq_zero_of_intertwining_of_norm_lt`) nowhere on main or in any open roadmap, so nothing cited them.
  - The README contains none of them.

### Changed passages

- **Build paragraph** (README lines 645–649): it now names only the §7.7 statement, which is what the file states.
- **§0.2a dyadic Check** and **§0.2c unit Check:** computed in the table below.
- **§0.2c, `Ô_F^×` in the stabilisers:** GL2AutomorphicRepresentationsAndTransfer §R17.3.8b (open head, README line 1919) defines `Γ_i=U∩x_i⁻¹D^×x_i`. A global unit is central, so `x_i⁻¹ux_i=u∈D^×`, and `u∈Ô_F^×⊂U`. The scalar `diag(u_v,u_v)` has `c=0` and `d` a unit, so `Ô_F^×⊂Δ_P`.
- **§0.2e counting bound,** now with `⌊·⌋₊`:
  - I proved it. Put `m=⌊2h/v⌋₊` and `n=qH+r`. If `n≥H(m+2)`, then `2S(n)=q(H(q−1)+2r)≥(qH+r)(m+1)>n·2h/v`, so the hypothesis fails.
  - A brute-force check (`H≤5`, four values of `v`, 52 values of `h` from −3 to 9.75, `n<400`) finds no violation.
  - The integer floor would be false at `h<0`, so the change was needed.
- **§0.2f Bol's identity "as formal power series in `z` over any field":** it holds in characteristic 2 (table). The supplier contract (README lines 219–221: `PowerSeries.derivative`, `Nat.descFactorial`, `ContinuousLinearMap`) still describes the carriers of the prose statement.
- **§0.2f small-slope criterion** ("Neumann series on the complete target"): computed in the table below.

### Seeded source sample

Only 0.2a and 0.2c fall in the changed passages. The README marks no locator as unverified (a grep for "unverified" and "uncertified" finds nothing).

| Target | Source, lines, locator | Result |
|---|---|---|
| 0.2a | Buzzard-Eigenvarieties lines 2479–2584 (pp. 69–72), read in the previous report. The rewritten Check is a computation with no locator. | Supported |
| 0.2c | Buzzard-Eigenvarieties: overconvergent forms `L(U,A_{κ,r})`, lines 2601–2607 (p. 72). Stabilisers contain a finite-index subgroup of the units and act through a finite quotient, lines 2628–2632 (p. 73). Prop. 11.1, lines 2715–2727 (p. 75), with `U=U′×GL₂(O_p)` and `n` thickened to radius `r|π^{s+t}|`, matching the README's component `j_v⁻¹(GL₂(𝒪_v))` and radius `r|ϖ_v|^{s_v+t_v}`. Lemma 12.1, line 2842 (p. 78): Hecke equivariance. | Supported; the README's finite-image hypothesis is Buzzard's weight-space condition made explicit |

The other sampled targets (0.2b, 0.6, 1.3, 2.10, 3.1, 3.9, 3.11, 4.5, 4.11, 5.4, 6.8, 7.3, 7.4) are unchanged since 0ae744f and were not re-read in this incremental review. Of these, 1.3, 4.11 and 7.3 were verified in the previous report.

### Adversarial table

New rows, for the statements this head changes:

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §0.2a dyadic Check | `u=3`, `5`, `−1`; `w=1` | `v₂(log 3)=v₂(log 5)=2`, so `v₂(w log u)≥2>1` and `exp` converges. `exp(log 3)=−3` and `exp(log 5)=5` (agreement to `2^82` in a truncated 2-adic computation). `exp(log(−1))=exp 0=1`, while `u↦u` gives `−1`. | True |
| §0.2c unit Check | `ℚ(√2)`, `ε=1+√2`; `w=1,2`; `ε²`; `(w₁,w₂)=(2,0),(3,1)` | `N(ε)=1−2=−1`, so `ε` acts by `−1` at `w=1` and by `+1` at `w=2`. `ε²=3+2√2` has norm 1 and acts by 1. At `(2,0)`: `σ₁(ε)²=3+2√2≈5.83=N^0σ₁²`, of infinite order. At `(3,1)`: `σ₁³σ₂=−(3+2√2)=N·σ₁²`. | True |
| §0.2c stabilisers contain `𝒪_F^×` | `Γ_i=U∩x_i⁻¹D^×x_i` | A central `u` gives `x_i⁻¹ux_i=u`. The scalar has `c=0` and `d=u` a unit, so it lies in `Σ₀(ϖ^t)`. | True |
| §0.2e bound with `⌊·⌋₊` | `(H,v,h)=(2,1,1)`, `(3,1,2)`, `(1,1,½)`, `(2,1,−1)` | Largest `n`: 6<8; 15<18 (`S(15)=30=2·15`, `S(16)=35>32`); 2<3; 0<4. With the integer floor, `(2,1,−1)` would give bound 0 and `n=0` would violate it. Brute force: 0 violations. | True |
| §0.2f Bol over any field | `𝔽₂`, `j=0`, `r=2`; any ring, `j=r=1` | Over `𝔽₂` the right side is `(ad−bc)²·2·L⁻³=0`, and directly `D²(N²L⁻¹)=D(cN²L⁻²)=cN²(−2c)L⁻³=0`. For `j=r=1`: `D(N²L⁻²)=2NL⁻³(aL−cN)=2(ad−bc)NL⁻³`. | True |
| §0.2f small-slope criterion | `e_v=2`, `r_τ=1`; `v_p(μ)=¼`, `¾` | `|c/μ|=p^{−½+¼}=p^{−¼}<1`, so the Neumann series converges and `Θf=0`. At `¾`, `|c/μ|=p^{¼}>1`, outside the criterion, as the README's `e_v=2` Check says. | True |
| Docstring statability (§§0.2e–0.3) | level forms; `A_{κ,r}` action; Fredholm series | `quaternionLevelForms` elaborates at the pin. There is no slash action on restricted series at the pins. `charPowerSeries` and `fredholmDet` are at the Tau Ceti pin. | Conclusion true; reason false (R01) |

Rows carried forward from the previous report (PRREVIEW r6, at 0ae744f) for statements this head leaves untouched:

| Statement | Instances | Values on each side (previous report) | Result |
|---|---|---|---|
| Conventions `λ_p` | `E₄`; `2Δ`; `Δ(3τ)` | `a₂(E₄)=2160=9·240`. `a₂(2Δ)=−48=(−24)·2`. `Δ(3τ)` has `a₁=a₂=0` and `λ₂=−24`. | True |
| §1.7 attachment and rigidity | `E₄` at 2; `Δ(3τ)` against `E₄(3τ)`; `Δ` against `Δ(3τ)` | `X²−9X+8` has trace `9=λ₂`. The `λ₂` values are −24 and 9, so the hypothesis fails. The `λ_p` agree for `p≠3`, with `k=12` on both sides. | True |
| §0.1 | `ε_p`, `K=ℚ_p`, `ϖ=p` | `φ=1·p⁻¹=ν(p)=q⁻¹`. Conrad B.4(ii) gives `1·p⁻¹`. | True |
| §0.2a right action | `γ=diag(p,1)`, `δ=((1,0),(p,1))`, `z=1` | `(f|γ)|δ=f|γδ=f(p/(p+1))`; `f|δγ=f(p/(p²+1))`. | True |
| §0.2a scalars | `2I` at odd `p` | `2^k`, or `2^{k+2}` when `ν₀(u)=u`. | True |
| §0.2b | `p=3`, `s=1` | Three discs; `z=(a+3b)+9w′`. | True |
| §0.2c level/radius Check | `F=ℚ`, one class, degree `k` | `p^s(k+1)` on both sides. | True |
| §0.2c `C_U` | `N=5` | `(ℤ/5)^×/{±1}`, of order `2=φ(5)/2`. | True |
| §0.2d certificates | Buzzard p. 69; Jacobs p. 21 | `(Tφ)(c_i)=Σ_tφ(c_j)|(ux_t)`. | True |
| §0.2e Checks | `∏(1−p^jT)`; `exp(3w)−1`; `ℚ₃(√−3)` | `v_p(coeff_n)=n(n−1)/2`. Gauss norm `1/3`. `ζ₃∈1+ϖO`, `∉1+ϖ²O`. | True |
| §0.2f Checks | `ℚ`, `n=0`; `|nrd η|_f^{−r}` | `H=(1−pT)H′(pT)`, slope `1=r` excluded. `p^r`, `ℓ^r`, `ℓ^{2r}`. | True |
| §1.1 Check | `y²=x³−x` over `𝔽₁₇`, `p=3` | `a₁₇=2`. One 4-cycle on `ℙ¹(𝔽₃)`. | True |
| §1.3 Check | `n=3`, `r=2` | `|Γ₂|=648`. | True |
| §3.3a | 11a1 at 3 | `X²+X+3`, determinant 3. | True |
| §3.15 Check | `y²=x³−x` at 5 | `a₅=−2`; `−1±2i` has norm 5. | True |
| §4.11 line argument | `W=ρ|G_K⊗η⁻¹` | `t_H=t_N=0`, so the line is admissible. | True |
| §6.4a Check | ramified `p∈Σ` | `p²` against `p³`. | True |
| §6.7 Checks | 11a1 at `ℓ=7`, 19 | `a₇=−2`, unit root exists; `a₁₉=0`, none. | True |
| §6.11 Check | `p=3`, `Nv≡−1` | `{χ̄γ̄,γ̄}={−χ̄γ̄,−γ̄}`; the hypothesis is kept. | True |
| §7.3 | `Δ` at 2 | `|τ(2)|=24≤90.5`. | True |
| §7.7 and Lean | 11a1 at 3, 19, 11; CM | `−1∉(3)`, `0∈(19)`, `11∣11`. CM forms are excluded by squarefree level. | True |

### Library declarations opened at the pins

- **Mathlib:**
  - `PowerSeries.IsRestricted`, `Mathlib/RingTheory/PowerSeries/Restricted.lean:28`;
  - `IsModuleTopology`, `Mathlib/Topology/Algebra/Module/ModuleTopology.lean:133`;
  - `MvPowerSeries.IsRestricted` and `IsCompactOperator` (`#check`);
  - the Fredholm-operator files `Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean`, which cover index theory, not determinants.
- **Tau Ceti:**
  - `ContinuousLinearMap.fredholmDet`, `TauCeti/Analysis/Normed/Operator/Nonarchimedean/FredholmDet.lean:84`;
  - `charPowerSeries`, `…/Nonarchimedean/PrModule/Basic.lean:91`;
  - `IsPrCompact`, `TauCeti/Analysis/Normed/Operator/RowCompact/PrModule.lean:105`;
  - the slope results in `…/Nonarchimedean/Slopes.lean`;
  - `HeckeRing.GL2.Newform`, `TauCeti.CoefficientField` and `NumberField.Set.HasNaturalDensity`, by elaboration.

  The README consumes the Fredholm theory by citing its owner, CompactOperators on main, and does not restate it.

### Cross-roadmap citations resolved

- **GL2AutomorphicRepresentationsAndTransfer** (open head):
  - §R17.3.8a, "Global units", README lines 1820–1824: it gives `∏_σσ(u)^{n_σ+2s_σ}`, finite image exactly at parallel `n_σ+2s_σ`, and `N_{F/ℚ}(u)^w=±1`. This is the citation the new §0.2c Check makes.
  - §R17.3.8b: `Γ_i`, line 1919.
  - `Suggested.lean` lines 275–295, used as the witness of R01.
- **IntegralHeckeAndGaloisDeterminants** (open head): the resolver's two leads resolve. `Determinant.exists_realization_of_henselian` is at line 205 of its `Suggested.lean`, and `existsUnique_isCoefficientChange_of_compact` at line 366, inside `namespace Determinant`.
- The resolver reports no cross-roadmap citation found nowhere.

### Ownership and overlaps

- **Overlaps:** `overlaps.md` reports no open pull request changing this roadmap, no dropped id and no revision-only id.
- **Never-cite list:** a grep for each listed roadmap finds zero hits in the README.
- **Ownership:** the changed passages introduce no new owned object.
- **QuaternionicModularForms:** the overlap the previous report left to board level is unchanged by this head and is not raised here.

## Not verifiable

- **T. Saito, *Modular forms and p-adic Hodge theory*, Theorem 1 (`SaitoMFPH`):** recorded as uncertified (paywalled) and cited by its locator; that is settled.
- **Jacobs, equation (1.5.13), p. 19:** the extracted text loses the sign of the exponent of `(cz+d)`, as noted in the previous report. It is unchanged here and not in the changed passages.

## Source issues

- none
