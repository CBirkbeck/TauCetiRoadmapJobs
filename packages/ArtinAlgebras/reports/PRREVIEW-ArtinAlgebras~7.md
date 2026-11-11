# Review of ArtinAlgebras (pull request #2190 at fc36f96)
Folder: `TauCetiRoadmap/RepresentationTheory/ArtinAlgebras/`
**Verdict:** needs changes

## R01 (P2) — Auslander's theorem on components is statable at the pins and is absent

**Location:** `Suggested.lean:57–59`: “the valued Auslander-Reiten quiver with its mesh and multiplicities (Layer 5), and hence Auslander's theorem on components of bounded length (Layer 6)”.

**Claim:** one of the three summits of the Summary (README:16–18) is listed as not statable. A component is determined by the irreducible maps between indecomposables, and these are pinned for an arbitrary category, so the statement does not need the valued quiver.

**Witness:** `TauCeti.IsIrreducibleMorphism` (`TauCeti/CategoryTheory/IrreducibleMorphism.lean:127`). On a scratch copy the statement below elaborates (`sorry` the only warning). For `A = k × k`, the first factor's indecomposables form a closed, bounded class; `hA` excludes `A`.

**Repair:** import `TauCeti.CategoryTheory.IrreducibleMorphism`. Delete “, and hence Auslander's theorem on components of bounded length (Layer 6)” from the docstring and add the name to its Layer 6 bullet. Add after `isRepresentationFinite_iff_forall_mem_jacobsonRadicalIdeal_pow`, in the same section:

```lean
include R in
/-- **Auslander's theorem**: over a connected Artin algebra, a nonempty class of finitely
generated indecomposable modules that is closed under isomorphism and under irreducible maps in
both directions, and whose lengths are bounded, contains every indecomposable module, and the
algebra is representation-finite. -/
theorem forall_mem_and_isRepresentationFinite_of_length_le
    (hA : ∀ e : A, IsIdempotentElem e → (∀ a : A, e * a = a * e) → e = 0 ∨ e = 1)
    (S : FGModuleCat.{u} A → Prop) (hS : ∀ X, S X → Indecomposable X.obj)
    (hiso : ∀ {X Y : FGModuleCat.{u} A}, Nonempty (X ≅ Y) → S X → S Y)
    (hirr : ∀ {X Y : FGModuleCat.{u} A} (f : X ⟶ Y), TauCeti.IsIrreducibleMorphism f →
      Indecomposable X.obj → Indecomposable Y.obj → (S X ↔ S Y))
    (hne : ∃ X, S X) (b : ℕ) (hb : ∀ X, S X → Module.length A X.obj ≤ b) :
    (∀ X : FGModuleCat.{u} A, Indecomposable X.obj → S X) ∧
      TauCeti.IsRepresentationFinite.{u} A :=
  sorry
```

In README §6.2, after the locator of Auslander's theorem, add: “The unions of components are the classes of finitely generated indecomposable modules that are closed under isomorphism and under irreducible maps in both directions; in this form the theorem is `forall_mem_and_isRepresentationFinite_of_length_le`, in `Suggested.lean`.”

## R02 (P3) — The cyclic and finite supremum identities restate a pinned theorem

**Location:** `Suggested.lean:219–231` (`globalDimension_eq_iSup_cyclic`, `globalDimension_eq_iSup_finite`); `README.md:77–78`: “Layer 7 here owns only Auslander's supremum identities over cyclic and finitely generated modules”.

**Claim:** [Au55, Thm. 1] is pinned for every ring in its `≤ n` form. The two declarations are short corollaries of it, not headlines, and Layer 7 does not own them.

**Witness:** `TauCeti.globalDimension_le_tfae` (`TauCeti/RingTheory/GlobalDimension.lean:108`, `[Ring R]`, cyclic `R ⧸ I`) is proved through `ModuleCat.hasProjectiveDimensionLE_of_quotients` (`…/ModuleCat/Projective/Dimension.lean:113`). On a scratch copy, `globalDimension_eq_iSup_cyclic` is proved from it and `globalDimension_eq_bot_iff` in 15 lines, with no `sorry`.

**Repair:**
- Delete both declarations from `Suggested.lean`, and their names from the docstring's Layer 7 bullet.
- README:77–78: change the Layer 7 ownership to “the comparison of left and right global dimension, and the formula for semiprimary rings”.
- README:1149–1153: replace the first two clauses with “For an arbitrary ring, the cyclic modules `A ⧸ I` bound the left global dimension: Tau Ceti's `TauCeti.globalDimension_le_tfae`, from `ModuleCat.hasProjectiveDimensionLE_of_quotients` ([Au55, Thm. 1, p. 68]); with `TauCeti.globalDimension_eq_bot_iff` it gives the global dimension as the supremum over the cyclic modules, and over the finitely generated ones;”.
- “From Tau Ceti”: add `ModuleCat.hasProjectiveDimensionLE_of_quotients` (`TauCeti.Algebra.Category.ModuleCat.Projective.Dimension`).

## R03 (P3) — Pinned exact-category and Baer-sum declarations are routed through roadmaps

**Location:** `README.md:253–255` (StablePeriodicCurved bullet); `260–261` (GeometricRepresentationCategories §R5.2 bullet); `910`: “StablePeriodicCurved Layer 0 for the injective stable category”.

**Claim:** each object these lines take from a roadmap is a declaration at the pinned Tau Ceti and is missing from “From Tau Ceti”. §4.2 cites a roadmap for a carrier the pin already has.

**Witness:** under `TauCeti/`: `ExactStructure.InjectiveStableCategory` (`CategoryTheory/Exact/Stable/Injective.lean:54`); `ExactStructure.isProjective`, `isInjective` (`Exact/Projective.lean:136`, `Exact/Injective.lean:60`); `IsFrobenius` (`Exact/Frobenius.lean:52`); `IsConflationExact` (`Exact/Functor.lean:74`); `ShortComplex.ShortExact.extClass_baerSum` (`Algebra/Homology/Ext/BaerSum.lean:106`).

**Repair:**
- Add to “From Tau Ceti”: “Relative projectives and injectives `TauCeti.ExactStructure.isProjective`, `TauCeti.ExactStructure.isInjective` with `TauCeti.ExactStructure.EnoughProjectives` and `TauCeti.ExactStructure.EnoughInjectives` (`TauCeti.CategoryTheory.Exact.Projective`, `TauCeti.CategoryTheory.Exact.Injective`); `TauCeti.ExactStructure.IsFrobenius` (`TauCeti.CategoryTheory.Exact.Frobenius`); conflation-exact functors `TauCeti.ExactStructure.IsConflationExact` (`TauCeti.CategoryTheory.Exact.Functor`); the abelian exact structure `TauCeti.ExactStructure.abelian` (`TauCeti.CategoryTheory.Exact.Abelian`); the injective stable category `TauCeti.ExactStructure.InjectiveStableCategory` (`TauCeti.CategoryTheory.Exact.Stable.Injective`); the Baer sum `CategoryTheory.ShortComplex.baerSum` with `CategoryTheory.ShortComplex.ShortExact.extClass_baerSum` (`TauCeti.Algebra.Homology.Ext.BaerSum`).”
- README:910: write “Tau Ceti `TauCeti.ExactStructure.InjectiveStableCategory`.”
- README:83–86, 702–703 and 716: cite `CategoryTheory.ShortComplex.ShortExact.extClass_baerSum` in place of GeometricRepresentationCategories §R5.2.
- Keep a roadmap bullet only for what the pin lacks.

## R04 (P3) — QuiverRepresentations is named as both supplier and consumer; its field-case quiver is pinned

**Location:** `README.md:262`: “QuiverRepresentations Layer 6 (6A-6F): the field case, which Layers 0 and 3 to 5 here replace.”; `1306–1308` (Downstream consumers); `1011–1012`: “this recovers the arrow counts of QuiverRepresentations 6F's `arQuiver k A`”.

**Claim:** the same roadmap is listed as a supplier and as a downstream consumer. On main it is neither for these objects: its Layer 6 consumes Tau Ceti's field case. `arQuiver k A` is a pinned quiver that “From Tau Ceti” omits.

**Witness:** QuiverRepresentations README (main) lines 77–80: Layer 6 “consumes the pinned translate, duality, almost-split sequences, quiver of irreducible morphisms”. Line 872 maps `arQuiver k A` to `TauCeti.IrreducibleMorphismQuiver` (`TauCeti/CategoryTheory/Preadditive/Radical/IrreducibleMorphismQuiver/Basic.lean:65`).

**Repair:**
- Delete README:262, and replace the Downstream consumers bullet with “None among the roadmaps on main.”
- Add to “From Tau Ceti”: “The quiver of irreducible morphisms over a division ring `TauCeti.IrreducibleMorphismQuiver` with `TauCeti.IrreducibleMorphismQuiver.card_arrows` (`TauCeti.CategoryTheory.Preadditive.Radical.IrreducibleMorphismQuiver.Basic`); for a finite-dimensional algebra, its translation `ModuleCat.arTranslation` (`TauCeti.Algebra.Category.ModuleCat.AuslanderReiten.Quiver`) and the mesh count `ModuleCat.card_arrows_eq_card_arrows_of_translate_eq_some` (`TauCeti.Algebra.Category.ModuleCat.AuslanderReiten.Mesh`).”
- README:1011–1012: “this recovers the arrow counts `TauCeti.IrreducibleMorphismQuiver.card_arrows` of the pinned quiver of irreducible morphisms”.
- README:55–61: say that QuiverRepresentations Layer 6 consumes these pinned field-case declarations, which are the case `R = k`, `E_k = k`, of Layers 3 to 5 here.

## R05 (P3) — A §0.6 Check calls a split epimorphism unsplit

**Location:** `README.md:468`: “it factors as `S ⊞ S → S → B` with neither factor split”.

**Claim:** the first factor is split: every nonzero map `S ⊞ S → S` is a split epimorphism.

**Witness:** `(i, 0) = pr₁ ≫ i`, and `pr₁` has the section `inl`. Irreducibility fails because `pr₁` is not a split monomorphism and `i` is not a split epimorphism.

**Repair:** replace with “it factors as `S ⊞ S → S → B`, through the first projection, which is not a split monomorphism, followed by `i`, which is not a split epimorphism”.

## R06 (P3) — The progenerator equivalence of §1.3 has a locator in a read source

**Location:** `README.md:544–545`: “The equivalence `C ≌ mod (proj C)` is the Yoneda argument of 1.1 applied to projective presentations; it is not located in a read source.”

**Claim:** the progenerator statement two sentences earlier (`Hom(P, -)` an equivalence onto finitely presented right `End P`-modules) is located in [Kr].

**Witness:** kr lines 385–391 (proof of Prop. 3.10, p. 8): for a projective `P` of an abelian category, `Hom(P, −)` is an equivalence from the closure of `add P` under cokernels onto finitely presented `End(P)`-modules (right modules).

**Repair:** append “For a progenerator `P` every object is a cokernel of a map in `add P`, so the equivalence `Hom(P, -)` onto the finitely presented right `End P`-modules is [Kr, proof of Prop. 3.10, p. 8].”

## Previous findings

Ids refer to `packages/ArtinAlgebras/reports/PRREVIEW-ArtinAlgebras~6.md`.

- R01 — repaired: `Suggested.lean:204–211` states `isRepresentationFinite_iff_forall_mem_jacobsonRadicalIdeal_pow`; README:1074–1078 names it, and the docstring clause is gone.
- R02 — repaired: `leftGlobalDimension` is gone; the theorems use `TauCeti.globalDimension.{u}` (README:240–244, 73–80, 1140–1147). Its request to keep the supremum identities as Layer 7 targets is withdrawn by R02 here.
- R03 — repaired for the objects it listed. The baseline (README:146–147) equals `lake-manifest.json`; §0.1 reads “Both directions are supplied by Tau Ceti”; §0.4 is narrowed to idempotents; §§0.6, 2.1–2.2, 3.3, 4.1–4.3, 5.1 and 6.1 cite the pinned names. The same defect remains for objects outside that list: R03 and R04 here.
- R04 — repaired: `Suggested.lean:199–202` concludes `TauCeti.IsRepresentationFinite.{u} A`; README:1070.
- R05 — repaired: README:256–259 names only `TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean:132,137`.
- R06 — repaired: README:872–884 states the defect formula with `k`, `I`, `D`, both defects and four Checks; Scope:41; *Needs:* 907.
- R07 — partly repaired: 427 cites [Kr, Thm. 4.2, p. 9]; 543–544 cite [Kr, Prop. 2.3, p. 3]; 1243–1244 mark the general Morita–Tachikawa case as the roadmap's own deduction. 544–545 leave `C ≌ mod (proj C)` unlocated: R06 here.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 Fitting (pinned, `Indecomposable.lean:279`) | `ℤ`; free `k×k`-modules; `B=k[ε]/(ε²)` | `End ℤ=ℤ` not local, `ℤ` not Artinian; `k×k` indecomposable among free modules, `End=k×k` not local; `End B=B` local | both counterexamples need the dropped hypothesis | none |
| §0.2 `IsKrullSchmidt`, `indecomposable_iff_isLocalRing_end` | zero category; `mod ℤ/4`; f.g. abelian groups; `X=0` | `n=0`; `End ℤ/2`, `End ℤ/4` local; `End ℤ=ℤ`; `Indecomposable 0` false, `End 0` zero ring, not local | true both sides | none |
| §0.2 `isIdempotentComplete_of_isKrullSchmidt` | `Mat_ C₁`, `End = k×k` | only the empty biproduct is `0`, so not KS; `(1,0)` unsplit | consistent with [Kr, Cor. 4.4] | none |
| §0.3 uniqueness | `ι=κ=∅`; `ι=∅≠κ`; `ℤ[√−5]`, `I=(2,1+√−5)` | unique `σ`; no iso since `Y j≠0`; `I⊕I≅R²`, `End I=R` not local | true; [Kr, Thm. 4.2] is for additive categories | none |
| §0.4 recognition | `R=0`; `Karoubi (Mat_ C₁)`; `Karoubi C₁` | all Homs `0`, so every object is zero; pairs `(m,n)`, indecomposables `(1,0)`, `(0,1)`; 4 objects, no `(2,0)` | true | none |
| §0.5 closure, additive generators | `mod ℤ/4`; Kronecker; free `k×k`-modules; `{0}` | `ℤ/2⊕ℤ/4`; infinitely many classes; `k×{0}` summand, not free; empty decomposition | true | none |
| §0.6 radical Checks | `B`; chains among `k`, `B`; `(i,0)` | `B→k→B` is `ε≠0`; all eight 3-chains `0`; `(i,0)=pr₁≫i`, `pr₁` split epi | Check wording false | R05 |
| §1.1 `IsFinitelyPresentedFunctor` | `(−,Y)`; `0`; `(−,K)`, `dim K=∞`; quotient of `(−,Y)` | `X=0`; `X=Y=0`; image in `(−,K')`; quotient of additive is additive | true | none |
| §1.2 criterion | one-object `ℤ[x]`, no biproducts; `k[x,y₁,…]/(xyᵢ)` | kernel `(2,x)` not cyclic, so biproducts needed: binder kept in signature; `Ann x` not f.g. | true; INP p. 20 lists the equivalence | none |
| §1.3 | `P=A`; `P=A⊕A`; `A=k` | `End=Aᵐᵒᵖ`; `Mat₂(A)ᵐᵒᵖ`; cokernels of `kᵐ→kⁿ` representable | [Kr, Prop. 2.3, p. 3] as stated | R06 |
| §1.4 | `proj ℤ`; `proj B` | subgroups of free are free; `ker ε = εB ≅ k` not projective, `pd_B k = ∞` | true | none |
| §1.5 | `0`; `(−,B)→S_B`; `proj ℤ` | `(−,0)`; at `B`: `B→k`, kernel `εB`; at `k`: `k→0`; `ℤ/2` has no cover | true; [Kr] Cor. 3.5 p. 6, Prop. 3.10 p. 7, Prop. 4.1 p. 8 | none |
| §2.1–2.2 Matlis | `ℤ/p²`, `M=ℤ/p`; `k[x,y]/(x,y)²`; `R=0`; `M=0` | `Hom(ℤ/p,R)=ℤ/p`; `E_R` length 3, socle dims 1 vs 2; `E=0`; trivial | true; pin is local only (`FiniteLength.lean:52`) | none |
| §3.2 Ext-trivial ideals | split structure; finite abelian groups | `E/𝒫=0`; `Ext¹(ℤ/p,ℤ/p)=ℤ/p≠0`, so `id∉𝒫` | INP Def. 1.21 p. 8, En §A.2 p. 24 agree | R03 |
| §3.5 AR duality | INP Def. 3.4 form vs README form | `Ext(B,τA) ≅ D(E/ℐ)(τA,τB) ≅ D(E/𝒫)(A,B)` | equivalent when `τ` is an equivalence | none |
| §4.1 `τ` | `ℤ/p²`, `ℤ/p`; `A`; `T₂(k)` | `Ω²(ℤ/p)=ℤ/p`; `0`; `τS₂=S₁` | true | none |
| §4.2 defect formula | `T₂(k)`, `δ: S₁→P₂→S₂`; `X=S₂`, `S₁`; swapped form | `k`,`k`; `0`,`0`; swapped `k` vs `0` | true; kr16 Thm. 3.4 lines 457–460 | none |
| §4.2 AR formulas from it | `B` injective; `B` projective; `ℤ/p²`, `M=N=ℤ/p` | `δ^*=Ext¹(X,A)`, `δ_*=Hom/inj`; `δ_*=Ext¹(C,−)`, `δ^*=Hom/proj`; lengths 1, 1 | true; second needs `ττ⁻N≅N` up to injectives | R03 |
| §5.1–5.3 valuations, multiplicity | `ℝ`–`ℂ` triangular, `P₁→P₂→I₁` | `Irr(P₁,P₂)=ℂ`: `(1,2)`; mult `b_{P₂,I₁}=1=a_{P₁,P₂}`; dims `1→4→3` | true; field case pinned | R04 |
| §6.1 Harada-Sai | `b=0,1,2`; `B`; finite chain | vacuous; Schur; `ε≠0` at `n=2`, `0` at `n=3`; extend by zero maps | true; [HS] Lemmas 11–12, p. 339 give no bound | none |
| §6.2 Auslander (R01 form) | `k×k`; Kronecker; `ℤ/p²` | first factor closed and bounded, `hA` fails; tubes and preprojectives unbounded; both vertices in `S` | statable; elaborates | R01 |
| `isRepresentationFinite_of_length_le` | `A=0`; `k` | empty skeleton; one class, `b=1` | true | none |
| `rad^∞` criterion | `A=0`; `B`; Kronecker | both sides hold; `rad³=0`, 2 classes; `rad^∞≠0`, infinite | true; ⇒ pinned | none |
| §7.2 global dimension | zero ring; `ℤ`; `B`; scratch proof of the cyclic form | `⊥=⊥`; `pd ℤ/2=1`; `pd k=∞`; cyclic form proved from pin | true; Au55 Thm. 1, Cor. 5, Cors. 9, 11(b) as cited | R02 |
| §7.3 `HasProjectiveInjectiveCopresentation` | `T₂(k)`; `End_B(B⊕k)`; self-injective | `I¹=S₂` not projective, `dom.dim 1`; holds; `I¹=0` | true | none |
| §7.4 Morita-Tachikawa | `(k,k)`, `(k,k²)`, `(Mat₂k,k²)`; `R=k×k` | End dims 1, 4, 1; `k↦k²`; R-algebra structures differ | true | none |
| §7.5 Auslander correspondence | `B⊕k`; `A=M=0`; semisimple | dim 5, gl.dim 2, dom.dim 2; `Γ=0`, `⊥≤2`; gl.dim 0 | true | none |
| `exists_isAlmostSplit` | `ℤ/p²`; `A=0`; `A=k` | `ℤ/p→ℤ/p²→ℤ/p`; vacuous; all projective | true | none |
| One-tactic probe | 20 theorems, `first \| rfl \| infer_instance \| (simp; done) \| exact?` | 0 closed | no one-tactic padding | R02 by derivation |

- Source locators checked against the text: 31. kr: 9 (Prop. 2.3, Rem. 2.4, Cor. 3.5, Prop. 3.10, Prop. 4.1, Thm. 4.2, Cors. 4.3–4.4, proof of Cor. 4.4); en: 5; inp: 8; au55: 5; ch: 1 (Thm. 2.1, p. 460); hs: 2 (Lemmas 11–12, p. 339); kr16: 1 (the defect formula).
- Library at the pin: all 79 backticked `TauCeti.*` names of the README resolve. 30 declarations were opened with file and line, as cited in R01–R04 and the table.
- Cross-roadmap citations resolved on main: DerivedModuleAlgebra §1.M.2, GrothendieckEulerForms, StablePeriodicCurved Layer 0 (README:154), PurityOfBranchLocus §0.3 with `Suggested.lean:132,137`, GeometricRepresentationCategories §R5.2 (README:361–363), and QuiverRepresentations 6A–6F, mapped at its README:859–872.
- Ownership against open pull requests: `roadmaps grep` for 11 object terms (Krull-Schmidt categories, Harada-Sai, dominant dimension, defect formula, Freyd, weak kernels, Morita-Tachikawa, …) finds only the family index. the overlap check lists no dropped id and no conflicting head.
- Dependency check: `depcheck: 208 roadmaps, 1917 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate rerun at fc36f96: every text check passes. The worker's targeted build passed (`build=0`). `lake env lean Suggested.lean`: 20 `sorry` warnings, nothing else.
- `#check @` of all 26 declarations on a scratch copy: no binder is lost. The 7 flagged leads are category instances present in the types. `IsFinitelyPresentedFunctor` drops `[HasFiniteBiproducts C]` harmlessly; the criterion keeps it.
- Pull-request text: the title and every sentence of the description agree with the head (route, scope move, baseline, renamed and added declarations, locators). Nothing is removed or renumbered.

## Not verifiable

- ars, ass: printed books with no legal copy; the locators of §§3.4 (ASS IV.6.11), 4.1–4.3, 5.1–5.3, 6.1–6.2, 7.1, 7.3 and 7.5 are unchecked.
- kr03: Linear Algebra Appl. resolves only to a paywalled page (uncertified); the formula was checked in Krause's open arXiv:1604.02813v1 instead.
- au78: no legal copy; “Thm. III.4.1” is confirmed only as kr16 cites it (line 456).
- lz (Bol. Soc. Mat. Mexicana 10, 2004): the sources service found no legal source.
- mu (Canad. J. Math. 20, 1968): the Cambridge page is paywalled; the README already marks Thm. 2 as unread.
- Auslander (*Coherent functors*, *Representation dimension*, *RTAA II*), Freyd, Hoshino, Tachikawa, Yoneda, Roiter, Matlis: marked “not read” in the README; not fetched.

## Source issues

- **Misprint** in kr at Thm. 4.2, p. 9: the source says the conclusion repeats the word “and” (“r = s and and there exists”); it should be a single “and”; affects nothing.
