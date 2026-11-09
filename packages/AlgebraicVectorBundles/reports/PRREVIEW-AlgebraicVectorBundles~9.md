# Review of AlgebraicVectorBundles (pull request #1221 at 03e04c2)

**Verdict:** needs changes

## R01 (P2) — KTheoryLowDegrees §4.1 is a second owner of the extension determinant (§3.2) and the affine comparison (§3.3)

**Location.** `TauCetiRoadmap/AlgebraicVectorBundles/README.md:580–593` (§3.2) and `:647–657` (§3.3). Downstream consumers (`:728–741`) does not name KTheoryLowDegrees. §3.2 reads: "construct the isomorphism `γ : InvertibleSheaf.tensorProduct (det E′) (det E″) ≅ det E` … Prove that `γ` is natural …, associative for a filtration … and compatible with pullback".

**Claim.** The open new roadmap KTheoryLowDegrees (#1248, merge order line 87) states and proves the same objects on schemes:
- the canonical isomorphism `det P ≅ det P′ ⊗ det P″` of a short exact sequence of finite locally free modules, with naturality, arbitrary pullback, agreement with the split sum and filtration coherence;
- the comparison of the scheme determinant with PadicMeasuresIwasawaAlgebras §5.1's `projectiveDeterminant`, with ordered sum and signed symmetry.

These are this roadmap's γ and its §3.3 comparison. KTheoryLowDegrees also cites this roadmap's L0B–L0C, which is now Layer 3, as its supplier. As a result, one object has two owners.

**Witness.** KTheoryLowDegrees at #1248, `README.md:459`: "Compare the scheme determinant … with … `projectiveDeterminant` … Prove exact-sequence additivity …: an exact sequence `0→P'→P→P''→0` of finite locally free modules has a canonical isomorphism … prove naturality, arbitrary pullback …". Also `:478`.

**Repair.** This roadmap is on main and is KTheoryLowDegrees' supplier, so it keeps ownership. Add to Downstream consumers:

"KTheoryLowDegrees §4.1 takes the exact-sequence determinant isomorphism, with its naturality, pullback, split case and filtration coherence, from §3.2, and the comparison with `projectiveDeterminant`, ordered sum and Koszul sign, from §3.3; it cites them and does not restate them."

The conventions already agree, so the citation is consistent:
- KTheoryLowDegrees puts the subobject first ("in that order"), as γ does.
- Its ℙ¹ example, `O(−1) → O² → O(1)` with `𝒪(−1) ⊗ 𝒪(1) ≅ 𝒪`, is this roadmap's Euler-sequence Check: degrees `0 = −1 + 1`.

## R02 (P2) — The ringed-space route of §2.2 relies on finite presentation of `f^* M`, which nothing provides

**Location.** `README.md:464–465` (§2.2): "Route (the stalk proof of Tag 0C6I): `f^* M` is finitely presented (Stacks Project, Tag 01BQ); at `x ∈ X`, §1.1 and `SheafOfModules.ihomStalkEquiv` (finitely presented source, arbitrary target) identify the stalk". *Needs:* line `:484–491`.

**Claim.** The README states §2.2 for every flat morphism of ringed spaces. It is the second end theorem of the Summary. Its only route at that generality applies `ihomStalkEquiv` to `f^* M`, so it needs `f^* M` finitely presented along a morphism of ringed spaces.

No target here provides this, and neither does any supplier or pinned declaration. The *Needs:* line names `Scheme.Modules.isFinitePresentation_pullback`, which is for schemes only. The scheme route of the same section does not reach ringed spaces.

**Witness.**
- Tau Ceti `AlgebraicGeometry/Modules/Pullback/Basic.lean:642`: `isFinitePresentation_pullback (f : X ⟶ Y) (M : Y.Modules)`, with `X Y : Scheme`.
- Mathlib's `Algebra/Category/ModuleCat/Sheaf/` has only `pullbackObjFreeIso` (PullbackFree.lean:118).
- `ihomStalkEquiv` requires `[M.IsFinitePresentation]` (InternalHom/FinitePresentation.lean:306).

**Repair.** Add to §2.2 the following target.

"For every morphism of ringed spaces `(f, φ)` and every finitely presented `𝒪_Y`-module `M`, `f^* M` is finitely presented (Stacks Project, Tag 01BQ). Route: on an open `U` with a presentation `𝒪_U^a → 𝒪_U^b → M|_U → 0`, pullback is right exact, being a left adjoint, and takes free modules to free modules (Mathlib `SheafOfModules.pullbackObjFreeIso`). It commutes with restriction to opens through `SheafOfModules.pullbackComp`, and Mathlib `SheafOfModules.Presentation.map` (Sheaf/Quasicoherent.lean:176) carries the presentation."

Then name this target in the §2.2 *Needs:* line, and keep `Scheme.Modules.isFinitePresentation_pullback` for the scheme route only.

Test it on the §2.2 Check `M = 𝒪/(t)` on `𝔸¹_k`, pulled back to the origin. The presentation `𝒪 —t→ 𝒪 → M → 0` becomes `k —0→ k → k → 0`, so `f^* M = k` is finitely presented, as the new target says.

## R03 (P3) — §3.2's sheaf exterior multiplication has no locator, no *Needs:* and no Checks

**Location.** `README.md:576–578`: "Construct the sheaf exterior multiplication `∧ᵃ M ⊗ ∧ᵇ M → ∧ᵃ⁺ᵇ M` on `X.Modules`, the sheafification of the sectionwise wedge product, natural in `M`, associative and graded commutative with the sign `(−1)^(ab)`."

**Claim.** This is a new construction, and the docstring names it as the missing carrier of the §3.2 headline (`Suggested.lean:52–53`). Yet it carries no locator, no *Needs:* line and no Checks. The §3.2 Checks (`:617–643`) all test γ or the direct-sum sign.

The §3.2 *Needs:* line names `TauCeti.exteriorPower.wedgeTensor`. That map goes from two modules into `M × N`; it is not the single-module wedge product that is sheafified here.

**Witness.** Mathlib `LinearAlgebra/ExteriorPower/WedgePairing.lean:34`, `exteriorPower.wedge : ⋀[R]^k M →ₗ ⋀[R]^l M →ₗ ⋀[R]^(k + l) M`, is the sectionwise map, and the README does not name it. Stacks `stacks-01CD` line 1389 (Modules, Section 21, Tag 01CF) states that `∧(F)` is graded commutative.

**Repair.**
- Add the locator "(Stacks Project, Tags 01CF and 01CG)".
- Add "*Needs:* Mathlib `exteriorPower.wedge`; Tau Ceti `SheafOfModules.exteriorPower`, `PresheafOfModules.sheafificationStalkEquiv`".
- Add three Checks:
  - On `𝒪_X²`, `e₁ · e₂ = e₁ ∧ e₂` and `e₂ · e₁ = −e₁ ∧ e₂`, the sign `(−1)^(1·1)`. A commutative product would give `+`.
  - On `𝒪_X³`, `(e₂ ∧ e₃) · e₁ = e₁ ∧ e₂ ∧ e₃ = e₁ · (e₂ ∧ e₃)`, the sign `(−1)^(2·1) = +1`. The rule `(−1)^(a+b)` would give `−1`.
  - For `a = 0`, multiplication by `∧⁰ M = 𝒪_X` is the module action. On a line bundle `L`, `∧¹ L ⊗ ∧¹ L → ∧² L = 0`.

## R04 (P3) — *Needs:* lines omit pinned declarations their routes use

**Location.**
- §2.1, `README.md:442–445`: "exactness of a sequence of module sheaves is checked on stalks (Stacks Project, Tag 01AG) … *Needs:* §1.1; Mathlib `SheafOfModules.pullback`, `AlgebraicGeometry.Flat` for schemes."
- §3.2, `:609–611`: "It is the class of `γ` (`LineBundleClass.mk_eq_mk_iff`)".

**Claim.**
- The §2.1 route checks exactness on stalks. That criterion is Mathlib's `TopCat.Sheaf.exact_iff_stalkFunctor_map_exact`, which the *Needs:* line does not name.
- The §3.2 route deduces `mk (det E) = mk (det E′) * mk (det E″)` from γ. That step also needs `mk (L ⊗ K) = mk L * mk K`, which is `LineBundleClass.mk_tensorProduct`, absent from the §3.2 *Needs:*. `mk_eq_mk_iff` alone yields only `mk (det E′ ⊗ det E″) = mk (det E)`.

**Witness.**
- Mathlib `Topology/Sheaves/Abelian.lean:103`, `exact_iff_stalkFunctor_map_exact (S : ShortComplex (Sheaf C X)) : S.Exact ↔ ∀ x, …`.
- Tau Ceti `AlgebraicGeometry/LineBundle/Class.lean:119`, `mk_tensorProduct (L K : InvertibleSheaf X) : mk (L.tensorProduct K) = mk L * mk K` (confirmed by `#check`).

**Repair.**
- Add `TopCat.Sheaf.exact_iff_stalkFunctor_map_exact` (Mathlib) to the §2.1 *Needs:*.
- Add `LineBundleClass.mk_tensorProduct` (Tau Ceti) to the §3.2 *Needs:*.
- Change the §3.2 sentence to "(`LineBundleClass.mk_eq_mk_iff`, `LineBundleClass.mk_tensorProduct`)".

Test on the Euler Check: `mk 𝒪 = mk(𝒪(−1) ⊗ 𝒪(1)) = mk 𝒪(−1) · mk 𝒪(1)` needs both lemmas.

## R05 (P3) — The Suggested.lean module docstring carries a catalogue of consumed declarations

**Location.** `TauCetiRoadmap/AlgebraicVectorBundles/Suggested.lean:29–37`: "The following are Tau Ceti declarations at the pin and are consumed, not restated: the dualizability criterion `QuasicoherentSheaf.nonempty_hasLeftDual_iff_isFiniteLocallyFree`, … and the section-valued universal property `totalSpaceHomEquiv`."

**Claim.** The module docstring has three jobs:
- to say what the file is;
- to say which headline theorems it states;
- to say which headlines are not statable, and what each lacks.

A list of nine consumed library declarations is none of these. It is a catalogue of names, which the Lean form excludes, and it duplicates Scope and ownership (`README.md:47–138`).

**Witness.** None of the nine names occurs in any statement of the file. Each occurs in the README's Scope and ownership: for example `relativeSpecEquiv` at `README.md:105` and `totalSpaceHomEquiv` at `:125`.

**Repair.** Delete `Suggested.lean` lines 29–37; the README keeps the list. Re-elaborate the file; it still gives exactly the five `sorry` warnings.

## Verified sound

**Repairs of the previous review (r8, at 66f47d3), finding by finding.**

| r8 finding | Passage at this head | Status |
| --- | --- | --- |
| R01 extension determinant | §3.2 `:580–593` "For a short exact sequence `0 → E′ → E → E″ → 0` … construct the isomorphism `γ`"; Euler Check `:618–621`; `K0.det` under Downstream consumers `:730–733`; docstring `Suggested.lean:49–54`; new headline `mk_determinantObj_of_shortExact` | repaired (Stacks 0FJB–0FJD cited in place of Knudsen–Mumford; acceptable). R01 above is a new ownership finding on the same object. |
| R02 AdicSpacesPartIII second owner | ringed-space Conventions `:159–173`; `pullback_tensor_isIso` and the power theorems on `TopCat` ringed spaces; Downstream consumers `:734–736` "AdicSpacesPartIII F0.8 … parts (a) and (b), are §1.2 and §2.2" | repaired. The restatement at main `AdicSpacesPartIII/README.md:3771–3774` is for that roadmap to delete. |
| R03 stalk computations unowned | §1.1 target (Tag 0098) `:354–377`; §3.1 stalks of powers (Tag 01CH) `:529–535`; *Needs:* of §1.2 (`tensorStalkEquiv`), §2.1, §3.1 name §1.1; §2.2 *Needs:* names the Restriction/Coherence lemmas | repaired |
| R04 `pullbackDetIso` | `:94`, `:592`, `:604`, `:614`, Check `:640–641` | repaired |
| R05 §3.3 locator | `:649–651` "(Stacks Project, Tag 01I8, for `(∧ⁿ P)~ ≅ ∧ⁿ(P~)` in constant rank `n`; …)", References `:746` | repaired |
| R06 dropped names | `:324–326` "`pullbackQuasicoherentAlgebra` is Tau Ceti's `QuasicoherentAlgebra.pullback`"; `:332–333` "`linearSpecScheme X` is Tau Ceti's `linearSpec X` followed by `QuasicoherentLinearScheme.forget X`" (both at the pin: LinearScheme.lean:175, :183) | repaired |
| R07 Summary | `:3–25` now says what is built and lists end theorems; inventory only in Scope and ownership | repaired |

**Gate and build.**
- The worker's gate at 03e04c2 passes every check.
- My rerun of `gate … --base origin/main` printed `OK`, with every counter 0, including outside-folder, stray-files, dropped and statement-hygiene.
- `lake env lean` on Suggested.lean gives exactly five warnings, `declaration uses 'sorry'`, at lines 107, 127, 141, 159 and 177, and nothing else.
- The diff outside the folder is empty, and `HEAD` merges cleanly with `origin/main` (172efce6).
- PROGRESS.md, STATUS.md and metadata.toml (`topic = "math.AG"`) are on main and are unchanged by this pull request.

**Dependency check (verbatim).** `depcheck: 238 roadmaps, 2353 edges, 0 problem(s)`.
- This roadmap is on main and is not listed in ORDER.txt.
- Its only roadmap supplier is PadicMeasuresIwasawaAlgebras §5.1, on main. That section (main README:3214) names "AlgebraicVectorBundles L0C" as the owner of the sheaf comparison, so the direction of supply is consistent.

**Signatures.**
- One scratch file with `#check @name` for all nine declarations confirms that each elaborated type equals its README statement and that no binder was lost:
  - `pullback_tensor_isIso : ∀ {X Y : TopCat} (f : Y ⟶ X) {𝒪X 𝒪Y} (φ : ringCatSheaf 𝒪X ⟶ (Opens.map f).sheafPushforwardContinuous … (ringCatSheaf 𝒪Y)) [(pushforward φ).IsRightAdjoint] (E F), IsIso (δ (pullback φ) E F)`;
  - `isIso_pullbackIhomComparison_app_of_flat : ∀ (f : X ⟶ Y) [Flat f] (M N) [IsFinitePresentation M] [IsQuasicoherent M], IsIso ((pullbackIhomComparison M f).app N)`;
  - `symmetricPower_pullback_isIso` and `exteriorPower_pullback_isIso`, both `∀ (f : X ⟶ Y) … φ [IsRightAdjoint] (n), IsIso (…Comparison (pullbackPushforwardAdjunction φ) n)`;
  - `mk_determinantObj_of_shortExact : ∀ (S : ShortComplex X.Modules), S.ShortExact → ∀ h₁ h₂ h₃, mk (det ⟨S.X₂,h₂⟩) = mk (det ⟨S.X₁,h₁⟩) * mk (det ⟨S.X₃,h₃⟩)`;
  - the four alias declarations, unchanged since r8.
- The worker's `signatures.md` lists 11 entries. Two of them (`` `f.base`, `` and `of`) are parser artefacts of docstring text, not declarations.
- Probes confirmed four facts:
  - the `δ` found by instance search is `TauCeti.SheafOfModules.pullbackOplaxMonoidal φ` (`rfl`);
  - `Scheme.Modules.pullback f = SheafOfModules.pullback f.toRingCatSheafHom` (`rfl`);
  - each of the three ringed-space theorems, applied to `f.base`, `f.toRingCatSheafHom`, closes the scheme-level goal on `Scheme.Modules.pullbackSymmetricPowerComparison f n`, `…ExteriorPower…` and `δ (Scheme.Modules.pullback f)`, as the docstring claims;
  - `(SheafOfModules.pushforward φ).IsRightAdjoint` is not found by `inferInstance` for a general `φ` on `TopCat`, as the docstring says.

**Padding probe.** I ran 6 one-tactic attempts on a scratch copy, and none closed:
- `infer_instance` on each of the four `IsIso` theorems;
- `simp` and `rfl` on `mk_determinantObj_of_shortExact`.

The four aliases serve no headline except through `mk_determinantObj_of_shortExact`. They are kept because main's `SchemeAndStackFoundations/Suggested.lean:2` imports this module and uses them at lines 1872, 2535, 2537, 2550 and 2565. The gate builds that module.

`mk_determinantObj_of_shortExact` is the class-level form of the unstatable γ. I count it as a headline, not a substitute:
- the README states it as its own target (`:607–611`);
- it is exactly the `map_conflation` obligation of main's `K0.det` (`SchemeAndStackFoundations/Suggested.lean:2561–2566`).

**Library declarations.**
- 169 README names were checked with `#check` at Mathlib 1b1ccf4b and Tau Ceti 2fd255d9. 137 elaborated; the other 32 lie in Tau Ceti modules without object files, and each was located in source. Examples:
  - `SheafOfModules.ihomStalkEquiv` at Sheaf/InternalHom/FinitePresentation.lean:306;
  - `TauCeti.SheafOfModules.tensorStalkEquiv` at Sheaf/TensorProduct/Stalk.lean:132, in namespace `TauCeti.SheafOfModules`;
  - `TauCeti.exteriorPower.wedgeTensor` at LinearAlgebra/ExteriorPower/Prod.lean:42;
  - `TauCeti.exteriorPower.shortExactEquiv` at ShortExact.lean:140, which puts the subspace first, as the §3.2 Check says;
  - `FiniteLocallyFreeSheaf.pullbackDetIso` at Determinant/Pullback.lean:156;
  - `Scheme.Hom.isIso_pullbackIhomComparison_app` at Pullback/InternalHom/Flat.lean:115;
  - `Scheme.Opens.isIso_pullbackIhomComparison_app` at …/Restriction.lean:63;
  - `gradedSymmetricAlgebraAdjunction` at …/SymmetricAlgebra/Adjunction.lean:320;
  - `modObjRelativeSpecSymmetricAlgebra` at RelativeSpec/SymmetricAlgebra/Module.lean:132;
  - `pullbackSymmetricPowerComparison_comp` at …/Coherence.lean:179.
- Only this roadmap's own names, and the two mapped legacy names, are absent from the pins.
- Facts I opened, with what they say:

| Declaration | File and line at the pin | What it says |
| --- | --- | --- |
| `SheafOfModules.pullback` | Mathlib ModuleCat/Sheaf/PullbackContinuous.lean:53 | `(pushforward φ).leftAdjoint`; existence by presheaf pullback plus sheafification (`PullbackConstruction.adjunction`) |
| `TauCeti.SheafOfModules.pullbackSymmetricPowerComparison` | Sheaf/SymmetricPower/Pullback.lean:170 | the mate of the sectionwise pushforward comparison, hence `f^*(m₁⋯mₙ) ↦ f^*m₁⋯f^*mₙ` |
| `pullbackIhomComparison_app_eq_curry` | Pullback/InternalHom/Basic.lean:87 | `= curry (inv δ(M, M ⟹ F) ≫ f^*(ev))`, as §2.2 describes |
| `Module.FinitePresentation.isBaseChange_map` | Mathlib Algebra/Module/FinitePresentation.lean:696 | `[Flat R S] [FinitePresentation R M] : IsBaseChange S (baseChangeHom R S M N)` |
| `TopCat.Presheaf.isIso_iff_stalkFunctor_map_iso` | Mathlib Topology/Sheaves/Stalks.lean:672 | for sheaves in a concrete category with limits and colimits, such as `AddCommGrpCat` |
| `LineBundleClass.mk_eq_mk_iff` | LineBundle/Class.lean:76 | `mk L = mk K ↔ Nonempty (L.obj ≅ K.obj)`; `LineBundleClass X` is a `CommGroup` |
| `AlgebraicGeometry.Flat` | Mathlib Morphisms/Flat.lean:42 | defined via affine opens, equivalent to flat stalk maps (`Flat.iff_flat_stalkMap`) |
| `exteriorPower.wedge` | Mathlib ExteriorPower/WedgePairing.lean:34 | `⋀^k M → ⋀^l M → ⋀^(k+l) M` (see R03) |

- Absence claims of the docstring were confirmed at the pins:
  - no sheaf-level exterior multiplication: Tau Ceti `Sheaf/ExteriorPower/` has Basic, Free, LocallyFree, Pullback and Restriction only;
  - no `projectiveDeterminant` and no graded lines;
  - no weight grading attached to an `𝔸¹` or `𝔾_m` action under `AlgebraicGeometry/`;
  - the ringed-space Hom comparison does not exist (`pullbackIhomComparison` requires `M : Y.Modules`, `[IsQuasicoherent M]`).

**Sources: the seeded sample.** Every text was read in the legally fetched Stacks chapter PDFs. No locator in the README is flagged as unverified.

| Target | Locator | Text read | Result |
| --- | --- | --- | --- |
| 1.1 | Tag 0098 | stacks-0098 line 1441 (Sheaves, Lemma 26.4, p. 32): for any morphism of ringed spaces, `(f^*G)_x = G_{f(x)} ⊗_{𝒪_{Y,f(x)}} 𝒪_{X,x}` | supports §1.1 as stated, with no locality needed |
| 1.2 | Tag 01CD | stacks-01CD line 1036 (Modules, Lemma 16.4, p. 22): `f^*(F⊗G) = f^*F ⊗ f^*G` functorially, for any morphism of ringed spaces | supports; no hypothesis on `E`, `F` |
| 2.1 | Tags 02N4, 01AG, 02N3 | stacks-02N4 line 1353 (Lemma 20.2, p. 28): flat `f` gives exact `f^*`; line 1346 (Def. 20.1): flat means stalk maps are flat; line 97 (Lemma 3.1): exactness on stalks | supports; the route matches |
| 2.2 | Tags 0C6I, 01BQ | stacks-0C6I line 1521 (Lemma 22.5, p. 32): `F` finitely presented, `f` flat, `G` arbitrary; the proof is the stalk route. Line 672 (Lemma 11.5): pullback of finitely presented is finitely presented | supports `N` arbitrary; see R02 for ownership |
| 3.1 | Tags 01CH, 01CI | stacks-01CH line 1398 (Lemma 21.2): stalks of Sym and ∧ (via Lemma 21.1, sheafification); line 1404 (Lemma 21.3, p. 30): `f^*Sym(F) = Sym(f^*F)` and likewise for ∧, for all `F` | supports |
| 3.2 | Tags 0FJB–0FJE | stacks-0FJB line 17149 (More on Algebra, Lemma 120.2, p. 370): γ for an SES of finite projectives, sub first, any lifts; 0FJC line 17174: naturality; 0FJD line 17200: filtration; 0FJE line 17213: swap with `ε = det(−id_{M′⊗M″})` | supports, with the sign `(−1)^(ab)` |
| 3.3 | Tag 01I8 | stacks-01I8 line 502 (Schemes, Lemma 7.2(2), p. 11): `(∧ⁿM)~ ≅ ∧ⁿ(M~)` | supports the constant-rank case |
| 4.1 | Tags 0EKK, 062M, 062N | stacks-0EKK line 1138 (Groupoids, Lemma 12.4, p. 25): the proof uses only the unit (`x = 1`) and associativity of the coaction; 062M line 350 (Def. 6.2): graded `π_*𝒪`, `E_0 = 𝒪`, `Symⁿ E_1 ≅ E_n`, footnote waiving finiteness; 062N line 364 (Lemma 6.3) | the step carries over to the monoid `𝔸¹` with polynomial coaction; supports |

**Adversarial pass.** One row per statement; values are computed on each side.

| Statement | Instance | Left side | Right side | Result |
| --- | --- | --- | --- | --- |
| 1.1 stalk map | `G = 𝒪`, origin `↪ 𝔸¹_k` | `(f^*𝒪)_pt = k` | `k ⊗_{k[t]_(t)} k[t]_(t) = k`; `f⁻¹G` gives `k[t]_(t)` | iso ✓; wrong model excluded |
| 1.1 | `G = j_!𝒪_U`, `U = D(t)`, point `x ∈ U` / origin | `κ(x)` / `0` | `κ(x) ⊗ 𝒪_x = κ(x)` / `κ(0) ⊗ 0 = 0` | ✓ |
| 1.1 | one-point spaces, `A → B` | `f^*M = B ⊗_A M` | `B ⊗_A M` | ✓ |
| 1.2 `pullback_tensor_isIso` | `Spec 𝔽_p → Spec ℤ`, `E = F = ℤ/p²` | `f^*(ℤ/p²) = 𝔽_p` | `𝔽_p ⊗ 𝔽_p = 𝔽_p` | iso ✓ |
| 1.2 | `j_!𝒪_U ⊗ j_!𝒪_U` to `x ∈ U` / origin | `κ(x)` / `0` | `κ(x) ⊗ κ(x) = κ(x)` / `0` | iso ✓; not covered by the pinned qc case |
| 1.2 | one-point, `k[ε] → k` | `(M⊗N)⊗k` | `(M⊗k)⊗_k(N⊗k)` | iso ✓ |
| 1.2 | `Y = ∅`; `E = 0` | `0`; `0` | `0`; `0` | ✓ |
| 1.2 hypothesis | discrete `{a,b} → {*}`, trivial topology, coefficients `k`, `E = F = 𝒪` | `f^*(k,k) = k²` | `k² ⊗ k² = k⁴` | not iso: "ringed space" is needed, and the Lean form uses `Opens.map f` ✓ |
| 1.2 scheme instance | `f : X ⟶ Y` | `pullback_tensor_isIso f.base f.toRingCatSheafHom E F` | goal `IsIso (δ (Scheme.Modules.pullback f) E F)` | typechecks ✓ |
| 2.1 exactness | `Spec k[t]_(t) → 𝔸¹`, `j_!𝒪_U ↪ 𝒪` | closed pt `0 → k[t]_(t)`; generic `k(t) → k(t)` | injective | ✓ |
| 2.1 flatness needed | origin `↪ 𝔸¹`, `t : 𝒪 → 𝒪` | `0 : k → k` | not injective | Check correct ✓ |
| 2.2 / Lean, flatness needed | `M = 𝒪/(t)`, `N = 𝒪`, origin | `f^*Hom(M,𝒪) = 0` | `Hom(k,k) = k` | not iso ✓ |
| 2.2 / Lean, finite presentation needed | `M = 𝒪^(ℕ)`, `N = 𝒪`, `Spec ℚ → Spec ℤ` | `colim_m ∏ℤ[1/m]` | `∏ℚ`; `(1/pᵢ)` not hit | not surjective ✓ |
| 2.2 / Lean, non-qc `N` | `M = 𝒪/(t)`, `N = j_!𝒪_U ⊕ 𝒪/(t)`, localization at 0 | `k` at the closed point, `0` at the generic point | `t`-torsion of `f^*N`: `k`, `0` | iso ✓; Tau Ceti's qc theorem does not apply |
| 2.2 | `M = 0` / `M = 𝒪` | `0` / `f^*N` | `0` / `f^*N` | ✓ |
| 2.2 route | `M = 𝒪/(t)` pulled back to the origin | `f^*M = k`, finitely presented | needs Tag 01BQ along ringed spaces | unowned (R02) |
| 3.1 powers | `n = 0` | `f^*𝒪_Y` | `𝒪_X` | iso via `pullbackObjUnitToUnit` ✓ |
| 3.1 | `M = 𝒪²`, `n = 2`, `3`, point | `∧²`: `k·e₁∧e₂`; `∧³ = 0` | `k·e₁∧e₂` (sign `+`); `0` | ✓ |
| 3.1 | `M = j_!𝒪_U`, `Sym²`, `x ∈ U` / origin | `κ(x)` / `0` | `κ(x)` / `0` | ✓; not qc |
| 3.1 | `M = 𝒪/(t)`, origin, `n = 2` | `Sym² k = k`, `∧² k = 0` | `k`, `0` | ✓ |
| 3.1 stalks | `M = 𝒪²` | `Sym²` stalk rank `3` | `multichoose 2 2 = 3` | ✓ |
| 3.1 scheme instance | `f : X ⟶ Y`, `n` | `symmetricPower_pullback_isIso f.base f.toRingCatSheafHom n` | `IsIso (Scheme.Modules.pullbackSymmetricPowerComparison f n)` | typechecks ✓ (also exterior) |
| 3.2 exterior multiplication | `𝒪²`, `a = b = 1`; `𝒪³`, `a = 2`, `b = 1` | `e₂·e₁ = −e₁∧e₂`; `(e₂∧e₃)·e₁ = +e₁∧e₂∧e₃` | `(−1)^1 = −1`; `(−1)^2 = +1`, while `(−1)^(a+b) = −1` | the stated sign is right; no Check exists (R03) |
| 3.2 γ | Euler `0 → 𝒪(−1) → 𝒪² → 𝒪(1) → 0` on `ℙ¹` | `det 𝒪² = 𝒪`, degree `0` | `𝒪(−1)⊗𝒪(1)`, degree `−1 + 1 = 0`; wrong rule `𝒪(−2)` | ✓; non-split since `H⁰(𝒪(−1))² = 0` |
| 3.2 γ orientation | `0 → 𝒪 → 𝒪² → 𝒪 → 0`, `1 ↦ e₁` | `γ(1⊗1) = e₁ ∧ (e₂ + c e₁) = e₁∧e₂` | quotient first: `−e₁∧e₂` | Check discriminates ✓ |
| 3.2 γ | `Spec k ⊔ Spec k`, ranks `E′ = (1,0)`, `E″ = (0,2)` | `det E = (∧¹, ∧²)` | `(∧¹⊗𝒪, 𝒪⊗∧²)` | ✓ |
| 3.2 γ over a field | `X = Spec K` | γ | `shortExactEquiv` (ShortExact.lean:140), subspace first | ✓ |
| 3.2 direct-sum sign | `E = F = 𝒪` | `det(swap) = −1` | `comm = +1` times `(−1)^(1·1)` gives `−1` | ✓ (0FJE: `ε = det(−id_{E⊗F}) = (−1)^(ab)`) |
| 3.2 direct-sum sign | `E = 𝒪²`, `F = 𝒪` | 3-cycle, `+1` | `(−1)^2 = +1`; `(−1)^(a+b) = −1` | Check discriminates ✓ |
| 3.2 | `E = 0` | `det F` | `𝒪 ⊗ det F`, sign `+1` | ✓ |
| `mk_determinantObj_of_shortExact` | Euler `0 → 𝒪 → 𝒪(1)² → 𝒪(2) → 0` | `deg det 𝒪(1)² = 2` | `0 + 2 = 2`; inverse rule `0 − 2 = −2` | ✓ |
| `mk_determinantObj_of_shortExact` | `X = ∅`; `E′ = 0` | `1`; `mk det E` | `1·1`; `1·mk det E″`, `E ≅ E″` | ✓ |
| `mk_determinantObj_of_shortExact` | redundant `h₂` | `E` is locally `E′ ⊕ E″|_U` (lifts of a local basis) | finite locally free | `h₂` is implied but needed to form `⟨S.X₂, h₂⟩`; note only |
| 3.3 graded lines | `P = A`, rank 1 | parity 1, symmetry `−swap` | ungraded `+swap` | ✓ |
| 3.3 | `A = k×k`, rank `(1,2)` | parity `(1,0)` | `(∧¹, ∧²)` | ✓ |
| 3.3 | `B = diag(t,1)` over `k[t]` | `det = t` | `t⁻¹ ∉ k[t]` | inverse convention excluded ✓ |
| 3.3 | `P = 0` | `A`, parity 0 | `∧⁰ = A` | ✓ |
| 4.1 grading | `𝔸¹`, `λ·v = λv` | `t ↦ t⊗s` | weight 1 | ✓ |
| 4.1 | `𝔾_a/𝔽₂`, `λ·v = λ²v` | `(λ+μ)² = λ²+μ²`; weight 2; `A₁ = 0` | `Sym(A₁) = 𝒪 → 𝒪[t]` not onto | module scheme, not linear ✓; over ℚ `(λ+μ)² ≠ λ²+μ²` ✓ |
| 4.1 | `α_p` | `A_n = 𝔽_p tⁿ`, `n < p` | `𝔽_p[t] → 𝔽_p[t]/(t^p)` has kernel `(t^p)` | free generation needed ✓ |
| 4.1 morphisms | `v ↦ v²` on `𝔸¹` | `(λv)² = λ²v²` | `≠ λv²`; weight `1 → 2` | neither equivariant nor graded ✓ |
| 4.1 degree zero | any module scheme | `0·v = 0·v + 0·v ⇒ 0·v = 0` | `A₀ = 𝒪_X` | ✓ |
| 4.1 addition | `a ∈ A₁` | `Δa ∈ A₁⊗A₀ + A₀⊗A₁`, counit | `Δa = a⊗1 + 1⊗a` | determined by the action ✓ |
| `isFiniteLocallyFreeOfRank` | `X = ∅` / `𝒪^r` / ranks `(2,1)` | true for all `r` / rank `r` / false for every `r` | as the Conventions say | ✓ |
| `determinantObj` | `𝒪^r` / `0` / `A = diag(2,1)` | `∧^r 𝒪^r ≅ 𝒪` / `∧⁰ = 𝒪` / acts by `2` | invertible; dual convention gives `1/2` | ✓ |

**Cross-roadmap citations resolved.**
- PadicMeasuresIwasawaAlgebras §5.1 on main, README:3172–3230. It has graded lines `(L, ε)` with Koszul symmetry `(−1)^(εε′)`, parity `rank mod 2`, and "AlgebraicVectorBundles L0C supplies this comparison and its gluing on schemes" (line 3214), which agrees with §3.3 and the Conventions.
- SchemeAndStackFoundations on main: `K0.det` (Suggested.lean:2561–2566) and the four aliases. The heads #1656 and #1276 cite L0B–L0C only as a consumer (#1656 README:5197, 7498; #1276 README:4679, 6999) and own no determinant additivity.
- AdicSpacesPartIII on main, :3758–3786: F0.8 (a) and (b) as stated under Downstream consumers.
- Dropped ids, with the label lines `:312–338` mapping L0A–L2B one per line:
  - AbundanceStatement (#545:66, "L0A–C");
  - GeneralAlgebraicKTheory (#1212:17, "L0B");
  - AlgebraicModularFormsAndSerreWeightsPartII, GeometricSatakeAndFusion, PhiGammaModulesAndIwasawaCohomology, PrismaticCohomologyPartII, ExoticMonoidalStructuresAndAbstractAutomorphicity and GenericDoublePointInterpolation, taken from the overlap list.
- Of the consumers, SchemeKTheoryOperations (#1229:11) and KTheoryLowDegrees (#1248:13, 63) cite "AlgebraicVectorBundles … determinant" as supplier; see R01.
- `roadmaps resolve` gave no leads, and I found none either.

**Ownership by object.** Searched with `roadmaps grep` over main and all open heads:
- by the Stacks tags 0098, 01CD, 02N4, 0C6I, 01CH, 01CI, 0FJB and 0FJE;
- by `pullbackTensorIso` and `pullbackInternalHomIso`;
- by "determinant … short exact" and "flat pullback is exact".

The only second owners are AdicSpacesPartIII on main (settled in r8, cited here) and KTheoryLowDegrees (R01). No other open head states the Layer 4 weight grading or the sheaf exterior multiplication.

**Pull request description.** The description still describes the pull request's first commit ("Only AlgebraicVectorBundles/Suggested.lean changes … No … README scope"), but at this head the README is rewritten. This is not a finding about the folder; it is recorded for the human approver.

## Not verifiable

- **Hartshorne, *Algebraic Geometry*, II, Exercise 5.16** (§3.2 and the `determinantObj` docstring). The manifest records it as `uncertified`: it is a paywalled Springer text, cited by its locator, and was not opened. §3.2 also cites Stacks 0FJB–0FJE, which I read and which support every claim made there.
- **Ownership against SchemeAndStackFoundations #1807, #1854 and #1808.** These appear in the overlap list, but the brief gives no checkouts for them. They were covered only by the `roadmaps grep` searches above, not read.
- **§3.3's graded-line comparison and §4.1's recognition theorem.** Their carriers are absent at the pins, so nothing could be elaborated; both were checked by hand (table rows 3.3 and 4.1).

## Source issues

- none
