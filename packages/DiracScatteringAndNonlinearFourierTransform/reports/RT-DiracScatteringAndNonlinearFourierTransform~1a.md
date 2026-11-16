<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18040#issuecomment-6907564057 -->
Red team round 1 pass a (claude) of 7aacc70

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The vector-valued fundamental theorem "to be built" is at the pins

   - Location: `packages/DiracScatteringAndNonlinearFourierTransform/README.md:234-238`, quoting: "only for
     real-valued maps. The vector-valued fundamental theorem needed in Layer 1 is built from the constancy
     theorem and the Lebesgue differentiation theorem below." Also the `*Needs:*` lines at `README.md:528-529`
     and `README.md:559-560`, which cite `VitaliFamily.ae_tendsto_average` for the same purpose.
   - Claim: for maps into a Banach space the pins give only the constancy theorem, so the absolute continuity
     of `t ↦ ∫ (P Y + F)` and its derivative almost everywhere (§1.2, used again in §1.3, §1.4, §6.3) must be
     built here from the Vitali differentiation theorem.
   - Witness: pinned Tau Ceti `IntervalIntegrable.absolutelyContinuousOnInterval_intervalIntegral'`
     (`TauCeti/MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean` line 240, any real normed
     space); pinned Mathlib `IntervalIntegrable.ae_hasDerivAt_integral`
     (`Mathlib/MeasureTheory/Integral/IntervalIntegral/LebesgueDifferentiationThm.lean` line 67, `f : ℝ → E`,
     `E` a real Banach space).
   - Repair (tested on the instance that needs it, the propagator equation of §1.3 in the infinite-dimensional
     space `E →L[𝕜] E`: neither declaration asks finite dimension; the Tau Ceti one asks a real normed space and
     a base point in the interval, the Mathlib one a complete real normed space):
     1. In "From Mathlib", replace the sentence quoted above by: "only for real-valued maps. For maps into a
        real Banach space, `IntervalIntegrable.ae_hasDerivAt_integral`
        (`MeasureTheory/Integral/IntervalIntegral/LebesgueDifferentiationThm.lean` line 67): if `f : ℝ → E` is
        interval integrable on `a..b`, then at almost every `x` between `a` and `b` and for every base point `c`
        between them, `t ↦ ∫_c^t f` has derivative `f(x)` at `x`. With the Tau Ceti statement below and the
        constancy theorem these are the two halves of the vector-valued fundamental theorem that Layer 1
        consumes."
     2. In "From Tau Ceti", add: "`IntervalIntegrable.absolutelyContinuousOnInterval_intervalIntegral'`
        (`MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean` line 240): for `f : ℝ → F`
        interval integrable on `a..b`, `F` a real normed space, and `c` between `a` and `b`, the indefinite
        integral `t ↦ ∫_c^t f` is absolutely continuous on the interval. §1.2 applies it to
        `s ↦ P(s)Y(s) + F(s)`."
     3. In the `*Needs:*` line of §1.2 replace `VitaliFamily.ae_tendsto_average` by Mathlib
        `IntervalIntegrable.ae_hasDerivAt_integral` and Tau Ceti
        `IntervalIntegrable.absolutelyContinuousOnInterval_intervalIntegral'`; in the `*Needs:*` line of §1.1
        replace `VitaliFamily.ae_tendsto_average` by `IntervalIntegrable.ae_hasDerivAt_integral` (the real case
        of the same theorem, which gives `v′ = βu` almost everywhere directly).
     4. In the Layer 1 "Dependencies" paragraph add "Tau Ceti's absolute continuity of vector-valued indefinite
        integrals (`MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean`) for §1.2".
     The statements of §1.1–§1.7 do not change.

2. **F02** (P3) A Check refers to a potential that the cited Checks do not contain

   - Location: `README.md:1832`, quoting: "Rectangular barrier `f = 0.7` on `[0, 1.3]`, the potential of §6.5's
     Checks".
   - Claim: §6.5's Checks treat the potential `f = 0.7 · 1_{[0, 1.3]}`.
   - Witness: §6.5's Checks (`README.md:1745-1759`) use the free case, a generic `f = c` on `[0, T]` and
     `f ≡ 1` on `[0, ∞)` (masses `0.537329, 0.443190, …` at `T = 0.5, 1, …`); `0.7`, `1.3` occur only in §4.1
     with the complex `c = 0.7 + 0.4i`.
   - Repair: replace "the potential of §6.5's Checks" by "an instance `c = 0.7`, `T = 1.3` of the compactly
     supported constant potential of §6.5's second Check". The numbers stand: I recomputed
     `Im m(i) = (1 + 0.3 τ/k)/(1 + 1.7 τ/k) = 0.5375` with `k = √1.49`, `τ = tanh(1.3k)`, and
     `2T − 2 log|E(T, i)| = 2.6 − 2 log 5.809 = −0.918`.

3. **F03** (P3) Supplier-contract rows that no target consumes

   - Location: `README.md:416-418` (`TauCeti.PhragmenLindelof.upper_half_plane_of_isBounded`),
     `README.md:245-246` (`Besicovitch.ae_tendsto_rnDeriv`), and the scope line `README.md:84` ("the half-plane
     Phragmén–Lindelöf principle for bounded functions").
   - Claim: these are contracts of the roadmap ("consumed as listed in the supplier contracts").
   - Witness: neither name occurs after the heading "How to read the build": no `*Needs:*` line, route or Check
     uses it (§2.7 uses Mathlib's `PhragmenLindelof.right_half_plane_of_bounded_on_real`; §2.4 uses
     `VitaliFamily.ae_tendsto_rnDeriv`).
   - Repair: delete the bullet at `README.md:416-418`, the words "and `Besicovitch.ae_tendsto_rnDeriv`
     (`MeasureTheory/Covering/Besicovitch.lean` line 1077)" at `README.md:244-245`, the clause "the half-plane
     Phragmén–Lindelöf principle for bounded functions," at `README.md:84`, and "Phragmén–Lindelöf" from the
     list of Tau Ceti modules in the Summary (`README.md:5-6`); Mathlib's Phragmén–Lindelöf row stays.

4. **F04** (P3) `*Needs:*` and Dependencies lines that omit inputs their routes use

   - Location and witness, three places:
     - `README.md:1860` (`*Needs:* §4.4, §6.5, §6.7; …`), while the route at `README.md:1851` uses
       `|E(T, x)| = |a(T, x) + b(T, x)| ≤ 2|a(T, x)|`, the dictionary of §4.1 with `|b| < |a|` on `ℝ` (§4.1);
     - `README.md:2512` (`*Needs:* §3.2, §5.2, §5.5, §9.4, §9.5`), while the route at `README.md:2506` uses
       `b/a = (E − iẼ)/(E + iẼ)`, the dictionary of §4.1;
     - `README.md:1219` (Layer 3 Dependencies: "Layer 1 (§1.3, §1.4, §1.6)"), while `README.md:1141` has
       `*Needs:* §1.2, §1.3, §1.4, §1.6` and §3.1 proves uniqueness of the fundamental system by §1.2.
   - Repair: `README.md:1860` → `*Needs:* §4.1, §4.4, §6.5, §6.7; …`; `README.md:2512` →
     `*Needs:* §3.2, §4.1, §5.2, §5.5, §9.4, §9.5`; `README.md:1219` → "Layer 1 (§1.2, §1.3, §1.4, §1.6)". No
     edge becomes a forward reference (§4.1 precedes Layers 6 and 9; Layer 9's Dependencies already list
     Layer 4).

One P2 (a supplier contract that says the pinned libraries lack what they have, so that Layer 1 plans to
rebuild it) and three P3. No mathematical statement of the README or of `Suggested.lean` was refuted.

## The pass: record

### `Suggested.lean` declarations (19; context: `noncomputable section`, no `variable` except `{q : ℝ → ℂ}` inside `namespace DiracFundamentalSystem`, no instance arguments)

| Declaration | Instances tried, values on each side | Result |
|---|---|---|
| `linear_caratheodory` | `a > b`: `Icc` empty, `ht₀` unsatisfiable. `P = 0, F = 0`: `Y ≡ y₀` both sides. `P = t^{−1/2}` on `[0,1]`, `E = ℝ`: `Y = y₀e^{2√t}`, integrand integrable. `Y₁ ≡ 0`, `Y₂ = 1_{(2,3)}` on `[0,1]`: `EqOn` on `Icc` holds, global equality would fail | true as typed; README §1.2 states the same over `ℝ` |
| `diracCoeff` | `−Ω(z − Q)` computed: `[[f, −z−g],[z−g, −f]]`; `q = 1+i`, `z = 0`: `[[1,−1],[−1,−1]]` | equals README |
| `IsDiracSolution` | free case from `(1,0)`: `(cos tz, sin tz)`; from `(0,1)`: `(−sin tz, cos tz)` | sign pinned |
| `DiracFundamentalSystem` | wrong model `ΩX′ = zX + QX`: `A(t,0) = e^{−ct}` against `e^{ct}`; excluded by `diracCoeff`. Values at `t < 0` free, and every theorem quantifies `t ≥ 0` | ok |
| `hermiteBiehler`, `hermiteBiehlerDirichlet` | free: `e^{−itz}`, `−ie^{−itz}`; `EẼ# − ẼE# = 2i(AD − BC) = 2i` | ok |
| `scatteringA`, `scatteringB` | free: `1`, `0`. Constant `q`, `z = 0`: `cosh(|q|T)`, `(q/|q|)sinh(|q|T)` (computed from `exp(TΩQ)`). `a′ = qe^{2izt}b#`, `b′ = qe^{2izt}a#` derived from `E′ = −izE + qE#` | `q` in lower left, as README |
| `IsResonanceFree` | `∃ T₀` may be taken large, so negative `t` never matter; free case: no zeros, every `s` | equals README §9.4 |
| `existsUnique_diracFundamentalSystem` | `q = 0`; `q = c`; uniqueness only at `t ≥ 0` | true |
| `nonlinear_plancherel` | `t = 0`: `a = 1`, `0 = 0`. Small `q`: `log|a| ≈ ½|b|²`, `∫|∫qe^{2ixs}|² = π∫|q|²`, so `π/2`. `q = 1` on `[0,1]`: `|a|² = 1 + sin²κ/κ²` from `a = e^{ix}(cos κ − ix sin κ/κ)`. `hq` is implied by `hq₂` on `[0,t]` (unused-hypothesis note, no change) | true, constant `π/2` |
| `exists_nonlinearFourier_plancherel` | `q = 0`: `F = 0`. `−log(1−|F|²) = 2log|a|` from `|a|²−|b|² = 1`; `|F − ρ₁| ≤ |ρ₂|(1−|ρ₁|²)/(1−|ρ₁||ρ₂|) ≤ 2|ρ₂|`, `‖ρ₂‖² ≤ π‖q‖²_{(T,∞)}`, giving `4π` | true |
| `IsSpectralMeasureOf` | free: `Im i = 1 = ∫P dx`. `β : ℝ` without `β ≥ 0`: a second pair `(β′, μ′)` would give `P[μ′] = (β−β′)y + P[μ]`, excluded by uniqueness of the representation of a nonnegative harmonic function, so `μ` is determined | determines `μ` |
| `paleyWienerFunction` | `φ = 1`: `2 sin(tz)/z`, `∫ = 4πt = 2π·2t` | ok |
| `exists_isSpectralMeasureOf` | on `ℝ`: `Im(−Ẽ/E) = (AD−BC)/|E|² = 1/|E|²`; `f = 1` on `[0,1]`: `m(i) = i/(1+√2 tanh√2) = 0.4432i` | true (limit point, declared gap) |
| `spectralMeasure_isometry` | free: Plancherel; `2dx` fails by a factor `2` | true |
| `spectralMeasure_unique` | polarise with `e^{iax}F ∈ PW_{t+|a|}`: `|F|²ν`, `|F|²μ` have equal characteristic functions; zeros of `sin(εx)/x` move with `ε` | true; `hν` not needed for truth (note) |
| `szego_condition` | free: `0 ≥ −2π log 2`. `|E| = |a+b| ≤ 2|a|`, `dΠ ≤ dx`, `log|a| ≥ 0`: `−π log 4 − π‖q‖²`. `f ≡ c`: `w = 0` on `(−c,c)`, hypothesis `MemLp` fails | true |
| `tendsto_truncation_of_isResonanceFree` | limit constant `(1/√w − iβ/√w̃)/(1/√w + iβ/√w̃)` with `Im β = −√(ww̃)`: denominator modulus² `1/w + 1/w̃ + 2 > 0`, so `a ≠ 0` on the disc. Compact support at `x = 0`: `(e^{2cT}+e^{−2cT}+2)/4 = cosh²cT`. `|Θ(t,s)| = |E(t,s)|` for real `f`, real `s` | consistent with §9.5–§9.6 |

Elaborated signatures: I did not run Lean (not permitted in this pass); I compared each of the 19 types in the
worker's `signatures.md` with its README statement. No binder is lost and nothing changed.

### README targets (55 read): values recomputed

| Target | Computed | Result |
|---|---|---|
| §1.1 | `α = 2, β = 1_{[0,1]}`: `2 + ∫₀^{min(t,1)}2e^s = 2e^{min(t,1)}`; `β = −1`: `0.5 > e^{−1}`; negative `α` allowed by the route | ok |
| §1.3 | `exp(B)exp(A) = [[1,1],[1,2]]`, reversed `[[2,1],[1,1]]` | ok |
| §1.4–§1.6 | `det(e^t[[1,t],[0,1]]) = e^{2t}`; `|e−1| ≤ e`; `exp∫₀ᵗ dr/(z−r) = z/(z−t)` | ok |
| §1.7 | `0.1e^{0.4} = 0.149`; `1 + (t−1)²` has derivative `2√(x−1)` | ok |
| §2.1 | `C(z)` bound proved from `1+x² ≤ 2(1+u²)(1+(x−u)²)`; Cayley: `(8/9)/(10/9) = 4/5`, `2/(5π)`; `(2/π)(−2π/3 + 5π/6) = 1/3`; dilation `λP[ν](λz)` | ok |
| §2.3 | `(a+y)²+y² ≤ 3(a²+y²)`; `5/2.0201 = 2.475`; supremum at `r = (1+√5)/2`, value `2.618`; aperture `max(2, 1+2α²)` | ok |
| §2.4–§2.8 | `1/2 − arctan(1/2)/π = 0.352`; `‖1/(z+i)‖² = π`, `|F(i)|² = 1/4`; `∫P² = 1/(2πy)`; `𝓕(1/(x+i))(w) = −2πie^{−2πw}`, `w > 0`; `O_{log|x+i|}(i) = 2` | ok |
| §3.1–§3.3 | Christoffel–Darboux derivative `(z − conj λ)M*M`; `M(1,0)` for `q = 1+i`: `[[3.5465, −1.3683],[−1.3683, 0.8099]]`, row sum `4.9148`; `|E|²−|E#|² = 4 Im z∫|Θ|²` | ok |
| §4.1–§4.5 | concatenation, translation, modulation, dilation derived from `W(s+τ) = D_sW_{q(s+·)}(τ)D_s⁻¹`; `a(1,±5i)`: `1.0934`, `237`; `b(1,−5i) = 2385`; two kicks: `cosh²c₂ − |e^{2izs}|²sinh²c₂`; Riccati `r′ = 2izr + conj q − qr²` | ok |
| §5.1–§5.6 | `log a(1,5i) = 0.0893`; `L(0.999) = 6.2151`, `0.3562 ≤ 0.7656`, `0.0943 ≤ 0.1292`; first-order bound `0.0108 + 0.4006·0.0813 = 0.0434` | ok |
| §6.1–§6.8 | `K = 1/π` for `z+i`; Weyl disc radius `1/sinh(2ty)` free; `−D/C = 0.5919i`, `−B/A = 0.3858i`; `m = (1+iκ)/z` for `f ≡ 1` from the decaying eigenvector, `Im m(i) = √2−1`, `1/|E(T,2)|² ∈ [1/2, 3/2]`, mean `√3/2`; `klDiv σ(2σ) = 1 − log 2` | ok |
| §7.1–§7.3 | `(√(1+ε)+1)/ε < 3`; `b_{10i}`: `0.2, 0.16, 0.1`; `θ′ = 2izθ + f(1−θ²)` | ok |
| §8.1–§8.9 | `γ(1) = 0.7426`; `D(t,λ,z₀) = iβE(λ)`, `E(conj z₀) = 2 conj β`, `K = |β|²/(πy)`; `|a|²−|b|² = det M/w`; `1.25, 0.75, ½log(5/3) = 0.2554, 0.9284`; determinant `2i cos Φ/√(ww̃)` | ok |
| §9.1–§9.6 | `t₁ = 0` reduces (9.1) to the dictionary; `sin θ₂cos(conj θ₁−Φ) − cos(θ₂−Φ)sin conj θ₁ = cos Φ sin(e+2iυ)`; `|a|²−|b|² = 1`; mean of `Ẽ/E`: `−iw ± √(w/w̃)sin Φ₀`; pigeonhole in §9.3 gives `1/(3m+1)`; `M_{−f} = ΩM_fΩ⁻¹`; zero of `Ẽ` at `−2ice^{−2ct}`; `|E(10,1/2)| = 6433` | ok |

## Dependency check

```
depcheck: 246 roadmaps, 2298 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Suppliers resolved at their current versions: AnalyticNumberTheoryPartI §0.23 (main),
OperatorTheory/UnboundedOperators §4.8 (UO-D07) (main), AutomorphicSpectralTheory §0.5 (open head, earlier in the
merge order). The declared gap `dirac-weyl-alternative` has the same slug in `design/plan.json` and in the README,
a named supplier and section, one precise sentence, and asks nothing the pins or an earlier roadmap state; it is
not raised.

## Verified sound

- Declarations read: 19 of 19 (every line of `Suggested.lean`); one `import Mathlib`, no `set_option`, no
  `lemma`, no sorry'd data, no `#` commands, a docstring on each. No padding: none follows in one tactic,
  restates a definition or mirrors a Check. The headline theorems the README names (§1.2, §3.1, §4.4,
  §5.4–§5.5, §6.5–§6.6, §6.8, §9.6) are all stated; none is forced through a stand-in.
- Targets read: 55 of 55 (every line of the README, 2587 lines); conventions recomputed in every layer that
  uses them (sign of `Q`, position of `q`, `π/2`, `P = Im z/(π|x−z|²)`, `μ` against `ν_F`, `λ = −z`).
- Checks tested: all 210 Check bullets read; those with a closed-form value (roughly half, the ones listed in
  the tables above among them) recomputed by hand to the digits shown; the quadrature and ODE-integration
  values were not rerun; none found false, vacuous or a restatement; every definition has at least three.
- Library citations: every backticked Mathlib and Tau Ceti declaration name of the README (about 105)
  resolved at the pins by grep, with its file and, where the README gives one, its line; all exist where
  cited; the statements of 16 Tau Ceti declarations read against the README's description of them.
- Locators verified: about 60 against the cached texts (poltoratski2024 23, mauth2022 15, romanov2014 8,
  denisov2006 5, taothiele2012 5, killipsimon2003 4, mnatsakanyan2022 3, denisov2026 1); each cited line
  holds the statement it is cited for.
- Sibling citations checked: 7 (the three suppliers above; AsymptoticExpansions §10.1, StochasticCalculus S6.5,
  OperatorTheory/ToeplitzOperators Layers 2–5 and PDE §6.2 as non-consumed or consumer references).
- Ownership: searched main and the open heads by object for de Branges spaces, Paley–Wiener spaces, outer
  functions, Fatou's theorem, nontangential maximal functions, Hermite–Biehler functions, meromorphic inner
  functions, half-plane Hardy space, Weyl functions, Carathéodory existence, integrable-kernel Grönwall,
  Liouville's formula, Szegő condition. No second owner; StochasticCalculus's signed Grönwall has a constant
  kernel and SchrodingerOperatorsAndSpectralTypes states no Dirac Weyl theory. No declaration of
  `Suggested.lean` has the fully qualified name of another roadmap's.
- Policy: the pull request changes only the package folder; no pull-request numbers or process narrative in
  the README or docstrings; every target has a locator.

## Not verifiable

- garnett2007, coddingtonlevinson1955, debranges1968, remling2018, krein1955: settled as uncertified or waived;
  their locators were not read.
- The analytic routes of §8.2–§8.8 and §9.3 (universality, Rouché step, the diagonal choices of `C(t)`, the
  covering argument): I checked every identity and constant they display and the logic of each step, but a
  complete verification of these estimates is the size of the source's proof and was not done.
- The numerical Checks obtained by quadrature or ODE integration (§3.1, §4.1, §4.2, §5.4, §6.4, §6.7, §8.9,
  §9.2, §9.4): the closed-form parts were recomputed; the twelve-digit integrations were not rerun.
- LeanSearch near-matches: the worker's `library-matches.md` records HTTP 429 for every docstring search; I
  replaced it by greps of the pins for each object (which found R01).

Source independence: 14 passages compared with 8 sources, none shared; largest share poltoratski2024, 71 of 188 locators; contents compared with poltoratski2024: independent (Layers 3, 6 split its §2, Layers 4–5 split its §5 and precede Layer 6, Layer 7 merges its §§3–4, Layer 8 merges its §§6–8; the order of §8.2–§8.9 is forced by the chain of `*Needs:*` lines §8.2 → §8.3 → §8.4 → §8.5 → §8.6 → §8.7 → §8.8).

## Source issues

- **Misprint** in poltoratski2024 at (5.5), line 545–548 of the cached text: the source says the `L¹` norm of `log|a(t,·)|` equals the squared `L²` norm of the potential; it should be `π/2` times it in the source's own normalisation; affects a stated result.
- **Misprint** in mauth2022 at (4), line 206–207: the source says the same identity with constant one; it should carry the factor `π/2`; affects a stated result.
- **Misprint** in poltoratski2024 at Lemma 8, (8.5), line 1116–1172: the source says the matched forms keep the factor `γ(ty)` of the hypothesis; it should be `γ(ty′)` with the matched height, as the determinant identity (2.2) forces; affects the proof.
- **Misprint** in mauth2022 at Lemma 45, (58), line 3251–3298: the source says the matched forms keep `γ(ty)`; it should be `γ(ty′)`; affects the proof.
- **Gap** in poltoratski2024 at Lemma 9, line 1350–1377: the source says the statement holds for all times of the dyadic interval; its proof uses Lemma 8, which asks `1 < ty`, so the times must be restricted to those with zeros below height `−1/t`; affects the proof.

## For the human reviewers

- **Scope.** The headline (§9.6) is conditional on resonance-free points; poltoratski2024 Theorem 1 (Annals 2024) is excluded (`README.md:127-136`) because mnatsakanyan2022 (line 9–13, 135–137) reports an error in an earlier arXiv version. Whether to plan the published theorem is yours.
- **Scope.** §8.8, §8.9 and §9.1–§9.3 feed no final target of this roadmap (§9.5–§9.6 need only §8.7 and §9.4); `README.md:2549-2550` names their consumer as a future proof that almost every point is resonance-free.
- **Licence.** poltoratski2024 was read as OCR of an image-only arXiv v14 scan (`sources.toml`, `version_note`); garbled formulas were cross-checked against mauth2022, an unrefereed arXiv thesis-style account (54 of 188 locators).
- **Not tested.** garnett2007 (10 locators, paywalled) and the four waived books were not read; wording and locators against them are unchecked.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7aacc703c85a275dd00e6fd8822d1f83c7cfdf08", "job": "RT-DiracScatteringAndNonlinearFourierTransform~1a", "model": "fable", "worker": "chris-x91"} -->
