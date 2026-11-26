# Review of SteinFunctionAlgebras (pull request #3185 at 7c419ba)

**Verdict:** needs changes

**Summary.** Changes are needed: seven findings. The mathematics first: the meromorphic translation of Cousin II (Lemma 4.3) is false as stated and rests on a divisor dictionary no cited roadmap states; the openness step in the proof of the reconstruction theorem 5.2 is wrong; and Corollary 5.4 calls the composition-reversing map `f ↦ f^*` a group isomorphism. On the plan side, `pullbackAlgHom` is a definition with a `sorry` body, the Stein predicate is owned twice (RealAnalyticGeometry §3.0 on main already owns it, in a different form), and Lemma 1.2 is already proved in the pinned Tau Ceti. There are six small corrections and four format notes; one ownership question (the general embedding here against the tube case of RealAnalyticGeometry §4.1) is left to the human reviewers.

## R01 (P1) — `pullbackAlgHom` is a definition whose body is `sorry`, so automatic holomorphy and full faithfulness are stated about an unspecified map

`Suggested.lean` line 157 declares `pullbackAlgHom … : HolFunctions F Y →ₐ[ℂ] HolFunctions E X := by sorry`. The two theorems that mention it (`exists_unique_holomorphicMap_of_algHom`, line 167, and `bijective_pullbackAlgHom`, line 180) therefore say nothing about precomposition: nothing ties the map to `h ↦ h ∘ f`, so they do not state Theorem 3.2 and Corollary 3.3 of the README. A definition with a `sorry` body is also excluded by the rules for the file.

The pinned Tau Ceti has the map. `TauCeti.holomorphicStructureSheaf.precomp` (`TauCeti/Geometry/Manifold/Complex/StructureSheaf/Basic.lean`, line 259) is the ring homomorphism on sections, and at the top open set its target is the algebra of global sections up to definitional unfolding. I checked on a copy of the file that the following body elaborates, and that `evalAt x (pullbackAlgHom f hf h) = evalAt (f x) h` then holds by `rfl`:

```lean
  { TauCeti.holomorphicStructureSheaf.precomp (I := 𝓘(ℂ, E)) (X := X) f hf (op ⊤) with
    commutes' := fun _ => rfl }
```

Replace the `sorry` by this body (the type is unchanged, so the theorems need no edit).

## R02 (P1) — Lemma 4.3 is false: `c_{i i_0}` is not a meromorphic function on `U_i`, and on a general complex manifold a multiplicative cocycle need not come from meromorphic data

Lemma 4.3 (README lines 500–506) is stated on an arbitrary complex manifold and says of a Cousin II datum that "the meromorphic functions `f_i = c_{i i_0}` on `U_i` have ratios `c_{ij}`". The function `c_{i i_0}` lives on `U_i ∩ U_{i_0}` only. Take `X = ℂ`, `U_0 = {Re z < 1}`, `U_1 = {Re z > 0}`, `c_{10} = exp(1/(z − 2))`, a unit on the strip `0 < Re z < 1`: it has an essential singularity at `2 ∈ U_1`, so it is not meromorphic on `U_1`. The general claim also fails beyond this construction: on a complex torus of dimension at least two with no hypersurfaces, a nontrivial line bundle of `Pic⁰` has no nonzero meromorphic section (its divisor would be zero and the bundle trivial), so its cocycle is the ratio of no meromorphic data. Convention 5 (lines 66–68) repeats the claim: "conversely every such cocycle comes from meromorphic data".

The forward direction is correct. The converse is true on a Stein manifold, by a different argument: Cartan's theorem A (RealAnalyticGeometry §3.2) for the invertible sheaf of `L_c` gives a global holomorphic section not identically zero on any component, and its local expressions `f_i` are holomorphic with `f_i / f_j = c_{ij}`. Restrict the converse in Lemma 4.3 and Convention 5 to Stein `X` with this proof, and state solvability as the existence of a global meromorphic `f` with `f / f_i ∈ O^*(U_i)` (the phrase "glue to a global meromorphic function" does not say this). Theorem 4.4, in the cocycle formulation, is unaffected.

## R03 (P2) — The divisor dictionary that Lemma 4.3 cites is not in ComplexManifolds §7.3, and the meromorphic functions it uses have no owner

The Dependencies of Layer 4, the scope section and the supplier contracts each say that ComplexManifolds §7.3 owns "the divisor dictionary" used "for the meromorphic translation of Cousin II" (lines 587–588, 735–737, 809–811). ComplexManifolds §7.3 on main (its README, lines 835–848) proves the triviality criterion through a nowhere-vanishing section and that cocycle isomorphisms are the bundle equivalences; it has no meromorphic function, no divisor and no dictionary (the only divisor line bundle there is the hypersurface case of §7.4). ComplexKahlerGeometry §4.5 has none either. At the same time line 508 says that meromorphic function theory on manifolds "is not part of this roadmap". So the sheaf of meromorphic functions on a complex manifold, which Lemma 4.3, Convention 5 and the scope item "the Cousin II dictionary (Lemma 4.3)" all need, is supplied by nobody.

Either make it a target of §4.1 (the sheaf of meromorphic functions of a complex manifold as the sheaf of total fractions of `O_X`, with the two facts Lemma 4.3 uses), or drop the meromorphic formulation from what the roadmap owns and keep the cocycle statements only; in both cases remove the divisor dictionary from the three citations of §7.3.

## R04 (P2) — The openness step in the proof of Theorem 5.2 is wrong: the preimage of the polydisc under `F` is in general larger than `V`

The proof (lines 615–621) takes `F` with injective differential at `x`, a neighbourhood `V` mapped homeomorphically onto a polydisc, and concludes "the image of `V` is an intersection of Gelfand-open sets". The sets `{y : |F_j(y) − c_j| < ε}` are subsets of all of `X`, and their intersection is `F⁻¹(polydisc)`, which contains every other point of `X` that `F` sends into the polydisc. For `X = ℂ`, `F(z) = z²`, `x = 1`: `F⁻¹({|w − 1| < ε}) = V ∪ (−V)`, so the Gelfand-open set is not the image of `V`. A local coordinate map gives no control away from `x`.

The theorem is true and SF1 already contains what proves it. By Theorem 1.1 and Corollary 1.4 there is a closed embedding `ι : X → ℂ^N`, so the topology of `X` is the initial topology of the `N` functions `ι_j ∈ O(X)`; the initial topology of all of `O(X)` is therefore at least as fine as the manifold topology, and it is no finer because every element of `O(X)` is continuous. Replace the openness paragraph by this argument (the layer's Dependencies already list SF1).

## R05 (P2) — Corollary 5.4: `f ↦ f^*` reverses composition, so it is an anti-isomorphism of groups, not an isomorphism

Corollary 5.4 (lines 638–642) says the biholomorphism group is isomorphic to the automorphism group of `O(X)` "by `f ↦ f^*`", and its proof says that `f ↦ f^*` "preserves composition". Definition 3.1 of the same README gives `(g ∘ f)^* = f^* ∘ g^*`. On the three-point Stein manifold of the Check at line 663, with `σ = (1 2)` and `τ = (2 3)`: `(σ ∘ τ)^* = τ^* ∘ σ^*`, and `τ^* ∘ σ^* ≠ σ^* ∘ τ^*` because `σ ∘ τ ≠ τ ∘ σ` in `S₃` and `f ↦ f^*` is injective. So the stated map is not a homomorphism.

State the corollary with `f ↦ (f⁻¹)^*`, or as an anti-isomorphism (an isomorphism onto the opposite group), and change "preserves composition" to "reverses composition" in the proof.

## R06 (P2) — The Stein predicate and the holomorphic hull are owned twice, in two different forms

The scope section says this roadmap owns "the Stein predicate, the holomorphic hull and their basic API (SF0)", including that `ℂ^n` is Stein. RealAnalyticGeometry on main owns the same objects: its §3.0 defines the predicate and proves that `ℂⁿ` is Stein and that the predicate is biholomorphism-invariant (its README, lines 1385–1390), its scope paragraph lists "the Stein predicate" under R3.0 (line 1985), and its `Suggested.lean` declares `IsStein` and `holomorphicHull` (lines 255 and 264). Every supplier theorem this roadmap consumes (`nonempty_generatingSections_of_isStein`, `subsingleton_sheafH_of_isStein`, the converse exhaustion theorem of §3.1) is stated for that predicate.

The two forms differ. There the hull is `{x | ∀ f, ∃ y ∈ K, ‖f x‖ ≤ ‖f y‖}` and the third axiom asks for finitely many global functions with jointly injective differential; here the hull is given by bounds `B` and the third axiom asks for one map to the model. They agree on compact `K` (the supremum is attained; both give the empty hull for `K = ∅`) and on finite-dimensional models (compose the `r` functions with a linear map `ℂ^r → ℂ^n` injective on the image of the differential), but no target states this, so Cartan's theorems are consumed at a predicate they are not stated for. The README adds a third candidate owner, a Tau Ceti class that is not at the pin (C06), and leaves SF0 conditional on it ("if present; otherwise … are the targets of SF0").

Cite RealAnalyticGeometry Convention 8 and §3.0 as the owner of the predicate, the hull and the Stein property of `ℂⁿ`; keep in SF0 what that roadmap does not state (Lemma 0.2, the Hausdorff property, compact Stein manifolds are finite); and either use its form of the two definitions in `Suggested.lean` or add the equivalence of the two forms, for a finite-dimensional model, as an SF0 target. Remove the conditional.

## R07 (P2) — Lemma 1.2, the inverse function theorem on manifolds, is already proved in the pinned Tau Ceti

The Dependencies of Layer 1 (lines 301–303) say that Lemmas 1.2 and 1.3 are targets because Mathlib "records the manifold inverse function theorem as a TODO", and the scope section lists Lemma 1.2 as owned. The pinned Tau Ceti has it: `isLocalDiffeomorphAt_of_mfderiv_eq` (`TauCeti/Geometry/Manifold/LocalDiffeomorph/Basic.lean`, line 358) proves that a `C^n` map, `1 ≤ n` in `WithTop ℕ∞` (so `ω` is included), over any complete nontrivially normed field, whose `mfderiv` at an interior point is a continuous linear equivalence, is a `C^n` local diffeomorphism there; the global form `isLocalDiffeomorph_of_mfderiv_eq` is at line 459. This is Lemma 1.2 with `𝕂 = ℂ`, `n = ω`.

Delete Lemma 1.2 as a target, cite the declaration under "From Tau Ceti", and point the proofs of Lemma 1.3 and of Theorem 5.2 at it. Lemma 1.3 stays: I found no proper-injective-immersion theorem at either pin.

## C01 — The Dependencies of Layer 0 name the wrong direction of the Stein criterion

Lines 178–180: R3.1 "supplies the converse Stein criterion, that a strictly plurisubharmonic exhaustion makes a complex manifold Stein; SF1 uses it to know that the manifolds it embeds satisfy Definition 0.3." The manifolds SF1 embeds are Stein by hypothesis. What SF1 needs is the other statement of RealAnalyticGeometry §3.1, the converse exhaustion theorem (every Stein manifold has a smooth strictly plurisubharmonic exhaustion, README lines 1547–1556 there), which is what makes its weighted and Oka–Weil results apply to a general Stein `X`. Say that.

## C02 — The remark after Lemma 1.5 gives a non-example that is not an instance of the lemma

Lines 272–274 say part (4) fails on `ℂ^n ∖ {0}` because "the ideal of the missing point is not globally generated"; the missing point is not in the manifold and has no ideal sheaf there (and in `ℂ^n` its ideal is generated by the coordinates). An actual failure in the ambient manifold `M = ℂ^n ∖ {0}`, `n ≥ 2`: `X = {(1/k, 0, …, 0) : k ≥ 1}` is a closed submanifold of `M`, `a = (2, 0, …, 0) ∉ X`, and every `f ∈ O(M) = O(ℂ^n)` vanishing on `X` vanishes on the whole `z_1`-axis, so `f(a) = 0`. The sentence at lines 358–360 ("exactly the failure of that lemma") needs the same care.

## C03 — Two Checks are attached to the wrong object

In the Checks of Layer 0 (line 156), "the function `z ↦ z_1` shows that the hull of a point is the point" holds only for `n = 1`; for `n ≥ 2` one coordinate gives `|x_1| ≤ |a_1|` and nothing more. The functions `z_j − a_j`, `1 ≤ j ≤ n`, do it. In the Checks of Layer 3 (line 464), the example headed "`X = ℂ`, `Y = ℂ^*`" discusses the inclusion `ℂ^* → ℂ`, which is a map with `X = ℂ^*`, `Y = ℂ` in the notation of Theorem 3.2.

## C04 — "Continuous but not a homeomorphism" for the Zariski topology needs positive dimension

Line 624 states for every Stein `X` that the evaluation map is not a homeomorphism for the Zariski topology on the character space. For a finite `X` the indicator functions are in `O(X) = ℂ^X` and make every point Zariski-open, so the two topologies agree. Add "for `X` of positive dimension".

## C05 — Demailly's definition is cited for three axioms it does not use

Line 122 calls the three conditions "the standard definition" with the locator Demailly, Chapter I, §6. Demailly's Definition (6.16) (DemaillyAG line 2404) has two axioms, holomorphic convexity and local separation of points; the section is titled "Domains of Holomorphy and Stein Manifolds". Cite (6.16) as an equivalent two-axiom definition, or keep only the Hörmander locator for the three-axiom form.

## C06 — Several library and project pointers do not resolve at the pins

`TauCeti.IsSteinManifold`, `TauCeti.mholomorphicHull` and the file `TauCeti/Geometry/Manifold/Complex/Stein.lean` (lines 146–151, 176, 300, 776–779) do not exist in the pinned Tau Ceti, yet line 146 asserts as a fact that the class "is this predicate"; the module docstring of `Suggested.lean` says correctly that the pin predates it. The Downstream paragraph cites "Toposify's Milestone H7" and a file `Toposify/Holomorphic/Manifold/StructureSheaf.lean` (lines 677–685); Toposify is no roadmap on main or in an open pull request and is not in the pinned libraries, so a reader cannot find it. Say what Toposify is with a reference, or describe the consumer without the file path.

## N01 — Library names without their namespace

The sheaf API is cited as `TauCeti.precomp`, `TauCeti.evalHom`, `TauCeti.eval`, `TauCeti.germ_evalHom`, `TauCeti.ofContMDiff`, `TauCeti.homOfContMDiff`; at the pin these are `TauCeti.holomorphicStructureSheaf.precomp` and so on. `IsImmersion` and `IsSmoothEmbedding` are `Manifold.IsImmersion` and `Manifold.IsSmoothEmbedding`; `Module.Finrank` is `Module.finrank`.

## N02 — Section labels the suppliers do not define

RealAnalyticGeometry defines the labels R1.1, R2.1 and R3.0–R3.2 only, and ComplexKahlerGeometry has no label K3.4: cite "RealAnalyticGeometry §4.1" and "ComplexKahlerGeometry §3.4" (the sections exist under those numbers).

## N03 — Theorems 2.2, 3.2, 4.4 and 5.2 carry no source locator

The character theorem, automatic holomorphy, the Cousin II criterion and the reconstruction theorem are stated with no locator at the claim; the reference list gives chapters only (Grauert–Remmert, Gunning–Rossi). A theorem-level locator at each would let a reader check the hypotheses.

## N04 — Module docstring of `Suggested.lean`

"README §§2.0–2.1" should read "§2.1, Lemmas 2.0 and 2.1" (there is no §2.0). The second bullet under "Not stated here" is a remark about hypotheses, not an unstated theorem, and Corollary 5.4 (the automorphism group), which is not stated, is not listed there.

## Questions for the author

- The reference list places "Stein spaces, Stein algebras, the character space, and the Cousin problems" in Grauert–Remmert, *Coherent Analytic Sheaves* (Grundlehren 265), Chapters V–VI, and "Stein algebras … its spectrum" in Gunning–Rossi, Chapter VI. Is the first meant to be *Theory of Stein Spaces* (Grundlehren 236), and the second Chapter VII? I could not read either book (paywalled, no open copy), so this is a question.
- Hörmander's Definition 5.1.3 and the numbers (7.2.2)–(7.4.3) could not be read; do (7.2.2)–(7.2.9) and (7.4.3) belong in this README at all, since the results are RealAnalyticGeometry's?

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 hull (Def 0.1, Lemma 0.2) | `K = ∅`; `K` compact; unit circle in `ℂ^*` | `f = 1, B = 0` gives `1 ≤ 0` false, hull empty; sup attained so both forms agree; `z`, `1/z` give `|x| = 1` | sound | C03 (point hull needs all `z_j − a_j`) |
| 0.2 Stein predicate (Def 0.3, Prop 0.4) | `n = 0`; uncountable discrete; `ℂ^n ∖ {0}`; main's form | dim 0: hull `K = K`, `F : X → ℂ^0` injective differential; main: `∃ y ∈ K`, finitely many functions | equivalent on finite-dim models, not stated | R06, C05 |
| 1.1 embedding (Thm 1.1; Lean line 114) | `X = ∅`; `n = 0` countable; uncountable discrete; corank count | `∅ → ℂ^0` ok; `N ≤ 1`; uncountable discrete: no proper map to `ℂ`, second countability in signature; `(n+2−k) − (n−k²) = k²−k+2 > 0` | sound; Forstneric2018 line 97–98 gives `N > 2n` | none |
| Lemma 1.2 | pinned Tau Ceti | `isLocalDiffeomorphAt_of_mfderiv_eq`, any `𝕂`, `1 ≤ n` | already proved | R07 |
| 1.2 ideal sheaf (Lemma 1.5) | `ℂ^n ∖ {0}` with `X = {(1/k,0,…)}`, `a = (2,0,…)` | every `f` vanishing on `X` vanishes on the axis, `f(a) = 0` | lemma sound; remark garbled | C02 |
| 2.1 Hadamard, Lemma 2.1 (Lean 128, 139) | `N = 0`; `N = 1` | empty sum, `f z − f a = 0` on the one-point polydisc; `f(z) − f(a) = (z − a) g(z)` | sound | none |
| 2.2 character theorem (Lean 146) | `X = ∅`; `ℂ^*`; `ℂ^n ∖ {0}`; `ℙ¹` | `O(∅) = 0` has no character, vacuous; no character at `0` since `c·0 = 1`; characters `= ℂ^n`; one character | sound | none |
| 2.3 character space (Cor 2.3) | `O(ℂ)`, ultrafilter ideal on a discrete sequence | `g ∉ M_U`: choose `h` with zeros exactly on `{g ≠ 0} ∩ S`, `(g, h) = (1)`; quotient contains nonconstant `z` | sound | none |
| 3.1 pullback (Def 3.1; Lean 157) | body | `sorry`; real body from `precomp` at `op ⊤` elaborates, evaluation law by `rfl` | sorried data | R01 |
| 3.2 automatic holomorphy (Lean 167) | `X = ∅`; `Y = ∅`; `Y = ℙ¹`; `X = ℙ¹, Y = ℂ` | unique hom to `0`, unique map from `∅`; hom `0 → O(X)` forces `X = ∅`; uniqueness fails; constant map at `a` | sound once R01 is repaired | R01, C03 |
| 3.3 full faithfulness, Cor 3.4 (Lean 180, 208) | `X = Y = ∅` with `m ≠ n`; `ℂ` | both sides nonempty; automorphisms `az + b` | sound once R01 is repaired | R01 |
| 4.1 Lemma 4.3 | cover `{Re z < 1}, {Re z > 0}`, `c_10 = exp(1/(z−2))`; torus without hypersurfaces | essential singularity at `2 ∈ U_1`; nontrivial `Pic⁰` bundle has no meromorphic section | false | R02, R03 |
| 4.2 exponential sequence | Demailly V (9.2), VI (9.1) | DemaillyAG line 13040 (p. 264), line 15569 (p. 314); ComplexKahlerGeometry §4.5 owns it, `exp(2πi f)` | sound | none |
| 4.3 Cousin II (Thm 4.4, Cor 4.5) | `ℂ^n`; `ℂ^*`; quadric; `ℙ¹`; sign of `δ` | `H² = 0`; `H² = 0`; `H² = ℤ`; `O(1)` unsolvable; vanishing insensitive to sign; injectivity needs `H¹(O) = 0` only | sound | none |
| 4.4 Cousin I | RealAnalyticGeometry §3.2 item 1 | "own the scalar Cousin I splitting", `Hᵏ(X, O) = 0` | citation resolves | none |
| 5.1 functor | contravariance | `(g ∘ f)^* = f^* ∘ g^*` | sound | none |
| 5.2 reconstruction (Thm 5.2; Lean 223) | `X = ℂ`, `F = z²`, `x = 1`; `X = ∅`; finite `X` | `F⁻¹(disc) = V ∪ (−V)`; empty homeomorphism; discrete | theorem sound, proof step false | R04 |
| 5.3 consequences (Cor 5.3, 5.4) | `S₃` on three points, `σ = (1 2)`, `τ = (2 3)` | `(στ)^* = τ^* σ^* ≠ σ^* τ^*` | 5.3 sound; 5.4 direction wrong | R05 |
| 5.4 what is not claimed | finite `X`, Zariski | indicators make points open; topologies agree in dimension 0 | bullets sound | C04 (line 624) |

- Source locators checked against the text: 9 (Forstneric2018 Theorem 2.1 line 97, Proposition 2.2 line 113, route lines 124–146; DemaillyAG (6.16) line 2404, V (8.2) and (9.2) p. 264, (9.5) p. 265, VI (9.1) p. 314, II (8.7)–(8.8) lines 5839–5843).
- Library declarations opened at the pin: 9 (`holomorphicStructureSheaf` Basic.lean 68, `precomp` 259, `homOfContMDiff` 282, `evalHom` 193, `eval` 210, `germ_evalHom` 215, `ofContMDiff` 166; `isLocalDiffeomorphAt_of_mfderiv_eq` LocalDiffeomorph/Basic.lean 358; Mathlib `LocalDiffeomorph.lean` line 42).
- Cross-roadmap citations resolved on main: RealAnalyticGeometry §§3.0, 3.1, 3.2, 4.1 and its three declaration names; ComplexKahlerGeometry §§3.4, 4.5; ComplexManifolds §7.3 (divisor dictionary absent); ComplexComparisonPartII C4.1 and its two names.
- Dependency check: `depcheck: 23 roadmaps, 114 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: the file builds with `sorry` warnings only. On a copy of the file, `#check @name` for the cited library names, the real body of R01, and the one-tactic probe (`rfl`, `simp`, `infer_instance`) on the eight sorried theorems: none closes, so no padding.
- Elaborated signatures compared with the README statements: no lost binder; README and Lean generality agree for 1.1, 2.0–2.2, 3.2–3.4, 5.2.
- Headline theorems: 1.1, 2.2, 3.2, 3.3, 3.4, 5.2 stated; 4.4 not statable at the pins and named in the docstring; 5.4 not stated and not named (N04).

Overlap check: read RealAnalyticGeometry, Hyperfunctions and SingularHermitianMetricsAndL2Methods (scope and Stein passages), with ComplexKahlerGeometry and ComplexComparisonPartII at the cited sections; shared objects: the Stein predicate, the hull and `ℂⁿ` Stein, owner RealAnalyticGeometry §3.0 (R06); Cartan A and B and Cousin I, owner RealAnalyticGeometry §3.2, cited; the exponential sequence and `Pic`, owner ComplexKahlerGeometry §4.5, cited; the proper embedding, tube case RealAnalyticGeometry §4.1, general case here (for the human reviewers). No other roadmap, on main or open, states the character theorem, automatic holomorphy, Cousin II or the reconstruction theorem.

Source independence: 10 passages compared with 2 sources, none shared (longest common run four words, a standard phrase); largest share DemaillyAG, 8 of about 25 locators, tied with Hörmander, whose text could not be read; contents compared with DemaillyAG (Chapters I–IX): independent.

Research link: the headline targets are the embedding theorems of Remmert (1956), Narasimhan (1960) and Bishop (1961), which Forstnerič's survey (2017, §2.1, Theorem 2.1) takes as the starting point of current work on embedding dimensions of Stein manifolds; the function-algebra theorems are their classical applications. Rests on the README's references and Forstneric2018 lines 93–146.

## Not verifiable

- Hörmander, Definition 5.1.3 and (7.2.2)–(7.4.3): book, no legal copy found by the sources service.
- Grauert–Remmert, *Coherent Analytic Sheaves*, Chapters V–VI: resolves only to a paywalled publisher page.
- Gunning–Rossi, Chapter VI: no legal copy found.
- Remmert 1956, Narasimhan 1960, Bishop 1961, Forster §§26–30, Cartan 1950 and 1955, Oka, Grauert 1958: cited as general references with no locator into a sampled target; not fetched.
- The Toposify milestone and file of the Downstream paragraph: not in the pinned libraries, on main or in an open roadmap pull request.

Automatic checks set aside as false positives: the process-word check flagged "TODO" in a sentence that describes Mathlib's own file, not this roadmap's state; the check that backticked names are declared in the Lean file flagged the Stein criterion's name, which is RealAnalyticGeometry's declaration cited as a supplier's.

## Source issues

- none

## For the human reviewers

- Scope: Theorem 1.1 here is the embedding of every Stein manifold; RealAnalyticGeometry §4.1 on main proves the tube case by the same five-step construction, which the proof route here restates. Which roadmap should own the construction is a design decision.
- Not tested: Hörmander's book ties for the largest share of locators (8 of about 25) and could not be read; wording and arrangement were not compared with it.
- Licence: the Downstream paragraph names a file of a project called Toposify that I could not identify or locate; its status is unknown.
