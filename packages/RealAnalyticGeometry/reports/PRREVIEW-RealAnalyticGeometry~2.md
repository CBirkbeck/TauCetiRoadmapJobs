# Review of RealAnalyticGeometry (pull request #2634 at 63e5e5d)

**Verdict:** needs changes

**Summary.** Changes are needed for two findings. First, the local dimension of §1.0a is not well defined: a §1.0 decomposition need not have the base point in the closure of every piece, so the claim that the local dimension does not depend on the decomposition is false. Second, Cartan's theorems A and B can be stated at the pins with Mathlib's holomorphic structure sheaf and the README's own coherence predicate, yet `Suggested.lean` lists them as not statable. Every finding of the previous review is repaired; there are also six small corrections and one format note, none blocking, and nothing is left for a human to decide.

## R01 (P2) — The local dimension of §1.0a depends on the size of the neighbourhood, so "the local dimension does not depend on the decomposition" is false as stated

As written, an implementer cannot define `dim_x A`: two admissible decompositions near the same point give different values. §1.0 (lines 237–243) asks for "an open neighbourhood `V ⊆ U` of `x` and a finite partition of `V`" but ties no piece to `x`. §1.0a (lines 292–295) then takes the largest dimension of a piece contained in `A` of such a decomposition "near `x`".

Take `A = {(1, 0)} ⊂ ℝ²`, `x = 0` and `f₁ = (u − 1)² + v²`.

- On `V = B(0, 2)`, the pieces `{(1, 0)}` and `V ∖ {(1, 0)}` meet every clause of §1.0. Both are connected, locally closed analytic submanifolds, `f₁` has constant sign on each, each closure in `V` is a union of pieces, and the dimension drops from 2 to 0. This decomposition gives `dim₀ A = 0`.
- On `V = B(0, 1/2)`, the single piece `V` gives `dim₀ A = −∞`.

In Łojasiewicz, every member of a normal decomposition at `c` has `c` in its closure (§1.II.4, printed p. 452), which is what makes the germ dimension well defined.

One repair is to add "and `x` lies in the closure of every piece" to the statement of §1.0 and keep it in the Shrinking bullet. Another is to define `dim_x A` through decompositions on arbitrarily small neighbourhoods of `x`.

## R02 (P2) — Cartan's theorems A and B can be stated at the pins, but `Suggested.lean` lists them as not statable

As it stands, the acceptance test leaves out two headline theorems, those of the Summary (lines 32–33) and §3.2. The module docstring (lines 46–48) says "there is no coherent analytic sheaf". At the pinned Mathlib every carrier is present:

- **Structure sheaf.** `smoothSheafCommRing 𝓘(ℂ, E) 𝓘(ℂ, ℂ) X ℂ` (`Mathlib/Geometry/Manifold/Sheaf/Smooth.lean`, line 294) is the sheaf of complex-smooth, that is holomorphic, functions. It is made `RingCat`-valued with `sheafCompose` and `forget₂ CommRingCat RingCat`.
- **Coherence.** The predicate of §3.2, item 0 is `F.IsFiniteType ∧ ∀ U q (φ : SheafOfModules.free (ULift (Fin q)) ⟶ F.over U), (kernel φ).IsFiniteType`. Instance search finds the abelian structure on modules over the over-site.
- **Cohomology.** It is `Sheaf.H` (`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean`, line 57) of `(SheafOfModules.toSheaf _).obj F`, with `HasExt.standard`.

We used the file's `IsStein`. Theorem B was stated as `Subsingleton (Sheaf.H ((SheafOfModules.toSheaf _).obj F) k)` for `0 < k`. Theorem A was stated as `Nonempty F.GeneratingSections`, which says that global sections generate `F`, hence every stalk. With the file's imports, both elaborate in about 25 lines, with `sorry` as the only warning and no `set_option`. The manifold and its model live in `Type`, because `smoothSheafCommRing` takes the ring in the manifold's universe.

Add the structure sheaf, the coherence predicate and the two theorems. Then remove Cartan A/B from the docstring's list of statements that are not statable, and name the predicate by its Lean name in §3.2, item 0.

## C01 — §2.0 describes the loci of a normal box by the nonvanishing of discriminants, where Łojasiewicz uses the next distinguished polynomial

§2.0 (lines 418–419) describes each `Γ^k_κ` as a component of a locus cut out by the Weierstrass polynomials "together with the nonvanishing of the preceding discriminants". In the cited §1.II (printed p. 451), `V^k` is `{H^{n−1}_n = ⋯ = H^k_{k+1} = 0, H^{k−1}_k ≠ 0}`. By (β) a vanishing discriminant forces `H^{k−1}_k = 0`, so the source's condition is the stronger one, and the discriminant locus can be larger.

For example, take `n = 2`, `H⁰₁ = z₁` and `H¹₂ = z₂ − η(z₁)`, whose discriminant is constant. The discriminant version of `V¹` then contains the origin, which is `V⁰`, so the pieces no longer partition the box. Write "together with the nonvanishing of the next distinguished polynomial `H^{k−1}_k`".

## C02 — The six properties recorded in §2.0e omit that lower-dimensional members have empty tails, which §2.0f uses

§2.0f (lines 683–684) argues that "for a lower-dimensional `Γ`, the tail properties place `Γ ∩ Γ′` inside the strip". For the diagonal pair `Γ′ = Γ` this needs the tail of `Γ` to be empty. Property (iii) (line 671) gives only "compact and disjoint". The construction does give emptiness, because those members are pieces clipped to the truncated cones inside `|t| < 1`, and Łojasiewicz records it in step I, (3), printed p. 465. Add "and empty for members of dimension below `n − 1`" to (iii).

## C03 — The comparison of §1.0a's dimension with `TauCeti.semialgebraicDim` in §1.1 restates a theorem at the pin

§1.1 (lines 358–360) asks to prove that the §1.0a dimension of a semialgebraic piece equals its semialgebraic dimension. At the pin, `TauCeti.semialgebraicDim_eq_finrank_of_chartedSpace` (`TauCeti/Geometry/RealAlgebraic/Semialgebraic/Dimension/Manifold.lean`, line 40) computes the semialgebraic dimension of any nonempty subset that is a topological manifold as the dimension of its model. For a `k`-dimensional piece, the comparison is that theorem together with §1.0a's value `k`. Cite it in the *Needs:* line and keep only the assembly.

## C04 — Downstream consumers credits GlobalHolomorphicFunctions with using §3.2, item 1, which it declines to do

Lines 1614–1615 say GlobalHolomorphicFunctions uses the scalar Cousin I splitting and the vanishing of `Hᵏ(X, O)`. Its README on main (lines 69–73) says the opposite. Taking them from this roadmap would be circular, because its Layer 7.4 feeds ComplexKahlerGeometry K2, which §3.2 consumes, so it owns the one-variable case itself. Replace the clause by "GlobalHolomorphicFunctions proves the one-variable case on open subsets of `ℂ` itself and takes nothing from §3.2".

## C05 — The description presents the square-integrability hypothesis of §3.1 as new, but main already has it

The description says "Apart from one hypothesis added to match its source (below), no statement is weakened", and later "The datum `f` is now assumed square-integrable for the weight". Main's §3.1 already requires that the "distributionally closed data f belong to weighted L²" (main README line 678), so against the base no hypothesis is added. Suggested text: "No statement is weakened. The weighted `∂̄` theorem keeps main's hypothesis that the datum is square-integrable for the weight, now with Demailly, Chapter VIII, Theorem 4.5 as its locator."

## C06 — Grauert's theorem and the Stein criterion cite Grauert 1958 without a theorem number or page

§4.2 (line 1503) gives "(Grauert, 1958)", the docstring of `isStein_of_strictlyPlurisubharmonic_exhaustion` (line 267) gives "Grauert 1958, the Levi problem", and the References give only the page range 460–472. Add the theorem number and page of each statement used.

## N01 — The scope section describes an earlier state of the roadmap

Line 1661 says "These were planned in the Nash section; §1.1 keeps only what is not stated there." Would the author keep only the second clause?

## Earlier findings

- R01 — repaired: §3.1 asks for "`∫|f|² e^(−φ) dV < ∞` and `∫⟨B⁻¹f, f⟩ e^(−φ) dV < ∞`" (lines 1121–1122), and the Summary says "square-integrable for the weight" (line 31).
- R02 — repaired: `exists_manifold_semianalytic_triangulation` is stated with `ChartwiseRealAnalyticSubmanifold`, `AnalyticOnSubmanifoldInto`, `ChartwiseAnalyticOn` and `HasManifoldPropertyA`; it elaborates and matches §5.2.
- R03 — repaired: "has the two components `T± = W ∩ {±y > 0}`" (line 311), with the argument run on `T₊`.
- C01 — repaired: §2.0 cites §1.II, pp. 451–452, §1.III.1–3, pp. 452–453, and the projection statement on p. 452.
- C02 — repaired: §3.2 names Hörmander's 1990 book, Chapter VII (lines 1242–1244), and the References list it.
- C03 — repaired: §2.1a reads analyticity "through these chart maps" (line 910), and the supplier contracts set Tau Ceti's atlas aside (lines 1862–1868).
- C04 — repaired: the Stein criterion is stated, and the docstring keeps only the missing complexification as the obstacle for the tube.
- C05 — not repaired: deferred (D01).
- C06 — repaired: "proved in §4.1 above" (line 1945).
- C07 — repaired: the description reads "no statement is weakened; targets that the pins already prove become supplier contracts"; the clause before it is C05 of this report.
- N01 — repaired: §§2.0–2.0g come "in the order their *Needs:* lines force" (line 404), and no section says it follows the source.

## Deferred findings

- D01 — stands

## Questions for the author

- Could the Stein-tube theorem be stated existentially, without a complexification carrier? It would assert that there are a complex manifold modelled on `Fin n → ℂ`, an antiholomorphic involution of it, an analytic embedding of `M` onto the fixed locus, and an open neighbourhood of the image satisfying `IsStein`. The docstring names only the missing carrier as the obstacle. We did not write the statement, so we cannot say how long it would be.

## Verified sound

| Target | Instances tried | Roadmap side (computed) | Source or library side (computed) | Result |
|---|---|---|---|---|
| 1.0 normal decomposition | `x² − y²` at 0 | 9 pieces (origin, 4 rays, 4 sectors); the 5 sign components include the cross, not a submanifold | §1.II pp. 451–452: members are components of `V^k`; II.2 frontier; II.4 adherence | sound |
| 1.0a local dimension | `A = {(1,0)}`, `x = 0`, `f₁ = (u−1)² + v²` | on `B(0,2)`, pieces `{(1,0)}` and the rest give `dim₀ A = 0`; on `B(0,½)`, `−∞` | §1.II.4 p. 452: `c` lies in the closure of every member | R01 |
| 1.0a Checks | umbrella `x² = zy²`; segment `[0,1]×{0}` | `W∖S` is a graph over `{y≠0}` with 2 components; `closure T₊ ∩ S = {z ≥ 0}`; segment: dim 1, `closure∖A = ∅` | `(√z·y, y, z) → (0,0,z)` as `y → 0⁺` | sound |
| 1.1 Nash | `√(1+x)`; `exp`; piece dimension | `4a⁴ − 4(1+x)a² − y² = 0`, at `y = 0`: `4a²(a²−1−x)`; root bound polynomial against `eˣ` | §1.VI p. 454; pin: `semialgebraicDim_eq_finrank_of_chartedSpace` (Dimension/Manifold.lean:40) | sound; C03 |
| 2.0 normal boxes | `n = 2`, `H⁰₁ = z₁`, `H¹₂ = z₂ − η(z₁)` | the discriminant version of `V¹` contains the origin, which is `V⁰` | p. 451: `V^k` uses `H^{k−1}_k ≠ 0`; III.2 p. 453: `H^{n−1}_n = 0 ⟺ F = 0` | C01 |
| 2.0a Checks | `f = y`; `f = exp y` | only the horizontal direction is singular; no direction is singular | — | sound |
| Lemma 6 shear (2.0b) | graph `t = 2u` (`A = 2`), `z = −½` | README's `A|z| < 1` fails (`= 1`) | the source's `|z| < A` holds, but the image `{0}×ℝ` is not topographic; Tau Ceti asks `A‖z‖₊ < 1` (Topographic.lean:295) | README sound; source issue |
| Lemmas 5, 7 Checks (2.0b) | `{sin t = 0}`; `f = t² − u`, `g = t² + u` | fibres `πℤ`; `π{f = 0} = [0, ∞)`; projections of open parts of `{fg = 0}` are open | Lemma 5 p. 457 needs bounded; Lemma 7 p. 458 | sound |
| 2.0c Lemmas 8–9 | adapted box against a general affine box | Lemma 9 is stated for adapted boxes | p. 459: Lemma 8 gives (P) for `V^{n−1} ∪ … ∪ V⁰`; Lemma 9 holds for any affine box with vertical axis | sound (special case used) |
| 2.0d Lemma 10 | `(u,t) = (2,3)`, `h = 2 + t²`; `h ≡ 1` | `g₁ = (22,3)`, `3/√485 ≈ 0.136 < 1`; `3/√5 ≈ 1.342 > 1` | pp. 459–460: 1°–6° and the three inequalities on `h` match; `1/|t|` corrects `1/t` | sound |
| 2.0e step I | diagonal pair, member of dimension `< n−1` | (iii) gives tails compact and disjoint, not empty | p. 465 (3): empty "when dim Γ < n" (misprint for `n − 1`) | C02 |
| 2.0h Theorem 1 (Lean) | `n = 0`; `n = 1`, `B = ℤ`; `sin` | point complex with `τ = id`; a vertex at each `τ⁻¹(k)`; `sin` has (A⁻¹), not (A) | pp. 463–464: (a)(b)(c); (A) means partially semialgebraic in the source variable; Lean base `p.1` = target | sound |
| 2.1 Theorem 3 (Lean) | `y = |x|`; `(0,1)`, `{½}`; `k = 0` | vertex at `(0,0)`; vertex at `½`, `B₁` no subcomplex; empty complex | p. 464: finite `K` in `M`, semialgebraic `τ : |K| → ⋃ B̄ᵢ`, (b)(c) | sound |
| 2.1a projector | `n = 1` | locus `a² + b² = a`; `(cos²θ, cosθ sinθ)` lies on it; the sign of `b` separates `(cosθ, ±sinθ)` | p. 464 uses indices `1..n`, which identifies `[x₀:x′]` with `[−x₀:x′]` | sound |
| 2.1b Theorem 4 (Lean) | `m = 0`; `ℝP¹`, empty family | a point, `∑ nᵢ = 0`; at least 3 vertices | p. 464: finite `K`, semialgebraic onto `M`, (b)(c) | sound |
| 3.0 complexification | `S¹`; `p = (Im z)²`; `ℂ²∖{0}` | `ℂ*` with `z ↦ 1/z̄`, fixed set `|z| = 1`; `i∂∂̄p = dx∧dy`; hull of sphere is closed ball minus 0 | W–B §1 Prop. 1 pp. 133–134: paracompact, covers `V′ ⋐ U′ ⋐ T′`, disjoint `A*`, `B*` | sound |
| 3.1 weighted theorem | `B ≥ ε`; jets in `ℂ` | `‖u‖² ≤ ε⁻¹‖f‖²`; `∫|z−a|⁻² = 2π∫dρ/ρ` diverges; vanishing for `m > s − n` | Demailly VIII Th. 4.5 p. 371: `g ∈ L²`, `D″g = 0`, `∫⟨A⁻¹g,g⟩ < ∞` | sound |
| 3.1 Stein criterion (Lean) | dimension 0; `ℂ²∖{0}` with `|z|² + |w|²` | countable discrete `X`: hull(K) = K; the sublevel set is a ball minus 0, not compact | `IsManifoldStrictlyPlurisubharmonicAt` (LeviForm.lean:343), read in the preferred chart | sound |
| 3.2 Cartan A/B | `ℤ ⊂ ℂ`; `ℂ²∖{0}`; Lean statements | `sin(πz)` has simple zeros at `ℤ`; `[1/(zw)] ≠ 0`; A and B elaborate with `sorry` only | `smoothSheafCommRing` (Sheaf/Smooth.lean:294); `Sheaf.H` (SheafCohomology/Basic.lean:57) | R02 |
| 4.1 tube embedding | coranks `k = 1, 2` | surplus `k² − k + 2` is 2 and 4; codimension `n + 2 − k` | Forstnerič Th. 2.1(a) `N > 2n`, (d) almost proper; p. 4 Bishop polyhedra | sound |
| 4.2 Grauert (Lean) | `n = 0`; `M = ℝ`; arctan circle | countable discrete set into `ℝ²`; `t ↦ (t, 0, …)` into `ℝ⁶`; non-closed image excluded | Grauert 1958 not read | sound; C06 |
| 5.1 realization | star with edges from `0` to `(1, 1/k)` | `x_k = (1/k, 1/k²)` meets each closed edge once; closed for the weak topology, converges to `0` | Tau Ceti `isEmbedding_realization_coe_of_finite_vertex_stars` | sound |
| 5.2 Theorem 2 (Lean) | `S¹` with one point; `M = ∅` | at least 3 vertices; `[Nonempty M]` gives `f`, and the README covers `∅` with the empty complex | p. 464: countable manifold, `K` in affine `A`, (a)(b)(c) | sound |
| Stein tube, Hörmander | the pins, searched | no complexification, Kähler metric or `L²` forms at the pins | docstring lines 40–45 | sound; question |
| Downstream: GlobalHolomorphicFunctions | its README lines 69–73 | README says it uses §3.2, item 1 | it calls that circular and owns the one-variable case | C04 |

- Source locators checked against the text and page images: 30. These are Łojasiewicz §1.II–VI (pp. 451–454), Lemmas 5–10 and 15, property (A), Theorems 1–4 (pp. 463–464) and §4 steps I–II (pp. 465–467); Demailly VIII Th. 3.2 and 4.5 (pp. 369–371); Forstnerič §2.1, Th. 2.1, Prop. 2.2 and Bishop's construction; Whitney–Bruhat §1, Prop. 1 (pp. 133–134).
- Library declarations opened at the pins:
  - Tau Ceti: `IsAnalyticChart`, `IsAnalyticSubmanifold`, `AnalyticOnSubmanifold` (Submanifold/Basic.lean:130, 238, 308); `PartiallySemialgebraicAt`, `IsPartiallySemialgebraic` (PartiallySemialgebraic.lean:447, 628); `manifoldLeviForm`, `IsManifoldStrictlyPlurisubharmonicAt` (LeviForm.lean:106, 343); `affineOpen`, `affineChart` (AffineChart.lean:62, 101); `horizontalShear` and its Lipschitz bound (Topographic.lean:231, 293); `semialgebraicDim_eq_finrank_of_chartedSpace`; `contMDiffAt_omega_iff_analyticAt` (ContMDiff/Analytic.lean:162).
  - Mathlib: `Projectivization.instTopologicalSpace` (line 44), `smoothSheafCommRing`, `Sheaf.H`, `SheafOfModules.over`, `GeneratingSections`, `sheafOfModulesEquivOver`.
- All 182 dotted library names in the README resolve to declarations at the pins. None of the later Tau Ceti results that `TauCetiRoadmap/RealAnalyticGeometry/STATUS.md` lists (real Weierstrass preparation, Lemmas 5, 10 and 15, manifold analytic submanifolds) is at the pinned commit, so the README is right to plan them.
- Cross-roadmap citations resolved on main:
  - ComplexKahlerGeometry §§2.5, 3.1, 3.2, 3.4, 4.1, 4.2, 5.1, 5.7, 5.9, 6.1, 6.4 and 7.1;
  - AffineMorseLefschetz §§5.1–5.8;
  - ComplexManifolds Milestones 5 and 7;
  - GeometricTopology §1.5 and AlgebraicTopology §4.6;
  - SmoothBundlesConnections B2.1–B2.2;
  - RealAlgebraicGeometry Layers 1, 2, 4, 6 and 7.

  Consumers read: ComplexComparisonPartII, SchubertGeometry, Hyperfunctions, AlgebraicTopologyPartII and GlobalHolomorphicFunctions on main, plus the open revisions of ComplexKahlerGeometry and Hyperfunctions.
- Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`; every supplier is on main.
- Automatic checks: all passed; no change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with six `sorry` warnings and no error. `#check @` of all 20 declarations agrees with the README statements, with no binder lost. `simp`, `rfl`, `infer_instance`, `trivial` and an anonymous constructor close none of the six theorems. The Cartan A/B statements of R02 elaborate.

Overlap check: read AffineMorseLefschetz, ComplexKahlerGeometry, RealAlgebraicGeometry, Hyperfunctions and ComplexComparisonPartII on main (ComplexKahlerGeometry and Hyperfunctions also at their open revisions), and StratifiedSpacesAndTameTopology (open). Shared objects and their owners:

- finite semialgebraic triangulation and semialgebraic dimension: AffineMorseLefschetz §5.1, which Theorem 3 refines with Nash simplices;
- semianalytic sets, Łojasiewicz's theorems and the bounded Nash triangulation: this roadmap, which StratifiedSpacesAndTameTopology 4.1 and AlgebraicTopologyPartII cite;
- the coherent predicate, the Stein predicate and Cartan A/B on manifolds: this roadmap §§3.0–3.2, consumed by ComplexKahlerGeometry, ComplexComparisonPartII (as `SteinManifold`) and SchubertGeometry;
- manifold complexification: this roadmap §3.0, consumed by Hyperfunctions;
- one-variable Cousin I: GlobalHolomorphicFunctions, a special case kept there.

Source independence: 16 passages compared with 4 sources (Lojasiewicz1964, DemaillyAgbook, Forstneric2018, WhitneyBruhat1959); none shared beyond forced formulas and statements, longest common run 5 words (Forstneric2018 line 140). Largest share Lojasiewicz1964, 22 of about 40 locators. Contents compared with Lojasiewicz1964: §§2.0–2.0h follow its §1.II–III, Lemmas 1–15 and §4 steps I–IV in order, an order forced by their *Needs:* chain, each section with scope of its own; Layers 0, 1, 3, 4, 5 and §§2.1–2.1b have no counterpart. Result: independent.

Research link: Theorems 1–2 are Łojasiewicz's 1964 proof, for locally finite semianalytic families, of the triangulation Lefschetz and Whitehead sketched in 1933; property (A) forces non-algebraic singularities in Milnor-type examples. Layers 3–4 give Grauert's 1958 embedding used by Theorem 2; ComplexKahlerGeometry K6.1 and ComplexComparisonPartII consume Layers 5 and 3. Rests on Lojasiewicz1964 lines 25–42 and the README.

## Not verifiable

- Grauert1958 (*Annals* 68, JSTOR): uncertified, paywalled; affects §4.2's statement and target dimension, the p-function of §3.0 and the Stein criterion's attribution.
- Hormander1965 (*Acta* 113): uncertified, paywalled; it is §3.1's second citation.
- Hormander1990, Chapter VII results (7.2.2)–(7.4.3): uncertified; they are §3.2's locators.
- Łojasiewicz states §1 without proof (p. 449), so the normal-box facts of §2.0 and Lemma 9 were checked against statements only.

## Source issues

- **Error** in Lojasiewicz1964 at Lemma 6, printed p. 458 (and §4, step I, p. 466): the source says a shear by `z` keeps an `A`-Lipschitz graph topographic when `|z| < A`; it should be `A|z| < 1`, since `t = 2u` with `z = −½` becomes a vertical line; affects a stated result.
- **Misprint** in Lojasiewicz1964 at §4, step I, condition (3), printed p. 465: the source says tails are empty for members of dimension below `n`; every member is topographic, of dimension at most `n − 1`, so it should be below `n − 1`; affects the proof.
- **Misprint** in Lojasiewicz1964 at §1.III.2, printed p. 453: the source says `V^{n−1}` equals the zero set of `F`; its parenthetical `H^{n−1}_n = 0 ⟺ F = 0` gives the union `V^{n−1} ∪ ⋯ ∪ V⁰`; affects nothing.
- **Misprint** in Lojasiewicz1964 at Theorem 4, proof, printed p. 464: the source says the projector uses indices `1, …, n` with target `ℝ^(n²)`; it should use `0, …, n` and `ℝ^((n+1)²)`, since the printed map identifies `[x₀ : x′]` and `[−x₀ : x′]`; affects the proof.
- **Misprint** in Lojasiewicz1964 at Lemma 10, printed p. 459: the source says `G` is a subset of `M` whose interior contains `{c} × ℝ`; it should be a subset of `M × ℝ`; affects nothing.
- **Misprint** in Lojasiewicz1964 at Lemma 10, proof, printed p. 460: the source says `|β′(t)| ≤ min(2, 1/t)`; it should be `min(2, 1/|t|)`; affects nothing.
- **Error** in Lojasiewicz1964 at §4, step I, condition (1) and the family `C₁`, printed pp. 465–466: the source says every member is bounded, yet `C₁` contains the hyperplanes `M × {±1}`; boundedness should be asked over bounded base sets; affects the proof.

## For the human reviewers

- none
