# PORT-HigherHidaAndColemanTheory

- Branch: `roadmap/higher-hida-and-coleman-theory`, from main `e6f6358`.
- Head commit: `b82e0be4` "HigherHidaAndColemanTheory: roadmap (README, Suggested.lean, metadata)".
- Folder: `TauCetiRoadmap/HigherHidaAndColemanTheory/{README.md,Suggested.lean,metadata.toml}`. Nothing outside the folder is touched.

## Build

`lake build TauCetiRoadmap.HigherHidaAndColemanTheory.Suggested`:

    ✔ [18238/18239] Built TauCetiRoadmap.HigherHidaAndColemanTheory.Suggested (3.1s)
    Build completed successfully (18239 jobs).

**0 warnings.** The file has no declarations, so it has no `sorry`. The package file, built as copied, gave one toolchain warning: it imports `Mathlib` without a `module` header. A `module` line was added as the first line, as in 76 of the 196 roadmaps on main (for example `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/Suggested.lean`). The warning then disappeared. On the committed head the build replays with the same `Build completed successfully (18239 jobs).` line.

## Gate

    gate HigherHidaAndColemanTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

## Dependency direction

    depcheck: 245 roadmaps, 2232 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. In ORDER.txt this roadmap is at line 259. The latest suppliers in the order are AutomorphicBundlesPartII (258), LocallyAnalyticRepresentationsOfLocalGroups (257), OverconvergentAutomorphicForms (255) and AlgebraicModularFormsAndSerreWeightsPartII (253). The new Downstream-consumers paragraph names PadicFamiliesPartII (260), a later roadmap; the check reads it as a consumer and adds no edge.

## Draft pull request body

This adds the higher Hida and higher Coleman theory roadmap. It builds integral ordinary coherent cohomology of Siegel varieties in every degree and every genus, and finite-slope coherent cohomology of locally quasi-split abelian-type Shimura varieties with analytic weight families. The inputs are the integral toroidal Siegel models, automorphic bundles, solid coherent operations and cohomological correspondences, and the Hodge–Tate period geometry of the supplying roadmaps. The construction runs through dynamical compactifications and supported ordinary localization over Artinian coefficients, the integral Siegel degree strata, and universal Iwasawa complexes over the torus Iwasawa algebra. It ends in the theorems of Boxer–Pilloni and Pilloni: derived arithmetic Hida control and integral Iwasawa Serre duality for Siegel varieties of every genus, integral amplitude in genera one and two, and rational amplitude in every genus. On the Coleman side it gives regular and singular geometric classicality, the cohomological eigenvariety glued in all degrees with maximal-dimensional deformation of interior eigenpackets, sharp interior and Siegel slope bounds, and the two-term singular-weight Klingen control theorem for GSp₄. This is the general supported theory that PadicFamiliesPartII and the Siegel modularity-lifting roadmaps consume. The weight, chamber and slope normalizations are pinned by explicit GL₂, GSp₄ and split U(n,1) computations. None of the headline theorems is statable at the pinned Mathlib and Tau Ceti, which have no Shimura varieties, Igusa towers or supported coherent cohomology. So `Suggested.lean` states none of them and names, for each, the carrier it lacks.

## Suppliers still in pull requests

The roadmap names these suppliers that are not on main. Each is earlier in the merge order.

AdicCoefficientsAndComparisons, AlgebraicModularFormsAndSerreWeightsPartII, AutomorphicBundles, AutomorphicBundlesPartII, AutomorphicFormsOnReductiveGroups, CompletedCohomologyPartII, DeformationAndDerivedPatchingAlgebra, HodgeTateAndCanonicalSubgroups, IntegralHeckeAndGaloisDeterminants, LocallyAnalyticDistributions, LocallyAnalyticRepresentationsOfLocalGroups, OverconvergentAutomorphicForms, PELModuli, PadicFamilies, PerfectoidShimuraVarieties, PhiGammaModulesAndIwasawaCohomology, ShimuraCompactifications, ShimuraData, SolidAnalyticRings.

These suppliers are on main: AdicSpacesPartIII, AdicSpacesPartIV, PadicMeasuresIwasawaAlgebras, ResolutionOfSingularitiesCharacteristicZero, RigidAnalyticGeometry, SchemeAndStackFoundations and SmoothRepresentationsOfLocalGroups. LieHighestWeight is also on main, at `TauCetiRoadmap/RepresentationTheory/LieHighestWeight`, and is cited only in Scope and ownership. No citation uses an id that only an open revision defines; `roadmaps overlaps` found no other pull request that changes this roadmap and no dropped cited id. The citation resolver, run on the ported README, finds every cross-roadmap citation. I re-checked these section headings directly:

- SmoothRepresentationsOfLocalGroups SR.0.2, 1.2, 1.4, 2.2, 2.3, 3.1, 3.4, 4.1 and 4.5;
- SchemeAndStackFoundations 2.20;
- RigidAnalyticGeometry 1.1, 1.2 and 8.2;
- AdicSpacesPartIV F1.10;
- AdicSpacesPartIII R3.1, R3.4, R3.6 and R3.8;
- PadicMeasuresIwasawaAlgebras 1.1 and 1.7;
- ResolutionOfSingularitiesCharacteristicZero 6.3;
- PerfectoidShimuraVarieties 3.13, 4.5, 6.3–6.10, 6.12, 6.13, 6.13a, 6.14 and 6.15;
- AlgebraicModularFormsAndSerreWeightsPartII 7.1–7.4;
- HodgeTateAndCanonicalSubgroups 5.1;
- ShimuraCompactifications 0.14, 4.10, 6.16, 6.17, 7.19–7.21 and 7.29;
- AutomorphicBundles 9.1;
- AutomorphicBundlesPartII 1.6, 3.0a, 3.0b, 3.9, 3.13, 4.4, 5.1, 5.2 and 5.13.

## What moved from the Lean to the README

Nothing. The package `Suggested.lean` had no declarations: an empty namespace and a module docstring listing the ten headline theorems with the carrier each lacks. That is the correct form when nothing is statable, so the file is kept. The only Lean changes are these:

- The title is now "Higher Hida and Coleman theory: target signatures".
- The `module` header line was added.
- The closing docstring paragraph is made accurate about the pinned libraries. Tau Ceti does have the scheme cohomology groups `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` (`TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61`). The paragraph now says so, and says what neither library has: Siegel or other Shimura varieties, toroidal compactifications, Igusa towers, partially supported coherent cohomology as a complex over an Iwasawa algebra, and analytic localization of solid modules.

**Headline statability.** I re-checked each headline against the pins:

- §4.6 derived arithmetic Hida control;
- §4.8 integral Iwasawa Serre duality;
- §4.9 integral amplitude in genera one and two;
- §8.4 rational amplitude in every genus;
- §5.8 geometric classicality;
- §7.1 the cohomological eigenvariety;
- §7.5 interior equidimensionality and deformation;
- §7.6 sharp interior bounds;
- §8.5 sharp Siegel bounds;
- §9.8 two-term Klingen control.

Every one needs Siegel or abelian-type Shimura varieties with toroidal models, Igusa towers, supported coherent cohomology and analytic coefficient complexes. Searching Mathlib `1b1ccf4` and Tau Ceti `2fd255d` for Shimura, Siegel, Igusa, GSp, eigenvariety, weight space and Iwasawa carriers finds none. Tau Ceti's `AlgebraicGeometry/ModularCurve` is the Legendre ring, not a modular curve with its compactification. The isolated Klingen refinement (§9.5) and the Verma-module BGG resolution (§6.5(0)) are supporting theorems, not headlines, so they are not stated.

**`#check @name` binder audit.** The file declares nothing, so the scratch file of `#check @name` lines is empty. No elaborated type could be compared and nothing changed.

## Supplier replacements and duplication removals

No restatement of a supplier was found, so nothing was deleted from either file, and nothing was recorded as removed in Scope and ownership.

**Library declarations.** Every cited name was opened at the pins, and file and line match the README.

- Mathlib:
  - `Module.End` End.lean:33
  - `zpow_sub₀` Units/Basic.lean:402
  - `HasDerivedCategory` and `DerivedCategory` DerivedCategory/Basic.lean:74 and :87
  - `CondensedMod` and its abelian instance Condensed/Module.lean:41 and :43
  - `CondensedMod.IsSolid` Condensed/Solid.lean:83; the TODO at lines 74–81 restricts it to finite-type ℤ-algebras
  - `IsHeckeTriple`, `HeckeCoset` and `HeckeRing` HeckeRing/Defs.lean:75, :157, :189
  - `CategoryTheory.IsCofiltered` Filtered/Basic.lean:589
- Tau Ceti (all with the stated namespaces):
  - `HeckeCosetModule.instRingHeckeRing` Associativity.lean:484
  - `HeckeCosetModule.mul_comm_of_antiInvolution` Commutativity.lean:459
  - `TauCeti.Compactification` Basic.lean:58
  - `TauCeti.Compactification.commonRefinement` Refinement.lean:97
  - `TauCeti.Compactification.hom_unique` Uniqueness.lean:45
  - the `IsCofilteredOrEmpty` instance and the `[Nonempty]` `IsCofiltered` instance Cofiltered.lean:50, :54
  - `AlgebraicGeometry.Scheme.IdealSheafData.blowup` IdealSheaf.lean:120
  - `AlgebraicGeometry.Scheme.IdealSheafData.isProper_blowupToBase` IdealSheaf.lean:191
  - `AlgebraicGeometry.Scheme.IdealSheafData.isEffectiveCartier_comap_blowupToBase` ExceptionalDivisor.lean:184
  - `TauCeti.VermaModule` Verma.lean:195, with the hypotheses `[CharZero K] [IsKilling K L] [FiniteDimensional K L]`, Cartan subalgebra and triangularizability
  - `TauCeti.existsUnique_lieModuleHom_apply_vermaGenerator` Verma.lean:305

**Duplication sweep, by object.** It covered main and the open roadmap pull requests through `roadmaps grep` and `roadmaps show`, and read the closest roadmaps of the overlap index in full: PadicFamiliesPartII, AutomorphicBundlesPartII, OverconvergentAutomorphicForms, GSp4NonregularModularityLifting, PerfectoidShimuraVarieties, SmoothRepresentationsOfLocalGroups and LieHighestWeight, with LieHighestWeightPartII, SiegelModularForms and ModularityAndLanglandsExtensions read for the local and BGG statements.

- **Dynamical compactifications and strict dynamics.** No match anywhere else.
- **Locally analytic BGG.** No match anywhere else.
- **The all-degree cohomological eigenvariety.** No match anywhere else. PadicFamilies §2a.12 is the single-module eigenvariety, as stated. OverconvergentAutomorphicForms has only a definite-unitary coefficient eigenvariety.
- **Allowed Bruhat support pairs.** Only PadicFamiliesPartII, which cites this roadmap.
- **Siegel ordinary Igusa towers.** Assigned to HodgeTateAndCanonicalSubgroups by gap:siegel-ordinary-igusa. IgusaVarietiesAndTorsionConcentration builds Caraiani–Scholze Igusa varieties for unitary data. AutomorphicCongruences asks for unitary ordinary Igusa towers. Neither is the polarized Siegel tower.
- **The BGG resolution by Verma modules (§6.5(0)).**
  - LieHighestWeight excludes category O linkage (its README line 165).
  - LieHighestWeightPartII states no resolution.
  - AutomorphicBundles §9.1 is the relative resolution in type C₂ by induced modules.
  - §6.5(0) stays here.
- **The solid smooth-duality statement q^!A≃Ω^d[d] over Artinian A (§2.1).** AutomorphicBundlesPartII §1.6 and §3.9 use the discrete identification f^!=ω[d], and its §3.0a compares solid and discrete only along proper maps of finite Tor dimension. The solid statement for smooth q is therefore not stated there and stays in §2.1.
- **The isolated Klingen refinement and the GSp₄ unramified principal-series criterion (§9.5).**
  - SmoothRepresentationsOfLocalGroups (main, README lines 120–122) assigns the Klingen computations for GSp₄ to other roadmaps. It has only generic irreducibility on the Bernstein variety.
  - ModularityAndLanglandsExtensions and SiegelModularForms do not state the criterion.
  - GSp4NonregularModularityLifting asks SmoothRepresentationsOfLocalGroups for a different Klingen level-comparison constant.
- **PadicFamiliesPartII.** It imports §§1.1–9.8 by id and states that "None of these is restated here".

Ownership against open pull requests was checked through the tool's open heads (473 pull requests), not only through the 239 sibling checkouts.

## Fixes made in the port (upstream-reviewer pass)

1. **§2.2, the strict ideal-power relation.** The package wrote "D≤(a/b)D′ if (I′)^a⊂I^b for some positive integers a,b", which binds a and b twice and leaves D≤sD′ undefined. It now reads: for closed subschemes D=V(I), D′=V(I′) and a positive rational s, D≤sD′ if s=a/b for some positive integers a,b with (I′)^a⊂I^b. This follows the source, BP-Hida line 376 (Definition 2.1.15(2)). The Frobenius Check is unchanged: (t^p)^1⊂(t)^p gives s=1/p.
2. **§1.1.** Cκ− lacked its quantifier and now reads {w∈MW: w⁻¹(κ+ρ) is G-dominant}, matching Cκ+.
3. **API bullets restated as facts.** Twenty bullets that were noun phrases, or Lean-like phrasing ("Stores …", "Returns …", "r∈Fin 4"), now each state a fact with its hypotheses. They are in §§1.2, 2.2, 2.3 (two), 3.1, 3.4, 4.3, 4.5, 5.2 (two), 6.1, 6.2, 6.7, 7.1 (two), 7.3, 8.1 (two), 9.1 and 9.4 (two). Each new statement repeats what its section already proves; no new mathematics was added. For example:
   - §7.1: E→Z is finite, Z is closed in T̂, and E→W is locally quasi-finite and partially proper.
   - §9.4: the derived fibre of M_Kli at z↦z^k is fRΓ(X_Kli^≥1,Ω(k,2)(−D)).
4. **ASCII notation residue replaced by Unicode.** `A_square` and `(A[T],A)_square` became `A_■` and `(A[T],A)_■`. `tildeωκ` became `ω̃κ`. `Xbar`/`Cbar` became `X̄`/`C̄`. The notation `That` for the character space became `T̂`; three occurrences of the English word "That" were left alone.
5. **Summary.** The opening paragraph now says what the theory is built from: ShimuraCompactifications, AutomorphicBundles, AutomorphicBundlesPartII, PerfectoidShimuraVarieties and OverconvergentAutomorphicForms.
6. **Downstream consumers.** The section now names PadicFamiliesPartII and the sections it consumes: §§1.1, 2.3, 3.7, 4.5–4.9, Layer 5, §§6.1–6.3, 6.6, 8.3, 8.5, 9.1 and 9.4–9.8.
7. **The Layer 5 former-numbering table is kept, reworded neutrally.** I first removed it as process residue. Then I checked the incoming citations and restored it. PadicFamiliesPartII cites this layer partly in the former numbering:
   - Its §7.5, the higher Eichler–Shimura spectral sequence, needs "HigherHidaAndColemanTheory §5.5" for the Bruhat–Cousin spectral sequence, which is now §5.7(a).
   - Its scope sentence attributes "its Bruhat–Cousin spectral sequence and interior Cousin subquotients" to "§§5.1–5.6, 5.8"; these are now §5.7(a)–(b).
   - Its other citations, §5.5 for slope bounds and §5.6 for degree ranges, use the current numbering.

   The table, with a header naming the former numbering, is the mechanism the brief prescribes for ids other roadmaps cite. It now reads: "Sections 5.1–5.4 and 5.6 have the same numbers in the former numbering of this layer, under which other roadmaps also cite it; …".

## Unresolved

- **PadicFamiliesPartII mixes the two Layer 5 numberings** (see fix 7). The table keeps every citation followable. Fixing the citations themselves belongs to that roadmap's pull request, which this job does not edit.
- **The accepted review noted a stale description in PadicFamiliesPartII.** Its scope and §5.7 describe this roadmap's §9.6 equivariance as p^(−k−1). This README states p^(k+1) (source issue E10), and its Check computes D(Uf)=3 and pU(Df)=3 at p=3, k=0, f=z, against p⁻¹U(Df)=1/3. This too is for PadicFamiliesPartII.
- **Ten named supplier gaps remain, as in the accepted review**:
  - `coherent-correspondences` (AutomorphicBundlesPartII);
  - `abelian-subcanonical-vanishing` (AutomorphicBundlesPartII);
  - `siegel-ordinary-igusa` and `klingen-height-one-igusa` (HodgeTateAndCanonicalSubgroups);
  - `abelian-affinoid-basis` (PerfectoidShimuraVarieties);
  - `projective-banach-cohomology` (AdicSpacesPartIII);
  - `banach-support-duality` (AdicSpacesPartIV);
  - `solid-localization-kernel` and `discrete-adic-solid-comparison` (SolidAnalyticRings);
  - `klingen-lci-model` (ShimuraCompactifications).

  Each is stated in Exact supplier contracts and named in its consumers' Needs lines.
- No suspicious instructions were found in any text read (package, reviews, other roadmaps, sources).

## Adversarial mathematics pass

The values below were computed by hand for this port; "ok" means both sides agree as computed. A source citation `BP-Hida line N` refers to the cached text of the certified PDF.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: presentation twists O(nD)=L_D^(⊗−n) | X̄={a,b,c} over 𝔽₂, D=V(e_a) | O(D)=O has fibre ranks (1,1,1); e_aO and its dual have ranks (1,0,0); the colimit of the maps "multiply by e_a" is O_a=j_*O | ok, presentation-independent limit | none |
| Conventions: support orders K+−, K−+ | both boundaries empty; only D+; only D− | K−+=K+−=RΓ; D+ only gives j_*; D− only gives j_! | ok | none |
| Conventions: scalar rescaling p^(−a)•U | p=3, a=2,−1,0; a=2 then a=−1 | 1/9, 3, 1; the composite is 1/3, equal to a=1; zpow_sub₀ needs p≠0 | ok | none |
| Conventions: ordinary over ℤ/p² versus ℚ_p | multiplication by p | over ℤ/p² its square is 0 and the ordinary part is 0; over ℚ_p it is invertible of slope 1 | ok, different objects | none |
| §1.1 inverse formulas | general; C₂ with ν=(0,−2), ρ=(−1,−2) | κ_w(ν_w(κ))=κ using w0M²=1; the four κ_w are (5,3),(5,1),(2,−2),(0,−2), and each returns ν | ok | none |
| §1.1 chambers Cκ± | GSp₄ κ=(k+2,2); GL₂ k=2,1,0 | κ+ρ=(k+1,0); −w⁻¹(0,k+1) is (0,−k−1) for id and for s1 (dominant), and (−k−1,0) and (k+1,0) for the other two (not dominant), so Cκ+={id,s1}; GL₂ gives {id}, {id,long}, {long} | ok | Cκ− quantifier added |
| §1.1 dual weight κ∨=−w0Mκ−2ρ_nc | C₂ κ=(5,3), (5,1); U(2,1) | (0,−2), (2,−2); (κ∨)∨=κ because W_M fixes 2ρ_nc=(−3,−3); without −2ρ_nc the weight lands in the trivial line | ok | none |
| §1.1 torus Res¹ example | norm-one torus of ℚ(∛2) | its character lattice is the irreducible 2-dimensional S₃-module, so the only ℚ-subtori are 1 and T; ℝ-split rank 1<2, so Z_s=1 | ok | none |
| §1.2 slope regions and cone order | GL₂ k=2; vector (−1,10) | U_naive threshold 2 (slope 2 excluded, 1 allowed), U_std threshold 1; (−1,10)∉ℝ≥0² | ok | API bullet restated |
| §2.1 q^!A=Ω^d[d] | q=id; 𝔸¹, 𝔸²; A=𝔽₂, ℤ/9, ℤ/4 | A[0]; Ω¹ in degree −1; Ω² free of rank 1 in degree −2; A/2 over ℤ/4 has the 2-periodic infinite resolution, so ℙ²_A⊔Spec(A/2) has infinite Tor dimension; A[t,t⁻¹] is not finitely generated over A[t] | ok | none |
| §2.2 D≤sD′ | Frobenius on ℙ¹_𝔽p; identity with a Cartier divisor | (t^p)^1⊂(t)^p gives s=1/p; I^a⊂I^b fails for a<b and invertible non-unit I | ok | definition worded as in BP-Hida line 376 |
| §2.2(3)–(4) refinements | the ℙ³ minus a point Koszul example; the three-point non-Cartier boundary | the syzygy of (x₀,x₁,x₂) has rank 2 and 3 generators, so it is not free and needs the blow-up; blowing up along V(e_a) gives the point a, with empty boundary | ok | none |
| §2.2(5) cofiltered or empty | the identity on 𝔸¹; xy=1 | strict and compact categories empty (u^(ka)⊄u^(kb)); for xy=1 the inclusion p2*D+⊂p1*D+ fails at c0 | ok, "or empty" needed | none |
| §2.3 K^ord | A=ℤ/9 with T=1, 3, 0; ℤ/p^s with T=p | ordinary parts A, 0, 0; T=p is nilpotent, so 0 | ok | API bullets restated |
| §2.4 finiteness from strict dynamics | proper point over 𝔽₂ with T=id and T=0; 𝔽₂[t] over itself | 𝔽₂[0] and 0; 𝔽₂[t] has infinite dimension and is excluded (S must be Spec A with A Artinian) | ok | none |
| §2.5 derived coefficient change | A=ℤ/4, point, F=A and F=𝔽₂, M=𝔽₂ | A⊗^L𝔽₂=𝔽₂[0]=RΓ(F⊗M); for the non-flat F=𝔽₂, 𝔽₂⊗^L_A𝔽₂ has 𝔽₂ in every degree ≤0, while RΓ(F⊗M)=𝔽₂[0] | ok, flatness needed | none |
| §2.6 equivariant perfectness | A=𝔽₂, Γ=C₂, the split torsor over a point; Γ acting trivially | RΓ=𝔽₂[C₂] is free of rank 1 and specializes along the augmentation to 𝔽₂; the trivial 𝔽₂ has Tor_i=𝔽₂ for all i (not flat, excluded); p=|Γ|=2 is allowed | ok | none |
| §2.7 transposed duality | ℙ¹_𝔽₂ with T=id; point; 𝔸¹ ⊂ ℙ¹ | RΓ(O)=𝔽₂[0] against RΓ(Ω¹[1]) with H⁰=𝔽₂, dual 𝔽₂[0]; without [1] the dual sits in degree −1; 𝔸¹ gives 𝔽₂[t], not perfect | ok | none |
| §2.8(a) finite rank | identity on Spec 𝔽₂[t]; point | infinite rank over 𝔽₂ (excluded); rank 1 | ok | none |
| §2.8(b) support change | two points a,b with pairs (∅,∅) and ({a},∅) | 𝔽₂² against 𝔽₂; the cross-containment {a}⊆∅ fails, so the pair is excluded | ok | none |
| §2.8(c) bridge | three points, σ(a)=a, σ(b)=a, σ(c)=b | σ⁻¹{b,c}={c}; T(f)=(f(a),f(a),f(b)) and T²=constants, so the ordinary part is 𝔽₂ on both sides; e_a∘σ=(1,1,0), so T does not factor through the twist; the exchanged containment {c}⊆∅ fails | ok | none |
| §3.1 degree strata | g=1, n=1 and n=0 | two strata, multiplicative and étale; at n=0 every graded group has order 1 and the labels coincide, hence n≥1 | ok | API bullet restated |
| §3.2 stratum normalization c_w′(t) | GL₂ k=2, p=3, t=diag(2,3), diag(1,3), diag(2,6); GSp₄ t₂ | ν_id(κ)=(−1,−1), ν_long(κ)=(0,−2); c=3/2, 3, 3 with n=1; (1/6)t_naive=(3/2)(1/9)t_naive; the pure-power reading gives 1/3 (wrong by the unit 1/2); (−3,−3;0)·(−½,−½;−½)=3 | ok | none |
| §3.2 negative control | GL₂ k=2, constant coefficient 1 | t_κ=p⁻¹U_naive sends 1↦1; p⁻²U_naive gives 1/3, not integral after any twist | ok | none |
| §3.3 strict dynamics | the Frobenius-type contraction of §2.2 | s=1/p | ok | none |
| §3.4 C_w and the boundary map | genus-one cusp | O(−D)→O is (q)↪O, zero on q=0; the Siegel boundary is never empty | ok | API bullet restated |
| §3.5 perfectness | [ℤ_p --p→ ℤ_p] | H⁰=0, H¹=𝔽_p, perfect with torsion | ok | none |
| §3.6 Cousin sequence | GL₂ k=2 and k=1 | k=2: one column, long stratum t_κ=3·unit·t_long, nilpotent mod p^s; k=1: two columns, no degeneration claimed | ok | none |
| §3.7 regular control | GL₂ k=2, p=3 | the twist −ν_id with ν_id(t)=1/3 multiplies t_κ=p⁻¹U_naive by p, giving back U_naive; U_naive eigenvalue 3 is ordinary (t_κ eigenvalue 1), eigenvalue 1 is not (1/3) | ok | none |
| §3.8 away-p Hecke algebra | GL₂ ℓ=3; Iwahori ω, s; degree character at ℓ=2 mod 9 | 16=12+4·1; [IωI][IsI]=[I diag(1,ℓ) I]≠[I diag(ℓ,1) I], both of degree ℓ; 3²=9=6+3·1≡0 mod 9, while the all-ones assignment gives 1≠4 | ok | none |
| §4.1 finite torus group rings | p=2, n=2 | (ℤ/4)^× has order 2, divisible by p; 2ℤ₂-image of the invariants, so no averaging | ok | none |
| §4.2 unipotent level | pull–trace composite = unit 2 over ℤ₃; scalar 3 mod 9 | inverse 1/2; ordinary part 0 | ok | none |
| §4.3 R_w^ε | p=3, T_n=1+3^nℤ₃; constant tower; Rlim ℤ/p^m | rank (p−1)p^(n−1) (2, 6, 18); constant tower gives rank 2; ℤ_p⊗^L𝔽_p=𝔽_p, while 𝔽_p⊗^L𝔽_p has degrees −1 and 0 | ok | API bullet restated |
| §4.4 admissibility | C⁰(T′,ℤ_p) against ℤ_p[T′] | the dual of C⁰ is Λ′ (perfect); finitely supported functions are not admissible | ok | none |
| §4.5 specialization | ν(u)=u^k, u=1+p, k=1, 0 | [u]↦(1+p)⁻¹; k=0 gives 1 | ok | API bullet restated |
| §4.6 control | g=1 | M⊗^L_(Λ,−ν)O against C_w; Tor terms kept | ok | none |
| §4.7 Hecke image | Λ=ℤ₃[[X]] with the degree character; 1+E₁₂ | ring image ℤ·id is not a Λ-module, Λ⊗T^S gives Λ·id; Λ[N] has rank 2, the reduced quotient rank 1; the relation 3²=6+3 lifts | ok | none |
| §4.8 duality | g=1 and g=2 | w=id, w*=long of length 1=d−0; κ∨=2−k; for g=2, w*=w0Mww0 has length 3−ℓ(w) | ok | none |
| §4.9 integral amplitude | g=2, w=s1 | M^0 [1,3]; partner w* of length 2 has M^1 [0,2]; i↔3−i matches | ok | none |
| §5.1 imported Bruhat geometry | no target | — | — | none |
| §5.2 allowed pairs | GL₂ id, p=3, C=2, depth 1; depth −1; depth zero with j=0,1,2; closures; rootless | z=3 (v=1) breaks the absolute bound, z=9 (v=2) breaks U⊂B(2,−1), the relative bounds hold; \|1/9\|₃=9>3; j=0 gives the identity on 3, 6, 12-dimensional spans (not compact), j=1 gives slopes 0,1,2 (dimension 3), j=2 gives 0,2,4 with cutoff 4 (dimension 3); norms 3, 9, 27 show the model is pro-Banach | ok | API bullets restated |
| §5.3 continuation | depth 0 against depth 1, z^n↦3^nz^n | the same finite-slope span {z^n}, the full spaces differ | ok | none |
| §5.4 level and character | C₂ over ℚ₂ against ℤ₂ | averaging by 1/2 exists rationally; integral image is 2ℤ₂ | ok | none |
| §5.4a algebraic duality | C₂ κ=(5,3;−8); U(z^n)=p^nz^n; identity | κ∨=(0,−2;8), (κ∨)∨=κ; slope ≤2 blocks of dimension 3; the identity's slope-0 part has dimensions 3, 6, 12, …, hence T++ only | ok | none |
| §5.5 local slope bounds | GSp₄ w=1, κ=(5,3;−8), t₂ | thresholds 0 and 3; κ∨ against t₂⁻¹ gives 3; slope 2 excluded only after transposition; torus: v(η)=κ | ok | none |
| §5.6 degree ranges | modular curve, d=1 | cuspidal + in [0,0] and [0,1]; canonical in [0,1] and [1,1]; with ℓ+ on both sides id would wrongly give [1,1] | ok | none |
| §5.7 Cousin and interior | ℙ¹ with the closed unit disc; maps 0 and id on F | E₂=K in degree 0; completion gives k[[t]], local cohomology gives H¹=k[t,t⁻¹]/k[t]; interior groups 0 and F | ok | none |
| §5.8 classicality | GL₂ k=2 and k=1 | U_std<1 is classical in H⁰; k=1: l_min=0, l_max=1, so cuspidal [0,1], canonical [0,1], interior [0,1] | ok | none |
| §6.1 analytic action | ν_A(u)=c; ν_alg(t)=p^a | the pairing gives c·c⁻¹=1; the slope shifts by −a | ok | API bullet restated |
| §6.1a abelian descent | 𝔸²/{±1} in characteristic 0; ℤ₂[C₂] | the fibre F[x,y]/(x²,xy,y²) has dimension 3 against generic degree 2, so not flat; invariants image 2ℤ₂ | ok | none |
| §6.2 analytic pairs | GL₂ id, p=3, n=1, U=B(1,−1) | Z∩U=U=B(1,1); relative bounds with m=l=0, s=1; the absolute bound fails at z=3, 9 | ok | API bullet restated |
| §6.3 slope blocks | [A --t→ A], A=F⟨t⟩ | perfect; H¹=A/(t) is not projective | ok | none |
| §6.4 Tor sequence | the same complex at t=0 and at a transcendental a | t=0: H⁰=F from Tor₁; t=a: acyclic | ok | none |
| §6.5 BGG | SL₂ κ=0, 1; GL₂ centre (a,b) | d/dz and d²/dz² (z²↦2≠0 at p=2); s·1=−3, 0→M(−3)→M(1)→V₁; e·fv₁=v₁≠0; s·(a,b)=(b−1,a+1) with central character a+b and dot-related a−b, −(a−b)−2; twisted slopes −1, 1, 3 | ok | none |
| §6.6 analytic BGG sequence | GL₂ (W_M trivial); GSp₄ w=1, v=s0 | one column; ν_v=s0·(0,−2;8)=(−3,1;8) | ok | none |
| §6.6a analytic duality | torus datum with B=L×L; curve ℙ¹ with D={∞} | Tr(xy): ⟨(1,0),(0,1)⟩=0, ⟨(1,0),(1,0)⟩=1; dimensions 1, 0, 0, 2 | ok | none |
| §6.6b analytic bounds | C₂ w=1; GSp₄ v=s0; transcendental weight a∈1+9O_ℂ₃ | a_an=(3,3), b_an=0, a+2ρ_nc=0=−b; thresholds 0 and 3 for the column v=s0; slope −1/2 excluded by (2), slope 0 allowed | ok | none |
| §6.7 BGGsafe | GSp₄ w=1, v=s0, t₂; GL₂ | ν_v=(2−k₁,4−k₂;k₁+k₂)·t₂=−3; thresholds 0 and 3; W_M={1} makes it vacuous | ok | API bullet restated |
| §6.8 coefficient control | κ=(5,3;−8) at t₂-slope 2 | the column v=s0 is excluded, leaving only the identity column | ok | none |
| §6.9 family ranges | [A --s→ A] over a domain A | bottom H⁰=0 is torsion-free; H¹=A/(s) is torsion | ok | none |
| §6.10 away-S algebra | GL₂ Iwahori (noncommutative); matrix units | diag(1,0)≠diag(0,1); the zero assignment sends 1↦0; a non-CM point has no ℓ-isogeny to itself (ℓ is not a square) | ok | none |
| §7.1 eigenvariety | all cohomology zero; an H¹-only class | E empty; the H¹ class contributes | ok | API bullets restated |
| §7.2 classical points | GSp₄ w=1, v=s0 | ν_alg=(0,−2;8) against ν_v=(−3,1;8): same Bruhat w, two weights | ok | none |
| §7.3 interior support | εe₂=e₁, image Ae₁ | Ann=(ε), so the faithful image algebra is A (rank 1) inside A[ε]/(ε²) (rank 2) | ok | API bullet restated |
| §7.4 interior specialization | t:A→A at t=0 | the fibre of the image is (t)/t(t)=F, mapping onto the specialized image 0 (surjective, not injective) | ok | none |
| §7.5 equidimensionality | N=A against A/(t) over F⟨t⟩ | support of dimension 1 against a point (torsion, excluded) | ok | none |
| §7.6 sharp interior bounds | GL₂ k=2 and k=1; GSp₄ κ=(5,3;−8); torus | U_std window [0,1); at k=1 Cκ+={id,long}, so not applicable; −w0M(κ+ρ)=(−1,−4) is regular, A_w·t₂=3,4,4,8, window [3,4) for U2_naive | ok | none |
| §8.1 integral model | ℤ_p[x,y]/(xy−p); 𝔽₃[t] supports; (ℤ/9)[x] | y/x∉R but is a unit rationally; RΓ_Ẑ has H¹=B[t⁻¹]/B, the completion 𝔽₃[[t]], V(t^k) gives a k-dimensional H¹; T=x factors, T=1 and T=3 do not | ok | API bullets restated |
| §8.2 ordinary comparison | diag(1,3) on ℤ₃² | integral ordinary rank 1; rational finite-slope rank 2, slopes 0 and 1 | ok | none |
| §8.3 family comparison | ν_A(u)=u^k, u=1+p | (1+p)⁻¹ for k=1; 1 for k=0 | ok | none |
| §8.4 rational amplitude | g=3, d=6 | canonical [ℓ(w),6]; ℓ↔6−ℓ under duality | ok | none |
| §8.5 sharp Siegel bounds | κ=(5,3;−8) at t₂ | 3, 4, 4, 8 = 3, k₂+1, k₂+1, k₁+k₂; proved bounds give 3, 3 at s1 and s1s0 | ok | none |
| §9.1 four weights | ν=(0,−2); ν=(1,1−k) | (5,3),(5,1),(2,−2),(0,−2); κ₀=κ₁=(k+2,2) (singular wall); duals (0,−2), (2,−2) | ok | "Fin 4" bullet restated |
| §9.2 modular curve | k=2, k=0 | U_std threshold 1; degree-one threshold 1−k=1 | ok | none |
| §9.3 GSp₄ chambers | t₁, t₂, κ=(5,3;−8); the other basis | (0,−1;−1) pairs to 6,6,11,11 and t₂ to 3,4,4,8; x₁x₄=x₂x₃=1/9; the wrong reading gives 1,2,7,11; U2_std test <1 | ok | none |
| §9.4 Klingen tower | lines of (ℤ/3^m)², Isom against Hom | 4, 12 (ratio 3=p); \|(ℤ/3^n)^×\|=2, 6, 18 against 3, 9, 27 | ok | API bullets restated |
| §9.5 isolated refinement and criterion | (1,1,9,9) at p=3; (1,1,p,p); all parameters 1 | products 1, 9, 9, 81, eigenvalues 1/3, 3, 3, 27; δ(a)=p⁻⁴, δ^(−1/2)=9 against δ⁻¹=81 (gives 3,27,27,243); ratios 1, 9, 1/9 (criterion applies); (1,1,p,p) has ratio p (excluded); the ratio set {χ₁,χ₂,χ₁χ₂,χ₂/χ₁}^(±1) matches the GSp₄ reducibility conditions | ok | none |
| §9.6 Klingen family | f=Σ2^m z^(2^m−1) over ℚ₂; U(f)=f(3z); R/(y²) | the antiderivative has coefficients 1 (radius loss); D∘U=pU∘D, so thresholds (−2,1) at k=0 and (1,4) at k=3, versus (−4,−1) and (−7,−4) with p^(−k−1); localization has dimension 2 against residue dimension 1 | ok | none |
| §9.7 small-slope extension | (k,r)=(0,2), (0,0) | threshold 1; min(1,−2)=−2 in all degrees, min(1,1)=1 on H⁰; at r=0 the threshold is −3 | ok | none |
| §9.8 two-term control | (1,1,9,9) at p=3; p=2, k=3 and 4 | T eigenvalue 20, Klingen eigenvalues 2, 10, 10, 18 with valuations 0,0,0,0,2 (nonnegative, not positive); k>p+1=3 starts at k=4 | ok | none |
| §9.9 split U(n,1) | n=1, ν=(2,0); n=2, ν=(4,2,0), both action conventions | κ=(−3,1), (0,−2), inverses return (2,0); (−3,−5,2), (0,−5,−1), (0,−2,−4); the other convention gives (−6,1,−1) (not M-dominant); duals (4,2,0), (4,−1,3) | ok | none |

Context and generality: `Suggested.lean` has no `variable` block and no declaration, so no Lean statement can lose a hypothesis. The README's generality is unchanged by the port except for the two clarified definitions in fixes 1 and 2, neither of which narrows or widens a statement.


Pull request: #2342 (roadmap/higher-hida-and-coleman-theory at b82e0be)
