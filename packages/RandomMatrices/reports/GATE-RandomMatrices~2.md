# GATE-RandomMatrices~2: answers to the review of `ebac9fc`

Repairs committed as `f71e828c` ("RandomMatrices: review repairs (headline acceptance test, supplier
ownership, AGZ generality, house-shape README)"), not pushed. Points are numbered in the order they
appear in the review; F05 and F07 make several separate points, each numbered on its own.

## H01 (CBirkbeck) — applied

`TauCetiRoadmap/RandomMatrices/Suggested.lean` is now the acceptance test. Its docstring has the "target signatures" form and names what cannot be stated at the pins, with the missing carrier for each: free-probability limits (no noncommutative probability space, freeness or free convolution), `F₁`/`F₂` and the sine/Airy limits (no Airy function, no Fredholm determinant on `L²`, no point-process carriers), the speed-`n²` and speed-`n` LDPs (no LDP, no logarithmic energy), and Dyson Brownian motion (no Itô integral or SDE solution). The old API lemmas are deleted (`independent_extension`, `ae_extension_iff`, `spectralMeasure_integral_pow`, `spectralMeasure_stieltjes`, `resolvent_norm_le`, the three `semicircleReal_*` lemmas). Eleven headlines are stated: `wigner_semicircle_ae`, `wigner_extreme_eigenvalues_ae` (Bai–Yin), `marchenkoPastur_ae`, `sampleCovariance_extreme_eigenvalues_ae`, `hanson_wright`, `matrix_bernstein`, `gaussianEnsemble_eigenvalue_density` (GOE/GUE with the Gaussian Selberg constant), `gaussianEnsemble_spike_ae` (`θ + 1/θ`), `gaussianEnsemble_linear_statistic_clt`, `least_singular_value` (Rudelson–Vershynin) and `circular_law_ae`. They need only the definitions `marchenkoPastur`, `circularLaw`, `eigenvalueMeasure`, `sampleCovariance` and `gaussianEnsemble` (Gaussian-coordinate GOE/GUE), plus proved Hermitian lemmas. The linear-statistics CLT was added beyond the review's list because it is statable through `TendstoInDistribution`.

## H02 (CBirkbeck) — applied

Hoffman–Wielandt is now taken from OperatorTheory/PrincipalAngles PA-B40 through `Matrix.toEuclideanLin`, and the Hermitian dilation from SpectralSubspacePerturbation SSP-D06, with SSP-D13 and SSP-D14 for the singular-value analogue (README §1.2, §1.3, §2.6, Scope and ownership, supplier contracts). `frobeniusNorm` and `hoffmanWielandt` are deleted from the Lean file. On `A = diag(1,-1)`, `B = 0` the matrix form is the equality `2 ≤ 2`, which is now a §1.2 Check. A sorted-versus-unsorted Check is also added: `diag(1,0)` against `diag(0,1)` gives `0 ≤ 2`.

## H03 (CBirkbeck) — applied

`semicircleReal a v` is now `(betaMeasure (3/2) (3/2)).map (x ↦ a + 2√v (2x-1))`, the image of StandardDistributions 10.20's unit semicircle. Mathlib's `betaMeasure` exists at the pin, and `v = 0` gives `δ_a` automatically as a pushforward under a constant map. The Ownership section now records 10.20 and Layer 7, the density formula is a §3.3 API bullet, and "Stanford" is gone. The same pattern applied elsewhere: StandardDistributions 12.1 owns the uniform ball law `cond volume (ball c r)`, so `circularLaw` is now `ProbabilityTheory.cond volume (Metric.ball 0 1)` on `ℂ`, recorded as its transport.

## H04 (CBirkbeck) — applied

LaguerreJacobi Parts A–D (open PR, another author, new folder; checked at its head) is now the owner of the polynomials, Rodrigues formulas A3/C4, `laguerreMeasure`/`jacobiMeasure` and orthogonality B3/D3 (Scope and ownership, supplier contracts, §8.2). The README keeps only the unitary-ensemble Christoffel–Darboux kernels and their asymptotics. A §8.2 Check pins `K(x,y) = w(x)^(1/2) w(y)^(1/2)/c₀`, with `c₀` the zeroth B3 norm. Depcheck reports no problem for this edge.

## H05 (CBirkbeck) — applied

`stieltjes_eq_integral` is deleted, and so is the wrapper `stieltjes`: no headline needs it. The README cites Mathlib's `resolventTransform` and `resolvent` directly (Conventions 4).

## H06 (CBirkbeck) — applied

`empiricalMeasure` and its two proved theorems are deleted. `spectralMeasure {n} [NeZero n] A hA` is now the measure underlying `TauCeti.Probability.empiricalMeasureOfFintype hA.eigenvalues`. The empty-family empirical finite measure stays in the README as a §1.1 target with a Check.

## H07 (CBirkbeck) — applied

`frobeniusNorm` is deleted. The one statement that needs a Frobenius norm next to the `L2Operator` norm (`hanson_wright`) writes `∑ i, ∑ j, A i j ^ 2` explicitly, so it does not mix two norm instances on one type.

## H08 (CBirkbeck) — applied

At `n = 0` both sides of the two statements are `0`, as claimed. Both statements are now deleted as API lemmas (H01), so the unused `hn` is gone with them.

## H09 (CBirkbeck) — applied differently

The Hermitian witness is proved in place, but for a corrected constructor. `wignerFromArray` (real entries, diagonal sharing the off-diagonal law) is replaced by `wignerMatrix ξ η n ω`: complex entries `ξ` on `StrictUpper`, their conjugates below the diagonal, and a separate real diagonal `η`. This brings the Lean generality up to the README's ("real or complex", "separate diagonal law"; T Theorem 2.4.2 and Bai 1999 Theorem 2.12). `wignerMatrix_isHermitian` is proved by `ext` and trichotomy. `sampleCovariance_isHermitian`, `gaussianEnsemble_isHermitian` and `isHermitian_smul_vecMulVec_star` are proved the same way.

## H10 (CBirkbeck) — applied differently

In the README:
- the porting-policy paragraph (old lines 84–90) and the Zulip link are deleted;
- §2.1 now states the sub-exponential definition (`E exp(λ(X-EX)) ≤ exp(K²λ²)` for `|λ| ≤ 1/K`);
- §3.1 now states the expansion `m_μ(z) = -∑_{k<r} m_k z^(-k-1) + R_r(z)` with `|R_r(z)| ≤ ∫|x|^r dμ/(|z|^r Im z)`, which implies the suggested `(Im z)^(r+1)` bound since `|z| ≥ Im z`;
- both "Stanford" sentences are deleted.

`SOURCES.md` (the audit date and the StochasticCalculus PR number) is outside this job's editable files, so it is unchanged here. The README links it only from References, as provenance.

## H11 (CBirkbeck) — applied

§9.2 now reads: for some `β' > 1` with `β' ≥ β`, `liminf_{|x|→∞} V(x)/log|x| > 2β'/β`. This is AGZ (2.6.2) (AGZ line 3535–3540) translated by `V_AGZ = βV/2`. The old condition was `V(x)/log(1+|x|) → ∞`. The Check `β = 2`, `V = c log(1+|x|)` is admitted exactly for `c > 2`. The rate `(β/2)(E_V - min E_V)` is unchanged, since AGZ's `I^V_β` equals it in this normalization.

## H12 (CBirkbeck) — applied

§6.5 now states asymptotic freeness for finitely many independent real or complex Wigner matrices with centred, variance-one entries whose moments of every order are uniformly bounded. It holds almost surely and in expectation, jointly with a uniformly bounded deterministic family with a limiting star-law (AGZ Theorem 5.4.2, line 17996, and Theorem 5.4.5, line 18154). GUE and GOE are kept as the Gaussian cases.

## H13 (CBirkbeck) — applied differently

The README now has the house shape:
- `**Summary.**`, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, roadmaps, with file paths), How to read the build;
- `## Layer k` with `### k.n` subsections, each with `*Needs:*` items, API bullets on every definition, and at least three `**Checks.**` per defined object;
- `### Examples` and `### Dependencies` in every layer;
- Downstream consumers (FreeProbability) and References.

Layer numbers are kept equal to the old milestone numbers, and the combinatorial prerequisite keeps its name. FreeProbability on main cites "RandomMatrices Milestones 1, 3, 5, 6" and "the finite combinatorial prerequisite" (its lines 102–121), so renumbering would break a consumer's citations. Downstream consumers records the correspondence.

## Build and gate

- `lake build TauCetiRoadmap.RandomMatrices.Suggested`: `Build completed successfully (8978 jobs)`. The only warnings are `declaration uses 'sorry'` on the eleven headline theorems.
- Gate at `f71e828c`: `gate RandomMatrices: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 155 roadmaps, 1063 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

## Signature check

All 24 declarations were elaborated with `#check @name`, appended temporarily to the file, built once and then removed. Each elaborated type matches its README statement:
- every theorem carries `[MeasurableSpace Ω]` and its probability instances in its own signature;
- `spectralMeasure` keeps `[NeZero n]`;
- `marchenkoPastur_ae` keeps `[∀ n, NeZero (p n)]`;
- no section binder is dropped.

The earlier lead (the dropped `[MeasurableSpace Ω]` on `wignerFromArray`) is gone with that declaration; `wignerMatrix` needs no measurable structure.

## Ownership

Searched by object, not by name, with `roadmaps grep` over main and 378 open heads: Hanson–Wright, matrix Bernstein, Golden–Thompson, Lieb concavity, Marchenko, semicircle law, circular law, Tracy–Widom, Weingarten, Dyson Brownian. Other than the owners cited above, the only hits are FreeProbability (a consumer of this roadmap, which also lists a Weingarten interface in its F8) and unrelated mentions in QuantumGroups and ManifoldOptimization. The OperatorTheory family on main was also checked:
- MatrixSpectralStatistics owns no Weyl, interlacing or Hoffman–Wielandt target;
- Majorization owns Ky Fan, not Weyl or Hoffman–Wielandt;
- the measurable structure on matrices is in Mathlib at the pin (`Mathlib/Analysis/Matrix/MeasurableSpace.lean`) and is cited there.

No notion moved down from a later roadmap.

## Sources read (legal copies, for the manifest)

The roadmap has no `sources.toml`, and this job may not create one. The worker should record:

| id | copy | locators used |
| --- | --- | --- |
| AGZ | author page | (2.6.1)–(2.6.2), Thm 2.6.1 (lines 3531–3616); Thm 2.5.2 and (2.5.4) (lines 2588–2614); Thm 2.1.31 (line 1540); Thm 4.3.20 (line 13749); Thms 5.4.2, 5.4.5 (lines 17996, 18154) |
| Tao | author page | Thm 2.3.24 (line 5731); Wigner ensemble (lines 5869–5876); Thm 2.4.2 (line 5960); Thm 2.8.1 (line 9805) |
| Bai1999 | Statistica Sinica, institutional | Thm 2.1 (line 128); Thm 2.5 (line 452, a.s. at line 534); Thm 2.12 (line 992); Thms 2.15–2.16 (lines 1214–1225) |
| RV2013 | arXiv:1306.2872 | Thm 1.1 (line 47) |
| Tropp2012 | arXiv:1004.4389 | Thm 1.4 (line 273) |
| RV2008 | arXiv:math/0703503 | Thm 1.2 (line 117) |
| BGN2011 | arXiv:0910.2120 | Thm 2.1 (line 187), §3.1 (lines 471–494) |
| TVK2010 | arXiv:0807.4898 | Thm 1.13 (line 339), Thm 2.1 (line 603) |

Johansson 1998 (Duke, paywalled) is cited as Theorem 2.4 without its text, and should be recorded `uncertified`. The CLT variance formula does not rest on it alone: it was recomputed independently on `f = x, x², x³` and the Chebyshev traces (table below). `needs-references.toml` is not written: every text needed was read.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `gaussianEnsemble_eigenvalue_density` | `n=0,1,2`, `β=1,2` | `n=0`: both sides `δ` on a point (`0^0=1`); `n=1,β=2`: `Z=√(2π)`; `n=1,β=1`: `Z=√2·√(2π)=2√π`, i.e. `N(0,2)`; `n=2,β=2`: `Z=¼·2π·2=π` = `∫∫e^{-(x²+y²)}(x-y)²`; `n=2,β=1`: `Z=2π/Γ(3/2)=4√π` = `2π·E|X-Y|` | agrees with AGZ (2.5.4) after `√n` rescaling (identity `Γ(1+jβ/2)=(jβ/2)Γ(jβ/2)`) | Checks added |
| `gaussianEnsemble` normalization | `n=1,2` | GUE: `Re H_ij` var `1/(2n)`, diagonal `1/n`; GOE: off-diagonal `1/n`, diagonal `2/n`; `E trₙH² = 1`, resp. `1+1/n` | matches Conventions 5 | — |
| `marchenkoPastur` | `y=0, 1/4, 1, 2` | `y=0`: `δ₁`; `y=1`: mass `(2π)⁻¹·2π=1`, mean `1`; `y=2`: atom `1/2`; `y=1/4`: atom `ofReal(1-4)=0`, support `[1/4,9/4]` | probability, matches Bai Thm 2.5 | Checks |
| `semicircleReal` as a pushforward | `v=0,1` | `v=0`: constant map, `δ_a`; `v=1`: radius `2√1·1=2`, variance `4·¼=1`, density `(2πv)⁻¹√(4v-(x-a)²)` | equals old density body | — |
| `circularLaw` as `cond` | mass, `∫|z|²` | `volume(ball 0 1)=π`, mass `1`; `∫|z|²=∫₀¹r²·2r=1/2` | probability | — |
| `hanson_wright` | `A=0`; `K=0`; `t=0`; `A=E₁₂+E₂₁` with Rademacher | `A=0` or `K=0`: LHS `0`, RHS `2` (Lean `x/0=0`); `t=0`: RHS `2`; Rademacher: `P(|2X₁X₂|>1)=1` forces `c ≤ 2 log 2` | true with an absolute `c` (RV `ψ₂ ≍ √K`) | Checks |
| `matrix_bernstein` | `d=0`, `t=0`; `L=0`; `Xₖ=εₖEₖₖ` | `d=0,t=0` would give `1 ≤ 0`, so `t>0` is required; `L=0`: `X=0`, LHS `0`; diagonal: `2m e^{-3/8} ≥ 1` | true for `t>0` | `ht : 0 < t` kept, Check |
| `least_singular_value` | `N=1` Gaussian; Rademacher `2×2`; `ε=0` | `P(|g|≤ε)≈ε√(2/π)`; singular probability `1/2`, absorbed by `c^N` | consistent with RV Thm 1.2 | Checks |
| `gaussianEnsemble_spike_ae` | `θ=1, 2`; `β=1` with complex `u` | `θ=1`: `2`; `θ=2`: `5/2`; GOE needs real `u` (orthogonal invariance only) | BGN §3.1 with `σ=1` | `hureal` hypothesis |
| `gaussianEnsemble_linear_statistic_clt` | `f=c`, `x`, `x²`, `x³`, `2T_k(x/2)` | `a₁=2` gives var `2/β` = diagonal variance (GUE `1`, GOE `2`); `x²`: `a₂=2`, var `4/β`; direct GUE `(2n+2n(n-1))/n²→2`; direct GOE `(8n+4n(n-1))/n²→4`; `x³=6cosθ+2cos3θ` gives `12` for GUE; Chebyshev: `2k/β` | consistent | Checks |
| `wigner_extreme_eigenvalues_ae` | `ν` with mean `0`, `E|z|⁴<∞`; diagonal `E η²<∞` | Bai Thm 2.12 (i)–(iv) hold: `(η⁺)²` integrable, `E ξ = 0 ≤ 0`, variance `1`, fourth moment; reflection uses `(η⁻)²` | true | — |
| §9.2 growth condition | `V=x²/2`; `V=c log(1+|x|)`, `β=2` | liminf `∞`; liminf `c`, admitted iff `c>2` (old condition: never) | matches AGZ (2.6.2) | statement changed |
| §9.2 energy | `V=x²/2`, standard semicircle | `∫V=1/2`, `∬log|x-y|=-1/4`, `E_V=3/4`; `∫log|x-y|dSC=x²/4-1/2`, effective potential `1` | consistent with minimizer `semicircleReal 0 1` | Checks |
| §3.1 remainder | `δ₁`, `r=1`, `z=i` | `R=(1-i)/2`, `|R|=1/√2 ≤ 1/(1·1)` | bound holds | statement added |
| §1.2 Hoffman–Wielandt via PA-B40 | `diag(1,-1)` vs `0`; `diag(1,0)` vs `diag(0,1)` | `2≤2`; sorted `0≤2` (unsorted `2`) | consistent | Checks |
| §7.4 shrinkage at `ν=δ₁` | `w=1-y-yzm` | `w²-(1-y+z)w+z=0`, so `|w|²=x` on the support and the weight is `1` | consistent with `T=I` | Check |
| §6.3 MP R-transform | cumulants | `κ_j=y^{j-1}` reproduces `∑_{NC(k)} y^{k-|π|}` | `R=1/(1-yw)` | Check |
| §10.2 brackets | `β=1,E₁₁`; `β=2,E₁₂+E₂₁` | `2t`; `2t`, so `Var Re H₁₂ = t/2` | matches §5.1 | Checks |

Untrusted text: the review contained no instruction beyond the mathematical repairs; nothing in it was treated as an instruction.
