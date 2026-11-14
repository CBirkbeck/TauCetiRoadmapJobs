<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14997#issuecomment-6871153475 -->
Review (codex) of ef909e4

Verdict: accepted
Conditional on the announced gaps: `exact-couple-morphisms`

No findings. Acceptance is conditional on the declared supplier contract `gap:exact-couple-morphisms`. The four package inputs were not changed.

## Verified sound

### Previous findings, checked first

- **F01 — repaired.** `packages/SpectralSequencesAndConvergence/README.md:1081` now says “from page `max(2, q − a + 2)` with zero limit page if `q ≥ b`”. For `a = 5`, `b = 0`, `q = 1`, both the general bound and this clause give `2`, not `−2`. The added Check at line 1120 also computes the nonzero-complex instance: `a = −2`, `b = q = 0` gives `4`, with `EInfty 0 1 = (ℤ/2)/(ℤ/2) = 0`. Searching every occurrence of the three bound expressions found no remaining version of the error. In §4.3 the hypotheses `i ≤ q < j` already make both entries of its maximum at least `2`.
- **F02 — repaired.** `packages/SpectralSequencesAndConvergence/README.md:1818` now says “Let `F^0 K = K` and `F^{m+1} K^m = 0` for every `m`”. This determines the intended class. For `m < 0`, monotonicity gives `K^m = F^0 K^m ⊆ F^{m+1} K^m = 0`, so omission of a separate connectivity hypothesis is valid. The added passage derives the page bounds, completeness and the hypotheses of §5.3, and distinguishes constant filtrations. Its numerical tests appear below. The remaining first-quadrant occurrences concern explicitly specified spectral-sequence carriers or the pinned quadrant classes.

Neither previous finding was marked not actionable. The changed passages and their new Checks were reviewed in full. The unchanged computed witnesses of round 4 were recomputed or retained only after comparison with the present statements; sections previously summarized without computed witnesses were read in full. All 31 numbered sections, their API bullets, Checks, routes and dependency lines were read.

### Principles, shape and signatures

The roadmap develops the general abelian-category theory. Module, spectrum and sheaf statements are identified as specializations with named owners; there is no restriction to selected primes or substitute for the general construction. Exact couples themselves are imported from StableHomotopyKTheory §7.22. The page/tower assembly, spectral-object comparison, categorical tower theorems and convergence structures here are additional objects or explicitly stronger variants. No second copy of this roadmap was found on main or in the supplied overlap/index data.

There are seven layers, 31 numbered subsections, 31 Check blocks, seven final Examples subsections and seven final Dependencies subsections. Each definition has an API and at least three Checks, including negative controls or distinct models. Theorems retain their hypotheses and source locators, with the limitations of uncertified sources recorded below. The main-branch shapes of DerivedModuleAlgebra, StableHomotopyKTheory and EnhancedDerivedSheaves were read for comparison. The organization is mathematical, and the source-order test is recorded below.

No computational algorithm, source-directed plan, sorry'd data, `set_option`, admitted example, forbidden import, machine path, pull-request number, review narrative or HTML anchor occurs in the roadmap or Lean file. Mathematical references to the snake lemma and five lemma are prose, not prohibited Lean `lemma` declarations. `metadata.toml` records `math.KT`; the manifest contains ten distinct works, all cited, under ten stable keys.

The actual pinned revisions read were Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

Ran `lake env lean` from the content checkout on the absolute path of `packages/SpectralSequencesAndConvergence/Suggested.lean`: exit 0, exactly eight “declaration uses `sorry`” warnings, at lines 99, 111, 150, 175, 194, 224, 250 and 270. All five imported Tau Ceti object files were available; no build was needed. The imports are `Mathlib` followed by the five used Tau Ceti modules.

A scratch copy checked all **11 top-level declarations** with `#check @name`: three real-bodied definitions/structures and eight theorems. The elaborated types agree with the README. In particular the Euler theorem retains all four weak-Serre-class assumptions, the exhaustive comparison retains both sequential-colimit assumptions, and the tower theorem retains countable products and repleteness. No binder was lost. All 11 names occur in the README; no additional backticked name attributed to this roadmap is undeclared. `DoubleComplex.edgeBottom` and `DoubleComplex.edgeLeft` belong to the cited DerivedModuleAlgebra §S.1 and its old-name mapping at `TauCetiRoadmap/DerivedModuleAlgebra/README.md:65`.

For every one of the eight sorried theorems the scratch copy tested `simp`, `rfl`, `infer_instance` and `exact?`, requiring each attempt to close the whole goal. All **32 attempts failed**; the scratch file elaborated successfully with the same eight sorry warnings and the 11 signature outputs. Inspection also rules out a definition restatement, README Check, computed small value or boundary case masquerading as a headline. The proof-search result is not being used as a truth test.

### Headline coverage

The opening summary's targets and the deep end results were matched to the following signatures or explicit missing-carrier explanations in `packages/SpectralSequencesAndConvergence/Suggested.lean`:

| README headline | Acceptance-test coverage |
| --- | --- |
| Bounded stabilization and its regular/coregular consequences (§§1.3, 2.2) | `dFrom_eq_zero_of_boundedBelow`, line 99; `dTo_eq_zero_of_boundedAbove`, line 111. These state the quantitative differential vanishings on arbitrary native spectral sequences. |
| Comparison of converging spectral sequences (§3.5) | General form named in the module docstring, lines 39–47: the generic limit page and convergence structure are not at the pins. Spectral-object and exhaustive-filtered forms are stated at lines 175 and 224. |
| Vanishing, dimension, Euler, two-row, two-column, edge and five-term consequences (§§3.4–3.6) | Missing generic `E_∞`/convergence carriers named at lines 39–47. The filtered-complex Euler headline is stated at line 194. Page Euler invariance (§2.3) is an input to this headline. |
| Towers, limit-page identification, degree-range convergence (§§4.1–4.4) | Generic towers/limit page named at lines 39–45; the native canonical-map comparison and quantitative stabilization are stated by `convergence_of_hasConvergenceBounds`, line 150. |
| Quadrant convergence (§4.5) | Missing convergence structure named at lines 48–54. The docstring correctly explains that the page-to-`EInfty` identifications themselves follow from pinned maps. |
| Finite and cohomologically bounded filtered convergence (§5.3) | Native spectral-object form at line 150, specialized by the explicit indexing dictionary; degreewise-finite Euler theorem at line 194. |
| Exhaustive bounded-below convergence and comparison (§5.4) | General limit-page statement named at lines 55–59; comparison stated at line 224 with the general abelian-category hypotheses. |
| Exact-couple spectral sequence, towers and identifications (§§6.1–6.3) | Missing bigraded exact-couple carrier explicitly named at lines 60–63; supplier §7.22 and morphism gap identified. |
| Repleteness characterization and Mittag–Leffler vanishing (§7.2) | Theorems at lines 250 and 270, with the real-bodied predicate at line 261. |
| Boardman conditional and complete filtered convergence (§§7.4–7.5) | Missing exact-couple, generic cycle-tower/limit-page and whole-plane-obstruction carriers named at lines 55–63. |

No statable headline is omitted or replaced by an arbitrary predicate or bounded stand-in.

### Computed adversarial table

Here `×2` denotes the two-term complex and filtration specified in the README's Conventions; `ℓ` is prime. Rows distinguish actual quotients and maps from abstract isomorphism types. The source sample, all eight Lean headlines, both repaired passages, and the additional sections without prior computed evidence are included.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 subquotient transport | `4ℤ ≤ ℤ`, quotient `ℤ/4`; marked identity on `ℤ²` | Preimages of `0,2ℤ/4,ℤ/4` are `4ℤ,2ℤ,ℤ`. Coordinate-swap marking sends the first axis to the second; canonical marking fixes it. For `X=0`, `B=Z` and the interval has one element. | Marking and preimages determine the construction. | none |
| §1.2 towers and rebasing | `d₂:ℤ→ℤ` is `×2` | At the source `(Z₃,B₃)=(0,0)` and homology is `0`; at the target `(ℤ,2ℤ)` gives `ℤ/2`. Rebasing there at page 3 gives `(ℤ/2,0)`, again quotient `ℤ/2`. | Both tower directions correct. | none |
| §1.3 regularity, coregularity, degeneration | Same sequence; all-zero differentials | Source cycles change `ℤ→0`, boundaries stay `0`; target boundaries change `0→2ℤ`. Both stabilize at 3; all-zero differentials stabilize at the initial page. | Both directions of the iff statements agree. | none |
| §1.4 limit versus abstract page type | `ℤ→id ℤ` with the decreasing ℓ-adic filtration from the Check | `Z_r(0,0)=ℓ^(r−1)ℤ`, `B_r=0`; every page is abstractly `ℤ`, but meet and limit page are `0`. If a page vanishes, `Z∞≤Z_r=B_r≤B∞`, hence quotient `0`. | Limit is not eventual abstract isomorphism type. | none |
| §2.1 bidegrees | Native differential `(1,−1)→(3,−2)` on page 2 | Native total degree `0→1`, filtration `1→3`; classical filtration `0→1`, with offset 1. The swapped cohomological filtration changes by `1−r`, not `r−e`. | Sign and offset laws discriminate wrong models. | none |
| §2.2 / Lean 99, 111 | First quadrant, `β(n)=n+1`, `α(n)=−1`, offset 0 | Leaving bound is `q+2`; entering bound `p+1`; combined bound is `r>max(p,q+1)`. At `(1,0)`, page 2 has target `(3,−1)` and source `(−1,1)`, both zero. The unbounded example has `Z_r=ℓ^(r−1)ℤ` strictly decreasing. | Quantifiers and bounds correct. | none |
| §2.3 page Euler identity | Surjection `ℤ/4→ℤ/2`; `ℚ→×2 ℚ` | Length sum `−2+1=−1`; next page `−1+0=−1`. Rational sum `−1+1=0`, next page `0`. Infinite-dimensional finrank fails additivity: `0≠1+0`. | Finiteness/additivity and total-degree signs needed. | none |
| §3.1 filtered objects | ℓ-adic `ℤ`; constant and zero filtrations; `ℤ/4` | ℓ-adic join `ℤ`, meet `0`, completion `ℤ_ℓ≠ℤ`. Constant filtration has meet `X`; zero filtration has join `0`. `ℤ/4` and `(ℤ/2)²` have graded lengths `1,1` but different exponent `4,2`. | Complete, separated and exhaustive are distinct. | none |
| §3.2 convergence structures | `×2`; zero pages with constant `H⁰=ℤ`; empty degree set | `E∞^(1,0)=ℤ/2=gr¹H¹`, source limit `0`. Constant filtration gives all graded pieces `0` but meet `ℤ`. For the empty set there are zero isomorphism/filtration obligations. | Weak/ordinary/strong distinctions and locality hold. | none |
| §3.3 morphism compatibility | One surviving `ℤ` with identity marking | Pair `(−id,id)` gives composites `−1` and `1`, unequal on `1∈ℤ`. Identity pair gives `1=1`; zero pair gives `0=0`; composite compatible scalars `2,3` give `6=6`. | Compatibility is substantive; composition preserves it. | none |
| §3.4 finite-filtration and Euler consequences | Two graded `ℤ/2`; omitted degree; constant filtration | Length of either extension is `2=1+1`. Zero pages with `H¹=ℚ` but convergence only in degree 0 give page sum `0`, abutment sum `−1`. Constant `H⁰=ℚ` gives `0` versus `1` without finite filtration. | Exact degree and finiteness hypotheses exclude both controls. | none |
| §3.5 comparison | Identity; inclusion `ℤ→ℤ_ℓ`; constant filtered `ℤ→0` | Identity has inverse identity. The inclusion induces `id` on every `ℤ/ℓ` graded piece but cokernel `ℤ_ℓ/ℤ≠0`. Constant-filtration map has zero graded pieces but kernel `ℤ`. | Completeness/separation cannot be omitted. | none |
| §3.6 consequences | Two-row `d₂` an isomorphism; two-column extensions; rational `×2` | Abutment ranks `(1,0,0,1)` in degrees 0–3. Two-column quotients allow both `ℤ/4` and `(ℤ/2)²`. Rational degree-1 dimension drops `1→0`; for `m=0`, the proposed extended sequence would compose two identities to `1≠0`. | Extension, dimension and five-term qualifications correct. | none |
| §4.1 integer and restricted towers | Native `×2`; finite recipe `l=2,r=3`; omitted negative source | `Z₃(1,−1)=ker(×2)=0`. Clamped quadruples are `(0,0,1,2)` and `(0,1,2,2)`; the latter has `B₃=0`. With `l=0` there are no positions. Omitting source `(−1,1)` would give homology `ℤ` instead of recipe page 3 equal to `0`; `HasSpectralSequence` fails there. | Carrier restrictions are necessary. | none |
| §4.2 induced native filtration | `×2`, degree 1 | `F³=abutmentFiltration(−1,1)=ℤ/2`, `F⁴=0`; native `gr³=ℤ/2` matches classical `gr¹`. The index shift is `n+1=2`. | Decreasing direction and shift correct. | none |
| §4.3 cycle/boundary comparison | Native position `(3,−2)`; nonexhaustive identity complex | `max(q−i+2,j−q+1)=max(2,3)=3`, and page 3 is `ℤ/2=EInfty`. Nonexhaustive control has `B∞=0`, `Bᵗ=ℤ`, hence `E∞=ℤ` while graded abutment is `0`. | Comparison, not an unmarked isomorphism, is the claim. | none |
| §4.3 continuity requires only an epimorphism | Complex `ℤ→id ℤ` in degrees `n−2,n−1`, finite stages containing only the last term | Colimit of `H^(n−1)(G_j/G_(q+1))` is `ℤ`; target `H^(n−1)(K)=0`; comparison is onto, not injective. Both boundary images in the relevant zero degree-n page are `0`. | Weaker continuity condition is consistent. | none |
| §4.4 / Lean 124, 150 | `×2`, `a=−2,b=0,n=1,q=−2`; nonexhaustive `ℤ[0]` | Page bound `max(2,2,3)=3`; page 2 is `ℤ`, page 3 and graded abutment are `ℤ/2`. Top maps `0→ℤ` are mono but not iso; the resulting filtration has join `0≠ℤ`. | The top isomorphism hypothesis is essential. | none |
| §4.4 repaired bound | Zero object `a=5,b=0,q=1`; also `q=7`; `×2` at `q=0` | General/clause maxima respectively `2=2`, `4=4`, `4=4`; in the last case `EInfty 0 1=(ℤ/2)/(ℤ/2)=0`. For `a≤q<b`, e.g. `q=−2,−1`, maxima are `3,3≤b−a+1=3`. | F01 fully repaired, including unordered bounds. | none |
| §4.5 quadrant convergence | First quadrant `n=0,−1`; third quadrant `m=−2` | First bounds `(a,b)=(0,1)` and `(0,0)`; `H⁰=E₂^(0,0)`, `H^(−1)=0`. Third bounds `(-2,1)` give positions `(0,2),(1,1),(2,0)` and `EInfty(m+p,m)=EInfty(−q,m)`. | Pinned quadrant classes imply the endpoint vanishings. | none |
| §4.6 / Lean 175 | Identity; filtered inclusion `ℤ[0]→(ℤ→id ℤ)` with nonexhaustive filtration | Identity pages induce identity on `ℤ/2`. Countermodel pages are all isomorphic `ℤ`, but abutment map `ℤ→0` is not iso; target top comparison is the same non-iso. | Top condition excludes false comparison. | none |
| §5.1 classical adapter and first differential | `×2`; trivial filtration | Native page 2 positions `(1,−1),(3,−2)` carry classical page 1; differential is `+2`, kernel `0`, cokernel `ℤ/2`. Trivial filtration gives only column 0, `E₁^(0,q)=H^q(K)`, and all differentials zero. | Differential sign and page offset agree with pin. | none |
| §5.2 actual comparison versus abstract β | `K^(−1)=ℤ`, `K⁰=ℤ^(ℕ)⊕ℤ`, differential into last summand, absent filtration on degree −1 | `E∞=ℤ^(ℕ)⊕ℤ≅ℤ^(ℕ)=H⁰` abstractly, but canonical projection has kernel `0⊕ℤ`. Thus `B∞=0≠Bᵗ=ℤ`; both statements distinguish precisely the same failure. | Canonical criterion is correctly scoped. | none |
| §5.3 / Lean 194 | Degreewise stupid filtration; rational and characteristic-2 `×2`; empty support | For `K^m=ℤ`, `m≥0`, bounds `p₁=n,p₀=n+2` give `gr^nH^n=ℤ`; there is no global zero stage. Over `ℚ`, page/abutment Euler sums `1−1=0=0`; over `𝔽₂`, both are `1−1=0`. Empty support gives zero cohomology and `0=0`. Wrong native sign gives `−2`. | Generality, support and signs correct. | none |
| §5.4 / Lean 224 | Identity of finite filtration; ℓ-adic inclusion; failure of exhaustiveness in degree `n−1` | Identity gives `id:ℤ/2→ℤ/2`. ℓ-adic inclusion has page maps `id_(ℤ/ℓ)` but cokernel `ℤ_ℓ/ℤ`; neither filtration has a zero stage. Nonexhaustive control gives `E∞=ℤ`, `H⁰=0`. | Both missing-hypothesis controls are excluded. | none |
| §6.1 exact-couple assembly and shift | Tuple couple on `ℤ²`; page shift by 1 | `jk(x,y)=(y,0)`, kernel=image=`ℤ×0`, so next page `0`; `i²=i≠0`. Cohomological degree is `(r,1−r)`. Shifted offset is `1−1=0`, giving filtration rise `r`, not `r−2`. | Exactness does not incorrectly impose `i²=0`. | none |
| §6.2 exact-couple towers | `D=ℤ/ℓ²`, `i=×ℓ`, `E=(ℤ/ℓ)²` | `d₁=0`; correct `Z₂=k⁻¹(im i)=E`; wrong `k⁻¹(im i²)=(ℤ/ℓ)×0`. Derived `d₂(a,b)=(b,0)` has equal kernel/image, so page 3 is `0`. Bockstein `D=ℤ` has all `B_r=0`, `Z_r=ℤ/ℓ`. | Tower exponent and first page correct. | none |
| §6.3 couple of a spectral object | `×2` in degree 1 | `A^p=0` for `p≥4`, `A³=ℤ`, `A^p=ℤ/2` for `p≤2`, transition reduction; limit `0`, colimit `ℤ/2`. With `k=0`, at native `(1,−1)` one gets `ker k=ℤ≠im j=0`. | Connecting map and tower direction determined. | none |
| §7.1 lim and lim¹ | Identity tower; `×ℓ` tower; zero transitions; complete filtration | `(lim,lim¹)=(A,0)`, `(0,ℤ_ℓ/ℤ)`, `(0,0)` respectively. For the section constructed from partial sums, `τ_n−τ_(n+1)=σ_(n+1)−σ_n=π_n`. Constant nonzero filtration has lim¹ `0` but completion `0≠X`. | Sign and separation requirement correct. | none |
| §7.2 / Lean 250 | Epimorphic tower and shear construction | Compatibility of `(x_n,t)` reads `x_n−f_n x_(n+1)=π_n t`; projection followed by second projection equals `1−s`. For the ℓ-power quotient tower the limit is `ℤ_ℓ` and lim¹ `0`. For the discrete cyclotomic tower, smooth limit is `0`, while `μ_(ℓ^n)≠0` for `n≥1`. | Both directions of repleteness characterization supported. | none |
| §7.2 / Lean 261, 270 | Zero transitions on `ℤ/ℓ`; `×ℓ` on `ℤ`; Artinian first page | First has stable images `0` from `m=n+1`, and difference map identity. Second has images `ℓ^(k−n)ℤ`, strictly decreasing. In finite first-page objects the descending cycle chain is eventually constant and lim¹ is `0`. | ML does not mean eventually epimorphic transitions. | none |
| §7.3 double tower | Constant tower and `×ℓ` | Constant gives `0→0→0→0→0`; `×ℓ` gives `Q=0`, `RQ=ℤ_ℓ/ℤ`, transition `×ℓ` bijective, hence `0→0→ℤ_ℓ/ℤ→ℤ_ℓ/ℤ→0`. | Exact sequence and transition checked. | none |
| §7.4 limit and colimit abutments | Limit step couple and colimit step couple | Limit case: `A₀^(+∞)=0`, `A₁^(+∞)=ℤ`, with `F⁰=ℤ,F¹=0`, so `gr⁰=ℤ=E∞^(0,0)`. Colimit case: `A₀^(−∞)=ℤ` gives the same graded value without shift. Constant identity couple has zero pages but both limits `ℤ`, and fails conditional convergence. | Degree shift and conditional hypotheses correct. | none |
| §7.4 whole-plane obstruction | Product-tail example | `E∞=RE∞=0`, `A⁺=RA⁺=0`; `A⁻=∏k/⊕k`, all filtration steps equal `A⁻`, so meet `∏k/⊕k`. For `s=−m,r≥2m`, kernel∩image=`⊕_(i≥r−m) k`, whose lim¹ is the tail product/direct-sum quotient; colimit `W⁰=∏k/⊕k≠0`. | Nonseparation equals the nonzero obstruction. | none |
| §7.5 complete convergence | ℓ-adic `ℤ_ℓ` and `ℤ`; complete complex route | Completed example has `E₁=E∞=ℤ/ℓ`, meet `0`, lim¹ `0`, and `W=0`; uncompleted example has completion `ℤ_ℓ≠ℤ`. On the complete complex, the isomorphism `1−s` on the product induces an isomorphism on cohomology, so its kernel and cokernel are both `0`. | Completeness and exact products used at the right step. | none |
| §7.5 repaired first-quadrant Check | `m=−1,−2`; `p=−1,m+1`; degreewise stupid filtration and constant filtration | Negative terms forced to `0`. Graded pieces outside `0≤p≤m` are `K^m/K^m=0` or `0`. Quotients stabilize to `K^m`; bounds `α=−1,β(n)=n+1`, `p₁=0,p₀=n+2` work. For `n=0,2`, `gr^nH^n=ℤ=E∞^(n,0)`; constant filtration instead has page `0`, cohomology `ℤ`, completion `0`. | F02 and every added implication verified. | none |

The zero module and zero-ring module category make all page, filtration and tower values zero; none of the results assumes a nonzero object or coefficient ring. `𝔽₂` is explicitly tested above. Nonabelian groups such as `S₃` are not objects of the stated abelian coefficient category; no claim silently broadens to nonabelian lim¹. All page inequalities are integer inequalities, with an explicit initial-page restriction; finite-index clamping and the empty carrier `Fin 0` are checked separately.

### Sources: all 15 seeded targets

No additional locator is flagged unverified in the author text. Six works are already settled as uncertified; they were not requested again. The following checks distinguish the actual source theorem from the roadmap's stated extension to native spectral objects or arbitrary abelian categories.

| Sampled target | Text and locator read | Outcome |
| --- | --- | --- |
| 1.1 | stacks-012K line 2612–2619, construction after Definition 20.1, p. 53; helle-rognes2024 line 65–70, Lemma 2.2, draft p. 2 | Subquotient transport is the categorical formulation of the construction. Markings and nested preimages have been checked independently. |
| 1.3 | stacks-012K line 3120–3130, Lemma 24.8(1–2), p. 64; line 2634–2637, Definition 20.2(2), p. 54 | Regular/coregular directions and degeneration agree. |
| 2.3 | stacks-012K line 1151–1182, Definition 10.1 and Lemma 10.3, p. 23; line 3185–3197, proof of Lemma 24.12, p. 66 | Source's even/odd calculation supports page invariance. README states finite support, the weak Serre conditions and additivity explicitly, and supplies the general-page route. |
| 3.2 | helle-rognes2024 line 94–98, Definition 2.7, p. 2; stacks-012K line 3131–3143, Definition 24.9, pp. 64–65 | Different meanings of weak and strong convergence are explicitly translated, including exhaustiveness and canonical comparison. |
| 3.3 | stacks-012K line 3055–3061, Lemma 24.4, p. 63 | This source is the filtered-complex instance, as advertised. The general category is defined by the commutative β square; identities and composition satisfy it. |
| 4.1 | helle-rognes2024 line 291–303 and 334–335, Definition 4.5 and Remarks 4.6, 4.10, p. 6 | Kernel/image formulas agree after the page shift; restricted recipes checked directly at the pin. |
| 4.3 | stacks-012K line 3072–3106 and 3144–3151, Lemmas 24.6 and 24.10, pp. 63–65 | Supports the canonical subquotient and equality criterion in filtered-complex form. Endpoint and continuity extensions follow from the stated exact-sequence/image arguments. |
| 4.4 | stacks-012K line 3202–3240, Lemma 24.13, pp. 66–67 | Source has all-degree filtered-complex hypotheses. README correctly isolates the two lower degrees and degree-n top isomorphism needed for the degree-local spectral-object claim. Source proof errors below are not reproduced. |
| 4.5 | Same Lemma 24.13, via §4.4; pinned `HasSpectralSequence.lean:394,437` | Quadrant bounds were derived from the actual classes, not attributed as an independent Stacks theorem. |
| 4.6 | weibel1994 Theorem 5.2.12 | Uncertified. The separate finite-filtration route and computed countermodel were checked; the theorem number could not be read. |
| 5.1 | stacks-012K line 3038–3061, Lemmas 24.3–24.4, pp. 62–63; pinned Tau Ceti first-page statements | Differential is the positive connecting map. The source's countable-sum construction is not assumed to prove the arbitrary-category extension: the pinned spectral-object construction supplies it. |
| 5.2 | stacks-012K line 3062–3106 and 3131–3151, Definition 24.5, Lemma 24.6, Definition 24.9 and Lemma 24.10, pp. 63–65 | Induced filtration and the two canonical comparisons agree. The abstract-isomorphism counterexample excludes the stronger false interpretation. |
| 7.1 | helle-rognes2024 line 71–93, Definitions 2.3, 2.5 and Lemma 2.6, p. 2; native product–difference definitions | Source is graded modules; the explicit categorical completeness proof was checked. weibel1994 §3.5, including the other general tower locators, is uncertified. |
| 7.4 | helle-rognes2024 line 145–247, Definitions 3.6–3.11, Lemmas 3.13–3.15, Theorems 3.9–3.10 and equation (3.1), pp. 3–5; line 943–969, Example 8.1, p. 16 | Reversal of filtration index and total-degree shift checked. Generalization uses exact sequential colimits, exact products, and repleteness for the surjective-limit step, rather than assuming a module argument automatically works. Boardman numbers are verified only as cited by this text. |
| 7.5 | weibel1994 Theorem 5.5.10 and eilenberg-moore1962 §7 | Both uncertified. The stated route through completeness, exact products, the exact couple and §7.4 was checked mathematically, including all repaired Check implications. |

Also compared the additional passages in §§1.2, 1.4, 2.1, 3.1, 6.2 and 7.2; the geometric-circle-method example against browning-sawin2020 line 57–75 and 568–587; and two Lean docstrings. bhatt-scholze2015 line 701–702 and 755–770 supports the stated topos instance and the repleteness route; stacks-012K line 3715–3735 supports the general ML definition and explicitly warns that exact products alone do not suffice.

### Pinned library evidence and duplication

The following declarations were opened at the pins, in addition to comparing the signatures above. Paths are relative to the corresponding library repository.

- `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean:36,51,60,90,99,109,114,118,128`: pages, compatible page maps, reindexing isomorphism and cohomological carriers. The structure fields are `page` and `iso`; they do not include `E_∞`, an abutment or convergence.
- `Mathlib/Algebra/Homology/SpectralSequence/ComplexShape.lean:36,47` and `Mathlib/Algebra/Homology/ComplexShape.lean:163`: integer-vector relations on native and restricted positions.
- `Mathlib/Algebra/Homology/SpectralObject/HasSpectralSequence.lean:67,143,176,214,260,303,347,356,394,402,406,437,445,449`: recipes, existence conditions and quadrant classes. `FirstPage.lean:47,54,59,64,78,114` supplies first-page computations for the three `EInt` recipes, not the finite recipe. `SpectralSequence.lean:479,488` constructs the sequence and its page-object isomorphism.
- `Mathlib/Algebra/Homology/SpectralObject/EpiMono.lean:84,142,148,183,191,216,224`: directions and vanishing hypotheses of the two comparison maps. `Page.lean:65` and `Cycles.lean:59,63` identify the homology, kernel and cokernel objects. `Mathlib/CategoryTheory/ComposableArrows/Two.lean:35` supplies the top comparison arrow. These do not already supply §4.3's weaker monomorphism criterion.
- `Mathlib/CategoryTheory/Filtration/Basic.lean:44,73,145`: a filtration is a functor into monomorphisms over the object, without exhaustiveness, separation or completeness. `Mathlib/CategoryTheory/Subobject/Basic.lean:102,292,572` and `Limits.lean:120,314` supply the subobjects, inequalities, pullbacks, kernels and images used here.
- `Mathlib/CategoryTheory/ObjectProperty/ContainsZero.lean:38`, `Kernels.lean:76,123`, `Extensions.lean:42`, and `Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean:45`: weak and ordinary Serre hypotheses. The kernel/cokernel classes quantify over all limiting forks/coforks, giving the needed isomorphism closure. `Mathlib/Algebra/Homology/EulerCharacteristic.lean:56,119,148,154` supplies signs and finite-rank Euler quantities, not the filtered-complex headline here.
- `Mathlib/Algebra/Homology/HomologicalComplex.lean:431,436` supplies `dTo`, `dFrom`; `ShortComplex/HomologicalComplex.lean:583,630` supplies `isoHomologyι`, `isoHomologyπ`.
- `Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Basic.lean:99,126,152,166`, `Limits/Shapes/Countable.lean:61,108`, `Limits/HasExactLimitsOfShape.lean:47`, and `Preadditive/Projective/Basic.lean:77`: product, colimit and projectivity hypotheses. `Mathlib/Algebra/Category/ModuleCat/AB.lean:30,38` uses the same universe for ring and modules; `Projective.lean:60` asks `Small`; `EpiMono.lean:67` preserves epimorphisms in every module universe. `Mathlib/CategoryTheory/Functor/EpiMono.lean:158` and its generated dual reflect them for faithful functors.
- `Mathlib/CategoryTheory/Subobject/ArtinianObject.lean:55,69` gives descending-chain stabilization. `Mathlib/CategoryTheory/CofilteredSystem.lean:121,137` puts the existing ML definition on functors to `Type`, not arbitrary abelian categories. Thus the same-name search hit is not duplication of the new predicate.
- `TauCeti/Algebra/Homology/SpectralObject/Abutment.lean:44,50,54,76,92,114,123`, `Stabilization.lean:39,45,51`, `Comparison.lean:42,78,121`, `SpectralSequenceMap.lean:64,230`, `Map.lean:106,223,284` and `TauCeti/Algebra/Homology/SpectralSequence/Comparison.lean:32`: abutment, filtration, `EInfty`, maps and page-isomorphism propagation. The existing comparison asks vanishing at the top in degrees `n−1,n`; the new theorem only asks an isomorphism in degree `n`.
- `TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:147,191,224,304,409,415,425`, `Naturality.lean:83`, `FirstPage.lean:89`, `Stabilization.lean:44,60,83`, `Convergence.lean:51,91,118`, `Comparison.lean:70`, `Exhaustive.lean:102,177,200`: native filtered construction and comparisons. The existing finite theorem asks global stages `F a=⊥`, `F b=⊤`; the new Euler theorem only asks degreewise finiteness. The existing exhaustive comparison is for modules and retains its upper graded-cohomology hypothesis; the new comparison removes that hypothesis in the stated general category.
- `TauCeti/Algebra/Homology/SpectralSequence/Bicomplex.lean:410,497` supplies the row-filtration examples. `TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean:216` and `EulerCharacteristic.lean:165` give additive invariants and the finite cochain Euler engine, not the general-page or filtered-abutment statement.
- `TauCeti/CategoryTheory/Preadditive/TowerDifference.lean:77,122,150,165`, `TauCeti/CategoryTheory/Limits/Replete.lean:91,97,107,118,357`, `Sites/Replete.lean:48`, `Condensed/Light/Replete.lean:45`, and `Functor/ProZero.lean:67`: actual product–difference map, kernel-limit comparison, pro-zero result and categorical repleteness. Repleteness's definition does not mention lim¹.
- `TauCeti/Algebra/Category/ModuleCat/Tower/Basic.lean:170,174` and `MittagLeffler.lean:70,191`: existing module lim, lim¹ and vanishing. These do not state the arbitrary-abelian-category ML theorem.

The near-match results were treated as leads. None of the eight headline statements already occurs at the pins. No declaration was identified as adapted from an external public formalization.

### Ownership, suppliers and order

Read the supplied board-package index and overlap report, searched the current board packages by object, and used `roadmaps grep` and `roadmaps show` for current main/open-head ownership. The closest scopes read were AlgebraicTopology (main, #1807, #1808), EnhancedDerivedSheaves (main, #1330, #1630), ArithmeticGaloisDuality (#858), DerivedModuleAlgebra and StableHomotopyKTheory. The results/headings closest-roadmap list is empty. The overlap report has no competing head for this roadmap, dropped cited id, or citation defined only by an open revision. The object searches separate general abelian convergence from applications to modules, spectra, sheaves and arithmetic cohomology; no second owner for the retained general objects was found.

Every explicit supplier citation was resolved anew:

| Citation | Present text and ownership |
| --- | --- |
| StableHomotopyKTheory §§7.21–7.26 | `TauCetiRoadmap/StableHomotopyKTheory/README.md:2596,2618,2641,2659,2667,2683`: filtered spectra, exact couples, their spectral sequences and convergence. §7.22 defines arbitrary-abelian-category couples and derivation; §7.26 concerns the complete spectrum towers introduced before it. |
| DGFloer Layer 1 items 2–3 | `TauCetiRoadmap/DGFloer/README.md:621` for filtered complexes, with cohomological dictionary at line 646 and complete convergence at line 650; item 2 immediately precedes it. Module scope agrees with the deferral. |
| AlgebraicTopology Stage 6 item 0 | Current main's old-to-new mapping at `TauCetiRoadmap/AlgebraicTopology/README.md:879` resolves this to §6.0 and the supplied Tau Ceti tower algebra. §6.0 is at line 2145. The two open revisions retain the tower material or its mapping; the older citation remains valid. |
| DerivedModuleAlgebra §S.1 | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:955`: first-quadrant double-complex pages, filtration, bounds, edges and exact sequences. This roadmap's instances are Checks, not another double-complex construction. |
| SchemeAndStackFoundations §§2.2, 2.17 | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4184,4977`; `IsReplete.derived_limits` at line 4993 and the cyclotomic counterexample at line 5011. |
| EnhancedDerivedSheaves E2:towers.1, E2.1, E2.2 | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1294,2035,2083`: coherent derived limits, replete-topos results and sheaf Milnor theory. The ordinary abelian-category lim/lim¹ targets here do not re-plan those derived constructions. |
| ComplexKahlerGeometry K8 | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:366` maps K8 to Layer 8, which starts at line 3317 and owns the Frölicher instance. |

The generic module-tower work is now largely pinned, and the AlgebraicTopology numbering has changed since the earlier review. Its explicit mapping prevents supplier drift; this package also names the exact Tau Ceti declarations, so no repair is required. References to HeegaardFloer and MorseTheory identify examples/ownership boundaries, not proof inputs. All Downstream consumers are outputs, not suppliers.

`gap:exact-couple-morphisms` has the identical slug, supplier, section and precise sentence in `packages/SpectralSequencesAndConvergence/design/plan.json:1881` and the README contract at line 340. The required data are morphisms of fixed-degree bigraded couples commuting with all three maps, identities/composition and functorial derived morphisms. StableHomotopyKTheory §7.22 does not already state this morphism construction. The pins have spectral-object morphisms, not this exact-couple carrier. This is a minimal declared contract, not an unowned prerequisite.

The dependency check was run exactly as requested, with the package README, merge order, movable placement and content checkout. Its output was:

```text
depcheck: 242 roadmaps, 2194 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. All 34 `Needs` occurrences and all supplier-contract entries were read; alternative routes distinguish their inputs. The within-layer reference from the first-quadrant observation in §4.4 to §4.5 is a consequence, not an input to the general convergence theorem.

Overlap check: read AlgebraicTopology, EnhancedDerivedSheaves, ArithmeticGaloisDuality, DerivedModuleAlgebra, StableHomotopyKTheory; exact couples/derived couples belong to StableHomotopyKTheory §7.22; spectrum-tower Boardman convergence to its §7.26; module towers to Tau Ceti and AlgebraicTopology's mapped Stage 6 item 0; double complexes to DerivedModuleAlgebra §S.1; coherent/sheaf derived limits to EnhancedDerivedSheaves; arithmetic applications to ArithmeticGaloisDuality. General abelian convergence structures and the stronger categorical variants remain here; no shared object has two owners.

### Wording, arrangement and reuse

Compared 22 passages with four readable sources: the 13 source-readable sampled sections, six additional numbered sections (§§1.2, 1.4, 2.1, 3.1, 6.2, 7.2), the Layer 3 geometric example, and the bounded-below and repleteness theorem docstrings. The comparisons were against the source windows listed above. A supplementary normalized ASCII-word comparison found longest shared runs of 2–6 words, all standard mathematical phrasing; manual inspection found no copied sentence, clause-by-clause paraphrase, proof narrative, table or exercise list. The explicit Example 8.1 adaptation is reindexed, recomputed and explained in the roadmap's own form.

Counting named-source citation occurrences before References gives 86: Stacks 42, Helle–Rognes 21, Weibel 11, Boardman 5, Bhatt–Scholze 2, Eilenberg–Moore 2, and one each for Browning–Sawin, McCleary and Massey. This counting convention treats a citation naming several locators together as one occurrence.

Compared the Stacks contents at stacks-012K line 23–38 with the roadmap: Layer 1 uses §20; Layer 2 part of §24; Layer 3 §19 and parts of §24; Layer 4 the native spectral-object construction rather than a Stacks section; Layer 5 §24; Layer 6 §21; Layer 7 §31 plus independent Boardman/repleteness inputs. There is no one-to-one run in source order. The dependencies force towers before convergence structures (§3.2), those before spectral-object convergence (§4.4), spectral-object comparison before filtered specialization (§5.3), and exact-couple assembly before conditional convergence (§7.4). The separation of these interfaces is the roadmap's own organization.

Source independence: 22 passages compared with 4 sources, no borrowed expression found; largest share stacks-012K, 42 of 86 citation occurrences; contents compared with stacks-012K: independent. The six settled uncertified sources could not be compared directly.

## Not verifiable

- `weibel1994`, `boardman1999`, `eilenberg-moore1962`, `mccleary2001`, `massey1952`, `cartan-eilenberg1956`: settled uncertified texts. Their locator accuracy, wording and arrangement could not be directly verified. In particular the direct locators for sampled §§4.6 and 7.5 remain uncertified; the mathematical routes were checked independently.
- Boardman's numbers were checked only where Helle–Rognes quotes them and where the named supplier records them, not against Boardman's text.
- The journal numbering of Browning–Sawin and Bhatt–Scholze was not compared with the published versions. Their manifest entries explicitly identify the arXiv versions and the numbering used. The Helle–Rognes statements were checked in the recorded author draft, not independently against the publisher copy.

No new missing-reference request is needed. No manifest entry was added, removed or rewritten.

## Source issues

- **Misprint** in helle-rognes2024 at Lemma 2.2, proof, draft p. 2, line 69: the source says the outgoing differential supplies the boundary subobject at the same position; it should be the incoming differential from filtration position s + r; affects the proof.
- **Misprint** in helle-rognes2024 at Proposition 4.9, proof, draft p. 6, line 332: the source says the relevant differential image is indexed s − r; it should be indexed s + r, as the proposition states; affects the proof.
- **Misprint** in helle-rognes2024 at Lemma 3.13, proof, draft p. 4, line 186: the source says π is a colimit structure map; it should be the limit projection from A⁻∞; affects nothing.
- **Misprint** in stacks-012K at Lemma 24.11, proof, p. 65, line 3162: the source says vanishing of the degree-n filtration term gives the cycle equality; it should use the degree-(n+1) term; affects the proof.
- **Misprint** in stacks-012K at Lemma 24.13, proof, p. 67, line 3225: the source says the preimage equals a differential image plus cycles; it should use the filtration step itself plus cycles; affects the proof.
- **Error** in stacks-012K at Lemma 24.13, proof, p. 67, line 3229–3232: the source says degree-(n−1) cohomology isomorphism gives the boundary equality; it should use injectivity on degree-n cohomology; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "ef909e4b87a42d6ade2bd8c841aba03d0dfdbb3a", "job": "REV-PKG-SpectralSequencesAndConvergence~5", "model": "gpt-6-astra", "worker": "chris-8"} -->
