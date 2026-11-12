# Review of ArtinAlgebras (pull request #2190 at 16c5963)
Folder: `TauCetiRoadmap/RepresentationTheory/ArtinAlgebras/`
**Verdict:** needs changes

## R01 (P2) — The infinite-radical criterion is statable at the pins and is absent

**Location:** `TauCetiRoadmap/RepresentationTheory/ArtinAlgebras/Suggested.lean:56–58`: “representation-finite exactly when the infinite radical `⋂ₙ radⁿ` of `mod A` vanishes (Layer 6), which needs the radical as a morphism ideal with its powers”.

**Claim:** the docstring lists this headline as not statable for lack of a carrier, but the carrier is in the pinned Tau Ceti (`lake-manifest.json`, rev `2fd255d`), so the headline must be stated.

**Witness:** `TauCeti.jacobsonRadicalIdeal : MorphismIdeal C` (`TauCeti/CategoryTheory/Preadditive/Radical/Basic.lean:221`); `Monoid (MorphismIdeal C)` (`.../MorphismIdeal/Mul.lean:155`); `TauCeti.IsRepresentationFinite` (`TauCeti/Algebra/Category/ModuleCat/RepresentationFinite.lean:48`). The statement below elaborates.

**Repair:** delete the clause from the docstring, import `TauCeti.Algebra.Category.FGModuleCat.RepresentationFinite`, and add under Layer 6 (elaborated on a scratch copy, `sorry` the only warning; for `A = 0` both sides hold, and `⇒` is the pinned `TauCeti.IsRepresentationFinite.exists_jacobsonRadicalIdeal_pow_eq_bot`):

```lean
include R in
theorem isRepresentationFinite_iff_forall_mem_jacobsonRadicalIdeal_pow :
    TauCeti.IsRepresentationFinite.{u} A ↔
      ∀ (X Y : FGModuleCat.{u} A) (f : X ⟶ Y),
        (∀ n : ℕ, f ∈ (TauCeti.jacobsonRadicalIdeal (FGModuleCat.{u} A) ^ n).hom X Y) → f = 0 :=
  sorry
```

Name it in README §6.2 at “The infinite radical”.

## R02 (P2) — `leftGlobalDimension` is the pinned `TauCeti.globalDimension`

**Location:** `Suggested.lean:213–214` (`noncomputable def leftGlobalDimension (A : Type u) [Ring A]`), and `README.md:72–77`, `1082–1089`: “Layer 7 here owns its extension to noncommutative rings”; “one implementation serves both when the library is built”.

**Claim:** the definition and its ownership duplicate a pinned declaration for an arbitrary `Ring`; the object has two owners.

**Witness:** `TauCeti/RingTheory/GlobalDimension.lean:65,70`: `variable (R : Type u) [Ring R]`, `globalDimension := ⨆ M : ModuleCat.{v} R, projectiveDimension M`. On a scratch copy, `leftGlobalDimension A = TauCeti.globalDimension.{u} A` closes by `rw [TauCeti.globalDimension_def]; rfl`.

**Repair:** delete `leftGlobalDimension`; import `TauCeti.RingTheory.GlobalDimension`; restate the four theorems and `hgl` of `exists_isAdditiveGenerator_algEquiv_end` on `TauCeti.globalDimension.{u} A`. In the README, list `TauCeti.globalDimension`, `TauCeti.globalDimension_le_iff`, `TauCeti.globalDimension_le_iff_hasProjectiveDimensionLE`, `TauCeti.globalDimension_le_tfae` (finite and cyclic criteria for `≤ n`, any ring, line 108) and `Submonoid.globalDimension_localization_le` under “From Tau Ceti”; rewrite the Scope bullet and §7.2 so that Layer 7 owns only the supremum identities, the left–right comparison and the semiprimary formula. The zero-ring value stays `⊥` (`TauCeti.globalDimension_eq_bot_iff`).

## R03 (P2) — Targets the pinned Tau Ceti already proves are planned again; the stated baseline is not the pin

**Location:** `README.md:143–144`: “The baseline is Mathlib `f6090c7…` and Tau Ceti `358314d…`”; `README.md:266` (Fitting's lemma), `420–422`, `592–594`, `718–721`, `901–905` (“New here: … a bimodule over the division rings”), `983–985`.

**Claim:** `lake-manifest.json` pins Mathlib `1b1ccf4` and Tau Ceti `2fd255d`. At that pin the following are declarations, not targets, and none is in the supplier contracts; “New here” in §5.1 is an overclaim.

**Witness:** (files under `TauCeti/`) Fitting: `TauCeti.isLocalRing_end_of_indecomposable`, `CategoryTheory/Preadditive/Indecomposable.lean:279`, same hypotheses as README:266–268. Residue-ring actions on `irreducibleMorphismSpace`: `CategoryTheory/Preadditive/Radical/Bimodule.lean:295,301,341`.

**Repair:** set the baseline to the manifest's revisions. Move to “From Tau Ceti”, by name and file, and delete or narrow the matching target text: §0.1 Fitting and its converse (`TauCeti.indecomposable_of_isLocalRing_end`, same file :287), which also settles the “(supplied)” block of README:253–257; §0.4 `TauCeti.exists_isLocalRing_end_sum_comp_eq_id` (`CategoryTheory/Preadditive/KrullSchmidt.lean:104`); §0.6 the radical ideal and its powers (`TauCeti.jacobsonRadicalIdeal`, `jacobsonRadicalIdeal_sq_hom`, `Radical/Basic.lean:221,421`); §§2.1–2.2 hull existence `TauCeti.exists_isInjectiveEnvelope` (`Algebra/Module/Injective/Envelope/Existence.lean:109`) and local finite-length biduality `TauCeti.IsInjectiveEnvelope.bijective_applyₗ`, `length_linearMap` (`RingTheory/MatlisDuality/FiniteLength.lean:155,139`), which README:592–594 attributes to DerivedModuleAlgebra §1.M.2 alone; §3.3 the abelian extension-class criterion `CategoryTheory.ShortComplex.ShortExact.isLeftAlmostSplit_f_iff_extClass` (`CategoryTheory/AlmostSplit/Ext.lean:41`); §§4.1–4.3 the field case `ModuleCat.arTranslate`, `LinearMap.auslanderReitenExtEquiv` with its naturality, `ModuleCat.exists_isAlmostSplit_arTranslate` (`Algebra/Category/ModuleCat/AuslanderReiten/Translate.lean:74`, `Basic.lean:167,191`, `Sequence.lean:70`); §5.1 the bimodule structure (replace “New here” by the citation; the valuation stays a target); §6.1 `TauCeti.IsRepresentationFinite` and nilpotence of the radical `TauCeti.IsRepresentationFinite.exists_jacobsonRadicalIdeal_pow_eq_bot` (`Algebra/Category/FGModuleCat/RepresentationFinite.lean:87`; the bound `2^b − 1` stays a target).

## R04 (P3) — Brauer-Thrall I restates the body of the pinned predicate

**Location:** `Suggested.lean:200–201`: `Finite (Skeleton (ObjectProperty.FullSubcategory fun M : ModuleCat.{u} A ↦ Module.Finite A M ∧ Indecomposable M))`.

**Claim:** the conclusion is the unfolded pinned `TauCeti.IsRepresentationFinite.{u} A`; the acceptance test should name it.

**Witness:** on a scratch copy the two propositions are equivalent by `(TauCeti.isRepresentationFinite_iff A).symm` (`TauCeti/Algebra/Category/ModuleCat/RepresentationFinite.lean:48,54`).

**Repair:** conclude `TauCeti.IsRepresentationFinite.{u} A` (import `TauCeti.Algebra.Category.ModuleCat.RepresentationFinite`), and rename to `isRepresentationFinite_of_length_le` in the file and at README:1014.

## R05 (P3) — A cited PurityOfBranchLocus declaration does not exist

**Location:** `README.md:218–219`: “with `TauCetiRoadmap.PurityOfBranchLocus.globalDimension_le_iff`”.

**Claim:** no such declaration is in PurityOfBranchLocus on main or at an open head.

**Witness:** `TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean:132,137` declare only `globalDimension` and `globalDimension_le_iff_hasProjectiveDimensionLE`; the lemma of that name is `TauCeti.globalDimension_le_iff`, `TauCeti/RingTheory/GlobalDimension.lean:85`.

**Repair:** delete the name from the PurityOfBranchLocus bullet; it is covered by the “From Tau Ceti” entry of R02.

## R06 (P3) — The defect formula is a route input without a target's shape

**Location:** `README.md:842–847`: “It is derived from **Auslander's defect formula** `D δ^*(X) ≅ δ_*(D Tr X)`, for a short exact sequence `δ` with contravariant and covariant defects `δ^*` and `δ_*`”.

**Claim:** the change removes the formula from the excluded topics (README:89) but no layer owns it: the defects are not defined, the ring, `D` and naturality are not stated, there is no Check, and the `*Needs:*` line of §4.2 omits what the route uses.

**Witness:** `T₂(k)`, `δ : 0 → S₁ → P₂ → S₂ → 0`: at `X = S₂` both sides are `k` (`τ S₂ = S₁`); at `X = S₁` both are `0`. The swapped formula `D δ_*(X) ≅ δ^*(D Tr X)` gives `k` against `0` at `X = S₁`; no stated Check excludes it.

**Repair:** add to the Layer 4 bullet of Scope “the defect formula”, and to §4.2 a target: “**The defect formula.** Let `Λ` be an algebra over a commutative ring `k`, `I` an injective `k`-module, `D = Hom_k(-, I)`, and `δ : 0 → A → B → C → 0` a short exact sequence of `Λ`-modules. Define `δ_* = Coker(Hom(B, -) → Hom(A, -))` and `δ^* = Coker(Hom(-, B) → Hom(-, C))`. For finitely presented `X`, `D δ^*(X) ≅ δ_*(D Tr X)`, naturally in `δ` and `X`; the right side does not depend on the presentation, since `δ_*` vanishes on injectives.” Add the three values above and “for split `δ` both defects vanish” as Checks. State that `B` injective gives `D Ext¹(X, A) ≅ Hom(A, D Tr X)` modulo injectives, which becomes the first formula by reflexivity of the finite-length module `Ext¹`, and `B` projective gives the second. Extend `*Needs:*` with “3.1's exact sequences; 2.2's duality”.

## R07 (P3) — Three targets still carry no locator

**Location:** `README.md:404`: “(by uniqueness, 0.3; no source is cited)”; `README.md:519–520`: “no read source is cited for them”; `README.md:1185–1186`: “no read source states that generality”.

**Claim:** the previous review's R01 is not repaired at this head for these lines.

**Witness:** kr line 451 (Thm. 4.2, p. 9) gives the uniqueness used at 404; kr lines 162–164 (Prop. 2.3, p. 3) gives `add X ≃ proj End(X)` under split idempotents, the first half of 519.

**Repair:** at 404 write “([Kr, Thm. 4.2, p. 9])”; at 519–520 cite [Kr, Prop. 2.3, p. 3] for `proj C = add P ≃ proj (End P)` and give a locator for `C ≌ mod (proj C)` (Auslander, *Coherent functors*, with its number, once read); at 1185–1186 give a locator for the Artinian-base correspondence or keep the sentence and mark the general case as this roadmap's own deduction from §2.3 and §7.1.

## Previous findings

Ids refer to `packages/ArtinAlgebras/reports/PRREVIEW-ArtinAlgebras~5.md`.

- R01 — not repaired: README:404, 519–520 and 1185–1186 are unchanged. Carried as R07; its request for a `sources.toml` in the folder is dropped (no roadmap folder on main has one; the README's source list is the inventory).
- R02 — not repaired: README:253–257 still reads “(supplied)”. Subsumed by R03, since the pin now has both directions.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §4.2 defect formula (new) | `T₂(k)`, `δ: S₁→P₂→S₂`; `ℤ/p²`, `δ: ℤ/p→ℤ/p²→ℤ/p`, `X = ℤ/p` | `T₂`: `X=S₂`: `k`,`k`; `X=S₁`: `0`,`0`. `ℤ/p²`: lengths 1, 1. Swapped form: `k` vs `0` | true as written | R06 |
| §4.2 two formulas from the defect formula | `B` injective; `B` projective | `δ^*(X)=Ext¹(X,A)`, `δ_*(Y)=Hom(A,Y)/inj`; `δ^*(X)=Hom(X,C)/proj`, `δ_*(Y)=Ext¹(C,Y)` | first needs `D D ≅ 1` on `Ext¹` (2.2) | R06 |
| §4.2 Checks | `ℤ/p²`, `M=N=ℤ/p`; `M` projective | `Ext¹` length 1; `τM=ℤ/p`, `Hom(ℤ/p,ℤ/p)` mod injectives length 1; both 0 | agree | none |
| §4.1 functorial `τ` (new) | pinned `stableTransposeEquivalence` | type `FinitelyPresentedStableModule A ≌ (FinitelyPresentedStableModule Aᵐᵒᵖ)ᵒᵖ`; `D` contravariant, composite covariant | matches the sentence | none |
| §0.2 `IsKrullSchmidt` | `mod ℤ/4`; f.g. abelian groups; zero category | `End ℤ/2`, `End ℤ/4` local; `End ℤ = ℤ` not local; `n = 0` | true | none |
| §0.3 uniqueness | `ι=κ=∅`; `ℤ[√−5]`, `I=(2,1+√−5)` | unique bijection; `I⊕I≅R⊕R`, `End I = R` not local, hypothesis fails | true | none |
| §0.6 radical | `B=k[ε]/(ε²)` | `B→k→B = ε ≠ 0`; all 3-chains: `π∘ε=0`, `ε²=0`, `π∘ι=0`; `(rad End B)²=0` | true; object at pin | R03 |
| §1.1 `IsFinitelyPresentedFunctor` | `(-,Y)`; `0`; `(-,K)` with `dim K=∞` | presentation with `X=0`; `X=Y=0`; image in `(-,K')`, `K'` finite-dim | true | none |
| §1.3 | `P=A`; `P=A⊕A`; `A=k` | `End=Aᵐᵒᵖ`; `Mat₂(A)ᵐᵒᵖ`; cokernels of `kᵐ→kⁿ` representable | true | R07 |
| §2.1 `E_R` | `k`; `ℤ/p²`; `k[x,y]/(x,y)²` | `k`; `R`; length 3, `soc R` dim 2, `soc E_R` dim 1 | true; existence at pin | R03 |
| §3.4 functorial picture | `ℤ/4`, `Z=ℤ/2`, evaluated at `ℤ/2`, `ℤ/4` | at `ℤ/2`: `ℤ/2 ≅ ℤ/2 →0 ℤ/2`, cokernel `ℤ/2`; at `ℤ/4`: `2→4→2` exact, cokernel `0` | resolution of `S_Z` | none |
| §3.5 duality and existence | split structure; `R=k×k` | all objects projective-injective, `E/𝒫=0`, (a) vacuous; two copies of `mod k` | true | none |
| §5.1 valuation | `ℤ/p²`; `ℝ`–`ℂ` triangular | `Irr(ℤ/p,ℤ/p²)=ℤ/p`, `rad²=0`, `(1,1)`; `ℂ` over `ℂ`,`ℝ`: `(1,2)` | true; actions at pin | R03 |
| §5.3 quiver | `ℤ/p²`; field formula on `ℝ`–`ℂ` | two arrows, multiplicity 1 = `b`; `2 = b·dim_ℝ F_M = 2·1` | true | none |
| §7.1 Morita | `P=Aⁿ`; `k` vs `k×k` | `Matₙ(A)ᵐᵒᵖ`; 1 vs 2 indecomposables | true | none |
| §7.2 global dimension | zero ring; `ℤ`; `k[ε]/(ε²)` | `⊥=⊥`; `pd ℤ/2=1` = cyclic sup = 1; `pd k=∞` | true; definition at pin | R02 |
| §7.3 `HasProjectiveInjectiveCopresentation` | `T₂(k)`; `k[ε]/(ε²)` | `I⁰=P₂²`, cokernel `S₂` injective not projective: fails, `dom.dim=1`; `0→Γ→Γ→0`: holds | true | none |
| §7.5 Auslander correspondence | `B=k[ε]/(ε²)`, `M=B⊕k`; `B` alone; `A=M=0` | `dim End = 2+1+1+1 = 5`; `gl.dim B=∞`; `pd(0)=⊥ ≤ 2` | true | none |
| `exists_isAlmostSplit` | `ℤ/p²`, `M=ℤ/p`; `A=0` | `0→ℤ/p→ℤ/p²→ℤ/p→0`; no indecomposable | true; field case at pin | R03 |
| `chainComp_eq_zero_of_length_le` | `b=0`; `b=1`; `b=2`, `B` | no `M` with length ≤ 0; one non-iso of simples is 0; `n=2`: `ε≠0`, `n=3`: 0 | true | none |
| `finite_skeleton_of_length_le` | `A=0`; `k`; Kronecker | empty skeleton; one class, `b=1`; lengths unbounded, hypothesis fails | true | R04 |
| Infinite radical criterion | `A=0`; `B=k[ε]/(ε²)`; Kronecker | both sides hold; `rad³=0`, 2 classes; `rad^∞≠0`, infinite | true, statable | R01 |
| `exists_linear_equivalence_of_algEquiv_end` | `(k,k)`, `(k,k²)`, `(Mat₂(k),k²)` | End dims 1, 4, 1; first and third equivalent by `k ↦ k²` | true | none |
| One-tactic probe | 19 sorried theorems, `first | infer_instance | (simp; done) | exact?` | 0 closed | no padding by probe | none |

- Source locators checked against the text: 22 (kr 8, en 5, inp 8, ch 1); the defect formula, its hypotheses and the locator “Thm. III.4.1” were checked in Krause, arXiv:1604.02813v1, lines 74–89 and 452–460.
- Library declarations opened at the pin (Tau Ceti `2fd255d`): 21, each with file and line in R01–R05 or the table; `stableTransposeEquivalence` at `TauCeti/Algebra/Module/AuslanderReiten/Equivalence.lean:179`.
- Cross-roadmap citations resolved on main: DerivedModuleAlgebra §1.M.2, GrothendieckEulerForms, StablePeriodicCurved Layer 0, PurityOfBranchLocus §0.3, GeometricRepresentationCategories §R5.2 (README:361–363), QuiverRepresentations Layer 6 (6A–6F, mapped at README:857–871); one missing name, R05.
- Ownership against open pull requests: no other open roadmap states the defect formula for modules, dominant dimension, Harada-Sai or Krull-Schmidt categories; `scratch/overlaps.md` lists no dropped id and no conflicting head.
- Dependency check: `depcheck: 223 roadmaps, 1967 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate at 16c5963: every check passed. Elaboration of `Suggested.lean`: 19 `sorry` warnings, nothing else. `#check` types of the 26 declarations compared with the README: no binder lost (the 7 flagged leads are category instances present in the types).
- Pull request text: title and description agree with the 19-line change (§4.1 sentence, §4.2 route, scope list, [Au78] and [Kr03]); nothing removed or renumbered.
- The change is outside every `Suggested.lean` declaration; the description's statement that Krause's proof needs only an injective `k`-module agrees with arXiv:1604.02813v1 lines 83–89.

## Not verifiable

- kr03 (Krause, Linear Algebra Appl. 365): paywalled, recorded uncertified; its Theorem, Lemma and Corollaries were not read. The statement was checked in Krause's later open paper instead.
- au78 (Auslander, *Functors determined by objects*): no legal copy; “Thm. III.4.1” confirmed only as cited by Krause.
- ars, ass: publisher pages without readable text; the locators of §§3.4, 4.1–4.3, 5.1–5.3, 6.1–6.2, 7.1, 7.3, 7.5 are uncertified.
- au55: the Project Euclid and Cambridge copies were not retrievable by the sources service; Thm. 1, Cor. 5, Cor. 9 and Cor. 11 not read this round.
- lz, hs, mu: no legal source found by the service this round.

## Source issues

- none
