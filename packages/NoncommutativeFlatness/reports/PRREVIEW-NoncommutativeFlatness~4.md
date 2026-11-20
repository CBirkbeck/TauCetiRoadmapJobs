# Review of NoncommutativeFlatness (pull request #2618 at 7fd388d)

**Verdict:** needs changes

**Summary.** Changes are needed, for one finding: the helper `BalancedTensorProduct.homRightModule` in `Suggested.lean` still leaves as `sorry` a proof obligation that is false at the helper's generality, the one remaining instance of the previous round's second finding. The other earlier findings are repaired: no definition has `sorry` as its data, and every comparison whose existence is the content is now a `Nonempty`/`∃` theorem. The mathematics recomputed on degenerate cases and worked examples held everywhere else I could test it. There are three small corrections and two format notes, none blocking, and four points for the human reviewers.

## R01 (P2) — `homRightModule` carries a `sorry` proof obligation that is false as stated

An implementer cannot discharge this `sorry`, so the definition, and `BalancedTensorProduct.homRight` and `nonempty_balancedTorExtDualityEquiv` which are stated through it, cannot be completed as written. In `Suggested.lean`, lines 932–937, the right `A`-action on `N →ₗ[R] X` is `f.comp (addToLin (DistribSMul.toAddMonoidHom N a.unop) sorry)`, and the binders are `[Algebra R A] [Module A N] [Module R N]` with nothing relating the two actions on `N`. The `sorry` therefore stands for `a • (r • x) = r • (a • x)` for arbitrary unrelated actions, which is false: take `R = ℂ`, `A = M₂(ℂ)`, `N = ℂ²` with the usual `A`-action and the `ℂ`-module structure `r ↦ diag(r, r̄)`; for `a = E₁₂`, `r = i`, `x = e₂` one gets `a • (r • x) = −i e₁` and `r • (a • x) = i e₁`. Elaborating that equation with these binders fails for want of `SMulCommClass A R N`, and succeeds once `[IsScalarTower R A N]` is added.

The only use, in `homRight` (line 940), is at `Module.compHom N (algebraMap R A)`, where the obligation is true, so no stated theorem is affected. The smallest repair is the binder `[IsScalarTower R A N]` (or `[SMulCommClass A R N]`) on `homRightModule`, with the corresponding instance supplied in `homRight` for the `compHom` structure. The other `sorry` proof fields of definitions (the functor laws, the `addToLin` call sites in `linearHomOpBifunctor`, `bimodLeftFunctor`, `bimodHomRight` and `homRight`, the four linearity proofs of `Bimod.liftAct` under its new additivity binders) are true at their stated generality; I checked each.

## C01 — `categoryAlgebraSingleObjRingEquiv_apply` holds by `rfl`

The statement (lines 1516–1520) is the defining formula of `categoryAlgebraSingleObjRingEquiv`, whose body is now real: on a copy of the file, `rfl` closes it. As a `sorry` target it asks an implementer for nothing. Either add it to the module docstring's list of auxiliary one-line lemmas, or leave the formula to the README, which already states it in 1.7.

## C02 — `nonempty_torIsoTor'` is the `ModuleCat R` case of a target of SpectralSequencesAndConvergencePartII §4.1

Section 1.6 says that the general statement belongs to SpectralSequencesAndConvergencePartII §4.1 and is not restated, but `Suggested.lean` line 1402 states its instance for `ModuleCat R` as a `sorry` theorem of this roadmap; that roadmap's `nonempty_tor_iso_tor'` (its `Suggested.lean`, line 284) gives it in one application, the exactness hypothesis being the standard fact about projective modules. As for Krause's criterion in 4.2, the smallest repair is to say in the docstring that this is the supplier's statement and not a target here, or to keep only `nonempty_balancedTorIsoTor`, which is the comparison this roadmap adds. The section is also missing from "From other roadmaps", which lists ArtinAlgebras alone.

## C03 — Scope points to a Tau Ceti file and declaration that are not at the pin

"whose single-representable predicate is implemented in Tau Ceti as `TauCeti.IsFinitelyPresentedFunctor` (`TauCeti/CategoryTheory/FinitelyPresentedFunctor/Basic.lean`)" (README lines 102–104, and the path again at line 1396). The pinned Tau Ceti has no `CategoryTheory/FinitelyPresentedFunctor` folder and no declaration of that name, so a reader at the pin finds nothing, and the same name then appears in 0.1 (line 342) as this roadmap's proposed predicate. With the time reference removed the sentence now reads as a statement about the pin. "whose single-representable predicate (`IsFinitelyPresentedFunctor` in ArtinAlgebras' `Suggested.lean`)" is true and needs no file.

## N01 — `letI` in two theorem statements

`isMoritaEquivalent_tfae` (lines 1143–1150) and `BalancedTor.outerSMulCommClass` (lines 1272–1273) bring module structures into scope with `letI` inside the statement; a named instance argument reads and applies more easily.

## N02 — "the abelian projective-stable category" in 1.4

Line 721 reads as if `underline{Mod C}` were abelian, which a stable category is not in general; "the projective-stable category of the abelian category `Mod C`" says what is meant.

## Verified sound

Earlier findings at this head. R01 (thirty-five `sorry` definitions): repaired; the module docstring now says "comparisons whose existence is the content are stated as `Nonempty`/`∃` theorems", and I found no `def`, `abbrev` or data-valued `instance` whose body is `sorry` (for example `theorem ModCat.nonempty_torBalanceIso`, `exists_changeBaseLinearEquiv` with its value on pure tensors, `exists_torCategoryAlgebraIso` bundling both equivalences). R02 (false obligations): partly; `addToLin` now takes `(h : ∀ r x, f (r • x) = r • f x)` and `Bimod.liftAct`, `Bimod.lift` have `[T.Additive] [∀ G, (T.obj G).Additive]`, but `homRightModule` passes `sorry` for `h` where it is false (R01 above). C01 (Krause's criterion): repaired, its docstring reads "not a target of this roadmap". C02 (unfolding lemmas): repaired, the module docstring names them as auxiliary. N01 (`letI`): not acted on for two statements (N01 above). N02 (time references): the words are gone; the pointer remains (C03 above).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.4 coend tensor, Yoneda | `Hom(1,-) ⊗ F` on `1 → 2`; `ℤ/2 ⊗ (2ℤ → ℤ)` | `F(1)`; induced map `ℤ/2 → ℤ/2` is `0` | agrees with Checks | none |
| 0.4 quotient representables | `ℤ`, `I = (n)`, `M = ℤ/m` | `(C/I) ⊗ M = M/nM = ℤ/gcd(m,n)` | agrees with 0.7 Check | none |
| 0.5 projective factors | `G ⊗ Hom(-,X)`; control `ℤ/2 ⊗ -` on `2ℤ → ℤ` | `G(X)`, exact in `G`; control map is `0`, not monic | holds; hypothesis needed | none |
| 0.6 swap | relation `x ⊗ F(f)y − G(f)x ⊗ y` under `x ⊗ y ↦ y ⊗ x` | `F(f)y ⊗ x − y ⊗ G(f)x`, the relation over `Cᵒᵖ` | well defined; Lean sides typecheck | none |
| 0.7 `homRightModule` | `R = ℂ`, `A = M₂(ℂ)`, `N = ℂ²`, `r ↦ diag(r, r̄)`, `a = E₁₂`, `r = i`, `x = e₂` | `a(r x) = −i e₁`; `r(a x) = i e₁` | obligation false | R01 |
| 0.7 base change, character module | `ℤ → ℚ = A`, `M = N = ℚ`; `((ab)•χ)(m)` | both tensors `ℚ`, pure tensors match; `χ(b a m)` both sides | holds; right action associative | none |
| 0.10 Morita, rings | `P = Aⁿ`; `A = ℤ`, `B = 0`; two scalar towers on `P` | `(End_A Aⁿ)ᵐᵒᵖ = Mₙ(A)`; clause 4 needs `n + 1 ≥ 1`; `r • p = (r•1_B) p = (r•1_A) p` | TFAE consistent, bimodules `R`-central | none |
| 1.1 `Tor`, bimodule `Tor` | `Hom(-,X)`; `C = D = ℤ`, `E = 𝔽_p`, `M = N = 𝔽_p` | `Tor_{n+1} = 0`; slice `Tor₁^ℤ(𝔽_p,𝔽_p) = 𝔽_p`, derived over `𝔽_p`-modules `0` | README's failing example correct | none |
| 1.2 long exact sequence | `0 → ℤ → ℤ → ℤ/2 → 0`, `F = ℤ/2` | `Tor₁(ℤ/2,ℤ/2) = ℤ/2 → ℤ/2 →(0) ℤ/2 → ℤ/2 → 0` | exact | none |
| 1.3 balance | types of both sides; `ℤ/m`, `ℤ/n` | both derive in second variable after the swap; `ℤ/gcd` symmetric | consistent | none |
| 1.5 `Tor`–`Ext` duality | `ℤ`, `E = ℚ/ℤ`, `G = F = ℤ/2`, `n = 1`; control `E = ℤ`, `F = ℤ` | `Hom(ℤ/2, ℚ/ℤ) = ℤ/2 = Ext¹(ℤ/2, ℤ/2)`; control `0` against `Ext¹(ℤ/2, ℤ) = ℤ/2` | holds; injectivity needed and assumed | none |
| 1.6 `Tor₁(A/I, A/K)`; `Tor ≅ Tor'` | `ℤ`, `(m),(n)`; `I = 0`; supplier statement | `lcm ℤ/mn ℤ ≅ ℤ/gcd`; `0 = 0`; supplier's hypotheses hold in `ModuleCat R` | cyclic formula holds; second is supplier's | C02 |
| 1.7 category algebra | `SingleObj Aᵐᵒᵖ`; `1 → 2` | `unop((a*b)(∗,∗)) = unop a · unop b`; `J = k e₁₂ ≅ e₂₂T`, `Tor₁ = J/J² = J`; `_apply` closes by `rfl` | ring map multiplicative | C01 |
| 2.1 flatness | `Hom(-,X)`; empty relation; `ℤ/2`, `2·1̄ = 0` | witness `𝟙 X`; `m = 0`; `2αᵢ = 0 ⇒ αᵢ = 0 ⇒ 1̄ = 0` | flat, flat, not flat | none |
| 2.2 `flat_tfae` | `ℤ/2`; `ℚ` | clause 2 map `0`; `Tor₁(ℤ/2,ℤ/2) ≠ 0`; `(ℤ/2)^{ℚ/ℤ} = ℤ/2` not injective; all true for `ℚ` | clauses agree | none |
| 2.3 Lazard block | Lazard 1.1, 1.2, 1.3; Stacks 058D (4); `F = 0`; `ℤ/2` | sources support clauses 2, 4, 5 and simultaneous trivialization; elements category filtered via `0`; `Hom(ℤ/2, ℤⁿ) = 0` | holds | none |
| 2.4 weak cokernels, left exactness | relation `(β_j)`, `Y = ⊕Y_j`, weak cokernel `g` | `z` with `F(g)z = y`, `α_j = ι_j ≫ g`, `∑ β_j ≫ α_j = β ≫ g = 0`; `Z → 0` gives `F(g)` injective | both directions hold | none |
| 2.4 Crawley-Boevey | Mathlib's class at the pin; `𝒜` all zero objects | accessibility extends `LocallySmall.{w}`, so restricted Yoneda lands in `AddCommGrpCat.{w}`; `Flat = 0` | statable and consistent | none |
| 2.5 Bass's module | `ℤ`, `aᵢ = p`; `a₀ = 0`, rest `p`; Bass 1.1–1.3 | `ℤ[1/p]`; tail from `c₁` gives `ℤ[1/p] ≠ 0`; annihilator of `z_k` as in Lemma 1.2 | matches `isZero_bassModule_iff` | none |
| 3.1 flat dimension | `0`; `ℚ`; `ℤ/2`; `k` over `k[ε]` | `⊥` (empty `β` gives `F(X)`); `0`; `1`; `⊤` | matches Convention 7 | none |
| 3.3 von Neumann regular | `f = f g f`; image a summand | image of `(g ≫ f)_*`, idempotent; `s∘r` gives `g` with `f g f = f`; `2 = 2b2` unsolvable in `ℤ` | clause 5 ⇔ clause 1 | none |
| 3.4 Auslander's theorem | Au Thm. 4, Cor. 5; Small's ring; zero ring | left Noetherian ⇒ `l.gl.dim = w.gl.dim`; left `2`, right `1 = wgldim`, not left Noetherian; `⊥ = ⊥` | hypotheses match `IsNoetherianRing A` | none |
| 3.5 kernels, countable flats | dimension shift; `ℚ` over `ℤ` | `fd coker ≤ 2 ⇒ fd ker ≤ 0`; `pd ℚ = 1` | iff holds; bound attained | none |
| 4.1 T-nilpotence, Nakayama | `SingleObj Aᵐᵒᵖ`; `k⟦X⟧`; Bass p. 466 | `op a₀ ≫ ⋯ = op(a₀⋯aₙ₋₁)`; `G + X F = F`, `F/G = k((X)) ≠ 0`; left T-nilpotent is `a₁⋯aₙ = 0` | direction agrees with Bass | none |
| 4.2 semilocal and semiperfect | `E = End(X ⊕ Y)` in `Mat_ D`; zero object; `ℤ` | `J(E) = 0`, corners semisimple ⇒ `E` semisimple; `n = 0` sum; `ℤ/2` has no cover | holds; Krause 4.1, 4.4 agree | none |
| 4.2 Bass Prop. 2.7 | `k⟦X⟧`, `P` free; `B = k((X))` | `(X)P ≠ P`; `(X)B = B`, `B` flat not projective | consistent | none |
| 4.3 Small–Fisher | finite length `M` | `End` semiprimary; image in `∏ Mₙ(D)` nilpotent, radical nilpotent | holds for finite length; general case not verified | none |
| 4.5 Theorem P, rings | Bass (1)–(7); zero ring; Lam's ring | sides and clause (4) agree; all twelve clauses true; `E₀₁⋯Eₙ₋₁,ₙ = E₀ₙ ≠ 0`, row index drops under left multiplication | left/right as claimed | none |
| 4.5 Theorem P, categories | linear `A_∞` and its opposite; `1 ⇒ 4″` | `Hom(0,-)` constant, no simple subobject, `J`-sequence never `0`; opposite: both hold; chain of cyclic subobjects stabilizes by `4′` | clauses agree on both | none |
| 4.5 pure superfluous subobjects | `k⟦X⟧`, `K = (X)` | `K` superfluous, `P/K = k` finitely presented, identity does not lift | not pure, as the theorem requires | none |
| 4.6 Bass–Eilenberg | Bass p. 475; Au Cor. 9; `T₂(k)`, non-projective simple | `Tor_n(R/N, A) ≅ Pₙ/NPₙ`; semiprimary symmetry p. 73; `Tor₁(T/J, S) ≠ 0`, `pd S = 1` | agrees | none |
| Scope, finitely presented functors | pinned Tau Ceti | no `CategoryTheory/FinitelyPresentedFunctor`, no `IsFinitelyPresentedFunctor` | pointer not at the pin | C03 |

- Source locators checked against the text: 23 (Bass 8, Auslander 1955 5, Lazard 4, Chase 3, Krause 2 by number in the arXiv version, Stacks 1), all correct.
- Library declarations resolved at the pins: 44 cited names, none missing (for example `TauCeti.exists_isProjectiveCover`, `Algebra/Module/ProjectiveCover/Existence.lean` line 182; `TauCeti.isProjectiveCover_mkQ_iff_le_jacobson`, `Algebra/Module/ProjectiveCover/Basic.lean` line 252; `HasCardinalFilteredGenerator`, `CategoryTheory/Presentable/CardinalFilteredPresentation.lean` line 170). No von Neumann regular, semilocal, T-nilpotent, left perfect, flat-dimension or `Tor ≅ Tor'` declaration exists at either pin.
- Cross-roadmap citations resolved on main: ArtinAlgebras §§0.2, 0.3, 1.1, 1.5, 4.1, 4.2, 7.1, 7.2, 7.5; SpectralSequencesAndConvergencePartII §4.1; OperatorKTheory §8.2; DerivedModuleAlgebra.
- Elaboration of `Suggested.lean` at the pins: no errors, 204 `sorry` warnings, nothing else. Elaborated types compared with the README for the theorems of Layers 2–4: `EssentiallySmall` is present wherever the README assumes it.
- One-step probes: `rfl` closes `categoryAlgebraSingleObjRingEquiv_apply` (C01); `simp` does not close `balancedFlat_iff_flat` or `isSemisimpleCategory_iff_isVonNeumannRegularCategory`; eight `infer_instance` probes on the `sorry` instances against the libraries alone all failed, so none is already there.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no change outside the roadmap folder; no private path in the folder.
- Headline theorems: Theorem P (categories and rings), the flatness and Lazard `TFAE`s, Crawley-Boevey's `iff`, Auslander's theorem, both Morita theorems, the von Neumann regular `TFAE`s, balance and `Tor`–`Ext` duality are all stated; none is named as not statable.
- Overlap check: read ArtinAlgebras (main), QuiverRepresentations (main), LocallyPresentableCategories (open); `mod C` on additive categories — owner ArtinAlgebras §1.1, cited; Krull–Schmidt categories and Krause's criterion — ArtinAlgebras §0.2, cited; projective covers over Krull–Schmidt categories — ArtinAlgebras §1.5, generalized in 4.2; finitely accessible `≌ Ind A` in the set-valued form — LocallyPresentableCategories §1.5, this roadmap the additive `Flat(C)` form; `Tor ≅ Tor'` — SpectralSequencesAndConvergencePartII §4.1, cited and restated (C02); the commutative von Neumann regular class of the open CommRingFactorizationSystems is a different carrier (`CommRing`) and that roadmap may not be cited; nothing else shared.

Source independence: 9 passages compared with 6 sources (Bass, Auslander, Lazard, Chase, Krause, Stacks), none shared; largest share Mitchell, 17 of about 190 locators; contents compared with Mitchell: not readable; by the section numbers the README cites (§§1–3, 6, 10, 11 in Layer 0, §7 in Layer 1, §10 in Layer 2, §§9, 36 in Layer 3) the layers are not a run of its sections.

Research link: The headline targets are Bass's Theorem P (Bass 1960) with its categorical form (Simson 1977, Harada 1973), Crawley-Boevey's representation theorem (1994) and Auslander's global-dimension theorems (1955); the README names flat-dominant dimension (Hoshino 1989, Xi 2021) as a user. Rests on the README and on Bass and Auslander read at their locators.

## Not verifiable

- Mitchell, Oberst–Röhrl, Stenström, Fisher (both), Jategaonkar, Pierce, Lambek, Harada, Jensen, Sandomierski, Osofsky (both), Crivei–Prest–Torrecillas, Small, Krause (Smashing): the publishers' pages could not be fetched on this run; their locators in 0.1, 0.3–0.5, 0.7, 0.10, 1.5, 1.7, 2.1–2.5, 3.2–3.5, 4.2, 4.3, 4.5 were not read.
- Simson, Beligiannis, Crawley-Boevey, Eilenberg: no copy could be fetched from a legal host; locators in 0.10, 2.2–2.5, 3.5, 4.1, 4.2, 4.4–4.6 not read.
- Lam (both books), Anderson–Fuller, Weibel, Cartan–Eilenberg, Wisbauer, Mac Lane, Auslander–Bridger, Jensen–Lenzing: books, not available; locators in 0.2, 0.7, 1.3–1.6, 2.1, 2.2, 2.5, 2.6, 3.1, 3.3, 3.4, 4.1–4.6 not read.
- Of the sampled targets, 0.4, 0.5, 0.7, 1.5, 2.4, 3.1 and 3.5 rest on unread sources and were checked by computation only; 0.6, 1.1 and 1.2 carry no locator.
- 4.3, step 1: that the proofs of [Fisher-Nil, Thms. 1.5, 2.1] and [AF, Thm. 29.2] use only closure under products could not be checked against either text; I verified the statement for finite-length modules only.
- Krause's printed page numbers (pp. 542–546) were not compared; the arXiv version has the same numbering of results.

Automatic checks set aside as false positives: four names reported as undeclared are two Tau Ceti declarations that exist at the pin, a field of Tau Ceti's balanced tensor product, and the notation `Tor_0`; eight reports of TeX syntax are inside code spans that wrap over a line break; the subsection "Layer 4 checks" is read as a layer heading; the Prop-valued instances and the true `sorry` proof fields of definitions with real data are not `sorry` data; the reports that theorems lost `EssentiallySmall` are a renamed binder.

## Source issues

- none

## For the human reviewers

- **Scope.** Clause 4″ of the categorical Theorem P (right simple subobjects and orthogonal idempotents, README lines 1308–1310) is, in the README's words, this roadmap's own extension of Bass's clause (7); no refereed source states it.
- **Scope.** `Module.End.exists_prod_eq_zero_of_isNilpotent` (4.3) is stated for multiplicatively closed nil sets; the README (lines 1249–1252) says its two sources state it for nil subrings and nil one-sided ideals.
- **Scope.** The README plans changes to existing Tau Ceti declarations "without shims" (`IsSuperfluous`, `globalDimension`, `IsSemiperfectRing`, and ArtinAlgebras §1.1's `IsFinitelyPresentedFunctor`; lines 101–124, 1394–1407).
- **Not tested.** Mitchell, *Rings with several objects*, has the largest share of locators (17); neither its text nor its contents page could be read, so wording and arrangement were not compared with it.
