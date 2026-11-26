# Review of CongruencesOfTwistedThetaLifts (pull request #3160 at c12c899)
Folder: `TauCetiRoadmap/ShortGRH/CongruencesOfTwistedThetaLifts/`
**Verdict:** needs changes

**Summary.** Changes are needed: six findings, all blocking. On the mathematics, 2.1 (a) is false under the README's own Hecke-polynomial convention; the rank-one and rank-two constant forms are counterexamples. It holds for the reversed (monic) polynomial, which 2.8 (a), 5.2 (a) and the definition of "attached" also need. On the plan: the folder has no `Suggested.lean`; fifteen prerequisites ("ShortGRH background (…)" and NormsOfThetaLiftsAndExchangeIdentities) belong to no roadmap, although six of them have owners on main; supply runs both ways with DeterminantsOfThetaLiftChains and with SelmerBoundsForAnticyclotomicTwists; 3.5 and 3.1 (1) restate a section of LengthBoundsInPadicFamilies and a Tau Ceti definition; and the pull request also changes the GRH umbrella, outside the folder. There are five small corrections and five format notes. The human reviewers have to decide on scope (a route sourced to one unpublished formal proof, next to an existing family on main for the same end theorem) and on the licence of that formal proof.

## R01 (P1) — The folder has no `Suggested.lean`, so the roadmap has no acceptance test and the targeted build has no module to build

Without the file, none of the five headline theorems the Summary lists (7.3, 6.9, 6.5, 4.3, 2.8 (d)) is stated against the pinned libraries, and none is named as not statable with its missing carrier. An implementer has no formal target, and a reviewer cannot check the README's generality against a signature. The folder holds only `README.md`, and the module `TauCetiRoadmap.ShortGRH.CongruencesOfTwistedThetaLifts.Suggested` does not exist.

The smallest repair is a `Suggested.lean` with a single `import Mathlib` (plus any `TauCeti.*` modules it uses). Its module docstring would name each headline that cannot be stated at the pins and the carrier it lacks: automorphic forms on definite unitary groups with their Hecke eigensystems, descent pairs, and the Galois representations attached to them. It would state whatever is statable. Layer 3 is pure algebra over a group and a discrete valuation ring, so 3.4 and 3.7 can be stated on Mathlib carriers (`MvPolynomial`, `Matrix.det`, `Module.length`, `IsDiscreteValuationRing`) with Tau Ceti's `TauCeti.fittingIdeal`. If the author counts 3.7 among the deep results the roadmap reaches, it belongs in the file.

## R02 (P1) — Fifteen prerequisites are cited as if supplied but belong to no roadmap, and six of them have owners on main

The proofs of Layers 1, 2 and 4–7 rest on these inputs. With no owner, nothing in the plan builds them. The README cites "ShortGRH background (…)" for 14 distinct results: most Frobenii; Galois representations of eigensystems in the weak sense; `ℓ`-adic avatars of algebraic Hecke characters; finite type, Hodge–Tate jumps and crystalline relations; continuous cocycles and Selmer modules; Green's characters and the idempotents of labels; local behaviour at spherical and depth-zero places, at tamely ramified parahoric places and at principal level; base data of the Taylor–Wiles method; Taylor–Wiles places; odd classes over cyclotomic fields; global duality for relations; and the spherical chain lemma. Examples are the *Needs:* lines of 1.1 (line 173), 1.4 (line 270), 2.6 (line 456), 4.2 (line 777) and 4.3 (line 802). No roadmap called that exists on main, at any open head, or in this pull request, whose description lists "the background roadmaps" as still to come. NormsOfThetaLiftsAndExchangeIdentities, cited for false lifts and the denominator predicate in the Summary (line 35), 2.2 (line 353), 6.8 (lines 1163, 1171) and 6.9 (lines 1196–1199), exists nowhere either. The denominator predicate is in fact defined in DeterminantsOfThetaLiftChains §1.3 (b) of this pull request.

The following owners are on main, and each was checked there:

- FiniteReductiveGroups §5.1 and §5.7: labels and the central idempotents of their characters. ThetaLiftChainsAndTheSeesawIdentity §2.5 of this family already cites §5.7 for the same idempotent.
- BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1: Galois representations of definite unitary groups, with Frobenius compatibility and labelled weights.
- The same roadmap, §14.2: local–global compatibility at depth-zero places.
- GlobalGaloisDeformations Layer R04.5, together with ArithmeticGaloisDuality R02.6: Taylor–Wiles data at auxiliary primes.
- ArithmeticGaloisDuality Layer R02.4: Poitou–Tate global duality.
- The completed Chebotarev roadmap: the density theorem behind "most Frobenii".

The repair is to cite these sections in the *Needs:* lines. Each remaining item needs one of three things: a named owner, a target stated here, or a declared gap naming its supplier. The citations of NormsOfThetaLiftsAndExchangeIdentities would be replaced by DeterminantsOfThetaLiftChains §1.3 for the denominator predicate, and by an owner of false lifts.

## R03 (P1) — Statement 2.1 (a) is false for the Hecke polynomial the Conventions define; it holds for the reversed, monic polynomial

A reader who applies the README's only definition gets a false identity. The same mismatch makes "attached" (lines 86–87) vacuous for most forms. The Conventions (lines 104–105) define the Hecke polynomial operator as `Σ_{i ≤ n} (−x)^i q_w^{i(i−1)/2} T_{w,i}`, whose constant term is `T_{w,0} = 1`; the Hecke polynomial of a lift in ThetaLiftChainsAndTheSeesawIdentity (line 888) also has constant term 1. Statement 2.1 (a), line 320, asserts `Q_w(0)·[X^{k′}]Q_{w̄} = q_w^{k′}·[X]Q_w`.

- **Rank one (`k′ = 0`), constant form on `U(1)`.** `Q_w = Q_{w̄} = 1 − X`. The left side is `1·1 = 1` and the right side is `−1`.
- **Rank two, constant form on a definite `U(2)`.** `T_{w,1}` acts by `q + 1` and `T_{w,2}` by `1`, so `Q_w = Q_{w̄} = 1 − (q+1)X + qX²`. The left side is `−(q+1)` and the right side is `−q(q+1)`.

For the reversed polynomial `H_w(X) = X^n·Q_w(1/X)`, which is monic, both cases balance:

- **Rank one.** `H_w = X − t₁` and `H_{w̄} = X − t₁⁻¹`, so the left side is `(−t₁)(−t₁⁻¹) = 1 = [X]H_w`.
- **Rank two.** Both sides are `−q(q+1)`.

The monic polynomial is also what three other parts of the README need:

- "Attached" compares coefficients with the characteristic polynomial of Frobenius, which is monic. The Conventions' polynomial has leading coefficient `(−1)^n q^{n(n−1)/2} t_n`.
- 2.8 (a) reads `−[X^{n−1}]H` as a sum of roots.
- 5.2 (a) speaks of the roots `X₀q^i`.

The smallest repair is one sentence in the Conventions: define the Hecke polynomial of an eigenform at `w` as `H_w(X) = X^n·Q_w(1/X)`, where `Q_w(x)` is the eigenvalue of the Hecke polynomial operator at `x`, and use `H_w` in 2.1, 2.8, 5.2 and in "attached". Alternatively, keep `Q` and restate 2.1 (a) as `[X^{k′+1}]Q_w·[X^{k′}]Q_{w̄} = q_w^{k′²}·[X]Q_w`. This balances in both cases above: `−t₁ = −t₁` in rank one and `−q(q+1)` on both sides in rank two.

## R04 (P2) — Supply runs both ways between this roadmap and two siblings

Neither pair has a single direction of supply, so neither roadmap can be placed before the other in the merge order. The automatic dependency check did not see this because the siblings are not yet in the merge order; it was found by reading the *Needs:* lines.

- **DeterminantsOfThetaLiftChains.** This roadmap takes main pairs, ratios, ramified pairs and regular families from it: 2.2 (line 352), 2.7 (line 477), 7.2 (line 1259) and 7.3 (line 1285), which use its §1.1 and §1.3. Its §6.2 (its line 1218) takes "every data has a regular family of `m`-fold twists", which is 7.3 here.
- **SelmerBoundsForAnticyclotomicTwists.** This roadmap takes the local loss bound, the classes of local lattices and the twisting theorem from it: 6.1 (line 1002), 6.2 (line 1032) and 7.3 (line 1284). Its §4.8, §5.1 and §5.4 (its lines 935, 964 and 1055) take this roadmap's conjugate self-dual representations of a level, main summands, Selmer lengths with divisible coefficients, auxiliary twists, bad places and `e′_ℓ` (1.2, 1.3, 1.5, 4.1 (4)).

The smallest repair is to move ownership downward:

- Move the definitions of Layer 1 and 4.1 (4) to SelmerBoundsForAnticyclotomicTwists, or to a roadmap earlier than both, so that supply runs from it to this roadmap only.
- Move DeterminantsOfThetaLiftChains §1.1 and §1.3 (pairs, ratios, denominators, regular families) to OneSidedPrimeSumBoundsAndAdmissibleData, which already owns the data and the twists, so that DeterminantsOfThetaLiftChains consumes this roadmap and not the reverse.

## R05 (P2) — Three objects are restated here although another roadmap or Tau Ceti already owns them

Each has a second owner, so two developments of the same object would grow.

- **The core of 3.5.** For one block, some array of tied rows has determinant valuation at most the length of the dual module of cocycles. This is LengthBoundsInPadicFamilies §1.8b (2) on main: for one surjective block map, determinants of arrays with rows in a left submodule generate an ideal of colength equal to the length of the solution module. The route given at lines 632–634 (dual module, elementary divisor) is that section's route. The section is unchanged at the head of the open revision of that roadmap. The *Needs:* line of 3.5 (line 642) lists only 3.1.
- **The Fitting ideal of 3.1 (1), line 531.** It is Tau Ceti's `Submodule.minorsIdeal` (TauCeti/RingTheory/FittingIdeal/Basic.lean, line 84) with `p = s`, which equals `TauCeti.fittingIdeal` of the quotient (same file, line 334).
- **"Negligible with exponent".** 7.1 defines it at line 1219, and DeterminantsOfThetaLiftChains §1.3 defines it again.

The repair is to cite LengthBoundsInPadicFamilies §1.8b in the *Needs:* line of 3.5 and keep only the identification of the solution module with Ribet cocycles as this roadmap's own; to cite the two Tau Ceti declarations in 3.1 (1); and to keep one definition of negligible numbers and cite it from the other roadmap.

## R06 (P2) — The pull request changes files outside the roadmap folders

The change to `umbrellas/GRH.toml` and `umbrellas/GRH-targets.md` re-roots the GRH umbrella from RiemannHypothesisForDirichletLFunctions to ShortGRH and rewrites its description and goal. That takes every roadmap of the existing family on main out of the umbrella's work list, and approving this roadmap would approve that as well. The diff outside the roadmap folders and the family index touches only these two files. The repair is to move the umbrella change to its own pull request, where it can be decided on its own.

## C01 — The published works are cited without locators, and four "adapted from the published theory" items name no work

A reader cannot find what was adapted.

- **2.8 (line 483), Mínguez (2008).** The main result is Théorème 1 (Corollaire 6.3), Minguez2008 line 85.
- **6.5 (line 1077), Bellaïche and Chenevier (2009).** The Ribet-type statement is Theorem 1.5.5, BellaicheChenevier2009 line 1462.
- **6.5, Urban (2001).** The lattice construction is Theorem 1.1, Urban2001 line 183, with Theorem 3.5 at line 1057. These are the numbers of the arXiv version; check them against the Duke version cited.
- **2.1, 3.2, 3.7 and 4.2 (lines 311, 565, 672, 749).** These are "adapted from the published theory of …" with no work named. For 3.2 the natural reference is the section of IntegralHeckeAndGaloisDeterminants that the *Needs:* line already cites.

## C02 — `O` names both a coefficient ring and a descent pair, and `m` names both the number of lifts and an exponent

Several statements become ambiguous. The Table of symbols lists `O` twice (lines 130 and 133). For example, 7.2 (a), line 1242, takes "every descent pair `O`" in a README where "for all large `O`" means coefficient rings, and 2.6 (c) uses both senses. In 1.5 (2), line 286, `Sel_m` and `(O/ℓ^m)` reuse the `m` that the Conventions fix as the number of lifts. Renaming the descent pair (for example `𝒫`) and the exponent (for example `μ`) would remove both ambiguities.

## C03 — The Summary's headline (2) uses `r` where 6.9 (b) uses `r_O`

The Summary, line 19, states the bound as `ℓ^(−dim Z·r·β_ℓ)`. Statement 6.9 (b), line 1194, has `r_O`, which is `1` for the lines of the main pairs that 7.2 (c) uses. Writing `r_O` in the Summary would make it agree.

## C04 — One sentence of the pull request's description does not hold for this roadmap

The description says: "Where a section of an existing roadmap, or a theorem already in the library, gives what the route uses, it is cited and not restated." At this head the roadmap restates LengthBoundsInPadicFamilies §1.8b and Tau Ceti's Fitting ideal (R05), and cites unowned "background" results for six inputs that roadmaps on main own (R02). Until those are repaired, a true version would read: "…it is cited and not restated, except in CongruencesOfTwistedThetaLifts, whose background inputs are not yet assigned to owners."

## C05 — The family index describes this folder as having a `Suggested.lean` and citing by section number

The index, at lines 39–41 of `TauCetiRoadmap/ShortGRH/README.md`, says that each subdirectory has a `Suggested.lean` and that citations between the roadmaps are by section number. This folder has no `Suggested.lean` (R01), and its README cites its siblings in words (lines 112–115). Correct the sentence or the folder.

## N01 — About 130 names in code font are declarations of the external formal proof

They are declarations of `[ShortProof]`, not of Tau Ceti, Mathlib or a `Suggested.lean`, so a reader cannot tell them from library names. The repository's porting guidance asks for a file-by-file map to sit in a clearly secondary provenance section. Moving the pointer lines there, or marking the names as `[ShortProof]` names, would do.

## N02 — The README has no Checks

The Hecke-polynomial convention needs one. For the constant form on a definite `U(2)`, the Hecke polynomial is `(X − 1)(X − q)` in the monic convention and `(1 − X)(1 − qX)` in the other. Conjugate self-duality (1.2 (1)) needs another: `⊕_{e<t′} χ^e` satisfies it with `χ`, and fails it with `cyc` in place of `χ`.

## N03 — Three bookkeeping sections are missing

There is no `## Scope and ownership`, no `## Exact supplier contracts` and no `## References`. `[ShortProof]` is defined only in the family index.

## N04 — Line 115 is process wording

"Where a section number is not fixed" describes the state of the draft.

## N05 — The denominator budget has two symbols in the family

It is `B_den` here and `β_tot` in DeterminantsOfThetaLiftChains, for the same `f·a·(log b)³/(m·k)`.

## Questions for the author

- Is the polynomial of `[ShortProof]` in 2.1 (a), 2.8 (a) and 5.2 (a) the reversed (monic) one? The computation in R03 assumes the README's Conventions, and the formal proof could not be read.
- The exponents in 7.1 (c) (2000, 999, 4000, 30) and the bound for `o_D` in 6.1: which statements of the data and of `[ShortProof]` give them? They depend on constants this review could not trace.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.5 (a) | `m = 0`; `x ↦ x/ℓ^m` from `O/ℓ^m` to `K_O/O` | `0 ≤ sel`; the embedding is injective, `G`-equivariant and keeps linear relations | holds | none |
| 1.5 (1) `e′_ℓ` | `ℓ ∤ n_GL`; `ℓ = 2` | `e′ = 2^{−ℓ} > 0`; SelmerBounds table line 80, same formula | consistent | none |
| 2.1 (a) | constant form, rank 1 and rank 2 | rank 1: `1` vs `−1`; rank 2: `−(q+1)` vs `−q(q+1)`; reversed polynomial: equal | false as stated | R03 |
| 2.1 (b), 1.2 (1) | `R = ⊕_{i<n} χ^i` | `tr R(g^c) = Σχ^i`; `χ^{n−1}Σχ^{−i} = Σχ^i` | holds | none |
| 2.1 (c) | `R^c ≅ R^∨ ⊗ χ^{k′−1}`; `χ^e` has jump `e` | jump `u ↦ k′ − 1 − u` | holds | none |
| 2.7 (a) high jumps | `q ≤ k−2`, `λ_q = k/2 − 1 − q` | `|ε⌊t/2⌋ − λ_q| ≤ 5r/2 + k/2 ≤ 3r ≤ t` | holds | none |
| 2.7 (a) low jumps | `q ≥ k−1`, `λ_q = −(κ + j′Δ)` | `u_q = ⌊t/2⌋ − ε(j₀−j′+½)Δ`; `|u_q|` within `[Δ/4, 2mΔ]` | holds | none |
| 2.7 (a) negatives | `σ`, `σ^c` | one negative per `q`: `r` negatives, bound `r′ = r` | holds | none |
| 2.7 (c) | `κ_j + r − t ≤ c ≤ κ_j`, `m < z ≤ r` | `|ε(z−1) + κ_j − c| ≤ t − 1`; one negative per pair | holds | none |
| 2.8 (a) | monic `∏(X − q^iν)·…` | `−[X^{n−1}]H = (Σq^i)ν + …`; constant-term-1 form gives `(−1)^{n−1}e_{n−1}` instead | needs monic | R03 |
| 3.1 (1) Fitting ideal | `N ⊂ R_J^s` | equals `Submodule.minorsIdeal N s` = `TauCeti.fittingIdeal` of the quotient | restated | R05 |
| 3.1 (4), (5) ties | `ε_j` | `((X−1)ε)(φ) = (φ−1)ε(φ)` in both | consistent | none |
| 3.1 (7) | `J = ∅` | `∏X_j = 1`, no proper divisors; `f(π)` has constant term `c` | coherent with 3.7 (b) | none |
| 3.2 (a) | block matrix via Amitsur | only closed paths contribute `det(1 − Tρ(P_{a₁a₂}⋯P_{a_ka₁}))`, coefficients in `im R` | holds | none |
| 3.5 | one block, rows tied | same content as LengthBoundsInPadicFamilies §1.8b (2) | restated | R05 |
| 3.7 (b) | 3.5 plus 3.6 summed over `e`, plus `μ₀` | `b₀ + Σb_e + t′(Σv(o_v(1)) + 2#s·v(C)) + (#J+1)v(C)` | matches | none |
| 4.2 (a) | `g ∈ G_E`; `g = c` | `cyc(g)·cyc⁺(g)^e = cyc(g)^{e+1}`; at `c`: `(−1)·1` | holds | none |
| 4.3 | `ℓ = 2`; `t′ ≤ 1` | `μ₁₆ ⊂ E`, so `cyc(G_E) ⊂ 1+16ℤ₂` is procyclic; `J = ∅` | holds | none |
| 5.1 (a) | `N_∅` | `∏_j Σ_{Γ_j} ρ = Σ_{∏Γ_j} ρ` | holds | none |
| 5.1 (d) | `GL₂(𝔽₃)`, `diag(1,−1)`; `GL₂(𝔽_q)`, `diag(a,1)` | transfer `1·(−1)·1 = −1 = det`; `a = det` | holds | none |
| 5.4 | `S = ∅` | `Y_∅ = δ^{#J}`, as 5.1 (c) with `i = #J`; modulus `ℓ^ν/(2n!)` in both | consistent | none |
| 6.1 with 6.9 (b) | `r_O ≥ 1`, `t_O ≤ t`; `ℓ > 2b` prime to `n_GL·o_D·M` | `(1+2t_O)e′ + r_O·loc + e_ℓ + v(n_GL) ≤ r_O·β_ℓ`; large `ℓ`: `β_ℓ = (1+2t)2^{−ℓ}` | consistent | none |
| 6.5 | through 3.7 and 6.3 | `t′(2ram + 8f·v(n_GL))` gives `2t′·ram` and `8ft·v(n_GL)` of `e_ℓ`; 6.7 (a) and Summary (3) agree | consistent | none |
| 6.6 (a) | `ℓ > h_Δ²` | needs `ℓ ∤ N_c`; 4.3's `N_c + t < h_Δ` gives it; order of `cyc(γ)` mod `ℓ` is `ℓ−1 > t` | holds for the data | none |
| 6.9 (a) | `Λ = 0`; `Z = 0` | eigenvalue `0` has `v = ∞ > β`, so excluded; `Z = 0` vacuous | holds | none |
| 7.1 negligible | definition | defined also in DeterminantsOfThetaLiftChains §1.3 | duplicate | R05 |
| 7.2 (a) | trivial rank-one `R` | twist 1: `1 = χ⁰·1`; jump `0`; `X − 1` kills `1`; main summand must be a twist (`|1−1| ≠ 1`) | consistent | none |
| 7.3 | (a) implies (b) | height `≤ Σe′_ℓ log ℓ ≤ x^{999} ≤ x₁`; `Σγ_ℓ ≤ B_den` by 7.1 (d); matches DeterminantsOfThetaLiftChains §1.3 | consistent | none |

- **Source locators opened:** 4, at BellaicheChenevier2009 line 1462, Urban2001 lines 183 and 1057, and Minguez2008 line 85. The 41 pointers into `[ShortProof]` were not readable.
- **Library declarations opened:** `Submodule.minorsIdeal` (TauCeti/RingTheory/FittingIdeal/Basic.lean, line 84) and `TauCeti.fittingIdeal` (same file, line 334). The pinned Mathlib has no Fitting ideal.
- **Cross-roadmap citations resolved:** 19.
  - On main: IntegralHeckeAndGaloisDeterminants §0.5; LengthBoundsInPadicFamilies §1.8b (and at its open revision); FiniteReductiveGroups §5.1, §5.7; BaseChangeAndGaloisRepresentationsForUnitaryGroups §14.2, §16.1; GlobalGaloisDeformations R04.5; ArithmeticGaloisDuality R02.4; Chebotarev.
  - Siblings: DeterminantsOfThetaLiftChains §1.1, §1.3, §6.2; SelmerBoundsForAnticyclotomicTwists §4.1, §4.8, §5.1, §5.4; ThetaLiftChainsAndTheSeesawIdentity §2.5, §2.16; the row parameter of OneSidedPrimeSumBoundsAndAdmissibleData.
  - Unresolved: 14 "ShortGRH background" items and NormsOfThetaLiftsAndExchangeIdentities.
- **Automatic checks:** the missing `Suggested.lean` is real (R01). The dependency check printed "depcheck: 122 roadmaps, 1386 edges, 0 problem(s)", with no UPWARD or CYCLE line; the two-way supply in R04 was found by reading, since the siblings are not yet in the merge order.
- **Elaboration:** not possible; the folder has no Lean file.
- **Overlap check:** read LengthBoundsInPadicFamilies (main and the head of its open revision), CongruenceModulesOfThetaLifts, FiniteReductiveGroups and BaseChangeAndGaloisRepresentationsForUnitaryGroups; the list of roadmaps closest in results was empty. Owners of the shared objects:
  - Ribet determinant–length lemma: LengthBoundsInPadicFamilies §1.8b.
  - Labels and their idempotents: FiniteReductiveGroups §5.1 and §5.7.
  - Galois representations of definite unitary groups: BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1.
  - Congruence ideal of theta lifts bounded by Selmer lengths with local defects: CongruenceModulesOfThetaLifts headline (3) and §7.7b, in another formulation; this roadmap's 6.5 drops the `Ш` term. Left to the human reviewers.

Source independence: 3 passages (the Origin sentences of 2.8 and 6.5) compared with 3 sources (Minguez2008, BellaicheChenevier2009, Urban2001), none shared. The largest share of locators is `[ShortProof]`, with 41 of 44; its text and file tree could not be read, so the five further passages were not compared. From the README's own pointers, its 41 sections map onto 22 files of one directory of `[ShortProof]`, in an order its *Needs:* lines largely force (Layer 3 depends on nothing in Layers 1–2 and could precede them).

Research link: The headline targets are steps of the route of an unpublished formal proof of GRH (the family index). Their published inputs are Ribet's method in the forms of Bellaïche–Chenevier 2009 (Theorem 1.5.5) and Urban 2001 (Theorem 1.1), and Mínguez 2008's explicit Howe correspondence. Rests on README 2.8 and 6.5 and on BellaicheChenevier2009 line 1462.

## Not verifiable

- `[ShortProof]` (the `grh` folder of github.com/lsernau/grh-lean at commit `72fead1`): the sources service does not classify the host, and this review could not vouch that it is an author's page. This covers all 41 pointer locators, the seeded sample's agreement with them, and the wording and arrangement comparison.
- The exponents of 7.1 (c) and the bound for `o_D` in 6.1: these depend on constants of the data and of `[ShortProof]`.
- The dimension count of 4.2 (c) and the exponent `y′²²` of 4.3: these need `[ShortProof]`.

## Source issues

- none

## For the human reviewers

- Scope: 27 of the 41 sections are "particular to this proof", sourced only to an unpublished Lean development (`[ShortProof]`) that announces a proof of GRH. No refereed source states the headline theorems (README lines 3–31; the family index).
- Second plan: on main, CongruenceModulesOfThetaLifts (RiemannHypothesisForDirichletLFunctions, headline (3), §7.7b, §7.8) bounds congruences of theta lifts through Galois representations, Ribet's method with local defects and anticyclotomic twists. This roadmap's 6.5, 6.9 and 7.3 are another formulation of the same subject.
- Licence: the README names about 130 declarations of `[ShortProof]` and maps each section to one of its files. The family index states Apache 2.0, but this review could not open the repository to confirm it.
- Not tested: `[ShortProof]`, the source of 41 of the 44 locators, was not read, so the wording and arrangement checks were not done against it.
- Umbrella: the pull request re-roots the GRH umbrella from RiemannHypothesisForDirichletLFunctions to ShortGRH (`umbrellas/GRH.toml`), from 256 areas to 95 by its description.
