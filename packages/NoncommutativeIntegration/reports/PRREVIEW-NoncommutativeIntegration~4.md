# Review of NoncommutativeIntegration (pull request #864 at 10a5614)

**Verdict:** accepted

Incremental re-review of the 94 changed lines since b3ab9bd (62 insertions, 32 deletions: the `Suggested.lean` module header and, in `README.md`, the §1.2 Checks, the §1.3 locators and completeness route, the §1.4 derivation of the p-triangle inequality, the Layer 1 example for L∞(Ω,μ), the §2.3 Cwikel and Bergh–Löfström locators, the §2.4 Check value, the §4.3 preadjoint Check, the §6.3 row–column estimate, the §7.2 and §8.4 Check values, and the Bergh–Löfström and Cwikel reference entries). Each of the six findings of the previous review is repaired, no repair introduces a new problem, no file outside the folder changes, the gate passes with the targeted build, the dependency check reports no problem, and the file elaborates at the pins with the five intended `sorry` warnings. No finding remains.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 5–7 read "module", blank, "public import Mathlib", and line 30 "@[expose] public section" before "noncomputable section"; the gate's targeted build prints `build=0`; a scratch importer resolves all ten names.
- R02 — repaired: README line 561 reads "`∫ t^(−1)min(t,1)² dt/t=∫₀¹ 1 dt+∫₁^∞ t^(−2) dt=1+1=2`" and line 562 names the integrand `t^(−2)min(t,1)²`.
- R03 — repaired: lines 288–294 cite "Fack–Kosaki, Theorem 4.7(i) with `g(s)=s^p` and t→∞" for the p-triangle inequality and give completeness its own route (Hiai, Lemma 5.3(1); Hiai's proof of Theorem 5.10; Fack–Kosaki, Lemma 3.4(i)); line 436 reads "bounded outside a set of finite measure (Hiai, Example 4.13(3)".
- R04 — repaired: lines 269–272 replace the rank-one-cut control by "`e₁₁∈V(ε,1)` for every ε>0 (cut by e=e₂₂ …) … a definition that fixed the cut size at δ=1"; lines 277–282 label the x, y witness as the sum law's control, say "for the product law these x,y give no counterexample, since xy=0", and add a product-law witness x′, y′.
- R05 — repaired: line 1237 reads "`‖x‖_(H_C^p)=‖e₂₂‖_p=(1/2)^(1/p)=‖e₁₁‖_p=‖x‖_(H_R^p)`"; line 1448 reads "`‖a‖₁=τ(e₂₂)=1/2≤√2·‖a‖_(H¹)=√2·(1/2)`" with the value of `‖a‖_(H¹)` justified; lines 875–878 name the two maps as the preadjoints of E and of the inclusion, with the two composites computed.
- R06 — repaired: lines 504–505 cite "Cwikel, §2.1 for the references into Calderón and Definition 2.14 for the equivalent disc form"; lines 515–516 "Cwikel, §2.4, Definition 2.21 and Corollary 2.27"; line 517–518 "Cwikel, Theorem 2.2"; line 519 "(Bergh–Löfström, Theorem 4.3.1)"; lines 1152–1155 "the row–column estimate … the finite row and column norm formulas of CStarAlgebras C3.3"; the References entries (lines 1486–1489, 1506–1509) list the same locators.

## Verified sound

**The changed passages, recomputed.**

- §1.2 Checks (lines 267–284). With the unnormalized trace on M₂(ℂ), e = e₂₂ has `τ(1−e)=τ(e₁₁)=1≤1` and `e₁₁e₂₂=0`, so `e₁₁∈V(ε,1)` for every ε > 0: a topology with base `{V(ε,1)}` has e₁₁ in every neighbourhood of 0, so it is not Hausdorff and is strictly coarser than the norm topology. Sum law: for x = n1_(0,1) the cut e = 1−1_(0,1) has `τ(1−e)=1` and xe = 0, likewise y = n1_(1,2) with 1−1_(1,2); x+y = n1_(0,2) lies in V(2ε,2) through the cut 1−1_(0,2); a projection e = 1_A with `τ(1−e)=μ(Aᶜ)≤1` meets (0,2) in measure ≥ 1, so `‖(x+y)e‖_∞=n>2ε`, and x+y ∉ V(2ε,1); xy = 0 because the supports are disjoint. Product law: x′ = n1_(0,1)+1_(1,2) with the cut 1−1_(0,1) gives `x′e=1_(1,2)`, norm 1, `τ(1−e)=1`, so x′ ∈ V(1,1), and y′ symmetrically; `x′y′=n1_(0,1)+n1_(1,2)=n1_(0,2)` lies in V(1,2) through the cut 1−1_(0,2) and, by the same measure argument, in no V(1,1) when n > 1. The constants ε₁ε₂ = 1 and δ₁+δ₂ = 2 are the ones the product law states (line 262).
- §1.3 (lines 286–296). fk86 lines 808–810: Theorem 4.7(i) is `∫₀ᵗ g(μ_s(T+S))ds ≤ ∫₀ᵗ g(μ_s(T))ds + ∫₀ᵗ g(μ_s(S))ds` for τ-measurable T, S, every t > 0, every increasing concave g on ℝ₊ with g(0) = 0; `g(s)=s^p` is concave for 0 < p ≤ 1, and t → ∞ with the rearrangement formula gives `τ(|x+y|^p)≤τ(|x|^p)+τ(|y|^p)`. The metric: hiai lines 1939–1940, Lemma 5.3(1), "Lp(M) is a linear subspace of M̃" for 0 < p ≤ ∞; `d(x,y)=0` forces `μ_t(x−y)=0` for all t and x = y (hiai line 2225 uses the same step). Completeness: hiai lines 2224–2252 (the proof of Theorem 5.10) go: Cauchy in `‖·‖_p` ⇒ `δμ_δ(a_m−a_n)^p≤∫₀^δμ_t^p dt→0` ⇒ Cauchy in measure (Lemma 4.16(4)) ⇒ a limit a in M̃ (Theorem 4.12) ⇒ `μ_t(a_m−a_n)→μ_t(a−a_n)` ⇒ Fatou on the integral gives `‖a−a_n‖_p≤ε`. The README's route replaces the pointwise convergence by Fack–Kosaki Lemma 3.4(i) (fk86 lines 440–442: `μ_t(T)≤liminf μ_t(T_n)` for T_n → T in measure), which gives `∫₀^∞μ_t(a−a_n)^p dt ≤ liminf_m ∫₀^∞μ_t(a_m−a_n)^p dt ≤ ε^p` by Fatou's lemma on (0,∞); no step uses p ≥ 1, and the first step is the comparison `V(ε,δ)∩Lp(M,τ)⊇{‖x‖_p≤εδ^(1/p)}` stated two lines below. Hiai's statement itself (line 2221) is for p ∈ [1,∞], which is why the README cites the argument of the proof and not the theorem.
- §1.4 (lines 337–342). The tracial derivation is the t → ∞ case of Theorem 4.7(i); the Haagerup variant is fk86 lines 877–881 (`g(s)=s^{p′}`, t = 1, Lemma 4.8, p′ ↑ p). In Haagerup Lp, `μ_s(x)=s^(−1/p)‖x‖_p` gives `∫₀^∞μ_s(x)^p ds=‖x‖_p^p∫₀^∞ds/s=∞` and `∫₀¹μ_s(x)^r ds=‖x‖_p^r/(1−r/p)` for r < p, which is the constant `(1−p′/p)^(−1)` on fk86 line 879.
- Layer 1 example (lines 436–439). hiai lines 1593–1597, Example 4.13(3): for a localizable measure space, Ã is the measurable functions bounded on X∖A for some A of finite measure (σ-finite spaces are localizable). The function f = n on (n,n+1) is finite everywhere and has `μ(|f|>λ)=∞` for every λ, so no cut of finite measure bounds it.
- §2.3 (lines 500–521). cwikel line 289–295: "2.1. Preface" refers the definitions of both methods and of the function spaces to Calderón's Sections 2, 3, 5, 6 and 9.2; line 881: Definition 2.14 is the disc space F_D with the max of the arc norms, and lines 892–896 state the isometric correspondence with the strip space; line 319–320: Theorem 2.2, for a regular Banach couple and θ ∈ (0,1), `([X₀,X₁]_θ)^#` coincides isometrically with the upper space of the dual couple; line 1111–1119: Definition 2.21 (the space H of the dual couple with the Lipschitz-type bound (2.46) and norm the infimum of the constants) and line 1188–1192: Corollary 2.27 (the upper space of the dual couple is the set of values h(θ) with the infimum norm), followed at line 1196 by the norm-one inclusion of the lower in the upper space. Bergh–Löfström Theorem 4.3.1 is cited by locator (below).
- §2.4 Check (lines 560–562). For f = 1_(0,1), `K(t,f)=min(t,1)`, and the (1/2,2) gauge squared is `∫₀^∞ t^(−1)min(t,1)² dt/t`: on (0,1) the integrand is `t^(−2)·t²=1`, integral 1; on (1,∞) it is `t^(−2)`, integral 1; total 2.
- §4.3 Check (lines 874–878). On M = ℂ² with τ = (x+y)/2 and N = ℂ embedded as scalars, `E(x,y)=(x+y)/2`; for c ∈ N_*, `(c∘E)(x,y)=c(x+y)/2`, which under the pairing `ax+by` is `(c/2,c/2)`; for (a,b) ∈ M_*, `(a,b)|N : c↦(a+b)c`, which is a+b. The composites: `c↦(c/2,c/2)↦c` is the identity of N_*; `(a,b)↦a+b↦((a+b)/2,(a+b)/2)`, and `(ι∘E)_*(a,b)(x,y)=(a+b)(x+y)/2`, the same functional.
- §6.3 (lines 1152–1155). With `u_(ij)=v_(ij)=x_ix_j` and self-adjoint x: `∑u_αu_α*=∑_(i,j)x_ix_jx_jx_i=∑_i x_i(∑_j x_j²)x_i=B`, `∑v_α*v_α=∑_(i,j)x_jx_ix_ix_j=B`, `∑u_αv_α=C`; so `‖C‖≤‖B‖≤‖∑x_k²‖²`. CStarAlgebras at the head of #860 (33ddcef7), README lines 948–952: "### 3.3 Column and row spaces, MIN and MAX, operator algebras (C3.3)" with the finite formulas `‖[x_i]‖_(C_n)=‖Σx_i*x_i‖^(1/2)` and `‖[x_i]‖_(R_n)=‖Σx_ix_i*‖^(1/2)`; the row-times-column factorization of `∑u_αv_α` in `M_1(M)` gives the estimate from these two formulas. On the Pauli example of the carried row, B = 4 and C = 0.
- §7.2 Check (lines 1236–1238). §7.1's filtration (line 1215) is M₂(ℂ) with tr/2, M₀ = ℂ, M₁ diagonal, M₂ = M, and `dx=(0,0,e₁₂)` for x = e₁₂; `‖e₂₂‖_p=τ(e₂₂)^(1/p)=(1/2)^(1/p)=‖e₁₁‖_p`, and `‖e₁₂‖_p=τ((e₂₁e₁₂)^(p/2))^(1/p)=τ(e₂₂)^(1/p)`; with tr all three are 1.
- §8.4 Check (lines 1448–1451). `‖a‖₁=τ(|e₁₂|)=τ(e₂₂)=1/2`. Upper bound: the decomposition a = a+0 gives `‖a‖_(H_C^1)=‖(dx₂*dx₂)^(1/2)‖₁=‖e₂₂‖₁=1/2`. Lower bound: for a = y+z with y, z martingales, `dy₂+dz₂=da₂=e₁₂`; `(∑_k dy_k*dy_k)^(1/2)≥|dy₂|` in the operator order, so `‖dy₂‖₁≤‖y‖_(H_C^1)`, and `‖dz₂‖₁=‖dz₂*‖₁≤‖z‖_(H_R^1)`; hence `‖y‖_(H_C^1)+‖z‖_(H_R^1)≥‖e₁₂‖₁=1/2`. The endpoint bound of line 1436 reads `1/2≤√2·(1/2)`.
- References (lines 1486–1489, 1506–1509): the Bergh–Löfström entry now lists Theorem 4.3.1 and the Cwikel entry lists §2.1, Theorem 2.2, Definition 2.14 and §2.4, matching the citations above.

**Lean.** `git diff b3ab9bd HEAD -- TauCetiRoadmap/NoncommutativeIntegration/Suggested.lean` changes only the header: `import Mathlib` → `module`, blank, `public import Mathlib`, and `@[expose] public section` inserted before `noncomputable section`; the ten declarations are byte-identical. `lake env lean TauCetiRoadmap/NoncommutativeIntegration/Suggested.lean` from the worktree: the five `sorry` warnings at lines 80, 92, 101, 108 and 116 and nothing else. A scratch importer (`import Mathlib`, `import TauCetiRoadmap.NoncommutativeIntegration.Suggested`, ten `#check @name` lines) elaborated once against the olean the gate's targeted build produced: every name resolves, and the ten elaborated types equal those of the worker's `signatures.md` and of the previous report (`matrixLpGauge : {d : ℕ} → ℝ≥0 → CStarMatrix (Fin d) (Fin d) ℂ → ℝ`; the five theorems quantified over `d n` with `p` the only implicit; constants `B`, `A`, `(√3)⁻¹` uniform in d and n); no section binder is lost. The one-tactic probe and the padding check are carried from the previous reviews, since the declarations are unchanged.

**Gate and dependency check.** `tauceti-roadmap gate … --base origin/main` at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's run with the targeted build adds `build=0 OK`. `gate --depcheck … --movable`: `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line for NoncommutativeIntegration. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeIntegration'` is empty. `scratch/overlaps.md` and `scratch/citations.md`: no open pull request changes this roadmap, no cited id is dropped or defined only by an open revision, no cross-roadmap citation or Lean name is unresolved. The supplier citations the changed passages touch resolve: CStarAlgebras C3.3 at the head of #860 (above); VonNeumannAlgebras V10.TracialLp on main (unchanged since the previous review); the Fack–Kosaki, Hiai and Cwikel locators at the lines quoted above.

**Sources in the seeded sample.** Of the fifteen seeded targets, §1.2 falls in the changed passages and is verified above (hiai 1584–1587, 1593–1597; fk86 440–442); the fourteen others (§1.5, §1.6, §3.4, §4.1, §5.2, §5.3, §5.5, §6.1, §6.2, §6.3, §7.1, §7.2, §7.5, §8.1) are untouched by the diff except for the §6.3 row–column wording and the §7.2 Check value verified above, and carry the previous reviews' verification. Cache texts read: fk86 (`3c11d3eb…`, MSP file, printed page = file page + 267), hiai (`a287a327…`, arXiv 2004.02383v1), cwikel (`6928c5b7…`, arXiv 0803.3558).

**Ownership against open work.** The changed passages introduce no new object; the Schatten and weak Schatten ownership was settled at the previous review (NoncommutativeGeometry at the heads of #1143 and #1187 consumes §1.3–§1.6; OperatorIdeals on main owns S_p only for 1 ≤ p ≤ ∞). The closest open roadmaps by vocabulary (#860, #1143, #1041, #1854, #1187) were checked at the previous reviews and the diff touches none of the shared objects except the citation of C3.3, which is a consumption.

**Adversarial pass.** One row per statement; the first fifteen rows are the changed statements with values computed now, the rest are carried from the review at b3ab9bd and say so.

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| §1.2 single-neighbourhood control | M₂(ℂ), tr; e₁₁, cut e = e₂₂ | `τ(1−e₂₂)=1≤1`, `e₁₁e₂₂=0`: e₁₁ ∈ V(ε,1) ∀ε; every neighbourhood of 0 contains e₁₁ ≠ 0 | ✓ non-Hausdorff, strictly coarser | none |
| §1.2 sum law, max refuted | x = n1_(0,1), y = n1_(1,2), n > 2ε | cuts 1−1_(0,1), 1−1_(1,2): τ = 1, xe = ye = 0; x+y ∈ V(2ε,2) via 1−1_(0,2); any e with τ(1−e) ≤ 1 meets (0,2): `‖(x+y)e‖=n>2ε` | ✓; xy = 0 so nothing for the product law | none |
| §1.2 product law, max refuted | x′ = n1_(0,1)+1_(1,2), y′ = 1_(0,1)+n1_(1,2), n > 1 | `x′(1−1_(0,1))=1_(1,2)`, norm 1, τ = 1: x′ ∈ V(1,1); y′ likewise; `x′y′=n1_(0,2)` ∈ V(1,2), ∉ V(1,1) | ✓ | none |
| §1.3 p-triangle via FK 4.7(i), t → ∞ | g = s^p, p = 1/2; ℓ^{1/2}, x = e₁, y = e₂ | `∫₀^∞μ_s^p=τ(|·|^p)`; 2 ≤ 1+1; fk86 808–810 hypotheses: increasing concave, g(0) = 0 | ✓ | none |
| §1.3 `d(x,y)=‖x−y‖_p^p` metric | p = 1/2 | triangle = p-triangle; d = 0 ⇒ μ_t = 0 ∀t ⇒ x = y; Lp linear (hiai 1939–1940) | ✓ | none |
| §1.3 completeness, 0 < p < 1 | Cauchy (a_n) | `δμ_δ(a_m−a_n)^p≤‖a_m−a_n‖_p^p` ⇒ Cauchy in measure ⇒ a ∈ M̃; fk86 3.4(i) + Fatou: `∫μ_t(a−a_n)^p≤liminf_m∫μ_t(a_m−a_n)^p≤ε^p` | ✓ no step needs p ≥ 1 | none |
| §1.4 Haagerup variant diverges at t = ∞ | `μ_s=s^(−1/p)‖x‖_p`, r < p | `∫₀^∞s^(−1)ds=∞`; `∫₀¹s^(−r/p)ds=1/(1−r/p)` = fk86 879 constant | ✓ | none |
| Layer 1 example, M̃ for L∞ | f = n on (n,n+1); f = 1_(0,1)·t^(−1) | `μ(|f|>λ)=∞` ∀λ: not τ-measurable; second: bounded off (0,1), μ = 1: τ-measurable | ✓ hiai 1596–1597 | none |
| §2.3 Cwikel/BL locators | cwikel 289, 319, 881, 1112, 1188 | preface → Calderón §§2,3,5,6,9.2; Thm 2.2 regular, isometric, θ ∈ (0,1); Def 2.14 disc; Def 2.21/Cor 2.27 upper space of the dual couple | ✓ (BL 4.3.1 by locator) | none |
| §2.4 (L¹,L∞)_{1/2,2} value | f = 1_(0,1) | `t^(−2)min(t,1)²`: ∫₀¹1 = 1, ∫₁^∞t^(−2) = 1; total 2; `‖f‖₂=1` | ✓ | none |
| §4.3 preadjoints | ℂ², N = ℂ, pairing ax+by | E_*: c ↦ (c/2,c/2); ι_*: (a,b) ↦ a+b; ι_*E_* = id_{N_*}; E_*ι_*(a,b) = ((a+b)/2,(a+b)/2) = (ι∘E)_* | ✓ | none |
| §6.3 row–column estimate | u = v = x_ix_j; Pauli σ_x, σ_z | ∑uu* = ∑v*v = B; ∑uv = C; ‖C‖ ≤ ‖B‖ ≤ ‖T‖²; Pauli: B = 4, C = 0 | ✓ C3.3 at #860 lines 950–952 | none |
| §7.2 values for e₁₂ | tr/2; tr | `‖e₂₂‖_p=(1/2)^(1/p)=‖e₁₁‖_p`; `‖e₁₂‖_p=τ(e₂₂)^(1/p)`; tr: 1, 1, 1 | ✓ | none |
| §8.4 endpoint value and H¹ | a = e₁₂, tr/2 | `‖a‖₁=1/2`; a = a+0: `‖e₂₂‖₁=1/2`; any y+z: `‖dy₂‖₁+‖dz₂‖₁≥‖e₁₂‖₁=1/2`; `1/2≤√2/2` | ✓ | none |
| Lean header | lake env lean; importer | 5 `sorry` (80, 92, 101, 108, 116); 10 `#check` resolve, types unchanged; gate build=0 | ✓ | none |
| §1.5 `μ_t(x)=a_⌊t⌋(x)` on B(H) | rank-one projection e; t ∈ (0,1), [1,∞) | cut side: corank 0 forces e = 1, `‖e·1‖=1`; corank 1 allows `e'=1−e`, `‖e e'‖=0`; `a₀(e)=‖e‖=1`, `a₁(e)=0` (F = e) | ✓ (carried from the review at b3ab9bd) | none |
| §1.5 identity, dim H = ∞ | t > 0, j ≥ 0 | `‖1−F‖≥1` on a unit vector of ker F, so `a_j(1)=1`; `d_1(λ)=∞` for λ < 1, 0 for λ ≥ 1: `μ_t(1)=1` | ✓ (carried from the review at b3ab9bd) | none |
| §1.5 the two conventions agree | x = diag(3,1) in M₂ | `a₀=3`, `a₁=1`, `a_j=0` (j ≥ 2); `μ_t=3,1,0` on (0,1), [1,2), [2,∞) = `s_⌊t⌋` of §1.1 | ✓ (carried from the review at b3ab9bd) | none |
| §1.5 sum formula | x = diag(3,1), p = 1, 2 | `∫₀^∞a_⌊t⌋^p dt = 3^p+1^p`: 4 and 10; `(Tr|x|^p)^(1/p)=4, √10` | ✓ (carried from the review at b3ab9bd) | none |
| §1.5 `a_⌈t⌉` wrong model | rank-one e, p = 1 | `a_⌈t⌉=a₁=0` on (0,1]: `∫=0`, `‖e‖_p=0` for e ≠ 0 | ✓ excluded (carried from the review at b3ab9bd) | none |
| §1.5 `diag((j+1)^(−2))` | p = 1, 3/4, 1/2 | `∑(j+1)^(−2)=π²/6`; `∑(j+1)^(−3/2)=ζ(3/2)=2.612…`; `∑(j+1)^(−1)=∞`; threshold 2p > 1 | ✓ (carried from the review at b3ab9bd) | none |
| §1.5 gauge without p-th power | same x, any 0 < p < 1 | `∑a_j=π²/6<∞` | ✓ wrong model excluded (carried from the review at b3ab9bd) | none |
| §1.5 compactness of members | `a_j→0` | `‖x−F_j‖→0` with rank F_j ≤ j: norm limit of finite rank | ✓ (carried from the review at b3ab9bd) | none |
| §1.5 p = ∞ | identity | `μ_t(1)=1`, `sup_t μ_t = ‖1‖ = 1`: in L∞ = B(H), in no Lp, p < ∞ | ✓ (carried from the review at b3ab9bd) | none |
| §1.5 1 ≤ p < ∞ against OperatorIdeals S_p | OI symmetric gauge `Φ_p(a)=(∑ aₙ^p)^(1/p)`, 1 ≤ p ≤ ∞ (main lines 455, 464, 487–488) | same sequence `a_n`, same gauge: isometric | ✓ (carried from the review at b3ab9bd) | none |
| §1.6 weak gauge on B(H) | `t^(1/p)a_j` on [j,j+1) | sup `(j+1)^(1/p)a_j`, not attained; overall `sup_j(j+1)^(1/p)a_j` | ✓ (carried from the review at b3ab9bd) | none |
| §1.6 rank-one e, weak gauge | p = 1, 2 | `sup_(0<t<1)t^(1/p)=1`; `(0+1)^(1/p)·1=1`; unshifted `0·a₀+∑_(j≥1)j^(1/p)·0=0` | ✓ (carried from the review at b3ab9bd) | none |
| §1.6 `diag((j+1)^(−1/p))` | p = 1, 2 | `(j+1)^(1/p)a_j=1` for all j: gauge 1; `∑a_j^p=∑1/(j+1)=∞`; p = 1: `diag(1/(j+1))`, `∑1/(j+1)=∞` so not trace class | ✓ (carried from the review at b3ab9bd) | none |
| §1.6 members compact | gauge C | `a_j≤C(j+1)^(−1/p)→0` | ✓ (carried from the review at b3ab9bd) | none |
| §1.6 p = 1 is NoncommutativeGeometry's `S_(1,∞)` | main line 372 | `sup_(j≥0)(j+1)μ_j(T)<∞` with `μ_j` zero-based = `(j+1)^(1/1)a_j` | ✓ same object, one owner (carried from the review at b3ab9bd) | none |
| Scope: "p-summable, respectively `O((j+1)^(−1/p))`" | `diag((j+1)^(−1/p))`, `diag((j+1)^(−2))` | first: weak only; second: Lp for p > 1/2 | ✓ (carried from the review at b3ab9bd) | none |
| Layer 1 example, B(H): "finite-trace inclusions fail" | `diag(1/(j+1))` | in S₂ (`∑(j+1)^(−2)<∞`), not S₁: `Lq⊄Lp` for p = 1 < q = 2 | ✓ (carried from the review at b3ab9bd) | none |
| Downstream: NoncommutativeGeometry N3–N4 consume §1.3–§1.6 | #1143 head lines 143, 525–540, 667, 680–684 | cites §1.3, §1.4, §1.5, §1.6 by number for the same laws | ✓ (carried from the review at b3ab9bd) | none |
| §1.1 `μ_t(x)=s_⌊t⌋(x)`, unnormalized trace | x = diag(3,1), t ∈ (0,1), [1,2), ≥ 2 | d_x = 2, 1, 0 on λ < 1, [1,3), ≥ 3; μ = 3, 1, 0 | ✓ (carried from the review at b3ab9bd) | none |
| §1.1 normalized trace | same, t = 1/2 | `d/2 ≤ 1/2` ⟺ `#{s_j>λ} ≤ 1`: μ = 1 = s_⌊2·½⌋ | ✓ (carried from the review at b3ab9bd) | none |
| §1.1 right continuity | f = 1_(0,1/2) on (0,1), t = 1/2 | d_f(λ) ≤ 1/2 for all λ ≥ 0: μ_{1/2} = 0; t < 1/2: μ = 1 | ✓ (carried from the review at b3ab9bd) | none |
| §1.1 shifted sum law | x = e₁₁, y = e₂₂, s = t = 1/2 | μ₁(1) = 1 ≤ 1+1; unshifted t = 1: μ₁(1) = 1 > 0+0 | ✓ (carried from the review at b3ab9bd) | none |
| §1.1 `μ_t(f(|x|))=f(μ_t(x))`, f(0) ≠ 0 | f = λ²+1, t ≥ 2 | left 0 (trace 2), right 1 | ✓ fails as stated (carried from the review at b3ab9bd) | none |
| §1.2 `V(ε,δ)` on M₂, δ < 1 | e ≠ 1 | τ(1−e) ≥ 1 > δ: e = 1, norm ball | ✓ (carried from the review at b3ab9bd) | none |
| §1.2 `x_n = n1_(0,1/n)` | e = 1−1_(0,1/n) | x_n e = 0, τ(1−e) = 1/n: x_n ∈ V(ε,1/n), ‖x_n‖_∞ = n | ✓ (carried from the review at b3ab9bd) | none |
| §1.2 sum law with max | x = n1_(0,1), y = n1_(1,2), ε < n | each in V(ε,1); x+y needs τ(1−e) ≥ 2 | ✓ for sum, xy = 0 for product (carried from the review at bb121b3; wording not repaired) | R04 |
| §1.2 Fatou | x_n = 1_(n,n+1) | τ(0) = 0 < liminf 1 | ✓ (carried from the review at b3ab9bd) | none |
| §1.3 p-triangle in ℓ^{1/2} | x = e₁, y = e₂ | ‖x+y‖^{1/2}_{1/2} = 2 = 1+1; ‖x+y‖_{1/2} = 4 > 2 | ✓ (carried from the review at b3ab9bd) | none |
| §1.3 `x_n = n^{1/p}1_(0,1/n)` | p = 1, 2 | ‖x_n‖_p = 1; support 1/n → 0 | ✓ no converse (carried from the review at b3ab9bd) | none |
| §1.3 `V(ε,δ)∩Lp ⊇ {‖x‖_p ≤ εδ^{1/p}}` | x = ε1_(0,δ) | ‖x‖_p = εδ^{1/p}; boundary of V | ✓ (carried from the review at b3ab9bd) | none |
| §1.4 Ky Fan at k = 1, 2 | x = e₁₁, y = e₂₂ | s(x+y) = (1,1), s(x) = s(y) = (1,0): 1 ≤ 2, 2 ≤ 2 | ✓ (carried from the review at b3ab9bd) | none |
| §1.4 not weak submajorization | a = (1,1) ≺_w b = (2,0), g = √ | 2 > √2 | ✓ (carried from the review at b3ab9bd) | none |
| §1.4 concave inequality | x = e₁₁, y = e₁₂, g = √, t = 1 | s(x+y) = (√2,0): 2^{1/4} ≈ 1.19 ≤ 2 | ✓ (carried from the review at b3ab9bd) | none |
| §1.4 Hölder constant 1 | ℂ², x = y = (1,1), p = q = 2 | ‖xy‖₁ = 2 = √2·√2 | ✓ (carried from the review at b3ab9bd) | none |
| §1.5 finite-trace inclusion | ℂ², x = (1,1), p = 1, q = 2 | 2 ≤ 2^{1/2}·√2 = 2; exponent reversed gives 2 ≤ 1 | ✓ (carried from the review at b3ab9bd) | none |
| §1.5 no inclusion for infinite trace | (1/n) ∈ ℓ²∖ℓ¹; t^{−1/2}1_(0,1) ∈ L¹∖L²; 1_(1,∞)/t ∈ L²∖L¹ | ∑1/n² < ∞, ∑1/n = ∞; ∫₀¹t^{−1/2} = 2, ∫₀¹t^{−1} = ∞; ∫₁^∞t^{−2} = 1, ∫₁^∞t^{−1} = ∞ | ✓ (carried from the review at b3ab9bd) | none |
| §1.5 Schatten values | x = diag(3,1) | ‖x‖₁ = 4, ‖x‖₂ = √10, ‖x‖_∞ = 3; normalized 2, √5, 3 | ✓ (carried from the review at b3ab9bd) | none |
| §1.5 S_p, 0 < p < 1 | diag(1/n), p = 1/2 | ∑n^{−1/2} = ∞; diag(1/n²) ∈ S₁ | ✓ (carried from the review at b3ab9bd) | none |
| §1.6 weak Lp ⊋ Lp | f = t^{−1/p} | sup t^{1/p}t^{−1/p} = 1; ∫dt/t = ∞ | ✓ (carried from the review at b3ab9bd) | none |
| §1.6 q = p recovers ‖·‖_p | — | `(t^{1/p}μ_t)^p/t = μ_t^p` | ✓ (carried from the review at b3ab9bd) | none |
| §1.6 weak L¹ of diag(3,1) | t ∈ (0,1), [1,2) | sup 3t = 3, sup t·1 = 2: 3; ‖x‖₁ = 4 | ✓ (carried from the review at b3ab9bd) | none |
| §2.1 L¹ dual is M, not M* | ℓ∞ | (ℓ¹)* = ℓ∞; (ℓ∞)* ⊋ ℓ¹ | ✓ (carried from the review at b3ab9bd) | none |
| §2.1 norming element | x = diag(3,1), p = 2 | τ(x·x/√10) = 10/√10 = √10 | ✓ (carried from the review at b3ab9bd) | none |
| §2.1 cyclicity | x = e₁₂, y = e₂₁ | τ(e₁₁) = 1 = τ(e₂₂) | ✓ (carried from the review at b3ab9bd) | none |
| §2.2 K-functional | f = 1_(0,1) on (0,∞) | K(t,f) = ∫₀ᵗ f* = min(t,1); (E,E): min(1,t)‖x‖ | ✓ (carried from the review at b3ab9bd) | none |
| §2.2 non-regular (c₀,ℓ∞) | — | c₀ ∩ ℓ∞ = c₀ not dense in ℓ∞ | ✓ (carried from the review at b3ab9bd) | none |
| §2.3 `[L¹,L∞]_θ = L^p`, 1/p = 1−θ | θ = 1/2 | p = 2; convention 1/p = θ gives the same at 1/2 only | ✓ (carried from the review at b3ab9bd) | none |
| §2.3 `[ℓ∞₂,ℓ²₂]_{1/2} = ℓ⁴₂` | — | 1/q = 0 + 1/4 | ✓ (carried from the review at b3ab9bd) | none |
| §2.3 operator estimate 2^θ | T = id: (E,E) → (E,E′), ‖·‖₁ = 2‖·‖ | f(z) = 2^{θ−z}x: boundary norms 2^θ‖x‖, 2·2^{θ−1}‖x‖; three lines on φ gives ‖x‖ ≤ 2^{−θ}‖x‖_θ; ‖T‖_θ = 2^θ = 1^{1−θ}2^θ | ✓ (carried from the review at b3ab9bd) | none |
| §2.4 (E,E)_{θ,q} | θ ∈ {0,1} | ∫₀¹ t^{−θq}dt/t diverges at θ = 0; ∫₁^∞ t^{(1−θ)q}dt/t at θ = 1 | ✓ (carried from the review at b3ab9bd) | none |
| §2.4 (L¹,L∞)_{θ,∞} = weak Lp | f = t^{−1/p}, p > 1 | K = t^{1−1/p}/(1−1/p); sup t^{−θ}K < ∞ iff θ = 1−1/p | ✓ (carried from the review at b3ab9bd) | none |
| §2.5 exponent convention | p₀ = 1, p₁ = ∞, θ = 1/4 | (1−θ)/1 = 3/4 → p = 4/3; swapped: 1/4 → p = 4 | ✓ (carried from the review at b3ab9bd) | none |
| §2.5 retraction K | x = diag(3,1) | K = 3t, 2+t, 4; K(1) = 3 = ‖diag(2,0)‖₁+‖1‖_∞ | ✓ (carried from the review at b3ab9bd) | none |
| §2.6 scalar case | ℓ¹_N → ℓ∞_N norm 1, ℓ∞_N → ℓ¹_N norm N | θ = 1/2: bound √N vs actual 1 | ✓ not sharp (carried from the review at b3ab9bd) | none |
| Conventions / §3.2 sign of θ_s(h_ω) | Tr∘θ_s = eˢTr, ω̂ θ-invariant | Tr(hθ_s y) = Tr(hy) = eˢTr(θ_{−s}(h)y) ⇒ θ_s(h) = eˢh; Lp character e^{s/p} | ✓ (Hiai has e^{−s} with τ∘θ_s = e^{−s}τ, 5036–5037, 5362) (carried from the review at b3ab9bd) | none |
| §3.1 semifinite core | R = M⊗̄L∞(ℝ), θ_s f(u) = f(u−s), Tr = τ⊗eᵘdu | Tr∘θ_s = eˢTr; θ_s(x⊗e^{−u/p}) = e^{s/p}x⊗e^{−u/p} | ✓ (carried from the review at b3ab9bd) | none |
| §3.1 Lp ∩ Lq = 0 | p ≠ q | e^{s/p}x = e^{s/q}x ∀s ⇒ x = 0 | ✓ (carried from the review at b3ab9bd) | none |
| §3.2 M = ℂ, ω = id | h = e^{−u} | Tr(hy) = ∫y du Lebesgue, θ-invariant; Tr(1_(λ,∞)(h)) = ∫_{u<−logλ}eᵘdu = 1/λ | ✓ (carried from the review at b3ab9bd) | none |
| §3.2 μ_t(h_ω) and Tr(h_ω) | — | inf{λ : ω(1)/λ ≤ t} = ω(1)/t; ∫₀^∞ω(1)/t dt = ∞ | ✓ (carried from the review at b3ab9bd) | none |
| §3.2 nonfaithful ω = (1,0) | — | h = e₁₁⊗e^{−u}, support e₁₁⊗1 θ-fixed; 1_(0,1)(u) not translation-fixed | ✓ (carried from the review at b3ab9bd) | none |
| §3.3 distribution formula | p = 2, ‖x‖₂ = 1, λ = 2, t = 4 | 2^{−2} = 1/4; μ₄ = inf{λ : λ^{−2} ≤ 4} = 1/2 = 4^{−1/2} | ✓ (carried from the review at b3ab9bd) | none |
| §3.3 triangle via Ky Fan | p = 2; p = 1 | ∫₀¹s^{−1/2} = 2 both sides; ∫₀¹s^{−1} = ∞ | ✓ (carried from the review at b3ab9bd) | none |
| §3.3 p-triangle, p = 1/2, r = 1/4 | — | ∫₀¹s^{−1/2} = 2 cancels; ‖x+y‖^{1/4} ≤ ‖x‖^{1/4}+‖y‖^{1/4}; r ↑ 1/2 | ✓ (carried from the review at b3ab9bd) | none |
| §3.3 Hölder M = ℂ | x = y = h^{1/2} | ‖h‖₁ = 1 = 1·1 | ✓ (carried from the review at b3ab9bd) | none |
| §3.4 corner norm | M₂, e = e₁₁, ω ≥ 0 | ‖e h_ω e‖₁ = (eωe)(1) = ω(e) | ✓ (carried from the review at b3ab9bd) | none |
| §3.5 matrix identification | x h_τ^{1/p} = x⊗e^{−u/p} | tr_H(|x|^p⊗e^{−u}) = τ(|x|^p); with tr/d: /d | ✓ (carried from the review at b3ab9bd) | none |
| §4.1 left embedding | pairing ω_a(y) = tr(ay) | φ(yx) = tr(hyx) = tr((xh)y); xh = (xh^{1/p})h^{1−1/p} | ✓ (carried from the review at b3ab9bd) | none |
| §4.1 symmetric vs left | φ = tr(diag(1,2)·)/3, x = e₁₂ | left (2/3)^{1/p}; symmetric (1/3·2/3)^{1/(2p)} = (2/9)^{1/(2p)}; ratio 2^{1/(2p)}; h^{−1/(2p)}e₁₂h^{1/(2p)} = 2^{1/(2p)}e₁₂ reconciles | ✓ (carried from the review at b3ab9bd) | none |
| §4.3 no contraction below p = 1 | ℂ², (1/2,1/2), f = (1,0), p = 1/2 | ‖f‖^p_p = 1/2, ‖Ef‖^p_p = (1/2)^{1/2}: 1/4 vs 1/2 in the README's normalization: E not contractive | ✓ (carried from the review at b3ab9bd) | none |
| §4.3 nontracial witness | N diagonal, e₁₁ | h_{φ|N} = h; E_p(h^{1/(2p)}e₁₁h^{1/(2p)}) = (1/3)^{1/p}e₁₁; e₁₂ ↦ 0 | ✓ (carried from the review at b3ab9bd) | none |
| §4.3 non-invariant N | e₁₂+e₂₁ | σ_t = Ad diag(1,2)^{it}: 2^{−it}e₁₂+2^{it}e₂₁ ∉ N | ✓ (carried from the review at b3ab9bd) | none |
| §4.3 preadjoints | ℂ², N = ℂ | ι_*: (a,b) ↦ a+b; E_*: c ↦ (c/2,c/2); ι_*E_* = id, E_*ι_* ≠ id | ✓ values, wording (carried from the review at bb121b3; wording not repaired) | R05 |
| §4.4 Bochner norm | Ω two points, M = M₂ | ((‖x‖^p+‖y‖^p)/2)^{1/p} = ‖diag(x,y)‖_p for (1/2)⊗τ | ✓ (carried from the review at b3ab9bd) | none |
| §5.1 period | f(e^{iθ}) = θ, b_n = f(λ(2^{−n})) | e^{ib_n} = λ(2^{−n}); e^{−i2^{−n}a_n} = λ(2^{−n})*; σ^{φ_n}_{2^{−n}} = id; hjx 334–338 same branch | ✓ (carried from the review at b3ab9bd) | none |
| §5.1 M = ℂ, tracial M₂ | — | centralizer = R, R_n = R, Φ_n = id | ✓ (carried from the review at b3ab9bd) | none |
| §5.2 nestedness | λ(2^{−n}) = λ(2^{−n−1})² | b_n ≡ 2b_{n+1} mod 2π; a_n ≡ a_{n+1} mod 2^{n+1}π | ✓ (carried from the review at b3ab9bd) | none |
| §5.3 Hölder exponent | p = 1/2 | 1/r = 2−1/2 = 3/2, r = 2/3; ‖h^{3/2}‖_{2/3} = tr(h)^{3/2} = 1 | ✓ (carried from the review at b3ab9bd) | none |
| §5.3 normalization | τ_n(1) = d | x ↦ d^{−1/p}x carries unnormalized to normalized p-norm | ✓ (carried from the review at b3ab9bd) | none |
| §5.4 p_i ≠ 1 | ℂ², p = e₁, Φ(a,b) = (a,0) | φ∘Φ = (a/2) ≠ φ; pφp(a,b) = a/2 = φ(Φ(a,b)) | ✓ (carried from the review at b3ab9bd) | none |
| §5.5 BCL ⇒ moduli | u = (x+y)/2, v = (x−y)/2 | ‖u‖² ≤ 1−(p−1)ε²/4 ⇒ δ ≥ (p−1)ε²/8; reversed: ρ(t) ≤ √(1+(p−1)t²)−1 ≤ (p−1)t²/2 | ✓ (carried from the review at b3ab9bd) | none |
| §5.5 p = 2 | — | δ = 1−√(1−ε²/4) ≥ ε²/8; ρ = √(1+t²)−1 ≤ t²/2 | ✓ (carried from the review at b3ab9bd) | none |
| §5.5 scalars | x = y = 1, p = 3/2; p = 3 | 2 ≥ 3/2; 2 ≤ 3 | ✓ (carried from the review at b3ab9bd) | none |
| §5.5 p = 1 excluded | ℓ¹₂, x = e₁, y = e₂ | ‖x−y‖ = 2, ‖(x+y)/2‖ = 1: δ(2) = 0 | ✓ (carried from the review at b3ab9bd) | none |
| §5.5 matrix witness | x = e₁₁, y = e₁₂, p = 3/2 | s(x±y) = (√2,0): (2+2)/2 = 2 ≥ 1+1/2 | ✓ (carried from the review at b3ab9bd) | none |
| §6.1 matrix units | a_k = e_{1k}, n | ∑a*a = 1: C_p = n^{1/p}; ∑aa* = ne₁₁: R_p = √n | ✓ (carried from the review at b3ab9bd) | none |
| §6.1 realization | X = ∑a_k⊗e_{k1} | X*X = ∑a_k*a_k⊗e₁₁ | ✓ (carried from the review at b3ab9bd) | none |
| §6.1 p = 1 values | a = (e₁₁,e₁₂) | C₁ = ‖1‖₁ = 2; R₁ = ‖√2e₁₁‖₁ = √2 | ✓ (carried from the review at b3ab9bd) | none |
| §6.1 sum gauge = √2 | b = 0, c = a; dual x = a/√2 | ‖∑x*x‖ = 1/2, ‖∑xx*‖ = 1, ‖x‖_RC = 1; pairing 2/√2 = √2 | ✓ (carried from the review at b3ab9bd) | none |
| §6.2 K₁, K₂ for (1,1) | — | E|ε₁+ε₂| = 1; K₂ = √2 | ✓ (carried from the review at b3ab9bd) | none |
| §6.2 Lévy witness | x = (1,1), t = 1; x = (1,1,1) | 1/2 ≤ 2·1/2; P(max > 1) = 1/2, P(|S₃| > 1) = 1/4: 1/2 ≤ 1/2, fails without 2 | ✓ (carried from the review at b3ab9bd) | none |
| §6.3 dualities | — | (A+B)* = A*∩B* with max; L¹(ℓ²_C)* = L∞(ℓ²_C) | ✓ (carried from the review at b3ab9bd) | none |
| §6.3 pairing expansion | i = j terms counted | E(S⁴) = A+B+C−2D with all-index sums; (1,1): 4+4+4−4 = 8 = (16+16)/4 | ✓ (carried from the review at b3ab9bd) | none |
| §6.3 Pauli | σ_x, σ_z | S² = 2, E(S⁴) = 4; A = B = 4, C = 2+2(σ_xσ_z)² = 0, D = 2 | ✓ (carried from the review at b3ab9bd) | none |
| §6.3 bound 3 | T = ∑x_k² | A = T² ≤ ‖T‖²; B ≤ ‖T‖T; ‖C‖ ≤ ‖B‖ by u = v = x_ix_j; 0 ≤ E(S⁴) ≤ A+B+C | ✓ (carried from the review at b3ab9bd) | none |
| §6.3 optimality | x_k = 1 | E(S⁴) = 3n²−2n: n = 2: 8, n = 3: 21 | ✓ (carried from the review at b3ab9bd) | none |
| §6.3 truncation | c₀ = √3/2 | (|t|−c₀)₊² ≤ t⁴/(16c₀²) ⟺ (|t|−2c₀)² ≥ 0; t = √3: 3/4 = 3/4; E(F²) ≤ 3‖T‖²/12 < 1/4 | ✓ (carried from the review at b3ab9bd) | none |
| §6.3 iteration | — | [x] ≤ c₀(1+1/2+…) = √3 | ✓ (carried from the review at b3ab9bd) | none |
| §6.3 scalars (1,1) | — | 3^{−1/2}√2 ≈ 0.816 ≤ 1 ≤ √2; sharp n = 2 constant 1/√2 | ✓ (carried from the review at b3ab9bd) | none |
| §7.1 martingale of e₁₁ | tr/2 | x₀ = 1/2, x₁ = e₁₁; ‖x₀‖₂²+‖dx₁‖₂² = 1/4+1/4 = 1/2 = τ(e₁₁) | ✓ (carried from the review at b3ab9bd) | none |
| §7.3 x₁*x₁ identity | dx₀ = 1/2, dx₁ = e₁₁−1/2 | 1/4+1/4 + (e₁₁−1/2) = e₁₁ | ✓ (carried from the review at b3ab9bd) | none |
| §7.4 transform (1,−1,1) | — | 1/2−(e₁₁−1/2) = e₂₂ | ✓ (carried from the review at b3ab9bd) | none |
| §7.4 commutation | v = e₂₁, A = e₁₁ | vAv* = e₂₂ ≰ cA | ✓ (carried from the review at b3ab9bd) | none |
| §7.4 L¹ fails | x_n = 2ⁿ1_(0,2^{−n}) | E_n x_{n+1} = 2^{n+1}/2 = 2ⁿ; norm 1; no L¹ limit | ✓ (carried from the review at b3ab9bd) | none |
| §7.5 scalars p = 4 | (1,1) | K₄⁴ = (16+16)/4 = 8; max(C₄,R₄) = √2; B₄ ≥ 2^{1/4} | ✓ (carried from the review at b3ab9bd) | none |
| §7.5 type in ℓ¹ | e_k | n vs √n | ✓ (carried from the review at b3ab9bd) | none |
| §7.5 McCarthy | ℂ², r = 2, 1/2 | 2 = 2; 2 ≤ 4; √2 ≤ 2 | ✓ (carried from the review at b3ab9bd) | none |
| §8.1 square function | e₁₂h^{1/p} | h^{1/p}e₂₂h^{1/p} = (2/3)^{2/p}e₂₂ ∈ L^{p/2}, norm (2/3)^{2/p}; sqrt (2/3)^{1/p} = ‖e₁₂h^{1/p}‖_p | ✓ (carried from the review at b3ab9bd) | none |
| §8.2 trace preservation | y ∈ R_m | φ̂(e^{−a_m}Ê_n y) = φ̂(Ê_n(e^{−a_m}y)) needs e^{−a_m} ∈ R(M₀) | ✓ (carried from the review at b3ab9bd) | none |
| §8.4 BMO of 1 | n = 0 | E₀(1) = 1: ‖1‖_BMO_C = 1 | ✓ (carried from the review at b3ab9bd) | none |
| §8.4 BMO of e₁₂ | tr/2 | 1/2, e₂₂, e₂₂ → 1; row e₁₁ → 1; = ‖e₁₂‖_∞ | ✓ (carried from the review at b3ab9bd) | none |
| §8.4 reverse fails | dyadic x_n | dx_k = ±2^{k−1} on (0,2^{−k+1}); S² = (4^j−1)/3 on (2^{−j},2^{−j+1}); ‖S‖₁ = ∑2^{−j}2^j/√3 = ∞ | ✓ (carried from the review at b3ab9bd) | none |
| §8.4 constants | px97 (ii) | (1/√3)‖a‖ ≤ ‖φ_a‖ ≤ √2‖a‖ ⟺ README | ✓ (carried from the review at b3ab9bd) | none |
| `matrixLpGauge` | p = 2, x = diag(3,1); wrong models | tr(|x|²)^{1/2} = √10; `x*star x` same by unitary invariance; omitting `.re^(1/p)` fails; normalized trace excluded by `Matrix.trace` | ✓ (carried from the review at b3ab9bd) | none |
| `columnSquare`/`rowSquare` | (e_{1k}) | n^{1/p} vs √n distinguishes the swapped model | ✓ (carried from the review at b3ab9bd) | none |
| `randomSumGauge` | n = 1; no division | ‖a‖_p; 2^{n/p} too large | ✓ (carried from the review at b3ab9bd) | none |
| `rowColumnSumGauge` | n = 0; general | set = {0}: 0; nonempty (b = a, c = 0), bounded below by 0, so `Real.sInf` is the infimum | ✓ (carried from the review at b3ab9bd) | none |
| `matrix_khintchine_high` | n = 0; d = 0; p = 2 | all gauges 0; S = K, any B ≥ 1 | ✓ (carried from the review at b3ab9bd) | none |
| `matrix_khintchine_low` / `_one` | n = 0; p = 1 overlap | 0 ≤ 0; A = 1/√3 consistent | ✓ (carried from the review at b3ab9bd) | none |
| `matrix_ball_carlen_lieb_low/high` | d = 0; p = 2 | 0 ≤ 0; both become the parallelogram law | ✓ (carried from the review at b3ab9bd) | none |
| Lean generality vs README | all five | matrices with constants uniform in d, n; README states every von Neumann algebra and the docstring says why | ✓ (carried from the review at b3ab9bd) | none |

## Not verifiable

- Bergh–Löfström, *Interpolation Spaces* (§1.3; §§2.3, 3.1; Theorems 3.1.2, 3.4.1, 4.1.2, 4.3.1, 4.5.1, 4.6.1, 5.1.1, 5.1.2, 5.2.1; §5.3): Springer book, DOI 10.1007/978-3-642-66451-9, paywalled; cited by locator. The new citation of Theorem 4.3.1 (the lower and upper complex methods coincide with equal norms when one endpoint is reflexive) is consistent with Cwikel's preface, which refers the same fact to Calderón's §9.2 (cwikel line 293).
- Pisier–Xu, *Non-Commutative Lp-Spaces*, Handbook 2 (§§1–3, 5–7): Elsevier, DOI 10.1016/S1874-5849(03)80041-4, paywalled.
- Kosaki, J. Funct. Anal. 56 (1984): Elsevier, paywalled; its use is confirmed through hjx (previous review).
- Takesaki, *Theory of Operator Algebras II* (VIII.3, IX.4.2, X.2.3): book, not online; the statements used are Hiai's.
- Ball–Carlen–Lieb, Invent. Math. 115 (1994): Springer, paywalled; checked through rx14 (previous review).
- Lust-Piquard–Pisier, Ark. Mat. 29 (1991): Springer, paywalled.
- Ledoux–Talagrand, *Probability in Banach Spaces* (Proposition 2.3, Theorem 4.7): Springer book, paywalled.
- Burkholder, Handbook 1 (2001), §2: Elsevier, paywalled.
- Ky Fan, PNAS 37 (1951): the cached text `Fan1951` is in the worker's manifest; the inequality is also confirmed from moslehian (previous review).

## Source issues

- **Misprint** in hiai at Remark 11.23, printed page 112 (line 5570): the source writes the singular-number formulas with the exponent `t^{1/p}` (and `t^{1/q}`, `t^{1/r}`); it should be `t^{−1/p}` as in (11.9) (line 5429), which the same remark cites; affects nothing.
