# Review of K3Surfaces (pull request #1285 at e565cd5)
**Verdict:** needs changes

This is a full review of head `e565cd5d83502bfc6693e9291eb04d19c9e7092c`; the folder changed by 177 lines since `d6bce64`, the head the previous review read. Both repairs asked of the folder are done: §1.1 no longer owns the general Picard segment, and the gluing headline is stated on the native glued lattice. One P3 finding is carried: the Part II head still owns and re-proves the unirationality reduction at p=2, and the pull-request description is unchanged. There is no new finding in the folder.

## R01 (P3) — The Part II still re-proves (U) at p=2, and the description still states no order and names ten targets

Carried from the previous review's R03 (and its predecessor's R02), at the same severity.

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:1165–1170`: "at p=2 it uses §0.2's unirationality reduction (U) … This roadmap owns (U) for every prime p, so the p=2 case is a citation of §0.2, not a second proof." The pull-request description (data): "its ten prospective proof targets remain admitted".

**Claim:**
- This folder owns (U) for every prime (`Suggested.lean:66–72` has `hp : p.Prime`; Scope `README.md:30–34`). That matches the merge order: K3Surfaces is line 135, K3SurfacesAndSymplecticBoundedness line 315.
- The Part II's head is unchanged since the previous review and still owns the p=2 case and proves it again, so the Downstream paragraph describes a consumer that does not exist at the consumer's head.
- The description has no merge-order paragraph about the Part II, and `Suggested.lean` states four theorems, not ten.
- It stays P3 rather than P2: this roadmap is the earlier owner and its README states the right ownership; the second owner sits in the other pull request, so the only change on this side is to the description.

**Witness:** K3SurfacesAndSymplecticBoundedness at `012a76e`, `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md`:
- `:75`: "K0.A's vector-field unirationality reduction is a step of its p>2 theorem; §2.1a extends that reduction to p=2";
- `:408`: "At p=2, outside K0.A's binder, prove the vector-field unirationality reduction by the argument of K3Surfaces K0.A step 1";
- `:416`: "*Needs:* … K3Surfaces K0.A (its vanishing theorem at p>2, its step-1 reduction argument run at p=2, and sub-target (i))".

**Exact repair:** nothing changes in the folder. The description's merge-order paragraph should state that K3SurfacesAndSymplecticBoundedness rebases after this pull request and replaces its p=2 proof (`:75`, `:408`, `:412`, `:416`) by a citation of "K3Surfaces §0.2 (U)", `unirational_of_nontrivial_vectorField`; and "ten prospective proof targets" should become the four theorems `algebraicK3_differential_vanishing`, `unirational_of_nontrivial_vectorField`, `finrank_lineBundleClass_eq_twentyTwo_of_unirational` and `gluing_isometry_extension_iff`. The repair is verified when the Part II's §2.1a no longer contains a proof of the reduction.

## Previous findings

- **R01 (P2), §1.1 owned the exact Picard segment on every complex manifold, which ComplexKahlerGeometry's open revision also owns: repaired.**
  - `README.md:413–423` now reads "Pic_an(M) the group of isomorphism classes of holomorphic line bundles … ComplexComparisonPartII C1.9's analytic Picard group … Neither the group, that comparison nor the exact segment on an arbitrary complex manifold is constructed here."
  - `README.md:425–427`: "Let X be a compact complex surface with H¹(X,O_X)=0. Prove that c₁:Pic_an(X)→H²(X,ℤ) is an injective group homomorphism whose image is the kernel of the map H²(X,ℤ)→H²(X,O_X)". Scope `:18–24` says the general segment "is not owned here".
  - The ℙ¹, point/empty-manifold, two-copies and logarithm-cocycle Checks are gone; the new Checks are ℙ², an Enriques surface, a Picard-rank-one K3 and E×E (`:442–460`), the last the negative control for H¹(O)=0.
  - Ownership now splits: ComplexKahlerGeometry at `258d35d` (#1234), `TauCetiRoadmap/ComplexKahlerGeometry/README.md:801` states the general segment and `:815` "H¹(M,𝒪)=H²(M,𝒪)=0 makes c₁ … an isomorphism"; §1.1 assumes only H¹(O)=0 and allows H²(O)≠0 (the K3 case), so no statement has two owners. ComplexComparisonPartII at `fcf31bc`, `README.md:5291–5295`, lists "K3Surfaces §1.1" as the consumer of exactly this segment "read on line-bundle classes", and its C1.9 defines `analyticPicardGroup T` for an analytic space T (in its C1.9 section, "define analyticPicardGroup T: the isomorphism classes … of invertible analytic modules"). The remaining disagreement, whether K4.P or C5.4 supplies the segment to the other, is between #1234 and #848 and is not a defect of this folder.
- **R02 (P3), the gluing headline re-encoded Tau Ceti's glued lattice: repaired.**
  - `Suggested.lean:6` imports `TauCeti.LinearAlgebra.IntegralLattice.Overlattice.Graph`; the two former lattice imports are gone.
  - `Suggested.lean:96–105`: `∃! F : (S.glueAlongDiscriminant T hS hT γ).Isometry (S.glueAlongDiscriminant T hS hT γ), ∀ v w, F (v, w) = (g v, h w)`; the `L`, `hform` and `hcarrier` binders are gone.
  - `README.md:165–168` and `:870–878` say the criterion is stated "on the native glued lattice L=`TauCeti.IntegralLattice.glueAlongDiscriminant`".
- **R03 (P3), the Part II re-proves (U) at p=2 and the description states no order: not repaired.** The Part II head and the description are unchanged. Carried as R01.

## Verified sound

**Gate, folder, pins and dependency check**
- Outside the folder, `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/K3Surfaces'` prints nothing. The folder holds `README.md` (1226 lines), `Suggested.lean` (108 lines) and `metadata.toml` (one `topic` line).
- Gate rerun with `--base origin/main`: every scanner prints 0, it ends "OK", exit 0. The worker's gate on this head also reports `build=0`.
- `lake-manifest.json` pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, the pins of `origin/main` at `f7dd719a`.
- Dependency check (`--movable`):

```text
depcheck: 238 roadmaps, 2320 edges, 0 problem(s)
```

- No UPWARD, CYCLE or `moved:` line. Merge-order lines: JacobianChallenge 1, IndexTheory 10, SmoothBundlesConnections 12, AlgebraicModuliForArithmeticGeometry 34, ComplexComparisonPartII 39, EtaleCohomologyFoundations 42, NeronModels 66–67, FourManifolds 134, K3Surfaces 135; the consumers K3SurfacesAndSymplecticBoundedness and EnriquesSurfacesAndIntegralNonexistence are at 315 and 323. PCurvature is a new roadmap folder in an open pull request and is named in the description. No forbidden supplier is cited.
- A scan of both files for process words, round labels, pull-request numbers, LaTeX delimiters and `lemma` finds nothing; the only hits are "Lemma 1", "Lemma 37.44.2" and "Lemma 3.11" as source locators, and "positive-current".
- The README backticks exactly five names of its own (`IsAlgebraicK3` and the four theorems); all five are declared in `Suggested.lean`.

**Elaboration, signatures and padding (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`)**
- `lake env lean` on `Suggested.lean` gives exactly four `declaration uses sorry` warnings, at `:56`, `:67`, `:77` and `:96`, in 11 s.
- A scratch copy with `#check @` for all five declarations elaborated once. Each type matches its README statement: `IsAlgebraicK3` keeps `[Field k] [IsAlgClosed k] [X.Over (Spec ↧k)]`; the vanishing theorem keeps `[CharP k p]` and `2 < p`; (U) keeps `Nat.Prime p` and `[CharP k p]`; (i) has no characteristic binder, as the README says; the gluing theorem keeps both `IsNondegenerate` instances, `hS`, `hT` and the `FiniteQuadraticModule.Isometry` γ into `.neg`, and quantifies over `F : (S.glueAlongDiscriminant T hS hT γ).Isometry _`. No binder is lost; the worker's signature file agrees.
- **One-tactic probe:** in the same copy each `sorry` became `first | simp | rfl | infer_instance | trivial | (constructor <;> infer_instance) | exact ⟨fun _ _ => Subsingleton.elim _ _⟩ | (constructor <;> intro h <;> simp_all) | sorry`. All four theorems still report `declaration uses sorry`; every listed tactic is reported unused. None is padding.
- **Headlines:** stated are K0.A's vanishing, (U), ρ=22 for unirational K3 surfaces and the gluing criterion. The docstring (`Suggested.lean:17–32`) names as not statable: Kählerness, the Hodge diamond, the §1.1 embedding of line-bundle classes (needing the group of holomorphic line-bundle classes and their integral Chern class), Ricci-flat metrics, simple connectivity, the cup lattice, the deformation theorems, local and global Torelli, twistor lines, period surjectivity, monodromy, the cone and polarized images, free involutions, fixed loci and period loci. At the pins the only Tau Ceti file mentioning holomorphic line bundles is `TauCeti/Geometry/Manifold/VectorBundle/FrameTrivialization.lean`, whose declarations are smooth frame trivializations (`:247`); there is no holomorphic line-bundle class group, so the §1.1 statement is indeed not statable.

**Library declarations opened at the pins**
- Mathlib `Mathlib/CategoryTheory/Sites/SheafCohomology/ExactSequences.lean:60` (`H.δ : H S.X₃ n₀ →+ H S.X₁ n₁` under `h : n₀ + 1 = n₁`), `:69–73` (`longSequence`, the six-term `mk₅`), `:80` (`longSequence_exact`); `Basic.lean` defines `Sheaf.H`. The README's description at `:94–99` matches, including the index hypothesis.
- Mathlib `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:405–408`: `@[stacks 02UP]`, `[IsProper f] (y) (hx : (f ⁻¹' {y}).Finite) : ∃ V, y ∈ V ∧ IsFinite (f ∣_ V)`, as `README.md:88–93` says; stacks-02UP lines 6305–6307 state the same lemma.
- Mathlib `Mathlib/AlgebraicGeometry/Birational/RationalMap.lean:57` (`PartialMap.IsOver`), `:142` (dominance of partial maps); both predicates are used by the two unirationality statements, which elaborate.
- Tau Ceti `IntegralLattice/Basic.lean:63–73`: the carrier is finitely generated and spans the ambient rational space (`isLattice`), so the README's uniqueness argument "S⊕T spans S_ℚ×T_ℚ" (`:904`) is sound. `Isometry/Basic.lean:77–80`: an isometry is an ambient form-preserving linear equivalence carrying the carrier onto the carrier.
- Tau Ceti `IntegralLattice/Overlattice/Graph.lean:49–50` (`discriminantGraph` as the comap of the graph of γ), `:94–98` (`glueAlongDiscriminant` as `ofIsotropicSubgroup` of that graph), `:102` (`_form`), `:112` (even), `:116` (unimodular), `:337–343` (`exists_eq_glueAlongDiscriminant` with hypotheses form, containment, even, unimodular, left, right). The docstring's "even unimodular overlattice of S ⊕ T" and `README.md:158–163` match.
- The remaining library names cited by the README (`discriminantOrthogonalHom`, `discriminantKernel`, `ker_discriminantOrthogonalHom`, `scale`, `dualCarrier_smul`, `reflectionOrthogonal`, `subgroup_eq_top_of_reflection_mem`, `relativeDifferentialsHomEquiv`, `LineBundleClass`, `exteriorPower`, `Cohomology`) were opened at these same pins by the previous review and the pins have not moved; `Suggested.lean` uses six of them and elaborates.

**Cross-roadmap citations resolved (every id, this round)**
- **Main at `f7dd719a`:** since `e9fd8e4`, the main the previous review read, the only changes to supplier folders are two progress reports (ModularCurves, Completed/HopfRinow); no supplier README changed. Re-resolved: SchemeAndStackFoundations 0.3 (`:551`), 1.17 (`:2624`), 1.23 (`:3021`), 2.2 (`:3309`), 2.3 (`:3330`), 2.6 (`:3437`), 2.11 (`:3656`), 2.20 (`:4275`), 3.4 (`:4789`), 4.9 (`:5448`), 4.11 (`:5528`), 4.13 (`:5643`), 5.9 (`:7129`), 5.10 (`:7175`), and no Enriques ruledness theorem anywhere in it (the gap stands); EtaleCohomologyFoundations 0.9 (`:1120`), F.0.4 (`:248`), F.2.5 (`:613`), F.5 (`:1179`), F.6 (`:1200`), F.7 (`:1239`); GlobalQuadraticForms Layer 5 §5.5 (`:544`, `:665`); ModularCurves 2B with the norm functor as its item 1 (`:1243`, `:1249`); MorseNovikov N5–N7 = Layers 5–7 (`:176`, `:809`, `:946`, `:1269`); SmoothBundlesConnections B1.5 (`:498`); CharacteristicClasses C1 (`:212`) and C7 (`:1817`); JacobianChallenge Layers A–D (`:111`, `:135`, `:143`, `:218`), Layer B stating finite-dimensionality for proper X/k (`:137`); StableReduction Layers 4–6 (`:529`, `:552`, `:576`); AlgebraicCurves Layers 9, 10, 12 (`:1099`, `:1193`, `:1468`); GeometricTopology Layer 1 (`:177`); Completed/HopfRinow Layer 1 (`:264`); DifferentialGeometry Layers 0–3, 5, 8, 9 (`:268–862`) and 12.1 (`:915`); AlgebraicTopology Stages 1, 5, 6, 7 (`:289`, `:849`, `:946`, `:1573`); ComplexKahlerGeometry K1–K7, K6.0, K6.1 (`:96–1405`) and K5a/K5b (`:33–51`).
- **IntegralLattices on main:** labels 0A–0G and 1A–1F name native declarations (`:455`); 5F (`:1899`), 5G (`:1915`), 5J (`:1974`), 6A (`:2019`); `:122` hands Nikulin's surjectivity to `IntegralLatticesPartII`, which exists nowhere, so §7.1's one case stays here as a move, recorded.
- **Open heads:** ComplexComparisonPartII at `fcf31bc`: C1.9 (`### C1.9 Projective and proper coherent GAGA`) defines `analyticPicardGroup`; C5.4 (`### C5.4`) states the frame-torsor bijection, the exponential sequence `u ↦ exp(2πiu)`, `δ[L] = integralLineBundleChernClass L`, the frame convention and the `O(1)`/`O(−1)` normalisation, with K3Surfaces §1.1 as consumer. IndexTheory at `6d85f5d`: I6 (`:1239`), I7.1–I7.3 (`:1345`, `:1372`, `:1393`), I8 (`:1576`). PCurvature at `13eb63f`: §§0.1–0.3 (`:147`, `:176`, `:201`). NeronModelsAndSemistableAbelianVarieties at `4c22d44`: §5.3e Ogg's formula (`:3540`). NeronModelsAndSemistableAbelianVarietiesPartII at `9027cc3`: §6.1 with the Castelnuovo–Zariski criterion (`:9815`, `:9847`). AlgebraicModuliForArithmeticGeometry at `4f0ad34`: 1.1–1.3, 7.3, 7.8, 8.1–8.3 (`:306–9944`). FourManifolds at `46ee76a`: Layer 7 with the K3 example (`:2869`, `:2958`). EnriquesSurfaces at `e852f4d` consumes K0–K6, K7.A–B and §7.3 (`:11`, `:42`, `:127`, `:219`, `:642–687`), as the Downstream paragraph says.

**Overlaps and ownership**
- The overlap tool's leads that only #617/#1411/#1797 define IntegralLattices §§0G, 1B, 1E, 5J, 6A are false: all resolve on main, above.
- No open pull request changes this roadmap or drops an id it cites.
- ComplexKahlerGeometry's two open revisions: #1398 at `1038b16` has no K4.P or Pic_hol; #1234 at `258d35d` has K4.P, with the boundary against §1.1 recorded under Previous findings.
- EnriquesSurfaces U0 (`:644–646`) constructs the geometric cover, its primitive pullback and "its discriminant gluing with the anti-invariant lattice" for the cover of an Enriques surface; U2 (`:658`) cites "K3Surfaces K7.A gives extension of a pair (g,h) … exactly when γḡ=h̄γ". The abstract model, the extension criterion and the discriminant surjectivity stay here; the geometric adapter stays there. One owner each.
- K3SurfacesAndSymplecticBoundedness §1.1 (`:267–298`) defines `IsK3 k f` over an arbitrary field with the same five conditions and an extension-of-scalars law, and consumes K0 through its §1.3 adapter. Over an algebraically closed field this coincides with `IsAlgebraicK3`; whether the later roadmap should specialise this roadmap's predicate instead is a question for its own review, not a defect here.
- `roadmaps grep` for characteristic-two generation by orthogonal transvections and for a surjectivity O(S)→O(q_S) finds no other owner; §7.1 owns them.
- No other `Suggested.lean` declares a `TauCetiRoadmap.K3Surfaces.*` name.

**Sources: the seeded sample of 13 targets and the new locators.** Every locator was opened in the cached text. Printed pages equal PDF pages except Rudakov–Šafarevič 1976 (printed = PDF + 1204) and Shen (printed = PDF + 246).

| Target | Locators opened (source id line) and result |
| --- | --- |
| 0.1 | huybrechts-k3: Def 1.1 and Rem 1.2 p.7 (135–137, 147–148: smooth complete surfaces are projective); Ex 1.1.3(iv) p.9 (226–228); Prop 1.2.4 p.12 (335–338: Pic=NS=Num, even, signature (1,ρ−1)); Rem 1.2.5 p.12 (349–352, torsion-free); Noether §1.2.4 p.13 (373–375, c₂=24). All match. |
| 0.2 | martin-infinitesimal-automorphisms: Thm D p.3 (126–133, five alternatives); Cor 1.1 p.4 (140); proof p.40 (1713–1718, quoting RS83 p.1502 for the pencil with two singular fibres); Ex 5.12 pp.36–37 (1544–1551). rudakov-shafarevich-inseparable: Lemma 1 and Corollary p.1206 (75–84); Thm 5 p.1216 (440–441); Cor 1 p.1217 (481–486); the ρ=22 step (489–492). huybrechts-k3: Prop 9.4.6 p.180 (6797–6798, every p>0; canonical-bundle formula 6817–6818); Prop 17.2.7 pp.367–368 (14076–14090, any characteristic); Prop 11.1.3 p.208 (7879–7887, cited only for its Hasse–Minkowski step; its char≠2,3 hypothesis concerns the elliptic conclusion, which the README handles in (iv)); Rem 8.2.13 p.151 (5646–5655); Prop 2.3.10 p.32 (1103–1105). liedtke-surfaces: Thm 4.2 p.20 (718–721); §4.3 p.20 (726–730); Thm 4.4 p.21 (755–758, h¹=½b₁=g(C)); Thm 4.6 p.21 (770–774); Thm 6.1 p.25 (934). gounelas-liedtke-symmetric-differentials: Prop 2.2(2) p.6 (253–258, every p>0). stacks-02UP: Lemma 37.44.2 (6305–6307). All match. |
| 1.1 | huybrechts-k3: §1.3.2 p.15, exponential sequence (452–456) and (3.1) `0→Pic(X)→H²(X,ℤ)→H²(X,O)` (462–465), with H¹(X,O)=0 the hypothesis used (457); Prop 1.3.2 p.14 (420–421); Ex 1.3.3 pp.14–15 (432–436); (3.2) and footnote 9 p.16 (496–501, 515–517); §7.3.2 p.131 (4900). dolgachev-enriques-introduction (new): §3 p.6 (231–236, q=p_g=0 and b₁=0, c₂=12); §3 pp.7–8 (272–285, K_S numerically trivial, 2K_S=0, Tors Pic of order 2 outside q=p_g=1, étale double cover is K3). All match. |
| 2.1 | huybrechts-k3: Thm 7.3.6 p.131 (4903–4908); Thm 9.4.11 p.183 (6904–6906); Prop 1.3.5 and Rem 1.3.6 p.17 (525–541, Wu, signature −16). All match. |
| 3.1 | huybrechts-k3: Cor 6.2.7 p.107 (3955–3958); §6.2.4 p.108 (3980–3984). Match. |
| 4.1 | huybrechts-k3: §6.1.1 p.99 (3649–3652); Prop 6.1.5 and Rem 6.1.6 p.101 (3705–3722: connected for n₊>2, two components for n₊=2); Prop 6.2.8 p.107 (3960–3963); §6.2.5 p.108 (4001–4004); Rem 7.3.8 and Prop 7.3.9 p.133 (4954–4987). All match. |
| 5.1 | huybrechts-k3: Prop 7.3.7 p.132 (4940–4941). Match. |
| 5.2 | huybrechts-hyperkahler-torelli: Prop 3.10 p.10 (375–376); Lem 3.11 p.11 (417–420). huybrechts-k3: generic twistor line p.130 (4826–4829); Prop 7.3.4 and Lem 7.3.5 p.131 (4884–4889). All match. |
| 6.1 | huybrechts-k3: Prop 7.2.2 p.129 (4780–4781); Cor 7.5.1 p.135 (5049–5050); Thm 7.5.3 p.135 (5066–5069); §7.5.3 p.136 (5082–5085); §7.5.5 p.138 (5167–5169, O⁺=Mon). huybrechts-hyperkahler-torelli: Prop 4.7 p.14 (527–529). All match. |
| 6.2 | huybrechts-k3: Thm 8.5.2 p.163 (6152–6155); Rem 6.3.7 p.114 (4232–4236); §6.4 p.115 (4258). All match. |
| 7.1 | huybrechts-k3: §14.0.3(vii) p.284 (10894–10897). gritsenko-hulek-enriques-moduli: p.3 (109–114: D_M≅D_N≅𝔽₂¹⁰, the order, surjectivity by Nikulin 3.6.3); p.4 (122–126, extension by Nikulin 1.5.2). char2-orthogonal-involutions: nonsingular means s=0 (107); generation by orthogonal transvections except H⊥H over 𝔽₂ (186–188). All match. |
| 7.2 | shen-fried-survey: Assumption 2.1 (442–452), Def 2.2 (455–460), (2.8) (464–468), pp.256–257. artebani-sarti-taki: Thm 3.1 p.10 (497–503). huybrechts-k3: §15.4.3(ii) p.330 (12702–12705). All match. |
| 7.3 | gritsenko-hulek-enriques-moduli: Thm 2.1 and Rem 2.2 p.5 (181–188); (8) and Namikawa Prop 6.2 p.8 (283–286). dolgachev-enriques-introduction: §5 p.15 (607–612, a (−2)-curve splits into two disjoint curves on the cover). All match. |

**Adversarial table**

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| `IsAlgebraicK3` (§0.1) | Fermat quartic in char 3; abelian surface; ℙ²; empty scheme; square-zero thickening | Quartic: ∂ᵢ=4xᵢ³=xᵢ³, common zero only 0; ω=O(4−4)=O; h¹(O)=0: passes. Abelian: ω=O, h¹(O)=2: fails. ℙ²: ∧²Ω=O(−3): fails. Empty: not integral: fails. Thickening: not smooth: fails. | Sound |
| §0.1 numerics and contraction | K3 against torus; σ=dx∧dy; 2σ in char 2 and 3 | χ(O)=1−0+1=2, c₂=12·2−0=24; torus 0 and 0. ι_∂x σ=dy, ι_∂y σ=−dx. 2·(1/2)=1 in char 3; 2σ=0 in char 2. | Sound |
| `algebraicK3_differential_vanishing` | binder; p=2; probe | `[CharP k p]` with 2<p is an odd prime. p=2 excluded although true there (gounelas-liedtke line 258). Probe leaves `sorry`. | Sound |
| Restricted structure (§0.2) | x∂ₓ; t²∂ₜ on ℙ¹; D=t∂ₜ+c·u∂ᵤ; ∂ₓ² over ℚ; zero ring | (x∂)ᵖxⁿ=nᵖxⁿ≡nxⁿ against xᵖ∂. (t²∂)ᵖtⁿ=n(n+1)⋯(n+p−1)tⁿ⁺ᵖ≡0. (cᵖD−cD^[p])/(cᵖ−c)=t∂ₜ. ∂ₓ²(x·x)=2 against the Leibniz value 0. Zero ring has characteristic 1. | Sound |
| p-closedness of the saturation (§0.2 step 1) | D of additive or multiplicative type; fD | (fD)ᵖ=fᵖDᵖ+((fD)ᵖ⁻¹f)D∈O·D with Dᵖ∈{0,D}; ξ↦ξᵖ mod L is p-linear into the torsion-free T_X/L and vanishes on the dense open where L=O·D, hence everywhere. | Sound |
| (U) `unirational_of_nontrivial_vectorField` | p=2; `Nontrivial`; abelian surface; probe | `hp : p.Prime` admits 2; huybrechts-k3 line 6798 and RS76 line 440 cover every p. Abelian surface: nowhere-zero field, c₂=0, no contradiction, and b₁=4≠0 so not unirational: the K3 hypothesis is needed. Probe leaves `sorry`. | Sound |
| Case (b) of step 1 | exceptional configuration; minimality; Euler count | K·E_j<0 with E_j²<0 forces K·E_j=E_j²=−1, excluded by minimality, so K·E_j≥0 and all b_i≤0; anti-effective ~ effective forces b_i=0; K·E_i=0, E_i²<0 gives E_i²=−2; (E_i+E_j)²=−4+2E_i·E_j<0 gives E_i·E_j≤1, an m-cycle has square 0. e(Ỹ)=24+Σn_r against 12χ(O_Ỹ)≤24 forces Σn_r=0; then 0→O→T_X→O→0 gives c₂=0≠24. | Sound |
| (i) `finrank_lineBundleClass_eq_twentyTwo_of_unirational` | Fermat quartic char 3; char 0; ℙ², ℙ¹×ℙ¹; junk value | ρ=22 (huybrechts-k3 line 14090); 24=1−0+b₂−0+1 gives b₂=22. Char 0: σ pulls back to a nonzero 2-form on a blow-up of ℙ², which has none: vacuous. Controls: ranks 1 and 2 equal b₂. `finrank` is 0 off finite free and "=22" excludes it. | Sound |
| Step 3 numerics | Martin Ex 5.12 at k=1, 2 | 3^{2k}+3 = 12, 84; 3^{2k−1}+9 = 12, 36; 24 would need 3^m=21 or 15. Rational two-fibre case c₂=12. | Sound |
| §1.1 statement | general complex manifold with H¹(O)=0; E×E; ℙ²; Enriques | Exactness at H¹(Oˣ) and H²(ℤ) gives ker c₁ = im H¹(O)=0 and im c₁ = ker(H²(ℤ)→H²(O)); the route uses neither compactness nor dimension 2, so these hypotheses are unused. E×E: H¹(O)=ℂ², pr₁*L of the 2-torsion class of Pic⁰(E) is nontrivial (restricts to L on E×{0}) with c₁=pr₁*c₁(L)=0; ker c₁=Pic⁰ of dimension 2. ℙ²: c₁(O(1))·[ℓ]=+1, c₁(O(−1))·[ℓ]=−1, sum 0. Enriques: H²(S,ℤ)=ℤ¹⁰⊕ℤ/2, c₁(K_S) the 2-torsion class, real image 0. | Sound; the two unused hypotheses are a note, not a finding: they mark the ownership boundary against ComplexKahlerGeometry K4.P's general segment, and the one non-surface use (§3.1 total spaces) cites C5.4 directly |
| §1.1 positive cone | diag(1,−1), κ=(1,0); L⊗L | (κ,κ)=1, (−κ,κ)=−1, (1,1)²=0. c₁ becomes 2h with square 8d. | Sound |
| §2.1 | Λ; V↦2V; σ=ω_J+iω_K | det=(−1)³·1²=−1, rank 6+16=22, τ=(0−48)/3=−16=3−19. c=½. σ²=2−2=0, (σ,σ̄)=4. (aI+bJ+cK)²=−1 on the unit sphere, 0 at the origin. | Sound |
| §3.1 | ε²=0; h²=4 and 2; 2h | Tangent dimension 20; 20−1=19 for both degrees; (2h)²=8. | Sound |
| §4.1 | B=±I₂, z=(1,i); c=3+4i; ranks 0 and 1 | B(z,z)=1+i²=0, B(z,z̄)=±2. \|c\|²=25 gives 50. Rank 0: no nonzero z; rank 1 with form (1): z²=0 forces z=0. Conjugation has determinant −1 on the plane. | Sound |
| §§5.1–5.2 | κ²=2; orthonormal a,b,c; (I+J)/√2 | Squares 2 and 8; (−κ,κ)=−2. z=a+ib: z²=1−1=0, B(z,z̄)=2. ((I+J)/√2)²=(−1−1+0)/2=−1. | Sound |
| §§6.1–6.2 | ±φ; root reflection; Riemann–Roch at δ | Orientations differ by (−1)³. s_δ(δ)=−δ. (x,δ)=1, x²=2: 2+2−2=2; the minus-sign formula gives −2. χ(O(δ))=2−1=1. | Sound |
| §7.1 model | ranks, signatures, discriminants, pairings | S: rank 10, (1,9); T=U⊕S: 12, (2,10). \|A_S\|=\|A_T\|=2¹⁰, \|A_Λ\|=2²⁰/(2¹⁰)²=1. (e,e)·(f,−f)=1−1=0; (e,e)·(f,f)=2; diagonal E₈ root square −4. | Sound |
| `gluing_isometry_extension_iff` | both directions; ⟨4⟩⊕⟨−4⟩; ⟨2⟩⊕⟨−2⟩; ⟨2⟩⊕⟨2⟩; rank 0; probe | If γḡ=h̄γ, g×h preserves Γ_γ hence its preimage, the glued carrier (Graph.lean:49, 94), and preserves the form; uniqueness since F=g×h on all of V×W. Conversely F preserves the carrier so (ḡ,h̄) preserves Γ_γ, i.e. h̄γa=γḡa. Script on ⟨4⟩⊕⟨−4⟩, carrier {a≡b mod 4}: (g,h)=(1,1),(−1,−1) extension true, commutation true; (−1,1),(1,−1) both false. ⟨2⟩⊕⟨−2⟩: ((e+f)/2)²=0, det −4/4=−1. ⟨2⟩⊕⟨2⟩: ¼+¼=½≠0, no anti-isometry. Rank 0: both sides true. Probe leaves `sorry`. | Sound |
| §7.1 discriminant form of S=M(2) | S*=½M; q_S | dual of M(2) is ½M* = ½M; q_S(x/2)=2B(x/2,x/2)/2=B(x,x)/4 = Q(x̄)/2 with Q=B(x,x)/2 mod 2; roots have Q=−1≡1. Reflection x↦x+(x,r)r reduces to x̄↦x̄+b(x̄,r̄)r̄. | Sound |
| §7.1 classes with Q=1 | E₈ enumerated by script | 240 roots give 120 classes; 2160 norm-4 vectors give 135 classes, disjoint; 1+120+135=256. U/2U: Q(ē)=Q(f̄)=0, Q(ē+f̄)=1. 1·136+3·120=496=2⁹−2⁴. Representatives: (e−f)²=−2, (e+f+y)²=2−4=−2, y²=−2, (e+y)²=−2. | Sound |
| §7.1 order, generation, controls | \|O⁺(10,2)\|; H⊥H and three planes over 𝔽₂; ⟨12⟩; U(2); symplectic transvection | 2·2²⁰·31·3·15·63·255=46998591897600=2²¹·3⁵·5²·7·17·31 (gritsenko-hulek line 112). Script: on H⊥H over 𝔽₂ the 6 transvections generate 36 of 72. Three planes: 2⁵−2²=28, \|O⁺(6,2)\|=2·2⁶·3·15·7=40320. ⟨12⟩: 1,5,7,11 square to 1 mod 24, O(⟨12⟩)={±1}. U(2): O(q)={id, ē↔f̄}, reached by s_{e−f}: e↦e+(e,e−f)(e−f)=f. x̄↦x̄+b(x̄,ē)ē sends f̄ (Q=0) to ē+f̄ (Q=1). | Sound |
| §7.1 O⁺(T) step | −id_U⊕id_S | Trivial on A_T=A_S since A_U=0; on the positive two-plane ⟨u₊,s₊⟩ the determinant is −1, exchanging the components. | Sound |
| §7.2 fixed locus | id and equator reflection of S²; antipodal map; double sextic; AST (1,1), (10,8), (10,10), (11,11) | 2=χ(S²); 1−1=0=χ(S¹); antipodal 0, empty. Branch genus 10, χ=−18=2+(1−21). Script: (1,1) g=10,k=0, χ=−18=L; (10,8) χ=0=L; (10,10) formula g=1 gives χ=0=L but the locus is empty; (11,11) χ=2=L. | Sound |
| §7.2 isometry class of S | (10,10,0) against ⟨2⟩⊕⟨−2⟩⁹ | a=r gives 2S*=S, so B/2 is integral with dual 2S*=S: unimodular; δ=0 gives B(y,y)/2∈2ℤ: even; signature (1,9): U⊕E₈(−1) by §6A. Control: q(e/2)=¼ gives δ=1 and the odd ⟨1⟩⊕⟨−1⟩⁹. | Sound |
| §7.3 loci and marking group | e−f; e′−f′; e−2f; C−jC; restriction to O⁺(T) | Squares and divisibilities: −2 and 1; −4 and 2 (all pairings in U(2) even); −4 and 1. (C−jC)²=−2−2−0=−4, (C+jC)²=−4. For h∈O⁺(T), ḡ=γ⁻¹h̄γ∈O(q_S) lifts by §7.1. | Sound |
| Downstream consumers | K3SurfacesAndSymplecticBoundedness at `012a76e`; EnriquesSurfaces at `e852f4d` | Part II `:75`, `:408`, `:416` prove (U) at p=2 again, against `README.md:1165–1170`. Enriques `:11`, `:42`, `:127`, `:642–687` consume K0–K6, K7.A–B and §7.3 as `README.md:1162–1164` says. | R01 (Part II); sound (Enriques) |

**Gap.** `gap:enriques-ruledness` (`README.md:191–200`) is precise (every smooth projective surface over an algebraically closed field, all plurigenera zero, birationally ruled with h¹(O)=g(C)=b₁/2) and minimal: no roadmap on main, no open head and neither pinned library states Enriques' theorem; the Part II consumes the same contract (`:416`). The board package has no `design/plan.json`, so the registration slug could not be confirmed.

## Not verifiable

- **Rudakov–Shafarevich 1983, p.1502** (the pencil step of sub-target (iv)): uncertified in the manifest; Martin's proof quotes it (martin-infinitesimal-automorphisms line 1714).
- **Nikulin 1983, Theorem 4.2.2:** uncertified; the fixed-locus statement is certified through artebani-sarti-taki lines 497–503.
- **Grove, Theorem 14.16:** behind the Hunnell–Hutchens–Schwartz sentence (char2-orthogonal-involutions line 188); not cached and not cited by the README.
- **Gap registration:** no readable `design/plan.json` on the board for this package.

## Source issues

- **Misprint** in char2-orthogonal-involutions at §3, p.6: the source writes that V is not "of the from" H⊥H; it should read "of the form"; affects nothing.
- **Misprint** in gritsenko-hulek-enriques-moduli at §2, p.4: the source writes "signture" for the signature (2,10) of N; it should read "signature"; affects nothing.
