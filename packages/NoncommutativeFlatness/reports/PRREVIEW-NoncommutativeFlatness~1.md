# Review of NoncommutativeFlatness (pull request #2618 at b72356a)

**Verdict:** needs changes

**Summary.** Changes are needed: three findings. The Morita theorem for rings in `Suggested.lean` is false as stated (its matrix-corner clause holds with `n = 0` for `A = ℤ`, `B` the zero ring); most headline theorems are stated through definitions whose bodies are `sorry`, so they do not yet say anything definite; and the finite-presentation predicate of 0.1 is presented as replacing a Tau Ceti definition that does not exist at the pin, while the object is owned by ArtinAlgebras §1.1 on main. The README's mathematics, recomputed on its worked examples and degenerate cases, held up everywhere else I could test it. There are four small corrections and three format notes, none blocking, and three points for the human reviewers.

## R01 (P2) — The ring Morita theorem `isMoritaEquivalent_tfae` is false: its matrix-corner clause allows `n = 0`

The fourth clause of `isMoritaEquivalent_tfae` (`Suggested.lean`, lines 709–710) asks for some `n : ℕ`, an idempotent `e` of `Matrix (Fin n) (Fin n) A` with `TwoSidedIdeal.span {e} = ⊤`, and `B ≃ₐ[R] he.Corner`. For `n = 0` the matrix ring is the zero ring, so `e = 0` is idempotent, `span {0} = ⊤` because the ring is a subsingleton, and the corner is the zero ring. Hence the clause holds for every `A` when `B` is the zero ring. I checked this in Lean at the pins for `R = A = ℤ`, `B = PUnit`: the clause is proved with `n = 0`, `e = 0`. The first clause, `IsMoritaEquivalent ℤ ℤ PUnit`, is false: every module over the zero ring is zero, while `ModuleCat ℤ` has nonzero objects. So the `List.TFAE` fails at (1) ⇔ (4).

The README's sentence in 0.10 ("full-idempotent matrix corners") is fine as prose; only the Lean statement lost the hypothesis. The smallest repair is to quantify over `n` with `0 < n` (or index by `Fin (n + 1)`), and to add the instance `A = ℤ`, `B = 0` to the Checks of 0.10 as a negative control.

## R02 (P1) — Most headline theorems are stated through definitions whose bodies are `sorry`

`Suggested.lean` is the acceptance test, and a theorem that mentions a `sorry`-bodied definition has no determinate statement: any implementation of the missing data satisfies the type. About 110 definitions and instances in the file have `sorry` in their bodies. The Prop-valued instances among them (for example `EnoughProjectives (ModCat C)`, line 107) are theorems in disguise and are not the problem. The data ones are, and the headlines rest on them:

- `ModCat.regularBimod` (lines 318–322) has `map := sorry`. `LeftMorphismIdeal` and `RightMorphismIdeal` are its one-sided submodules, so `LeftMorphismIdeal.IsTNilpotent`, `IsLeftPerfectCategory` (line 1646), `isTNilpotent_tfae` and the categorical Theorem P `isLeftPerfectCategory_tfae` are all stated over an unspecified action. `LeftMorphismIdeal.smul` (line 398) is `sorry` outright.
- The composition of `Linear.TensorProduct R C₁ C₂` is `comp := sorry` (line 203); every bimodule category is built on it.
- `tensorBifunctor` (line 415) is `sorry`, and `ModCat.tensor` has `sorry` maps (lines 443–447). So `ModCat.tor`, `flat_tfae` (clauses 2–7), `ModCat.flatDimension`, `ModCat.weakGlobalDimension`, Auslander's theorem `ModCat.globalDimension_eq_weakGlobalDimension`, `forall_flat_kernel_iff`, and clause 10 of Theorem P are undetermined.
- `BalancedTensorProduct.functor` (line 574) is `sorry`, so `BalancedTor`, the ring `flatDimension` and `weakGlobalDimension`, `isVonNeumannRegularRing_tfae`, `globalDimension_eq_weakGlobalDimension`, and clause 10 of `isLeftPerfectRing_tfae` are undetermined. `CharacterModule.rightModule` (line 518) is `sorry`, so the Lambek clause of `Module.balancedFlat_tfae` is too.
- `moduleCatEquivModCat` (line 162), `CategoryAlgebra`'s multiplication and unit (lines 994–1001), `ModCat.projDual`, `ModCat.stableTransposeEquivalence` and `restrictedYonedaEquivFlat` are `sorry` data that later statements mention.

The smallest repair has two parts. Where a real body is short, write it: a left ideal as a structure with `hom X Y : AddSubgroup (X ⟶ Y)` closed under precomposition (no bimodule needed), `I · M` as the explicit subfunctor of 0.3, the balanced tensor functor from `TauCeti.BalancedTensorProduct.map`, the right action on `CharacterModule M` by precomposition. Where the construction is itself the library's work (the tensor product of categories, the coend tensor and `Tor`, the equivalences with `ModuleCat`, the category algebra, the stable category), leave it as a README target with its intended signature, drop the `sorry` definition and what mentions it, and name in the module docstring each headline that is then not statable and the carrier it lacks. Several headlines already stand on real bodies and need no change: `ModCat.flat_lazard_tfae`, `isFinitelyAccessibleCategory_iff_nonempty_equiv_flat`, `Module.balancedFlat_lazard_tfae`, `isLeftTNilpotent_tfae`, `isSemiperfectRing_tfae`, `Module.End.isSemiprimaryRing`.

## R03 (P2) — The single-representable finite-presentation predicate is ArtinAlgebras §1.1's, not Tau Ceti's, so 0.1 gives `mod C` a second owner

The README says in Scope (line 101) that defining `mod C` by finite sums "replaces Tau Ceti's single-representable definition", in 0.1 (line 354) that "This replaces Tau Ceti's single-representable predicates without shims", and repeats it under Downstream consumers (line 1380). At the pinned Tau Ceti there is no finitely presented or finitely generated functor predicate at all: no declaration uses `preadditiveYoneda`, and the only `FinitelyPresented*` names are `FinitelyPresentedStableModule` and the sheaf ones. The single-representable definition is a target of ArtinAlgebras §1.1 on main ("The category `mod C`"), whose `Suggested.lean` declares `IsFinitelyPresentedFunctor` at line 142 as a cokernel of a map of representables, for additive `C`, with "finitely generated" meaning a quotient of one representable. So this roadmap and a roadmap on main each define a predicate of the same name for the same object, with different bodies, and this one announces that it will replace the other.

The two agree when `C` has finite biproducts, as 0.1 already says, so nothing needs to be re-planned. The repair is to cite ArtinAlgebras §1.1 as the owner on additive categories, present 0.1 as the extension to categories without biproducts, keep the agreement under `[HasFiniteBiproducts C]` as a named target, and remove the three sentences about replacing a Tau Ceti definition. A distinct name for the finite-sum predicate would also keep the two `Suggested.lean` files from declaring one name with two meanings.

## C01 — ArtinAlgebras is named both as a supplier and as a downstream consumer

The supplier contracts take `IsKrullSchmidt` from ArtinAlgebras §0.2 and uniqueness from §0.3, and "Downstream consumers" (lines 1369–1378) has ArtinAlgebras §§4.1–4.2, 7.2, 7.5 and Layer 4 using this roadmap's 1.4, 3.4, 4.2, 4.3 and 4.6. ArtinAlgebras is on main and cites this roadmap nowhere, so there is no cycle today, but the text describes one between the two roadmaps. Say that these uses belong to a later part of ArtinAlgebras, or describe them as alternative proofs available to it, so that the direction of supply is single.

## C02 — About a dozen declarations of `Suggested.lean` are closed in one step or restate a definition

`ModCat.Submodule.ext`, `LeftMorphismIdeal.ext`, `RightMorphismIdeal.ext`, `MorphismIdeal.op_toRightMorphismIdeal` and `changeBaseAddEquiv_tmul` are already proved in the file by `ext`, `simp` or `rfl`; `small_mulOpposite` is one library lemma; `tmul_comp_tmul`, the two `comp_mem` lemmas, `changeBaseLinearEquiv_tmul` and `categoryAlgebraSingleObjRingEquiv_apply` are unfolding lemmas about `sorry` data. As acceptance tests they ask an implementer for nothing. They would be better as API bullets in the README, which already describes each of them.

## C03 — Two examples in the Layer 4 checks use `(xᵢxⱼ)` with different meanings

In `k[x₀, x₁, …] ⧸ (xᵢxⱼ)` (line 1356) the ideal must include the squares, since the ring is called semiprimary: with `i ≠ j` only, the quotient is `k + ⊕ xᵢ k[xᵢ]`, whose radical is not nil. In Bass's ring `k[x₀, x₁, …] ⧸ (xᵢ^{i+2}, xᵢxⱼ)` on the next line the same symbol must mean `i ≠ j`, or the radical would square to zero and the ring would be semiprimary. Write "all `i, j`" in the first and "`i ≠ j`" in the second.

## C04 — The description disagrees with the head in three places

"right T-nilpotence of `J`" in the list of Theorem P's conditions: the README and `IsLeftPerfectRing` use left T-nilpotence (`a₀ a₁ ⋯ aₙ₋₁ = 0`), which is Bass's condition (1) for left perfect rings. "Commutative flatness and global dimension remain in Mathlib and `PurityOfBranchLocus` §0.3": on main that section is a former one, mapped to `TauCeti.globalDimension`, and the README does not cite it. "`281` declarations": the head has 227. The supplier sentence also omits ArtinAlgebras §0.3, which 0.9 uses in a Check.

## N01 — `${}_C C_C` is TeX inside a code span

The regular bimodule is written `${}_C C_C` some twenty times (first at line 17). Unicode such as `_C C_C`, or simply "the regular bimodule `C(-, -)`", reads the same without the dollar sign and braces.

## N02 — Four theorem signatures use `letI`

`isMoritaEquivalent_tfae`, `BalancedTor.outerSMulCommClass`, `Module.balancedFlat_tfae` and `flatDimension_eq_injectiveDimension_characterModule` bring module structures into scope with `letI` inside the statement. An instance binder or a named instance argument states the same thing and is easier to apply.

## N03 — [Auslander78] is located by the pages of a retyped copy

"pp. 12–14 of a retyped copy" (line 1406) cannot be followed by a reader holding the printed volume. The proposition number is enough; the printed page would be better if it can be found.

## Questions for the author

- 3.5, Jategaonkar's domains: the Check says principal *left* ideal domains with arbitrary *right* global dimension. Is that the side in Thm. 4.10 after the roadmap's left-module convention? I could not read the article.
- 4.3, step 1: is [AF, Thm. 29.2] stated for multiplicatively closed nil *sets*, as `Module.End.exists_prod_eq_zero_of_isNilpotent` is, or for nil subrings as in Fisher's title? I could not read either text.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `Mod C`, quiver Check | `C = (1 → 2)` over `k` | `Hom(-,1) = (0 → k)`, `Hom(-,2) = (k → k)` as `V₂ → V₁` | agrees | none |
| 0.1 finite presentation | zero functor; `ℤ²` over `SingleObj ℤᵐᵒᵖ` | `m = n = 0` presents `0`; `ℤ²` needs two representables | agrees | R03 (owner) |
| 0.2 side convention | `SingleObj A`, `SingleObj Aᵐᵒᵖ` | `F(ab) = F(b)∘F(a)` on `A`; `F(ab) = F(a)∘F(b)` on `Aᵐᵒᵖ` | left modules, as claimed | none |
| 0.4 tensor over `C` | Yoneda; `ℤ/2 ⊗ (2ℤ → ℤ)` | `Hom(X,-) ⊗ F = F(X)`; map `ℤ/2 → ℤ/2` is `0` | agrees | R02 (`sorry` carrier) |
| 0.6 swap | type of `tensorObjSwapIso` | `G ⊗_C F ≅ F ⊗_{Cᵒᵖ} G` via `opOpEquiv` | well typed | R02 |
| 0.8 duals | `E = ℚ/ℤ ⊕ ℤ`, `i = 2 : ℤ → ℤ` | `i ⊗ ℤ` injective; `2 : E → E` misses `(0,1)` | counterexample correct | none |
| 0.10 Morita, rings | `A = ℤ`, `B = 0`, `n = 0` | clause 4 proved in Lean; clause 1 false | TFAE fails | R01 |
| 1.1 bimodule `Tor` caveat | `D = C = ℤ`, `E = 𝔽_p`, `M = N = 𝔽_p` | derived on `Bimod C E`: `0`; `Tor₁^ℤ(𝔽_p,𝔽_p) = 𝔽_p` | caveat correct | none |
| 1.3 balance | type of `torBalanceIso`, `balancedTorSwapIso` | both sides derive in second variable after swap | consistent | R02 |
| 1.6 `Tor₁(A/I, A/K)` | `ℤ`, `m,n ≠ 0`; `m = 0`; `T₂(k)`, `I = K = J` | `ℤ/gcd`; `0`; `J/J² = J` | agrees with 1.7 Checks | none |
| 1.7 category algebra | `SingleObj Aᵐᵒᵖ`; `1 → 2` | `a ↦ unop a(∗,∗)` multiplicative; `e₁₂T ≅ e₂₂T` projective | agrees | R02 |
| 2.1 flatness | empty relation; ring case | `m = 0` witness; `∑ bⱼaᵢⱼ = 0`, `yⱼ = ∑ aᵢⱼzᵢ` (Chase 2.3) | agrees | none |
| 2.5 Bass module | `ℤ`, `p`; `0 → 1 → ⋯` | `ℤ[1/p]`; constant functor `k`, no map to `Hom(-,i)` | flat, not projective | none |
| 2.6 product remark | `k[x,y]/(x,y)²` | Artinian hence coherent; `ann(x) = (x,y)` not principal | remark correct | none |
| 3.1 `flatDimension` | `F = 0`; flat `F ≠ 0`; none finite | `⊥`; `0`; `⊤` from the `sInf` | matches Convention 7 | R02 |
| 3.2 global dimension | zero object; `Free k (Fin 2)` | `⊥`; `1` (`T₂(k)` hereditary, not semisimple) | agrees | none |
| 3.3 von Neumann regular | sum of two principal subobjects of `Hom(-,Y)` | reduces to idempotents of `End Y`, as for rings | clause 5 holds | none |
| 3.5 kernels of flats | dimension shift both ways | `fd M ≤ 2` from flat kernel; `fd K ≤ 0` from `wgldim ≤ 2` | iff holds | R02 |
| 3.5 Small's ring | `D = ℤ`, `n = 1` | right gldim `1`, left `2`; right Noetherian only | consistent with 3.4 | none |
| 4.1 T-nilpotence | `SingleObj Aᵐᵒᵖ`; `k⟦X⟧` | `op(a₀⋯aₙ₋₁)`; `G + X·F = F`, `F/G = k((X)) ≠ 0` | left T-nilpotent convention | R02 |
| 4.2 semilocal ⇔ `C/J` semisimple | corner of `End(X ⊕ Y)/J` | semisimple, hence regular; gives regular `f : X → Y` | holds | none |
| 4.4 projective covers | route against Bass, Lemma 2.6 | `ker f ⊆ J·P`, superfluous by T-nilpotence | agrees with source | R02 |
| 4.5 Theorem P, rings | Bass's clauses (1)–(7) | left T-nilpotent; DCC principal right ideals; right socle | sides agree | R02 (clause 10) |
| 4.5 Theorem P, clause 4″ | maximal `I` missing all `qₙ` | `qₙ(1 − fₙr) ∈ I`, unit, so `qₙ ∈ I` | T-nilpotence follows | humans |
| 4.5 perfect examples | linear `A_∞`; Lam's ring; Bass's ring | `0 → n` never `0`; `E₀₁⋯ = E₀ₙ`; products die after `m+2` | as claimed | C03 |
| 4.6 Bass–Eilenberg | minimal resolution | `Tor_n(C/J(X,-), M) = (Pₙ/JPₙ)(X)` | agrees with Bass p. 475 | R02 |
| Crawley-Boevey `iff` | carriers of the statement | `ModCat.Flat`, `IsFinitelyAccessibleCategory` have real bodies | determinate | none |

- Source locators checked against the text: 12 (Bass: definition p. 466, Theorem P pp. 467–468, Lemmas 1.1–1.3, Thm. 2.1 p. 471, Lemma 2.6 p. 473, Prop. 2.7 p. 474, Eilenberg's argument and §3 p. 475; Chase: Prop. 2.2 with the credit, Cor., Prop. 2.3, pp. 458–459), all correct.
- Library declarations opened at the pins: 34 cited Tau Ceti and Mathlib names resolved (among them `TauCeti.globalDimension`, `RingTheory/GlobalDimension.lean` line 70; `TauCeti.IsSemiperfectRing`, `RingTheory/Jacobson/Semiperfect.lean` line 62; `IsIdempotentElem.Corner`, `Mathlib/RingTheory/Idempotents.lean` line 553); none missing.
- Cross-roadmap citations resolved: ArtinAlgebras §§0.2, 0.3, 7.1, 7.2, 7.5 and OperatorKTheory §8.2 on main; DerivedModuleAlgebra exists on main. `IsKrullSchmidt` in this file is field-for-field the class at line 89 of ArtinAlgebras' `Suggested.lean`.
- Elaboration of `Suggested.lean` at the pins: no errors, 187 `sorry` warnings, nothing else. One separate probe (the `n = 0` corner) elaborated.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no change outside the roadmap folder.
- Headline theorems: all are present in the file; the defect is how they are stated (R02), and the module docstring names none as not statable.
- Overlap check: read ArtinAlgebras (main and its open revision's headings), QuiverRepresentations, LocallyPresentableCategories; `mod C` — owner ArtinAlgebras §1.1 (R03); Krull–Schmidt categories — ArtinAlgebras §0.2, cited; finitely accessible `≌ Ind A` — LocallyPresentableCategories §1.5 owns the set-valued form, this roadmap the additive `Flat(C)` form, no citation between them; Morita corners — Tau Ceti, cited.
- Source independence: 7 passages compared with 2 sources (Bass, Chase), none shared; largest share Mitchell, 14 of about 150 locators; contents compared with Mitchell: not readable, by the section numbers the README cites (§§1–3, 6, 10, 11 in Layer 0, §7 in Layer 1, §§9, 36 in Layer 3) the layers are not a run of its sections.
- Research link: The headline targets are Bass's Theorem P (Bass 1960), its categorical form (Simson 1977, Harada 1973) and Crawley-Boevey's representation theorem (1994); the README names Auslander's correspondence and flat-dominant dimension (Hoshino 1989, Xi 2021) in ArtinAlgebras as users. Rests on the README and on Bass read at its locators.

## Not verifiable

- Mitchell, Oberst–Röhrl, Stenström: the publisher's host is treated as paywalled; locators in 0.1, 0.4, 0.10, 1.7, 2.1, 2.2, 3.2 not read.
- Simson, Harada, Lambek, Jensen: no legal copy found; locators in 0.8, 0.10, 2.5, 3.5, 4.4, 4.5 not read.
- Auslander 1955, Crawley-Boevey, Eilenberg: the fetch failed at the publisher or repository; locators in 3.2, 3.4, 3.5, 4.6 not read.
- Lam (both books), Anderson–Fuller, Weibel, Cartan–Eilenberg, Wisbauer, Mac Lane: books, not available; locators in 0.2, 1.3, 1.6, 4.1–4.5 not read.
- 0.6 and 1.1 of the sample carry no source locator; their statements were checked by computation only.

Automatic checks set aside as false positives: four names reported as undeclared are two Tau Ceti declarations that exist at the pin, a field of Tau Ceti's balanced tensor product, and the notation `Tor_0`; six reports of TeX syntax are inside code spans that wrap over a line break; the Prop-valued instances among the `sorry` bodies are theorems, not data.

## Source issues

- none

## For the human reviewers

- **Scope.** Clause 4″ of the categorical Theorem P (right socle and orthogonal idempotents, README lines 1295–1297) is, by the README's own words, this roadmap's extension of Bass's clause (7); no refereed source states it. Its proof sketch checked out.
- **Not tested.** Mitchell, *Rings with several objects*, has the largest share of locators (14); neither its text nor its contents page could be read, so wording and arrangement were not compared with it.
- **Licence.** [Auslander78] is cited by the pages "of a retyped copy" (README line 1406); the copy's host and status are not stated.
