# Review of MorseTheory (pull request #1682 at d49dff0)

**Verdict:** needs changes

This is a full review of the same head the previous review read (d49dff0); `changes.md` records no change in the folder. The previous review's only finding concerned the description, which has since been edited. This review re-read the whole folder and found one P2 and four P3 defects.

## Previous findings

- **R01 (P3, the description claimed page numbers for Hirsch and Lee): repaired.** The description now reads: "with page numbers for Milnor (1963 and 1959), Cohen–Iga–Norbury, Nicolaescu, Weber, Brown and Takens, and chapter, section and theorem numbers for Hirsch and Lee". This matches `README.md:1547–1552`.

## R01 (P2) — The handle-attachment homeomorphism is statable at the pins but is not stated

**Location.** `TauCetiRoadmap/MorseTheory/Suggested.lean:44–48`: "Not stated: the handle-attachment homeomorphism across a critical level and the comparison of handle attachments … a long encoding for which the pins supply no carrier."

**Claim.** The file treats the §2.2 handle theorem as a headline (it lists it among the headlines left out). The reason it gives is that the pins have no carrier. For §2.2 that reason is false. Only the parametrised chart comparison of §2.3 is a genuinely long encoding.

**Witness.** `README.md:728–729` names the carrier: "native TopCat pushouts for the handle adjunction". The pinned cell form (`Morse/Cell/Comparison.lean:457`) is already stated over a pushout, and the statement below elaborates against the pins.

**Exact repair.** Insert the following before the Layer 4 section comment of `Suggested.lean`:

```lean
/-- The handle `D^λ × D^(m−λ)` of index `λ` in dimension `m`. -/
abbrev handle (l m : ℕ) : Type :=
  Metric.closedBall (0 : EuclideanSpace ℝ (Fin l)) 1 ×
    Metric.closedBall (0 : EuclideanSpace ℝ (Fin (m - l))) 1

/-- The attaching region `∂D^λ × D^(m−λ)` of the handle of index `λ` in dimension `m`. -/
abbrev attachingRegion (l m : ℕ) : Type :=
  Metric.sphere (0 : EuclideanSpace ℝ (Fin l)) 1 ×
    Metric.closedBall (0 : EuclideanSpace ℝ (Fin (m - l))) 1

/-- The inclusion of the attaching region into the handle. -/
def attachingRegionIncl (l m : ℕ) : C(attachingRegion l m, handle l m) :=
  ⟨fun q ↦ (⟨q.1.1, Metric.sphere_subset_closedBall q.1.2⟩, q.2), by fun_prop⟩

/-- Handle attachment across one critical level (Milnor §3; Nicolaescu Theorem 2.2.3 and
Remark 2.2.5): `{f ≤ c + ε}` is homeomorphic to `{f ≤ c − ε}` with one handle of index
`λ_p` attached along an embedding of `∂D^λ × D^(m−λ)` for each critical point `p` on the
level `c` (README §2.2). -/
theorem exists_homeomorph_pushout_handles (f : M → ℝ) (hf : TauCeti.IsMorse I f) {c δ : ℝ}
    (hδ : 0 < δ) (hcompact : IsCompact (f ⁻¹' Icc (c - δ) (c + δ))) :
    ∃ ε, 0 < ε ∧ ε ≤ δ ∧
      ∃ φ : C((p : ↥(TauCeti.criticalPoints I f ∩ f ⁻¹' {c})) ×
          attachingRegion (TauCeti.manifoldMorseIndex I f p) (Module.finrank ℝ E),
          {x : M // f x ≤ c - ε}),
        Topology.IsEmbedding φ ∧
        Nonempty ({x : M // f x ≤ c + ε} ≃ₜ
          ↑(CategoryTheory.Limits.pushout (TopCat.ofHom φ)
            (TopCat.ofHom (X := TopCat.of ((p : ↥(TauCeti.criticalPoints I f ∩ f ⁻¹' {c})) ×
                attachingRegion (TauCeti.manifoldMorseIndex I f p) (Module.finrank ℝ E)))
              (Y := TopCat.of ((p : ↥(TauCeti.criticalPoints I f ∩ f ⁻¹' {c})) ×
                handle (TauCeti.manifoldMorseIndex I f p) (Module.finrank ℝ E)))
              ⟨Sigma.map id fun p ↦ attachingRegionIncl _ _, by
                exact continuous_sigma_map.mpr fun p ↦ (attachingRegionIncl _ _).continuous⟩))) := by
  sorry
```

Then:

- in the module docstring, keep only the §2.3 chart comparison under "Not stated";
- name `exists_homeomorph_pushout_handles` and the three definitions in the **Handles** paragraph of README §2.2.

**Tested.**
- A scratch copy of `Suggested.lean` with this block inserted elaborates under `lake env lean` with eight `sorry` warnings and no error.
- f=x² at c=0: the index is 0 and the attaching region `S⁻¹×D¹` is empty, so the pushout is ∅⊔[−1,1] ≅ {f≤ε}.
- f=−x² at c=0: an arc is attached to the two rays at ±√ε, giving ℝ = {f≤ε}.
- No critical point on the level: the index type is empty and the statement reduces to the band deformation.

## R02 (P3) — M3's smooth proper exhaustion, which GeometricCurrents consumes, is dropped without naming its pinned replacement

**Location.** `README.md:964–971`: "Its inputs are pinned as well (`Geometry/Manifold/Morse/Generic/Strong`): the relative approximation … and the proper approximation `ContMDiffMap.exists_isMorse_isProperMap_mem_ball`".

**Claim.** That passage lists two of the three inputs. The third is the smooth proper nonnegative exhaustion built from a compact exhaustion and a partition of unity. Main's M3 owned it (main `README.md:471–473`), and GeometricCurrents on main consumes it as "MorseTheory M3's early smooth proper bounded-below exhaustion, before its Morse approximation" (`GeometricCurrents/README.md:85`, `:323`). The head names it nowhere, so that citation no longer resolves to anything stated in M3.

**Witness.** Tau Ceti `Geometry/Manifold/Morse/Generic/Strong.lean:292` gets its starting function from `TauCeti.exists_contMDiffMap_isProperMap_nonneg` (`Geometry/Manifold/Exhaustion.lean:71`). `grep exists_contMDiffMap_isProperMap README.md` finds nothing.

**Exact repair.** Add to §3.2, and to the "Strong topology and approximation" bullet of the Tau Ceti contract:

> The smooth proper exhaustion is pinned: `TauCeti.exists_contMDiffMap_isProperMap_nonneg` gives a nonnegative smooth proper function on a Hausdorff σ-compact manifold with a finite-dimensional model, with no boundaryless hypothesis. Its controlled form is `CompactExhaustion.exists_contMDiffMap_isProperMap` (`Geometry/Manifold/Exhaustion`), whose sublevel at height n lies in the n-th compact stage. This is the input that GeometricCurrents consumes before Morse approximation.

**Tested.** On ℝ with the exhaustion Kₙ=[−n,n], the pinned function g satisfies g ≥ (first n with x∈Kₙ). So g(x) ≥ ⌈|x|⌉, which makes g proper, and g ≥ 0.

## R03 (P3) — The decay route uses that γ is C¹ on [0,T₁] without naming the pinned regularity theorem

**Location.** `README.md:1474–1477`: "On [0,T₁] the curve γ is C¹, one-sided at 0 … so `Manifold.riemannianEDist_le_pathELength` bounds the distance". `README.md:1481–1490` (*Needs:*) lists no input for this regularity.

**Claim.** `Manifold.riemannianEDist_le_pathELength` requires `ContMDiffOn 𝓘(ℝ) I 1 γ (Icc a b)`. The hypothesis `IsMIntegralCurveOn γ … (Set.Ici 0)` only gives derivatives within `Ici 0`. The step from one to the other is a pinned theorem, but the route does not name it.

**Witness.** Tau Ceti `Geometry/Manifold/IntegralCurve/Regularity.lean:116`, `TauCeti.contMDiffOn_two_of_isMIntegralCurveOn`, takes `UniqueDiffOn ℝ s`, the curve equation on s, a C¹ field and `BoundarylessManifold`, and gives `ContMDiffOn 𝓘(ℝ, ℝ) I 2 γ s`.

**Exact repair.** After "On [0,T₁] the curve γ is C¹, one-sided at 0" add: "(`TauCeti.contMDiffOn_two_of_isMIntegralCurveOn` with s=`Icc 0 T₁`, which is `UniqueDiffOn`, and the C¹ field −grad f)". Add the same name to the *Needs:* line, marked "(decay only)".

**Tested.** For γ(t)=x₀e^(−2t) on t≥0 (and x₀ for t<0), s=Icc 0 1: γ is C² within s, with right derivative −2x₀ at 0. Its length on s is |x₀|(1−e^(−2)), which bounds the distance from γ(0) to γ(1).

## R04 (P3) — A §2.2 Check names no function

**Location.** `README.md:738`: "The point x=1 belongs to the closed sublevel at level 1 and stays present at level 4; an open-sublevel convention would exclude it."

**Claim.** Without a function the Check has no truth value.

**Witness.** For f=x², f(1)=1≤1 and 1∉{f<1}, so the Check holds. For f=2x, f(1)=2>1, so x=1 is not in the closed sublevel at level 1 and the Check fails.

**Exact repair.** Begin the bullet with "For f=x² on ℝ, the point x=1 …".

**Tested.** f=x²: 1∈{f≤1}⊂{f≤4} and 1∉{f<1}, as the corrected bullet states.

## R05 (P3) — Downstream consumers lists four of the thirteen roadmaps on main that consume this one

**Location.** `README.md:1517–1523`. It names only RiemannianGeometry R3, AffineMorseLefschetz, HeegaardFloer Lane M and ConvexityToric T2.

**Claim.** The section omits nine consumers on main. R02 shows the cost: an object one of the omitted consumers relies on was dropped unnoticed.

**Witness.** On main these nine READMEs cite MorseTheory as a supplier: GeometricCurrents `:85`, DGFloer `:192`, MorseNovikov `:130`, SymplecticFieldTheory `:205`, DiagrammaticCoherence `:196`, SchubertGeometry `:126`, CombinatorialHeegaardFloer `:622`, HamiltonianFloerOperations `:19`, HamiltonianReduction `:159`.

**Exact repair.** Add one sentence per roadmap above, naming the layer it consumes: GeometricCurrents M3 (the smooth proper exhaustion of §3.2), DGFloer M4–M5, MorseNovikov M1–M4 and M6, SymplecticFieldTheory M1–M6, DiagrammaticCoherence M1 and M3, SchubertGeometry M2, CombinatorialHeegaardFloer and HamiltonianFloerOperations (the ordinary Morse and handle core), and HamiltonianReduction M1–M2 and M5.

**Tested.** Each listed line on main cites MorseTheory as a supplier, for example `GeometricCurrents/README.md:323`: "Consume [MorseTheory M3]…'s early smooth proper bounded-below exhaustion".

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Gate.** Re-run on this head: every check is 0 and the result is `OK`. The worker's `gate.md` agrees and records `build=0`. The worktree is clean afterwards. Nothing outside `TauCetiRoadmap/MorseTheory/` differs from main.
- **Dependency check.** Output: `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
  - DGFloer on main consumes M4/M5 (`DGFloer/README.md:192`, `:1361`), and §5.1 consumes DGFloer Layer 1 item 3. This two-way citation already exists on main (main `README.md:885`).
  - DGFloer records it as layer-acyclic ("consumes only Layer1.3's early filtered-complex algebra"), and AlgebraicTopology Stage 5 consumes the same item.
  - The check does not report it, and this review does not count it as a finding.
- **Elaboration.** `lake env lean` on `Suggested.lean` prints seven `declaration uses sorry` warnings (`:76`, `:101`, `:112`, `:126`, `:140`, `:160`, `:173`) and nothing else.
- **Signatures.** All eight elaborated types were compared with the README.
  - Every manifold theorem keeps `FiniteDimensional`, `I.Boundaryless`, `T2Space`, `SecondCountableTopology` and `IsManifold I ∞`.
  - Both gradient theorems keep `RiemannianBundle` and `IsContMDiffRiemannianBundle I ∞ E`.
  - `morse_inequalities` takes `k : Type u`, M's universe, as `README.md:1025` says.
  - `bettiNumber` uses the same `singularHomologyFunctor (ModuleCat.{u} k)` expression as the pinned inequality (`Morse/Inequalities.lean:414`).
  - With `pp.universes`, `exists_cwComplex_homotopyEquiv` has four universe parameters, and X lives in its own (`u_6`). That is true because the model has countably many cells (second countability makes the critical set countable).
- **Padding probe.** Each `sorry` in a scratch copy was replaced by `first | rfl | infer_instance | simp | (intros; exact?) | aesop`. All seven fail, including the m=0 branch at `:145`. Nothing is padding.
- **Headlines.**
  - Stated: the CW model (§2.4), the polynomial inequalities (§4.1), the degenerate two-critical-point sphere theorem with its two inputs (§4.4), and convergence and decay of arbitrary forward curves (§6.1).
  - Consumed from the pin and named in the docstring: the normalized chart, compact finiteness, the regular fibre, band deformation, relative CW attachment, Morse density, proper Morse existence, the alternating inequalities, the LS bound, Reeb, and the maximal-trajectory theorems.
  - Not statable: Layer 5, which needs a Morse–Bott predicate and a normal disc bundle.
  - Statable but absent: the §2.2 handle theorem (R01).
- **Not at the pin.** No `bettiNumber` (the only hit is `firstBetti`, the Betti number of a dual graph). There is no polynomial identity under `Morse/`, no global CW model (`Morse/Exhaustion.lean` has only `:51` and `:110`), no theorem on `IsMIntegralCurveOn … (Ici 0)` for `mgradient`, and no two-open-cell theorem. `TauCeti.brownBicollaring` (`LocallyFlat/Brown.lean:39`) is Brown's 1962 bicollaring theorem, not the Schoenflies theorem, so §4.4 is right to take Schoenflies from GeometricTopology §2.2.

### README identifiers at the pins

The README has 169 backticked identifier tokens, checked by a namespace-aware scan of the pinned sources:
- 139 resolve exactly;
- 12 resolve under the `TauCeti.` prefix inside the Tau Ceti contract (`IsMorse`, `manifoldMorseIndex_le_finrank`, `sqrtNearOne`, …);
- 8 are declared in `Suggested.lean`;
- `lsCupLength` is AlgebraicTopology's (main `:1117`);
- 9 are short forms or notation: `CWComplex`, `RelCWComplex`, `RiemannianBundle`, `encard`, `mgradient`, `SpectralObject`, `Fin.cast`, `Ireal_n.Boundaryless`, `def`.

### Library declarations opened (Tau Ceti 2fd255d, Mathlib 1b1ccf4)

Tau Ceti (paths under `TauCeti/`):
- `Morse/Basic.lean:212`, with `isMorse_iff`: Morse means C^∞ with nondegenerate critical points.
- `Morse/CriticalPoints.lean`:
  - `:87` (zero set of `mvfderiv`), `:342`, `:348`;
  - `:274` (needs `I.Boundaryless` and `IsManifold I 1`, as `README.md:176–178` says);
  - `:426` (`j ≤ finrank`; it needs no `IsManifold`, so the README's "C¹ manifold" is a harmless extra hypothesis).
- `Morse/Index.lean:158`, `:172`: the identity needs a nondegenerate Hessian.
- `Morse/GradientFlow.lean:208`, `:235`, `:261`, `:282`. The binders at `:79–85` are T2, `IsManifold I 2`, boundaryless and a C¹ metric.
- `Morse/ExponentialConvergence.lean:303`: `∃ μ>0, ∃ C>0, ∀ᶠ t in atTop`.
- `IntegralCurve/Maximal.lean:110`, `:116`, `:252` (T2, `IsManifold I 1`, boundaryless, C¹ field). `IntegralCurve/Regularity.lean:116`.
- `Morse/Deformation.lean:199` (a≤b, compact critical-free band). `Morse/RelCWComplex.lean:298`. `Morse/Cell/Comparison.lean:457`.
- `Morse/NormalizedChart.lean:196`: f = f(x)+Σ ±(ψ y)ᵢ² on the whole source.
- `Morse/PseudoGradient/Basic.lean:72`: the field reads `−wᵢzᵢ` for the form `(1/2)Σwᵢzᵢ²`, matching `README.md:288–292`.
- `Morse/Generic/Strong.lean:267`, `:279`, `:290`. `Geometry/Manifold/Exhaustion.lean:46`, `:71`.
- `Morse/LusternikSchnirelmann.lean:185`. `Morse/MinCriticalCount.lean:68`. `Morse/Reeb.lean:148`. `Morse/Inequalities.lean:414`.
- `Analysis/InnerProductSpace/Hemisphere.lean:377`. `AlgebraicTopology/Singular/JordanBrouwer.lean:218`.
- `LocallyFlat/Sphere.lean:73`. `Boundary/BallExterior.lean:106`, `:159`.
- `Topology/Order/Sublevel.lean:124`. `ContMDiffMap/Chart/Seminorm.lean:118`.
- `Algebra/Homology/SpectralSequence/Filtered/` (`Convergence.lean:51`, `:118`; `FirstPage.lean:89`; `Naturality.lean:83`).

Mathlib:
- `Topology/Compactification/OnePoint/Sphere.lean` (`onePointEquivSphereOfFinrankEq`: finite-dimensional, T2, `finrank V + 1 = card ι`).
- `Topology/Compactification/OnePoint/Basic.lean:630`.
- `Analysis/Calculus/ContDiff/Bounds.lean:444`, `:510`.
- `Geometry/Manifold/IntegralCurve/Basic.lean:127–169`. `IntegralCurve/Transform.lean:41`.

### Cross-roadmap citations, resolved on main 08d58bb

- **GeometricTopology.** §2.2 (`:1357–1365`): n≥1, bicollared, with the boundary parametrization. Layer 1 (`:783`): collars `:788`, handles `:851`, tubes `:974`.
- **DifferentialGeometry.** Layer 3 (`:371`), 5.1 (`:507`), 10.2 (`:884`), Layer 12 (`:910`): metric existence 12.1, `mgradient` 12.2, `hessian` 12.3.
- **AlgebraicTopology.**
  - Stage 4 item 4 (`:535`; `diskBoundaryRelCW` `:624`).
  - Item 5 (`:635`; `:644`, `:658`, `:683`, `:700`, `:716`).
  - Item 6, real projective space (`:789`).
  - Stage 6 item 1 (`:1011`).
  - The categorical-cover supplement: `lsCupLength` (`:1117`) and the bound on nonempty X (`:1122`).
- **Others.**
  - CharacteristicClasses C2 (`:728`).
  - ComplexKahlerGeometry K1 (`:96`), K7 (`:1405`), K7.1, K7.2.
  - ComplexManifolds Milestone 1 (`:172`): item 3 is general transport.
  - DGFloer Layer 1 item 3 (`:622–630`).
  - ConvexityToric T2 (`:73`), RiemannianGeometry R3 (`:369`), HeegaardFloer Lane M (`:70`).
  - AffineMorseLefschetz consumes M1–M4 (`:130`).
- **At open heads.** DGFloer keeps item 3 as §1.3 with a mapping sentence (`:178–183`). GeometricTopology keeps §2.2 (`:2151`).

### Overlaps and ownership

- **Dropped ids.** `overlaps.md` lists `#m2-…` and `#m5-…`, cited by HeegaardFloer (`:647`, `:1064`). `README.md:477–483` maps all seven former ids to the new headings, and the GitHub anchors of the new headings were recomputed as stated. No open pull request changes this roadmap or drops an id it cites.
- **Other consumers on main.** All 92 lines on main that mention MorseTheory were read. The objects they cite are still stated, except the exhaustion of R02.
- **Second owners.** `roadmaps grep` over main and every open head was run for the two-open-cell lemma, two critical points, Schoenflies, Betti numbers, the strong inequalities, the CW model and compact trapping. It found consumers only. FourManifolds restates Brown's theorem, but that is FourManifolds' own matter, since GeometricTopology on main owns it. No other `Suggested.lean` uses `TauCetiRoadmap.MorseTheory`.

### Seeded sample: sources

Printed page = PDF page − 13 for cohen-iga-norbury and − 10 for nicolaescu-invitation.

- **§1.3.** Theorem 5.3, cohen-iga-norbury line 1322 (p. 36); Corollary 5.4, line 1423 (p. 38).
- **§2.2.** nicolaescu-invitation Theorem 2.2.3, line 1950 (p. 38: homeomorphism, a single critical point; M is connected and f exhaustive, line 1860). Remark 2.2.5, line 2177 (p. 42).
- **§2.4.** Theorem 5.7, line 1519 (p. 40: closed M).
- **§4.1.** Corollary 5.11, line 1569 (p. 42). The proof at lines 1585–1596 gives c_k=d_(k+1)+b_k+d_k.
- **§4.2.** weber-conley Theorem 1.1, line 65 (p. 2: C², closed M; cat is the least ℓ≥1, lines 62–63; proof pp. 2–3). takens-1968 lines 69, 79–81, 91–96 (pp. 197–198).
- **§4.3.** Application 5.13, line 1617 (p. 43).
- **§4.4.** milnor-1959 Theorem 1(3), lines 72–76 (p. 440), and Corollary 1, line 117 (p. 442). brown-1960 Theorem 5, lines 101–103 (p. 76). The boundary-parametrized form in GeometricTopology §2.2 follows from it by the Alexander trick.
- **§5.1.** Theorems 15.1 (line 4986, p. 143), 15.4 (line 5091, p. 146, compact M), 15.6 (line 5142) and 15.7 (line 5161, p. 147).
- **§6.1.** Theorem 4.6, line 1022 (p. 27). Section 4.3 assumes f Morse (line 913); the proof runs to p. 29.
- **§1.1, §1.2, §2.1, §2.3, §3.1, §3.2.** These are pinned declarations (opened above) or uncertified texts.

### Adversarial table

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §1.1 model transport | self-model ℝ²; half-line model | identity, df=(1,0)=(1,0); range [0,∞)≠ℝ, excluded by `Boundaryless` | consistent | none |
| 2 | §1.2 index identity | −x²+y²; f=0 and x² on ℝ; a point | (1,1) sums to 2; 0+0=0≠1 and 0+1=1; index 0, count 1 | needs nondegeneracy, as stated | none |
| 3 | §1.3 seminorm comparison | τ(y)=y/2 with K=[−2,2], g=x²; reverse τ⁻¹ | sups of g∘τ (1,1,1/2) ≤ 1·max(1,2,2); reverse scales the m-th derivative by 2^m, so C=2^k | true; C depends on k | none |
| 4 | §2.1 levels and faces | f=x on ℝ², c=0; x² at 0; dim 0; x²+y², a=1 | tangent span(e₂)=ker df; df=0 but ker ℝ≠{0}; 0−1=0 in ℕ; circle on `Fin 1` | consistent | none |
| 5 | §2.2 smaller bands; pseudo-gradient | x², a<a′<b′<b; X=−1/(2x) on [1,4] | √a′↦√a equals the one-step image; df(X)=−1, time f(2)−1=3 | true | none |
| 6 | §2.2 Check, `:738` | f=x²; f=2x | 1≤1 holds and 1∉{f<1}; 2>1, the Check fails | ill-posed | R04 |
| 7 | §2.2 handle theorem | x², c=0; −x², c=0; (x²−1)², c=1; no critical point | ∅⊔D¹≅[−√ε,√ε]; rays plus arc ≅ℝ; two intervals plus an arc = {x²≤1+√1.5}, connected; empty index gives the band deformation | true; elaborates | R01 |
| 8 | §2.3 double well, RP² | y=x√(2−x²); 2−f=(2a²+b²)/(1+a²+b²) | 1−y²=(x²−1)², α±(1)=±√(1−1/√2)=±0.541 in two components; degree ±2 | consistent | none |
| 9 | §2.3 polar part | A preserves −\|u\|²+\|v\|² | \|A_uu u\|²=\|u\|²+\|A_vu u\|² gives P≥I; seam: h(2x) at \|x\|=1/2 equals H(·,1)=α₀∘h_∂ | consistent | none |
| 10 | `exists_cwComplex_homotopyEquiv` | T²; x² on ℝ; ∅; f=x; eˣ; universe of X | cells (1,2,1); one 0-cell; empty; f=x has no critical points, ∅≄ℝ; eˣ is not proper; countably many cells, so u_6 is free | true; needs proper and bounded below | none |
| 11 | §3.1 restriction laws | δψ restricted to (0,1); ℝ in ℝ⊔ℝ | δ>x where ψ=1, so \|g\|<x fails; a clopen summand keeps local finiteness | strong-to-strong needs a proper inclusion | none |
| 12 | §3.2 exhaustion | ℝ with Kₙ=[−n,n]; the pinned proof | g(x)≥⌈\|x\|⌉, proper; `Strong.lean:292` uses it | pinned input unnamed | R02 |
| 13 | `morse_inequalities` | RP³ over ℚ and 𝔽₂; Klein bottle over ℚ; T²; ∅ | (1,1,1,1)−(1,0,0,1)=(1+t)t, Q=t; Q=0; (1,2,1)−(1,1,0)=(1+t)t; Q=0; 0=0 | true | none |
| 14 | §4.1 partial sums | c=(2,0,0,2), b=(1,0,0,1) | S₁: −2≥−1 is false; S_n+S_(n−1)=x_n gives c_j−b_j=q_j+q_(j−1) | route correct | none |
| 15 | `bettiNumber` | S¹⊔S¹ in degree 0; RP² in degree 1; discrete ℕ | 2; 0 over ℚ and 1 over 𝔽₂; finrank of ⊕_ℕ k is 0 (junk, as the API says) | matches the API | none |
| 16 | §4.2 LS and cup length | T²; RP² over 𝔽₂; S¹⊔S¹; ∅ | 4≥3≥2+1; 3≥3≥2+1; 4=2+2 but normalized 1+1≠3; 0+1≤0 is false | true; nonemptiness needed | none |
| 17 | §4.3 parity and duality | χ via c_j(−f)=c_(m−j)(f), m odd; RP², b₁(ℚ)=0, π₁≠0 | χ=(−1)^m χ, so χ=0; c₁=0 would force π₁=0 | true | none |
| 18 | `exists_twoEuclideanOpenCover_of_two_criticalPoints` | RP²; S¹ with η²=3/4; m=0 | cat 3 forces ≥3 critical points, so the hypothesis fails; T>8/3; U={x}≅ℝ⁰ | consistent | none |
| 19 | `nonempty_homeomorph_sphere_of_two_euclidean_opens` | RP²; point with m=0; ℝ^m | two ℝ² opens would give cat≤2<3, so no such cover; 1≠2 points, excluded by 0<m; not compact | true | none |
| 20 | two-open-cell route | annulus bicollar; complement of (int D∩V)∪{∞} | s/(1+\|s\|) maps onto (−1,1); the complement is C, compact in V, so the set is open | route correct | none |
| 21 | `nonempty_homeomorph_sphere_of_two_criticalPoints` | h−h³/3 on S^m; two points | Hessians 0 (f=2/3−r⁴/4+…), gives S^m; S⁰ | true | none |
| 22 | §5.1 Morse–Bott | y²; y⁴; Möbius line; RP² filtration | ranks (0,1); kernel ℝ²; H₀ with twisted coefficients is ℤ/2; E²=(ℤ,ℤ/2,0) | consistent | none |
| 23 | `tendsto_of_isMIntegralCurveOn_neg_mgradient` | cos x, x₀=1, K=[−4,4]; metric x⁻²dx² | x′=sin x→π∈K, critical; x₀/(1+x₀t)→0, regular (the metric is not smooth) | true; needs a smooth metric | none |
| 24 | `exists_edist_le_exp_of_tendsto_neg_mgradient` | cos x near π; x⁴; 4dx² with x² | rate 1 = Hessian; (x₀⁻²+8t)^(−1/2), excluded by Morse; 2\|x₀\|e^(−t/2) | true | none |
| 25 | §6.1 constants and regularity | t≥T₁; t≤T₁; γ=x₀e^(−2t) on Icc 0 1 | Ce^(μt₁)e^(−μt); B≤Be^(μT₁)e^(−μt); C² within the set, length \|x₀\|(1−e^(−2)) | route correct; input unnamed | R03 |

## Not verifiable

- **milnor-1963, hirsch-differential-topology, lee-smooth-manifolds.** The manifest settles them as uncertified; they were not read. This covers:
  - Milnor 1963 Theorem 3.1, p. 12; Lemma 3.6, pp. 20–21; Theorem 3.5, p. 20; Corollary 6.7, p. 36;
  - Hirsch Chapter 2 §1 and Chapter 6 Theorem 1.2;
  - Lee Corollary 5.14 and Proposition 5.38.
- **ManifoldOptimization (#1506).** It is listed as closest in vocabulary, but no checkout was given. Ownership against it was checked only through `roadmaps grep` over the open heads.

## Source issues

- **Misprint** in cohen-iga-norbury at Corollary 5.11, p. 42: the source says the alternating sums over k have summands c_i and b_i; it should be c_k and b_k; affects a stated result.
- **Error** in cohen-iga-norbury at Theorem 15.6, p. 147: the source says relative homology of the filtration's subquotients is the E² term; it should be the E¹ term, E² being its homology; affects a stated result.
- **Error** in cohen-iga-norbury at Theorem 15.1, p. 143: the source says the normal-form diffeomorphism is defined on all of U×ℝ^λ×ℝ^(m−n−λ); it should be defined on a neighbourhood of U×{0}, since the quadratic form is unbounded; affects a stated result.
- **Gap** in cohen-iga-norbury at Theorem 4.6, p. 28: the source says the derivative of f∘γ tends to 0 because f∘γ is bounded and decreasing; it should also use uniform continuity of ‖∇f‖² along γ (bounded speed on compact M); affects the proof.
- **Misprint** in cohen-iga-norbury at Application 5.13, p. 43: the source says the lower disc is f⁻¹[t₁,a]; it should be f⁻¹[t₀,a], t₀ being the minimum value; affects the proof.
- **Misprint** in weber-conley at footnote 3, p. 3: the source says the half-line `[0,∞)` for `f(u)=u³` is `W^u(0)`, while calling it the stable manifold; it should be `W^s(0)`; affects nothing.
