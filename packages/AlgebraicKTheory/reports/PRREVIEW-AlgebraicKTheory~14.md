# Review of AlgebraicKTheory (pull request #1142 at 0f463f1)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/AlgebraicKTheory/` at 0f463f1. The folder changed by 354 lines since e4c7867. The pins are Tau Ceti 2fd255d and Mathlib 1b1ccf4.

- The gate passes, and nothing outside the folder changes.
- The dependency check reports 0 problems.
- `Suggested.lean` elaborates with exactly 18 `sorry` warnings and nothing else.
- All six findings of the previous review are repaired (see "Previous findings" below).

There are four findings, and one of them blocks:

- **R01 (P2).** The three Layer 5 headlines (the universal central extension, K₂(𝔽_q)=0 and Matsumoto's theorem) are statable on Mathlib's `PresentedGroup`, which the README itself names as the carrier. The module docstring lists them as not statable. A tested repair is given.
- **R02, R03 (P3).** Two claims have no supporting locator:
  - 4.4's identification of Vaserstein's d(X) with covering dimension for compact Hausdorff spaces;
  - 7.1's identification of patched modules with glued bundles.
- **R04 (P3).** Conventions call Mathlib PR 44734 "open". It was closed without merging.

## R01 (P2) — The Layer 5 headlines are statable on `PresentedGroup`, but the docstring says they are not

**Location.**
- `TauCetiRoadmap/AlgebraicKTheory/Suggested.lean` :49–50: "The universal central extension `St(R) → E(R)`, Matsumoto's presentation of `K₂` of a field and `K₂(𝔽_q) = 0` (A5): neither library has the Steinberg group."
- README :3 lists "the universal central extension `St(R)→E(R)` with Matsumoto's presentation of K₂ of a field" among the end theorems.
- README :44: "`FreeGroup`, `PresentedGroup`: the carriers of the Steinberg groups of 5.1."
- 5.1 (:554) and 5.2 (:569).

**Claim.** "Neither library has the Steinberg group" does not name a missing carrier.
- The Steinberg group is a presented group (Weibel III, Definition 5.1, weibel-kbook-III lines 1840–1850). So it is one simple definition with a real body on `PresentedGroup`.
- The map St(R)→GL(R) does not need to be built as data. An existential pinned by x_ij(a)↦e_ij(a) on the generators determines the map, and its existence becomes part of the theorem.
- With that, all three A5 headlines are statable at the pins, and they are absent.

Ownership:
- This roadmap owns the Steinberg group. KTheoryLowDegrees (README :1582), K2SymbolsBrauer (README :974) and KTheoryFiniteLocalFields (README :77, "Consume AlgebraicKTheory A5's Steinberg relations and Matsumoto presentation") cite A5 for it, and all three are later in the merge order (lines 88–90).
- No roadmap declares `TauCetiRoadmap.AlgebraicKTheory.SteinbergGroup` or any other name in the block below.

**Witness.** I inserted the block below before Layer A6 in a copy of `Suggested.lean`. It elaborates with exit 0 and 21 `sorry` warnings, nothing else. Separately, the consumer K2SymbolsBrauer (open head of #1302) already states a finite-rank Steinberg group as a `PresentedGroup` (`Steinberg.FiniteRank`, in its `Suggested.lean`).

**Repair.**

1. Insert this block before `/-! ## Layer A6: … -/`. It is the tested block, and it needs no new import.

```lean
/-! ## Layer A5: Steinberg groups and K₂ -/

/-- The Steinberg relations on the generators `x_{ij}(a)`, `i ≠ j` natural numbers and `a ∈ R`:
`x_{ij}(a) x_{ij}(b) = x_{ij}(a + b)`, `[x_{ij}(a), x_{kl}(b)] = 1` for `j ≠ k` and `i ≠ l`, and
`[x_{ij}(a), x_{jk}(b)] = x_{ik}(ab)` for distinct `i, j, k` (Weibel, *The K-book*, Chapter III,
Definition 5.1). -/
def steinbergRels (R : Type u) [Ring R] :
    Set (FreeGroup ({p : ℕ × ℕ // p.1 ≠ p.2} × R)) :=
  {r | (∃ (p : {p : ℕ × ℕ // p.1 ≠ p.2}) (a b : R),
          r = FreeGroup.of (p, a) * FreeGroup.of (p, b) * (FreeGroup.of (p, a + b))⁻¹) ∨
       (∃ (p q : {p : ℕ × ℕ // p.1 ≠ p.2}) (a b : R), p.1.2 ≠ q.1.1 ∧ p.1.1 ≠ q.1.2 ∧
          r = FreeGroup.of (p, a) * FreeGroup.of (q, b) * (FreeGroup.of (p, a))⁻¹ *
            (FreeGroup.of (q, b))⁻¹) ∨
       (∃ (i j k : ℕ) (hij : i ≠ j) (hjk : j ≠ k) (hik : i ≠ k) (a b : R),
          r = FreeGroup.of (⟨(i, j), hij⟩, a) * FreeGroup.of (⟨(j, k), hjk⟩, b) *
            (FreeGroup.of (⟨(i, j), hij⟩, a))⁻¹ * (FreeGroup.of (⟨(j, k), hjk⟩, b))⁻¹ *
            (FreeGroup.of (⟨(i, k), hik⟩, a * b))⁻¹)}

/-- The Steinberg group `St(R)`, the colimit of the groups `Stₙ(R)` of 5.1, presented directly on
generators indexed by all pairs of distinct natural numbers. -/
abbrev SteinbergGroup (R : Type u) [Ring R] := PresentedGroup (steinbergRels R)

/-- The image in `GL(R)` of the elementary matrix `e_{ij}(a)`, formed at size `max i j + 1`. -/
noncomputable def stableTransvection {R : Type u} [Ring R] (p : {p : ℕ × ℕ // p.1 ≠ p.2})
    (a : R) : TauCeti.StableGeneralLinearGroup R :=
  TauCeti.StableGeneralLinearGroup.of R (max p.1.1 p.1.2 + 1)
    (TauCeti.transvectionUnit (i := (⟨p.1.1, by omega⟩ : Fin (max p.1.1 p.1.2 + 1)))
      (j := ⟨p.1.2, by omega⟩) (fun h => p.2 (by simpa using congrArg Fin.val h)) a)

/-- Kervaire–Steinberg: the homomorphism `St(R) → GL(R)` with `x_{ij}(a) ↦ e_{ij}(a)` has image
`E(R)` and central kernel `K₂(R)`, and it is the universal central extension of `E(R)` (Weibel,
*The K-book*, Chapter III, Definition 5.3.1 and Theorem 5.5). -/
theorem steinberg_universalCentralExtension (R : Type u) [Ring R] :
    ∃ φ : SteinbergGroup R →* TauCeti.StableGeneralLinearGroup R,
      (∀ p a, φ (PresentedGroup.of (p, a)) = stableTransvection p a) ∧
      φ.range = TauCeti.StableGeneralLinearGroup.elementarySubgroup R ∧
      φ.ker ≤ Subgroup.center (SteinbergGroup R) ∧
      ∀ (E : Type u) [Group E] (q : E →* TauCeti.StableGeneralLinearGroup R),
        q.range = TauCeti.StableGeneralLinearGroup.elementarySubgroup R →
        q.ker ≤ Subgroup.center E →
        ∃! ψ : SteinbergGroup R →* E, q.comp ψ = φ := by
  sorry

/-- `K₂(𝔽_q) = 0`: for a finite field the homomorphism `St(F) → GL(F)` is injective (Weibel,
*The K-book*, Chapter III, Corollary 6.1.1). -/
theorem kTwo_finiteField (F : Type u) [Field F] [Finite F] :
    ∃ φ : SteinbergGroup F →* TauCeti.StableGeneralLinearGroup F,
      (∀ p a, φ (PresentedGroup.of (p, a)) = stableTransvection p a) ∧
      Function.Injective φ := by
  sorry

/-- Matsumoto's group `(Fˣ ⊗ Fˣ)/⟨x ⊗ y | x + y = 1⟩` of a field. -/
abbrev MatsumotoGroup (F : Type u) [Field F] :=
  TensorProduct ℤ (Additive Fˣ) (Additive Fˣ) ⧸ Submodule.span ℤ
    {t | ∃ x y : Fˣ, (x : F) + y = 1 ∧
      t = TensorProduct.tmul ℤ (Additive.ofMul x) (Additive.ofMul y)}

/-- Matsumoto: `K₂(F) = ker(St(F) → GL(F))` is `(Fˣ ⊗ Fˣ)/⟨x ⊗ (1 − x)⟩`, the Steinberg symbol
`{r, s} = [a, b]`, for lifts `a, b` of `diag(r, r⁻¹, 1)` and `diag(s, 1, s⁻¹)`, corresponding to
`r ⊗ s` (Weibel, *The K-book*, Chapter III, Definition 5.10 and Matsumoto's Theorem 6.1). -/
theorem matsumoto (F : Type u) [Field F] :
    ∃ φ : SteinbergGroup F →* TauCeti.StableGeneralLinearGroup F,
      (∀ p a, φ (PresentedGroup.of (p, a)) = stableTransvection p a) ∧
      ∃ e : Additive φ.ker ≃+ MatsumotoGroup F, ∀ (r s : Fˣ) (a b : SteinbergGroup F),
        φ a = TauCeti.StableGeneralLinearGroup.of F 3
          (Units.map (Matrix.diagonalRingHom (Fin 3) F).toMonoidHom
            (MulEquiv.piUnits.symm ![r, r⁻¹, 1])) →
        φ b = TauCeti.StableGeneralLinearGroup.of F 3
          (Units.map (Matrix.diagonalRingHom (Fin 3) F).toMonoidHom
            (MulEquiv.piUnits.symm ![s, 1, s⁻¹])) →
        (((Additive.toMul (e.symm (Submodule.Quotient.mk
            (TensorProduct.tmul ℤ (Additive.ofMul r) (Additive.ofMul s))))) : φ.ker) :
              SteinbergGroup F) = a * b * a⁻¹ * b⁻¹ := by
  sorry
```

2. Delete the A5 bullet of the module docstring (:49–50).
3. In 5.1, name `steinbergRels`, `SteinbergGroup` and `stableTransvection`.
   - `SteinbergGroup` is St(R) presented on generators indexed by pairs of distinct naturals, and each Stₙ(R) maps to it.
   - State `steinberg_universalCentralExtension` as an API bullet. An extension of E(R) is encoded as q:E→GL(R) with range E(R) and central kernel. Uniqueness of ψ is Weibel III, Lemma 5.3.3 (perfectness of St(R)).
4. In 5.2, name `kTwo_finiteField`, `MatsumotoGroup` and `matsumoto`. The symbol is Weibel's Definition 5.10 (chapter p. 42): {r,s}=[a,b] for lifts of diag(r,r⁻¹,1) and diag(s,1,s⁻¹).
5. Add `MulEquiv.piUnits`, `Matrix.diagonalRingHom` and `TensorProduct` to the Mathlib contracts, next to `FreeGroup` and `PresentedGroup` (:44).
6. Note on another roadmap: K2SymbolsBrauer's `SymbolGroup` (its `Suggested.lean`, Layer 5) is the same quotient as `MatsumotoGroup`. As the later roadmap, K2SymbolsBrauer would alias this one. This needs no change here.

## R02 (P3) — 4.4's identification of Vaserstein's d(X) with covering dimension has no locator that states it

**Location.**
- README :511: "prove that, for nonempty X, this equals Vaserstein's stable-value dimension d(X), … (Vaserstein 1971, the definitions of d(X) and d′(X) on pp. 19–20, … and the remark comparing d(X) with the cube definition)".
- `Suggested.lean` :329–330 has the same claim with no locator: "with the identification of Vaserstein's stable-value dimension with covering dimension for nonempty compact Hausdorff spaces".

**Claim.**
- The cited passages define d(X) and d′(X).
- Vaserstein's remark (vaserstein-1971 lines 145–153) says two things:
  - d(X) agrees with the dimension defined through maps into cubes;
  - d(X) agrees with the other dimensions only for "good" spaces, for example separable metrizable ones.
- A non-metrizable compact Hausdorff space is not covered by the remark, and both Vaserstein equivalences (4.5) rest on this identification.

**Witness.** engelking-1978 lines 8763–8765, Problem 3.2.E (Aleksandroff), printed p. 238: a normal space has dim X ≤ n iff no map X→Bⁿ⁺¹ is essential. Essential maps are defined in Problem 1.9.A (lines 3606–3612, printed pp. 90–91).

**Repair.**
1. In 4.4, after "the remark comparing d(X) with the cube definition", add:

   > "; for normal spaces the essential-map dimension is the covering dimension by Engelking, Dimension Theory, Problem 3.2.E, printed p. 238 (Aleksandroff), with essential maps to a ball as in Problem 1.9.A, printed pp. 90–91, matched with Vaserstein's maps to Sᵈ essential relative to the equator through the closed upper hemisphere; d(X)=d′(X) is Vaserstein's Theorem 5".

2. Add "(Engelking, Dimension Theory, Problem 3.2.E)" after "for nonempty compact Hausdorff spaces" in the docstring of `hasStableRangeLE_continuousMap_complex_iff`.
3. Add Problem 3.2.E to the Engelking reference (:764).

## R03 (P3) — 7.1's identification of patched modules with glued bundles has no locator

**Location.** README :677 (7.1): "Through this equivalence identify 6.2's patched projectives with the actual glued vector bundles, including gluing maps and section modules." The section cites only supplier sections (HilbertModules H2 and H5, TopologicalKTheory T1 and T4) and Mathlib. It gives no source for the identification.

**Witness.**
- weibel-kbook-I lines 1437–1450 (Clutching Construction 4.7, chapter p. 31) present clutching as the bundle analogue of Milnor Patching 2.7.
- Lines 1701–1707 (Exercise 4.9, chapter p. 37) give Swan's equivalence VB(X)≃P(C(X)) for compact Hausdorff X.

**Repair.** After "… including gluing maps and section modules." add:

> "(Weibel, The K-book, Chapter I, Clutching Construction 4.7, chapter p. 31, the bundle analogue of Patching Theorem 2.7, and Exercise 4.9, chapter p. 37, Swan's theorem for compact Hausdorff X)"

## R04 (P3) — Conventions call the closed Mathlib proposal 44734 open

**Location.** README :25: "The open Mathlib proposals [44314] and [44228] (elementary subgroup and transvections), [33882] (finite-rank commutators) and [44734] (stable range one of semilocal rings) are design references for 1.1, 1.3 and 4.2".

**Claim.**
- Mathlib pull request 44734 was closed without merging. It adds only `IsCoprime.exists_isUnit_add_mul`, the commutative case, and no stable-range definition.
- 44314, 44228 and 33882 are open.
- Under the repository README, a closed or stale proposal is prior art, not a design that this roadmap must follow.

**Witness.** github.com/leanprover-community/mathlib4/pull/44734, read 2026-11-09:
- closed by the triage bot on 2026-10-22, not merged;
- one new declaration, `IsCoprime.exists_isUnit_add_mul`.

Pull requests 44314, 44228 and 33882 show as open.

**Repair.** Replace the sentence with:

> "The open Mathlib proposals [44314] and [44228] (elementary subgroup and transvections) and [33882] (finite-rank commutators) are design references for 1.1 and 1.3, and the closed proposal [44734] (stable range one of commutative semilocal rings, through `IsCoprime.exists_isUnit_add_mul`) is prior art for 4.2;"

Keep the rest of the sentence.

## Previous findings (PRREVIEW-AlgebraicKTheory~13)

- **R01 — repaired.**
  - Scope :15 now reads "Tau Ceti's `TauCeti.elementarySubgroup` is the elementary subgroup Eₙ(R) over an arbitrary ring … Layers 1 and 2 use these carriers and their theorems and construct none of them again".
  - The contracts (:51–53) list the Transvection, Elementary and Stable declarations.
  - "neither pinned library has an elementary subgroup" is gone (grep: 0).
  - 1.1–1.3 and 2.1 now cite the pinned declarations, with "What 1.x adds" paragraphs.
  - The provenance bullet is deleted.
- **R02 — repaired.**
  - `kOneMap` (:222), `kOne_divisionRing` (:241), `kOne_int` (:250) and `kOne_mayerVietoris_exact` (:407) are stated.
  - The docstring (:25–29) now says the boundary "needs the patched module `M(u)` … as an object of `FiniteProjectiveRight D`".
  - 2.1 (:322), 2.3 (:355) and 6.4 (:651) name them.
  - `kOneMap` and `kOne_mayerVietoris_exact` take their rings in independent universes. Conventions :21 records this, and it is more general than the repair asked for.
- **R03 — repaired.**
  - `sphereCoord`, `tangentSections` and `tangentSections_stablyFree_not_free` are at :156, :165 and :177.
  - 0.7 is now also stated on native carriers: `circleCoord`, `mobiusSections` and `mobiusSections_order_two` (:186, :199, :208).
- **R04 — repaired.**
  - `elementary`, `whitehead_commutator_elementary` and `elementary_le_commutator` are gone.
  - `dieudonne_determinant`, `surjective_stability` and `injective_stability` use `TauCeti.elementarySubgroup` (:262, :286, :300–301).
- **R05 — repaired.**
  - 0.5 (:169) reads "DifferentialGeometry 11.1's `exists_eq_zero_of_inner_eq_zero` for E=ℝ³ and n=2".
  - The contract is at :68, and the C2 bullet is gone.
  - C7 (:72) is "used only in the terminal comparison of 0.6".
- **R06 — repaired.**
  - :55 and :129 use `ModuleCat.restrictScalarsEquivalenceOfRingEquiv e` with the three `CartanMap.RingEquiv` laws.
  - `RingEquiv.finiteProjectiveModulesK0Equiv` occurs nowhere (grep: 0).

## Verified sound

### Gate, dependency check, elaboration, signatures and probe

- **Gate**, rerun at this head with `--base origin/main`, exit 0:

  ```text
  gate AlgebraicKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's run also reports `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicKTheory'` is empty.
- **Dependency check.** The required command printed exactly `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line.
  - The suppliers are on main: ClassicalArithmeticCompletion, DifferentialGeometry, CharacteristicClasses, TopologicalKTheory, BanachAlgebras and HilbertModules. HilbertModules is also at merge-order line 8.
  - This roadmap is at line 15.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/AlgebraicKTheory/Suggested.lean` exits 0 with 18 "declaration uses `sorry`" warnings and nothing else.
- **`#check @` audit.** One scratch file checked 203 names with exit 0: every one of the 35 declarations of `Suggested.lean`, and every dotted backticked README name that is not a module path.
  - Each elaborated type matches its README statement.
  - `kZeroMap`, `extendScalarsCompIso`, `PatchingTriples`, `patchingFunctor`, `milnor_patching` and `kZero_mayerVietoris_exact` take one universe. `kOneMap` takes two universes and `kOne_mayerVietoris_exact` three, as Conventions :21 says.
  - Both stability theorems keep `s ≤ Fintype.card n` and `s + 1 ≤ Fintype.card n` respectively.
  - Both Vaserstein theorems keep `[CompactSpace X] [T2Space X]` and `1 ≤ s`.
  - No binder is lost, and no change was needed.
- **Module paths.** Every module path the README names exists at the pins. This includes `Mathlib.LinearAlgebra.Matrix.ElementaryRowOperations` and `TauCeti.Algebra.Module.Projective.FreeComplement`, the two leads of `roadmaps resolve`, which are false positives because they are module names.
- **One-tactic probe.** A scratch copy with every `sorry` replaced by `first | rfl | simp | infer_instance | decide | trivial | aesop` gives 18 errors out of 18, so nothing is padding.
  - `kZero_int` and `kZero_divisionRing` are calculations that the Summary lists as end theorems.
  - Tau Ceti's `finrankEquiv` covers fields in `FGModuleCat`, a different category, so it does not duplicate them.
- **Repair test (R01).** A copy of `Suggested.lean` with the A5 block inserted elaborates with exit 0 and 21 `sorry` warnings.

### Library declarations opened at the pins

- **Tau Ceti 2fd255d, `GeneralLinearGroup/Stable.lean`:**
  - `stabilizeGL` :79 and `coe_stabilizeGL_apply` :87;
  - `StableGeneralLinearGroup` :155, `of` :162 and `lift` :208;
  - `elementarySubgroup` :225, `elementarySubgroup_normal` :271 and `elementarySubgroup_eq_commutator` :293;
  - `AlgebraicK1` :314, `mk` :321, `quotientElementarySubgroupEquiv` :359 and `lift` :379.
- **`GeneralLinearGroup/Transvection.lean`:** `transvectionUnit` :146 (any `[Ring A]`) and `coe_transvectionUnit_eq_one_add_single` :157.
- **Mathlib 1b1ccf4, `GeneralLinearGroup/Defs.lean` :188:** `Matrix.GeneralLinearGroup.map` is `Units.map (RingHom.mapMatrix f).toMonoidHom` under `[CommRing R] [CommRing S]` (:68, :184). So `kOneMap`'s `Units.map` of `RingHom.mapMatrix` is the arbitrary-ring form, not a duplicate.
- **Negative searches at both pins:** no Steinberg group, stable range, covering dimension or Dieudonné determinant.

### Cross-roadmap citations resolved

**Suppliers, on main at 3090489:**
- DifferentialGeometry 11.1: README :902, and `Suggested.lean` :3097 `exists_eq_zero_of_inner_eq_zero` with `hn : Even n`;
- ClassicalArithmeticCompletion §7.23 (:14930);
- CharacteristicClasses C7 (:1817);
- TopologicalKTheory T1 (:170) and T4 (:1036);
- BanachAlgebras Layer 2 (:440);
- HilbertModules H2 (:179) and H5 (:356).

**Consumers, at their open heads:**
- KTheoryLowDegrees: README :11 consumes A0–A6, and :1582 aliases A5's St;
- K2SymbolsBrauer: README :974 cites §5.1;
- KTheoryFiniteLocalFields: README :77;
- K3BlochGroups: README :9 cites A1.

`roadmaps overlaps` reports nothing: no open pull request changes this roadmap or drops an id it cites.

### Ownership against open pull requests (`roadmaps grep`, by object)

- **Steinberg group.** It is owned here, and the consumers listed above cite it. No other roadmap's `Suggested.lean` declares a stable Steinberg group. K2SymbolsBrauer's finite-rank `Steinberg.FiniteRank` calls itself an "adapter to AlgebraicKTheory A5".
- **Matsumoto's theorem.** GeneralAlgebraicKTheory :15 excludes it, so A5 owns it.
- **Covering dimension and Milnor patching.** As settled in earlier reviews; nothing new at the heads.

### Seeded sample: locators checked in the cache

| Target | Locator | Cache lines | Result |
|---|---|---|---|
| 0.1 | Tau Ceti `finiteProjectiveModules`, `exists_prod_linearEquiv_fin` | `#check` | Correct; no literature locator needed |
| 0.3 | Weibel II §2, division-ring example and K₀(ℤ), p. 5; Example 2.8.1, p. 13 | weibel-kbook-II 204–207, 212–218, 562–566 | Correct |
| 0.5 | Weibel I Example 1.2.2 | weibel-kbook-I 100–110 (p. 3), polynomial version over the coordinate ring of S² | Correct as "polynomial example" |
| 0.7 | Weibel I (4.9.1) | weibel-kbook-I 1476–1479 (p. 32): Möbius bundle; complex bundles on S¹ trivial | Correct |
| 1.1 | Weibel III Commutators 1.3, (1.3.1), p. 4 | weibel-kbook-III 158–168 | Correct; index conditions match |
| 1.2 | Weibel III §1, p. 1 | 18–28 | Correct |
| 2.1 | Weibel III Definition 1.1 and the next paragraph, p. 1 | 33–39 (functoriality at 38–39) | Correct |
| 2.3 | Example 1.3.5, p. 4; 1.2.4; Exercises 1.2 and 1.5 | 196–202; 109–115 (p. 3); 497–502 (p. 10); 519–520 (p. 11) | Correct; source issue below |
| 3.2 | Weibel II Definition 2.10, Exercises 2.17(a)–(b) and 2.4(e) | 613–635 (pp. 13–14); 775–777 (p. 17); 688–689 (p. 15) | Correct |
| 3.3 | (2.10.2), Exercise 2.17(c)–(e) | 630–632 (p. 14); 778–781 (p. 17) | Correct; cofinal hypothesis matches summand-dense |
| 4.4 | Engelking Theorem 3.2.10 p. 233; Vaserstein pp. 19–20 | engelking-1978 8582–8585; vaserstein-1971 138–141, 145–166 | 3.2.10 correct; d(X) identification unsupported (R02) |
| 6.1 | Weibel I §2.6, pp. 11–12 | weibel-kbook-I 504–534 | Correct; the ideal-square convention is matched by 6.1's kernel identification |
| 7.1 | none | — | R03 |
| 7.2 | Weibel III Theorem 2.6 p. 15; Weibel II Example 2.9.1 p. 13 | weibel-kbook-III 783–793; weibel-kbook-II 607–611 (cusp: ℤ⊕k) | Correct |
| 8.1 | Weibel III Corollary 1.5.1 and Example 1.5.2, p. 6 | weibel-kbook-III 279–284 | Correct |

**Also checked:**
- **Weibel III:**
  - Proposition 2.3 and Definition 2.2 with the Relative Whitehead Lemma (lines 657–722, p. 13) for 3.1;
  - Remark 2.2.1 (711–714) for 3.4;
  - Lemma 1.6 and Corollary 1.6.3 (321–366, pp. 7–8) for 2.2;
  - Remark 1.2.5 and Exercise 1.3 (146–149, 503–511) for 4.1;
  - Definitions 5.1 and 5.2 (1840–1861, p. 35), 5.3.1 (p. 37), Theorem 5.5 (p. 38), Definition 5.10 (p. 42), and Matsumoto 6.1 with Corollary 6.1.1 (2454–2463, p. 48) for R01.
- **Weibel I:** Exercise 1.5 (144–157), whose (Sₙ) uses rows of length n+1 shortened by r_i−r₀t_i. That puts the multiplier on the right, as in `HasStableRangeLE`, whose unimodularity Σaᵢbᵢ=1 is also right-sided.
- No locator in the README is flagged as unverified (grep: 0).

### Adversarial table

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| `kZero_divisionRing` | 𝔽₂; ℍ | P(k)≅ℕ by dimension, so [D]↦1 and [D²]↦2; the zero ring is excluded because `DivisionRing` is nontrivial | True |
| `kZero_int` | ℤ; control ℤ[√−5] | [ℤⁿ]↦n; the control has K₀=ℤ⊕ℤ/2 | True |
| `kZeroMap` | ℤ→ℚ; k→M₂(k); R→0 | [ℤⁿ]↦[ℚⁿ]; [k]↦[M₂(k)]=2[e₁₁M₂(k)]; K₀(0)=0 | Correct map |
| `extendScalarsCompIso` | ℤ→ℤ→𝔽₅, twist by c=2 | the unit condition 1⊗(1⊗p)↦1⊗(1⊗p) fails for 2≠1 in 𝔽₅ | Determined |
| `tangentSections_stablyFree_not_free` | x=(0,0,1); the splitting; control S¹ | p=diag(1,1,0) has rank 2, and R³≅R^(r+1) gives r=2. A basis would give s₁ nowhere zero with ⟨x,s₁⟩=0, impossible by DifferentialGeometry 11.1 (n=2 even). On S¹ (n=1) the module is free on (−x₁,x₀) | True; evenness needed |
| `mobiusSections` | [0], [1/2]; control rotation | ρ(0)=diag(1,−1) fixes u(0)=(1,0), and ρ(1/2)=diag(−1,1) fixes (0,1). 2cos²πt−1=cos2πt and 2cosπt·sinπt=sin2πt, so ρ=2uuᵀ−1. The rotation minus 1 has kernel 0 | Correct object |
| `mobiusSections_order_two` | doubled frame; N=0 | (v,v′)↦vu+v′u⊥ is periodic, being a product of antiperiodic factors, with inverse w↦(⟨u,w⟩u,⟨u⊥,w⟩u); N=0 says M≇R; det B is antiperiodic, so it has a zero by the IVT | True |
| `kOneMap` | id; ℤ→𝔽₅; ℤ→𝔽₂ | mk↦mk; [−1]↦[4]≠1, which excludes the zero map; [−1]↦[1] | Correct |
| `kOne_divisionRing` | 𝔽₂; 𝔽₅; ℍ | K₁(𝔽₂)=1=𝔽₂ˣ; the class of (2) goes to 2, not 3, which excludes the inverse convention; for ℍ, (i)↦1 (norm 1) and (2)↦class of norm 4 | True |
| `kOne_int` | mk(−1); mk(diag(−1,−1)); mk(e₁₂(5)) | −1; 1, consistent with diag(−1,−1)∈E₂(ℤ); 1 | True |
| `dieudonne_determinant` | 𝔽₃, n=2; 𝔽₂, n=2; control ℍ, n=1 | 48/24=2=#𝔽₃ˣ with kernel SL₂(𝔽₃)=E₂(𝔽₃); GL₂(𝔽₂)=E₂(𝔽₂) maps onto 1; for ℍ, n=1, the kernel is the unit quaternions ≠ E₁=1 | True for n≥2 |
| `HasStableRangeLE` | s=0; ℤ, s=1; a field, s=1 | the row (1) shortens to the empty row, so 1=0; (2,5) has 2·3−5=1, but 2+5c≠±1; c=0 or c=1 works | Correct; sides consistent |
| `surjective_stability` | field, s=n=k=1; ℤ, s=n=2, k=1 | g=diag(det g,1)·(diag(det g,1)⁻¹g) with the second factor in SL₂=E₂; GL₃(ℤ)=GL₂(ℤ)·SL₃(ℤ) | True (Weibel III Exercise 1.3(a)) |
| `injective_stability` | field, n=2; control ℍ, s=1, n=1 | diag(g,1)∈E₃ forces det g=1, so g∈E₂; diag(i,1)∈E₂(ℍ) but i∉E₁(ℍ)=1 | True; the bound s+1 is tight |
| `hasStableRangeLE_one_of_isSemisimpleRing` | 𝔽₂[x]/(x²); 𝔽₅×𝔽₇; zero ring; control ℤ | (x,1+x)↦x+(1+x)=1; Jacobson radical 0; quotient 0 is semisimple; ℤ/Jac(ℤ)=ℤ is not semisimple and (2,5) fails | True |
| `hasStableRangeLE_of_ringKrullDim_le` | ℤ, d=1; ℤ[x], d=2; zero ring | sr≤2 and not ≤1; sr≤3; ⊥≤d | True |
| `HasCoveringDimensionLE` | [0,1], d=0 and 1; ∅; finite discrete; Hilbert cube | {[0,2/3),(1/3,1]} has no order-1 refinement, by connectedness; the empty refinement; singletons; contains [0,1]^(d+1) | Correct |
| complex Vaserstein iff | pt, s=1; [0,1], s=1; S², s=1 and 2; ∅; Hilbert cube; s=0 | 1 and 0≤1; 1 and 1≤1; false and false, then true and true (sr 2); true and true; false and false; at s=0, ℂ fails while 2·0−1=0 holds | True; `1≤s` needed |
| real Vaserstein iff | [0,1], s=1 and 2; S², s=2 and 3 | sr 2: false/false, then true/true; sr 3: false/false, then true/true | True |
| `milnor_patching` | Q=0; ℤ→𝔽₅←ℤ; π₂=id; control ℤ→ℚ←ℤ | Proj(A₁×A₂)≃product; M(2) is in the image; D≅A₁; in the control (ℤ,ℤ,2)≇(ℤ,ℤ,1), since v=2u has no solution in ±1 | True; hypothesis needed |
| `kZero_mayerVietoris_exact` | ℤ→𝔽₅←ℤ; ℤ→ℤ/6←ℤ; Q=0 | ker g₀ is the diagonal, which is im f₀; g₀=(x−y,x−y) is not onto; f₀ is an isomorphism | True |
| `kOne_mayerVietoris_exact` | ℤ→𝔽₅←ℤ; Q=0 | ker g₁={(1,1),(−1,−1)}=f₁(±(1,1)) and ([−1],[1])∉ker; everything on both sides | True |
| `kZero_arithmeticSquare` | [D]; the torsion | coker g₁=𝔽₅ˣ/{±1}≅ℤ/2, ker g₀≅ℤ, and the sequence splits; f₀[D]=(1,1)≠0, and the torsion maps to 0 in the torsion-free K₀(ℤ)² | True |
| `kZero_cuspSquare` | [D]; δ[1+t] | Qˣ=𝔽₅ˣ×(1+t𝔽₅), the image of g₁ is 𝔽₅ˣ, so the cokernel is ℤ/5; agrees with Weibel II Example 2.9.1 (ℤ⊕k) | True |
| 3.2/3.3 Checks for ℤ→ℚ | (ℤ²,diag(2,½),ℤ²); δ(2) | (ℤ,2,ℤ)+(ℤ,½,ℤ)=(ℤ,1,ℤ)=0 but there is no stable isomorphism, since diag(2,½)⊕I is not integral; det mod ±1 is well defined and sends δ(2)↦2 | Correct |
| 6.3 Check, 𝔽₇ square | δ(2), δ(4) | 2·4≡1 and 2³≡1, so δ(4)=2δ(2)=−δ(2)≠δ(2) in ℤ/3 | Correct |
| 7.1 Checks | pt⊔pt; two intervals; z^k | ℂ² over the zero ring; a circle; (1+β)^k−1=kβ since β²=0 | Correct |
| R01 statements | zero ring; 𝔽₂; ℤ | St(0)=1 because x(0)²=x(0), so ψ is trivial and unique; K₂(𝔽₂)=0 and MatsumotoGroup(𝔽₂)=0; K₂(ℤ)=ℤ/2, so φ is not injective, which the `[Finite F]` field hypothesis excludes | True |
| A5 docstring reason (R01) | probe | `PresentedGroup` carries it, and the block elaborates | False |
| 4.4 d(X) agreement (R02) | Vaserstein's remark | agreement is claimed only for separable metrizable spaces; Engelking 3.2.E covers normal spaces | Locator missing |
| Mathlib PR 44734 (R04) | the pull-request page | closed 2026-10-22, not merged | "open" false |

## Not verifiable

- **Milnor, *Introduction to Algebraic K-Theory*, and Bass, *Algebraic K-Theory*.** Both are settled as uncertified, so I did not read them. Every locator in the sample rests on Weibel, Vaserstein or Engelking, which I read.
- **Stacks chapter numbers.** The "15.6.9" and "93.4" numbers are not printed in the cached tag extractions. Tags 0D2J and 0DVN are unambiguous.

## Source issues

- **Misprint** in weibel-kbook-III at Division rings 1.2.4, printed p. 3: the source attaches the exception n=2, D=𝔽₂ to GLₙ(D)/Eₙ(D)≅Dˣ/[Dˣ,Dˣ]; it should attach it to perfectness of Eₙ(D), since both sides are trivial for 𝔽₂; affects nothing.
- **Error** in vaserstein-1971 at Theorems 5 and 7, printed p. 20: the source states the formulas for every topological space, but d(∅)=∞ (definition, p. 19) while C(∅) is the zero ring; it should assume X nonempty; affects nothing (the roadmap reads them for nonempty X).
