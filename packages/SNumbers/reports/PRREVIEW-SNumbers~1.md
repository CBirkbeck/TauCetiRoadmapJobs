# Review of SNumbers (pull request #1650 at ac80335)

**Verdict:** needs changes

## R01 (P1) — The unit-ball definition is not the general Kolmogorov number

**Location:** `TauCetiRoadmap/SNumbers/README.md:175`–185, 407–420; `TauCetiRoadmap/SNumbers/Suggested.lean:56`–58, 244–245, 300. Claim: “Over any nontrivially normed `𝕜`”, the displayed deviation has the quotient-norm formula and the s-number normalization; completeness gives strictness. The entropy normalization has the same problem.

**Witness:** Over ℚ₂, give X = ℚ₂ the norm (3/2)|x|₂ and take T = id. Then ‖T‖ = 1, but the largest norm in B_X is 3/4: d₀(T) = e₀(T) = 3/4.

Thus A11 asserts 3/4 = 1, A12/A13 and the Lean strictness theorem assert 3/4 = 1, and the Lean multiplicativity theorem at m = n = 0 asserts 3/4 ≤ 9/16. Completeness of the scalar field does not fix this. Mathlib explicitly requires `DenselyNormedField` for its closed-unit-ball norm formula (`Analysis/Normed/Operator/NNNorm.lean:161,200`). The unit-vector proof of A06/A13 also fails here: the unit sphere is empty.

**Repair:** Define the general Kolmogorov numbers by the infimum of quotient operator norms; prove the unit-ball description with its density hypothesis. Keep the general quotient theory, rather than dropping the non-Archimedean cases. Separate the general entropy covering definition from its stronger normalization/pseudo-s-number claims, with the precise additional scalar hypotheses; the read source proves these over ℝ/ℂ. Use the ratio form of Riesz's lemma for A06. Retest this example: the repaired quotient d₀ is 1, its multiplicativity test is 1 ≤ 1, while geometric deviation and entropy remain 3/4. Include that distinction as a negative-control Check. Also retest surjectivity with the weighted direct-sum example in row A24 below.

## R02 (P1) — The Lean compactness criterion admits non-locally-compact scalar fields

**Location:** `TauCetiRoadmap/SNumbers/Suggested.lean:273`–274. Claim: completeness of Y suffices for `IsCompactOperator T ↔ Tendsto T.kolmogorovNumber atTop (𝓝 0)` under `NontriviallyNormedField`.

**Witness:** Let K = 𝔽₂(u)((t)), |t| = 1/2, and T = id_K. Its rank is one, so dₙ(T) = 0 for n ≥ 1. Distinct constant residues in B_K have mutual distance 1; T is not compact.

This remains a counterexample after R01's quotient-definition repair. The finite-dimensional subspaces used in the proof need not have totally bounded bounded sets. The README's B07–B09 already assume `RCLike`; the Lean theorem silently states more.

**Repair:** Move this signature into the `RCLike` section, matching B09 and the source. Retest id_ℝ: d = (1,0,0,…) and compactness is true. Retain the infinite-residue-field example as an excluded negative control. Any further scalar generalization needs its own locally compact/proper-field statement and proof.

## R03 (P2) — The factorization estimate needs nonnegative bounds

**Location:** `TauCetiRoadmap/SNumbers/README.md:486`–489 (SN-E09). Claim: squared bounds a² and b² imply the unsquared upper bound a b, without specifying a,b ≥ 0.

**Witness:** Take all three Hilbert spaces to be ℝ, T₁ = T₂ = id, a = −1, b = 1, n = 0. Both squared bounds hold, but the claimed chain is 1 ≤ 1 ≤ −1.

**Repair:** Require a,b ≥ 0, or use nonnegative-real parameters. The cited author's blueprint, Theorem 8.10, printed p. 34, includes this hypothesis (`lean-snumbers line 997`). With a = b = 1 the same test gives 1 ≤ 1 ≤ 1. Record the negative-sign case as a Check that must fail the hypotheses.

## R04 (P2) — The diagonal bound omits ordering and an index range

**Location:** `TauCetiRoadmap/SNumbers/README.md:472`–473 (SN-E06). Claim: `s (D_σ) n ≤ |σₙ|` for arbitrary diagonal entries and every index.

**Witness:** Take p = q = 2, m = 2, σ = (0,1), s = a, n = 0. The left side is the operator norm 1 and the displayed right side is 0. For n ≥ m, σₙ is undefined.

**Repair:** Require nonincreasing |σ| and n < m, or use the decreasing rearrangement with an explicit zero extension. These are the standing hypotheses of blueprint §8.2, printed p. 30 (`lean-snumbers line 867`). The sorted test (1,0) gives 1 ≤ 1 and 0 ≤ 0; the zero-extended tail also gives 0 ≤ 0. Make the empty-dimensional convention explicit for “max |σ_i|”.

## R05 (P2) — The nonmultiplicativity cutoff loses a square

**Location:** `TauCetiRoadmap/SNumbers/README.md:509`–511 (SN-E14). Claim: `(n+1)² > κ_𝕜² (2n+1)` gives the displayed strict inequality “by SN-E13”.

**Witness:** B6 supplies κ_ℝ = 8. At n = 128, 16641 > 16448 satisfies this cutoff. E13 only gives h₂ₙ ≥ 1/√257 ≈ 0.06238 and hₙ² ≤ 64/129 ≈ 0.49612; these bounds do not separate.

**Repair:** The stated route needs `(n+1)² > κ_𝕜⁴ (2n+1)`. With κ = 8, n = 8192 and m = 16385, it gives 67125249 > 67112960 and 1/√16385 > 64/8193, hence the desired strict inequality. Use this corrected condition and a computed Check, or supply an independent proof of a sharper cutoff. This finding concerns the claimed inference, not a counterexample to nonmultiplicativity itself.

## R06 (P2) — Statable headline conclusions are missing

**Location:** `TauCetiRoadmap/SNumbers/Suggested.lean:8`–17, 435–436, 499–502; README SN-C09 and SN-E13–E14. Claim: the file is a sample and states only the exponential maximal-difference bound and the lower half of E13.

**Witness:** Scratch signatures for C09's sharp coefficient, a uniform E13 upper bound on `PiLp 1 (Fin m)`, `¬ IsStrictSNumberSequence hilbert`, and `¬ Multiplicative hilbert` all elaborated on the existing carriers with ordinary defaults.

**Repair:** State the sharp maximal-difference theorem, the uniform ℓ₁-identity upper estimate, and the two failure-of-law headlines. Also cover E10/E12's inclusion lower bound/order sharpness and E1's general diagonal formula, whose carriers are native. Inventory every headline in the module docstring; name any genuinely unavailable carrier there instead of substituting an API fact. The scratch elaboration establishes statability only; the mathematical corrections above still apply. The upper-bound constant must be uniform in both m and n; the real/complex statements can use B6’s explicit constants 8 and 16. For the test m = 1,n = 0 it gives 1 ≤ κ, and the corrected R05 instance then yields the nonmultiplicativity headline.

## R07 (P3) — The acceptance file imports another roadmap

**Location:** `TauCetiRoadmap/SNumbers/Suggested.lean:6`. The gate rejects `import TauCetiRoadmap.OperatorTheory.OperatorIdeals.Suggested`.

**Witness:** The import supplies `ContinuousLinearMap.singularValue` from another roadmap's acceptance file. It is not a pinned Mathlib or Tau Ceti declaration; the current successful build depends on that prohibited import.

**Repair:** Remove the roadmap import. Make a few genuine native-carrier definitions needed for the headlines, including the rank-constrained norm infimum if necessary, without replanning OperatorIdeals' implementation; identify its ownership in the supplier contract. Otherwise name specifically which headlines cannot yet be stated. Re-elaborate with `import Mathlib` and only genuinely used pinned `TauCeti.*` modules. Do not replace the import with an axiom or sorry-defined data.

## R08 (P3) — Two admitted wrappers duplicate the supplier

**Location:** `TauCetiRoadmap/SNumbers/Suggested.lean:303,306`; README SN-C19 at line 370.

**Witness:** Each wrapper closed with one `exact`, eta-expanding `TauCetiRoadmap.OperatorIdeals.singularValue_add_index_le` or `singularValue_comp_add_le_mul`, declared in `TauCetiRoadmap/OperatorTheory/OperatorIdeals/Suggested.lean:119,125`.

**Repair:** Delete them from `Suggested.lean`. Delete SN-C19 as a locally owned target and cite OI-A17/OI-A22 in scope/supplier contracts. The README can still explain the index laws. The probe reduced the 50 sorry warnings to 48 without changing any mathematical definition; these are precisely the two duplicates established by the one-tactic test.

## R09 (P3) — The seeded targets lack claim-level source locators

**Location:** `TauCetiRoadmap/SNumbers/README.md:144`–517 and 585–608. Most targets have no theorem/section/page locator; the bibliography assigns whole works or chapters to groups of claims. There is no `sources.toml`.

**Witness:** SN-E06 drops the standing assumptions of blueprint §8.2; SN-E09 drops Theorem 8.10's sign assumptions. Neither target names that locator. “Chapter 2” cannot distinguish these statements or their hypotheses.

**Repair:** Attach precise locators to every definition/theorem and proof input, citing the version actually read. Add the source manifest with one key per work and legal provenance. The source audit below provides verified starting locators, distinguishes the 2024/2026 preprints, and marks unread books/papers. Preserve uncertified citations as such; do not infer their contents. This is a locator defect, not a claim that the unverified texts are false.

## R10 (P3) — The roadmap lacks the required definition contracts and Checks

**Location:** `TauCetiRoadmap/SNumbers/README.md:1,129,541,561`; `Suggested.lean:8,26,111`. The document is a numbered target catalogue with a repeated definitions section, rather than the required roadmap layers with definition APIs, Checks and target-level needs.

**Witness:** A08, A10, A16, A18, C04 and D01 have no three discriminating Checks or per-definition API lists. README line 75 names `TauCeti.SNumberFamily`; the declaration is `TauCetiRoadmap.SNumbers.SNumberFamily` at Lean line 117.

**Repair:** Use the requested Summary, Scope and ownership, Conventions, Exact supplier contracts and numbered Layer structure. Give each definition its API and at least three discriminating computations, each target its precise prerequisites, and each layer Examples/Dependencies. Consolidate D1–D8 into their owning layers. Put own retained names in the actual namespace and synchronize the README/Lean names. Replace the sample-oriented module docstring with the headline inventory; put Lean layer sections in README order and give declarations mathematical docstrings rather than ID-only comments. The A10 Checks must distinguish the two values in R01; D01 must distinguish e₁(id_ℝ)=1/2 from rank-vanishing s-numbers, and C04 must distinguish Δ₀(0)=1 from Δ₁(0)=0.

## R11 (P3) — A multiline code span triggers both remaining text-gate failures

**Location:** `TauCetiRoadmap/SNumbers/README.md:564`–565. The gate reports two `tex` hits at `id_{ℓ₂^{n+1}}`.

**Witness:** A code span opens on line 564 and closes on line 565 before another opens around the identity. The line-oriented scanner loses the backtick parity and treats the subscripts as outside code.

**Repair:** Put each complete code span on one line, or use ordinary Unicode mathematical prose. This is a scanner false positive on valid multiline Markdown, not evidence of a LaTeX-delimited passage. It nevertheless leaves the supplied gate failing and is straightforward to avoid without changing mathematics.

## R12 (P3) — Three proof sketches omit necessary maps or restrictions

**Location:** `TauCetiRoadmap/SNumbers/README.md:262,437,440` (B06, D11, D12).

**Witness:** B06's ker φᵢ lies in Y, not X. For D11, e₁+e₂ has norm √2 > 1 in ℝ². For D12, γ = 0 < a₀(id_ℝ) gives γ⁻¹BTA = 0, not id.

**Repair:** In B06 take the intersection of ker(φᵢ ∘ T). In D11 use `(n+1)⁻¹ ∑ ε_k T x_k`, the image of a unit-ball vector: for n=1 the input has norm 1/√2 and separation 1. In D12 first discharge aₙ(T)=0, then choose 0 < γ < aₙ(T); at T=id_ℝ, γ=1/2, take B=(1/2)id and A=id, giving γ⁻¹BTA=id. These repairs preserve the three theorem statements.

## Verified sound

The review covered all 87 labelled targets, their eight repeated definitions, all seven worked-example bullets, all 72 Lean declarations, and the requested 15 seeded source targets. “Sound” here records the positive checks and their limits; rows marked with an R-number are failed controls, not endorsements. A finite test is not a proof of a universal statement.

The head was checked as ac8033593e5fc26d6c60bb9b2f63637745529227. The comparison with origin/main contains no changes outside SNumbers. No worktree file was changed. There is no sorry-defined data, admitted example, `set_option`, computational algorithm, detected supply cycle, or route-specific mathematical restriction. SNumbers is a new owner of these operator-number families, not a replacement for an existing roadmap.

**Build and signature evidence.** The worker's targeted build passed. Direct `lake env lean` on the original file also exited 0 with exactly 50 sorry warnings and no other diagnostics. A scratch copy with `#check @name` for every one of the 72 declarations elaborated successfully. No needed hypothesis was lost merely through section-variable elision; the explicitly overbroad Kolmogorov compactness signature is R02. C01/C02 instead add completeness of X and Y absent from the README and the B7 proof route. Removing those two binders in the scratch signature probe elaborated; the finite-dimensional projection argument works for normed spaces, so these unnecessary restrictions should be removed. The proof remains future work. The 50 single-tactic probes closed exactly the two supplier wrappers in R08; failure of the other probes does not certify that all remaining API declarations are headlines.

**Gate evidence.** The recorded gate is FAIL: `tex=2`, `imports=1`; all other scanner counts are zero, including `set_option`, `sorry-data`, `sorry-examples`, `stray-files`, `outside-folder`, `depcheck`, and `build`. R07 and R11 account for every failing rule. The prescribed dependency check was run and returned exactly:

```text
depcheck: 205 roadmaps, 1498 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. There are no declared supplier gaps. There are no `*Needs:*` lines to check; the aggregate ordering at README 543–546 and all supplier citations were checked, but the absent fine-grained dependency declarations are R10.

**Headlines.** The README's end results are: strictness of a/c/d/b and the s-number laws for h; Pietsch lifting/embedding and injectivity/surjectivity; the sandwich and Hilbert uniqueness/finite singular-value identification; c/d compactness and Hilbert compactness; the two projection bounds; sharp and exponential maximal difference and its two comparison corollaries; the three duality assertions; the index laws and Bernstein counterexamples; entropy compactness and its comparisons with c/d/h/all s; finite ℓₚ identities and diagonals; the ℓ₁→ℓ∞ inclusion and linear-order sharpness; the two-sided ℓ₁-identity estimate and failure of strictness/multiplicativity for h. The file contains many of these, but omits the conclusions identified in R06, and gives no precise unstatability inventory for lifting/embedding or other omitted results. The external roadmap import is a separate acceptance-test failure.

**Adversarial computations.** Unless stated otherwise scalars are real. O denotes a zero map, U=id_ℝ, R=3id_ℝ, D=diag(3,1) on Euclidean ℝ², H=id on infinite-dimensional ℓ₂, and I:ℓ₁→ℓ∞ the coordinate inclusion. For O all five numbers and entropy are 0; Δ₀(O)=1 and Δ_k(O)=0 for k>0. For R the five sequences are (3,0,0,…), entropy is (3,3/2,3/4,…), and Δ=(1,3,0,…). For D the five sequences are (3,1,0,…), Δ=(1,3,3,0,…). These values follow from rank, finite singular values and interval coverings, not from treating sorry as evidence. “Pass” means the displayed instance satisfies the claim. Each row's final column records the resulting change or no defect on that test.

| Statement | Instances and computed values on the two sides | Result / change |
|---|---|---|
| Conventions / Lean L2, dualOp | Rank-zero O has s₀=0; rank-one U has s₀=1,s₁=0. For T(z)=iz and φ(z)=z, T′φ(z)=iz, whereas the Hilbert adjoint acts by −i. Δ₀(O)=det(empty)=1. | Pass; preserve zero-based indexing and distinguish Banach dual from adjoint. |
| A01 family | O: each family returns (0,0,…); R: a,c,d,b,h=(3,0,…), e=(3,3/2,…). | Pass; entropy is a family but not an s-number sequence. |
| A02 axioms / D1 | R: s₀=3=‖R‖, s₁=0; U+(-U):0≤1+1; 2U∘3U∘4U:24=2·3·4; id_ℝ² at n=1:1=1. Zero family fails 0=1 on U. | Pass on classical families over ℝ; R01 for d over general fields. |
| A03 strictness | id_ℝ² at n=1 gives 1=1; at n=2 rank condition fails and s₂=0. The constant-norm family on U gives s₁=1 instead of 0. | Pass; wrong model excluded by rank axiom. |
| A04 norm/continuity | R: s₀=3≤3,s₁=0≤3; S=3U,T=U: difference 2=‖S−T‖ at n=0, and 0≤2 at n=1. | Pass. |
| A05 homogeneity | c=−2,T=R: s₀=6=2·3; c=0:0=0·3; n=1:0=2·0. | Pass. |
| A06 identity approximation | Rescaled ℚ₂ line: a₀(id)=1 and a₁=0, but no x has norm 1; its ball has supremum norm 3/4. | Statement passes; unit-vector route fails, R01. |
| A07 a strict | id_ℝ²: a₀=a₁=1,a₂=0; rescaled ℚ₂ line: a₀=1. | Pass; ratio Riesz proof required. |
| A08 c definition / D2 | R: codimension-zero restriction gives 3; choosing M=0 at n=1 gives 0. D: minimum at n=1 is 1. | Pass; excludes all-zero and constant-norm models. |
| A09 c strict | Rescaled ℚ₂ line: c₀=1,c₁=0; H: cₙ=1 for every finite n. | Pass. |
| A10 d definition / D3 | R gives (3,0,…), D gives (3,1,0,…); rescaled ℚ₂ identity gives (3/4,0,…). | The body computes geometric deviation; R01. |
| A11 quotient formula | Rescaled ℚ₂ identity,n=0: geometric left 3/4; quotient by zero has operator norm 1. | Fail; R01. |
| A12 d axioms | Same identity: d₀=3/4 versus required ‖id‖=1. | Fail; R01. |
| A13 d strict | Same complete scalar field, rank1,n0: d₀=3/4 versus normalization1. | Fail; R01. |
| A14 lifting | R over ℝ, Q:ℓ₁(B_ℝ)→ℝ: Qδ₁=1, ‖Q‖=1, a₀(RQ)=3=d₀(R); rank1 tails both0. | Pass under the density convention at README58; restate it at target. |
| A15 embedding | R over ℝ, evaluation embedding J: ‖J(1)‖=1, a₀(JR)=3=c₀(R); n≥1 both0. | Pass. |
| A16 b definition / D4 | D: gains at n0/n1 are3/1; n2 admissible set empty, supremum0. R:n0=3,n1=0. | Pass, including empty supremum. |
| A17 b strict | U:n0=1,n1=0; H: bₙ=1; O:gain0 on every nonzero test subspace. | Pass. |
| A18 h definition / D5 | R:n0=3,n1=0; D:n1=1; I:n2=1/3 while a₂(I)=1/2. | Pass; distinguishes h from a. |
| A19 ratio form | Rank-one contraction factorization of R gives3/(1·1)=3; multiplying A by2 gives6/(1·2)=3. Zero source: no nonzero A, supremum0=hₙ(O). | Pass; denominators exclude zero factors. |
| A20 h axioms | U:(1,0,…); id_ℝ² at n1:1; I:n2=1/3≤1. | Pass over RCLike; nonstrictness requires E13 upper bound. |
| A21 metric maps / D8 | Jx=(x,0), Q(x,y)=x on Euclidean spaces: ‖J1‖=1, inf‖Q⁻¹(1)‖=1; ‖JR‖=‖RQ‖=3. J=2id fails 2=1; Q=0 fails at1 (empty infimum0≠1). | Pass. |
| A22 injective/surjective / D8 | For these J,Q and R, c(JR)=d(RQ)=(3,0,…)=c(R)=d(R); zero map has both sides0. | Pass over ℝ. |
| A23 c injective | J:R→R² as above: c₀(JR)=3=c₀(R), c₁=0=0. | Pass. |
| A24 d surjective | Over ℚ₂ let W be finite-support sequences with norm maxᵢ(1+1/(i+2))|wᵢ|₂, Qw=Σwᵢ. Then ‖Q‖=1 and inf_{Qw=x}‖w‖=|x|₂, but Q(B_W)=(1/2)B_K. Thus d₀(Q)=1/2≠d₀(id_K)=1. | Fail for geometric definition; quotient repair R01 restores 1=1. |
| B01 upper extremum | D,n1:s₁=1=a₁; I,n2:h₂=1/3≤a₂=1/2; O:0≤0. | Pass. |
| B02 scalar factorization | D,n1,c=1/2: A=id,B=diag(1/6,1/2) have norms1,1/2 and BDA=(1/2)id. At c0 choose B0, composition0. | Pass. |
| B03 Hilbert uniqueness | R and D give respectively (3,0,…) and (3,1,0,…) on both sides; H gives1=1 for every n. | Pass. |
| B04 sandwich | D,n1:1≤1≤1; I,n2:1/3≤1/2≤1/2 for s=c. | Pass. |
| B05 finite singular values | D at n0,1,2:3=3,1=1,0=0; zero-dimensional map:0=0 for every index. | Pass, including tail. |
| B06 covers | U(B)=[−1,1], centres±1/2,radius1/2,k2: d₂=0≤1/2,c₂=0≤1. Kerφ belongs to Y until composed with T. | Bound passes; route R12. |
| B07 total boundedness | U:d=(1,0,…), limit0 and total bounded=true. H:dₙ=1, limit≠0 and total bounded=false. | Pass over RCLike. |
| B08 total boundedness | Same U/H: c=(1,0,…) / constant1; both sides respectively true/false. | Pass. |
| B09 compactness | U: compact=true, limits c,d=0. K=𝔽₂(u)((t)),id: compact=false,d=(1,0,…), limit0. | README passes; overbroad Lean fails R02. |
| B10 Hilbert compactness | diag(1,1/2,1/3,…) on ℓ₂: sₙ=1/(n+1)→0 and compact=true; H:sₙ=1, compact=false. | Pass in both directions. |
| B11 b≤c | D,n1:1≤1; O:0≤0; H:1≤1. | Pass. |
| B12 minimal injective strict | s=c, D,n1:b₁=1≤c₁=1; U,n1:0≤0. On a one-dimensional gain3 restriction, 1≤(1/3)·3=1. | Pass. |
| C01 Gelfand projection | D,n0:3≤3; n1:1≤2·1=2; n2:0≤(1+√2)·0=0. | Pass; remove unnecessary Lean completeness binders. |
| C02 Kolmogorov projection | D,n0,1,2:3≤3,1≤2,0≤0. | Pass over RCLike; same binder note. |
| C03 combined | D,n1:1≤2·min(1,1)=2; O:0≤0. | Pass. |
| C04 Δ / D6 | D:Δ₀=1,Δ₁=3,Δ₂=3,Δ₃=0; bounds1≤1,3≤3,3≤9,0≤27. O:Δ₀=1,Δ₁=0. | Pass; wrong zero-at-empty convention excluded. |
| C05 product/determinant | D:3·1=3=|det D|; diag(3,0):3·0=0; dimension0:empty product1=det1. | Pass; use pinned normDet product plus OI-A49. |
| C06 bordered determinant | M=[[2,6],[5,17]],w=3:det34−30=4=(17−15)·2. k0,M=[7]:7=7·1; zero ring:0=0. | Pass; no invertibility assumption needed. |
| C07 lower recursion | D,k0:1·3·1=3≤3; k1:(1/4)·1·3=3/4≤3; k2:0≤0. | Pass; 0^0=1 matters. |
| C08 upper recursion | D,n0:3≤3·1=3; n1:3≤1·3=3; n2:0≤0·3=0. | Pass. |
| C09 sharp maximal difference | D,n0:3≤1·3=3; n1:1≤4·1=4; n2:0≤(27/4)·0=0. | Pass; missing headline R06. |
| C10 exponential difference | D,n0:3≤3e; n1:1≤2e; I,n2:1/2≤3e·(1/3)=e. | Pass. |
| C11 any two | D,n1:s₁=t₁=1 gives1≤2e; I,n2,s=c,t=h:1/2≤e. | Pass. |
| C12 c,d versus b | D,n1:max(1,1)=1≤2e·1; O:0≤0. | Pass. |
| C13 dual equality | D′=D gives d′=(3,1,0,…)=c; complex T=iU has d₀(T′)=1=c₀(T). | Pass; dual is transpose/precomposition. |
| C14 dual inequality | D,n1:c₁(D′)=1≤d₁(D)=1; zero map:0≤0. | Pass. |
| C15 compact duality | D,n0,1,2:3=3,1=1,0=0; compact ℓ₂ diagonal1/(j+1):both sides1/(n+1). | Pass. |
| C16 index-law definitions | S=3U,T=−U,m=n0: s₀(S+T)=2≤4; s₀(ST)=3≤3. At m=n1 all finite-rank terms0. | Pass; contrast C22/C23. |
| C17 c laws | Same real scalars: add2≤4, product3≤3; complementary rank-one projections on ℝ²,m=n1:index2 gives0≤0. | Pass. |
| C18 d laws | Over ℝ same2≤4,3≤3,0≤0. Over rescaled ℚ₂ id,m=n0:3/4≤9/16 is false. | README RCLike passes; Lean generalization fails R01. |
| C19 a laws | Scalars give2≤4,3≤3; complementary projections at index2 give0≤0. One-exact supplier proofs close. | True but duplicated; R08. |
| C20 h additive | Scalars give2≤4; complementary projections give0≤0 at index2. | Pass. |
| C21 Bernstein identities | N3,n1: b₁(ℓ₂³→ℓ∞³)≤1/√2, b₁(reverse)≤√(3/2); product≤√3/2≈0.866025. n0 values1 and√3 equal their bounds. | Pass; dimensional restriction excludes N0. |
| C22 b not multiplicative | Same N3: b₂(id_ℓ₂³)=1>√3/2≥product of b₁'s. | Pass, strict numerical separation. |
| C23 b not additive | Graph (x,3x): (S+T)(x,3x)=(x/3,x), eigenvalue1/3. b₃₅(S)+b₃₅(T)≤1/6+√71/54≈0.322706<1/3. | Pass. |
| D01 entropy / D7 | R:e₀=3,e₁=3/2,e₂=3/4; O:eₙ=0. The 2^n convention gives one,two,four balls. | Definition passes; not the rank-vanishing sequence. |
| D02 norm/monotonicity | R:3≥3/2≥3/4 and e₀=‖R‖3. Rescaled ℚ₂ identity:e₀=3/4<‖id‖1. | General normalization fails R01. |
| D03 addition | S=T=U: n=m0,e₀(2U)=2=1+1; n=m1,e₂(2U)=1/2≤1/2+1/2=1. | Pass. |
| D04 multiplication | S=B=U over ℝ,m=n1:e₂(U)=1/4=(1/2)(1/2); m=n0:1=1. | Pass with density; rescaled ℚ₂ would give3/4>9/16 if hypothesis dropped. |
| D05 pseudo laws/positive | U:eₙ=2^(−n)>0 although rank1≤n for n≥1; O:eₙ=0. Rescaled ℚ₂ e₀=3/4≠1. | Positivity passes; normalization/scope R01. Segment proof is specifically real/complex. |
| D06 entropy compactness | U:eₙ→0,compact=true. Infinite-residue K:id has eₙ=1 for every finite n,compact=false. | Pass; unlike the d criterion, this field test does not refute it. |
| D07 dyadic comparison | U,n0:d₁=0≤1,c₁=0≤2; n1:d₂=0≤1/2,c₂=0≤1. | Pass. |
| D08 separation | U,n1:points−1,0,1 give3>2,δ1; e₁=1/2=δ/2. O cannot supply distinct positive-separated points. | Pass. |
| D09 identity entropy | U,n0:e₀=1≥1/2. Euclidean ℝ²,n1:e₁=1≥1/2 and volume gives2ε²≥1. For complex dimension1,n0:real dimension2,1≥1/2. | Pass; rank0 admits no n<rank. |
| D10 flags | D,n1,γ1/2: choose x₀=(1/6,0),x₁=(0,1/2), coordinate functionals: diagonal evaluations1/2,off-diagonal0,norms≤1. For d choose e₀,e₁,distances3,1>1/2. | Pass. |
| D11 c,d versus e | U,n0:1≤1; n1:0≤2·(1/2)=1. Unnormalized e₀+e₁ in ℝ² has norm√2; divided by2 has norm1/√2 and sign separation1. | Bound passes; route R12. |
| D12 Hilbert a versus e | U,n0:1≤2; n1:0≤1. At γ0,γ⁻¹BTA=0≠id; at γ1/2,B=(1/2)id the scaled composition is id. | Bound passes; route R12. |
| D13 h versus e | U,n0:1≤2; n1:0≤1; O:0≤0. | Pass. |
| D14 all s versus e | U,n0:1≤2e; n1:0≤2e·2·(1/2)=2e; O:0≤0. | Pass. |
| E01 identity norm | m4,p1,q2:‖id‖=2=4^(1−1/2); p=q:1=m^0. | Pass; m≥1 excludes empty maximum. |
| E02 identity approximation | m4,p1,q2,n0,1,2,3:values2,√3,√2,1 match√(4−n); rank tail n4=0 separately. | Pass. |
| E03 strict ℓp identity | m2,p1,n0/n1:strict sequences give1/1; n2 gives0 with n<m false. | Pass; a direct strictness consequence, belongs in README. |
| E04 same-exponent diagonal | Sorted(3,1),p2:‖D‖3=max(3,1),s₀3,s₁1. Scaling by−2 yields6,2. O gives0,0. | Pass; retain sorted and n<m assumptions. |
| E05 q→p diagonal | q2,p1,σ=(3,1),r2:a₀=√10,a₁=1, zero tail0; sums√(9+1),√1,√0 agree. | Pass. |
| E06 q≤p diagonal | p=q2,σ=(0,1),n0:1≤0 false. Sorted(1,0):at n0/1,1≤1 and0≤0. | Fail without hypotheses; R04. |
| E07 sign averaging | Complex line w₁=1,w₂=i:sum norms²2=M²2. w₁=w₂=1:2≤4. Empty family:0≤0. | Pass over both fields; no extra complex constant. |
| E08 row/column bounds | B:ℓ∞²→ℓ₂² identity:sum column norms²2=‖B‖²2. A:ℓ₂²→ℓ₁² identity:sum row norms²2=‖A‖²2; empty set0≤2. | Pass. |
| E09 factored operator | T₁=T₂=U,n0,a−1,b1:squared bounds1≤1,1≤1 but output1≤1≤−1. With a=b1 output1≤1≤1. | Fail as written; R03. |
| E10 inclusion c | I:n0,c₀1 gives1/2≤1≤1; n1 andn2,cₙ1/2 give1/2≤1/2≤1. | Pass. |
| E11 inclusion h | I:n0,1,2:h=1,1/2,1/3=1/(n+1). Zero operator gives0,0,0 and violates coordinate hypothesis hI already at δ₀. | Pass; signature fixes actual inclusion, no free-map stand-in. |
| E12 order sharpness | I:n2:(3/2)(1/3)=1/2=c₂=a₂; generally n≥1 ratio aₙ/hₙ=(n+1)/2, unbounded. | Pass; absent headline component R06. |
| E13 ℓ1 identity | m1,n0:h₀1, lower1, upperκ_ℝ8. m65,n64:upper8/√65<1, so nonstrictness follows; both bounds positive. | Bound route passes; upper/non-strict headlines absent, R06. |
| E14 h nonmultiplicative | κ8,n128:claimed cutoff16641>16448, but bounding interval gives0.06238 versus0.49612. Corrected n8192:67125249>67112960, and1/√16385>64/8193. | Original inference fails; repair R05. |

The seven worked examples reduce to the D, I, compact-diagonal, dual, E13 and E14 rows. In particular, the strict sandwich computes 1/3 < 1/2 at n=2; the “Hilbert numbers fail two laws” example needs the corrected cutoff, not a new claim of multiplicativity. The phrase “independent” at README536 is demonstrated there by these three combinations of properties, not a claim that all eight combinations have been constructed.

**Pinned-library audit.** Mathlib pin: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches were by objects (rank-constrained norm infima, codimension restrictions, unit-ball deviations, lower gains, Hilbert factorizations and covering numbers), as well as names. No pinned definition of these general a/c/d/b/h/e families was found. The following declarations and their surrounding hypotheses were opened:

| Pinned file and line | Declaration / actual contract checked |
|---|---|
| `Mathlib/Analysis/Normed/Operator/NNNorm.lean:200` | `ContinuousLinearMap.sSup_unitClosedBall_eq_nnnorm`; the enclosing scalar hypothesis at161 is `DenselyNormedField`. It does not apply to R01. |
| `Mathlib/Analysis/Normed/Module/RieszLemma.lean:44` | `riesz_lemma`, a ratio/distance formulation. The discussion at35–43 explicitly distinguishes the normalized unit-vector version; `riesz_lemma_of_lt_one` at124 uses RCLike. |
| `Mathlib/Analysis/Normed/Operator/Compact/Basic.lean:69` | `IsCompactOperator`: a compact K whose preimage is a neighborhood of0. Finite rank alone is not in the definition. The identity criterion at79 is local compactness. |
| `Mathlib/Analysis/Normed/Operator/Compact/FiniteDimension.lean:26` | `isCompactOperator_id_iff_finiteDimensional`; locally compact scalar-field hypotheses are present, not implied by arbitrary nontrivial norms. |
| `Mathlib/Analysis/Normed/Module/HahnBanach.lean:43,66` | `exists_extension_norm_eq`, `exists_dual_vector`; the scalar hypotheses support the real/complex duality route, not unrestricted-field Hahn–Banach. |
| `Mathlib/Analysis/InnerProductSpace/SingularValues.lean:94` | `LinearMap.singularValues`; finite-dimensional inner-product source and target at78–81. Tail vanishing at205 and zero at210 agree with B05. This is not the general Banach-space approximation number. |
| `Mathlib/Analysis/InnerProductSpace/NormDet.lean:206,374` | `normDet_eq_norm_det`, `normDet_eq_prod_singularValues`; native determinant/product input for C05, to be cited with OI-A49. |
| `Mathlib/Topology/Algebra/Module/Spaces/ContinuousLinearMap.lean:217` | `ContinuousLinearMap.precomp`; dualOp has the correct domain Y* and target X*, and is only a specialization. |
| `TauCeti/Analysis/InnerProductSpace/Spectrum.lean:119` | `exists_hilbertBasis_forall_hasEigenvector`, the compact symmetric Hilbert-space result underlying B4. It does not itself define Banach-space s-numbers. |

**Ownership and supplier audit.** Read the main-branch BanachSpaceTheory, OperatorIdeals and CompactOperators roadmaps for shape and ownership; also resolved PolarDecomposition. Main was `fa41b3747f56d4e77bd69e7099c1be4f2e4959ba`. The mandated roadmap search tools searched main and the available open heads; board package text was searched too. Relevant open hits in NoncommutativeIntegration/NoncommutativeGeometry concerned measurable-operator singular values and Fack–Kosaki theory, a different carrier. The Lean object search returned the new SNumbers family declarations only. No second owner or duplicate fully qualified name for the four new s-number families or entropy was found in the supplied accessible material. External Lean-SNumbers is a source, not a Tau Ceti supplier.

| Citation resolved | Main-branch evidence and boundary |
|---|---|
| OperatorIdeals Part A, OI-A01–A29 | `TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md:125,144,174` onward: zero-based approximation-number definition/calculus and explicitly qualified compactness results. Suggested line50 defines `ContinuousLinearMap.singularValue`. This object is consumed, not rebuilt as a separate library project. |
| OperatorIdeals OI-A30, A35–A40, A49 | Same README at196,213–227,245: adjoint invariance, Hilbert min–max/localization, finite singular-value comparison. R08's two index laws already occur at Suggested119,125. |
| BanachSpaceTheory B1 | `TauCetiRoadmap/BanachSpaceTheory/README.md:41` onward: annihilator/quotient duality and the norm of precomposition, supplying C13/C14. |
| BanachSpaceTheory B4 | Same file at226–242: compact real/complex Hilbert Schmidt series with finite/countable nonzero singular vectors and zero padding; no separability shortcut. Supplies E09/E13. |
| BanachSpaceTheory B6 | Same file356–408: summing norms, π₂≤π₁ and L¹-to-Hilbert bound. Chosen constants at383–408 are κ_ℝ=8 and κ_ℂ=16, not optimal constants; finite ℓ₁ is covered. |
| BanachSpaceTheory B7 | Same file410–452: local reflexivity fixing points from E, John's theorem, Kadec–Snobar and Garling–Gordon projections. Supplies C01/C02/C15, without new ownership here. |
| PolarDecomposition finite singular systems | `TauCetiRoadmap/OperatorTheory/PolarDecomposition/README.md:445`–485, in particular PD-C09 at469. Scope deferral resolved; no supplier drift established. |

The five citation-resolver leads were checked rather than accepted as verdicts: the roadmap-supplied approximation declaration is not a pinned library declaration; the new operator-number names are locally declared; the `TauCeti.*` family names need synchronization as in R10. No extra upward edge or undeclared missing supplier contract was inferred from those leads.

**Source audit of the seeded sample.** Every reference was attempted through the sources service. Five full texts were read legally: `pietsch1974` (institutional Polish mathematical archive), `pietsch2008` (publisher), `ullrich2024` (arXiv v2), `ullrich2026` (arXiv v1), and `lean-snumbers` (author's blueprint dated 27 October 2026). The table cites printed pages, not PDF leaf indices; the 2026 extraction has extra page breaks inside formulas. The blueprint is additional evidence for the claimed formalization, not a substitute for primary locators. The 1974 paper uses one-based numbering and real/complex Banach spaces; transferring to zero-based normed spaces or arbitrary fields needs the explicit argument, not just its citation.

| Seeded target | Read locator and hypothesis comparison |
|---|---|
| Milestone A1 | `pietsch1974 line 38` onward, §1, pp.202–203: Banach spaces over ℝ/ℂ and strict identity normalization. `ullrich2024 line 88`, Remark1,p.2 distinguishes strict from Hilbert-only normalization. Blueprint Definitions2.1–2.4,pp.4–5 (`lean-snumbers line 71`) support the chosen axioms. The general-field unit-vector argument is not supplied by these sources; R01. |
| Milestone B2 | Pietsch §9, Theorem9.3,pp.220–221 (`pietsch1974 line 529` onward), and Theorems4.5–4.6,pp.207–208 (`pietsch1974 line 174`,205) give compactness/minimality in their Banach setting. Blueprint Theorems11.1,11.3,pp.43–45 (`lean-snumbers line 1242`,1266) have the real/complex restriction missing from the Lean criterion. |
| Milestone C2 | Theorem1,p.4 and Lemmas3–4,pp.8–9 of arXiv v1 (`ullrich2026 line 184`,327,356) support maximal difference for real/complex normed spaces. The sharper coefficient is the optimized lower recursion in Lemma4's proof, not a claim that the paper's Theorem1 is worded that way. Blueprint Definitions7.8 and Lemmas7.9–7.12/Theorem7.13,pp.25–27 (`lean-snumbers line 707`,773,782) state the determinant route. k0 needs its direct norm argument. |
| Milestone C3 | Pietsch Theorem6.2,p.211 (`pietsch1974 line 280`): c(T)=d(T′). Theorem6.3,p.212 (`pietsch1974 line 296`): reverse equality for compact maps; its proof also gives the one-sided inequality. The README's normed-space extension of the first two is supported by its explicit Hahn–Banach/annihilator route and B1, not claimed as Pietsch's original scope. |
| Milestone C4 | Pietsch §9, Theorem9.5,p.222 (`pietsch1974 line 552`), the elementary subspace arguments, and OI-A17/A22 cover positive index laws. Pietsch2008 Theorem3,p.268 (`pietsch2008 line 201`) verifies failure of both Bernstein laws. The specific dimensions3 and71 are independently computed above; they are not attributed verbatim to that theorem. |
| Milestone D1 | Blueprint Definition10.1 and Propositions/Theorems10.2–10.7,pp.40–42 (`lean-snumbers line 1156`,1164,1173,1181,1194,1204,1213). Multiplication requires density; the norm and pseudo-s-number statements there use ℝ/ℂ. The roadmap broadens the norm assertion incorrectly; R01. |
| Milestone D2 | Blueprint §11,pp.43–48: covering11.1, separation11.6, flags11.7, comparison11.8, identity11.9, Hilbert11.10, all-s11.11 (`lean-snumbers line 1242`,1309,1316,1329,1361,1381,1397). The proof of11.8 uses normalized sign combinations, unlike README437. The γ=0 proof omission is present in11.10 too. Pietsch1980 §12.3.2 remains unread. |
| Milestone E1 | Pietsch §7, startingp.213 (`pietsch1974 line 315`), fixes decreasing positive diagonals; blueprint Theorems8.1–8.6,pp.29–31 (`lean-snumbers line 834`,844,859,867,887,906) make the ranges explicit. E06 omits the shared sorting and n<m assumptions. Norm/cross-exponent formulas also pass the displayed finite tests. |
| Milestone E2 | Blueprint Theorem8.10,p.34 (`lean-snumbers line 997`) requires a,b≥0. Proposition8.11,p.34 and Proposition8.12/Theorem8.13/Corollary8.14,pp.35–36 (`lean-snumbers line 1019`,1029) support the inclusion estimates, using finite truncations for the compact factorizations. The paper's p.5 inclusion estimates (`ullrich2026 line 204`) support the sharpness example; exact h is checked in the blueprint. |
| Milestone E3 | Not certified against a direct source locator: the provenance paragraph explicitly excludes E13/E14, and no precise source is given for them. B6 and B4 contracts do supply the proposed two-sided-bound route; its computations were checked. E14's stated deduction has R05's squared-constant error. |
| D1 / A02 | Blueprint Definitions2.1–2.4,pp.4–5 (`lean-snumbers line 71`), together with the strict/weak normalization distinction in `ullrich2024 line 88`. Its general-field extension is not certified merely by Pietsch's Banach axioms. |
| D4 / A16 | Pietsch §4,pp.206–208 (`pietsch1974 line 147` onward): lower gain on subspaces; Theorem4.5 and4.6. The ratio form avoids the empty unit sphere over discrete valuations. |
| D6 / C04 | 2026 paper §3,p.6 (`ullrich2026 line 249`) and blueprint Definition7.8,p.25 (`lean-snumbers line 707`): finite Euclidean contraction factorization and absolute determinant. Empty determinant1 checked separately. |
| D7 / D01 | Blueprint Definition10.1,p.40 (`lean-snumbers line 1156`), and 2026 Remark2,pp.5–6 (`ullrich2026 line 222`): dyadic ball count, real/complex setting in the paper. At n0 the roadmap uses one ball, matching the zero-based convention. |
| D8 / A21,A22 | Pietsch §§4–5,pp.206–209 (`pietsch1974 line 147`–240), blueprint Definitions9.1,9.2,9.4,pp.37–38 (`lean-snumbers line 1081`–1105): norm-preserving embeddings, quotient-norm surjections, and invariance. Extending the geometric d formula to arbitrary fields is not justified by these Banach-space citations; A24 supplies a separating example. |

## Not verifiable

- `pietsch1987`: the full book was not found through the sources service, Cambridge catalogue or legal-repository search. The stated references 1.5.5,1.7.17,2.10.2 and Chapter2 were not certified against its text. B7 supplies the projection contracts independently.
- `carl1990`: the publisher DOI landing page was located, but the full book was unavailable. Chapters1–2 and their exact hypotheses remain uncertified. The open blueprint was checked separately.
- `pietsch1980`: the sources service classified the located publisher material as uncertified/paywalled. Chapters11–12 and §12.3.2 were not read. This settled uncertified item was not re-added to the missing-text request.
- `garling1971`: the located publisher material was classified as uncertified/paywalled. The original theorem text was not read; the main-branch B7 contract was resolved. It was not re-added to the missing-text request.
- `kadets1971`: bibliographic lookup and the official Math-Net article page were attempted; the latter timed out. The full text was not read. The Russian pp.453–457 and translated pp.694–696 must not be interchanged silently.
- `mityagin1963`: bibliographic lookup and the Math-Net author bibliography did not produce full text. This historical-conjecture reference was not used to certify C12; the 2026 proof was read.
- E13/E14 have no direct precise source locator in the README. Their supplier-based mathematical route was reviewed, with the R05 limitation.
- The external repository's claim of a completely sorry-free formalization on Mathlib v4.35.0 was not independently built or certified at a fixed source commit. Reading its blueprint and license does not establish that claim or portability to these pins. The original acceptance file and the specified scratch probes were the Lean files actually elaborated.

The missing-text record retains the four unresolved, non-settled works above. No source manifest or repository file was edited. The review is complete with these source limitations; no acceptance is inferred from an unread text.

## Source issues

- **Error** in lean-snumbers at Theorem3.8 and its quotient-form proof, printed pp.10–11: the source says the unit-ball Kolmogorov definition has the quotient formula and normalization over arbitrary nontrivially normed fields; it should be defined by quotient norms, or assume norm density for that equivalence; affects a stated result.
- **Gap** in lean-snumbers at Theorem11.10 proof, printed p.48: the source says to invert any γ below aₙ(T); it should be handled first at aₙ(T)=0, then use 0<γ<aₙ(T); affects the proof.
- **Error** in lean-snumbers at Chapter11 introduction, printed p.43: the source says exactly two s-number sequences detect compactness on every Banach space; it should be described as two examples, since convex combinations of c and d do too; affects nothing.
- **Error** in lean-snumbers at Chapter11 introduction, printed p.43: the source says approximation-number decay characterizes compactness only on Hilbert spaces; it should be said also to hold for operators into Banach spaces with the approximation property; affects nothing.
- **Misprint** in ullrich2026 at Proposition5 proof, printed p.10: the source says multiplying two determinant bounds n^(−n/2) gives the product bound n^(−n/2); it should be n^(−n), which supplies the stated sharp conclusion; affects the proof.
- **Misprint** in ullrich2026 at Proposition5 proof, printed p.10: the source says the resulting determinant quantity belongs to the ℓ₁ identity; it should be attached to the inclusion ℓ₁ⁿ→ℓ∞ⁿ used in that computation; affects the proof.
- **Misprint** in ullrich2026 at Lemma4 proof, printed p.9: the source says the new coordinate parameter is real while working over either scalar field; it should be a parameter in the underlying scalar field; affects the proof.
- **Misprint** in ullrich2024 at Theorem3 proof, printed p.5: the source says the lower bound for the nth selected norming functional uses c_k(S); it should be c_n(S), as in the preceding choice of x_n; affects the proof.
- **Misprint** in ullrich2026 at Corollary8 proof, printed p.15: the source says the transferred approximation error equals the original error plus ε; it should be bounded above by that quantity; affects the proof.
