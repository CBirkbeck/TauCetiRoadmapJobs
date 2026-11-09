# Review of TangentialBordism (pull request #942 at 7022ba9)

**Verdict:** needs changes

Full review of the head the previous review also read: the folder is unchanged since then, and nothing outside it changed. That review's only finding is partly repaired, because GeometricTopology has merged to main. Its remainder is R02. Read against the current main (488fd41) and the open heads, the README has four new defects. R01 (P2): Layer 9 defines StringOrientation S1.5's Cayley plane and F₄ a second time. R03 (P3): the Lean smoothing headline is weaker than the README statement that carries its name. R04 and R05 (P3): two B1.6 supplier statements say more than the suppliers state. The gate, the dependency check, the elaboration and the padding probe all pass.

## R01 (P2) — Layer 9 defines S1.5's Cayley plane and F₄ again and proves S1.5's isotropy theorem again

**Location.** `TauCetiRoadmap/TangentialBordism/README.md:2511–2514`: "Through it define octonionicProjectivePlane as the literal trace-one idempotent subtype `{A : compactAlbertAlgebra // A∘A=A ∧ tr A=1}` … which is S1.5's OP² on this carrier". Also `:2564` ("Construct compactAlbertAutomorphismGroup as the closed subgroup …"), `:2570–2575` (its chosen subgroup atlas) and `:2619` ("Thus its image is exactly the stabilizer").

**Claim.** The README says Layer 9 adds to S1.5 only "the identification of its Jordan algebra with LieHighestWeight's compact Albert carrier", charts, the Clifford module, sign witnesses and comparisons (`:44–48`). It also says "no second OP2 is defined here" (`:2664`).

**Witness.** StringOrientation #948 (07f0981), `README.md:460`, takes `J₃(𝕆)` from LieHighestWeight Layer 8's formally real Albert supplier, that is `compactAlbertAlgebra`. At `:464–466` it defines OP² as the trace-1 idempotents and F₄ as the automorphism group, and proves the Lie group structure, transitivity and the Spin(9) isotropy.

Four consequences follow:

- The identification at `:2508–2511` is the identity map.
- `octonionicProjectivePlane` is S1.5's OP² under a second name.
- `compactAlbertAutomorphismGroup`/compactF4, with its own closed-subgroup atlas, is a second Lie structure on S1.5's F₄.
- `:2614–2619` proves S1.5's isotropy theorem a second time.

Ownership of this carrier is also split among the open pull requests:

- LieHighestWeight assigns "the compact Albert idempotent geometry and automorphism transitivity" to TangentialBordism §§9.1–9.2, both on main (`README.md:1405–1407`) and at #1220 (beea1d2, `README.md:60–62`).
- The open DGFloer revision #963 (62109eb) claims the carrier at `README.md:105` and `:1097–1099`, and lists TangentialBordism B3.6 as its consumer.

**Repair.**

1. In Scope (`:44–46`), delete "the identification of its Jordan algebra with LieHighestWeight's compact Albert carrier".
2. In 9.1, replace `:2508–2514` by: "S1.5's OP² is the trace-one idempotent subset of LieHighestWeight Layer 8's `compactAlbertAlgebra`; on it construct the three charts …". Keep the charts, the transitions and the embedded-submanifold structure they give. Add a target proving that this atlas is compatible with S1.5's smooth structure.
3. In 9.2, consume S1.5's F₄ with its Lie structure, its transitivity and its Spin(9) isotropy. Delete the construction of compactAlbertAutomorphismGroup/compactF4 and its atlas (`:2564–2575`) and the stabilizer argument (`:2614–2619`). Keep:
   - the Peirce Clifford module with its pinned volume sign;
   - the comparison of S1.5's isotropy group with native `spinGroup (TauCeti.realCliffordForm 9 0)`;
   - the type-F4 Lie-algebra comparison through LieHighestWeight Layer 8;
   - the comparison of S1.5's homogeneous structure with the chart atlas (`:2621–2623`, renamed accordingly).
4. In the description, say that S1.5 is the owner this roadmap consumes, and that #963 and #1220 assign the carrier elsewhere. Those must be reconciled with S1.5 before this pull request merges.

Check after the repair: both names should occur 0 times in the README. The 9.2 volume Check still holds, because it depends only on the Peirce space and the Clifford formula (recomputed below).

## R02 (P3) — The description still lists the closed #1663 and omits #886

**Location.** The pull-request description: "- [ ] depends on: #1663"; "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652"; the Depends-on block lists #1652, #1077 and #948. The README cites DifferentialGeometry 5.5b at 17 lines (`:84`, `:322–323`, `:417`, `:422`, `:465`, `:486`, `:505`, `:586`, `:624`, `:636`, `:703`, `:748`, `:751`, `:775`, `:850`, `:942`).

**Claim.** The description names every open revision whose numbering the README cites, and only open ones.

**Witness.** The `roadmaps list` index of 2026-11-09 has no #1663. DifferentialGeometry on main (488fd41) contains "5.5b" 0 times; #886 (b5e32fc) defines it at `README.md:1401`. `scratch/overlaps.md` gives the same lead.

**Repair.** Description only, no README change:

- Delete "depends on: #1663".
- Write the revision paragraph as "#886 (DifferentialGeometry 5.5b), #1652 (AlgebraicTopology Layers 2, 4, 6, 8 and 8.13)".
- Add #886 to Depends on.

The GeometricTopology part of the previous finding is repaired by the merge of #903.

## R03 (P3) — `exists_contMDiff_homotopicRel` omits the smallness its README statement claims

**Location.** `README.md:532–534`: "f is homotopic rel C, by an arbitrarily small homotopy, to a smooth g (`exists_contMDiff_homotopicRel`; …". `Suggested.lean:81`: "∃ g : C(M, P), ContMDiff I J ∞ g ∧ f.HomotopicRel g C".

**Claim.** The README statement and the Lean declaration that carries its name agree.

**Witness.** The Lean conclusion puts no bound on the homotopy: any homotopy relative to C satisfies it. The README's reduction for non-compact targets needs the small form: "keep the homotopy inside the interior of W_N" (`:568–572`).

**Repair.** Keep the name and replace the conclusion of `exists_contMDiff_homotopicRel` by:

```lean
    (hf : ContMDiffOn I J ∞ f U) {V : Set (P × P)} (hV : V ∈ nhdsSet (Set.diagonal P)) :
    ∃ g : C(M, P), ContMDiff I J ∞ g ∧
      ∃ F : f.HomotopyRel g C, ∀ t x, (F (t, x), f x) ∈ V
```

The docstring should then say "by a homotopy staying in any prescribed neighbourhood of the diagonal". I tested this on a scratch copy at the pins. It elaborates with only the `sorry` warning, and an `example` recovers the current conclusion in three lines by taking `V = univ`.

## R04 (P3) — DifferentialGeometry 5.5b is cited for "open face strata" it does not state

**Location.** `README.md:323`: "its open face strata are the strata of B1.6's corner Sard and transversality theorems". `:486`: "on a face-structured M they are DifferentialGeometry 5.5b's open face strata".

**Claim.** The corner Sard route (`:474–480`) needs each stratum to be a boundaryless Lindelöf manifold whose inclusion is smooth. The README says 5.5b supplies these strata.

**Witness.** 5.5b at #886 (b5e32fc, `README.md:1401–1420`) supplies local quadrant charts and a depth "invariant on overlaps" (`:1420`). That README contains "strat" only inside "substrate" and "illustration". It gives no manifold structure on the strata.

**Repair.** Add an owned item to 2.1: for a face-structured n-manifold M and 0≤k≤n, the depth-k points form a boundaryless (n−k)-manifold. Its charts delete the k vanishing coordinates of 5.5b's quadrant charts. It is Lindelöf when M is, and its inclusion is smooth with injective derivative. Add a Check: on [0,∞)², depth 0 is the open quadrant, depth 1 the two open half-axes, depth 2 the origin. Reword `:323` and `:486` to "5.5b's local quadrant data and depth", and add the new item to the corner Sard route and its *Needs:*.

## R05 (P3) — B1.6's parametric theorem differs from AlgebraicTopology 8.13's in more than the source class

**Location.** `README.md:89–92`: "B1.6 consumes them, and its statements differ from them only in the source class (corners, facewise)". The same claim is at `:498–502` and in the AlgebraicTopology contract row `:322`.

**Claim.** For boundaryless sources, B1.6's parametric transversality theorem is 8.13's.

**Witness.** In AlgebraicTopology #1652 (946a78a, `README.md:3972–3980`), 8.13 states parametric transversality for "an open S in a finite-dimensional real space" and a compact target P. B1.6 (`:508–510`) allows any boundaryless S and N, and its own Checks use non-compact targets: N=ℝ² at `:610` and N=ℝ at `:612`.

**Repair.** In `:89–92`, `:498–506` and `:322`, add: "and, for the parametric theorem, in allowing a boundaryless parameter manifold S and a non-compact target N. 8.13's theorem is the case of S open in a vector space and N compact, and B1.6 proves the general case for every source class by the route at `:516–528`." With this wording, the Checks at `:610` (S=N=ℝ²) and `:612` (S=N=ℝ) are instances of B1.6's stated theorem.

## Previous findings (~22)

- R01: partly repaired. GeometricTopology #903 merged to main (488fd41), so GeometricTopology 1.1, 4.3.1 and 11.3 resolve on main (`GeometricTopology/README.md:788`, `:2430`, `:7887`; consumer line `:8024`). The description still says "depends on: #1663" and does not name #886; that remainder is R02 above.

## Verified sound

### Gate, dependency check, scope of the change

- **Gate**, rerun at 7022ba9 with `--base origin/main`:

  ```text
  gate TangentialBordism: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's gate (`scratch/gate.md`) also reports `build=0`.
- **Dependency check** (`--movable`): `depcheck: 236 roadmaps, 2281 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. TangentialBordism is line 14 of the merge order, after IndexTheory (10), StringOrientation (11), SmoothBundlesConnections (12) and PseudodifferentialOperators (13). The README cites none of the 15 roadmaps that may never be suppliers.
- **Outside the folder:** `git diff --stat origin/main...HEAD` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

### Lean: elaboration, signatures, padding, headlines

- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 11 s. There are exactly six `sorry` warnings, at `:70`, `:90`, `:108`, `:124`, `:153` and `:171`.
- **Signatures.** The file has no `variable` line, so no section binder can be lost. The seven entries of `scratch/signatures.md` are the six theorems plus "structure `,`", which is the docstring phrase at `:151` ("smooth-manifold structure, which"). Each elaborated type matches its README statement:
  - `:529–537` and `:85–86` match `exists_contMDiff_homotopicRel`, except for the smallness clause (R03).
  - `:453–464` matches the two Sard theorems.
  - `:2380–2399` matches the parallelization theorem.
  - `:2352–2363` matches the two nullbordism theorems.
- **Padding probe.** On a scratch copy I replaced each `sorry` by `first | T | aesop` for T = `simp`, `infer_instance`, `rfl` and `exact?`. All six declarations fail with all four tactics. No declaration restates a definition, mirrors a Check or computes a value.
- **Headlines.** The README's headline theorems are:
  - the geometric theories and the Pontryagin–Thom isomorphism (B5.4c);
  - the low tables (B3.1–B3.4) and η³=12ν (B3.3);
  - Thom's ring (B4.6), the odd-primary rings (B4.8) and Wall's presentation (B6.2);
  - B1.6's Sard and smoothing theorems;
  - parallelization (B3.1);
  - the realization range (B6.3);
  - the transfer images and the KO kernel (B6.5–B6.6);
  - the ABS comparison (B3.0);
  - the Cayley-plane theorems (B3.6–B3.9).

  Those statable at the pins are stated. The docstring's reasons for the others hold at the pins:
  - Mathlib's `Geometry/Manifold/Bordism.lean` has only `SingularManifold` (`:111`).
  - Neither pinned library defines a transversality predicate for manifolds (grep for `def`/`structure`/`class` named `*ransvers*`).
  - There is no face structure and no `KO`.
- **No duplicate names.** `roadmaps grep --lean-only` finds the six names only in this file.

### Seeded sample (15 targets)

Cached texts that the manifest lacks are cited by hash prefix: `c70bf1f2` (Miller), `4f8edd74` (Milnor–Stasheff, TeXromancers edition), `f8087fb9` (Baez, arXiv v4), `84114d0a` (Borel–Hirzebruch, the README's MPIM link) and `06e4566a` (Führing).

| Target | Locator | Text at the locator | Result |
| --- | --- | --- | --- |
| 2.1 (B1.6) | Lee 6.10, 6.26, 6.35, 6.36; pinned declarations | Lee is paywalled (Not verifiable). At the pin: `Continuous.exists_contMDiff_approx_and_eqOn` (`Mathlib/Geometry/Manifold/SmoothApprox.lean:79`) holds for any I with `[SigmaCompactSpace M] [T2Space M]`, `hU : U ∈ 𝓝ˢ S`, smooth on U. `exists_embedding_euclidean_of_compact` is at `WhitneyEmbedding.lean:132`. `isInteriorPoint_iff_of_mem_atlas` (`InteriorBoundary.lean:301`) gives the chart independence used to re-chart P. `addHaar_image_criticalPoints_eq_zero` (`Sard/OutermostStratum.lean:347`) allows any two dimensions. `isNullSet_image_criticalPoints` and `dense_isRegularValue` (`Sard/EqualDimension.lean:105`, `:112`) take `hdim`. The tube theorems are at `TubularNeighborhood/Existence.lean:53` and `PontryaginThom/Existence.lean:68`. | Pass; R03–R05 |
| 3.2 (B2.2) | Miller Ch.1 §1 p.2; MS Ch.17 pp.207–208 | `c70bf1f2` 114–118: products `N_m(X)⊗N_n(Y)→N_(m+n)(X×Y)` on printed p.2. `4f8edd74` 5470 (product, folio 207 at 5477) and 5480: the interchange sign `(−1)^(mn)`, on p.208. | Pass |
| 3.3 (B2.3) | Freed L.12 p.103; Miller Ch.1 §4 Thm 4.2 p.10 | `freedBordism` 4243–4246, folio 103 at 4247: the homology axioms except the coefficients, with a variation for each stable tangential structure. `c70bf1f2` 392–407: Thm 4.2 on PDF p.15, printed p.10, "N∗(−) is a homology theory", deduced through MO. | Pass |
| 5.1 (B5.1) | Miller Ch.1 §§2–3 pp.3–7, Ch.2 §1 pp.39–41; Thom IV.6 p.74, IV.8 p.75 | `c70bf1f2` 203–230: the collapse `S^(n+k)→Thν→Thξ_k∧X₊` on p.5; 273–294: invariance on p.7; 1449–1566: Ch.2 §1 with Defs 1.1 and 1.3 and Thm 1.4 on pp.39–41. `thom1954` 2410: IV.6 in §IV.4, folio 74; 2462: IV.8, folio 75. | Pass |
| 5.2 (B5.2) | Thom IV.8 p.75 (negative attribution) | `thom1954` 2462–2470: the stable groups only, with no fixed-rank bijection, as the README says. | Pass |
| 5.3 (B5.3) | Thom IV.8 p.75 | As in 5.2. | Pass |
| 5.5 (B5.5) | Miller Ch.2 §1 Thm 1.4 p.41; Ch.1 §1 pp.1–2; §5 pp.12–14 | `c70bf1f2` 1565–1566: `Ω^G_*(X)≅π_*(MG∧X₊)`, PDF p.46 = printed 41. 119: the fundamental-class map on p.2. Contents line 22: §5 "The Thom Isomorphism" begins on p.12, §6 on p.14. | Pass |
| 5.6 (B5.6) | no external locator; GeneralizedCohomology G4.3, G5.1–G5.3 | Main: G4 (`:936`) and G5 items 1–3 (`:1373` onwards) are present. | Pass |
| 5.7 (B5.7) | Hatcher SS §1.1 pp.18–19 | `hatcherSS` 997–1011 (p.18): the AHSS of a homology theory for finite-dimensional B; 1012–1042: naturality on pp.18–19. The CW-pair and connective extensions are claimed as targets, not as Hatcher's. | Pass |
| 6.2 (B4.5) | Thom IV.10, Cor. IV.11, p.77 | `thom1954` 2528: IV.10, all SW numbers zero gives a boundary; 2538: Cor. IV.11; folio 77 at 2545. | Pass |
| 9.1 (B3.6) | Baez §§3.4, 4.2; S1.5 | `f8087fb9` 1425–1444: the points of OP² are the trace-1 projections `vv*` with an associativity condition; 1783–1801: `OP²≅F₄/Spin(9)`. S1.5 at #948 `:458–466`. | Locators pass; R01 |
| 9.2 (B3.7) | none; Baez §§3.4, 4.2 in the References | `f8087fb9` 1326–1356: `h₃(O)≅R⊕h₂(O)⊕O²` and `Spin(9)⊆Aut`. | Pass; R01 |
| 9.4 (B3.9) | Borel–Hirzebruch I §15.5 (13), p.519 | `84114d0a` 2406–2417: `p(P_(q−1)(K))=(1+u)^(2q)(1+4u)^(−1)`, with u represented by `x₁²` at 2397–2399. | Pass |
| 10.2 (B6.4) | Führing §3 pp.359–363, p.359, Prop 3.4 p.362 | `06e4566a` 169–180: §3 opens on PDF p.5 = p.359 with "F a smooth closed manifold"; 332–339: Prop 3.4 on PDF p.8 = p.362. | Pass |
| 10.3 (B6.5) | Führing Thms 1.1, 1.3 pp.355–357; §9 | `06e4566a` 18–20: Thm 1.1 on p.355; 66: Thm 1.3 on p.356; 72–78: Remark 1.4 passes to PU(3)⋊Z₂; 1415–1430: §9, RP²-bundles with G=SO(3). | Pass |

### Adversarial mathematics table

| Statement | Instances | Values computed (each side) | Result |
| --- | --- | --- | --- |
| `exists_contMDiff_homotopicRel` | C=M, f smooth; M=P=S¹, f≡1, C=∅; M=∅; dim E=0 | g=f with the constant homotopy. A smooth g homotopic to the constant map has degree 0, so it is never the identity. Empty map. Every map from a countable discrete M is smooth, so g=f. | Pass; R03 (no size control) |
| `isNullSet_image_criticalPoints_of_boundaryless` | f:ℝ→ℝ², t↦(t,0); the projection ℝ²→ℝ; M=ℝ_δ vs ℤ, f the inclusion into ℝ | The critical set is ℝ and its image the x-axis, of measure 0. The projection has no critical point; its image ℝ is not null, which the theorem allows. ℝ_δ: the image ℝ has measure ∞, but the Lindelöf hypothesis fails. ℤ: the image ℤ has measure 0. | Pass |
| `isNullSet_image_criticalPoints_halfSpace` | [0,∞), f=t² and f=t; ℝ²_δ×[0,∞), f(c,t)=c | t²: critical set {0}, image {0}, null. t: derivative 1 within the half-line, so 0 is regular for f but critical for its restriction to the boundary point (the inclusion of critical sets goes one way only). ℝ²_δ×[0,∞): the critical values are ℝ², not null, and the Lindelöf hypothesis fails. | Pass |
| `orientedThreeManifold_parallelization` | ℝ³; ℍ³; ℝ³⊔ℝ³ with the second chart reversed; ∅; a non-smooth chart | The coordinate frame has det 1; negating e₁ gives −1. On ℍ³ the frame e_i has det 1. On the reversed component the frame (−e₁,e₂,e₃) has det +1 in its chart. ∅ gives empty maps. A chart with mfderiv 0 would give det 0, but `IsOrientedAtlas` (`OrientedAtlas.lean:283–291`) requires A ⊆ maximal atlas, a cover, and orientation-preserving transitions, which excludes it. | Pass |
| `closedOrientedManifold_isOrientedBoundary` | n=0, 1, 3, 4; T³; ∅ | n=0: the boundary count is 0 but +pt counts 1, so n=0 is excluded. n=4: σ(CP²)=1≠0, excluded. S¹=∂D² counter-clockwise outward-first; S³ with either orientation bounds D⁴ by `boundaryOrientation_neg` (`InducedOrientation.lean:177`). T³=∂(T²×D²). W=∅ for ∅. | Pass |
| `closedManifold_isBoundary` | n=0, 1, 2, 3 | A point: excluded. S¹=∂D². RP²: χ=1, odd, so n=2 is excluded. RP²×S¹=∂(RP²×D²). RP³ is the boundary of the disc bundle of γ_ℂ^⊗2 over CP¹ (8.5 with n=2). | Pass |
| 2.1 parametric transversality | M=ℝ_δ vs ℤ, F(m,s)=s−m; M=pt, F=s on ℝ²; Circle with Z={1} | ℝ_δ: every s is bad, giving the bad set ℝ with measure ∞; Lindelöf fails. ℤ: the bad set ℤ, measure 0. pt: the bad set {0}. Circle: F(x,s)=r(1+s)=1 exactly for real s∈(−δ,δ), a null set in ℂ. | Pass; R04, R05 |
| 2.2 u₁ and the cylinder | ℝ at 0; I×[0,1] with (e_t,e_s) | The pinned generator maps to [−1]−[1] and AlgebraicTopology 6.3's segment to [1]−[−1], so u₁=−1. The face determinants are det(e_t,e_s)=det(−e_t,−e_s)=det(−e_s,e_t)=+1. The free face is −(I×∂[0,1]), which is (−1)^(dim I). | Pass |
| 3.2/3.3 signs | +pt×−pt; two SO 1-manifolds; ([0,1],{0,1}) | −1; (−1)^(1·1)=−1, matching MS p.208. ∂[0,1] has coordinates (−1,+1), with sum 0. | Pass |
| 4.1 higher diagonals | [0,1]; c of degree 2 | AW−T·AW=([0]−[1])⊗[0,1]+[0,1]⊗([1]−[0])=−d([0,1]⊗[0,1]). From `dD₁+D₁d=AW−T·AW`: δ(a∪₁b)=a∪b−(−1)^(|a||b|)b∪a−δa∪₁b−(−1)^(|a|)a∪₁δb, and with a=c, b=δc this gives `c∪δc−δc∪c−δc∪₁δc`. | Pass |
| 4.4 odd primes | K(ℤ/3,2); k=1, p=3 | The transpotence has degree 2kp+2=8. P¹βι₂ has degree 3+4=7. y⁴=y·y³, digits (1,1). τ(βx)=−βι₂=2βι₂. | Pass |
| 5.2 four points | B={a,b}, k=1, n=0 | Th=S¹∨S¹. The word aba⁻¹b⁻¹≠1 in F(a,b), while a a⁻¹ b b⁻¹=1. The abelianized counts are (0,0). n=k=0: [S⁰,B₊]=B₊, so at most one point. | Pass |
| 5.6 umkehr | pt→S¹; graph stabilization | The shift is 0−1=−1. The normal ranks r+1 and r+2 both give the shift d−e. | Pass |
| 6.1/6.3 MO | degrees 1–4; H_R(2,4), H_R(1,2) | Multiplicities 0,1,0,2. Lucas: binom(6,2)=15≡1. H_R(1,2): 3⟨xy²⟩−⟨3xy²⟩=1−1=0, while binom(3,1)=1, so m,n≥2 is needed. | Pass |
| 6.4/6.5 odd primes | p=3, p=5; H_C(2,3), H_C(1,1) | At p=3, C has series 1+t⁸+t¹²+…; v₁ has stem 4 at p=3 and 8 at p=5. s₂(H_C(2,3))=−10 and s₂(CP⁴)=5, gcd 5. H_C(1,1)=CP¹ has s₁=+2≠−2. | Pass |
| 6.6 Wall | ∂₂ on σ₄; Y₅, Y₆ | ∂₂σ₄=σ₂ and ∂₂²σ₄=1. δ(Y₆Y₅)=Y₅², which is nonzero. Dold P(2^r−1, 2^r s) has dimension 2^r(2s+1)−1=2k−1. | Pass |
| 7.1/7.2 ABS | K3; K3×K3; M with σ | Â(K3)=48/24=2, c(a)=2u², so α=a. a²=4b. α=−(σ/16)a, and on K3, σ=−16 gives a. Â=−σ/8=2k. | Pass |
| 8.3 η³=12ν | ℤ/24 | 4ν has order 6 and 12ν order 2; 12ν maps to 4 in ℤ/8 (h₀²h₂). `hatcherAT` 16749–16752 (PDF 394 = p.385) gives η³=4ν in the 2-primary part and 12ν in ℤ/24. | Pass |
| 8.4 tables | RP⁴, RP²×RP², CP² | (w₄,w₂²) evaluate to (1,0), (1,1) and (1,1). Thom p.79 (`thom1954` 2619): 𝔑₃=0. IV.13 on p.81 (2686–2695), with Rokhlin credited for n=3. | Pass |
| 8.5 fibre degree | q=1+j(x+iy) | qiq⁻¹≈i−2xk−2yj. In the basis (j,k) the determinant is −4<0, so the degree is −1. Total sign (−1)^n: −1 at n=1 and +1 at n=2. | Pass |
| 9.1 charts | (0,0); (1,0); split null a | diag(1,0,0). [[1,1,0],[1,1,0],[0,0,0]]/2 is idempotent. The transition A₀₁/A₁₁=x̄/N(x)=x⁻¹. On the split algebra tr(A∘A)=1+2t²N(a)=1 for every t, an unbounded family. | Pass |
| 9.2 volume sign | C₀C₁⋯C₈ on (1,0)∈𝕆² | Computed with the pinned product `⟨a,b⟩⟨c,d⟩=⟨ac−d̄b, da+bc̄⟩` (`CayleyDickson/Basic.lean:203`): the result is (−1,0), and with −C₈ it is (1,0). Each C_e²=id. | Pass |
| 9.3/9.4 classes | OP², HP¹, HP² | (381·39−19·36)/14175=14175/14175=1. (1+u)⁴/(1+4u)≡1. (1+u)⁶/(1+4u)=1+2u+7u², and L₂=(49−4)/45=1. | Pass |
| 10.1 range | d₅, d₆; L⁷×L⁷ at p=3 | H₆(Bℤ/m)=0 (`groupHomologyIsoEven`, `FiniteCyclic.lean:85`). ρβ(v₁v₂u₂²)=u₁v₂u₂²−v₁u₂³. P¹β(v₁v₂)=u₁³v₂−v₁u₂³. The product is −v₁v₂u₁³u₂³, and −1≡2 mod 3. | Pass |
| 10.3 structure group | conjugation on su₃ | Conjugation acts by −1 on the diagonal Cartan subalgebra. −1 is not in S₃: its reflections have det −1 and its rotations order 3. Conjugation on CP² has degree (−1)²=+1. P(1,2) has w₂w₃=1 (Thom p.79). | Pass |
| 10.4 gcd and adjoint | n=2,…,7; w(ad) | The gcds are 10, 28, 6, 22, 26, 4, matching 2^a·p. `(1+t₂+t₃)³∏_s(1+t₂+t₃+s)` gives w₈=t₈+t₂⁴ and w₁₂=t₁₂+t₂⁶+t₃⁴. Sq²t₃=x₁⁴x₂+x₁x₂⁴=t₂t₃. | Pass |

### Cross-roadmap citations resolved this round

- **Main (488fd41):**
  - GeometricTopology: Layer 1 `:783`, 1.1 `:788` (with the interior-inclusion homotopy equivalence at `:809`), 4.3.1 `:2430`, 11.3 `:7887`.
  - DifferentialGeometry 2.1–2.2 `:345–356`.
  - GeneralizedCohomology G1 item 1 `:141`, G2 item 10 `MappingPathSpace` `:542–562`, G3 item 3, G3.8 `spectrumConnectiveCover` `:797`, G5 items 0–7 from `:1373`, G5.5-ABS `:1767`, `realMixedCliffordIndexClassification` `:2084`.
  - CharacteristicClasses C1 items 3–4 `:664–684`, C3.6, C7.3a.
  - SpinGeometry G6.7 `:831`.
  - ClassifyingSpaces Stage 4 item 17 `:238`.
  - LieHighestWeight Layer 8 `:1345–1407`.
- **Open heads:**
  - AlgebraicTopology #1652 (946a78a): 6.3 `:2237`, 8.13 `:3892`, with the smoothing at `:3935` and the parametric theorem at `:3978`.
  - DifferentialGeometry #886 (b5e32fc): 5.5b `:1401`.
  - StringOrientation #948 (07f0981): S1.3 `:366`, S1.5 `:458`, S2.2 `:551`, S2.3 `:607`, S5.3 `:1158`. Its *Needs:* lines show no use of TangentialBordism.
- **Overlaps.** No open pull request changes this roadmap or drops an id it cites. The leads for ids that only an open revision defines resolve to #886 (R02) and #1652 (named). The vocabulary neighbours FourManifolds, CalibratedGeometry and HomotopySpheres consume this roadmap and are not cited as suppliers. The ownership checks against the sibling heads were done with `roadmaps grep` and `roadmaps show`; the one conflict found is R01.

## Not verifiable

- Lee, *Introduction to Smooth Manifolds*, 2nd ed., Theorems 6.10, 6.26, 6.35 and 6.36 (sample target 2.1): Springer GTM, paywalled, not in the manifest and not cached. They are cited by locator only.
- Not read this round because they are outside the sample: Munkres Thm 10.6, Milnor 1960 Thms 4–5, Atiyah–Bott–Shapiro, McCleary Thm 6.21, Wall Lemmas 7–13, Kreck–Stolz Prop. 4.2/Lemma 4.3, Rosenberg–Stolz Thm 3.3, Stolz 1992, Gompf–Stipsicz §§3.1, 8.3, and Lee Thms 21.10, 21.13.

## Source issues

- none
