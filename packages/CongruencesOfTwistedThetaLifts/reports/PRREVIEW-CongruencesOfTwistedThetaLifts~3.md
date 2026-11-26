# Review of CongruencesOfTwistedThetaLifts (pull request #3160 at 8c6c8b8)
Folder: `TauCetiRoadmap/ShortGRH/CongruencesOfTwistedThetaLifts/`
**Verdict:** needs changes

**Summary.** Changes are needed: four findings, all blocking, and all four were raised in the previous review. The mathematics is now consistent: the false identity of 2.1 (a) is repaired by the monic Hecke polynomial, and every statement recomputed this round agrees with its section, its neighbours and the cited sibling sections. What remains is the plan: the folder still has no `Suggested.lean`; twelve prerequisites are still cited as "ShortGRH background" and belong to no roadmap, although sections on main state four of them in fuller form; supply still runs both ways with DeterminantsOfThetaLiftChains and SelmerBoundsForAnticyclotomicTwists; and the pull request still changes the GRH umbrella and the top-level README. There are six small corrections and three format notes. The human reviewers have to decide on scope, on the licence of the formal proof, and on the arrangement, which could not be tested.

## R01 (P1) — The folder still has no `Suggested.lean`, so the roadmap has no acceptance test

None of the five headline theorems of the Summary (7.3, 6.9, 6.5, 4.3, 2.8 (d)) is stated against the pinned libraries or named as not statable with the carrier it lacks, and the targeted build has no module to build. The folder holds only `README.md`; the description lists the file under "Still to come". This is the first finding of the previous review, not repaired.

The smallest repair is a `Suggested.lean` with the single line `import Mathlib`, whose module docstring names each of the five headlines and what it lacks at the pins: algebraic forms on definite unitary groups with their Hecke operators, descent pairs and lifts, `ℓ`-adic representations of `G_E` with Frobenius data and Hodge–Tate jumps, Selmer modules of cocycles. If the author counts Ribet's lemma to first order (3.7) or the Fitting-ideal bound (3.4) among the deep results, they are pure algebra over a group and a discrete valuation ring and can be stated on Mathlib carriers with Tau Ceti's `Submodule.minorsIdeal`, which 3.1 (1) already cites.

## R02 (P1) — Twelve prerequisites are cited as "ShortGRH background" and belong to no roadmap; sections on main state four of them in fuller form

Layers 1, 2 and 4–6 rest on these inputs, and nothing in the plan builds them. The *Needs:* lines cite, 32 times, twelve distinct results under "ShortGRH background (…)": the filter of most Frobenius data; Galois representations of eigensystems in the weak sense; `ℓ`-adic avatars; the local conditions at a place; Selmer modules; attached representations at depth-zero places; base data of the Taylor–Wiles method; Taylor–Wiles places; odd classes over cyclotomic fields; global duality with relations; the spherical chain lemma; and compatibility at pro-`p` Iwahori level. Examples are the *Needs:* lines of 1.1 (lines 227–246), 2.6 (line 562), 4.2 (line 913), 5.2 (line 1045) and 6.1 (line 1194). The family index says that such an entry is "a result still to be stated as a numbered target", and the description that they "are not yet numbered targets". Since the previous review the false lifts and the denominator predicate have gained an owner (NormsOfThetaLiftsAndExchangeIdentities §1.3, §1.4, read at this head) and the labels cite FiniteReductiveGroups §5.7; the rest is as it was.

Four entries have owners on main, opened this round:

- BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1 (line 976) gives a continuous semisimple representation with `ι det(X − r(Frob_w))` equal to the Hecke polynomial at every unramified place. The Conventions (lines 95–97) say this is "the full theorem" and that the route uses a weak form, and then leave the weak form unowned. A semisimple representation has a nondegenerate trace form on the span of its image, and equality at every unramified place gives the approximation at most Frobenii, so §16.1 supplies "attached" once the two Hecke-polynomial normalisations are matched.
- The same roadmap, §14.2 (line 761): inertia at depth-zero places acts through the characters `θ_i∘t_m`, which is the entry on depth-zero places.
- GlobalGaloisDeformations Layer R04.5 (line 770): Taylor–Wiles data at auxiliary primes.
- ArithmeticGaloisDuality Layer R02.4 (line 2430): global duality.

The repair is to cite these sections on the *Needs:* lines, stating in each place the form deduced from them, and to give each remaining entry one of two things: a numbered target in this roadmap (the filter of most Frobenii, Selmer modules of cocycles and the local conditions are definitions that Layer 1 could carry), or a named roadmap and section that states it.

## R03 (P2) — Supply still runs both ways with DeterminantsOfThetaLiftChains and with SelmerBoundsForAnticyclotomicTwists

Neither pair can be placed in the merge order, whichever comes first. The rule is that supply runs one way, each supplier merging before its consumers, so that every roadmap can be built on what precedes it. The mechanical test of that direction reports no problem among 122 roadmaps and 1386 edges, but only because the siblings are not yet in the merge order; the edges are on the *Needs:* lines, and the description says that "supply still runs both ways between some pairs of members".

- **DeterminantsOfThetaLiftChains.** This roadmap takes its §1.1, §1.3, §2.1 and §4.4 (d) (2.2, 2.7, 7.1, 7.2, 7.3; lines 438, 589, 1429, 1474, 1507). Its §6.2 takes 7.3 of this roadmap (its line 1360).
- **SelmerBoundsForAnticyclotomicTwists.** This roadmap takes its §3.1, §4.1, §4.6–§4.8 and §5.4 (1.1, 1.3, 6.1, 6.2, 7.3). Its §4.1 takes 3.1 (2) of this roadmap (its line 969), its §4.8 takes 1.1 and 1.2 (its line 1159), and its §5.1 takes 1.1 and 1.3 (its line 1190).

The sections are acyclic, so moving ownership suffices. For the second pair: move 1.1–1.3, 1.5 and the definition of Ribet cocycles in 3.1 (2) to SelmerBoundsForAnticyclotomicTwists, whose twisting theorem is stated for exactly these objects; supply then runs from it to this roadmap only. For the first pair, either DeterminantsOfThetaLiftChains §6.2 takes a regular family as a hypothesis and the roadmap that consumes Theorem C combines it with 7.3, or §6.2 and §6.3 move to a roadmap placed after this one. This is the fourth finding of the previous review, not repaired.

## R04 (P2) — The pull request still changes files outside the roadmap folders

Approving this roadmap would also approve a change of the umbrella's root. Outside the family's folders the diff touches `umbrellas/GRH.toml` (root changed from `RiemannHypothesisForDirichletLFunctions` to `ShortGRH`, description and goal rewritten), the generated `umbrellas/GRH-targets.md`, and one line of the roadmap list in the top-level `README.md`, which is regenerated after merge and is not edited by hand. The repair is to move the umbrella change to a pull request of its own and to drop the line in the top-level `README.md`. This is the sixth finding of the previous review, not repaired.

## C01 — The published works still carry no locators, with one exception

The Origins now name works, but only 4.2 gives a locator (Darmon, Diamond and Taylor, Theorem 2.19). A reader cannot find what was adapted in 2.1 (Chenevier–Harris; Shin), 2.8 (Mínguez), 3.2, 3.7 and 6.5 (Bellaïche–Chenevier; Urban; Dasgupta–Kakde–Silliman–Wang), 4.2 (Gras–Munnier) or 6.1 (Mazur–Wiles; Greither). Three were opened: for 2.8, Mínguez's Théorème 1 with the paragraph on Galois parameters that follows it (Minguez2008 lines 83–87); for 3.7 and 6.5, Bellaïche–Chenevier Theorem 1.5.5 in §1.5 (BellaicheChenevier2009 line 1462, arXiv v2 numbering) and Urban's Theorem 1.1 (Urban2001 line 183, arXiv numbering).

## C02 — 7.1 (a) needs `a′ ≥ 1`

As written, "for every finite set `T` of primes and `a′ ≤ b′`, `Σ_{ℓ∈T} v_ℓ(a′) log ℓ ≤ log b′`" (line 1421) admits `a′ = 0`, where the left side is infinite. With integers `1 ≤ a′ ≤ b′` it holds: the left side is at most `log a′`.

## C03 — The definition of a representation of a type uses two notions that are not defined

1.2 (3), lines 268–270, reads the roots of a label "through the fixed injective character of the algebraic closure of `k_{w_i}` and the tame exponent of the element at level `r_O!`". Neither the character nor the tame exponent at a level is defined in this README or cited; the only other occurrence is inside a background entry. Every statement of 2.3–2.6 and 6.2–6.7 about types depends on them. One sentence would do: the map `t_m : I_w → k_{w,m}^×` as in BaseChangeAndGaloisRepresentationsForUnitaryGroups §14.2, with `m = r_O!`, and where the injective character into `ℚ̄_ℓ^×` is fixed.

## C04 — The method of 7.2 says that the main summand of a main pair is the trivial representation with the jump `0`

The Method (line 1443) says the main summands come "for a main pair from the trivial representation with the jump `0` (2.7 (c))". The trivial representation is not a main summand with string length `2z − 1` when `z > 1`: 1.2 (1) would need `1 = χ(g)^(2z−2)`. And 2.7 (c) gives the jump `z − 1 − ε(σ)c_p(v)`, not `0`. What 7.2 (a) and 2.8 (c) give is the twist of the trivial representation by the avatar `α_O` of 2.8 (b), whose jump is `0` lowered by `(1 − t_O)/2 − ε(σ)w_O(v)`. Saying so in the Method removes the apparent contradiction.

## C05 — The supplier contracts omit sections the text relies on

The Conventions and the Table of symbols take notation from OneSidedPrimeSumBoundsAndAdmissibleData §2.1, §2.2 and §4.1, DivisibilityOfThetaDerivatives §1.5 and ThetaLiftChainsAndTheSeesawIdentity §2.4 (lines 49–52, 175–179); "From other roadmaps" (lines 1573–1575) lists none of these. The two Tau Ceti declarations cited in 3.1 (1) have no "From Tau Ceti" entry.

## C06 — The description does not say that the top-level README is edited

The description lists the index page, the eleven members and the umbrella. It leaves out the line added to the roadmap list of the top-level `README.md`. A true account would add "and one line of the roadmap list in the top-level `README.md`", or the line is dropped (R04).

## N01 — About 170 names in code font are declarations of the formal proof

They stand on pointer lines marked `[ShortProof]`, so their origin can be told, but a search of the libraries finds none of them. A sentence in the Conventions saying that every name beginning `New.` is a declaration of `[ShortProof]` would settle it.

## N02 — In 3.1 (1), "`Submodule.minorsIdeal` of `N` with `p = s`" should read `p = #s`

`s` is the finite index set of `R_J^s`; the declaration takes a natural number.

## N03 — `μ` has three meanings

It is the exponent in `Sel_μ` (1.5), the character `μ_O` of a descent pair, and the multiset of roots of unity in 2.4 (a).

## Questions for the author

- In the background entry on the spherical chain lemma (line 1047) the chain reads `P(X/d) = ∏_{i≤k}(X − q^i)·S`, while 5.2 defines the chain of roots by `P(dX) = ∏_{i<t′}(X − q^i)·S(X)`. The two differ by `d ↔ 1/d` and by one factor. Is the entry written for the reversed polynomial `Q_w`, and is `i ≤ k` meant as `i < k`? The formal proof could not be read.
- 2.2 (c) and (d) use a chosen place above each of `p₀`, `p₁` with residue field of prime order. Which section states this (DivisibilityOfThetaDerivatives §1.5?), and should the *Needs:* line of 2.2 name it?

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conventions, monic `H_w` | constant form, rank 2 | `t₁ = q+1`, `t₂ = 1`: `H = (X−1)(X−q)`; geometric Frobenius on `1 ⊕ χ` has eigenvalues `1`, `q` | agrees | none |
| 1.1 jumps of a weight | `λ = 0`, rank 2, `σ ∈ Φ` and `σ ∉ Φ` | `{0, 1}` both sides; `1 ⊕ χ` has jumps `0, 1`; Selmer §3.1 sign: `cyc` has jump `−1` | consistent | none |
| 1.2 Check | `⊕_{e<t′} χ^e`; `cyc` variant | `Σχ^e = Σχ^(t′−1−e)`; variant gives `Σχ^(−(t′−1)−e)`, unequal for `t′ ≥ 2`, equal for `t′ = 1` | holds | none |
| 1.2 (3) | definition | "tame exponent at level `r_O!`" and the injective character not defined | incomplete | C03 |
| 2.1 (a) | rank 1; constant form rank 2 | `(−t₁)(−t₁⁻¹) = 1 = [X]H`; `q·(−(q+1)) = q·(−(q+1))` | holds | none |
| 2.1 (b), (c) | `1 ⊕ χ`, `n = 2`; jump `u` in rank `k′` | `1 + χ = χ(1 + χ⁻¹)`; `k′−1−(j−1−λ_j) = λ_j + k′ − j` | holds | none |
| 2.2 (c), (d) | `d = 1`; count of places above `M` | `p−1` divides `#GL₁`; `#GL_{rt}(𝔽_p) = p^N∏_{i≤rt}(p^i−1)`; at most `2f` places above each prime | holds | question |
| 2.6 (a) | `l = 2λ`, `w_O = −κ_j` | `(t_O−1)/2 − ε(λ_q − w_O)` equals `u_q` of 2.7; `n_O` even always since `r_O`, `t_O` odd | consistent | none |
| 2.7 (a), (b) | row parameter of OneSided §3.4 | high: `|ε⌊t/2⌋ − λ_q| ≤ t`; low: `|u_q| ∈ [Δ/4, mΔ]`; (b): `(r−1)/2 − λ_q − (r−t)/2 − w` | holds | none |
| 2.8 (a), (d) | lifted polynomial of ThetaLiftChains §2.16 | roots `q^lν` (`l < t`) and `q^t(ν/ν′)·`roots of `H_z`; sum `(Σq^i)ν + q^t(ν/ν′)t₁` | holds | none |
| 3.1 (1) | `k = 0` in the Tau Ceti lemma | `fittingIdeal R M 0 = (ker φ).minorsIdeal (finrank F)`, `finrank = #s` | cited correctly | N02 |
| 3.2 (b) | `Λ = R = L` commutative, `N = 1`, `ρ₀ = 0` | `by ∈ 𝔞` gives `z·b ∈ 𝔞` for `z ∈ (y)`; `P(0) = b = det ρ(B)` | holds | none |
| 3.4 | `J = ∅` | module of functions ≅ `Hom(O^s/N, O/p)`, length = colength; `≤ b + #s·v(C)` since `C`-torsion has `≤ #s` generators | holds | none |
| 3.5 | one block | LengthBounds §1.8b (2): colength of the determinant ideal is `length Sol`; over a DVR one generator attains it | cited correctly | none |
| 3.6, 3.7 (b) | sum over `e < t′` | `Σb_e + #J·v(C) + t′#s·v(C)` plus `t′(#s·v(C) + Σv(o_v(1)))` plus `b₀ + v(C)` | matches 3.7 (b) | none |
| 4.2 (a) | `g ∈ G_E`; `g = c` | `cyc(g)·cyc⁺(g)^e = cyc(g)^(e+1)`; at `c`: `(−1)·1` | holds | none |
| 4.3 | `ℓ = 2`; `t′ ≤ 1`; bounds | `μ₁₆ ⊂ E`: image in `1 + 16ℤ₂`, procyclic; `J = ∅`; `∏(u^e − u^k)` divides `ℓ^((t′−1)h)`, `t′ < y′` | holds | none |
| 5.1 (a), (d) | `S = ∅`; `diag(a, 1, …, 1)`; `GL₂(𝔽₂)` | `N_∅ = ∏Nm_j`; transfer: fixed line gives `a`, other orbits give `1`; `𝔽₂`: both trivial | holds | none |
| 5.4 (b) | `S = ∅` | `Y_∅ = δ^{#J}`, as 5.1 (c) with `i = #J` | consistent | none |
| 6.4 with 6.5 | 3.7 (b) term by term | `λ_T + sel + Σ`colengths `≤ sel + r′loc`; `t·v(o_D)`; `2t′ram + 8ft·v(n_GL)`; `(2t+1)h_Δ²²v(n_GL) ≤ ((4t+1)h_Δ²² + h_Δ)v(n_GL)` | `≤ e_ℓ − 2v(n_GL)` side | none |
| 6.7 | against 6.5 | `v(n_GL²d) = v(d) + 2v(n_GL) ≤ β(V, ram, sel)` | consistent | none |
| 6.9 | `ram = sel = e′_ℓ`; Norms §1.4 | `(1+2t_O)e′ + r_O·loc + e_ℓ + v(n_GL) ≤ r_O·β_ℓ`; `exp(−dim Z·r·β)` with `β = β_ℓ log ℓ` | consistent | none |
| 7.1 (a) | `a′ = 0`; `a′ ≥ 1` | `∞` vs `log b′`; `Σv_ℓ(a′)log ℓ ≤ log a′` | needs `a′ ≥ 1` | C02 |
| 7.1 (b)–(d) | sizes of OneSided §3.2, §3.3 | `b log M + log(2b)! + h_Δ³log Π ≤ 27·b log b`; `4·10⁶e¹⁸⁰m² ≤ x(log b)²` since `log log b ≥ 6·10¹³`; `x^4001 ≤ b` | holds | none |
| 7.2 (a) | trivial `R`, `z > 1` | type `(O, 1, {0}, X−1, ∅)` holds; string length `2z−1` would need `1 = χ^(2z−2)`; the twist by `α_O` has jump `z−1−εc_p` | statement holds, Method misleads | C04 |
| 7.2 (c), (e) | Determinants §1.3 (b); Norms §6.3 (b) | `exp(β)·ℓ^{v_ℓ(h)} = exp(β + v_ℓ(h)log ℓ)` | consistent | none |
| 7.3 | Selmer §5.4 (a)–(c); Determinants §1.3 | `v(ratio) ≤ e′_ℓ` gives `|ι(ratio)⁻¹| ≤ ℓ^{e′_ℓ}`; height `≤ Σe′_ℓ log ℓ ≤ x^999 ≤ x₁`; `Σγ_ℓ ≤ B_den = β_tot` | consistent | none |

- Earlier findings: R01 not repaired (R01); R02 partly (R02); R03 repaired ("the monic polynomial `H_w(X) = X^n·Q_w(1/X)`"); R04 not repaired (R03); R05 repaired ("LengthBoundsInPadicFamilies §1.8b (2)", "Tau Ceti `Submodule.minorsIdeal`", "those of DeterminantsOfThetaLiftChains §1.3"); R06 not repaired (R04); C01 partly; C02–C05, N02, N03, N05 repaired; N01 kept.
- Source locators opened: 3 (BellaicheChenevier2009 line 1462; Urban2001 line 183; Minguez2008 lines 83–87). The one printed locator of the README (Darmon–Diamond–Taylor, Theorem 2.19) and the 41 section pointers into `[ShortProof]` could not be read.
- Library declarations opened: `Submodule.minorsIdeal` (TauCeti/RingTheory/FittingIdeal/Basic.lean line 84) and `TauCeti.fittingIdeal_eq_minorsIdeal_ker` (same file, line 340).
- Cross-roadmap citations resolved: 38, all found. Siblings at this head: DeterminantsOfThetaLiftChains §1.1, §1.3, §2.1, §4.4, §6.2; SelmerBoundsForAnticyclotomicTwists §3.1, §4.1, §4.6–§4.8, §5.4; NormsOfThetaLiftsAndExchangeIdentities §1.3, §1.4, §2.1, §2.2, §2.5, §6.3; ThetaLiftChainsAndTheSeesawIdentity §2.4–§2.7, §2.10, §2.16, §2.18; OneSidedPrimeSumBoundsAndAdmissibleData §1.2, §2.1–§2.3, §3.2–§3.4, §4.1; SecondMomentsOfPoincareSeries §2.3; CompositeThetaLiftsAndShortForms §5.2; DivisibilityOfThetaDerivatives §1.5. On main: LengthBoundsInPadicFamilies §1.8b; IntegralHeckeAndGaloisDeterminants §0.5; FiniteReductiveGroups §5.7.
- Automatic checks: one failed, the missing `Suggested.lean`, and it is real (R01). Dependency check: "depcheck: 122 roadmaps, 1386 edges, 0 problem(s)", no UPWARD or CYCLE line; the two-way supply of R03 was found by reading.
- Elaboration and the one-tactic probe: not possible, the folder has no Lean file.
- Ownership against open pull requests: LengthBoundsInPadicFamilies and CongruenceModulesOfThetaLifts were read on main, not at the head of their open revision; no open pull request drops an id cited here, and there are no declaration names to compare.
- Overlap check: read LengthBoundsInPadicFamilies, CongruenceModulesOfThetaLifts (the list by results was empty) and BaseChangeAndGaloisRepresentationsForUnitaryGroups. The determinant lemma for one block: LengthBoundsInPadicFamilies §1.8b, cited. Galois representations of definite unitary groups and depth-zero compatibility: BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1, §14.2, not cited (R02). The bound of a congruence ideal of theta lifts by Selmer lengths: CongruenceModulesOfThetaLifts §7.7b in another formulation, with a Tate–Shafarevich term that 6.5 avoids; left to the human reviewers.

Source independence: 5 passages (the Origins of 2.8, 3.2, 3.7 and 6.5, the last against two works) compared with 3 sources (Minguez2008, BellaicheChenevier2009, Urban2001), none shared; largest share `[ShortProof]`, 41 of 42 locators; its text and file tree could not be read, so neither the wording nor the contents were compared with it. By the README's own pointers its 41 sections correspond to 22 files of three folders, and the description says the layers keep the order of those folders.

Research link: The headline targets are steps of an unpublished formal proof of GRH (family index). Their published antecedents are Ribet's method as in Bellaïche–Chenevier 2009 (Theorem 1.5.5) and Urban 2001 (Theorem 1.1), and Mínguez 2008 (Théorème 1) for the parameters of theta lifts. Rests on README 2.8, 3.7, 6.5 and the three texts read.

## Not verifiable

- `[ShortProof]` (the folder `grh` of github.com/lsernau/grh-lean at commit `72fead1`): the sources service puts the host in no licence class. This covers all 41 section pointers, the 12 background pointers, and the sampled targets 1.1, 2.2, 2.6, 3.4, 3.6, 5.1, 5.4, 6.4, 6.7, 7.1, 7.2 and 7.3 as statements of that proof; they were checked for internal consistency only.
- Darmon, Diamond and Taylor (1995), Theorem 2.19, cited in 4.2: the publisher's page refused access and no other legal copy was looked for.
- Chenevier–Harris (2013) and Shin (2011) in 2.1, Gras–Munnier (1998) in 4.2, Mazur–Wiles (1984) and Greither (1992) in 6.1, Dasgupta–Kakde–Silliman–Wang (2023) in 3.7: cited without locators and not in the manifest; not opened.
- The dimension count of 4.2 (c), the exponent `y′²²` of 4.3 and the bound for `o_D` in 6.1 (a): they depend on `[ShortProof]` and on the unowned background results.

## Source issues

- none

## For the human reviewers

- Scope: 27 of the 41 sections are "particular to this proof" and sourced only to an unpublished Lean development that announces a proof of GRH; no refereed source states the headline theorems (README lines 12–31, family index).
- Second plan: CongruenceModulesOfThetaLifts on main (headline (3), §7.7b, §7.8) bounds congruences of theta lifts by Ribet's method and anticyclotomic twists; 6.5, 6.9 and 7.3 here treat the same subject in another formulation.
- Licence: the README names about 170 declarations of `[ShortProof]` and maps each section to one of its files; the family index states Apache 2.0, which this review could not open the repository to confirm.
- Not tested: `[ShortProof]`, the source of 41 of 42 locators, was not read. The description says the layers keep the order of its folders; whether the sections follow its files one to one was not checked.
- Umbrella: the pull request changes the root of the GRH umbrella from RiemannHypothesisForDirichletLFunctions to ShortGRH (`umbrellas/GRH.toml`), from 256 areas to 112 by its description.
