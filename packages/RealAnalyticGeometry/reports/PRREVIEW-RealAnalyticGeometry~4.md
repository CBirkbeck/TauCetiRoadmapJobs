# Review of RealAnalyticGeometry (pull request #2634 at d0c01bf)

**Verdict:** accepted

**Summary.** Accepted: an independent full pass over the unchanged head found no finding. Every Check was recomputed, the sampled locators were read in Łojasiewicz, Whitney–Bruhat, Demailly and Forstnerič, `Suggested.lean` elaborates with `sorry` as its only warning, and no single tactic closes any of its eight theorems. Four small corrections and one format note remain, none blocking: the two of the previous review (Grauert 1958 without theorem number or page; §5.3 without the input that makes its pieces semianalytic), the count of the steps of Łojasiewicz's §4, and the narrowing of the weighted theorem to positive definite curvature. Nothing is left for a human to decide.

## C01 — Grauert's theorem and the Stein criterion cite Grauert 1958 without a theorem number or page

§3.0 (line 1082) and §4.2 (line 1529) give "(Grauert, 1958)", the docstrings of `isStein_of_strictlyPlurisubharmonic_exhaustion` (line 271) and `grauert_proper_real_analytic_embedding` (line 347) give "Grauert 1958", and the References give only the page range 460–472. The paper is cited by its locator alone, so the locator is all a reader has to tell which of its statements each place relies on: the p-function, the exhaustion criterion, or the embedding. Add the theorem number and page for each statement used.

## C02 — §5.3 does not cite the input that makes its pieces semianalytic

§5.3 (lines 1612–1617) asserts that the images of the open simplices are semianalytic and attributes "the semianalytic compatibility" to §1.0a; its *Needs:* line lists only §§1.0a and 5.2. §1.0a supplies dimensions and frontiers, not the semianalyticity of `τ(σ)`.

That follows from property (A) of `τ` and the semialgebraicity of an open simplex: the graph of `τ` over `σ` is partially semialgebraic, and its projection to the base is semianalytic by `TauCeti.IsPartiallySemialgebraic.isSemianalytic_image_fst` (`Geometry/RealAnalytic/Semianalytic/PartiallySemialgebraic/Projection.lean`, line 155), read in charts. Łojasiewicz makes the same remark right after defining property (A) (§3, p. 463). Add the declaration to the *Needs:* line of §5.3 and the p. 463 locator to its statement.

## C03 — Łojasiewicz's §4 has five steps, not four

The opening of Layer 2 says the sections "treat Łojasiewicz's Lemmas 1–15 (§2) and the four steps of his §4" (lines 417–418), and Scope and ownership repeats "the four steps of his §4" (line 1653), as does the description of the pull request. The proof in §4 is numbered I to V: step V, "Triangulation" (p. 473), applies Lemma 15 to the cellular complex of step IV and concludes Theorem 1. The roadmap does cover it, in §2.0h, but a reader matching sections to the source looks for a fifth step that the text says does not exist. Write "the five steps of his §4" in the three places, or "steps I–IV, and step V in §2.0h".

## C04 — The weighted theorem is stated for positive definite `B`, while the theorem cited covers semi-positive curvature

§3.1 (lines 1137–1140) assumes "`B` is positive definite at every point" and cites Demailly, Chapter VIII, Theorem 4.5. That theorem (p. 371) assumes only that the curvature operator is semi-positive in the bidegree considered, with `⟨B⁻¹f, f⟩` read at each point as the least `α` with `|⟨f, u⟩|² ≤ α⟨Bu, u⟩` for all `u`, and reaches the same estimate. Every use made of the theorem in §§3.1–3.2 has `B ≥ Id`, so nothing stated is affected; but a consumer needing the degenerate case (a weight that is only plurisubharmonic) would find the cited source proving more than the target. Either state the semi-positive form with that convention for `⟨B⁻¹f, f⟩`, the positive definite case being the one used here, or add a clause saying that the restriction is deliberate and where the semi-positive form is left.

## N01 — The second Check of §2.1 counts the cells of one triangulation as if of all

"`B_1` is the image of two open edges and one vertex" (lines 914–916) holds for the triangulation with vertices `0`, `1/2`, `1`; a finer compatible one has more. "In the triangulation with vertices `0`, `1/2`, `1`" would say which is meant.

## Earlier findings

The previous review, of this same head, had no finding and two small corrections; the head is unchanged.

- C01 — not repaired: "(Grauert, 1958)" still stands at lines 1082 and 1529; carried as C01 above.
- C02 — not repaired: the *Needs:* line of §5.3 is still "§§1.0a, 5.2." (line 1617); carried as C02 above.

## Deferred findings

- D01 — stands

## Verified sound

| Target | Instances tried | Roadmap side (computed) | Source or library side (computed) | Result |
|---|---|---|---|---|
| 0.1 germs and complexification | chart `x ↦ x³`; `S¹` | `x` reads as `y^(1/3)`, not analytic at 0; transition `t ↦ 1/t` complexifies to `z ↦ 1/z` | W–B §1, p. 133: complex `n`-manifold, charts sending the real part to `ℝⁿ` | sound |
| 0.2 chartwise submanifolds (Lean) | cross `xy = 0`; `M = ℝⁿ` | cross fails at 0; `U ⊆ e '' target`, nonempty asked | `IsAnalyticSubmanifold` (Basic.lean:238): nonempty, `d ≤ n`, charts | sound |
| 1.0 normal decomposition | `x² − y²` at 0 | 9 pieces (1 + 4 + 4); sign-condition components 5 (cross, 2, 2) | p. 452, II.2 frontier; II.4 `c` in closure of every member | sound |
| 1.0a local dimension | `A = {(1,0)}`, `x = 0`, discs of radius ½ and 2; umbrella | `−∞` on both with the closure clause, `0` on the large disc without it; `closure(T₊) ∩ S = {z ≥ 0}` | p. 452, II.4 | sound |
| 1.1 Nash germs | `√(1+x)`; `exp` | `4a⁴ − 4(1+x)a² − y² = 0`, at `y = 0`: `4a²(a² − 1 − x)`; root bound `1 + max|aᵢ/a_d|` polynomial | p. 454, §1.VI: analytic-algebraic functions, bounded locally semialgebraic is semialgebraic | sound |
| 2.0 normal boxes | `k = n`, `k = 0` | `Vⁿ = {H^(n−1)_n ≠ 0}` open; `V⁰` all vanish | p. 451 `V^k`, `H₀⁻¹ = 1`; p. 452 II.3 graphs, II.5 `k ≤ m`; p. 453 III.2 `H = 0 ⟺ F = 0` | sound; source issue |
| 2.0a Lemmas 1–4 | `f = y`; `f = exp y` | singular only `u₂ = v₂ = 0`; none for `exp` | pp. 455–457: Lemma 2 `u ∉ S_u`, Lemma 3 meagre, Lemma 4 dense | sound |
| 2.0b Lemmas 5–7 | `sin t = 0`; `t² − u`, `t² + u`; shear | fibres `πℤ`; `π{f = 0} = [0, ∞)`; `|Δu + zΔt| ≥ (1 − A|z|)|Δu|` | p. 457 Lemma 5 bounded; p. 458 prints `|z| < A`; Topographic.lean:293 has `A‖z‖ < 1`, `A/(1 − A‖z‖)` | sound; source issue |
| 2.0d Lemma 10 | `(2,3)`, `h = 2 + t²`; `h ≡ 1` | `(22, 3)`, `3/√485 < 1`; `3/√5 > 1`; `β′ = sinh 1/√(1 + s² sinh² 1) ≤ 1.18` | pp. 459–460: conditions 1°–6°, `h > γ⁻¹√(t² − 1)`, `|h′| < 1/a_ν` | sound; source issue |
| 2.0e step I | member of dimension `n − 2`; planes `M × {±1}` | tail empty; planes unbounded, bounded over bounded base | p. 465 (1) bounded, (3) `dim Γ < n`; p. 466 adds the planes | sound; source issues |
| 2.0f steps II–III | diagonal pair | complement `(M ∖ πΓ) ∪ {|Γ| ≥ 2}`: closed and unbounded, compact | p. 468 calls both compact | sound; source issue |
| 2.0g step IV | `τ = f⁻¹ ∘ τ*` | (A⁻¹) for `h`, inverse has (A); substitution `y = f(z)` in coefficients only | p. 463 footnote: bijection has (A) iff inverse has (A⁻¹); pp. 471–473 | sound |
| 2.0h Theorem 1 (Lean) | `n = 0`; `B = ℤ`; `sin` | one face `{0}`, `card − 1 = 0`; infinitely many simplices; `sin` has (A⁻¹) not (A) | pp. 463–464 (a)(b)(c); `empty_notMem` (SimplicialComplex/Basic.lean:73) | sound; C03 |
| 2.1 Theorem 3 (Lean) | `k = 0`; `y = |x|`; `(0,1)`, `{½}` | empty complex; vertex at corner; vertices `0, ½, 1` | p. 464: finite `K` in `M`, semialgebraic `τ` onto `⋃ B̄ᵢ`, (b)(c) | sound; N01 |
| 2.1a projector | `n = 1` | `a² + b² = a`; `(cos²θ, cos θ sin θ)`; `A_ji/A_ii = x_j/x_i` | p. 464 prints `i, j = 1..n`, `ℝ^(n²)`, `x = (x₀..xₙ)` | sound; source issue |
| 2.1b Theorem 4 (Lean) | `m = 0`; `ℝP¹` | one point, chart in `ℝ⁰`; at least 3 vertices | p. 464: finite `K`, semialgebraic onto `M`, (b)(c) | sound |
| 3.0 complexification and tube | `(Im z)²`; `S¹`; `ℂ² ∖ {0}` | `i∂∂̄p = dx ∧ dy`; `z ↦ 1/z̄` fixes `|z| = 1`; hull of sphere is ball minus 0 | W–B Prop. 1, pp. 133–135: paracompact, covers `V ⋐ U ⋐ T`, disjoint buffers | sound |
| 3.1 weighted theorem | `ℂ`, `s = 1`; `ℂⁿ` | `2π∫dρ/ρ = ∞`; `|z|^(2m−2s)` integrable iff `m > s − n` | Demailly VIII 3.2 (p. 368) density; 4.5 (p. 371): complete, `A ≥ 0`, `g ∈ L²`, (4.4) | sound; C04 |
| 3.1 Stein criterion (Lean) | dimension 0; `ℂ² ∖ {0}` | finite `K`: hull `= K`; sublevels of `|z|² + |w|²` not compact | `IsManifoldStrictlyPlurisubharmonicAt` (LeviForm.lean:343) | sound; C01 |
| 3.2 Cartan A and B (Lean) | `F = 0`; `ℤ ⊂ ℂ`; `ℂ² ∖ {0}` | empty family; `sin(πz)`, simple zeros; `1/(zw)` not a coboundary | `GeneratingSections` (Generators.lean:44), `IsFiniteType` (:142), `Sheaf.H` (SheafCohomology/Basic.lean:57) | sound |
| 3.2 block gluing | `T₁(f,0)`, `T₂(0,g)` | `(f, γ₁f) = (f, g) = (γ₂g, g)` | — | sound |
| 4.1 tube embedding | corank 1, 2; `L_i ⊆ A_j` | surplus `k² − k + 2` = 2, 4; `b_i < a_i < b_j`, `‖h‖ = a_j > b_(j−1)` on `∂P_j` | Forstnerič Th. 2.1(a) `N > 2n`, (d) residual; p. 4 `P_j`, `a_j D^n` | sound |
| 4.2 Grauert (Lean) | `n = 0`; `M = ℝ`; arctan circle | discrete set into `ℝ²`; `ℝ⁶`; image misses `(−1, 0)` | Grauert 1958 not readable | sound; C01 |
| 5.1 realization | star of edges to `(1, 1/k)` | `x_k = (1/k, 1/k²) → 0`, weakly closed | `isEmbedding_realization_coe_of_finite_vertex_stars` (LocallyFinite.lean:55) | sound |
| 5.2 Theorem 2 (Lean) | `S¹` with a point; empty `M` | at least 3 vertices; `[Nonempty M]` for the total map | p. 464: countable manifold, `K` in an affine space, (a)(b)(c) | sound |
| 5.3 frontier stratification | images `τ(σ)` | semianalytic by (A) and projection, not by §1.0a | `isSemianalytic_image_fst` (Projection.lean:155); p. 463 | C02 |
| Not statable: Stein tube, Hörmander | pins searched | no complexification carrier; no `L²` bundle-valued forms | docstring lines 43–50 name both | sound |

- Source locators checked against the text: 27 (Łojasiewicz §1.II–VI, Lemmas 1–15, Theorems 1–4, §4 steps I–V; pages 451, 452, 453, 457, 458, 460, 464 and 465 also on page images; Whitney–Bruhat §1 Prop. 1; Demailly VIII 3.2 and 4.5; Forstnerič Th. 2.1, Prop. 2.2, p. 4).
- Library declarations located at the pins with file and line: 36, nine of them read in full, among them `IsAnalyticSubmanifold`, `AnalyticOnSubmanifold` (Submanifold/Basic.lean:238, 308), `PartiallySemialgebraicAt`, `IsPartiallySemialgebraic` (PartiallySemialgebraic.lean:447, 628), `dist_le_mul_dist_tail_of_mem_image_horizontalShear` (Topographic.lean:293), `semialgebraicDim_eq_finrank_of_chartedSpace` (Dimension/Manifold.lean:40), `smoothSheafCommRing` (Sheaf/Smooth.lean:294).
- Cross-roadmap citations resolved on main: ComplexKahlerGeometry §§2.5, 3.1, 3.2, 3.4, 4.1, 4.2, 5.1, 5.7, 5.9, 6.1, 6.4, 7.1; AffineMorseLefschetz §§5.1–5.8; ComplexManifolds Milestones 5 and 7; GeometricTopology §1.5; AlgebraicTopology §4.6; SmoothBundlesConnections B2.1–B2.2; RealAlgebraicGeometry Layers 1, 2, 4, 6, 7.
- Dependency check: `depcheck: 196 roadmaps, 2157 edges, 0 problem(s)`; every supplier is on main. The mutual use with ComplexKahlerGeometry is acyclic by section: §1.0 needs its §3.2, its §3.4 needs §§1.0–1.0a, §2.0a needs its §3.4.
- Automatic checks: all passed on this head; nothing changes outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with eight `sorry` warnings and no error; the file has no `variable` line, so no binder can be lost, and `#check @` of all 23 declarations agrees with the README statements.
- One-tactic probe: `simp`, `rfl`, `infer_instance`, `trivial`, `constructor <;> simp`, `simp_all` and `aesop` close none of the eight theorems.
- Description: 30 Checks counted, eight Tau Ceti imports, the 17 removed declarations all named, the anchor change stated.

Overlap check: read AffineMorseLefschetz, ComplexKahlerGeometry and RealAlgebraicGeometry on main and StratifiedSpacesAndTameTopology, ComplexComparisonPartII and Hyperfunctions at their open heads. Finite semialgebraic triangulation and semialgebraic dimension: AffineMorseLefschetz §5.1, cited here. O-minimal triangulation: StratifiedSpacesAndTameTopology, which cites §2.1 for the bounded case. Semianalytic decomposition, Łojasiewicz's theorems, complexification, the Stein predicate, coherence predicate and Cartan A/B: this roadmap, cited by the others. Holomorphic structure sheaf: ComplexKahlerGeometry §4.1. One-variable hull: GlobalHolomorphicFunctions, under its own namespace.

Source independence: 13 passages compared by hand with 4 sources (Lojasiewicz1964, WhitneyBruhat1959, DemaillyAgbook, Forstneric2018), none shared beyond standard names and forced hypothesis lists; largest share Lojasiewicz1964, 25 of 41 locators; contents compared with Lojasiewicz1964: §§2.0a–2.0h follow its Lemmas 1–15 and steps I–V in the order their *Needs:* chain forces (each needs its predecessor, §2.0f needs Theorem 1 one dimension lower), grouped in the roadmap's own units; Layers 0, 3, 4, 5 and §§1.1, 2.1–2.1b have no counterpart: independent.

Research link: Theorems 1–4 are Łojasiewicz's 1964 simultaneous triangulation of locally finite semianalytic families, answering the question of Lefschetz, Koopman–Brown and Lefschetz–Whitehead (1930–33); Layers 3–4 give Cartan's theorems and Grauert's 1958 embedding, which the manifold theorem uses. Rests on Lojasiewicz1964 lines 25–42 and the README's consumers section.

## Not verifiable

- Grauert1958 (*Annals* 68): uncertified, not readable; bears on §3.0's p-function, the attribution of the Stein criterion and §4.2.
- Hormander1965 (*Acta* 113): uncertified; the second citation of §3.1.
- Hormander1990, Chapter VII, (7.2.2)–(7.4.3): uncertified; the locators of §3.2 and of the Cartan docstrings.
- Łojasiewicz states §1 without proof, so §§1.0, 1.0a and 2.0 and Lemma 9 were checked against statements only.
- Ownership against open pull requests was checked by search over their heads and by reading the three closest; the others were not read in full.

## Source issues

- **Error** in Lojasiewicz1964 at Lemma 6, printed p. 458 (used again in §4, step I, p. 466): the source says the shear by `z` keeps an `A`-Lipschitz graph topographic when `|z| < A`; it should be `A|z| < 1`, since `t = 2u` sheared by `z = −½` becomes a vertical line; affects a stated result.
- **Misprint** in Lojasiewicz1964 at §4, step I, condition (3), printed p. 465: the source says the tails are empty when `dim Γ < n`, with every member of dimension at most `n − 1`; it should be `dim Γ < n − 1`; affects the proof.
- **Error** in Lojasiewicz1964 at §4, step I, condition (1), printed pp. 465–466: the source says every member is bounded, yet the family it builds contains the hyperplanes `M × {1}` and `M × {−1}`; it should ask boundedness over bounded subsets of the base; affects the proof.
- **Misprint** in Lojasiewicz1964 at §4, step II, printed p. 468: the source says the complement of the domain of a graph member and the set where its height is at least 2 are both compact; the first is only closed, which is all the step uses; affects nothing.
- **Misprint** in Lojasiewicz1964 at Theorem 4, proof, printed p. 464: the source says the projector map uses indices `1, …, n` into `ℝ^(n²)` for `x = (x₀, …, xₙ)`; it should use `0, …, n` and `ℝ^((n+1)²)`; affects the proof.
- **Misprint** in Lojasiewicz1964 at Lemma 10, proof, printed p. 460: the source says `|β′(t)| ≤ min(2, 1/t)`; it should be `min(2, 1/|t|)`; affects nothing.
- **Misprint** in Lojasiewicz1964 at §1.III.2, printed p. 453: the source says `V^(n−1)` equals the zero set of `F`; it should be the union `V^(n−1) ∪ … ∪ V⁰`, the locus `H^(n−1)_n = 0`, as its own parenthesis says; affects nothing.

## For the human reviewers

- none
