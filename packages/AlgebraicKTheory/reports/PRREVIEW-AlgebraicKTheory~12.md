# Review of AlgebraicKTheory (pull request #1142 at b340b2c)

**Verdict:** needs changes

This is an incremental re-review of the 131 lines that changed since 10aafe6. The change touches `TauCetiRoadmap/AlgebraicKTheory/Suggested.lean`, which gains `kZeroMap`, `kZero_mayerVietoris_exact`, the kernel clauses of `kZero_arithmeticSquare` and `kZero_cuspSquare`, and a rewritten module docstring. In `TauCetiRoadmap/AlgebraicKTheory/README.md` it rewrites the Summary, Scope, Conventions, the Tau Ceti and ClassicalArithmeticCompletion contracts, 0.2, 0.3, 0.4, the Layer 0 Dependencies, 6.4 and 7.2. The pins are unchanged (Tau Ceti 2fd255d, Mathlib 1b1ccf4), and nothing outside the folder changed.

The new Lean statements are true and correctly stated. The gate passes, and the file elaborates with exactly 14 `sorry` warnings. Three findings remain:

- **R01.** 0.2 still plans the extension/restriction adjunction and still cites a roadmap for its commutative comparison, but both are already in the pinned Tau Ceti. The previous report caused this: its R01 said neither existed at the pin. That claim was wrong. It searched only `TauCeti/LinearAlgebra/TensorProduct/Balanced/`, and both declarations are in `TauCeti/Algebra/Category/ModuleCat/BalancedExtension.lean` at the same pin.
- **R02.** Two supplier contracts misstate the pinned library.
- **R03.** Two of the docstring's "not statable" reasons name the wrong obstacle.

## R01 (P2) — 0.2 plans the adjunction E_f ⊣ Res_f and cites ClassicalArithmeticCompletion §7.8 for the commutative comparison; Tau Ceti has both at the pin

**Location.**
- `TauCetiRoadmap/AlgebraicKTheory/README.md` :107: "Package Tau Ceti's balanced-lift bijection … as the categorical adjunction E_f ⊣ Res_f on **all** modules, between `TauCeti.BalancedExtension.functor f` and native `ModuleCat.restrictScalars f`. The unit is m↦1⊗m and the counit is s⊗n↦s·n; derive naturality and both triangle identities".
- :109: "Compare the packaged adjunction with native `ModuleCat.extendRestrictScalarsAdj` for commutative rings, using ClassicalArithmeticCompletion §7.8's comparison".
- API bullets :111 and :113, Scope :15 ("Its §7.8 supplies only the comparison … used in 0.2"), the contract :59, 0.2's *Needs:* at :123, and the Layer 0 Dependencies at :219.

**Claim.** Both the adjunction that 0.2 sets as a target and the commutative comparison it takes from ClassicalArithmeticCompletion §7.8 are declarations of the pinned Tau Ceti. The roadmap re-plans one and routes the other through a roadmap. This is the unrepaired part of the previous R01 item 3 ("what exists at the pins is cited by name and file, not through a roadmap that plans it").

**Witness.** Tau Ceti 2fd255d, `TauCeti/Algebra/Category/ModuleCat/BalancedExtension.lean`. This is the file the README already cites at :52 for `functor`.
- `TauCeti.BalancedExtension.adjunction f : functor f ⊣ ModuleCat.restrictScalars f` (:92), for `[Ring R] [Ring S]`.
- `adjunction_unit_app_apply` (:113): the unit is `m ↦ tmul f 1 m`.
- `adjunction_counit_app_tmul` (:120): the counit is `s ⊗ n ↦ s • n`.
- `adjunction_homEquiv_apply` (:106).
- `extendScalarsIso f : functor f ≅ ModuleCat.extendScalars f` (:144), for `[CommRing R] [CommRing S]`, defined as `(adjunction f).leftAdjointUniq (ModuleCat.extendRestrictScalarsAdj f)`.
- `extendScalarsIso_hom_app_tmul` (:149): `s ⊗ m ↦ s ⊗ₜ m`.

`#check @TauCeti.BalancedExtension.adjunction` and `#check @TauCeti.BalancedExtension.extendScalarsIso` elaborate under the file's own imports, because `FiniteProjective.ScalarChange` imports this module.

**Repair.**
1. Under `### From Tau Ceti` (:52), add the file `TauCeti.Algebra.Category.ModuleCat.BalancedExtension` with:
   - `TauCeti.BalancedExtension.adjunction`, with `adjunction_unit_app_apply`, `adjunction_counit_app_tmul` and `adjunction_homEquiv_apply`;
   - `TauCeti.BalancedExtension.extendScalarsIso`, with `extendScalarsIso_hom_app_tmul` and `extendScalarsIso_inv_app_tmul`.
2. In 0.2, cite the adjunction on all modules (:107) and the commutative comparison (:109) instead of planning them. Delete API bullet :111. Reduce :113 to the coherence of the right-module transport.

   0.2 keeps what the pin lacks:
   - the transport along fᵐᵒᵖ to right modules: E_(fᵐᵒᵖ)(P) ≅ P⊗ᵣS, the right action, and the right-module unit p↦p⊗1 and counit n⊗s↦n·s, read off the pinned adjunction for fᵐᵒᵖ;
   - the coherence of the transported associator and unit;
   - the opposite-ring and matrix-transpose adapters.

   The adjunction clauses of the first and third Checks (:117, :119) go with the deleted target.
3. Drop ClassicalArithmeticCompletion §7.8 from :15, :59, :123 and :219. The commutative comparison is §7.8's `BalancedExtension.commutative` (ClassicalArithmeticCompletion on main 1bea835, :14505 ff.), which is exactly `extendScalarsIso` at the pin.

## R02 (P3) — Two supplier contracts misstate the pinned Tau Ceti: §7.7 is a pinned theorem, and `finrank_eq` needs free modules

**Location.**
- README :58: "§7.7, “Finite projectives have finite free complements”: for every finitely generated projective left module P over any unital ring, a finitely generated projective N with P⊕N≅Rⁿ". The same citation appears at :3, :15, :157 and :219.
- :54: "`TauCeti.StableEquivalent.finrank_eq` under the strong rank condition".

**Claim.** The rewritten contracts cite ClassicalArithmeticCompletion §7.7 for a theorem the pin already has. They also state `finrank_eq` with fewer hypotheses than the pinned declaration carries.

**Witness.**
- Tau Ceti 2fd255d, `TauCeti/Algebra/Module/Projective/FreeComplement.lean` :49, `Module.Projective.exists_prod_linearEquiv_fin`: for `[Ring R]`, `[Module.Finite R P]` and `[Module.Projective R P]` there exist a finite projective `N` and `n` with `Nonempty ((P × N) ≃ₗ[R] (Fin n → R))`. That is §7.7's statement.
- `TauCeti/Algebra/Module/StableEquivalent.lean` :188 puts `[Module.Free R P] [Module.Free R Q]` beside `[StrongRankCondition R]` for `finrank_eq` (:202).

**Repair.**
- Add `Module.Projective.exists_prod_linearEquiv_fin` (`TauCeti.Algebra.Module.Projective.FreeComplement`) under `### From Tau Ceti`.
- Drop §7.7 from :3, :15, :58, :157 and :219, and point 0.1's mentions (:91, :93, :103) at the same declaration, so that one owner is cited.
- Keep §7.23, which is not at the pin: no `SplitK0` equality criterion exists in Tau Ceti.
- At :54, write "for free P and Q over a ring with the strong rank condition".

## R03 (P3) — Two of the docstring's "not statable" reasons name the wrong obstacle

**Location.**
- `TauCetiRoadmap/AlgebraicKTheory/Suggested.lean` :21–22: "the patching theorem needs the category of patching triples, and the `K₁` terms and the boundary need the stable group `GL(R)` and `K₁(R)`, README targets that neither library has".
- :27–29: "the patched module `M(2)` is a finitely generated projective module only by the patching theorem, so its class cannot be written without a sorry'd proof inside the term".

**Claim.** Each reason points at the wrong missing carrier.

- **Patching theorem.** The category of patching triples is at the pin: it is Mathlib's categorical pullback of the two extension functors. What is missing is the comparison functor from Proj(D) into that category. Building it needs a natural isomorphism between the extension functors along π₁∘p₁ and π₂∘p₂, and Tau Ceti relates composite extensions only objectwise.
- **Torsion class.** A proof of finite projectivity need not sit inside the term: it can be quantified in the statement. What is missing is the patched module M(2) itself as a right D-module, a 6.2/6.3 construction.

**Witness.**
- Mathlib 1b1ccf4, `Mathlib/CategoryTheory/Limits/Shapes/Pullback/Categorical/Basic.lean` :81 has `structure CategoricalPullback`: triples (a, c, F a ≅ G c), with compatible pairs as morphisms and a `Category` instance.
- A scratch copy containing `noncomputable abbrev PatchingTriples π₁ π₂ := CategoricalPullback (RingHom.op π₁).finiteProjectiveModulesExtendScalars (RingHom.op π₂).finiteProjectiveModulesExtendScalars` and `Category (PatchingTriples π₁ π₂) := inferInstance` elaborates with exit 0.
- Tau Ceti `finiteProjectiveModulesK0Extend_comp` (`CartanMap/ExtendScalars.lean` :129) uses `cancelBaseChange` objectwise. Neither pinned file declares a natural isomorphism between the composite functors.

**Repair.**
- Patching theorem: "the category of patching triples is Mathlib's `CategoryTheory.Limits.CategoricalPullback` of the two extension functors, but the comparison functor from `FiniteProjectiveRight D` into it needs a natural isomorphism between the composite extension functors along `π₁ ∘ p₁ = π₂ ∘ p₂`, which Tau Ceti gives only objectwise (`TauCeti.BalancedExtension.cancelBaseChange`)".
- Torsion class: "the class `[M(2)] − [D]` needs the patched module `M(u)` of 6.2/6.3 as a right module over `D`, which neither library has".

## Previous findings

- R01 — partly repaired. `kZeroMap` (Suggested.lean :76), `kZero_mayerVietoris_exact` (:233) and the kernel clauses (:253, :277) are stated, the docstring is rewritten, and BalancedExtension and the finite-projective functor are in the contracts. However, 0.2 still plans the pinned adjunction and cites §7.8 for the pinned `extendScalarsIso`: this is R01 above.

## Verified sound

### Gate, build, elaboration, probe, dependency check

- **Gate**, rerun at this head with `--base origin/main`, exit 0:

  ```text
  gate AlgebraicKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  The worker's run also reports `build=0`.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicKTheory'` is empty.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/AlgebraicKTheory/Suggested.lean` exits 0, with exactly 14 "declaration uses `sorry`" warnings (13 before, plus `kZero_mayerVietoris_exact`) and nothing else. The new import `TauCeti.Algebra.Category.ModuleCat.FiniteProjective.ScalarChange` exists at 2fd255d.
- **One-tactic probe.** On a scratch copy, every `sorry` was replaced by `first | rfl | simp | infer_instance | decide | trivial | aesop`. Result: 14 errors, nothing closed, so nothing is padding.
- **`#check @`** on the four changed declarations, in a scratch copy:
  - `kZeroMap : {R S : Type u_1} → [Ring R] → [Ring S] → (R →+* S) → KZero R →+ KZero S`. Both rings are in one universe, as Conventions :21 now says.
  - `kZero_mayerVietoris_exact` carries `Function.Surjective ⇑π₁ ∨ Function.Surjective ⇑π₂`, with f₀ = `(kZeroMap (π₁.pullbackFst π₂)).prod (kZeroMap (π₁.pullbackSnd π₂))` and g₀ = `kZeroMap π₁ ∘ fst − kZeroMap π₂ ∘ snd`. This is the README 6.4 statement at the same generality.
  - The two kernel clauses read `f₀ x = 0 ↔ (e x).1 = 0`.

  No binder is lost.
- **Dependency check.** The required command printed exactly `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line.

### Library declarations opened at the pins (46)

Tau Ceti 2fd255d:
- `TauCeti/LinearAlgebra/TensorProduct/Balanced/Extension.lean`:
  - `BalancedExtension` :118 and `tmul` :133;
  - `tmul_smul` :156 (s⊗rp = s·f(r)⊗p, as the contract :52 says) and `smul_tmul` :161;
  - `lift_tmul` :222, `liftEquiv` :232 (`(P →ₛₗ[f] Q) ≃ (BalancedExtension f P →ₗ[S] Q)`), `map` :251 and `congr` :273;
  - `lid` :291 (`BalancedExtension (RingHom.id R) P ≃ₗ[R] P`) and `cancelBaseChange` :347 (`t ⊗ (s ⊗ p) ↦ (t · g s) ⊗ p`);
  - `piScalarRight` :379 (`[Fintype ι]`, `s ⊗ x ↦ (s · f(xᵢ))`).
- `TauCeti/Algebra/Category/ModuleCat/BalancedExtension.lean`: `functor` :50 with its `Additive` instance :64, plus the declarations listed in R01.
- `TauCeti/Algebra/Category/ModuleCat/FiniteProjective/ScalarChange.lean` (`{R S : Type u}`):
  - `finiteProjectiveModules_le_inverseImage_functor` :63;
  - `finiteProjectiveModulesExtendScalars` :80 with its `Additive` instance :86;
  - `finiteProjectiveModules_le_inverseImage_restrictScalars_iff` :114 (iff S is finite projective over R through f; along ℤ→ℚ it fails).
- `TauCeti/Algebra/Category/ModuleCat/CartanMap/ExtendScalars.lean`: `finiteProjectiveModulesK0Extend` :88, `_of` :94, `_id` :120, `_comp` :129 and `_of_linearEquiv_pi` :160 ([Rⁿ] ↦ [Sⁿ] for finite ι).
- `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`: `SplitK0.map` :324, `map_of` :329, `map_id` :335, `map_comp` :341 and `map_congr` :350 (objectwise `Nonempty` isomorphisms).
- `TauCeti/Algebra/Module/StableEquivalent.lean`: `StableEquivalent` :75 (`∃ n, Nonempty ((P × (Fin n → R)) ≃ₗ[R] (Q × (Fin n → R)))`, any semiring), `of_equiv` :89, `refl` :95, `symm` :100, `of_prod_equiv_prod` :110, `exists_forall_ge` :119, `trans` :131, `prod` :141, and `finrank_eq` :202 (see R02).

Mathlib 1b1ccf4: `CategoricalPullback` :81, and `RingHom.pullbackFst` and `RingHom.pullbackSnd`, by elaboration.

### Cross-roadmap citations resolved

ClassicalArithmeticCompletion on main (1bea835):
- §7.6 (:14458): `StableEquivalent` with refl, symm, trans, of_equiv and prod. This is the same relation and API names as the pinned `TauCeti.StableEquivalent`, so 0.4's switch to Tau Ceti is correct.
- §7.7 (:14487): see R02.
- §7.8 (:14505): its `BalancedExtension.commutative` is the pinned `extendScalarsIso` (R01).
- §7.23 (:14930): `SplitK0.of P = SplitK0.of Q` iff stably equivalent. This is not at the pin, so the citation is correct.

`roadmaps grep` finds `kZeroMap` and `kZero_mayerVietoris_exact` only in this folder, so there is no fully qualified name collision. `roadmaps overlaps`: no other pull request changes this roadmap or drops an id it cites. `roadmaps resolve`: the 7 leads (README :32 and :737; the latter was :735 before the contracts grew by two lines) are the same ones checked in earlier rounds.

### Locators of the changed declarations (cache)

- `kZeroMap`: Weibel II §2.8 and Example 2.8.1, chapter p. 13 (weibel-kbook-II line 562, page marker at line 560). The base change sends P to P⊗ᵣS. Matches.
- `kZero_mayerVietoris_exact`: Weibel III Theorem 2.6, chapter p. 15 (weibel-kbook-III line 783, page marker at line 772). The hypothesis (lines 774–775) is a ring map with an ideal mapped isomorphically onto an ideal of the target, which is the pullback of S→S/I (onto) and R/I→S/I. That is one surjective leg, as the Lean `∨` allows by symmetry. The K₀ part is also Weibel II Theorem 2.9, p. 13 (weibel-kbook-II line 595). Matches.
- `kZero_cuspSquare`: Weibel II Example 2.9.1 (weibel-kbook-II lines 607–609, K₀ of the cusp ≅ ℤ ⊕ k). Matches.

### Seeded sample

The diff reaches three sampled targets:
- **0.4.** Its changed sentence and *Needs:* line carry no literature locator. Its supplier citations resolve: §7.23 at main :14930, `TauCeti.StableEquivalent` :75 and `of_prod_equiv_prod` :110. §7.7 is covered by R02.
- **0.6 and 0.7.** Only their docstring bullets changed. "The extension of scalars itself is the pinned `TauCeti.BalancedExtension`" is true (:118). The section modules are still absent from both pins.
- **6.1.** The new Lean consumes its `RingHom.pullbackFst` and `RingHom.pullbackSnd`, which elaborate.

The other sampled targets (1.4, 2.1, 2.2, 3.3, 3.4, 4.3, 4.4, 4.5, 5.1, 6.3, 7.1) are untouched; their locators were verified in PRREVIEW-AlgebraicKTheory~7, ~8 and ~9.

### Adversarial table

Changed statements, with values computed at this head:

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| `kZeroMap f` (0.3) | f = id on ℤ; ℤ→ℚ; k→M₂(k); R→0 | `lid` + `map_congr` + `map_id`: [ℤ]↦[ℤ], 1↦1; [ℤⁿ]↦[ℚⁿ], n↦n; [k]↦[M₂(k)] = 2[e₁₁M₂(k)], 1↦2 under the corner identification; K₀(0)=0. The zero map is excluded because [R]↦[S] ≠ 0 (`map_of`, `piScalarRight`) | 0.3's K₀(f) |
| K₀(g∘f) = K₀(g)∘K₀(f) (0.3 prose) | ℤ→ℚ→ℂ; k→M₂(k)→M₄(k) block-diagonal | 1↦1↦1 against 1↦1; 1↦2↦4 against the direct [k]↦[M₄(k)] = 4 corners | True |
| `kZero_mayerVietoris_exact` | Q=0 with A₁=A₂=ℤ; ℤ→𝔽₅←ℤ; ℤ→ℤ/6←ℤ; 𝔽₅[t]→𝔽₅[t]/(t²)←𝔽₅ (π₂ not onto); A₁=Q=0 | f₀ an isomorphism onto ℤ² and g₀=0, so ker g₀ = ℤ² = im f₀; im f₀ = {(n,n)} and g₀(x,y)=x−y has kernel {(n,n)}; g₀ = (x−y, x−y) ∈ ℤ², whose kernel is the diagonal = im f₀ (D has only the idempotents (0,0) and (1,1)); im f₀ = diagonal = {x=y}; D≅A₂, f₀=(0,≅), g₀=0 | True. f₀ is not injective (ℤ/2) and g₀ not onto (ℤ/6), and neither is claimed |
| `kZero_arithmeticSquare`, kernel clause | x=[D]; x=[M(2)]−[D]; x=2[D]−[M(2)] | f₀[D]=(1,1)≠0 with (e[D]).1=1; f₀x=0 with e x=(0,1); f₀x=(1,1) with (e x).1=1 | True: ker f₀ ≅ 𝔽₅ˣ/{±1} ≅ ℤ/2, which is all the torsion, since ℤ² is torsion-free |
| `kZero_cuspSquare`, kernel clause | x=[D]; x=δ([1+t]); 5δ([1+t]) | f₀[D] = ([𝔽₅[t]],[𝔽₅]) = (1,1) with (e[D]).1=1; f₀ δ = 0 with e δ = (0,a), a ≠ 0; 5δ = 0 | True: ker f₀ = (𝔽₅[t]/t²)ˣ/𝔽₅ˣ = 1+t𝔽₅ ≅ ℤ/5, the torsion of ℤ⊕ℤ/5 |
| Docstring: patching theorem not statable | Mathlib `CategoricalPullback` on the two pinned functors | the category elaborates; the comparison functor needs a natural isomorphism that is not at the pin | Conclusion holds, reason wrong (R03) |
| Docstring: torsion class | `∃ hM : finiteProjectiveModules _ M, …` | the proof is a hypothesis, not a term; M(2) as a D-module is the gap | Reason wrong (R03) |
| 0.2 adjunction target | pinned `adjunction` | unit m↦1⊗m (:113), counit s⊗n↦s·n (:120), the README's own formulas | Duplicate (R01) |
| 0.2 commutative comparison | pinned `extendScalarsIso` | s⊗m ↦ s⊗ₜm (:149); defined as `leftAdjointUniq` with `extendRestrictScalarsAdj` | Duplicate (R01) |
| Contracts: `cancelBaseChange`, `lid`, `tmul_smul` | ℤ→ℚ→ℚ with p=2, s=3, t=5; R=S=M₂(𝔽₂) with p=1, r=E₁₂, s=E₂₁ | 5⊗(3⊗2) ↦ (5·3)⊗2 = 15⊗2 → 30 on both paths; r⊗p ↦ rp; right-module transport: pr⊗s and p⊗rs both ↦ E₁₂E₂₁ = E₁₁, the reversed order gives E₂₁E₁₂ = E₂₂ | Match |
| `StableEquivalent` (0.4 relation) | ℤ[√−5] with 𝔭=(2,1+√−5); ℤ with 0 against ℤ | 𝔭⊕𝔭 ≅ A² (n=0) but [𝔭] ≠ [A]; 0×ℤⁿ ≇ ℤ×ℤⁿ by rank | Same relation as §7.6 |
| `restrictScalars_iff` contract | ℤ→ℚ; ℤ→ℤ×ℤ diagonal | ℚ not finitely generated over ℤ, so it fails; ℤ² free of rank 2, so it preserves | Match |

Statements untouched by the diff carry the rows of PRREVIEW-AlgebraicKTheory~11 (which carries ~10, ~9, ~8 and ~7):

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| `kZero_divisionRing` | 𝔽₂, ℍ | [D]↦1, [D²]↦2 | True (~8) |
| `kZero_int` | ℤ; control ℤ[√−5] | [ℤⁿ]↦n; the control has K₀ = ℤ⊕ℤ/2 | True (~8) |
| `kZero_arithmeticSquare`, `kZero_cuspSquare` value clauses | ℤ×_𝔽₅ℤ; 𝔽₅[t²,t³]; 𝔽₂ control | coker({±1}² → 𝔽₅ˣ) = ℤ/2 with [D]↦(1,0); 1+t𝔽₅ ≅ ℤ/5; 𝔽₂ in place of 𝔽₅: torsion 0 | True (~8) |
| 0.5 Checks (Euler numbers, antipodal degree, rank of P) | n=1,2,3; x=(0,0,1) | 0, 2, 0; +1, −1, +1; p=diag(1,1,0), trace 2 | Sound (~9, ~10) |
| `hasStableRangeLE_one_of_isSemisimpleRing` | 𝔽₂[x]/(x²); zero ring; control ℤ | (x,1+x) shortens; every bound holds; ℤ fails | True (~9) |
| `whitehead_commutator_elementary` | ℍ, n=1, g=i, h=j | [i,j]=−1, diag(−1,1) ∈ E₂(ℍ) | True (~8) |
| `elementary_le_commutator` | 𝔽₂ with card 3 and 2 | E₃(𝔽₂) simple of order 168; E₂(𝔽₂) ≅ S₃ ⊄ A₃ | Bound needed and present (~8) |
| `dieudonne_determinant` | 𝔽₃ with n=2; ℍ with n=1 | kernel SL₂(𝔽₃) = E₂, order 24; unit quaternions ≠ E₁ | True for n ≥ 2 (~8) |
| `HasStableRangeLE`, `surjective_stability`, `injective_stability` | s=0; ℤ with s=1; Cohn's matrix | shortens only if 1=0; 2+5c ≠ ±1; Cohn ∈ E₃∖E₂ but 2 < s+1 | True (~8) |
| `hasStableRangeLE_of_ringKrullDim_le` | ℤ with d=1; ℤ[x] with d=2 | ≤2 holds, ≤1 fails; ≤3 | True (~8) |
| `HasCoveringDimensionLE` and both Vaserstein `iff`s | [0,1] with d=0,1; ∅; S², T⁴; s=0 | fails; holds; empty refinement; ℂ: S² F/F at s=1, T/T at s=2; ℝ: S² F/F at s=2, T/T at s=3; s=0 on a point gives F vs T | Agree; `1 ≤ s` needed (~8) |

### Remarks on untouched text (no change requested)

- README 6.2 (:584) sets the category of patching triples as a target. It is Mathlib's `CategoricalPullback` of the two extension functors (see R03), so 6.2 could cite that and keep the comparison functor and Milnor's theorem as its targets.

## Not verifiable

- **Milnor, *Introduction to Algebraic K-Theory*, and Bass, *Algebraic K-Theory*.** Both are uncertified in the manifest and cited by locator only. The diff touches neither.
- **Ownership against open pull requests.** I ran only the overlaps report, a `roadmaps grep` for the new names and for the pinned objects of R01–R03, and checked the five closest roadmaps of ~7. The change adds no owned object beyond `kZeroMap`, which is a one-line specialisation of the pinned functor.

## Source issues

- none
