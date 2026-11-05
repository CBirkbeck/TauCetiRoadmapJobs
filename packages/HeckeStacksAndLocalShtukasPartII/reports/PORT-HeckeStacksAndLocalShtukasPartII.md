# Port report: HeckeStacksAndLocalShtukasPartII

Branch `roadmap/hecke-stacks-and-local-shtukas-part-ii`, created from `3b51055` (main), head commit
`5349e106` ("HeckeStacksAndLocalShtukasPartII: roadmap (README, Suggested.lean, metadata)"). The folder
`TauCetiRoadmap/HeckeStacksAndLocalShtukasPartII/` holds `README.md`, `Suggested.lean` and
`metadata.toml` (`topic = "math.AG"`, the one-line form of the folders on main).

## Build

```text
⚠ [8954/8954] Built TauCetiRoadmap.HeckeStacksAndLocalShtukasPartII.Suggested (9.9s)
warning: TauCetiRoadmap/HeckeStacksAndLocalShtukasPartII/Suggested.lean:122:8: declaration uses `sorry`
warning: TauCetiRoadmap/HeckeStacksAndLocalShtukasPartII/Suggested.lean:132:8: declaration uses `sorry`
Build completed successfully (8954 jobs).
```

Exit 0; 2 warnings, both `declaration uses sorry` (the two headline theorems). Pins from
`lake-manifest.json`: Mathlib `f6090c709`, Tau Ceti `358314d4a`, toolchain `v4.35.0-rc3`.

## Gate

```text
gate HeckeStacksAndLocalShtukasPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check (run as prescribed, with `--movable` and the board's `ORDER.txt`), exit 0:

```text
depcheck: 240 roadmaps, 2296 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The merge order lists this roadmap at position 197, directly after
RootSystemsPartII (196). `roadmaps resolve` on the ported README: no cross-roadmap citation and no Lean name
found nowhere (index of 456 open pull requests).

## Draft pull request body

Part II of HeckeStacksAndLocalShtukas builds the classical and perfect affine Deligne–Lusztig loci of a
connected reductive group over a nonarchimedean local field, in the affine flag variety and the affine
Grassmannian, and proves their dimension theory: He's reduction method and the comparison of dimension with
class-polynomial degree, Viehmann's lattice charts for superbasic general linear groups, Zhu's spherical
dimension formula ⟨ρ,μ−ν_b⟩−def_G(b)/2 in both characteristics through Levi retraction and unramified norms,
the virtual-dimension upper bound, generic Newton classes of Iwahori cells and cordial saturation after
Milićević–Viehmann, the double-flat factorization and its two geometric correspondences, the P-alcove Levi
obstruction and the basic seed of Görtz–He–Nie, and finally He's nonemptiness and dimension theorem for
shrunken alcoves with its basic and large-translation specialisations. It stays within the point loci and
their geometry; local-shtuka deformation spaces, component classifications and fixed-point formulas are
left to the base roadmap and its consumers. `Suggested.lean` states the one headline that is statable at the
pins, Viehmann's bound on the chart index set of an extended semi-module and its attainment by the cyclic
extended semi-module, and records in its docstring which geometric headlines lack carriers.

Supplier contracts: ReductiveGroupsPartII (unipotent linearization), RootSystemsPartII (Demazure product,
twisted Red-Min, straight–finite-parabolic reduction, finite Coxeter basic classes, parabolic root length,
dominant subtraction), BunGAndNewtonStrata (superbasic classification, Newton poset length, Newton-cell
strong purity and greatest class), GeometricSatakeAndFusion (Levi intersection dimension) and
SmoothRepresentationsOfLocalGroups (twisted affine cocenter).

## Roadmaps depended on that are still pull requests

BunGAndNewtonStrata, GeometricSatakeAndFusion, VStackSheavesAndLisseCategories, SmoothRepresentationsOfLocalGroups,
HeckeStacksAndLocalShtukas, RootSystemsPartII, and TraceFormula (a folder of the CohomologicalPointCounting
pull request by another author; it adds new roadmap folders and is not in the merge order). ReductiveGroupsPartII,
SchemeAndStackFoundations and RootSystems (at `TauCetiRoadmap/RepresentationTheory/RootSystems`) are on main.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already satisfies the acceptance-test rule: a module docstring naming
each geometric headline and the carrier it lacks, two real-bodied definitions (`residueBasis`,
`semiModuleJump`), the structure `ExtendedSemiModule` recording Viehmann's Definition 3.4 clause by clause,
the definitions `chartIndices` and `IsCyclic` needed to state the headline, and the two sorry'd theorems
`chartIndices_bound` and `exists_isCyclic_chartIndices_eq`. No API lemma, boundary case, Check mirror or
example is present; no sorry'd data; one `import Mathlib`; the `module` / `public import Mathlib` /
`@[expose] public section` header used on main (30 of 169 files). The file is byte-identical to the package's.

Signature check: a scratch file with `#check @name` for all 7 declarations elaborated with exit 0 (all
declarations visible through the exposed section). Each elaborated type matches its README statement:
`chartIndices_bound` carries `0 < m`, `0 < h`, `Nat.Coprime m h`, `Monotone μ`, `∑ i, μ i = m` explicitly
and concludes `E.chartIndices.Finite ∧ 2 * ncard ≤ ∑ (2i+1−h) μ_i − (h−1)`; the existence theorem carries
the same hypotheses and concludes `IsCyclic ∧ Finite ∧ equality`. No binder was lost (the structure fields
and both theorems name every hypothesis in their own signatures); nothing changed.

## Supplier replacements and label repairs

- **Gap tags.** The package's 13 `gap:slug` tags became contract names, as the SheafConvolutionOnAbelianVarieties
  port renders them: `unipotent-linearization` → the unipotent linearization contract; `demazure-product` →
  the Demazure product contract; `twisted-redmin` → the twisted Red-Min contract; `straight-finite-parabolic`
  → the straight–finite-parabolic contract; `finite-coxeter-basic-class` → the finite Coxeter basic-class
  contract; `parabolic-root-length` → the parabolic root-length contract; `dominant-subtraction` → the
  dominant subtraction contract; `superbasic-classification` → the superbasic classification contract;
  `newton-poset-length` → the Newton poset length contract; `newton-cell-strong-purity` → the Newton-cell
  strong purity contract; `newton-cell-greatest` → the Newton-cell greatest class contract;
  `levi-intersection-dimension` → the Levi intersection dimension contract; `twisted-affine-cocenter` → the
  twisted affine cocenter contract. The review's `conditional_gaps` list uses the same 13 slugs.
- **RootSystems.** The package cited "RootSystems Layers 3, 4 and 6" for Coxeter theory, chambers, longest
  elements and integral root data. On main (3b51055) the roadmap lives at
  `TauCetiRoadmap/RepresentationTheory/RootSystems` and has Layers 1–3 only (geometric roots and faithful
  representations; the marked Weyl presentation; classification and concrete Weyl groups); its own supplier
  contract lists the chamber, fundamental-domain, longest-element and integral root-datum declarations as
  native Tau Ceti. The port cites Layers 1–2 and adds those declarations to "From Tau Ceti", each checked at
  the pin: `TauCeti.dominantChamber`, `TauCeti.openDominantChamber` (`Chamber.lean:135,138`),
  `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` (`FundamentalDomain.lean`), `TauCeti.longestElement`
  (`LongestElement.lean:196`), `TauCeti.DynkinType.simplyConnectedRootDatum`
  (`SimplyConnectedRootDatum/Assembly.lean:79`). The supplier heading is now
  `### From TauCetiRoadmap.RepresentationTheory.RootSystems and TauCetiRoadmap.RootSystemsPartII`, the form
  RootSystemsPartII itself uses. (RootSystemsPartII at its head still cites RootSystems Layers 4–6; that is
  its own stale citation, outside this port.)
- **BunGAndNewtonStrata (#1241 head).** The head no longer carries the slug anchors the package used
  (`galois-average`, `newton-and-kottwitz-maps`, …); the section numbers are unchanged. Every citation now
  names the section and its title: §1.7 Galois averaging and Hodge invariants; §1.8 Newton and Kottwitz
  invariants; §1.10 Straight Weyl comparison with B(G); §1.11 Kottwitz classification by both invariants;
  §1.13 Algebraic σ-centralizer; §1.14 Change of σ-centralizer representative; §1.15 Defect of a σ-class;
  §1.27 Ordinary straight translation and Levi centrality; §1.30 Products and unramified restriction of
  scalars; §1.43 Bounded lifting through a z-extension; §1.45 Newton comparison for a Levi representative;
  §0.6 and §0.8 as before.
- **GeometricSatakeAndFusion (#1235 head).** Likewise: `perfect-model-and-etale-comparison` → GS0 §0.28,
  Perfect models and étale realization; `equal-characteristic-schubert-models` → §0.29; `parahoric-ind-projectivity`
  → §0.32, Integral parahoric ind-properness; `flag-incidence-correspondences` → §0.38, Relative-position flag
  correspondences; `flag-convolution-fibres` → §0.39, Affine flag convolution fibre bounds (its text states the
  bounds (ℓu+ℓv−ℓuv)/2 and ℓu+ℓv−ℓ(u*v) the README quotes); `semi-infinite-affineness` → GS1 §1.4, Affine
  semi-infinite intersections (split group, dimension ⟨ρ,μ+λ⟩ when nonempty, as the README assumes);
  `convolution-diagram` → GS2 §2.4, Ambient Hecke convolution; `rational-special-fibre-convolution` → GS2 §2.6,
  Rational Witt convolution and semismallness (fibre bound ≤⟨ρ,Σμ_i−λ⟩ over the λ-stratum, as quoted).
- **Other suppliers, resolved at main or the head and unchanged:** ReductiveGroupsPartII (main) RG2.0.4 and
  all 19 cited `*(slug)*` anchors in RG2.1, RG2.3, RG2.4 (apartment at 1853, `kottwitz-homomorphism` at 2707,
  `dominant-coinvariant-cocharacters` at 5995, `iwahori-bruhat-decomposition` at 5731, …);
  SchemeAndStackFoundations (main) §§0.7 (`fibre_dimension_formula` at 786), 0.9, 0.23–0.26, Layer 1;
  VStackSheavesAndLisseCategories (#1230) VS4.0 "Newton geometry" paragraph (defines the partial order by equal
  Kottwitz invariant and Newton dominance); SmoothRepresentationsOfLocalGroups (#1688) SR.1.5 with
  `iwahori-matsumoto` and `bernstein-presentation` (its basis is T_w=[IwI]; the README now says "written U_w
  here"); TraceFormula (#196) Layer 11 Grothendieck–Lefschetz and `EllAdicRealization`; HeckeStacksAndLocalShtukas
  (#1252) Layers HS0–HS4; RootSystemsPartII (#1731) §1.1 Integral root dominance.
- **Pinned Lean declarations, each reopened at the pin:** Mathlib `DoubleCoset.doubleCoset` (:37),
  `mem_doubleCoset` (:44), `doubleCoset_eq_of_mem` (:51) in `GroupTheory/DoubleCoset.lean`;
  `QuotientGroup.leftRel` (:66), `leftRel_apply` (:71); `Finset` (:75); `Set.ncard` (:613); `finsum` (:99);
  `WithBot` (:22). Tau Ceti `DoubleCoset.mul_mem_doubleCoset_iff` (`DoubleCoset/Basic.lean:100`, hypothesis
  b ∈ H); `CoxeterSystem.parabolic` (:101), `IsMinimalCosetRep` (:233), `length_mul_of_isMinimalCosetRep` (:280),
  `existsUnique_isMinimalCosetRep_mul` (:330); `TauCeti.inversions` (`Inversions/Basic.lean:50`),
  `isLeast_ncard_inversions` (:148), `ncard_inversions_mul_le` (:172), standing hypotheses finite ι,
  characteristic-zero domain, crystallographic, reduced. Nothing restated a pinned declaration.
- **Wording.** "supplier gaps" → "supplier contracts"; the Red-Min input is glossed as He and Nie's reduction
  to minimal-length elements; the "How to read the build" sentence on `Suggested.lean` is now a timeless
  statement. No "line N" locators, LaTeX, process words or pull-request numbers were present.

## Duplication sweep

By object, over main and the 453–456 indexed open heads: "affine Deligne" (only reference-list entries in
BunGAndNewtonStrata, GeometricSatakeAndFusion, HeckeStacksAndLocalShtukas, DiamondsAndVStacks(PartII),
VectorBundlesAndIsocrystals, PadicHodgeTheory, GeometricSatakeAndFusionPartII, and ReductiveGroupsPartII's use
of He 2021 for conventions and the normal form), "cordial" (reference entries only), "semi-module",
"superbasic", "alcove element" (no match), "Demazure product" (GeometricSatakeAndFusion §0.38/§0.39 consume it
from RG2.4; SchubertGeometry S2 on main owns the finite-flag Bott–Samelson image, a different object from the
affine extended Demazure product of the RootSystemsPartII contract), "virtual dimension", "class polynomial"
(unrelated senses: deformation theory, CM class polynomials), "Iwahori double coset" (ReductiveGroupsPartII
RG2.4, cited). No target was removed; no roadmap owns the ADLV constructions. No open roadmap cites
HeckeStacksAndLocalShtukasPartII, so there is no reversed consumer.

Ownership against open pull requests was checked only through the indexed heads reachable by `roadmaps grep`
and `roadmaps show` and the sibling checkouts the brief lists; pull requests outside that index were not
inspected.

## Adversarial mathematics pass

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Lean `chartIndices_bound` vs vie06 Thm 5.3 | d(b,μ) from Prop. 5.2's proof, Σ_{i=0}^{h−1}Σ_{j≤i}(m/h−μ_j)−(h−1)/2 | = Σ_j(h−j)(m/h−μ_j)−(h−1)/2 = Σ_{j=1}^{h}(2j−h−1)/2·μ_j−(h−1)/2 using Σμ=m; with i=j−1: (Σ_i(2i+1−h)μ_i−(h−1))/2 | matches the Lean right-hand side halved | none |
| Lean `Monotone μ` vs vie06 "dominant" | vie06 §2: μ dominant iff μ₁≤…≤μ_h | increasing convention; Lean `Monotone` on `Fin h` | agrees | none |
| `ExtendedSemiModule` fields vs Definition 3.4 | clauses (1)–(4c) | (1) `φ_eq_bot_iff`; (2) `φ_add_h`, with ⊥+1=⊥ off A; (3) `φ_le_jump` on A and `φ_eq_jump` on tails; (4) injective `seq` with range A, `φ_seq_succ`, `seq_succ_eq`, `seq_succ_gt`, `initial_perm` | one field per clause, none extra | none |
| `semiModuleJump` junk | A bounded below, a∈A: set contains n=0 and is bounded; a∉A never used (field only on A) | sSup over a bounded nonempty ℕ-set is its max | honest on the structure's domain | none |
| `residueBasis` finiteness (finsum honesty) | A bounded below, h+A⊂A | each residue class meets A in a tail, so B has ≤1 element per class, ≤h elements | finsum is a genuine sum | none |
| h=1 | μ=(m), A=ℕ, B={0}, ΣB=0=h(h−1)/2 | φ(a)=a+m increasing, V=∅; bound (1−1)m−0=0 | 0≤0, equality | none |
| (h,m,μ)=(2,1,(0,1)) | A=ℕ, B={0,1} | φ=⌊(a+1)/2⌋, V=∅; bound (−1)·0+1·1−1=0 | 0=0 | none |
| (h,m,μ)=(3,4,(0,0,4)) cyclic | B={−3,1,5}, A={−3,0,1,3,4,…} | φ(5)=4, φ(6)=3, φ(7)=2, φ(10)=3; V={(5,6),(5,7),(5,10)}; bound 2·4−2=6=2·3 | equality | none |
| (h,m)=(4,5), type (0,2,0,3) vs (0,0,2,3) | B={−2,0,3,5}; B′={−4,1,3,6} | V={(3,4),(5,6),(5,8)}, 2|V|=6<8; V′={(3,4),(3,5),(3,6),(3,9)}, 8=8 | equality only for the cyclic module of the dominant type | none |
| Conventions Check, A₁ s t^(nα∨) | base alcove (−1,0), t acts by −λ | t^(nα∨): (−2n−1,−2n); s: (2n,2n+1); hyperplanes α=0..2n separate: ℓ=2n+1; η=s; d=(2n+2)/2 | n+1 | none |
| §0.2 GL₂ virtual dimension | w=b=t^(1,0); w=s t^(1,0), slope-1/2 b | (1+0−0)/2−1/2=0; alcove (−2,−1)→(1,2), ℓ=2, η=s, def 1: (2+1−1)/2−0=1 | matches Checks | none |
| §1.2–1.4 affine A₁, w=s₀s₁s₀ | b=1; b=t^(α∨) | s₀ws₀=s₁ (closed, A¹), s₀w=s₁s₀ (open, G_m); dim=1+max(−∞,1)=2; T_w≡zT_{s₁s₀}+T_{s₁}; at [t^(α∨)]: (3+2+1)/2−2=1; advantage differences (3+1−1−1)/2=1, (3+1−2−0)/2=1 | recurrence, degree formula and ⇒ relations agree | none |
| §4.3 GL₂ fundamental representative | y=diag(ϖ,1), I lower-triangular mod ϖ (alcove (−1,0)) | φ_y(U_α(c))=U_α(ϖσc): I_N=U_α(ϖO)→U_α(ϖ²O); φ_y⁻¹(U_{−α}(c))=U_{−α}(σ⁻¹(ϖc)): I_N̄=U_{−α}(O)→U_{−α}(ϖO); quotient O/ϖ, dim 1=⟨2ρ,(1,0)⟩ | agrees | none |
| §4.6 GL₂ s t^(1,0) | ordinary and basic classes | d=(2+1−0)/2−1/2=1 and (2+1−1)/2=1; chain length (1+1−0)/2=1; c_basic=2−(1+0)=1 | agrees | none |
| §5.1 unitary A₂, λ=ρ∨, y=s₁ | σ swaps nodes | η_J∨=dom(−ω₂∨)=ω₁∨; ρ∨−_dom 2ω₁∨: ν=ω₁∨ gives α₁∨ (integral), ν=0 or ω₂∨ non-integral; λ−λ^♭♭=ω₂∨∉Q∨; lower-bound difference 3ω₁∨−ρ∨=α₁∨ | agrees | none |
| §8.2 unitary A₂ | w=s₁t^(ρ∨)s₁ | ℓt^(ρ∨)=⟨ρ∨,2ρ⟩=4, ℓw=1+4−1=4, η=s₂s₁, ℓη=2, def 0, ν=0: d=3 | agrees | none |
| §3.4 torus-Levi Check | GL₂, b=diag(1,t), μ=(1,0), μ_M=(0,1) | ⟨ρ,ν_M−ν_G⟩=−1, ⟨2ρ_N,ν_M⟩=−1, fibre 0−1+1=0 | agrees (recomputed as in the accepted review) | none |

## Unresolved

- TraceFormula is cited (Layer 11) from the CohomologicalPointCounting pull request by another author; it is not
  in the merge order. The dependency check reports no problem; the worker should confirm this dependency is
  acceptable when it sets the merge position.
- RootSystemsPartII (#1731) cites RootSystems Layers 4–6, which main no longer has; this port cites main's
  Layers 1–2 and the native declarations instead, and leaves RootSystemsPartII's text alone.
- The 13 supplier contracts remain obligations of the named suppliers (the accepted review's conditional
  gaps); none exists yet at any head.


Pull request: #1844 (roadmap/hecke-stacks-and-local-shtukas-part-ii at 5349e10)
