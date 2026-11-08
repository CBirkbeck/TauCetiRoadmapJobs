# Review of TeichmullerGeometry (pull request #1169 at 73cc9c4)

**Verdict:** needs changes

This is a full re-review: the folder changed by 607 lines since `f1d0a04`. Of the previous round's eleven findings, nine are repaired, one is partly repaired and one is not. The gate passes. Four findings block:

- the supply between this roadmap and FuchsianOrbifolds' revision runs both ways, and two objects have two owners (R01);
- GeometricTopology's revision still claims path smoothing and the sphere and torus mapping class groups (R02);
- Layer 5 asserts Dehn–Nielsen–Baer injectivity and homotopy uniqueness for `S²`, where both fail (R03);
- the full Dehn–Nielsen–Baer isomorphism and the measurable Riemann mapping theorem can be stated at the pins, but `Suggested.lean` states neither (R04).

Mechanical checks at this head:

- **Gate.** My own run agrees with the worker's: `set_option=0 … sorry-data=0 … statement-hygiene=0 … depcheck=0 … outside-folder=0 source-material=0 build=0 OK`.
- **Elaboration.** `lake env lean TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` exits 0. It gives 21 `declaration uses 'sorry'` warnings and nothing else.
- **Dependency check.** It reports `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The check reads only main, so it cannot see the cycle through #1168 (R01).
- **Other changes.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TeichmullerGeometry'` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

## Previous findings

- **R01 (deck endpoint): repaired.** Line 508 now reads "`η(op p)` is the deck transformation sending the base lift `x̃₀` to the endpoint of the lift of `p` from `x̃₀`". Line 512 derives the homomorphism law. Both agree with the pinned `deckFundamentalGroupEquiv_symm_op` and `monodromy_basepointLift` (table row 9).
- **R02 (GeometricTopology ownership): partly repaired.**
  - Repaired: Radó's theorem, the Hauptvermutung, smoothing, isotopy to diffeomorphisms, the smooth mapping class groups and Smale's theorems are now deferred (line 27: "GeometricTopology Layer 11.2.1 items 2 to 5 … Layer 1.7.2 … Layer 3.4"). §§5.3–5.3b are gone, and no roadmap cites them.
  - Still open: path smoothing, and the sphere and torus computations (R02).
  - #903 is not yet declared as a dependency (R08).
- **R03 (π/21 and arithmetic finiteness): repaired.** Line 28 and §10.1 (line 886) cite `TauCeti.one_div_forty_two_le_hyperbolic_deficit` and `TauCeti.hyperbolic_deficit_two_three_seven`. Line 26 defers the equality case and Layer 7 item 4 to FuchsianOrbifolds. Of Layer 5 only item 1 is still cited, and #1168 has changed that item (R01, third bullet).
- **R04 (Nielsen lifting form): repaired.** `nielsen_realization` is stated at `Suggested.lean` line 658, and §8.2 (line 780) names it. The docstring (lines 57–58) lists only the fixed-point form as not statable.
- **R05 (§0.4 Check 1): repaired.** Line 320: "for other `φ` it holds exactly when `m ∘ φ ∘ m⁻¹` is isotopic to an automorphism of `X`".
- **R06 (§10.1 Check 3): repaired.** Line 892: "a bound `84(g − 1) = 84` on the total index would fail here (`96 > 84`)".
- **R07 (§9.2 Check 3): repaired.** Line 858 bounds `2h + r` and exhibits `(0; 2, 3, m)`.
- **R08 (earthquake direction): repaired.** Line 765: "`E^(ℓ_γ)_γ(X, m) = (X, m ∘ τ_γ) = τ_γ⁻¹ ⋅ (X, m)` … raises the twist coordinate". This agrees with line 769 and §7.2.
- **R09 (two Check reasons): repaired.** Line 124 uses continuity with unbounded `q`. Line 502 gives a Baire argument for uniqueness of the lift, without torsion-freeness.
- **R10 (locators): repaired.**
  - Each of the five targets now says that its proof is the roadmap's own: §0.0d (line 171), §0.5 (line 328), §5.6 (line 643), §7.2 (line 699) and §8.4 (line 805).
  - Kriegl–Michor is narrowed (line 284): "whose manifolds have no boundary. For `D²` with a collar, apply the same theorems to the open disc".
  - Other sampled targets still lack locators (R07).
- **R11 (dropped T-ids): not repaired.** The README has no old → new line, and #1168 still cites `T0`–`T10` (R09).

## R01 (P2) — The supply with FuchsianOrbifolds' revision runs both ways, and two objects have two owners

**Location.** README line 40: "GeometricTopology, ComplexCurveModuli and FuchsianOrbifolds have no dependency on this roadmap". Also §4.1 (line 495), Scope lines 21 and 33, the FuchsianOrbifolds contract (line 97) and §0.0f *Needs* (line 226).

**Claim.** This README cites FuchsianOrbifolds Layer 4a and Layer 7 items 1 and 4. Only #1168 defines them, so #1168 must merge first. At that head, three things conflict with this roadmap:

- **The supply is cyclic.**
  - #1168's Layer 9 consumes this roadmap: line 1388 reads "consume TeichmullerGeometry T10's common-generic-locus theorem", and line 1407 reads "the geometric surface-group convention fixed by TeichmullerGeometry T4a".
  - Its graph (line 32) has `Teichmuller T0,T4a,T9,T10 → Fuchsian L9`, so line 40 is false at the head this README needs.
  - The ids `T0`–`T10` exist nowhere in this README.
- **The isometric action and its kernel have two owners.**
  - #1168's Layer 0 item 2 (lines 277–282) builds the `PGL₂(ℝ)` action with conjugation for negative determinant, proves it isometric, and proves its kernel is the scalars.
  - Those are two of the three clauses of `exists_mulEquiv_isometryEquiv_glAction`.
  - Meanwhile #1168 line 146 hands "`RiemannianIsometry(H²)≃PGL₂(ℝ)`" to this roadmap.
- **Genus and Riemann–Hurwitz come through SurfaceTopology.**
  - #1168's Layer 5 item 1 (line 440) consumes "SurfaceTopology Layer 8's compact oriented surface classification, standard models, genus".
  - Its item 2 (line 450) uses "SurfaceTopology Layer 5's generic branched-cover theorem".
  - This roadmap owns both objects (§0.0f, §0.0g) and may not consume SurfaceTopology.
  - The contract at line 97 still describes main's item 1.

**Witness.** #1168 README lines 32, 146, 277–282, 440, 450, 1388 and 1407. Main's FuchsianOrbifolds ends at Layer 6 (line 344) and has no Layer 4a or Layer 7.

**Repair.**
- **Settle the direction with #1168.** Its Layer 9 should move to the later Fuchsian roadmap that line 40 and Downstream consumers (line 971) already name, so that FuchsianOrbifolds consumes nothing from this roadmap.
- **§4.1.** Choose one of two options and say which in the Scope:
  - cite FuchsianOrbifolds Layer 0 item 2 (as at #1168) for the isometric action and the kernel, keep the surjectivity onto `Isom(ℍ)` and the isomorphism here, and reword line 21;
  - or have #1168 restore main's restriction-only Layer 0 item 2.
- **§0.0f.** Remove "FuchsianOrbifolds Layer 5 item 1" from *Needs* (line 226) and from the deferral at line 33. Keep the agreement of `Surface.genus` with Fuchsian's genus as a Check. Then nothing here depends on SurfaceTopology through #1168.

## R02 (P2) — Two objects still have two owners in GeometricTopology's revision

**Location.**
- Scope line 12: "the parameter-smoothing converse is owned here"; also §0.2 (line 284).
- Scope line 16: "the mapping class groups of the sphere and the torus"; also §5.4a (line 618).

**Claim.**
- **Path smoothing.** #903's Layer 3.1 (lines 1186–1188) says "the smoothing of paths is Layer 3.3's". §0.2 owns the same theorem for compact surfaces. #903's Layer 3.3 does not state it yet.
- **The sphere and the torus.** #903's Layer 1.7.2 computes "`Mod⁺(S²)` is trivial, from `Diff(S²) ≃ O(3)`" (line 980) and "`Mod⁺(T²) ≅ SL₂(ℤ)` and `Mod(T²) ≅ GL₂(ℤ)`" (line 984). Its line 133 calls Layer 1.7.2 "the single owner of the mapping class groups of compact surfaces". §5.4a proves the torus case again by Epstein, although its sphere case already transports GeometricTopology's result through §0.0h.

**Witness.** #903 README lines 133, 980, 984 and 1186–1188, against README lines 12, 16 and 284.

**Repair.**
- **Path smoothing.** It holds for every compact manifold, and GeometricTopology is the earlier roadmap. Choose one of two options and say which in the Scope:
  - #903's Layer 3.3 states "a continuous path in `Diff(M)` is homotopic rel endpoints, and rel a collar it fixes, to a smooth isotopy", and §0.2 and line 12 cite it;
  - or #903 deletes the clause at its line 1188, and line 12 keeps the ownership.
- **The sphere and the torus.** Reword line 16 to "the topological forms `mcg_sphere_full` and `mcg_torus_full`, transported from GeometricTopology Layers 1.7.2 and 3.4 through §0.0h". Add #903 Layer 1.7.2's torus computation to §5.4a's route and *Needs*, as the sphere route already does. The Epstein route may stay as an alternative.

## R03 (P2) — Layer 5 asserts Dehn–Nielsen–Baer injectivity and homotopy uniqueness for `S²`, where both fail

**Location.**
- Line 577: "The theorems of 5.1 to 5.4 are stated and proved for every closed orientable surface".
- Line 605: "Conclude that `Mod±(Σ) → Out(Π)` is injective, hence by Layer 5.2 an isomorphism".
- Line 581: "uniqueness up to based homotopy … The same construction applies to … the sphere".

**Claim.**
- **Injectivity.** For `Σ = S²`, `Out(π₁) = 1` but `Mod±(S²)` has two elements, so the map is not injective.
- **Uniqueness.** `π₂(S²) = ℤ`, so maps of `S²` inducing the same homomorphism on `π₁` need not be homotopic. The uniqueness clause of §5.1 fails there.

**Witness.** `mcg_sphere_full` and §3.1 Check 1 give `Mod±(S²) = ℤ/2`. The identity and the antipodal map induce the same map on `π₁(S²) = 1`, but their degrees are `+1` and `−1` (§0.2 Check 1).

**Repair.**
- **Line 577.** Write "… for every closed orientable surface of genus at least one; on `S²`, which is not aspherical, only the realization of §5.2 and `baer_epstein_smooth` hold".
- **§5.1.** Restrict asphericity and uniqueness up to based homotopy to genus `≥ 1`.
- **§5.4.** Write "for genus `g ≥ 1`, `Mod±(Σ) → Out(Π)` is injective".
- **New Check.** On `S²`, `Mod±(S²) = ℤ/2 → Out(1) = 1` is not injective, while `Mod⁺(S²) ≃ Out⁺` holds.

## R04 (P2) — Two headline theorems statable at the pins are missing from `Suggested.lean`

**Location.**
- `Suggested.lean` lines 62–67 list as not statable "the full Dehn–Nielsen–Baer isomorphism `Mod±(Σ) ≃ Out(π₁ Σ)` … no outer automorphism group `Out` of a group exists at the pins, and the comparison map needs the change of basepoint along a path".
- The measurable Riemann mapping theorem (Scope line 18, §7.4) is neither stated nor named.

**Claim.**
- **`Out`.** It is a two-line quotient of `MulAut G` by the range of `MulAut.conj`.
- **The comparison map.** It is pinned on basepoint-fixing homeomorphisms, which represent every class, so no path is chosen. The Summary lists this theorem as a headline.
- **The measurable Riemann mapping theorem.** It needs no Teichmüller carrier. Tau Ceti's `TauCeti.HasWeakFDerivOn` (`Analysis/Sobolev/WeakDeriv/Basic.lean` line 251) expresses a `W^{1,2}_loc` Beltrami solution.

**Witness.** Appended to scratch copies, both statements below elaborate with only the `sorry` warning. The repair is tested on the instances that motivate it:
- the hypothesis `1 ≤ Surface.genus S` excludes `S²` (R03);
- the constant coefficient `μ = a` is solved by `f(z) = (z + a z̄)/(1 + a)`, with `f_z = 1/(1+a)` and `f_z̄ = a/(1+a)`, the solution §7.4 Check 4 names.

```lean
instance innerAut_normal (G : Type*) [Group G] : (MulAut.conj : G →* MulAut G).range.Normal where
  conj_mem := by
    rintro _ ⟨g, rfl⟩ φ
    refine ⟨φ g, ?_⟩
    ext x
    simp [MulAut.conj_apply, mul_assoc]

abbrev OuterAut (G : Type*) [Group G] : Type _ := MulAut G ⧸ (MulAut.conj : G →* MulAut G).range

theorem dehn_nielsen_baer {S : Type*} [TopologicalSpace S]
    [ChartedSpace (EuclideanSpace ℝ (Fin 2)) S] [IsManifold (𝓡 2) ∞ S] [TauCeti.Orientable (𝓡 2) S]
    (hS : TauCeti.IsClosedConnectedSurface S) (hg : 1 ≤ Surface.genus S) (x₀ : S) :
    ∃ e : MappingClassGroupFull S ≃* OuterAut (FundamentalGroup S x₀),
      ∀ (f : S ≃ₜ S) (hf : f x₀ = x₀) (α : MulAut (FundamentalGroup S x₀)),
        α.toMonoidHom = FundamentalGroup.mapOfEq (f : C(S, S)) hf →
          e (QuotientGroup.mk f) = QuotientGroup.mk α := by
  sorry

theorem measurable_riemann_mapping (μ : ℂ → ℂ) (hμ : AEStronglyMeasurable μ volume)
    (k : ℝ) (hk : k < 1) (hbound : ∀ᵐ z ∂volume, ‖μ z‖ ≤ k) :
    ∃! f : ℂ ≃ₜ ℂ, f 0 = 0 ∧ f 1 = 1 ∧
      ∃ U : ℂ → ℂ →L[ℝ] ℂ, TauCeti.HasWeakFDerivOn volume ⊤ f U ∧
        (∀ v : ℂ, ∀ K : Set ℂ, IsCompact K → MemLp (fun z => U z v) 2 (volume.restrict K)) ∧
        ∀ᵐ z ∂volume, (U z 1 + Complex.I * U z Complex.I) / 2 =
          μ z * ((U z 1 - Complex.I * U z Complex.I) / 2) := by
  sorry
```

The second statement needs `import TauCeti.Analysis.Sobolev.WeakDeriv.Basic` and `open MeasureTheory`.

**Repair.**
- Add both statements to `Suggested.lean`, with docstrings citing:
  - for Dehn–Nielsen–Baer, Farb–Margalit, Chapter 8, and §5.4;
  - for the measurable Riemann mapping theorem, Ahlfors–Bers 1960, Theorem 1, and §7.4.
- Name the first in §5.4 with its genus hypothesis.
- Remove the Dehn–Nielsen–Baer bullet from the docstring's not-statable list.

## R05 (P3) — The Checks of §10.4 and §11.1 invert the inclusion between `Max_g` and the trivial-isometry locus, and §8.1 misidentifies `ML(T²)`

**Location.**
- Line 935: "A point of `Teich(S_3)` with trivial conformal and anticonformal isometry group is in `Max_3` … so the locus of Layer 8.5 is contained in `Max_g`, and `Max_g` is strictly larger, containing surfaces with automorphisms".
- Line 955: "a generic genus-three surface with an involution … may or may not be maximal".
- Line 772: "`ML(Σ)` for the torus is `ℝ²`".

**Claim.**
- **The inclusion runs the other way.** A nontrivial conformal or anticonformal isometry of `X` lifts to `a ∈ N_PGL₂(ℝ)(Γ) ∖ Γ`, and `⟨Γ, a⟩` is a discrete proper overgroup. So `Max_g` lies inside the Layer 8.5 locus, and no surface with an involution is maximal.
- **The descent step fails.** "Descends to an isometry of `X` by the core construction" needs `Λ` to normalize `Γ`, and a non-normal overgroup does not.
- **`ML(T²)`.** Measured laminations are unoriented, so `(p, q)` and `(−p, −q)` are the same lamination.

**Witness.** In §10.4's own family, `N = Π` gives `Q_Π = 1`, and `B_Π` is the set of points with nontrivial `Mod±` stabilizer. Hence `Max_g = Teich ∖ ⋃ B_N ⊆ Teich ∖ B_Π`, which is the Layer 8.5 locus.

**Repair.**
- **Line 935.** Write "A point of `Max_3` has trivial conformal and anticonformal isometry group: a nontrivial isometry lifts to `a ∈ N_PGL₂(ℝ)(Γ) ∖ Γ`, and `⟨Γ, a⟩` is a discrete proper overgroup (the member `B_Π`). So `Max_g` lies in the Layer 8.5 locus; the converse is not claimed, since a proper overgroup need not normalize `Γ`."
- **Line 955.** Write "Maximality implies a trivial isometry group, so the Layer 8.5 locus contains `Max_g`. Arithmeticity is independent of both: the Klein quartic is arithmetic and not maximal, and a surface with an involution is never maximal and is nonarithmetic off finitely many orbits."
- **Line 772.** Write "`ML(T²) = ℝ²/{±1}`, with `i([p, q], [r, s]) = |ps − qr|`", and drop the clause about the scaling action.

## R06 (P3) — `HasPowerMapModelAt` and `IsBranchedCover.local_degree_unique` restate Tau Ceti's `IsLocalPowerAt` and its uniqueness

**Location.** `Suggested.lean` lines 359–367 (`HasPowerMapModelAt`) and 386–391 (`IsBranchedCover.local_degree_unique`); README §0.0g, lines 230 and 232.

**Claim.**
- Tau Ceti already has the local power model and the uniqueness of its exponent, on arbitrary topological spaces and without Hausdorffness.
- With it, `local_degree_unique` is the pinned lemma at interior points plus the field `local_degree_one_boundary`, so it is not a headline.

**Witness.** Tau Ceti, `Topology/Covering/LocalPower.lean`:
- line 72, `IsLocalPowerAt f x e`: charts centred at `x` and `f x` with `ψ (f (φ.symm w)) = w ^ e` on `φ.target`;
- line 178, `IsLocalPowerAt.unique`: `IsLocalPowerAt f x e → IsLocalPowerAt f x e' → e = e'`.

**Repair.**
- In `IsBranchedCover`, write `local_power : ∀ x ∈ (𝓡∂ 2).interior X, TauCeti.IsLocalPowerAt p x (e x)`.
- Delete `HasPowerMapModelAt` and `IsBranchedCover.local_degree_unique` from `Suggested.lean`.
- Add `TauCeti.IsLocalPowerAt` and `TauCeti.IsLocalPowerAt.unique` to the Tau Ceti contract and to §0.0g's *Needs*. In §0.0g, state the uniqueness in prose as consumed, with no backticked name of this roadmap's own.
- §0.0g's first Check still holds: `IsLocalPowerAt id x 2` contradicts `IsLocalPowerAt id x 1` by `unique`.

## R07 (P3) — Sampled targets without a source locator

**Location.**
- §0.0g, line 232: `exists_degree`, `riemannHurwitz` and the local degree.
- §4.1, line 495: `exists_mulEquiv_isometryEquiv_glAction` and isometry lifting.
- §5.1, line 581: asphericity, realization of isomorphisms by based maps, uniqueness up to based homotopy.
- §8.3, line 793: the local models of a finite isometry group.
- §10.2, line 898: the outer-action identity and the finiteness of `𝒩_D(Π)`.

**Claim.** Each states theorems with hypotheses but gives neither a locator nor the clause "the roadmap's own" that §§0.5, 5.6, 7.2 and 8.4 now carry.

**Witness.** None of the five paragraphs has a parenthetical source. hatcher2002 line 3905 (Proposition 1B.9, p. 90) states §5.1's realization and uniqueness for a `K(G, 1)` target.

**Repair.**
- **§5.1.** Add "(Hatcher, *Algebraic Topology*, Proposition 1B.9, p. 90, for a `K(G, 1)` target)", together with R03's genus restriction.
- **The other four.** Give a theorem-and-page locator in a source that states the result, or add the clause "proved by the route given here, which is the roadmap's own".

## R08 (P3) — The dependencies on #903 and #1168 are not declared

**Location.** The description's task list reads "depends on: #953". The merge-order paragraph reads "#271 (SurfaceTopology, mccorvie) → **this pull request**".

**Claim.**
- GeometricTopology Layers 1.7, 1.7.2, 3.3, 3.4, 11.2.1 and 11.3 exist only at #903's head. FuchsianOrbifolds Layer 4a and Layer 7 exist only at #1168's head. Both must merge first.
- The merge-order chain is computed from the task list, which names neither. It names #953 instead, and ComplexKahlerGeometry is now on main.
- The chain names SurfaceTopology, which this roadmap may not consume and no longer cites.
- The description mentions #903 and #1168 only in prose, as "public contracts" and a "companion proposal".

**Witness.** Main's GeometricTopology README has unnumbered Layers 1, 3 and 11 (lines 177, 357 and 831), with no 1.7.2, 3.3, 3.4, 11.2.1 or 11.3. #903's README defines them at lines 952, 1225, 1261, 6634 and 6701.

**Repair.** Make the description's task list read "depends on: #903" and "depends on: #1168", and drop #953. This also completes the merge-order half of the previous R02 and R03.

## R09 (P3) — Other roadmaps cite ids and objects this roadmap no longer has, with no old → new line

**Location.** Downstream consumers, README lines 969–973.

**Claim.**
- **#1168 (FuchsianOrbifolds).** It cites TeichmullerGeometry `T0`, `T3`, `T4a`, `T5`, `T7`, `T8`, `T9` and `T10` (lines 32, 142–147, 183–187, 1377–1388, 1407, 1443–1449, 1461–1462). None of these ids exists here (previous R11).
- **QuaternionArithmetic (#1722, lines 84 and 260).** It takes from §9.1 that "the norm-one order group … is a discrete finite-covolume subgroup". §9.1 now consumes that from FuchsianOrbifolds Layer 7 item 1.
- **GroupActionsOnRiemannSurfaces (#1728, lines 315 and 390).** It takes "the minimum area `π/21` and its equality case" from §10.1. §10.1 now takes the equality case from FuchsianOrbifolds Layer 4a and the inequality from Tau Ceti.

**Witness.** `grep -E '\bT(0|3|4a|5|7|8|9|10)\b'` on this README returns nothing. Line 840 reads "Arithmetic lattices of `PSL₂(ℝ)` are FuchsianOrbifolds Layer 7 item 1's". Line 886 reads "the equality case … is FuchsianOrbifolds Layer 4a's".

**Repair.** Under Downstream consumers, add one line per moved id or object, as #1168 uses them:
- `T0` → Layers 0–3;
- `T3` → §3.3;
- `T4a` → §§4.2–4.5;
- `T5` → §7.5;
- `T7` → §§8.3–8.5;
- `T8` → §§9.1–9.3;
- `T9` → §4.1 and §§10.1–10.4;
- `T10` → §11.1;
- the lattices `Γ(O)` → FuchsianOrbifolds Layer 7 item 1, consumed in §9.1;
- the equality case of `π/21` → FuchsianOrbifolds Layer 4a, and the inequality → `TauCeti.one_div_forty_two_le_hyperbolic_deficit`, both in §10.1.

## Verified sound

### Adversarial table

The table has 37 rows. They cover the fifteen sampled targets, every declaration of `Suggested.lean`, the two missing headlines, and every target a finding touches.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | §0.0a `exists_pl_approximation_open` | `f = id`; the `1/q` error; `x ↦ ‖x‖x` | `g = id` works; the infimum of the `1/q` error on every ball is 0, so it is not admissible; `r ↦ r²` radially is not PL at 0 but is approximable | true | none |
| 2 | §0.0a `exists_pl_approximation_halfPlane` | `(x₀,x₁) ↦ (x₀, x₁+x₀²)` | preserves `x₀ ≥ 0`; fixes `x₀ = 0` pointwise | hypotheses satisfiable, true | none |
| 3 | §0.0b `image_boundary` | closed disc vs `S²`; origin of the half-plane | boundaries `S¹` and `∅`; Mathlib `boundary` = not `IsInteriorPoint` of `extChartAt` (`InteriorBoundary.lean` lines 94, 112) | true with `ChartedSpace` alone | none |
| 4 | §0.0b `PLStructure`, `.map` | tetrahedron with radial chart; `x ↦ (‖x‖/ε)x` in a face | `r ↦ r²/ε` is not PL; the comparison is not PL; same complex | data correctly carried | none |
| 5 | §0.0c Euler and orientation | `∂Δ³`; its subdivision; solid `Δ³`; 7-vertex torus; Möbius band | `4−6+4=2`; `14−36+24=2`; `4−6+4−1=1`; `7−21+14=0`; double cover is a connected annulus; hatcher2002 lines 10170–10200 | consistent | none |
| 6 | §0.0d `isotopic_of_homotopic_closedSurface` | `S²`, `RP²`, disc | degree 1 gives isotopic; `Mod(RP²) = 1`; the disc is excluded by `∂ ≠ ∅`; epstein1966 lines 604–607 | true | none |
| 7 | §0.0d `isotopicRel_of_homotopicRel` | disc id vs conjugation; annulus twist | they differ on `∂`, so the hypothesis fails; the twist equals id on `∂` but is not homotopic rel `∂` | true | none |
| 8 | §0.0e compatibility and the two models | one-triangle disc; its barycentric subdivision | rank ≤ 1 at a corner; subdivision lemma at `SmoothTriangulation/Subdivision.lean` line 63; `trans_diffeomorph` needs `n ≠ 0` | Checks hold | none |
| 9 | §4.2 `η` | circle, generator `p` with lift `0 ↦ 1` | `η(op p)(0) = loopDeck(p⁻¹)(0) = p⁻¹ • 0 = monodromy = 1`; pin `deckFundamentalGroupEquiv_symm_op` | repaired, true | none |
| 10 | §0.0f `word`, `eulerChar` | `orientable 0 1`; `orientable 3 0`; `nonorientable 2 1` | `[c, free, c⁻¹]` (`rfl`); `−4` (`decide`); `−1` (`decide`) | correct | none |
| 11 | §0.0f models | sphere `a a⁻¹`; `RP²` `a a`; annulus `c₀h₀c₀⁻¹c₁h₁c₁⁻¹` | conjugation; antipodal; 3 vertex classes, 4 edges, χ = 0 | correct | none |
| 12 | `classification_of_surfaces`, `homeomorph_unique`, `homeomorph_iff_invariants` | torus vs Klein bottle; torus vs annulus; Dyck surface | χ 0/0, orientability differs; b 0/2; `xyx⁻¹y⁻¹zz` gives χ = −1 = `nonorientable 3 0` | each invariant needed | none |
| 13 | `Surface.genus`, `eulerChar_eq_two_sub_two_mul_genus` | torus; Klein bottle; a non-surface | 1 with `χ = 0 = 2 − 2`; 2 (crosscaps), excluded by orientability; `sInf ∅ = 0` | true | none |
| 14 | §0.0g `IsBranchedCover`, `exists_degree`, `riemannHurwitz` | `zⁿ` on `Ĉ`; `zⁿ` on the closed disc; `RP²` double cover | `2 = 2n − 2(n−1)`; `1 = n − (n−1)`; `2 = 2·1`; the branch fibre has 1 point and weighted count `n` | true | R07 |
| 15 | §0.0g `local_degree_unique` | identity with `e = 2` | power model fails (injective vs 2-to-1); same as `IsLocalPowerAt.unique` at the pin | duplicate | R06 |
| 16 | §0.0h subgroups and `MappingClassGroupPL.toTop_bijective` | disc conjugation; annulus twist; `A₄` vs transposition on `∂Δ³` | `\|MCG(D²)\| = 2`; twist trivial through `[θ+st]`; even permutations preserve orientation; isotopy slices `r ↦ ((1−s)+sr/ε)r` strictly increasing | consistent; Epstein A4 at epstein1966 line 778 | none |
| 17 | §0.2 paths and isotopies | rotation vs antipodal map of `S²`; torus shear | antipodal degree `−1`; shear acts on `H₁` by `[[1,0],[1,1]]`; Kriegl–Michor 42.1 p. 439, 42.5 p. 442, 43.1 p. 454 verified | true | R02 (owner) |
| 18 | §0.4 marking relation | genus 2, `φ = m⁻¹hm`; generic torus shear | `h_* = −1`, realized; `±1` vs `[[1,1],[0,1]]` | repaired | none |
| 19 | §4.1 `exists_mulEquiv_isometryEquiv_glAction` | `diag(−2,1)`; `λI` with `λ < 0`; two lifts | `i, 2i ↦ 2i, 4i` and `dist = log 2` kept; `det = λ² > 0`, so `λI` acts trivially; Baire gives `a'a⁻¹ ∈ Γ₂` | true | R01, R07 |
| 20 | §5.1 realization | torus shear; `S²` with id and antipodal map | linear shear; both induce id on `π₁ = 1`, degrees `±1` | uniqueness fails for `S²` | R03, R07 |
| 21 | §5.2 `exists_diffeomorph_mapOfEq_eq` | torus `(1,0) ↦ (1,1)`; `S²` | the shear fixes 0; `Aut(1) = 1` | true, all genera | none |
| 22 | §5.4 `baer_epstein_smooth` | Klein bottle `(x,−y)`; torus `(x,−y)` | equals `(x+½,y)`, isotopic by `(x+t/2,y)`; on the torus `diag(1,−1)` on `H₁`, not homotopic to id | true | none |
| 23 | §5.4 DNB conclusion | `S²` | `Mod±(S²) = ℤ/2 → Out(1) = 1` | false for `S²` | R03 |
| 24 | §5.4a `mcg_sphere_full`, `mcg_torus_full` | reflection·antipodal; `−I`; swap | rotation by `π`, det 1; `det(−I) = 1`, 4 fixed points; det `−1` | true | R02 (route) |
| 25 | §5.5 curve systems | chain of `2g+1` curves; `2g` curves | `χ = 0 − 2g`; complement `χ = (2−2g) + 2g = 2`, two discs; one disc for `2g`; epstein1966 lines 109–115, 214–217 | correct | none |
| 26 | §5.6 stabilizers | `H = Aut(Π)`; `H = Inn(Π)` | index ∞ with empty fixed set; index 1, everything fixed | consistent | none |
| 27 | §8.1 earthquake direction | one cuff | `τ⋅`: `t − ℓ`; `E^ℓ`: `t + ℓ` | repaired | none |
| 28 | §8.1 Check 4 `ML(T²)` | `(1,0)`, `(−1,0)` | the same unoriented lamination | `ℝ²/{±1}`, not `ℝ²` | R05 |
| 29 | §8.2 `nielsen_realization` | `F = ⟨−I⟩` on `T²`; Klein four with translation; Dehn twist | `(½−x, −y)` is an involution, a second lift; 2-to-1, not injective; infinite, no finite lift | true; bijection needed | none |
| 30 | §8.3 quotient charts | hyperelliptic genus 2; M-curve reflection; free reversing involution | `−2 = 2·2 − 6`; `χ = −1 = 2 − 3`; `χ = −1`, nonorientable | consistent | R07 |
| 31 | §8.4, §8.5 dimension and kernel | `ℤ/3` in genus 3; involution; genus-2 kernel | `4 = 3·(4/3)`, dim 2; codim `g−2+h`; `h=1`: `2 ≥ 3` impossible, `h=2`: `\|K\| = 1` | correct | none |
| 32 | §9.2 Check 3 | `(0;2,3,m)`, `m ≥ 7` | covolume `2π(1/6 − 1/m) < π/3`; `2h−2+r/2 ≤ c/2π` | repaired | none |
| 33 | §10.1 index bound | `(2,3,7)`; `(2,3,8)`; Bolza | `1/42`; `1/24`; `96 > 84`, `≤ 168` | correct | none |
| 34 | §10.2 cores and covers | `g = 2`; index 2; torus `N = 2ℤ⊕ℤ` | `D! = 168!`; genus `2g−1`; translation by `(1,0)` acts trivially | correct | R07 |
| 35 | §10.4 `Max_g`, Check 3 | `N = Π` member; a surface with an involution | `B_Π` is the nontrivial-stabilizer locus, so `Max_g ⊆` the 8.5 locus; the involution's lift normalizes `Γ`; Greenberg Thm 2, greenberg1963 lines 86–91 | Check false | R05 |
| 36 | §11.1 Check 1 | genus-3 surface with an involution | never maximal | Check false | R05 |
| 37 | missing headlines: DNB, measurable Riemann mapping | probes; `μ = a` | both elaborate; `f_z̄/f_z = a` for `(z + a z̄)/(1+a)` | statable | R04 |

### Probes and signatures

**One-tactic probe.** I replaced every `sorry` with `first | rfl | simp | infer_instance | trivial | decide | aesop` in a scratch copy. All 21 theorems fail. `local_degree_unique` is padding by duplication (R06), not by closing in one tactic.

**Signature check.** I appended `#check @` for all 42 named declarations to a scratch copy and elaborated it once. I compared each elaborated type with its README statement:
- `isotopicRel_of_homotopicRel` carries `T2Space` on both sides and `CompactSpace M`;
- `riemannHurwitz` carries compactness, connectedness and Hausdorffness on both sides;
- `nielsen_realization` carries `IsManifold`, `Orientable` and `IsClosedConnectedSurface`;
- no binder is lost.

Nothing changed.

### Library declarations resolved at the pins

- **Elaborated by `#check`: 64 names** from the Mathlib and Tau Ceti contracts, among them:
  - `deckFundamentalGroupEquiv_symm_op` (`… = loopDeck x₀ g⁻¹`) and `monodromy_basepointLift` (`… = g⁻¹ • basepointLift`);
  - `one_div_forty_two_le_hyperbolic_deficit` and `hyperbolic_deficit_two_three_seven`;
  - `orthogonalToDiffSphere`, `EuclideanHalfSpace.interiorEmbedding` and `IsSmoothTriangulation.trans_diffeomorph`;
  - `AmbientIsotopy.isotopic`, `IsCoveringMap.existsUnique_continuousMap_lifts_of_range_le` and `IsIsometricSMul SL(2, ℝ) ℍ` (Mathlib `UpperHalfPlane/Metric.lean` line 329).
- **Read in source, in modules without built object files:**
  - `alexanderIsotopyClosedBall` (`Isotopy/Alexander.lean` line 132);
  - `deckSubgroupQuotientProjEquivOfNormal` (`Classification/DeckGroup.lean` line 95);
  - `eulerChar_eq_mul_of_isCoveringMap` (`EulerCharacteristic/Covering.lean` line 140);
  - `eulerChar_sphere` (`EulerCharacteristic/Sphere.lean` line 62);
  - `barycentricSubdivisionRealizationHomeomorph_trans` (`SmoothTriangulation/Subdivision.lean` line 63);
  - `UpperHalfSpace.isPretransitive_isom` (`Hyperbolic/UpperHalfSpace/Basic.lean` line 488);
  - `IsCombinatoriallyTriangulable` (`Topology/CombinatoriallyTriangulable.lean` line 44).
- **Definitions read:**
  - `TauCeti.IsPLOn` (`PL/Map.lean` line 187);
  - `IsSmoothTriangulation` (`SmoothTriangulation/Basic.lean` line 191);
  - `IsClosedConnectedSurface` (`Manifold/Basic.lean` line 128);
  - `PreAbstractSimplicialComplex.PLHomeomorphic` (`Realization/PL.lean` line 36), a relation between complexes and not a map predicate, so `PLStructure.IsPLHomeomorph` does not duplicate it;
  - `IsLocalPowerAt` (R06);
  - `HasWeakFDerivOn` (R04).
- **Not at the pins:** `Out` of a group, an Euler number of a representation, Teichmüller space and quasiconformal maps.

### Cross-roadmap citations resolved

- **On main (`12ed9bd`):**
  - ComplexCurveModuli D0 items 1–5 (lines 25–60), D3 items 3–6, including item 5's "Arbitrary smooth complement and offset IFT", and the D4 and D6 headings;
  - ComplexKahlerGeometry K1 (line 96), K4 (line 444) and K5 with K5b (lines 568, 578);
  - DifferentialGeometry, AlgebraicTopology, CharacteristicClasses, RiemannianGeometry (R4.7), PDE, ModularForms and `Completed/UniversalCovers` exist.
- **At #903 (`9f470e6a`):** Layers 1.7 (line 794), 1.7.2 (952), 3.1–3.4 (1170–1261) and 11.2.1 items 1–5 (6634–6688), and 11.3 (6701). Their texts match the contract at README line 81, including item 5 holding without orientability and the Smale disc form of Layer 3.4.
- **At #1168 (`62cca0d1`):** Layer 1 items 1–3, Layer 4 item 5, Layer 4a, and Layer 7 items 1 and 4 (lines 516–548, 894) match the contract. Layer 0 item 2 and Layer 5 item 1 do not (R01).
- **Consumers.** #1722 (§9.1) and #1728 (§§3.3, 5.6, 8.4, 10.1) cite ids that exist; the content they take has moved (R09).
- **Leads.** The 16 `roadmaps resolve` leads are this roadmap's own names in `StandardSurface`, `Surface` and `PLStructure`.

### Sources verified at their locators

- hatcher2002 lines 10170–10200: §3.3, pp. 234–235, and Proposition 3.25.
- epstein1966:
  - lines 109–115: Theorem 2.1 and the remark after it, p. 86;
  - lines 214–217: Theorem 3.1;
  - lines 229–231: Theorem 3.3;
  - lines 533–535: Theorem 6.3, p. 99;
  - lines 604–607: Theorem 6.4 a), p. 101;
  - line 778: Theorem A4, p. 107.
- kriegl-michor1997: Theorem 42.1 at line 20142 (p. 439), Lemma 42.5 at line 20284 (p. 442) and Theorem 43.1 at line 20817 (p. 454).
- greenberg1963 (fetched from the AMS open archive):
  - lines 86–91: Theorem 2, p. 571;
  - lines 111–142: case 8, `F(2; −) ⊂ F(0; 2,2,2,2,2,2)`, which matches §10.4 Check 1.

### Supplier order and ownership

**Supplier order.** Every supplier is on main or in an earlier revision (R08). TeichmullerGeometry is line 283 of the merge order. FuchsianOrbifoldsPartII (line 299) is not cited, and its head (#1696) contains no Teichmüller or p85 material.

**Ownership against open pull requests.** I checked #903, #1168, #1696, #1722 and #1728, and ran `roadmaps grep` for every citation of TeichmullerGeometry.

## Not verifiable

- **Uncertified texts, cited by locator only:**
  - Moise, §6 (sampled §0.0a);
  - Munkres, Definition 8.3 (sampled §0.0e);
  - Farb–Margalit, §2.2 (sampled §5.4a) and Propositions 1.7 and 2.8 (sampled §5.5);
  - Hirsch, Chapter 8; Douady–Earle 1986; Ahlfors–Bers 1960; Imayoshi–Taniguchi; Hubbard 2006; Wolpert 1979; Massey, Chapter 1.
- **Waived:** Kerckhoff 1983, Theorem 1.
- **Openly available, outside the sample, not re-read this round:** Borel 1981 and Takeuchi 1975.
- **Ownership against SurfaceTopology and PlanarTopology (#271) not checked.** The brief gives no head for them, and they are excluded as suppliers. R01 notes that #1168 now depends on SurfaceTopology.

## Source issues

- **Error** in epstein1966 at Theorem 6.4 a), p. 101: the source asks for orientation preservation only on the plane and on the closed and open cylinders; it should also ask for it on the closed disc, where complex conjugation is homotopic but not isotopic to the identity; affects nothing.
