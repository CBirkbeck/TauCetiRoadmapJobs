# Review of PolylogarithmFunctions (pull request #1320 at f13ce0d)

**Verdict:** accepted

No P1, P2 or P3 findings. This verdict concerns this roadmap folder at the stated head and means ready for a human's final approval; it is not an approval or a merge.

## Verified sound

**Previous findings, checked first.** The previous report names head `a4f224a`; its five findings were checked against the files at `f13ce0d`, rather than inferred from the brief's change description. No repair report marking a finding not actionable was supplied.

| Previous finding | Current passage and evidence | Disposition |
|---|---|---|
| R01, omitted differential and quantitative headlines | `TauCetiRoadmap/PolylogarithmFunctions/Suggested.lean:205`: “The real differential in every weight, in an arbitrary direction, including on the cut.” Lines 208–217 state it. Lines 294–386 state nine quantitative theorems, including sectorial growth and uniform endpoint bounds. | Repaired. All elaborate. The constants `C,A` precede every argument `z`. The differential and endpoint witnesses are recomputed below. |
| R02, golden-ratio Check in Lean | `TauCetiRoadmap/PolylogarithmFunctions/Suggested.lean:286`: “The exact interval pentagon”. This is the sole Layer 6 theorem; `rogers_golden` is absent. `TauCetiRoadmap/PolylogarithmFunctions/README.md:975` retains the golden values. | Repaired. At the golden argument the pentagon and reflection still give `2R(ρ)=3R(ρ²)` and `R(ρ)+R(ρ²)=π²/6`. |
| R03, undeclared API names and shape | `TauCetiRoadmap/PolylogarithmFunctions/README.md:5`: “supporting API targets are stated in prose.” The definition APIs are fact bullets. The former integrability/basepoint API identifiers are absent; the sectorial names now denote actual theorems. | Repaired. All 39 Lean declaration names occur in the README; seven numbered Lean layer comments follow README order. No API catalogue was added. |
| R04, common-path locator | `TauCetiRoadmap/PolylogarithmFunctions/README.md:253,472` cite “§7, p. 415”. | Repaired. Z90 line 907 through line 919, and the page image, contain the common-path matrix discussion. Page 413 remains attached to the Bernoulli combination. |
| R05, BorelRegulators consumer attribution | `TauCetiRoadmap/PolylogarithmFunctions/README.md:1130`: “these comparisons are not inputs to the BorelRegulators construction.” | Repaired. Polylogarithms §§2.3,3.7–3.8,4.4 and BorelRegulators's scope/downstream paragraph put the explicit symbol comparisons in Polylogarithms. |

**Coverage and principles.** Read all seven layers, their 45 numbered subsections, definitions, API bullets, Checks, proof routes and `Needs` clauses; examined all 39 Lean declarations (10 definitions and 29 admitted theorems). Read the repository README and CONTRIBUTING and the main versions of BelyiMaps, ConformalMapping and UniversalCovers for the supplier contracts and roadmap shape. No restricted arithmetic route, replanned supplier theory, upward/cyclic supply, copied source passage, computational algorithm, sorry'd data, `set_option`, or edit outside the folder was found. The functions take arbitrary complex arguments, integer weights where appropriate, and the sphere cross-ratio is over every field. The analytic constructions supply the algebraic/regulator consumers in one direction.

**Gate, elaboration and signatures.** The supplied gate is for this exact head and reports every scanner, metadata, dependency and targeted-build check passing (`build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`, `OK`). The outside-folder diff is empty, and the worktree remains clean. Built the three imported Tau Ceti modules, then separately ran the prescribed `lake env lean` on the original `Suggested.lean`: exit 0, exactly 29 `sorry` warnings, no other warning or error. A scratch copy with `#check @name` for all 39 declarations also elaborated. No binder was lost and no signature change was needed. In particular:

- Integer distribution retains `n : ℤ`, `m > 0` and all rotated slit-plane hypotheses; its exponent is an integer power.
- Monodromy is about the native universal cover, initialized by the actual tower germ, with a polynomial action and the inverse-peripheral convention. It does not quantify over an unrelated branch.
- The all-weight differential retains `n ≥ 2`, both puncture exclusions and arbitrary real direction `v : ℂ`.
- `crossRatioSphere` retains its universe-polymorphic field binder; the projective five-term theorem retains injectivity.
- The positive/negative/closed-disc bounds retain their distinct weight and radius restrictions; the closed-disc/Fourier bounds retain `N ≥ 1`.
- Sectorial bounds retain positive width/radius, width less than π, radius less than 1/2, and the terminal-germ predicate. The period-limit theorem retains `n ≥ 2` and an integer period.
- Endpoint constants are chosen before the universal quantifier over `z`. The two-sided expansion uses the punctured real-neighbourhood filter.

Tried each of the 29 admitted theorems with the individual one-tactic alternatives `rfl`, `simp`, and `infer_instance`, in a scratch copy. All 29 still required `sorry`; no probe produced an error. The pinned searches below found no single library declaration that supplies any retained headline by `exact`. There are no admitted examples, special-value theorems or boundary-case padding. The ten real-bodied definitions make these headlines statable; `IsPolylogBranchOn` is an actual continuation/germ condition, not a free proposition standing for missing mathematics.

**Dependency output.** The required command, run against main `929496d` and the supplied order, returned exactly:

```text
depcheck: 205 roadmaps, 1616 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No supplier gap is declared. Every mathematical prerequisite was traced to an earlier target, the pinned library, or BelyiMaps §§5.1,5.2,5.6 / ConformalMapping L4. In particular, branch independence precedes inversion and sphere continuity; endpoint distribution uses closed-disc continuity from Layer 1, avoiding a cycle through sphere continuity. Positivity applies the minimum principle to compact half-discs before exhaustion. The local-sector predicate supplies holomorphy by equality of terminal germs; connectedness and analytic uniqueness identify one determination throughout the sector.

**Headline inventory.** The deep results and their acceptance declarations are:

| README result | Suggested.lean acceptance theorem(s) |
|---|---|
| Integer-weight principal analytic family, §1.5 | `analyticOnNhd_polylog` |
| Tower continuation, universal-cover branch and polynomial monodromy, §§2.1–2.3 | `exists_polylogBranch_monodromy` |
| Distribution, both inversion regimes, reflection and Abel, §§3.1–3.4 | `polylog_distribution`, `polylog_inversion`, `polylog_inversion_of_nonpos`, `polylog_reflection`, `polylog_abel` |
| Functional equations on coherent branches, §3.5 | `polylog_inversion_continuation`, `abel_functionalEquation_continuation`; the README also derives reflection/distribution propagation by the same uniqueness argument |
| Single-valued analytic theory, §§4.3–4.7 | `singleValued_eq_of_isAnalyticContinuationAlong`, `analyticOnNhd_singleValued`, `fderiv_singleValued`, `singleValued_inv`, `singleValued_distribution`, `continuous_singleValuedSphere` |
| Bloch–Wigner one-form, Laplacian, positivity and five-term identities, §§5.4–5.8 | The one-form specializes `fderiv_singleValued`; `laplacian_blochWigner`, `blochWigner_pos`, `blochWigner_fiveTerm`, `blochWignerSphere_crossRatio_fiveTerm` |
| Rogers exact functional equation, §6.4 | `rogers_pentagon`; reflection follows by substituting the definition into Euler reflection, and special values remain README Checks |
| Quantitative analytic estimates, §§7.1–7.6 | `norm_polylog_sub_partialSum_le`, `norm_polylog_sub_partialSum_le_of_nonpos`, `norm_polylog_sub_partialSum_le_closedDisc`, `abs_singleValued_exp_sub_le`, `polylogBranch_isBigO_zero`, `polylogBranch_isBigO_infty`, `polylogBranch_tendsto_one`, `singleValued_endpoint_bounds`, `blochWigner_logarithmic_expansion` |

The remaining derivative-on-compact and global boundedness targets are consequences of the retained analyticity/continuity statements. The module docstring states that no headline is omitted for lack of a carrier; no missing-carrier stand-in was found.

**Source sample.** All six mathematical sources were fetched through the sources service from legal repositories or author pages. O93's mathematical displays and Z90/G95's scans were also read as page images; the OCR was not used to guess missing signs. No README locator is flagged unverified. All 15 seeded targets were checked at their printed locators, with these results. “Derived” distinguishes an argument owned here from a statement actually printed in the source.

| Seeded target | Locator and extracted evidence | Result |
|---|---|---|
| 1.3 The disc series | O93 §1.1 (1)–(3), p.50, O93 line 78 through line 84; Z07 introduction, p.5 | The source states positive integer weights on the open disc. Extension to nonpositive weights is explicitly derived by Euler differentiation in the README, not attributed verbatim to O93. |
| 1.4 Nonpositive weights are rational | O93 §1.1 (2)–(3), p.50, O93 line 82 through line 84 | The cited input is the recursion. The rational polynomial, its recurrence and `Aᵣ(1)=r!` are explicitly elementary consequences; direct induction gives the displayed recurrence. |
| 2.1 Tower germ and continuation | O93 §2.1, p.52, O93 line 114 through line 133; §2.3 (15), p.54, O93 line 165 through line 171; Z90 §7, p.415, Z90 line 907 through line 919 | Coherent continuation and triangular differential equation supported. README supplies the disc-primitives/compact-path construction. |
| 2.2 Branch on the universal cover | O93 §2 introduction/§2.1, pp.51–52, O93 line 107 through line 124 | Based homotopy classes and determinations through continuous sections agree. Native Tau Ceti action convention is separately translated. |
| 2.3 Monodromy | O93 Proposition 1 (8)–(9), p.53, O93 line 138 through line 153, checked in the image | Both generator signs, `Log^(n−1)/(n−1)!`, and prefixing convention agree. The polynomial action is the stated algebraic consequence. |
| 3.3 Euler reflection | O93 §4.1 (29), p.59, O93 line 260 through line 272 | Source principal domain is the twice-slit plane. README proves the totalized boundary extension, including 0 and 1, rather than dropping hypotheses silently. |
| 3.4 Abel | O93 §4.1 (30), p.59, O93 line 264 through line 272 | Five arguments, minus logarithmic product and `‖x‖+‖y‖<1` agree. |
| 4.1 Bernoulli coefficients/even transform | Z90 §7 (33),(35), pp.413–414, Z90 line 839 through line 881, images checked | `B₁=−1/2`, coefficients, `2s/(exp(2s)−1)` and `s/sinh(s)` agree. Formal power-series version multiplies before cancelling the nonunit. |
| 4.6 Inversion, conjugation, distribution | O93 §3.2 (20)–(22), pp.57–58, O93 line 242 through line 249 | Signs and factor agree after translating imaginary-valued even weights to real scalars. Endpoint cases are supplied separately. |
| 4.8 Trilogarithm | Z90 §7 (33), p.413, Z90 line 839 through line 843; O93 §3.2 (21), p.57, O93 line 244 | Weight-three finite sum and distribution supported. The differential and zero derivative at 1 are derived from §§4.5–4.7 with a uniform differential estimate. |
| 5.1 Bloch–Wigner | Z07 Part I §3, pp.10–11, Z07 line 395 through line 421; G95 §1.0 (1.2), p.201, G95 line 193 through line 199 | Definition, sign, circle series and endpoint normalization agree. O93 (19), p.57, uses `iD`; the README explicitly distinguishes this. |
| 5.4 One-form | G00 v1 Lemma 4.2 (29), p.18, G00 line 781 through line 783, image checked | Dividing its imaginary-valued convention by `i` gives the stated real one-form; differentiating the finite sum gives the same formula on local branches. |
| 5.7 Five-term relation | O93 §4.1 (32),(34), pp.59–60, O93 line 273 through line 283; Z07 (4), p.11, Z07 line 443 through line 452; GR v5 (3)–(4)/footnote 1, p.4, GR line 130 through line 134 and line 171 | Nondegenerate identities supported. The extra totalized cases are checked algebraically; `x=0` and `y=0` give the stated negative controls. |
| 6.4 Exact interval pentagon | Z07 Part II §1.A, p.23, Z07 line 1023 through line 1059 | The real five-term sum on `(0,1)²` is `3R(1)=π²/2`; reflection gives the README's three-term right side with no additive constant. |
| 7.6 Logarithmic singularities | Z07 Part I §3, p.10, Z07 line 401 through line 402; G95 §1.0, p.201, G95 line 195 through line 198 | Nondifferentiability and logarithmic singularity supported. The sharper two-sided cubic-logarithmic remainder is explicitly derived from the series and arctangent, not claimed as a source theorem. |

The quantitative rates and the general-field projective adapter are owned derivations with explicit proof routes, not purported quotations of stronger source results. Sources' convention and printing issues are recorded at the end; none is copied into a false roadmap statement.

**Adversarial calculations.** The table records exact algebra, convergent-series calculations, logarithmic local expansions and central differences recomputed for this review. `b=1/2`, `a=2πi`, `z₀=0.3+0.7i`, `v₀=0.6+0.8i`, `G=0.915965594177…`, and `ρ=(√5−1)/2`. Decimal tests are diagnostics, not interval certificates or proofs of universal assertions. Negative controls deliberately violate the named hypotheses. The review calculations use `Arg(negative real)=+π`; signed floating-point zero is not allowed to select the opposite bank. Large-argument evaluations using inversion are consistency tests of that identity, while the cut and ordinary off-disc tests use a separate local logarithmic expansion.

| Statement | Instances | Computed left side / object | Computed right side / control | Result / change |
|---|---|---|---|---|
| Domains Ω,U,Ω₂ | 0,1,−1,2,i | Ω: yes,no,yes,no,yes; U: no,no,yes,yes,yes | Ω₂ excludes ±1,±2, contains 0,i | agrees; no mathematical change |
| Log/cut orientation | Li₁(3), upper value | −log2−πi; −log2+πi | upper−lower=+2πi; CCW monodromy=−2πi | agrees; no mathematical change |
| Real log differential | z=i; v=1,i | d log∣z∣[1]=0; d log∣z∣[i]=1 | Re(1/i)=0; Re(i/i)=1 | agrees; no mathematical change |
| Totalization | Li₀(1),Li₁(1), a/0 | 0,0,0 | no analyticity at 1 follows from these values | agrees; no mathematical change |
| Bernoulli/parity conventions | c₀,c₁,c₂,c₃; π₂(i),π₃(i) | 1,−1,1/3,0; 1,0 | O93 P₂(i)=iG; here L₂(i)=G | agrees; no mathematical change |
| Integer distribution exponent | n=0,m=2,z=1/2 | Li₀(1/4)=1/3 | (Li₀(1/2)+Li₀(−1/2))/2=(1−1/3)/2=1/3 | agrees; no mathematical change |
| Cross-ratio conventions | (∞,0,1,3) | r=3; bracket=−2 | 1−r=−2; reciprocal convention=1/3 | agrees; no mathematical change |
| §1.1 polylog definition | n=−2,−1,0,1,2,3 at b | 6,2,1,0.693147180560,0.582240526465,0.537213193608 | Euler derivatives/radial integral/disc sums give the same values | agrees; no mathematical change |
| §1.1 zero API | z=0, all integer weights | Liₙ(0)=0 | zero numerator or zero logarithm gives 0 | agrees; no mathematical change |
| §1.2 radial integrability | k=0,z=0,1,2 | integrals 0,π²/6,π²/4−πi log2 | finite; z=2 has only an integrable log singularity at t=1/2 | agrees; no mathematical change |
| §1.2 endpoint majorant | k=0,1,2 | ∫₀¹(−log t)^k dt=1,1,2 | k!=1,1,2 | agrees; no mathematical change |
| §1.2 moving-singularity mass | δ=0.001, center s | ∫ from s−δ to s+δ of −log∣t−s∣=0.01581551056 | 2δ(1−logδ)=0.01581551056, independent of s | agrees; no mathematical change |
| §1.2 null changes | change t=1/2 at z=2 to 0 or 10⁶ | same integral π²/4−πi log2 | singleton has measure 0 | agrees; no mathematical change |
| §1.3 disc series | n=0,−1,1,2; z=b | 1,2,log2,0.582240526465 | ∑b^k, ∑kb^k, ∑b^k/k, ∑b^k/k² respectively | agrees; no mathematical change |
| §1.4 rational family | r=0,1,2; z=b | A₀=1,A₁=1,A₂=1+X; Li values 1,2,6 | zAᵣ(z)/(1−z)^(r+1)=1,2,6; Aᵣ(1)=1,1,2 | agrees; no mathematical change |
| §1.4 pole control | Li₀(1−ε), ε→0+ | 1/ε−1→∞ | totalized Li₀(1)=0 is not a continuous extension | agrees; no mathematical change |
| §1.5 analytic family/Euler recursion | n=1,z=b; n=3,z=−1 | Li₁′(b)=2; −Li₃′(−1)=−π²/12 | Li₀(b)/b=2; Li₂(−1)=−π²/12 | agrees; no mathematical change |
| §1.5 derivative at zero | every n; naive quotient | Liₙ′(0)=1 from first coefficient | Liₙ₋₁(0)/0=0; quotient identity excludes 0 | agrees; no mathematical change |
| §1.6 conjugation | z=−1; cut z=3,n=1 | Li₂(−1)=−π²/12; Li₁(3)=−log2−πi | conjugate at −1 same; at 3 =−log2+πi, hence cut excluded | agrees; no mathematical change |
| §1.7 closed-disc/zeta | n=2,3; z=1 | 1.64493406685,1.20205690316 | ζ(2),ζ(3) | agrees; no mathematical change |
| §1.7 expZeta | n=2; circle a=0,1/2,1/4 | π²/6,−π²/12,−π²/48+iG | matching ∑exp(2πiak)/k² | agrees; no mathematical change |
| §1.7 negative control | n=1,z=1−ε | −log ε→∞ | assigned Li₁(1)=0; no closed-disc continuity | agrees; no mathematical change |
| §2.1 polylogTower/truncation | N=0,1,2 at b | (−log2); (−log2,log2); (−log2,log2,0.582240526465) | restriction to first N′+1 coordinates gives tower N′ | agrees; no mathematical change |
| §2.1 coherent ODE | N=2 at b | Li₂′(b)=2log2 | Li₁(b)/b=2log2; independently shifted Li₁ gives 2log2−4πi | agrees; no mathematical change |
| §2.1 exponential relation | principal and T₀ log at b | exp(−log2)=1/2; exp(−log2+2πi)=1/2 | both equal endpoint b | agrees; no mathematical change |
| §2.1 continuation to −1 | upper/lower half-circle | Li₂=−π²/12 both; Log=±πi | exp(±πi)=−1; straight segment hits excluded 0 | agrees; no mathematical change |
| §2.1 principal domain by height | z=3,N=0,1 | log analytic; Li₁ upper−lower=2πi | N=0 tower analytic, N=1 not continuous | agrees; no mathematical change |
| §2.2 branch characterization | constant path | B(base)=(−log2,log2,0.582240526465) | terminal continuation has exactly those values | agrees; no mathematical change |
| §2.2 principal entries | prefix γ₀ to upper path ending −1 | Log=3πi; Li₂=−π²/12 | principal Li₂ unchanged though Log differs by 2πi | agrees; no mathematical change |
| §2.2 section nonexample | global section on U | going once around 0 changes Log by 2πi | single-valued Log would change by 0; contradiction | agrees; no mathematical change |
| §2.3 action direction | periph₁⁻¹ • base | Li₁=log2−2πi; Log=−log2 | prefixes γ₁, not its inverse | agrees; no mathematical change |
| §2.3 generator/inverse | T₁ then inverse, weight 2 | Li₂(b)+2πi log2 then Li₂(b) | subtract/add a Log cancel exactly | agrees; no mathematical change |
| §2.3 nonabelian order | T₁T₀ and T₀T₁, weight 2 | difference −a²=4π²=39.4784176044 | nonzero; replacing free group by abelian action fails | agrees; no mathematical change |
| §2.3 polynomial action | N=2 coordinates L,u₁,u₂ | τ₀=(L+a,u₁,u₂); τ₁=(L,u₁−a,u₂−aL) | inverse maps use −a; degrees ≤1 and compositions polynomial | agrees; no mathematical change |
| §2.3 height-zero boundary | N=0 | τ₀(L)=L+a; τ₁(L)=L | no positive-weight indices exist; log monodromy remains | agrees; no mathematical change |
| §2.3 transported branch | upper lift of −1 then T₁ | −π²/12−2πi·πi=23π²/12 | README second branch value 23π²/12 | agrees; no mathematical change |
| §2.4 jump/lower continuity | x=2,n=1,2,3 | upper−lower: 2πi,2πi log2,πi log²2 | 2πi log^(n−1)(2)/(n−1)! | agrees; no mathematical change |
| §2.4 nonpositive weights | n=0,x=2 | upper=lower=−2 | rational continuity; jump 0 | agrees; no mathematical change |
| §3.1 distribution | m=1 and z=0 | Liₙ(z)=Liₙ(z); Liₙ(0)=0 | factor 1; finite sum of zeros=0 | agrees; no mathematical change |
| §3.1 general distribution | m=2,z=z₀,n=1,2,3 | −.379561084742+.291456794478i; −.393179943739+.349581884371i; −.398024637789+.382618938673i | same three values from 2^(n−1)(Liₙ(z₀)+Liₙ(−z₀)) | agrees; no mathematical change |
| §3.1 domain test | m=2,z=i and z=2 | i²=−1∈Ω; 2²=4∉Ω | ±i∈Ω; rotation +2 excluded | agrees; no mathematical change |
| §3.2 Bernoulli inversion | n=1,2; z=−1 | 0,−π²/6 | −(2πi)^n Bₙ(1/2)/n! gives 0,−π²/6 | agrees; no mathematical change |
| §3.2 lower-cut inversion | n=2,z=2 | Li₂(2)+Li₂(1/2)=π²/3−log²2/2−πi log2 | B₂ evaluated at 1+log2/(2πi) gives same | agrees; no mathematical change |
| §3.2 rational inversion | n=0,−1; z=2 | −2+1=−1; 2−2=0 | weight-zero exceptional constant −1; lower weights 0 | agrees; no mathematical change |
| §3.3 reflection | z=0,1,1/2 | π²/6,π²/6,2Li₂(1/2) | π²/6,π²/6,π²/6−log²2 | agrees; no mathematical change |
| §3.3 reflection on cut | z=−1 or 2 | Li₂(−1)+Li₂(2)=1.64493406685−2.17758609030i | π²/6−Log z Log(1−z) same | agrees; no mathematical change |
| §3.4 Abel | x=y=1/4 | Li₂(1/9)=0.114360206979 | 2Li₂(1/3)−2Li₂(1/4)−log²(3/4)=0.114360206979 | agrees; no mathematical change |
| §3.4 Abel missing correction | x=y=1/4 | uncorrected RHS exceeds LHS by 0.0827609748 | log²(3/4)=0.0827609748 | agrees; no mathematical change |
| §3.4 Abel zero | x=0,y=1/4 | Li₂(0)=0 | Li₂(0)+Li₂(y)−Li₂(0)−Li₂(y)−0=0 | agrees; no mathematical change |
| §3.5 inversion continuation | constant c=−1,n=2 | −π²/6 | log(−c)=0 in independently initialized germ; Bernoulli side −π²/6 | agrees; no mathematical change |
| §3.5 reflection/distribution continuation | constant paths z=1/2; m=2,z=1/2 | reflection 1.16448105293; distribution Li₂(1/4)=0.267652639083 | π²/6−log²2=1.16448105293; 2(Li₂(1/2)+Li₂(−1/2))=0.267652639083 | agrees; no mathematical change |
| §3.5 Abel continuation | constant c=(1/4,1/4) | initial and final defect 0 | seven coherently initialized germs give same 0 | agrees; no mathematical change |
| §3.5 independent branch defect | shift only Li₂(b) by T₁ | extra 2πi log2 ≠0 | Φ substitution predicts exactly 2πi log2 | agrees; no mathematical change |
| §3.6 exact Li₂ values | 1,−1,1/2 | 1.64493406685,−0.822467033424,0.582240526465 | π²/6,−π²/12,π²/12−log²2/2 | agrees; no mathematical change |
| §4.1 coefficient even transform | k=1,3 | 1−1=0; 1/6−1/2+1/3=0 | odd coefficients of s/sinh s are 0; wrong B₁ gives 2 at k=1 | agrees; no mathematical change |
| §4.1 generating series | through s³ | C(s)=1−s+s²/3+0s³+… | C(s)(exp(2s)−1)=2s+0s²+0s³+… | agrees; no mathematical change |
| §4.2 singleValued definition | n=2,3; z=0,1,−1 | L₂:0,0,0; L₃:0,ζ(3),−3ζ(3)/4 | projected finite sums/endpoints same; odd weight not identically zero on reals | agrees; no mathematical change |
| §4.2 sphere extension | ∞ and finite i | Lₙ(∞)=0; L₂(i)=G | OnePoint.elim gives 0 and G | agrees; no mathematical change |
| §4.2 unit circle/weight-one distinction | n=2,3,z=i; n=1,z=b | L₂(i)=G; L₃(i)=−3ζ(3)/32; L₁(b)=log2 | Im Li₂(i),Re Li₃(i); log∣b∣=−log2 is a different function | agrees; no mathematical change |
| §4.3 all-branch independence | n=2,Log=ℓ+iθ,T₁ | unprojected change 2πθ | imaginary projection 0; wrong c₁ gives imaginary change −4πℓ | agrees; no mathematical change |
| §4.3 cut cancellation | n=2,x=2 | Li₂ imaginary jump +2πlog2 | correction jump −2πlog2; sum 0 | agrees; no mathematical change |
| §4.3 odd-weight cancellation | n=3,T₁,ℓ=0,θ=π | change −2πi(iπ)²/2=π³i | real projection 0; unprojected change nonzero | agrees; no mathematical change |
| §4.4 real analyticity | n=2,z=2; v=i | dD(2)[i]=log2=0.693147180560 | upper/lower local germ gives same derivative | agrees; no mathematical change |
| §4.5 differential, n=2 | z₀,v₀ | central difference 0.269228684890 | formula 0.269228684861 | agrees; headline present, no change |
| §4.5 differential, n=3 | z₀,v₀ | central difference 0.302337427968 | formula 0.302337427923 | agrees; headline present, no change |
| §4.5 differential, n=4 | z₀,v₀ | central difference 0.026380065421 | formula 0.0263800653954 | agrees; headline present, no change |
| §4.5 differential, n=5 | z₀,v₀ | central difference 0.325566039397 | formula 0.325566039347 | agrees; headline present, no change |
| §4.6 inversion | z₀,n=2,3,4,5 | Lₙ(z₀)=.981810571427,.281447553680,.943961280142,.365325213460 | (−1)^(n−1)Lₙ(1/z₀) gives same four values | agrees; no mathematical change |
| §4.6 conjugation | n=2,3; z=i | L₂(−i)=−G; L₃(−i)=−3ζ(3)/32 | −L₂(i),+L₃(i) | agrees; no mathematical change |
| §4.6 distribution | m=2,z₀,n=2,3,4,5 | Lₙ(z₀²)=.508346320791,−.649742533329,.643558118710,−.656288429364 | 2^(n−1)∑Lₙ(±z₀) gives same four values | agrees; no mathematical change |
| §4.6 endpoint distribution | m=2,n=3,z=1 | ζ(3) | 4(ζ(3)−3ζ(3)/4)=ζ(3) | agrees; no mathematical change |
| §4.7 sphere continuity | n=2; z=.001i,1000i,1+.001i | values .0079077528653,.0079077528653,.0079077528653 | limits 0 at 0,∞,1 respectively | agrees; no mathematical change |
| §4.7 odd endpoint | n=3; z=1+.001i | 1.20205269928 | limit ζ(3)=1.20205690316, not 0 | agrees; no mathematical change |
| §4.8 trilogarithm differential | z₀,v₀ | 0.302337427968 difference quotient | 0.302337427923 expanded weight-three formula | agrees; no mathematical change |
| §4.8 derivative at 1 | z=1+ti,t=.001,.0001 | (L₃(z)−ζ(3))/t=approximately −.004204,−.000536 | tends to derivative value 0 | agrees; no mathematical change |
| §4.8 odd values | z=1,−1 | 1.20205690316,−.901542677370 | ζ(3),−3ζ(3)/4 | agrees; no mathematical change |
| §5.1 blochWigner definition | z=0,1,2,i | 0,0,0,G | at 2: Im Li₂=−πlog2 plus Arg(−1)log2=+πlog2 | agrees; no mathematical change |
| §5.2 L₂=D | z=z₀,i,2 | L₂=.981810571427,G,0 | D=.981810571427,G,0 | agrees; no mathematical change |
| §5.3 sixfold symmetry | z=i | D(i)=G; D(1−i)=−G; D(1/i)=−G; D(1/(1−i))=G | signs +,−,−,+ | agrees; no mathematical change |
| §5.3 conjugation/reals/totalization | z=i,2,0,1 | D(−i)=−G; D(2)=0; D(1/0)=0; D(1−1)=0 | −D(i),0,−D(0),−D(1) | agrees; no mathematical change |
| §5.4 one-form | z=i; v=1,i | dD[1]=log2/2; dD[i]=0 | −log∣1−i∣ Im(1/i)=log2/2; radial term 0 | agrees; no mathematical change |
| §5.5 Laplacian | z=i,2,z₀ | ΔD(i)=−1; ΔD(2)=0; numerical ΔD(z₀)=−2.463054116 | −2y/(∣z∣²∣1−z∣²)=−1,0,−2.463054187 | agrees; no mathematical change |
| §5.6 positivity | z=i,−i,2 | G>0; −G<0; 0 | upper/lower/real cases; weak ≥0 alone would not exclude zero | agrees; no mathematical change |
| §5.7 affine five-term | x=i,y=−1 | D arguments: G,0,G,G,−G | signed sum G−0+G−G−G=0 | agrees; no mathematical change |
| §5.7 generic affine five-term | x=i/2,y=(1+i)/2 | D arguments .808598391247,.915965594177,−.915965594177,−.511666398554,.511666398554 | signed sum 0 to displayed numerical precision | agrees; no mathematical change |
| §5.7 diagonal and ones | (x,y)=(i,i),(1,i),(i,1) | signed sums 0,0,0 | G−G+0−0+0; 0−G+G; G+(-G) | agrees; no mathematical change |
| §5.7 zero negative controls | (0,.3+.8i),(i,0) | signed sums .995026887744,−G | target 0 fails; retain both x≠0,y≠0 | agrees; no mathematical change |
| §5.7 Abel form | x=1,y=i | D(xy/((1−x)(1−y)))=D(0)=0 | D(y/(1−x))+D(x/(1−y))−D(x)−D(y)=0+G−0−G=0 | agrees; no mathematical change |
| §5.7 cyclic differential cancellation | x=y=1/2 | arguments 1/2,2/3,2/3,1/2,3/4; D values all 0 | sum 0; 1−1/2=(2/3)(3/4) pins cyclic relation | agrees; no mathematical change |
| §5.8 finite crossRatio | (0,0,1,2),(0,0,0,2) | 1,0 | nonzero denominator gives 1; zero denominator totalizes to 0 | agrees; no mathematical change |
| §5.8 cancellation extension | (∞,0,1,3),(0,∞,1,3) | 3,1/3 | (0−3)/(0−1)=3; (0−1)/(0−3)=1/3 | agrees; no mathematical change |
| §5.8 other infinity positions | (0,1,∞,3),(0,1,2,∞) | 2/3,2 | (1−3)/(0−3)=2/3; (0−2)/(1−2)=2 | agrees; no mathematical change |
| §5.8 multiple infinities | (∞,∞,1,3) | 0 by definition | outside injective locus; no invariance theorem imposed | agrees; no mathematical change |
| §5.8 double transposition | (a,b,c,d)=(0,1,2,3) | r=4/3 | r(1,0,3,2)=4/3 | agrees; no mathematical change |
| §5.8 homogeneous rescaling | (2,0),(0,3),(5,5),(21,7) | 10·(−63)/(14·(−15))=3 | r(∞,0,1,3)=3 | agrees; no mathematical change |
| §5.8 general-field Möbius invariance | K=F₃, coordinate swap | r(∞,0,1,2)=2 | r(0,∞,1,2)=1/2=2 in F₃ | agrees; no mathematical change |
| §5.8 normalize_five | K=Q, tuple (∞,0,1,2,3) | identity g; x=2,y=3 | normalized tuple unchanged; coincident first pair cannot map to ∞,0 | agrees; no mathematical change |
| §5.8 small fields | K=F₂,F₃ | projective lines have 3,4 points | no injective Fin 5; conditional normalization makes no false existence assertion | agrees; no mathematical change |
| §5.8 projective five-term | (∞,0,1,z₀,−1+.2i) | D face values −.948037100886,.714284985152,.817005378209,.136493863598,.981810571427 | alternating sum 0 | agrees; no mathematical change |
| §5.8 finite five-term/sign | (0,1,2,i,1+i) | D face values .808598391247,.511666398554,0,.915965594177,.619033601484 | alternating sum 0; unsigned sum 2.85526398546≠0 | agrees; no mathematical change |
| §5.8 bracket conversion | tuple (∞,0,1,3) | bracket=−2 | 1−r=−2; D(1−z)=−D(z) accounts for sign | agrees; no mathematical change |
| §5.8 cyclic bracket algebra | tuple 0,1,2,3,4 | b=(-1/3,−1/3,−2,−1/8,−2); 1−b=(4/3,4/3,3,9/8,3) | −bᵢ/(bᵢ₊₂bᵢ₊₃)=(4/3,4/3,3,9/8,3); all D=0 | agrees; no mathematical change |
| §6.1 rogers definition/API | x=0,1,1/2 | 0,1.64493406685,.822467033424 | 0,π²/6,π²/12; logarithmic product cancels log²2/2 at midpoint | agrees; no mathematical change |
| §6.2 derivative/monotonicity | x=1/2 | R′=1.38629436112>0 | −(log(1/2)/(1/2)+log(1/2)/(1/2))/2=2log2 | agrees; no mathematical change |
| §6.2 endpoint continuity | x→0+,1− | x log x→0; R limits 0,π²/6 | assigned endpoints 0,π²/6 | agrees; no mathematical change |
| §6.3 reflection | x=0,1/2,ρ | 0+π²/6; 2·π²/12; π²/10+π²/15 | π²/6 in all three cases | agrees; no mathematical change |
| §6.4 pentagon | x=y=1/2; x=.2,y=.7 | LHS 1.64493406685; 1.49466271167 | RHS 1.64493406685; 1.49466271167 | agrees; no mathematical change |
| §6.4 wrong uncorrected function | x=y=1/2 | raw Li₂ LHS−RHS=log²(3/2)=.164401953893 | Rogers correction removes defect exactly | agrees; no mathematical change |
| §6.5 golden values | x=y=ρ | 2R(ρ)=1.97392088022; 3R(ρ²)=1.97392088022 | R(ρ)=π²/10,R(ρ²)=π²/15 | agrees; kept only in README, no change |
| §7.1 positive truncation | n=2,z=r=1/2,N=1 | error .082240526465 | upper bound 1/8=.125 | agrees; headline present, no change |
| §7.1 empty sum and zero radius | N=0,r=1/2; r=0 | Li₂(1/2)=.582240526465; error 0 | bounds 1 and 0 | agrees; no mathematical change |
| §7.1 negative-weight tail | n=−1,r=1/2,N=1 | ∑ from k=2 of k/2^k=1.5 | correct rational tail 1.5; naive positive-weight formula 1 fails | agrees; no mathematical change |
| §7.2 closed-disc tail | n=2,z=1,N=1 | π²/6−1=.644934066848 | bound 1 | agrees; no mathematical change |
| §7.2 Fourier tail | t=1,N=20 | actual error .0000198582507 | bound 1/20=.05 | agrees; headline present, no change |
| §7.3 growth at zero | n=2,T₁ branch,z=ε>0 | imaginary part −2π log ε | order ∣log ε∣; principal Li₂(ε)~ε | agrees; no mathematical change |
| §7.3 growth at infinity | n=1,z=R>1 | Li₁(R)=−log(R−1)−πi | magnitude asymptotic log R; degree n=1 | agrees; no mathematical change |
| §7.3 period limit at 1 | n=2,Log→2πi,T₁ | change −2πi·2πi=4π² | ζ(2)+m(2πi)² with m=−1 | agrees; no mathematical change |
| §7.3 excluded weight one | z=1−ε | Li₁=−log ε→∞ | no finite ζ(1) limit; restriction n≥2 essential | agrees; no mathematical change |
| §7.4 small/large modulus | n=2,z=.001i,1000i | absolute values .0079077528653 both | base rate .001(1+∣log .001∣)=.007907755279 | agrees; no mathematical change |
| §7.4 modulus at 1 | n=2,3,4,z=1+.001i | absolute differences .0079077528653,.00000420387530,.00120205504563 | base rate .007907755279 for each; one fixed constant per weight suffices for these samples | agrees; headline present, no change |
| §7.5 compact derivative bound | K={i},n=2,r=1 | operator norm log2/2=.34657359028 | finite supremum .34657359028; singleton Lipschitz distances both 0 | agrees; no mathematical change |
| §7.5 puncture negative control | D(it)/t, t=.001,.0001 | 7.9077528653,10.2103403402 | unbounded as t→0; no uniform Lipschitz constant at 0 | agrees; no mathematical change |
| §7.6 two-sided expansion | t=±.001 | D(it)=±.00790775286529 | t(1−log∣t∣)=±.00790775527898; ratio .999999694769 | agrees; no mathematical change |
| §7.6 nondifferentiability at 1/∞ | reflection and inversion of it | D(1+it)=D(it); D(1/(it))=−D(it) | quotients inherit ±(1−log∣t∣), unbounded | agrees; no mathematical change |
| §7.7 global range | D(i),D(2); R(0),R(1) | G,0; 0,π²/6 | ∣D∣≤1.01494…; R in [0,π²/6] | agrees; no mathematical change |
| §7.7 weighted finite sum | one error ε, coefficient −3; empty family | absolute error 3∣ε∣; 0 | bound ∣−3∣∣ε∣=3∣ε∣; empty bound 0 | agrees; no mathematical change |
| §3.2 excluded inversion bank | n=2,z=1/2 | Li₂(z)+Li₂(1/z)=3.049641626737−2.177586090304i | stated Bernoulli expression=3.049641626737+2.177586090304i | fails outside domain, as intended; keep exclusion |
| §3.4 genuinely complex Abel | x=.1+.2i,y=.2−.1i | .0498596743347+.0464022556800i | same from the four dilogarithms and log product | agrees; no change |
| §4.5 cut differential, n=2 | z=2.5,v₀ | central difference .358939555722 | formula .358939555738 | agrees; no change |
| §4.5 cut differential, n=3 | z=2.5,v₀ | central difference −.082223247089 | formula −.082223247057 | agrees; no change |
| §4.5 cut differential, n=4 | z=2.5,v₀ | central difference .312804091848 | formula .312804091858 | agrees; no change |
| §4.5 cut differential, n=5 | z=2.5,v₀ | central difference −.067052625274 | formula −.067052625263 | agrees; no change |
| §7.3 puncturedSector | θ=0,w=π/4,δ=1/4; z=1/8,0,i/8,1/4 | membership true,false,false,false | radial/angular pairs (1/8,0),(0,0),(1/8,π/2),(1/4,0) | agrees; strict bounds discriminate |
| §7.3 sector rotation and charts | rotate 1/8 by π/2 | i/8; translated point 1+i/8; inverse −8i | norms 1/8, distance from 1 is 1/8, inverse norm 8>4 | agrees; no change |
| §7.3 empty/negative-axis sector | w=0; θ=π,w=π/4,z=−1/8 | first sector empty; second rotated argument 0 | strict condition 0<0 fails; 0<π/4 succeeds | agrees; positive width prevents empty-filter vacuity |
| §7.3 IsPolylogBranchOn, correct germ | n=1; z=1/8 and 1/16 | Li₁=.133531392625,.064538521138 | log(8/7),log(16/15); after T₁ subtract 2πi at both points | agrees; restriction preserves actual germs |
| §7.3 IsPolylogBranchOn, wrong functions | constant 0 or constant log(8/7), at 1/8 | both derivatives 0; second value matches Li₁ | every continued Li₁ derivative=8/7; germ equality fails | wrong models excluded; no change |
| §7.3 n=1 degree-zero bound at zero | branch Li₁−2πi,z→0 | tends −2πi, modulus tends 2π | comparison 1+∣log∣z∣∣⁰=2; ratio tends π | agrees; branch-dependent constant needed |
| §7.3 period limits, n=2,3,4 | continued Log→2πi, apply T₁ | shifts 39.4784176044,124.0251067212i,−259.7575760907 | m=−1 times (2πi)ⁿ/(n−1)! gives same values | agrees; factorial and sign pinned |
| §7.4 endpoint bounds, n=4 | z=.001i,1000i | absolute values .023813447575 at both | rate .001(1+log³1000)=.330617931952; same C can serve both | agrees; no change |
| §7.6 normalized two-sided remainder | t=+.001,−.001 | remainder −2.4136948·10⁻⁹,+2.4136948·10⁻⁹ | denominator 7.9077553·10⁻⁹; ratios −.30523135,+.30523135 | agrees; cubic-log error and two-sided filter |


The table contains **141 rows**, covering every numbered subsection, all 39 Lean declarations and the sampled targets. No tested instance refuted a roadmap statement. The positive sign of `D(1000i)` corrects the previous review table, not the roadmap. Finite tests are accompanied by the source, hypothesis and proof-route checks above.

**Pinned declarations opened.** The following 37 representative entries were read with their hypotheses, in addition to the native definitions and the expanded signatures. Mathlib is pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Paths are relative to the corresponding pinned library root. Their presence is not inferred from a newer online version.

| Pin | Declaration | File and line | Scope checked |
|---|---|---|---|
| Mathlib | `Complex.log` | `Mathlib/Analysis/SpecialFunctions/Complex/Log.lean:30` | `Real.log ‖x‖ + arg x * I`; total definition, no continuity claim on the cut. |
| Mathlib | `Complex.arg_neg_one` | `Mathlib/Analysis/SpecialFunctions/Complex/Arg.lean:208` | Argument of −1 is +π. |
| Mathlib | `Complex.hasDerivAt_log` | `Mathlib/Analysis/SpecialFunctions/Complex/LogDeriv.lean:37` | Requires membership in slit plane. |
| Mathlib | `Complex.hasSum_taylorSeries_neg_log'` | `Mathlib/Analysis/SpecialFunctions/Complex/LogBounds.lean:289` | Norm <1; positive indexing. |
| Mathlib | `intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le` | `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1140` | Continuity, interior derivative and interval integrability are separate assumptions. |
| Mathlib | `MeromorphicOn.intervalIntegrable_log_norm` | `Mathlib/Analysis/SpecialFunctions/Integrability/Log.lean:48` | Compact interval meromorphic input; handles logarithmic singularities. |
| Mathlib | `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` | `Mathlib/Analysis/Analytic/Uniqueness.lean:223` | Both analytic, preconnected set, point in set and equality of germs. |
| Mathlib | `IsOpen.exists_is_const_of_fderiv_eq_zero` | `Mathlib/Analysis/Calculus/MeanValue.lean:602` | Open preconnected set and differentiability. |
| Mathlib | `Set.Countable.isPathConnected_compl_of_one_lt_rank` | `Mathlib/Analysis/Normed/Module/Connected.lean:44` | Real rank >1, satisfied by ℂ. |
| Mathlib | `riemannZeta_two` | `Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean:226` | Complex zeta value π²/6. |
| Mathlib | `zeta_nat_eq_tsum_of_gt_one` | `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:222` | Natural k>1; zero-index term totalizes to 0. |
| Mathlib | `hasSum_one_div_nat_pow_mul_fourier` | `Mathlib/NumberTheory/ZetaValues.lean:339` | k≥2 and x∈[0,1]; paired Fourier signs checked. |
| Mathlib | `Polynomial.derivative_bernoulli` | `Mathlib/NumberTheory/BernoulliPolynomials.lean:117` | k Bₖ₋₁; k=0 handled. |
| Mathlib | `Polynomial.bernoulli_eval_one_sub` | `Mathlib/NumberTheory/BernoulliPolynomials.lean:245` | Evaluation statement is over ℚ; x=1/2 used for even transform is legal. Complex transfer uses the polynomial identity. |
| Mathlib | `bernoulliPowerSeries_mul_exp_sub_one` | `Mathlib/NumberTheory/Bernoulli.lean:268` | Product equals X; does not invert X as a power-series unit. |
| Mathlib | `InnerProductSpace.instLaplacian` | `Mathlib/Analysis/InnerProductSpace/Laplacian.lean:138` | Positive Euclidean trace of second derivative, not its negative. |
| Tau Ceti | `IsAnalyticContinuationAlong` | `TauCeti/Analysis/Complex/Conformal/Continuation/Basic.lean:190` | Continuous path, analytic germs, local germ agreement; no arbitrary family with only endpoint values. |
| Tau Ceti | `ContinuesAlong` | `TauCeti/Analysis/Complex/Conformal/Continuation/Basic.lean:408` | Existence of continuation plus initial germ. |
| Tau Ceti | `monodromy_theorem` | `TauCeti/Analysis/Complex/Conformal/Monodromy.lean:386` | Continuations along a homotopy and common starting germs. |
| Tau Ceti | `ContinuesInside.exists_analyticOnNhd` | `TauCeti/Analysis/Complex/Conformal/GlobalBranch.lean:214` | Open simply connected domain and a basepoint in it. |
| Tau Ceti | `UniversalCover` | `TauCeti/AlgebraicTopology/UniversalCover/Basic.lean:68` | Endpoint and path class; covering properties require further hypotheses. |
| Tau Ceti | `UniversalCover.isCoveringMap` | `TauCeti/AlgebraicTopology/UniversalCover/Covering.lean:58` | Local path connectivity and semilocal simple connectivity. |
| Tau Ceti | `UniversalCover.smul_mk` | `TauCeti/AlgebraicTopology/UniversalCover/Action.lean:63` | Prepends inverse loop; matches the README's Tⱼ convention. |
| Tau Ceti | `exists_differentiableOn_eqOn_exp_comp` | `TauCeti/Analysis/Complex/BranchLogRoot.lean:155` | Open simply connected domain, holomorphic nonvanishing map. |
| Tau Ceti | `crossRatio_comp_eq_of_sub_eq_div` | `TauCeti/Algebra/Field/LinearFractional.lean:51` | Any field, κ≠0, nonvanishing denominators on S; coincidences allowed in totalized affine formula. |
| Tau Ceti | `ge_of_laplacian_nonpos_ge_frontier` | `TauCeti/Analysis/InnerProductSpace/Laplacian/WeakMaximumPrinciple.lean:148` | Compact K, continuity, interior C² and frontier bound. |
| Tau Ceti | `eqOn_const_of_laplacian_nonpos_of_isMinOn` | `TauCeti/Analysis/InnerProductSpace/Laplacian/StrongMaximumPrinciple.lean:356` | Open preconnected domain and attained interior minimum. |
| Mathlib | `DifferentiableOn.isExactOn_ball` | `Mathlib/Analysis/Complex/HasPrimitives.lean:291` | Holomorphic input on a ball supplies a primitive. |
| Mathlib | `Complex.tendsto_tsum_powerSeries_nhdsWithin_stolzCone` | `Mathlib/Analysis/Complex/AbelLimit.lean:241` | Boundary convergence with the specified approach, not unrestricted cut continuity. |
| Mathlib | `hasDerivAt_integral_of_dominated_loc_of_deriv_le` | `Mathlib/Analysis/Calculus/ParametricIntegral.lean:286` | Measurability, integrability and local derivative domination are explicit premises. |
| Mathlib | `HurwitzZeta.expZeta` | `Mathlib/NumberTheory/LSeries/HurwitzZeta.lean:116` | Circle parameter in `UnitAddCircle`; series theorem at line 129 requires Re(s)>1. |
| Mathlib | `HurwitzZeta.expZeta_zero` | `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:132` | Parameter zero comparison, separate from arbitrary boundary convergence. |
| Mathlib | `bernoulli` | `Mathlib/NumberTheory/Bernoulli.lean:194` | B₁=−1/2 and B₂=1/6 at lines 204,207. |
| Mathlib | `Polynomial.bernoulli` | `Mathlib/NumberTheory/BernoulliPolynomials.lean:48` | Rational polynomial carrier, mapped to complex coefficients for inversion. |
| Mathlib | `PowerSeries.rescale` | `Mathlib/RingTheory/PowerSeries/Basic.lean:559` | Coefficient-wise rescaling supplies the substitution 2s. |
| Tau Ceti | `isAnalyticContinuationAlong_iff_continuousOn_germPoint` | `TauCeti/Analysis/Complex/Conformal/Continuation/Etale.lean:109` | Native continuations are continuous germ-space lifts. |
| Tau Ceti | `ThricePuncturedSphere.periph0`, `periph1` | `TauCeti/AlgebraicTopology/ThricePuncturedSphere/PeripheralLoops.lean:168,172` | Both are classes of the stated counterclockwise loops. |

The native `AnalyticOnNhd` definition is pointwise analyticity at each point of the set (`Mathlib/Analysis/Analytic/Basic.lean:120`); it does not make a set open. The README supplies openness where its proof routes need it. `OnePoint` is used as the native sphere carrier, and the general-field projective adapter was checked against `OnePoint.equivProjectivization_smul` in `Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean:128`. The logarithm integrability theorem alone does not give uniform integrability; §1.2 includes the additional moving-singularity argument.

**Ownership and citation resolution.** Object searches used the required roadmap grep/show tools, the pinned libraries, main, board packages and the supplied sibling heads. No second `TauCetiRoadmap.PolylogarithmFunctions` namespace was found. Searches for polylogarithms, Bloch–Wigner/Rogers functions and cross-ratios found no competing pinned classical polylogarithm construction. Logarithmic series, zeta, Bernoulli, general continuation and affine cross-ratio results already present are cited as inputs. The new objects are the integer-weight analytic family, its coherent tower and single-valued combinations, and the field-general sphere adapter of the existing affine invariant.

Nine roadmap contracts were resolved as follows. Downstream section numbers are checked against the supplied heads, not remembered from the previous report.

| Resolved roadmap contract | Location examined | Ownership/convention result |
|---|---|---|
| BelyiMaps §§5.1,5.2,5.6 on main | `TauCetiRoadmap/BelyiMaps/README.md:1620,1680,1874` | U, basepoint, both counterclockwise loops and free fundamental group supplied. |
| ConformalMapping L4 on main | `Completed/ConformalMapping/README.md:127` | General continuation and monodromy supplied, not replanned here. |
| UniversalCovers on main | `Completed/UniversalCovers/README.md` | Native endpoint/path-class model and inverse-prefix action agree with the pin. |
| Polylogarithms, supplied head | `TauCetiRoadmap/Polylogarithms/README.md:70,189,519,544,642` | Consumes this analytic family; §§2.3,3.7,3.8,4.4 own explicit symbol/regulator comparisons. |
| K3BlochGroups, supplied head | `TauCetiRoadmap/K3BlochGroups/README.md:15,129` | Algebraic configurations and quotients stay there; sphere adapter supplied here. Reciprocal convention explicitly distinguished. |
| HabiroNahmSeries, supplied head | `TauCetiRoadmap/HabiroNahmSeries/README.md:82` | Interval R and its complement π²/6−R are distinguished; arithmetic torsion stays downstream. |
| HabiroNumberFields, supplied head | `TauCetiRoadmap/HabiroNumberFields/README.md:111,356` | Classical complex identities consumed; its Landen and quantum comparisons remain downstream. |
| PeriodsAndSpecialValues, supplied head | `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:226` | Classical analytic realization consumed; no competing foundational construction found. |
| BorelRegulators, supplied head | `TauCetiRoadmap/BorelRegulators/README.md:13,847,851` | Independent regulator construction; explicit polylogarithmic comparisons belong to Polylogarithms. Corrected attribution agrees. |

The `OnePoint K` cross-ratio adds projective normalization and the determinant adapter, including Möbius poles and positive characteristic; it does not redevelop the pinned affine invariant. The native universal-cover and continuation carriers are reused. Headline declarations in consumers' distinct namespaces do not introduce a competing owner of the underlying analytic theory.

The [Mathlib complex-order proposal](https://github.com/leanprover-community/mathlib4/pull/44531) and [LeanPolyLog package description](https://reservoir.lean-lang.org/@rainrzk/LeanPolyLog) were opened for the README's related-work claims. Neither is treated as a pinned supplier, a reason to wait, or a proof of the roadmap's headlines. The citation scanner's sole unresolved token, `lerch_transcendent.polylog` at `TauCetiRoadmap/PolylogarithmFunctions/README.md:1137`, names a downstream comparison; it is not asserted to be a pinned library declaration. Its absent sibling head is recorded below.

## Not verifiable

- No mathematical source in the seeded sample remained unreadable. All six cited mathematical works were retrieved legally; the 15 seeded locators were inspected. Strengthenings explicitly derived here were checked through their proof routes, not attributed to nonexistent source theorems.
- Detailed ownership at the open heads of EllipticRegulators, ArithmeticQuantumTopology, AnalyticNumberTheoryPartII and ColemanIntegration was not checked: no sibling files for those heads are supplied. Their downstream section-level claims, including `lerch_transcendent.polylog`, remain unverified. Search-index mentions do not replace the files. None is a premise of this roadmap.
- The numerical tests do not certify future Lean proofs or optimal constants. The gate and admitted build establish elaboration, not truth. No complete external-formalization audit was performed or relied upon.

## Source issues

- **Error** in O93 at §2.2, Corollary 2, printed p. 53: the source says every weight has a finite sectorial limit at 1 differing from ζ(k) by a period; it should be restricted to k≥2, since Li₁(1−ε)=−log ε diverges; affects a stated result.
- **Misprint** in G95 at §1.0, (1.1), printed p. 201: the source says the ordinary derivative of Liₚ equals Liₚ₋₁ times the differential d log z; it should be dLiₚ=Liₚ₋₁ d log z, or Liₚ′=Liₚ₋₁/z; affects nothing.
- **Misprint** in G00 at Lemma 4.2, (31) and its following calculation, printed p. 18: the source says the numerator is 2∣log z∣t, then 2 log(z)t; it should be 2 log∣z∣t in both places, matching the denominator and Bernoulli series; affects the proof.
- **Misprint** in G00 at the proof of Lemma 4.2 after (31), printed p. 18: the source says coefficients of (31) in degrees zero and one give (29); it should be coefficients of the complete expression (30)–(31), since the corrected (31) starts in degree two; affects the proof.
- **Misprint** in GR at §1.1, (1), printed p. 3: the source says ordinary real/imaginary-part outputs lie in (2πi)^(n−1)ℝ; it should specify the real scalar coordinate or its identification with that Tate line; affects a stated result.

These are source issues, not roadmap findings. O93's excluded weight-one case diverges. G95's following integral makes the intended differential formula unambiguous. At z=e^(−1), G00's printed numerator gives a nonzero constant correction, whereas the intended correction starts in degree two. GR's projection at n=2,z=i returns the scalar 1, which needs an identification to inhabit the displayed imaginary line. The roadmap uses the corrected formulas and distinguishes the codomain conventions.
