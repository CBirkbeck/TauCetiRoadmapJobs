# Review of RealAnalyticGeometry (pull request #2634 at d0c01bf)

**Verdict:** accepted

**Summary.** Accepted: no finding remains, and both findings of the previous review are repaired. The local dimension of §1.0a is now well defined, since every piece of a §1.0 decomposition has the base point in its closure (Łojasiewicz §1.II.4, p. 452); Cartan's theorems A and B are now stated in `Suggested.lean`, where they elaborate, no single tactic closes them, and a Mathlib instance meets theorem B's `HasExt` hypothesis. Two small corrections remain (Grauert 1958 is still cited without a theorem number or page, and §5.3 does not cite the input that makes its pieces semianalytic), and there are no format notes. Nothing is left for a human to decide.

## C01 — Grauert's theorem and the Stein criterion still cite Grauert 1958 without a theorem number or page

This is carried over from the previous review and is not yet repaired. §3.0 (line 1082) and §4.2 (line 1529) give "(Grauert, 1958)". The docstrings of `isStein_of_strictlyPlurisubharmonic_exhaustion` (line 271) and `grauert_proper_real_analytic_embedding` (line 347) give "Grauert 1958", and the References give only the page range 460–472. The paper is paywalled and is cited by its locator alone. That locator is the only way a reader can tell which of its statements each section relies on: the p-function, the strictly plurisubharmonic exhaustion criterion, or the embedding. Add the theorem number and page for each statement used.

## C02 — §5.3 does not cite the input that makes its pieces semianalytic

§5.3 (lines 1612–1617) asserts that the images of the open simplices are semianalytic. It attributes "the semianalytic compatibility" to §1.0a, and its *Needs:* line lists only §§1.0a and 5.2. But §1.0a supplies dimensions and frontiers, not the semianalyticity of images under `τ`.

The images are semianalytic for a different reason: `τ` has property (A) and an open simplex is semialgebraic. Read in charts, the projection rule `TauCeti.IsPartiallySemialgebraic.isSemianalytic_image_fst` (`Geometry/RealAnalytic/Semianalytic/PartiallySemialgebraic/Projection.lean`, line 155) applies; it needs no hypothesis beyond partial semialgebraicity. Łojasiewicz makes the same observation in §3, p. 463, right after defining property (A).

Add that declaration to the *Needs:* line of §5.3, and the p. 463 locator to its statement.

## Earlier findings

- R01 — repaired. §1.0 now asks that "`x` lies in the closure of every piece (Łojasiewicz, §1.II.4, p. 452)" (lines 239–240). The Shrinking bullet keeps this (line 283), and a Check records the two-neighbourhood example (lines 313–317). The page image of p. 452 confirms that every member `Γ^k_κ` has `c` in its closure.
- R02 — repaired. `IsCoherentAnalyticSheaf`, `nonempty_generatingSections_of_isStein` and `subsingleton_sheafH_of_isStein` are stated (`Suggested.lean`, lines 281–323) and elaborate. The docstring no longer lists Cartan A/B as not statable, and §3.2, item 0 names the predicate (line 1285).
- C01 — repaired: "the locus `V^k` where … vanish and the next one, `H^(k−1)_k` in the coordinate `x_k`, does not" (lines 431–433).
- C02 — repaired: tails are "empty for members of dimension below `n − 1`" (lines 685–687).
- C03 — repaired: "Prove only the assembly", citing `TauCeti.semialgebraicDim_eq_finrank_of_chartedSpace` (lines 367–374).
- C04 — repaired: "GlobalHolomorphicFunctions proves the one-variable case … and takes nothing from §3.2" (lines 1640–1641).
- C05 — repaired: the description now says that §3.1 "keeps the hypothesis that the datum `f` is square-integrable for the weight".
- C06 — not repaired; carried over as C01 above.
- N01 — repaired: "§1.1 states only what these do not cover." (line 1688).

## Deferred findings

- D01 — stands

## Verified sound

| Target | Instances tried | Roadmap side (computed) | Source or library side (computed) | Result |
|---|---|---|---|---|
| 0.1 germs and complexification | chart `x ↦ x³`; `S¹`, stereographic | `x` reads as `y^(1/3)`, not analytic at 0; transition `t ↦ 1/t` complexifies to `z ↦ 1/z` | W–B §1, p. 133: complex `n`-manifold, real iso onto submanifold, charts sending it to `ℝⁿ` | sound |
| 1.0 normal decomposition (closure clause) | `x² − y²` at 0; `A = {(1,0)}`, `f = (u−1)²+v²`, `V = B(0,2)` | 9 pieces, each with 0 in closure; the partition `{(1,0)}`, rest is now excluded (0 ∉ closure) | p. 452, II.4: `c ∈ closure(Γ^k_κ)` for every member (page image) | sound (R01) |
| 1.0a local dimension | same `A`; decompositions on two discs | `dim₀ A = −∞` on every admissible `V`; a `k`-piece in `A` meets every smaller `V′`, forcing a `D′`-piece of dim `≥ k` | II.4 as above | sound |
| 1.0 route, roots tend to `x` | `P = t² − u` at 0 | roots `±√u → 0`; all three sectors over `u > 0` and the one over `u < 0` have 0 in closure | p. 452, II.3: `lim η_j(u) = 0` | sound |
| 2.0 normal boxes | `k = n`, `k = 0` | `V^n = {H^(n−1)_n ≠ 0}`; `V⁰` = all vanish = `{0}` | p. 451 `V^k`; p. 452 II.4 `Γ⁰ = {0}`, II.5 projection | sound |
| 2.0a Lemmas 1–4 | `f = y`; `f = exp y` | singular set `{[1:0]}`; none (exp never vanishes) | pp. 455–457: Lemma 3 meagre in `P`, Lemma 4 dense | sound |
| 2.0b Lemmas 5–7 | `sin t = 0`; `f = t² − u`, `g = t² + u`; `t = 2u`, `z = −½` | fibres `πℤ`; `π{f=0} = [0,∞)`; `{fg=0}` has (P); README asks `A|z| < 1` (here `= 1`) | p. 457 Lemma 5 needs bounded; p. 458 prints `|z| < A`: image is the line `u′ = 0` | sound; source issue |
| 2.0e step I tails | member of dim `n − 2`; planes `M × {±1}` | tail empty; planes have empty tails and are unbounded | p. 465 (3) prints `dim Γ < n` with `dim M = n − 1`; (1) says bounded; p. 466 adds planes | sound; source issues |
| 2.0f steps II–III | diagonal pair, `Γ` over open `πΓ` | complement = `M ∖ πΓ` (closed, unbounded) ∪ `{|Γ| ≥ 2}` (compact) | p. 468 calls both compact | sound; source issue |
| 2.0h Theorem 1 (Lean) | `n = 0`; `n = 1`, `B = ℤ`; `sin` | `K = {{0}}`, `card − 1 = 0`; vertex at each `τ⁻¹(k)`; `sin` has (A⁻¹), not (A) | pp. 463–464: (a)(b)(c); (A) = polynomial in source | sound |
| 2.1 Theorem 3 (Lean) | `y = |x|`; `(0,1)`, `{½}`; `k = 0` | vertex at `(0,0)`; vertices `0, ½, 1`; `B₁` no subcomplex; empty complex | p. 464: finite `K` in `M`, semialgebraic `τ : |K| → ⋃ B̄ᵢ`, (b)(c) | sound |
| 2.1a projector | `n = 1` | locus `a² + b² = a`; `(cos²θ, cosθ sinθ)` on it; sign of `b` separates | p. 464 prints indices `1..n`, `ℝ^(n²)`, `x = (x₀..xₙ)` (page image) | sound; source issue |
| 2.1b Theorem 4 (Lean) | `m = 0`; `ℝP¹`, no `B` | point, chart `ℝ⁰`; at least 3 vertices | p. 464: finite `K`, semialgebraic onto `M`, (b)(c) | sound |
| 3.0 complexification and tubes | `S¹`; `p = (Im z)²`; `ℂ² ∖ {0}` | `ℂ*`, `z ↦ 1/z̄`, fixed `|z| = 1`; `i∂∂̄p = dx∧dy`; hull of sphere = ball minus 0 | W–B Prop. 1, pp. 133–134: paracompact ⇒ exists; covers `V ⋐ U ⋐ T`, buffers `A*`, `B*` | sound |
| 3.1 weighted theorem | `ℂ`, `s = 1`; `ℂⁿ` jets | `∫|z|⁻² = 2π∫dρ/ρ = ∞`; `|z|^(2m−2s)` integrable iff `m > s − n` | Demailly VIII Th. 4.5, p. 371: complete, `A ≥ 0`, `∫⟨A⁻¹g,g⟩ < ∞`; Th. 3.2, p. 368 | sound |
| 3.1 Stein criterion (Lean) | dim 0; `ℂ² ∖ {0}`, `|z|²+|w|²` | countable discrete: `hull K = K`, `hull ∅ = ∅`; sublevel ball∖0 not compact | `IsManifoldStrictlyPlurisubharmonicAt` (LeviForm.lean) | sound |
| 3.2 coherence predicate (Lean) | `F` = unit sheaf; K4's `R` | unit sheaf typechecks; finite type plus finite-type kernels of `𝒪_U^q → F|_U` | CKG §4.1: `R` = `smoothSheafCommRing` ∘ `forget₂`; `IsFiniteType` (Generators.lean:142) | sound |
| 3.2 Cartan A (Lean) | `F = 0`; `ℤ ⊂ ℂ` | `I = ∅` works; `sin(πz)`, derivative `±π` at integers | `GeneratingSections` (Generators.lean:44): epi from free on global sections | sound |
| 3.2 Cartan B (Lean) | instance `w`; `ℂ² ∖ {0}` | applied with no instance given, it elaborates via `HasExt.{0}`; `z⁻¹w⁻¹` in neither `O(U₁)` nor `O(U₂)` | `IsGrothendieckAbelian.hasExt` (HasExt.lean:37); `Sheaf.H` (Basic.lean:57) | sound |
| 3.2 block gluing | `T₁`, `T₂` on `(f,0)`, `(0,g)` | `T₁(f,0) = (f,γ₁f) = (f,g) = (γ₂g,g) = T₂(0,g)`; `c₂ = (T₁⁻¹T₂)ᵀc₁` | — | sound |
| 4.1 tube embedding | corank `k = 1, 2` | surplus `k² − k + 2` = 2, 4; codimension `n + 2 − k` | Forstnerič Th. 2.1(a) `N > 2n`, (d) almost proper; p. 4 Bishop's `L_j` | sound |
| 4.2 Grauert (Lean) | `n = 0`; `M = ℝ`; arctan circle | discrete set into `ℝ²`; `ℝ⁶`; image misses `(−1,0)`, not closed | Grauert 1958 not readable | sound; C01 |
| 5.1 realization | star of edges `0`–`(1,1/k)` | `x_k = (1/k, 1/k²)` lies on edge `k` only, closed in weak topology, `→ 0` | Tau Ceti `isEmbedding_realization_coe_of_finite_vertex_stars` | sound |
| 5.2 Theorem 2 (Lean) | `S¹` plus a point; `M = ∅` | at least 3 vertices; `[Nonempty M]`, README covers `∅` | p. 464: countable manifold, `K` in affine `A`, (a)(b)(c) | sound |
| 5.3 frontier stratification | images `τ(σ)` | semianalytic only via property (A) and projection; *Needs:* lists §§1.0a, 5.2 | `isSemianalytic_image_fst` (Projection.lean:155); p. 463 remark | C02 |
| Not statable: Stein tube, Hörmander | the pins, searched | complexification is a construction that is itself a theorem; no `L²` bundle forms | docstring lines 43–50 name both | sound |

- Source locators checked against the text: 30.
  - Łojasiewicz: §1.I–VI (pp. 450–454), Lemmas 1–10 and 15, Theorems 1–4 and §4 steps I–III. Pages 452, 457, 458, 464, 465, 466 and 468 were also read on page images rendered from the cached PDF.
  - Whitney–Bruhat §1, Prop. 1 (pp. 133–135); Demailly VIII Th. 3.2 (p. 368) and 4.5 (p. 371); Forstnerič Th. 2.1, Prop. 2.2 and p. 4.
- Library declarations opened at the pins:
  - Mathlib: `smoothSheafCommRing` (Sheaf/Smooth.lean:294, `∞`, manifold and ring in one universe), `Sheaf.H` (SheafCohomology/Basic.lean:57), `HasExt.standard` (Ext/Basic.lean:92), `IsGrothendieckAbelian.hasExt`, `SheafOfModules.GeneratingSections`, `SheafOfModules.IsFiniteType`, `SheafOfModules.toSheaf` (ModuleCat/Sheaf.lean:88).
  - Tau Ceti: `TauCeti.SheafOfModules.ringCatSheaf` (Sheaf/Defs.lean:62), `semialgebraicDim_eq_finrank_of_chartedSpace` (Dimension/Manifold.lean:40), `PartiallySemialgebraicAt` (:447), `IsPartiallySemialgebraic` (:628), `AnalyticOnSubmanifold` (Submanifold/Basic.lean:308), `isSemianalytic_image_fst` (Projection.lean:155).
- Cross-roadmap citations resolved on main:
  - ComplexKahlerGeometry §§2.5, 3.1, 3.2, 3.4, 4.1, 4.2, 5.1, 5.7, 5.9, 6.1, 6.4, 7.1;
  - AffineMorseLefschetz §§5.1–5.8; ComplexManifolds Milestones 5 and 7; GeometricTopology §1.5; AlgebraicTopology §4.6; SmoothBundlesConnections B2.1–B2.2; RealAlgebraicGeometry Layers 1, 2, 4, 6, 7.
  - Consumers read: ComplexComparisonPartII (line 245 old anchor, D01; C1.5), SchubertGeometry, Hyperfunctions (line 21 pinned to a commit), AlgebraicTopologyPartII, GlobalHolomorphicFunctions.
- Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`; every supplier is on main.
- Automatic checks: all pass when re-run on this head, and nothing changes outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with eight `sorry` warnings and no error.
  - `#check @` of all 23 declarations matches the README statements, with no binder lost.
  - `simp`, `rfl`, `trivial`, `infer_instance`, `simp_all` and an anonymous constructor close none of the eight theorems.
  - `subsingleton_sheafH_of_isStein` applies with Mathlib's `HasExt.{0}` instance.

Overlap check: read AffineMorseLefschetz, ComplexKahlerGeometry and RealAlgebraicGeometry on main; ComplexKahlerGeometry, Hyperfunctions and StratifiedSpacesAndTameTopology at their open revisions; and ComplexComparisonPartII and Hyperfunctions on main. Shared objects and their owners:

- finite semialgebraic triangulation and semialgebraic dimension: AffineMorseLefschetz §5.1, which Theorem 3 cites and refines with Nash simplices;
- the semianalytic normal decomposition, Łojasiewicz's theorems and the bounded Nash triangulation: this roadmap, cited by StratifiedSpacesAndTameTopology and ComplexKahlerGeometry K3/K6.1;
- the coherent `SheafOfModules` predicate, the Stein predicate and Cartan A/B: this roadmap §§3.0–3.2. ComplexKahlerGeometry (main lines 3458–3459, open revision line 782) defers them here. ComplexComparisonPartII C1.5, SchubertGeometry and Hyperfunctions consume them;
- the holomorphic structure sheaf: ComplexKahlerGeometry K4 §4.1, cited here;
- manifold complexification: this roadmap §3.0, consumed by Hyperfunctions;
- the one-variable hull and Cousin I on open subsets of `ℂ`: GlobalHolomorphicFunctions, a special case kept there under a distinct qualified name.

Source independence: 12 passages compared by hand with 4 sources (Lojasiewicz1964, DemaillyAgbook, Forstneric2018, WhitneyBruhat1959), plus a whole-README scan for shared 6-word runs against the same four. Nothing is shared beyond titles and forced phrases; the longest is a standard 10-word phrase opening a hypothesis. Largest share: Lojasiewicz1964, 26 of 43 README locators. Contents compared with Lojasiewicz1964: §§2.0–2.0h follow its §1.II–III, Lemmas 1–15 and §4 steps I–IV in the order forced by their *Needs:* chain (2.0a←2.0, 2.0b←2.0a, …, 2.0h←2.0g), each with its own grouping and scope. Layers 0, 3, 4 and 5 and §§2.1–2.1b have no counterpart. Result: independent.

Research link: Theorems 1–4 are Łojasiewicz's 1964 triangulation of locally finite semianalytic families. It answers the triangulation question for analytic sets of Lefschetz, Koopman–Brown and Lefschetz–Whitehead (1930–33), and property (A) constrains Milnor-type examples. Layers 3–4 give Cartan's A/B and Grauert's 1958 embedding. ComplexKahlerGeometry K6.1 uses Theorem 2; ComplexComparisonPartII and Hyperfunctions use Layer 3. This rests on Lojasiewicz1964 lines 25–42 and the README.

## Not verifiable

- Grauert1958 (*Annals* 68, JSTOR): uncertified and paywalled. It bears on §3.0's p-function, the Stein criterion's attribution and §4.2.
- Hormander1965 (*Acta* 113): uncertified; it is §3.1's second citation.
- Hormander1990, Chapter VII, (7.2.2)–(7.4.3): uncertified. These are the locators of §3.2 and of the Cartan A/B docstrings.
- Łojasiewicz states §1 without proof (pp. 449–450), so §§1.0 and 2.0 and Lemma 9 were checked against statements only.

## Source issues

- **Error** in Lojasiewicz1964 at Lemma 6, printed p. 458 (and §4, step I, p. 466): the source says a shear by `z` keeps an `A`-Lipschitz graph topographic when `|z| < A`; it should be `A|z| < 1`, since `t = 2u` with `z = −½` becomes the line `u′ = 0`; affects a stated result.
- **Misprint** in Lojasiewicz1964 at §4, step I, condition (3), printed p. 465 (repeated in step II, p. 468): the source says tails are empty when `dim Γ < n`, with `dim M = n − 1`; it should be `dim Γ < n − 1` (and `= n − 1` on p. 468); affects the proof.
- **Error** in Lojasiewicz1964 at §4, step I, condition (1) and the family `C₁`, printed pp. 465–466: the source says every member is bounded, yet `C₁` contains the hyperplanes `M × {±1}`; boundedness should be asked over bounded base sets; affects the proof.
- **Misprint** in Lojasiewicz1964 at §4, step II, printed p. 468: the source says `M ∖ π(Γ)` and `{u ∈ π(Γ) : |Γ(u)| ≥ 2}` are each compact; the first is only closed (it is unbounded), and closedness is what the step uses; affects nothing.
- **Misprint** in Lojasiewicz1964 at Theorem 4, proof, printed p. 464: the source says the projector uses indices `1, …, n` into `ℝ^(n²)` for `x = (x₀, …, xₙ)`; it should use `0, …, n` and `ℝ^((n+1)²)`, since the printed map identifies `[x₀ : x′]` with `[−x₀ : x′]`; affects the proof.
- **Misprint** in Lojasiewicz1964 at Lemma 10, proof, printed p. 460: the source says `|β′(t)| ≤ min(2, 1/t)`; it should be `min(2, 1/|t|)`; affects nothing.

## For the human reviewers

- none
