# Review of DerivedModuleAlgebra (pull request #1701 at db95654)

**Verdict:** needs changes

This is an incremental re-review of the 78 lines that changed in the folder since 9b3b370, the head r23 read. "README" means `TauCetiRoadmap/DerivedModuleAlgebra/README.md` and "Lean" means `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean`. Pins: Mathlib 1b1ccf4, Tau Ceti 2fd255d.

Both roadmap findings of r23 are repaired, and the repairs are mathematically correct against the pins and the sources. One P3 finding remains, and it does not block: the pull-request description, which r23 raised as R03.

## R01 (P3) — The pull-request description still says `Suggested.lean` is unchanged

This is r23's R03 (r22's R02), raised in every round since r15. It is not repaired. No repair report marks it `not actionable in this package`: the board's reports directory for this package holds only review reports, and the head commit message records no decision about it.

**Location.** The description's **Summary** (data):

> "README only; `Suggested.lean` is unchanged. The head also replaces main's `Suggested.lean` …"

**Claim.** The first sentence is false, and the next sentence contradicts it.

**Witness.** `git diff --numstat origin/main...HEAD` gives `575 1227` for Lean. Lean declares 44 names, the headline theorems among them, and this head changes its `IsPerfect` docstring again.

**Repair.** On GitHub, delete "README only; `Suggested.lean` is unchanged." from the Summary. If the repair round cannot edit descriptions, its repair report should mark this finding `not actionable in this package` and give the reason, so that the finding is settled.

**Test.** After the edit, the Summary agrees with the numstat above.

## Previous findings

- R01 — repaired: README:821–845 adds the route: "Mathlib's `CategoryTheory.Adjunction.derived` turns it into `G ⊣ (ModuleCat.restrictScalars f).mapDerivedCategory` … once both derived functors stay derived after composition with the other". *Needs* (README:857) and the Mathlib row (README:127) name every input.
- R02 — repaired: README:23–25, 2461–2467 and the Check at 2508–2511 state that "`TauCeti.DerivedCategory.Bounded.perfect` … is a different class" and give the `⊕_ℕ ℤ` witness. Lean:562–565 repeats it.
- R03 — not repaired: the description still reads "README only; `Suggested.lean` is unchanged." Raised again as R01.

## Verified sound

### Gate, dependency check, build, signatures, padding

- **Gate.** My run at this head gives `gate DerivedModuleAlgebra: set_option=0 blob=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exits 0. All counters are 0, and `gate.md` agrees.
- **Dependency check.** Full output:
  ```text
  depcheck: 239 roadmaps, 2336 edges, 0 problem(s)
  ```
  There is no UPWARD, CYCLE or `moved:` line.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DerivedModuleAlgebra'` is empty.
- **Elaboration.** `lake env lean` on Lean exits 0. Its only messages are the 33 "declaration uses `sorry`" warnings, the same as r23.
- **Signatures.** Lean changes only the `IsPerfect` docstring (Lean:562–565). `signatures.md` lists 44 declarations at this head, with none having lost a binder. `IsPerfect : (R : Type u_1) → [Ring R] → D R → Prop` is unchanged and matches README §1.E.0.
- **Padding.** No statement changed, so r23's one-tactic probe still holds: all 33 theorems fail and none is padding.

### R01 repair: the §0.2 route to `nonempty_derivedExtendRestrictScalarsAdj` (README:821–845)

I opened every input the route names, at the pin, and checked that the route discharges each hypothesis.

**`CategoryTheory.Adjunction.derived`** (`Mathlib/CategoryTheory/Functor/Derived/Adjunction.lean`:141) assumes four instances:
- `G'.IsLeftDerivedFunctor α W₁`. This is Lean's `hG`, with α of the same shape `Q ⋙ G ⟶ complexBaseChange f ⋙ Q`.
- `F'.IsRightDerivedFunctor β W₂`.
- `(G' ⋙ F').IsLeftDerivedFunctor (… whiskerRight α F') W₁`.
- `(F' ⋙ G').IsRightDerivedFunctor (whiskerRight β G' ≫ …) W₂`.

The README's "both derived functors stay derived after composition with the other" is exactly the last two.

**The right-derived instances.** `Functor.isRightDerivedFunctor_of_inverts` (`PointwiseRightDerived.lean`:170) takes `e : L ⋙ F' ≅ F` and gives `F'.IsRightDerivedFunctor e.inv W`. Applied to `Functor.mapDerivedCategoryFactors` (`DerivedCategory/ExactFunctor.lean`:48), and to its whiskering by `G`, it supplies the second and fourth instances, as the README says.

**The left-derived instances.** `IsLeftDerivabilityStructure.mk'` (`DerivabilityStructure/Constructor.lean`:124) takes four instances:
- `∀ X₂, IsConnected (Φ.LeftResolution X₂)`;
- `Φ.arrow.HasLeftResolutions`;
- `W₂.ContainsIdentities`;
- `Φ.IsLocalizedEquivalence`.

`Derives.isLeftDerivedFunctor_iff_isIso` (`Derives.lean`:145) says that `LF` is left derived exactly when `α` is invertible at every object of the subcategory. That is how the README uses it, first for `G` and then for `complexBaseChange f ⋙ Q ⋙ F'`. Each functor inverts quasi-isomorphisms between K-flat complexes, by Stacks 064L with `L• = S[0]`.

**Connectedness and arrow resolutions.** I derived both as the README describes:
- Adding `⊕ₙ [Fₙ --id→ Fₙ]` in degrees `n, n+1` makes a resolution surjective in each degree. The component in degree `n` is free, and the component in degree `n+1` is forced to be `d ∘ gₙ`.
- For a surjective quasi-isomorphism `P → K`, the fibre product `P ×_K P' → P'` is a quasi-isomorphism, because its kernel `ker(P → K)` is acyclic.
- A K-flat resolution of `P ×_K P'` then links `P` and `P'` in the category of resolutions. Pulling back along `f` in the same way gives arrow resolutions.

**Localized equivalence.** `Φ.IsLocalizedEquivalence` follows from the same resolutions and two-out-of-three for quasi-isomorphisms. No pinned lemma covers non-functorial resolutions. Tau Ceti's `CochainComplex.kFlatResolution` (`Monoidal/KFlat/Resolution.lean`:289) is defined on objects only. So Mathlib's `isRightDerivabilityStructure_of_functorial_resolutions` (`OfFunctorialResolutions.lean`:122) does not apply directly, and the README rightly takes the `mk'` route.

**"Neither pinned library lifts an adjunction to complexes."** This is true:
- Grepping `Adjunction`/`⊣` against `mapHomologicalComplex` in both libraries finds only `Equivalence.mapHomologicalComplex` (`Mathlib/Algebra/Homology/Additive.lean`:222).
- It also finds `Adjunction.extEquiv` (`DerivedCategory/Ext/MapAdjunction.lean`:41), which is for exact functors on `Ext` groups and is not a lift to complexes.
- `TauCeti.DGRightModuleCat.extendRestrictScalarsAdj` is at `DG/Module/Right/Extension/Adjunction.lean`:401, on DG modules, as the README says.
- `ModuleCat.extendRestrictScalarsAdj` is at `ChangeOfRings.lean`:878. Its universes match Lean's `ModuleCat.{u}` for `R S : Type u`.

**Elaborated at the pin.** In a scratch probe, `#check @…` elaborates for all of:
- `Adjunction.derived`, `ModuleCat.extendRestrictScalarsAdj`, `isRightDerivedFunctor_of_inverts`;
- `IsLeftDerivabilityStructure` and its `.mk'`, `Derives.isLeftDerivedFunctor_iff_isIso`, `mapDerivedCategoryFactors`;
- `CochainComplex.linearHomComplex`, `TauCeti.kInjectiveReplacement`, `TauCeti.derivedHom`, `CochainComplex.IsKFlat`.

### The §1.1.1 route to `nonempty_derivedTensorHomAdj` (README:1971–1982)

- **It is the proof at StacksMA line 8727–8731.** That proof uses a K-injective `I•` and a K-flat `L•` together with Lemma 15.73.1 (line 8361, p.181).
- **`TauCeti.derivedHom` (`DerivedCategory/DerivedHom.lean`:69)** is `linearHomComplex` between the K-injective replacements of both arguments.
  - So "uses the K-injective replacement of `L` in place of `L•`" is accurate.
  - The quasi-isomorphism from `L•` to the replacement `J` is an actual chain map, because `J` is K-injective.
  - `Hom•(−, I•)` turns it into a quasi-isomorphism, since `I•` is K-injective.
- **The K-injectivity argument is correct.** It needs `L•` K-flat; without that the table's witness fails.
- **"Neither pinned library has this isomorphism" holds.** Tau Ceti's `LinearHomComplex/` has composition and enrichment (`Enrichment.lean`, `Composition.lean`) but no currying isomorphism. `TauCeti.DGBimoduleCat.tensorHomEquiv` (`DG/Bimodule/TensorProduct/Adjunction.lean`) is a morphism-level equivalence for DG bimodules, on another carrier. Mathlib's `linearHomComplex` is at `HomotopyCategory/HomComplex.lean`:980.

### R02 repair

- `TauCeti.DerivedCategory.Bounded.perfect` (`Singularity/Basic.lean`:92) is `(projectiveSingle C).triangEnvelope`.
  - `projectiveSingle` (line 78) is any projective object in degree 0.
  - The class is closed under retracts (line 102), so "thick closure" is right.
- `DerivedCategory.Bounded.perfect_iff` (`Perfect.lean`:192) is in the root namespace, as the README writes it. It assumes `[EnoughProjectives C]` and asks for `∀ n, Projective (K.obj.X n)`, with no finiteness.
- StacksMA line 8793–8796 (Definition 15.76.1, Tag 0657, p.191) is "quasi-isomorphic to a bounded complex of finite projective modules", which is the README's predicate.

### Seeded sample (the part inside the changed passages)

The target §1.1.1 is sampled and changed. Its locators all check out:
- StacksMA 8361–8364 (Lemma 15.73.1, Tag 0A5Y, p.181; page marker at 8335);
- StacksMA 8707, 8711, 8720 and 8723–8731 (Tags 0A5W, 0A63, 0A64 and 0A65 with its proof, p.189);
- StacksSites 3668–3672 (§21.35, Tag 08J7, p.82).

The §0.2 route's new locators also check out:
- StacksMA 6824–6828 (Lemma 15.60.12, Tag 064L, p.147);
- StacksMA 6948–6951 (Lemma 15.61.3, Tag 0GMT, p.149). Its proof derives the module adjunction, as the README says.

The other sampled targets lie in untouched text: r23 verified §§0.5, 0.12–0.16, 1.2 and 1.7.

### Citations, overlaps, ownership

- **Citations.** `citations.md` lists no cross-roadmap citation found nowhere, and none of the names this head adds.
- **Overlaps.** `overlaps.md` shows no other open pull request changing this roadmap. §1.T.1 stays mapped at README:34–36.
- **Ownership.** `roadmaps grep` over main and the 468 open heads finds no other owner of the three objects the new routes construct:
  - the adjunction lifted to complexes;
  - the Tag 0A5Y Hom-complex isomorphism;
  - a K-flat derivability structure.
- **Hits elsewhere concern other objects:**
  - SchemeAndStackFoundations main:4186 rectifies to complexes of modules on a site.
  - SmoothRepresentationsOfLocalGroups #1688:1685 concerns smooth representations of a discrete group.
  - HigherToposTheory #1901:507 concerns model-category cofibrant objects.

### Adversarial pass

The first four rows are new, for the changed passages. The rest are carried from r23 for statements this head leaves untouched (see `PRREVIEW-DerivedModuleAlgebra~23`).

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.2 route, comparison `α` (README:821–845) | `ℤ→F_p`. K-flat `P=[ℤ --p→ ℤ]`, against the non-K-flat `F_p[0]` | At `P`: `G(F_p)=F_p[0]⊕F_p[1]` and `complexBaseChange P=[F_p --0→ F_p]`, so `H⁰=H⁻¹=F_p` and `α` is iso. At `F_p[0]`: termwise `F_p[0]` has `H⁻¹=0≠F_p`, so `α` is not iso. Hence "invertible at K-flat complexes" only | True | none |
| §0.2 route, composites and resolutions | `G⋙F'` at `P`; `F'⋙G` at `F_p∈D(F_p)`; fibre product | Restricting `[F_p --0→ F_p]` gives `F_p[0]⊕F_p[1]=F_p⊗^L_ℤF_p` in `D(ℤ)`. `F'⋙G`: `F_p ↦ F_p[0]⊕F_p[1]`, with β iso since restriction is exact. The fibre-product kernel `ker(P→F_p)=[ℤ --p→ pℤ]` is acyclic | True | none |
| §1.1.1 route (README:1971–1982) | `A=ℤ`, `L•=[ℤ --p→ ℤ]`, `I•=[ℚ→ℚ/ℤ]`; `K=ℤ[−1]`; non-K-flat `L•=F_p[0]`; acyclic `K=cone(id_ℤ)` | `Hom•(L•,I•)` has `H⁰=0` and `H¹=F_p`. `K=ℤ[−1]`: left `Hom(ℤ[−1],F_p[−1])=F_p`, right `Ext¹(F_p,ℤ)=F_p`. With `L•=F_p[0]`, `K=F_p`, `M=ℤ[2]`: `Ext²(F_p,ℤ)=0≠F_p`, so K-flat is needed. `cone(id)⊗L•` is contractible, so `[Tot,I•]=0` | True | none |
| `IsPerfect` against `TauCeti.DerivedCategory.Bounded.perfect` (README:23–25, 2461–2467, 2508–2511; Lean:562–566) | `⊕_ℕℤ[0]`, `ℚ[0]`, `F_p[0]`, `ℤ[0]` over `ℤ` | `⊕_ℕℤ`: Tau Ceti-perfect via `projectiveSingle`. Not `IsPerfect`: `H⁰` has rank `ℵ₀`, not finitely generated. `ℚ`: free resolution `0→F₁→F₀→ℚ→0`, so Tau Ceti-perfect; not `IsPerfect`, since `H⁰=ℚ` is not finitely generated. `F_p` (via `[ℤ --p→ ℤ]`) and `ℤ`: both | True | none |
| `hasLeftDerivedFunctor₂_tensor` (Lean:135), r23 | `R=ℤ`, `K=L=F_p`; `R=0` | `H⁰=H⁻¹=F_p` against termwise `F_p[0]`. `D(0)` is zero | True | none |
| `hasLeftDerivedFunctor_extendScalars` (Lean:154), r23 | `ℤ→F_p`; bi-infinite `ℤ/4` with `d=2` | `F_p[0]⊕F_p[1]` against `F_p[0]`. Derived 0 against termwise `H^i=F₂` | True | none |
| `nonempty_derivedExtendRestrictScalarsAdj` (Lean:169), r23 | `ℤ→F_p`, `Y=F_p[1]`; reversed adjunction | Both sides `F_p`. Reversed: `0` against `F_p` | True | route added |
| `nonempty_derivedTensorHomAdj` (Lean:319), r23 | `A=ℤ`, `K=L=F_p`, `M=ℤ[2]` | `0⊕F_p` against `Ext¹(F_p,F_p)=F_p`. Underived gives `0` | True | route added |
| `complexBaseChange` (Lean:145), r23 | `[ℤ --2→ ℤ]⊗F₂` | `[F₂ --0→ F₂]` | True | none |
| `nonempty_bicomplexSecondPageIso` (Lean:186), r23 | single column | `H_k(K.X 0)` at `(−k,0)` | True | none |
| `simplicialTensorComparison` (Lean:201), r23 | `x∈X₁`, `y∈Y₁` | Difference `∇(dx⊗y − x⊗dy)` | True | none |
| `bisimplicialDiagonalComparison` (Lean:224), r23 | constant `P` | `P` in degree 0 on both sides | True | none |
| `quasiIso_whiskering_of_projective` (Lean:241), r23 | `Γ₀[ℤ --2→ ℤ]→ℤ/2`, `F(V)=V⊗V` | `H₁=ℤ/2` against `0` | True | none |
| `exteriorPower_decalage`, `symmetricPower_decalage` (Lean:264, 282), r23 | `N=R`, `n=2`; `ℤ/2` | `Γ²R=R`, and `∧²R=0`. `F₂` against `ℤ/4` | True | none |
| `derivedLimit_isTriangulated` (Lean:304), r23 | constant `ℤ[0]` | Shift iso is `id` | True | none |
| Completeness block (Lean:352–400), r23 | `I=0`, `I=A`; `ℚ_p`; `ℤ[1/p]`; `m⊂O_ℂp` | Every `M` is complete at `I=0`; `H^(−n)M=0` at `I=A`. `ℚ_p` is not complete. `hc` fails for `ℤ[1/p]`. `m=m²` is excluded by `hI` | True | none |
| §1.5 comparisons (Lean:417–479), r23 | `F_p` via `[ℤ --p→ ℤ]`; `ℚ_p/ℤ_p` | `Rlim=F_p[0]`. `H⁻¹=ℤ_p` against `0` | True | none |
| `IsCompletelyFlatModule`, §1.8 (Lean:496–546), r23 | `F_p` over `ℤ`; `ℤ/2` over `ℤ/4` | `Tor₁=F_p`. `Tor₁=ℤ/2` | True | none |
| `isPerfect_baseChange` (Lean:607), r23 | `ℤ/2` over `ℤ/4` | `H^(−i)=F₂` for all `i`, excluded by `hK` | True | none |
| `ringTowerLimit_jacobson`, `pseudoCoherent_residueCriterion` (Lean:622, 635), r23 | `k[t]/tⁿ⁺¹`; `ℤ↪ℚ`; `[k[[t]] --t→ k[[t]]]` | `(1+t)⁻¹=Σ(−t)ⁱ`. `π₀(2)` is a unit but `2` is not. Fibre `[k --0→ k]` | True | none |
| Matlis (Lean:659, 672), r23 | `ℤ_p`, `ℚ_p/ℤ_p`; `ℤ_(p)` | `D(E)=ℤ_p`. `End E=ℤ_p≠ℤ_(p)` | True | none |

## Not verifiable

- **NSW (2.1.1), (2.1.2), (2.2.4), printed pp.99 and 105** (untouched text). The cached NSW entry is the authors' landing page only. Earlier rounds checked the same claims against StacksHom Tags 0130/0132/0133.
- **IllusieCC** is recorded as uncertified in the manifest, which settles it.

## Source issues

- none
