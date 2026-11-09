# Review of TangentialBordism (pull request #942 at ef08ea4)

**Verdict:** needs changes

Full review of the head ~18 read. The folder is unchanged since then, and so is the description's revision paragraph. Both of ~18's findings are therefore still open (R06, R07). The full pass found five new defects. Two are blocking (R01, R02): both concern B1.6's corner theorems and its unequal-dimension Sard theorem. The other three are a locator (R03), an orphaned supplier row (R04) and a misworded Check (R05).

## R01 (P2) — B1.6's Sard and facewise transversality are claimed for every Mathlib model, but their route needs DifferentialGeometry 5.5b's face structure

**Location.** `TauCetiRoadmap/TangentialBordism/README.md:401–403`: "Each is a smooth statement on finite-dimensional real, Hausdorff, second-countable manifolds with corners in Mathlib's sense". The Sard bullet (`:437–438`) is stated for "manifolds with corners over finite-dimensional real models". Its route (`:444–446`) starts from "a point of a face stratum of M (DifferentialGeometry 5.5b)". The parametric and relative transversality statements (`:466–468`, `:505`) quantify over every "face stratum".

**Claim.** Every Mathlib manifold with corners has the face strata that the route and the facewise hypotheses use.

**Witness.** DifferentialGeometry at #886 (8f9be9a), `README.md:180–182`: 5.5b's face structure is "additional smooth local quadrant/face data, not a theorem that an arbitrary convex model range has smooth faces". Take a model whose range is the closed unit disc in ℝ². It is convex with nonempty interior, so it is a legal `ModelWithCorners`, but it carries no quadrant data. On such a source the strata are undefined, the reduction to boundaryless strata cannot start, and "facewise transverse" has no meaning.

**Repair.**
- At `:401–403` and in the Sard and transversality bullets, replace "in Mathlib's sense" with "carrying DifferentialGeometry 5.5b's smooth face structure (boundaryless and half-space models included)". The sources this roadmap builds have such a structure: half-space witnesses and the quadrant and product corners of B1.1 and B1.6. HomotopySpheres at #1287 (`:113`, `:425`), a consumer of B1.6's Sard theorem, cites it for manifolds with corners.
- Keep `exists_contMDiff_homotopicRel` and the smoothing bullet over arbitrary I. Its route (`:487–501`) uses no strata, and Mathlib's `Continuous.exists_contMDiff_approx_and_eqOn` takes any `(I : ModelWithCorners ℝ E H)`.
- The alternative is to keep the general class and add, as a target, local smooth extension of maps smooth within a convex model range (a Whitney-extension input).
- Tested on the disc model: under the repaired wording it is excluded from the Sard and transversality bullets and still covered by the smoothing theorem.

## R02 (P2) — The unequal-dimension Sard theorem is statable at the pins but is neither stated in `Suggested.lean` nor named in its docstring

**Location.**
- `README.md:77–78`: "B1.6 owns the Sard theorem on manifolds with corners in unequal dimensions". The statement itself is at `:437–443`.
- `TauCetiRoadmap/TangentialBordism/Suggested.lean:9–47`. The docstring states B1.6's smoothing and lists B1.6's transversality as not statable, but never mentions Sard.

**Claim.** Every headline is either stated in `Suggested.lean` or named in its docstring as not statable.

**Witness.**
- The docstring treats B1.6's theorems as headlines: smoothing is stated, and transversality is listed with its missing carrier.
- Sard is the B1.6 theorem the transversality theorems are derived from (`:77–84`). Another roadmap consumes it: HomotopySpheres at #1287 (912f30d), `:113` and `:425`. Its equal-dimension case is pinned as `TauCeti.isNullSet_image_criticalPoints` (`Geometry/Manifold/Sard/EqualDimension.lean:105`).
- The following elaborates against the pins (scratch probe, one `sorry` warning, nothing else):

```lean
theorem probe_isNullSet_image_criticalPoints_halfSpace
    {n : ℕ} [NeZero n] {M : Type*} [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace n) M] [IsManifold (𝓡∂ n) ∞ M] [LindelofSpace M]
    {E' H' N : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
    [MeasurableSpace E'] [BorelSpace E'] [TopologicalSpace H'] (J : ModelWithCorners ℝ E' H')
    [TopologicalSpace N] [ChartedSpace H' N] [IsManifold J ∞ N]
    {f : M → N} (hf : ContMDiff (𝓡∂ n) J ∞ f) :
    TauCeti.IsNullSet J (f '' {x | ¬ TauCeti.IsRegularPoint (𝓡∂ n) J f x}) := by
  sorry
```

(imports: `TauCeti.Geometry.Manifold.Measure`, `TauCeti.Geometry.Manifold.RegularValue`).

**Repair.**
- State this theorem in `Suggested.lean` under the Layer 2 section comment. The class shown is boundaryless or half-space sources, which is exactly Lee 6.10's class (manifolds with or without boundary).
- Add the backticked name to the README's Sard bullet.
- Name the face-structured corner case in the module docstring as not statable: DifferentialGeometry 5.5b's face structure is not at the pins.
- If R01 is instead repaired by keeping arbitrary models, state the general-I version.
- The one-tactic probe must fail on it. It cannot close by `simp`, because the pinned theorems require `finrank` equality.

## R03 (P3) — B4.1's and B4.7's operation axioms cite Milnor–Stasheff, which states neither the Adem relations, nor stability, nor Sq¹ = β

**Location.**
- `README.md:1045–1047` asks to "prove … Cartan, Adem, suspension stability and Sq1=Bockstein". `:1068–1069` gives the only locator: "For the ordinary squares and Thom identity use Milnor–Stasheff, Chapter 8 and Chapter 11".
- `:1162–1164` (B4.7) lists "instability/top power, Cartan, Adem with β, suspension" with no locator at all.

**Claim.** The cited text contains the stated operation properties.

**Witness.**
- Milnor–Stasheff (`4f8edd74`, the TeXromancers edition) at lines 2499–2534, pp.100–101, characterises Sq^i by four properties: additivity, naturality, Sq⁰ and the top square with instability, and Cartan. It has no Adem relation, no suspension axiom and no Bockstein.
- Chapter 11 is Wu's formula (Theorem 11.14, line 3651).

**Repair.** Add Hatcher, *Algebraic Topology*, §4.L. This is `hatcherAT`, already in the manifest.
- p.489, `hatcherAT` lines 21051–21061, gives properties (1)–(7): naturality, additivity, Cartan, (4) suspension stability, (5) top square and instability, Sq⁰ = 1, and (7) Sq¹ is the ℤ₂ Bockstein.
- pp.489–490, lines 21083–21093, give the odd-prime Pⁱ analogues.
- p.496, lines 21406–21411, gives the Adem relations, including the odd-prime ones with β.

Cite these at `:1068` and `:1164`. The cup-i formula `Sq^k[c]=[c cup_(n−k)c]` needs its own primary locator (Steenrod's 1947 Annals paper on products of cocycles, recorded by its locator if no legal copy exists). Hatcher constructs the squares by another route.

## R04 (P3) — The IntegralLattices supplier row is consumed by no target, and its boundary cell describes GeometricTopology's gap

**Location.** `README.md:322`: "| [IntegralLattices](…) | integral lattice and real intersection-form algebra | B3.2(a) imports the finite-F₂ Arf invariant of gap:finite-quadratic-arf for the Spin-surface refinements |".

**Claim.** Each supplier contract names the sections it consumes, and some target consumes them.

**Witness.**
- `grep -n IntegralLattices README.md` hits only `:322`. No *Needs:* or Dependencies line cites it, and the row names no section.
- The Arf sentence in its boundary cell describes `gap:finite-quadratic-arf`. That is GeometricTopology 4.3.1's algebra (row `:313`), not IntegralLattices'. The cell is left over from the version at 2c82879, in which B3.2(a) constructed the Arf invariant itself.

**Repair.** Delete the row. If B1.7's "signature −8 by the relative intersection form" (`:851–852`) is meant to use IntegralLattices, then:
- add the IntegralLattices section by name to B1.7's *Needs:* (`:878`), for example its signature-triple convention at IntegralLattices `README.md:258`;
- and move the Arf sentence to the GeometricTopology row.

## R05 (P3) — A 4.4 Check calls P¹βι₂ the first exterior class

**Location.** `README.md:1212–1213`: "the first exterior class P^1βι₂ lies in degree7".

**Claim.** The Check describes H*(K(ℤ/3,2);F₃) correctly.

**Witness.** The README's own Check at `:1206` gives the ring as `Λ(βι₂, P^1βι₂, …)`, and `:1206–1207` says degree 3 is spanned by βι₂. So the first exterior class is βι₂, in degree 3. P¹βι₂ is the second, in degree 3 + 2(3−1) = 7.

**Repair.** Write "the second exterior generator P^1βι₂ (after βι₂ in degree 3) lies in degree 7". The values 8 and 7 are unchanged.

## R06 (P3) — AlgebraicTopology 8.13 exists only at #1663, which the description does not name

Not repaired: ~18 R01 (~17 R04).

**Location.**
- `README.md:84`: "the smoothing, parametric and relative transversality theorems are AlgebraicTopology 8.13's". It is also cited at `:311`, `:460`, `:484`, `:503`, `:525`, `:568`, `:886` and `:3044–3048`.
- The description's revision paragraph reads: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652".

**Witness.** "8.13" occurs 0 times in AlgebraicTopology on main (86b3953) and 0 times at #1652 (287181d). At #1663 (2dc8cf2) it occurs at `README.md:68–76`: "Stage 8.13 … owns … the smoothing of continuous maps relative to a closed set, the parametric transversality theorem and relative transversality". It occurs again at `:2919`.

**Repair.** No README change. Write the description's revision paragraph as: "#886 (DifferentialGeometry 5.5b), #903 (GeometricTopology 1.1, 4.3.1, 11.3), #1652 (AlgebraicTopology Layers 2, 4, 6, 8), then #1663 rebased on #1652 (AlgebraicTopology 8.13)".

## R07 (P3) — DifferentialGeometry 5.5b exists only at #886, which the description does not name

Not repaired: ~18 R02 (~17 R05).

**Location.** `README.md:312`: "5.5b's smooth face structure and face-indexed abstract boundary". It is also cited at `:406`, `:445`, `:533`, `:568`, `:580`, `:647`, `:692`, `:695`, `:794` and `:886`.

**Witness.** "5.5b" occurs 0 times in DifferentialGeometry on main (86b3953) and 25 times at #886 (8f9be9a); the definition is at `:180` and the target at `:1257`. `roadmaps overlaps` lists the same lead, at lines 568 and 794.

**Repair.** The single description edit given in R06 names #886.

## Previous findings (~18)

- **R01: not repaired.** The description's revision paragraph still reads "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652". See R06.
- **R02: not repaired.** The same paragraph, which does not name #886. See R07.

## Verified sound

### Gate, dependency check, elaboration and probes

- **Gate**, rerun at ef08ea4 with `--base origin/main`:

  ```text
  gate TangentialBordism: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's record at this head adds `build=0`.
- **Dependency check** (`--movable`):

  ```text
  depcheck: 238 roadmaps, 2320 edges, 0 problem(s)
  ```

  It prints no UPWARD or CYCLE line. TangentialBordism is line 14 of the merge order, after IndexTheory (10), StringOrientation (11), SmoothBundlesConnections (12) and PseudodifferentialOperators (13).
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/TangentialBordism` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with exactly four `sorry` warnings (`:64`, `:84`, `:113`, `:131`).
- **`#check @` probe.** I ran it on all four declarations, together with the pinned `boundaryChartedSpace`, `isManifold_boundary`, `boundaryOrientation`, `IsOrientationPreservingAt`, `IsOrientedAtlas`, `Continuous.exists_contMDiff_approx_and_eqOn` and `exists_embedding_euclidean_of_compact`. Each elaborated type matches its README statement:
  - smoothing has arbitrary I, `[T2Space M] [SigmaCompactSpace M]`, and `[CompactSpace P] [BoundarylessManifold J P]`;
  - the oriented nullbordism has `1 ≤ n → n ≤ 3`, with W in M's universe;
  - the unoriented nullbordism has `n = 1 ∨ n = 3`.

  The file has no section `variable`s, so no binder can be lost. The "structure `,`" entry in `signatures.md` comes from the docstring phrase "structure, which" at `:111`, not from a declaration. Nothing in the file changed.
- **Padding probe.** I replaced each `sorry` with `first | simp | infer_instance | rfl | trivial | aesop` on a scratch copy. All four fail: `aesop` makes no progress at `:76`, and goals stay unsolved at `:104`, `:125` and `:138`.
- **Lean form.** The file has one module docstring, `namespace TauCetiRoadmap.TangentialBordism`, Layer 2 and Layer 8 section comments, and a docstring on every declaration. It uses `theorem` only, has no `set_option`, and its four `TauCeti.*` imports are all used. `roadmaps grep --lean-only` finds the four names only here.

### Seeded sample (15 targets)

Cached texts whose ids are not in the manifest are cited by hash prefix:
- `4f8edd74`: Milnor–Stasheff, TeXromancers edition;
- `c70bf1f2`: Miller's notes;
- `06e4566a`: Führing, Münster J. Math. 15;
- `aa5a2f05`: Benedetti–Lisca, arXiv v2.

| Target | Locator | Text at the locator | Result |
| --- | --- | --- | --- |
| 2.1 (B1.6) | Lee Thms 6.10 p.129, 6.26 p.141, 6.35 pp.145–146, 6.36 pp.146–147; pinned declarations | Lee: paywalled. Pin: `addHaar_image_criticalPoints_eq_zero` (`Analysis/Calculus/Sard/OutermostStratum.lean:347`, `(finrank E)²+1 ≤ n`, any two dimensions); `isNullSet_image_criticalPoints`/`dense_isRegularValue` (`Sard/EqualDimension.lean:105,112`, `hdim` equality); `ContMDiff.isMeagre_image_criticalPoints` (`Sard/Meagre.lean:114`, `[I.Boundaryless]`, meagre); `IsNullSet` (`Manifold/Measure.lean:36`), `.biUnion` (`:81`), `.dense_compl` (`:108`); `IsRegularPoint` (`RegularValue.lean:86`); `exists_diffeomorph_normalBundle_subset` (`TubularNeighborhood/Existence.lean:53`, binders `:38–45` with `[I.Boundaryless] [J.Boundaryless] [T2Space N] [SecondCountableTopology N]`); `exists_contMDiffMap_isProperMap_nonneg` (`Exhaustion.lean:71`, any model with corners, the empty manifold included) | Pin matches the README; Lee not verifiable; R01, R02 |
| 2.2 (B1.1) | pinned orientation API; AlgebraicTopology 6.3; DifferentialGeometry 2.1–2.2 | `reducedSingularHomologySphereIso`, degree-zero generator `[-b 0] - [b 0]` (`AlgebraicTopology/Singular/Sphere.lean:40`); `localOrientationOfManifoldOrientation` (`…/Orientation/Chart.lean`); `Orientation.eq_or_eq_neg_of_isEmpty`, `Orientation.map_of_isEmpty` (Mathlib `LinearAlgebra/Orientation.lean`); AT 6.3 at #1652 `:1991`; DG main 2.1–2.2 `:345–356` (2.2 includes the oriented-atlas criterion for boundaryless M, Lee 15.6) | Pass |
| 2.4 (B1.2) | MS Thm 17.1, Lemma 17.2, pp.206–207; Miller Ch.1 §1 Defs 1.1–1.2 pp.1–2; Ch.2 §1 Defs 1.1, 1.3 pp.39–41 | `4f8edd74` line 5439 (collar theorem, folio 206 at 5445), line 5457 (Lemma 17.2, folio 207 at 5477); `c70bf1f2` lines 95, 104 (p.2), 1453, 1538 (pp.39–41; Thm 1.4 at 1565) | Pass |
| 2.6 (B1.4) | Mathlib `exists_embedding_euclidean_of_compact` | `#check`: any I, `[T2Space M] [CompactSpace M]`, closed embedding with injective `mfderiv` | Pass |
| 3.3 (B2.3) | Thom IV.8 p.75 (negative attribution) | thom1954 line 2462, folio 75 at 2464: the stable coefficient isomorphism only | Pass |
| 4.1 (B4.1) | MS Ch.8, Ch.11 | `4f8edd74` lines 2499–2534 (four properties, no Adem/stability/β); Thm 11.14 at 3651 | R03 |
| 5.1 (B5.1) | Miller Ch.1 §§2–3 pp.3–7; Ch.2 §1 pp.39–41; Thom §IV.4 IV.6 p.74, IV.8 p.75 | `c70bf1f2` lines 131 (p.3), 203–232 (pp.5–6, collapse `S^(n+k)→Thν→Thξ_k∧X₊`), 273–294 (p.7); thom1954 lines 2410 (folio 74 at 2424), 2462 | Pass |
| 5.2 (B5.2) | Thom IV.8 p.75; pinned framed PT | thom1954 line 2462; `IsFramedTube` (`PontryaginThom/Basic.lean:72`), `pontryaginThomCollapseMap` (`:136`), `_homotopic` (`:149`), `_comp_prodUnitsHomeomorph_homotopic` (`:196`), `pontryaginThomSphereMap` (`:217`), `exists_isFramedTube` (`PontryaginThom/Existence.lean:68`) | Pass |
| 5.7 (B5.7) | Hatcher SS Ch.1 §1.1 pp.18–19 | hatcherSS lines 997–1011 (page 18: general homology theories, finite-dimensional B, `E2=Hp(X;hq(point))`), 1012–1030 (naturality, into page 19) | Pass |
| 6.3 (B4.6) | MS Problems 16-D–F pp.203–204 | `4f8edd74` lines 5357 (16-D, folio 203 at 5365), 5370 (16-E, m,n≥2, −(m+n)!/m!n!), 5379 (16-F, real (1,1) hypersurfaces, Yⁿ orientable for n odd; folio 204 at 5390) | Pass |
| 7.1 (B3.0) | ABS §§10–11 | the service: DOI prefix 10.1016 paywalled; the institutional mirror is in no licence class | Not verifiable |
| 8.1 (B3.2(b)) | Atiyah Thm 2 p.48; Thm 5 and proof pp.59–60 | atiyahSpin1971 line 75 (PDF page 3 = p.48); line 462 (Thm 5, dimension 8k+2, k=0 allowed; folio 59 at 450), proof to line 492 (folio 60 at 487) | Pass |
| 8.3 (B3.3) | Freed Prop 5.55, (5.57) p.45; Hatcher §4.2 p.385; B–C Fig. 31 p.41 | freedBordism lines 1805, 1817 (page 45); hatcherAT lines 16749–16752 (η³=4ν in the 2-component, actual η³=12ν; folio 385 at 16729); beaudryCampbell line 1741 (MSpin row: ℤ, ℤ/2, ℤ/2, 0, ℤ) | Pass |
| 8.4 (B3.1) | Thom after IV.12 p.79; IV.13 p.81; B–C Fig. 31; Benedetti–Lisca Thm 1 p.1, §2.1 pp.2–3 | thom1954 lines 2610, 2616 (first generator at k=2), 2619 (𝔑₃=0), folio 79 at 2624; 2686–2688 (Rokhlin for Ω₃), folio 81 at 2695; `aa5a2f05` line 15 (Thm 1), lines 74–98 (Wu/Spin proof) | Pass |
| 10.2 (B6.4) | Führing §3 pp.359–363, closed fibre p.359, Prop 3.4 p.362 | `06e4566a` lines 168–175 (p.359, "F a smooth closed manifold"), 332–339 (Prop 3.4, p.362), proof from line 343 (p.363) | Pass |

The README flags no locator as unverified.

### Adversarial mathematics table

| Statement | Instances | Values computed (each side) | Result |
| --- | --- | --- | --- |
| `exists_contMDiff_homotopicRel` | M=∅; C=U=M with f smooth; M=P=S¹, f=id, C=∅; a source on a disc-range model | g=∅; g=f with the constant homotopy; g≃id has degree 1, a constant map degree 0; the approximation lemma takes arbitrary `(I : ModelWithCorners ℝ E H)`, so no face data is needed | Pass |
| same, route | the segment homotopy r((1−t)e(f x)+t g̃ x) | t=0 gives r(e(f x))=f x; t=1 gives g x; on C, g̃=e∘f, so the homotopy is constant; segments stay in the ε-ball inside W | Pass |
| `orientedThreeManifold_parallelization` | ℍ³ coordinate frame; first vector negated; RP²×ℝ; ∅ | det 1; det −1, excluded by positivity; no oriented atlas exists, so hA is false; b is the empty function | Pass |
| `closedOrientedManifold_isOrientedBoundary` | n=1 S¹ with ±o; n=2 genus g; n=3 T³; n=0; n=4 | D² and −D² (`boundaryOrientation_neg`); handlebody; T²×D²; a point has signed boundary count 1≠0, excluded by 1≤n; σ(CP²)=1≠0, excluded by n≤3 | Pass |
| `closedManifold_isBoundary` | n=1; n=3; zero set of ΩO_n for n≤7 | S¹⊔S¹ bounds D²⊔D²; RP²×S¹ bounds RP²×D²; Thom lines 2616–2640: ΩO₀=F₂, ΩO₂=F₂, ΩO₄=F₂², ΩO₅=F₂, ΩO₆=F₂³, ΩO₇=F₂, so {1,3} is exactly the zero set | Pass |
| B1.6 Sard (R02 probe) | pt→ℝ²; ℝ²→ℝ projection; the flat input's order | critical set = pt, image null; no critical point; (dim E)²+1 ≤ ∞ | statable, absent (R02) |
| B1.6 route (R01) | closed-disc model range | convex with nonempty interior; DG 5.5b supplies no faces for it (#886 `:181–182`) | R01 |
| 2.1 relative-transversality Check | M=[0,1], C={0}, Z={0}⊂ℝ, f(t)=t | the 0-dimensional face has derivative image 0, T₀Z=0, sum 0≠ℝ: not transverse; f=1+t misses Z | Pass |
| 2.2 cylinder signs | I×[0,1] oriented (e_t,e_s) | t=1: det(e_t,e_s)=+1; t=0: det(−e_t,−e_s)=+1; s=0: det(−e_s,e_t)=+1; s=1: det(e_s,−e_t)=+1; product rule sign (−1)^dim I=−1 | Pass |
| 2.2 u₁ | ℝ at 0 | pinned generator `[-b₀]-[b₀]` (Sphere.lean `:40`) = [−1]−[1]; segment boundary [1]−[−1]; u₁=−1 | Pass |
| 2.4, 3.3 Checks | two glued positive intervals; ∂[0,1] over {0,1} | endpoints −1 at 0, +1 at 2, total 0; (−1,1), summing to 0 | Pass |
| 4.1 chain equation | i=1; the edge [0,1] | dD₁+D₁d=(1−T)AW; AW−T·AW=−([1]−[0])⊗[0,1]+[0,1]⊗([1]−[0])=d(−[0,1]⊗[0,1]); Sq¹(a²)=2a³=0, Sq²(a²)=a⁴ | Pass (R03 locator) |
| 4.4 Kudo degrees | general k,p; p=3, k=1 | y^(p−1)⊗z in (2k+1, 2k(p−1)), r=2k(p−1)+1, target base degree 2kp+2; p=3: 8; P¹βι₂ in degree 3+4=7, βι₂ in 3 | Pass (R05 wording) |
| 5.2 regression | n=0, k=1, B={a,b} | Th=S¹∨S¹; a+,b+,a−,b− gives aba⁻¹b⁻¹≠1 in F₂; a+,a−,b+,b− gives 1; abelianised counts (0,0) | Pass |
| 5.7 Checks | X=pt; total degree 0 | E²=H_p(pt;Ω_q)=Ω_q at p=0 only; only (0,0) | Pass |
| 6.3 | H_R(2,4); H_R(1,2); general r,s | d=5, binom(6,2)=15≡1; s₂=3xy²−3xy²=0 vs binom(3,1)=3≡1; Lucas: binom(2^r(2s+1),2^r)≡binom(2s+1,1)≡1; w₁(TH)=mx+ny≡0 for m, n even | Pass |
| 7.1/7.2 | K3; K3×K3; Lie circle | Â=48/24=2, c(α)=2u²=c(a); Â=4, a²=4b; η∈KO₁=ℤ/2, KU₁=0 | Pass |
| 8.1 | Lie torus | q(a)=q(b)=1, q(a+b)=1+1+1=1, Arf=q(a)q(b)=1; Atiyah Thm 5 at k=0 gives polarisation ⟨ab,[X]⟩ | Pass |
| 8.3 | ℤ/24 | order of 12ν = 24/gcd(12,24)=2; order of 4ν = 6; 12 mod 8 = 4 | Pass |
| 8.4 | RP⁴; RP²×RP²; CP² | (1+a)⁵: w₂=binom(5,2)=10≡0, w₄=5≡1, so (1,0); (a²+ab+b²)²=a²b², so (1,1); binom(3,1)≡binom(3,2)≡1, so (1,1) | Pass |
| 10.2 | trivial G, base point; F=I; I×S¹ | 1↦[F]; I has two boundary points, excluded by the closed-fibre hypothesis (Führing p.359); ∂=S¹−S¹ | Pass |
| 9.3, 9.4 | HP², OP² | (1+6u+15u²)(1−4u+16u²)=1+2u+7u², (49−4)/45=1; (381·39−19·36)/14175=14175/14175=1 | Pass |
| 10.4 | n=2, r=0; n=3, r=0,1 | −2(6−1)=−10; −2(15−1)=−28; gcd 28=2²·7 with a=2 at n=3=2²−1 | Pass |
| Supply layering | B5.4 → StringOrientation S2.2 → S2.1 → EllipticCohomology E5 | S2.2 *Needs:* S1.2, S2.1, G5, DGFloer, GT1, C2 (#948 `:551–575`); S2.1 uses only E5's MString (#948 `:526–550`), whose *Needs:* is GeneralizedCohomology alone (EllipticCohomology main `:1549`); BordismFormalGroups F4 enters E5 only at `:1725`, `:1742`, `:1780`. S5.3's equivalence uses the K(ℤ/2,1) fibre, DGFloer items 2 and 4 and C2 (#948 `:1173–1186`), not F3–F5 | Pass |

### Cross-roadmap citations resolved

- **Main (86b3953):**
  - DifferentialGeometry 2.1–2.2 (`:345–356`).
  - SpinGeometry G4.3, G4.4 (`:52–53`, items at `:479`, `:491`), G5.0 `realCliffordSpinorBundle` (`:506`), G6.0 (`:571`), G6 item 5 (two circle lifts, `:775–787`), G6.7 (`realSpinDiracIndexClass = α·a`, `:831`).
  - GeneralizedCohomology G1.1 (`:141`), G2.10 `MappingPathSpace` (`:533–558`), G3.3 (`:710`), G3.8, G3.9 (`:878`), G4.0a (`:939`), G4.3, G4.5, G5.0 (`:1375`), G5.2 (unframed collapse, `:1523–1535`), G5.3, G5.4 (ko=τ_(≥0)KO, `:1660`), G5.5 (`realMixedCliffordIndexClassification`, `realNegativeCliffordFamilyIndex`).
  - CharacteristicClasses C1.3 (`:664`), C1.4 (`:682`), C3.3 (`:1122`, away-from-2 multiplicativity at `:1126`), C3.6 (`:1229`), C7.3a (`:1936`).
  - RiemannianGeometry R1 (HP^d quotient metric, curvature 1 and 4, `:280–295`); ClassifyingSpaces Stage 4 (`groupHomology`, `:44`, `:95`).
  - LieHighestWeight Layer 8 (`:1197`, the three names at `:1255ff`); LieGroups Layers 2 (`:356`) and 4 (`:463`); SpinRepresentations Layer 7 (`:881`).
  - BordismFormalGroups `:30`, `:188`, `:208`, `:463` (consumers of B4 and B5.4c); QuadraticFormInvariants excludes characteristic 2 (`:177`), so it has no Arf owner.
- **Open heads:**
  - StringOrientation #948 (07f0981): S1.3 (`:366`), S1.5 (`:458`), S2.2 (`:551`), S2.3 (`:607`, ν from E4.S), S5.3 (`:1158`).
  - IndexTheory #1077 (6d85f5d): I2.5 (`:648`), I5.4 (`:1187`), I7.2 (`:1371`), I7.5 (`:1514`, σ=−16α at `:1530`).
  - GeometricTopology #903 (a6ba299): 1.1 (interior homotopy equivalence, `:807–808`), 1.3 doubles for any M (`:849–869`), 1.5 tube uniqueness (`:987`), 4.3.1 (`:2425–2441`), 11.3 (`:7838`).
  - AlgebraicTopology #1652 (287181d): Layers 2 (`:704`), 4 (`:913`), 6 (`:1655`), 6.3 (`:1991`), 8 (`:2610`). AlgebraicTopology #1663 (2dc8cf2): 8.13 (`:68–76`, `:2672–2712`), which avoids a manifold Sard in unequal dimensions and names TangentialBordism B1.6 as its owner.
  - DifferentialGeometry #886 (8f9be9a): 5.5b (`:180–187`, `:1257`).
- **Declared gap.** There is no readable `plan.json`, so `gap:finite-quadratic-arf` reads as a citation of GeometricTopology 4.3.1 at #903, which the description links. Its `:2427–2437` states every item of the README's contract (`:327–340`): the symplectic-basis Arf, basis independence, isometry invariance, additivity, the plane decomposition and classification, the Gauss sum `(−1)^Arf·2^m`, the zero count, and the half-dimensional q-zero criterion.
- **Ownership.**
  - `roadmaps grep` finds unequal-dimension manifold Sard owned only here; HomotopySpheres #1287 (912f30d) consumes it at `:113` and `:425`.
  - The four Lean names are unique.
  - No forbidden supplier is cited.
  - Overlaps: no open pull request changes this roadmap or drops an id it cites. The "only an open revision defines" leads are #1652, named in the description, and #886 (R07); 8.13 at #1663 is R06.

## Not verifiable

- **Lee**, *Introduction to Smooth Manifolds*, Theorems 6.10, 6.26, 6.35 and 6.36 (2.1, sample): Springer, paywalled.
- **Atiyah–Bott–Shapiro**, *Clifford modules*, §§10–11 (7.1, sample): the sources service reports DOI prefix 10.1016 as paywalled. The redirect target of the institutional mirror is in no licence class.
- **Ownership against GeneralizedCohomology #1187 and HomotopySpheres #284**: both are close in vocabulary, but the brief gives no checkout, so they were not checked. GeneralizedCohomology was checked on main.

## Source issues

- none
