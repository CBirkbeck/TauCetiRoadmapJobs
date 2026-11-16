<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18030#issuecomment-6906837943 -->
Review (claude) of 016483d

Verdict: accepted

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. Reviewed: `packages/CompressibleEulerEquations/README.md` (2406 lines),
`Suggested.lean` (574 lines, 22 definitions and structures, 15 `sorry` theorems),
`metadata.toml`, `sources.toml` (21 entries). No previous review of the package and no maintainer
notes exist for this round. No file of the package was changed; the sources manifest was not
added to (every cited work is already recorded).

## Findings

None.

## Verified sound

### 1. Principles

- General library: the carrier is a general quasilinear symmetric hyperbolic system
  (`QuasilinearSystem n N`, any `n`, `N`), a general smooth equation of state, every discrete
  period group. No route-specific restriction found; the barotropic case is a stated special case
  (§1.3, §7.2).
- Existing work is built on: LorentzianGeometry (acoustical form, causal curves and domains of
  dependence in subsets) and SymmetricHyperbolicSystems (linear carrier, pointwise identity) are
  cited by section, and each kept statement says how it differs (§3.2 limit curves, §3.3 openness
  and idempotence, §5.1, §5.2, §5.4, §8.4). Nothing of either is planned again.
- Single direction of supply: dependency check below, no UPWARD or CYCLE line.
- No copied passage, no algorithm, no sorry'd data, no `set_option` (searched both files).

### 2. Sources: the seeded sample

Every locator of the fifteen sampled targets that points into a readable text was opened at its
line. All 46 agree with the statement they support:

| Target | Locators opened | Result |
|---|---|---|
| 1.1 | ChristodoulouMiao2014 line 606 (eq. (1.24)); AbbresciaSpeck2022 lines 165–170 (eq. (1.3)); LuoYu2023a line 88 | sound speed `c² = ∂p/∂ρ` at fixed entropy; polytropic law with exponent in `(1, 3)`: agree |
| 1.2 | ChristodoulouMiao2014 lines 488, 529 (eqs. (1.4), (1.10)), 481–529, 818–822; LuoYu2023a line 84 (eq. (1.1)); AbbresciaSpeck2022 lines 158–164 (eqs. (1.1a)–(1.2)) | continuity and momentum equations, material field `B`, Galilean invariance: agree |
| 1.3 | ChristodoulouMiao2014 lines 833–838 (eqs. (2.1)–(2.3)), 530–544; AbbresciaSpeck2022 lines 158–160 | full system with `Bs = 0`; constant entropy propagates: agree |
| 3.3 | Minguzzi2019 lines 3576–3582 (Def. 3.1, Rem. 3.2), 1917 (§2.11), 3718 (Prop. 3.16, eq. (3.1)); MinguzziCone2019 lines 1737–1740 (Def. 2.17); BarGinouxPfaffle2007 line 1006 (Def. 1.3.5); Chrusciel2011 lines 1169 (§2.5), 1843–1848 (§2.9), 1859; ChristodoulouMiao2014 lines 866–872; LuoYu2023b lines 417–419 | each is what the README says it is, including the distinctions drawn (piecewise `C¹` curves; closed achronal `S`; two-sided `D(S)`; timelike variant `D⁺_I` against the causal one): agree |
| 4.2 | LukNotes line 1210 (Thm 5.5) | `H^s ⊆ L^∞` for `s > n/2` on `ℝⁿ`: agree |
| 5.1 | LukNotes line 679 (Prop. 4.1) | conserved energy of the wave equation: agree |
| 5.2, 6.1 | LukNotes line 724 (Prop. 4.4); EperonReallSbierski2019 line 1178 (Prop. 4.63); BarGinouxPfaffle2007 lines 3664–3668 (Thm 3.2.11) | monotone energy on backward cones; local uniqueness of developments, quoting the standard literature; linear wave Cauchy problem: agree |
| 5.3, 7.1 | LukNotes lines 1239 (Thm 6.1), 1620 (Thm 6.10), 1612 (Lemma 6.8) | local existence, uniqueness and continuous dependence; breakdown criteria; composition estimate with `F(0) = 0`: agree |
| 5.4 | LukNotes line 1158 (Thm 5.3) | linear existence by a duality argument (the proof starts from the image of the adjoint): agree |
| 8.1 | ChristodoulouMiao2014 lines 864–880; Christodoulou2019 lines 130–138; LuoYu2023b lines 417–419, 910 (Def. 2.13); EperonReallSbierski2019 lines 1129–1144 | development, maximal development, regular null part of the boundary, domain of dependence of half-space data: agree |
| 8.2 | EperonReallSbierski2019 lines 767 (Thm 3.45), 1195–1210, 1338 (Cor. 4.68), 1342 (Cor. 4.69); AbbresciaSpeck2022 lines 408–414; ChristodoulouMiao2014 lines 872–880 | two developments differing at a common point; disconnected intersection; global solutions unique; the source claim that the README declares false is at the cited lines: agree |
| 8.3 | ChristodoulouMiao2014 lines 866–872; AbbresciaSpeck2022 lines 175–179; LuoYu2023b lines 417–419 | local existence of a development; non-vacuum `H³` data: agree |

Outside the sample, also opened: Nirenberg1959 line 318 (the interpolation theorem; with
`m = k`, `j = i`, `q = ∞`, `r = 2`, `a = i/k` its exponent relation gives `1/p = i/(2k)`, the
README's `L^{2k/i}`); LukSpeck2018 lines 1999–2008 (eqs. (3.3.10a)–(3.3.10b), the normalisation
`c⁻²g`); ChristodoulouMiao2014 lines 672–676, 685; Speck2016 §1.11 exists in its contents.

The author flagged no locator as unverified. 7.3 cites only Kato1975 (see `## Not verifiable`).

### 3. Adversarial pass

Values were recomputed independently (closed form or numerical quadrature).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 sound speed | `p = ρ²/2` at `ρ = 4`; `p = ρ²` at `1/2`; `P = e^sρ²` at `(1, 0)`; Chaplygin `−A/ρ`; `p = −ρ²` | `c = 2`; `c = 1`; `∂_ρP = 2`, `c = √2`; `p′ = A/ρ² > 0`; `p′ = −2ρ < 0` (rejected) | agree | none |
| §1.2 expanding flow and boost | `n = 1`, `t = 1`; boost `w = 1` | `∂_tρ = −ρ₀/4`, `∂_x(ρv) = ρ₀/4`; momentum `−x/4 + x/4 = 0`; correct boost residual `0`, wrong rule residual `−1/(1+t) = −1/2` | agree | none |
| §1.3 static entropy wave | `P = e^sρ²`, `s = x`, `ρ = e^{−x/2}` | `P ≡ 1`, all three equations `0 = 0`; truncated momentum term `−e^{x/2}` | agree | none |
| §2.2 symmetriser (supports §7.2, Layer 8) | `n = 1`, `ρ = 1`, `c = 2`, `v = 3`; full system at `(1, 0)` | roots of `det(A¹ − λA⁰)`: `1, 5`; `S` minors `2, 2, 2`; `S·M = [[6,2,3],[2,3,1],[3,1,4.5]]`, symmetric | agree | none |
| §3.3 domains of dependence | constant field; field `(1, x²)` through `(1/2, −4)`; point datum `{(1, 0)}`; expanding flow; field `(1, x²)` on `H₀`, `S = Σ₀` | `x(s) = 1/(1/4 − s)`, blows up at `s = 1/4`; `D⁺ = S` for the point datum; boundary `2√(1+t) − (1+t)` is `0.8284` at `t = 1`, `0` at `t = 3`, with `ẋ = v − c = −0.2929`; `D⁺ = {t < π/2 + arctan x}`, open | agree; openness holds on the unbounded-field instance | none |
| §3.3 idempotence, past-closed restriction | first-exit argument redone with `a = t₀` and `a > t₀` | an extension from a point of `D⁺` with `a > t₀` stays in `D⁺` (relative openness), so the only exit is a limit point outside; contradiction as stated | sound | none |
| §4.1 norm (definition used by §7) | `k = 0`; `n = 2`, `k = 2`, `u = e^{−|x|²}` | at `k = 0` the value is `∫_F|u|²`; `∫u² = 0.5π`, `∫|∇u|² = π`, multi-index Hessian sum `3.5π`, operator-norm Hessian `3.0827π = (2 + 8e^{−2})π`; totals `5π` against `4.5827π` | agree | none |
| §4.2 embedding, interpolation | `u = e^{−x²}` on `ℝ`; dilations | `‖u‖₂² = ‖u′‖₂² = 1.2533`, `‖u″‖₂² = 3.7599`; `2.507 ≤ 2.803`; additive form `1.1195 ≤ 2.9467`; wrong pairs scale as `λ^{1/2}` against `λ^{1/6}` and `λ⁰` | agree | none |
| §5.1 energy identity | `B = bI`; `A⁰ = √(1+x²)`, `W = (1+x²)^{−1/2}`; Jordan block | `E = e^{−2bt}E(0)`; `‖W‖₂² = π`, `‖∂ₓW‖₂² = π/8 = 0.3927`, `∫A⁰W² = 2 asinh R → ∞`; `(g − tf′, f)` solves the system | agree | none |
| §5.2 weights | transport `a = 1` with slopes `1`, `1/2`; Euler sound cone; periodised cone; speed against cone | `−1 − sign x ≤ 0`; `+1/2` for `x < 0`, supports `(−1.1, −0.1)` and `|x| < 0.55` meet; sound cone gives `0`; `ζ₀ + w·ζ′ = M ≥ M|e|`; `(1/2, 1)` dominates although `1/2` is no speed | agree | none |
| §5.3 `Hᵏ` estimates | Burgers; forcing example at `m = 3` | `d/dt‖u_x‖² = −∫u_x³`; `S₃ = 185.18 ≥ π·81/3 = 84.82`; `C₁ ≥ √(2/3)m²` | agree | none |
| §5.4 linear existence | `A⁰ = e^{sin x}`, `A¹ = M`, `W(0) = sin x + sin 2x` | `dE₂/dt / M = 22π`; `∫w², ∫w′², ∫w″² = 2π, 5π, 17π` | agree | none |
| §6.1 `QuasilinearSystem.eqOn_lens` | `t₁ = t₂`; `t₁ > t₂`; `N = 0`; non-periodic pair with `Λ = ℤ`, `φ = 1 − t` | lens equals base (conclusion is the hypothesis); empty lens; trivial; `u = g(t + 1/x)` has `u_t + x²u_x = 0`, vanishes at `t = 0`, value `g(0.6)` at `(0.9, −10/3)`: the periodicity hypotheses `hper₁`, `hper₂` exclude it | true as stated; non-differentiability points and the faces `t = t₁, t₂` are null, where `fderiv = 0` satisfies the condition | none |
| §6.2 `QuasilinearSystem.eqOn_causalPast` | `t_p = t₀`; unbounded field of `U₂`; Burgers with zero data | `J⁻ = {p}`, `p ∈ {t₀} × S`, hypothesis gives equality; only `U₁`'s cones enter (the difference bound needs `∂U₂` bounded on the compact past only) | true as stated | none |
| §7.1 `QuasilinearSystem.localWellPosedness` | `M < 0`; `Λ = ⊥`; `F ≡ 1`; Burgers `−e^{−λ²x²}` | `ofReal M = 0` forces `U₀ ≡ Ū` (continuous), solved by the constant; `T* = 1.1658/λ` (`0.11658` at `λ = 10`), `‖u₀″‖₂² = 3759.9` at `λ = 10`: `T` must depend on `M`, as stated; quantifier order `∃ T R, ∀ U₀` | true as stated | none |
| §7.1 continuation | `∫‖∇U‖_∞`-parse; restart argument | hypothesis elaborates as `(∫⁻ t, ⨆ x, ‖·‖ₑ) < ⊤`; uniform time `T(M, K ∪ {Ū})` restarts before `T` | true as stated | none |
| §7.2 `EquationOfState.localWellPosedness` and continuation | `L = ∅`; `r < 0`; unbounded velocity in the continuation | no datum (vacuous, `E` nonempty); `r/2 < 0 < ρ`; `‖v‖_∞` is bounded on `[t₀, t₀+T)` by Grönwall from `|∂_tv| ≤ ‖v‖_∞‖∇v‖_∞ + C‖∇(ρ, s)‖_∞`, so the compactness hypothesis on `(ρ, s)` alone suffices; simple wave `T* = 1.1658` | true as stated | none |
| §7.3 uniformly local data | compactness example; switched system; cone `(1, 3)` | hitting times `0.0721, 0.00365, 0.0000484` at `x = 0, 10, 100`; added symbol entry `ζ₀ ≥ (c − |w|)|ζ′|`; at `ζ = (−2, 1)`: `1 ≥ 1` and `ζ₀ = −2 < 0` | agree | none |
| §8.1 development | `S = ∅`; truncation at `T = t₀`; lemma `J⁻_{D′}(p) ⊆ D` | `D⁺_D(∅) = ∅`; empty truncation is no development; first exit at `a ≥ t₀` gives a past-inextendible curve in `D` on `(a, t_p]` missing the data | agree | none |
| §8.2 `maximalCommonDevelopment`, `compatible_iff`, `exists_maximal_development` | the four clauses rederived from §6.2 and the lemma of §8.1; counter-flow | `J⁻_{D₁}(p) ⊆ D ⊆ D₂` for a development below both; `W₁₂ = W₂₁` through `W₁₂` being below `(D₂, U₂)`; in the counter-flow `W₁₂ = D₁ ∩ D₂ ∩ {t < 1}` | true as stated | none |
| §8.2 `isGreatest_development_of_solution` | unbounded field of `U_*` | `U′ = U_*` on `D` by §6.2 with `O = H_{t₀}`; a `U_*`-curve leaving `D` at `a > t₀` contradicts `D = D⁺_D`; no bound needed | true as stated | none |
| §8.2 `exists_incompatible_developments` | the Lean data: `quadraticLaw`, `n = 1`, `Λ = ⊥`, `S = {x < −1} ∪ {x > 1}` | `c = √(2·1/2) = 1`; left curves have `ẋ ∈ [1, 3]`, right `ẋ ∈ [−3, −1]`; `T_L ∩ T_R ⊆ {t > 1}`, so the two pieces of `D₁` are disjoint and relatively open; `(2, 0) ∈ D₁ ∩ D₂`, `v₁ = 2`, `v₂ = −2`; the `if x 0 < 0` datum is `2` on `x < −1`, `−2` on `x > 1` | true as stated | none |
| §8.3 `isDevelopment_slab`, `slab_subset_of_maximal` | `U` not periodic off `D⁺_O`; `T > 0` | `U = U_λ` on `D⁺_O` by §6.2 with `D = O`; a `U_λ`-causal curve from `p ∈ D⁺_O` stays there, so `D⁺_O ⊆ D⁺_O − λ` for every `λ`, hence invariance; for `S = E`, `J⁻_D(p) ⊆ {t ≤ t_p} ⊆ O` gives compatibility | true as stated | none |
| §8.4 `boundary_futureCausal`, `boundary_null` | `∇φ(q) = 0`; truncation top; expanding flow at `t = 1`; lens with `M = 5` and `M = 1.05` | (a): a failing inequality gives a past timelike `X` with `dφ(q)(X) > 0`, also when `∇φ = 0`; top `φ = t − T`: `1 ≥ 0`; flow: `0.2929 + 0.4142 = 0.7071 = c|∂ₓφ|`; `(−100, −400)` has `φ = 260`, `ψ > 0`; with `M = 1.05`: `|x| < 18.2ε`; `c̃(q) > 0` because `q ∈ N` lies in the domain of `Ũ` | true as stated | none |

Context check (statement 2 of the pass): the file has one section variable, `{n : ℕ}`
(`Suggested.lean` line 156), and `{n N : ℕ}` inside `namespace QuasilinearSystem`; every theorem
carries `[NeZero n]`, `[DiscreteTopology Λ]` and its hypotheses in its own signature. Each
of the 37 declarations was compared with its README statement in the source, and the elaborated
types of `scratch/signatures.md` were read for the definitions of Layers 4 and 6 and for the two
continuation theorems: nothing lost, no change.

Generality: README and Lean agree for all 15 theorems (relatively open domains, `Λ`-periodicity
where the README asks it, uniqueness on `[0, T)` for §7.1 and on the closed slab for §7.2, the
continuation hypotheses, `S = E` in `slab_subset_of_maximal`).

### 4. Duplication audit

- Pinned libraries: 66 file-and-line locators of the supplier contracts were opened at the pins
  and every one lands on the named declaration (Mathlib 24, Tau Ceti 42), for instance
  `Matrix.PosDef` (`Mathlib/LinearAlgebra/Matrix/PosDef.lean:176`),
  `zorn_le_nonempty₀` (`Mathlib/Order/Zorn.lean:126`), `MeasureTheory.IsAddFundamentalDomain`
  (`Mathlib/MeasureTheory/Group/FundamentalDomain.lean:59`), `TauCeti.HasWeakLineDerivOn`
  (`TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:212`, arguments `μ Ω u u′ v`, the order
  `Suggested.lean` uses), `TauCeti.Wkp.toZeroAtInfty`
  (`TauCeti/Analysis/Sobolev/BesselPotential/Embedding.lean:194`),
  `TauCeti.le_mul_exp_of_le_add_mul_integral` (`TauCeti/Analysis/ODE/Gronwall.lean:59`). The
  Mathlib names were also elaborated with `#check` (no error); the Tau Ceti namespaces were read
  in the source. `TauCeti.CircleSobolev.weight` is `(1 + |n|)^s`, as the §4.1 Check uses.
- `library-matches.md`: the one same-name hit is a sheaf-theoretic `compatible_iff`, unrelated;
  the other leads read (Zorn and maximality lemmas, order notions) are inputs, not the targets.
  The objects were also searched at the pins: no causal curve, domain of dependence, quasilinear
  system, periodic Sobolev space on `E`, Friedrichs lemma or Moser product estimate exists there
  (Tau Ceti's `TauCeti/Analysis/Calculus/Moser.lean` is the Moser deformation of symplectic
  forms, and its Gagliardo–Slobodeckij files are the fractional seminorm on the circle).
- Cross-roadmap citations resolved at the cited heads: LorentzianGeometry §6.1 (`minkowskiForm`),
  §6.3, §7.3, §8.2, §8.3, §9.2, §11.4, §12.6 (`TimeOrientedLorentzianFieldOn`,
  `IsFutureCausalCurveIn`, `IsPastInextendibleIn`, `futureDomainOfDependenceIn`,
  `futureDomainOfDependenceIn_self`, the time-function, slab, determination and covering
  statements), §12.7; SymmetricHyperbolicSystems Conventions (*Propagation speed*), §1.2
  (`LinearSystem`, `LinearSystem.apply`, `LinearSystem.IsSymmetricHyperbolic`), §2.1, §2.2, §2.3,
  §7.3; PDE §1.3, §1.4, §7.1–§7.3 on main; ComplexKahlerGeometry §5.7 on main;
  MathematicalStatisticsNonparametric §6.2; RelativisticQuantumFieldTheory RQFT1. Each says what
  the README attributes to it. No declaration of `Suggested.lean` has the fully qualified name of
  a declaration of a roadmap read (the namespaces differ).
- `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, no
  second copy. The 16 leads of `scratch/citations.md` are this roadmap's own declarations (all
  declared in `Suggested.lean`) and SymmetricHyperbolicSystems'
  `LinearSystem.IsSymmetricHyperbolic` (declared at its head).

Overlap check: read LorentzianGeometry, SymmetricHyperbolicSystems, IncompressibleFlows, PDE (main and its open revision), RelativisticQuantumFieldTheory, SobolevPolynomialApproximation, YangMillsConnectionsAndCaloricGauge; acoustical form, causal curves and domains of dependence in subsets: LorentzianGeometry (cited, restated in Lean only in the time-parametrised form §12.6 reduces to); linear system carrier and pointwise energy identity: SymmetricHyperbolicSystems (cited); periodic Sobolev spaces of the unit torus: IncompressibleFlows Layer 0 and PDE §7.2 (full-rank case only, not consumed; `Hᵏ_Λ` for period groups of every rank is owned here); nothing else shared.

### 5. Supplier-order audit

    depcheck: 242 roadmaps, 2261 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. LorentzianGeometry and SymmetricHyperbolicSystems are open
pull requests that add new roadmap folders, which the brief admits as suppliers; the roadmaps on
the never-cite list are not cited as suppliers (IncompressibleFlows is not named). Every
`*Needs:*` line was read against its section; the declared supplier gaps are none, and none is
hidden: each input is a pinned declaration, a section of the two suppliers that exists at its
head, or a target here.

### 6. Shape and completeness

- README shape: summary, scope and ownership, conventions, supplier contracts, build paragraph,
  eight layers each ending with Examples and Dependencies, downstream consumers, worked examples,
  references. Every definition has its API and at least three Checks; every theorem its
  hypotheses and locator. No LaTeX delimiters, no pull-request numbers, dates, anchors or machine
  paths; `lemma` occurs only in "Friedrichs' lemma", "Zorn's lemma" and source names.
- Organisation: the layers are named by their mathematics and ordered by their dependency lines
  (Layer 3 parallel to 4–5; 6 needs 2, 3, 5; 7 needs 4–6; 8 needs 6–7).
- Lean form: `lake env lean` on `Suggested.lean` from the content repository succeeds; the only
  diagnostics are 15 `declaration uses sorry` warnings, one per theorem. Imports: `import Mathlib`
  and `TauCeti.Analysis.Sobolev.WeakDeriv.Basic` (used by `IsWeakDerivFamily`). No sorry'd data,
  no `set_option`, no `#eval`/`#print`/`#synth`, `theorem` throughout, a docstring on every
  declaration.

### 7. Headline theorems and padding

Headlines of the README (summary and build paragraph), all stated: `QuasilinearSystem.eqOn_lens`,
`QuasilinearSystem.eqOn_causalPast`, `QuasilinearSystem.localWellPosedness`,
`QuasilinearSystem.exists_extension_of_lintegral_lt_top`, `EquationOfState.localWellPosedness`,
`EquationOfState.exists_extension_of_lintegral_lt_top`,
`EquationOfState.maximalCommonDevelopment`, `EquationOfState.compatible_iff`,
`EquationOfState.exists_maximal_development`,
`EquationOfState.isGreatest_development_of_solution`, `exists_incompatible_developments`,
`EquationOfState.isDevelopment_slab`, `EquationOfState.slab_subset_of_maximal`,
`EquationOfState.boundary_futureCausal`, `EquationOfState.boundary_null`. None is absent and
none is a stand-in; the module docstring says so.

One-tactic probe, on a scratch copy, of all 15 theorems with
`first | rfl | simp | infer_instance | trivial | tauto | (intros; simp_all)`: 15 errors, none
closes. No declaration restates a definition or mirrors a Check. The counterexample
`exists_incompatible_developments` is a headline of the summary and needs the construction of two
developments; `quadraticLaw` is the one definition it needs, with a proved body. Every definition
is used by a stated theorem. Every backticked name the README attributes to this roadmap is
declared in `Suggested.lean`.

### 8. Copyright, licences and scope

Wording: eleven passages of README and docstring prose were set beside their sources (the
definition of a development against ChristodoulouMiao2014 lines 864–872; entropy propagation
against lines 530–544; the domain of dependence against Minguzzi2019 lines 3576–3578,
MinguzziCone2019 lines 1737–1740 and BarGinouxPfaffle2007 lines 1006–1008; the embedding and the
composition estimate against LukNotes lines 1210–1212 and 1612–1615; the non-uniqueness paragraph
against EperonReallSbierski2019 lines 1195–1210 and AbbresciaSpeck2022 lines 408–414; the regular
boundary against Christodoulou2019 lines 130–138; the equation-of-state paragraph against
AbbresciaSpeck2022 lines 165–171). The longest shared run is a defining clause of under a dozen
words that the mathematics forces. No table, figure, list of examples or data is taken over.

Arrangement: 109 source citations in the body; Majda1984 and ChristodoulouMiao2014 have 17 each.
The contents of ChristodoulouMiao2014 (lines 339–373: fluids and wave equations, geometric
construction, acoustical structure equations, acoustical curvature, energy estimate, commutation
fields, …) were set beside Layers 1–8: no run of layers or sections corresponds. Majda1984 could
not be read.

Source independence: 11 passages compared with 8 sources, none shared; largest share Majda1984 and ChristodoulouMiao2014, 17 of 109 locators each; contents compared with ChristodoulouMiao2014: independent; the text and contents of Majda1984 (uncertified) could not be read.

## Not verifiable

- Majda1984 (17 citations: Ch. 2 §2.1, §2.2, §2.3, Theorem 2.1), Kato1975 (Theorem I, 4
  citations), Dafermos2016 (Ch. V §5.1, Theorem 5.1.1): recorded as uncertified in the manifest,
  cited by locator, text not read. Two doubts could not be settled without the texts and are
  passed to the human reviewers below: the section number `§2.3` of Majda1984, and the single
  locator `Theorem I` of Kato1975 used for four different statements.
- Christodoulou2007, HawkingEllis1973, Friedrichs1954, ONeill1983: waived in the manifest, cited
  by chapter, section or page range, text not read.
- The Tau Ceti declarations other than those of `TauCeti.Analysis.Sobolev.WeakDeriv.Basic` were
  checked by reading the pinned source at the cited lines, not by elaboration: their object files
  are not built on this worker, and the brief allows building only the modules `Suggested.lean`
  imports.
- Ownership against open pull requests was checked through the roadmap index (454 open pull
  requests at their heads); the list of 236 in the scratch directory does not name
  LorentzianGeometry or SymmetricHyperbolicSystems, whose heads were read with `roadmaps show`.

## Source issues

- **Gap** in ChristodoulouMiao2014 at §2.1.2, lines 872–880 (printed pages 24–25): the source says local uniqueness makes any two developments agree on their common domain, so the union of all developments is the unique maximal one; it should be agreement on the largest common development only, which can be smaller than the intersection; affects a stated result.

## For the human reviewers

- **Not tested.** Majda1984 ties for the largest share of locators (17 of 109) and is paywalled: its wording and contents were not compared with Layers 4–7 (`packages/CompressibleEulerEquations/sources.toml`, entry `Majda1984`).
- **Not tested.** `README.md` lines 1453, 1656 and 1750 cite Majda1984 §2.3 for localised energies and uniqueness on domains of dependence; a bookseller's contents listing, seen only through a search summary, titles §2.3 "Uniformly local Sobolev spaces".
- **Not tested.** `README.md` lines 1590, 1829, 1961 and 2177 cite the one locator "Kato1975, Theorem I" for linear existence, quasilinear well-posedness, uniformly local data and the slab; the paywalled text could not be opened to tell which theorem states which.
- **Licence.** LukNotes is an undated set of lecture notes on its author's university page (`sources.toml`, `licence_class = "author-page"`), cited eight times as a second source beside Majda1984 and Kato1975.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "016483dc2662e275bae18dffb57e3df53de48257", "job": "REV-PKG-CompressibleEulerEquations", "model": "fable", "worker": "chris-x80"} -->
