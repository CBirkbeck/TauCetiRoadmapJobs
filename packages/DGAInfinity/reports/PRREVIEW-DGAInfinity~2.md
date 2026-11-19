# Review of DGAInfinity (pull request #2574 at 5328c9a)

**Verdict:** needs changes

**Summary.** This head repairs every finding, correction and note of the previous review. Two new findings block acceptance, each fixed by one clause:
- The §0.2 target says the completed reduced tensor coalgebra fails to be conilpotent whenever `M ≠ 0`. Over `ℤ` with `M = ℚ/ℤ` every tensor power of length two or more vanishes, so the claim is false over the roadmap's general base.
- The §8.3 statement that the transferred `m₃` lies in the triple Massey product drops the hypothesis that the product is defined. Tau Ceti's theorem carries that hypothesis.

There are two small corrections and two format notes, and one question for the author. Two ownership facts are left to the human reviewers: the `K₀` sequence that HopfologicalAlgebra §6.1 also states, and the graded names kept for StablePeriodicCurved.

## R01 (P2) — §0.2 claims that the completed reduced tensor coalgebra is never conilpotent for `M ≠ 0`, which fails over a general commutative ring

An implementer asked to prove this target over the roadmap's base, a commutative ring `k`, would be asked to prove something false. The README (lines 299–301) asks to "prove that the completed reduced tensor coalgebra is not conilpotent as soon as `M ≠ 0`, so that direct-sum and product versions are never identified".

Take `k = ℤ` and `M = ℚ/ℤ`. For `x ⊗ y` with `n·y = 0`, write `x = n·x′`; then `x ⊗ y = x′ ⊗ n·y = 0`, so `M ⊗_ℤ M = 0` and every tensor power of length at least two is zero. The completed reduced tensor coalgebra is then `M`, concentrated in length one. Its reduced deconcatenation is zero, so it is conilpotent and equals the direct-sum version.

The carrier admits this input. Tau Ceti's `TauCeti.CompletedReducedTensorWords` (`TauCeti/LinearAlgebra/TensorCoalgebra/ReducedCompleted.lean`, line 35) is the product of `TensorPower R n M` for `n > 0`, over any commutative semiring. The Check below the target uses `M = k·x`, which is free, and is correct.

The smallest repair: "… is not conilpotent as soon as every tensor power `M^{⊗n}` is nonzero (for instance `M ≠ 0` over a field, or `M` with a nonzero free direct summand), so that the direct-sum and product versions are then distinct."

## R02 (P2) — §8.3 places the transferred `m₃` in the triple Massey product without requiring the product to be defined

Without the hypothesis, the target is false whenever `x·y ≠ 0` or `y·z ≠ 0`, because the triple Massey product is then empty. Two sentences are affected:
- Line 1454 describes Tau Ceti's theorem: "Over a field, the `m₃` of the minimal model of §3.4 lies in it".
- Lines 1460–1462 state the ring-level target: "the transferred `m₃` lies in the triple Massey product".

Neither says `x·y = 0 = y·z`. Tau Ceti's `TauCeti.AInfinityAlgebra.minimalModel_m_three_mem_tripleMasseyProduct` (`TauCeti/Algebra/Homology/AInfinity/Algebra/Transfer/Massey.lean`, line 60) assumes `hxy : x * y = 0` and `hyz : y * z = 0`. Its companion `tripleMasseyProduct_nonempty_iff` (`…/Algebra/Massey.lean`, line 228) shows the set is empty otherwise.

An instance: `A = k` in degree zero with `x = y = z = 1`. Here `m₃^H(1, 1, 1) = 0`, while `⟨1, 1, 1⟩ = ∅` because `1·1 ≠ 0`.

The repair is to add "when `x·y = 0` and `y·z = 0`" to line 1454, and "whenever `x·y = 0 = y·z`" to the target at line 1462. The `n`-fold statement two sentences later already carries its hypothesis.

## C01 — The `n`-fold Massey statement of §8.3 has no source that proves it as written

The Layer 8 introduction (lines 1363–1365) credits May and Keller, Introduction, Section 3.3, for "the comparison with transferred products". Keller's §3.3 only remarks that higher products lift Massey products whenever these are defined (KellerIntro2001 lines 295–297, p. 8). That is broader than the README's statement and proves nothing.

The README's version (lines 1462–1466), with vanishing of `m_k` on consecutive sub-tuples for `2 ≤ k < n`, is true. Here is the route:
1. Let `f : H → A` be the transferred inclusion.
2. In each arity `ℓ < n`, the component equation of §2.2 on `(x_{i+1}, …, x_j)` loses every term `f_u(1 ⊗ m_s ⊗ 1)` by the hypothesis. It reduces to `d f_ℓ = Σ ± f_a f_b`, so the `± f_{j−i}(x_{i+1}, …, x_j)` form a defining system.
3. In arity `n`, the only surviving left-hand term is `f₁ m_n(x)`, so the Massey cycle is cohomologous to `± i(m_n(x))`.

Cite that route (§2.2's component equation) at the claim, or a source that states this hypothesis. Buijs, Moreno-Fernández and Murillo (arXiv 1801.03408, Theorem 3.2) prove a variant under global vanishing of `m_k` for `k ≤ n − 2`. Their Example 2.6 shows that "whenever defined" alone does not suffice for `n ≥ 4`.

## C02 — The Layer 5 introduction still credits Balmer–Schlichting with a construction the layer no longer uses

Line 1034 reads "Balmer–Schlichting supplies triangulated idempotent completion". §5.5 now triangulates `Perf(C)` as a thick subcategory of `D(C)` (lines 1147–1148). Scope and ownership says no section uses the triangulated structure on idempotent completions (lines 1868–1869). Dropping the clause, or saying that Balmer–Schlichting explains the idempotent-completion caveat of Layers 7 and 10, would remove the contradiction.

## N01 — A few targets still carry no locator at the claim

These are §6.5, the Morita bicategory (line 1250; Toën, Sections 4, 6 and 7, from the layer introduction, would do), §10.3 (line 1656) and §10.4 (line 1672; Bondal–Kapranov appears only in the layer introduction).

## N02 — §9.1's "proper" is the locally proper notion, and Keller's survey uses a different one

Line 1526 calls `C` proper when every Hom complex is perfect. Keller's survey §4.7, cited for this layer, calls a DG category proper when it is Morita equivalent to a DG algebra with perfect underlying complex (KellerICM2006 lines 908–909). The two agree for finitely many objects, and a clause saying so would avoid confusion.

## Questions for the author

- §2.4 (lines 684–685) identifies `(A, B)`-bimodules "whose right action is strict" with right `A∞` modules over `Aᵒᵖ ⊗ B`. Does "strict" mean that `b_{i,j} = 0` for `j ≥ 2` only, or also that the mixed components `b_{i,1}` vanish for `i ≥ 1`? A right module over `Aᵒᵖ ⊗ B` pairs each `a`-input with a `b`-input slot by slot, so we could not tell which bimodules the comparison covers, and no source is cited for it.

## Earlier findings

- R01 (cycle with HopfologicalAlgebra and GeneralAlgebraicKTheory): repaired. §5.5 now reads "identify their `H⁰` with `Perf(C)`, triangulated as a thick subcategory of `D(C)`". §7.4 states "`K₀(S) → K₀(T) → K₀(T/S) → 0` is exact (Chebolu …)" itself. Both supplier contracts are gone.
- R02 (§9.2 symmetric algebras): repaired. The Check now reads "A symmetric algebra is smooth only when it is semisimple … `k` itself is both left and right `0`-Calabi–Yau".
- C01 (Keller 1994 "Theorem 8.0"): repaired. It now reads "Section 8.1, Theorem, with Lemma 4.2(c) and Section 5.3, Theorem".
- C02 (Keller ICM §5): repaired. It now reads "Section 4.7".
- C03 (Convention 12 cites §2.2): repaired. It now reads "the inverse-up-to-homotopy theorem of §3.5".
- C04 (moved contents): repaired by the paragraph "Former layer placement".
- C05 (obstruction lemma): repaired. Lines 1487–1492 now describe both Tau Ceti lemmas with their hypotheses.
- C06 ("exactly when"): repaired. The Lean name is attached to the forward direction, and `TauCeti.AInfinityHom.Homotopy.cohomologyMap_eq` covers the converse.
- C07 (`LinearHasDegree`): repaired by documentation, which states it is `TauCeti.LinearMap.IsHomogeneous` in the form `isHomogeneous_def` unfolds to. Verified by `rw [isHomogeneous_def]; rfl`.
- C08: repaired (heading "Owned elsewhere."). C09: repaired (the description says the list is not complete).
- N01: repaired ("Section 1.2"). N02: repaired (Convention 14). N03: partly repaired: §7.3 now has locators, while §§6.5, 10.3 and 10.4 still lack them (N01 above).
- Question on §8.3: not answered in the text. This round settles it by computation (C01).

## Verified sound

| Statement | Instances tried | Values computed (README / source or library) | Result |
|---|---|---|---|
| §0.2 conilpotence (R01) | `k=ℤ, M=ℚ/ℤ`; `M=k·x` | `M⊗M=0`, completed coalgebra `=M`, `Δ̄=0`: conilpotent; for `k·x`, `x^{⊗n}` survives `n` deconcatenations | false as stated |
| §0.2 Check, coderivation twist | `q` odd, `x₁⊗x₂` | `b x₁⊗x₂ + (−1)^{q|x₁|} x₁⊗b x₂`; untwisted fails coderivation law | true |
| §0.3 Check braiding | `k⟦1⟧⊗k⟦1⟧` | degree `−2`, sign `(−1)^{(−1)(−1)} = −1` vs unsigned `+1` | true |
| §1.1 Checks | `Λ(x,y)`; `k[x]/x²`, `|x|=1` | `xᵒᵖyᵒᵖ = −(yx)ᵒᵖ = (xy)ᵒᵖ`; `(1⊗x)(x⊗1) = −x⊗x` | true |
| §1.2 Check | `p=q=1`; `Λ(x)` | `f≫g = −g∘f`; `H⁰` endomorphisms `= k`, `Z⁰ = H⁰` | true |
| §1.4 target | `A = k`, Tau Ceti `singleObjFunctor` | essential surjectivity not at pin (grep), target stands | true |
| §2.4 Check | `A = k[x]` | coaugmented bar `A⊗Tᶜ(sA)⊗A` resolves `A`; `k[x,y]` free over `Aᵉ`, `A` not | true |
| §3.1 Check | `k[ε]/ε²`, `|ε|=−1`, `dε=1` | `d(ε²)=ε−ε=0`, `H=0`: formal; `m₁ε=1`: not minimal | true |
| §3.3 tree formula | Keller2006 lines 193–216; `n=3`; `h=0` | three trees give `m_three_transfer`; `h=0`: `m₂` only | true |
| Layer 3 Heisenberg | `Λ(a,b,c)`, `dc=ab` | `H` dims 1,2,2,1; `m₃([a],[a],[b]) = −(−1)^1 p(ac) = [ac]`; `m_{≥4}=0` by tree argument | true |
| Keller four-vertex example | KellerIntro2001 lines 278–295 | composable non-unit strings ≤ 3 over `k⁴`: `m_{≥4}=0`, `m₃(a,b,c)=e` degree 2 | true |
| §3.5 Lean (Whitehead) | Keller 3.7(b) line 507; `k[ε]→0` | `h₁(1)=ε`: `dh₁+h₁d = 1` on `1, ε`; one-tactic probe fails | true |
| §3.5 Lean (strictification) | Keller2006 Prop 2.4 line 305; `A=0`; minimal degree 0 | `B=0`, `e=0` strict; `m_n=0` for `n≠2`, c-unit = strict unit | true |
| §4.4 Checks | `k⟨x⟩`, `dx=x²`; `Λ(x,z)` | `dx−x²=0`; `δ=−x`: 0; `x`: `2x²`; twisted `z ↦ 0` vs `−2xz` | true |
| Conv. 10 / (7.1) | KellerIntro2001 lines 966–970 | Koszul sign of `s^{⊗n}` on `α^{⊗n}`: `(−1)^{n(n−1)/2}`; DG: `dα−α²` | true |
| §5.4 envelope | Tau Ceti decls; Drinfeld2004 line 337 | `Cone(f) = (Y⊕X[1], f)`; `isLeast_isoClosure_oneSided` exists | true |
| §5.5 Check | `D(k)` | compact = finite total dimension; `⨁ k` not compact; `tria = Perf` | true |
| §6.3 Check | `k`, `M₂(k)` | Morita via `k²`; `H⁰` endomorphisms `k ≇ M₂(k)` | true |
| §6.4 + H4 Morita | KellerDeriving1994 lines 509–514, 646, 1073–1080; `G=k⊕k⟦1⟧` | `RHom(G,G)`: dim 2 in degree 0, 1 in each of `±1` | true |
| §7.1 Check | `k⟨ε⟩`, `dε=1` | `d(εx)+ε dx = x`: acyclic | true |
| §7.4 sequence | Chebolu2006 lines 459–466; `B={k⊕k}` | `K₀=ℤ`, `B` gives `2ℤ`, thick closure `ℤ`; quotient 0 | true |
| Layer 7 example | `1→2→3`, `B={P₂}` | `P₁ ↦ S₁`, `P₃` fixed, Ext between `S₁, S₃` zero; `ℤ→ℤ³→ℤ²→0` | true |
| §8.1 Checks | `k`, `M₂(k)`; first order | `HH⁰=k`, `HH^{≥1}=0`; `Der` ranks 0 and 3; cocycle `aφ(b,c)−φ(ab,c)+φ(a,bc)−φ(a,b)c` | true |
| §8.3 triple (R02) | `A=k`, `x=y=z=1`; Massey.lean 60, 228 | `⟨1,1,1⟩=∅`, `m₃=0`; Tau Ceti assumes `xy=0=yz` | missing hypothesis |
| §8.3 `n`-fold (C01) | arity-`ℓ` morphism equations | `ℓ<n`: `d f_ℓ = Σ ± f_a f_b`; `ℓ=n`: cycle `∼ ± i m_n(x)` | true; locator |
| §8.4 obstruction | Invariance.lean 496, 524 | `ℚ`-algebra, `m₃…m_{n+1}=0`, same grading and `m₂`: as README states | true |
| Layer 8 example | `⟨[a],[a],[b]⟩` | indeterminacy `[a]H¹+H¹[b] = 0`; value `{[ac]}` | true |
| §9.2 Check | `k`, `k[ε]/ε²` | `k! = k ≅ k[0]`; dual numbers infinite gl. dim; self-injective + finite gl. dim ⇒ semisimple | true |
| §9.3 Check | `C=k`, `n=2` | `|t| = 1−n = −1`; loop Adams `0+2=2`, reverse arrow `−1+2=1` | true |
| §10.2–10.3 Checks | `1→2`; paths | `χ(S₁,S₂)` `−1`/`0` swapped for right modules; `χ(P_i,P_j)=χ(P_j,I_i)=#paths j→i` | true |
| §10.5 | `p[k]` in char `p` | `ch(p[k]) = p·1 = 0` in `k`; `χ = p` in `ℤ` | true |
| Layer 10 example | dual numbers; `Λ(ε)`, `|ε|=1` | `χ(A,A)=2`; `χ(A,A)=1−1=0`, `[A]↦[k]=1` | true |
| §11.2 + H5 Koszul | BGS 2.3.3, 2.9.1, 2.10.1 (p. 486); `1→2→3` | BGS left: `(A!)^opp`; `R=0`: dims 6/5; `R=k(ba)`: 5/6 | true |
| §11.4 Check | `k[x]`, `|x|=0` | `E(A)=Λ(ξ)`, `|ξ|=1`; `E(E(A)) = k⟦x⟧` | true |
| H1 Kadeishvili | KellerIntro2001 lines 252–257 | over a field; `m₂` induced; non-unique iso | true |

- Source locators checked against the text (32): Chebolu2006 sequence (3) p. 10; KellerDeriving1994 §4.2 Lemma (a)–(d), §5.3 Theorem, §8.1 and §8.2 Theorems; KellerICM2006 §4.7; Drinfeld2004 §1.2, 1.6.2, 2.4, 3.4 with (3.3)/(3.4), 3.5; LyubashenkoOvsienko2006 Def 2.1, Prop 2.2, §§2.5, 2.6; LyubashenkoManzyuk2008 Main Theorem 1.3, Cor 1.6; KellerIntro2001 §§3.1, 3.3 (with the four-vertex example), 3.4, 3.5, 3.7, 7.6; Keller2006 §2.1, Thm 2.3 with the tree formula, Prop 2.4; BGS 2.3.3, 2.8.1, 2.9.1, 2.10.1.
- Library declarations opened at the pins (19): Tau Ceti `LinearAlgebra/Graded/LinearMap.lean` 56, 61; `AInfinity/Algebra/Hom/Homotopy.lean` 87, 253, 261, 267; `Obstruction/Invariance.lean` 496, 524; `Transfer/Massey.lean` 60, 97; `Algebra/Massey.lean` 160, 165, 228; `TensorCoalgebra/ReducedCompleted.lean` 35; `TensorCoalgebra/Completed/Basic.lean` 41; Mathlib `Triangulated/Subcategory.lean` 450 (`trW`), `Triangulated/Generators.lean` 134 (`triangEnvelope`), `HomComplex.lean` 980, `Enriched/Basic.lean` 116, `Enriched/Opposite.lean` 44. The citation tool resolved the remaining names; its one unresolved name is declared at `Suggested.lean` line 81.
- Cross-roadmap citations resolved: GrothendieckEulerForms (main); HopfologicalAlgebra §6.1 and lines 47–49 (main); GeneralAlgebraicKTheory's anchors into Layers 5–7 (main, line 69) still resolve. HochschildHomologyAndHKR (open head), ZigzagPreprojective and RationalHomotopyModels (open head), and DerivedInfinityCategories (open head) cite Layers 0, 1, 3, 4, 8, 9 and 11, all present. StablePeriodicCurved's Lean file uses the three graded names (main, lines 1355–1861).
- Dependency check: `depcheck: 200 roadmaps, 2200 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).
- Elaboration: `lake env lean` on `Suggested.lean` reports only the three `sorry` warnings. The elaborated types of all six declarations match the README (field `K`, the stated universes, no lost binders). The one-tactic probe (`rfl | simp | infer_instance | trivial | aesop`) closes none of the three theorems, and none is proved at the pin.
- Automatic checks: all passed at this head.

Overlap check: read HochschildHomologyAndHKR, ZigzagPreprojective, RationalHomotopyModels and DerivedInfinityCategories (open heads), and StablePeriodicCurved, GrothendieckEulerForms, HopfologicalAlgebra and GeneralAlgebraicKTheory (main). One object is shared: the `K₀` sequence of a Verdier quotient by a thick subcategory, stated by DGAInfinity §7.4 and HopfologicalAlgebra §6.1. Its owner is DGAInfinity, because HopfologicalAlgebra consumes Layers 0, 1, 5 and 7; this is left to the human reviewers. Nothing else is shared.

Source independence: 14 passages compared with 9 sources (KellerIntro2001, Keller2006, KellerDeriving1994, KellerICM2006, Drinfeld2004, LyubashenkoOvsienko2006, LyubashenkoManzyuk2008, Chebolu2006, BGS); none is shared beyond forced formulas, definitions and statements of a dozen words. The largest share is KellerIntro2001, about 19 of about 100 source mentions. Contents compared with its table of contents (KellerIntro2001 lines 22–1267): independent. Its §3 is spread over Layers 0, 2 and 3, its §§4–6 over Layers 5–6 and its §7 over Layers 2, 4 and 5, while Layers 1 and 7–11 have no counterpart.

Research link: Layers 3, 6 and 9 state Kadeishvili's minimal-model theorem (1982), Keller's derived Morita theorem (1994) and Keller's deformed Calabi–Yau completions (2011). ZigzagPreprojective builds its Ginzburg algebras (§6.1) and Koszul theory (§5.2) on these. This rests on the README (§§3.4, 6.4, 9.3, Downstream consumers) and on KellerDeriving1994 §8.1.

## Not verifiable

- Kadeishvili (1982, 1988), Gugenheim–Lambe–Stasheff, Merkulov, May, Gerstenhaber, Getzler, Getzler–Jones, Loday–Vallette, Positselski, Bondal–Kapranov (both), Toën, Shklyarov, Keller's *Deformed Calabi–Yau completions*, Brav–Dyckerhoff, Balmer–Schlichting, Schlichting, Thomason, Lyubashenko (2003) and Lyubashenko–Manzyuk (2008, bimodules): not opened. They are outside the sample, and no sampled target rests on them alone.
- Buijs–Moreno-Fernández–Murillo, arXiv 1801.03408: read only through the arXiv HTML page, not in the sources cache; cited in C01 as an option, not as a required change.

## Source issues

- none

## For the human reviewers

- Ownership: §7.4 now states the `K₀` sequence for a thick subcategory of an essentially small triangulated category. HopfologicalAlgebra §6.1 states the same (main, `TauCetiRoadmap/HopfologicalAlgebra/README.md` lines 605–611) and says it "is proved in §6.1 and not imported" (lines 47–49). HopfologicalAlgebra consumes DGAInfinity, so it would cite §7.4 when next revised. The choice is yours.
- `TauCetiRoadmap/StablePeriodicCurved/Suggested.lean` (main, line 2) imports this roadmap's Lean module. That is why `Suggested.lean` keeps three graded definitions that no headline here uses.
