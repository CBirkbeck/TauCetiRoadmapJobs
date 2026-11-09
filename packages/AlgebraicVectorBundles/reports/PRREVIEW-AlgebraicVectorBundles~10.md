# Review of AlgebraicVectorBundles (pull request #1221 at 1ac6358)

**Verdict:** needs changes

## R01 (P3) — The §2.2 route for finite presentation of pullback takes "restriction is pullback" from no named declaration

**Location.** `TauCetiRoadmap/AlgebraicVectorBundles/README.md:488–491` (§2.2, first target): "Restriction to an open is pullback along its inclusion, so `SheafOfModules.pullbackComp`, applied to the two factorisations of `f⁻¹(V) → Y`, identifies the restriction of `f^* M` to `f⁻¹(V)` with the pullback of `M|_V`". The *Needs:* line is at `:496–498`.

**Claim.** The route's first step has no supplier.
- Mathlib's `SheafOfModules.IsFinitePresentation` stores its local presentations as presentations of `M.over (X i)`.
- `M.over V` is the restriction to the slice site `Over V` (`SheafOfModules.overFunctor`, a pushforward along `Over.forget V`). It is not a pullback along an inclusion of ringed spaces.
- So the route must identify `M.over V` with a pullback before `SheafOfModules.pullbackComp` can apply. Neither the route nor the *Needs:* line names a declaration for this.
- At the pins this identification exists only for schemes: Mathlib's `Scheme.Modules.restrictFunctorIsoPullback` and `Scheme.Modules.overEquiv`, which Tau Ceti assembles into `pullbackOverObjIso`. It takes a 15-line construction there, so it is a real step, not a remark.

**Witness.** Tau Ceti `AlgebraicGeometry/Modules/Pullback/Basic.lean:458`: `pullbackOverObjIso (M : Y.Modules) : (pullbackOver f V).obj (M.over V) ≅ ((pullback f).obj M).over (f ⁻¹ᵁ V)`. This is for schemes only. Mathlib `Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean:205`: the field `presentation (i : I) : (M.over (X i)).Presentation`.

**Repair.**
- After "Restriction to an open is pullback along its inclusion", insert: "(`SheafOfModules.IsFinitePresentation` restricts on slice sites: `M.over V` is left adjoint to pushforward along `Over.star V`, by Mathlib `SheafOfModules.overPushforwardOverAdj`, hence it is the pullback along `Over.star V`; and `TopologicalSpace.Opens.overEquivalence` identifies `Over V` with the open subspace `V`)".
- Add `SheafOfModules.overFunctor`, `SheafOfModules.overPushforwardOverAdj` and `TopologicalSpace.Opens.overEquivalence` to the *Needs:* line.

**Tested.**
- In a scratch file, `SheafOfModules.overPushforwardOverAdj V : SheafOfModules.overFunctor (ringCatSheaf 𝒪X) V ⊣ SheafOfModules.pushforward (SheafOfModules.pushforwardOver V)` elaborates for `X : TopCat`, `V : Opens X`. The instance `HasBinaryProducts (Opens X)` is found.
- On the §2.2 Check (`M = 𝒪_Y/(t)` on `𝔸¹_k`, pulled back to the origin), the presentation `𝒪 —t→ 𝒪 → M → 0` is stored as a presentation of `M.over ⊤`. This adjunction is what makes `(f^* M).over ⊤` a pullback of it, so that `SheafOfModules.Presentation.map` applies.

## R02 (P3) — `isFiniteLocallyFreeOfRank` and the rank-of-powers lemmas are cited without their pinned names

**Location.**
- `README.md:145`: "`isFiniteLocallyFreeOfRank` is finite local freeness of constant rank `r`".
- `Suggested.lean:72–76`, the definition and its docstring.
- `README.md:82–84`: "the ranks of powers of a finite locally free `E` at a point `x`, `(rank E x).multichoose n` for `Symⁿ E` and `(rank E x).choose n` for `∧ⁿ E`, as simp lemmas".

**Claim.**
- `isFiniteLocallyFreeOfRank X r E` is Tau Ceti's `FiniteLocallyFreeSheaf.isConstantRank X r` (VectorBundle/FixedRank.lean:52), read on `X.Modules`.
- The README presents it as a notion of this roadmap and never names the pinned one. The module docstring (`Suggested.lean:29–31`) calls all four names "Tau Ceti notions" without saying which notion this one is.
- Only the consumer on main (SchemeAndStackFoundations `Suggested.lean:1872`) keeps the definition. So the README must cite the pinned notion by name, as it does for the other three names.
- Separately, this head replaced the two rank lemmas, named at the previous head, by a prose description.

**Witness.**
- In a scratch file, `example … : isFiniteLocallyFreeOfRank X r E ↔ ∃ h, FiniteLocallyFreeSheaf.isConstantRank X r ⟨E, h⟩ := Iff.rfl` elaborates.
- `#check` gives `FiniteLocallyFreeSheaf.rank_symmetricPower_apply : … rank x = (E.rank x).multichoose n` and `…rank_exteriorPower_apply : … = (E.rank x).choose n`.

**Repair.**
- At `README.md:145`, write: "`isFiniteLocallyFreeOfRank X r E` is Tau Ceti's `FiniteLocallyFreeSheaf.isConstantRank X r` (VectorBundle/FixedRank.lean) read on `X.Modules`: `E` is finite locally free and has constant rank `r`".
- Add the same clause to the docstring at `Suggested.lean:72–73`, and leave the body unchanged so that main's consumer still builds. Like the other three names, it then needs no Checks of its own.
- In the Scope bullet at `:82`, put the names `FiniteLocallyFreeSheaf.rank_symmetricPower_apply` and `FiniteLocallyFreeSheaf.rank_exteriorPower_apply` before the two formulas. Both resolve at the pin, and both were in the README at the previous head, when the gate passed.

**Tested.**
- On `X = Spec k ⊔ Spec k` with ranks `(2, 1)`, both predicates fail for every `r`.
- On `𝒪_X^r` over a nonempty `X`, both hold exactly at `r`.
- On `X = ∅`, both hold for every `r`.

## Verified sound

**Repairs of the previous review (r9, at 03e04c2), finding by finding.**

| r9 finding | Passage at this head | Status |
| --- | --- | --- |
| R01 KTheoryLowDegrees as a second owner of §3.2 and §3.3 | `README.md:820–825`: "KTheoryLowDegrees §4.1 takes the determinant of a short exact sequence … from §3.2, and the comparison … from §3.3" | repaired: this roadmap keeps ownership and names the consumer (see the cross-roadmap note below) |
| R02 finite presentation of `f^* M` on ringed spaces | `:484–510`: new target (Stacks Tag 01BQ) with a route, a *Needs:* line and three Checks; the §2.2 *Needs:* (`:541–549`) names it for the stalk route and keeps `Scheme.Modules.isFinitePresentation_pullback` for the scheme route only | repaired; one step of the new route is unnamed (R01 above) |
| R03 exterior multiplication: locator, *Needs:*, Checks | `:635–659`: "(Stacks Project, Tags 01CF and 01CG)"; a route through `exteriorPower.wedge` and the monoidal sheafification; *Needs:* with six declarations; three Checks (`e₂·e₁ = −e₁∧e₂`, the sign `(−1)^(2·1) = +1`, `a = 0` and `∧²L = 0`) | repaired |
| R04 *Needs:* omissions | §2.1 *Needs:* (`:469–472`) names `TopCat.Sheaf.exact_iff_stalkFunctor_map_exact`, `SheafOfModules.toSheaf`, `ShortComplex.exact_map_iff_of_faithful` and `preservesFiniteColimits_toSheaf`; §3.2 (`:690–699`) names `LineBundleClass.mk_tensorProduct` in both the sentence and the *Needs:* line | repaired |
| R05 catalogue in the module docstring | `Suggested.lean`: the paragraph of nine consumed names is gone; the docstring now says what the file is, the four consumer names and the four unstatable headlines | repaired |

**Gate, build and merge.**
- My rerun of `gate … --base origin/main` printed `gate AlgebraicVectorBundles: set_option=0 … outside-folder=0 source-material=0 OK`, with exit code 0.
- `lake env lean` on `Suggested.lean` gives exactly five warnings, `declaration uses 'sorry'`, at lines 97, 117, 131, 149 and 167, and nothing else.
- The diff outside the folder is empty.
- `HEAD` merges cleanly with `origin/main` (bbbde05a), and no commit on main since the merge base touches this folder.
- `PROGRESS.md`, `STATUS.md` and `metadata.toml` are byte-identical to main.

**Dependency check (verbatim).** `depcheck: 238 roadmaps, 2353 edges, 0 problem(s)`.
- This roadmap is on main and is not in ORDER.txt.
- Its only roadmap supplier is PadicMeasuresIwasawaAlgebras §5.1, on main. That roadmap's README:323–333 names this roadmap as the owner of the sheaf construction and says "§5.1 imports no scheme-level construction", so there is no reverse edge.

**Signatures.** One scratch file holds `#check @name` for all nine declarations.
- Every elaborated type equals its README statement, and no binder was lost.
- The flat Hom theorem keeps `[Flat f] [M.IsFinitePresentation] [M.IsQuasicoherent]`.
- The three ringed-space theorems keep `[(SheafOfModules.pushforward φ).IsRightAdjoint]`.
- `mk_determinantObj_of_shortExact` keeps `hS`, `h₁`, `h₂` and `h₃`.
- The worker's `signatures.md` lists 11 entries. Two of them (`` `f.base`, `` and `of`) are parser artefacts of docstring text.

**Padding probe.** I made 20 attempts on scratch copies: `infer_instance`, `simp`, `rfl`, and `exact LineBundleClass.mk_eq_mk_iff.mpr ⟨Iso.refl _⟩`, each on all five theorems. None closed a goal; the errors were `synthInstanceFailed`, "simp made no progress", "unsolved goals", `rfl` failures and type mismatches.
- The four definitions are kept because main's SchemeAndStackFoundations `Suggested.lean` imports this module (line 2) and uses them at lines 1872, 2535, 2537, 2550 and 2565.
- The open heads #1656 and #1276 of that roadmap no longer import it.

**Headline theorems.** From the Summary (`README.md:15–25`):
- `f^*(E⊗F) ≅ f^*E ⊗ f^*F` on ringed spaces: stated (`pullback_tensor_isIso`).
- Flat base change of internal Hom: stated on schemes (`isIso_pullbackIhomComparison_app_of_flat`). The ringed-space comparison is data built from `inv δ`, so it is named as not statable.
- `f^*Symⁿ` and `f^*∧ⁿ`: stated (`symmetricPower_pullback_isIso`, `exteriorPower_pullback_isIso`).
- `det E′ ⊗ det E″ ≅ det E`: the isomorphism is data, so only its Picard-class form is stated (`mk_determinantObj_of_shortExact`). The isomorphism and the sign law are named as not statable. Tau Ceti has no determinant of a biprod: `VectorBundle/Determinant/` holds only Basic, LocallyConstantRank and Pullback.
- The graded-line comparison and the module-scheme recognition are named as not statable, with the missing carriers.
- No statable headline is absent.

**Library declarations.** Each newly cited name was checked with `#check` at Mathlib 1b1ccf4b and Tau Ceti 2fd255d9; all 22 resolve. `SheafOfModules.symmetricPowerMul` resolves once SymmetricPower/Mul.lean is imported.

| Declaration | File and line at the pin | What it says |
| --- | --- | --- |
| `SheafOfModules.pullbackIso` | Mathlib ModuleCat/Sheaf/PullbackContinuous.lean:105 | `pullback φ ≅ forget ⋙ PresheafOfModules.pullback ⋙ sheafification`, as §1.1's route says |
| `SheafOfModules.Presentation.map` | Mathlib …/Sheaf/Quasicoherent.lean:176 | needs `PreservesColimitsOfSize F` and `unit S ≅ F.obj (unit R)` |
| `SheafOfModules.pullbackObjUnitToUnit` | Mathlib …/Sheaf/PullbackFree.lean:86, iso instance `[F.Final]` at :101 | the README gives finality of `Opens.map` from `⊤ ↦ ⊤` (posets: every object maps to `⊤`) |
| `SheafOfModules.toSheaf` | Mathlib …/Sheaf.lean:88 (faithful :125), …/Limits.lean:117 (`PreservesFiniteLimits`) | as §2.1 says |
| `TauCeti.SheafOfModules.preservesFiniteColimits_toSheaf` | Tau Ceti …/Sheaf/Exactness.lean:90 | as §2.1 says |
| `ShortComplex.exact_map_iff_of_faithful` | Mathlib Algebra/Homology/ShortComplex/Exact.lean:233 | needs preservation of left and right homology, supplied by the two lines above |
| `TopCat.Sheaf.exact_iff_stalkFunctor_map_exact` | Mathlib Topology/Sheaves/Abelian.lean:103 | `TopCat.Sheaf C X` is an abbrev for `Sheaf (Opens.grothendieckTopology X) C` (Sheaf.lean:107) |
| `TauCeti.SheafOfModules.sheafificationMonoidal`, `…Braided` | Tau Ceti …/Sheaf/TensorProduct/Monoidal.lean:125, :133 | namespace `TauCeti.SheafOfModules`, as cited |
| `TauCeti.SheafOfModules.exteriorPower_hom_ext` | Tau Ceti …/Sheaf/ExteriorPower/Basic.lean:376 | namespace `TauCeti.SheafOfModules`, as cited |
| `SheafOfModules.symmetricPowerMul` | Tau Ceti …/Sheaf/SymmetricPower/Mul.lean:66 | built from `μ` of sheafification, the pattern §3.2 follows for `∧` |
| `LineBundleClass.mk_tensorProduct` | Tau Ceti LineBundle/Class.lean:119 | `mk (L.tensorProduct K) = mk L * mk K` |
| `Scheme.Modules.isFinitePresentation_pullback` | Tau Ceti Modules/Pullback/Basic.lean:642 | schemes only, so the ringed-space target of §2.2 is new |
| `FiniteLocallyFreeSheaf.isConstantRank` | Tau Ceti VectorBundle/FixedRank.lean:52 | see R02 |

Absence claims confirmed at the pins:
- No sheaf exterior multiplication: Tau Ceti `Sheaf/ExteriorPower/` holds Basic, Free, LocallyFree, Pullback and Restriction, and no `exteriorPowerMul` exists in Mathlib or Tau Ceti.
- No finite presentation of pullback along ringed spaces: the only `IsFinitePresentation` pullback results are for schemes.

**Sources: the seeded sample.** Each locator was read in the cached Stacks chapter texts. No README locator is flagged as unverified.

| Target | Locator | Text read | Result |
| --- | --- | --- | --- |
| 1.1 | Tag 0098 | stacks-0098 line 1441 (Sheaves, Lemma 26.4): `(f^*G)_x = G_{f(x)} ⊗ 𝒪_{X,x}` for any morphism of ringed spaces | supports §1.1 (roles of `X`, `Y` swapped, consistently) |
| 1.2 | Tag 01CD | stacks-01CD line 1036 (Modules, Lemma 16.4): `f^*(F⊗G) = f^*F ⊗ f^*G`, functorial, no hypothesis | supports |
| 2.1 | Tags 02N4, 02N3, 01AG | lines 1353 (Lemma 20.2, p. 28–29), 1346 (Def. 20.1), 97 (Lemma 3.1: exactness on stalks) | supports; the stalk route matches |
| 2.2 | Tags 01BQ, 0C6I | line 672 (Lemma 11.5): pullback of a finitely presented module is finitely presented, for any morphism of ringed spaces, by pulling back presentations; line 1521 (Lemma 22.5, p. 32): `F` finitely presented, `f` flat, `G` arbitrary, stalk proof | supports both targets as stated |
| 3.1 | Tags 01CH, 01CI | line 1398 (Lemma 21.2): stalks of Sym and ∧; line 1404 (Lemma 21.3, p. 30): pullback commutes with T, Sym and ∧ for every `F` | supports |
| 3.2 | Tags 01CF, 01CG, 0FJB–0FJE | line 1375 (Section 21): `∧(F)` is a graded-commutative algebra; line 1390 (Lemma 21.1): `∧ⁿF` is the sheafified sectionwise `∧ⁿ`; line 17149 (Lemma 120.2, p. 370): γ with the sub first; 17174 naturality; 17200 filtration; 17213 (Lemma 120.5): swap with `ε = det(−id_{M′⊗M″}) = (−1)^(ab)` | supports, sign included |
| 3.3 | Tag 01I8 | line 502 (Schemes, Lemma 7.2(2), p. 11): `(∧ⁿM)~ ≅ ∧ⁿ(M~)` | supports the constant-rank case |
| 4.1 | Tags 0EKK, 062M, 062N | line 1138 (Groupoids, Lemma 12.4, p. 25): the proof uses only `x = 1` and the action identity; line 350 (Def. 6.2): `E₀ = 𝒪`, `Symⁿ E₁ ≅ Eₙ`, footnote waiving finiteness; line 364 (Lemma 6.3) | the argument carries over to the monoid `𝔸¹` with polynomials; supports |

**Adversarial pass.** One row per statement; values are computed on each side.

| Statement | Instance | Left side | Right side | Result |
| --- | --- | --- | --- | --- |
| 1.1 stalk map | `G = 𝒪`, origin `↪ 𝔸¹_k` | `(f^*𝒪)_pt = k` | `k ⊗_{k[t]_(t)} k[t]_(t) = k`; `f⁻¹G` gives `k[t]_(t)` | iso; wrong model excluded |
| 1.1 | `G = j_!𝒪_U`, `U = D(t)`; `x ∈ U` / origin | `κ(x)` / `0` | `κ(x) ⊗ 𝒪_x = κ(x)` / `κ(0) ⊗ 0 = 0` | iso |
| 1.2 `pullback_tensor_isIso` | `Spec 𝔽_p → Spec ℤ`, `E = F = ℤ/p²` | `f^*(ℤ/p²) = 𝔽_p` | `𝔽_p ⊗ 𝔽_p = 𝔽_p` | iso without flatness |
| 1.2 | `E = F = j_!𝒪_U` to `x ∈ U` / origin | `κ(x)` / `0` | `κ(x) ⊗ κ(x)` / `0` | iso; not the pinned quasi-coherent case |
| 1.2, need for `Opens.map` | discrete `{a,b} → {*}`, coefficients `k`, `E = F = 𝒪` | `f^*(k,k) = k²` | `k² ⊗ k² = k⁴` | not iso, and that functor is not final; the Lean form is for `Opens.map f` |
| 2.1 exactness | flat `Spec k[t]_(t) → 𝔸¹`, `j_!𝒪_U ↪ 𝒪` | closed point `0 → k[t]_(t)`; generic point `k(t) = k(t)` | injective | as stated; the route through `toSheaf` (faithful, finite limits and colimits) holds |
| 2.1, flatness needed | origin `↪ 𝔸¹`, `t : 𝒪 → 𝒪` | `0 : k → k` | not injective | Check correct |
| 2.2 finite presentation of `f^*M` | `M = 𝒪/(t)` to the origin | `k —0→ k → k → 0` | `f^*M = k`; stalk `k ⊗ k = k` by §1.1 | finitely presented, as stated |
| 2.2 | `M = 𝒪^n`; `M = 0` | `f^*𝒪^n ≅ 𝒪^n` (`pullbackObjUnitToUnit`, `Opens.map` final); `0` | `𝒪_X^n`; `0` | as stated |
| 2.2 coherence Check | `A = k[x,y₁,y₂,…]/(x yᵢ)` over `k` | `ann(x) = (y₁, y₂, …)`, image `(y₁, y₂, …) ⊂ k[y₁, …]` not finitely generated | `(x) ≅ A/ann(x)` not finitely presented, so `A` is not coherent | Check correct: the coherent analogue fails |
| 2.2 Hom, flatness needed | `M = 𝒪/(t)`, `N = 𝒪`, origin | `f^*Hom(M,𝒪) = 0` | `Hom(k,k) = k` | not iso |
| 2.2 Hom, finite presentation needed | `M = 𝒪^(ℕ)`, `N = 𝒪`, `Spec ℚ → Spec ℤ` | `colim_m ∏ℤ[1/m]` | `∏ℚ`; `(1/pᵢ)` not hit | not surjective |
| 2.2 Hom, non-quasi-coherent `N` | `M = 𝒪/(t)`, `N = j_!𝒪_U ⊕ 𝒪/(t)`, localization at `0` | `k` at the closed point, `0` at the generic point | `t`-torsion of `f^*N`: `k`, `0` | iso; outside Tau Ceti's theorem |
| 3.1 powers | `n = 0` | `f^*𝒪_Y` | `𝒪_X` | iso (`pullbackObjUnitToUnit`) |
| 3.1 | `M = 𝒪²`, at a point, `n = 2, 3` | `k·e₁∧e₂`; `0` | `k·e₁∧e₂` (sign `+`); `0` | as stated |
| 3.1 | `M = j_!𝒪_U`, `Sym²`, `x ∈ U` / origin | `κ(x)` / `0` | `κ(x)` / `0` | as stated; not quasi-coherent |
| 3.1 / R02 ranks | `E = 𝒪²` | `rank Sym² = 3`, `rank ∧² = 1`, `rank ∧³ = 0` | `multichoose 2 2 = 3`, `choose 2 2 = 1`, `choose 2 3 = 0` | the formulas match the pinned lemmas |
| 3.2 exterior multiplication | `𝒪²`, `a = b = 1` | `e₂·e₁ = −e₁∧e₂`; `e₁·e₁ = 0` | `(−1)^(1·1) = −1`; a commutative product gives `+` | Check discriminates |
| 3.2 | `𝒪³`, `a = 2`, `b = 1` | `(e₂∧e₃)·e₁ = e₂∧e₃∧e₁ = +e₁∧e₂∧e₃` | `(−1)^2 = +1`; the rule `(−1)^(a+b)` gives `−1` | Check discriminates |
| 3.2 | over `𝔽₂`; invertible `L` | sign `+1` but `e₁·e₁ = 0`; `∧¹L ⊗ ∧¹L → ∧²L = 0` | `Sym²`: `e₁² ≠ 0`; `L ⊗ L ≅ Sym²L` | separates `∧` from `Sym` |
| 3.2 γ | Euler `0 → 𝒪(−1) → 𝒪² → 𝒪(1) → 0` on `ℙ¹` | `det 𝒪² = 𝒪`, degree `0` | `−1 + 1 = 0`; the wrong rule gives `−2` | as stated; non-split since `H⁰(𝒪(−1))² = 0` |
| 3.2 γ orientation | `0 → 𝒪 → 𝒪² → 𝒪 → 0`, `1 ↦ e₁` | `e₁ ∧ (e₂ + c e₁) = e₁∧e₂` | quotient first gives `−e₁∧e₂` | Check discriminates |
| 3.2 sign of the sum | `E = F = 𝒪` | `det(swap)`: `e₁∧e₂ ↦ −f∧e` | `comm` (`+`) times `ε = (−1)^1`: `−f⊗e` | agrees with 0FJE |
| 3.2 | `E = 𝒪²`, `F = 𝒪` | 3-cycle, `det = +1` | `(−1)^2 = +1`; `(−1)^(a+b) = −1` | Check discriminates |
| `mk_determinantObj_of_shortExact` | `0 → 𝒪 → 𝒪(1)² → 𝒪(2) → 0` on `ℙ¹` | `deg det 𝒪(1)² = 2` | `0 + 2 = 2`; inverse rule `−2` | as stated |
| `mk_determinantObj_of_shortExact` | `X = ∅`; `E′ = 0` | `1`; `mk det E` | `1·1`; `1·mk det E″`, with `E ≅ E″` | as stated; `h₂` is implied but needed to form `⟨S.X₂, h₂⟩` (remark only) |
| 3.3 graded lines | `P = A`, rank 1 | parity `1`, symmetry `−swap` | ungraded `+swap` | the sign is kept |
| 3.3 | `B = diag(t,1)` over `k[t]` | `det = t` | `t⁻¹ ∉ k[t]` | inverse convention excluded |
| 4.1 grading | `α_p`, `t ↦ λt` | `A_n = 𝔽_p tⁿ`, `n < p` | the counit `𝔽_p[t] → 𝔽_p[t]/(t^p)` has kernel `(t^p)` | free generation needed |
| 4.1 | `𝔾_a/𝔽₂`, `λ·v = λ²v` | `(λ+μ)² = λ²+μ²`; weight `2`, `A₁ = 0` | `Sym(A₁) = 𝒪` is not `𝒪[t]` | module scheme, not linear; over `ℚ` not distributive |
| 4.1 degree zero | any module scheme | `a ∈ A₀`: `a(v) = a(0·v) = a(0_V)` | `A₀ = 𝒪_X` | as stated |
| `isFiniteLocallyFreeOfRank` (R02) | `X = ∅` / `𝒪^r` / ranks `(2,1)` | every `r` / exactly `r` / no `r` | `isConstantRank`: the same, by `Iff.rfl` | equal to the pinned notion |

**Cross-roadmap citations resolved.**
- **KTheoryLowDegrees** at its open head 4d2f327. §4.1 (README:454–462) cites "AlgebraicVectorBundles L0C" for the determinant, puts the sub first ("in that order") and uses the Euler example on `ℙ¹`. These agree with the consumer paragraph here.
  - That head still states at README:460 "Prove exact-sequence additivity … Construct it from the exterior extension filtration; prove naturality, arbitrary pullback". So the double statement persists on that side.
  - This roadmap is on main, holds the ownership and names the consumer. Deleting the restatement is a repair for KTheoryLowDegrees, not for this folder.
- **AdicSpacesPartIII** on main: *internal-hom-sheaf-of-modules* is at README:3746, inside §F0.8 (heading at :3525). Its parts (a) and (b) are §1.2 and §2.2, as the Downstream consumers paragraph says.
- **PadicMeasuresIwasawaAlgebras** §5.1 on main, README:3172 onwards. It has the Koszul sign `(−1)^{|L||L′|}`, parity `rank mod 2` and `projectiveDeterminant`, as the Conventions and §3.3 assume.
- **SchemeAndStackFoundations** on main: `K0.det` at Suggested.lean:2562–2565 is built on `determinantObj`.
- **Dropped ids.** The dropped ids cited by AbundanceStatement (#545 README:66, "L0A–C", anchor `#layers`) and GeneralAlgebraicKTheory (#1212 README:17, "L0B") resolve through the label lines at `README.md:330–357`. The overlap list shows no other open pull request changing this roadmap, and no id here cited from a revision.

**Ownership by object.** I ran `roadmaps grep` over main and all open heads for Tags 01BQ, 01CF, 01CG, 0FJB, 02N4 and 0C6I, for "exterior multiplication", and for finite presentation of a pullback.
- SpinRepresentations' "exterior multiplication" is `w ∧ −` on `ExteriorAlgebra ℂ W`, a different object.
- ComplexComparisonPartII (#848 README:759) only cites L0A.
- No second owner of the two targets new at this head.

**Pull request description.** The description still describes the pull request's first commit ("Only AlgebraicVectorBundles/Suggested.lean changes"), while this head rewrites the README. This is recorded for the human approver; it is not a finding about the folder.

## Not verifiable

- **Hartshorne, *Algebraic Geometry*, II, Exercise 5.16** (§3.2 and the `determinantObj` docstring). The manifest records it as `uncertified` (paywalled), so it was not opened. Every claim it is cited for is also cited to Stacks Tags 0FJB–0FJE, which I read.
- **Ownership against SchemeAndStackFoundations #1807, #1854 and #1808.** These appear in the vocabulary-overlap list without checkouts in the brief. They were covered only by the `roadmaps grep` searches above.
- **§3.3 and §4.1.** Their carriers (graded lines, the weight grading) are absent at the pins, so nothing could be elaborated; they were checked by hand (table rows 3.3 and 4.1).

## Source issues

- none
