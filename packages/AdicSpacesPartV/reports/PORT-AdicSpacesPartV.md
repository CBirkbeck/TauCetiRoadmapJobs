# PORT-AdicSpacesPartV

## Result

- Branch: `roadmap/adic-spaces-part-v`, created from `b54415b` (main) with a clean tree.
- Head commit: `666eee7b6f20c7877f7263a3776b32dc8ab6b7ee` — "AdicSpacesPartV: roadmap (README, Suggested.lean, metadata)". It touches only `TauCetiRoadmap/AdicSpacesPartV/{README.md,Suggested.lean,metadata.toml}` (1224 insertions); nothing outside the folder.
- Build (`lake build TauCetiRoadmap.AdicSpacesPartV.Suggested`): `Build completed successfully (18380 jobs).` Warnings: 3, all `declaration uses 'sorry'` (lines 76, 97, 131). The `module` warning that the package's non-module header produced on the first build is gone.
- Gate: `gate AdicSpacesPartV: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable`): `depcheck: 223 roadmaps, 2030 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve TauCetiRoadmap/AdicSpacesPartV/README.md`: no cross-roadmap citation and no Lean name found nowhere. The tool could not check Mathlib and Tau Ceti names on this host, so I grepped every backticked library name in the README at the pinned Mathlib (`1b1ccf4b`) and Tau Ceti (`2fd255d9`); all exist (see "Supplier replacements").

## Draft pull request body

This roadmap is part V of the adic-spaces series. It continues AdicSpacesPartII, which stops at affinoid geometry, morphisms, analytification and the normal connected identity principle, with the Zariski geometry of rigid spaces over a complete rank-one nonarchimedean field. It builds coherent Zariski closed subsets and local dimension at all adic points, proves that proper images are Zariski closed and that affinoid localization is a regular ring map, and constructs the global finite normalization and irreducible components of a rigid space with the Riemann extension and connected-complement theorems over the original field. It then develops regular and smooth loci, smooth stratification and rank loci, finite-extension point classes and the topology of rational polydisc points, canonical-reduction specialization, Shilov and weakly Shilov points with their residue-transcendence characterization and avoidance of nowhere dense Zariski closed sets, rigid blow-ups and functorial rigid resolution in characteristic zero, and analytic manifolds of rational points with the analytic constant-rank theorem and the identity theorem across a subfield. The end theorems are Gauss-point closure of rational polydisc points over an infinite residue field, functorial resolution of rigid spaces in characteristic zero with connectedness of the resolution of an irreducible space, analytic manifolds of rational points, the analytic constant-rank normal form, and detection of analytic identities on a subfield, in coordinates and on G(C). These are the general geometric inputs to the bi-analytic Ax–Lindemann theorem of Howe–Klevdal, which AdmissiblePairsAndPadicHodgeStructures consumes. ClassicalAdicEtaleCohomologyPartII consumes them for its proper-hypercover arguments. `Suggested.lean` states the three headlines that can be stated on native carriers: Gauss-point closure on Tau Ceti's closed polydisc, the constant-rank normal form on Mathlib's analytic manifolds, and the coordinate form of the subfield identity theorem.

## Roadmaps this one depends on that are still pull requests

None as suppliers. Every `*Needs:*` input and every supplier contract is on main: RigidAnalyticGeometry, AdicSpacesPartII, AdicSpacesPartIII, AdicEtaleGeometry, SchemeAndStackFoundations, StableReduction, ResolutionOfSingularitiesCharacteristicZero, ReductiveGroups and ReductiveGroupsPartII, plus Mathlib and Tau Ceti.

Two open roadmaps are named only in "Scope and ownership", to say how a kept variant differs; neither is a statement or route input:

- DiamondsAndVStacks D6.9: affinoid relative analytic resolution over K ⊇ ℚ_p.
- AbelianSchemesAndArithmeticModuliPartII B2.10: real-analytic constant rank.

Both are earlier than this roadmap in the merge order (positions 19 and 154; this roadmap is at 221).

## What moved from the Lean to the README

Nothing moved; no mathematics was lost.

The package file already satisfied the acceptance-test rule: one predicate with a real body (`IsUnitGaussPoint`) and three headline theorems, with no padding, no sorry'd data and no `set_option`. I kept all four declarations.

Changes to `Suggested.lean`:

- **Header.** `module` / `public import Mathlib` / `public import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Polydisc.Basic` / `@[expose] public section`, following VonNeumannAlgebras and ProfiniteCohomology on main. The package's plain `import Mathlib` header produced a non-`sorry` warning ("imports `Mathlib` … designed for use with the module system").
- **`analytic_germ_eq_zero_of_subfield` generalised.** I dropped `[CompleteSpace E] [CharZero E] [CompleteSpace C] [CharZero C]`; the statement is true without them.
  - Restrict to lines t ↦ ty with y ∈ E^m: the one-variable C-valued series Σ P_n(y) tⁿ vanishes for small t ∈ E, so the leading-term argument gives P_n(y) = 0.
  - By homogeneity P_n vanishes on all of E^m. Taking coordinates in a finite E-basis of the span of its coefficients, and using that E is infinite (`MvPolynomial.funext`), every coefficient is 0.
  - The README §6.6 now states this generality and route. Completeness and characteristic zero stay where they are used: the group form on G(C), through the §6.4 atlas. I added a characteristic-p Check (zᵖ has zero derivative but vanishes on no E-neighbourhood).
- **Module docstring rewritten.** It claimed that the pins have no rigid space and no K-affinoid algebra, which is false: Tau Ceti has `TauCeti.AdicSpace`, `TauCeti.PreAdicSpace.LocallyOfFiniteType`, `TauCeti.PreAdicSpace.IsClosedImmersion` and `TauCeti.IsAffinoidAlgebra` with Krull dimension, Noether normalization and canonical reduction. It now lists the headlines that cannot be stated and the exact missing carrier for each:
  - Rigid resolution and connectedness of the resolution: no smooth or proper morphism of adic spaces, no coherent ideal sheaf, no blow-up.
  - Rational-point manifolds and submersions: no smooth morphism; the manifold structure is charted-space data.
  - The G(C) form of the subfield theorem: needs the §6.4 atlas data.
  - It also says why the supporting theorems of Layers 0–2 and 4 are README targets: no coherent ideal sheaf, proper morphism, normalization or specialization map, so stating them would be a long ad hoc encoding.

I checked statability against the new carriers. The end theorems on resolution and rational-point manifolds still need smooth and proper morphisms, which are absent, so no headline became statable and none was added.

**Signature check.** I appended `#check @…` for all four declarations to the file, ran the one allowed build, and then restored the file; the final build above is of the clean file. All binders are present in each elaborated type:

- `IsUnitGaussPoint`: `NontriviallyNormedField`, `IsUltrametricDist`, `NonarchimedeanRing`, `n`, `η`.
- `gaussPoint_mem_closure_rationalPoints`: adds `CompleteSpace K` and the `Infinite` residue-field instance.
- `analytic_constantRank`: `CompleteSpace F`, `CharZero F`, `k ≤ m`, `k ≤ n`, both `IsManifold … ⊤` instances (here `⊤` is ω, the top of `WithTop ℕ∞`), `ContMDiffAt … ⊤ f a`, and the eventual-rank hypothesis.
- `analytic_germ_eq_zero_of_subfield`: `NormedAlgebra E C`, `AnalyticAt C f 0`, `hzero`.

Each matches its README statement (§3.4, §6.1, §6.6). The only change from the package is the deliberate generalisation of the last theorem.

## Supplier replacements and duplication removals

Supplier replacements, each verified at the pin:

- **Regularity carriers are Tau Ceti's.** `TauCeti.Excellence.RegularAlgebraMap`, `GeometricallyRegular`, `regularLocus` and `IsGRing` under TauCeti/RingTheory/RegularLocalRing/. §§0.5 and 2.1 now cite them; the SchemeAndStackFoundations §0.21 contract is restated on these carriers, and its `regular_map_completion` is cited for A_m → Â_m.
- **gap:regular-local-flat-transfer narrowed.**
  - Descent along flat local maps is Tau Ceti's `TauCeti.IsRegularLocalRing.of_flat_of_isLocalHom` (Descent.lean; no noetherian hypothesis on the source).
  - The field-closed-fibre case is Tau Ceti's `TauCeti.isRegularLocalRing_iff_of_flat_of_map_maximalIdeal_eq` (Flat.lean).
  - The gap now asks only for ascent along a flat local map with a regular closed fibre. That is Stacks Tag 031E, Lemma 10.112.8; Tag 00OF, Lemma 10.110.9, is the descent half. I read both tags online to get the attribution right.
  - §2.1 (completion and affinoid-subdomain comparisons), §2.2 (étale maps) and §5.3 (analytification comparison) now use the Tau Ceti field-fibre theorem; only §2.1's smooth-pullback clause still needs the gap.
- **Evaluation topology on points is Tau Ceti's.** `TauCeti.PointTopology.topology` and `TauCeti.SchemePointTopology.topology`. §6.4's "evaluation topology on affine Zariski charts" now cites them, and states that the open-chart property for a complete normed field is part of §6.4's construction (Tau Ceti asserts no open embedding).
- **Rigid-space and affinoid carriers named.** The Conventions and From Tau Ceti now name `TauCeti.AdicSpace`, `TauCeti.PreAdicSpace.LocallyOfFiniteType` and `TauCeti.IsAffinoidAlgebra` as the carriers behind the RigidAnalyticGeometry and AdicSpacesPartII contracts.
- **Review note F01 applied.** The From Mathlib contract cites the `Units` instances `IsManifold 𝓘(𝕜, R) n Rˣ` and `LieGroup 𝓘(𝕜, R) n Rˣ` (Mathlib/Geometry/Manifold/Instances/UnitsOfNormedAlgebra.lean), with the matrix norms `Matrix.linftyOpNormedRing` and `Matrix.linftyOpNormedAlgebra` that make them apply to `GL_n(F)`. §6.4 gained an API bullet and a Check: the transition H ↦ I + H between Mathlib's chart and g ↦ g − I is affine, with derivative the identity.
- **Review note F02 applied.** The dead anchor `#layer-1-affinoid-algebras` is now `#layer-1-affinoid-algebras-and-their-topology`.
- **SchemeAndStackFoundations target name.** `IsNagata.integralClosure_finite` is an italic target name in SchemeAndStackFoundations §0.20, not a Lean declaration, so it is now written *IsNagata.integralClosure_finite* in both places.

Duplication sweep, by object, against main and the open roadmap pull requests (tool grep plus the given checkouts):

- **ReductiveGroupsPartII RG2.0 *smooth-group-analytic-charts* (main)** owns the analytic manifold structure on G(K) for smooth affine G over nondiscrete locally compact characteristic-zero K. AdelicAlgebraicGroups cites the same owner.
  - §6.4 is kept as a variant. It differs by allowing every complete nontrivially normed characteristic-zero field (ℂ_p is needed for the subfield theorem) and every smooth finite-type group, and by comparing charts across complete isometric extensions.
  - It gained an API bullet saying it is compatible with RG2.0's atlas on locally compact fields. A new "From TauCetiRoadmap.ReductiveGroupsPartII" contract cites RG2.0.2, used only for that comparison.
- **Constant rank.** LieGroupoidsPoisson G0.1 (main) owns the real smooth theorem, and AbelianSchemesAndArithmeticModuliPartII B2.10 (open) owns the finite-Cᵏ and real-analytic extensions. §6.1 is kept as the analytic theorem over every complete characteristic-zero field; for F = ℝ it is B2.10's real-analytic case, recorded in Scope.
- **DiamondsAndVStacks D6.9 (open, earlier)** proves the relative analytic comparison for the affinoid resolution over K ⊇ ℚ_p. Layer 5 is kept as the global, functorial version over every characteristic-zero K (including ℂ((t))); Scope says its affinoid step agrees with D6.9 over K ⊇ ℚ_p.
- **AdicSpacesPartII R1.9 (main)** supplies irreducibility of connected normal spaces. §1.4's bullet now says it agrees with R1.9.
- **Downstream consumers rewritten.** The package said DiamondsAndVStacks D6.4–D6.9, ReductiveGroupsPartII RG2.0.2 and AbelianSchemesAndArithmeticModuliPartII B2.10 "can consume" this roadmap. All three are earlier in the merge order or on main, so those claims pointed the wrong way and are deleted; the ownership facts went to Scope. The section now lists only the later consumers, AdmissiblePairsAndPadicHodgeStructures and ClassicalAdicEtaleCohomologyPartII, with the layers each cites.
- **No duplicates found for this roadmap's other objects:** Zariski closed subsets of rigid spaces, local dimension, rigid normalization and global components, Riemann extension, Shilov and weakly Shilov points, rigid blow-ups and resolution, rational-point manifolds, and subfield coefficient recovery. I checked AdicSpacesPartII–IV, AdicEtaleGeometry, RigidAnalyticGeometry, PerfectoidSpaces, SchemeAndStackFoundations, ResolutionOfSingularitiesCharacteristicZero and ReductiveGroupsPartII on main, and the open pull requests via `roadmaps grep`.
  - TropicalAndBerkovichArithmetic uses Shilov points of Berkovich curves for tropicalization, a consumer-level use.
  - AdicSpacesPartIV owns smooth dagger spaces, a different object.
- **Ownership against open work** was checked against the open roadmap pull requests through the `roadmaps` tool and the brief's checkouts (#820, #792, #1405, #1511, #1549, #1807, #1808, #1854).

## Fixes from the reviewer read and the adversarial pass

- **Title and introduction.** The title "…, part II" contradicted the folder name; it is now "Foundations of adic spaces, part V — rigid-analytic Zariski geometry, classical points and resolution", matching Parts II–IV. Scope now opens by saying where AdicSpacesPartII stops and that this part continues from there.
- **Citable labels.** Layers carry the labels RZ.0–RZ.6, and every subsection starts with its italic target name (*local-dimension*, *weakly-shilov-avoid-nowhere-dense*, …), as Parts II–IV do. The names are those of the package's design. AdmissiblePairsAndPadicHodgeStructures and ClassicalAdicEtaleCohomologyPartII already cite this roadmap as "AdicSpacesPartV RZ.k / name"; their citations now resolve. "How to read the build" explains the convention. §6.4 has the new name *algebraic-point-atlas*.
- **§6.1 vague promise made precise.** The From Mathlib contract claimed "Layer 6 proves the rank criteria relating these predicates to derivatives", but no target stated them. §6.1 now states the consequences: rank n gives `Manifold.IsSubmersionAt` (complement `F^(m−n)`), and rank m gives `Manifold.IsImmersionAt`. Both hold because the normal-form charts are analytic with analytic inverses, hence in the maximal atlases.
- **§5.1 Check.** "`Bl_0(X)` = ∅ for X nonempty and reduced" is now "for every X": Proj of O_X ⊕ 0 ⊕ ⋯ is empty.
- **§2.4.** The redundant "the same assertion holds over a perfect K" became the precise statement that perfectness enters only through §2.2.
- **§6.6 title.** "across a closed subfield" became "across a subfield", matching the generalised coordinate statement.
- **Gate fix.** One TeX-like formula (`Σ_{|α|=n}`) became prose.
- **Timeless wording.** "at the pin" phrasing was removed from the README.

## Adversarial mathematics pass

Instances computed on both sides; "η" is the unit Gauss point, p a prime with |p| = p⁻¹.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Convention: Gauss normalization | π + T on the disc, 0 < \|π\| < 1 | η(π+T) = max(\|π\|,1) = 1; at T = 0: \|π\| | holds | none |
| Convention: tangent of T ↦ T² | a = 0; char 2 | df_a = 2a; 0 at a = 0; identically 0 in char 2 | holds | none |
| Convention: constant-rank normal form | m = n = 2, k = 1; Lean formula | ψ(f x)_0 = φ(x)_0, ψ(f x)_1 = 0, i.e. (x,y) ↦ (x,0) | holds | none |
| Convention / §5.1: blow-up of O_X and of 0 | X arbitrary, including nonreduced | Proj O_X[t] = X; Proj(O_X ⊕ 0 ⊕ ⋯) = ∅ | holds for every X | §5.1 Check widened |
| §0.1 Zariski closed subsets | disc V(T); V(T(T−1)); K⟨T⟩/(T²); subdisc closure | V(T) = {0}, η(T) = 1 ≠ 0; T − (T−1) = 1 so A/I ≅ K×K, two points; T nilpotent so V(T) = X; Zariski closed ⊇ open ⇒ whole disc | holds; subdisc is a non-example | none |
| §0.2 local dimension | Spa(K×K⟨T⟩); cusp; ∅; Spa(K,K⁺) with rank-2 K⁺ | 0 at isolated point, 1 on disc, global 1; cusp: 1 vs tangent dim 2; ∅: ⊥; dim Spa(K,K⁺) = 2 − 1 = 1 vs ringKrullDim K = 0 (outside hypothesis) | holds | none |
| §0.3 nowhere density (a)–(e) | XY = 0 with Z = V(Y); K×K point; ∅; Z = X | at (a,0), a ≠ 0: dim O_Z = 1 = dim O_X, and Z ⊇ X − V(X) open, so (a) and (d) both fail; K×K point open; ∅: all vacuous; Z = X ≠ ∅: all fail | conditions agree in each instance | none |
| §0.4 proper image | ∅ → X; id; T ↦ T²; Spa K(t^(1/p)) → disc over 𝔽_p((t)); P¹ over ℂ_p | images ∅, X, D (K⟨T⟩ = K⟨T²⟩ ⊕ T·K⟨T²⟩), V(Tᵖ − t) with residue degree p; sup of pT on {\|T\| ≤ 1} is \|p\| < 1; H⁰ = ℂ_p | holds; route uses gap:adic-proper-kiehl-proper | none |
| §0.5 regularity of localization | K⟨T⟩ → K⟨T,T⁻¹⟩; K⟨T⟩ → K; K → K(a^(1/p)) | flat with regular fibres; T kills K but is a nonzerodivisor in K⟨T⟩, so not flat; geometric fibre K(a^(1/p))[ε]/(εᵖ) is nonreduced | holds; flatness ≠ regularity witnessed | now cites `RegularAlgebraMap`, `regular_map_completion` |
| Gap regular-local-flat-transfer (narrowed) | K[t]_(t) → K[[t]]; K → K[ε]/(ε²) | closed fibre K, both regular of dim 1; closed fibre K[ε]/(ε²): dim 0, embedding dim 1, not regular | ascent applies only with regular fibre | narrowed to ascent; descent and field fibre cited from Tau Ceti; Stacks 031E / 00OF verified online |
| Gap regular-map-composition-descent | B = K[x,y]/(y²−x³), C = B[1/x] | C = K[t,t⁻¹] with x = t², y = t³; K → C smooth, B → C flat but misses the origin; K → B not regular at origin | faithful flatness necessary | none |
| Gap complete-local formal smoothness | K → K[[T]]; K → K[ε]/(ε²) | (t + ct²)² = t² ≠ 0 in K[t]/(t³), so no lift | criterion discriminates | none |
| §1.1 normalization | cusp; XY; K⟨T⟩/(T²); ∅; inclusion of origin into XY | K⟨t⟩, Y/X ↦ t³/t² = t; two discs, two points over origin; A_red = K; ∅; origin's preimage is the whole point, two lifts | holds; universal-property hypothesis necessary | §1.1 target name italicised |
| §1.2 Conrad characterization | one axis into XY; X ⊔ Spa K → X | other axis not nowhere dense; π⁻¹(Z) contains an open point | both excluded | none |
| §1.3 connected components | K×K; ∅; XY idempotents; canonical topology on the disc | 2 components; ∅ preconnected, not connected; e restricted to each axis is 0 or 1, equal at the origin, so e ∈ {0,1}; {\|T\|<1} ⊔ {\|T\|=1} disconnects classical points only | holds | none |
| §1.4 components | XY; nodal cubic; annulus; ∅; two discs | 2 axes; x = t²−1, y = t(t²−1): y² = t²(t²−1)² = x²(x+1), node at t = ±1; annulus a domain; ∅ none; two discs not irreducible | holds; local branches ≠ global components | R1.9 agreement added |
| §1.5 irreducibility criterion | closed disc; open disc; XY; ∅ | finite sets of classical points (Weierstrass); open disc: zeros ζ−1 of log(1+T), infinite and discrete; axis proper, not nowhere dense; ∅ excluded by nonemptiness | holds | none |
| §1.6 full dimension | V(XY) in bidisc; two discs M ⊇ Y | dim 1 < 2; dim_y Y = dim_y M = 1 but Y ≠ M, only the component | holds; connectedness of M needed | none |
| §1.7 Riemann extension | 1/T on the punctured disc; cusp t = Y/X; ℚ₃(√2) | \|1/T\| at πⁿ = \|π\|⁻ⁿ is unbounded; t ∉ K⟨t²,t³⟩; 2 is not a square mod 3, so L⊗L ≅ L×L has 2 components | boundedness and normality necessary | none |
| §1.8 connected complement | punctured disc; XY minus origin; nodal cubic minus node | connected; disconnected (not irreducible, allowed); normalization minus {t = ±1} connected | holds | none |
| §2.1 singular locus | cusp; XY; polydisc; K⟨T⟩/(T²) | {0}; {0}; ∅; K[T]/(T²) has dim 0, embedding dim 1, so Sing = X | holds; reducedness needed for density | route uses Tau Ceti field-fibre theorem; gap only for smooth pullback |
| §2.2 smooth = regular (perfect K) | nodal cubic; k⟨T⟩[Y]/(Yᵖ − a), a ∉ kᵖ; Spa K(a^(1/p)) | smooth off node; regular, but d(Yᵖ − a) = 0 gives Ω rank 2 > 1; Ω has dim 1 | perfectness necessary | étale step cites Tau Ceti theorem |
| §2.3 tangent spaces | D^n at 0; z² at a; K⟨T⟩/(T²); cusp | Kⁿ; 2a; T_x = K with dim 0; dim T = 2 > 1 | holds | none |
| §2.4 stratification | plane ∪ line in tridisc; cusp; K[ε]/(ε²) | Y₁ = the point (embedding dim 3 > dim 2), Y₂ = ∅; punctured curve and cusp; Sing persists unless reduced | holds; d+1 bound: dim Y_i ≤ d − i | wording fixed |
| §2.5 rank loci | z² (char ≠ 2); constant map; id of Dⁿ; r = 0; r > ranks | V_≥1 = D − {0}; r_max = 0; r_max = n; empty minor = 1, locus V; all minors 0, locus ∅ | holds | none |
| §3.1–3.2 point classes | Spa K; Galois L/K of degree n; disc; G_m Grassmannian | 1 class; n representatives Spa(σ), one class (embeddings id, σ); classes ↔ Max K⟨T⟩; B_dR^×/B_dR^{+×} = ℤ (ξ-valuation locally constant) | holds | none |
| §3.3 polydisc points topology | ℤ_p ⊂ disc over ℚ_p; T = √p; n = 0 | aᵖ ≡ a mod p so \|aᵖ − a\| ≤ \|p\| < 1, and {\|Tᵖ−T\| ≥ 1} ∋ η misses ℤ_p; \|b² − p\| ≥ \|p\| > \|p\|² for b ∈ ℤ_p (p = 2, 3 included); single point | holds; ultrametric gives openness | none |
| §3.4 / Lean `gaussPoint_mem_closure_rationalPoints` | completed ℚ_p^ur; ℚ_p; q = 2; n = 0 | ζ ∈ μ_{p²−1}, ζ ≠ 1: \|ζ\| = \|ζ−1\| = 1; Gauss norm of Tᵖ − T is 1 but \|aᵖ − a\| < 1 on ℤ_p; \|a² − a\| < 1 on ℤ₂; n = 0: one point equal to η | infinite residue field necessary for n ≥ 1; Lean hypotheses match README | none |
| Lean `IsUnitGaussPoint` (definition determines its object) | η; classical point x₀; η_r with r < 1 | f = 1, g = π + T: Gauss norms 1 ≤ 1, but x₀(1) = 1 > \|π\| = x₀(π+T), so x₀ fails; f = 1, g = T: η_r(T) = r < 1, so η_r fails | only η satisfies it; vle relation fixes the Spv point | none |
| §4.1 specialization | K⟨T⟩; annulus XY = c; K; open residue disc | Ã = K̃[T], sp(η) = (0), sp(a) = (T − ā); Ã = K̃[X,Y]/(XY); one point; all of {\|T\| < 1} ↦ (T) | holds; sp not injective | none |
| §4.2 Shilov characterizations | disc; annulus; ℚ_p⟨T⟩; K[ε]/(ε²); zero algebra | fibre over (0) = {η}; fibres over (Y), (X) are (1,\|c\|), (\|c\|,1); sup of p + T² = max(\|p\|,1) = 1; \|ε\|² = 0 ⇒ \|ε\| = 0; α(1) = 1 ≠ 0 = α(0), so the spectrum is empty | holds | none |
| §4.3 Shilov points | polydisc; annulus; Spa L; zero algebra; classical point | 1, 2, 1, 0; classical point ↦ closed point | holds | none |
| §4.4–4.6 weakly Shilov | type 2, 3 points; isolated point of Spa(K⟨T⟩×K) | type 2: trdeg 1 = dim; type 3: 0 < 1; isolated: 0 = 0 | holds; local, not global, dimension | none |
| §4.5 Abhyankar bound | Gauss point of Dⁿ; irrational radius | trdeg K̃(T₁…Tₙ) = n ≤ n; 0 ≤ 1 | holds | none |
| §4.7 avoidance | disc | proper Zariski closed sets are classical points, trdeg 0 < 1; arbitrary unions still miss type 2 | holds | none |
| §5.2 marked sequences | y² = x^(2n+1) | x-chart y = xu gives u² = x^(2n−1): n steps, 0 for n = 0 | holds | none |
| §5.3–5.4 resolution | cusp; XY; K[ε]/(ε²); zero ideal | one blow-up; two discs, disconnected; T_red = Spa K → T surjective; Bl₀ = ∅ is no cover | holds | regularity transfer cites Tau Ceti |
| §6.1 / Lean `analytic_constantRank` | (x,x²); x² at 0; Tᵖ in char p; m = n = k = 0 | ψ(u,v) = (u, v − u²) gives (x,0); rank 0 at 0, 1 elsewhere; Tᵖ: πⁿ ↦ π^(np) ≠ 0, rank 0, not constant; m = 0 forces discrete charts, centring gives ψ(f a) = 0 | characteristic zero and neighbourhood rank necessary; binders intact | submersion/immersion consequences made explicit |
| §6.2 polydisc neighbourhoods | G_m at 1 over ℚ_p; dim 0 | \|T − 1\| ≤ \|p\| ⇒ \|T\| = 1; radius 1 contains T = 0 | holds | none |
| §6.3 rational-point manifold | disc over ℚ_p; ℚ_p(√p); ℂ_p | ℤ_p, dim 1; O_E′ has dim 1 over E′ and 2 over ℚ_p; ℂ_p is infinite-dimensional over ℚ_p | holds | none |
| §6.4 algebraic-point atlas | G_m with ℝ ⊂ ℂ; GL₂; μ₃; Mathlib `Units` | inverse in coordinates −w/(1+w), derivative −1; \|det g − 1\| < 1/4 + 2/64 = 9/32; μ₃(ℝ) = {1}, singleton chart; transition H ↦ I + H, derivative id | holds | topology from Tau Ceti; RG2.0 and Units comparisons added |
| §6.5 submersions | GL₂ → P¹ at ∞; D² → D | derivative of c/a at I is δc, surjective; (u,v) ↦ u | holds | none |
| §6.6 / Lean `analytic_germ_eq_zero_of_subfield` | m = 0; z(z−a) with a ∈ C − E; ℚ_p ⊂ ℂ_p; zᵖ over 𝔽_p((t)); ℝ ⊂ ℂ | f(0) = 0 on both sides; derivative at 0 is −a ≠ 0; n!·cₙ = 0 or line restriction gives cₙ = 0; zᵖ(t^k) = t^(kp) ≠ 0; K₀ near 1 ↦ real interval | holds with no completeness or characteristic hypothesis | generalised (see above) |

Generality: each README statement and its Lean signature agree. §3.4: complete, ultrametric, infinite residue field, every n. §6.1: complete, characteristic zero. §6.6: nontrivially normed, normed algebra.

P3 note, unchanged: `NonarchimedeanRing K` alongside `IsUltrametricDist K` in the §3.4 declarations is what Tau Ceti's carriers ask for. It is a Prop-valued class, so it creates no diamond.

## Overlap with open pull requests

- **#1807 and #1808 (RigidAnalyticGeometry revisions).** Both drop §7.4 and split "Layers 3–4" into Layers 3 and 4. Each carries an explicit mapping (§7.4 → AdicSpacesPartIII R3.6; §7.3 coherence → R3.2–R3.4, with §7.3 keeping the identity principle), so the citations stay valid with no dependency. The README already names AdicSpacesPartIII R3.1–R3.3 and R3.6 as the owner of the coherent and proper contracts.
- **#1854.** Keeps every RigidAnalyticGeometry heading cited.
- **ReductiveGroups Layer 3.** Present at all three heads.
- **SchemeAndStackFoundations §§0.3, 0.8, 0.20, 0.21, 4.11.** Present at all three heads.
- `roadmaps overlaps AdicSpacesPartV` answers "No roadmap AdicSpacesPartV on main or in an open roadmap pull request": the roadmap is not a pull request yet. The checks above were done by hand on the heads.

## Unresolved

- **Consumer requests not provided here.** ClassicalAdicEtaleCohomologyPartII (open, merge-order position 222) asks this roadmap for two contracts:
  - gap:finite-branched-covers (destination RZ.1): extension of finite étale covers across a nowhere dense Zariski closed set, after Han and Lütkebohmert.
  - gap:proper-generic-smoothness (destination RZ.2 and RZ.4): BH Theorem 2.29, whose route needs the analytic cotangent complex of BH §§2.2–2.5.

  Neither is in the accepted package, and its scope excludes generic smoothness for arbitrary maps. I did not add unreviewed targets in a port. Either a revision of this roadmap takes them, at the destinations named, or the consumer owns them.
- **Conditional supplier gaps stated in the README.**
  - The five listed in `review.json`: adic-proper-kiehl-proper, formal-affinoid-localization, generically-reduced-functorial-resolution, countable-resolution-invariants, represented-smooth-homogeneous-quotient.
  - Three SchemeAndStackFoundations contracts that are in `design/plan.json` but not in `review.json`'s list: regular-local-flat-transfer (now narrowed to ascent with regular closed fibre), regular-map-composition-descent, complete-local-formal-smoothness-regular.
- **Statability.** No headline became statable at the current pin, but rigid-space and affinoid carriers now exist in Tau Ceti. Once Tau Ceti adds smooth and proper morphisms of adic spaces or coherent ideal sheaves, the resolution and rational-point headlines should be revisited.
- **Suspicious text.** None found in the review, the reports, the other roadmaps or the fetched Stacks pages; none contained instructions.


Pull request: #2133 (roadmap/adic-spaces-part-v at 666eee7)
