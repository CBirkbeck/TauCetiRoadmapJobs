# Review of SNumbers (pull request #1650 at 7b6413c)

**Verdict:** needs changes

## R01 (P1) — The lifting identity also needs scalar completeness

**Location:** `TauCetiRoadmap/SNumbers/README.md:61` and `:198`–202: “Pietsch's lifting identity … need[s] a `DenselyNormedField`”; “For complete `X` … `dₙ(T) = aₙ(T ∘L Q_X)`”.

**Claim:** Dense scalar norms and completeness of X suffice for the lifting identity, with arbitrary normed Y.

**Witness:** Take 𝕜=ℚ with its usual norm, X=Y=ℝ as ℚ-spaces, T=id, n=1. Then d₁(T)=0 because ℚ⊂ℝ is dense, whereas a₁(Q_X)=1.

Here is a verification of the less immediate right-hand value. Any continuous finite-ℚ-rank map L from ℓ₁(B_ℝ;ℚ) to ℝ has only finitely many nonzero columns Lδ_x. Otherwise choose distinct nonzero columns and rational coefficients t_j, with ∑|t_j|<∞, such that v_j=t_jLδ_xj are positive and v_j>∑_{k>j}v_k. Every binary sequence gives an element with coordinates 0 or t_j in this rational ℓ₁ space. Continuity sends it to ∑ε_jv_j; these sums are all distinct. That contradicts the countability of a finite-dimensional ℚ-vector space. Outside the finitely many nonzero columns, |x| can approach 1, so ‖Q_X−L‖≥1. The zero approximant gives equality. Meanwhile the quotient seminorm on ℝ/ℚ is zero.

**Repair:** Require `[CompleteSpace 𝕜]` as well as `[DenselyNormedField 𝕜]` and `[CompleteSpace X]` for A14. The constructed finite-dimensional V must be complete for ∑α_xw_x to remain in V. Keep the quotient definition of d over general fields. Add this incomplete-field negative control. Over ℝ, the same identity has d₁=0=a₁(Q_X), since Q_X has real rank one; the ℚ instance is excluded precisely by the new hypothesis. This is an additional issue beyond the repaired weighted-ℚ₂ example.

## R02 (P1) — The build gate rejects the module-system warning

**Location:** `TauCetiRoadmap/SNumbers/Suggested.lean:5`, “`import Mathlib`”.

**Claim:** The acceptance file must pass the supplied build gate with only `sorry` warnings.

**Witness:** The worker records `build=1`: importing module-system Mathlib from this legacy file produces a warning asking for `module`. Targeted `lake build TauCetiRoadmap.SNumbers.Suggested` reproduces it.

**Repair:** Add the `module` header before the existing import and retain the permitted import form. A scratch copy with that header elaborated with exactly 56 `sorry` warnings and no other diagnostics. Rerun the targeted build and gate after the repair. This is the mandated severity for the recorded build-rule failure: the compiler itself exits successfully, and direct `lake env lean` on the original has only the 56 `sorry` warnings.

## R03 (P2) — Three statable headlines remain absent

**Location:** `TauCetiRoadmap/SNumbers/Suggested.lean:33`–35: “their carriers … with the summation and evaluation maps are part of those targets”; `TauCetiRoadmap/SNumbers/README.md:198`, `:203`, `:494`.

**Claim:** A14/A15 can remain README-only because their maps/carriers are unavailable; the acceptance inventory covers the diagonal conclusions.

**Witness:** Scratch signatures for A14, A15 and E04 all elaborate on native `lp`, `StrongDual`, `PiLp` and the retained `diagOp`, with the maps fixed by their exact summation/evaluation equations.

**Repair:** State lifting (with R01's hypothesis), embedding, and the same-exponent diagonal theorem for every strict s-number sequence. Their exact equations can identify Q and J just as the existing inclusion theorems identify I; there is no need for a free predicate or sorry-defined map. The native summation primitive is `lp.tsumCLM`, `Mathlib/Analysis/Normed/Lp/lpSpace.lean:751`. The evaluation carrier is already native too. Check T=3id_ℝ at n=0,1: both sides of each lifting/embedding identity are 3,0. For E04, σ=(3,1) at p=1 gives 3,1 for every strict family, a case not asserted by the mixed-exponent theorem. Add the actual retained theorem names to the README. The earlier missing sharp bound, inclusion estimates, uniform identity bound and failure-of-law theorems have been added; this finding concerns the remaining omissions.

## R04 (P3) — Claim-level source locators remain missing or wrong

**Location:** `TauCetiRoadmap/SNumbers/README.md:182`, “Pietsch 1974, §2”; `:388`, “Theorem 9.5, for … SN-C17 and SN-C18”; References at `:624`–646.

**Claim:** These locators identify Gelfand strictness and both index laws; broad bibliography entries identify most other targets.

**Witness:** `pietsch1974 line 160`, Theorem 4.1, p.206 supplies Gelfand numbers; §2 is Hilbert uniqueness. Theorem 9.5, p.222 (`pietsch1974 line 552`) asserts additivity, not multiplicativity.

**Repair:** Cite §4/Theorem 4.1 for A09; distinguish the additive locator from a verified multiplicative proof, such as blueprint Theorems 3.6/3.8, pp.9–11. Give every definition, theorem and proof input its precise version, theorem/section and printed page. Supply the missing `sources.toml`, one key per work, retaining uncertified statuses. The sampled-source table below supplies verified locators and explicit limitations. In particular, §7's decreasing-diagonal assumptions now agree with E06, and blueprint Theorem 8.10's nonnegative parameters now agree with E09. Correcting the locator must not undo these repairs.

## R05 (P3) — Definition APIs, discriminating Checks and layer contracts are still absent

**Location:** `TauCetiRoadmap/SNumbers/README.md:1`, `:137`–141 and `:596`–622: “the labels … are the complete obligation set”; repeated “Definitions”. `Suggested.lean:8` still calls itself “not exhaustive”.

**Claim:** The catalogue and global examples supply the required definition and build contracts.

**Witness:** A08, A16, A18 and C04 have no attached API list or three discriminating Checks. There are zero `*Needs:*` lines and no per-layer Examples/Dependencies sections. `diagOp` and retained theorem names are absent from the README.

**Repair:** Apply the requested Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, and numbered Layer structure. Consolidate repeated definitions into their owning layers. Each definition needs its own API and at least three meaningful Checks, with exact dependencies per target. For example use a rank-zero map, diag(3,1), and the weighted ℚ₂ identity for quotient d; use Δ₀(0)=1, Δ₁(0)=0, Δ₂(diag(3,1))=3 for Δ. Include the native `Metric.IsCover`/external covering-number API in Mathlib contracts rather than rebuilding generic covering theory. Synchronize retained Lean names and put Lean sections in README layer order; duality currently appears after Part E. Keep the added mathematical negative controls while making this structural repair.

## R06 (P3) — The identifier gate misclassifies an existing Mathlib theorem

**Location:** `TauCetiRoadmap/SNumbers/README.md:189`: “`ContinuousLinearMap.sSup_unitClosedBall_eq_nnnorm`”.

**Claim:** The gate lists this as an undeclared identifier owned by the roadmap.

**Witness:** It is present at the pin in `Mathlib/Analysis/Normed/Operator/NNNorm.lean:200`, under `DenselyNormedField` at line161. A scratch `#check @ContinuousLinearMap.sSup_unitClosedBall_eq_nnnorm` succeeds.

**Repair:** Identify it explicitly in the Mathlib supplier contract and pin it with the permitted library `#check` in Suggested.lean, so the scanner sees the reference. Do not define a replacement. The underlying use in A11 is correct; the exact false-positive line is `readme-ids-missing: ContinuousLinearMap.sSup_unitClosedBall_eq_nnnorm`. The unchanged README still fails that gate rule.

## R07 (P3) — Remove the norm-bound wrapper and zeroth-index padding

**Location:** `TauCetiRoadmap/SNumbers/Suggested.lean:245` and `:517`: `IsSNumberSequence.le_nnnorm`; `entropyNumber_zero`.

**Claim:** These belong in the headline acceptance test.

**Witness:** The first closes with `simpa only [hs.apply_zero T] using hs.antitone T (Nat.zero_le n)`. The second is precisely the n=0 boundary value already in README D02.

**Repair:** Delete both from `Suggested.lean`; keep their mathematics in the README. The norm-bound probe elaborates and reduces the warning count from 56 to 55. For T=3id_ℝ the norm bound is 3≤3 at n=0 and 0≤3 at n=1; the entropy boundary is e₀=3=‖T‖. This does not ask for either proof to be committed in place of `sorry`.

## Verified sound

This is an independent AI review of the entire folder at the stated head, not an incremental review. It covers all **86 labelled targets**, their eight repeated definition summaries, all seven worked examples and all **79 Lean declarations** (56 sorried theorems). The **15 seeded targets** are covered in the source table. Finite computations below are discriminating tests, not proofs of universal claims. Failed tests are explicitly marked and are not included as endorsements.

### Previous findings, checked first

No repair report marking a finding “not actionable in this package” was supplied or found among the package reports. The following quotes are from this head; earlier findings are identified by their previous numbers.

| Previous finding | Current passage and result |
|---|---|
| R01, non-dense scalar normalization | README183: “infimum … of the norm of T followed by the quotient map”; README190: “d₀ = 1 … at most 3/4”; Lean75 uses `mkQL`. **Repaired** for the reported example, entropy density and ratio Riesz route. New lifting issue is R01 above. |
| R02, compactness field | README292: “Over `RCLike 𝕜`”; Lean425 occurs in the RCLike section. **Repaired**; infinite-residue-field control retained. |
| R03, squared factorization bounds | README516: “with `a, b ≥ 0`”. **Repaired**: a=−1 is excluded, a=b=1 yields 1≤1≤1. |
| R04, unsorted diagonal | README500: “with `|σ|` nonincreasing”; README502: “`n < m`”. **Repaired** for E06; (0,1) is explicitly rejected. |
| R05, lost square | README546: “`κ_𝕜⁴ (2n+1)`”. **Repaired**: 67125249>67112960. |
| R06, missing headlines | Lean470: “sharp form”; Lean600: “`∃ κ : ℝ, ∀ m n`”; Lean608/614 assert the two failures. **Partly repaired**: these, mixed diagonals and inclusion estimates are present; A14/A15/E04 remain absent (R03). |
| R07, roadmap import | Lean5: “`import Mathlib`”, with no other import. **Repaired**; native rank-infimum body retained with supplier ownership. |
| R08, supplier wrappers | README125: “those of `a` are `OI-A17`, `OI-A22`”. **Repaired**: both duplicate approximation-number index-law wrappers are gone. |
| R09, locators | README182: “Pietsch 1974, §2”; most targets still have no claim locator, and no manifest exists. **Partly repaired**, R04. |
| R10, shape and Checks | README137: “The build, in layers”; README596: “Definitions”. **Partly repaired**: namespace wording and several negative controls were corrected; APIs, Checks and target-level dependency structure remain missing, R05. |
| R11, multiline scanner hit | README467 puts the complete identity code span on one line. **Repaired**: `tex=0`, `latex=0`. |
| R12, three proof sketches | README278: “`ker (φ_i ∘ T)`”; README460: “`(n+1)⁻¹ ∑ ε_k x_k`”; README465: “`0 < γ < aₙ(T)`”. **Repaired**: correct domain, unit-ball bound, and positive divisor. |

### Build, signatures and padding evidence

The head is exactly `7b6413c5a1f718978c40b04bcf5849f6dc3afa4f`. The diff against origin/main has **zero changes outside SNumbers**. The worktree was not edited. No sorry-defined data, `set_option`, admitted examples, computational algorithm, detected supply cycle, route-specific mathematical shortcut or duplicate new-roadmap ownership was found.

Direct elaboration of the original file exited 0 with **56 `sorry` warnings only**. The targeted Lake build exited 0 but emitted the extra module-system warning in R02. The worker's gate is FAIL, with `readme-ids-missing=1` and `build=1`; all other recorded counters are zero. Rerunning the supplied gate stops at the same identifier failure, before building. Thus the gate has not passed, even though ordinary elaboration has.

A scratch copy added **`#check @name` for every one of the 79 declarations**, plus the disputed Mathlib declaration. All 80 checks elaborated. I compared every elaborated type against its README statement. No required binder silently disappeared. The real/complex compactness hypotheses, complete-field strictness hypotheses, positive diagonal exponents and uniform order `∃κ, ∀m n` are present. The previous unnecessary completeness assumptions on the two projection bounds are gone. R01 is a prose theorem absent from Lean, not a dropped Lean binder.

For **each of the 56 sorried theorems**, a scratch copy tried `simp`, `rfl` and `infer_instance` as separate one-tactic attempts. All 56 failed these untailored attempts; failure does not certify depth. A tailored one-simp probe closes the norm bound in R07. The boundary-value declaration there is padding by the explicit acceptance-file rule regardless of tactic difficulty. Three additional complete headline signatures (A14, A15, E04) elaborated, with no stand-in data, no `set_option`, and only the expected sorry warnings. Adding `module` to a separate scratch copy also elaborated.

### Headline inventory

The README's headline conclusions are: axioms/strictness of a,c,d,b and axioms for h; lifting and embedding; c-injectivity and d-surjectivity; the sandwich and Hilbert uniqueness/finite singular-value identification; c/d compactness and the Hilbert compactness criterion; Bernstein minimality; the two projection bounds; determinant recursions and sharp/exponential maximal difference, with its two comparisons; three duality conclusions; c/d index laws, h-additivity and the two Bernstein failures; entropy compactness and comparisons with c,d,h and arbitrary s; finite identity and diagonal formulas; the ℓ₁→ℓ∞ estimates and linear-order optimality; the two-sided ℓ₁-identity bounds and failures of strictness/multiplicativity for h.

The file now states the principal maximal-difference, duality, compactness, inclusion and Hilbert-failure results. R03 identifies the remaining independent headlines omitted despite native carriers. The identity formula E02 for p<q is also recovered from the retained E05 by σ=1, and its p=q case from strict normalization; it does not require another redundant headline. No genuinely missing carrier was established for A14/A15: the docstring's justification for excluding them fails the statability probe.

### Adversarial computations

Notation for these rows: O is a zero map; U=id_ℝ; R=3id_ℝ; D=diag(3,1) on Euclidean ℝ²; H=id on infinite-dimensional real ℓ₂; C is the ℓ₂ diagonal with entries 1/(j+1); I is ℓ₁→ℓ∞. For R the five s-number sequences are (3,0,0,…), e=(3,3/2,3/4,…), Δ=(1,3,0,…). For D the five sequences are (3,1,0,…), Δ=(1,3,3,0,…). A bound below is labelled as a bound where an exact value is not computed. All entries use zero-based indices. “Pass” means no defect on that test; “retain” means no mathematical change from it.

| Statement | Instances tried and computed left/right values | Result; change |
|---|---|---|
| Scalar/index/value conventions | O has s₀=0; U has s₀=1,s₁=0. The zero space has norm(id)=0, not 1; n<rank excludes it. | Pass; retain. |
| Supremum/infimum conventions | For O: the approximation/Gelfand/Kolmogorov admissible sets contain the zero/full subspace as appropriate; value 0. Empty Bernstein family above rank has supremum 0 in ℝ≥0. | Pass; retain. |
| A01, family | For R: a,c,d,b,h each give (3,0,…), entropy gives (3,1.5,…). | Pass; entropy is a family but not an s-number sequence. |
| A02, axioms | U+(−U) gives 0≤1+1; 2U∘3U∘4U gives 24=2·3·4 at n=0. id_ℝ² at n=1 gives 1. The zero family fails 0=‖U‖=1. | Pass; excludes zero/wrong normalization. |
| A03, strictness | id_ℝ² gives s₁=1; at n=2 the rank hypothesis is false and s₂=0. The constant-norm family has s₁(U)=1 instead of rank-axiom value0. | Pass; retain. |
| A04, bound/Lipschitz/continuity | R,U at n=0: 3≤3 and abs(3−1)=2=‖R−U‖; n=1: 0≤3 and 0≤2. R+εU at n=0 differs by abs(ε). | Pass; Lean norm-bound padding R07. |
| A05, homogeneity | c=−2,T=R,n=0: 6=2·3; c=0:0=0; n=1:0=2·0. | Pass; retain. |
| A06, identity approximation | Weighted ℚ₂ line with norm (3/2)abs(x)₂: a₀=1,a₁=0; unit-ball supremum=3/4. | Pass; repaired ratio argument. |
| A07, a strict | id_ℝ²: a=(1,1,0,…); weighted ℚ₂ line at n=0 gives1. | Pass; complete-field hypothesis present. |
| A08, c definition | D at n=0,1,2 gives3,1,0; O gives0. Taking the full domain at n=0 gives norm3, not0. | Pass; three useful Checks available. |
| A09, c strict | Weighted ℚ₂ line gives (1,0,…); H gives cₙ=1 for every finite n. | Mathematics passes; locator R04. |
| A10, d definition | D gives (3,1,0,…); weighted ℚ₂ identity gives(1,0,…), not (3/4,0,…). | Pass; quotient form repaired. |
| A11, ball formula | Over ℝ, D at n=1 has quotient norm infimum1=ball deviation1. Weighted ℚ₂ example gives1≠3/4 and fails density. | Pass; R06 is a scanner issue. |
| A12, d axioms | U+(−U):d₀=0≤2. Weighted ℚ₂ identity composition:1≤1·1. Euclidean ℚ² identity at n=1 has d₁=1. | Pass; does not assert strictness on all incomplete-field spaces. |
| A13, d strict | Complete weighted ℚ₂ line gives d₀=1. Over incomplete ℚ, X=ℝ has d₁(id)=0 although rank_ℚ X>1; completeness excludes this. | Pass; retain field completeness. |
| A14, lifting | ℝ,U,n=0,1: d=1,0 and a(UQ)=1,0. Over ℚ on X=Y=ℝ at n=1: d=0, a(Q)=1. | **Fail; R01**. |
| A15, embedding | J(y)(φ)=φ(y) over ℝ: ‖J(1)‖=1; R at n=0,1 has c=3,0=a(JR). Zero J gives0 instead of3 and violates evaluation. | Pass; missing headline R03. |
| A16, b definition | D gives gains3,1 at n=0,1; no rank3 subspace at n=2 gives b₂=0. O has gain0. | Pass; retain. |
| A17, b strict | U gives(1,0,…); H gives bₙ=1; O gives0. | Pass; ratio avoids empty spheres. |
| A18, h definition | R gives(3,0,…); D gives h₁=1; I gives h₂=1/3 while c₂≥1/2. | Pass; distinguishes h from strict families. |
| A19, ratio | For R, A=2U,B=4U gives numerator24 divided by8=3; contraction form gives3. At O both suprema0, including empty nonzero-factor choices. | Pass; A,B≠0 exclude zero denominator. |
| A20, h axioms | U norm1 and h₁=0; id_ℝ² has h₁=1. A rank-one norming factorization of R gives3. | Pass; retain. |
| A21, metric maps | J(t)=(t,0), Q(x,y)=x on max-norm ℝ²: norms of J(2), minimal preimages of2 are2; composition with R has norm3 on both sides. Zero J/Q fail at x=1. | Pass; maps determined. |
| A22, invariances | With those J,Q: c₀(JR)=3=c₀(R), d₀(RQ)=3=d₀(R); n=1 tails0. | Pass; correct directions. |
| A23, c injective | Same embedding on D into ℝ³ gives c=(3,1,0,…), unchanged. | Pass; retain. |
| A24, d surjective | Weighted finite-support ℚ₂ summation: norm Q=d₀(Q)=1=d₀(id); geometric unit-ball deviation(Q)=1/2. | Pass; repaired quotient normalization. |
| B01, upper sandwich | R gives s₀=a₀=3,s₁=a₁=0; I at n=2 gives h₂=1/3≤a₂=1/2. | Pass; retain. |
| B02, scalar factorization | D,n=1,c=1/2: A=id, B=diag(1/6,1/2) has norm1/2 and BDA=(1/2)id. At c=0 choose B=0. | Pass; c<a₁=1 and c≥0. |
| B03, Hilbert uniqueness | D gives s=(3,1,0,…)=a; H gives sₙ=aₙ=1. | Pass; includes noncompact operators. |
| B04, lower sandwich | D:n=1 gives1≤1; I:n=2 gives1/3≤1/2; O gives0≤0. | Pass; retain. |
| B05, finite singular values | D:3,1,0 on both sides; zero-dimensional map:0 at every index on both sides. | Pass; matches Finsupp zero tail. |
| B06, covering | R([-1,1]) covered by balls centered ±1.5, radius1.5: d₂=0≤1.5,c₂=0≤3. Rank2 identity covered by one radius1 ball at0: d₁=c₁=1≤1,2. | Pass; pulled-back kernels have correct domain. |
| B07, d total boundedness | C:dₙ=1/(n+1)→0 and image totally bounded; H:dₙ=1 and image not totally bounded. | Pass in both directions. |
| B08, c total boundedness | C:cₙ=1/(n+1)→0, H:cₙ=1; for ε=.01,δ=.01,‖T‖=1 the quotient-lifting error bound is .0301. | Pass; no dimension factor tending to infinity. |
| B09, c/d compactness | U compact, tails0; H noncompact, tails1. K=𝔽₂(u)((t)): rank1 identity has d-tail0 but infinitely many residues at distance1. | Pass; last case excluded by RCLike. |
| B10, Hilbert compactness | C: all sₙ=1/(n+1), compact; H:all sₙ=1, noncompact. | Pass; retain. |
| B11, b≤c | D,n=1:1≤1; O:0≤0; n=2 both0. | Pass; intersection has nonzero vector when applicable. |
| B12, b minimal injective strict | R,n=0 and s=c:3≤3. At D,n=1:1≤1; gain1 gives inverse norm1. | Pass; only positive gain is inverted. |
| C01, Gelfand projection bound | D,n=0:3≤3; n=1:1≤2; n=2:0≤0. | Pass; no space completeness required. |
| C02, Kolmogorov projection bound | Same D gives3≤3,1≤2,0≤0. Zero-dimensional V uses P=0 of norm0. | Pass; retain. |
| C03, combined bound | D,n=1:1≤2·min(1,1)=2; O:0≤0. | Pass; retain as README corollary. |
| C04, Δ | O:Δ₀=1,Δ₁=0; D:Δ₁=3,Δ₂=3,Δ₃=0; upper bound at k=2 is3≤9. | Pass; wrong all-zero Δ fails k=0. |
| C05, determinant product | D:3·1=abs(det D)=3; diag(−3,1):3=abs(−3); zero-dimensional map:empty product1=empty determinant1. | Pass; absolute value essential. |
| C06, bordered determinant | M=[[2,6],[5,17]],w=3:det=34−30=4=(17−15)·2. k=0 gives [7]:7=7·1. Zero ring gives0=0. | Pass; no invertibility assumption needed. |
| C07, lower recursion | D,k=0:1·3·1=3≤3; k=1:(1/4)·1·3=.75≤3; k=2:0≤0. | Pass; k=0 handled separately in optimization. |
| C08, upper recursion | D,n=0:3≤3·1; n=1:3≤1·3; n=2:0≤0·3. | Pass; retain. |
| C09, sharp bound | D,n=0:3≤(1/1)·3=3; n=1:1≤4; I,n=2:1/2≤(27/4)(1/3)=9/4. | Pass; 0^0=1 prevents 0/0. |
| C10, exponential bound | D,n=0:3≤3e; n=1:1≤2e; I,n=2:1/2≤e. | Pass; retain. |
| C11, any two sequences | I,n=2,s=a,t=h:1/2≤3e·(1/3)=e; D,n=1:1≤2e. | Pass; retain. |
| C12, Bernstein comparison | D,n=1:max(1,1)=1≤2e·1; O:0≤0. | Pass; retain. |
| C13, d(T′)=c(T) | D′=D,n=1:1=1. For T(z)=iz, Banach dual sends φ(z)=z to iz, whereas Hilbert adjoint is −i; both singular magnitudes1. | Pass; correct dual convention. |
| C14, c(T′)≤d(T) | D,n=0,1:3≤3,1≤1; O:0≤0. | Pass; no unsupported converse asserted. |
| C15, compact duality | R is compact: c(R′)=(3,0,…)=d(R). Finite D at n=1 gives1=1. | Pass; complete-space hypotheses present. |
| C16, index definitions | R+U at m=n=0:4≤3+1; R∘U:3≤3·1; at m=n=1:0≤0. | Pass; zero-based m+n. |
| C17, c index laws | S=diag(3,0),T=diag(0,1),m=n=1: c₂(S+T)=0≤0+0 and c₂(ST)=0≤0·0. m=n=0,R,U give4≤4,3≤3. | Pass; multiplicativity locator not 9.5 (R04). |
| C18, d index laws | Same rank-one S,T give0≤0 for both laws; weighted ℚ₂ identity at m=n=0 gives1≤1. | Pass; quotient proof preserves general fields. |
| C19, h additive | Same S,T give h₂(S+T)=0≤0; R+U at index0 gives4≤4. | Pass; multiplicativity deliberately absent. |
| C20, Bernstein identity bounds | N=3,n=1: b₁(ℓ₂³→ℓ∞³)≤1/√2; reverse ≤√(3/2). At n=0 actual norms1,√3 equal bounds. | Pass; bounds suffice below. |
| C21, b nonmultiplicative | N=3,m=n=1: b₂(ST)=1; b₁(S)b₁(T)≤√3/2≈.866025. | Pass; strict separation. |
| C22, b nonadditive | N=71: LHS b₇₀(S+T)≥1/3; RHS≤1/6+√71/54≈.322706<.333333. On (x,3x), image=(x/3,x). | Pass; strict separation. |
| D01, entropy definition | R:2⁰,2¹,2² balls give exact radii3,1.5,.75. O gives0; rank1 does not force e₁=0. | Pass; arbitrary centers and closed balls. |
| D02, norm/monotonicity | R: .75≤1.5≤3; e₀=3=norm. Weighted ℚ₂ identity e₀=.75<1. | Pass; real/complex equality restriction. |
| D03, entropy additive | R+U,m=n=1: e₂(4U)=1≤1.5+.5=2; O gives0≤0. | Pass; four sum-centers. |
| D04, entropy multiplicative | R∘U,m=n=1:e₂(3U)=.75=e₁(R)e₁(U)=1.5·.5. Weighted ℚ₂ identity at0 would give .75≤.5625, excluded by density. | Pass; density necessary for this statement. |
| D05, pseudo-s/rank failure | U:n=1,2 gives e=1/2,1/4>0 while rank1 would require0. c=2 postcomposition multiplies interval entropy by2. | Pass; retain positive-value theorem. |
| D06, entropy compactness | U:eₙ=2^(−n)→0 and compact. H:eₙ=1 for all n and not compact. Infinite-residue field identity also has eₙ=1, not a false zero tail. | Pass; general-field entropy criterion survives. |
| D07, dyadic comparison | R,n=0:d₁=c₁=0≤3,6; n=1:d₂=c₂=0≤1.5,3. H at n=1:1≤1 and1≤2. | Pass; n=0 targets index1, not0. |
| D08, separation | U,n=0:points±1,δ=2 give e₀=1≥1. At n=1:points−1,0,1,δ=1 give e₁=.5≥.5. | Pass; strictly more than2ⁿ points. |
| D09, identity entropy | U,n=0:e₀=1≥.5. H:any n,eₙ=1≥.5. For U,n=1, dimension condition fails even though e₁=.5. | Pass; zero space excluded. |
| D10, triangular flags | id_ℝ²,n=1,γ=.5: x₀=e₀,x₁=e₁; V₁=span(e₀), distance(e₁,V₁)=1>.5. ρ_j=.5coordinate_j gives diagonal .5 and upper triangle0. | Pass; c-flag requires γ>0. |
| D11, entropy comparison | U,n=0:1≤1; U,n=1:0≤2·.5=1. Four normalized signs in ℝ² have norm1/√2≤1 and minimum separation1. | Pass; previous unnormalized norm√2 excluded. |
| D12, Hilbert entropy bound | R,n=0:3≤2·3=6; n=1:0≤3. For U,γ=.5,A=id,B=.5id:γ⁻¹BTA=id and .5≤γ⁻¹e₀(U)=2. | Pass; γ=0 not inverted. |
| D13, h entropy bound | R at n=0,1:3≤6,0≤3; H:1≤2. | Pass; retain. |
| D14, all-s entropy bound | R,n=0:3≤6e; n=1:0≤6e. H,n=1:1≤4e. | Pass; retain. |
| E01, identity norm | m=2,p=1,q=2: norm=√2=2^(1−1/2); m=1:1=1. m=0 excluded from maximum-type norm formula. | Pass; retain. |
| E02, identity approximation | Same m,p,q: a₀=√2,a₁=1; p=q gives1 for n<m and rank tail0. | Pass; retain. |
| E03, strict ℓp identity | m=2,p=1:n=0,1 gives1=1; n=2 gives0 but violates n<m. | Pass; normalization consequence stays README. |
| E04, same-exponent diagonal | σ=(3,1),p=1: a,c,d,b at0,1 are3,1; strict family formula gives those same values. Zero σ gives0; m=0 has no legal coordinate n. | Pass; headline R03; define empty maximum as0. |
| E05, mixed diagonal | σ=(3,1),p=1,q=2,r=2: a₀=√10,a₁=1; RHS √(9+1),√1. All-zero σ gives0. | Pass; reciprocal equation forces r>0. |
| E06, reverse diagonal | σ=(3,1),q=1,p=∞:norm3 and a₁≤1; p=q=2 gives a₁=1. Unsorted(0,1),n=0 gives1>0 and fails ordering. | Pass; repaired negative control. |
| E07, sign averaging | Real w=(1,1):signed squared norms4,0,0,4 have mean2=sum squares; max M²=4. Complex w=(1,i):all squared norms2=sum squares2. | Pass; complex constant1 needs no loss. |
| E08, row/column estimates | B:ℓ∞²→ℓ₂² identity:sum2=‖B‖². A:ℓ₂²→ℓ₁² identity:row sum2=‖A‖². Empty finite J gives0≤2. | Pass; source/target inclusions matter for HS interpretation. |
| E09, product estimate | T₁=T₂=U,a=b=1,n=0:1≤1≤1. At n=1:0≤1≤1. a=−1 would give false upper−1, excluded. | Pass; repaired signs. |
| E10, inclusion c | I:n=0 gives .5≤1≤1; n≥1 has cₙ=.5 in the read 2026 source, so .5≤.5≤1. | Pass; exact higher-index value not required by target. |
| E11, inclusion h | n=0,1,2 gives1,1/2,1/3. Finite factorization at n=1 uses A=B=(1/√2)id, norms1, composition(1/2)id. | Pass; upper proof uses finite truncation/row bounds. |
| E12, linear order | n=2:(3/2)(1/3)=1/2≤c₂=a₂=1/2. Constant φ=1 would demand1/2≤1/3 and fails. | Pass; retain. |
| E13, ℓ₁ identity | m=1,n=0:1≤h₀=1≤8 (real). m=65,n=64:h₆₄∈[1/√65,8/√65]⊂[.124034,.992278], so strictness fails versus1. m=0 gives h=0 and upper bound≥0. | Pass; κ uniform in m,n. |
| E14, h nonmultiplicative | κ=8,n=8192,m=16385:67125249>67112960; h₁₆₃₈₄≥1/√16385≈.00781226159 >64/8193≈.00781154644≥h₈₁₉₂². | Pass; fourth power repaired. |
| Repeated D1/A02 | R norm value3, zero family0; id_ℝ² at n=1 requires1. | Same axioms; consolidate. |
| Repeated D2/A08 | D gives c=(3,1,0,…), O gives0. | Same infimum; consolidate. |
| Repeated D3/A10 | Weighted ℚ₂ id:d₀=1, ball deviation3/4. | Same quotient definition; consolidate. |
| Repeated D4/A16 | D:b₁=1,b₂=0 (empty admissible set). | Same gain; consolidate. |
| Repeated D5/A18 | I:h₂=1/3 versus c₂≥1/2. | Same contraction factors; consolidate. |
| Repeated D6/C04 | O:Δ₀=1,Δ₁=0; D:Δ₂=3. | Same determinant; consolidate. |
| Repeated D7/D01 | U:e₀=1,e₁=1/2,e₂=1/4, not the rank tail0. | Same entropy; consolidate. |
| Repeated D8/A21–22 | J(2) has norm2; inf norm of Q-preimages of2 is2; compositions with R preserve3. | Same invariances; consolidate. |
| Lean L2 and six family aliases | First two basis vectors have norm1 each and sum norm√2. Family aliases at R,n=0 return3; entropy alias at n=1 returns1.5. | Pass; aliases introduce no new mathematical object. |
| Lean diagOp and dualOp | diagOp(3,1)(1,2)=(3,2); dual of multiplication by i sends identity functional to iz, not−iz. | Pass; body fixes source/target and dual direction. |

The seven global worked examples reduce to these rows: finite diagonal D; strict sandwich at I,n=2 (1/3<1/2); sharp order (ratio a₂/h₂=3/2); compact C versus H; finite dual D; E13/E14; and the three combinations of strict/additive/multiplicative properties. The word “independent” is supported there only by the displayed combinations, not by eight asserted realizations. The finite-diagonal example needs the stated n<m convention (or zero extension); it must not index a `Fin m` function outside its domain.

### Ownership, pinned libraries and suppliers

The main-branch content checked is `fa41b3747f56d4e77bd69e7099c1be4f2e4959ba`; the pins are **Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`** and **Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`**. These differ from the previous review's pins. I opened the following declarations and their surrounding hypotheses anew.

| Pinned file and line | Contract checked |
|---|---|
| `Mathlib/Analysis/Normed/Operator/NNNorm.lean:161`, `:200` | `ContinuousLinearMap.sSup_unitClosedBall_eq_nnnorm` requires densely normed scalars; the supremum is over the closed unit ball. |
| `Mathlib/Analysis/Normed/Module/RieszLemma.lean:44`, `:124` | `riesz_lemma` has closed/proper-subspace and ratio bounds; the normalized unit-vector variant uses RCLike. |
| `Mathlib/Analysis/Normed/Module/HahnBanach.lean:43`, `:66` | `exists_extension_norm_eq` uses `IsRCLikeNormedField`; `exists_dual_vector` uses RCLike and a nonzero norm. |
| `Mathlib/Analysis/Normed/Operator/Compact/Basic.lean:69`, `:77` | `IsCompactOperator` means existence of compact K with preimage a neighborhood of0; it does not include finite rank or properness of scalars. Identity compactness is local compactness. |
| `Mathlib/Analysis/Normed/Operator/Compact/FiniteDimension.lean:23`, `:27` | Identity/finite-dimensional equivalence has complete, locally compact scalar hypotheses; arbitrary nontrivially normed fields do not suffice. |
| `Mathlib/Analysis/InnerProductSpace/SingularValues.lean:78`, `:94` | `LinearMap.singularValues` has finite-dimensional inner-product source and target; sorted nonnegative values are zero-padded. It is not the general Banach approximation number. |
| `Mathlib/Analysis/InnerProductSpace/NormDet.lean:206`, `:374` | `LinearMap.normDet_eq_norm_det` and `normDet_eq_prod_singularValues` supply the determinant/product step of C05. |
| `Mathlib/Topology/Algebra/Module/Spaces/ContinuousLinearMap.lean:217` | `ContinuousLinearMap.precomp` sends f to f∘T; it supplies the real body of dualOp. |
| `Mathlib/Analysis/Normed/Lp/lpSpace.lean:751`, `:1171`, `:1266` | `lp.tsumCLM`, `lp.hasSum_single`, `lp.evalCLM`: native summation, expansion and evaluation. Summation's complete codomain requirement was inspected. |
| `Mathlib/Topology/MetricSpace/Cover.lean:47`, `:131` | `Metric.IsCover` uses distance≤radius, equivalent to union of closed balls; no requirement that centers belong to the covered set. |
| `Mathlib/Topology/MetricSpace/CoveringNumbers.lean:68`, `:74`, `:327` | External versus internal covering numbers are distinct. `Metric.packingNumber_two_mul_le_externalCoveringNumber` supplies generic separation/covering theory; operator entropy is still a new specialization/inverse-radius construction. |
| `TauCeti/Analysis/InnerProductSpace/Spectrum.lean:119` | `ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector` requires compactness and symmetry and supplies B4's spectral input without a separability assumption. |

Object searches covered rank-constrained approximation infima, codimension/restriction norms, quotient deviations, lower gains, Hilbert factorizations, determinants and covering numbers, as well as declaration names, in both pinned libraries. The existing generic covering API must be reused; no pinned implementation of the six general operator-number families was found. The public names retained here did not collide with another readable roadmap declaration.

The required `roadmaps grep` searches covered main and indexed open heads; board package README/Lean text was also searched. The relevant open NoncommutativeIntegration/NoncommutativeGeometry hits concern τ-measurable operators and Fack–Kosaki numbers, a different object. CompactOperators' field approximation calculus explicitly defers to OperatorIdeals and its nonarchimedean Fredholm determinants are different from Δ. BanachSpaceTheory's accessible open revision was inspected for competing ownership but, as required for a revision of an existing roadmap, its **main** version supplies the contract. SNumbers therefore owns these new Banach operator-number families rather than replanning an existing roadmap.

| Cross-roadmap citation | Resolved evidence on main and boundary |
|---|---|
| OperatorIdeals Part A/OI-A01–A29 | `TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md:125`, `:144`–191: approximation-number infimum, calculus, and precisely qualified approximability/compactness. Suggested line50 defines `ContinuousLinearMap.singularValue`; the local approximationNumber formula is a temporary acceptance-test specialization of that owned object, not new ownership. |
| OperatorIdeals A30, A35–A40, A49 | Same README196,213–227,245: adjoint invariance, min–max localization and finite singular values. This supplies B02/B03/B05. |
| BanachSpaceTheory B1 | `TauCetiRoadmap/BanachSpaceTheory/README.md:41`–72: annihilator duality and adjoint/precomposition norm; C13/C14 use exactly these. |
| BanachSpaceTheory B4 | Same README226–242: compact Schmidt expansion, finite/countable positive singular families and zero padding, with s_j=a_j. |
| BanachSpaceTheory B6 | Same README356–408: finite-family summing norms, ideal law, π₂≤π₁ and ℓ₁-to-Hilbert Grothendieck bounds; chosen constants8/16 are universal, not optimal. |
| BanachSpaceTheory B7 | Same README410–452: real/complex local reflexivity fixing canonical-image points, John decomposition, Kadec–Snobar and Garling–Gordon projections. |
| PolarDecomposition | `TauCetiRoadmap/OperatorTheory/PolarDecomposition/README.md:445`–485, especially PD-C09 onward: finite singular systems, the object deferred in scope. |

No supplier drift or unowned prerequisite was established in those named contracts. The source blueprint's upper bound for E11 explicitly uses finite truncations at `lean-snumbers line 1054`; the README can make that route explicit when adding target-level Needs. A source citation alone must not replace the resolved Schmidt and approximation contracts.

There are **no declared supplier gaps and zero `*Needs:*` lines**. The aggregate Ordering paragraph and every supplier citation were read. The prescribed dependency command returned exactly:

```text
depcheck: 205 roadmaps, 1572 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No target ownership needs moving. The four citation-resolver leads are not missing-supplier findings: approximationNumber/gelfandNumber are local definitions, singularValue is the named roadmap-owned input, and `SVD.mul_approximationNumber_le_of_factorization` is a declaration cited from the external blueprint (`lean-snumbers line 1014`), not falsely claimed as a Tau Ceti pin.

### Seeded source audit

All cited works were attempted through the sources service. Five full texts were read legally: `pietsch1974` from the institutional mathematical archive; `pietsch2008` from the publisher; `ullrich2024` arXiv v2; `ullrich2026` arXiv v1; and `lean-snumbers`, the author's blueprint **dated 2 November 2026**. The blueprint has changed since the previous review: its weighted-field and positive-γ passages are repaired. Source lines below refer to the newly fetched texts. Printed page numbers are used; the 1974 OCR has two printed pages per PDF leaf, and the 2026 extraction has spurious page breaks inside formulas.

The publisher identifies the 2024 work as article82 ([published record](https://doi.org/10.1007/s43036-024-00386-x)); the arXiv-v2 Remark1/Proposition2 were read as that version, not silently certified as identical published numbering. The openly available [2026 preprint](https://arxiv.org/abs/2608.05024) and [author's blueprint](https://mario-ullrich.github.io/Lean-SNumbers/) are the versions used below.

| Seeded target | Text at locator, hypotheses and outcome |
|---|---|
| Objects, Part A | `pietsch1974 line 38`, prerequisites/§1, pp.202–203: real/complex Banach spaces and the stronger normalization. `lean-snumbers line 71`, Definition2.1, p.4 has the five selected axioms; its general-field extensions require separate scrutiny. |
| Milestone A1 | Blueprint Definitions2.1–2.4, pp.4–5 and Definition3.1/Theorem3.2, pp.6–7 (`lean-snumbers line 71`,126); Pietsch Theorems1.1/3.1, pp.203/204 (`pietsch1974 line 44`,127). Ratio Riesz repair agrees with pinned Mathlib. |
| Milestone A2 | Pietsch Theorems4.1/4.3 and5.1/5.3, pp.206–209 (`pietsch1974 line 160`,190,223,238), not §2 for Gelfand numbers. Blueprint Definitions3.5/3.7, Theorems3.6/3.8/3.10, pp.9–12, and9.8,p.39 (`lean-snumbers line 230`,271,345,1135). Quotient d and embedding agree; the lifting generalization has R01. |
| Objects, Part B | `ullrich2024 line 99`, Proposition2,p.3 gives sandwich and Hilbert equality. The original1974 strict axioms instead have isomorphism numbers as the smallest family (Theorem3.4,p.205); do not confuse the two axiom systems. |
| Milestone B1 | Blueprint Theorems4.1/4.2,p.14 (`lean-snumbers line 393`,402), and finite singular-value identification in §6.4. Read2024 Proposition2 and resolved OI-A39/A49 support the route without restricting to compact Hilbert maps. |
| Milestone B2 | Pietsch Theorems4.5/4.6,pp.207–208 and9.3,pp.220–221 (`pietsch1974 line 178`,205,529); blueprint Theorems11.1/11.3/11.4,pp.43–45 (`lean-snumbers line 1247`,1271,1296). The real/complex and complete-target qualifications are now respected. |
| Milestone C2 | `ullrich2026 line 184`, Theorem1,p.4; Lemmas3/4,pp.8–9 at327/356, with optimized coefficient in the proof at419. Blueprint Definition7.8 and Lemmas7.9–7.12/Theorem7.13,pp.25–27 (`lean-snumbers line 711`,723,734,751,777,786). Sharp coefficient, Δ₀ and signs checked; source misprints recorded below. |
| Objects, Part D | `ullrich2026 line 222`, Remark2,pp.5–6 and `lean-snumbers line 1160`, Definition10.1,p.40: dyadic covers with arbitrary centers; zero-based e₀ permits one ball. Pseudo-s assertions are real/complex, not unrestricted-field normalization. |
| Milestone D1 | Blueprint Definition10.1 through Theorem10.7,pp.40–42 (`lean-snumbers line 1160`,1168,1177,1185,1198,1208,1217). Density appears in multiplicativity, RCLike in e₀ and pseudo-s laws; the roadmap matches those distinctions. Pietsch1980 remains unread. |
| Milestone D2 | Blueprint Theorem11.1, Corollary11.2, Proposition11.5, Theorem11.7/11.8, Proposition11.9, Theorem11.10, Corollary11.11,pp.43–48 (`lean-snumbers line 1247`,1263,1304,1321,1334,1366,1386,1402). Normalized signs and positive γ agree. The cited1980 §12.3.2 is not certified directly. |
| Milestone E1 | Pietsch §7,pp.213–217 (`pietsch1974 line 315` onward) fixes sorted positive diagonals and legal indices; blueprint Theorems8.1–8.6,pp.29–31 (`lean-snumbers line 838`,848,863,873,891,910) makes ranges explicit. Zero entries/tails checked independently; E06 sorting repaired. |
| Milestone E2 | Blueprint Lemmas8.7–8.9, Theorem8.10, Proposition8.11/8.12, Theorem8.13 and Corollaries8.14/8.15,pp.32–36 (`lean-snumbers line 934`,958,991,1001,1023,1033,1039,1064,1068). a,b≥0 and compact-product/truncation route were inspected.2026 p.5 at204 also supports inclusion lower/order estimates. |
| D1/SN-A02 | `ullrich2024 line 88`, Remark1,p.2 distinguishes strict from Hilbert-only normalization; blueprint Definition2.1,p.4 at71 agrees with the Lean fields. |
| D6/SN-C04 | `ullrich2026 line 249`, §3,p.6 and blueprint Definition7.8,p.25 at711: finite Euclidean contraction factors and absolute determinant. Δ₀=1 is explicit, not0. |
| D8/SN-A21,A22 | Pietsch §§4–5,pp.206–209 at147/224 and blueprint Definitions9.1/9.2/9.4,pp.37–38 (`lean-snumbers line 1085`,1089,1106). The norm-infimum/preimage condition matches the Lean epsilon formulation, including zero spaces. |

The additional duality locators were checked at Pietsch Theorems6.2/6.3,pp.211–212 (`pietsch1974 line 280`,296); the compact equality and one-sided inequality are distinguished. Bernstein failure is supported by Pietsch2008 Theorem3,p.268 (`pietsch2008 line 201`); the particular dimensions3 and71 are independently verified above. No unread book was used as proof evidence.

## Not verifiable

- `pietsch1987`, *Eigenvalues and s-Numbers*: sources-service bibliographic lookup did not supply a legal full text. Chapter2 and locators1.5.5,1.7.17,2.10.2 remain uncertified against the book. The projection supplier contracts and open blueprint were checked independently.
- `carl1990`, *Entropy, Compactness and the Approximation of Operators*: the service located the Cambridge DOI catalogue, not readable full text. Chapters1–2 cannot be certified from that page.
- `pietsch1980`, *Operator Ideals*: no full text was supplied by this run's service lookup. The previous review records the publisher version as uncertified/paywalled; that settled limitation is retained rather than requesting it anew. Chapters11–12 and §12.3.2 were not read directly.
- `garling1971`: the service classifies its DOI as paywalled/uncertified. The original pp.346–361 were not read; BanachSpaceTheory B7 was resolved instead.
- `kadets1971`: service bibliographic lookup yielded no legal full text. The original Russian pp.453–457 and English translation pp.694–696 are not interchangeable locators.
- `mityagin1963`: service bibliographic lookup yielded no legal full text. This historical-conjecture reference is not needed to certify the read2026 theorem.
- E13/E14 still have no direct precise source locator. Their B4/B6 inputs, two-sided-bound argument and corrected fourth-power deduction were checked; this is supplier-based verification, not certification of an unnamed original source.
- The external Lean-SNumbers claim “everything … sorry-free” on Mathlib v4.35.0 was not independently built at a fixed external commit. Reading its blueprint does not certify its entire codebase or its portability. No external code was downloaded and executed.

The missing-reference record retains the four unresolved non-settled works (`pietsch1987`, `carl1990`, `kadets1971`, `mityagin1963`). Successfully fetched works and the previously settled paywall item were removed from that request. No roadmap source manifest was edited. This completed review does not infer mathematical failure merely from unavailable text.

## Source issues

- **Error** in lean-snumbers at Theorem3.8, printed pp.10–11: the source says strictness holds over every nontrivially normed field; it should require scalar completeness as its proof later acknowledges; affects a stated result.
- **Error** in lean-snumbers at Theorem3.10, printed p.12: the source says the lifting equality holds under the stated dense-field Banach-space assumptions; it should also require complete scalars for finite-rank lifts, as the rational-scalar example shows; affects a stated result.
- **Error** in lean-snumbers at Chapter11 introduction, printed p.43: the source says a compact operator into a space without the approximation property is not approximable; it should assert existence of a nonapproximable compact operator, not exclude finite-rank examples; affects nothing.
- **Misprint** in ullrich2026 at Lemma4 proof, printed p.9: the source says the new coordinate parameter is real in both scalar cases; it should range over the underlying real or complex field; affects the proof.
- **Misprint** in ullrich2026 at Proposition5 proof, printed p.10: the source says two determinant bounds n^(−n/2) give product bound n^(−n/2); it should give n^(−n), needed for the stated conclusion; affects the proof.
- **Misprint** in ullrich2026 at Proposition5 proof, printed p.10: the source says the bounded determinant quantity is that of the ℓ₁ identity; it should be that of the inclusion ℓ₁ⁿ→ℓ∞ⁿ; affects the proof.
