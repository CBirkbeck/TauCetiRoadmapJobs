# Review of NoncommutativeFlatness (pull request #2618 at e522272)

**Verdict:** needs changes

**Summary.** Changes are needed: two findings, both in `Suggested.lean` and both left over from the repair of the earlier "`sorry` data" finding. Thirty-five definitions (comparison isomorphisms, equivalences and adjunctions) still have `sorry` as their whole body, and nine further declarations are stated through them; and two helper definitions (`addToLin`, `ModCat.Bimod.liftAct`) leave as `sorry` a proof obligation that is false at the helper's generality, so the file cannot be completed as written. The earlier Morita and `mod C` ownership findings are repaired, the headline theorems now stand on real bodies, and the mathematics recomputed on degenerate cases and worked examples held everywhere I could test it. There are two small corrections and two format notes, none blocking, and four points for the human reviewers.

## R01 (P2) — Thirty-five definitions still have `sorry` as their whole body, and nine declarations are stated through them

A definition whose body is `sorry` asks an implementer for *some* term of the type, not the intended one: `def torBalanceIso … : tor n ≅ … := sorry` is met by any isomorphism, and a statement that mentions such a definition is about an unspecified map. The repair since the last round gave real bodies to every carrier (the tensor product of categories, `regularBimod`, `I · M`, the coend tensor, `tor`, `BalancedTensorProduct.functor`, `CategoryAlgebra`, the module-category functors), so the headline `TFAE` theorems are now determinate; what remains is the following.

The thirty-five, in `Suggested.lean`: `ModCat.Submodule.orderIsoSubobject` (190), `Linear.TensorProduct.singleObjEquiv` (330), `ModCat.LinearBimod.singleObjEquiv` (349), `curryLeftEquiv`, `curryRightEquiv` (360, 364), `MorphismIdeal.orderIsoSubmoduleRegularBimod` (445), `tensorObjYonedaIso`, `yonedaTensorObjIso` (677, 680), `Bimod.tensorLeftHomAdjunction` (788), `tensorObjSwapIso` (810), `changeBaseLinearEquiv` (850), `tensorObjSingleObjIso` (931), `bimodLeftHomAdjunction` (980), `projEquivKaroubiMat` (1011), `homAddEquivTensorObjProjDual` (1050), `modCatProjEquiv` (1085), `torBalanceIso` (1182), `balancedTorIsoTorSingleObj` (1199), `balancedTorSwapIso` (1207), `stableTransposeEquivalence` (1293), `stableTransposeEquivalenceObjIso` (1302), `stableHomEquivTorTranspose` (1308), `stableHomEquivBalancedTorTranspose` (1336), `torExtDualityNatIso` (1350), `balancedTorExtDualityEquiv` (1360), `balancedTorIsoTor` (1369), `torIsoTor'` (1374), `balancedTorRestrictScalarsIso` (1382), `balancedTorOneQuotientEquiv` (1395), `modCatEquivCategoryAlgebra`, `modCatOpEquivCategoryAlgebra` (1464, 1467), `torCategoryAlgebraIso` (1470), `categoryAlgebraSingleObjRingEquiv` (1480), `Module.BalancedFlat.denseAt` (1680), `restrictedYonedaEquivFlat` (1707). Stated through them: `changeBaseLinearEquiv_tmul`, `changeBaseAddEquiv`, `changeBaseAddEquiv_tmul`, `intAddEquiv`, `balancedTorIntIso`, `stableTransposeEquivalenceObjIso` (through `stableTransposeEquivalence`), `stableHomEquivTorTranspose_comp`, `torCategoryAlgebraIso` (through the two category-algebra equivalences) and `categoryAlgebraSingleObjRingEquiv_apply`. The module docstring's sentence "Every definition that later statements are about has a real body" is therefore not yet true of the file.

The smallest repair, case by case. Where only existence is the target (balance, the swap, Tor–Ext duality, the Karoubi and Morita equivalences, the adjunctions, Crawley-Boevey's equivalence), state a theorem `nonempty_…` concluding `Nonempty (… ≅ …)`, or `IsLeftAdjoint`/`Nonempty (… ⊣ …)`; `isFinitelyAccessibleCategory_iff_nonempty_equiv_flat` already does this for the representation theorem. Where the map is pinned by a formula, either write the body (the change-of-base map is `TauCeti.BalancedTensorProduct.lift` of `tmul`; the ring map of 1.7 is `a ↦ unop (a (∗, ∗))`) or state `∃ e, ∀ m n, e (m ⊗ n) = …` in one theorem. Where a second statement needs the first as data (`torCategoryAlgebraIso`, `stableTransposeEquivalenceObjIso`, the naturality of `stableHomEquivTorTranspose`), bundle them into one existence statement or leave the second as a README target.

## R02 (P2) — Two helper definitions carry a `sorry` proof obligation that is false as stated

`addToLin` (`Suggested.lean`, lines 57–60) turns any additive map `f : M →+ N` into an `R`-linear map with `map_smul' := sorry`. That obligation, `f (r • x) = r • f x` for every additive `f`, is false: for `R = M = N = ℂ` and `f` complex conjugation, `f (i • 1) = −i` and `i • f 1 = i`. Likewise `ModCat.Bimod.liftAct` (lines 691–701) builds a ℤ-bilinear map from `a ↦ T.map (M(a, -))` and `b ↦ (T.obj _).map (N(-, b))` for an arbitrary bifunctor `T`, with the four linearity proofs `sorry`; additivity in `a` and in `b` needs `T` additive in each variable, which the signature does not assume (for `T` constant at `ℤ` every `T.map` is the identity, and `𝟙 ≠ 𝟙 + 𝟙`). Each use in the file is at an instance where the obligation is true (`moduleObj`-linear maps, `ModCat.tensor`, `ModCat.tor n`), so no stated theorem is affected, but an implementer cannot discharge these `sorry`s, and until they are discharged everything built on `linearHomOpBifunctor`, `homRight`, `Bimod.tensor` and `Bimod.tor` rests on a false proposition.

The repair is local: give `addToLin` the hypothesis `(h : ∀ r x, f (r • x) = r • f x)` (or build each linear map in place, as `bimodHomModule` already does), and give `Bimod.liftAct` and `Bimod.lift` the binders `[T.Additive] [∀ G, (T.obj G).Additive]`, for which the file already declares the instances on `tensor` (lines 644–645).

## C01 — `isKrullSchmidt_iff_isIdempotentComplete_and_isSemiperfectCategory` restates a target of ArtinAlgebras §0.2

The Scope section says that Krause's criterion belongs to ArtinAlgebras §0.2, and that section on main lists it ("an additive category is Krull-Schmidt exactly when its idempotents split and its endomorphism rings are semiperfect", [Kr, Cor. 4.4]). `Suggested.lean` line 2025 states the same equivalence as a `sorry` theorem of this roadmap, so the acceptance test asks for a supplier's theorem. Citing §0.2 in 4.2 is enough; if the statement is kept so that clause (5) of `isSemiperfectCategory_tfae` can be read against it, say in its docstring that it is the supplier's statement and not a target here.

## C02 — The unfolding lemmas noted in the previous round are still in the acceptance test

`ModCat.Submodule.ext`, `LeftMorphismIdeal.ext`, `RightMorphismIdeal.ext`, `tmul_comp_tmul`, `MorphismIdeal.op_toRightMorphismIdeal`, `changeBaseAddEquiv_tmul` and `small_mulOpposite` are proved in the file in one line, and the two `comp_mem` lemmas restate `ModCat.Submodule.map_mem` after unfolding `regularBimod`. As targets they ask an implementer for nothing. Since several are now used by the real bodies, the smallest repair is to mark them as auxiliary (a section comment), or to move the ones nothing uses to the README's API bullets, which already describe them.

## N01 — `letI` in signatures

`homRightModule`, `isMoritaEquivalent_tfae` and `BalancedTor.outerSMulCommClass` still bring module structures into scope with `letI` inside the statement; a named instance argument reads and applies more easily.

## N02 — "past the pin" and "after this roadmap's pin" date the text

Scope (line 103) and 0.1 (line 360) describe `TauCeti.IsFinitelyPresentedFunctor` by when it was merged relative to the pin. "ArtinAlgebras §1.1's predicate" says the same without a time reference, and a reader at the pin cannot open the file named there.

## Questions for the author

- 3.5, Jategaonkar's domains: the Check says principal *left* ideal domains with arbitrary *right* global dimension. Is that the side of Thm. 4.10 after the roadmap's left-module convention? I could not read the article.

## Verified sound

Earlier findings at this head. R01 (Morita, `n = 0`): repaired — clause 4 of `isMoritaEquivalent_tfae` now reads `Matrix (Fin (n + 1)) (Fin (n + 1)) A`, and 0.10's Checks carry the negative control. R02 (`sorry` definitions): partly — carriers have real bodies; the remainder is R01 and R02 above. R03 (`mod C` owner): repaired — Scope now reads "`mod C` is owned by ArtinAlgebras §1.1", and the agreement under `[HasFiniteBiproducts C]` is the target `isFinitelyPresentedFunctor_iff_exists_single`. C01, C03, C04, N01, N03: repaired. C02, N02: not acted on (C02, N01 above).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.3 `regularBimod`, left ideals | `SingleObj Aᵐᵒᵖ`, `f = op b`, `g = op a` | `f ≫ g = op (b a)`; precomposition-closed sets are `A a` | left ideals, as in the Check | none |
| 0.3 `I · M` | `ℤ`, `I = 2ℤ`, `M = ℚ`; `M(h)(M(f)x)` | `2ℚ = ℚ`; `M(h ≫ f)(x)`, `h ≫ f ∈ I` | submodule; not superfluous | none |
| 0.4 coend tensor | `Hom(1,-) ⊗ F` on `1 → 2`; `ℤ/2 ⊗ (2ℤ → ℤ)` | `F(1)`; map `ℤ/2 → ℤ/2` is `0` | agrees | none |
| 0.4 `Bimod.liftAct` | `T` constant at `ℤ` | `T.map a = 𝟙` for all `a`; `𝟙 ≠ 𝟙 + 𝟙` | additivity false for general `T` | R02 |
| `addToLin` | `ℂ`, conjugation, `r = i`, `x = 1` | `f(i) = −i`; `i · f(1) = i` | obligation false | R02 |
| 0.6 swap | type of `tensorObjSwapIso` | `G ⊗_C F ≅ (opOp F) ⊗_{Cᵒᵖ} G`, well typed | body `sorry` | R01 |
| 0.10 Morita, rings | `A = ℤ, B = 0`; `A = 0, B ≠ 0`; `A = B = 0` | clause 4 needs `n + 1 ≥ 1`: corner of nonzero ring `≠ 0`; all five false; all five true | TFAE consistent | none |
| 0.10 Morita, categories | `C` empty, `D` all zero objects | `Mod`, `proj`, `Karoubi (Mat_)` all terminal; `P = Q = 0`, `Hom_D = 0` | four clauses true | none |
| 1.3 balance | types of `torBalanceIso`, `balancedTorSwapIso` | both sides derive in the second variable after the swap | consistent | R01 |
| 1.5 Tor–Ext | type of `torExtDualityNatIso` | `Hom_R(Tor_n(G,F),E)` against `Ext^n(G, F^E)`, `E` injective | well typed | R01 |
| 1.6 `Tor₁(A/I, A/K)` | `ℤ`, `(m),(n)`; `m = 0` | `lcm ℤ / mn ℤ ≅ ℤ/gcd`; `0/0 = 0` | agrees with 1.7 Checks | R01 |
| 1.7 category algebra | `SingleObj Aᵐᵒᵖ`; `1 → 2` | `(a*b)(∗,∗) = op(unop a · unop b)`; `J = k e₁₂`, `J² = 0`, `Tor₁ = J` | ring map multiplicative | R01 |
| 2.1 flatness | `Hom(-, X)`; empty relation | witness `z = 𝟙 X`; `m = 0` | flat | none |
| 2.2 f.p. flat ⇒ projective | `F = coker(d)`, `p ∘ d = 0` | `p = b a`, `a d = 0`, `a = s p`, `b s = 1` | holds without smallness | none |
| 2.3 Lazard | Stacks 058D (4); Lazard Thm 1.2 (ii),(iii) | simultaneous trivialization; factorization and filtered colimit | source supports clauses 2, 4 | none |
| 2.4 weak cokernels | `F = Hom(-, W)` | exactness at `Hom(Y,W)` is the weak-cokernel property | iff holds on representables | none |
| 2.5 Bass module | `ℤ, aᵢ = p`; `f₀ = 0`, rest `p` | `ℤ[1/p] ≠ 0`; tail from `c₁` gives `ℤ[1/p] ≠ 0` | matches `isZero_bassModule_iff` | none |
| 3.1 `flatDimension` | `F = 0`; flat `F ≠ 0`; none finite | `LT F 0 ⇔ F = 0` (`β` empty gives `F(X)`); `⊥`; `0`; `⊤` | matches Convention 7 | none |
| 3.2 Auslander's lemma | Au Thm. 1 (a) | supremum over cyclic modules, p. 68 | locator correct | none |
| 3.3 von Neumann regular | `f = f g f`; split image | image of `(g ≫ f)_*`, idempotent; conversely `e = f g`, `f = e f` | clause 5 ⇔ clause 1 | none |
| 3.3, 3.4 symmetry, Auslander | Au p. 70, Thm. 4, Cor. 5; zero ring | left Noetherian ⇒ `l.gl.dim = w.gl.dim`; `⊥ = ⊥` | hypotheses match `IsNoetherianRing A` | none |
| 3.5 kernels of flats | dimension shift | `fd coker ≤ 2 ⇒ fd ker ≤ 0`; `ker(P₁ → P₀)` flat `⇒ fd ≤ 2` | iff holds | none |
| 4.1 T-nilpotence | `SingleObj Aᵐᵒᵖ`; `k⟦X⟧` | `op a₀ ≫ ⋯ = op(a₀ ⋯ aₙ₋₁)`; `G + X F = F`, `F/G = k((X))` | left T-nilpotent, Bass p. 466 | none |
| 4.1 Nakayama (1) ⇒ (2), (2) ⇒ (1) | left ideal `I`, `I · M = M ≠ 0` | `M(q_{n+1})(x_{n+1}) ≠ 0`; `[g] = B(g ≫ fᵢ)[𝟙]` | needs only precomposition closure | none |
| 4.2 semilocal ⇔ `C/J` semisimple | `E = End(X ⊕ Y)` in `Mat_ D` | `J(E) = 0`, corners semisimple ⇒ `E` semisimple ⇒ `f = f g f` | holds | none |
| 4.2 right minimal ⇔ essential | `N + ker p = P` | lift `g : P → N`, `p g = p`, `g` iso ⇒ `N = P` | holds for projective `P` | none |
| 4.4 projective covers | Bass Lemma 2.6, p. 473 | `ker(P → A) ⊆ NP`, superfluous | route agrees with source | none |
| 4.5 Theorem P, rings | Bass (1)–(7), pp. 467–468; zero ring | left T-nilpotent; DCC principal right ideals; right socle; (4) is the `pd ≤ n` clause | sides and numbering agree | none |
| 4.5 Theorem P, categories | empty `C`; `SingleObj Aᵐᵒᵖ` | all clauses true; `q_m ≫ t = q_n` is `a₀⋯aₙ₋₁ ∈ a₀⋯a_{m−1}A` | consistent with ring form | none |
| 4.5 examples | linear `A_∞`; Lam's ring | `0 → n` never `0`, opposite sequences descend; `E₀₁⋯Eₙ₋₁,ₙ = E₀ₙ`, `aₙ⋯a₀ = 0` | left/right as claimed | none |
| 4.6 Bass–Eilenberg | Bass p. 475; Au Cor. 9 | `Tor_n(R/N, A) ≅ Pₙ/NPₙ`; semiprimary symmetry p. 73 | agrees | none |
| Crawley-Boevey `iff` | `𝒜` all zero objects | accessible; `Flat(C) = 0` | consistent; carriers real | none |

- Source locators checked against the text: 24 (Bass 8, Auslander 1955 5, Lazard 4, Chase 3, Krause 3 by number in the arXiv version, Stacks 1), all correct.
- Library declarations opened at the pins: 46 cited Tau Ceti names resolved (for example `TauCeti.exists_isProjectiveCover`, `Algebra/Module/ProjectiveCover/Existence.lean` line 182, in the submodule form Convention 12 quotes; `TauCeti.globalDimension`, `RingTheory/GlobalDimension.lean` line 70; `NatTrans.leftDerived_add`, `CategoryTheory/Abelian/LeftDerived.lean` line 260); none missing. No von Neumann regular, semilocal, T-nilpotent or left perfect class exists at either pin.
- Cross-roadmap citations resolved on main: ArtinAlgebras §§0.2, 0.3, 1.1, 7.1, 7.2, 7.5; OperatorKTheory §8.2; DerivedModuleAlgebra.
- Elaboration of `Suggested.lean` at the pins: no errors, 207 `sorry` warnings, nothing else. Elaborated types compared with the README for 19 theorems of Layers 2–4: `EssentiallySmall` is present wherever the README assumes it. Five one-step probes (`infer_instance`) on `sorry` instances all failed, so none of those is already in the library.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no change outside the roadmap folder.
- Headline theorems: Theorem P (categories and rings), the flatness and Lazard `TFAE`s, Crawley-Boevey's `iff`, Auslander's theorem, both Morita theorems and the von Neumann regular `TFAE`s are stated on real bodies; balance and Tor–Ext duality are stated as `sorry` definitions (R01).
- Overlap check: read ArtinAlgebras (main), QuiverRepresentations (main), LocallyPresentableCategories (open); `mod C` on additive categories — owner ArtinAlgebras §1.1, cited; Krull–Schmidt categories and Krause's criterion — ArtinAlgebras §0.2, cited and restated (C01); projective covers of finitely generated functors over Krull–Schmidt categories — ArtinAlgebras §1.5, generalized in 4.2; finitely accessible `≌ Ind` in the set-valued form — LocallyPresentableCategories §1.5, this roadmap the additive `Flat(C)` form; nothing else shared.
- Source independence: 9 passages compared with 6 sources (Bass, Auslander, Lazard, Chase, Krause, Stacks), none shared; largest share Mitchell, 17 of about 175 locators; contents compared with Mitchell: not readable; by the section numbers the README cites (§§1–3, 6, 10, 11 in Layer 0, §7 in Layer 1, §10 in Layer 2, §§9, 36 in Layer 3) the layers are not a run of its sections.
- Research link: The headline targets are Bass's Theorem P (Bass 1960) with its categorical form (Simson 1977, Harada 1973), Crawley-Boevey's representation theorem (1994) and Auslander's global-dimension theorems (1955); the README names flat-dominant dimension (Hoshino 1989, Xi 2021) as a user. Rests on the README and on Bass and Auslander read at their locators.

## Not verifiable

- Mitchell, Oberst–Röhrl, Stenström, Fisher (both), Jategaonkar, Pierce: the publisher's archive is not fetched; locators in 0.1, 0.3, 0.4, 0.10, 1.7, 2.1–2.4, 3.2, 3.3, 3.5, 4.3 not read.
- Simson, Harada, Crawley-Boevey, Lambek, Jensen, Beligiannis, Eilenberg, Sandomierski: no copy could be fetched from a legal host; locators in 0.7, 0.8, 0.10, 1.5, 2.2, 2.4, 2.5, 3.5, 4.1, 4.2, 4.4–4.6 not read.
- Lam (both books), Anderson–Fuller, Weibel, Cartan–Eilenberg, Wisbauer, Mac Lane, Auslander–Bridger: books, not available; locators in 0.2, 1.3–1.5, 3.1, 3.3, 4.1–4.5 not read.
- 4.3, step 1: that the proofs of [Fisher-Nil, Thms. 1.5, 2.1] and [AF, Thm. 29.2] use only closure under products could not be checked against either text.
- The file `TauCeti/CategoryTheory/FinitelyPresentedFunctor/Basic.lean` named in Scope is not at the pin; its content was not read.
- 0.6 carries no source locator; checked by computation only.

Automatic checks set aside as false positives: four names reported as undeclared are two Tau Ceti declarations that exist at the pin, a field of Tau Ceti's balanced tensor product, and the notation `Tor_0`; six reports of TeX syntax are inside code spans that wrap over a line break; the subsection "Layer 4 checks" is read as a layer heading; the Prop-valued instances and the `sorry` proof fields of definitions with real data are not `sorry` data.

## Source issues

- none

## For the human reviewers

- **Scope.** Clause 4″ of the categorical Theorem P (right socle and orthogonal idempotents, README lines 1306–1308) is, in the README's words, this roadmap's own extension of Bass's clause (7); no refereed source states it.
- **Scope.** `Module.End.exists_prod_eq_zero_of_isNilpotent` (4.3) is stated for multiplicatively closed nil sets; the README (lines 1247–1250) says its two sources state it for nil subrings and nil one-sided ideals.
- **Scope.** The README plans changes to existing Tau Ceti declarations "without shims" (`IsSuperfluous`, `globalDimension`, `IsSemiperfectRing`, and the body of ArtinAlgebras §1.1's `IsFinitelyPresentedFunctor`; lines 101–125, 1392–1405).
- **Not tested.** Mitchell, *Rings with several objects*, has the largest share of locators (17); neither its text nor its contents page could be read, so wording and arrangement were not compared with it.
