# Review of LatticePackingsAndPerfectForms (pull request #1723 at 056a570)

**Verdict:** accepted

## R01 (P3) — Assign the Eisenstein decomposition to ModularForms Layer 0

**Location:** TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:276–277: “Layers 4–5 (eigenforms, newforms and the Eisenstein decomposition)”.

**Claim:** The new supplier summary assigns the cusp–Eisenstein decomposition to the wrong layers. This is a locator error, not an unowned prerequisite: Layer 0 is already among the dependencies of 6.4.

**Witness:** TauCetiRoadmap/ModularForms/README.md:318 on main states the cusp–Eisenstein direct sum in Layer 0. Layers 4–5 contain eigenforms, newforms, multiplicity one and coefficient characterizations.

**Repair:** Write “Layer 0 (forms with character and the cusp–Eisenstein decomposition)” and “Layers 4–5 (eigenforms and newforms)”. The corrected locator supplies the general M_k(N,χ) decomposition, including the weight-two case used in 6.4. No supplier edge changes.

## Previous findings

- R01 — repaired: README:882–893 proves strictness using the finite extreme-point set of the Voronoi polytope, then derives strict density. README:911–915 supplies the square, interval and rank-zero controls.
- R02 — repaired: README:700 and 745 cite the pinned rounding bound abs_sub_round. It gives the required coefficient reduction with error at most one half.
- R03 — repaired: README:480–483, 498 and 512 cite ThetaSeries Layer 1 dual and §2A. Contrary to r3's assertion, §2A explicitly supplies dual fullness and double duality; §2B is unnecessary for this identification.
- R04 — repaired: README:1252/1314, 1621/1676 and 1651–1655/1677 now agree. The additional 4.11 and 5.4 rows also match their Needs lines. The unused IL §9B edge is gone from 6.3.
- R05 — repaired: README:985–989 attributes the unique-solution definition to DSV, then explicitly deduces rationality by rational linear algebra and primitive normalization. It no longer attributes the deduction itself to that page.

## Verified sound

🤖 Independent AI incremental re-review of 64 changed lines since 5e4d25b. Only README.md changed; Suggested.lean is byte-for-byte unchanged. All five previous findings were checked, together with the changed statements, their immediate consumers, supplier contracts and dependency rows. The untouched mathematics retains the previous review's evidence and limitations. No P1 or P2 finding remains; the single P3 locator note does not block human final approval.

I read the normative README and CONTRIBUTING guidance, and consulted ThetaSeries, SuccessiveMinima and Completed/IntegralLattices on main for the established shape. The PR has no changes outside this folder. Its three files remain README.md, Suggested.lean and metadata.toml. No PR file was edited. These repairs introduce no algorithm, route restriction, duplicate carrier, sorry'd data or configuration override.

**Gate and elaboration.** The worker's recorded gate passed. I reran the full gate with the supplied candidate merge order and targeted build enabled; it exited 0:

    gate LatticePackingsAndPerfectForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK

The separate dependency check, with the supplied candidate order, movable placement and main content, exited 0:

    depcheck: 204 roadmaps, 1629 edges, 0 problem(s)

There was no UPWARD or CYCLE line. The initial default-order invocation instead printed “depcheck: NOT IN ORDER: LatticePackingsAndPerfectForms (insert it after its last supplier)”. This is an order-selection false positive, explicitly excluded as a defect by the brief. The candidate-order run resolves it without editing the tooling or either order file.

Direct lake env lean on Suggested.lean exited 0 with 52 warnings, all declaration-uses-sorry warnings. A scratch copy with #check @name for all 112 declarations also exited 0, printing 112 types and the same 52 warnings. The supplied signature inventory and re-elaboration agree. The covering statements use the Gram metric, rationality uses native positive definite matrices, the 290 theorem retains evenness, and discriminant homomorphisms retain nondegeneracy. The sole binder lead remains harmless: polynomialsOfDegreeLE only spans functions and needs no measure or finite-dimensionality; IsSphericalDesign retains the measure, Borel and finite-dimensional binders. No signature repair is needed.

The unchanged 52-theorem padding probe is carried from r3: none closed with rfl, simp or infer_instance, and its pinned-lemma inspection found no one-lemma closure. No Lean declaration changed, so the padding probe was not repeated.

**The repaired arguments.** In positive rank ρ>0. The triangle inequality places the open ρ-ball inside the Voronoi cell; closedness places its closure there. If μ=ρ, the reverse inclusion follows because zero is a nearest lattice point on that cell. Every sphere point is extreme in a Euclidean closed ball, whereas a bounded intersection of finitely many half-spaces has finitely many extreme points. This contradicts n≥2. Periodicity converts an open missed region into positive missing volume per fundamental domain. Rank one has an interval cell and equality; rank zero stays outside the iff. Thus the route uses 3.1 and does not assume strict density.

For rationality, the symmetric upper-triangular entries are unknowns. Their coefficients are x_i² and 2x_ix_j, all integers. Perfection gives full column rank, so an invertible rational square subsystem gives the unique solution over ℚ. Clearing denominators and dividing the positive gcd gives the primitive integral representative in positive rank. Rank zero needs no primitive normalization. The rewritten deduction remains sufficient for consumers 4.6, 4.9 and 4.10.

**Recomputed changed passages and immediate interfaces.** A₂ denotes [[2,1],[1,2]]. Decimal values approximate the exact expressions shown.

| Statement / changed interface | Instances | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| 0.5 dual-to-inverse-form isometry | A=[4], x=1/4; inverse map | Ax=1; A[x]=1/4=A⁻¹[1]; A⁻¹·1=1/4 | Pass; corrected supplier |
| 1.8 rounding input | [[2,1],[1,3]], x=1/2 | round(x)=1; abs(x−1)=1/2≤1/2; reduced cross coefficient −1 gives 2·abs(−1)=2=a₁₁ | Pass; pinned bound |
| 3.2 strictness and rank restriction | I₂; [4]; empty form | ρ=1/2<μ=√2/2≈0.707107, square has 4 extreme points, disc infinitely many; [4]: ρ=μ=1, interval and ball each have 2 endpoints; rank 0: 0=0, one point | Pass; guarded iff |
| 3.2 strict-density consequence | I₂; diag(1,4); [4] | Δ=π/4≈0.785398<1; π/8≈0.392699<1; rank one gives 1=1 | Pass; implication direction repaired |
| 3.2 missed open region | I₂, h=(1/2,1/2) | infDist(h,ℤ²)=√2/2; ε=(√2−1)/4>0 gives infDist(y,ℤ²)>ρ+ε>ρ on B(h,ε) | Pass; positive missing measure |
| 3.2 scaling and covering density | I₂, 4I₂; [4] | (ρ,μ)=(1/2,√2/2)→(1,√2); Θ=π/2 for both rank-two forms; [4] gives Θ=1 | Pass |
| 4.1 rationality | A₂/2; [1]; axis equations only | a=c=1 and a−2b+c=1 force b=1/2, det=3/4; scale 2 gives primitive A₂; [1] solves a=1; axes alone leave b free | Pass; uniqueness matters |
| 4.1 negative control and rank zero | [[1,t],[t,1]], t=√2/10; empty form | min=1, four axis minima, span dimension 2<3, irrational b allowed; empty system has unique empty rational solution | Pass; perfection not dropped |
| 4.10 revised inputs | D₅, E₆, E₇; family {[1]} | γ⁵=32/4=8; γ⁶=64/3; γ⁷=128/2=64; family max=1=γ₁ | Pass; dependency row agrees |
| 4.11 revised supplier row | r=2, f(0)=f̂(0)=1; 3f | bound (2/2)²⁴·1/1=1; scaled ratio 3/3=1; Leech δ=1, γ=4 | Pass |
| 5.4 Gram derivative suppliers | diag(1,4), X₀²−X₁² and X₀²−4X₁² | Laplacians 2−2/4=3/2 and 2−8/4=0; y₁=2x₁ turns the latter into y₀²−y₁², ordinary Laplacian 0 | Pass; genuine Gram adapter |
| 6.3 revised dependencies | [1]; ℤ⁴ | [1] misses 2; ℤ⁴ represents 7=4+1+1+1 | Pass; genera and rational representation are inputs, not substitutes for integral representation |
| 6.4 parity and all-prime inputs | 2I₄, [2]; weight 2 at good p=2 and bad p=11 with v₁₁(N)=1, trivial character | half-norm Σxᵢ² represents all 29 tests; x² misses 2; good bound 2√2 and bad eigenvalue magnitude 11⁰=1 | Pass; no discarded primes |
| New ModularForms summary (R01) | weight 2, trivial pair, raising t=2 versus t=1 | E₂(z)−2E₂(2z) has constant term −1; E₂(z)−E₂(z)=0; these exceptions are in Layer 0 | Correct mathematics, wrong layer label |
| 7.4 discriminant suppliers / 7.5 index | Gram [8], [12] | [8]: bilinear units {1,3,5,7}, quadratic {1,7}, q(1)=1/16, index 2/2=1; [12]: quadratic {1,5,7,11}, q(1)=1/24, index 4/2=2 | Pass; native half-norm convention |

**Carried adversarial table.** Each row below cites r3, meaning PRREVIEW-LatticePackingsAndPerfectForms_r3.md at 5e4d25b, “Computed adversarial pass”. These are its computed values, not fresh computations. Changed proof routes or dependencies also have fresh rows above; the old route/locator defects are now repaired.

| Statement / API | Instances | Values computed on each side | Result / change and provenance |
| --- | --- | --- | --- |
| 0.1 action and similarity | I₂, U = [[1,1],[0,1]]; [2], [6] | UᵀU = [[1,1],[1,2]], det 1; [6] = 3·[2] similar, not GL₁-congruent; kissing numbers I₂: 4, A₂: 6 | Pass; r3 |
| 0.1 primitive representative | [4], rank 0 | [4] → [1]; empty gcd 0 excludes rank 0 | Pass: positive rank in hypothesis; r3 |
| 0.2 gramForm positivity | Gram [2], [0], empty | [2] PD; [0] not; empty PD (det 1) | Pass; r3 |
| 0.3 covolume | [4], I₂, rank 0 | √4 = 2 = interval volume; 1; 1 = √det [] | Pass; r3 |
| 0.4 shell comparison | [1] t = −1, 0; [2] t = 2 | cards 0 (sphere of radius √(−1) excluded), 1, 2 | Pass: t ≥ 0 guard; r3 |
| 0.5 dual, inverse action | A = [4]; I₂ with U | dual generator 1/4 ↦ 1, both norms 1/4; (UᵀU)⁻¹ = [[2,−1],[−1,1]] = U⁻¹U⁻ᵀ | Pass; dual citation repaired below; r3 |
| 0.5 block sums | [2]⊕[3], empty⊕[3] | det 6, (1,1) ↦ 5; [3] | Pass; r3 |
| 1.1 minimum, shells | diag(1,4), I₂, rank 0, [1] sublevels | min 1, S = {±e₁}, kiss 2, span dim 1; I₂ kiss 4; min 0, S = ∅; sublevels C = −1, 0, 1: ∅, {0}, {−1,0,1} | Pass; r3 |
| 1.2 native comparison | Gram [2], diag(1,4), rank 0 | minima 2 = 2, kissing 2 = 2; lengths 1, 2 square to 1, 4; 0 = 0 | Pass; r3 |
| 1.4 Vₙ and densities | n = 0,1,2,3,4,8,24; [4]; I₂; 4I₂ | Vₙ = 1, 2, π, 4π/3, π²/2, π⁴/24, π¹²/12! = 0.0019296; ρ = 1, δ = 1/2, Δ = 1; ρ = 1/2, Δ = π/4 → 4I₂: ρ = 1, Δ = π/4 | Pass; r3 |
| 1.4 density_le_one at n = 0 | empty form | V₀ = 1, δ = 0⁰/1 = 1, Δ = 1 ≤ 1 | Pass: no hn needed; r3 |
| 1.5 Hermite / center density | diag(1,4), [4], A₂ | γ = 1/2, δ = 1/8 = (γ/4)¹, Δ = π/8 = 0.392699; γ = 1, δ = 1/2 = (1/4)^{1/2}; γ = 2/√3 | Pass; r3 |
| 1.5 Bergé–Martinet | I₂, diag(1,1,4), A₂ | 1; γ = 0.62996, γ(dual) = 0.39685, γ′ = 0.5; γ′ = 2/√3 = 1.1547 | Pass; r3 |
| 1.6 integral comparison | [4], diag(1,4), A₂ | native minima 4; 1, 4 vs lengths 2; 1, 2; Hermite 2/√3 both | Pass; pinned `minimum_le_rpow_mul_determinant_rpow` at PosDef/Hermite.lean:81; r3 |
| 1.7 Minkowski | n = 1; [4]; I₂ | (4/π)Γ(3/2)² = 1.0000 = γ₁; (min)^{n/2}Vₙ = 4 = 2√det; π < 4 | Pass; r3 |
| 1.7 derived density | n = 1,2,3,4,8,24 | Vₙ(cₙ/4)^{n/2} = 1.000 each | Bound is exactly 1; strictness repaired below; r3 |
| 1.8 Hermite | [4], A₂, I₂ | 1 ≤ 1; 2/√3 = (4/3)^{1/2}; 1 < 1.1547 | Pass; rounding citation repaired below; r3 |
| 1.8 Hermite-derived density | n = 2,3,4,8,12,20 | 0.9069, 0.8061, 0.7311, 0.8898, 4.327, 18210 | Not a route to Δ < 1 in high rank; repaired below; r3 |
| 1.9 reduced family | diag(1/t,t), η = 1/4 | min 1/t ≥ 1/4 iff t ≤ 4; t = 5 fails | Pass; r3 |
| 2.1 range, Mordell | I₂, diag(1,4); n = 2, 3 | 1 ∈ range, 1/2 ∈ range; γ₂⁰ = 1 = γ₁; 2^{1/3} = 1.2599 ≤ 4/3 | Pass; r3 |
| 2.1 critical predicate | A₂, [a], I₂ | 2/√3 = γ₂; 1 = γ₁; 1 < γ₂ | Pass; r3 |
| 2.2 attainment cutoff | ε = γₙ | η = 0 admits diag(1/t,t) unbounded | Pass: ε < γₙ needed; r3 |
| 2.3 values | [a], A₂, A₃, I₃ | 1; 4/3; 8/4 = 2; 1 < 2 | Pass; r3 |
| 3.1 cell, relevant vectors | [4], I₂, A₂ | interval [−1/2,1/2] of volume 2; square of volume 1; coset e₁+2ℤ² shortest {±e₁} norm 1 (next 5); coset (1,1)+2ℤ² four shortest norm 2; A₂ coset e₁−e₂+2ℤ² shortest ±(e₁−e₂) norm 2, next ±(e₁+e₂) norm 6 | Pass; r3 |
| 3.2 radii | [4], I₂, rank 0 | ρ = μ = 1; ρ = 1/2 < μ = √2/2 = 0.7071, Θ = π/2; 0 = 0 | Statement passes; route repaired below; r3 |
| 3.3 Jarník | diag(1,4), [4], I₂ | 1 ≤ √5/2 ≤ 3/2 ≤ 2; 1 = 1 = 1; sublattice (1,1),(1,−1) bound √2 ≥ √2/2 | Pass; r3 |
| 3.4 covering values | I₃, A₂, Λ₂₄, rank 1, rank 0 | √3/2, π√3/2; √(2/3), 2π/√27; √2, V₂₄·2¹² = 7.903536 = 2¹²π¹²/12!; Θ = 1; Θ = 1·0⁰ = 1 | Pass; Leech text unread; r3 |
| 4.1 perfection | I₂, A₂, rank 0, 2A₂ | dims 2 < 3, 3 = 3, 0 = 0; equal shells but minima 2, 4 | Pass; r3 |
| 4.1 KZ bound | A₂, D₄, E₈, rank 0 | 6 ≥ 6, 24 ≥ 20, 240 ≥ 72, 0 ≥ 0 | Pass; r3 |
| 4.2 eutaxy | I₂, A₂, B, rank 0 | c = 1/2 = 2/(4·1); Q = 6A₂⁻¹, c = 1/6; B: outer products have (2,2)-entry 0, A⁻¹ has 2/5; 0/0 convention | Pass; r3 |
| 4.3 extremality | A₂, A(t) = [[1,t],[t,1]] | 2/√3 maximal; γ = 1/√(1−t²) > 1 = γ(I₂) | Pass; r3 |
| 4.4 finiteness | irrational A above; [a]; rank 0 | sublevel {0,±e₁,±e₂}, faithful; Aut = {±1}; trivial | Pass; r3 |
| 4.4 irreducibility route | A₂, U = [[−1,−1],[0,1]] | QA = 6I; UQ = [[−2,−2],[−2,4]] ≠ QU = [[−4,−6],[2,6]]; UQA = QAU | Pass; Venkov p.21 states the criterion; r3 |
| 4.5 Voronoi iff | A₂, I₂, B, rank 0 | T ↔ T∧T; F ↔ F∧T; F ↔ F∧F; T ↔ T∧T (empty matrix inverse is the empty sum) | Pass; r3 |
| 4.6, 4.7 finiteness | n = 0, 1, 2 | 1; 1; perfect 1 (A₂), eutactic 2 (I₂, A₂) | Pass; r3 |
| 4.9 facet normal / neighbour | P = A₂, N = [[0,−1],[−1,0]]; N = I₂; 2N | zero shell ±e₁, ±e₂ spans dim 2 = 3 − 1; min(P+tN) = 2 at t = 0, 1, 2 and 1 at t = 2.5, so ρ = 2, neighbour [[2,−1],[−1,2]] det 3 min 2 with ±(1,1); I₂ zero shell ∅; 2N gives ρ = 1 | Pass; r3 |
| 4.9 Ryshkov, domain | I₂, A₂/2, I₂/2; A₂ domain | active dims 2 < 3, 3, min 1/2 outside; (1/3)(e₁e₁ᵀ+e₂e₂ᵀ+(e₁−e₂)(e₁−e₂)ᵀ) = A₂⁻¹; I₂ coefficient (1,1,0) boundary; A₂ off-diagonal +1 outside | Pass; r3 |
| 4.9 rank one | P = [1], N = [1] | zero shell span 0 = 1 − 1; admissible {0}; ρ = 0 | Pass; no positive step asserted; r3 |
| 4.9 PSD normal impossible | n ≥ 2 | a PSD N vanishing on a spanning zero shell is 0, whose zero shell spans dim n(n+1)/2 ≠ n(n+1)/2 − 1 | Pass: ρ finite for facet normals; r3 |
| 4.10 completeness | s = ∅, {[1]} | excluded; meets the one class, max γ = 1 | Pass; r3 |
| 4.10 class counts | ranks 4–8 | 2, 3, 7, 33, 10916 = dsv2007 Table 1 lines 91–95 | Source check; r3 |
| 4.10 sharp values | D₄, D₅, E₆, E₇, E₈ | 2⁴/4 = 4, 2⁵/4 = 8, 2⁶/3 = 64/3, 2⁷/2 = 64, 2⁸/1 = 256 | Pass; r3 |
| 4.11 Cohn–Elkies | n = 1, f = (1−x²)e^{−πx²}, r = 1; 3f | f̂(0) = 1 − 1/(2π) = 0.840845; bound 0.594640 ≥ 1/2 = δ(ℤ); 3f same bound | Pass; scaling (r/2)ⁿ from g(x) = f(rx); r3 |
| 4.11 Leech | r = 2, f(0) = f̂(0) = 1 | δ ≤ 1; δ(Λ₂₄) = (√4/2)²⁴ = 1; γ = 4 | Pass; r3 |
| 5.1 designs, measure | {±1}, {1}, ∅; σ₁, σ₀, r = −1; Pol₀,₁,₂ on ℝ | averages 0, 1 = sphere 0, 1; fail; excluded; masses 1/2+1/2, 1, 0; dims 1, 2, 3 | Pass; r3 |
| 5.2 moments | {±1}; I₂ axes, a = e₁ | 2 = 2; 2 = 4/2; fourth 2 ≠ 3·4/(2·4) = 3/2 | 3-design, not 5; r3 |
| 5.2 k = 0 | antipodal X | j = 0: #X = #X; 1-design automatic | Pass; r3 |
| 5.3 strong eutaxy iff 2-design | A₂, B, rank 0 | T, T; F, F; vacuous vs empty shell | Pass: hn; r3 |
| 5.3 strongly perfect ⇒ perfect | A₃ vs D₄ | A₃ fourth moment 40 ≠ 192/5; D₄ 48 = 48 | Pass; r3 |
| 5.4 Gram Laplacian | A = I: 1, X₀², X₀²−X₁²; diag(1,4); E₈ | 0, 2, 0; 3/2, 0; E₈ Cartan inverse diagonal (4, 8, 14, 30, 20, 12, 6, 2), so X₀²−X₇² ↦ 2·4 − 2·2 = 4 and X₀²−2X₇² ↦ 0 | Pass; r3 |
| 5.5 Fourier identity | n = 1, P = x, τ = i; d = 2 | 𝓕(xe^{−πx²}) = −iξe^{−πξ²} = (i/i)^{−1/2}·i^{−1}·ξ·e^{−πξ²}; −1 | Pass; r3 |
| 5.6 harmonic theta | E₈: P = 1, 2, 0, odd P | constant terms 1, 2, 0; odd shells cancel | Pass; r3 |
| 5.6 rank 0 | L = 0, d > 0 | homogeneous P of positive degree is 0, theta 0 is a cusp form | Pass; r3 |
| 5.7 Venkov | (m, r) = (0,1), (0,2), (1,0); n = 24 degrees | t = 7, 3, 11; weights 14–22 cusp dims 0,1,1,1,1 < 2; weight 24 dim 2; weight 26 dim 1 | Pass; r3 |
| 6.1 universality | ℤ³, ℤ⁴, A₂, 2I₄, [2] | 7 missed; 7 = 4+1+1+1; norms 2 yes 1 no; half-norm universal, min 2; half-norms u² miss 2 | Pass; r3 |
| 6.2 escalation | [1]; 2ℤ⁴; Esc₁ | a ∈ {−1,0,1}, dets 1, 2, 1 → I₂, diag(1,2); rank kept, index 2; nine ternary classes = bhargava2000 line 1481 | Pass; r3 |
| 6.3 criterion | diag(1,2,5,5), diag(1,2,5,10) | only miss below 100 is 15; none | Pass; r3 |
| 6.4 half-norm | 2I₄, [2], A₂ | all 29 by four squares; half-norm 2 missing; norm 4 missing in A₂ | Pass; r3 |
| 7.1 tensor | A₂⊗A₂ | Gram as above, det 81 = 3²·3², rank 4 | Pass; r3 |
| 7.2 Kitaoka headline | A₂⊗A₂; [√2]⊗[3]; n = 0 or m = 0; A = B = [2], C = [1] | min 4 = 2·2, 18 minimal vectors; 3√2; `sInf ∅ = 0` gives 0 = 0·min; 1 ≠ 4 excluded by hC | Pass; r3 |
| 7.3 decomposability | ℤ⁴, A₂, E₈ vs A₂⊗D₄ | 4 = 2·2; prime rank; det 1 ≠ 1296 | Pass; r3 |
| 7.4 composition order | 2I₃, f = (12), g = (23) | (f·g)(e₁/2) = e₂/2, (g·f)(e₁/2) = e₃/2; q(eᵢ/2) = 1/4, b = 1/2; Lean `mul f g := g.trans f` is f ∘ g | Pass; r3 |
| 7.5 rank-one index | m = 3, 4, 5, 8, 12, 15 | residues {1,2}, {1,3}, {1,4}, {1,7}, {1,5,7,11}, {1,4,11,14}; indices 1, 1, 1, 1, 2, 2 | Pass; r3 |
| 7.5 hypothesis m ≥ 3 | m = 1, 2 | formula gives 0/2 = 0 and 1/2 = 0 while the index is 1 | Pass: hypothesis needed and present; r3 |
| worked bcc | displayed Gram | det 128 = 8³/4, min 6 = 8·3/4, 8 minimal vectors | Pass; r3 |
| worked E₈ density | E₈ | π⁴/384 = 0.253670 vs radius-1 value 4.058712 | Pass; r3 |


The tables contain 15 fresh rows and 66 carried rows.

**Headline inventory.** The unchanged acceptance file covers: real Minkowski/Hermite bounds; attainment and Mordell; sharp Hermite values through rank 8 and in rank 24; Voronoi cells, fundamental domains, deep holes and covering density; determination by minimal vectors, Korkine–Zolotarev and rationality; Voronoi's extreme-form criterion and perfect/eutactic finiteness; neighbour perfection/completeness and rank-4–8 class counts; Cohn–Elkies and the dimension-24 auxiliary function; moments, strong eutaxy/design equivalence and strong perfection; complex harmonic Gaussians, harmonic theta cuspidality and Venkov; low-rank nonuniversality, 15 and 290; Kitaoka; the rank-one Festi–Veniani index. Its docstring identifies the missing bundled integral tensor/decomposition and Leech carriers. The untouched headline assessment is inherited from r3; the repaired rationality and covering arguments agree with the retained signatures.

**Seeded source sample.** No added locator is marked unverified. I fetched arXiv:math/0609388v3 through the sources service and reopened dsv2007 lines 43–107. Lines 60–62, preprint p.2, define uniqueness among symmetric real solutions, exactly the input to the new rationality deduction. The v3 numbering matches the citation. Other unchanged source checks retain r3's certification and access limits.

| Seeded targets | Evidence and incremental disposition |
| --- | --- |
| 0.1, 1.1, 1.5 | Unchanged; dsv2007 lines 43–59 reopened, normalization values carried above. |
| 2.2 | Unchanged; resolved GoN §4.5.8 at its open head, including n≥2 and strictly positive cutoff. |
| 3.4 | Unchanged; inherited Conway–Sloane access limit below. The new strictness proof does not supply Leech classification. |
| 4.2 | Unchanged; dsv2007 lines 65–68 reopened. |
| 4.4 | Unchanged; r3's venkov2001 lines 2427–2446, printed pp.20–21, carried. |
| 4.6 | Consumer of rationality; dsv2007 lines 83–84 reopened with similarity normalization; README:1129–1134 bounded-shell route read. |
| 4.9 | Unchanged; dsv2007 lines 72–84 reopened; Schürmann remains uncertified. |
| 5.1, 5.2 | Unchanged; r3's venkov2001 lines 1175–1200, printed p.11, carried. |
| 5.5 | Dependency closure of 5.4; reread GoN §4.3's real-parameter Fourier identity and harmonic decomposition. Complex continuation is owned here. |
| 5.6 | Unchanged; r3's venkov2001 lines 8251–8259, printed p.59, carried. |
| 6.3 | Only dependency row changed; r3's bhargava2000 lines 1696–1718, §6(ii)–(iii), printed p.31, carried. |
| 7.5 | Dependency closure of 7.4; half-norm/index values recomputed. r3's festiveniani lines 109–120, §2.1, p.3, carried. |

**Pinned declarations reopened.** Mathlib pin f6090c7095e1e56b3464c1daba5f24631f1290d2; Tau Ceti pin 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. Paths are relative to their library roots.

| File:line | Declaration and boundary |
| --- | --- |
| Mathlib/Algebra/Order/Round.lean:193 | abs_sub_round: rounding error at most 1/2, specialized to ℝ. |
| Mathlib/Algebra/MvPolynomial/PDeriv.lean:61 | pderiv is a derivation over a commutative semiring. |
| Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:87 | homogeneousSubmodule has carrier the homogeneous polynomials of the chosen degree; no harmonicity built in. |
| TauCeti/LinearAlgebra/IntegralLattice/Even.lean:67 | IsEven requires every integral self-norm to be even. |
| TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Group.lean:109, 127, 165 | DiscriminantGroup is the dual-carrier quotient; finiteness needs nondegeneracy; discriminantGroupEquiv comes from an isometry. |
| TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Bilinear.lean:96, 103 | discriminantPairing is the form on representatives modulo ℤ. |
| TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.lean:122, 129 | discriminantQuadraticMap requires evenness and uses half the self-pairing modulo ℤ. |
| TauCeti/LinearAlgebra/FiniteBilinearModule/Basic.lean:262 | Isometry is an additive equivalence preserving the pairing; the quadratic refinement is separate. |

Eight library files were reopened for revised references. The remaining pinned audit is inherited from r3, with the unchanged Lean file elaborated again. The resolver reported no missing cross-roadmap target but did not inspect library pins; the local pinned-source checks above supply that evidence.

**Ownership and supplier resolution.** Object searches were rerun with roadmaps grep over main/open work and rg over both pins. Focused perfect-form/eutaxy/Ryshkov/Gram-Laplacian/Festi searches found no competing construction: other hits concern perfect pairings, unrelated étale forms, or a bibliography entry. The Gram adapter consumes GoN's orthonormal theory; rationality and strict cell geometry belong to this roadmap's existing layers. No new declaration name is introduced. The board index lists five unrelated areas; its prior ownership assessment is carried from r3, without a new claim about unprovided package contents.

| Supplier | Resolved object / location |
| --- | --- |
| TauCetiRoadmap/ThetaSeries/README.md:423, 489; Suggested.lean:82 | Layer 1 dual and Poisson machinery; §2A dual fullness/involution; dual is literally inner-product dualSubmodule. |
| TauCetiRoadmap/ModularForms/README.md:259, 318, 327, 383, 532, 585, 638 | Character spaces/decomposition, valence, Hecke theory, newforms and bad-prime eigenvalues. R01 corrects the one layer label. |
| TauCetiRoadmap/GlobalQuadraticForms/README.md:443, 694 | Main §4.4 Hilbert product/sign theory and §6.1 representation of nonzero scalars by regular forms; not integral local representation by itself. |
| TauCetiRoadmap/WeightsInEtaleCohomology/README.md, §6.1 | Good-prime Ramanujan for normalized cuspidal newforms, k≥2 and every complex embedding; weight two is covered. |
| TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md, §§4.3, 4.4.2, 4.5.8 | Real harmonic Fourier transform, Fischer decomposition and sphere span; covering radius; Mahler compactness. |
| TauCetiRoadmap/IntegralLattices/README.md:562, 599, 609, 619, 642, 772–813, 1273, 1655–1680 | Main §§0F, 1B–1D, 1G, 2A–2G, 4A and 6C–6G: splitting, discriminants, reduction, genera and ADE inputs. |
| Completed/IntegralLattices/README.md:258, 327 | Finite bilinear/quadratic modules and Layer 5 ADE construction for 4.10. |
| TauCetiRoadmap/Rank24LatticeConstructions/README.md:312–369 | Layer 6 Leech construction and minimum-four witness. |
| TauCetiRoadmap/SuccessiveMinima/README.md, §§1.1, 1.5, 2.1.4 | Body minima, independent real-basis witnesses and lower Minkowski inequality. |
| TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md, §4 | Existing automorphism-order and class-count boundary. |

These are main versions where already merged, otherwise the supplied open-head service. The service's bare IntegralLattices lookup also returned the completed roadmap; active citations were checked directly in the actual main file. All consumed suppliers are on main or earlier in the candidate order. No new gap is needed. All Needs lines were reread; revised rows for 0.5, 1.8, 4.10, 4.11, 5.4, 6.3 and 6.4 agree, and 7.4 now names its native inputs.

## Not verifiable

No newly changed claim required an unavailable text. These access limits are inherited from r3, not reopened requests; no manifest was edited:

- kitaoka1993, Theorem 7.1.1: Cambridge landing page only; r3 checked the rank-43 assertion through Coulangeon–Nebe and tensor examples.
- conwaysloane1999, Chapters 21 and 23, and cassels1971: publisher paywalls. Leech deep-hole classification and covering radius remain uncertified from the primary text.
- martinet2003, Chapters 2, 3, 9 and 16: author-hosted contents only. The new rationality deduction does not require this book.
- steinweiss1971, gruber1987, schuermann2009 and voronoi1908: r3 records no legal full text found by the sources service; untouched claims retain that qualification.
- LMFDB knowls: r3 records a CAPTCHA; no new live-database assertion was audited.

## Source issues

The dsv2007 entries were rechecked at lines 82–84. The other two are carried from r3. No new source error was found in the changed passages.

- **Error** in dsv2007 at §1, preprint p.2: the source says congruence A=PᵀBP transports the perfect domain by P on the left and Pᵀ on the right; it should be P⁻¹ Dom(B) P⁻ᵀ, since minimal vectors transform by P⁻¹; affects a stated result.
- **Misprint** in dsv2007 at §1, preprint p.2: the source says finitely many arithmetic equivalence classes of perfect forms occur in each dimension; it should be similarity classes, or arithmetic classes after fixing the minimum; affects a stated result.
- **Misprint** in ash1977 at Theorem 3, printed p.1052: the source says finitely many Γ-orbits of eutactic and perfect points occur in the cone; it should be positive-scaling-and-Γ orbits, since the properties depend on rays; affects a stated result.
- **Misprint** in ckmrv2017 at Theorem 1.2, printed p.1018: the source says the Schwartz function takes values in ℝⁿ; it should be scalar-valued; affects nothing.
