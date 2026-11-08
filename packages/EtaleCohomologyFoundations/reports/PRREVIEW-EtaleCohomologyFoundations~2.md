# Review of EtaleCohomologyFoundations (pull request #1891 at c10a0bb)

**Verdict:** needs changes

Nine findings: five blocking (P2) and four P3. The gate passes. No Lean statement was found false. The blocking problems are:

- three blocks that plan results the pinned Tau Ceti already proves;
- two objects that another open pull request also owns;
- a stalk Frobenius whose direction is not determined;
- a headline theorem the docstring calls unstatable, which a scratch file states at the pins.

## R01 (P2) — §§F.0.2, F.0.A0 and F.4.0 plan results that the pinned Tau Ceti already proves

**Location.** README lines 291–292: "Supply pullback, finite coproducts, connected components, deck maps, effective descent and finite-group quotients on this carrier"; line 299: "Prove … nonemptiness within a component". Also lines 494–495 (π₁ of a field is its Galois group) and line 1184 ("every lattice … is compact and open, with compact open stabilizer").

**Claim.** Tau Ceti `2fd255d` proves all of the following, for every base scheme where not stated otherwise:
- *Base change.* `TauCeti.FiniteEtaleScheme.pullback`, `pullbackComp` and `pullbackCompFiberIso` (`AlgebraicGeometry/FiniteEtale/Fiber.lean:51, 96, 179`).
- *Limits and colimits.* Finite limits, finite coproducts, direct summands, `Balanced` and `FinitaryExtensive` (`Limits.lean:106–272`). Quotients by finite groups over every base (`Quotient.lean:331`). Exactness of base change and of the fibre functors (`Exactness.lean`).
- *Galois category.* The `FiberFunctor` instance for preconnected bases, the `GaloisCategory` instance for connected bases, and `nonempty_fiber_iso` (`Galois/Category.lean:106, 111, 122`). Mathlib's `functorToContAction` equivalence therefore already gives "finite covers correspond to finite continuous sets".
- *Paths and components.* Paths `fiber x ≅ fiber y`, with `isEmpty_fiber_iso_of_isClopen`, `nonempty_fiber_iso_of_mem_connectedComponent` and `nonempty_fiber_iso_iff_mem_connectedComponent` (`Galois/Component.lean:59, 79, 112`).
- *π₁ of a field.* `galContinuousMulEquivAutFiber`, `instIsFundamentalGroupFiber` and `galoisEquivalence` (`Galois/FundamentalGroup.lean:219, 199`; `Galois/Basic.lean:95`).
- *Lattices.* `Submodule.IsLattice.isOpen`, `isCompact`, `isOpen_stabilizer` and `isCompact_stabilizer` (`NumberTheory/LocalField/Lattice.lean:83, 175, 150, 204`).

Two smaller points. The supplier table attributes the `FiberFunctor` and `GaloisCategory` instances to `Fiber.lean`; they are in `Galois/Category.lean`. The §F.0.2 Check "points in different connected components admit no étale path" is a pinned theorem.

**Witness.** `Galois/Component.lean:112`: under `[LocallyConnectedSpace S]`, `Nonempty (fiber x ≅ fiber y) ↔ y default ∈ connectedComponent (x default)`. `Lattice.lean:150, 204`: the stabilizer of a lattice in `V ≃ₗ[E] V` is open and compact.

**Repair.**
1. List these files and declarations in the Tau Ceti row, with `Galois/Category.lean` for the instances, and add one Scope sentence saying they are consumed.
2. Reduce §F.0.2 to what Tau Ceti lacks: deck maps, effective descent, the simply transitive basepoint action, and the module-sheaf monodromy equivalence.
3. Cite `galContinuousMulEquivAutFiber` in place of the field identification in §F.0.A0, keeping the 𝔾_m part as a target.
4. Cut the §F.4.0 matrix-form target to "`GL_n(O_E)` in a basis of `Λ`, and the homomorphism `Γ → GL_n(O_E)`", citing `Lattice.lean` for compactness and openness.

## R02 (P2) — The comparison morphism `ν : X_proét → X_ét` has two open owners

**Location.** README line 7: "the comparison morphism from the pro-étale to the étale site". §F.4.3, lines 1361–1373: "Define the inclusion functor from `X.Etale` to `X.ProEt` … define `ν_*` as Mathlib's `Functor.sheafPushforwardContinuous` … `ν^*` as its left adjoint".

**Claim.** The open SchemeAndStackFoundations revision builds the same object in its §2.10:
- the same inclusion functor;
- the same Mathlib functors;
- the same single change of universe through `ModuleCat.uliftFunctor`.

It also declares the object in its `Suggested.lean`. Neither roadmap cites the other, so the object is planned twice. This README's own Scope (line 11) assigns scheme sites to SchemeAndStackFoundations, whose §2.10 is "Comparison morphisms between the topologies of a scheme". The previous review (R09) offered "state `ν` here" as a repair; it was taken, but the revision still adds `ν`.

**Witness.** SchemeAndStackFoundations at the #1656 head (`16d66b3`):
- README line 479: "§2.10 / `Scheme.toProEt`, `Scheme.proetalePushforward` | `ν^* ⊣ ν_*`";
- `Suggested.lean` lines 841–855 declare `Scheme.toProEt`, `Scheme.toProEt_isContinuous` and `Scheme.proetalePushforward`.

On main, `toProEt` occurs 0 times.

**Repair.** Settle one owner.
- **(a)** Delete the "comparison morphism `ν`" block of §F.4.3 and the Scope clause. Cite SchemeAndStackFoundations §2.10 (`Scheme.toProEt`, *Scheme.proetaleAdjunction*, *Scheme.proetaleComparison*). Name that revision in the description's merge-order paragraph as one this pull request merges after.
- **(b)** Keep `ν` here, and have the merge-order paragraph record that the revision drops its §2.10 `ν` block first.

Option (a) follows the earlier owner and this README's own Scope.

## R03 (P2) — The point count over `k_r` still has two owners (previous R05, partly repaired)

**Location.** README line 13: "the count of points over the degree-`r` extension … from which a zeta series is formed is `Scheme.Hom.pointCount` of §F.10.1"; line 2022. The description says: "roadmaps citing EtaleCohomologyFoundations labels are unaffected, since no label changes".

**Claim.** At WeilConjectures' head, the zeta series is still built from its own count, and that roadmap still owns the same model-independence theorem:
- `zetaSeries` is built from `extensionPointCount`, on a universe-0 field `{k : Type}` with Mathlib's `FiniteField.Extension k p r`;
- its WC.0.1 proves the model independence that is `Scheme.Hom.pointCount_eq_numberOfRationalPoints` here;
- its supplier row still cites the dropped `VanishingCycles.numberOfRationalPoints`.

Two open roadmaps therefore define the same count, under conventions this README forbids (line 45: no `{k : Type}`). The description's "unaffected" is false.

**Witness.** WeilConjectures (#1208 head `029d8c2`), `Suggested.lean` line 55: `def extensionPointCount {k : Type} [Field k] [Finite k] (p : ℕ) …`. Line 63: `zetaSeries` uses it. README line 115 cites `VanishingCycles.numberOfRationalPoints`.

**Repair.** Keep the count here. This roadmap is earlier in the merge order. Mathlib's `FiniteField.Extension` lives in `Type`, so the splitting-field model in universe `u` is the right carrier. Replace "unaffected" in the merge-order paragraph by the changes WeilConjectures makes:
- `extensionPointCount` → `Scheme.Hom.pointCount`;
- its WC.0.1 model independence → `Scheme.Hom.pointCount_eq_numberOfRationalPoints`;
- `VanishingCycles.numberOfRationalPoints` → Tau Ceti's `Scheme.Hom.numberOfRationalPoints`, as line 39 already maps it.

## R04 (P2) — The direction of the stalk Frobenius is undetermined, and its natural reading contradicts §F.10.2

**Location.** §F.0.1, lines 254–266: "Define the functor toPointFunctor from the opposite of GeometricPoint S … the arithmetic Frobenius … is an automorphism of that geometric point; its action on stalks is the Frobenius at `a`". §F.10.2, lines 1293 and 1300.

**Claim.**
1. **The natural functor is covariant, not defined on the opposite.**
   - In Mathlib, a morphism of points `Φ₁ ⟶ Φ₂` is a map `Φ₂.fiber ⟶ Φ₁.fiber`.
   - The fibre of `pointSmallEtale s` is `Hom(Over.mk s, −)`.
   - So `φ : s′ ⟶ s` gives `P(s′) ⟶ P(s)`.
   - A functor on the opposite needs inverses, which `isIso_toPoint_map` proves only afterwards.
2. **Through the natural functor, the arithmetic automorphism acts by the arithmetic Frobenius.** `Spec σ` sends the germ `(U, u)` to `(U, Spec σ ≫ u)`, so it acts on `μ_ℓ(k̄)` by `ζ ↦ ζ^q`.
3. **§F.10.2 needs the inverse action.** It identifies §F.0.1's stalk Frobenius with Stacks 03SW, the action of `frob⁻¹`, and its Check computes `q⁻¹`.
4. **No Check decides between the two readings.** §F.0.1's only Check is a swap of order two, which cannot tell `σ` from `σ⁻¹`. Yet line 266 makes this "the only stalk Frobenius" used by the trace-formula consumers.

**Witness.** On `μ₅` over `𝔽₂`, `Spec σ` acts on stalks by `ζ ↦ ζ²`. Stacks 03SW (`stacks-03SW` line 183, Definition 64.3.10) gives `π_x = frob⁻¹`, that is `ζ ↦ ζ³`. Mathlib: `Sites/Point/Category.lean:38–40`, `Sites/EtalePoint.lean:64`.

**Repair.**
1. Make toPointFunctor covariant on GeometricPoint S.
2. Define the stalk Frobenius at `a` as the action of the geometric Frobenius, the inverse of `FiniteField.frobeniusAlgEquivOfAlgebraic`, with locator Stacks 03SW.
3. Add the Check: "on `μ₅` over `Spec 𝔽₂` the stalk Frobenius at the rational point is `ζ ↦ ζ³`; the arithmetic automorphism gives `ζ ↦ ζ²`". This is the same witness as line 591.

## R05 (P2) — The arithmetic fundamental-group sequence can be stated at the pins, but the docstring says it cannot

**Location.** `Suggested.lean` lines 45–46: "The arithmetic fundamental-group exact sequence (§F.0.A2): no map between automorphism groups of Tau Ceti's fibre functors … induced by a morphism of schemes."

**Claim.** The induced map is a ten-line definition on pinned Tau Ceti: whisker by `FiniteEtaleScheme.pullback f`, then conjugate by `pullbackCompFiberIso f x`. This is the README's own target EtaleFundamentalGroup.map (line 333). With it, SGA 1 Exposé IX, Théorème 6.1 (p. 195, `sga1` line 7736) can be stated on native carriers. SGA 1 assumes only that `X` is quasi-compact and geometrically connected, as §F.0.A2 does. The docstring lists the sequence as a headline theorem, so a statable headline is missing.

**Witness.** A scratch file importing `TauCeti.AlgebraicGeometry.FiniteEtale.Fiber` elaborates, with only the theorem's `sorry` warning:
- `abbrev EtaleFundamentalGroup x := Aut (fiber x)`;
- `EtaleFundamentalGroup.map`, monoid laws by `apply Aut.ext; ext X y; simp`;
- the theorem below.

**Repair.** Add the two definitions and this theorem, with the SGA 1 locator, and delete lines 45–46:
```lean
theorem arithmeticExactSequence {k : Type u} [Field k] (kbar : Type u) [Field kbar]
    [Algebra k kbar] [IsAlgClosure k kbar] {X : Scheme.{u}} (p : X ⟶ Spec (.of k))
    [CompactSpace X]
    [ConnectedSpace ↥(pullback p (Spec.map (CommRingCat.ofHom (algebraMap k kbar))))]
    {Ω : Type u} [Field Ω] [IsSepClosed Ω]
    (x : Spec (.of Ω) ⟶ pullback p (Spec.map (CommRingCat.ofHom (algebraMap k kbar)))) :
    Function.Injective (EtaleFundamentalGroup.map (pullback.fst _ _) x) ∧
      Function.Surjective (EtaleFundamentalGroup.map p (x ≫ pullback.fst _ _)) ∧
      (EtaleFundamentalGroup.map (pullback.fst _ _) x).range =
        (EtaleFundamentalGroup.map p (x ≫ pullback.fst _ _)).ker := by
  sorry
```

Also correct the reason given for §F.3a (lines 47–49). Mathlib's `ValuationSubring.inertiaSubgroup` (`RingTheory/Valuation/RamificationGroup.lean:49`) is defined as the kernel of `MulSemiringAction.toRingAut`, the action of the decomposition subgroup on the residue field. That is the specialization map whose absence the docstring asserts. Either state the inertia sequence on it, or name what is actually missing.

## R06 (P3) — The §F.10.1 block of `Suggested.lean` follows quickly from the pinned libraries and contains no headline

**Location.** `Suggested.lean` lines 142–181: `rationalPoints_finite`, `pointCount_eq_numberOfRationalPoints` and `frobeniusFixedPoints`. README line 3 lists "the computation of point counts over finite fields by Frobenius fixed points" among the end theorems.

**Claim.**
- `pointCount_eq_numberOfRationalPoints` is a model-independence API lemma.
- `rationalPoints_finite` is an elementary finiteness lemma.
- `frobeniusFixedPoints` reduces in three steps to two pinned Tau Ceti theorems: `AlgEquiv.numberOfRationalPoints_fixedField_eq_natCard` (`AlgebraicGeometry/RationalPoint/FixedField.lean:256`) and `TauCeti.finrank_fixedField_zpowers_frobeniusAlgEquivOfAlgebraic_pow` (`FieldTheory/Finite/SepClosedSubfield.lean:190`).

**Witness.** Proved without `sorry` on a scratch copy:
- `pointCount_eq_numberOfRationalPoints` in 10 lines, by `FiniteField.isSplittingField_sub`, `Polynomial.IsSplittingField.algEquiv` and a 12-line invariance under `E ≃ₐ[k] E'`;
- `frobeniusFixedPoints` in 8 more lines.

**Repair.**
1. Delete these three theorems from `Suggested.lean`. Then delete `pointCount` and `arithmeticFrobenius`, which no remaining statement uses.
2. Keep all five as README targets, written without backticks as line 43 prescribes.
3. In the Summary, describe the point count as an interface rather than an end theorem.

## R07 (P3) — Scope and the consumer list name a roadmap that does not exist (previous R11, not repaired)

**Location.** README line 13: "Kernel transforms, the Artin–Schreier and Kummer sheaves and the Fourier–Deligne transform belong to FourierDeligneTransform". Also lines 389–390, 2015 and 2022.

**Claim.** FourierDeligneTransform does not exist on main, at any open head, or on the board, so those objects have no owner. Line 2015 also lists three roadmaps as consumers that never cite this one: DiamondSixOperations, ShimuraVarieties and AlgebraicModuliForArithmeticGeometry.

**Witness.** `roadmaps grep --fixed FourierDeligneTransform` matches only this README (lines 13, 389, 2015 and 2022). `roadmaps show` of the three roadmaps (#927, #933, #853) finds "EtaleCohomologyFoundations" 0 times.

**Repair.**
- Either own the Artin–Schreier and Kummer sheaves here, as the Lang-torsor case of §F.0.3's rank-one construction (a target with Checks), or delete the FourierDeligneTransform sentences.
- Remove the three non-consumers from line 2015.

## R08 (P3) — Four locators do not support the claims they are attached to

- **SGA 1, §F.10.1 (line 1235): "SGA 1 I §8, finite-field descent".** SGA 1 Exposé I §8 is about infinitesimal lifting of étale schemes and formal schemes (`sga1` lines 859–861).
  - *Repair:* delete the clause. The Mathlib and Tau Ceti declarations named in the paragraph are the supply.
- **LRZ, smooth trace (line 1669: "Li–Reinecke–Zavyalov, §§3.2–3.4").** Those sections cover the projective-bundle and blow-up formulas, higher cycle classes, and the comparison with algebraic cycle classes (`lrz-relative-poincare` lines 23–26, 1478–1486). The smooth trace is LRZ §6.1, Theorem 6.1.1 (line 4217).
  - *Repair:* cite Theorem 6.1.1, as the analytic analogue of the algebraic trace.
- **LRZ, curve duality (line 1680: "§3.4").** Poincaré duality is LRZ §6.4.
  - *Repair:* cite §6.4.
- **Stacks 09BT and BS §§6.5/6.8 (§§F.4.1/F.4.3, lines 1320 and 1418–1420).** Lines 1320 and 1418 call Stacks 09BT "the adic constructible complexes". Line 1420 cites "Bhatt–Scholze §§6.5 and 6.8" for the comparison of normalized systems with `D_cons`. Stacks 09BT is Definition 61.28.1, about constructible adic *sheaves* (`stacks-09BT` line 2516). BS §6.5 compares nothing with adic systems. The comparison with adic systems is BS §5.5, Proposition 5.5.4 (`bhatt-scholze-proetale` line 1902), for Ekedahl's category, under condition (A) or (B).
  - *Repair:* cite BS Definitions 5.5.1–5.5.3 and Proposition 5.5.4. State why uniformly bounded ctf systems need neither condition, or add the condition. Describe Stacks 09BT as the sheaf-level notion.

## R09 (P3) — Targets without locators, a definition with two Checks, and Checks that name Lean declarations

**Targets with no locator:**
- compactFrobeniusModule, lines 1581–1590: vanishing above `2 dim X`, independence of `k̄` and of the integral model;
- the abstract Verdier layer, lines 1714–1724;
- the six-operation output structure, lines 1733–1739;
- the point-count paragraph, lines 1247–1259.

*Repair:* attach a theorem-level locator to each. Stacks 03SV–03SX (`stacks-03SW` lines 173–197) fits the Frobenius part of compactFrobeniusModule.

**Too few Checks.** The six-operation output structure is a definition with only two Checks (lines 1743–1744).
- *Repair:* add a discriminating third, for example: "for proper `f`, its base-change field is §F.2.1's exchange isomorphism, which is not the identity for a nontrivial square".

**Checks that name Lean declarations.** §F.3a's Checks open with Lean names, for example "VanishingCycles.inertia_eq_top_of_strictlyHenselian:" (lines 1109–1112 and 1142–1148). Checks must be prose and must not claim a Lean counterpart.
- *Repair:* drop the names.

## Verified sound

### Previous review (at 6f02163): repair status

| Id | Status | Evidence at c10a0bb |
| --- | --- | --- |
| R01 sorry'd data | repaired | gate `sorry-data=0`; `Suggested.lean` has 2 defs, both with real bodies |
| R02 compactifications | repaired | §§G.1/G.3 consume Tau Ceti; old → new rows at lines 19–30; `Suggested.lean` imports `…Compactification.Basic` |
| R03 `ContinuousRep` | repaired | §F.4.0 line 1182 consumes Tau Ceti; rows at lines 31–38 (but see R01 for lattices) |
| R04 headlines | partly | the four probe headlines are stated (lines 84–130) and the docstring is itemised; the arithmetic sequence is statable (R05) |
| R05 point-count owners | partly | this roadmap is now the stated owner, but WeilConjectures is unchanged (R03) |
| R06 padding | repaired for the listed declarations | all deleted; new padding in R06 |
| R07 catalogue | repaired | no name catalogue; docstring "target signatures"; unused definitions removed |
| R08 projective trace | repaired | Tau Ceti row, line 64; AdicSpacesPartIII row removed |
| R09 `ν` | partly | lines 1361–1373 state `ν` as a target; two owners remain (R02) |
| R10 dropped ids | repaired | lines 37 and 39 map `nonempty_iso_genericFibre` and `VanishingCycles.numberOfRationalPoints` |
| R11 FourierDeligneTransform | not repaired | R07 |
| R12 generality | repaired | line 829 "every compactifiable `f`"; line 927 "all `K ∈ D(X,Λ)`"; lines 1311–1315 completeness, with `IsInvertibleOn` moved to theorems |
| R13 locators | repaired | §F.0.A1 now cites Stacks 15.114 (lines 469–472); §F.4.6 cites 09YQ (lines 1552–1555) |
| R14 pins | repaired | one pin per library (lines 63–64); no Mathlib pull request number |
| R15 shape | repaired | title (line 1), `## How to read the build` (line 80), `## Downstream consumers` (line 2013) |

### Gate, dependency check, elaboration

- **Gate.** Re-run at `c10a0bb`: `gate EtaleCohomologyFoundations: set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. No change outside the folder.
- **Dependency check.** Output: `depcheck: 237 roadmaps, 2424 edges, 0 problem(s)`, with no UPWARD or CYCLE line. EtaleCohomologyFoundations is line 42 of the merge order, and every supplier it cites is on main. AbelianSchemesAndArithmeticModuli (line 41) cites this roadmap 21 times; that misplacement belongs to its own review.
- **Elaboration.** `lake env lean` on `Suggested.lean` in 25 s: 8 warnings, all `declaration uses sorry`.
- **Signatures.** I compared the `#check @name` types of all 10 declarations with the README statements. No binder is dropped, and I changed nothing.

### Adversarial table

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `nagataCompactification` | `A¹_k → Spec k`; line with doubled origin; `⊔_ℕ Spec k` | `P¹` exists; not separated, so excluded by `[IsSeparated f]` and indeed uncompactifiable; not quasi-compact, so excluded; matches Stacks 0F41 | true | none |
| `etaleCohomologicalDimension` | `Spec k`; `P¹`, `ℤ/ℓ`; `∅`; `Spec 𝔽_q` | `H^{≥1} = 0`; `H² = ℤ/ℓ` at `q = 2 = 2·dim` (allowed), `H³ = 0`; dim `⊥`, `2·⊥ < q` for every `q`, `H⁰ = F(∅) = 0`; `H¹ = ℤ/ℓ` with `2·0 < 1`, so `IsSepClosed` is needed | true | none |
| `affineArtinVanishing` | `A¹` in characteristic `p`, `ℤ/p`; `P¹` | `H¹ = k[t]/(g^p−g) ≠ 0` at `q = dim`; `H² = 0` (0F0V bounds `cd` over all torsion sheaves, Def. 59.95.1); `P¹` has `H² ≠ 0` with `2 > 1`, so `IsAffine` is needed | true | none |
| `finite_H_constantSheaf` | `A¹` char `p`, `M = ℤ/p`; `𝔾_m/k̄`, `ℤ/ℓ` | `H¹` infinite, excluded since `(p:k) = 0`; `H⁰ = H¹ = ℤ/ℓ`, finite | true | none |
| `subsingleton_ellAdicCohomology` | `P¹`, `q = 2, 3`; `Spec 𝔽_p` | `H² = ℤ_ℓ` (`2 < 2` false, allowed); `H³`: Milnor term `lim¹ ℤ/ℓⁿ = 0` and `H³ = 0`; `H¹ = ℤ_ℓ`, excluded by `IsSepClosed` | true (BS Prop. 5.6.2) | none |
| `pointCount`, `…_eq_numberOfRationalPoints` | `E = 𝔽_{q²}`; `r = 0` | splitting field of `X^{q²} − X` is `≅_k E`, so the counts are equal; `r = 0`: the splitting field of `0` is `k`, giving `#X(k)`, which the theorem cannot reach since `finrank ≥ 1` | true; proved on scratch | R06 |
| `frobeniusFixedPoints` | `Spec 𝔽_{q²}`, `r = 1, 2`; `A¹`, `r = 0` | `0 / 0` and `2 / 2`; without `hr`: `q / Nat.card(∞) = 0` | true; `hr` needed; proved on scratch | R06 |
| `rationalPoints_finite` | `A¹_{𝔽₂}`, `L = 𝔽₄`; `⊔_ℕ Spec 𝔽₂` | 4 points; infinitely many without `QuasiCompact` | true | R06 |
| §F.0.2 Galois categories | `Spec k^sep`; `S₁ ⊔ S₂` | trivial `π₁`; no path into `S₂` (Tau Ceti `isEmpty_fiber_iso_of_isClopen`); Stacks 0BND is Thm 58.6.2 for connected `X` | true | R01 |
| §0.6 derived continuity | complex in `[a,b]`; infinite sequence | finitely many attaching maps descend (09YQ = Thm 59.51.3; 09YU in §59.73); an infinite sequence gives no common stage | true | none |
| §0.7 Mayer–Vietoris | `P¹ = U ∪ V`; `U ↔ V` | `H¹(U∩V) = Λ(−1)` maps onto `H²(P¹) = Λ(−1)`; swapping negates the sign | true | none |
| §0.8 finite traces | `T ↦ T²` at `0`; split degree `r` | fibre `k[T]/T²` of length 2, so trace = 2·value; restriction then trace = `r`; 03SH covers the finite étale case only | true | none |
| §F.2.5 compact support | `A¹`; `P¹` | `H⁰_c = 0` while `H⁰ = Λ`; forgetting supports is an isomorphism on `P¹` | true | none |
| §F.3 lisse direct images | 0GJW; `j : 𝔾_m → A¹`, `T = −1`, `𝔽₃` | proper + locally acyclic + `D⁺` torsion gives `sp`, `cosp` isomorphisms; `T − 1 = −2` invertible, so `Rj_*𝓛 = j_!𝓛` with stalk 0 at the origin | true | none |
| §F.3a henselian traits | `ℤ_p^{sh}`; henselization of `𝔽_p(x)[t]` | 09ED gives `D → Aut` onto, `I = Gal`; `k(s̄) = 𝔽_p(x)^{alg} ⊋ 𝔽_p(x)^{sep}`, as SGA 7 XIII 0.2.5 says | true | none |
| §F.3a ring structure | `ℤ_(p)^{sh}` | 06LJ (Noetherian) and 04GP (`𝔪R^{sh}` maximal, residue `κ^{sep}`, flat colimit), so principal non-nilpotent maximal ideal gives a DVR; residue `𝔽̄_p`, not complete | true | none |
| §F.10.1 point counts | `Spec k_m`, `A¹`, `P¹`, `Spec 𝔽_{q²}` | `m` points iff `m ∣ r`; `qʳ`; `qʳ + 1`; `2` / `0` for even / odd `r` | true | R09 |
| §F.4.3 `ν` comparison | `D⁺` versus unbounded; `Spec ℚ`, `μ_{ℓⁿ}` | BS 5.1.6 gives the unit iso on `D⁺`, 5.1.8 fails unbounded; étale limit 0 (stabilizer `ker χ_cyc` not open) / `ℤ_ℓ(1)` over `Spec ℚ̄` | true | R02 |
| §F.4.3 coefficient rings | `Spec 𝔽̄_p` | `Γ(ℤ_{ℓ,X}) = ℤ_ℓ`; `Γ(ℚ̄_{ℓ,X}) = PadicAlgCl ℓ` (each element is algebraic); `ellAdicSheaf` is `U ↦ C(U, ℤ_ℓ)` (BS Def. 6.8.1) | true | R08 |
| compactFrobeniusModule | `A¹`; `Spec 𝔽_{q²}` | `H²_c = E(−1)`, trace `q = #A¹(𝔽_q)`; `E²` swapped, trace `0 = #X(𝔽_q)` | true | R09 |
| §0.9 normalized classes | rank `r = 0, 1`; `P¹` | empty sum / summand `i = 0` only; `c₁(O(1))` has trace `+1`; 03PL is Lemma 59.28.1 | true | none |
| §0.11 smooth trace | `A¹_C ⊔ A¹_C` | `R²f_!μ_n = (ℤ/n)²`, trace = addition | true | R08 |
| §F.5 Verdier layer | `K` dualizable, `T` invertible; étale `a`; `Λ ⊕ Λ` | `DDK = (K^∨⊗T)^∨⊗T = K`; `a^! = a^*`; rank 2, so not invertible | true | R09 |
| §F.0.1 / §F.10.2 Frobenius | `μ₅` over `𝔽₂` | natural action of `Spec σ`: `ζ²` / Stacks 03SW `π_x`: `ζ³` | inconsistent | R04 |
| §F.0.A2 sequence | `X = Spec k`; elaboration | `π₁(X_k̄) = 1`, `π₁(X) ≅ Γ_k`; elaborates at the pins | statable | R05 |
| `EtaleFundamentalGroup.small` | finite étale over `S` | essentially small source, so `Aut` into `FintypeCat` is `u`-small | true | none |
| §F.0.3 twists | `Λ = ℤ/12`, `N = 24` | `μ₂₄ ⊗ ℤ/12 ≅ μ₁₂` via `x ↦ x²`, needing 6 invertible | true | none |
| §F.4.1 adic systems | `Λ/I` of characteristic `m`; `E = ℚ_ℓ(√ℓ)`; `I = Λ` | `m ∈ I`, so `mⁿΛ_n = 0`; `𝒪_E/ℓ` has length 2; `Λ_n = 0` | true | none |
| §F.3a tame restriction | `R′ = R[π^{1/2}]` | `π = uπ′²`, `u^{1/ℓⁿ}` fixed by `I′`, so `t_ℓ|_{I′} = 2t′_ℓ` | true | none |

### Library declarations opened at the pins

- **Mathlib (`1b1ccf4`).**
  - `Scheme.EllAdicCohomology`, `Scheme.ellAdicSheaf` and the `[IsEmpty X]` subsingleton instance (`AlgebraicGeometry/Sites/ElladicCohomology.lean`);
  - `Scheme.ProEt`, weakly étale (`Sites/Proetale.lean:98`);
  - `Sheaf.H` (`Sites/SheafCohomology/Basic.lean:57`) and `H.map`;
  - `GrothendieckTopology.Point.Hom` (`Sites/Point/Category.lean:38`);
  - `Scheme.pointSmallEtale` (`Sites/EtalePoint.lean:63`);
  - `ValuationSubring.inertiaSubgroup` (`RamificationGroup.lean:49`);
  - `FiniteField.Extension`, `algEquivExtension`, and the splitting-field instance (`FieldTheory/Finite/Extension.lean:48, 85, 131`);
  - `Aut` as a structure (`CategoryTheory/Endomorphism.lean:123`).
- **Tau Ceti (`2fd255d`).**
  - Compactifications: `Compactification.Basic`, `.precomp`, `.hom_unique` and `.commonRefinement`; `AffineLine.lean`; `Cofiltered.lean`.
  - Rational points: `RationalPoint/Count.lean:43, 58` and `FixedField.lean:212, 256`; `SepClosedSubfield.lean:173, 190`.
  - Finite étale schemes: every file of `FiniteEtale/` named in R01.
  - Representations: `RepresentationTheory/Continuous/{ContinuousRep, IntegralModel, StableLattice}.lean`; `LocalField/Lattice.lean`.
  - Blow-ups: `Blowup/{StrictTransform, Restriction}.lean`.
  - Category theory: `Filtered/Comparison.lean`.
  - Local fields: `Tame/Character.lean`.

### Cross-roadmap citations resolved

- **SchemeAndStackFoundations on main.** §§0.3, 0.8, 0.9, 0.23–0.23a, 0.29, 2.1–2.2, 2.9–2.11, 2.15–2.17 and 5.3–5.5 exist. §2.17 has no `ν`.
- **Other suppliers.** The ClassicalDerived citations (EnhancedDerivedSheaves §§0.1–0.4), DerivedModuleAlgebra, DGAInfinity, PadicMeasuresIwasawaAlgebras §5.1, StableReduction, ModularCurves, AlgebraicCurves, BelyiMaps, ProfiniteArithmetic, GrothendieckEulerForms and PerfectoidSpaces resolve. The citations tool found no unresolved cross-roadmap citation.
- **Lean names.** The 15 names it flagged are this file's own declarations or supplier-roadmap names (`ClassicalDerived.*`, `SchemeFrobenius.*`).

### Ownership against open pull requests

I checked by object, using `roadmaps grep` and `roadmaps show`:
- **Point counts.** WeilConjectures (R03).
- **`ν`.** SchemeAndStackFoundations #1656 (R02); #1276 has no `ν`.
- **Fourier–Deligne and Artin–Schreier sheaves.** No owner anywhere (R07).
- **Perverse `t`-structures and duality.** EtaleDualityAndPerverseSheaves builds on this roadmap's middle perversity and Verdier duality; it is not a second owner.
- **Weil groups.** ClassFieldTheory's `WeilGroup` is the local-field group, a different object.
- **`π₁`, paths and henselian traits.** EtaleHomotopyTypes, InverseGaloisAndArithmeticFundamentalGroups and NeronModelsAndSemistableAbelianVarieties cite this roadmap as the owner.

## Not verifiable

- **SGA 4, SGA 4½ and SGA 5.** No legal copy (Springer paywall). This leaves unchecked:
  - SGA 4 VI §§8.5–8.7, VIII §2, X, XII, XVI, XVII §§5–6 and XVIII (including Théorème 3.2.5);
  - SGA 4½ [Cycle] and [Th. finitude].

  These are cited in the samples "Finite étale Galois categories", "Constructible derived continuity", "Finite-open Mayer–Vietoris", "Algebraic finite traces", "Compact-support cohomology", "Lisse direct images", "Normalized algebraic classes" and "Algebraic smooth trace", and in the docstring of `etaleCohomologicalDimension` (the `2·dim X` bound). Stacks §59.95 has only the affine bound. The mathematics of each was checked in the table.
- **Huber (1996)**, Proposition 2.4.4 and Corollary 2.4.6: a paywalled book.
- **Bhatt–Scholze** was read as arXiv 1309.1198v2. Its numbering was not compared with the Astérisque print.

## Source issues

- none
