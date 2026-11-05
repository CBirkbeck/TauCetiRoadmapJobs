<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1082#issuecomment-6418344289 -->
Red team round 1 pass b (claude) of a7c1e22

Verdict: needs changes

1. **F01** (P2) Two statable headlines absent: fibre-graph descent (§4.8(i)) and rational image points (§4.9)

   Location: `Suggested.lean:19–20` (module docstring: "Negative-curve, fibre-graph and label descent and rationality of reducible-fibre image points lack that pairing and the proper Hilbert algebraic space"); README §4.8 line 860, §4.9 line 874; Summary line 3 lists "descent of surface fibre graphs" among the end theorems.

   Claim: the two statements are not statable at the pins because the geometric intersection pairing and the proper Hilbert space are missing.

   Witness: the intersection pairing and the Hilbert space enter only the proof route of §4.8/§4.9, not their statements. Every carrier of the statements exists: `AlgebraicGeometry.Smooth` (`Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:59`), `IsProper`, `Scheme.Hom.fiber`/`fiberι` (`Mathlib/AlgebraicGeometry/Fiber.lean:37,40`), `IsAlgClosed`, `topologicalKrullDim`, `irreducibleComponents`, `IsIso (s.app ⊤)` for H⁰(S,O_S)=k, `IsLocalRing.closedPoint`, `Scheme.fromSpecResidueField` (`ResidueField.lean:237`), and the file's own `componentGraph`, `HasTrivialNumericalGaloisAction`, `IsContraction`. The file already states §4.2 with exactly this vocabulary (`Suggested.lean:213–222`).

   Repair (add to Layer 4 of `Suggested.lean`, and replace the docstring sentence at lines 19–20 by "Negative-curve descent and label descent lack the geometric intersection pairing; the fibre-graph and rationality headlines are stated below."):

   ```lean
   /-- Schröer, Theorem 2.1(i): for a smooth proper surface `S` over `k` with `H⁰(S,O_S) = k`
   and constant numerical local system, a contraction `f : S → Z` and a geometric point
   `ā : Spec Ω → Z` whose geometric fibre is one-dimensional, the component graph of the
   geometric fibre is isomorphic to that of the schematic fibre over the image point `a`,
   each geometric component going to the closure of its image in `S`. -/
   theorem fibreComponentGraph_descends_of_constantNumericalClasses
       (k K : Type u) [Field k] [Field K] [Algebra k K] [IsAlgClosure k K]
       (S : Scheme.{u}) (s : S ⟶ Spec (CommRingCat.of k)) [IsProper s] [Smooth s]
       (hsurf : ∀ C : Set S, C ∈ irreducibleComponents S → topologicalKrullDim C = 2)
       (hconst : IsIso (s.app ⊤))
       (hnum : HasTrivialNumericalGaloisAction k K S s)
       (Z : Scheme.{u}) (z : Z ⟶ Spec (CommRingCat.of k)) [IsProper z]
       (f : S ⟶ Z) (hf : IsContraction f) (hfz : f ≫ z = s)
       (Ω : Type u) [Field Ω] [IsAlgClosed Ω] (ā : Spec (CommRingCat.of Ω) ⟶ Z)
       (hfib : topologicalKrullDim (pullback f ā) = 1) :
       let a : Z := ā (IsLocalRing.closedPoint Ω)
       ∃ e : componentGraph (pullback f ā) ≃g componentGraph (f.fiber a),
         ∀ C, closure ((pullback.fst f ā) '' C.1) = (f.fiberι a) '' (e C).1 := by
     sorry

   /-- §4.9: under the same hypotheses, if the one-dimensional geometric fibre is reducible,
   the image point is `k`-rational. -/
   theorem imagePoint_rational_of_reducible_geometricFibre
       (k K : Type u) [Field k] [Field K] [Algebra k K] [IsAlgClosure k K]
       (S : Scheme.{u}) (s : S ⟶ Spec (CommRingCat.of k)) [IsProper s] [Smooth s]
       (hsurf : ∀ C : Set S, C ∈ irreducibleComponents S → topologicalKrullDim C = 2)
       (hconst : IsIso (s.app ⊤))
       (hnum : HasTrivialNumericalGaloisAction k K S s)
       (Z : Scheme.{u}) (z : Z ⟶ Spec (CommRingCat.of k)) [IsProper z]
       (f : S ⟶ Z) (hf : IsContraction f) (hfz : f ≫ z = s)
       (Ω : Type u) [Field Ω] [IsAlgClosed Ω] (ā : Spec (CommRingCat.of Ω) ⟶ Z)
       (hfib : topologicalKrullDim (pullback f ā) = 1)
       (hred : ¬ IrreducibleSpace (pullback f ā)) :
       IsIso (Z.fromSpecResidueField (ā (IsLocalRing.closedPoint Ω)) ≫ z) := by
     sorry
   ```

   Tested on the refuting instances of the README: for S = P¹_ℂ over ℝ, `hconst` fails (H⁰ = ℂ) and `hnum` fails (swap on ℤ²), so the conic-bundle counterexample of §4.8's second Check is excluded by the hypotheses; for the blow-up of a k-point on a smooth fibre both graphs have two vertices and one edge and `e` is the projection-induced identity (§4.8 third Check). The README keeps §4.8 and §4.9 unchanged; add both names to the list at README line 91.

2. **F02** (P3) Docstrings name proof ingredients, not the missing carrier, for §3.7; Keel's field hypothesis unmentioned

   Location: `Suggested.lean:13–15` ("projective contraction descent lack relative global generation, the section algebra and relative Proj"); `Suggested.lean:151–152` (docstring of `numericallyTrivial_torsion_of_algebraic_finiteField`).

   Claim: §3.7 is unstatable for lack of global generation, section algebras and relative Proj; the torsion headline is Keel's Lemma 2.16 extended from projective to proper.

   Witness: the statement of §3.7 needs only "Ȳ projective over K"; what pinned Mathlib lacks is any projective-morphism or projective-space predicate (only absolute `Proj`, `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Scheme.lean:854`; no `IsProjective`, no ample). KEE99 line 677 states Lemma 2.16 only over the algebraic closure of a finite field; the headline is over every algebraic extension of 𝔽_p, which the README's §2.12 route obtains by spreading out to a finite subfield.

   Repair: line 13–15 → "Projective contraction descent lacks a projectivity predicate for the target (Mathlib has only absolute `Proj`); the semiample contraction dictionary and numerical uniqueness lack relative global generation, the section algebra and relative Proj." Line 151–152 → "Keel, Lemma 2.16, stated there over the algebraic closure of a finite field for projective schemes; extended here to every algebraic extension of 𝔽_p by spreading out to a finite subfield, and to proper schemes by the proper finite-type numerical Picard component."

3. **F03** (P3) Tau Ceti carriers for the radical quotient, the nondegenerate pairing and the support graph are re-derived instead of cited

   Location: README line 9 ("generic quotient factorization ... consumed through the exact declarations below"), lines 37–39 (From Tau Ceti), §1.4 lines 286–292, §4.6 line 832.

   Claim: Num(X/S), N₁(X/S) and the perfect pairing are built here; the "From Tau Ceti" contract lists no quotient declaration.

   Witness: `TauCeti/LinearAlgebra/SesquilinearForm/NumericalQuotient/Basic.lean` at the pin: `TauCeti.biadditiveToIntBilinear` (:66), `leftRadical`/`rightRadical` (:90, :96), `LeftNumericalQuotient`/`RightNumericalQuotient` (:138, :141), `numericalPairing` (:273), `numericalPairing_nondegenerate` (:317). This is exactly §1.4's "N₁ := Z₁ modulo the cycles pairing to zero" and "nondegenerate on both sides" for the ℤ-biadditive degree pairing Pic(X) × Z₁(X/S) → ℤ. `TauCeti/AlgebraicGeometry/Curves/StableReduction/NumericalType/Topology.lean:46,65` (`intersectionGraph`, `intersectionGraph_connected`) is the support graph whose connectedness §4.6's route invokes ("the contraction condition makes the support graph connected").

   Repair: in "From Tau Ceti" add "Consume `TauCeti.biadditiveToIntBilinear`, `TauCeti.leftRadical`, `TauCeti.rightRadical`, `TauCeti.LeftNumericalQuotient`, `TauCeti.RightNumericalQuotient`, `TauCeti.numericalPairing` and `TauCeti.numericalPairing_nondegenerate` from `TauCeti/LinearAlgebra/SesquilinearForm/NumericalQuotient/Basic.lean` for the two radical quotients of the degree pairing and its induced nondegenerate pairing; §0.5 identifies the left radical with Pic^τ(X/S). Consume `TauCeti.NumericalType.intersectionGraph` and `intersectionGraph_connected` from `.../NumericalType/Topology.lean` for the support graph of a fibre." In §1.4's route replace "so the pairing N¹(X/S) × N₁(X/S) → ℝ is nondegenerate on both sides" by "so N₁(X/S) is the right numerical quotient and the pairing is `numericalPairing_nondegenerate` tensored with ℝ". `Suggested.lean` is unchanged (`numericallyTrivialClasses` is the statement-level carrier; §0.4 makes it the radical).

4. **F04** (P3) Supplier §4.9 is stated for Noetherian schemes; §3.1 cites it for locally Noetherian targets

   Location: README §3.1 lines 594, 600, 603, 606 ("For locally Noetherian Y ...", "(SchemeAndStackFoundations §4.9)").

   Witness: `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5472–5476` `stein_factorization`: f a proper morphism of Noetherian schemes.

   Repair: in §3.1 after "Every fibre of a contraction to a locally Noetherian Y is geometrically connected (SchemeAndStackFoundations §4.9)" add "applied over an affine open cover of Y, since f_*O_X and the Stein factorisation are local on Y"; same clause for the factorisation bullet at line 603.

5. **F05** (P3) Two locators that do not state the cited claim

   Location: README §0.4 line 153 ("WIT22, §2, p. 7; WIT22 line 319") cited for the definition of L ≡_f 0; §0.3 line 140 ("KLE05, Exercise 6.11, Proposition 6.12 and Remark 6.14 ...; Theorem 6.3") cited for field-extension invariance of numerical triviality.

   Witness: WIT22 line 319 defines relative nefness; "numerically trivial" occurs in WIT22 only inside the proof of Proposition 5.3 (lines 1524–1526) and is never defined. KLE05 lines 2721–2775 give the compatibility of Pic^τ with field extension (Prop 6.12) and τ ⟺ numerically trivial over an algebraically closed field (Thm 6.3, projective; Rem 6.14, complete); the equivalence "numerically trivial over k iff over K" for arbitrary K/k is not stated there (Kleiman's Def 6.1, line 2480, is numerical equivalence via c₁-integrals, not a field-extension statement).

   Repair: §0.4: delete "WIT22, §2, p. 7; WIT22 line 319" (keep it in §1.5, where it is correct). §0.3: replace the KLE05 locator by "(KLE05, Proposition 6.12, p. 57, KLE05 line 2724, for compatibility of Pic^τ with field extension, and Theorem 6.3(b) with Remark 6.14, pp. 52–58, KLE05 lines 2498 and 2754, for the geometric case; the equivalence for an arbitrary extension is proved here)".

6. **F06** (P3) Downstream paragraph does not match the siblings' heads; later pull requests re-plan objects owned here and address a supplier that does not exist

   Location: README line 1066 ("EnriquesSurfacesAndIntegralNonexistence uses Layers 2–4 ...; K3SurfacesAndSymplecticBoundedness uses the arbitrary-field numerical lattice ..."); §3.3 line 634.

   Claim: the two named roadmaps consume this roadmap's Layers 0–4.

   Witness (merge order: this roadmap 47; K3SurfacesAndSymplecticBoundedness 48; NeronModelsAndSemistableAbelianVarietiesPartII 62; WeilConjectures 146; EnriquesSurfacesAndIntegralNonexistence 147 — all later, so this roadmap is the earliest owner of every object below):
   - `TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/README.md:81–83` (head of its pull request) declares `gap:numerical-contraction-descent` on "SchemeAndStackFoundations Part II §numerical-contraction-descent": the arbitrary-field numerical quotient, base change, descent of projective contractions under constant Num, fibre-graph descent, label preservation and the residue-field assertion (SCH23 Theorems 1.3 and 2.1) — the content of §§1.1, 1.3, 3.7, 4.8–4.10 here. No SchemeAndStackFoundations Part II exists on main, among the open pull requests, or on the board (only a `reports/` directory).
   - `.../EnriquesSurfacesAndIntegralNonexistence/README.md:91` declares `gap:picard-flatness-betti` on "AlgebraicModuliForArithmeticGeometry Part II §picard-deformations" (relative Picard flatness when b₁ = 2(h¹ − h²); proper flat identity-component scheme and finite-flat specialisation over a Henselian base): this roadmap has no such section or target.
   - `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:98` declares `gap:surface-arithmetic-quotient` on "SchemeAndStackFoundations Part II §surface-numerical-base-change": the arbitrary-field numerical quotient with base-field comparison — §§0.3, 1.1 here.
   - WeilConjectures (open pull request, README section "Numerical divisor descent and surface invariant comparisons", lines 1416–1434 at its head) builds `numericalPicardLocalSystem(X/k)`, constancy, finite rank, torsion-freeness, norms and the Lemma 1.1 positive-multiple descent (`numericalPicard_baseDivisorDescent`) from SchemeAndStackFoundations §5.10 — §§1.2, 2.6–2.8, 2.10 here, without citing this roadmap.
   - NeronModelsAndSemistableAbelianVarietiesPartII (open pull request, README §2.9, lines 4058–4103 at its head) states the finite-field genus-one-fibration case of §§4.7–4.10 (fibre graphs with labels, rational base point, uniqueness of negative component classes), citing SCH23 Theorem 2.1, and is what EnriquesSurfacesAndIntegralNonexistence actually consumes (its §4.7).

   This roadmap is the owner: it is earliest in the merge order and states the general forms; the four later roadmaps must be repointed to it (a board action, not a change here). Changes here: (1) replace line 1066 by "EnriquesSurfacesAndIntegralNonexistence, K3SurfacesAndSymplecticBoundedness, WeilConjectures and NeronModelsAndSemistableAbelianVarietiesPartII restate special cases of §§0.3, 1.1–1.3, 2.6–2.10, 3.7 and 4.7–4.10 (finite fields, K3 and Enriques surfaces, genus-one fibrations) or request them from a 'SchemeAndStackFoundations Part II'; the arbitrary-field and relative statements are owned here and those requests are to be repointed to the sections named. EnriquesSurfacesAndIntegralNonexistence also requests relative Picard flatness under b₁ = 2(h¹ − h²) over a Henselian base from this roadmap; that is not a target here." (2) Add to §3.3's API bullets, parallel to §1.5's last bullet: "For S = Spec k, k algebraically closed of characteristic zero and X a projective variety, semiampleness is AbundanceStatement Layer 5's semiampleness." If the repair worker chooses to serve the Enriques request, the target belongs after §2.5 with hypotheses: Y smooth proper geometrically connected over an algebraically closed field of characteristic p > 0, 𝒴 → Spec A proper flat with A local Noetherian over W(k) and closed fibre Y, b₁(Y) = 2(h¹(O_Y) − h²(O_Y)); conclusion: Pic_{𝒴/A} flat over A (DI21 is not in `sources.toml`; it would have to be fetched).

Files reviewed in full: `packages/AlgebraicModuliForArithmeticGeometryPartII/README.md` (1094 lines, 51 targets), `Suggested.lean` (247 lines, 7 definitions, 7 admitted headlines), `design/plan.json` (gaps, sourceIssues), `sources.toml`, the three repair reports. Read-only; no Lean was elaborated (see Not verifiable). Mathlib and Tau Ceti were read at the pins of `lake-manifest.json` (6b7abb3c, a91d3aaf) in a local checkout verified by `git rev-parse`.

## Verified sound

- Declarations read: 14 of 14 in `Suggested.lean`; signatures compared binder by binder with README §§0.4, 1.1–1.3, 2.7, 2.10, 2.12, 3.1, 3.6, 4.1, 4.2, 5.3. Section `variable`s: none (every binder is explicit in each signature), so no hypothesis can be dropped by a `def`. `IsPurelyInseparable`, `IsAlgClosure`, `IsAdicComplete (maximalIdeal R) R`, `[IsNoetherian S]`, `[Flat x]`, `Algebra.IsAlgebraic (ZMod p) k` each match the README's generality. Coercions: `Scheme.Modules.Cohomology ((trivial X₀).obj) 2` parses as `Cohomology M 2` (an `abbrev … : Type u`, `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61`), so `Subsingleton` of it is the vanishing of H²; `eulerDegree` is `InvertibleSheaf.eulerDegree (k) [X.Over (Spec (.of k))]` (`LineBundle/Degree.lean:70`) with no properness in the definition, exactly as the README's Tau Ceti contract says; `fiberToSpecResidueField` is literally `pullback.snd` (`Fiber.lean:45–47`), so the `inferInstanceAs` instance is the pinned `Proper.lean:82`.
- Targets read: 51 of 51; every target has a locator; `theorem` only; no `set_option`; no pull-request numbers or process words; the diff touches only the package folder.
- Pinned library claims checked: 12 Mathlib file:line claims (Proper.lean:41, :82; Flat.lean:42; PicardGroup.lean:545; PurelyInseparable/Basic.lean:107; Finrank.lean:61; FlatRank.lean:88; Action/Defs.lean:346; Fiber.lean:37–46; Noetherian.lean:277; QuotientGroup/Defs.lean; Kernels.lean) all correct; 9 Tau Ceti declarations (`InvertibleSheaf`, `trivial`, `LineBundleClass`, `mk`, CommGroup instance, `pullback` functor, both `eulerDegree`s, `eulerDegree_eq_relativeDegree` with its DVR-stalk and finite-H¹ hypotheses, `eulerDegree_mul` at EulerCharacteristic.lean:343, the two `NegSemidef.lean` lemmas at :91 and :104, `sum_sum_intersection_mul_neg` at IntersectionForm.lean:163) exist with the hypotheses the README states. No numerical triviality, nef, semiample, ample, projective, Picard scheme, Hilbert scheme, Stein factorisation or contraction predicate exists at either pin (only `rigidifiedPicardFunctor`, which needs a section), so the remaining "not statable" entries of the docstring are justified.
- Sibling citations checked: 58 (SchemeAndStackFoundations §§0.9, 0.11, 0.23, 1.1–1.11, 2.1–2.2, 2.6, 2.10–2.11, 2.15 `etale_galois_comparison`, 2.22, 3.4–3.5 `lineBundleNorm`, 4.9, 4.10, 4.12, 5.2, 5.3 `c1_degree_curve`/`proper_pushforward`, 5.9, 5.10 `Num.free_finiteRank`; JacobianChallenge A–D; StableReduction 1, 2 incl. J-A2, 4; AlgebraicVectorBundles L0A–L1B; EtaleCohomologyFoundations §F.3; AlgebraicModuliForArithmeticGeometry §§1.4–1.6 `bigLineBundle`/`boundedSupportParameters`, 2.1, Layer 3, 7.3 `picard_infinitesimal_lifting`, 7.6.1–7.6.1a, 7.9; ComplexComparisonPartII §§C3.2d.2, C3.2d.4, C3.2e, C3.2f.1–2; AbundanceStatement 4A–4D, 5; ResolutionOfSingularitiesCharacteristicZero §7.8) all exist at main or at the open head with the hypotheses the consumer attributes to them, except R04. The six declared gaps have the same slugs in `plan.json` and the README, named suppliers, and ask for nothing provided at the pins or by the cited sections (§5.3 has no nef-and-big statement, §5.9 no exceptional-divisor content, the parent's `bigLineBundle` API has no top-intersection criterion). `depcheck`: "56 roadmaps, 642 edges, 0 problem(s)"; resolver: nothing missing. AbundanceStatement is another author's open pull request adding a new folder (allowed; not in the merge order).
- Locators verified against the cached texts: 46 (every SCH23, KLE05, BMP23, HW23, WIT22, KEE99, DW22, CT20, AHK07, LIP69, EGA-IV3, STACKS, LMFDB11 and PS12 locator of the README). All claimed line numbers point at the cited item, with two harmless imprecisions: KLE05 line 2793 is inside the proof of Theorem 6.16 (statement at 2782), and SCH23 line 703 is the exact sequence inside the proof of Proposition 5.5 (statement at 659); both are within the cited "and proof". Hypothesis drops checked and found covered by the roadmap's own routes: SCH23 proves the purely inseparable descent for a finite extension (line 276) and the README's §3.6 route (flat base change on qcqs opens, descent of finite generation, fpqc descent of properness) is valid for any purely inseparable extension; HW23 Lemma 6.3 is for projective schemes in mixed characteristic and §5.3's route (`picard_infinitesimal_lifting`, `grothendieck_existence`) is characteristic-free and proper; Stacks 0C66 assumes a smooth projective generic fibre and §4.6 uses only the three matrix inputs; LIP69 §13 degrees are lengths over the local ring, a positive multiple of degrees over k. §4.9's strengthening of SCH23 Theorem 2.1(iii) (κ(a) = k instead of purely inseparable) was checked: the negative component descends to a geometrically integral k-curve D (§4.7), the scheme-theoretic image W of D is proper with W_Ω = Spec Ω, hence W = Spec k.
- Checks tested: 155 bullets (every Checks block) recomputed; all correct. Definition sections have ≥ 3 Checks (0.1:5, 0.2:3, 0.4:5, 1.1:5, 1.4:4, 1.5:5, 1.6:3, 2.2:5, 2.5:4, 2.6:6, 2.7:4, 2.8:3, 2.11:3, 3.1:5, 3.3:4, 4.1:5, 4.3:5, 5.1:3, 5.8:3, 5.9:4).
- Gap plausibility: the finite-point reduction (gap 1) follows from a projective Chow cover, generic flatness strata, and Kleiman Theorem 6.16's open-and-closed τ-locus on each connected stratum, with §0.3/§0.6 to pass between X, X′ and finite base changes; nothing circular.

Adversarial table (statement; instances; values on each side; result):

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| `NumericallyTrivial` | P¹, O(m); ∅; Spec k; double line, O(1) | χ(O(m))−χ(O) = m; vacuous (no integral C); no curve; test curve is the reduced line, degree 1 | kernel is m=0; empty and 0-dim schemes trivial; reduced test curves as §4.2 says |
| `RelNumericallyTrivial` | pr₁: P¹×P¹→P¹, O(a,b); id_S | fibre degree b; no curves in Spec κ(s) | kernel ℤ×0; Pic^τ(S/S)=Pic(S) |
| `numericallyTrivialClasses`, `relNumericallyTrivialClasses` | closure of {O(2,0),O(−3,0)} | degrees 0,0; inverse 0 | closure = set (subgroup) |
| `numericalClassGroup_free_finite` | P⁰, P¹, E×E (End rank 1,2,4), ∅ | ranks 0, 1, 3/4/6, 0 | free finite in each |
| `relNumericalClassGroup_free_finite` | P¹_S over βℕ-type base (non-Noetherian) vs ℤ_p | bounded sequences (not f.g.) vs ℤ | Noetherian hypothesis present and needed |
| `HasTrivialNumericalGaloisAction` | K=k (σ=id, g=id); P¹_ℂ/ℝ; pointless conic | id*L=L; swap (1,0)↦(0,1); ℤ with trivial action | holds; fails; holds |
| `constantNumericalClasses_iff_positivePowerDescent` | P¹_ℂ/ℝ: d≥1, (d,0) ∉ diagonal; conic: image 2ℤ, d=2; ∅: d=1; d=0 excluded by `0 < d` | both sides false; both true; both true | iff survives; source misprint d≥0 corrected |
| `numericallyTrivial_torsion_of_algebraic_finiteField` | E/F̄₂ y²+y=x³ (3 points); E/F̄₃ y²=x³−x (4 points); X finite; ℚ̄ (excluded: `Algebra (ZMod p)`) | orders 3, 4; Pic trivial; E(ℚ̄) has infinite order | p=2,3 fine; hypothesis forces char p algebraic |
| `IsContraction` | Bl_x S→S; 𝔸¹→cusp; P¹_ℂ→Spec ℝ; iso | f_*O=O; k[t]≠k[t²,t³]; H⁰=ℂ≠ℝ; id | second and third excluded |
| `contraction_descends_purelyInseparable` | K=k: v=𝟙, square IsPullback 𝟙 y' y' 𝟙; separable ℂ/ℝ excluded by instance | squares commute | correct direction v : Y'→Y, v≫y = y'≫b |
| `componentGraph` | P¹⊔P¹; V(xy); ∅; V(x²+y²)_ℝ vs _ℂ | 2 vertices 0 edges; 1 edge; empty; 1 vertex vs 1 edge | simple, loopless, matches SCH23 line 232 |
| `constantNumericalClasses_iff_componentGraphDescent` | P¹_ℂ/ℝ (2→1 vertices); P¹_ℝ⊔Spec ℂ (excluded by `hpure`); ∅; P¹⊔P¹ with swapped e (fails closure equation); P¹ over k[ε]/ε²; P¹_{k(a^{1/p})}/k | Num not constant ⇔ not bijective; both sides hold on ∅; closure(fst''C₁)=C₁≠C₂; one vertex, mult. p | iff holds; nonreduced/inseparable cases fine |
| `lineBundle_lifts_completeDVR_of_h2_zero` | P¹_R, O(d), d=−1,0,1; abelian surface (H²≠0, excluded); ∅ | lifts O(d); rank can drop; trivial | hypothesis necessary and present |
| §0.1 pairing | P¹_ℂ/ℝ: deg_ℝ O(1)=4−2=2; V(y²): 3−1=2; deg of f*O(1) under degree-2 map = 2 | | additivity, scalars, lengths, finite pullback |
| §0.2 d_C | P¹_ℂ/ℝ: m r = 2; P¹_{k(t^{1/p})}/k: p·1; pointless conic: 1 (degrees even, index 2) | (L·C)_k = d_C(φ*L·C′) in each | DW22 quotient form confirmed (lines 423–426, 521–528) |
| §0.3 | P¹_ℝ O(m) vs P¹_ℂ; generic line of P²_{k(u)} | m=0 both; degree 1 both | both directions |
| §0.4 | id_S; E, O(p−q); Enriques ω | all trivial; deg 0, class ≠ 0; ω²=O, ω≢0 numerically? ω ≡ 0 | numerically trivial ≠ trivial |
| §0.5 | Bl_x P¹_R: O(E) generic 0, exceptional −1 | | generic fibre insufficient; closed fibres suffice |
| §0.6 | normalisation of nodal cubic; Bl_p P² | degrees preserved up to positive factor | both directions |
| §1.1 | P¹×P¹: matrix [[0,1],[1,0]]; E/k̄: Pic=E(k̄)×ℤ, Num=ℤ | | torsion-free, injections |
| §1.2 | P^n: ρ=1 (n≥1), 0 (n=0); E×E: 2+rank End | Kummer bound via image lattice Λ of all classes | route sound |
| §1.3 | ρ(P¹×P¹/P¹)=1; S/S: 0; two lines O(1)⊔O(−1): χ(L(n))=χ(O(n)), degrees (1,−1) | | finite-point detection needed |
| §1.4 | E×E: A=[[1,√2],[√2,2]], det 0; det(A+I)=4, det(A+I/2)=7/4 | NE≠NE‾ | duality from §0.5 |
| §1.5 | O(E)·E=−1; O(a,b) f-nef iff b≥0 | | zero functional nef |
| §1.6 | O_V big iff dim 0; O(1,0): square 0, h⁰=m+1 | | nef ⇒ (L^n)>0 criterion |
| §2.1 | P¹: ∐_ℤ Spec k; Spec k[ε]/ε²: trivial group; nodal cubic Pic⁰=G_m | | Cor 4.18.3 (KLE05 line 1630) |
| §2.2 | P¹⊔P¹: Spec(k×k); P¹×Spec k[ε]: nonreduced constants, units 1+εa | | Lemma 1.4 (SCH23 line 313) |
| §2.3 | ℂ/ℝ: Br(ℂ)=0; ℝ×ℝ: (ℤ/2)²; k[ε]: Br(k) | | finite pushforward acyclic |
| §2.4 | conic: 2ℤ⊂ℤ, coker ℤ/2=Br(ℝ); P¹_ℂ/ℝ: Br(ℂ)=0 | | five-term sequence, Pic(X^aff)=0 |
| §2.5 | P¹: 0; E: Pic⁰; Enriques p≠2: ℤ/2; char 2 ordinary: μ₂ (SCH23 line 547 table) | | |
| §2.6 | P¹_ℂ/ℝ: ℤ² with swap; Spec K/k: 0; conic: ℤ ⊋ 2ℤ; C₃ vs S₃ | | abelian equivalence only |
| §2.7 | split vs non-split quadric | ρ=2 both; action trivial vs swap | |
| §2.8 | Nm O(d) = O(nd); Nm∘pr* = [n] ≠ id for n≥2 | | |
| §2.9 | conic: 2l lifts; P¹: τ-group 0 | | corrected Schröer argument (plan E3) |
| §2.10 | as Lean row; d=0 vacuous | | |
| §2.11 | ℤ/4→ℤ/2: d(1)=2; ℤ/8: 2·2≠0 so no factorisation | | |
| §2.12 | point counts 3 and 4 recomputed | | |
| §3.1 | five Checks recomputed | | surjectivity needs no Noetherian; see R04 |
| §3.2 | Bl_p P², g=id does not factor | | Γ→Y finite with π_*O_Γ=O_Y |
| §3.3 | torsion L: P(X,L)=X^aff (Veronese B[s]); O(p−q) nef not semiample | | |
| §3.4 | O(1,0): φ = pr₁; O_X: X→X^aff | | |
| §3.5 | identity contraction, k′=k | | EGA 8.8.2 line 986, 8.10.5 line 1350 |
| §3.6 | ℂ/ℝ separable counterexample; K=k | | any purely inseparable K/k (see above) |
| §3.7 | P¹_ℂ/ℝ fails; Galois stage: ⊗_σ L′^σ ≡ L′^{[k₁:k]} | | 0BDG descends projectivity |
| §3.8 | P¹×Y with O: no neighbourhood | | 0D3A line 1392, 0D3D line 1008 verbatim hypotheses |
| §4.1 | five Checks | | adjacency reflected only for field base change |
| §4.2 | seven Checks (see Lean row) | | |
| §4.3 | [[1,1],[1,1]]; [−1]; [0]; κ/k degree 2 doubles; V(x^p−a)·V(y^p−a)=p² | | |
| §4.4 | three types | | Schröer prints only two (source Gap below) |
| §4.5 | E²=−[κ(x):k]; Bl at V(u²+1,v): −2 = (−1)+(−1)+2·0; A_n Cartan | | |
| §4.6 | I₂: [[−2,2],[2,−2]], value −2(a−b)², radical (a,a); irreducible: [0] | | |
| §4.7 | (−1)-curve descends; conjugate rulings square 0; conjugate exceptional pair −1, −1, 0 | (E₁−E₂)·E₁ = −1 | |
| §4.8–4.10 | conic bundle over ℝ: 2→1 vertices (Num not constant); blow-up of k-point: [[−1,1],[1,−1]], label 1 | | κ(a)=k argument checked |
| §5.1 | P^n_R: res = id; S: 0→0; quadric over ℤ_(5): Pic rank 1 vs N¹ rank 2 (−1 a square mod 5) | | injective, not surjective |
| §5.2 | 11.a2: counts (0,1,2,0,2,2,2), total 10; E(ℚ)=ℤ/5 | class of order 10 not a restriction, tenth power lifts | |
| §5.3 | P¹_R O(d); abelian surface excluded | | |
| §5.4 | P^n_R; n=0 | | |
| §5.5 | three sections [1:0:0],[0:1:0],[1:1:t]: H²=1, H·ℓ=−1 | | converse fails |
| §5.6 | E, O(p−q): no power pulled back; O(a,0): m=1 | | |
| §5.7 | Bl_p S, O(−E): (−E)·E=1 nef, not a pullback (E maps to a point) | | hypothesis (4) needed |
| §5.8 | (O(1)·line)/1=1; P¹_ℂ/ℝ: 2/2=1; H′=3H | | |
| §5.9 | P²: 1; cone over conic: F₂, 2−1; quadric threefold cone: 2−0=2 vs Cartier rank 1 | | |

## Not verifiable

- Elaboration: no Lean was run (read-only pass, operating rule). The `#check @name` comparison was done by reading the signatures against the README and the pinned declarations; the instance `IsTorsionFree k K` required by `IsAlgClosure` (`Mathlib/FieldTheory/IsAlgClosed/Basic.lean:264`) and the coercion of `pullback.fst` to a function on points are assumed to resolve as in the earlier accepted builds.
- Ownership was checked by object with `roadmaps grep` over every open roadmap pull request at its head, every roadmap on main, and the board packages (patterns: numerically trivial, numerical equivalence, Num/N¹/N₁, Néron–Severi, Pic^τ, contraction, component/dual graph, semiample, nef cone, Alexeev–Hacon–Kawamata, Murre–Oort, Picard scheme, Zariski's lemma, Keel, Schröer, line-bundle lifting, curve index, extremal curve, purely inseparable, Cascini–Tanaka, Hilbert scheme, Stein factorisation, bigness, Picard number, and the fourteen declaration names). Objects with no competing owner anywhere: §0.2 (curve index divisibility), §2.1 (Murre–Oort), §2.12 (Keel torsion), §3.6, §3.8, §5.7, §5.8, §5.9. The overlaps found are all in later roadmaps (R06). What was not checked: pull requests that the index of 2026-10-26T12:52:47Z does not carry.
- The construction of a `NumericalType` term from a fibre of a regular surface in §4.6 (needed to apply `sum_sum_intersection_mul_neg`, whose structure carries `weight`, `genus` and divisibility fields) was not checked field by field; the two `NegSemidef.lean` lemmas suffice for the semidefiniteness and radical statements without it.

## Source issues

- **Misprint** in SCH23 at Lemma 1.1, printed p. 5: the source says the exponent d is an integer ≥ 0; it should be d ≥ 1, since d = 0 makes the condition hold for every X (take N = O); affects a stated result. (Already recorded as plan.json E2.)
- **Misprint** in SCH23 at Proposition 1.2, printed p. 6: the source says "X one-dimensional"; it should be "every irreducible component of X one-dimensional", since P¹_ℝ ⊔ Spec ℂ has constant Num but three geometric vertices over two; affects a stated result. (Recorded as plan.json E5.)
- **Gap** in SCH23 at §2, printed p. 8 (line 343): the source says a contraction of a smooth proper surface with h⁰(O_S) = 1 is birational onto a geometrically normal surface or of fibre type onto a smooth curve; it should also list the structure morphism to Spec k, which is a contraction under the §1 definition; affects nothing (the roadmap's §4.4 adds the case).
- **Misprint** in CT20 at Lemma 2.17, printed pp. 16–17: the conclusion names a divisor on Y although the morphism is f : X → S; it should read "on S"; affects nothing. (Recorded as plan.json E1.)
- **Gap** in WIT22 at proof of Proposition 5.3, printed p. 34: the source applies Keel's Lemma 2.16 to schemes over any locally finite field; Keel states it only over the algebraic closure of a finite field (KEE99 line 677); it should note the spreading-out to a finite subfield; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a7c1e22", "job": "RT-AlgebraicModuliForArithmeticGeometryPartII~1b", "model": "fable", "worker": "fable-rt241"} -->
