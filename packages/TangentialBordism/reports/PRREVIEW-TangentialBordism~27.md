# Review of TangentialBordism (pull request #942 at 4e86746)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/TangentialBordism/` at 4e86746. The folder is byte-identical to the head the previous review read. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with six `sorry` warnings and nothing else. Five findings follow. Three are P2: a headline that is statable at the pins but absent, and two objects that another open pull request also owns. Two are P3.

## R01 (P2) — Thom's integral realization theorem (B6.3) is statable at the pins but absent; the docstring's reason does not apply

**Location.** `TauCetiRoadmap/TangentialBordism/Suggested.lean:51–53`: "the integral realization range and its degree-seven counterexample (B6.3) … : there are no geometric bordism groups, bordism orientation maps or associated-family transfer maps". The README states the theorem in 10.1 (`README.md:2897–2899`, `:2935–2941`).

**Claim.** The docstring says B6.3 cannot be stated because there are no geometric bordism groups. The absolute realization theorem does not need bordism groups. It needs only a fundamental class and its push-forward, and the pins have both. The file already restates ΩO_n=0 and ΩSO_n=0 without bordism groups ("every closed manifold bounds"). Surjectivity of ΩSO_n(X)→H_n(X;ℤ) can be restated the same way ("every class is f_*[M]").

**Witness.** The pin defines `TauCeti.HomologicalOrientation.fundamentalClass` and `TauCeti.HomologicalOrientation.mapFundamentalClass`, giving f_*[M] ∈ Hₙ(X;ℤ) for a compact oriented manifold (`TauCeti/AlgebraicTopology/Singular/LocalHomology/FundamentalClass.lean:204`, `:275`, with `hn : finrank ℝ E = n`). The two statements below elaborate on a scratch copy against the pins, with only two `sorry` warnings.

**Repair.**
1. Add `public import TauCeti.AlgebraicTopology.Singular.LocalHomology.FundamentalClass` and a `/-! ## Layer 10: realization and projective transfers -/` section with these two declarations (tested as written, `open AlgebraicTopology` in scope):

   ```lean
   theorem exists_mapFundamentalClass_eq (n : ℕ) (hn : n ≤ 6) (X : Type) [TopologicalSpace X]
       (z : ((singularHomologyFunctor (ModuleCat.{0} ℤ) n).obj
         (ModuleCat.of ℤ (ULift.{0} ℤ))).obj (TopCat.of X)) :
       ∃ (M : Type) (_ : TopologicalSpace M) (_ : T2Space M) (_ : CompactSpace M)
         (_ : ChartedSpace (EuclideanSpace ℝ (Fin n)) M)
         (_ : IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) ∞ M)
         (o : TauCeti.HomologicalOrientation M (EuclideanSpace ℝ (Fin n)) n) (f : C(M, X)),
         o.mapFundamentalClass finrank_euclideanSpace_fin f = z := by
     sorry

   theorem exists_not_mapFundamentalClass_eq_seven :
       ∃ (X : Type) (_ : TopologicalSpace X) (z : ((singularHomologyFunctor (ModuleCat.{0} ℤ) 7).obj
         (ModuleCat.of ℤ (ULift.{0} ℤ))).obj (TopCat.of X)),
         ∀ (M : Type) [TopologicalSpace M] [T2Space M] [CompactSpace M]
           [ChartedSpace (EuclideanSpace ℝ (Fin 7)) M]
           [IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin 7)) ∞ M]
           (o : TauCeti.HomologicalOrientation M (EuclideanSpace ℝ (Fin 7)) 7) (f : C(M, X)),
           o.mapFundamentalClass finrank_euclideanSpace_fin f ≠ z := by
     sorry
   ```

   Their docstrings should cite Thom, Théorèmes III.3 (p.59) and Corollaire III.7 (p.62), and Théorème III.9 with the L⁷×L⁷ example (pp.62–63).
2. In the module docstring, keep only the pair form of B6.3 as not statable. The reason is that the pins have no relative fundamental class of a manifold with boundary: `fundamentalClassOn` is for compact subsets of a boundaryless manifold.
3. Back-tick both names in README 10.1 and in the summary sentence at `README.md:11–16`.

Instances checked:
- n=0: z=Σkᵢ[xᵢ] is realized by |kᵢ| signed points over each xᵢ.
- z=0: realized by M=∅.
- Degree 7: false only if every class were realizable; the lens-space class of 10.1 is not.

## R02 (P2) — The mod-p Steenrod operations and algebras, the Adams towers and the additive MO splitting have two owners: B4 here and BordismFormalGroups F2 at #1854 and #1807

**Location.**
- `README.md:64–66`: "Owned here: the mod p Steenrod algebras and Adams towers (B4.1–2, B4.7), which BordismFormalGroups consumes".
- The same handing-over at `:36–44`, `:1425–1427` ("consumed by item8 and BordismFormalGroups"), `:3274–3276` and `:3290–3309`.
- B4.4 (6.1) constructs MO≃⋁Σ^d HF₂ at `:1926–1938`.

**Claim.** This roadmap owns these objects and hands them to BordismFormalGroups. Two open revisions of BordismFormalGroups claim the same objects and hand them back to this roadmap. Each pull request names the other as the consumer, so the objects have no single owner.

**Witness.**
- #1854 (f28d376), `TauCetiRoadmap/BordismFormalGroups/README.md:55–61`: "single owner of the mod-p Steenrod operations and algebras, the transgression with Kudo's and Borel's theorems, … H^*(K(ℤ/p,n);𝔽_p), the HF_p-based Adams towers …". The same lines say "TangentialBordism consumes F2's Steenrod operations, Steenrod algebras, Adams towers".
- #1854, `:3409–3413` names B4.1–B4.2, B4.4, B4.7 and B4.8 as consumers.
- #1807 (4dfed1c), `:59–75` maps B4.1, B4.2 and B4.7 to F2.2 and B4.4 to F2.5.
- Main's BordismFormalGroups (`:463–464`) still leaves the tower to this roadmap.

**Repair.** Settle one owner with the author of #1854 and #1807 before either pull request merges. State in the description which one merges first.

The merge order favours BordismFormalGroups. It is on main, so it is earlier than this roadmap. As it stands on main it consumes this unmerged roadmap's B4, and the two revisions remove that upward edge. If #1854 merges first:
- In B4.1, replace the construction of Sq^i and its properties (`:1225–1227`) by a citation of F2's "Steenrod algebras and mod-p Adams towers" (#1854 `:566`). Keep the integral higher diagonals and cup-i products, and keep `Sq^k[c]=[c cup_(n−k)c]` as a comparison with F2's operations. FourManifolds consumes those diagonals from here.
- Replace B4.2 and the operations and towers of B4.7 by the same citation.
- Replace B4.4 by a citation of F2's "Unoriented coefficients" (#1854 `:799`).
- Add an F2 row to the supplier table.
- Delete the clauses that BordismFormalGroups consumes B4 (`:36–44`, `:64–66`, `:1425–1427`, `:3274–3276`) and the layering argument at `:3290–3309`. It exists only because of that edge.
- Name #1854 in the merge-order paragraph.

If this roadmap merges first instead, #1854 and #1807 must cite B4.1–B4.2, B4.4 and B4.7 as main does, and drop "single owner".

Test: after the change, exactly one of the two READMEs constructs Sq^i, A_p, the HF_p Adams tower and MO≃⋁Σ^d HF₂, and the other cites it by section.

## R03 (P2) — η³=12ν has two owners: B3.3 here and K3BlochGroups §4.9, which does not cite B3.3 as this README says it does

**Location.**
- `README.md:75–78`: "B3.3 owns the stable-stem relations … η³=12ν≠0 in π₃S≅ℤ/24 … later roadmaps that use the relation, K3BlochGroups (its §4.9) and FourManifolds among them, cite B3.3 for it."
- `:3280–3281`: "K3BlochGroups consumes B3.3's η³=12ν≠0".

**Claim.** K3BlochGroups consumes B3.3 for η³=12ν.

**Witness.**
- #1430 (dcd87e4), `TauCetiRoadmap/K3BlochGroups/README.md:1347–1354`: "This section proves that the cube of the stable Hopf class is the element of order two …". It states the target `etaCube_eq_twelveNu` with its own Adams–Novikov route. That README contains neither "TangentialBordism" nor "B3.3".
- Merge order: TangentialBordism is line 14, K3BlochGroups line 138.
- FourManifolds #936 `:182` does cite B3.3, as claimed.

**Repair.** This roadmap precedes K3BlochGroups, so B3.3 remains the owner.
- #1430 should replace §4.9's proof and `etaCube_eq_twelveNu` by a citation of TangentialBordism B3.3. It keeps its §4.16 quotient by η³.
- This pull request's description should record that #1430 must make that change before it merges.
- If K3BlochGroups keeps its own proof, delete "K3BlochGroups (its §4.9) and" at `:77` and the K3BlochGroups sentence at `:3280–3281`. They would then assert a citation that does not exist.

Values tested: 12ν has order 24/gcd(12,24)=2, and 4ν has order 6. So both routes prove the same relation, and only one should own it.

## R04 (P3) — The description still lists the closed #1663 and omits #886, whose numbering the README cites

**Location.** In the pull-request description (`scratch/pull-request.md`, quoted as data):
- "- [ ] depends on: #1663";
- "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652";
- "#886" occurs nowhere.

**Claim.** The description names every open revision whose numbering the README cites, and names only open pull requests.

**Witness.**
- The README cites DifferentialGeometry 5.5b at `:90`, `:394`, `:489`, `:748`, `:974` and more.
- Main (3090489) contains "5.5b" 0 times. #886 (6fb2ca3) defines it at `TauCetiRoadmap/DifferentialGeometry/README.md:1654`.
- `scratch/overlaps.md` lists 5.5b as defined only by #886.
- The index of 2026-11-09 has no #1663.

**Repair.** This is a description change only; no file in the folder changes.
- Delete "depends on: #1663".
- Make the revision paragraph read "#886 (DifferentialGeometry 5.5b), #1652 (AlgebraicTopology Layers 2, 4, 6, 8 and 8.13)".
- Add #886 to the Depends-on block.

This is R01 of PRREVIEW-TangentialBordism~26, unchanged.

## R05 (P3) — 3.4 (B2.4) has no source locator, and Milnor–Stasheff is missing from the manifest

**Location.** `README.md:1156–1193`. The subsection proves witness invariance of f_*[M], the degree-zero isomorphisms ΩSO_0≅ℤ and ΩO_0≅F₂, and the intersection comparison. It cites no source.

**Claim.** Every target carries a locator.

**Witness.**
- millerCobordism lines 76–91 (p.1) give exactly the witness-invariance argument: the boundary map sends [W] to [M], and H_{n+1}(X,X)=0.
- Lines 119–126 (p.2) define both orientation maps.
- Milnor–Stasheff, TeXromancers edition, §17.2, p.209, gives Ω₀≅ℤ by the signed count. That edition is the one in the References, and it is readable at the References' URL. `sources.toml` has no Milnor–Stasheff entry, although 2.4, 3.1, 3.2, 4.1, 4.3, 6.3, 6.5 and 8.5 cite it.

**Repair.**
- After "vanishes by exactness" (`:1162`), add "(Miller, Chapter 1, §1, pp.1–2)".
- After "the signed count ΩSO_0→Z" (`:1165`), add "(Milnor–Stasheff, §17.2, p.209 of the TeXromancers edition)".
- Record that edition in `sources.toml`.

## Verified sound

### Gate, order, build and signatures

- **Gate.** `scratch/gate.md` reports every check passing at 4e86746: set_option 0, sorry-data 0, statement-hygiene 0, readme-ids-missing 0, depcheck 0, stray-files 0, outside-folder 0, build 0. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Dependency check**, rerun with `--movable`:

  ```
  depcheck: 235 roadmaps, 2262 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. In ORDER.txt, TangentialBordism (line 14) comes after IndexTheory (10), StringOrientation (11), SmoothBundlesConnections (12) and PseudodifferentialOperators (13). No roadmap on the never-cite list is cited.
- **Elaboration.** `lake env lean …/Suggested.lean` exits 0 in 13 s with exactly six warnings, `declaration uses sorry`, at `:75`, `:96`, `:114`, `:130`, `:159` and `:177`.
- **`#check @` comparison.** I ran `#check @` on all six declarations in one scratch file. Each elaborated type carries every binder its README statement names, for example `[SigmaCompactSpace M]`, `[BoundarylessManifold J P]`, `[LindelofSpace M]`, `[SecondCountableTopology M]`, `1 ≤ n`, `n ≤ 3` and `n = 1 ∨ n = 3`. No section binder is lost. I changed no file.
- **One-tactic probe.** I replaced every `sorry` by `simp` on a scratch copy. All six fail: "unsolved goals" at the theorems of `:75`, `:130`, `:159` and `:177`, and "made no progress" at `:96` and `:114`. None is padding.
- **Pinned definitions printed.** `TauCeti.IsOrientedAtlas` has fields `subset_maximalAtlas`, `exists_mem_source` and `symm_trans_mem` (transitions in `orientationPreservingGroupoid`), as the From Tau Ceti contract says. `TauCeti.boundaryOrientation` needs `IsManifold (𝓡∂ (n+1)) 1 M` and returns an orientation of the boundary indexed by `Fin n`.

### Headline theorems

1. Relative smoothing into compact targets: stated (`exists_contMDiff_homotopicRel`).
2. Sard in unequal dimensions, boundaryless and half-space sources: stated.
3. Oriented three-manifold parallelization: stated.
4. ΩSO_n=0 for 1≤n≤3 and ΩO_n=0 for n=1,3: stated as nullbordism theorems.
5. Integral realization range and its degree-seven sharpness (B6.3): statable but absent (R01).

The docstring names the following as not statable, and I checked each reason at the pins:
- Corner Sard and transversality: the pins have no face structure, and no map-transversality predicate. `TauCeti/Geometry/Manifold/VectorField/Transverse.lean` is about vector fields along a map.
- Bordism groups and their nonzero entries, Thom's ring and Wall's presentation: Mathlib's `SingularManifold` has no bordism quotient.
- Spin entries: there is no Spin structure on manifolds.
- PT isomorphisms, Steenrod/MO/Adams, ABS/KO and B6.5: there are no Thom spectra, Steenrod operations or KO. The only Stiefel–Whitney classes at the pin are those of quadratic forms, in `FieldTheory/QuadraticForm/StiefelWhitney`.
- Cayley plane: the pin has only the split Albert algebra (`TauCeti/Algebra/AlbertAlgebra/Basic.lean`), not the compact one.

### Seeded sample: locators read in the text

| Target | README locator | Where in the source | Supports the statement |
| --- | --- | --- | --- |
| 2.4 (B1.2) | Milnor–Stasheff Thm 17.1, Lemma 17.2, pp.206–207; Miller Ch.1 Defs 1.1–1.2, pp.1–2; Ch.2 Defs 1.1, 1.3, pp.39–41 | Milnor–Stasheff (TeXromancers edition) line 5439 (collar theorem, p.206), 5457–5465 (relation; cylinder [0,1]×M; gluing by 17.1; p.207); millerCobordism lines 95, 104 (p.2), 1453 (p.39), 1538 (p.41) | yes |
| 3.1 (B2.1) | Milnor–Stasheff Lemma 17.2 | line 5457 | yes |
| 3.4 (B2.4) | none | — | R05 |
| 4.2 (B4.2) | Guillou–Weibel v1 Thm 6.2, p.18, ℓ=2; Miller Thm 11.2 | guillouWeibel 748–760; millerCobordism 1142 | yes: at ℓ=2, Def 6.1's exponent bound mⱼ<2 gives squarefree monomials, and a free graded-commutative F₂-algebra is polynomial |
| 4.3 (B4.3) | Milnor–Stasheff Thm 11.14 | line 3651 (p.140) | yes |
| 4.4 (B4.7) | Hatcher §4.L (1)–(6) of Pⁱ, pp.489–490; Adem, p.496; 4L.16, p.513; Guillou–Weibel Def 6.1, Thm 6.2, p.18; Thm 6.5(1)–(3), p.19 | hatcherAT 21083–21093, 21408–21411, 22197 (pdf 522 = p.513); guillouWeibel 748–758, 784–788, with Q_a=βP^a at 744 | yes: β(x)↦−β(y) gives τβ=−βτ; x^{ℓ−1}⊗y↦−Q_a(y)=−βP^k(z) |
| 5.1 (B5.1) | Miller Ch.1 §§2–3, pp.3–7; Ch.2 §1, pp.39–41; Thom IV.6, p.74; IV.8, p.75 | millerCobordism 218–231 (collapse to Thξ_k∧X₊, p.5), 273–294 (invariance, p.7); thom1954 2410 (p.74), 2462 (p.75) | yes |
| 5.5 (B5.5) | Miller Ch.2 Thm 1.4, p.41; Ch.1 §1, pp.1–2; §5, pp.12–14 | millerCobordism 1565, 119–126, contents line 22 | yes: trivial Gₙ gives BG=pt, MG=S |
| 6.2 (B4.5) | Thom IV.10, Cor. IV.11, p.77 | thom1954 2528–2539 (page ends 2545, "77") | yes |
| 6.4 (B4.8) | Milnor 1960 §4, Thms 4–5, p.519 | not readable | Not verifiable |
| 7.1 (B3.0) | Atiyah–Bott–Shapiro §§10–11 | uncertified | Not verifiable |
| 8.1 (B3.2(b)) | Atiyah Thm 2, p.48; Thm 5 and proof, pp.59–60 | atiyahSpin1971 75–77 (p.48), 462–472 (p.59), 473–492 (pp.59–60) | yes: in dimension 2, φ(Σxᵢeᵢ)=Spin(X)+ΣxᵢSpin(Yᵢ)+ΣxᵢxⱼSpin(Yᵢⱼ), and Yᵢⱼ are points, so the bilinear form is the intersection pairing |
| 8.3 (B3.3) | Hatcher §4.2, p.385; Freed Lecture 5, (5.57), p.45; Beaudry–Campbell Fig. 31, p.41 | hatcherAT 16749–16752; freedBordism 1805, 1817; beaudryCampbell 1741 | yes |
| 9.1 (B3.6) | Baez §§3.4, 4.2 | baezOctonions 1297–1458 (trace-one projections; three charts at 1455–1458), 1768–1803 (OP²≅F₄/Spin(9); 52=36+16) | yes |
| 10.2 (B6.4) | Führing §3, pp.359–363; closed fibre p.359; Prop. 3.4, p.362 | fuehringProjective 168–185, 332–339 | yes |

Further locators read: Thom III.2–III.4, p.59 (1818–1834); IV.12, p.79, with "Pour k=3, 𝔑₃=0" (2610–2619); IV.13, p.81, with Rokhlin's attribution (2686–2695). Beaudry–Campbell Remark 3.2.2, p.18; Thm 5.1.1 and Cor. 5.1.2, p.42. Atiyah Prop. 4.1 and Thm 3′, p.58. Milnor–Stasheff Problems 16-C to 16-F, pp.203–204. Hatcher (1)–(7) of Sqⁱ, p.489; 4L.12, p.504; 4L.13, p.506. Borel–Hirzebruch (13), p.519. Rosenberg–Stolz 3.3, p.8. Benedetti–Lisca Thm 1, p.1; §2.1, p.2. The README flags no locator as unverified.

### Adversarial mathematics table

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `exists_contMDiff_homotopicRel` | C=M; P=M=S¹ with f=id; route data | C=M forces U=M, so g=f with the constant homotopy. With D={|p−q|<1}, g(z)=−z has |g(z)−z|=2∉D, so it is excluded. Whitney (`WhitneyEmbedding.lean:132`) and approximation (`SmoothApprox.lean:79`, binders `[SigmaCompactSpace M] [T2Space M]` at `:75`) carry no boundaryless binder, which matches the Lean signature. The tube theorem's boundaryless model is reached by recharting P on 𝓘(ℝ,E'). | pass |
| `isNullSet_image_criticalPoints_of_boundaryless` | t↦(t,0); projection ℝ²→ℝ; E'=ℝ⁰; inclusion ℝ_δ→ℝ | The line is null. The projection has no critical points. Into ℝ⁰ every derivative is onto, so the critical set is ∅ (a point is not null for the counting measure). The ℝ_δ inclusion is critical everywhere with image ℝ, not null, so `LindelofSpace` is needed. The flat input (`OutermostStratum.lean:347`) needs (dim E)²+1 ≤ ∞, which holds. | pass |
| `isNullSet_image_criticalPoints_halfSpace` | [0,∞) with f=t and f=t² | t: regular at 0 for f, critical for f restricted to {0}. t²: critical at 0, image {0} null. The inclusion of critical sets holds in one direction only. | pass |
| `orientedThreeManifold_parallelization` | ℝ³ chart; e₁ negated; ∅; RP²×S¹ | Determinant 1, then −1 (fails positivity). Vacuous on ∅. RP²×S¹ has w₁≠0, so it has no `IsOrientedAtlas` and is excluded. | pass |
| `closedOrientedManifold_isOrientedBoundary` | n=0,…,4; M=∅ | +pt has signed count 1≠0 (n=0 excluded). S¹=∂D², the reversed orientation through `boundaryOrientation_neg`. Σ_g bounds a handlebody. n=3 is Thom IV.13. CP² has σ=1 (n=4 excluded). M=∅ gives W=∅. | pass |
| `closedManifold_isBoundary` | n=0,…,3 | A point has odd count. S¹=∂D². RP² has χ=1 (n=2 excluded). 𝔑₃=0 (Thom p.79). RP²×S¹=∂(RP²×D²). | pass |
| R01's two statements | n=0; z=0; degree 7 | Σkᵢ[xᵢ] is realized by signed points; z=0 by ∅; L⁷×L⁷ gives the degree-7 class (Thom III.9). Both elaborate with 2 `sorry` warnings. | pass (to add) |
| B4.1 chain identity | edge [0,1] | AW−T·AW=[0]⊗[0,1]+[0,1]⊗[1]−[0,1]⊗[0]−[1]⊗[0,1]=−d([0,1]⊗[0,1]) | pass |
| B4.1 integral cup-1 | c in degree 2 | D₁d=−dD₁+(1−T)D₀ with unsigned evaluation gives δ(c∪₁δc)=c∪δc−(−1)^{6}δc∪c−δc∪₁δc−c∪₁δδc, the README's identity | pass |
| B4.4 multiplicities (R02 target) | degrees 0–4 | Partitions into parts ≠2^j−1: {}, none, {2}, none, {4} and {2,2}, giving 1,0,1,0,2 | pass |
| B4.7 Checks | p=3 | τy=−βι₂=2βι₂; P¹βι₂ has degree 7; the transpotence has degree 2kp+2=8; r=2k(p−1)+1=5 | pass |
| B4.8 series | p=3 | P_*⊗C has dimensions 1, 2, 3 in degrees 4, 8, 12 (ξ₁; ξ₁², c₈; ξ₁³, ξ₁c₈, c₁₂), equal to p(1), p(2), p(3) for H_*(BSO;F₃) | pass |
| B4.3 Checks | RP², S² | w=(1+a)³=1+a+a²; v=1+a; Sq v=1+a+a². w₂[S²]=χ mod 2=0 | pass |
| B4.5 Checks | RP², S² | w₁²=w₂=a² evaluate to 1 on RP²; both are 0 on S² | pass |
| B3.3 (R03 target) | ℤ/24 | ord(12ν)=2, ord(4ν)=6, 12 mod 8=4 (h₀²h₂) | pass |
| B2.4 (R05 target) | RP²; X={x,y} | [RP¹]·[RP¹] is one point, giving 1 in F₂; the two points give (1,0) and (0,1) | pass |
| B1.7 quartic | K3 | c=(1+h)⁴/(1+4h)=1+6h²; c₂=24; p₁=−12h², so p₁[K3]=−48, σ=−16, Â=2 | pass |
| B3.0/B3.4 | K3 | k=−σ/16=1; Â=−σ/8=2=2k | pass |
| B3.5 Hopf derivative | q=1+j(x+iy)=1+jx−ky | [jx−ky, i]=−2xk−2yj, determinant negative, degree −1 | pass |
| B3.6 Check | v=(1,i,j) | A₁₁=1/3, A₀₁=−i/3, A₂₁=−ji/3=k/3; chart (−i,k)=(x⁻¹,yx⁻¹); x⁻¹y=−k | pass |
| B3.8 Check | p₂=6u, p₄=39u² | (381·39−19·36)/14175=14175/14175=1 | pass |
| B3.9 HP^k | k=1, 2 | (1+u)⁴(1−4u)=1 mod u²; (1+6u+15u²)(1−4u+16u²)=1+2u+7u²; (49−4)/45=1 | pass |
| B5.2 four points | S¹∨S¹ | aba⁻¹b⁻¹≠1 in F₂; aa⁻¹bb⁻¹=1 | pass |
| B6.1 Checks | H_C(2,3); CP⁴; H_C(1,1) | −binom(5,2)=−10; 5; gcd 5; H_C(1,1)≅CP¹ has s₁=+2 against the formula's −2 | pass |
| B4.6 Checks | H_R(2,4); H_R(1,2) | dimension 5, binom(6,2)=15 odd; m,n even give w₁=mx+ny=0. H_R(1,2) is an RP¹-bundle over RP¹ with w₁²=0 | pass |
| B6.2 Check | Wall | δ(Y₆Y₅)=Y₅Y₅+Y₆·0=Y₅²; ∂₂²σ₄=∂₂σ₂=1 | pass |
| B6.3 lens example | v₁, v₂, uᵢ=βvᵢ | β(v₁v₂u₂²)=u₁v₂u₂²−v₁u₂³; P¹β(v₁v₂)=u₁³v₂−v₁u₂³; the product is −v₁v₂u₁³u₂³ (other terms contain vᵢ²=0 or u₂⁵=0), and −1=2 mod 3 | pass |
| B6.6 Kreck–Stolz | n=2, 3 | −2(6−1)=−10; −2(15−1)=−28 for r=0 and r=1; gcd 28=2²·7 (n=2²−1, 2n+1=7) | pass |
| 9.2 Jordan frames and dimension 36 | as recorded in PRREVIEW-TangentialBordism~26 | binom(9,2)=36; ½(1−E₀+X) is idempotent iff t²+N(a)=1; 52−24=28 | pass (text unchanged) |

### Library declarations opened at the pins

- `TauCeti.addHaar_image_criticalPoints_eq_zero`, `TauCeti/Analysis/Calculus/Sard/OutermostStratum.lean:347`: any set U, no relation between the dimensions, `hk : dim²+1 ≤ n`.
- `TauCeti.isNullSet_image_criticalPoints` and `dense_isRegularValue`, `Sard/EqualDimension.lean:105`: `hdim : finrank ℝ E = finrank ℝ E'`.
- `ContMDiff.isMeagre_image_criticalPoints`, `Sard/Meagre.lean:44–48`: `[I.Boundaryless] [J.Boundaryless]`.
- `TauCeti.IsNullSet`, `Geometry/Manifold/Measure.lean:36`, with `.biUnion` at `:81` and `.dense_compl` at `:108`.
- `ModelWithCorners.depth` (`Corners/Depth.lean:391`), `depth_eq_zero_iff` (`:407`), `depthAt_extend_eq_depth` (`:430`), `IsLocalDiffeomorphAt.depth_eq` (`:532`), `depthAt_modelWithCornersEuclideanQuadrant` (`:364`).
- `TauCeti.IsOrientedAtlas.orientation`, `Orientation/Atlas.lean:145`.
- `TauCeti.HomologicalOrientation.fundamentalClass` and `mapFundamentalClass`, `LocalHomology/FundamentalClass.lean:204`, `:275`.
- Mathlib `exists_embedding_euclidean_of_compact` (`WhitneyEmbedding.lean:132`) and `Continuous.exists_contMDiff_approx_and_eqOn` (`SmoothApprox.lean:79`).
- All 70 Tau Ceti names the README backticks: I located the defining file of each. Every file the README names is the defining file: `Charts.lean` for `isManifold_boundary` and `isSmoothEmbedding_subtypeVal_boundary`; `OrientedAtlas.lean` for `det_fderivWithin_pos` and `orientationPreservingGroupoid`; `Singular/Sphere.lean`, `Exhaustion.lean`, `TubularNeighborhood/Existence.lean`, `PontryaginThom/Basic.lean` and `Existence.lean`, `ClosedBall.lean`, `CWComplex/Basic.lean`, `SmoothTriangulation/Basic.lean`; and the Clifford and Spin files read in PRREVIEW-TangentialBordism~26.

### Cross-roadmap citations resolved this round

- GeometricTopology (main):
  - 1.1 `:788–815`: collars, and the interior of a manifold with boundary is a homotopy-equivalent boundaryless manifold.
  - 4.3.1 `:2430–2505`: Arf, Gauss sum, zero count with m=0 separate, Lagrangian criterion; this is the contract at `:408–421`.
  - 11.3 `:7887`: Cairns–Whitehead for every smooth manifold.
- SpinGeometry (main): G6 item 5 `:781–786`; G6.7 `:831`; `realCliffordSpinorBundle` `:506`, `realSpinDiracClosedRealization` `:586`, `realSpinLichnerowiczFormula` `:636`, `realSpinDiracIndexClass` `:655`.
- StringOrientation #948 (07f0981): S2.2 `:551–575`, the isomorphism for every G5 diagram, natural and multiplicative; S2.3 `:607–640`; S5.3 `:1158–1185`, the equivalence from DGFloer items 2 and 4 with no BordismFormalGroups input.
- AlgebraicTopology #1652 (db70d31): 8.13 `:4133–4210`, smoothing for boundaryless sigma-compact Hausdorff second-countable sources into compact targets, with no control of the homotopy, as the supplier row says; 6.3 `:2461` with the comparison units at `:2755–2786`, including ∂[D¹]=[+1]−[−1].
- IndexTheory #1077 (6d85f5d): I2.5 `:648`, I5.4 `:1187`, I7.2 `:1371`, I7.5 `:1514–1531` (σ=−16α, Rokhlin).
- GeneralizedCohomology (main): G1 item 1 `:140`; G3 item 3 (arbitrary-CW comparison); `realMixedCliffordIndexClassification` and `realNegativeCliffordFamilyIndex` `:2084–2099`.
- CharacteristicClasses (main): C1 items 3–4 `:664–690`. ClassifyingSpaces (main): Stage 4 item 17 `:238`.
- DifferentialGeometry #886 (6fb2ca3): 5.5b `:1654–1700`, local quadrant data, germ bijection and depth (R04).
- FourManifolds #936 `:182` and HomotopySpheres #1287 `:170–173` cite this roadmap consistently with its scope.
- **Overlaps** (`scratch/overlaps.md`, 5 items):
  - No open pull request changes this roadmap, and none drops a cited id.
  - AlgebraicTopology's layers come from #1652, which the description names. DifferentialGeometry 5.5b comes from #886, which it does not (R04).
  - Vocabulary neighbours: HomotopySpheres is not cited; StringOrientation is an earlier supplier; FourManifolds is a consumer; GeneralizedCohomology is a supplier on main.
- **Ownership sweep.** I searched (`roadmaps grep`) for Adem, unequal-dimension Sard, η³, parametric transversality, framed Pontryagin–Thom and ΩSpin_3. It found R02 (#1854, #1807) and R03 (#1430), and no other second owner.

## Not verifiable

- Milnor, *On the cobordism ring Ω\**, Amer. J. Math. 82 (1960), cited at 6.4: behind JSTOR's paywall; the manifest has no entry.
- Atiyah–Bott–Shapiro, cited at 7.1, and Kreck–Stolz: uncertified by the manifest.
- Lee, *Introduction to Smooth Manifolds* (B1.6 docstrings, 2.1, 8.5), Munkres (2.3), McCleary, Stong, Anderson–Brown–Peterson, Stolz 1992 and Gompf–Stipsicz: books or paywalled articles, not in the cache. For McCleary, Guillou–Weibel lines 747 and 760 confirm the Theorem 6.21 citation.
- Wall 1960 (6.6) was not in the sample and was not fetched.

## Source issues

- **Misprint** in Milnor–Stasheff (TeXromancers edition) at §17.2, p.207: the source misspells "manifold" in the sentence defining −M; it should read "manifold"; affects nothing.
- **Misprint** in Milnor–Stasheff (TeXromancers edition) at §17.2, p.209: the Ω₀ entry drops a letter from "and" before "the sum of the signs"; it should read "and"; affects nothing.
