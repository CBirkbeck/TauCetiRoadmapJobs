# Review of AlgebraicKTheory (pull request #1142 at 10aafe6)

**Verdict:** needs changes

This is an incremental re-review of the 25 lines that changed since 7398d9c, all in `TauCetiRoadmap/AlgebraicKTheory/Suggested.lean`: the module-system header (`module`, `public import`, `@[expose] public section`) and the four object proofs `TauCeti.finiteProjectiveModules_iff.mpr ⟨…⟩` in `kZero_divisionRing`, `kZero_int`, `kZero_arithmeticSquare` and `kZero_cuspSquare`. The head is a merge of main, which moves the pins from Tau Ceti a91d3aa / Mathlib 6b7abb3 (the pins the previous reports read) to Tau Ceti 2fd255d / Mathlib 1b1ccf4, the pins of main; the folder's own diff against main outside the roadmap folder is empty. The README is byte-for-byte unchanged.

The changed lines are correct (below). The one finding is that the file's module docstring makes claims about "the pins" that the new pin falsifies: Tau Ceti 2fd255d has the balanced extension of scalars over arbitrary rings and the induced functor on finitely generated projectives, so the headline statements about the `K₀` map of a ring homomorphism are statable and absent.

## R01 (P2) — The docstring's "not statable" reason is false at the pin this head uses, and the `K₀`-map headlines it excuses are statable and absent

**Location.** `TauCetiRoadmap/AlgebraicKTheory/Suggested.lean` :20–28: "every statement about the `K₀` map of a ring homomorphism: these need extension of scalars along an arbitrary ring homomorphism … neither pinned library supplies the ordinary balanced tensor product over an arbitrary associative ring with its outer target-ring action"; also :32–33 and :36–38 ("the extension functor of 0.2", "the same extension functor").

**Claim.** At the pin this head builds against (Tau Ceti 2fd255d, the pin of `lake-manifest.json` at 10aafe6, equal to main's), the carrier the docstring says is missing exists:

- `TauCeti.BalancedExtension f P` (`TauCeti/LinearAlgebra/TensorProduct/Balanced/Extension.lean` :118), `S ⊗_R P` for `f : R →+* S` with `[Ring R] [Ring S]` and no commutativity, a left `S`-module by the first factor (instance at :126), with `tmul`, `lift`, `liftEquiv` (`(P →ₛₗ[f] Q) ≃ (BalancedExtension f P →ₗ[S] Q)`), `lid`, `cancelBaseChange`, `piScalarRight`;
- `RingHom.finiteProjectiveModulesExtendScalars f : (finiteProjectiveModules R).FullSubcategory ⥤ (finiteProjectiveModules S).FullSubcategory` (`TauCeti/Algebra/Category/ModuleCat/FiniteProjective/ScalarChange.lean` :80) with its `Additive` instance (:86), for `{R S : Type u} [Ring R] [Ring S]`;
- `RingHom.finiteProjectiveModulesK0Extend f : ExactK0 (finiteProjectiveModulesExactStructure R) →+ ExactK0 (… S)` (`TauCeti/Algebra/Category/ModuleCat/CartanMap/ExtendScalars.lean`), with `_of`, `_id`, `_comp`, `_of_linearEquiv_pi`.

None of the three files exists at the previous pin a91d3aa (checked with `git cat-file -e` in the pinned Tau Ceti checkout), which is why PRREVIEW-AlgebraicKTheory~7 and ~8 found the docstring's claim true then. It is false now, and this head is the one that moved the pin.

**Witness.** A scratch copy of the file with one more import, `TauCeti.Algebra.Category.ModuleCat.CartanMap.ExtendScalars` (object file built with `lake build` of that module), and the following declarations elaborates with `lake env lean`, exit 0, 17 `sorry` warnings and no error:

```lean
noncomputable def kZeroMap {R S : Type u} [Ring R] [Ring S] (f : R →+* S) :
    KZero R →+ KZero S :=
  TauCeti.SplitK0.map (RingHom.op f).finiteProjectiveModulesExtendScalars

theorem kZero_cuspSquare_ker :
    Nonempty (((kZeroMap (R := cuspSquare) (RingHom.pullbackFst _ _)).prod
      (kZeroMap (R := cuspSquare) (RingHom.pullbackSnd _ _))).ker ≃+ ZMod 5) := by sorry

theorem kZero_arithmeticSquare_ker :
    Nonempty (((kZeroMap (R := arithmeticSquare) (RingHom.pullbackFst _ _)).prod
      (kZeroMap (R := arithmeticSquare) (RingHom.pullbackSnd _ _))).ker ≃+ ZMod 2) := by sorry

theorem kZero_mayerVietoris_exact {A₁ A₂ Q : Type u} [Ring A₁] [Ring A₂] [Ring Q]
    (π₁ : A₁ →+* Q) (π₂ : A₂ →+* Q) (h : Function.Surjective π₁) :
    Function.Exact
      ((kZeroMap (RingHom.pullbackFst π₁ π₂)).prod (kZeroMap (RingHom.pullbackSnd π₁ π₂)))
      ((kZeroMap π₁).comp (AddMonoidHom.fst (KZero A₁) (KZero A₂)) -
        (kZeroMap π₂).comp (AddMonoidHom.snd (KZero A₁) (KZero A₂))) := by sorry
```

`kZeroMap` is `K₀(f)` exactly as 0.3 defines it (`TauCeti.SplitK0.map` of the extension functor along `fᵐᵒᵖ`); the `PreservesZeroMorphisms` and `PreservesBiproductsOfShape WalkingPair` instances `SplitK0.map` needs are found from the pinned `Additive` instance. The three theorems are the K₀ statements the docstring lists as not statable: 6.4's exactness at `K₀(A₁)⊕K₀(A₂)` (ker g₀ = im f₀, one surjective leg; README :612–629) and 7.2's "ker f₀ ≅ ℤ/2" and "ker f₀ ≅ ℤ/5" (README :655–670). Values: for the arithmetic square ker f₀ ≅ coker(K₁(ℤ)⊕K₁(ℤ) → 𝔽₅ˣ) = 𝔽₅ˣ/{±1} ≅ ℤ/2; for the cusp, (𝔽₅[t]/t²)ˣ/(𝔽₅ˣ) = 1+t𝔽₅ ≅ ℤ/5; with 𝔽₂ in place of 𝔽₅ the kernel is 0; for Q = 0 the exactness statement says f₀ : K₀(A₁×A₂) → K₀(A₁)⊕K₀(A₂) is onto, which is true. The three are headlines by the file's own account (:20–28 lists them as headlines not statable at the pins) and by the README (6.4 and 7.2 bullets).

**Repair** (tested on the instance above):

1. Add the import `TauCeti.Algebra.Category.ModuleCat.CartanMap.ExtendScalars` (or `…FiniteProjective.ScalarChange`, which already has the functor) and the definition `kZeroMap` with a docstring saying it is 0.3's `K₀(f)`; state `kZero_mayerVietoris_exact`, `kZero_arithmeticSquare_ker` and `kZero_cuspSquare_ker` under Layers A6 and A7, each with its Weibel locator (III, Theorem 2.6, p. 15; II, Example 2.9.1, p. 13). Do not add a value lemma for `kZeroMap` on generators: it is `TauCeti.SplitK0.map_of` and would be padding.
2. Rewrite the docstring bullet at :20–28 to what is still not statable and why: the Milnor patching theorem and the full Mayer–Vietoris sequence need `K₁(R)` and the boundary, which are README targets (the stable `GL(R)` is not in either library); the torsion class `[M(2)] − [D]` needs the finite-projectivity proof of the patched module `M(2)` inside its statement; the gluing of 7.1 needs section modules of continuous bundles. Drop the sentence that neither library supplies the balanced tensor product. At :32–33 and :36–38 "the extension functor of 0.2" becomes the pinned `TauCeti.BalancedExtension`; what 0.6 and 0.7 still lack is only the section module.
3. README and Lean agree: add `TauCeti.BalancedExtension` (with `liftEquiv`, `lid`, `cancelBaseChange`, `piScalarRight`), `RingHom.finiteProjectiveModulesExtendScalars` and `RingHom.finiteProjectiveModulesK0Extend` to `## Exact supplier contracts` › `From Tau Ceti` with their files, and narrow the `From TauCetiRoadmap.ClassicalArithmeticCompletion` items §7.8, §7.24 and §7.42 (README :54, :58), the Scope sentence "ClassicalArithmeticCompletion §7.8 owns balanced left-module extension" (:15) and the `*Needs:*` lines of 0.2 (:121) and 0.3 (:139) to what the pin lacks: the categorical adjunction `E_f ⊣ Res_f` with `ModuleCat.restrictScalars` and the comparison with `ModuleCat.extendRestrictScalarsAdj` (neither is in the pinned Balanced files: no `Adjunction` and no `extendScalars` occurrence outside the header comment), which 0.2 may keep as its own targets or cite from ClassicalArithmeticCompletion §7.8 as that section states them. What exists at the pins is cited by name and file, not through a roadmap that plans it. The pinned functor fixes `R` and `S` in one universe; the README's universe clause (:21) should say so.

## Previous findings

- The previous report (PRREVIEW-AlgebraicKTheory~10) accepted with no finding of its own. Its account of ~9's R01 (the 0.5 S¹ Check) as repaired stands: the README is unchanged at this head, so README :169 still reads as ~10 quotes it.

## Verified sound

### The changed lines

- **Header.** `module` / `public import Mathlib` / the two `public import TauCeti.*` lines / `@[expose] public section` is the module-system form of the house header; 31 of the 190 `Suggested.lean` files on main (33196b1) use `module`, 14 of them with `@[expose] public section`. The gate's `imports=0`, `mathlib-subimports=0`, `no-import-mathlib=0` accept it. Both imported modules exist at Tau Ceti 2fd255d (`CartanMap/Basic.lean`, `GrothendieckGroup/Split.lean`).
- **The four object proofs.** `TauCeti.finiteProjectiveModules_iff : finiteProjectiveModules R M ↔ Module.Finite R M ∧ Module.Projective R M` is `Iff.rfl` at `CartanMap/Basic.lean` :134, and `finiteProjectiveModules` (:129) is a plain `def` not marked `@[expose]`, so outside its module the anonymous constructor no longer reduces through it: the `.mpr` form proves the same proposition as before. The components: for `Dᵐᵒᵖ` and `ℤᵐᵒᵖ`, `inferInstance` finds `Module.Finite` and `Module.Projective` of the ring over itself; for the two pullback subrings, `Module.Finite.self _` and `Module.Projective.of_free` from `Module.Free.self _`, as before.
- **Elaborated types.** `#check @` on all 20 declarations, appended to the scratch copy: unchanged from ~10 (the object `{ obj := ↧Dᵐᵒᵖ, property := ⋯ }` and the same for `ℤ`, `arithmeticSquare`, `cuspSquare`; `[IsSemisimpleRing (R ⧸ Ring.jacobson R)]`, `[IsNoetherianRing A]`, `3 ≤`, `2 ≤`, `s ≤`, `s + 1 ≤ Fintype.card n`, `[CompactSpace X] [T2Space X]` with `1 ≤ s` all present).

### Gate, build, elaboration and probes

- **Gate**, rerun at this head with `--base origin/main`, exit 0:

  ```text
  gate AlgebraicKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's run also reports `build=0`.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicKTheory'` is empty: the head's merge takes main 01daf25 unchanged. The pins of `lake-manifest.json` and `lean-toolchain` (v4.36.0-rc2) equal main's.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/AlgebraicKTheory/Suggested.lean` exits 0 in 13 s with exactly 13 "declaration uses `sorry`" warnings and nothing else.
- **One-tactic probe.** Every `sorry` replaced by `first | rfl | simp | infer_instance | decide | trivial | aesop` on a scratch copy: 13 errors, 0 `sorry` warnings; nothing is padding.
- **Dependency check.** The required command printed exactly `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The finding adds no supplier: Tau Ceti is a pin, and ClassicalArithmeticCompletion is already cited.

### Locators of the changed theorems (cache)

- `kZero_divisionRing`: weibel-kbook-II line 204 (p. 5, the division-ring example, before Lemma 2.1 at line 226). Matches.
- `kZero_int`: weibel-kbook-II p. 5, Lemma 2.1 (line 226): `K₀` of a ring with `IBP` and all projectives free; `ℤ` is a PID. Matches.
- `kZero_arithmeticSquare`: weibel-kbook-III line 783, Theorem 2.6 (Mayer–Vietoris), p. 15 (page marker at line 772). Matches.
- `kZero_cuspSquare`: weibel-kbook-II line 607–609, Example 2.9.1, p. 13 (marker at 560): `K₀` of the cusp over `k` is `ℤ ⊕ k`. Matches.
- 0.2's and 0.3's Weibel II §2.8/Example 2.8.1 at p. 13 (line 562) is where the cache places it.

### Seeded sample

None of the sampled targets (0.2, 0.5, 1.1, 1.4, 2.3, 3.1, 3.2, 4.4, 4.5, 5.1, 5.2, 6.1, 6.2, 8.1, 8.2) is touched by the diff, and the change adds no locator; their locators were verified in PRREVIEW-AlgebraicKTheory~7, ~8 and ~9. 0.2's supplier text is affected by the pin move and is covered by R01 item 3.

### Adversarial table

Changed statements, with values computed at this head:

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| `finiteProjectiveModules_iff.mpr ⟨_, _⟩` as the object proof | `R = Dᵐᵒᵖ`; `R = ℤᵐᵒᵖ`; `R = arithmeticSquareᵐᵒᵖ`; `R = cuspSquareᵐᵒᵖ`, `M = R` | predicate at :129 is `Finite ∧ Projective`; iff at :134 is `Iff.rfl`; `R` over itself is finite (generator 1) and free, hence projective | Same object as before; elaborates |
| `kZero_divisionRing` | `𝔽₂`, `ℍ` | `[D] ↦ 1`, `[D²] ↦ 2`; rank is the only invariant of a free module over a division ring | True (~8) |
| `kZero_int` | `ℤ`; control `ℤ[√−5]` | `[ℤⁿ] ↦ n`; control has `K₀ = ℤ ⊕ ℤ/2` | True (~8) |
| `kZero_arithmeticSquare` | `ℤ ×_𝔽₅ ℤ`; control `𝔽₂` in place of `𝔽₅` | coker(`{±1}⊕{±1} → 𝔽₅ˣ`) = `ℤ/2`, image of `K₀(D)` in `ℤ²` the diagonal, `[D] ↦ (1,0)`; control: `𝔽₂ˣ = 1`, torsion 0 | True (~8) |
| `kZero_cuspSquare` | `𝔽₅[t²,t³]`; `Q = 0` control | `(𝔽₅[t]/t²)ˣ / 𝔽₅ˣ = 1 + t𝔽₅ ≅ ℤ/5`, `[D] ↦ (1,0)`; control `K₀(A₁×A₂) = K₀(A₁)⊕K₀(A₂)` | True (~8) |
| Module header | `module`, `public import`, `@[expose] public section` | 31/190 files on main use `module`; gate `imports=0` | House form |
| Proposed `kZeroMap f` (R01) | `f = id`; `f : k → M₂(k)` | `SplitK0.map (𝟭) = id` (`map_id`); `[k] ↦ [M₂(k)] = 2·[e₁₁M₂(k)]`, i.e. 2 on `ℤ`, Morita would give 1 | 0.3's map; elaborates |
| Proposed `kZero_mayerVietoris_exact` (R01) | `Q = 0`; arithmetic square; `Q = ℤ/6` | `f₀` onto `K₀(A₁)⊕K₀(A₂)`; ker g₀ = diagonal = im f₀; `g₀(x,y) = (x−y, x−y)`, ker the diagonal, not onto `ℤ²` | Exactness holds, surjectivity of `g₀` not claimed |
| Proposed kernel theorems (R01) | `𝔽₅`; `𝔽₂`; cusp | `𝔽₅ˣ/{±1} ≅ ℤ/2`; `𝔽₂ˣ/{±1} = 0`; `1 + t𝔽₅ ≅ ℤ/5` | Values as in README 7.2 |

Statements untouched by the diff carry the rows of PRREVIEW-AlgebraicKTheory~10 (whose last block carries ~9, ~8 and ~7), with their values:

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 0.5 Check, Euler numbers | n=1; n=2; n=3 | 1+(−1)¹=0; 1+(−1)²=2; 1+(−1)³=0 | Values as written (~10) |
| 0.5 Check, antipodal degree | n=1; n=2; n=3 | (−1)²=+1; (−1)³=−1; (−1)⁴=+1 | Values as written (~10) |
| 0.5 Check, homotopy on the sphere, endpoints, contradiction | x=(0,0,1), v̂=(1,0,0), t=1/2; t=0,1; S² vs S¹ | |H|²=1; H=x, −x; deg 1 vs −1 on S², +1=+1 on S¹ | Sound (~10) |
| 0.5, rank of P | x=(0,0,1); (1,0,0); general | p=diag(1,1,0); diag(0,1,1); trace 2 | rank 2 (~9) |
| 0.5, contradiction via C2 item 2 + C7 item 3 | S²; trivial R²; S⁴ | e=0 vs 2; e=0 with constant section; 2 | Sound (~9) |
| Contracts :66–67 (C2 item 2, C7 item 3) | TS², S²×ℝ²; n=1,2 | e[S²]=2, 0; 0, 2; e=c₁ | Match (~9) |
| 4.2, semilocal = Mathlib's hypothesis; sr(R)=sr(R/J) | ℤ₍₅₎, T₂(k), ℤ with J=5ℤ; 𝔽₂[x]/(x²); zero ring | 𝔽₅=𝔽₅; k×k; ℤ/5 semisimple but ℤ/Jac(ℤ)=ℤ not; 1=1; 0=0 | Sound (~9) |
| `hasStableRangeLE_one_of_isSemisimpleRing` | 𝔽₂[x]/(x²); zero ring; control ℤ | (x,1+x) shortens; every bound; ℤ fails | True (~9) |
| 0.1, 0.3, 0.4 (complement, K₀(f) convention, stable equality) | ℤ×ℤ, zero ring; k→M₂(k), ℤ[C₂]→ℤ, ℂ→M₂(ℝ); ℤ[√−5], 𝔭=(2,1+√−5) | Q=0×ℤ; [k]↦2, [ℤ[C₂]]↦[ℤ], [ℂ]↦2; [𝔭⊕𝔭]=[A²], [𝔭]≠[A] | Sound (~8) |
| 1.1 commutator Check; 2.1 products; 3.2; 3.4; 4.1 | ℤ c=2,d=3; 𝔽₂×𝔽₃; block, ℤ→ℚ; ℂ, 0; ℍ, T₂(k) | 1+6E₁₃ vs 1−6E₁₃; 0⊕ℤ/2; c=γα″⁻¹, e₁₂(1/2)↦0; identities; 1=1 | Sound (~8) |
| 4.4, 4.5, 8.2 | [0,1] cover d=1; point,[0,1],S²,T⁴; ℂ, C(S¹), C(D²)→C(S¹) | 2≤2, 1; 1,1,2,3 both sides; ℂˣ=exp ℂ, winding 1 vs 0, z does not lift | Sound (~8) |
| `whitehead_commutator_elementary` | ℍ, n=1, g=i, h=j | [i,j]=−1, diag(−1,1)∈E₂(ℍ) | True (~8) |
| `elementary_le_commutator` | 𝔽₂, card 3 and 2 | E₃(𝔽₂) simple of order 168; E₂(𝔽₂)≅S₃⊄A₃ | Bound needed and present (~8) |
| `dieudonne_determinant` | 𝔽₃, n=2; ℍ, n=1 | kernel SL₂(𝔽₃)=E₂, order 24; unit quaternions ≠ E₁ | True for n≥2 (~8) |
| `HasStableRangeLE`; `surjective_stability`/`injective_stability` | s=0; ℤ, s=1; field s=1; Cohn's matrix over k[x,y] | shortens only if 1=0; 2+5c≠±1; [[0,1],[1,0]]=diag(−1,1)·e; Cohn ∈E₃∖E₂ but 2<s+1 | True (~8) |
| `hasStableRangeLE_of_ringKrullDim_le` | ℤ, d=1; ℤ[x], d=2 | ≤2 (≤1 false); ≤3 | True (~8) |
| `HasCoveringDimensionLE`; both Vaserstein `iff`s | [0,1] d=0,1; ∅; S², T⁴, s=0 control | fails; holds; empty refinement; ℂ: S² s=1 F/F, s=2 T/T; T⁴ s=3 T/T; ℝ: S² s=2 F/F, s=3 T/T; s=0 on a point F vs T | Agree; `1 ≤ s` needed (~8) |

### Cross-roadmap citations and ownership

- ClassicalArithmeticCompletion on main (33196b1) has §7.6 (:14458), §7.7 (:14487), §7.8 (:14505), §7.23 (:14930), §7.24 (:14948) and §7.42 (:15404) with the headings the README quotes; §7.42 says `K₀` is "the existing SplitK0 of finiteProjectiveModules" and its route is "Apply SplitK0.map", which is the route `kZeroMap` above takes. §7.8's object is now `TauCeti.BalancedExtension` at the pin (R01 item 3).
- `roadmaps overlaps`: no open pull request changes this roadmap, drops an id it cites, or is the only definer of an id it cites. The closest roadmaps by vocabulary (GeneralAlgebraicKTheory #1212, KTheoryLowDegrees #1248, OperatorKTheory #866, K2SymbolsBrauer #1302, SchemeKTheoryOperations #1229) were compared in ~7; R01 asks for statements of objects 6.4 and 7.2 already own, so no new ownership question arises.
- `roadmaps resolve`: the 7 leads (`ElementaryRowOperations`, six `Matrix.*_elementarySubgroup` names at README :735) are unchanged from previous rounds, where they were checked: the first is a Mathlib file name at the pin, the six are names cited from the CC0 formalization the References entry at :735 describes, not claims on `Suggested.lean`.

### Remarks on untouched text (no change requested)

- README :15 and :54 say ClassicalArithmeticCompletion §7.8 "owns" balanced extension; with the pin moved this is covered by R01 item 3 rather than raised separately, since the README must agree with the Lean the repair adds.

## Not verifiable

- **Milnor, *Introduction to Algebraic K-Theory*, and Bass, *Algebraic K-Theory*:** uncertified in the manifest, cited by locator only; the diff touches neither.
- **Ownership against open pull requests** beyond the overlaps report and the five closest roadmaps: not re-run this round; the change introduces no new owned object, and R01's statements are of objects 6.4 and 7.2 already own.

## Source issues

- none (the Weibel I, Exercise 1.5(c) misprint is recorded in PRREVIEW-AlgebraicKTheory~9).
