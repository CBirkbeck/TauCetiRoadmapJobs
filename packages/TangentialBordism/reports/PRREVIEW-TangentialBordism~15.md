# Review of TangentialBordism (pull request #942 at 059ac6a)

**Verdict:** needs changes

This is an incremental re-review of the 69 README lines that changed since 8e5c510. `Suggested.lean` and `metadata.toml` are byte-identical to 8e5c510, and nothing outside the folder changed.

- **~14 R01 and R02 are repaired.** The four dropped-name mentions are gone (the gate now reports `dropped=0`), and the CW structure on `|K|` and the smooth-triangulation carrier are cited at the Tau Ceti pin, with a From Tau Ceti paragraph that describes them accurately (checked declaration by declaration below).
- **~14 R03 and R04 are not repaired** (R01 and R02 below). Both are about the pull request's description, not the README; no README change is needed for either.

Both findings are P3. There is no mathematical finding.

## R01 (P3) — AlgebraicTopology 8.13 is defined only at open revision #1663, which the description still does not name

**Location.**
- `TauCetiRoadmap/TangentialBordism/README.md:260`: "Layers2–4,6,8 and 8.13".
- Also `:74`, `:405`, `:429` and the other 8.13 citations the previous report listed.
- The description's revision paragraph: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652".

**Claim.** The revisions the description names define every cited numbering, 8.13 included.

**Witness.**
- AlgebraicTopology on main (3b3f7ef): 0 hits for "8.13".
- The head of #1652 (4e825d6): 0 hits.
- The head of #1663 (8029fe9) defines it: `README.md:68` ("Stage 8.13 consumes geometric topology's Layer 1") and `:2704` ("8.13 smooth low-codimension representatives").

**Repair.** Name #1663 beside #1652 in that paragraph and say which of the two merges first; the other is rebased on it, so that one head carries both Layer 8 and 8.13. No README change.

Re-raised from ~14 R03 (and ~13 R02). No repair report marks it not actionable.

## R02 (P3) — DifferentialGeometry 5.5b is defined only at open revision #886, which the description still does not name

**Location.**
- `README.md:261`: "5.5b's smooth face structure and face-indexed abstract boundary".
- Also the ten other "5.5b" citations (11 in all at this head).
- The same description paragraph.

**Claim.** DifferentialGeometry 5.5b is a supplier section that can be cited.

**Witness.**
- DifferentialGeometry on main (3b3f7ef): 0 hits for "5.5b".
- The head of #886 (a565de6) defines it at `README.md:88` ("5.5b adds a smooth face structure on `M` for face-indexed boundary and corner").
- `overlaps.md` lists "DifferentialGeometry §5.5b … #886 … must merge first".

**Repair.** Name #886 in the revision paragraph. No README change.

Re-raised from ~14 R04 (and ~13 R03).

## Previous findings

- **R01 — repaired.** `:42–43` now reads "Neither owned nor used here: the integral Hopf invariant one theorem and the classification of parallelizable spheres"; `:47–48` "Owned here: … which BordismFormalGroups consumes"; `:1168–1169` "consumed by item8 and BordismFormalGroups"; `:2898` "BordismFormalGroups consumes the ordinary operation and Adams interfaces". Gate: `dropped=0`.
- **R02 — repaired.** `:235–252` names `AbstractSimplicialComplex.realizationCWComplex` (with `realizationCellEquiv` and `skeletonLT_realizationCWComplex`) and `TauCeti.IsSmoothTriangulation` with their files; `:245`, `:359–360`, `:645–647`, `:2221–2225` cite them in place of GeometricTopology 11.1; "11.1" is gone from `:260`, `:676`, `:2248` and `:2299`.
- **R03 — not repaired (now R01).** The description still reads "which merge first: #1652"; `:260` still cites "Layers2–4,6,8 and 8.13".
- **R04 — not repaired (now R02).** The same paragraph names only #1652; `:261` still cites "5.5b's smooth face structure and face-indexed abstract boundary".

## Verified sound

### Gate, dependency direction, outside-folder diff, elaboration

- **Gate**, rerun at 059ac6a with `--base origin/main`:

  ```text
  gate TangentialBordism: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's record adds `build=0`.
- **Dependency check** with `--movable`:

  ```text
  depcheck: 244 roadmaps, 2465 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line.
- **Folder and outside-folder diff.** The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. `git diff --stat origin/main...HEAD` outside the folder is empty; `git diff 8e5c510..HEAD --stat` touches only `README.md` (46+/23−).
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/TangentialBordism/Suggested.lean` exits 0; the only diagnostics are the two `sorry` warnings (`:51`, `:71`). The file is byte-identical to 8e5c510, so the signature probe, the headline list (B1.6 relative smoothing, 8.4 parallelization), the docstring's not-statable list and the one-tactic padding probe carry from ~9, ~11, ~13 and ~14; `signatures.md` for this head agrees with ~14's probe (no section binder lost: `T2Space`, `SecondCountableTopology`, `modelWithCornersEuclideanHalfSpace 3`, `SigmaCompactSpace`, `CompactSpace P`, `BoundarylessManifold J P` all present).
- **Citation resolver and overlaps.** The worker's resolver found nothing unresolved. `overlaps.md` lists no other pull request changing this roadmap, no dropped id it cites, and the only-at-a-revision ids DifferentialGeometry 5.5b (#886, R02) and AlgebraicTopology Layers 2, 4, 6, 8 (#1652, named in the description). Ownership against open pull requests whose files the brief does not supply was not checked.

### The From Tau Ceti paragraph (`:235–252`), checked declaration by declaration at Tau Ceti 2fd255d

- `AbstractSimplicialComplex.realizationCWComplex` (`AlgebraicTopology/SimplicialComplex/Realization/CWComplex/Basic.lean:172`): `(K : AbstractSimplicialComplex ι) : CWComplex (Set.univ : Set (Realization K))` under `variable {ι : Type*} [LinearOrder ι]` (`:45`), with no finiteness hypothesis. The topology on `Realization K` is the weak (final) topology for the face inclusions (`Realization/Basic.lean:164–165`). The module docstring (`:19–21`) says the order only enumerates each face's vertices and the cells depend only on the faces, as the README says.
- "every vertex type admits one": Mathlib `WellOrderingRel` with `WellOrderingRel.isWellOrder` (`SetTheory/Cardinal/Order.lean:524`, `:527`) and `linearOrderOfSTO` (`Order/RelClasses.lean:97`) give a classical linear order on any type.
- "Its n-cells are the faces with n+1 vertices": `realizationCellEquiv K n : cell univ n ≃ RealizationCell K n` (`:217`), and a `RealizationCell K n` is a face with `card = n + 1` (used at `:188–191`).
- "its closed cells are the realized closed simplices": `closedCell_realizationCellEquiv_symm` (`:240`).
- "the union of its cells of dimension less than n is the set of points with at most n nonzero barycentric coordinates": `skeletonLT_realizationCWComplex K n : skeletonLT univ n = {x | support.card ≤ n}` (`:273`), stage 0 empty, stage ⊤ everything.
- `TauCeti.IsSmoothTriangulation` (`Geometry/Manifold/SmoothTriangulation/Basic.lean:191`): `(f : Realization K ≃ₜ M) : Prop := ∀ σ : Face K, IsSimplexImmersion I n (f ∘ faceInclusion K σ)`; the module docstring (`:26–33`) defines a simplex immersion as the restriction of a map Cⁿ within the barycentric simplex whose derivative within it is injective on the sum-zero directions, exactly as the README paraphrases.
- "The pin proves no existence theorem for it": the SmoothTriangulation directory (Approximation, Basic, Edgewise, Embedding, GlobalEmbedding, Secant, Subdivision) has subdivision stability (`Subdivision.lean:65`, `Edgewise.lean:130`), `trans_diffeomorph` (`:201`), the unit-interval instance (`:293`) and the negative example `exists_contMDiff_not_isSmoothTriangulation_trans` (`:365`); a grep for `∃ … IsSmoothTriangulation` over the whole pinned library finds no general existence statement.

### GeometricTopology at the head of #903 (now 091ed17)

- **1.1** (`:570`, item at `:590–591`): the interior `M ∖ ∂M` is a smooth boundaryless manifold and its inclusion is a homotopy equivalence (Lee, Theorem 9.26). Unchanged since ~14.
- **11.3** (`:13217–13222`): the Cairns–Whitehead theorem for every smooth manifold, a smooth triangulation being "a homeomorphism from a realization whose restriction to each closed simplex is a smooth embedding with injective differential". This is the pinned predicate's notion word for word (homeomorphism, simplexwise Cⁿ immersion), so the README's "a homeomorphism satisfying the pinned `TauCeti.IsSmoothTriangulation` (Layer11.3)" at `:260` and `:2221–2223` attributes to 11.3 the statement it makes. Remark, not a finding: GeometricTopology 11.3 does not itself name `TauCeti.IsSmoothTriangulation` (0 hits in its README); when it formalises on that carrier nothing more is needed, and if it chose another carrier a one-line comparison would be the supplier's.
- **4.3.1** (`:3538`) still exists for the declared gap. The description's Finite Arf paragraph names #903.
- **11.1** is no longer cited anywhere in this README (0 hits for "11.1").

### The 8.4 passage (`:2216–2232`) after the edit

- The route is the same as at 8e5c510 (interior M°, GeometricTopology 1.1, obstruction theory over the cells, transport back); only the carriers of `h` and of the CW structure changed. `IsSmoothTriangulation` asks for a homeomorphism onto M° with no compactness, so K is infinite when M° is non-compact, as the text says. The CW structure is the pinned one on every `K`, countable or not.
- "with one n-cell for each face with n+1 vertices" is `realizationCellEquiv`; the obstruction route needs only cells of dimension ≤ 3, which is `skeletonLT 4 = univ` for a 3-dimensional K (support card ≤ 4).
- Its *Needs:* line (`:2248`) and the layer's Dependencies (`:2299`) list GeometricTopology 1.1 and 11.3 and the two pinned names; B1.5 is still listed for the quotient carriers of the Checks.

### The 2.1 and 2.3 edits

- `:356–360`: the CW structure on `|K|` is the pinned declaration and the existence of the triangulation is GeometricTopology 11.3; the Sard, collar and handle citations are unchanged.
- `:643–647` and `:676`: 2.3 consumes the triangulation on the pinned carrier and the CW structure on a finite complex, and still owns the relative refinement (collared boundary or union of faces as a subcomplex). For a finite K, `Realization/Finite.lean:14` says the weak topology is the coordinate-space topology, so the finite case is the pinned one specialised.

### The scope and consumers edits

- `:42–47`: CharacteristicClasses on main has C7.3 and C7.3a (unchanged since ~14); the dropped roadmap's declaration `sphere_parallelizable_iff` is no longer named anywhere (0 hits).
- `:47–52`: the mod p Steenrod algebras and Adams towers are "consumed by BordismFormalGroups": BordismFormalGroups on main (3b3f7ef) `README.md:172–173` ("Consume TB B4.2's mod-2 Adams tower and, only at odd primes, B4.8's tower") and `:463`.
- `:2898–2904`, "BordismFormalGroups consumes the ordinary operation and Adams interfaces, B4's MO coefficients and the geometric cycles with their Pontryagin–Thom comparison": BordismFormalGroups `:30–31` ("TangentialBordism supplies geometric cycles and the Pontryagin–Thom comparison, and owns the integral unoriented/oriented/Spin coefficient calculations"), `:272` ("TB B4's computed MO coefficients").
- "FourManifolds consumes B1.7's concrete examples, B3.2's quadratic/filling results with the Spin-surface quadratic refinement, B4's ordinary Wu package and B5.2's finite embedded Pontryagin–Thom comparison": FourManifolds at the head of #936 (46ee76a) `README.md:53–55` (B4, B1.7), `:585`, `:627`, `:704` (B3.2(b)–(c) Spin-surface refinement), `:803` ("TangentialBordism 5.2's finite embedded collapse comparison"), `:2029` (B4.3 Wu classes, B4.1 cup-i).
- `:1167–1169`: the odd-prime tower "consumed by item8 and BordismFormalGroups": BordismFormalGroups `:172–173`, `:2759`.

### Seeded sample, where it meets the change

- **8.4 (B3.1)** is the only sampled target the diff touches. Benedetti–Lisca, arXiv:1806.04991v2 (cached arXiv text): Theorem 1 at line 15 (p.1) and §2.1 at lines 74–98 (pp.2–3). The locator and the description of the Wu/Spin route are unchanged and accurate; the boundary and non-compact extensions are claimed as this roadmap's own.
- The other sampled targets (2.1, 2.2, 2.3, 2.7, 3.1, 3.2, 4.1, 5.3, 6.4, 6.5, 6.6, 7.1, 8.1, 9.4, 10.2) are untouched by the diff except for 2.1's and 2.3's citation sentences, checked above; their source checks carry from ~7, ~9, ~10, ~11 and ~13.

### Adversarial mathematics table

Rows marked "new" were computed this round on the changed statements. Rows marked "~14" or "~13" carry from those reports for statements the diff leaves untouched.

| Statement / target | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| From Tau Ceti `:235–246`, cells of `realizationCWComplex` | interval (faces {0},{1},{0,1}); ∂Δ² (3 vertices, 3 edges); ∅ | `realizationCellEquiv`: 2 zero-cells + 1 one-cell; 3 + 3; no cells (no faces) | Pass, new |
| `:242–245`, `skeletonLT n` = support card ≤ n | interval, n = 0, 1, 2; 3-dimensional K, n = 4 | n=0: ∅ (support nonempty); n=1: the two vertices; n=2: all; `skeletonLT 4` = univ since support card ≤ 4 | Pass, new |
| `:241–242`, closed cell of {0,1} = realized closed simplex | interval edge | `closedCell_realizationCellEquiv_symm`: {x : support ⊆ {0,1}} = the whole edge including its ends | Pass, new |
| `:238–241`, "every vertex type admits a linear order", order only enumerates vertices | ι = ℕ with the reverse order vs the usual one | same cells (faces), characteristic maps differ by a permutation of coordinates; `WellOrderingRel` gives an order on any ι | Pass, new |
| `:246–251`, `IsSmoothTriangulation` = homeomorphism, simplexwise Cⁿ immersion | unit interval via the one-simplex; the same followed by t ↦ t² | pin `:293` holds for every n; pin `:365` fails for every n (derivative 0 at 0, not injective on the sum-zero direction) | Pass, new |
| `:251–252`, no existence theorem at the pin | grep over the pinned library | only subdivision stability, `trans_diffeomorph`, the interval instance and the negative example | Pass, new |
| GT 11.3 at #903 `:13219–13220` = pinned notion | definitions compared term by term | both: homeomorphism from a realization, smooth with injective differential on each closed simplex | Pass, new |
| 8.4 `:2219–2226`, triangulation of M° on the pinned carrier, infinite for non-compact M° | ℍ³ interior ≅ ℝ³ with the Kuhn triangulation; D³ interior | affine on each simplex so simplexwise immersion; countably many simplices (ℤ³×6); open ball non-compact so K infinite | Pass, new |
| 8.4 `:2225–2226`, K countable and locally finite | Kuhn triangulation in ℍ³ | 24 simplices per vertex; widths eᵏ(e−1) accumulate at ∂ℍ³ only, which is outside M° | Pass, new (carried values from ~14) |
| 8.4 obstruction over cells of the pinned CW structure | cells of dimension 1, 2, 3; a 4-cell | π₀, π₁, π₂(S³) = 0; `skeletonLT 4` = univ, so no 4-cell | Pass, new |
| Consumers `:2898–2904` | each named interface against the consumer's text | BFG `:30–31`, `:172–173`, `:272`, `:463`; FM `:53–55`, `:585`, `:627`, `:704`, `:803`, `:2029` | Pass, new |
| Scope `:42–52`, `:1168`, `:2898` | the dropped-names list | gate dropped=0; 0 hits for the dropped roadmap and its declaration | Pass, new |
| 8.4 `:2216–2219`: M°=M∖∂M, inclusion ≃ (GT 1.1) | ∅; ℝ³; ℍ³; [0,1] | ∅°=∅; ℝ³°=ℝ³ (`interior_eq_univ`); ℍ³°≅ℝ³, both contractible; (0,1)↪[0,1] | Pass, ~14 |
| 8.4 transport back along \|K\|→M°→M | ℍ³; S¹×D² | P≅g*(h*i*P), trivial; S¹×D²: two Spin structures, each underlying Spin(3) bundle trivial | Pass, ~14 |
| Check `:2246` | ℍ³; S¹×D²; S¹×[0,1)×ℝ; D³ | ℍ³ non-compact so no finite K; π₁=ℤ both sides; D³ compact, open ball not | Pass, ~14 |
| Supplier row `:262`, GT 1.1 hypotheses | model and separation axioms | GT `:537`: Hausdorff, second countable, `𝓡∂ n`; headline: `T2Space`, `SecondCountableTopology`, half-space model | Pass, ~14 |
| Benedetti–Lisca locator (8.4) | Theorem 1, p.1; §2.1, pp.2–3 | cached text line 15; lines 74–98 | Pass, ~14 |
| From Tau Ceti `:222–227`, pinned generator normalisation | ℝ, x=0; x=5; −o; chart z↦−z | δ(g)=[−1]−[1]=−δ(seg); [4]−[6]; b₀=−1; chart-independent | Pass, ~13 |
| 2.2 `:517–532`, u₁=−1 and Check `:611` | m=1; [0,1] | AT/pinned = −1; (−1)(−[seg])=[seg]; endpoint signs (−1,+1) | Pass, ~13 |
| `orientedThreeManifold_parallelization` | ∅; ℝ³; ℍ³; negated e₁ | vacuous; det 1; det 1; det −1 excluded | Pass, ~13 |
| `exists_contMDiff_homotopicRel` | M=∅; C=U=∅; C=M; P=pt | empty g; Whitney approximation; g=f; g=f | Pass, ~13 |
| `:107–108` outward-first = pinned `boundaryOrientation` | half-space ℝ² | (−e₀,v) positive iff v=−e₁ | Pass, ~13 |
| From Tau Ceti `neg`, `pullback`, `prod`, interval endpoints | `interval 0 1`; t↦1−t; [0,1]² | (−1,+1)↦(+1,−1); −interval; swap det −1 | Pass, ~13 |
| 2.2 cylinder Check, DG 5.5b facet and corner signs | I×[0,1]; Q² facets; corner | −(I×∂); (−1)^(i+1) = −1, +1 | Pass, ~13 |
| `orientable_closedBall` | n=1, 2, 0 | [−1,1] and D² orientable; `NeZero 0` fails | Pass, ~13 |
| 2.1 Sard / parametric / relative transversality | M=∅; pt→ℝ²; t² on [0,∞) | image ∅; null point; stratum critical at 0 | Pass, ~13 |
| 2.4 / 2.5 interval gluing, relative interval | [0,1]∪[1,2]; ([0,1],{0,1}) | +1−1 at 1; (−1,+1)∈ℤ² | Pass, ~13 |
| 2.7 quartic / E(1) | degree 4; F=3H−ΣEᵢ | χ=24, σ=−16, Â=2; F²=0, χ=12, σ=−8 | Pass, ~13 |
| Gap finite-quadratic-arf | V=0, H, A, H⊕A, A⊕A | Gauss sums 1, 2, −2, −4, 4 | Pass, ~13 |
| 3.1–3.4 | O points; interchange; pt, ∅ | 1+1=0; (−1)^(1·1)=−1; 1, 0 | Pass, ~13 |
| 4.1–4.4 operations | a∈H¹(RP∞); RP²; p=3 | Sq²a²=a⁴; w(RP²)=1+a+a²; P¹y=y³ | Pass, ~13 |
| 5.1–5.7 | framed point; ranks (0,1,1), (2,2,5); AHSS on pt | ±1; normal ranks 2, 5; E²=Ω_q, `hatcherSS line 1010` | Pass, ~13 |
| 6.2–6.6 | id S¹; RP²; H_ℝ(2,4); σ₄ | 0 vs 1; w₁²=w₂=1; binom(6,2)=15≡1; ∂₂σ₄=σ₂ | Pass, ~13 |
| 7.1–7.2, 8.1, 8.5 | +pt; K3; Lie torus; n=1,2 | 1; σ/16=−1; Arf 1; S¹=∂D² | Pass, ~13 |
| 9.1–9.4 | (1,0,0); flip C₈; OP²; HP² | trace 1; −I₁₆; (381·39−19·36)/14175=1; (49−4)/45=1 | Pass, ~13 |
| 10.1–10.4 | C₃; HP² Gysin; KS numbers | ker(3)=0; π!u₄²=1; gcd 28 | Pass, ~13 |

Every mathematical row passes. R01 and R02 are description findings, not mathematical errors.

## Not verifiable

- **Lee, *Introduction to Smooth Manifolds*, Theorem 9.26** (Springer, paywalled): the source of GeometricTopology 1.1's interior homotopy equivalence. Relied on GeometricTopology's statement and the standard collar argument.
- **Munkres, *Elementary Differential Topology*, Theorems 10.5–10.6, and Whitehead 1940** (paywalled): the sources of GeometricTopology 11.3 and of 2.3's relative refinement. Cited by locator alone; unchanged since ~13.
- **AlgebraicTopology 8.13 and DifferentialGeometry 5.5b** exist only at open heads (#1663, #886): R01 and R02.

## Source issues

- none
