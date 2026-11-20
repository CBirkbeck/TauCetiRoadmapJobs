# Review of NoncommutativeFlatness (pull request #2618 at 9775177)

**Verdict:** accepted

**Summary.** Accepted: no finding. Since the last reviewed head the README was only reordered (same lines, two headings renamed) and `Suggested.lean` is unchanged; the whole roadmap was nevertheless read again, its Checks and worked examples recomputed, and the statements of Layers 0–4 tested on degenerate and one-object cases, with no false statement found. There are two small corrections and three format notes, none blocking, one question for the author about the generality of the Small–Fisher step in 4.3, and four points for the human reviewers.

## C01 — The instance `LocallySmall (ModCat C)` follows from the Grothendieck instance two lines above it

In `Suggested.lean`, line 142, `instance [EssentiallySmall.{w} C] : LocallySmall.{w} (ModCat.{w} C) := sorry` is closed by `inferInstance` once the instance `IsGrothendieckAbelian.{w} (ModCat.{w} C)` of line 138 is in scope (a Grothendieck abelian category is locally small by definition in Mathlib). On a copy of the file with that one replacement the file elaborates with 202 `sorry` warnings instead of 203. As a `sorry` it asks an implementer for nothing; writing `inferInstance` there (or dropping the line) says what is meant.

## C02 — The `IsIndObject` bridge in 2.3 is stated "for additive `C`", and holds only for essentially small `C`

In the paragraph "Rings and set-valued bridges" of 2.3 (README lines 737–739): "For additive `C`, `Flat F` agrees with `IsIndObject` on `F ⋙ forget`". Convention 3 and the opening of Layer 2 say that flatness itself needs no smallness, so a reader can take this sentence at that generality, where it fails: on the additive hull of the `k`-linear category of the ordered class of ordinals of a universe, the constant functor `F(α) = k` is flat (every finite relation is trivialized at a larger ordinal), but a small filtered colimit of representables vanishes at every ordinal above its indices, so `F ⋙ forget` is not an ind-object. The Lean statement `ModCat.flat_iff_isIndObject` has `[EssentiallySmall.{v} C]` (line 1673) and is right. "For essentially small additive `C`" in the prose makes the two agree.

## N01 — `letI` in two theorem statements

`isMoritaEquivalent_tfae` (`Suggested.lean` lines 1144–1151) and `BalancedTor.outerSMulCommClass` (lines 1273–1274) bring module structures into scope with `letI` inside the statement; a named instance argument reads and applies more easily.

## N02 — "current Tau Ceti `main`" and "not yet at this roadmap's pin" date the Scope paragraph

README lines 1278–1280 (and "on Tau Ceti `main`", line 1211) describe the library on the day of writing. "(`IsFinitelyPresentedFunctor` in ArtinAlgebras' `Suggested.lean`)" alone is timeless; the remark about the pin already stands in the description.

## N03 — Small's article is cited inline but is not in the References

The Check on Small's triangular ring in 3.5 (README lines 943–944) gives "*Proc. Nat. Acad. Sci. U.S.A.* 54 (1965), Thm., p. 1035" in the text; every other source has a key and an entry under References.

## Questions for the author

- 4.3, step 1, and `Module.End.exists_prod_eq_zero_of_isNilpotent` (`Suggested.lean` lines 2139–2143): the statement is for a product-closed set of nilpotent endomorphisms of a module that is Artinian or Noetherian, while the README says its two sources state it for nil subrings and nil one-sided ideals and that "both proofs use only closure under products". For a module of finite length I can confirm the statement (reduce to the semisimple layers and apply Levitzki's theorem over a division ring), and for an Artinian module I checked that T-nilpotence gives nilpotence for a product-closed set (`S N = N ≠ 0` yields a sequence with no vanishing product). I could not confirm step 1 itself for a module with only one chain condition: the minimal-image choice gives `a x a = 0` for all `x` in the set, which did not by itself give a contradiction. Does the argument of [Fisher-Nil, Thm. 1.5] (resp. Thm. 2.1) really avoid sums of elements of the set? What stopped me: neither text could be read.

## Previous findings

The previous review, of `3f0df5e`, had no finding and two format notes.

- N01 (`letI` in two statements) — not repaired: "`letI := TauCeti.BalancedTensorProduct.leftModule …`" still stands in both statements (N01 above).
- N02 (dated wording in Scope) — not repaired: "implemented on current Tau Ceti `main` as … not yet at this roadmap's pin" stands, now at lines 1278–1280 (N02 above).

The change since that head moves "Scope and ownership", the supplier contracts and the references after the layers, renames "Supplier contracts" to "Exact supplier contracts" and "Sources and locators" to "References" (with the one link to it), and replaces the layer guide by "How to read the build"; compared as sorted lines, the two READMEs differ in those three lines only.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.3 one-sided ideals, `I · M`, superfluous | `SingleObj Aᵐᵒᵖ`, `Aa`; `ℤ`, `2ℤ`, `ℚ` | `op c ≫ op(ba) = op(cba) ∈ Aa`; `2ℚ = ℚ`, `ℚ ⊔ 0 = ⊤` with `0 ≠ ⊤` | Checks true; `comp_mem` direction right | none |
| 0.3 tensor of categories, bimodule bridge | `SingleObj Aᵐᵒᵖ`, `SingleObj Bᵐᵒᵖ` | `Aᵐᵒᵖ ⊗ Bᵐᵒᵖᵐᵒᵖ = (A ⊗ Bᵐᵒᵖ)ᵐᵒᵖ`, so modules are left `A ⊗[R] Bᵐᵒᵖ`-modules | matches `nonempty_singleObjEquiv` | none |
| 0.4 coend tensor, Yoneda, quotient representables | `Hom(1,-) ⊗ F` on `1 → 2`; `ℤ`, `I = (n)`, `M = ℤ/m` | `F(1)`; `M/nM = ℤ/gcd(m,n)` | agrees with 0.7 Check | none |
| 0.5 projective factors | `G ⊗ Hom(-,X)`; control `ℤ/2 ⊗ (2ℤ → ℤ)` | `G(X)`, exact in `G`; control map `0` on `ℤ/2 ≠ 0` | holds; projectivity needed | none |
| 0.7 balanced tensor, character module | `ℤ/2 ⊗ (2ℤ → ℤ)`; `((ab)•χ)(n)` | map `0`, source `ℤ/2`; `χ(b a n)` on both sides | Checks true; right action associative | none |
| 0.8 dual, injectivity of `E` needed | `E = ℚ/ℤ ⊕ ℤ`, `i = 2 : ℤ → ℤ` | `i ⊗ ℤ` injective; `2 : E → E` misses `(0,1)` | README's counterexample correct | none |
| 0.10 Morita, rings | `P = A`; `A = ℤ`, `B = 0`; `n = 0` | `(End_A A)ᵐᵒᵖ = A`; `0` not a separator, `0 ⊗ 0 ≇ ℤ`; Lean has `Fin (n+1)` | consistent | none |
| 1.2 long exact sequence | `0 → ℤ → ℤ → ℤ/2 → 0`, `F = ℤ/2` | `Tor₁(ℤ/2,ℤ/2) = ℤ/2 → ℤ/2 →(0) ℤ/2 → ℤ/2 → 0` | exact | none |
| 1.4 stable category, transpose formula | factorization `X → P → Y`; `X` projective | lift through `Q ↠ Y`; `X = P₀`: `stable Hom = 0` and `Tr X = coker(P₀^∨ → 0) = 0` | holds | none |
| 1.5 `Tor`–`Ext` duality | `ℤ`, `E = ℚ/ℤ`, `G = F = ℤ/2`, `n = 1`; control `E = ℤ` | `Hom(ℤ/2, ℚ/ℤ) = ℤ/2 = Ext¹(ℤ/2, ℤ/2)`; control `0` vs `Ext¹(ℤ/2, ℤ) = ℤ/2` | holds; `[Injective E]` in Lean | none |
| 1.6 `Tor₁(A/I, A/K)` | `ℤ`, `(m)`, `(n)`; `I = 0` | `lcm ℤ / mn ℤ ≅ ℤ/gcd`; `0 = 0` | holds | none |
| 1.7 category algebra | `SingleObj Aᵐᵒᵖ`; `1 → 2` | `unop(a ≫ b) = unop a · unop b`; `J = kE₁₂ ≅ e₂₂T` (right), `≅ Te₁₁` (left), `Tor₁ = J/J² = J` | Checks true | none |
| 2.1 flatness | `Hom(-,X)`; empty relation; `ℤ/2`, `2·1̄ = 0` | witness `𝟙 X`; `m = 0`; `2α = 0 ⇒ α = 0 ⇒ 1̄ = 0` | flat, flat, not flat | none |
| 2.2 `flat_tfae` | `ℤ/2`; `ℚ`; `n = 0` in clause 2 | clause 2 map `0` on `2ℤ ⊗ ℤ/2`; `Tor₁(ℤ/2,ℤ/2) ≠ 0`; span of empty family `⊥` | clauses agree | none |
| 2.3 Lazard block | Lazard 1.1–1.3; `F = 0`; `ℤ/2` | Lazard (ii), (iii), Cor. 1.3 are clauses 2, 4, 5; `0` over `0` filtered; `Hom(ℤ/2, ℤⁿ) = 0` | holds | none |
| 2.3 `IsIndObject` bridge | additive hull of `k[Ord]`, `F = k` constant | flat; small colimit of representables is `0` above its indices, `F = k` there | false without smallness; Lean assumes it | C02 |
| 2.3 purity vs `IsCardinalPure` | Mathlib's definition at the pin | lifting `Y' → X` with upper triangle, for presentable `X', Y'` | equals pure monomorphism | none |
| 2.4 weak cokernels, left exactness, Crawley-Boevey | `k[x,y]/(x,y)²`; `Z → 0`; `𝒜` without biproducts | `ann(x) = (x,y)` not principal; `F(q)` injective; `Flat(C)` has biproducts | Check true; `HasFiniteBiproducts 𝒜` needed and present | none |
| 2.5 Bass's module | `ℤ`, `aᵢ = p`; linear `A_∞` | `ℤ[1/p]`; `B = k` constant, `Hom(k, j) = 0` for `k > j` so not factorizable | flat, not projective | none |
| 3.1 flat dimension | `0`; `ℚ`; `ℤ/2`; `k` over `k[ε]` | `⊥` (empty `β` gives `F(X) = 0`); `0`; `1`; `⊤` | matches Convention 7 | none |
| 3.3 von Neumann regular | `a = aba`; `ℤ`; two objects, `Hom(X,Y) = kf` only | `e = ba`, `Aa = Ae`; `2 = 2b2` unsolvable; `Hom(-,Y)` not complemented, `f` not regular | clauses agree | none |
| 3.4 Auslander's theorem | Au Thm. 4, Cor. 5; Small's ring; zero ring | left Noetherian ⇒ `l.gl.dim = w.gl.dim`; right `1 = wgldim`, left `2`, not left Noetherian; `⊥ = ⊥` | `IsNoetherianRing A` is the left condition | none |
| 3.5 kernels, countable flats | dimension shift; `ℚ` over `ℤ`; retract of countably presented | `fd coker ≤ 2 ⇒ ker` flat; `pd ℚ = 1`; `coker(1 − e)` countably presented | iff holds; bound attained | none |
| 4.1 T-nilpotence, Nakayama | `SingleObj Aᵐᵒᵖ`; `k⟦X⟧`; simple `S`, `f ∈ J` | `op a₀ ≫ ⋯ = op(a₀⋯aₙ₋₁)`; `eᵢ = (eᵢ − Xeᵢ₊₁) + Xeᵢ₊₁`; `(1 − S(g ≫ f))x = 0 ⇒ x = 0` | left T-nilpotence, as Bass | none |
| 4.2 semilocal, semisimple, semiperfect | `End(X ⊕ Y)` in the additive hull; zero object; `ℤ` | `J = 0`, semilocal ⇒ semisimple ⇒ `f` regular; `n = 0`; `ℤ/2` has no cover | holds; Krause 4.1, 4.4 agree | none |
| 4.3 Small–Fisher | finite length; Artinian step 2 | Levitzki on semisimple layers; `S N = N ≠ 0` gives a non-vanishing sequence | holds for finite length; one chain condition not verified | question |
| 4.4 projective covers | Bass Lemma 2.6; `ker f ⊆ ⊕ ker qᵢ` | `ker qᵢ ⊆ J·Pᵢ`, `J·P` superfluous by T-nilpotence | holds | none |
| 4.5 Theorem P, rings | Bass (1)–(7); zero ring; Lam's ring; `k⟦X⟧` | clause 6 is Bass (4), 4″ is Bass (7); empty product `1 = 0`; `E₀₁⋯Eₙ₋₁,ₙ = E₀ₙ`, left factors lower rows; all fail | sides as claimed | none |
| 4.5 Theorem P, categories | linear `A_∞` and its opposite; `4′ ⇒ 1` | `qₙC ⊋ qₙ₊₁C`, `Hom(0,-)` has no simple subobject, `J`-sequence never `0`; opposite: all hold; `qₙ(1 − fₙt) = 0 ⇒ qₙ = 0` | clauses agree | none |
| 4.5 pure superfluous subobjects | `k⟦X⟧`, `K = (X)`; Chase 2.2 | `K` superfluous, `k` finitely presented, identity does not lift | not pure, as required | none |
| 4.6 Bass–Eilenberg | Bass p. 475; Au Cor. 9; `T₂(k)` | `Tor_n(R/N, A) ≅ Pₙ/NPₙ`; semiprimary symmetry; non-projective simple has `pd = 1`, `Tor₁ ≠ 0` | agrees | none |
| 0.1 `LocallySmall` instance | `inferInstance` in place of `sorry` | file elaborates, 202 `sorry` warnings | follows from line 138 | C01 |
| Layer 4 Checks | `k[xᵢ]/(xᵢxⱼ)`; Bass's ring; `ℤ₍p₎` | `J² = 0`; first factor bounds the variables, product dies after `N + 2` factors, `xᵢ^{i+1} ≠ 0`; `pⁿ ≠ 0` | semiprimary; perfect not semiprimary; not perfect | none |

- Source locators checked against the text: 21 (Bass 9: Theorem P and its clauses (4), (7), Lemmas 1.1–1.3, Thm. 2.1, Lemma 2.6, Prop. 2.7, p. 475; Auslander 1955 4; Lazard 4; Chase 2; Sandomierski 2; Krause 3 by number in the arXiv version; Stacks 1; Cortés-Izurdiaga 2), all correct.
- Library declarations opened at the pins: `IsCardinalPure` (Mathlib `CategoryTheory/Presentable/CardinalPure.lean` line 51), `TauCeti.globalDimension` (`RingTheory/GlobalDimension.lean` line 70), `TauCeti.IsSemiperfectRing` (`RingTheory/Jacobson/Semiperfect.lean` line 62), `TauCeti.IsEssentialEpi` (`CategoryTheory/Projective/Cover.lean` line 104), `TauCeti.IsSuperfluous` (`Algebra/Module/Submodule/Superfluous.lean` line 73), `TauCeti.exists_isProjectiveCover` (`Algebra/Module/ProjectiveCover/Existence.lean` line 182, semiprimary rings), `CharacterModule.eval_injective` (`Algebra/Module/CharacterModule.lean` line 54), and 32 further cited names by search; none missing. No left perfect, T-nilpotent, von Neumann regular, flat-dimension or `Tor ≅ Tor'` declaration exists at either pin.
- Cross-roadmap citations resolved on main: ArtinAlgebras §§0.2, 0.3, 1.1, 1.5, 4.1, 4.2, 7.1, 7.2, 7.5 (`IsKrullSchmidt` at its `Suggested.lean` line 89, `IsFinitelyPresentedFunctor` at line 142); SpectralSequencesAndConvergencePartII §4.1 (`nonempty_tor_iso_tor'`, its `Suggested.lean` line 284); OperatorKTheory §8.2; DerivedModuleAlgebra.
- Elaboration of `Suggested.lean` at the pins: exit 0, no error, 203 `sorry` warnings and nothing else; a single `import Mathlib` plus `TauCeti.*` modules; no `set_option`; no definition whose data is `sorry`. Section binders: `EssentiallySmall` is present in the elaborated statements of Layers 2–4 wherever the README assumes it.
- One-step probes on a copy: 25 `sorry` instances tried with `infer_instance` (one closes, C01); 18 theorems tried with `simp`, `rfl` or `exact?` (none closes, among them `balancedFlat_iff_flat`, `weakGlobalDimension_op`, `globalDimension_eq_globalDimension`, `isSemiperfectRing_iff_exists_ringEquiv_pi`, `nonempty_torIsoTor'`).
- Dependency check: `depcheck: 179 roadmaps, 2029 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder; no private path in the folder.
- Headline theorems: Theorem P for categories and rings, the flatness and Lazard equivalences, Crawley-Boevey's `iff`, Auslander's theorem, both Morita theorems, the von Neumann regular equivalences, balance and `Tor`–`Ext` duality are all stated in `Suggested.lean`; none is named as not statable.
- Title and description against the head: adds a new roadmap of three files and 3,788 lines; layer ranges 0.1–0.10, 1.1–1.7, 2.1–2.6, 3.1–3.5, 4.1–4.6; 2,253 lines and 203 `sorry` warnings; the suppliers named are those of "From other roadmaps"; no sentence is contradicted by the head.

Overlap check: read ArtinAlgebras (main), QuiverRepresentations (main), LocallyPresentableCategories (open); `mod C` — owner ArtinAlgebras §1.1, cited and generalized in 0.1; Krull–Schmidt categories and Krause's criterion — owner ArtinAlgebras §0.2, cited; `Tor ≅ Tor'` — owner SpectralSequencesAndConvergencePartII §4.1, cited; finitely accessible categories as `Ind A` (set-valued) — LocallyPresentableCategories §1.5, a different statement from the additive `Flat(C)` form here; QuiverRepresentations takes semiperfect rings and Morita corners from Tau Ceti and owns none of this roadmap's objects; the open GorensteinHomologicalAlgebra uses ordinary flat dimension and right perfect rings over commutative rings without defining them; nothing else shared, and no cited id is dropped by an open pull request.

Source independence: 10 passages compared with 8 sources (Bass, Auslander, Lazard, Chase, Sandomierski, Krause, Stacks, Cortés-Izurdiaga), none shared; largest share Mitchell, 14 of 138 locators; contents compared with Mitchell: not readable; by the section numbers the README cites (§§1–3, 6, 10, 11 in Layer 0, §7 in Layer 1, §10 in Layer 2, §§9, 36 in Layer 3) the layers are not a run of its sections.

Research link: The headline targets are Bass's Theorem P (Bass 1960) with its categorical form (Simson 1977, Harada 1973), Crawley-Boevey's representation theorem (1994) and Auslander's global-dimension theorems (1955); the README names flat-dominant dimension (Hoshino 1989, Xi 2021) as a user. Rests on the README and on Bass and Auslander read at their locators.

## Not verifiable

- Mitchell, Oberst–Röhrl, Stenström, Fisher (*J. Algebra*), Jategaonkar, Pierce, Mares, Krause (*Smashing*, *Defect*), Rump, Crawley-Boevey, Crivei–Prest–Torrecillas, Eilenberg: paywalled publishers; their locators in 0.1, 0.3–0.5, 0.10, 1.4, 1.7, 2.1–2.6, 3.2, 3.3, 3.5, 4.5, 4.6 were not read.
- Simson, Harada, Jensen, Osofsky (both), Lambek, Fisher (*Proc. AMS*), Beligiannis, Small: no copy could be fetched from a host the project accepts; locators in 0.7, 0.8, 0.10, 1.5, 2.2, 2.4, 2.5, 3.5, 4.1–4.5 not read.
- Lam (both books), Anderson–Fuller, Weibel, Cartan–Eilenberg, Wisbauer, Mac Lane, Auslander–Bridger, Auslander (1978), Jensen–Lenzing: books, not available; locators in 0.2, 0.7, 1.3–1.6, 2.1, 2.2, 2.5, 2.6, 3.1, 3.3, 3.4, 4.1–4.6 not read.
- Of the sampled targets, 0.3, 0.4, 0.5, 0.7, 1.4, 1.5, 2.2, 2.4 and 3.5 rest only on unread sources and were checked by computation; 1.2 carries no locator; 2.3, 3.4, 4.4, 4.5 and 4.6 were checked against Lazard, Stacks, Auslander, Bass, Chase and Sandomierski, their other sources unread.
- 4.3, step 1, for a module with one chain condition only (see the question above).
- Krause's printed page numbers (pp. 542–546) were not compared; the arXiv version has the same numbering of results.
- That Tau Ceti's main branch has `TauCeti.IsFinitelyPresentedFunctor` in `TauCeti/CategoryTheory/FinitelyPresentedFunctor/Basic.lean` (README lines 1278–1280): only the pinned Tau Ceti was available, and it does not have it, as the README says.
- The description's "`check_roadmap_topics.py` passes", its "separate local Lean probes" and its count of 307 declarations were not rerun.

Automatic checks set aside as false positives: four names reported as undeclared are two Tau Ceti declarations that exist at the pin, a lemma of Tau Ceti's balanced tensor product, and the notation `Tor_0`; eight reports of TeX syntax are inside code spans that wrap over a line break; the subsection "Layer 4 checks" is read as a layer heading; the Prop-valued instances and the `sorry` proof fields of definitions with real data are not `sorry` data; the reports that statements lost a smallness binder are instance binders that the elaborated statements do carry.

## Source issues

- none

## For the human reviewers

- **Scope.** Clause 4″ of the categorical Theorem P (right simple subobjects and orthogonal idempotents, README lines 1123–1125) is, in the README's words, this roadmap's own extension of Bass's clause (7); no refereed source states it.
- **Scope.** `Module.End.exists_prod_eq_zero_of_isNilpotent` (4.3) is stated for product-closed nil sets and for one chain condition; the README (lines 1064–1067) says its two sources state it for nil subrings and nil one-sided ideals.
- **Scope.** The README plans changes to existing Tau Ceti declarations "without shims" (`IsSuperfluous`, `globalDimension`, `IsSemiperfectRing`, and ArtinAlgebras §1.1's `IsFinitelyPresentedFunctor`; lines 1209–1222, 1276–1300).
- **Not tested.** Mitchell, *Rings with several objects*, has the largest share of locators (14); neither its text nor its contents page could be read, so wording and arrangement were not compared with it.
