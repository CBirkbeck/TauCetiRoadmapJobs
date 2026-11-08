# Review of DGFloerPartII (pull request #1799 at 4e506b6)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/DGFloerPartII/README.md` (1834 lines) and
`TauCetiRoadmap/DGFloerPartII/Suggested.lean` (324 lines, 26 declarations). The gate passes, the
dependency check reports no problem, and the Lean file elaborates with 22 `sorry` warnings and no
error. Of the previous review's seven findings, five are repaired (R02–R06) and two, both about
the pull request description, are not (R01, R07). They are re-raised below as R02 and R06.

This round adds three blocking findings:

- **R01 (P1).** 2.6 puts the factor 2 on the `CPᵈ` family, where it does not belong. 4.2 drops it
  from the even-sphere family, where it does belong.
- **R02 (P2).** The ordering against DGFloer's revision is still not stated, and AlgebraicTopology's
  revisions also claim 1.0.
- **R03 (P2).** Theorem G can be stated at the pins. A statement of it elaborates.

Source ids: `bdho-cotangent` is arXiv:2404.07953v3, 139 pages; its printed page is the footer at the
end of each page. `css-derivative` is arXiv:2012.13634v1. `strickland-cgwh` is the 2009 notes,
`rezk-cg-spaces` the January 2025 notes, and `eschenburg-hanke-bott` is arXiv:1610.04385.

## R01 (P1) — 2.6 and 4.2: the factor 2 is on the wrong families

**Location.**

- README 2.6, lines 993–995: "prove `β_*(σ_p)_*[Σ_p] = ±2g` in degree `2d` for `CPᵈ` and `4d + 2`
  for `HPᵈ` … the class is twice the generator `g`."
- The same claim recurs in:
  - line 989 ("its fibrewise degree `±2`");
  - the second and third Checks of 2.6 (lines 1002–1007);
  - 4.5, line 1639;
  - Worked example 4 (lines 1775–1777).
- 4.2, lines 1179–1181: "nonzero for even `n` (Proposition 6.17) because its image under `β_*` is
  `x·x̄ = −x² ≠ 0`".

**Claim.** The `CPᵈ` family gives twice a generator, and the full Stiefel family of an even sphere
gives `x·x̄`.

**Witness.** For `CP¹`, 2.6's second Check identifies the family with Remark 6.19's
single-component sweep. 4.4 (lines 1607–1611) and Remark 6.19 (`bdho-cotangent` lines 4792–4796)
send that class to a generator `±x²`. The factor 2 comes from two fibre preimages (lines
4759–4773).

**Why.**

- The source's factor 2 is the degree of `τ` on the full Stiefel fibre.
  - The preimages of a point are `(v, θ)` and `(−v, 2π − θ)`, and the involution between them
    preserves orientation for even `n`.
  - So `β_*(σ_p)_*[Σ_p] = deg(τ)·x·x̄ = ∓2x²`. The source says "twice a generator when n is even",
    at `bdho-cotangent` lines 4723–4725.
- For `HPᵈ` the fibre over `u` is `S²`, and `S² × S¹ → S³` again has two preimages, giving `±2g`
  (lines 5306–5310).
- For `CPᵈ`, `Σ_p = T¹_pCPᵈ` carries one frame `(u, Iu)` per direction.
  - The map to the completing manifold of `C₁` (fibre the equator circle of `L_u`) is
    `θ ↦ γ_(Iu)(θ)` on each fibre, of degree `±1`.
  - So the class is `±g`.
- For `CP¹` this is the rotation loop of a degree-one map. Its class in `π₁(Ω²₁S²) ≅ π₃(S²)` is a
  generator: the evaluation fibration's boundary is `[ι₂, ι₂] = 2η`, and the rotation fibration
  `SO(2) → SO(3) → S²` has boundary of degree `χ(S²) = 2`.
- The roadmap therefore contradicts itself. 2.6 says `±2x²`, while 4.4 gives `x²` for the same
  class.

**Repair.**

- **2.6 target.**
  - Replace the two sentences with: "prove `β_*(σ_p)_*[Σ_p] = ±g` in degree `2d` for `CPᵈ`, where
    the fibre of `T¹_pCPᵈ` over a direction `u` is the single frame `(u, Iu)` and the map to the
    completing manifold of `C₁` has fibrewise degree `±1`; and `β_*(σ_p)_*[Σ_p] = ±2g` in degree
    `4d + 2` for `HPᵈ`, where the fibre is `S²` and `(v, θ) ↦ γ_v(θ)` onto the equator `S³` has
    the two preimages `(v, θ)` and `(−v, 2π − θ)`."
  - Change line 989 to "its fibrewise degree (`±1` for `CPᵈ`, `±2` for `HPᵈ`)".
- **2.6 second Check.** "… restricted to one orientation component, so `β_*(σ_p)_*[Σ_p] = ±x²`, a
  generator, as in 4.4; the full `n = 2` Stiefel family of 4.2 gives `±2x²`."
- **2.6 third Check.** "For `HP¹ = S⁴` the fibre over `u` is all of `S²` and the class is `±2g`. A
  value `±2g` for `CP¹` would contradict 4.4's identification of the one-component class with `x²`."
  4.5 has no 2-torsion statement for this Check to protect.
- **4.2.** "its image under `β_*` is `deg(τ)·x·x̄ = ∓2x² ≠ 0`, twice a generator, with `τ` the
  Stiefel-domain map of 1.4". In 1.4, state that map's degree: `±2` for even `n` and `0` for odd
  `n` (the source's proof of Proposition 6.17 and its footnote 16).
- **4.5, line 1639.** "`±g`, respectively `±2g`".
- **Worked example 4.** "`β_*(σ_p)_*[Σ_p] = ±x²`".
- **4.5 first Check.** "the `CP¹` family is one orientation component of the `n = 2` family
  (classes `±x²` and `±2x²`); the `HP¹` family is the whole `n = 4` family (equal classes)."

Tested on `CP¹`: one frame per direction gives a fibre map `S¹ → S¹` of degree 1 and the value
`±x²`, which is 4.4's class. On `S²` with both components, two preimages give `±2x²`, as in
Proposition 6.17. Nonvanishing, which is all that 4.5 uses, holds either way.

## R02 (P2) — Re-raised: DGFloer on main still owns this material; AlgebraicTopology's revisions claim 1.0

Re-raised: R01 of the previous review (raised in every round since the third). No repair report
was available giving a reason for leaving it.

**Location.**

- README lines 38–43: "every numbered statement of its §§6.3–6.4 and §7, and the carriers,
  comparisons and explicit maps those statements consume".
- 1.0 (lines 48–54).
- The description's merge order, which ends "#1742 (GeneralAlgebraicKTheoryPartII) → **this pull
  request** (#1799)".

**Claim.** This roadmap is the only owner of this material.

**Witness.** Main's `TauCetiRoadmap/DGFloer/README.md` still owns:

- Layer 1 items 7–8 (lines 834, 841);
- Layer 5 item 7 (line 1053);
- Theorem B (line 1567);
- Layer 11 (line 1577).

#1798 drops them (its lines 54, 3987, 4109). AlgebraicTopology #1663 (lines 125–132) and #1652
(lines 135–136) claim 1.0.

**Repair.**

- **DGFloer.** In the description's merge-order paragraph, put #1798 (DGFloer) before this pull
  request. The README needs no change for this: every DGFloer id it cites resolves both on main and
  at #1798 (Layer 0, Layer 1 items 1–6, Layers 2–3, Layer 4 item 5, Layer 5 items 1–6, Layer 6
  items 3–5, Layer 10 items 2–5, Layer 11's finite cover and torus criterion).
- **AlgebraicTopology.** Say in the same paragraph whether this pull request or AlgebraicTopology's
  #1652/#1663 merges first. If an AlgebraicTopology revision merges first:
  - cut 1.0's coreflection, convenient products, exponential law and pointed smash/suspension–loop
    constructions to a citation of its Stage 4 item 8 (Layer 4.8 at #1652);
  - keep in 1.0 only the sequential-colimit bullet and the raw-quotient comparison, where they add
    to it.

Tested:

- On main, Layer 11 item 3 contains the finite cover `T × K → G` and "a `K(π,1)` exactly when `K`
  is trivial, equivalently when `G` is a torus". #1798 has the same in 11.1–11.3.
- Main's Layer 4 item 5 is the arbitrary-CW Brown resolution, which is #1798's §4.1.

## R03 (P2) — Theorem G can be stated at the pins but is absent from `Suggested.lean`

**Location.** `Suggested.lean` lines 61–64: "Tau Ceti has smooth embeddings and their intrinsic
normal bundles (`TauCeti.SmoothEmbedding.NormalSpace`) but no transversality predicate for a pair
of embeddings and no triviality predicate for a vector bundle."

**Claim.** Theorem G (Theorem 7.1) cannot be stated at the pins.

**Witness.**

- Transversality at `s a = y b` is `s.tangentRange a _ ⊔ y.tangentRange b _ = ⊤`
  (`TauCeti/Geometry/Manifold/SmoothEmbedding/NormalSpace/Basic.lean:44`).
- Triviality is a linear Mathlib `Trivialization` of `y.NormalSpace` with `baseSet = univ`.
- The statement below elaborates with one `sorry` warning.

**Repair.**

- Add the statement below to `Suggested.lean` with the import
  `TauCeti.Geometry.Manifold.SmoothEmbedding.NormalSpace.VectorBundle.Basic`. The total-space
  topology is Tau Ceti's `instTopologicalSpaceNormalBundle` (`…/NormalSpace/Topology.lean:70`).
- Name the theorem in README 4.6.
- Move the Theorem G bullet of the module docstring from "Not statable" to "Stated here".

The smoothness proof must be a term. With `by simp` inside a binder it is still a metavariable when
the normal-bundle topology instance is searched for, and the search fails.

```lean
/-- **Theorem G** (= Theorem 7.1; README 4.6). `Q` closed orientable, `X = s(Sᵏ)`, `k ≥ 2`, meets the
closed orientable `(n−k)`-submanifold `Y = y(Y)` transversely in the single point `s a = y b`; `Y` is
`ℓ`-connected (`ℓ = 2k−2` for even `k`, `k−1` for odd `k`) with trivial normal bundle. If
`φ : S → π⁻¹(Y)` from a closed oriented `(n−k)`-manifold has `deg(π ∘ φ) = d ≠ 0`, every regular
level bounding a sublevel that contains `φ(S)` has the contractible almost existence property. -/
theorem hasContractibleAlmostExistence_of_knottedSphere {E Q F' Y G S : Type}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace Q] [T2Space Q] [ChartedSpace E Q] [IsManifold 𝓘(ℝ, E) ∞ Q] [CompactSpace Q]
    (oQ : HomologicalOrientation Q E (Module.finrank ℝ E)) (k : ℕ) (hk : 2 ≤ k)
    (s : SmoothEmbedding (𝓡 k) 𝓘(ℝ, E) ∞
      (Metric.sphere (0 : EuclideanSpace ℝ (Fin (k + 1))) 1) Q)
    [NormedAddCommGroup F'] [NormedSpace ℝ F'] [FiniteDimensional ℝ F']
    [TopologicalSpace Y] [T2Space Y] [ChartedSpace F' Y] [IsManifold 𝓘(ℝ, F') ∞ Y]
    [CompactSpace Y] (hdim : Module.finrank ℝ F' + k = Module.finrank ℝ E)
    (oY : HomologicalOrientation Y F' (Module.finrank ℝ F'))
    (y : SmoothEmbedding 𝓘(ℝ, F') 𝓘(ℝ, E) ∞ Y Q)
    (a : Metric.sphere (0 : EuclideanSpace ℝ (Fin (k + 1))) 1) (b : Y)
    (hab : Set.range s ∩ Set.range y = {y b}) (has : s a = y b)
    (htr : (s.tangentRange a (WithTop.coe_ne_zero.2 ENat.top_ne_zero) : Submodule ℝ E) ⊔
      (y.tangentRange b (WithTop.coe_ne_zero.2 ENat.top_ne_zero) : Submodule ℝ E) = ⊤)
    (hY : PathConnectedSpace Y ∧
      ∀ i : ℕ, i + 1 ≤ (if Even k then 2 * k - 2 else k - 1) → Subsingleton (π_ (i + 1) Y b))
    (htriv : ∃ e : Trivialization (EuclideanSpace ℝ (Fin k))
          (TotalSpace.proj : TotalSpace (EuclideanSpace ℝ (Fin k))
            (fun x => y.NormalSpace x (WithTop.coe_ne_zero.2 ENat.top_ne_zero)) → Y),
        e.IsLinear ℝ ∧ e.baseSet = Set.univ)
    [NormedAddCommGroup G] [NormedSpace ℝ G] [FiniteDimensional ℝ G]
    [TopologicalSpace S] [T2Space S] [ChartedSpace G S] [IsManifold 𝓘(ℝ, G) ∞ S]
    [CompactSpace S] (hGS : Module.finrank ℝ G = Module.finrank ℝ F')
    (oS : HomologicalOrientation S G (Module.finrank ℝ G))
    (φ : C(S, CotangentBundle 𝓘(ℝ, E) Q)) (g : C(S, Y)) (hφ : ∀ x, (φ x).proj = y (g x))
    {d : ℤ} (hd : d ≠ 0)
    (hdeg : (((singularHomologyFunctor (ModuleCat.{0} ℤ) (Module.finrank ℝ G)).obj
        (ModuleCat.of ℤ (ULift.{0} ℤ))).map (TopCat.ofHom g)).hom
          (oS.mapFundamentalClass rfl (ContinuousMap.id S)) =
        d • (hGS ▸ oY.mapFundamentalClass rfl (ContinuousMap.id Y)))
    (F : CotangentBundle 𝓘(ℝ, E) Q → ℝ)
    (hF : ContMDiff (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) ∞ F)
    (hFc : ∀ r : ℝ, IsCompact (F ⁻¹' Set.Iic r)) {c : ℝ}
    (hc : IsRegularValue (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) F c)
    (hφU : ∀ x, F (φ x) < c) :
    (CotangentBundle.symplecticForm 𝓘(ℝ, E) Q).HasContractibleAlmostExistence Set.univ F c :=
  sorry
```

Tested: this statement was elaborated with `lake env lean` against the pins, with the import above
built by `lake build`; `sorry` is the only warning. The hypotheses follow the source's §7 preamble
and Theorem 7.1 (`bdho-cotangent` lines 5354–5372).

On the degenerate case `k = n`, `Y` is a point and all the hypotheses hold. The conclusion is still
true there: `Q ⊇ Sⁿ` is abundant, so Theorem H applies to that component.

## R04 (P3) — 4.2c defines its own `BO` without comparing it with TopologicalKTheory's

**Location.** README 4.2c, lines 1428–1429: "`Ω₇ ≅ ℤ × BO`, where … `BSp` and `BO` are the
Grassmannian models, the colimits of `G_(2m)(ℍ^(4m))` and `G_m(ℝ^(2m))`".

**Claim.** `BO` is this roadmap's to define.

**Witness.** Main's `TauCetiRoadmap/TopologicalKTheory/README.md`:

- lines 442–447 define `stableRealGrassmannian`, the rank-colimit in `CompactlyGenerated`, as
  `BO`;
- lines 111–112 require that "any distinct homogeneous model has a named comparison to these
  carriers".

The Scope table has no TopologicalKTheory row.

**Repair.**

- In 4.2c, write `Ω₇ ≅ colim_m ⊔_(0≤p≤2m) G_p(ℝ^(2m))` with the index `d = p − m`.
- Either drop the names `BO` and `ℤ × BO`, or keep them and add a target: the comparison of the
  `d = 0` colimit with TopologicalKTheory T1.6a's `stableRealGrassmannian`, through
  `G_m(ℝ^(2m)) ⊂ G_m(ℝ^∞)` followed by its rank stabilization.
- In the second case, add a Scope-table row "The stable real Grassmannian `BO` | TopologicalKTheory
  T1.6a | compared in 4.2c" and add T1.6a to 4.2c's *Needs:* line.

Tested on 4.2b's stabilization. `G_p(ℝ^(2m)) → G_(p+1)(ℝ^(2m+2))` adds a line, so it is compatible
with the rank map of `stableRealGrassmannian` and preserves `d`. `BSp` has no owner on main and
stays here.

## R05 (P3) — 4.6, third Check: Theorem B's hypothesis does hold for `Q = Tⁿ # (S^k × Y)`

**Location.** README lines 1729–1730: "`Q′ = Tⁿ`, `k ≥ 3`: `π₂(Q) = 0` and `Q` is rationally
essential, so neither Theorem B nor Theorem H applies, while Theorem G does".

**Claim.** Theorem B's hypothesis on `Q` fails here.

**Witness.** Take `k = 3`, `Y = S⁵` and `Q = T⁸ # (S³ × S⁵)`.

- The universal cover is 2-connected and its `H₃` contains `⊕_(ℤ⁸) ℤ`, the lifts of `S³ × {q}`.
  By Hurewicz, `π₃(Q)` has elements of infinite order.
- Rational essentiality is a statement about `H_n(Bπ₁)`, not about `π_ℓ ⊗ ℚ`.

**Repair.** Replace the Check with: "`Q′ = Tⁿ`, `k ≥ 3`: `π₂(Q) = 0` and `Q` is rationally
essential, so `Q` is not abundant (abundant manifolds are rationally inessential, `bdho-cotangent`
lines 4582–4584) and Theorem H does not apply. Theorem B's hypothesis on `Q` holds (`π_k(Q)` has
elements of infinite order), but it needs `H_n(U) → H_n(Q)` nonzero, while Theorem G applies to
every domain containing `φ(S)`. The three theorems have different ranges." Tested on
`T⁸ # (S³ × S⁵)` as above.

## R06 (P3) — Re-raised: the pull request description is stale

Re-raised: R07 of the previous review. No repair report was available.

**Location.** The description:

- "`Suggested.lean` states the rotation family at a fixed pole, the low-rank values of
  `π_(n−1)(SO(n))` and its torsion for odd `n`";
- "HomotopySpheres' James construction and Bott periodicity";
- "compares the base's raw mapping-space carriers with HomotopySpheres' convenient ones";
- "TangentialBordism's compact-image embedding".

**Claim.** The description describes this head.

**Witness.**

- `Suggested.lean` states no rotation family.
- The README cites no HomotopySpheres. It takes the James construction from
  GeneralAlgebraicKTheoryPartII §4.30b and owns Bott periodicity (4.2a–4.2c).
- 3.1 uses TangentialBordism B5 and B6.3 and mentions no compact-image embedding.

**Repair.** Regenerate the summary and the last paragraph from the README Summary (lines 3–26) and
the module docstring (`Suggested.lean` lines 22–69). Include Theorem G once R03 is applied, and the
order of R02.

## R07 (P3) — "None at present" in Downstream consumers

**Location.** README line 1760: "None at present. The base roadmap consumes nothing from this one."

**Claim.** The README is timeless.

**Witness.** "At present" is process narrative, which the house style rules out. No roadmap on
main uses it.

**Repair.** "None. The base roadmap consumes nothing from this one."

## Previous findings

- **R01 (P2, ordering against #1798): not repaired.** The merge-order paragraph is unchanged.
  Re-raised as R02.
- **R02 (P3, negative control of the Serre Check): repaired.** Lines 1229–1236 now give
  `d_(2n−2) : E_(2n−2,0) → E_(0,2n−3)` and a worked instance, the twistor fibration
  `S² → CP³ → S⁴`. Checked:
  - `H₂(Ω²S⁴) = π₄(S⁴) = ℤ`;
  - `π₃(CP³) = π₃(S⁷) = 0`, so `H₁(Ω²CP³) = 0` on every component;
  - `E_(1,0) = H₁(Ω²S⁴) = 0`, so `d₂ : E_(2,0) → E_(0,1) = H₁(Ω²S²)` must be onto.
- **R03 (P3, padding): repaired.** `isGeneratedBy_compHaus_iff` and `isGeneratedBy_compHaus_prod`
  are gone, and the docstring at lines 83–88 now says "transported along the equality of the two
  full subcategories".
- **R04 (P3, AlgebraicTopology Stage 4 item 5): repaired.**
  - 1.0 (lines 507–509) cites the finite-stage factorization.
  - 4.2c (lines 1416–1421) uses `cofibrationTowerHomotopyEquivalence` and Stage 8 item 7.
  - The Scope table (line 100) adds "closed-cofibration towers with their mapping telescopes and
    finite-stage factorization".
- **R05 (P3, uncited Tau Ceti declarations): repaired.** The contract (lines 250–282) adds
  `orthogonalToDiffSphere`, `continuousOrthogonalToDiffSphere`, `IsCoveringMap.homotopyGroupPiMulEquiv`,
  `NDRPair`, `realClifford_classification`, `realCliffordForm`, the two `mpullback_…_symplecticForm`
  lemmas and the two capacity lemmas. They are used at 4.2b (line 1299), 4.2c (lines 1358–1363),
  4.3 (lines 1522, 1528) and 3.3 (line 1111).
- **R06 (P3, 1.0 locators and `bdho-floer`): repaired.** 1.0 cites Strickland Propositions 2.6,
  2.11, 2.12, 2.20 and §5 (5.1, 5.7, Corollary 5.8), and Rezk Propositions 7.3, 8.6, 8.8 and 9.2.
  All were verified below. Line 766 now reads "the source paper".
- **R07 (P3, stale description): not repaired.** Re-raised as R06.

## Verified sound

**Gate and build.**

- Every scanner of the worker's gate is 0, including `depcheck=0`, `build=0`, `outside-folder=0`
  and `stray-files=0`.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The dependency check on this head:

      depcheck: 230 roadmaps, 2341 edges, 0 problem(s)

  TangentialBordism is merge-order line 14, GeneralAlgebraicKTheoryPartII line 331 and
  DGFloerPartII line 332. DGFloer, AlgebraicTopology, TopologicalKTheory and the other suppliers
  are on main.
- `lake env lean` on `Suggested.lean` gives 22 "declaration uses `sorry`" warnings, at lines 89,
  98, 115, 136, 151, 169, 199, 212, 251, 258, 265, 271, 278, 284, 292, 295, 298, 302, 306, 310, 314
  and 321. There is no error.
- Pins: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9.
- Form:
  - `public import Mathlib` plus eleven `TauCeti.*` modules, all present at the pin;
  - one module docstring and `namespace TauCetiRoadmap.DGFloerPartII`;
  - `theorem` only, with no `set_option`, no `#eval` and no sorry'd data;
  - `SO`, `soBlockInclusion` and `instIsManifoldRealComplexProjectiveSpace` have real bodies, and
    `soBlockInclusion_one` is proved;
  - the file has no section `variable`.

**Signatures.** A scratch file importing the built module ran `#check @` on all 26 declarations.
Each elaborated type matches its README sentence:

- Theorem B takes `[T2Space Q] [CompactSpace Q] [ConnectedSpace Q]`,
  `hQ : Nontrivial (π_ 2 Q q) ∨ ∃ ℓ, ¬IsMulTorsion (π_ (ℓ + 3) Q q)`, and the singular-homology map
  in degree `finrank ℝ E`.
- The covered theorem takes `0 < ℓ`, `ev_* A = ↑ℓ • [M]` and the first-nontrivial-`π_(k+2)`
  clause with `x ^ ℓ ≠ 1`.
- The Bott theorems take `j % 8` conditions with `j + 3 ≤ m`, and `j + 11 ≤ m` for periodicity.
- `isOfFinOrder_pi_SO` takes `Odd (k + 3)`.

None has lost a binder.

**Padding probe** (a scratch copy, elaborated):

- `infer_instance` fails on `compactlyGeneratedToTop_isLeftAdjoint`, `compactlyGeneratedSpace_prod`,
  `Subsingleton (π_ 2 (SO 3) 1)`, `Subsingleton (π_ 6 (SO 7) 1)` and the stable `Subsingleton`.
- `simp` makes no progress on `bijective_map_soBlockInclusion` or `surjective_map_soBlockInclusion`.
- `isOfFinOrder_of_finite` fails, since no `Finite` instance exists.

Mathlib has a compact-generation adjunction only for universes `(u, u+1)` through condensed sets
(`compactlyGeneratedAdjunction`, `Mathlib/Condensed/TopCatAdjunction.lean:175`), so the general
statement is not at the pin. No padding was found.

**Library declarations opened at the pins**, by file and line.

- Mathlib:
  - `Topology.ContinuousMapGeneratedBy`, `GeneratedByTopCat.adj` and `CompactlyGenerated`, as in the
    previous review;
  - `Trivialization` and `Trivialization.IsLinear`, used in R03.
- Tau Ceti:
  - `TauCeti.IsAspherical` (`EilenbergMacLane/Basic.lean`): path connected and every `π_(n+2)`
    trivial;
  - `HomotopyGroup.map` (`Topology/Homotopy/HomotopyGroup/Map.lean:45`) and `pathLoopSpaceMulEquiv`
    (`LoopSpace.lean:321`);
  - in `Capacity/HoferZehnder.lean`: `IsHZNormalized` (102; admissible Hamiltonians vanish on a
    nonempty open subset of `W`, so a point has capacity 0), `IsContractibleHZAdmissible` (179),
    `contractibleHZCapacity` (193), and `_smul` and `_image` (246, 295);
  - `HasContractibleAlmostExistence`: almost every level near `c` carries a contractible closed
    characteristic;
  - in `CliffordAlgebra/Classification.lean`: `realCliffordResidue` (43), `IsRealCliffordClassified`
    (77) and `realClifford_classification` (339); `realCliffordForm` (`RealForm/Basic.lean:113`);
  - `Diffeomorph.continuous_eval_const` (`Diffeomorphism/Topology.lean:111`);
  - `IsManifold.restrictScalars` (`RestrictScalars.lean:92`);
  - `SmoothEmbedding` (`SmoothEmbedding/Basic.lean:75`), `tangentRange` and `NormalSpace`
    (`NormalSpace/Basic.lean:44, 59`), `instTopologicalSpaceNormalBundle` (`Topology.lean:70`) and
    `normalSpaceFiberBundle` (`VectorBundle/Basic.lean:283`);
  - `LocalCoefficientSystem` (`LocalCoefficient.lean:46`);
  - `RankOneLocalSystem` with `twistedCochainComplexIso`, `stiefel`, `orthogonalToDiffSphere`,
    `continuousOrthogonalToDiffSphere`, `IsCoveringMap.homotopyGroupPiMulEquiv`, `NDRPair` with
    `nonempty_ndrPair_iff`, and the two `mpullback_…_symplecticForm` lemmas, each found in the file
    the contract names.

**Cross-roadmap citations resolved.**

- **DGFloer.** Main and #1798 (63e59c6c), as in R02.
- **GeneralAlgebraicKTheoryPartII.** At #1742 (3f102483), §4.30b (lines 1208–1245) supplies:
  - the James map into the Moore loops of `(W×I)/(W×∂I∪{w₀}×I)`;
  - weak and homotopy equivalence for connected `W`;
  - the tensor algebra over any `R` with `H̃_*(W;R)` flat.
- **TangentialBordism.** At #942 (be5e94da): B5.1 (line 1254), B5.5 (line 1602) and B6.3, which is
  §10.1, "Homology realization", with the rational SO surjection (line 2639).
- **On main:**
  - GeneralizedCohomology:
    - G2 item 10 (mapping paths, line 533);
    - G4 items 0, 0b and 3–5 (lines 938, 1082 and 1224–1246);
    - G5 item 2, the unframed collapse with embedding, stabilization and metric independence
      (lines 1523–1535);
  - ComplexKahlerGeometry K7.1–K7.2 (lines 1407, 1444);
  - SmoothBundlesConnections B1.4, B2.2, B2.5, B6.2 and B6.3 (lines 421, 605, 802, 1668, 1716);
  - LieGroups Layer 2 (line 356);
  - RiemannianGeometry R1–R3 (lines 179, 300, 347). R1 supplies the Hopf metrics, period `π`,
    curvature in `[1, 4]` and radius `½` for `CP¹` and `HP¹` (lines 293–296).
  - MorseTheory M5 (line 857);
  - GeometricTopology Layers 1 and 3 (lines 177, 357);
  - AlgebraicTopology:
    - Stage 4 item 5 (line 635), with `cofibrationTowerHomotopyEquivalence` and the finite-stage
      factorization (lines 683–697);
    - Stage 8 items 5, 7 and 11a (lines 1700, 1811, 1948).

**Seeded source sample.**

| Target | Locator checked | Result |
| --- | --- | --- |
| 1.0 | Strickland 2.6 (lines 122–134), 2.11 (159–176), 2.12 (177–226), 2.20 (290–293), 5.1 (1033–1044), 5.7 (1086–1095), Cor 5.8 (1096–1098); Rezk 7.3 (313–326), 8.6 (382–400), 8.8 (409–414), 9.2 (433–443) | as stated. Rezk's "k-space" is the README's compactly generated (his CG adds k-Hausdorff, line 224). Strickland §5 is for WH spaces, and 5.1's proof uses only 2.20 (line 1036), as the README says |
| 1.2 | Prop 6.18, `bdho-cotangent` 4685–4687 (polynomial, not graded commutative, degree `n−1`); Hatcher §4.J cited at 4693; GeneralAlgebraicKTheoryPartII §4.30b | as stated |
| 1.3 | Prop 6.38 proof, 5221–5227 (homogeneous metric, frame `(v, Iv)`); metric facts from RiemannianGeometry R1 | as stated |
| 1.5 | DGFloer Layer 1 item 5 (main line 826); GeneralizedCohomology G5 item 2; TangentialBordism B5.1, B5.5 | as stated; no source claim |
| 2.5 | the roadmap's own construction | total degrees checked below |
| 2.6 | Prop 6.38, 5218–5241; Prop 6.39, 5247–5311; Remark 6.19, 4792–4796; Prop 6.17 proof, 4720–4790 | `HPᵈ` as stated; the `CPᵈ` factor 2 is false (R01, source issue) |
| 3.1 | Thm 5.14 proof, 4273–4279 (Thom II.29, `N·α = φ_*[S]`, `d = Nb`) | as stated |
| 3.3 | Cor D, 265–292 (`Ψ(p,q) = (p + σ(q), q)`); Cor E, 304–317 | as stated, with the sign convention of the base (computed below) |
| 4.1 | Def 1.7, 415–423; Thm H, 424–426; Def 6.11, 4517–4523; Thm 6.12, 4525–4578 (the `α − σ_*ev_*α` step at 4541); Prop 6.13, 4608–4616 | as stated |
| 4.2a | Steenrod §7 and Hatcher §4.2 (not fetched) | the fibration ranges were recomputed (table) |
| 4.2b | Eschenburg–Hanke §2 (line 184) and §3 (247–293); Milnor §24 (not fetched) | as stated; the Clifford table was recomputed from Tau Ceti |
| 4.2c | Eschenburg–Hanke §4, Thm 4 and proof (294–330: `A = a_jJ′`, odd `a_j`, `J_(k+1) = J_kJ′`) | as stated; the explicit bounds are the README's, checked below |
| 4.3 | Defs 6.26 (4919–4925) and 6.32 (5051–5057); Props 6.29, 6.31, 6.33, 6.34 (4935, 5037, 5059, 5063–5139); Ex 6.30 (5015–5036); Lemma 6.35 (5073–5094); `css-derivative` 221–222 (`π₈SO₉ → π₈SO` split, kernel `ℤ/2`) and 249 (`π₈SO₈ = (ℤ/2)³`) | as stated; the source's `ℤ₄` is corrected |
| 4.5 | Thm I, 430–445; Props 6.38–6.39 | as stated except the `CPᵈ` factor (R01) |
| 4.6 | §7 preamble 5354–5364; Thm 7.1, 5366–5372; Ex 7.4, 5382–5388; Prop 7.5, 5404–5405; kernel bound, 5415–5419 | as stated; the third Check misreads Theorem B (R05) |

**Adversarial table.** All values were computed in this review.

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| 2.6, `CPᵈ` value | `CP¹`; `d ≥ 2` | one frame `(u, Iu)` per `u`; fibre map `θ ↦ γ_(Iu)(θ)` onto the equator `S¹`, degree 1; `CP¹` rotation loop is a generator of `π₃(S²)` (boundaries `2η` and `χ(S²) = 2`) | `±g`, not `±2g` | R01 |
| 4.2, Prop 6.17 value | `n = 2, 4` | `τ` has two preimages; the involution has degree `(−1)^(n−1)·(−1) = +1`; `β_* = ±2·x·x̄ = ∓2x²` | factor 2 missing | R01 |
| 2.6, `HPᵈ` value | `d = 1` | fibre `S²`; `S² × S¹ → S³` of degree 2; `dim Σ_p = 4d + 1 = 5`; `H₆(ΩS⁴) = ℤ·x²` | `±2g` as stated | none |
| Theorem B (Lean) | `T^r`; `ℝP³`; `S²`; `c < min F`; `S² ⊔ T²` | `T^r`: `hQ` false; `ℝP³`: `π₃ = ℤ` not torsion; `S²`: `π₂ = ℤ`; `U = ∅`: `H_n = 0`; disconnected `Q` excluded | true where it should apply | none |
| `¬IsMulTorsion` versus Thm 5.14 | definition | `¬∀g, IsOfFinOrder g` gives an element of infinite order (4268–4269) | agrees | none |
| 3.3 sign | `T*ℝ²`, `σ = q₁dq₂` | `−d(p₁dq₁ + (p₂−q₁)dq₂) = dq₁∧dp₁ + dq₂∧dp₂ + dq₁∧dq₂`; `τ_(−σ)^*ω = ω + π^*dσ`; `τ_σ^*(ω − π^*dσ) = ω − 2π^*dσ` | as stated | none |
| Theorem G | `k = n`; `k = 3`, `Y = S⁵` | `k = n`: `Y` a point, hypotheses hold, conclusion true (Theorem H on `Sⁿ`); the statement in R03 elaborates | statable | R03 |
| 4.6, third Check | `T⁸ # (S³ × S⁵)` | the universal cover is 2-connected with `H₃ ⊇ ⊕_(ℤ⁸)ℤ`, so `π₃(Q) ⊇ ℤ`; B's `Q`-hypothesis holds | Check false for B | R05 |
| block-inclusion ranges (Lean) | `n = 0..4` | `n = 0`: no `i`; `π₀(SO 2) = π₀(SO 3) = pt`; `ℤ → ℤ/2` onto but not injective (`i = n − 1`); `π₃(SO 3) = ℤ → ℤ²` not onto (`i = n`) | bounds sharp | none |
| stable values (Lean) | smallest `m` for `j = 0..7` | `π₂(SO 4)`, `π₄(SO 6) = π₄(SU 4)`, `π₅(SO 7)`, `π₆(SO 8)` all 0; `π₁(SO 3)`, `π₈(SO 10)` are `ℤ/2`; `π₃(SO 5)`, `π₇(SO 9)` are `ℤ`; `π₉(SO 11) = ℤ/2 = π₁`; sharpness: `π₃(SO 4) = ℤ²`, `π₈(SO 9) = (ℤ/2)²`, `π₄(SO 5) = ℤ/2` | true; bounds needed | none |
| Lemma 6.35 (Lean) | `n = 3..15`; `n = 4`; `n = 7` | splitting: `n = 9` gives `(ℤ/2)²`, `n = 11, 13, 15` give `ℤ/2`; `(ℤ/2)³ ↠ π₈(SO 9)` (boundary `ℤ → π₇(SO 8) = ℤ²` injective); `n = 4`: `π₃ = ℤ²`, so `Odd` is needed; `n = 7`: the splitting predicts `ℤ/2` but `π₆(SO 7) = 0` | as stated | none |
| `m_j` (4.2c) | `IsRealCliffordClassified 0 j` | residues `j mod 8`: `ℝ, ℂ, ℍ, ℍ², M₂(ℍ), M₄(ℂ), M₈(ℝ), M₈(ℝ)², M₁₆(ℝ)`, so `m = 1, 2, 4, 4, 8, 8, 8, 8, 16`, with two modules at `j = 3, 7` | as stated | none |
| index bounds (4.2c) | `n = 16m`, `k = 0..7` | `n/m_(k+1) − 1 = 8m−1, 4m−1, 2m−1, 2m−1, 2m−1, m−1`; `(4m−|c|)/4` and `(2m−|c|)/4`; `2p − c = p + N ≥ s` | as stated | none |
| stable groups (4.2c) | `i = 1..8` | `π₀(Ω_i) = 2, 1, ℤ, 1, 1, 1, ℤ, 2`, giving `ℤ/2, 0, ℤ, 0, 0, 0, ℤ, ℤ/2`; `π₁(U/Sp) = π₁(U)` | as stated | none |
| `BO` in 4.2c | TopologicalKTheory T1.6a | two models, no comparison | ownership | R04 |
| 4.2b Checks | `n = 16m` | `dim O(16m) − dim U(8m) = 64m² − 8m = n²/4 − n/2`; one `±3i` pair: `|A|² = n + 16` | as stated | none |
| 4.2 Serre control | `S² → CP³ → S⁴` | `H₂(Ω²S⁴) = ℤ`; `H₁(Ω²CP³) = 0`; `d₂` onto | as stated | none |
| `compactlyGeneratedSpace_prod` | `X = ℝ/ℤ₊`, `Y = ℚ`; `X = pt` | `ℚ` is not locally compact (Munkres §22 Ex 7); `X = pt` reduces to Mathlib's locally compact Hausdorff instance; `infer_instance` fails | hypotheses needed; not at pin | none |
| `compactlyGeneratedToTop_isLeftAdjoint` | universes | Mathlib has only `(u, u+1)` through condensed sets; `infer_instance` fails | not at pin | none |
| 1.0 `S^∞` Check | `q_r` | meets `S^s` in `q₁..q_s`; the norm limit is `e₀` | as stated | none |
| 1.4 degree | `n = 1, 2, 3` | `1 + (−1)^(n−1) = 2, 0, 2` (`bdho-cotangent` 5132–5135) | as stated | none |
| 2.1 indices | `CPᵈ`, `HPᵈ` | `(2k−1) + (k−1)(2d−2) = 2d(k−1) + 1`; `3(2k−1) + (k−1)(4d−4) = 2(k−1)(2d+1) + 3` (5285) | as stated | none |
| 2.5 degrees | `CP²` | `d₂: E_(2,4) → E_(0,5)`; `E_(4,0) ≅ E_(2,1)`; `d₄: E_(4,1)` (5) `→ E_(0,4)` (4) | as stated | none |
| capacity theorems (Lean) | `CP⁰`; `S¹`; `ℓ = 0`; `T^r`; `SO(3)` | point: only `F = 0` is admissible, capacity `0 < ⊤`; `S¹` excluded by `2 ≤ n`; `ℓ > 0` assumed; `T^r`: `hM` and `¬IsAspherical` false; `π₃(SO 3) = ℤ` | true | none |
| 4.4, `ℝP²` | `O(2)` | `χ = −1` and coorientation `−1` give `+1` | as stated | none |
| 4.1 products | `deg α = dim M` | `deg(α × [N]) = dim(M × N)`; shriek `j_!α × 1 ≠ 0` | as stated | none |

**Headline theorems.**

| Headline | In `Suggested.lean` |
| --- | --- |
| Theorem B (3.2) | stated, line 115 |
| Corollaries D and E in Theorem B form (3.3) | transports of Theorem B, not separate headlines |
| Theorem H (4.1) | not statable (no shriek at the pins); docstring line 52, correct |
| Theorem I: spheres, Lie groups, covered manifolds, `CPᵈ`, `HPᵈ` | stated, lines 136, 151, 169, 199, 212 |
| Theorem I: fibered families, sphere bundles, products; Proposition 6.36 | not statable; docstring lines 56–60 (no smooth structure on `G ⧸ H` at the pins, confirmed by search) |
| Theorem G (4.6) | statable but absent (R03) |
| Finite-to-stable range (4.2a) | stated, lines 251, 258 |
| Real Bott periodicity and `π_*(O)` (4.2c) | stated in finite rank, lines 265–286; stable `O` is not at the pins (docstring lines 65–69) |
| Lemma 6.35 (4.3) | stated, lines 292–322 |

**Ownership.**

- **This roadmap owns:**
  - 1.0's convenient category. Main's AlgebraicTopology hands it to HomotopySpheres §3A.1, which
    this brief forbids as a supplier; see R02 for the AlgebraicTopology revisions.
  - Stable `O` and real Bott periodicity, which no admissible roadmap owns.
- **HomotopySpheres #1287** (bb91dff8) also builds stable `O` and real Bott (§4A at line 1429, §4B
  at line 1570), but no longer names DGFloerPartII. It is a forbidden supplier, so this overlap
  cannot be repaired from this folder; it is a matter for the operator.
- **Lean names.** `roadmaps grep` finds no other roadmap stating `π_*(SO n)` values or capacity
  theorems in Lean, apart from an `abbrev SO` in IntegralLattices under another namespace.
- **Not checked:**
  - DGFloer #963 and the AlgebraicTopology pull requests #1187, #1797, #1807, #1808 and #1854 were
    not given with files; ownership against them was not checked beyond `roadmaps grep`.
  - The overlap report lists no pull request that changes this folder and no dropped id;
    confirmed.

## Not verifiable

- **Not fetched; no legal copy found:**
  - J. Milnor, *Morse Theory*, §§22–24. The index argument was checked against Eschenburg–Hanke
    Theorem 4.
  - R. Bott, Ann. of Math. 70 (1959), and W. Ziller, Invent. Math. 41 (1977). Ziller's indices were
    recomputed and agree with `bdho-cotangent` line 5285.
- **Not fetched in this review; the facts used were checked directly:**
  - Hatcher, *Algebraic Topology* (Theorem 3.26, §4.2, §4.J, A.6), which the author distributes
    openly;
  - Munkres §22; Steenrod Part I §7; Milnor–Stasheff Ch. 5; Pontryagin Ch. II;
  - the source's [Jap87], [Tho54], [GHL04] and [Bes78].

## Source issues

- **Error** in bdho-cotangent at proof of Proposition 6.38, printed page 120: the source says the `CPⁿ` family gives twice a generator of `H_(2n)(ΩCPⁿ)`; it should be ± a generator, since `T¹CPⁿ` carries one frame `(v, Iv)` per direction (Remark 6.19 for `n = 1`); affects nothing.
- **Error** in bdho-cotangent at proof of Lemma 6.35, printed page 117: the source reads `π₈(SO(9))` as cyclic of order four; it should be `ℤ/2 ⊕ ℤ/2` (stabilization split with kernel `ℤ/2`, Crowley–Schick–Steimle); affects nothing.
- **Misprint** in bdho-cotangent at second proof of Proposition 6.34, printed page 118: the source concludes by Proposition 6.29 after showing `Sⁿ` is 2-covered; it should cite Proposition 6.33; affects nothing.
- **Gap** in bdho-cotangent at §7 preamble before Theorem 7.1, printed page 123: the source derives `n ≥ 3k − 1` or `n ≥ 2k` from connectivity of `Y`; it should assume `dim Y > 0`, since `k = n` with `Y` a point meets the hypotheses; affects nothing.
- **Gap** in bdho-cotangent at Proposition 6.36, printed page 119: the source concludes abundance for every `G/H` with closed `H` of positive dimension; Definition 6.11 needs `Q` oriented, so nonorientable quotients need the orientation twist; affects a stated result.
- **Misprint** in arXiv:1610.04385 (Eschenburg–Hanke) at proof of Theorem 4, printed page 9: the source calls each minimal subspace an irreducible module on `k` generators; it should be `k + 1`, since `J_(k+1) = J_kJ′` is the extra generator; affects nothing.
