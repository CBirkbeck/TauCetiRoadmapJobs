# Review of TangentialBordism (pull request #942 at b345f48)

**Verdict:** accepted

This is an incremental re-review of the 78 lines changed since 4c63ec0 (the head the previous review, PRREVIEW-TangentialBordism~6, read). The change declares the finite F₂ Arf algebra as a supplier gap of GeometricTopology (`README.md:154–167`), routes every citation of it through the slug (`:69`, `:140`, `:149`, `:171`, `:192`, `:211`, `:220`, `:1865`, `:1869`, `:1892`), removes the residues of the Layer 1 move (the SymplecticBasis sentence, the Pyronneau reference, the downstream sentence, the Lean pointer comment), and sharpens three locators (SpinGeometry G4.3–G4.4 and G6 item 5 in 1.1, 8.1 and the supplier row; Milnor–Stasheff Theorem 17.1 and Lemma 17.2 in 2.4, 3.1 and 3.2). No other passage changed; the previous report's verification of the untouched passages is carried below with its values. No finding remains.

## Previous findings

- R01 — repaired: `README.md:154–167` states `What GeometricTopology must provide (gap:finite-quadratic-arf): for a finite-dimensional F₂ vector space V with a quadratic form q whose polar bilinear form is nondegenerate …`, and every use names the slug. The gap is precise, minimal and consistent with GeometricTopology 4.3.1 at its open head (details under Verified sound). No `design/plan.json` exists for this roadmap (it is not a board package: the board's `packages/TangentialBordism` holds only `reports`), so the README is the only place the contract can be declared; the intake will have to record it from the README, and the author should say so in the pull request text. This is not a finding under the brief's gap rules.
- R02 — repaired: `README.md:125–131` keeps only the `IsOrientedAtlas` sentence; "Pyronneau" occurs nowhere in the file; `:2647–2648` reads "the ordinary operation, Adams and framed PT interfaces and the Spin-surface quadratic refinement"; the two-line comment is gone from `Suggested.lean`, whose docstring (`:9–10`) names the gap.
- R03 — repaired: `README.md:1842–1845` cites "G6 item 5: the trivial Spin(1)=ℤ/2 cover and the connected double cover of the oriented frame bundle" and "G4.3 for existence, G4.4 for the H¹(Σ;F₂)-torsor", with the same at `:199–200`, `:220–221`, `:1865` and in the supplier row `:146`; `:455–456` reads "Chapter 17, Theorem 17.1 and Lemma 17.2, pp.206–207"; `:611` and `:633` now cite "Chapter 17, Lemma 17.2" and "Chapter 17, pp.207–208".

## Verified sound

### Gate, dependency direction and the acceptance test

The worker's gate at this head reports every scanner at zero, `depcheck=0`, `build=0`, `OK`. I reran the gate (every count zero, `OK`, exit 0) and the dependency check with `--movable`:

```text
depcheck: 204 roadmaps, 1404 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The outside-folder diff against `origin/main` is empty; the folder holds `README.md`, `Suggested.lean` and `metadata.toml` only. GeometricTopology, the gap's supplier, is a roadmap on main; at the head of its open revision (#903) it names TangentialBordism only as a consumer (`rev/903 README.md:48–50`, `:143`, `:1402`, `:5745`), so the direction is downward at both ends.

I elaborated a scratch copy of `Suggested.lean` with `#check @orientedThreeManifold_parallelization` appended (`lake env lean`, 7 s, exit 0): the only diagnostics are the `sorry` warning at line 40 and the elaborated type, which carries `T2Space M`, `SecondCountableTopology M`, `ChartedSpace (EuclideanHalfSpace 3) M`, `IsManifold (modelWithCornersEuclideanHalfSpace 3) ∞ M` and `TauCeti.IsOrientedAtlas … A`, and concludes with a pointwise `Module.Basis (Fin 3) ℝ (TangentSpace … x)`, positivity of `Matrix.det` of the chart derivative of the frame on every chart of `A`, and `ContMDiff` of the two bundle maps. This is the README statement at `:1941–1958` (Hausdorff, second countable, boundary allowed, no compactness or connectedness, positivity in every chart of the chosen atlas, smooth frame and inverse); no binder was lost. The file's only import besides `import Mathlib` is `TauCeti.Geometry.Manifold.Orientation` (present at the pin); no `set_option`, no sorry'd data, no admitted `example`. The one declaration is the parallelization headline; no padding probe applies to the diff (the file's declaration is unchanged apart from the docstring), and the earlier reports' sixteen one-tactic probes stand. The headlines not statable at the pins are named in the docstring with their missing carriers, unchanged since ~6.

### The declared gap

Checked against the brief's three requirements:

- **Precise.** The `needs` sentence (`:154–167`) fixes the carrier (finite-dimensional F₂ vector space, quadratic form with nondegenerate polar form, hence dimension 2m with m ≥ 0), the defining formula (Σ q(a_i)q(b_i) on a symplectic basis) and each law with its hypotheses: basis independence, isometry invariance, orthogonal-sum additivity, the hyperbolic/anisotropic decomposition with the two plane forms and their Arf values, classification by dimension and Arf, the integer Gauss sum, the q-zero count with the m = 0 case separated, and the Lagrangian criterion with the dimension m stated. Every value is recomputed in the table below.
- **Minimal.** Mathlib and Tau Ceti at the pins have no Arf invariant of a quadratic form: the word `Arf` occurs in six files, all Hasse–Arf (`TauCeti/NumberTheory/LocalField/Herbrand/HasseArf.lean`, `TauCeti/FieldTheory/Galois/Abelian/Tower.lean`). Tau Ceti's `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` and `even_finrank` (`SymplecticBasis.lean:301`, `:309`) are the symplectic-basis input, which the gap does not ask for; GeometricTopology 4.3.1 consumes them itself (`rev/903 README.md:1380–1382`). No roadmap on main states the finite Arf algebra ("Arf" and "quadratic" do not occur in GeometricTopology on main, fa41b37). FourManifolds at #936 declares the same slug with the same supplier and section (`rev/936 README.md:369–381`, "TangentialBordism 1.1 declares the same gap"), so the two consumers ask one owner for one object.
- **Declared where the intake reads it.** The README states it under `## Exact supplier contracts`, directly after the supplier table whose GeometricTopology row (`:140`) and IntegralLattices row (`:149`) point at it, and the Scope paragraph (`:67–71`) calls it the only gap the roadmap declares. There is no plan.json (see R01 above).
- **Agreement with the supplier.** GeometricTopology 4.3.1 at `rev/903 README.md:1371–1402` states, law for law, what the gap asks: native `QuadraticForm (ZMod 2) V` with `q.polarBilin.Nondegenerate`, Arf as Σ q(a_i)q(b_i) with basis independence, isometry invariance and additivity, the plane decomposition with two anisotropic planes identified with two hyperbolic ones, classification by dimension and Arf, the Gauss sum `(−1)^Arf · 2^m`, the zero count `2^(2m−1) + (−1)^Arf · 2^(m−1)` for m ≥ 1 and 1 for m = 0 in ℤ, and Arf 0 iff a q-zero Lagrangian, with "U = U^⊥" shown equivalent to finrank U = m for a q-zero subspace. Nothing in Layer 1 derives any of it (`:165–167`).

### Cross-roadmap citations resolved (every round)

The three citations the diff adds or changes, on main (fa41b37): SpinGeometry G4.3 (`TauCetiRoadmap/SpinGeometry/README.md:476–488`: existence of a Spin structure iff the frame-bundle cocycle class, identified with w₂, vanishes) and G4.4 (`:489–503`: twisting by a principal ℤ/2-bundle is free and transitive, an H¹(X;ℤ/2) torsor); SpinGeometry G6 item 5 (`:775–787`: the periodic lift is the disconnected trivial Spin(1)=ℤ/2 cover of the oriented circle frame bundle, the antiperiodic lift its connected double cover; product tori with all H¹ twists; the two circle lifts and all torus lifts identified through H¹). The GeometricTopology citation now resolves as a declared gap (above). Every other citation is unchanged since ~6 and was resolved there: GeneralizedCohomology G1 item 1, G3 items 3, 8, 9, G4 item 3, G5.2–G5.5; CharacteristicClasses C1 items 3–4, C3.6, C7.3/C7.3a; DifferentialGeometry 2.1, 2.2, 5.5, 10.2; SpinGeometry G5.0, G6.0, G6.7; ClassifyingSpaces Stage 4; RiemannianGeometry R1; LieHighestWeight Layer 8 (`TauCeti.DivisionOctonionReal` is planned there at `README.md:1261`, the citation scanner's one lead, not a pinned declaration and not claimed as one); SpinRepresentations Layer 7; AffineMorseLefschetz A0/A5/A6; ComplexKahlerGeometry K7.1; DGFloer Layer 1; GeometricTopology Layer 1, Layer 11 and item 1 of the smoothing comparison; at open heads, StringOrientation S1.3, S1.5, S2.2, S2.3, S5.3 (#948), IndexTheory I7.2/I7.5 (#1077), PseudodifferentialOperators P5/P6 (#952).

### Seeded sample where it falls in the changed passages

Cache ids are sha256 prefixes of the sources cache; pages are printed pages.

- 2.4 (B1.2), changed locator: Milnor–Stasheff `4f8edd74 line 5439` is Theorem 17.1, the collar neighbourhood theorem for a smooth paracompact manifold with boundary, p.206 (`line 5445`); `line 5457` is Lemma 17.2, oriented cobordism is reflexive, symmetric and transitive, proved by [0,1]×M, −X and gluing along the common boundary using 17.1 (`lines 5459–5465`), p.207 (`line 5477`). The README's "Theorem 17.1 and Lemma 17.2, pp.206–207" is exact. Miller Chapter 1 Definitions 1.1–1.2 and Chapter 2 Definitions 1.1, 1.3: unchanged, verified in ~6.
- 3.1 (B2.1) and 3.2 (B2.2), changed locators: the oriented cobordism relation is the Definition preceding Lemma 17.2 (`line 5452`, p.207); the graded ring and the sign `M₁×M₂ ≅ (−1)^(mn) M₂×M₁` are at `lines 5470–5481`, pp.207–208. "Chapter 17, Lemma 17.2" and "Chapter 17, pp.207–208" are exact.
- 8.1 (B3.2(b)), changed supplier citations: SpinGeometry as above. Atiyah `a9cc0fdc line 419` is Proposition (4.1) (a Riemann surface with Spin structure is a Spin boundary iff the mod 2 index vanishes) and `line 432` Theorem 3′ (2^(g−1)(2^g+1) bounding Spin structures), both on p.58 (`line 415`); `line 417` gives the elliptic curve as the example where the invariant is nonzero, which is the README's Lie-spin torus.
- The other sampled targets (2.1, 3.3, 3.4, 4.1, 4.2, 4.4, 5.2, 5.6, 6.3, 6.6, 7.2, 8.5, 9.2) are untouched by the diff; their verification against Thom (`25813484`), Miller (`c70bf1f2`), Wall (OCR), Borel–Hirzebruch (`84114d0a`), Führing (`06e4566a`), Kreck–Stolz (`79bfdd3a`) and Rosenberg–Stolz stands as recorded in ~6 and ~5.

### Ownership

The diff adds no construction. The Spin-surface quadratic refinement and the ΩSpin₂ filling theorem (8.1–8.2) remain claimed here and by no roadmap on main or in the brief's checkouts: GeometricTopology at #903 owns the finite algebra and the Seifert/knot refinement and names TangentialBordism as the consumer for the Spin-surface refinement (`rev/903 README.md:1402`); FourManifolds #936 consumes B3.2(b)–(c) (`rev/936 README.md:585`, `:627`, `:704`, `:1689`) and builds only the knot/proper-link Arf invariant; HomotopySpheres #1287 consumes B3.2 (`rev/1287 README.md:781`). Ownership against open pull requests whose files the brief does not supply was not checked.

### Adversarial mathematics table

Rows marked "new" were computed in this review for the changed statements; rows marked "~6", "~5" or "~4" carry the values computed in those reports for passages the diff leaves untouched.

| Statement / target | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| Gap: even dimension from nondegenerate polar form | any (V, q) over F₂ | polar(x,x) = q(2x) − 2q(x) = 4q(x) − 2q(x) = 0, so the polar form is alternating; nondegenerate alternating forces dim V = 2m; V = 0 gives m = 0 | Pass, new |
| Gap: Arf by symplectic basis, basis independence | hyperbolic q = xy, bases {(1,0),(0,1)} and {(1,0),(1,1)}; anisotropic q = x²+xy+y², bases {(1,0),(0,1)} and {(1,1),(0,1)} | second basis is symplectic: polar((1,0),(1,1)) = q(0,1) − q(1,0) − q(1,1) = 1; Arf = 0·1 = 0 and 0·1 = 0 (hyperbolic); 1·1 = 1 and 1·1 = 1 (anisotropic) | Pass, new |
| Gap: Gauss sum | m = 0; H; A; H⊕H; H⊕A; A⊕A | 1 = 2⁰; 3 − 1 = 2; 1 − 3 = −2; 10 − 6 = 4 = +2²; 6 − 10 = −4; 10 − 6 = 4 | Pass, new |
| Gap: q-zero count | m = 0; m = 1 (H, A); m = 2 (H⊕H, H⊕A, A⊕A) | 1; 3 = 2+1, 1 = 2−1; H⊕H: 3·3 + 1·1 = 10 = 8+2; H⊕A: 3·1 + 1·3 = 6 = 8−2; A⊕A: 1·1 + 3·3 = 10; formula at m = 0 would be junk in ℤ, the README states count 1 separately | Pass, new |
| Gap: additivity and classification | H⊕A, A⊕A | Arf(H⊕A) = 0+1 = 1; Arf(A⊕A) = 1+1 = 0 = Arf(H⊕H), the same zero count 10, so A⊕A ≅ H⊕H as the classification says | Pass, new |
| Gap: Lagrangian criterion | H (m = 1); A; A⊕A; H⊕A (m = 2) | H: span(1,0) is q-zero of dimension 1; A: no nonzero q-zero vector; A⊕A: the diagonal {(v,v)} has q = 2q(v) = 0, dimension 2; H⊕A: the five nonzero q-zero vectors (1,0,0,0), (0,1,0,0), (1,1,v) for q_A(v) = 1 pairwise sum to vectors of q = 1, so no q-zero plane, consistent with Arf 1 | Pass, new |
| Gap: wrong models excluded | Arf ignoring the pairing; Gauss sum normalised by 2^(2m); Lagrangian without the dimension | would give Arf(A) = 0; would give 1/2 on H; the zero vector of H alone would qualify: each is excluded by a stated law | Pass, new (as ~6) |
| 1.1 Checks | V = 0; H; A; A⊕A | Arf 0 and Gauss sum 1; Arf 0 with q-zero line; Arf 1 with no nonzero zero; diagonal q-zero plane of dimension 2 = m | Pass, ~6 |
| 8.1 circle lifts versus q | periodic lift (trivial Spin(1)=ℤ/2 cover); antiperiodic lift (connected double cover) | periodic = Lie framing of the circle, does not extend over the disc, q = 1; antiperiodic = framing induced from the disc, q = 0; matches "q = 0 on a disc boundary, q = 1 on the Lie-framed circle" | Pass, new |
| 8.1 torus lifts through H¹ | the four lifts (q(a), q(b)) ∈ F₂² | q(a+b) = q(a)+q(b)+1; Arf = q(a)q(b): (0,0), (0,1), (1,0) give Arf 0 and bound; (1,1) gives Arf 1; three bounding lifts = 2⁰(2¹+1) = 3, Atiyah Theorem 3′ at g = 1 | Pass, new |
| 8.1 surface refinement | standard torus | q(a+b) = q(a)+q(b)+a·b in both cases | Pass, ~4 |
| 8.2 filling criterion / handle | genus 0, 1, 2; A⊕A | bounding counts 1, 3, 10 of 1, 4, 16; diagonal q-zero plane | Pass, ~4 |
| 2.4 collared witnesses | I×M; reversed; empty | boundary M − M = 0; reversal flips signs; the locator now names the theorem (collar) and lemma (equivalence relation) that supply exactly these two witnesses | Pass, new locator; values ~4 |
| 3.1 inverses / 3.2 interchange sign | O points; SO signed points; signed points; lines in RP² | 1+1 = 0; +1−1 = 0, +1+1 = 2 ≠ 0; (+)(−) = −; swap sign (−1)^(mn) at `line 5480` | Pass, ~4 (locator new) |
| 8.4 parallelization headline: empty M | M = ∅ | frame is the empty function; positivity and both ContMDiff conditions vacuous | Pass, ~6 |
| 8.4 headline: ℝ³ and half-space | coordinate frame, chart = id | det = 1 > 0; both bundle maps are products, smooth | Pass, ~4 |
| 8.4 headline: wrong-orientation frame | negate e₁ | det = −1, fails positivity in the same atlas | Excluded, ~4 |
| 8.4 headline: nonorientable guard | RP²×ℝ | w₁ ≠ 0, no oriented atlas, hypothesis fails; statement not asserted | Pass, ~4 |
| 8.4 headline: countable union of half-spaces | componentwise frames | det 1 on each component; no compactness used | Pass, ~4 |
| 8.4 obstruction dimensions | BS³, 3-complex | first obstruction in H⁴ = 0 | Pass, ~4 |
| 5.6 graph-embedding ranks | (d,e,r) = (0,1,1),(0,1,2),(2,2,5),(1,3,3) | normal rank r+e−d = 2,3,5,5; shift r − rank = d − e = −1,−1,0,−2 | Pass, ~5 |
| 5.6 point into oriented circle | d = 0, e = 1, n = 1 | shift −1; degree-one cycle has one positive preimage | Pass, ~5 |
| 6.2 field duality without finiteness | infinite wedge of circles | H¹ = ΠF₂ = Hom(H₁,F₂) | Pass, ~5 |
| 6.2 why a field | RP² with ℤ versus F₂ | Hom(H₁(RP²;ℤ),ℤ) = 0; over F₂ the pairing is nonzero | Pass, ~5 |
| 6.2 point numbers do not detect over X | id: S¹→S¹ | all point numbers 0; joint number 1 | Pass, ~5 |
| 9.4 Borel–Hirzebruch conversion | k = 1,2,3 | (1,0), (1,2,7), (1,4,12,8); p₁ = (2q−4)u | Pass, ~5 |
| 9.4 sign conversion | quaternionic line as ℂ²-bundle | Chern roots ±x₁, c₂ = −u; p(HP²) = 1+2u+7u² | Pass, ~5 |
| 10.2 closed-fibre boundary | F = S¹, base I | ∂(I×S¹) coefficients (+1,−1), sum 0 | Pass, ~5 |
| 10.2 interval-fibre exclusion | F = I, base pt, A = ∅ | two boundary points, no map to ∅ | Excluded, ~5 |
| Conventions: tangent/normal inverse; boundary | oriented point; positive I | inverse 0; ∂I = [1]−[0] | Pass, ~4 |
| 2.1 fixed-face transversality | f(t) = t fixed at 0; f(t) = 1+t | face rank 0 < codim 1; second misses Z | Pass, ~4 |
| 2.1 tubes/rounding/doubles | I ⊂ I×ℝ; quadrant; I, ∅ | normal rank 1; one boundary arc; doubles S¹, ∅ | Pass, ~4 |
| 2.2 zero-dimensional orientation; product sign | ±pt; two lines; pt×line | two rays, one empty basis; −1, +1 | Pass, ~4 |
| 2.2 half-space orientation | I endpoints; dimension 3 | signs +,−; det +1 | Pass, ~4 |
| 2.3 quotient adapters; disc/sphere bundle | ℤ on ℝ; irrational flow; ranks 1,0 | S¹ Hausdorff; not Hausdorff; ∂D¹ = S⁰, D⁰ = pt | Pass, ~4 |
| 2.5 relative-cycle face | (I,∂I)→(I,∂I); →(pt,∅) | second impossible | Pass, ~4 |
| 2.6 small representatives | ∅; one point; two points in ℝ⁰ | cardinalities 0,1; ℝ⁰ cannot separate two | Pass, ~4 |
| 2.7 quartic / reversal / E(1) | degree 4; F = 3H−ΣE_i | χ = 24, p₁ = −48, σ = −16, Â = 2; reversed +48, +16, −2; F² = 0, χ = 12, σ = −8 | Pass, ~4 |
| 3.3 connecting map / excision | (I,∂I); (X,X); two points | ∂[I] = [1]−[0]; 0; F₂² or ℤ² | Pass, ~4 |
| 3.4 orientation map | pt, ∅, points over x,y | 1,0,(1,0),(0,1) | Pass, ~4 |
| 4.1 diagonals / Sq / Cartan / Adem | edge; a ∈ H¹(RP∞); a²; Sq¹Sq¹a | ∂(−e⊗e) = AW−T·AW; Sq¹a = a², Sq²a = 0; Sq²a² = a⁴; 0 | Pass, ~4 |
| 4.2 simple system / transgression / Adams d₂ / completion | F₂[a]; K(F₂,2); (1,2); Prüfer | a⁴ new; d₂:(0,1)→(2,0); target (3,3); 0 versus ℤ₂ | Pass, ~4 |
| 4.3 Wu / Thom relation | RP²; trivial line; tautological | Sq(1+a) = 1+a+a² = w; SqU = U; Sq¹U = aU | Pass, ~4 |
| 4.4 odd operations / Kudo / Milnor degrees | p = 3 | P¹y = y³; τy = 2βι₂; ξ₁ degree 4, τ₀ degree 1 | Pass, ~4 |
| 5.1 collapse / stabilization | framed point; trivial line | degrees +1, 0; S¹→S² degree +1 | Pass, ~4 |
| 5.2 finite embedding dependence; low rank | a+,b+,a−,b−; n = k = 0 | word length 4 vs 0, abelianize 0; ℝ⁰ holds ≤ 1 point | Pass, ~4 |
| 5.3 inverse | degree-one and constant | +pt and ∅ | Pass, ~4 |
| 5.4a–c transformation / relative / stable | X = {x,y}; (I,∂I); commutator | (1,0),(0,1); +1−1; stabilized 0 | Pass, ~4 |
| 5.5 framed comparison | +pt; η³ | 1↦1; 12ν ↦ 0 in ΩSpin₃ | Pass, ~4 |
| 5.7 AHSS | pt; degree 0; two components | only p = 0; (0,0); two copies of Ω₀ | Pass, ~4 |
| 6.1 multiplicities | degrees 0–4 | 1,0,1,0,2 (x₄, x₂²) | Pass, ~4 |
| 6.3 unoriented generators / exception | RP², RP⁴, H_ℝ(2,4), H_ℝ(1,2) | s = 1,1; binom(6,2) = 15 = 1; Klein bottle 0 | Pass, ~4 |
| 6.4 odd Spin/SO; stable/fixed rank | π₄ at p = 3; oriented 2-planes | 16 a unit; Euler class only unstably | Pass, ~4 |
| 6.5 rational rank / hypersurface / gcd | degrees 4,8; H_ℂ(2,3); N = 2..12 | 1,2; s₂ = −10; 2,3,2,5,1,7,2,3,1,11,1 | Pass, ~4 |
| 6.6 Wall lift / derivations / torsion product | RP²; σ₄; Y₆Y₅ | H¹(RP²;ℤ) = 0; ∂₂σ₄ = σ₂, ∂₂² σ₄ = 1; Y₅² ≠ 0 | Pass, ~4 |
| 7.1 ABS normalization / Clifford signs | +pt; circle; K3 | 1, η, 2u²; squares −1, +1 | Pass, ~4 |
| 7.2 low comparison / degree 8 | degrees 0–7; 8 | ℤ,ℤ/2,ℤ/2,0,ℤ,0,0,0; ranks 2 vs 1 | Pass, ~4 |
| 8.3 Spin three-manifolds | T³; S³ | 0; 12ν ≠ 0 forgets to 0 | Pass, ~4 |
| 8.4 tables; CP² = RP²×RP² in ΩO₄ | degrees 0–4; (w₄,w₂²) | as listed; (1,1) both | Pass, ~4 |
| 8.5 projective fillings / twistor sign | n = 1,2; q = 1 | ∂D² = RP¹; S³/±1; fibre S²; det −4 | Pass, ~4 |
| 9.1 idempotent charts | v = (1,0,0),(1,1,0); 0; id | P² = P, trace 1; traces 0,3 excluded | Pass, ~4 |
| 9.2 Clifford relations / volume | nine generators; flip C₈ | 2δI₁₆; −I₁₆ vs +I₁₆ | Pass, ~4 |
| 9.3 normal Bott / OP² data | OP¹ ⊂ OP²; p₂ = 6u, p₄ = 39u² | e(ν) = u, ∫u = 1; (381·39−19·36)/14175 = 1 | Pass, ~4 |
| 9.4 obstruction table / HP² signature | RP², CP², HP², OP² | w₁ = a; w₂ = h; λ = u; H⁴ = 0; (49−4)/45 = 1 | Pass, ~4 |
| 10.1 realization range / degree 7 | C₃ even; lens product | H_even>0(C₃;ℤ) = 0; coefficient 2 ≠ 0 in F₃ | Pass, ~4 |
| 10.3 kernels / semidirect / degree 5 | RP², CP²; conjugation; P(1,2) | nonzero generators; degree +1, i↦−i; ∫w₂w₃ = 1 | Pass, ~4 |
| 10.4 isotropy / PSC / BG / Sq tables / Gysin / KO Pontryagin / cover index / Ext / Newton | as in ~4 | 1+1 = 0 in π₁SO₈; Scal ≥ 56; w₈ = w₁₂ = 1; all differences 0; π!u₄² = 1; π₁ = [ℓ_ℝ]−2; k = 0,8,10; a² = 4b; −10, −28, gcd 28 | Pass, ~4 |

The new rows show that the gap sentence, 1.1's Checks, 8.1's circle and torus values and Atiyah's count all agree with one another on every instance tried; no repair introduced an inconsistency.

## Not verifiable

- GeometricTopology §4.3.1 exists only at the head of its open revision (#903), where it was read; on main the roadmap has no such section. Under the declared gap this is the intended state, not a defect.
- Lee, *Introduction to Smooth Manifolds* (Springer, paywalled); Milnor 1960 (JSTOR); Atiyah–Bott–Shapiro (Elsevier); Anderson–Brown–Peterson (JSTOR); McCleary (Cambridge); Stong (publisher page); Gompf–Stipsicz (AMS); Stolz 1992 (JSTOR); mathlib4#31350 (not a text in the cache): cited by locator alone, as in the previous reports. No `sources.toml` exists for this roadmap and nothing was edited.

## Source issues

- none
