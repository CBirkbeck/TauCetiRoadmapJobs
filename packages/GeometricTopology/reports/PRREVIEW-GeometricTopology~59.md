# Review of GeometricTopology (pull request #1797 at 5e3c64a)

**Verdict:** needs changes

:robot: AI review of the folder `TauCetiRoadmap/GeometricTopology/` at this head, incremental over the previous review (at ac5a1c0). The folder changed by 0 lines since that head; the pull request's only change since then is in `TauCetiRoadmap/ReductiveGroups/`, which this roadmap never cites. The previous review left no finding. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning.

The findings below are new and lie outside the (empty) diff. They come from one check the previous rounds carried forward instead of redoing after the Tau Ceti pin moved from 358314d4 to 2fd255d9 (the r56 head adapted eight paths; the headline inventory row "each missing carrier absent at the pin" was carried from r55, before the bump): the pin bump added 1666 files to Tau Ceti, and among them are native carriers for seven headline theorems that the module docstring of `Suggested.lean` still calls not statable, and native definitions of objects that Layers 1, 3, 5, 7, 8, 9 and 10 define again. Every claim below is checked at the pinned checkout (`lake-manifest.json` rev 2fd255d9, the worktree's `.lake/packages/TauCeti` at that commit), and every repair to `Suggested.lean` was elaborated at the pin in a scratch copy.

## R01 (P2) — Layer 9 restates native handlebodies, Heegaard splittings, Heegaard genus and the rank bound; Li's theorem is statable and absent

Location: `README.md:2044–2056` ("Define the handlebodies of genus `g` … Define a Heegaard splitting of a closed connected 3-manifold `M` as a pair of handlebodies … its genus is `g`"); `README.md:2085–2092` ("Define the Heegaard genus `g(M)` … a `Nat.find` on the existence theorem of 9.1 … State Li's theorem"); `Suggested.lean:48` ("Li's theorem (Layer 9) lacks handlebodies and the Heegaard genus").

Claim: handlebodies, Heegaard splittings, the Heegaard genus, the inequality `rank π₁(M) ≤ g(M)` and Li's theorem are this roadmap's to define and state, and Li's theorem has no carrier at the pin.

Witness (pinned Tau Ceti): `LowDimTopology/Handlebody/Basic.lean:86` `TauCeti.handlebody g` (the planar surface with `g` holes times `[−1, 1]`), `Handlebody/FundamentalGroup.lean:334` `π₁` free of rank `g`; `LowDimTopology/Heegaard/Splitting.lean:77` `TauCeti.HeegaardSplitting M` (two closed subsets covering `M`, each homeomorphic to `handlebody genus`, meeting in their common frontier), `:239` `TauCeti.heegaardGenus M` as a `Nat.find` under `[Nonempty (HeegaardSplitting M)]`, `:268` `heegaardGenus_congr`, `:335` `heegaardGenus_sphere`; `Heegaard/FundamentalGroup.lean:322` `rank_fundamentalGroup_le_heegaardGenus` (charts in a space of `finrank 3`, `Group.FG`); `Heegaard/RankGenus.lean:84` `TauCeti.RankGenusConjecture`, `:138` `TauCeti.LiRankGenusTheorem` (for every `n`, a closed connected orientable hyperbolic smooth 3-manifold with `rank π₁ + n < heegaardGenus`); `Heegaard/LensSpace/Splitting.lean:172` `LensSpace.heegaardGenus_eq_one`; `Heegaard/DehnFilling.lean` `heegaardGenus_circle_prod_sphere`. At the previous pin 358314d4 the `Heegaard/` directory held seven Heegaard Floer diagram files and no `Handlebody/` directory existed.

Repair: 9.1 consumes `TauCeti.handlebody` and `TauCeti.HeegaardSplitting`, saying in one clause how its own variant differs (the native splitting sits inside `M` as two subsets with orientable handlebodies only; the non-orientable handlebodies `H_g^−`, splittings of non-orientable manifolds, and the existence theorem for every closed orientable 3-manifold stay here, the existence theorem supplying the instance `Nonempty (HeegaardSplitting M)` that the native genus needs, since native instances exist only for `S³`, `S¹ × S²` and the lens spaces). 9.2 consumes `TauCeti.heegaardGenus` and `rank_fundamentalGroup_le_heegaardGenus`, states Li's theorem as `TauCeti.LiRankGenusTheorem` and Waldhausen's question as `TauCeti.RankGenusConjecture`, and its Checks cite `heegaardGenus_sphere`, `LensSpace.heegaardGenus_eq_one` and `heegaardGenus_circle_prod_sphere`. The From Tau Ceti contract lists these with their files. `Suggested.lean` adds `import TauCeti.LowDimTopology.Heegaard.RankGenus` and

```lean
theorem li_rank_genus_theorem : TauCeti.LiRankGenusTheorem.{u} := by
  sorry
```

and the docstring moves Li's theorem to the statable list. Tested: the statement elaborates at the pin (scratch probe, `declaration uses sorry` only).

## R02 (P2) — Cerf's theorem is native and statable; 3.3 restates it and the docstring says its carrier is missing

Location: `README.md:919–921` ("State Cerf's theorem: `π₀(Diff⁺(S³)) = 0` … hence `π₀(Diff(S³)) ≅ ℤ/2` through the degree … Smale's conjecture implies Cerf's theorem"); `Suggested.lean:46–47` ("Cerf's theorem (Layer 3) lacks the orientation-preserving subgroup of `TauCeti.Diff`").

Claim: Cerf's theorem cannot be stated without `Diff⁺(S³)`.

Witness: `Geometry/Diffeomorphism/Cerf.lean:77` `TauCeti.CerfTheorem : Prop`, every `f : Diff (𝓡 3) S³ ∞` is `Joined` to `orthogonalToDiffSphere 3 ∞ A` for some `A ∈ O(4)`; `:84` `SmaleConjecture.cerfTheorem` proves "Smale implies Cerf" (the README's claim at line 921); `cerfTheorem_iff_natCard_zerothHomotopy_eq_two` is the `π₀(Diff(S³)) ≅ ℤ/2` form. The orthogonal-group form says exactly `π₀(Diff(S³)) = π₀(O(4))`, so no orientation-preserving subgroup is needed to state it.

Repair: 3.3 states Cerf's theorem as `TauCeti.CerfTheorem`, cites `SmaleConjecture.cerfTheorem` for the implication and `cerfTheorem_iff_natCard_zerothHomotopy_eq_two` for the `ℤ/2` form, and keeps `Diff⁺` and the degree for its own uses (3.1). `Suggested.lean` adds `import TauCeti.Geometry.Diffeomorphism.Cerf` and `theorem cerf_theorem : TauCeti.CerfTheorem := by sorry`; the docstring moves it. Tested at the pin.

## R03 (P2) — The connected sum and the prime decomposition are native; 1.4 and 8.2 restate them, and Kneser–Milnor is statable and absent

Location: `README.md:549–556` ("Define the connected sum on explicit data … Prove independence of the balls … Prove the identities `M # Sⁿ ≅ M`, `M # N ≅ N # M`"); `README.md:1897–1903` ("Define a closed connected 3-manifold to be prime … State and prove the Kneser–Milnor prime decomposition theorem"); `Suggested.lean:50` ("the Kneser–Milnor prime decomposition (Layer 8) lacks the connected sum").

Claim: the connected sum, its independence of the balls, primeness and the prime decomposition are defined here, and the decomposition theorem has no carrier.

Witness: `Geometry/Manifold/ConnectedSum/Basic.lean` `TauCeti.ConnectedSum e₁ e₂` (quotient along two embedded balls, with `inl`, `inr`, `t2Space`); `ConnectedSum/Oriented.lean` `TauCeti.OrientedConnectedSum oM oN` with `nonempty_diffeomorph_comm` and `nonempty_diffeomorph_sphere`; `ConnectedSum/Independence.lean` `ConnectedSum.nonempty_diffeomorph_of_isOrientationPreservingAt` (independence of the balls); `ConnectedSum/Prime.lean:102` `TauCeti.IsConnectedSumOf`, `:217` `TauCeti.IsPrimeManifold n M` (not diffeomorphic to `Sⁿ`, and every decomposition into two closed manifolds has a sphere summand), `:277` `TauCeti.IsIteratedConnectedSum` (`k = 0` means diffeomorphic to `Sⁿ`); `LowDimTopology/PrimeDecomposition.lean:79` `TauCeti.KneserPrimeDecompositionTheorem` and `:91` `TauCeti.MilnorPrimeDecompositionTheorem` (closed connected orientable smooth 3-manifolds; uniqueness as a bijection of the index sets with diffeomorphic factors).

Repair: 1.4 consumes the native connected sum, its oriented form, independence, commutativity and sphere identity, and keeps associativity and the `π₁` free product as its own (neither is listed natively). 8.2 consumes `IsPrimeManifold 3` and `IsIteratedConnectedSum 3`, states Kneser and Milnor as the two native Props and records the native convention that `S³` is not prime and is the empty connected sum (which is what 8.2's "n = 0 for `S³`" already says). `Suggested.lean` adds `import TauCeti.LowDimTopology.PrimeDecomposition` and

```lean
theorem kneser_prime_decomposition : TauCeti.KneserPrimeDecompositionTheorem.{u} := by
  sorry

theorem milnor_prime_decomposition : TauCeti.MilnorPrimeDecompositionTheorem.{u} := by
  sorry
```

and the docstring moves them. Tested at the pin.

## R04 (P2) — Dehn filling, the unknot fillings, the preferred framing, cosmetic surgery and the Akbulut–Kirby conjecture are native; Layer 5 restates them, and Property P and Property R are statable and absent

Location: `README.md:1395–1419` ("Define the Dehn filling `X(s)` … prove that the result is independent, up to diffeomorphism, of the gluing map … Prove the unknot identities … `S³_U(p/q) ≃ₘ L(p, q)`"); `README.md:1357–1364` (5.2, framings and their change); `README.md:1476–1487` (5.4, Yasui's refutation of Akbulut–Kirby and Mathieu's chirally cosmetic surgeries); `Suggested.lean:44` ("Property P and Property R (Layer 5) lack Dehn filling and surgery").

Claim: Dehn filling and surgery exist only as targets here, so Property P and Property R cannot be stated.

Witness: `LowDimTopology/DehnSurgery/Filling.lean:164` `TauCeti.DehnFilling h s Y` (a closed embedding of the knot exterior and one of a solid torus, covering `Y`, meeting in the boundary torus, with `fillingSlope_gluing : h.fillingSlope gluing = s`), `:448` `meridianDehnFilling` (the trivial filling, slope `h.framedBoundaryTorus.meridian`); `Existence.lean:274` `IsSolidTorusNeighborhood.exists_dehnFilling`; `Uniqueness.lean` `DehnFilling.exists_homeomorph_of_isotopic` (independence of the gluing); `SeifertFraming.lean` `framingNumber`, `preferredFramedBoundaryTorus` (longitude of value `0`); `Unknot.lean:160` `unknotZeroDehnFilling` and `:230` `DehnFilling.nonempty_homeomorph_circle_prod_sphere_of_unknot_longitude`; `DehnSurgery/LensSpace.lean` `unknotLensSpaceDehnFilling` and `DehnFilling.nonempty_homeomorph_lensSpace_of_unknot_slopeValue` (the slope-`p/q` filling of the unknot is `L(p; ℓ₀, −q ℓ₀)`); `Cosmetic.lean:250` `CosmeticSurgeryConjecture`, `:267` `NiWuCosmeticSurgeryTheorem`, `:316` `MathieuChirallyCosmeticTheorem` (two slopes on the right-handed trefoil exterior); `AkbulutKirby.lean:89` `AkbulutKirbyConjecture`, `:115` `YasuiTheorem`; `Link/Surgery.lean` `surgerySlope` for links. None of these files existed at pin 358314d4 (`DehnSurgery/` held `Slope.lean` only).

Both headlines elaborate on these carriers. Tested at the pin, in module form like `Suggested.lean`:

```lean
theorem property_p
    (K : SmoothCircleEmbedding (𝓡 3) (Metric.sphere (0 : EuclideanSpace ℝ (Fin 4)) 1))
    (hK : ¬ SmoothEmbedding.SmoothAmbientIsotopic K unknot)
    (Φ : SolidTorus → Metric.sphere (0 : EuclideanSpace ℝ (Fin 4)) 1)
    (h : IsSolidTorusNeighborhood K Φ) (s : Slope h.framedBoundaryTorus.H)
    (hs : s ≠ h.framedBoundaryTorus.meridian)
    (Y : Type) [TopologicalSpace Y] (F : DehnFilling h s Y) (y : Y) :
    Nontrivial (FundamentalGroup Y y) := by
  sorry

theorem property_r
    (K : SmoothCircleEmbedding (𝓡 3) (Metric.sphere (0 : EuclideanSpace ℝ (Fin 4)) 1))
    (hK : ¬ SmoothEmbedding.SmoothAmbientIsotopic K unknot)
    (Φ : SolidTorus → Metric.sphere (0 : EuclideanSpace ℝ (Fin 4)) 1)
    (h : IsSolidTorusNeighborhood K Φ) (Y : Type) [TopologicalSpace Y]
    (F : DehnFilling h
      (h.preferredFramedBoundaryTorus
        (isZero_reducedSingularHomologyFunctor_one_sphere_euclideanSpace_fin_four _)
        (isZero_reducedSingularHomologyFunctor_two_sphere_euclideanSpace_fin_four _)).longitude Y) :
    IsEmpty (Y ≃ₜ Circle × Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1) := by
  sorry
```

(with `open TauCeti`, imports `TauCeti.LowDimTopology.DehnSurgery.Unknot` and `TauCeti.LowDimTopology.DehnSurgery.Cosmetic`; the `isZero_…` terms are the ones `AkbulutKirby.lean:98–100` uses, and they elaborate only under the `module` header that `Suggested.lean` already has).

Repair: 5.2 consumes `framingNumber` and `preferredFramedBoundaryTorus`; 5.3 consumes `DehnFilling`, `exists_dehnFilling`, `exists_homeomorph_of_isotopic`, the unknot fillings and the lens-space filling, recording the native sign convention (the slope `p/q` filling of the unknot is `LensSpace p ![1, −q]`, which is `L(p, q)` with orientation ignored, as 5.3 already says), and keeps as its own what is not native: surgery on a knot in a general 3-manifold as a diffeomorphism type, the classification of lens spaces, Lickorish–Wallace, and general-dimension surgery beyond `Topology/Surgery/Basic.lean`'s `SphereSurgery`; 5.4 states Mathieu, Akbulut–Kirby and Yasui as the native Props and states Property P and Property R in the forms above. `Suggested.lean` states both; the docstring moves them.

## R05 (P2) — The Weeks manifold and the minimal volume theorem are native; 7.3 restates them and the headline is absent

Location: `README.md:1751–1756` ("Define the Whitehead link … State the minimal volume theorem: `W` carries a …"); `Suggested.lean:45` ("the minimal volume theorem (Layer 7) lacks the Weeks manifold, which lacks the Dehn filling that defines it").

Claim: the Weeks manifold and the Gabai–Meyerhoff–Milley theorem have no carrier at the pin.

Witness: `LowDimTopology/DehnSurgery/Link/Weeks.lean:95` `TauCeti.IsWeeksManifold Y` (a filling of the exterior of the native `whiteheadLink` with surgery coefficients `5` and `5/2`, orientation-preserving at the cores), `:150` `exists_isWeeksManifold`; `Geometry/Manifold/Riemannian/Hyperbolic/Weeks.lean:77` `TauCeti.GabaiMeyerhoffMilleyTheorem` (a hyperbolic Weeks manifold exists, and for every Weeks manifold `W` and every closed connected orientable hyperbolic `M`, `hypVolumeOfMetric gW ≤ hypVolumeOfMetric g`, with equality only when `M` is homeomorphic to `W`).

Repair: 7.3 consumes `whiteheadLink`, `IsWeeksManifold` and `exists_isWeeksManifold`, states the theorem as `GabaiMeyerhoffMilleyTheorem`, and keeps `H₁(W) ≅ (ℤ/5)²` and the value `0.9427…` as its own Checks. `Suggested.lean` adds `import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.Weeks` and `theorem gabai_meyerhoff_milley_theorem : TauCeti.GabaiMeyerhoffMilleyTheorem.{u} := by sorry`; the docstring moves it. Tested at the pin.

## R06 (P2) — Tautness, the Euler class, Thurston's inequality, the Euler class one conjecture and Yazdi's theorem are native; 10.1, 10.2 and 10.4 restate them and the two headlines are absent

Location: `README.md:2130–2141` (10.1, "Define a foliation to be taut …"); `README.md:2168–2176` (10.2, "Define the Euler class `e(E) ∈ H²(X; ℤ)` … as the primary obstruction to a nowhere-vanishing section"); `README.md:2254–2273` (10.4, "State Thurston's inequality … State the Euler class one conjecture … State Yazdi's theorem"); `Suggested.lean:48–49` ("Thurston's inequality and Yazdi's theorem (Layer 10) lack the Euler class of a plane bundle and the Thurston norm").

Claim: these objects and statements have no carrier at the pin.

Witness: `Geometry/Manifold/Foliation/Taut.lean:66` `TauCeti.Foliation.Taut` (every leaf meets a `C¹` closed transversal); `Topology/VectorBundle/EulerClass.lean` `TauCeti.eulerClass` (through the Thom pair, in singular cohomology with `ℤ` coefficients); `Geometry/Manifold/Foliation/EulerClass.lean` `Foliation.eulerClass`, `Foliation.IsEulerClass`, `IsEulerClass.neg`, `eulerClass_eq_zero_of_forall_ne_zero`, `:218` `TauCeti.EulerClassBounded e` (`|⟨e, [S]⟩| ≤ −χ(S)` over embedded closed connected oriented surfaces with `χ ≤ 0`), `:231` `EulerClassNormOne`, `:330` `TauCeti.ThurstonEulerClassInequality` (closed orientable hyperbolic `M`, taut `F`, every Euler class of `F` is bounded), `:346` `TauCeti.EulerClassOneConjecture`, `:387` `TauCeti.YazdiEulerClassOneTheorem` (one closed orientable hyperbolic `M` and one even class of dual norm one that is the Euler class of no taut foliation). The Thurston norm itself is not native: `EulerClassNormOne` encodes `x*(e) = 1` through surfaces.

Generality, both directions: the native inequality is the hyperbolic case of the README's statement for closed oriented irreducible `M`; the native Yazdi asserts one counterexample where the README and `yazdi2016` line 111 assert infinitely many. The README keeps both general statements as targets and states the native Props as the headlines, with a comparison target `x*(e) ≤ 1 ↔ EulerClassBounded e` in 10.3.

Repair: 10.1 consumes `Foliation.Taut` (noting the `C¹` transversal) and keeps Reeb components, which are not native; 10.2 consumes the native Euler class and keeps the obstruction-theoretic description as a comparison target; 10.4 states the two headlines as the native Props and keeps its general forms. `Suggested.lean` adds `import TauCeti.Geometry.Manifold.Foliation.EulerClass` and

```lean
theorem thurston_euler_class_inequality : TauCeti.ThurstonEulerClassInequality := by
  sorry

theorem yazdi_theorem : TauCeti.YazdiEulerClassOneTheorem := by
  sorry
```

and the docstring moves them. Tested at the pin.

## R07 (P3) — The Scope paragraph and the Tau Ceti contract claim ownership of what the pin provides

Location: `README.md:27–75` ("This roadmap owns: … the connected sum with its independence theorem …, Cerf's theorem …, Dehn filling and surgery, the surgery identities on the unknot …, the Weeks manifold, the minimal volume theorem …, the prime decomposition …, handlebodies, Heegaard splittings, Heegaard genus, the rank inequality and Li's theorem …, the Euler class …, Thurston's inequality and Yazdi's theorem"); `README.md:112–113` ("Everything else … is consumed under its native name …; nothing native is defined a second time"); `README.md:181–388` (the From Tau Ceti contract lists none of the files of R01–R06).

Claim: nothing native is defined a second time.

Witness: the sixteen files named in R01–R06, all absent at pin 358314d4 and present at pin 2fd255d9 (`git diff --name-status` between the two pins over `TauCeti/LowDimTopology`, `KnotTheory`, `Geometry/Manifold`, `Geometry/Diffeomorphism`, `Topology`: 1666 added files).

Repair: rewrite the Scope bullets for Layers 1, 3, 5, 7, 8, 9 and 10 to own only what R01–R06 leave here, move the native objects to the "leaves to named suppliers" list, and add them to the From Tau Ceti contract with their files.

## Previous findings

The previous report (pull request #1797 at ac5a1c0, review r58) accepted the folder with no finding, so there is nothing to carry.

## Verified sound

**The head and the diff.** `git rev-parse HEAD` is 5e3c64aa62c87889989dd077fa7ed4c0ceeb4d02; `git diff --stat ac5a1c0 HEAD -- TauCetiRoadmap/GeometricTopology` is empty; the only change since ac5a1c0 is `TauCetiRoadmap/ReductiveGroups/README.md` and `Suggested.lean` (782 insertions, 416 deletions), and this roadmap's README and Lean file mention neither ReductiveGroups, QuadraticFormInvariants nor LieHighestWeight. `git diff --stat origin/main...HEAD` outside the five folders the brief names is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` and the generated `PROGRESS.md`, `STATUS.md`.

**The gate.** The worker's gate at this head: every check 0, `OK`. The dependency check, run here:

```
depcheck: 239 roadmaps, 2342 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The worker's `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.

**Elaboration.** `lake env lean TauCetiRoadmap/GeometricTopology/Suggested.lean` from the pull-request worktree: exit 0, twelve warnings, all `declaration uses sorry`, in 7 s. A copy in my scratch directory with each `sorry` replaced by `first | rfl | simp | infer_instance | decide | exact trivial` and `#check @name` for the twelve declarations appended: all twelve probes fail (errors at the probe's lines 70, 78, 84, 93, 100, 107, 115, 121, 130, 137, 145, 154, one per statement), so nothing is padding; the twelve `#check` types are those of the previous report (annulus `∀ n`; Smale, Watanabe, Freedman, Mostow, virtual Haken, JSJ, geometrization as the native `Prop`s; Markov `MarkovEquiv ⟨n, w.toBraid⟩ ⟨m, v.toBraid⟩ ↔ w.closure.ReidemeisterEquiv v.closure`; Agol fibering on a compact connected smooth 3-manifold with `IsHyperbolic`; Poincaré `Nonempty (M ≃ₘ⟮𝓡 3, 𝓡 3⟯ sphere 0 1)`; Manolescu `∀ n, 5 ≤ n → ∃ M …, IsClosedConnectedManifold n M ∧ ¬ IsTriangulable M`) and agree with the README. The worker's `signatures.md` entries `in`, `here`, `is` are its scanner reading the docstring, not declarations. No section binder is lost. No Lean process was left running.

**The headline probe.** A second scratch file (`module`, `import Mathlib`, the native modules of R01–R06, built first with `lake build` of those modules from the worktree) stating the nine headlines of R01–R06 with `sorry`: exit 0 apart from one `#check` of a name I had not imported; nine `declaration uses sorry` warnings, and `#check` printed `LiRankGenusTheorem`, `CerfTheorem`, `KneserPrimeDecompositionTheorem`, `GabaiMeyerhoffMilleyTheorem`, `ThurstonEulerClassInequality`, `YazdiEulerClassOneTheorem`, `MathieuChirallyCosmeticTheorem`, `YasuiTheorem`, `AkbulutKirbyConjecture` as `Prop`, `heegaardGenus : (M : Type u_1) → [TopologicalSpace M] → [Nonempty (HeegaardSplitting M)] → ℕ`, `handlebody : ℕ → Set (ℂ × ℝ)`, `exists_isWeeksManifold : ∃ Y x, CompactSpace Y ∧ T2Space Y ∧ IsWeeksManifold Y`.

**Seeded sample.** None of the fifteen sampled targets falls in the (empty) diff. The locators that cached texts support were reopened anyway: 3.3 Watanabe Theorem 1.1 and Remark 1.2 (`watanabe2018` lines 32–38: the epimorphism `π_k BDiff(D⁴, ∂) ⊗ ℚ → A_k`, `A₁ = 0`, the first element in `A₂ ≅ ℚ`), Kirby 4.34 (`kirby1997` cache 9812f2d7 line 5950, "is `Diff(S⁴) ≃ O(5)`?") and 4.126 (C) (lines 7507–7512, `SO(5) → SDiff(S⁴)` and the `Diff(D⁴, ∂D⁴)` reformulation); 5.3 Hatcher Section 2.1 (`hatcher-3m` lines 1204–1240: `L_{p/q}` as two solid tori, `S³/ℤ_q`, `π₁ ≅ ℤ_q`) and Theorem 2.5 (line 1249: `L_{p'/q} ≅ L_{p/q}` iff `p' ≡ ±p^{±1} mod q`, which is the README's reading with `p` and `q` exchanged); 5.4 Kirby 1.15 (line 394) and 1.81 (lines 1601–1616: cosmetic definitions, Gordon–Luecke, Mathieu's chirally cosmetic pairs on the right-hand trefoil), Kronheimer–Mrowka Conjecture 1 (`km2004` line 41) and Theorem 2 (line 54, the nontrivial `π₁(Y₁) → SO(3)`); 6.2 Livingston Section 3.1 (`livingston2005` lines 223–233: `σ_ω` as the average of the one-sided limits, onto `2ℤ` for `ω ≠ 1`, independence through twisted doubles, onto `ℤ^∞`); 4.1 Hatcher Theorem 3.44 and Corollary 3.45 (`hatcher-at` lines 10998, 11035); 9.1 Scharlemann Section 1 (`scharlemann2002` lines 46–50: exactly two handlebodies of each genus, by sliding over a non-orientable handle) and 2.1 (line 88, from Moise's triangulation); 9.2 Li Theorems 1.1 and 1.2 (`li2013` lines 66–74). All read as the README states. 8.1, 8.4, 11.2 and 11.4 were in the r58 sample and are byte-identical; 2.3, 4.4, 10.1 and 12.2 cite Brown 1962, Lickorish, Calegari and Rourke–Sanderson, under Not verifiable. The native names of the sampled sections resolve at the pin: `isLocallyFlat_iff_isEmbedding_and_isLocallyBicollared` (`LocallyFlat/Sphere.lean`), `IsLocallyBicollaredWithSides.exists_isBicollar` (`LocallyFlat/Separation.lean`), `BrownBicollaring` (`Sphere.lean:74`), `brownBicollaring` (`Brown.lean:39`), `IsLocallyCollared.isCollared` (`Collar/Brown.lean`), `WatanabeTheorem` (`Diffeomorphism/Disc.lean:77`) with `not_contractibleSpace_discDiff_four`, `SmaleConjecture` (`Smale.lean:46`), `PLGroupoid_le_continuousGroupoid` (`PLGroupoid/Basic.lean`), `doubleRight` (`PLGroupoid/Basic.lean:162`, `x ↦ x` for `x ≤ 0` and `2x` otherwise, as 12.2's Check says), `LensSpace.fundamentalGroupMulEquiv`, `card_fundamentalGroup`, `eq_of_homeomorph` (`UniversalCover/LensSpace/FundamentalGroup.lean:73, 104, 126`), `Foliation.ofSubmodule` (`Foliation/Basic.lean:93`), `IsContMDiffDistribution`, `signature_enlargeColumn`, `signature_trefoilSeifertMatrix`, `sliceGenus` (`Slice/Genus.lean:303`), `IsSmoothlySlice` (`Slice/Basic.lean:151`), `IsTopologicallySlice` (`:317`), `SmoothCircleEmbedding` (`SmoothCircle.lean:121`), `UnorientedSmoothCircleEmbedding`, `SmoothLinkEmbedding` (`SmoothLink/Basic.lean:61`), `unknot` (`SmoothCircle.lean:294`), `CoboundAnnulus` (`Annulus.lean:91`), `AnnulusConjecture` (`:105`), `filledHull` (`Topology/FilledHull.lean:99`), `SolidTorus` (`SeifertFibration.lean:78`), `IsHyperbolic` (`Riemannian/Hyperbolic.lean:70`), `MarkovEquiv` (`Markov/Basic.lean:213`), `BraidWord.closure` (`BraidWord/PDCode.lean:390`).

**Ownership.** `roadmaps grep` for the native names of R01–R06 over the open heads and main finds them nowhere except the old field-list README of this roadmap on main and in older pull requests; no open `Suggested.lean` the brief lists declares a `TauCetiRoadmap.GeometricTopology.*` name. Ownership against open pull requests whose files the brief does not give was not checked.

**The `*Needs:*` graph** is unchanged from the previous report (85 section edges, 0 cycles, order 1, 2, 3, 11, 4, 6, 5, 7, 8, 9, 10, 12); the repairs above change citations, not edges.

**Adversarial table.** Rows A1–A51 are carried from the previous reports for the statements the diff leaves untouched, with their values; A33 is the row this review overturns. A52–A66 are this round's computations on the native statements against the README's.

| # | Statement or object | Instances tried | Values on each side | Result / change |
|---|---|---|---|---|
| A1 (r55) | Connected-sum orientation (1.4) | `n = 1`, `S¹`; `ℂP²` | boundary orientations `−e₁(∂D)`, `+e₂(∂D)`; forms `⟨1⟩ ⊕ ⟨1⟩` (sig `2`) vs `⟨1⟩ ⊕ ⟨−1⟩` (sig `0`) | sound |
| A2 (r55) | PL local flatness by dimension (2.2) | `m = 2, 3, 4, 5` | link pairs `(S¹,S⁰)`, `(S²,S¹)`, `(S³,S²)` standard; `(S⁴,S³)` open | sound |
| A3 (r55) | Reidemeister with relabelling (4.3) | `(U, T)` vs `(T, U)` | `Δ = 1` vs `t − 1 + t⁻¹` on component `0`; isotopic after `relabel swap` | sound |
| A4 (r55) | `jonesTrace = δ · bracket` (4.5) | one strand; `σ₀³` | `δ` vs `δ·1`; `δ(a⁻⁴ + a⁻¹² − a⁻¹⁶)` both sides | sound |
| A5 (r55) | Framing change `(p − kq)/q` (5.2) | `k = 6` | `−6` vs `+6` for the wrong sign | sound |
| A6 (r55) | Lens dictionary (5.3) | `p/q = 2/1, 5/2, 1/n, 0, ∞` | `L(2,1) = ℝP³`, `H₁ = ℤ/2`; `S³`, `S¹ × S²`, `S³` | sound |
| A7 (r55) | Lens classification (5.3) | `(5,1),(5,2)`; `(7,1),(7,6)`; `(5,2),(5,3)` | distinct; same; same | sound |
| A8 (r55) | `Diff⁺` via degree (3.1) | `S¹` reflection; `S¹ ⊔ S¹` swap | degree `−1`; no degree | sound |
| A9 (r55) | Weeks `H₁` (7.3) | slopes `(5,1),(5,2)` | coker `diag(5,5) = (ℤ/5)²` | sound |
| A10 (r55) | Norm attained without spheres (10.3) | `S² × S¹`, `a = [S² × pt]` | `x(a) = 0`; no incompressible torus (`ℤ² → ℤ`) | repaired at 9b5d2c8 |
| A11 (r55) | Seminorm vs norm (10.3) | `S² × S¹`; `Σ₂ × S¹` | `x = 0` on a nonzero class; `x([Σ₂]) = 2` | sound |
| A12 (r55) | `*Needs:*` graph | every edge | 4.4 ↔ 6.1; 7.2 ↔ 8.1; Layer 5 → 8 → 7 → 5 | repaired at 9b5d2c8 |
| A13 (r55) | Aspherical form of Agol (7.4) | closed aspherical | agol2013 line 27 | sound |
| A14 (r55) | Parity of Euler classes (10.2, 10.4) | `TS²`; Hopf | `2g`; `±g` not a plane field | sound |
| A15 (r55) | Poincaré route (8.4) | `S³`; `L(p,q)`; Poincaré sphere | `π₁ = 1`; `ℤ/p`; order `120` | sound |
| A16 (r55) | Heegaard genus vs rank (9.2) | `S³`, `L(p,q)`, `T³`, Poincaré sphere | `0=0`, `1=1`, `3=3`, `2=2` | sound; now also native (A61) |
| A17 (r55) | Manolescu universe (11.2) | compact `X` on an uncountable vertex type | finitely many open simplices meet `X`; relabel to `Fin k` | sound |
| A18 (r55) | Sphere volumes (7.1) | `n = 1, 2, 3` | `2π`, `4π`, `2π²` | sound |
| A19 (r55) | Unlink and Hopf Jones values (4.5) | `c = 2`; positive Hopf | `−(t^{1/2} + t^{−1/2})`; `−t^{1/2} − t^{5/2}` | sound |
| A20 (r55) | Property P, R, Gordon–Luecke (5.4) | unknot; trefoil `+1`, `0` | `S³_U(1) = S³` excluded; order `120`; torus bundle | sound; now statable (A59, A60) |
| A21 (r55) | Kirby–Siebenmann deferral (Scope) | owners on main and open heads | none; FourManifolds asks GeometricTopology | repaired at 9b5d2c8 |
| A22 (r55) | Kirby 4.126 as `Diff(D⁴, ∂)` | kirby1997 7507–7512 | (C) iff `Diff(D⁴, ∂D⁴)` contractible | sound (reopened this round) |
| A23 (r55) | Dunce hat (11.4) | edges after identification | no free face; contractible | sound |
| A24 (r55) | Neat Check (2.1) | `[0,1] → [0,1] × S¹` | `f⁻¹(∂M) = {0,1} = ∂N` | sound |
| A25 (r55) | `E₈` manifold (12.3) | form | signature `8`; not triangulable | sound |
| A26 (r55) | Cone on a polygon (2.2) | trefoil; unknot | `⟨x,y ∣ x² = y³⟩ ↠ S₃` vs `ℤ` | sound |
| A27 (r55) | Torus triangulation bound (12.1) | `V − E + F = 0`, `3F = 2E` | `V ≥ 7`; `9`-vertex grid | sound |
| A28 (r55) | `IsClosedConnectedManifold` (11.2) | pin | five conjuncts at `Manifold/Basic.lean:57` | sound |
| A29 (r55) | Signature function of `T` (6.2) | `θ = π`; `≈ 53°`; `π/3 ± ε` | `−2`; `0`; `0`, `−2` | sound |
| A30 (r55) | Concordance group (6.1) | `T # −T`; `T # T`; `E` | slice; `σ = −4`; order `2` | sound |
| A31 (r55) | Prime decomposition (8.2) | `S¹ × S²`; `L(2,1) # L(3,1)` | prime, not irreducible; `C₂ * C₃` | sound; now native (A54) |
| A32 (r55) | Geometric structures (8.1) | `E³/ℤ³`; `E³/{±I}`; `S² × S¹` | `T³`; cone on `ℝP²` excluded; not spherical | sound |
| A33 (r55) | Statable headlines | 12 stated; 8 named not statable | each missing carrier absent at pin 358314d4 | **overturned at pin 2fd255d9**: seven carriers exist (R01–R06); Reidemeister's theorem and the Alexander agreement still lack theirs (`PDCode/Alexander/SeifertMatrix.lean` isolates the algebra only) |
| A34 (r56) | Markov statement at the pin | `n = m = 0`; `σ₀` on `2` strands vs empty word | both sides reflexive; `markovEquiv_sigma_last_one_one`; Reidemeister-I kink | consistent |
| A35 (r56) | Markov, negative control | trivial words on `m + 1 ≠ n + 1` strands | left false (`not_markovEquiv_one_of_ne`); right false (component count) | consistent |
| A36 (r56) | Manolescu at the pin | `n = 5`; `n = 4` | `IsTriangulable.{0}` at `Triangulable/Basic.lean:38`; `n = 4` claims nothing | consistent |
| A37 (r57) | Slice-genus invariance and subadditivity (6.1) | `T`, `−T`, `T # −T`; `E # E` | `g_s(T) = 1`, `g_s(T # −T) = 0 ≤ 2`; `g_s(E # E) = 0 ≤ 2` | consistent |
| A38 (r57) | Attainment bullet (10.3) | `Σ₂ × S¹`; `S² × S¹`; `a = 0` | `x = 2` attained by `Σ₂ × pt`; `x = 0` by `S² × pt`; the empty surface | consistent |
| A39 (r57) | `S² × S¹` Check wording | the tubed sphere `T` | `χ₋(T) = 0 = x(a)`; `T` compressible | repaired at ac5a1c0 |
| A40 (r57) | `*Needs:*` graph after r57 | all sections, 12 Dependencies paragraphs | 0 cycles; Layer 10 induced {2, 5, 7, 8} | repaired at ac5a1c0 |
| A41 (r57) | `IsHyperbolic ↔ HasGeometricStructure hyperbolic` | 7.2 and 8.1 | stated once, in 8.1 | consistent |
| A42 (r57) | Kirby–Siebenmann owner (Scope) | FourManifolds open head; merge order | gap slug at FourManifolds `README.md:209`; Part II owner | consistent |
| A43 (r57) | 7.4's fibre is incompressible | genus `≥ 1` fibre; `S²` fibre | `π₁(F) → π₁(M)` injective; `S²` excluded | consistent |
| A44 (r57) | 5.4 `*Needs:*` | Akbulut–Kirby; Property P's two routes | concordance from 6.1; both routes named | consistent |
| A45 (r57) | 4.4 after the move | `g_s(mirror K)`, `g_s(K.reverse)` | reflection of `D⁴` and reversal keep the genus | consistent |
| A46 (r57) | Eight replaced paths | each path at pin 2fd255d9 | all exist | consistent |
| A47 (r58) | `S² × S¹` Check, amended (10.3) | tubed sphere `T` with annulus `A` | `χ(T) = 2 − 2 + 0 = 0`, `χ₋(T) = 0 = x(a)`, `[T] = a ≠ 0`; compressible along the meridian disc; tori `ℤ² → ℤ` never injective | consistent |
| A48 (r58) | Layer 10 Dependencies | 10.1–10.4 `*Needs:*`; Layer 8's | induced {2, 5, 7, 8} = paragraph; Layer 8 → {1, 2, 7, 11}; 85 edges, 0 cycles | consistent |
| A49 (r58) | Livingston 9.5 locator (6.1) | `livingston2005` 815–817; 32–34 | `g₄` a concordance invariant `≤ g₃`; smooth standing category | consistent |
| A50 (r58) | Subadditivity of `g_s` (6.1) | `U # U`; `T # −T`; `T # T` | `0 ≤ 0`; `0 ≤ 2`; `2 = 1 + 1` sharp | consistent |
| A51 (r58) | References bullet for Livingston | the README's citations | Sections 2, 3.1, 9.5 cited and listed | consistent |
| A52 | Li's theorem, native vs README (9.2) | `n = 0`; `n = k − 1` for `k ≥ 1`; `S³` | native `rank + n < heegaardGenus` for every `n`; README `g − rank ≥ k` for every `k`: `k = 0` is `rank ≤ g`, otherwise `n = k − 1`, equivalent; `S³`: `0 = 0` (`exists_heegaardGenus_sphere_eq_rank`) | consistent; R01 |
| A53 | Cerf, native vs README (3.3) | identity; the reflection `orthogonalDiagonalReflection` | native: every `f` joined to an orthogonal `A`; `A = I` and `A = diag(−1,1,1,1)` give the two classes, so `#π₀ = 2` (`cerfTheorem_iff_natCard_zerothHomotopy_eq_two`); README `π₀(Diff⁺) = 0`, `π₀(Diff) ≅ ℤ/2` | consistent; R02 |
| A54 | Primeness and decomposition, native vs README (8.2) | `S³`; `S¹ × S²`; `L(2,1) # L(3,1)` | native: `S³` not prime (first conjunct) and `IsIteratedConnectedSum` with `k = 0`; README "`n = 0` for `S³`"; `S¹ × S²` prime on both sides; two factors, `C₂ * C₃` | consistent; R03 |
| A55 | Milnor uniqueness, native vs README | `k = 2`, `l = 2`, factors swapped | native `σ : Fin 2 ≃ Fin 2` with `P i ≃ Q (σ i)`; README "same multiset up to diffeomorphism" | consistent; R03 |
| A56 | Minimal volume, native vs README (7.3) | `M = W`; `M` the figure-eight filling | native `hypVol(gW) ≤ hypVol(g)`, equality iff homeomorphic to `W`; README "at least `0.9427…`, equality only for `W`"; `2.0299… > 0.9427…` | consistent; R05 |
| A57 | Thurston's inequality, native vs README (10.4) | `S² × S¹` product foliation; `Σ₂ × S¹` | native quantifies over surfaces with `χ ≤ 0`, so `S² × pt` (`χ = 2`) is not tested and the hyperbolic hypothesis excludes `S² × S¹` anyway; README's irreducible form excludes it too; `Σ₂ × pt`: `|−2| ≤ 2` both sides | native is the hyperbolic special case; R06 |
| A58 | Yazdi, native vs README and source | one `M` vs infinitely many | native `∃ M, ∃ e, Even e ∧ EulerClassNormOne e ∧ ∀ F taut, ¬ IsEulerClass e`; `yazdi2016` line 111 "infinitely many"; README "infinitely many" | native weaker; README keeps the stronger target; R06 |
| A59 | Property P on `DehnFilling` | unknot, `s = meridian`; trefoil, `s = +1` | `meridianDehnFilling` gives `S³` with `π₁ = 1`, excluded by `hs`; `+1` on the trefoil: order `120` (A20) | statable; R04 |
| A60 | Property R on `DehnFilling` | unknot, longitude | `nonempty_homeomorph_circle_prod_sphere_of_unknot_longitude` gives `S¹ × S²`, excluded by `hK`; `value_longitude = 0` fixes the slope | statable; R04 |
| A61 | Heegaard genus values, native | `S³`; `L(p,q)`, `p ≠ 1`; `S¹ × S²`; `L(1, q)` | `heegaardGenus_sphere = 0`; `LensSpace.heegaardGenus_eq_one (hm : m ≠ 1) = 1`; `heegaardGenus_circle_prod_sphere = 1`; `m = 1` is `S³`, genus `0`, correctly excluded by `hm` | consistent with 9.2's Checks; R01 |
| A62 | Native splitting vs README's gluing definition (9.1) | `ℝP² × S¹` | native pieces are homeomorphic to `handlebody g`, orientable, so no native splitting exists; README's `H_g^−` splitting exists | README's variant is wider; kept, stated as such; R01 |
| A63 | Lens-space filling sign (5.3) | `p/q = 5/2` | native `unknotLensSpaceDehnFilling`: `L(5; ℓ₀, −2ℓ₀) = L(5, −2) = L(5, 3)`; README `L(5, 2)`; `3 ≡ 2⁻¹ (mod 5)`, homeomorphic with orientation ignored (A7) | consistent under "orientation ignored"; convention recorded in R04 |
| A64 | Tautness, native vs README (10.1) | Reeb foliation of `S³`; product foliation `Σ × S¹` | native: every leaf meets a `C¹` closed transversal; the torus leaf of a Reeb component meets none (either side spirals), so not taut on both sides; `pt × S¹` meets every leaf | consistent (`C¹` vs smooth transversal noted); R06 |
| A65 | Euler class, native vs README (10.2) | trivial plane bundle; opposite orientation | `eulerClass_eq_zero_of_forall_ne_zero`: `e = 0`; `IsEulerClass.neg`: `−e`; README `e(trivial) = 0`, `e(Ē) = −e(E)` | consistent; R06 |
| A66 | Weeks manifold, native vs README (7.3) | the coefficients | native `![5, 5/2]` on `whiteheadLink`; README "the `(5, 1), (5, 2)` filling" | consistent; R05 |

**Headline inventory at this pin.** Twelve headlines stated (annulus, Smale, Watanabe, Markov, Freedman, Mostow, both Agol theorems, JSJ, geometrization, Poincaré, Manolescu). Statable and absent: Li, Cerf, Kneser, Milnor, the minimal volume theorem, Thurston's inequality, Yazdi, Property P, Property R (R01–R06). Still not statable: Reidemeister's theorem (no diagram of a generic projection) and the agreement of the three Alexander routes (`PDCode/Alexander/SeifertMatrix.lean` relates a diagram's elementary ideal to a Seifert matrix only under a hypothesised presentation; no Seifert matrix of a diagram). Zeeman's conjecture is open and recorded, not stated.

## Not verifiable

- Thurston, *A norm for the homology of 3-manifolds* (`thurston1986`, settled uncertified): the Section 3 locator of 10.4 is carried as the README states it.
- Brown, *Locally flat imbeddings of topological manifolds*, Ann. of Math. 75 (1962) (2.3): not in the cache and behind JSTOR; cited by its theorem numbers.
- Lickorish, *An Introduction to Knot Theory*, Chapters 2, 8 and 16 (4.4, 6.2, the Markov docstring); Rolfsen, *Knots and Links* (4.1, 5.2, 5.3); Calegari, *Foliations and the Geometry of 3-Manifolds* (10.1): in copyright, not readable here.
- Rourke–Sanderson (`rourke-sanderson1972`, settled uncertified) for 12.2.
- Cerf, LNM 53 (3.3): not readable here; the statement is checked against the native `CerfTheorem` instead.

## Source issues

- none
