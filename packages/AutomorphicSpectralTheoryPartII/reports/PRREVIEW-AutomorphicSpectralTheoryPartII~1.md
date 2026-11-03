# Review of AutomorphicSpectralTheoryPartII (pull request #1761 at 4d41437)

**Verdict:** accepted

Gate at this head (worker's run, re-run of the dependency check by me): every text scanner passes, `depcheck: 204 roadmaps, 1640 edges, 0 problem(s)`, no UPWARD or CYCLE line, targeted build succeeds with `sorry` as the only warning. No P1 or P2 finding; six P3 notes, the first of which is the settled board item F09 (transfer ownership is a maintainer decision outside this folder) recorded here for the human approver. The mathematics of the README and of `Suggested.lean` checked out at every sampled locator and in the adversarial pass below.

## R01 (P3) — BPLZZ Prop 4.8 (transfer-preserving multipliers) has no owner between this roadmap and its consumer (settled F09, not re-raised)

Location: `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/README.md`, Scope and ownership, sixth paragraph: "Its §6.4 application needs a separate theorem that base-change-compatible multipliers preserve smooth transfer (BPLZZ §4.2, Proposition 4.8 …). That theorem is outside this Part II's scope and belongs with the relative comparison".

Claim: GanGrossPrasadUnitaryGroups §6.4 owns the theorem that base-change-compatible T-multipliers preserve smooth transfer.

Witness: GanGrossPrasadUnitaryGroups at its open head (pull request #1404), Exact supplier contracts, `gap:spectral-isolation`: "Supply normalized Schwartz multipliers isolating a prescribed GL cuspidal datum and the unitary cuspidal base-change classes, preserving transfer and the exact local support conditions. AutomorphicSpectralTheory owns this theory as a requested continuation of its §6.3". So the consumer declares the whole package, transfer preservation included, as a gap on AutomorphicSpectralTheory, whose scope (this README, Scope paragraph 1) stops before the Schwartz multiplier theorem. Each roadmap points at the other; nobody states BPLZZ Prop 4.8 (bplzz line 1685: pure-tensor Schwartz tests with matching orbital integrals, `μ_V = bc_V(μ′)`, then `μ′⋆f′` and `μ_V⋆f_V` are smooth transfers).

Settled: this is item F09 of the round-2 repair report (`FIX-PKG-AutomorphicSpectralTheoryPartII~2`), marked not actionable in this package because the consumer's contract and the merge-order position (GanGrossPrasadUnitaryGroups before this roadmap) are outside this folder; the present Scope sentence is the wording that review asked for, and later reviews left it settled. The reason holds, so this is not re-raised and not blocking. For the human approver, the project-level options are: (a) this roadmap owns BPLZZ Prop 4.8 as a target in Layer 5 (its objects are the T-multipliers of §4.3 and the base-change map on symbols and spherical Hecke algebras via SmoothRepresentationsOfLocalGroups SR.4; the smooth-transfer notion comes from EndoscopicTransferAndUnitaryTraceComparison, earlier in the order), with this roadmap placed before GanGrossPrasadUnitaryGroups and that roadmap's `gap:spectral-isolation` re-pointed here; or (b) GanGrossPrasadUnitaryGroups §6.4 states it as its own target using §4.3's scalar action, as the earlier review proposed. Either way the Scope sentence should then name the chosen owner; today it names one that disowns it.

## R02 (P3) — Two gap contracts point at AST sections on a different setting

Location: README, Exact supplier contracts, "The section contract is §§4.11–4.14" (gap:refined-langlands-discrete-data) and "The section contract is §§4.7–4.9" (gap:discrete-spectrum-casimir-counting).

Claim: the number-field Langlands discrete-data decomposition and the fixed-level discrete-spectrum Casimir count are continuations of AutomorphicSpectralTheory §§4.11–4.14 and §§4.7–4.9.

Witness: AutomorphicSpectralTheory at #925: §4.11 "Discrete spherical spectrum", §4.12 "Discrete pairs, their equivalence and stabilizers", §4.13 "Good representatives", §4.14 "Moeglin–Waldspurger classification" are the everywhere-unramified function-field GLₙ sections ([Yu22], convention Y, *Needs:* §1.10a function-field adeles); §4.7 is the cocompact-lattice specialization, §4.8 the `GL₂` modular expansion, §4.9 the modular Weyl law. The number-field decomposition by discrete data with residual summands and finite multiplicity is §§4.1–4.5 ("Measurable associate spectral parameters" … "Finite multiplicity in the discrete spectrum").

Repair: in the README write "The section contract is §§4.1–4.5" for both gaps (the `needs` sentences are precise and need no change; the plan's section field is informational for the intake announcement, so say so in the README line if the plan cannot be edited at this stage).

## R03 (P3) — ALLF anchor `isobaric-construction` does not exist

Location: README, Scope paragraph 3 and the AutomorphicLFunctionsAndLocalFactors contract: "preparatory **GLₙ isobaric sums** (anchor isobaric-construction)".

Witness: AutomorphicLFunctionsAndLocalFactors at #924 contains no string `isobaric-construction`; the section is `### AL.R.4 GLₙ isobaric sums` (its README line 274), consumed by `#### AL.3.7.2 Strong multiplicity one for isobaric sums`.

Repair: cite "AL.R.4, GLₙ isobaric sums" in both places; keep the AL.3.7.2 citation for §5.6.

## R04 (P3) — The `module` header exports nothing

Location: `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/Suggested.lean:1–3` (`module` followed by `import Mathlib`, no `public section`).

Witness: a scratch file `import TauCetiRoadmap.AutomorphicSpectralTheoryPartII.Suggested` followed by `#check @TauCetiRoadmap.AutomorphicSpectralTheoryPartII.finite_rank_weierstrass_product` fails with "Unknown identifier" for every one of the ten declarations, elaborated against the module's own built olean. The acceptance test is therefore invisible to any importing file. Twelve roadmaps on main share this header, so this is a style note; 110 of the 123 do not use `module`.

Repair: delete the `module` line (then `import Mathlib` is the first line, as on main), or add `public section` after the import.

## R05 (P3) — Four conjuncts of `finite_rank_weierstrass_product` restate the supplier's theorem

Location: `Suggested.lean:87–96`.

Claim: the README (§0.2) says convergence, entire holomorphy and the exact simple-zero divisor are supplied by GlobalHolomorphicFunctions, and only the global bound `exp(C(1+‖z‖)^(p+1))` is proved here.

Witness: GlobalHolomorphicFunctions at #992, `exists_entire_primary_product_exact` (its Suggested.lean lines 78–87): for countable `ι`, nonzero `a i` with cofinite escape and `Summable ((R/‖a i‖)^(p i+1))` for every `R>0`, an entire `F` with `HasProdLocallyUniformlyOn` of the primary factors and `analyticOrderAt F z = Nat.card {i // a i = z}`. Under `HasRankBound Λ p` (constant genus, multiplicity one on the nonzero-point subtype) this gives conjuncts 1–4 of the Lean theorem verbatim.

Repair: keep the statement but say in the docstring that conjuncts 1–4 are the supplier's and the growth bound is this roadmap's; or state only the growth bound together with the zero-set characterization that it needs. Not padding (no conjunct closes by one tactic) and not a duplicate name (different namespace), so this is a note on the acceptance test's scope.

## R06 (P3) — Redundant conjunct in `HasRankBound`

Location: `Suggested.lean:46–47`, `Λ.Countable ∧ Summable (…)`.

Witness: the summand `(‖z‖^(p+1))⁻¹` is strictly positive on the subtype `{z // z ∈ Λ ∧ z ≠ 0}`, and a summable family of positive reals has countable index type (`Summable.countable_support`-type argument); together with the separately recorded origin, `Λ` is countable. The README §0.1 states countability as part of the definition following BPLZZ Definition 2.1(1), so the Lean matches the README; the conjunct is merely unused by any proof route.

Repair (optional): drop `Λ.Countable` from the Lean predicate and from the README definition, keeping countability as an API bullet.

## Verified sound

**Gate and dependency check.** Worker's gate at 4d41437: all 25 checks 0, build 0. My re-run of the dependency check: `depcheck: 204 roadmaps, 1640 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Outside-folder diff: 0 paths. Pins of the worktree: Mathlib f6090c70, Tau Ceti 358314d4, as the README states. Elaboration of `Suggested.lean` with `lake env lean`: three `sorry` warnings, nothing else.

**Lean form.** Single `import Mathlib`, no Tau Ceti import, no `set_option`, no `lemma`, no sorry'd data (seven `def`s with real bodies, three sorried theorems). `#check @name` on a scratch copy for all ten declarations reproduced the signatures recorded by the worker; no section binder is lost (none is used). Lean generality equals README generality: `HasRankBound` (countable, summable inverse (p+1)-powers over the nonzero subtype), `HasFiniteEntireOrder` (`∃ C>0, ∃ d:ℕ`, global `exp(C(1+‖z‖)^d)`), `HasRapidVerticalDecay` (all `M>0`, all `r:ℕ`, sup-norm of real parts), `affineSpectralLattice` (`a + Σ ℤ b_i`, independence a hypothesis of the theorem only). One-tactic probe (`first | rfl | simp | infer_instance | decide`) on a scratch copy: all three theorems fail (unsolved goals at lines 94, 104, 115 of the copy); no padding. The example `elementaryFactor 0 2 = -1` closes by `simp; norm_num`, matching the §0.2 Check.

**Headline theorems.** README endpoints: BPLZZ Thm 2.13 (§1.7), Thms 3.6–3.7 (§5.4), Thm 3.19 (§5.3), Thm 1.1/1.3 (§§5.5–5.6), Remark 3.20 (§5.7); BPCZ §2.5 (Layer 2), §§2.9–2.10 (Layer 3). None is statable at the pins (no reductive-group Schwartz algebra, adelic quotient, cuspidal datum or automorphic `L²` carrier in Mathlib f6090c70 or Tau Ceti 358314d4); the module docstring names each with its missing carrier. The three Layer 0 statements that are statable are stated. Mathlib at the pin has no Weierstrass primary factor or canonical product (grep of `Mathlib/Analysis` for "canonical product", "elementary factor", "primary factor", "Weierstrass product": only a remark in `ValueDistribution/FirstMainTheorem.lean:211`); `tprod`/`Multipliable` at `Topology/Algebra/InfiniteSum/Defs.lean:106–142` carry the unconditional filter the file relies on.

**Seeded sample (all 15 targets), locators opened at the cited lines.**

| Target | Source, locator | What I read | Result |
|---|---|---|---|
| 0.2 Finite-order Weierstrass products | bplzz line 395–408 (Def 2.1, Lemma 2.2, p.9; p.9 = lines 386–430) | `Ψ_{Λ,p}=z^δ∏E_p(z/λ)`, rank needs `p>0`, order ≤ p+1, zeros exactly Λ | matches; README admits p=0 with its own bound `|1−w|≤exp|w|` |
| 0.8 Sharp symbols nonzero on orbits | bplzz line 495 (Lemma 2.10, p.11) | ∀α₀ ∃μ∈M♯θ^W, μ(α₀)≠0, via Cor 2.6 and products over θ and W | matches, including the W-translate nonvanishing step |
| 0.10 Holomorphic extension and strips | bplzz line 656–666 (Lemma 2.20, p.14) | unique compact-open extension; `M_S>0, r_S>0`; `p_{1,M,r}(Sμ)≤C p_{1,M+M_S,r+r_S}(μ)` and the θ-max form | matches (README allows `r_S≥0`, weaker) |
| 1.2 Schwartz integration | bplzz line 532–539 (§2.3, p.12) | `π(f)v=∫f(g)π(g)v dg` absolutely convergent on moderate-growth Fréchet reps | matches |
| 1.4 Kostant centralizers | bplzz line 739–770 (Lemma 2.22, p.16) | `δ(X)=X⊗1+1⊗τ(X)`, `R_τ` finite free, `S_i∈S` polynomial-preserving, `P_z(X)=∏(X−t_λz)` | matches up to the sign of λ, which the README corrects (see Source issues) |
| 2.5 Smooth LF representations | bpcz line 1170–1226 (§§2.5.3–2.5.4, Lemma 2.5.4.1, printed pp.209–211 = PDF 27–29) | SLF axioms, `V^∞=S(G(𝔸))·V`, closed invariant subspace inherits SLF and induced topology | matches; README's "closed image alone does not imply injectivity" repairs the source's phrase |
| 2.10 Schwartz functions on quotients | bpcz line 1298–1313 (§2.5.7, printed 212–213) | `‖x‖^N|R(X)φ|` seminorms, `S=(S₀⁰)^∞`, dense in every `L²_w^∞`, `S=⋂_N L²_N^∞` | matches |
| 2.14 Schwartz decay relative to a weight | bpcz line 1370–1400 (§2.5.11, Lemma 2.5.11.1, printed 214–215) | `S_{w,N}` with `‖x‖^{−N}w^r`, nonstrict union, `S_w=⋃_N⋂_r L²_{−N,w^r}^∞`, `R(f)φ∈S_w` for `φ∈T₀` with `w` bounded on supp | matches, quantifier order ∃N∀r preserved |
| 3.3 Cuspidal support in weighted spaces | bpcz line 2063–2100 (§§2.9.1–2.9.2, printed 229–230) | `X(G)` pairs mod `W(P,Q)`, finite-to-one `X(M_P)→X(G)`, `L²_{w,χ}` for `w` a weight on `A_P^∞`, orthogonal sums | matches |
| 3.7 Lapid expansion | bpcz line 2394–2410 (Thm 2.9.8.1, printed 238–239); lapid line 801 (HP, printed 19), 924 (Thm 4.5, p.22), 933 (Prop 5.1, p.22), 1069 (Cor 5.7, p.25) | ∃N: series converges in `T_N`, `λ↦φ_{Πλ}` Schwartz, `φ=∫φ_{Πλ}dλ` for `φ∈C_χ`; BPCZ proves it for GL products via (HP) | matches; README's (HP) hypothesis with the GL-products gap is exactly the source's route |
| 3.9 Uniform bounds for cuspidal kernel parts | bpcz line 2431–2443 (Lemma 2.10.1.1, printed 239–240) | `Σ_χ‖K_{f,P,χ}(·,y)‖_{w,N₀}≤‖f‖_S w(y)^{−1}`, pointwise `‖x‖^{N₀}w(x)w(y)^{−1}`, `K⁰` on `[G]_P¹` | matches, `N₀` before `w` and the seminorm |
| 4.3 Mixed multipliers | bplzz line 1116–1119 (Def 3.5, p.23) | `M♯θ^W⊗H_G^T`, `H_G^T` central in `S(G(𝔸_f))_K`, induces a multiplier | matches; README's "no unit" follows from `M♯θ` nonunital (Rem 2.9) |
| 4.4 Quasi-cuspidal test functions | bplzz line 1072–1074 (Def 3.2, p.22) | image of `R(f)` on `L²(…,ω)` inside `L²_cusp(…,ω)` | matches |
| 5.3 Isolation of occurring components | bplzz line 1428–1448 (Thm 3.19, pp.29–30) | range in `⊕_{D(G,ω)♥_χ}L²_{(M,σ)}`, `μ(χ)=1`, proof via Props 3.15, 3.17 and scaling | matches; "finite sum" and "no projector claim" are the README's correct glosses |
| 5.7 Refined discrete-data isolation | bplzz line 1459–1492 (Rem 3.20, pp.30–31) | Langlands components `D′(G,ω)`, [Mül89, Thm 0.1] replacing [Don82, Thm 9.1], PGL₂ strictness example | matches; the Müller input is declared as a gap, as it must be |

Also opened: Prop 2.4 and Cor 2.5–2.6, Rem 2.7 (bplzz line 416–446); Def 2.8 and `Y*_ϑ` (line 453–480); Thm 2.13, Rem 2.11–2.12 (line 540–553); Lemma 2.18 (line 590); Prop 2.24 and its claim (2.4) (line 803–815); Lemma 2.25 (line 971); Def 3.1–3.4, Thms 3.6–3.7 (line 1063–1130); Def 3.11, Lemmas 3.12–3.14, Prop 3.15 (line 1231–1345); Def 3.16, Prop 3.17 (line 1352–1422); Thm 1.1, Rem 1.2, Thm 1.3 (line 53–98); Prop 4.8 (line 1685); Prop A.1 (line 2104); bpcz §2.2.8 `δ_P^Q` (line 697), §2.4.3 weights and Franke `d_{P,λ}` (line 923–994), §2.4.4 depths (line 999), §2.4.5 `Ξ_P` (line 1117), §2.5.5 Sobolev and Riesz (line 1270–1277), Prop 2.5.5.1 (line 1284), §§2.5.6–2.5.10 (line 1289–1368), §2.5.12 (line 1402), §2.5.13 and Lemma 2.5.13.1 (line 1415–1452), Prop 2.5.14.1 (line 1460), Prop 2.5.15.1 (line 1536), Prop 2.8.4.1 (line 1980), Prop 2.8.4.3 (line 2043), Thm 2.9.4.1 (line 2157), §2.9.7 and Cor 2.9.7.2 (line 2292, 2344–2350), Lemma 2.10.2.1 (line 2481). Page maps: bplzz printed = PDF page; bpcz printed = PDF + 182; lapid printed = PDF − 1. Every page cited in the README agrees with these maps.

**Adversarial table** (one row per statement checked; values computed on each side).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `finite_rank_weierstrass_product`, growth bound | p=0 with Λ={n²: n≥1} (Σn⁻² converges); p=1, Λ=ℤ; Λ=∅; Λ={0} | `|E_p(w)|≤(1+|w|)exp(Σ_{j≤p}|w|^j/j)≤exp((p+1)|w|^{p+1})` for `|w|≥1`; `log|E_p(w)|≤|E_p(w)−1|≤|w|^{p+1}` for `|w|≤1`; so `log|Ψ(z)|≤δlog|z|+C_p|z|^{p+1}Σ|λ|^{−(p+1)}≤C(1+|z|)^{p+1}`; Λ=∅ gives Ψ≡1≤exp(C) | true for every p incl. 0 | none |
| same, zero set and simple zeros | z=0∈Λ; z∈Λ∖{0}; z∉Λ | `Ψ′(0)=∏E_p(0)=1`; at λ≠0 the factor `E_p(z/λ)` has simple zero, tail nonzero; unconditional net converges since `Σ|E_p(z/λ)−1|<∞` locally uniformly | true | none |
| `HasRankBound` | Λ=ℤ, p=0: Σ1/|n| diverges, p=1: Σ1/n² converges; Λ={1/(n+1)}: Σ(n+1)^{p+1} diverges ∀p; summability ⟹ finitely many points in each disk (terms ≥R^{−(p+1)} on `|z|≤R`) | least ranks 1, ∞ as the README Checks say | true | R06 note: countability is implied |
| `polynomial_zero_fiber_interpolation` | n=0 (q constant c; ν∈{0,1}); ψ≡0 (ν≡0); deg q=0; general | damping `exp(Σz_j^{2q₀})`, q₀ odd: on `|x_j|≤M`, `Re z_j^{2q₀}=−y_j^{2q₀}+O(y_j^{2q₀−2})`; `|ψ(q(z))|≤exp(C(1+‖z‖)^{d·deg q})`; choose `2q₀>d·deg q` | true, strengthening of Prop 2.4 as Rem 2.7 allows | none |
| `affine_lattice_interpolation` | n=0,k=0 (A=∅: ν=0; A={a}: ν=1); k=0,n≥1 (affine factor through a, nonzero on finite A); k=1 in ℂ, a=1/2, b=1, A={0}; repeated generators (1,1): `LinearIndependent` fails | lattice {−1/2,1/2,3/2,…}; `sin(π(z−1/2))·exp(z²)` vanishes on it and equals `−1·1≠0` at 0; for A meeting the lattice divide out finitely many simple zeros and kill the finitely many survivors by affine factors | true under complex independence; the source's proof covers exactly this case | none; source gap recorded |
| `HasRapidVerticalDecay` convention | `exp(z²)` on `x+iy`, `|x|≤M`: `|exp(z²)|=exp(x²−y²)≤exp(M²−y²)`; `exp(−z²)`: `exp(y²−x²)` | decays / grows | matches §0.3 Check | none |
| §0.5 moderate symbols | Θ={−1}, Y=ℤ, μ=exp: `e^n/(1+n)^d→∞`; μ=z², r=−2: `n²/(1+n)²→1`, r=−1: `n²/(1+n)→∞`; Θ={1} on a line, μ=exp: `|e^{x+iy}|=e^x≤e^M` | not moderate / moderate / moderate | all four Checks hold | none |
| §0.6 rapid symbols, Hausdorffness | Θ={−1}, `sin(πz)`: all lattice seminorms 0; at z=i value `i·sinh π≈11.5i≠0` | seminorms not separating without 1∈Θ | matches | none |
| §0.7 sharpness | U(1): θ={−1}, `Y_{−1}=ℤ` infinite ⟹ 1 not sharp; split torus: θ={1}, `Y₁={0}`; `exp(z²)sin(πz)/(πz)`: value 1 at 0, 0 at n≠0 | sharp algebra nonunital exactly when some `Y_ϑ` infinite | matches Def 2.8(3), Rem 2.9 | none |
| §0.9 translation convention | `(t_wP)(α)=P(w^{−1}α)` (bplzz line 645); t₁z=z−1; `t_λt_η=t_{λ+η}` | README `t_λf(α)=f(α−λ)` agrees | matches | none |
| §1.4 translated characters | torus `G_m`, τ of weight λ: `δ(H)=H⊗1+1⊗λ` acts on `V_α⊗W_λ` by α+λ, i.e. `(t_{−λ}z)(α)` | source writes `∏(X−t_λz)`; with λ=1, α: `(α+1)−z(α−1)=2≠0`, with `t_{−1}`: 0 | README sign right, source misprinted | Source issues |
| §1.2 derivative sign | additive line, `π_t(x)=e^{itx}`, `L(X)f(x)=d/dt f(x−t)|₀=−f′`; `∫−f′e^{itx}=it∫fe^{itx}` | factors i, 2i at t=1,2; opposite sign −i, −2i | matches Check | none |
| §1.6 estimate | source (2.4): max over θ; README: max over θ∪{1} | RHS only larger | weaker, safe | none |
| §1.7 Thm 2.13 | μ=1 ⟹ identity (1∈M, not sharp when `Y_ϑ` infinite); SU(2): lattice point 0 vs actual characters ρ+dominant ≠0 | containment of tempered characters, not equality | matches Rem 2.16 | none |
| §2.3 depth vs modulus | GL₃ Borel, `diag(t²,t,1)`: roots `t,t,t²`; `d_B^G≍t`, `δ_B^G=t⁴`; t=2: 2 vs 16 | ratio `t³` unbounded | Check true | none |
| Conventions `δ_P` | GL₂ Borel, `diag(a,1)`, `|a|=4`: `δ_B=|a|=4`, `δ^{1/2}=2`, `δ^{−1/2}=1/2` | normalized induction 2, disintegration 1/2 | matches bpcz line 1261 (`δ_P(a)^{1/2}` on `L²([G]_P,0)`) and line 2429 (`δ_P(a)^{−1/2}da`) | none |
| §2.2 symmetrized heights | `G_m`, ι(t)=t: weights ±1, `|t|=2`: max(2,1/2)=2; GL₂ `diag(4,2)`: ε₁→4, −ε₂→1/2 | 2, 4 | matches | none |
| §2.6 Franke weight comparison | p=2: `‖R(X)φ‖_{L²_{p²}}=2‖R(X)φ‖₂`; w=p gives √2 | 2 vs √2 | Check true | none |
| §2.8 nuclearity needs a derivative gain | circle, `D=(2π)^{−1}d/dx`, `e_n/n^m`: `p_m=max_{j≤m}n^{j−m}=1`, `p_{m+1}=n`; `H^{m+2}→H^m` singular values `(1+n²)^{−1}`, `Σ<∞`; `L²→L²` singular values 1 | unbounded / summable / not trace class | Check true | none |
| §2.12 Dirac measures | `δ_x,δ_y`, x≠y, weight 1: `‖δ_x−δ_y‖=2`; `‖cδ_y‖_{1,w^{−1}}=|c|/w(y)` | 2, `|c|/w(y)` | matches bpcz line 1329 | none |
| §2.13 exponent vs weight subscript | cusp `y`: `(y d/dy)^k y=y`; `exp(iy²)`: `(y d/dy)exp(iy²)=2iy²exp(iy²)`, degree 2k | `y∈T_1∖T_0`; `exp(iy²)∉T` | Checks true | none |
| §2.16 adjunction and measures | P=Q, compact mass-1 quotient, φ=ψ=1: ⟨CTφ,ψ⟩=1=⟨φ,EPψ⟩; scale one measure by 2: 2≠1 | measure normalization is part of adjunction | matches bpcz (2.5.13.12) | none |
| §3.1 relative characters | f=0 ⟹ 0; 1-dim type `a·id`, unit vector: a; doubled vector: 4a | basis must be orthonormal | matches Prop 2.8.4.1 | none |
| §3.2 adjoint slot | `I(λ,x)=e^{λx}`, `g=1_[0,1]`: `I(1,g)=e−1`, adjoint `e−1`; `g*=1_[−1,0]`: `I(−1,g*)=∫_{−1}^0e^{−x}dx=e−1`; `I(1,g*)=1−e^{−1}`; source's `I(λ̄,g^∨)=I(1,1_[−1,0])=1−e^{−1}` | README `(−λ̄,g*)` is the adjoint; source formula is not | README right | Source issues |
| §3.2 finite model | `B(u,v)=u·conj v`, A=2, T=i: `B(AT1,1)=2i`, `B(A1,T*1)=2·conj(−i)=2i`, with T: `−2i` | separates | Check true | none |
| §3.5 regularity | GL₂: χ⊠χ stabilizer order 2; χ₁≄χ₂ trivial; M=G trivial | matches bpcz line 2292 | none |
| §3.6 normalization | `δ_P=4`: s=1 gives `4^{1/2}=2`, s=0 gives `4^{−1/2}=1/2` | exponent `s−1/2` per Cor 2.9.7.2, bpcz line 2347 | matches | none |
| §3.8 kernel sign | circle, `R(f)φ(x)=∫f(g)φ(x+g)dg`, `f=e_{−n}`: `R(f)φ=e_n⟨φ,e_n⟩`, kernel `e_n(x)conj e_n(y)`; `f=e_n` projects onto `e_{−n}` | sign detected | Check true | none |
| §3.10 conjugate derivative | `D=(2π)^{−1}d/dx`, `Y=iD−1`: `De_{±1}=±ie_{±1}`, `Ye_{−1}=0`, `Ye_1=−2e_1`; kernel `e_1(x)e_{−1}(y)`: Y on `e_{−1}(y)` gives 0, `R(Y)e_{−1}=0`: `0≤0`; conjugating `Ye_1` instead: 2≤0 false; Y=D: both coefficients −i | ℂ-linear extension is forced | Check true | none |
| §4.1 level stability | S₃ standard rep, K=⟨(12)⟩, v=(1,1,−2): `δ_(23)v=(1,−2,1)` not K-fixed; `e_Kδ_(23)e_Kv=(−1/2,−1/2,1)` K-fixed | bi-K tests only | Check true | none |
| §4.2 CAP | torus: no proper parabolic; T all finite places: condition vacuous | non-CAP not automatic | matches Def 3.4 | none |
| §4.5 typicality | `G_m/ℚ`, ω=1: `(a_G^G)*=0`, `c_G*` 1-dim; differential 1 not typical at χ∞=0; absolute `a_G*` would accept it | relative space needed | consistent with Conventions witness | none |
| §4.6–4.7 lattice generators | differentials of characters of a compact abelian Lie group: real lattice in `i·Lie*`, generators ℝ-independent in a real form ⟹ ℂ-independent | Cor 2.6's proof applies | consistent; README's "affine coset" refines the source's "lattice" | Source issues (misprint) |
| §5.1 occurrence | `G=M=G_m/ℚ`, ω=1, σ=1, T all finite: only s=0, infinitesimal character 1 does not occur; absolute space would allow s=1 | relative space | Check true | none |
| §5.2 mixed annihilator | M=G, equal χ∞, different finite characters: `μ⁰⊗(h−χ_σ(h)1)`; unequal χ∞: invariant polynomial times μ⁰ | matches Prop 3.17 proof, bplzz line 1372–1376 | none |
| §5.6 isobaric uniqueness | Satake `(1−2T)(1−3T)=1−5T+6T²`; `(1−2T)²=1−4T+4T²` | multiset retained | Check true; AL.3.7.2 at #924 gives cuspidal-support equality | none |
| §5.7 PGL₂ | `q(λ)=λ²−1/4`: λ=it gives `−t²−1/4`, λ=1/2 gives 0 | differ at every t | Check true; matches bplzz line 1485–1492 | none |
| Layer 0 Examples | `exp(z²)sin(πz)/(πz)` at z=it: `exp(−t²)sinh(πt)/(πt)`; `(f(z)−f(−z))/z` for `z²+z`: 2 | decays / 2 | true | none |
| §0.2 Checks | `E_p(2)`: −1, −e², −e⁴; `E_p′(1)=−exp(Σ_{j≤p}1/j)`: −1, −e, −e^{3/2}; Λ={0,1,2}, p=0, z=3: `3·(−2)·(−1/2)=3`, inserting only 1: −6; Λ={0,1}, p=0, z=2: 2 and −2 | all as stated; `E₀(2)=−1` elaborated in Lean | true | none |

**Cross-roadmap citations resolved** (every one, at main or at the open head the brief names). AutomorphicSpectralTheory #925: §§0.11–0.15 (lines 277–376), §§1.5–1.10 (969–1070), §§2.1–2.9 incl. 2.3a, §§3.1–3.9, §§4.1–4.20, §§5.1–5.12, §§6.1–6.5 all present; §6.3 is Arthur's compact-support multiplier and §6.4 the compactly supported kernels, so the Schwartz extensions here are not restatements. AutomorphicFormsOnReductiveGroups #1037: §§0.1–0.5, 2.1–2.7, 3.4–3.5, 4.1–4.2 present (§2.7 supplies `dixmierMalliavin` and the integrated Schwartz action; §0.3 the adelic Schwartz algebra with BPCZ §2.5.2 density). AdelicAlgebraicGroups #792: §§2.1–2.3, 3.1–3.6, 4.6–4.7 present. SmoothRepresentationsOfLocalGroups #1688: SR.1.1–1.3, SR.2.2, SR.4.1–4.2 present. ReductiveGroups (main) Layer 7 "structure theory" at line 627; RepresentationTheory/LieGroups (main) Layers 6–7 at lines 383, 407; PDE (main) Lane A at line 223 with Sobolev embeddings; OperatorTheory/OperatorIdeals (main) OI-B29, B32, B41, B84 and Part C; OperatorTheory/SelfAdjointSpectralTheory (main) Parts A–E; BanachSpaceTheory (main) B4 with the nuclear quotient-norm carrier and trace-class identification; NoncommutativeGeometry (main) N1 constructs completed projective tensors (line 86–98); VonNeumannAlgebras #889 V4 Hilbert–Schmidt pairing and trace (line 976–981); SpectralManifolds #1158 SM3 with the open mapping theorem (line 82–92, 256); GlobalHolomorphicFunctions #992 Layer 1 "preparatory primary factors and locally uniform products" (line 448); ZerosOfLFunctions #253 finite-order convention (line 138) and Layer 5; ModularCurvesPartII #913 §1.4a lattice sigma (line 488); AutomorphicLFunctionsAndLocalFactors #924 AL.R.4 and AL.3.7.2 (R03 for the anchor); CongruenceSpectralGap #1504 Layers 0–5; GanGrossPrasadUnitaryGroups #1404 §§6.3–6.4 (R01). All 31 declared gaps have the same slug in `design/plan.json` and the README; each `needs` sentence is a single precise statement with its hypotheses, and none asks for something AST, AFRG, AAG, SRLG, Mathlib or Tau Ceti already provides (AST §6.3 is compact-support only; AFRG §4.2 has cuspidal occurrences but no Donnelly count; AAG §3.5–3.6 has heights and Siegel sets but not the quotient comparisons asked).

**Ownership against open work.** `roadmaps grep` over the 439 open pull requests and main for "quasi-cuspidal", "T-multiplier", "isolation of cuspidal", the quotient Harish-Chandra space, "Delorme" and vertical-strip symbols: the roadmap's objects occur only here; SmoothRepresentationsOfLocalGroups' "quasi-cuspidal" is the p-adic Jacquet-module notion (its line 2326); EndoscopicTransferAndUnitaryTraceComparison's "Delorme" is Clozel–Delorme and Delorme–Mezo Paley–Wiener (its lines 934, 2377); AST's is Clozel–Delorme. TwistedAutomorphicDescents #1758 and AutomorphicLFunctionsAndLocalFactorsPartII #1756 mention neither this roadmap nor Schwartz multipliers. No second owner of any object; the single ownership hole is R01.

**Timelessness and policy.** No process words, round labels, pull-request numbers, `(removed)` stubs, LaTeX delimiters or local paths in the README (grep; the only hits of "packet" are "wave packets"). Every target has a locator; every definition has an API list and at least three Checks; every layer ends with Examples and Dependencies.

## Not verifiable

- `bernstein` (Bernstein 1988, §§3.4–3.5, pp.685–689; cited at §§2.7–2.8): settled as uncertified in the manifest; cited by locator only. The same statements are read at bpcz line 1270–1288 (Sobolev inequality (2.5.5.4) and Prop 2.5.5.1 citing Bernstein p.688), which supports what §§2.7–2.8 state.
- Kostant Theorems 4.8–4.9, Delorme 1986 Théorème 1.7, Donnelly 1982 Theorem 9.1, Müller 1989 Theorem 0.1: cited only through BPLZZ (bplzz line 741, 760, 809, 1267, 1460) as the README says; the roadmap consumes them through declared gaps, so no locator of its own is asserted.
- Corollary 2.5.15.2 of BPCZ (the closed-embedding and open-surjection statements of §2.18): the proposition and proof start were read (bpcz line 1536–1558); the corollary's displayed statement on printed pp.220–221 was not opened line by line.

## Source issues

- **Gap** in bplzz at Corollary 2.6, p.10: the proof chooses complex-linear forms `λ_i` with `L ⊂ ⋂ λ_i⁻¹(ℤ)`, which exists only when the lattice has complex-linearly independent generators; a full real lattice such as `ℤ+iℤ ⊂ ℂ` is not covered; it should restrict `L` to such lattices (the only case used, e.g. `Y*_ϑ` inside the real form `h*_{−ϑ}`); affects the proof.
- **Misprint** in bplzz at Lemma 2.22 proof, p.16: the annihilator is written `∏_{λ∈Λ(τ)}(X − t_λ z)`; with `(t_wP)(α)=P(w⁻¹α)` the tensor shift by weight λ gives roots `z(α+λ)`, i.e. `t_{−λ}z` (on a torus with λ=1: `(α+1)−z(α−1)=2≠0`); affects nothing, since only distinctness of the characters is used.
- **Misprint** in bplzz at Proposition A.1, p.43: states `μ ∈ N(h*ℂ)`; `μ(χ_π)` is defined on W-orbits only for `μ ∈ N(h*ℂ)^W`, which is what (A.1) and the proof use; affects nothing.
- **Gap** in bplzz at Theorem 3.19, p.29, deduction of Theorem 1.3: cites [PS79] strong multiplicity one for cuspidal representations, whereas identifying the occurring cuspidal data of an induced representation needs the isobaric strong multiplicity one of Jacquet–Shalika; affects the proof of Theorem 1.3.
- **Misprint** in bplzz at Lemma 3.14 proof, p.26: "a lattice `L_M` of `c*_{M,ℂ}/a*_{M,ℂ}`" containing `γ⁺_M(χ_{σ_s,∞})`; the differentials of characters of the compact abelian quotient extending the fixed ω form a translate of a lattice with real (hence complex-independent) generators; affects nothing (Corollary 2.6 is applied to finite sets inside it).
- **Error** in bpcz at Proposition 2.8.4.3, p.229: the second slot of the factorized relative character is written `I_P(λ̄, g_i^∨)` with `g^∨(x)=g(x⁻¹)`; the adjoint of `I_P(λ,g_i)` is `I_P(−λ̄, g_i^*)` with `g^*(x)=conj g(x⁻¹)` (additive model `I(λ,x)=e^{λx}`, `g=1_[0,1]`: adjoint `e−1`, the printed formula gives `1−e⁻¹`); affects a stated result (the displayed identity), not its use (absolute convergence and the kernel bounds).
- **Misprint** in bpcz at §2.5.4, p.210: "equivariant morphisms of SLF representations with closed image are necessarily topological embeddings" omits injectivity; it should say injective morphisms, or the induced map from the quotient by the kernel; affects nothing.
