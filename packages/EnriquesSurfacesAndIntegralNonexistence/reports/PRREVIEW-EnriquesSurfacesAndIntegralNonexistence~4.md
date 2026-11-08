# Review of EnriquesSurfacesAndIntegralNonexistence (pull request #1488 at c7e72bb)

**Verdict:** accepted

This is an incremental re-review of the 2 lines changed since 4cf6a98 (1 insertion, 1 deletion, both in `README.md` line 52). The change repairs the previous R01 exactly. The previous R02 (the branch manifest lags the pins the README names) was answered by the author with a reason that holds, so it is settled and not re-raised. No finding remains; the gate passes; the adversarial table below carries the previous rows and adds computed rows for the changed line. The folder is ready for a human's final approval, conditional on the six declared supplier gaps, which are unchanged.

## Previous findings

- R01 — repaired: `README.md:52` now reads "(TauCeti/LinearAlgebra/IntegralLattice/Basic.lean lines 63–73)". At Tau Ceti 2fd255d and at a91d3aa, line 63 is `structure IntegralLattice where` and lines 64–73 are the five fields with their docstrings (`carrier`, `form`, `isLattice`, `isSymm`, `le_dual`); line 74 is blank. No field is a nondegeneracy condition, so the locator supports the claim exactly.
- R02 — not repaired, settled: the branch still has merge base ae2562c, `lake-manifest.json` pins Tau Ceti a91d3aa and Mathlib 6b7abb3c, and `lean-toolchain` is v4.35.0-rc3. The author's reply at c7e72bb answered it without a folder change: the pins the README and docstring name (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9) are main's manifest pins at eaf17b1 with Lean v4.36.0-rc2. I checked that reason: `origin/main:lake-manifest.json` pins exactly those two revisions and `origin/main:lean-toolchain` is v4.36.0-rc2; every file and declaration `README.md:54` cites exists at 2fd255d (table below); the Lean file elaborates at the branch pin and uses only names that exist at both revisions. The folder is correct against the pins it names, which are the ones it will be built against after the merge, and the repair asked for (a rebase) changes nothing in the folder. The reason is right, so the finding is settled under the brief's rule and is not re-raised. What remains unverifiable is listed under `## Not verifiable`.

The three findings of [r1] stay repaired at this head: `README.md:73` names WeilConjectures §§7.12–7.14; no isotropic-cardinality declaration is in `Suggested.lean`; the LLR reference (`README.md:1941`) cites NeronModelsAndSemistableAbelianVarietiesPartII §3.11.

## Verified sound

**Scope.** The diff touches one sentence of `README.md:52` (a line-number locator into Tau Ceti). Nothing cites that sentence; the Lean file is byte-identical to 4cf6a98 (`git diff 4cf6a98 HEAD -- Suggested.lean` is empty). The outside-folder diff (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence'`) is empty. The folder contains only `README.md`, `Suggested.lean` and `metadata.toml`. None of the fifteen seeded-sample targets is changed; their rows are carried below from [r2] through [r3].

**Gate, dependency direction and elaboration.** I reran the gate with the brief's command at this head:

~~~text
gate EnriquesSurfacesAndIntegralNonexistence: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
~~~

(The worker's own gate at this head adds `build=0`.) The dependency check (`gate --depcheck … --movable`) printed:

~~~text
depcheck: 239 roadmaps, 2430 edges, 0 problem(s)
~~~

with no UPWARD, CYCLE or `moved:` line. `lake env lean` on `Suggested.lean` from the worktree, at the branch pin, gave exactly four `declaration uses sorry` warnings (lines 51, 69, 117, 123) and nothing else. A scratch copy with `#check @name` for all ten declarations plus `TauCeti.IntegralLattice.typeE₈RootLattice` and `typeE₈IsometryD8Plus` elaborated every type: the file has no `variable` block, so no binder can be lost, and each type matches its README statement (`positive_cone_decomposition` keeps h²>0, d²>0, d·h>0 and the six-part conclusion; `dyadic_square_classes` keeps `x ≠ 0` and `∃!` over `Fin 2 × Fin 2 × Fin 2`; both discriminant theorems are `Nat.card … = 4 ∧ AddMonoid.exponent … = 2`). At the branch pin the isometry's target elaborates as `d8PlusLattice`, at 2fd255d its source text (`D8Plus/Isometry.lean:292–293`) targets `checkerboardPlusLattice 8 (by decide)`, which is what `README.md:54` says. The one-tactic probe is not rerun: the Lean file is unchanged since [r3], where it closed 0 of 12 attempts.

**Pinned declarations opened at the stated revision 2fd255d (this round, 11 locations; all paths under `TauCeti/`).**

| Declaration or file | Location at 2fd255d | What I confirmed |
| --- | --- | --- |
| `structure IntegralLattice` | `LinearAlgebra/IntegralLattice/Basic.lean:63`, fields `:64–73` | The new README:52 locator; same lines at a91d3aa |
| `checkerboardPlusLattice` | `…/RootLattice/TypeD/Plus.lean:160` | Takes `(hn : 8 ∣ n)`; README:54's `checkerboardPlusLattice 8` is its n=8 instance |
| `typeE₈RootLattice` | `…/RootLattice/TypeE/Basic.lean:676` | File name as README:54 states |
| `typeE₈IsometryD8Plus` | `…/RootLattice/D8Plus/Isometry.lean:292` | `Isometry typeE₈RootLattice (checkerboardPlusLattice 8 _)`; lines 9–10 `public import` `TypeD.Plus` and `TypeE.Basic` |
| `hyperbolicPlane` | `…/Examples.lean:88` | — |
| `orthogonalSum` | `…/Orthogonal/Sum.lean:94` | — |
| `instInvolutiveNeg` | `…/Scaling.lean:263` | Form negation as scaling by −1 |
| `DiscriminantGroup` | `…/Discriminant/Group.lean:109` | — |
| `card_squareClasses_padic_two` | `NumberTheory/LocalField/SquareClass.lean:128` | README:58's "line 128" is right |
| main's manifest and toolchain | `origin/main:lake-manifest.json` revs 2fd255d9…, 1b1ccf4b…; `origin/main:lean-toolchain` v4.36.0-rc2 | The author's reason for R02 |

The 27 declarations [r3] opened at both revisions for the local-field, lattice and Mathlib names are unchanged by this diff and are not reopened.

**Cross-roadmap citations.** The changed line cites no roadmap. The citation resolver found nothing unresolved (worker's run). The overlap lead "IntegralLattices Layer 6 only an open revision defines" is the same false positive as in [r3]: `TauCetiRoadmap/IntegralLattices/README.md:1641–1643` on main defines Layer 6 and milestone 6A. No other open pull request changes this roadmap, and none drops an id it cites.

**Ownership and duplication.** The diff adds no construction, name or citation. Ownership was checked in [r3] against the open pull requests whose checkouts the brief supplies; the pull requests without supplied files were not checked.

**Headlines.** Unchanged: the four statable headlines (positive-cone decomposition, dyadic classes, two discriminant groups) are stated; the docstring names the non-statable ones and what each lacks. No stand-in and no padding was added.

**Adversarial table.** 4 fresh rows cover the changed line, the settled pin question and the Lean form; 16 rows are carried from [r3] (its fresh rows on the 4cf6a98 edits) and 115 from [r2] through [r3], covering all fifteen seeded-sample targets and every headline. Count checks are consistency checks, not proofs.

| Statement | Instances tried | Computed values on the two sides | Result; change |
| --- | --- | --- | --- |
| README:52 locator "Basic.lean lines 63–73" (the changed line) | `git show <rev>:…/Basic.lean` at 2fd255d and a91d3aa | Line 63 `structure IntegralLattice where`; lines 64–73 = 5 docstring lines + 5 fields (`carrier`, `form`, `isLattice`, `isSymm`, `le_dual`); line 74 blank; 0 fields named nondegenerate at either revision | Exact at both revisions; R01 repaired; no change |
| Pins (README:44, :52; Suggested.lean:15–16) versus the branch manifest | `origin/main:lake-manifest.json`, `origin/main:lean-toolchain`; branch manifest | Main: Tau Ceti 2fd255d9, Mathlib 1b1ccf4b, Lean v4.36.0-rc2 = the stated pins. Branch: a91d3aa, 6b7abb3c, v4.35.0-rc3; merge base ae2562c | The README's pins are main's; the author's reason holds; R02 settled, no folder change |
| README:54 locators at the stated pin | `TypeD/Plus.lean`, `TypeE/Basic.lean`, `D8Plus/Isometry.lean` at 2fd255d | `checkerboardPlusLattice` at `Plus.lean:160`; `typeE₈RootLattice` at `TypeE/Basic.lean:676`; isometry at `Isometry.lean:292` targets `checkerboardPlusLattice 8`; public imports at lines 9–10. At a91d3aa the target is `d8PlusLattice` (`Isometry.lean:298`) | True at the stated pin; the Lean file names only objects present at both revisions |
| Lean form at this head | `lake env lean`; 12 `#check @name` | 4 `sorry` warnings (lines 51, 69, 117, 123), 0 errors; 12 types elaborated, 0 lost binders (no `variable` block); Lean file identical to 4cf6a98 | Elaborates at the branch pin; no change |
| `enriquesNumericalLattice` (README:54, §1.26, §0.4 Needs; Suggested.lean:44–46) | Mathlib `CartanMatrix.E 8` negated, plus U; leading minors | E₈ leading minors 2,4,6,5,4,3,2,1 and det 1 (positive definite); det(U⊕E₈(−1))=(−1)·1=−1; diagonal 0,0,−2⁸ (even); signature (1,9) | Same even unimodular (1,9) lattice as the former D₈⁺ model, via `typeE₈IsometryD8Plus`; no change; carried from [r3] |
| `positive_cone_decomposition` on the new carrier | h=d=e+f; h=e+f, d=2e+f+r₁; h=e+f, d=3e+3f+r₁+r₂ with adjacent roots (r₁·r₂=1); control d=−(e+f) | (h²,d²,d·h)=(2,2,2): split e,f, squares 0,0, pairings 1,1. (2,2,3): split e, e+f+r₁, squares 0,0, pairings 1,2. (2,16,6): split e, 2e+3f+r₁+r₂, squares 0,10, pairings 1,5. Control: d·h=−2 violates the hypothesis | Holds in all three; hypotheses match Lang1983 Theorem 4.2, line 760; the statement is isometry-invariant, so the carrier swap keeps its truth value; carried from [r3] |
| `firstLattice_discriminant_group` (now order and exponent) | Exact inverse of `firstGram`; Smith form; the 2¹⁰ dual combinations; rank-one control [−4] | det −4; inverse denominators {1,2}, so 2N₁⁻¹ is integral and N₁⁻¹ is not; Smith 1⁸,2,2; 4 classes, half-norms 0,0,0,1/2. Control [−4]: order 4, exponent 4 | True. Order 4 with exponent 2 forces (ℤ/2)², so it is equivalent to the former `≃+` form; matches SCH23 lines 1858–1859; carried from [r3] |
| `secondLattice_discriminant_group` | Exact inverse of `secondGram` (D₈(−1)⊕U) | det (4)·(−1)=−4; inverse denominators {1,2}; Smith 1⁸,2,2; 4 classes, half-norms 0,0,0,1/2 | True; matches SCH23 lines 1931–1932; carried from [r3] |
| New §6.2 Check (exponent and [−4] control) | N₁ and [−4] | 2N₁⁻¹ integral → every class has order ≤2; [−4]: dual (1/4)ℤ, quotient ℤ/4, order 4, exponent 4 | The Check is correct and separates the two order-four groups; carried from [r3] |
| One-tactic probe on the four admitted theorems | `rfl`, `simp`, `simp [firstLattice]`/`[secondLattice]`, `norm_num [lattice, Gram]`, `infer_instance` | 0 of 12 attempts closed. `simp [firstLattice]` leaves both conjuncts: `natCard_discriminantGroup_ofGramMatrix` needs `det ≠ 0`, and no lemma gives the exponent | Not padding; it is the same content as the headline [r1] retained; carried from [r3] |
| LocalFieldsRamification contract (README:19, :58) | ℚ₂ and ℚ₃ in `card_squareClasses` and `unitFiltration_le_range_powMonoidHom_two_iff` | ℚ₂: 4·2¹=8, equal to `card_squareClasses_padic_two`; ℚ₃: 4·3⁰=4. Depth 2v(2)+1: ℚ₂ gives 3, and U(ℚ₂,2) contains 5, which is not a square (`Padic.not_isSquare_five`), while 1+8ℤ₂ consists of squares; ℚ₃ gives 1 | The prose matches the pinned statements at both revisions; carried from [r3] |
| §3.6 Needs (dyadic representatives) | All 8 triples | 1,5,2,10,−1,−5,−2,−10: eight distinct classes = `card_squareClasses_padic_two` | Supplier names resolve at both revisions; carried from [r3] |
| §3.8 Needs | ℚ₂ˣ/(ℚ₂ˣ)² | Group of order 8; the difference of two covers is one element of it, and its class 5 has order 2 | Consistent; carried from [r3] |
| §3.9 unramified model and twist | z²−z−1 versus z²−2 over ℤ₂; X²+X+1; c=(−1)^e2^a5^b | Discriminants 5 (unit: étale) versus 8 (ramified); 5·(−3)=−15≡1 mod 16, so the same quadratic extension. c·(−1)^e2^a=4^a5^b∈{1,5} mod squares; among 1,−1,2,−2 only 1 lies in {1,5} mod squares (−1≡7 mod 8; ±2 odd valuation), so u is unique | `isUnramified_iff_etale` and `existsUnique_isUnramified_finrank_eq` at f=2 apply; [3.6] correctly added to Needs; carried from [r3] |
| §3.7 global twist (sample; adjacent to changed §§3.6, 3.8) | All 8 triples | r·u=1,5,4,20,1,5,4,20; 5^b(2^a)² gives the same list | Freshly recomputed; unchanged; carried from [r3] |
| Layer 3 dependencies; WeilConjectures §§7.13–7.14 | q=2,4 | 1+10·2+4=25; 1+10·4+16=57 | The only change is that the local-field supplier is now cited by its declarations; consistent; carried from [r3] |
| §4.1 Needs: field change by NeronModelsAndSemistableAbelianVarietiesPartII §2.1 | k versus k̄; E×P¹ | Néron Part II §2.1 says field extension gives the base-changed fibration; the K3 §6.0b invariance runs only between algebraically closed fields | The repointed supplier is correct; carried from [r3] |
| §4.2 rewritten route | χ(O_J)=1, T=0; inverted-L control | deg L=−χ−length T=−1 ⇒ R¹j_*O=O(−1); ω=j*(O(−2)⊗O(1))=O(−F); h⁰(ω²)=h⁰(O(−2F))=0; h¹(O_J)=h¹(ℙ¹,O)+h⁰(O(−1))=0. Inverted L: R¹=O(1) with h⁰=2 and ω=O(−3F) | Agrees with the Néron Part II §4.1 Check (rational Jacobian: L≅O(−1)) and the K3 §6.0b Check (χ=2: O(−2), ω=O); carried from [r3] |
| Split between K3 §6.0b and Néron Part II (README:20, :74, :75) | Supplier text at the heads | K3 §6.0b covers no multiple Jacobian fibres, invertible R¹j_*O and χ(O_X)=χ(O_J), quasielliptic case included, and consumes Néron Part II §§2.1, 4.1–4.2, 4.17 | Matches both suppliers; no dual ownership; carried from [r3] |
| §0.4 Needs: IntegralLattices 6A | Signature (1,9) | k=(9−1)/8=1, so the even case gives U¹⊕E₈(−1)¹ | Main defines 6A (IntegralLattices README:1643); the overlap lead is a false positive; carried from [r3] |
| Scope, conventions, supplier §7.12; downstream paragraph | Classical and nonclassical characteristic-two surfaces; K3 and abelian controls | χ(O)=1−0+0=1 or 1−1+1=1; K3 χ=2 and abelian χ=0 fail; b₂=ρ=10 in both Enriques cases | Correct supplier section; no classical-only narrowing; carried from [r2] |
| 0.2 Pic^τ | μ₂, α₂, constant ℤ/2 in characteristic two | Lengths 2,2,2 versus geometric point counts 1,1,2 | Rechecked after supplier repair; carried from [r2] |
| 0.3 coherent invariants | Classical and nonclassical characteristic-two cases | (h¹,h²)=(0,0),(1,1); both give 2(h¹−h²)=0=b₁ and χ=1 | Nonclassical case retained; carried from [r2] |
| 1.1 half-fibre | Smooth 2E, double IV*, zero divisor | 2E=2E; central coefficient 2·3=6 versus twice reduced support 2; twice zero 0≠2E | Supplier edit preserves multiplicities; carried from [r2] |
| 1.2 curves and two-sections | Root, conjugate pair, degree-four curve | p_a=1−2/2=0; conjugate union has square −2 but two geometric components; R·F=2 gives R·2F=4≠2 | Geometric integrality and degree conditions unchanged; carried from [r2] |
| 1.3 canonical-type fibration | Primitive D and 2D | D²=(2D)²=0; coefficient gcd 1 versus 2; same pencil, multiplicities 1 versus 2 | Full and half fibres remain distinct; carried from [r2] |
| 2.1 family | Constant family over k[ε]/ε²; P² | Fibre dimension 2 in both; Enriques b₂=10 versus P² b₂=1; ε²=0 changes the base, not the geometric fibre | Nonreduced bases retained; carried from [r2] |
| 2.3 relative invariants | R=k[ε]/ε²; R[t]/t² versus R[t]/(t²,εt) | Special-fibre lengths 2 in both; total lengths 4 versus 3; coherent pairs (0,0),(1,1) both give 0=2(h¹−h²) | Flatness contract still required; carried from [r2] |
| 3.2 numerical constancy and count | Residue p=2,3; extension F₄ | 1+10·2+4=25; 1+10·3+9=40; 1+10·4+16=57 | Repaired citation supplies these without full Picard constancy; carried from [r2] |
| 3.3 local projectivity | Z₂ and Z₃; section splitting | 25>0 and 40>0; s* f*=id gives obstruction-map kernel 0; an open containing the closed point of Spec R is all Spec R | Section and Noetherian local hypotheses retained; carried from [r2] |
| 4.4 and repaired LLR reference | Simple versus double torsor fibre; split I₂ over F₂ | Simple multiplicities 1=1; double torsor versus Jacobian 2≠1; on each I₂ component, 3−2=1 smooth rational point remains | Residue-field isomorphism stays in §4.4; supplier §3.11 compares geometric type; carried from [r2] |
| 4.10 auxiliary count | I₁, nonsplit I₁, I₂, nonsplit I₂, additive r=7; II*+E₄+I₁ | Counts 2,4,4,6,15; 19+4+2=25=1+20+4 | Num-only total precedes Jacobian Picard constancy; carried from [r2] |
| 5.2 quasielliptic component sum | Three rational base points; component triples | 10=2+Σ(r−1)=Σr−1, hence Σr=11; 9+1+1=11, 8+2+1=11, 7+2+2=11 | Rank normalization retained; carried from [r2] |
| 6.4 affected generic Picard quotient | L=T and degree 2m; either index-two lattice | T−(T·F)T=0; degree(L−mT)=2m−2m=0; index √4=2; Pic⁰ order 2 versus infinite Pic⁰⊕ℤ | Deleted Lean cardinality statements are not prerequisites; carried from [r2] |
| SCH23 Corollary 7.2 field-subscript control | Projective plane over F₄ | 1+1·4+4²=21=#P²(F₄); the descended P² has 7 F₂-points, not 21 | Source subscript misprint; roadmap uses F_q correctly; carried from [r2] |
| Conventions: full/half fibre | R·F=1; F·F′=1 | R·2F=2·1=2; (2F)·(2F′)=4·1=4 | Consistent; none; carried from [r2] ([r1]) |
| Conventions: signs and Frobenius | U basis e,f; a root; q=2,4 | e²=f²=0, e·f=1, (e+f)²=2; root²=−2; untwisted eigenvalues 2,4 versus twisted 1,1 | Consistent; none; carried from [r2] ([r1]) |
| Numerical-descent contract | Split/nonsplit quadric; α₂ over k[ε]/ε² | Split rank 2 versus nonsplit invariant rank 1; α₂ coordinate k-length 4 versus geometric point count 1 | Hypotheses distinguish the cases; carried from [r2] ([r1]) |
| Picard-flatness contract | Classical/nonclassical Enriques | b₁=0=2(0−0)=2(1−1); nonflat test below has length 3≠4 | Consistent conditional contract; carried from [r2] ([r1]) |
| Finite-local-group contract | α₂ over W₂(k); ramified π²=2 | Unramified Oort–Tate a,b∈(2) gives ab=0≠2; ramified a=b=π gives ab=2 | W₂ obstruction does not exclude ramified lifts; carried from [r2] ([r1]) |
| One-obstruction contract | k[[t₁,…,t₁₂]]; W[[t₁,…,t₁₂]]/(2−t₁²) | Both regular dimension 12; first has 2=0 and is not W-flat, second has 2=t₁²≠0 and is W-flat | Independent characteristic-zero premise matters; carried from [r2] ([r1]) |
| Differential obstruction contract | Classical exceptional versus supersingular | ord(ω)=2 versus 1; classical h⁰(L)=h⁰(Lω)=1 | Supersingular case correctly excluded from this input; carried from [r2] ([r1]) |
| Fontaine contract | K3 and ℙ² over characteristic zero | h²(O_K3)=1 versus required off-diagonal 0; h²(O_ℙ²)=0 | Correct obstruction, conditional on settled source; carried from [r2] ([r1]) |
| 1.4 half-fibre iff | F; 2F; 0 | Squares 0,0,0; primitive flags 1,0,0 and nonzero flags 1,1,0 | Both directions use all stated conditions; carried from [r2] ([r1]) |
| 1.5 reflection | C²=−2, D·C=−1 | (D−C)·C=1; (D−C)²=D²−2(−1)−2=D² | Reflection sign correct; carried from [r2] ([r1]) |
| 1.6 genus-one existence | U basis isotropic vector | e²=0 and divisibility gcd(1,0)=1; zero vector divisibility 0 | Numerical input consistent; geometric existence separately sourced; carried from [r2] ([r1]) |
| 1.7 multiple fibres | 2F versus candidate 3F | Primitive multiplicity gcd 2 versus 3; 2F has even intersection with every divisor | The target excludes multiplicity 3; carried from [r2] ([r1]) |
| 1.8 integral two-section | Square −2 and square 0 | Adjunction arithmetic genera 0 and 1; degree against 2F is 2 in both | Neither branch is suppressed; carried from [r2] ([r1]) |
| 1.9 classical criteria | Classical; nonclassical char 2 | (ordω,h¹,number of tame doubles)=(2,0,2); nonclassical ordω=1,h¹=1 | Correct direction and characteristic split; carried from [r2] ([r1]) |
| 1.10 canonical bundle | Distinct tame half-fibres F₁,F₂ | 2(F₁−F₂) linearly 0; numerical class 0; canonical order 2 rather than 1 | Numerical zero is not line-bundle zero; carried from [r2] ([r1]) |
| 1.11 tame types | E₂/E₄ and E₁/E₃/E₅ over F₂; semistable fibre | Traces 3−n are odd for n=2,4 and even for n=1,3,5; two tame positions exclude semistable/supersingular candidates | Consistent; carried from [r2] ([r1]) |
| 1.12 ordinary type | μ₂ versus constant ℤ/2 | Lengths 2=2; points 1≠2; dual μ₂↦ℤ/2 | Scheme condition discriminates; carried from [r2] ([r1]) |
| 1.13 classical type | Constant ℤ/2 versus μ₂ | Points 2≠1; canonical order 2≠1; dual ℤ/2↦μ₂ | Consistent; carried from [r2] ([r1]) |
| 1.14 supersingular type | α₂ versus μ₂ | Both have one point; α₂ coproduct t⊗1+1⊗t versus μ₂ extra t⊗t; α₂ self-dual | Point count alone correctly insufficient; carried from [r2] ([r1]) |
| 1.15 local canonical cover | Integral degree-two torsor versus trivial product torsor | Generic degree 2; radicial geometric fibre point count 1; trivial μ₂/α₂ torsor has nonzero nilpotent t with t²=0 | Integrality excludes trivial wrong model; carried from [r2] ([r1]) |
| 1.16 cover cohomology | K3-like cohomology | h⁰−h¹+h²=1−0+1=2 | Correct Euler characteristic; carried from [r2] ([r1]) |
| 1.17 conductrix | C≠0, B=2C; reduced tree; C=0 | C²=−2, B²=−8, χ(O_B)=4; exceptional h¹=1 gives h⁰=5; reduced tree h¹=0; empty divisor h¹=0 | Thickened divisor essential; carried from [r2] ([r1]) |
| 1.17a differential sequence | C²=−2 versus C=0 | length(W)=12+(2C)²=4 versus 12; h⁰(O_Y(2C))=1 is not h⁰(O_2C)=5 | Corrected source notation used; carried from [r2] ([r1]) |
| 1.18 exceptional iff | Special double IV*/III*/II*; ordinary | Exceptional flag 1 with special double fibre; ordinary Pic^τ=μ₂ gives exceptional flag 0 | The iff uses a rational two-section, not merely a type label; carried from [r2] ([r1]) |
| 1.19 quasielliptic restriction | III*, II*, each multiplicity 1 and 2 | Four type/multiplicity pairs all give exceptional=1 by ESB3.16; none satisfies nonexceptional=1 | Sample consistent; carried from [r2] ([r1]) |
| 1.20 special multiple restriction | Rational R with R·F=1 | R·2F=2; special-double criterion forces exceptional=1, contradicting premise 0 | Consistent; carried from [r2] ([r1]) |
| 1.21 extra-special E₈ | T₂,₃,₇ versus affine E₈ alone | Arms 1,2,6 give 1+1+2+6=10 vertices and 9 edges; affine E₈ alone has 9 vertices | Full-graph condition discriminates; carried from [r2] ([r1]) |
| 1.22 E₈ implies exceptional | Full T₂,₃,₇ | Ten-vertex graph satisfies ESB4.3; resulting exceptional flag 1 rather than 0 | Sample consistent; carried from [r2] ([r1]) |
| 1.23 partner theorem | Nonexceptional half-fibre; unique-pencil E₈ | Partner F·F′=1 versus same pencil F²=0; full intersections 4 versus 0 | Exception retained; carried from [r2] ([r1]) |
| 1.24 partner pencil | Characteristic-two nonexceptional pair | Half intersection 1 gives full intersection 4 | Consistent; carried from [r2] ([r1]) |
| 1.25 distinct pencils | F′=F; partner; hypothetical half intersection 2 | Full products 0,4,8 respectively; equality 4 iff half product 1 | Distinctness excludes zero; both directions tested; carried from [r2] ([r1]) |
| 1.26 effective/two-section application | T²>0, generic degree 2 | Two positive horizontal degrees would sum at least 4>2; exactly one remains horizontal; degree after vertical subtraction is 2−0=2 | Generic class, not just degree, preserved by vertical restriction; carried from [r2] ([r1]) |
| 2.2 relative Picard | Connected proper geometric fibre | H⁰(O)=k has dimension 1; pullback of constants is k→k, identity | Universal-functions premise retained; carried from [r2] ([r1]) |
| 2.4 canonical torsor | Canonical inclusion versus trivial torsor; empty base | Edge classes inclusion Pic^τ→Pic versus 0; nonempty Pic^τ has rank 2, so inclusion≠0; over empty base both maps uniquely coincide | Correct edge-class definition; carried from [r2] ([r1]) |
| 2.5 five-term obstruction | Section s of f | s*f*=id, so kernel f* on H² is 0; exactness gives obstruction 0 | Map directions correct; carried from [r2] ([r1]) |
| 2.6 injective pullback | Injective H² map | ker f*=0, hence image obstruction=0 | No arbitrary surjectivity of edge map assumed; carried from [r2] ([r1]) |
| 2.7 section criterion | Identity f=s=id | f*s*=id; canonical obstruction maps to 0 and was 0 | Consistent; carried from [r2] ([r1]) |
| 2.8 étale Pic torsion | Order-two ω, Pic(base)=0 | O⊕ω⁻¹ has rank 1+1=2; multiplication uses ω⁻²≅O | Existence uses trivialization of the square; carried from [r2] ([r1]) |
| 2.9 twisting | Trivial twist; twice a μ₂-class | Twist by 1 leaves class unchanged; [a]+[a]=[a²]=0; [5]≠0 over ℚ₂ | Free transitive action, not a canonical choice of origin; carried from [r2] ([r1]) |
| 2.10 constant/split Picard | ℝ-action e₁↦e₁+τ; split α₂ extension | Action squared e₁↦e₁+2τ=e₁; any lift e₁+cτ changes by τ≠0; α₂ geometric torsion points 1 versus constant ℤ/2 points 2 | Constant Num does not imply split or constant full Picard; carried from [r2] ([r1]) |
| 2.11 canonical covers | Units modulo squares with trivial Pic(base) | Unit 1 gives identity twist; 5 is nontrivial over ℚ₂; a² gives trivial class | Kummer domain and obstruction separated; carried from [r2] ([r1]) |
| 2.12 canonical order | Full constant Picard; α₂ case | Nonzero torsion class has order 2; α₂ has one geometric point and ω order 1, so fails full constancy | Sample consistent; carried from [r2] ([r1]) |
| 2.13 numerical descent | Two lifts differing by ω | Both map to same Num class; kernel has 2 elements over geometric classical field | Uniqueness is modulo ω; carried from [r2] ([r1]) |
| 2.14 nodal descent | Split rational curve over F₂ | P¹(F₂) has 3 points; conic Brauer obstruction 0 | Finite-field form is split; carried from [r2] ([r1]) |
| 2.15 fibration descent | Conic base over F₂ | Br(F₂)=0; descended base P¹ has 3 rational points | Rational base justified; carried from [r2] ([r1]) |
| 2.16 double-fibre descent | Classical fibration over F₂ | Exactly 2 tame double fibres among 3 rational base points; remaining count 1 | Multiplicity and base rationality retained; carried from [r2] ([r1]) |
| 2.17 residue-field existence | Descent of one geometric pencil | One descended pencil; its base has 3 rational points, not a selected section of the surface | No false section conclusion; carried from [r2] ([r1]) |
| 2.18 finite-field descent | F₂ and F₄ | Pic=0, Br=0 in both; P¹ point counts 3 and 5 | Sample does not specialize away the general field statement; carried from [r2] ([r1]) |
| 3.4 μ₂ branch | Pic^τ=μ₂ over ℤ₂ | Cartier dual is étale ℤ/2, degree 2 | Correct dual, not μ₂ as covering group; carried from [r2] ([r1]) |
| 3.5 four global twists | ℤ[1/2] units | ±2^n modulo squares gives {1,−1,2,−2}, cardinality 4 | All four retained; carried from [r2] ([r1]) |
| 3.7 global twist | Triples (000),(001),(010),(011),(100),(101),(110),(111) | r·u=1,5,4,20,1,5,4,20 respectively; 5^b(2^a)² gives exactly the same list | All eight products agree; carried from [r2] ([r1]) |
| 3.10 K3 cover | Étale degree 2 | χ upstairs=2·1=2, connected h⁰=1 and ω=O give h²=1, h¹=0 | Correct K3 invariants; carried from [r2] ([r1]) |
| 3.10a fundamental group | Ordinary/char≠2; classical/supersingular char2 | Orders 2 versus 1; connected étale degree d satisfies d=χ(cover)≤2 | Local canonical cover is not an étale generator; carried from [r2] ([r1]) |
| 3.11 local models | Class 5 model; odd primes | z²−z−1 mod2=z²+z+1 has values 1,1 at 0,1 and derivative 1; degree2 étale; 2 is a unit at every odd prime | Unramified residual twist extends; sample consistent; carried from [r2] ([r1]) |
| 3.12 extension splitting | Rank n=0,1,10 | Zero obstruction for each of n basis lifts gives 0,1,10 choices of lifts to make; extension rank remains n | Uses vanishing of ℤ/2 torsors, not merely constant quotient; carried from [r2] ([r1]) |
| 3.13 full Picard over ℤ | Two Oort–Tate possibilities | μ₂ branch would give K3 h²(O)=1 versus Fontaine 0; surviving ℤ/2 has two geometric points | Correct conditional contradiction; carried from [r2] ([r1]) |
| 4.5 nonrational fibres | Closed point degree 2 | Reducible flag 1 would force residue degree 1; degree 2 therefore permits only irreducible geometric fibre | Correct contrapositive; carried from [r2] ([r1]) |
| 4.6 no I₀* | Central component with four outer attachments over F₂ | Four distinct required rational points versus #P¹(F₂)=3 | 4>3 contradiction; carried from [r2] ([r1]) |
| 4.7 graph descent | Nonsplit I₁ and I₂ | Rational point counts 4,6 versus split 2,4; component labels unchanged while conjugate branches differ | Graph descent does not imply split nodes; carried from [r2] ([r1]) |
| 4.8 at most one excluded tame type | Three rational base points, two tame doubles | 3−2=1 possible semistable/supersingular position | Correct bound; carried from [r2] ([r1]) |
| 4.9 Mordell–Weil descent | Generic line bundle of degree 2; geometric Tsen | Subtracting one two-section gives degree 2−2=0; Br(k̄(t))=0 used, not Br(F₂(t)) | Domain retained; carried from [r2] ([r1]) |
| 4.11 Jacobian Picard | ρ=10,q=2 | Auxiliary total 25=1+10·2+2² | Correct maximal-count input; carried from [r2] ([r1]) |
| 5.1 fourteen elliptic rows | All fourteen displayed rows in order | Totals 19+4+2,19+2+4,17+4+4,17+2+6,17+4+4,15+3+7,15+5+5,19+4+2,13+4+8,13+5+7,16+4+5,15+4+6,17+4+4,15+4+6; all 25 | Necessary counts agree; completeness remains supplier theorem; carried from [r2] ([r1]) |
| 5.3 four quasielliptic rows | Six allowed symbols | 9+1+1=11 twice with distinct symbols; 8+2+1=11; 7+2+2=11; 7+2+1=10 fails | Exactly four symbol triples; carried from [r2] ([r1]) |
| 5.4 forced doubles | Additional IV*+E₄+Ĩ₂ | Ĩ₂ cannot be tame double; two remaining positions = two required doubles | Added nonsplit branch retained; carried from [r2] ([r1]) |
| 5.5 simple III* | III*+E₄+I₂; III*+E₂+Ĩ₂; III*+E₄+E₄ | First two reserve one simple semistable slot and force III* double; last has two smooth double slots | One simple-III* candidate remains; carried from [r2] ([r1]) |
| 5.6 forbidden rational bisection | R·F=1, R²=−2 | R·2F=2; special-double criterion gives exceptional=1 versus premise 0 | Consistent; carried from [r2] ([r1]) |
| 5.7 three new exclusions | Three added Jacobian rows | Counts 15+4+6=25,17+4+4=25,15+4+6=25 | Counts do NOT exclude them; new proof target correctly explicit; carried from [r2] ([r1]) |
| 5.8 F₂ partner | Descended F,F′ | Intersection remains 1 after extension; full intersection 4 | Correct descent invariant; carried from [r2] ([r1]) |
| 5.9 I₈ elimination | I₈+E₄+III candidate | Points 16+4+5=25; root rank 7 | Count alone insufficient; graph/partner proof retained; carried from [r2] ([r1]) |
| 5.10 II* elimination | II*+E₄+I₁; II*+II+II | Counts 19+4+2=25 and 19+3+3=25; E₈ root rank 8 | Uses exceptionality/partner geometry, not count alone; carried from [r2] ([r1]) |
| 5.11 no double I₄* | I₄*+E₄+E₂; quasielliptic version | Counts 19+4+2=25 and 19+3+3=25; primitive central coefficients doubled 2→4 | Multiplicity remains a separate restriction; carried from [r2] ([r1]) |
| 5.12 IV* elimination | IV*+E₃+IV; IV*+E₅+III | 15+3+7=25;15+5+5=25; smooth E₄ in extra row has 4 points, not the other half-fibre type | New row correctly handled in §5.7; carried from [r2] ([r1]) |
| 5.13 IV elimination | D₅ and A₂ components in same fibre branch | Required additional incidence lower bound 3 versus available 2 | 3>2 contradicts the branch; carried from [r2] ([r1]) |
| 5.14 residual list | Fourteen elliptic plus four quasielliptic | 18 candidates minus 9 elliptic and 1 quasielliptic removals =8; 5 elliptic+3 quasielliptic | Requires both classification obligations; carried from [r2] ([r1]) |
| 5.15 residual multiplicities | I₁*, I₄*, semistable | Multiplicities 2,1,1 respectively | Matches tame exclusions and §5.11; carried from [r2] ([r1]) |
| 6.1 firstGram/firstLattice | e₁,e₁/2,e₁+e₂,−2e₁; entries | Norms −2,−1/2,−2,−8; e₁/2 outside ℤ-span; entries (8,3)=1,(8,9)=1,(9,9)=0 | Native carrier excludes rational wrong model; carried from [r2] ([r1]) |
| 6.1 secondGram/secondLattice | Same vectors; fork and U entries | Same four norms; (8,3)=0,(8,8)=0,(8,9)=1,(5,6)=(5,7)=1 | Distinguishes the two matrices; carried from [r2] ([r1]) |
| 6.5 generating two-section | Nontrivial coset in group of order2 | [R̃]≠0, 2[R̃]=0; degree2 retained; self-intersection possibilities −2,0 | Coset-preserving refinement stated; carried from [r2] ([r1]) |
| 6.6 spinor incidences | Four cross-tip pairs versus same-end pair | Cross-tip q=0; {0,1} and {7,8} vector-class q=1/2; weighted degree2 in each | Even overlattice excludes wrong pair; carried from [r2] ([r1]) |
| 6.7 square-zero calculation | C₈*+nR*+F*, n=0,1,2 | Square −2−2+2·2+2n=2n gives 0,2,4; square0 iff n=0 | Sign and factor2 agree; carried from [r2] ([r1]) |
| 6.8 first forbidden graph | Smooth locus of chosen half-fibre | Required distinct rational points ≥3 versus available2 | 3>2 contradiction; carried from [r2] ([r1]) |
| 6.9 opposite-tip argument | Remaining cross-tip orbit | Weighted degree 1+1=2; same spinor q=0; forbidden completion reached without using §6.12 | No local dependency cycle; carried from [r2] ([r1]) |
| 6.10 second forbidden graph | R·C₀=2,R·C₂=1 | Full fibre incidence 2+2·1=4; paired half-fibres intersection1 | Both spinor branches retained; carried from [r2] ([r1]) |
| 6.11 I₄* incidences | Weights (1,1,2,2,2,2,2,1,1) | Degree2 vectors: 4 doubled tips+6 tip pairs+5 internal=15; orbit sizes 1,2,2,2,4,4 sum15 | Six orbits confirmed; carried from [r2] ([r1]) |
| 6.12 no I₄* | Elliptic and quasielliptic I₄* candidates | Two type triples, six incidence orbits each; all use the preceding exclusions; raw counts still25 | No count-only shortcut; carried from [r2] ([r1]) |
| 7.1 no multiple III* | Primitive auxiliary D and C₆ | D·C₆=1; full fibre 2D gives2; two remaining III slots contain exactly one additional double fibre | Parity retained; not both additional fibres declared simple; carried from [r2] ([r1]) |
| 7.2 III* incidences | Weights (1,2,2,3,4,3,2,1) | Degree2 vectors 2 doubled tips+1 tip pair+3 weight2 entries=6; reversal orbit sizes1,1,2,2 | Four cases independently confirmed; carried from [r2] ([r1]) |
| 7.3 no simple III* | C₂ and double-terminal branches | Required full-fibre intersection ≥8 versus4; terminal construction gives2 versus minimum4 | Both contradictions use full fibres; carried from [r2] ([r1]) |
| 7.4 restricted configurations | I₁*+I₄; I₂*+III+III | Root ranks 5+3=8 and6+1+1=8; partner construction produces IV*/I₀*/I₄ outside the two allowed patterns | No characteristic-two lemma applied universally; carried from [r2] ([r1]) |
| 8.1 tangent cohomology | (0,10,0);(1,12,1) | χ=0−10+0=−10;1−12+1=−10; also −c₂+2χ(O)=−12+2=−10 | Source sign error not propagated; carried from [r2] ([r1]) |
| 8.2 supersingular W₂ obstruction | Pic^τ=α₂ | a,b≡0 mod2 gives ab=0 in W₂, whereas rank-two lift needs ab=2≠0 | Correct nonlifting check; carried from [r2] ([r1]) |
| 8.3 lifting iff | Ordinary/nonexceptional classical versus exceptional/supersingular | Obstruction h²Θ=0 versus1; ω orders1 or2 distinguished; exceptional h⁰(L)=h⁰(Lω)=1 | Separate α₂ and differential routes; carried from [r2] ([r1]) |
| 8.3a ramified characteristic-zero lift | V with π²=2 | 2=π², ramification2; quotient V/(π²) has 2=0 whereas W₂(k) has 2≠0 | Ramified lifting does not contradict W₂ nonlifting; carried from [r2] ([r1]) |
| 8.4 miniversal ring | Smooth case; regular ramified hypersurface | dim W[[t₁,…,t₁₀]]=11; dim W[[t₁,…,t₁₂]]/(2−t₁²)=12; e=1 versus2 | Dimension and ramification equivalences consistent; carried from [r2] ([r1]) |
| 8.5 modulo-four obstruction | ℤ/4→W₂(F̄₂) | 2≠0, 2²=0 on both; reduction is a scheme, so nilpotent thickening is a scheme | Algebraic-space scope preserved; carried from [r2] ([r1]) |
| 8.6 finite-field endpoint | Residual eight cases | Remove2 I₄*+4 III* cases from8, leaving2 forbidden universal patterns | Conditional proof chain closes after both classification obligations; carried from [r2] ([r1]) |
| 8.7 integral endpoint | Hypothetical ℤ family reduced mod4 and mod2 | Full Picard constancy=1; exceptional flag forced0; §8.6 excludes their conjunction | No exclusion of prime2 or weakening to schemes; carried from [r2] ([r1]) |
| SCH23 rank-two group-law control | a=1,b=2,f=g=1 over ℤ | Printed plus law gives4 with4²=16≠4; minus law gives0 with0²=0 | Sign misprint; supplier uses the minus sign; carried from [r2] ([r1]) |
| DI21 proof control | W₂(k)[t]/t² and W₂(k)[t]/(t²−2), characteristic two | Both free rank2 with reduction k[t]/t²; lifted t squares are 0 versus2≠0; in the second ring a lift a+bt of t has a∈2W₂, b a unit, and square 2b²≠0 | Scheme-lift uniqueness step is false; see Source issues; carried from [r2] ([r1]) |

## Not verifiable

- No elaboration was run at the pins the README names (Mathlib 1b1ccf4, Tau Ceti 2fd255d, Lean v4.36.0-rc2): the brief allows Lean only from this worktree, whose manifest pins a91d3aa and 6b7abb3c. Elaboration at the stated pins is checked by reading only: every imported module exists there, and every name the file uses exists there with the same binders ([r3], reconfirmed above for the lattice names). The branch will be built at main's pins when it is rebased or merged.
- CDL2021, BM1977 and Fontaine remain settled as waived, and CD89 and LLR04 as uncertified. No locator that depends on them changed, and no text was requested.
- Untouched statements and locators were not re-read this round; their evidence and limits are those of [r3], [r2] and [r1].
- The fourteen-case completeness and the three extra configuration exclusions remain explicit proof obligations. The six declared supplier gaps are unchanged.

## Source issues

- none

[r1]: packages/EnriquesSurfacesAndIntegralNonexistence/reports/PRREVIEW-EnriquesSurfacesAndIntegralNonexistence~1.md
[r2]: packages/EnriquesSurfacesAndIntegralNonexistence/reports/PRREVIEW-EnriquesSurfacesAndIntegralNonexistence~2.md
[r3]: packages/EnriquesSurfacesAndIntegralNonexistence/reports/PRREVIEW-EnriquesSurfacesAndIntegralNonexistence~3.md
