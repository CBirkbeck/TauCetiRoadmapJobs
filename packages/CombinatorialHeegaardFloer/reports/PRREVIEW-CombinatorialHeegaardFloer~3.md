# Review of CombinatorialHeegaardFloer (pull request #2545 at 83dab88)

**Verdict:** needs changes

**Summary.** Changes are needed. Layer 5 defines the stable invariant `HF̂_st` in two ways that differ from its source. Its equivalence forgets the number of basepoints, so `S³`, `S¹ × S²` and `L(2, 1)` get the same class. It is also defined through convenient diagrams, which exist only for manifolds with no `S¹ × S²` summand, yet the Checks evaluate it on genus-one diagrams that are not convenient. Separately, the link Euler-characteristic target of §3.9 uses a multivariable Alexander polynomial that its cited supplier, GeometricTopology §4.4, does not define and no roadmap or pinned library owns. An API bullet of §3.2 also states that the correction `(n − ℓ)/2` is invariant under stabilization, which is false: it rises by ½. There are eight small corrections, one of them the L.2 locator raised in the previous review and still unrepaired, and no format notes. One question about how Layer 3 is arranged against the book is left to the human reviewers.

## R01 (P1) — The equivalence that defines `HF̂_st` forgets the basepoint count, so the invariant cannot tell `S³` from `S¹ × S²`

An implementer who builds §5.3 as written gets a much coarser invariant than the one Ozsváth–Stipsicz–Szabó prove invariant. HeegaardFloer §8.1 compares the intended invariant with `HF̂`, so its comparison would be made against the wrong object.

§5.3 (lines 1110–1111) takes the homology of the hat complex "up to the stabilization `⊗ (𝔽 ⊕ 𝔽)` (the ungraded form of the stable equivalence of §1.1)". The equivalence of §1.1 (lines 142–143) is `X ⊗ W^⊗a ≅ Y ⊗ W^⊗b` for some `a, b ≥ 0`. Ungraded, this says `dim X · 2^a = dim Y · 2^b`, so a class keeps only the odd part of the dimension. The README's own Check values show the collapse. `L(2, 1)` and `S¹ × S²` are represented by `𝔽²` (lines 1118–1123), `S³ = L(1, 1)` by `𝔽`, and `𝔽 ⊗ (𝔽 ⊕ 𝔽) ≅ 𝔽²`, so all three get one class. The source keeps the basepoint count: OSS09 Definition 1.1 (OSS09 lines 63–68) uses pairs `(V, b)`, with `(V₁, b₁) ~ (V₂, b₂)` iff `V₁ ≅ V₂ ⊗ (𝔽 ⊕ 𝔽)^(b₁ − b₂)`, and Definition 1.2 (lines 76–77) sets `HF̂_st(Y) = [HF̃(D, n), b(D)]`. There `[𝔽, 1] ≠ [𝔽², 1]`. The Layer 5 introduction (line 1058) does say "tracked tensor factors", but the definition does not track them. The smallest repair is to define `HF̂_st(Y)` in §5.3, in Convention 5 (lines 91–92) and in the overview (lines 30–31) as the class of the pair (homology, number of basepoints) under OSS09 Definition 1.1, and to state the Checks as such pairs (`[𝔽^p, 1]` for `L(p, q)`).

## R02 (P1) — The multivariable Alexander polynomial in the link Euler-characteristic target has no owner; GeometricTopology §4.4 does not define it

The link branch of §3.9 cannot be stated until someone provides `Δ_L(t₁, …, t_ℓ)`, and the supplier contract promises it from a section that does not contain it.

§3.9 states `χ(GĤ(L)) = ∏ᵢ (tᵢ^½ − tᵢ^−½) Δ_L(t₁, …, t_ℓ)` (line 649). Its *Needs:* line (657–658) takes "the multivariable Alexander polynomial of the presented link" from §2.3 and GeometricTopology §4.4. The contract (line 1391) reads "§4.4 the Alexander polynomial, with the multivariable polynomial of links". Neither place has it. §2.3 (lines 321–326) deals only with `Δ_K` of a knot. GeometricTopology §4.4 on main (its README lines 2740–2753) builds the Alexander module of a knot, the Seifert, Fox and Burau routes and the one-variable Conway-normalized polynomial of links, with no multivariable polynomial. A search for "multivariable", "multi-variable" and "Torres" finds none in GeometricTopology on main or in any open roadmap head, nor in Mathlib or Tau Ceti at the pins. The smallest repair is to state the multivariable Alexander polynomial and its Torres normalization as a target here, in §2.3 (OSSBOOK §11.5, Theorem 11.5.3 and Definition 11.5.4, lines 8398 and 8402), and to correct line 1391. Declaring a gap on GeometricTopology §4.4 with a one-sentence need would also work.

## R03 (P2) — `HF̂_st` is defined through convenient diagrams, which exist only for manifolds with no `S¹ × S²` summand, and its Checks use genus-one diagrams that are never convenient

§5.3's definition does not apply to `S¹ × S²`, yet the Check and the Examples compute `HF̂_st` there "without moves". That step is not supplied by the combinatorial theory the roadmap plans.

In OSS09, convenient diagrams are the outputs of Algorithm 4.1 applied to an essential pair-of-pants diagram of a manifold "which contains no `S¹ × S²`–summand" (OSS09 lines 697–706). Theorem 5.2 connects convenient diagrams only under the same hypothesis (lines 891–893). Definition 1.2 (lines 69–77) handles `Y = Y₁ # n(S¹ × S²)` with a convenient diagram of `Y₁` and the factor `(𝔽 ⊕ 𝔽)^n`. §5.3 (line 1110) drops both the hypothesis and the factor. The `S¹ × S²` Check (lines 1121–1124) and the Layer 5 Examples (lines 1147–1150, "so §5.3 computes on them without moves") then use genus-one one-pointed diagrams. These are never convenient, because a torus has no pair-of-pants decomposition, and `S¹ × S²` has no convenient diagram at all. OSS09 identifies the homology of an arbitrary nice diagram with `HF̂` only through the holomorphic comparison (Theorem 10.3, cited at OSS09 line 85), which belongs to HeegaardFloer §8.1, downstream. The values `𝔽^p` and `𝔽²` are right as values of `HF̂`; the derivation is not available here. The smallest repair has three parts:

- State §5.3 as in OSS09 Definition 1.2, with the decomposition `Y = Y₁ # n(S¹ × S²)` as a stated input.
- Compute `S¹ × S²` as `Y₁ = S³` with `n = 1`.
- For the genus-one lens-space diagrams, either add a target that they are nicely connected to convenient diagrams, or present their values as values of `HF̂` obtained through HeegaardFloer §8.1 and drop "without moves".

## R04 (P2) — A §3.2 bullet says the correction `(n − ℓ)/2` is invariant under stabilization; it rises by ½

The bullet is a target, and an implementer cannot prove it as written.

Line 408 says that "the correction `(n − ℓ)/2` is invariant under each link stabilization: a stabilization raises `n` by one and keeps `ℓ`". With `n ↦ n + 1` and `ℓ` fixed, `(n − ℓ)/2 ↦ (n − ℓ)/2 + ½`. What is invariant is the collapsed Alexander grading under the stabilization comparison (OSSBOOK Theorem 8.2.5, line 5743). A possible restatement: "The stabilization comparison preserves the collapsed Alexander grading: a stabilization raises `n` by one and keeps `ℓ`, so the correction `(n − ℓ)/2` rises by ½, matching the change in `(M_O − M_X)/2`."

## C01 — The L.2 formulas for `f`, `g`, `A_v`, `B_v` are attributed to Zemke's equation (2.3), which does not contain them

This was raised in the previous review and is not repaired: §4.3 (line 862), its *Needs:* line (871–872) and the References (1416–1417) still cite only Zemke §2.3 and equation (2.3). In Zem21 (lines 399–408), equation (2.3) writes the exponents as "certain nonnegative integers" and defers their definition to Ozsváth–Stipsicz–Szabó. The README's formulas are exactly those of OSS12 = arXiv:1206.1654, §3, equations (3.2)–(3.3) (OSS12 lines 197–237). Would you cite that paper for `f`, `g`, `A_v`, `B_v` and add it to the References, keeping Zemke §2.3 for the completed product carrier?

## C02 — §1.3 cites "Appendix A" for the uniqueness of the tower and torsion multisets, but the book proves only existence

OSSBOOK Proposition A.4.3 (line 15449) gives the decomposition over a field. Corollary A.4.4 and Definition A.4.5 (lines 15504–15509) add only that `M/Tors` is free, and the rank. The uniqueness clause at line 202 is true, because the dimensions of the bidegree pieces of `U^i M` determine the multiplicities, but the cited text does not prove it. Cite Proposition A.4.3 for existence, and state uniqueness as this roadmap's own target with that argument, or cite another source.

## C03 — Several sampled targets have no locator or a misplaced one

The following were checked against the texts; each item says what to cite.

- §2.1, cross-commutation is a crossing change (line 283): OSSBOOK Proposition 3.1.13.
- §2.2, "every crossing change … is realized by a cross-commutation (Ozsváth–Stipsicz–Szabó)" (line 307): OSSBOOK Lemma 3.3.10.
- §3.2 (line 403): Remark 4.6.10 is about the variables of different components. The collapsed grading `(M_O − M_X)/2 − (n − ℓ)/2` and its integrality are OSSBOOK equation (8.2) and Lemma 8.2.1. The multi-grading is Definition 11.1.5, and the sum rule is Lemma 11.2.4.
- §3.3, the simply blocked complex of a link: OSSBOOK Definition 8.2.7 and Proposition 8.2.9.
- §3.4 (line 464): Chapter 3.3 gives the determinant formula (Theorem 3.3.6). `χ(GĤ) = Δ_K` is Theorem 4.7.6, and `χ(GH̃) = (1 − t⁻¹)^(n−1) Δ_K` is Proposition 4.7.5.
- §3.5, `GH̃ ≅ GĤ ⊗ W^⊗(n−ℓ)`: OSSBOOK Propositions 4.6.15 and 8.2.8. Theorem 5.3.1 is proved over `𝔽₂`. The statement over every characteristic-two ring `K` needs the base change `C ⊗_𝔽₂ K`, which is worth one sentence.
- §3.6: OSSBOOK Proposition 6.1.4 (rank one) and Theorem 11.1.2 (the link module).
- §3.7 (line 594), "Chapter 6": OSSBOOK Theorem 6.1.7, Corollary 6.1.8, Corollary 6.3.3 and Lemma 6.3.4.
- §5.1, the multi-pointed diagram data: OSS09 §3, opening paragraph.
- §5.2 (line 1106): OSS09 Definition 3.1 (nice), Definitions 3.3–3.6 and Theorem 3.8 (nice moves preserve niceness), Algorithm 4.1 and Definition 4.2 (convenient diagrams), and Theorem 6.11 (`∂² = 0`, for every nice diagram).
- §5.3: OSS09 Definitions 1.1–1.2 and Theorem 1.3.

## C04 — The README says Layer 3 follows the book and that its chapters are "nearly a blueprint"

Line 358 ("The layer follows Ozsváth–Stipsicz–Szabó's book, whose chapters are nearly a blueprint") and the References (lines 1401–1403: "the spine of Layer 3, nearly a blueprint; Appendix A is Layer 1's … and Appendix B Layer 2's") present the organisation as the book's. The project's rule is that a roadmap's organisation is its own and that a roadmap does not say it follows a source. The arrangement itself is not chapter-for-chapter: §3.9 spans Chapters 9–11, §3.6 combines §§4.6, 6.1, 8.2 and 11.1, and the order of §§3.1–3.7 is forced by their *Needs:* lines. So the repair is to the words alone. Delete the sentence at line 358, and in the References say what each part of the book is cited for.

## C05 — §5.2 cites a Tau Ceti lemma for more than it proves

Lines 1097–1099 cite `TauCeti.HeegaardRegionSystem.IsNice.hammingDist_eq_one_or_eq_two_of_hatCoefficient_ne_zero` for "every domain counted by the hat differential is an empty bigon or an empty rectangle". At the pin (`LowDimTopology/Heegaard/HatDifferential.lean`, lines 195–199), the lemma says only that the two generators differ in one or two coordinates, and it assumes weak admissibility. The bigon-or-rectangle statement is OSS09 Propositions 6.9–6.10 (OSS09 lines 1787 and 1848). Cite those for the shape, and the Tau Ceti lemma for its consequence.

## C06 — The route of §3.10 rests on the normal form of knot cobordisms, which is not a target and is not on its *Needs:* line

Line 669 routes the slice-genus bound through "the normal form of knot cobordisms (Ozsváth–Stipsicz–Szabó, Appendix B.5)", that is, OSSBOOK Proposition B.5.1 (line 16985). The *Needs:* line (674–675) does not list it. Neither GeometricTopology nor MorseTheory states it, and Tau Ceti's `KnotTheory/Cobordism.lean` has the carrier and its genus only. KhovanovHomology K7 on main (its README lines 786–860) owns the movie presentation of link cobordisms that the normal form refines. Would you state the normal form as a target of §3.10, with Proposition B.5.1 and KhovanovHomology K7 on its *Needs:* line?

## C07 — One clause of §3.8 follows the book's wording

Lines 625–626, "the combinatorial treatment falls short of showing these bounds are sharp", share seven of eight consecutive words with OSSBOOK line 616. A version in the roadmap's own words: "the book proves these bounds but not their sharpness, which needs the holomorphic theory".

## C08 — Two declarations of `Suggested.lean` are proved by one pinned term, so they ask an implementer for nothing

`unblockedHomology_equiv_of_movesTo` (lines 67–71) is `hG.unblockedHomologyIsomorphic_of_movesTo K _ h`, and `tau_eq_of_movesTo` (lines 124–127) is the symmetric form of `TauCeti.GridDiagram.IsKnot.tau_eq_of_movesTo` (`KnotTheory/Grid/Homology/Invariance.lean`, lines 99 and 111). The module docstring says this, but their own docstrings present them as headlines. Would you mark each, in its docstring, as a sanity check that the pinned theorem has the headline form?

## Verified sound

Adversarial table. OSSBOOK is the authors' copy of the book; the other source ids are the cache keys used throughout.

| # | Statement | Instances tried | Values computed (one side / other) | Result | Change |
|---|---|---|---|---|---|
| 1 | §1.1 Check on `W` | `W`; Maslov-only variant | `χ(W) = 1 − t⁻¹`; pin `euler_W` (Bigraded/Stabilization.lean 409) gives `1 − T(−1)`; variant `1 − 1 = 0` | holds | none |
| 2 | §1.2 cone Checks; Mathlib names | `U` on `𝔽[U]`; zero map | `U` injective, coker `𝔽` at generator; zero cone `𝔽[U] ⊕ 𝔽[U]⟦−1,0⟧`, towers at `(0,0)`, `(1,0)`; names at pin | holds | none |
| 3 | §1.3 structure theorem | `𝔽[U]/U²` vs `𝔽_(0,0) ⊕ 𝔽_(−2,−1)` | same series `1 + q⁻²t⁻¹`; `U ≠ 0` vs `U = 0`; Prop A.4.3 gives existence only | holds | C02 |
| 4 | §1.4 Check | `∂b = a`, `F₀ = 𝔽a` | acyclic; graded pieces `𝔽a`, `𝔽b` with zero differential, not acyclic | holds | none |
| 5 | §2.1 Checks | trefoil; `torusLink 1 1` | left trefoil Jones `t⁻¹+t⁻³−t⁻⁴` (GeometricTopology §4.1, line 1648); `gcd(2,2) = 2` components | holds | none |
| 6 | §2.2 Cromwell; crossing changes | `torusLink 1 2`, `2 1`, `2 3` | Thm B.4.1; Lemma 3.3.10; `τ = −1, −1, −3` (TorusLink/Tau.lean 56–70) | holds | C03 |
| 7 | §2.3 determinant `= Δ_K` | trefoil, figure-eight | Def 3.3.4/Thm 3.3.6; pin `(1−t⁻¹)⁴(t−1+t⁻¹)`, `(1−t⁻¹)⁵(−t+3−t⁻¹)` | holds | none |
| 8 | §3.2 link gradings | 2 components; stabilization | `(n−1)/2` vs `(n−2)/2` differ by ½; correction `(n−ℓ)/2 → (n+1−ℓ)/2` | bullet false | R04, C03 |
| 9 | §3.3 link `GĈ` | 2×2 unknot | Def 8.2.7, Prop 8.2.9; `Vᵢ ≃ V_jk` (Lemma 8.2.3) so acts by 0; `GĤ = 𝔽_(0,0)`, `GH̃ = W` | holds | C03 |
| 10 | §3.4 Euler characteristics | unknot `n = 2, 3` | Prop 4.7.5/Thm 4.7.6; `χ(GH̃) = 1−t⁻¹`, `(1−t⁻¹)²`; `χ(GĤ) = 1` | holds | C03 |
| 11 | §3.5 invariance; `GH̃` formula | unknot size `n` | Thm 5.3.1 over `𝔽₂`; base change flat; Prop 4.6.15: `W^(n−1)`, rank `2^(n−1)` | holds | C03 |
| 12 | §3.6 tower, `τ` | unknot | Prop 6.1.4 rank one; Def 6.1.5 matches Convention 6; `GH⁻(O) = 𝔽[U]` | holds | C03 |
| 13 | §3.7 crossing rule; Milnor | trefoils; `T_{3,4}` | Thm 6.1.7 `0 ≤ τ(K₊)−τ(K₋) ≤ 1` ≡ README; `|τ| = 3`, pin `u ≤ 3` | holds | C03 |
| 14 | §3.8 symmetry Check | right vs left trefoil | right `(0,1),(−1,0),(−2,−1)` → left `(2,1),(1,0),(0,−1)`; `(2,1) ↔ (0,−1)`; `χ = t−1+t⁻¹` | holds | none |
| 15 | §3.9 link branch | split link | `Δ_L = 0`; `Δ_L(t₁,…,t_ℓ)` absent from GeometricTopology §4.4, Tau Ceti and Mathlib at the pins | unowned | R02 |
| 16 | §3.10 Check | `T_{3,4}`; figure-eight | `τ = 3 = g`; `τ = −τ = 0`, `g_s = 1` | holds | C06 |
| 17 | §3.12 Check | constant signs | product `1` both ways, square rule needs `−1`; `∂²` coefficient `2` | holds | none |
| 18 | §4.1 blow-up weight | general odd `ε` | `χ_k(x) − (sε − s²)/2 = χ_k(x) + s(s−ε)/2`; `χ_{k′}(mE) = m(m−ε)/2`; Nem07 lines 427–430 | holds | none |
| 19 | §4.1 Checks 2–3 | `[[−1,1],[1,−1]]`, `k′ = (1,−1)` and `(−1,−1)` | `(1,−1)`: band, `H₀ = 𝔽₂[U]`; `(−1,−1)` lifts `k = −2` (`χ = x`): both `𝔽₂[U,U⁻¹]` | consistent | none |
| 20 | §4.2 model and Checks | genus 1 and 0 `(−1)` | `T⁺₀`, `δ_w` (Nem07 185–225); `M¹(0) = 1`; `x(x−1)/2`, edge 1, `H⁰ = T⁺₀ ⊕ T₀(1)`; `x(x+1)/2` | holds | none |
| 21 | §4.3 exponents | `w = c = −1`; `K = 0`, `w = 0` | `(1, 0)`, without `−g` `(0, −1)`; faces cancel mod 2; formulas = OSS12 (3.2)–(3.3) | holds | C01 |
| 22 | §4.4 `A₂` signed `∂` | square at `(0,0)` | weights `0,1,1,1`; signed `∂∂ = 0`; unsigned `2U(0,0)−2(1,0)−2(0,1)+2(1,1)`; Tau Ceti sign `= −README` | holds | none |
| 23 | §4.6 `E₈`; §4.7 `Σ(2,3,5)` | canonical `K` | `K = 0`, max `= 2`, without `|V|` `0`; `5/4 = [2,2,2,2]`, `e = −1/30`; flipped `2 + 59/30` | holds | none |
| 24 | §5.1 data and Check | `S¹ × S²` | `g + b − 1` curves (OSS09 509–515); periodic span `{Σ, D₁−D₂}`; `w ∈ D₁` gives `2D₂ + D₃ ≥ 0` | holds | C03 |
| 25 | §5.2 nice calculus | nice `D` | Def 3.1, Thm 3.8, Alg 4.1, Thm 6.11; pin lemma only Hamming 1 or 2 | holds | C03, C05 |
| 26 | §5.3 equivalence | `S³`, `S¹×S²`, `L(2,1)` | README: `𝔽 ~ 𝔽²` (`a = 1, b = 0`), one class; OSS09 Def 1.1: `[𝔽,1] ≠ [𝔽²,1]` | wrong object | R01 |
| 27 | §5.3 domain; Checks | `S¹ × S²`; genus-one lens | Alg 4.1 needs no `S¹×S²` summand; torus has no pants decomposition, so never convenient | unsupported | R03 |
| 28 | `unblockedHomology_equiv_of_movesTo` | probes | one pinned term (Invariance.lean 99) | padding | C08 |
| 29 | `BigradedUnblockedHomologyIsomorphic` | `G′ = G` | `LinearEquiv.refl` with `isHomogeneous_id` elaborates; internal gradings make pieces map onto | sound | none |
| 30 | `bigradedUnblockedHomologyIsomorphic_of_movesTo` | probes; pin | `simp` no progress, `rfl` fails, Alexander-graded pin term type mismatch; pin bigraded for one placement only | holds, real target | none |
| 31 | `simplyBlockedHomology_equiv_of_movesTo` | zero ring; any `i, i′` | `CharP K 2` excludes zero ring; Cor 4.6.17 independence; `simp` leaves `∃` | holds | none |
| 32 | `tau_eq_of_movesTo` | probes | one pinned term (Invariance.lean 111) | padding | C08 |
| 33 | `natAbs_tau_le_unknottingNumber` | `u = ⊤`; one change | `edist` (UnknottingNumber.lean 116); interleaving on circle = one crossing change (Prop 3.1.13); `|Δτ| ≤ 1` | holds | none |
| 34 | `unknottingNumber_toGridLink_torusLink` | `(0,q)`, `(1,2)`, `(2,3)`, `(1,1)` | `0`, `1`, `3`; `(1,1)` excluded (gcd 2, `u = ⊤`); coprime forces `pq` even; `simp`/`rfl` fail | holds | none |
| 35 | `nonempty_latticeChainHomology_blowUpVertex` | `oneVertexPlumbing w`, `ε = ±1` | both `𝔽₂[U]` in degree 0; `simp` unsolved, `Iso.refl` mismatch | holds | none |
| 36 | `nonempty_latticeChainHomology_blowUpEdge` | edge lift | `π*x·E_new = xᵢ + xⱼ − (xᵢ + xⱼ) = 0`, same split; source leaves case to reader | holds | none |

- Source locators checked against the texts: OSSBOOK 30 (Theorems 3.3.6, 5.3.1, 6.1.7, 8.2.5, 11.1.2, B.4.1; Propositions 3.1.13, 4.6.15, 4.7.5, 6.1.1, 6.1.4, 7.1.1–7.1.2, 7.2.2, 8.2.8–8.2.10, A.4.3, B.5.1; others), Nem07 16, Zem21 3, OSS12 1, OSS09 12, Sar10 2.
- Tau Ceti declarations opened at the pin: `maslovO` and `alexander` (Gradings.lean 66–92), `W`, `IsStablyEquiv` and `euler_W` (Bigraded/Stabilization.lean 98, 172, 409), `UnblockedHomologyIsomorphic` (KnotAlexander.lean 98), `IsHomogeneous` (LinearMap.lean 56), the two bigradings (Homology/Bigraded.lean 84, HatBigrading.lean 87), Stabilization/Bigraded.lean, and Invariance.lean 56–111.
- More Tau Ceti declarations: `IsCrossingChange` and `unknottingNumber` (UnknottingNumber.lean 68, 116), cross-commutations (CrossingChange/Basic.lean 82–314), `GridLink.IsKnot.tau` (Move/Tau.lean 44), the torus-link `τ` and unknotting bounds, the signed lattice differential and `directionIndex`, and `hatCoefficient`/`hatDifferential`. Mathlib: `homotopyCofiber`, `mappingCone`, `δ`, `HomotopyEquiv.toHomologyIso`, `homology_exact₂`, `eulerChar`.
- Cross-roadmap citations resolved on main 1b7b481: GeometricTopology §§4.1, 4.2, 4.3, 4.4 (no multivariable polynomial), 4.7.1 (`u` at line 4297), 6.2, and lines 204–207. MorseTheory Layers 1–2 (lines 515, 612). HeegaardFloer §§6.1, 7.0, 7.6, 8.1–8.3 (lines 3585, 4110, 4544, 4621, 4700, 4792). KhovanovHomology K7 (line 786).
- Automatic checks: every check passed at this head, rerun gives the same result, and nothing outside the folder changes. Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on a scratch copy with `#check @` for all nine declarations, plus 13 probes. The original part gives only the six `sorry` warnings. Every one-tactic probe on a sorried headline fails, and the reflexivity example for the new definition elaborates. The elaborated types match the README, and every binder is explicit.
- Earlier findings: R01 (the unsigned `∂∂` value) is repaired at lines 926–927. R02 (the Zemke locator) is not repaired and is now C01.
- Pull request text: it matches the head (42 Checks, about 170 Tau Ceti declarations, five added grid imports, the lane-to-layer map, the two renamed lattice theorems, the added supplier contracts). No correction is needed.
- Overlap check: read RibbonKnots, HeegaardFloer, GeometricTopology and KhovanovHomology. Shared objects and owners: the grid-diagram edge and Cromwell's theorem belong to CombinatorialHeegaardFloer Layer 2 (the GeometricTopology revision at its README line 1668 cites it). The connected-sum adapter and the Mazur-satellite `τ` formulas belong to GeometricTopology. The reconciliations belong to HeegaardFloer §8, and link-cobordism movies to KhovanovHomology K7 (C06). No object has two owners.

Source independence: 14 passages compared with 6 sources (OSSBOOK, Nem07, OSS09, OSS12, Zem21, Sar10). One attributed 7-word clause is shared (OSSBOOK line 616, C07); nothing else is. The largest share is Nem07, about 39 of about 70 locators (OSSBOOK about 20). Contents compared with Nem07: independent; §4.6 (Némethi §3.3) follows §§4.1–4.2 (§3.4), and §§4.3–4.5 and 4.7 have no counterpart. Layer 3 compared with OSSBOOK's contents: parallel to the chapters but not one-to-one, and the order of §§3.1–3.7 is forced by the *Needs:* lines (C04).

Research link: Layer 3 proves combinatorially the invariance and `τ` bounds of Manolescu–Ozsváth–Szabó–Thurston (2007) and Sarkar (2011), which yield Kronheimer–Mrowka's (1993) Milnor-conjecture theorem. Layer 4 is Némethi's lattice cohomology (2008), identified with `HF⁻` by Zemke (2021). Layer 5 is Ozsváth–Stipsicz–Szabó's stable `HF̂` (2009). This rests on the README and the sources read.

## Not verifiable

- Nothing in the sample. The book was read from the authors' preliminary copy on an author page; the other sources are on arXiv.
- Locators outside the sample in Manolescu–Ozsváth–Szabó–Thurston (v2 §6, Theorems 4.2 and 6.1), Gallais, Ozsváth–Szabó–Thurston and Juhász–Thurston–Zemke were not opened.

## Source issues

- **Gap** in Nem07 at Proposition 3.4.2, printed page 9: the source says the blow-up at an intersection point is verified similarly and leaves the details to the reader; it should give the retraction for the total transform adding `(x_i0 + x_j0)E_new`; affects the proof.
- **Misprint** in Nem07 at Proposition 3.3.4, printed page 8: the displayed inequality subtracts `χ_{k_r}(−x_i)`; it should be `χ_{k_r}(−y_i)`, as the next line of the proof uses; affects nothing.

## For the human reviewers

- Arrangement: §§3.5, 3.7, 3.8, 3.9, 3.10, 3.11, 3.12 and 3.13 take the scope of OSSBOOK Chapters 5, 6, 7, 9–11, 8, 12, 15 and 13–14, and README line 358 says the layer follows the book. I judged this below a finding, because the map is not one-to-one and §§3.1–3.7 are forced by dependencies.
