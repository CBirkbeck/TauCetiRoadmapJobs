# Review of NashBlowups (design, round 4)

**Verdict:** needs changes

Six findings: two P1, two P2 and two P3; four blocking findings. The previous two findings are repaired. The new findings are local repairs, not a reason to reject the scope. No design or source-manifest entry was changed by this review.

## R01 (P1) — The Gauss-map cusp Check is false in small characteristic

**Location:** `packages/NashBlowups/design/README.md:796`: “For the cusp, `Φ(t) = [1 : 3t/2]` … the closure … `≅ 𝔸¹`.” Also `packages/NashBlowups/design/plan.json:880`, target 3.1, `gauss_cusp`.

**Claim:** In the section's arbitrary characteristic, the cusp's Gauss graph has smooth closure `𝔸¹`.

**Witness:** In characteristic 3, `d(y²−x³)=2y dy`, so `Φ=[1:0]` and the graph closure is the singular cusp, with coordinate ring `k[t²,t³]`, not `k[t]`. In characteristic 2, division by 2 is unavailable.

**Repair:** Qualify this Check in both files by characteristic different from 2 and 3. Add the negative controls: characteristic 2 gives constant quotient `[0:1]`, characteristic 3 gives `[1:0]`, and both graph closures are `X`. Preserve the general theorem. Tested: in characteristic 5 the affine Grassmann coordinate is `3t/2=4t`, recovering `t`; in characteristic 3 it is zero and recovers only `t²,t³`. This agrees with §§2.1, 2.5 and 3.3 instead of contradicting them.

## R02 (P1) — The hypersurface target needs a positive ambient dimension

**Location:** `packages/NashBlowups/design/README.md:835`: “`X = V(f) ⊆ 𝔸ⁿ_k` reduced, pure of dimension `n − 1`, with dense smooth locus”. Also `packages/NashBlowups/design/plan.json:935`, hypotheses at line 937.

**Claim:** These hypotheses imply `X* ≅ Bl_{J_f} X` for the natural-number dimension used by `TauCeti.IsPureDimensional`.

**Witness:** Take `n=0`, `f=0` and `k=ℚ`. Natural subtraction gives `n−1=0`; `X=Spec k` is reduced and smooth. The empty Jacobian generates zero, so `Bl_0 X=∅`, whereas `X*=Spec k`.

**Repair:** State `1 ≤ n` explicitly in both the theorem and its plan hypotheses. Add the excluded `n=0,f=0` computation as a negative control. Equivalently, use ambient dimension `d+1` and dimension `d`, eliminating subtraction. Tested: at `n=1,f=T`, `X=Spec k`, `J_f=(1)` and both sides are `Spec k`; at `n=0,f=0`, the repaired hypothesis fails. The zero-ideal blowup computation is also the roadmap's own §3.2 Check: its Rees algebra has no positive graded part, hence empty Proj.

## R03 (P2) — The singular-curve Check omits the bound on q

**Location:** `packages/NashBlowups/design/README.md:848`: “`x^p − y^q` in characteristic `p` with `q` prime to `p` … although the curve is singular.” Also `packages/NashBlowups/design/plan.json:962`, which additionally omits the coprimality condition.

**Claim:** The displayed coprimality condition suffices for this to be a singular curve with trivial Nash blowup.

**Witness:** For `q=1`, `k[x,y]/(x^p−y) ≅ k[x]`; the Jacobian ideal is `(1)`, and the curve is smooth. `gcd(p,1)=1`, so the README's condition admits this example.

**Repair:** Require `q>1` and `gcd(p,q)=1` in both Checks; retain `p` prime and characteristic `p`. State that `q=1` instead gives the smooth affine line. Tested: `p=2,q=3` gives `k[t²,t³]` and a principal nonzero Jacobian ideal, singular at the origin with trivial Nash map; `p=3,q=2` does likewise. The cited source uses distinct primes, not `q=1` (castilloDuarteLeytonLiendo2026 line 35).

## R04 (P2) — The cotangent-space target duplicates a pinned theorem

**Location:** `packages/NashBlowups/design/README.md:386`: “Prove *cotangentSpaceEquivKaehler* … not necessarily Noetherian … finite separable”. Its ownership is claimed at lines 34–35; the corresponding plan target is 0.5.

**Claim:** Establishing the bijectivity of the conormal map in this setting is work owned here.

**Witness:** `TauCeti/RingTheory/Kaehler/Conormal.lean:76` proves `KaehlerDifferential.kerCotangentToTensor_bijective_of_formallyEtale` for every surjection onto a formally étale algebra, with no Noetherian assumption. `Mathlib/RingTheory/Etale/Field.lean:98` supplies formal étaleness for separable field extensions.

**Repair:** Delete target 0.5 as owned work. Import these two results in Scope and ownership and Exact supplier contracts, identifying the kernel of `R → κ` with `m`; the linear equivalence is the native linear map bundled using its bijectivity. Repoint §§4.1, 4.4 and their plan prerequisites to that contract. Keep the useful computations as supplier examples, without an owned theorem or a future headline declaration. Leave other target numbers unchanged. Tested on the non-Noetherian ring `k[x₁,x₂,…]_(x₁,x₂,…)`: the native theorem applies to the residue surjection and sends each class `x_i` to `dx_i`, an isomorphism on the two infinite bases. Thus the purported non-Noetherian extension is already covered. `TauCeti.exists_coordinates` is different: it assumes a basis of the whole differential module and a finitely generated maximal ideal; it does not subsume §4.1's free-quotient statement.

## R05 (P3) — The Teissier manifest locator names the wrong work

**Location:** `packages/NashBlowups/sources.toml:182`: “pp. 585-587 of the volume, as cited by nashModificationNotes2024”, under `teissier1982`, *Variétés polaires II*.

**Claim:** Nobile's notes cite this work at those pages for the algebraic proof.

**Witness:** nashModificationNotes2024 line 151 cites reference 21; line 742 identifies that reference as *The hunting of invariants in the geometry of discriminants*. The manifest instead identifies *Variétés polaires II*, with pages 314–491 at line 179.

**Repair:** Keep the existing key, DOI and settled uncertified status. Remove the false attribution of pages 585–587 and of that proof to this entry. If retained as general background, use its recorded article range 314–491, explicitly as background only; cite nashModificationNotes2024 §2 for the reproduced proof. Do not rename this entry into the other work. Tested by following the notes' numbered citation to its bibliography: reference 21 still resolves to *The hunting of invariants*, and no longer purports to resolve to this manifest entry. No request to reopen the settled paywalled source is necessary.

## R06 (P3) — Two iteration definitions omit the required API lists

**Location:** `packages/NashBlowups/design/README.md:756` and `:1235`, §§2.7 and 7.1: the definition and a short prose assertion go directly to Checks.

**Claim:** The README carries each definition's API in the required form.

**Witness:** Both plan targets have three explicit API entries (evaluation, preservation of the Setting, and resolution or smooth stabilization), but neither README subsection has an API bullet list. The other six definition/construction targets do.

**Repair:** Put those existing laws into prose API bullets before the Checks, retaining their hypotheses: zero/successor equations, preservation of the Setting, the resolution predicate, and smooth stabilization; for normality retain `i≥1`. Do not add Lean padding. Tested on the characteristic-2 cusp: `Y₀=X` is nonnormal, `Y₁=𝔸¹` is normal, while every ordinary iterate is the cusp. The proposed API must keep these three values distinct.

## Verified sound

**Previous review, finding by finding.**

- **REV-DESIGN-NashBlowups~3/F01: repaired.** The repaired passage at README lines 1162–1165 says “a separable extension `k'/k` … neither finite nor algebraic is assumed”. New §0.7, lines 435–439, states normality ascent without finiteness or Noetherian hypotheses. I read 0C3M, 0C30, 06DF and 0C3N, the native separability class, and both normalization comparison signatures. The transcendental cusp case gives `𝔸¹_{ℚ(u)}` on both sides; the inseparable curve gives `𝔸¹` versus a nonnormal cusp. The finite smooth-base-change route is properly separated from the general route.
- **REV-DESIGN-NashBlowups~3/F02: repaired.** README lines 356–359 now say “The proof there assumes `S` Noetherian” and “the step used here … needs neither”. Lines 360–365 give the coordinate-ideal proof. On `Spec k[x₁,x₂,…]`, the projection `O²→O` cuts out `[1:0]` in `ℙ¹`; pullback kills the kernel precisely on this section. The proof also handles rank zero and arbitrary base change. The added generality clauses in §§0.5 and 6.2 are mathematically correct; §0.5 nevertheless has the independent ownership defect R04 at the supplied pin.

No repair report marked a finding not actionable. None of this review's findings re-raises a settled rejection. No maintainer notes were supplied.

**Coverage and principles.** I read all 38 targets, their APIs, 115 plan Checks, every Needs line, all eight layer dependency summaries, scope and conventions, and all manifest entries. All eight definition/construction targets have at least three plan Checks; the README has at least three Checks at each of them. R06 concerns the API presentation, not a request for more tests. I rechecked the 15 seeded targets and every added or changed repair passage. For unchanged material, the previous computed examples were used as leads and recomputed where reported below; its prose-only assurances were not treated as evidence. In particular the prior Gauss row did not test characteristics 2 and 3, and the hypersurface row did not test ambient dimension zero or `q=1`.

The library scope, sheaf construction before specialization, and independent characteristic-zero and positive-characteristic criteria are appropriate. There is no re-planning of an existing Nash roadmap, no good-prime restriction on a general theorem, no algorithm, no copied source passage identified, and no route-specific replacement for the requested theory. Layer 5 needs §4.1; the construction, criteria and iteration dependencies explain the organization. The headings do not follow a source's chapters. There are no machine paths, issue/PR identifiers, HTML anchors, LaTeX delimiters or process instructions in the roadmap text. Mathematical publication/version dates in References identify the texts being cited. The plan has no missing or forward internal target prerequisite and declares no gaps. R04 is the exception to single ownership.

**Computed adversarial table.** Values are computed on the stated native conventions; `C_p` denotes `y²=x³` in characteristic `p`, and `C_0` the same curve over `ℚ`. The last column gives the disposition or required change. For conditional theorems, the values of both the hypothesis and conclusion are recorded.

| Statement | Instances | Computed values on the two sides | Result / change |
|---|---|---|---|
| Quotient convention | `y=2x` over `ℚ`; identity | quotient `(dx,dy)↦(1,2)`, point `[1:2]`; conormal `[2:−1]` is different; identity sends `dx↦dx` | Correct direction; zero and conormal alternatives excluded |
| 0.1 comparison map | `t↦(t²,t³)`; closed origin | `dx↦2t dt`, `dy↦3t²dt`; char 2 gives `0,t²dt`; origin gives `k dx→0` | Correct, not generally injective |
| 0.2 base change / immersion | `ℤ[T]` base changed to `𝔽₂`; `k[T]→k` | `𝔽₂[T]⊗ℤ[T]dT=𝔽₂[T]dT=Ω_{𝔽₂[T]/𝔽₂}`; immersion map `k dT→0` is onto | Both statements true; the base-change arrow is the two-base comparison, not an assertion that `Ω_{X'/R}=Ω_{X'/R'}` |
| 0.3 dimension locus | `𝔸²⊔𝔸¹`; dual numbers | dimension-2 locus `𝔸²`, dimension-1 locus `𝔸¹`; dual numbers have cotangent dimension 1 but smooth locus `∅` | Smoothness and rank both necessary |
| 0.4 changed surjection proof | infinite polynomial base, `O²→O`; identity; rank 2; rank 0 | image `[1:0]`; identity has zero relation ideal; `Gr₂(O)=∅`, `Gr₂(O²)=S`; both rank-zero Grassmannians `S` | General non-Noetherian proof works; rank-2 test uses the projection of the first Check |
| 0.5 changed generality clause | `k[x_i]_(x_i)`; `k[x,y]_(y)`; inseparable residue example | bases `x_i↦dx_i`; `κ·y→κ dx⊕κ dy` is injective with cokernel `κ dx`; `x^p−t` has nonzero conormal class but derivative 0 | Mathematics correct; import pinned bijectivity, R04 |
| 0.6 closed-point criterion | cusp; affine line; inseparable field | cusp: embedding dimension 2, local dimension 1, nonsmooth; line: 1=1, smooth; `k(t^{1/p})/k`: regular dimension 0 but nonsmooth | Perfectness necessary; both directions hold as scoped |
| 0.7 new normality theorem | `ℚ(i)⊗ℚ ℚ(i)`; `k(s)[y]`; `ℚ̄⊗ℚ ℚ̄` | first ring `ℚ(i)×ℚ(i)` has two field stalks; second a PID; third `colim_L ℚ̄^[L:ℚ]`, absolutely flat, field stalks despite non-Noetherianity | Normality, not integrality; no Noetherian hypothesis needed |
| 0.7 inseparable control | `C:x^p+y²+t=0`, `k=𝔽_p(t)`, odd `p`; adjoining `t^{1/p}` | before: at `y=0`, maximal ideal `(y)`, dimension 1; after: `(u,y)/(u^p+y²)`, embedding dimension 2, normalization `u=−s²,y=s^p` | Normal before, nonnormal after; separability essential |
| Separability convention | `ℚ(u)/ℚ`; `𝔽_p(t^{1/p})/𝔽_p(t)` | separating basis `{u}`, transcendence degree 1; second has inseparable minimal polynomial `T^p−t`, derivative 0 | `IsTranscendentalSeparable` is the right class; `IsSeparable` would wrongly exclude the first |
| 1.1 setting | inseparable field; dual numbers; mixed dimensions | smooth loci `∅`, `∅`, `𝔸²⊔𝔸¹`; geometric reducedness false, false, true; pure dimension fails only in third | Stated reducedness/pure dimension/density distinctions correct |
| 1.2 sheaf modification | `O⊕O/(x)`; ideal `(x,y)`; free rank 0 | `N=𝔸¹` versus Grassmann fibre `ℙ¹`; `N=Bl₀𝔸²` with fibre `ℙ¹`; rank-zero free case `N=X` | Reduced closure determines the object, not the whole Grassmannian |
| 1.3 lift | origin quotient onto torsion; blowup of smooth `𝔸²` | torsion quotient `[0:1]` differs from `N`'s `[1:0]`, inverse image of dense open empty; smooth example lift `Bl₀𝔸²→𝔸²` has fibre `ℙ¹` | Density needed; existence of quotient does not force source to be Nash blowup |
| 1.4 Plücker form | rank 0 and rank 1; quotient matrix `((1,0,a,b),(0,1,c,d))` | `∧⁰F=O`, both closures `X`; `∧¹F=F`; minors `(1,c,d,−a,−b,ad−bc)` | Compatible with supplier's quotient and sign conventions |
| 1.5 locality / flat base change | `V⊆U`; origin in `𝔸²` for `(x,y)` | both restrictions `V`; nonflat fibre gives `ℙ¹` whereas closure from empty open gives `∅` | Correct hypotheses and negative control |
| 2.1 Nash definition | `C_0`; node; `Spec k,d=0`; wrong dimension | `X*=𝔸¹`, torsion generator `e=dy−(3t/2)dx` satisfies `t³e=0`; node gives two affine lines; point stays point; `𝔸²⊔𝔸¹,d=2` gives only `𝔸²` | Construction and rank bookkeeping correct |
| 2.2 proper modification | pinch point `y²=x²z`, char ≠2 | normalization `x=u,y=uv,z=v²`; pulled Jacobian `u(u,v)`; Nash transform `Bl₀𝔸²`, fibre `ℙ¹` over origin versus finite normalization fibre | Proper need not mean finite |
| 2.3 Setting preservation | `C_0,C_2`; empty scheme | transforms `𝔸¹,C_2`; dimensions 1 in both, dense smooth open; empty transform empty, pure of every natural dimension | Correct, including empty Setting |
| 2.4 universal property / recognition | cusp normalization; `Bl₀𝔸²`; one component of two lines | cusp classifying coordinate `3t/2` recovers `t`, closed immersion; smooth blowup lift has fibre `ℙ¹`, not closed immersion; one-component lift misses the other component | Density, reducedness and surjectivity controls work |
| 2.5 triviality, headline | `C_0,C_2,C_3` | free rank-1 quotient: no, yes `(dx,dy)↦(0,1)`, yes `(1,0)`; Nash isomorphism: no, yes, yes | Both directions correct |
| 2.6 all field base changes | `C_0`, extending to `ℚ(i)` and `ℚ(u)`; inseparable field outside Setting | both sides `𝔸¹` over the new field; excluded field becomes `k'[ε]/ε^p`, nilradical `(ε)≠0` | Geometric reducedness supplies the necessary reducedness |
| 2.7 ordinary iteration | `C_0,C_2`; smooth point | first iterates `𝔸¹,C_2`; thereafter same; point smooth already at index 0 | Resolution values true, false, true; R06 presentation only |
| 3.1 sampled Gauss map | cusp char 5,3,2 | values `[1:4t]`, `[1:0]`, `[0:1]`; graph coordinate rings `k[t]`, `k[t²,t³]`, `k[t²,t³]` | R01; current universal cusp Check false |
| 3.2 blowup presentation | `dx↦x` on `𝔸¹`; zero ideal; cusp | `Bl_(x)𝔸¹=𝔸¹`; `Bl_0𝔸¹=∅`; `C_0` gives `(y,x²)` and `𝔸¹`, `C_2` gives `(x²)` and `C_2` | Nonzero generic image condition is essential |
| 3.3 ambient zero | `n=0,f=0`; `n=1,f=T` | first: `0−1=0`, `J=0`, Nash `Spec k`, blowup `∅`; second: `J=(1)`, both `Spec k` | R02; add positive ambient dimension |
| 3.3 singular example / signs | `q=1`; `(p,q)=(2,3),(3,2)`; `f=xy` | first ring `k[x]`, `J=(1)`, smooth; latter cusps embedding dimension 2>1 and principal Jacobian; `df∧dx=−x dx∧dy`, `df∧dy=y dx∧dy` | R03 for `q`; wedge signs `−f_y,f_x` correct |
| 4.1 quotient coordinates | smooth plane; cusp char 3; `d=0` | derivatives matrix identity; cusp kernel `R dy/(y dy)` with `∂x=1,∂y=0`; empty coordinate family and kernel all `Ω` | Free quotient is weaker than free differential module |
| 4.2 Lie derivative | `D=d/dx`; `D=x d/dx`; dual numbers, char ≠2 | `L(x dx)=dx`; `L(dx)=dx`; `L(x dx)=2x dx=0` in `Ω_{k[x]/x²}` | Coefficients-only model fails; quotient relation respected |
| 4.3 Seidenberg | `ℚ[x,y],D=∂x`; `𝔽_p[x],D=∂x` | `D(y²)=0`, `D(y)=0`; `D(x^p)=0` but `D(x)=1` | Stable radical/minimal prime in char 0; fails in char p |
| 4.4 quotient forces smoothness | cusp char 0; cusp char 2; cusp×line with rank 1 | char 0 no rank-1 quotient; char 2 quotient exists but singular; surface has quotient `dt` of rank 1 although dimension 2 | Characteristic and matching rank/dimension are necessary; both stated |
| 4.4 proof at a stable prime | polynomial contraction under `X_j↦x_j` | `∂_i x_j=δ_ij`; differentiation lowers a nonconstant minimal degree, so stable proper contraction is 0; then `trdeg κ(P)≥d` and pure dimension gives minimal prime, where `T_P=0` | Contradicts nonzero localization of finite `M` at a prime over its annihilator; route sound |
| 4.5 Nobile, headline | smooth point; cusp char 0; cusp char 2 | smooth/isomorphism pairs `(true,true)`, `(false,false)`, excluded `(false,true)` | Correct without algebraic closedness |
| 5.1 monomial operators | `p=2,d=1`; `p=3,d=1`; `d=0` | matrices `((1,x),(0,1))`, `((1,x,x²),(0,1,2x),(0,0,1))`; inverse operators evaluate to Kronecker delta; empty family gives identity | Factorials 1,2 are units as needed; noncommuting derivations cause no error on the coordinate subalgebra |
| 5.2 generic Frobenius basis | `K=k(t)`, p=2,3; finite extension of perfect `k`; imperfect base | bases `{1,t}`, `{1,t,t²}`, ranks 2,3; dimension-zero case rank 1; `𝔽_p(t,s)` over `𝔽_p(t)` has differential dimension 1 but p-rank 2 | Perfectness makes absolute and relative differentials agree |
| 5.3 Frobenius freeness | `k[t]_(t)`; cusp char 3; imperfect-base line | rank p and monomials `1,…,t^(p−1)`; cusp misses `t³` in the image from `1,t²,t⁴`; imperfect-base line has actual rank p² versus proposed p | Normality/perfectness controls hold; no characteristic shortcut |
| 5.3 height-one route | normal DVR versus cusp | DVR: `sf∈R`, `f^p∈R` imply `f∈Frac R` integral, hence `f∈R`; cusp: `s=t²,f=t`, `sf=t³∈R` but `f∉R`; `ρψ(e_α)=e_α` | Splitting and codimension-one bijectivity have the stated normality input |
| 5.4 DNB, headline | normal quadric, p≠2; cusp p=2; imperfect regular curve | quadric `J=(x,y,z)` noninvertible, not smooth and Nash not iso; cusp excluded by normality; imperfect curve has free quotient and Nash iso but nonsmooth | Both normality and perfectness necessary |
| 6.1 normalized construction | node; `C_0,C_2`; pinch point | node unchanged after Nash; normalized transforms of both cusps `𝔸¹`; pinch point normalized Nash has fibre `ℙ¹`, ordinary normalization finite | Normalizing X alone is the wrong model |
| 6.2 lift / changed density explanation | cusp p=2, `Z=𝔸¹`; `Spec ∏_ℕ k` | cusp lift identity on `𝔸¹`; in spectrum of product of fields all points are generic and closed, so a set containing all generic points is entire space | No finite-component argument needed for density; locally Noetherian assumption stated for chosen supplier route |
| 6.3 locality and general separable base change | cusp to `ℚ(i),ℚ(u)`; regular inseparable curve | both sides `𝔸¹` in two separable cases; in inseparable case `(C̄*)_{k'}=C_{k'}` versus `(C_{k'})̄*=𝔸¹`; `s↦(−s²−t^(1/p),s^p)` | General separable theorem correct; finite smooth route alone insufficient |
| 6.3 recognition route | base-changed normal affine chart | `B=∏ B_i`, `Q(B)=∏Frac(B_i)`; `B→Q(B)` injective and every element integral over base A is integral over B, hence in B | Exactly the two conditions of native `isIso_normalizationDesc_iff` |
| 6.4 normalized criterion, headline | `C_2`; smooth line; imperfect regular curve | `(normal,ν iso,ν̄ iso)` = `(false,true,false)`, `(true,true,true)`, `(true,true,true)`; last is nonsmooth | Main iff correct; perfectness needed for smoothness corollary |
| 7.1 normalized iteration | `C_0,C_2`; index zero | `Y₁=𝔸¹` in both; `Y₀=C_p`; ordinary iterates of `C_2` remain singular | Correct distinction; R06 API list only |
| 7.2 open propagation | `U=Y`; `U=Y_sm`; cusp p=2 ordinary iteration | identity; every smooth-open iterate equals U; every ordinary cusp iterate contains the whole cusp | Locality gives claimed open copies |
| 7.3 never-resolves, headline | cusp p=2 ordinary, m=1; cusp char 0, m=0 | ordinary cusp never smooth; char-0 `Y₀=C_0` contains itself but `Y₁=𝔸¹` smooth | `m≥1` necessary; for m≥1 choose `j=ceil(i/m)`, yielding `jm≥i` and a singular open in an allegedly smooth iterate |

The zero ring enters as the empty scheme: its Grassmannians and both Nash constructions are empty, smoothness is vacuous, and no singularity hypothesis is satisfied. Rank-zero nonempty Setting schemes are smooth zero-dimensional schemes over `k`; their Nash map is identity. These do not repair R02: there the zero Jacobian ideal forces an empty blowup of a nonempty point. Group, analytic compactness and valuation-normalization tests are not applicable to these statements.

**Sources: seeded sample and repairs.** All cited works have a manifest key. I used the cached legal texts; no new source fetch or manifest mutation was needed. No target locator is flagged unverified in the README or plan. The two journal/preprint numbering qualifications are honored: DNB and Castillo–Duarte–Leyton-Álvarez–Liendo locators below refer to the manifest's arXiv versions. Printed pages are distinguished from extraction page markers.

| Target | Source and exact locator read | Support and scope |
|---|---|---|
| 0.2 | stacksNormalization line 2926, Lemma 29.33.10, 01V0, p.65; line 2953, Lemma 29.33.15, 01UZ, p.65; comparison at line 2900, 01UV, p.64 | Arbitrary base-change square gives an isomorphism; immersion gives the conormal exact sequence and hence surjection |
| 0.7, new conventions | stacksVarieties line 1049, Lemma 33.10.6, 0C3M, p.23; stacksAlgebra line 21510, 10.165.4, 0C30, p.458, and line 21516, 10.165.5, 06DF, pp.458–459; line 4671, Definition 10.42.1, p.98 | Normal schemes and arbitrary separable extensions, no Noetherian condition; the chosen transcendental-separability notion matches |
| 1.1 | stacksVarieties line 2112, 33.25.7, 056V, p.47; line 2084, 056T, p.46; line 296, 04KS, §33.6 | Reduced, locally finite type; geometric reducedness iff a dense smooth open. The perfect-field and pure-dimension consequences use the stated suppliers |
| 2.1 | gonzalezSprinberg1982 line 85, §1.1, printed p.114; duarteNunezBetancourt2020 line 127, Definition 2.1, preprint p.3; castilloDuarteLeytonLiendo2026 line 13, Introduction, p.1 | First source directly gives quotient-Grassmannian Nash construction; DNB uses principal parts for higher order, so it is supplementary rather than an identical definition; roadmap's general field construction is its own |
| 2.4 | nashModificationNotes2024 line 153, §2, p.4, and line 226, §3, p.6; gonzalezSprinberg1982 line 94, §1.2, p.114 | Source formulations have narrower settings or suppress necessary density; roadmap explicitly supplies reducedness/density and a correct factorization route |
| 2.6 | nobile1975 line 42, Introduction, printed p.297; stacksNormalization line 2198, 081I; supplier schematic-image base change | Nobile supports globalization/embedding independence, not a separate arbitrary-field theorem. Field base change is the roadmap's valid deduction from §§0.2,1.1,1.2,1.5 and flatness |
| 3.1 | nobile1975 line 29, Introduction, p.297; gonzalezSprinberg1982 line 105, §1.4, p.114; castilloDuarteLeytonLiendo2026 line 13, p.1 | Gauss graph and closure, with tangent versus quotient convention translated. General theorem supported; R01 is the roadmap's erroneous Check |
| 4.3 | hamann2003 line 56, Lemma 0.1, p.2, proof lines 58–64 | Exactly Noetherian and containing the rationals; source's annihilator notation has a misprint, corrected in the roadmap |
| 4.4 | nashModificationNotes2024 line 179, Proposition 2.3, p.5, proof through line 199 | Algebraically closed characteristic-zero version; roadmap explicitly supplies a different algebraic proof extending to arbitrary characteristic-zero fields |
| 5.2 | duarteNunezBetancourt2020 line 301, proof of 3.10, p.7; nashModificationNotes2024 line 421, §5, p.11 | These lines use rank p^d. They do not by themselves give the specified monomial basis; the resolved p-basis supplier and perfect-base reduction do |
| 5.4 | duarteNunezBetancourt2020 line 256, Theorem 3.10, p.6, conventions line 103, p.3, proof through line 305; nashModificationNotes2024 line 362, 5.1, p.10 | Normal variety over algebraically closed characteristic-p field; the roadmap gives the necessary perfect-field extension argument. The notes' “singular” misprint is expressly corrected |
| 6.1 | stacksNormalization line 6498, 29.55.1, 035N, p.141; line 6521, 035P, p.142; gonzalezSprinberg1982 line 60, Introduction, p.113; castilloDuarteLeytonLiendo2026 line 20, p.1 | Normalize the Nash transform, not X; finite-component/finite-type hypotheses are present in applications |
| 6.3 | stacksVarieties line 2256, 33.27.5, 0C3N, p.50; stacksNormalization line 6332, 035K, p.138; line 6566, 035Q(3), p.143; line 6636, 0H7D, p.144 | Exactly arbitrary separable field extensions; locality and the integral-birational recognition route agree with sources |
| 7.1 | castilloDuarteLeytonLiendo2026 lines 28–32, 52–55, pp.1–2 | Iteration of Nash followed by normalization; recurrence and index-zero convention are supplied explicitly by the roadmap |
| 7.3 | castilloDuarteLeytonLiendo2026 line 58, unnumbered Theorem and consequence, p.2 | Existence of normal singular examples over algebraically closed fields, including second normalized iterate in characteristic 3; general open-copy obstruction is the roadmap's elementary locality/stabilization deduction, not an assertion of existence in broader settings |
| Changed 0.4 | alperModuli line 2985, proof of Theorem 1.4.5, printed pp.61–62; line 2283, Remark 1.1.4(1); line 1202, Exercise 0.3.21, printed p.22 | Source assumes Noetherian base; explicit coordinate-ideal argument correctly extends the relevant step |
| Changed 0.5 | stacksAlgebra line 17647, 10.140.4, 00TU, pp.376–377; lines 17654–17680, proof and 00TV | Noetherian-free lifting argument and finitely generated separable variant checked. Ownership still fails against the pinned conormal theorem |
| Changed 6.2 | stacksNormalization line 6570, 035Q(4), p.143 | Source needs normality and component dominance. The added clause correctly distinguishes the locally Noetherian supplier route; density follows from generic points without counting components |

Also read Nobile Theorem 1 and Jacobian Remark 2 (nobile1975 lines 105–141), the local-coordinate/operator proof (duarteNunezBetancourt2020 lines 263–305), the characteristic-p regular nonsmooth example (stacksAlgebra lines 17720–17726), and the sources' ground-field declarations at the repaired Conventions locators. None supplies a restriction that invalidates the repaired generality arguments. R05 is an error in the manifest's identification, not a newly inaccessible target source.

**Supplier-order audit.** The required gate returned:

```
candidate: NashBlowups is not in the merge order yet; checked as if placed after DeformationAndDerivedPatchingAlgebra (the intake inserts it when its design is accepted)
depcheck: 229 roadmaps, 2060 edges, 0 problem(s)
```

No UPWARD or CYCLE line. All six supplier roadmaps were resolved anew. No revision of a main-branch roadmap was used as a dependency; current main's old-name mappings were followed.

| Supplier citation | Resolution at the supplied main or open head | Result |
|---|---|---|
| AlgebraicModuliForArithmeticGeometry §§1.3,5.4 | PR #853, `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:611` coherent quotient Grassmannian; `:662` Plücker; `:8676` normalization; `:8700` finite normalization; `:8710` schematic closure | Arbitrary finite-type coherent quotients; normalization's locally finite-component extension and flat image base change present |
| DerivedDeRhamCohomology §0.23 | PR #868, `TauCetiRoadmap/DerivedDeRhamCohomology/README.md:450`, equivalence at `:460`; `Suggested.lean:53`, `:64` | `DerivedDeRham.IsPBasis` and forward theorem exist in the roadmap namespace; converse present in prose. The two citation-tool leads are not missing suppliers |
| DeformationAndDerivedPatchingAlgebra §3.14 | PR #1034, `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:832`, F-finite API `:836` | Field p-degree and permanence under localization/finite-type extension present |
| SchemeAndStackFoundations §0.7 | main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:925` | Old dimension names explicitly resolve to Tau Ceti local-dimension theorems |
| Same §0.11 | main `:1131` | Field-extension descent includes smoothness |
| Same §0.17 | main `:1325` | Resolves to native `LinearMap.bijective_of_depth`; source finiteness in this consumer is harmless, since the native theorem is stronger |
| Same §0.23 | main `:1634`, mapping `:1651` | Integral + universally injective + surjective criterion explicitly mapped to Tau Ceti |
| Same §0.30 | main `:2050`, normal class `:2056`, DVR `:2061` | Normality of all stalks, no Noetherian requirement on the class; Noetherian hypothesis on DVR assertion |
| Same §§4.11,4.13 | main `:5820`, `:5945`, regular/smooth locus `:5970`, alias mapping `:6000` | Modifications and regularity/Serre results resolve to native declarations or explicit planned locus comparison |
| EnhancedDerivedSheaves §E1.6 | main `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:800`; `Suggested.lean:108` | Noetherian characteristic-p flat Frobenius implies regular, as consumed |
| DiophantineApproximationAndTranscendence §5.6 | main `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:3688` | One-form Lie derivative and uniqueness remain specified in prose for the field application. No claim that the declaration is presently in its Lean file is needed |

**Pins and declarations opened.** `design/plan.json` and `lake-manifest.json` agree: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following are source-definition/signature checks at those pins, not claims of elaborating a new file. Paths in this list are library-relative.

- Mathlib `Scheme.Hom.smoothLocus`, `isOpen_smoothLocus`, `smoothLocus_eq_top_iff`, `preimage_smoothLocus_eq`, `dense_smoothLocus_of_perfectField`: `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:300`, `:291`, `:320`, `:333`, `:361`. The definition is the formally smooth stalk-map locus under local finite presentation; no relative dimension is built in. Perfect-field density requires reducedness.
- `GeometricallyReduced`: `Mathlib/AlgebraicGeometry/Geometrically/Reduced.lean:44`; `Hom.image`, `imageι`, `toImage`: `Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean:658`, `:661`, `:706`; `Hom.ker`, `support_ker`: `Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean:691`, `:844`. Support-as-closure requires quasi-compactness; §1.2 supplies it for the relevant open section.
- `IsClosedImmersion.lift`, `isIso_of_isClosedImmersion_of_surjective`: `Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean:206`, `:409`; `ext_of_isDominant_of_isSeparated`: `Mathlib/AlgebraicGeometry/Morphisms/Separated.lean:289`. The latter requires reduced source, separated relative target and equality over the base, all present in the quotient comparison.
- `Scheme.Modules.pullback` and its adjunction: `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean:183`, `:189`; `Hom.normalization`, `normalizationDesc`, `normalizationPullback` and its smooth isomorphism instance: `Mathlib/AlgebraicGeometry/Normalization.lean:122`, `:371`, `:576`, `:598`. Relative normalization takes a qcqs morphism; it is not ordinary normalization of the identity.
- `Algebra.IsTranscendentalSeparable` and algebraic comparison: `Mathlib/FieldTheory/TranscendentalSeparable.lean:72`, `:76`, instances `:88`, `:91`; `LocallyOfFiniteType.jacobsonSpace`: `Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean:112`; `nonempty_inter_closedPoints`: `Mathlib/Topology/JacobsonSpace.lean:105`; `tfae_universallyInjective`: `Mathlib/AlgebraicGeometry/Morphisms/UniversallyInjective.lean:106`.
- `Module.Grassmannian`: `Mathlib/RingTheory/Grassmannian.lean:65`, a submodule with finite projective quotient and specified rank at every prime. It is not the representing scheme. `KaehlerDifferential.tensorKaehlerEquiv`: `Mathlib/RingTheory/Kaehler/TensorProduct.lean:238`, using a pushout; `exact_kerCotangentToTensor_mapBaseChange`, `mapBaseChange_surjective`: `Mathlib/RingTheory/Kaehler/Basic.lean:864`, `:869`; `retractionKerCotangentToTensorEquivSection`: `Mathlib/RingTheory/Smooth/Kaehler.lean:324`; `Algebra.FormallyEtale.of_isSeparable`: `Mathlib/RingTheory/Etale/Field.lean:98`.
- `IsRegularLocalRing`, `IsRegularRing`: `Mathlib/RingTheory/RegularLocalRing/Defs.lean:52`, `:93`, both include Noetherianity. `PerfectField`: `Mathlib/FieldTheory/Perfect.lean:289`; `PerfectClosure`: `Mathlib/FieldTheory/PerfectClosure.lean:68`; `IsPurelyInseparable`: `Mathlib/FieldTheory/PurelyInseparable/Basic.lean:107`.
- Tau Ceti `Scheme.relativeDifferentials` and `relativeDifferentialsHomEquiv`: `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean:85`, `:101`; quasi-coherence/finite presentation: `Quasicoherent.lean:96`, `:146`; open restriction: `Restriction.lean:157`; local freeness: `LocallyFree.lean:54`; relative-dimension rank: `Rank.lean:74`. These operate over the stated affine base.
- `smoothOfRelativeDimension_iff_ringKrullDim_stalk_eq`: `TauCeti/AlgebraicGeometry/Morphisms/Smooth/RelativeDimension.lean:94`; `isRegularLocalRing_stalk_of_smooth`: `Regular.lean:43`; smooth locus instance and base-change inclusion: `Locus.lean:46`, `:53`.
- `TauCeti.IsPureDimensional`: `TauCeti/Topology/PureDimension.lean:52`, exactly all irreducible components have dimension `d : ℕ`, with no nonemptiness; field-base-change equivalence: `TauCeti/AlgebraicGeometry/Scheme/KrullDimension.lean:263`; `vanishingIdeal_le_ker_of_range_subset`: `TauCeti/AlgebraicGeometry/IdealSheaf/VanishingIdeal.lean:99`, requiring reduced source.
- Blowup, projection, properness: `TauCeti/AlgebraicGeometry/Blowup/IdealSheaf.lean:120`, `:124`, `:191`; lift/extensionality: `UniversalProperty.lean:372`, `:297`; isomorphism criterion: `ExceptionalDivisor.lean:203`. Properness has a finite-generation hypothesis, satisfied by the finite-type ideal images here. Exterior power: `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower/Basic.lean:66`.
- Normalization recognition: `TauCeti/AlgebraicGeometry/Normalization/IsIso.lean:114`; normal schemes, locality and DVR stalks: `TauCeti/AlgebraicGeometry/Scheme/Normal.lean:84`, `:153`, `:203`; modification definition: `TauCeti/AlgebraicGeometry/Morphisms/Modification/Basic.lean:53`; depth bijectivity: `TauCeti/RingTheory/Depth/Bijectivity.lean:120`. The normal class requires integrally closed domain stalks, not global integrality or finite type.
- New duplication witness: `KaehlerDifferential.kerCotangentToTensor_injective_of_formallySmooth` and `.kerCotangentToTensor_bijective_of_formallyEtale`, `TauCeti/RingTheory/Kaehler/Conormal.lean:55`, `:76`; nearby but different `TauCeti.exists_coordinates`, `TauCeti/RingTheory/LocalRing/Coordinates.lean:222`, was also read.

**Duplication and open-work audit.** I used `roadmaps grep` and `roadmaps show`, not just declaration-name search. Searches covered Nash blowups/modifications, quotient Grassmannians, differential ideals and stable primes, p-bases/F-finiteness, Lie derivatives, geometric normality and tags 0C3M/0C30/06DF. The initial broad normal/separable search was truncated; narrower object searches were used for conclusions. There was no other Nash construction owner in the indexed main/open heads or pinned algebraic-geometry files. §0.7 has no competing normality-ascent owner in those searches. General Grassmannians, ordinary normalization, F-finiteness, p-bases and the field-case Lie derivative are correctly imported; R04 is the concrete missed native overlap. The finite-basis local-coordinate theorem was distinguished from the free-quotient theorem, and real-algebraic Nash functions/Tarski–Seidenberg from these objects.

The overlap file has no changed Nash folder, dropped cited id, newly revision-only id, or conflicting head to repair. I read the closest heads: SchemeAndStackFoundations PRs #1656, #1808, #1854 (`TauCetiRoadmap/SchemeAndStackFoundations/README.md`, Scope and ownership, §§0.7,0.30,4.13); LogPluricanonicalForms #2122 (`TauCetiRoadmap/LogPluricanonicalForms/README.md:12`, twisted canonical lines and fiber adjunction); DirectSummandsAndBigCohenMacaulay #1735 (`TauCetiRoadmap/DirectSummandsAndBigCohenMacaulay/README.md:5`, splinters and big Cohen–Macaulay algebras). None owns the new Nash or separable-normality construction. The three revisions of SchemeAndStackFoundations were checked for overlap only; supplier resolution used main.

The board-package index was read before absence claims. I inspected AnalyticNumberTheory #123 at `310e834` (`packages/AnalyticNumberTheory/README.md:5`, a navigation index), LogicAndDefinabilityInNumberTheory #164 at `8d875d1` (`packages/LogicAndDefinabilityInNumberTheory/README.md:5`, definability/integration), and LawrenceVenkateshMethod #345 at `9ee7ac3` (`packages/LawrenceVenkateshMethod/design/README.md:3`, no independent mathematical layers). The last is a design README, rather than the index's suggested package README path. No overlapping owner was found there. Open-head coverage is the supplied index of 429 PRs; this is not a claim about unindexed future changes.

**Shape and headline audit.** Main-branch SchemeAndStackFoundations, EnhancedDerivedSheaves and DiophantineApproximationAndTranscendence were read for shape as well as contracts. This design has the required summary, ownership, conventions, per-supplier contracts, build explanation, eight mathematical layers, Examples and Dependencies, consumers and references. The two iteration API lists need R06. Proposed own names are italic; backticked declaration claims resolve to libraries or named suppliers. R04 removes an already supplied theorem rather than adding another name. Internally derived corollaries cite their earlier located inputs. No `Suggested.lean` exists at this design stage, so import syntax, section-variable retention, sorried-data checks and padding probes have zero submitted declarations to inspect.

The five headline families explicitly listed in the summary are §2.5 triviality, §4.5 Nobile, §5.4 DNB, §6.4 normalized criteria, and §7.3 never-resolution. None is statable at the pins as a Nash theorem without the absent scheme Grassmannian/Nash construction and, for the last, its iterates. The package docstring must name each missing carrier rather than substitute unrelated algebra. Deep intermediate results §§4.3,4.4,5.3 are statable on native ideals/derivations, relative differentials/finite locally free sheaves, and Frobenius modules; §0.7 is also statable on native schemes, normality and transcendental separability. The future acceptance test should consider those actual results. §0.5 must not become padding: R04 identifies its existing proof. No missing-signature or padding finding is charged to a Lean file that has not been submitted.

## Not verifiable

- Lean elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run. There is no submitted `Suggested.lean`, hence no `#check @name` comparison or one-tactic probe and no claim that `sorry` was the only build warning.
- `hironaka1983`, `spivakovsky1990`, `semple1954`, `teissier1982` and `ega1` remain settled uncertified background texts. Their full contents were not opened or requested again. R05 is verified from the readable notes and conflicting manifest identity, without claiming to have read Teissier's paywalled text.
- Published numbering beyond the cached arXiv versions of duarteNunezBetancourt2020 and castilloDuarteLeytonLiendo2026 was not independently certified; the manifest explicitly binds the cited locators to the versions actually read.

## Source issues

- **Misprint** in nashModificationNotes2024 at Theorem 5.1, printed p.10 (line 364): the source says the normal variety's Nash map is an isomorphism exactly when the variety is singular; it should be nonsingular; affects a stated result.
- **Misprint** in nashModificationNotes2024 at Theorem 6.2, printed p.13 (line 512): the source says the normalized higher Nash map is an isomorphism exactly when X is an isomorphism; it should be exactly when X is nonsingular; affects nothing.
- **Error** in nashModificationNotes2024 at Section 3, printed p.6 (lines 226–229): the source says every morphism carrying a rank-d locally free quotient factors through the Nash closure; it should be restricted, for the stated construction, to reduced sources with dense inverse image of the chosen open; affects a stated result.
- **Misprint** in hamann2003 at Lemma 0.1 proof, printed p.2 (line 61): the source says the radical J equals the annihilator of an element; it should be P/J equal to the annihilator of a suitable nonzero element in R/J; affects the proof.
- **Misprint** in castilloDuarteLeytonLiendo2026 at Introduction, printed p.1 (line 20): the source says the normalized map is η composed after ν; it should be ν composed after η, with domain the normalization of the Nash transform; affects nothing.
- **Misprint** in alperModuli at Exercise 0.3.21, printed p.22 (line 1206): the source says the subfunctor of S is represented by a closed subscheme of X, which is not defined there; it should be a closed subscheme of S; affects nothing.
- **Misprint** in nashModificationNotes2024 at Proposition 2.3 proof, printed p.5 (lines 194–196): the source says a map from A^d to the differential module sends basis vectors to the scalars 1 and 0; it should be the coordinate projection A^d to A composed with the surjection from differentials; affects the proof.
- **Misprint** in nashModificationNotes2024 at Section 6, printed p.13 (lines 515–517): the source says to assume the normalized Nash map is an isomorphism when deducing Theorem 6.1 from 6.2; it should be an assumption on the unnormalized map, followed by using normality of X to identify its normalization; affects the proof.
- **Misprint** in duarteNunezBetancourt2020 at Theorem 3.10 proof, printed p.6 (line 267): the source says the second sum computing δ_t(x_j) uses c_{k,i}; it should be c_{t,i}, consistently with the first sum and δ_t; affects nothing.

- **Misprint** in nashModificationNotes2024 at Section 5 proof, printed p.11 (line 421): the source says the rank of R is p^d; it should be the rank of R^{1/p} as an R-module, as its parenthetical definition specifies; affects nothing.
- **Misprint** in nashModificationNotes2024 at Section 5 proof, printed p.11 (line 426): the source says R^{1/p} is contained in F=Frac(R); it should be contained in F^{1/p}, which still establishes torsion-freeness; affects the proof.

The invocation of algebraic closedness at duarteNunezBetancourt2020 line 280 is unnecessary for R^p-linearity, since `D(r^p f)=r^pD(f)` in every characteristic-p ring. It is not a false claim or proof gap, so it is not an erratum entry.
