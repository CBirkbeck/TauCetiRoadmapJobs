# Review of CompositeThetaLiftsAndShortForms (pull request #3160 at c12c899)
Folder: `TauCetiRoadmap/ShortGRH/CompositeThetaLiftsAndShortForms/`
**Verdict:** needs changes

**Summary.** Changes are needed. Every statement I could test against the README's own definitions held up: the sampled statements agree with their proof sketches and with each other. The plan cannot be ordered, though. This roadmap and three supplier roadmaps in the same pull request cite each other. Fourteen prerequisites are left to a "ShortGRH background" that no roadmap provides, and roadmaps on main or Mathlib already state five of them. Two sentences assert false mathematics: the gloss that identifies the exceptional primes, and a bound in the proof sketch of 5.5. The pull request also changes the GRH umbrella files, outside the folder. There are four small corrections and three format notes. The human reviewers have to decide on the scope (the only source is an unpublished formal proof), the licence of that source, and whether a second plan of the gain stage is wanted.

## R01 (P1) — This roadmap and three of its suppliers in the same pull request cite each other, so no merge order exists for them.

With a supply cycle, no roadmap in it can be merged or worked on after all of its suppliers. This roadmap's *Needs:* lines cite OneSidedPrimeSumBoundsAndAdmissibleData throughout (for example 1.14, line 551; 2.1, line 586). They cite DivisibilityOfThetaDerivatives in 2.7, 3.1 and 3.4 (lines 720, 837, 912) and SecondMomentsOfPoincareSeries in 5.5 (line 1336). In the other direction:

- the *Needs:* lines of OneSidedPrimeSumBoundsAndAdmissibleData §§5.1–5.4 cite this roadmap (its README, lines 748, 784, 815, 836);
- DivisibilityOfThetaDerivatives §§5.4–5.6 cite this roadmap's local prime sums `s_p` and their total (its lines 1131, 1162, 1207);
- SecondMomentsOfPoincareSeries §2.4 needs DeterminantsOfThetaLiftChains (its line 296), whose §5.11 and §6.1 need this roadmap (its lines 1169, 1194).

The dependency check prints no cycle only because none of these roadmaps is in the merge order yet.

Three changes would remove the cycles:

1. Move the local prime sums of 2.1 (b) (`s_p` and `F(p)`) into OneSidedPrimeSumBoundsAndAdmissibleData §4.1, next to the prime sums they decompose, and cite them from there. This breaks the cycle with DivisibilityOfThetaDerivatives.
2. In 5.5, cite ThetaLiftChainsAndTheSeesawIdentity §2.5 for `𝖦` and `e₀` instead of SecondMomentsOfPoincareSeries. The good part `#𝖦·e₀ s z` is just `e₀` applied to a translate.
3. Split OneSidedPrimeSumBoundsAndAdmissibleData so that its Layers 5–6 (Theorems A–C and the main inequality), which consume this roadmap, come after it, while its Layers 0–4 remain a supplier.

## R02 (P1) — Fourteen prerequisites are left to "ShortGRH background", which is not a roadmap; roadmaps on main or Mathlib already state five of them.

An implementer cannot follow a supplier that does not exist, and what main or Mathlib states is cited, not planned again. The *Needs:* lines of 1.4, 1.5, 1.8, 1.12, 1.14, 2.6, 2.11, 3.1, 3.5, 4.1, 5.1 and 5.6 (lines 243, 280, 382, 497, 551, 691, 799, 838, 944, 1025, 1234, 1361–1363) name "ShortGRH background (…)". No folder or section of that name exists on main or in this pull request. These have owners:

- **3.5**, Hecke polynomials passing through a theta lift at a split unramified place: ThetaLiftsForDefiniteUnitaryGroups §2.2. It gives the homomorphism `ξ_w` with `θ_φ(F)⋆T = θ_φ(F⋆ξ_w(T))` and its Satake form.
- **2.6 and 4.1**, Hecke operators of a double coset on algebraic forms: AutomorphicFormsOnReductiveGroups §7.4.
- **2.11, 3.1, 4.1 and 5.6**, forms at a level with trivial stabilisers (one vector per class, hence sums over classes, the dimension count and delta forms): AutomorphicFormsOnReductiveGroups §7.5, which gives `S(J, M) ≅ M^h`.
- **1.12**, lattice points of `m⁻¹L` in a bounded set with null frontier tending to its volume: Mathlib `ZLattice.covolume.tendsto_card_div_pow` (Mathlib/Algebra/Module/ZLattice/Covolume.lean, line 318).
- **1.12**, flag counts, as products of subspace counts: ArithmeticStatisticsPartIV §3.2 (`#{W ≤ 𝔽_q^n : dim W = k} = [n k]_q`).

For the rest I found no owner. Each needs a target here, a section of a named earlier roadmap, or a declared gap:

- Smith and Hermite normal forms over a valuation domain (Mathlib has them only over a PID, in Mathlib/LinearAlgebra/FreeModule/PID.lean);
- the adjointness of substitution by `A` and by `Aᵀ` for the Fock pairing;
- the multiplicity bound of 1.4;
- short bases in the genus of the standard lattice (5.1, 5.6);
- spanning of a Weyl module by evaluation vectors at roots of unity.

Separately, 5.1 cites "RemainingAndMainTermsOfSecondMoments (few integral vectors have bounded conjugates)" (line 1235). That roadmap states no such result: the nearest is a packing estimate inside the proof route of its §1.2. State the count in 5.1 or cite a section that proves it.

## R03 (P2) — The Summary and the introduction to Layer 2 identify the exceptional primes with the primes where an a-place's partner is an a-place; the definition in 2.1 (f) is narrower.

A reader who takes the gloss at face value will think collisions occur only at exceptional primes and will miss the other case that 2.7 (b) has to pay for. The Summary says "At the inert primes `p < x₁` whose partners collide (the exceptional primes)" (line 20). Line 561 says Layer 2 "defines the primes at which the partner of an a-place is an a-place (the exceptional primes)".

Counterexample: take a prime `p < x₁` inert in `K` with `p ≡ −1` modulo `q₀` and modulo `m`. The prime number theorem in progressions supplies such primes, since the modulus is a power of `x`. Then `−p ≡ 1 (mod q₀)`, so for every a-place `τ` the partner `(−p)τ` (with `e = 1 ∈ I_p`) is an a-place. But `p ≡ −1 (mod m)` puts `p` outside 2.1 (f), and its collisions are paid for by the `m`-fold loss of 2.7 (b). The same happens when `o₀(p)` is odd and exceeds `𝔯(p)`.

Suggested wording: "the inert primes `p ≢ ±1 (mod m)` with `o₀(p)` odd and at most `𝔯(p)`, at which partners collide already at the exponent `o₀(p)` (the exceptional primes)".

## R04 (P2) — The proof sketch of 5.5 says the coefficients `#Ḡ·e₀(t)` have conjugates of absolute value at most `1`; at `t = 1` the coefficient is an integer greater than `1`.

An implementer following the sketch will try to prove a false bound. The statement itself survives, because the sketch's own `4 log #Ḡ` already allows for the correct bound. The sketch says the coefficients "have conjugates of absolute value at most `1`" (lines 1321–1322). By ThetaLiftChainsAndTheSeesawIdentity §2.5, `e₀` is a sum, over good families of labels, of tensor products of central idempotents `e_χ = (χ(1)/|G|)·Σ_g χ(g⁻¹)g`. So `#𝖦·e₀(1) = Σ_good Π_w χ_{c_w}(1)²`. This is a rational integer greater than `1`, because every good family contains a primitive (cuspidal) label of degree `r ≥ 2`. The bound that does hold is `|σ(#𝖦·e₀(t))| ≤ Σ_χ χ(1)² = #𝖦` for every `σ`. Replace "at most `1`" with "at most `#Ḡ`".

## R05 (P2) — The pull request changes two files outside the roadmap folders it adds.

`umbrellas/GRH.toml` and `umbrellas/GRH-targets.md` are rewritten (2,132 lines added, 18,337 deleted), moving the root of the umbrella GRH from RiemannHypothesisForDirichletLFunctions to ShortGRH. This decides how the project schedules work on the family already on main, and the change does not belong to this roadmap. Move it into a pull request of its own, or have the operator name it as part of this one.

## C01 — Several symbols differ from the suppliers' symbols for the same object, and one clashes with a supplier symbol for a different object.

A reader who looks up these objects in the suppliers finds other names, and in one case a different object under the same letter:

- The Table of symbols (line 102) writes `Θ_j^ϑ` for the lift `X_j → X_{j+1}`. ThetaLiftChainsAndTheSeesawIdentity writes `L_j^ϑ` for that lift (§2.8) and uses `Θ_ϑ` for the lower chain (§2.15), which 5.5 here calls `ι_ϑ`.
- `Ḡ` here (5.5) is `𝖦` in its §2.5.
- `B_ϑ^Ψ` is `comp_ϑ(Ψ)` in its §2.12.
- `𝒮` is `𝒮_X` in its §2.8.
- The error unit `e_U` (line 95) is `u_E` in OneSidedPrimeSumBoundsAndAdmissibleData §4.1.
- `F(p)` (2.1 (b)) is `S_p` in DivisibilityOfThetaDerivatives.
- "Lift diagrams" (lines 101, 2.7, 5.2) is not a term the supplier uses: it defines the weights by column counts in §2.2.

Adopt the suppliers' symbols, or add a column to the Table of symbols giving them.

## C02 — `K₀` names two different groups, and 5.7 applies 5.6 (a) to an element that lies in only one of them.

In 5.1 and 5.6 (lines 1231, 1353), `K₀` is the stabiliser of the standard lattice. Everywhere else (the Table of symbols, 2.5 (e), 2.11, 4.5) it is the level of the source forms. 5.7 applies 5.6 (a), which needs `g ∈ K₀`, to the scalar `z_w`. By 2.9 (b), `z_w` lies in the maximal compact subgroup but not in the source level. The step is right only with the first meaning. Rename the group in 5.1 and 5.6 (for example `K_std`).

## C03 — `err₀` is defined only at primes, but 2.3 and 4.9 sum it over finite sets of natural numbers.

2.1 begins "Let `p` be a prime", while 2.3 (line 620) and 4.9 (c) (line 1209) sum `err₀` and `err` over arbitrary finite `U ⊂ ℕ`. Read literally, a composite `n < x₁` with `χ_K(n) = −1` (for example twice an inert prime) would be "small non-split". Add "and `err₀(n) = 0` for `n` not prime" to 2.1 (d).

## C04 — A sentence of the pull request's description does not hold for this roadmap.

The description says: "Where a section of an existing roadmap, or a theorem already in the library, gives what the route uses, it is cited and not restated." This roadmap cites no roadmap on main, and it leaves to a background roadmap results that ThetaLiftsForDefiniteUnitaryGroups §2.2, AutomorphicFormsOnReductiveGroups §§7.4–7.5, ArithmeticStatisticsPartIV §3.2 and Mathlib already state (R02). Once R02 is repaired the sentence will be true. Until then, say that the citations to main are still to be added.

## N01 — Several letters carry two or three meanings.

In Layer 1, `N` is the number of letters, while elsewhere it is the level prime, and in 5.1 and 5.6 an integer in the different. `E` is the CM field, an exponent (1.2) and a set of edges (1.7 (d)). `K` is also a field of characteristic `p` (1.4, 1.12). `m` is also an exponent (1.7 (b), 1.12, 1.14). `T` is a Frobenius cycle and a set of primes (2.2 (d)). Renaming inside Layer 1 would remove most of these clashes.

## N02 — Citations of the other roadmaps of the family are descriptions in words, not section numbers as the family index requires.

Some descriptions match no heading: "weights and lift diagrams" is ThetaLiftChainsAndTheSeesawIdentity §2.2, and "the operator Up and the lift laws modulo N" is its §2.11. Write them as `<Roadmap> §k.n` (for example OneSidedPrimeSumBoundsAndAdmissibleData §1.1, §3.2, §4.1; ThetaLiftChainsAndTheSeesawIdentity §1.5, §2.2, §2.11, §2.12, §2.15; DivisibilityOfThetaDerivatives §3.1, §3.4, §4.8).

## N03 — The README has no References section, and `[ShortProof]` is defined only in the family index.

Add an entry naming the repository and the commit, so that the locators can be followed from this file alone.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.2 Stepanov's count | `W = R = 𝔽_q`, `Φ = (X^q − X)^E`; `E = 0` | `deg Φ = Eq` = bound (sharp); `0 ≤ deg Φ` | holds | none |
| 1.5 (a) adjoint weights | `p = 2`, `f = 2`, `γ = (1,1)`, `(2,1)`; `A = (a)` | multinomials 2, 3; `η` = 8, 16/3 ∈ `ℤ_(2)`; `⟨aⁿxⁿ, xⁿ⟩ = aⁿη` = other side | holds (only `p` is a non-unit) | none |
| 1.5 (b) spanning | `𝔽_3`, `n = e = 1`, `g = x`; control `𝔽_2`, `n = 2`, `e = 1` | span dim 2 = 2; control: dim 2 < 3 | holds; hypothesis `n + e ≤ q` needed | none |
| 1.8 (a), (b) edge pairing | substitute `g ↦ gᵀ` in 1.7 (c); `c* = 3kc` | adjointness identity matches; `⟨b′η, h′⟩ = p^{Nc₀}Σh′η`; `9kc ≥ 3c` | holds | none |
| 1.11 / 1.12 Pieri share | `k = 2`, `N = 1`, both signs | volume fraction `1/(P+1)`; `(q²−1)/(q−1) = q + 1 = #ℙ¹(𝔽_q)` | holds | none |
| 2.2 (a), (b) | inert odd/even `e`; `p = d`; split; `p^e ≥ x₁` | `(1−χ)/2` = 1, 0, 1/2, 0 = `[e∈I_p]v(π_p)`; `y/p^e ≤ a/x₁ ≤ κ` | holds | none |
| 2.3 sum of losses | `c = 1` serves `m ± 1`, `N`; N-term | ≤ 4 per `c`; `2mfb log N ≈ 8fa log b ≪ fa(log b)³` | holds | C03 (composites) |
| 2.5 (a)–(e) | `o` vs `lcm(2, ord p)`; `p = d`; `v₂` of `(−p)ⁿ − 1` | `o = f_p` (`o` even); `−d^e ≢ 1 (q₀)`; `v₂(n) ≥ 21 log₂ m`; `p ∤ q₁` | holds | none |
| 3.5 (b)–(e) | exponent of `z^{(t+1)i}N𝔩^{C(i,2)}`, `2h ≤ f`, `i ≤ 𝔯 ≤ t` | `hi(t+i) ≤ f𝔯t`; `ν_p ≥ (j+1)f𝔯t` | holds | none |
| 3.7 (b)–(e) | per-step exponent from 3.6, 2.7, 2.8; `j_p` | `−gain/m + 2loss/m` per step → `gain − 2loss`; `m·coll ≤ 2mfa/p ≤ j_p` | holds | none |
| 4.1 (b) / 4.3 | `A_𝔩 = aℓ`; 4.2 (e), (f) | `3c_div ≤ 12A_𝔩/(mp)`; `|X|·|I| = D_X`; product ≤ `loss·D_X` (2.8 b) | holds | none |
| 4.5 (a), (c) | `N ≡ 1 (q₁d)`; `π_N` factors | `Σ_N` one prime per conjugate pair; each `w ∈ Σ_N` has exactly one of `w, w̄` dividing `π_N` | holds | none |
| 4.9 headline | the four cases of 4.8 with `err = err₀` | colength `≤ loss·D_X ≤ 2loss·D_X`; at `N`: `mfb·D_X ≤ 2mfb·D_X`, valuation `≥ −2mfb` | holds | C03 |
| 5.2 (b), (c) | `log(M/Ω)`; row 0 | `M ≥ b^{20} ≫ Ω`, so `log(M/Ω) > 0`; `μ₀ + σ₀ ≤ a + b + a/x₁ + r^{16} ≤ 2a` | holds | none |
| 5.4 headline | exponents of 3.2 (c), 5.2, 5.3 (d) | extra `≈ fx^{41} log b + x^{70} ≪ e_U/2`; kernel factor squared `exp(2x^{50} + rs_j)` | holds | none |
| 5.5 sketch | `t = 1` in `#𝖦·e₀(t)` | `Σ Π χ(1)² > 1`, against "≤ 1"; `≤ #𝖦` gives the sketch's `4 log #Ḡ` | sketch false, statement holds | R04 |
| 5.7 headline | `B = exp(e_U)/4^f` vs `(6q₁d(fk)²)^{6(kf+fa)}` | `log ≈ 6f(k+a)·O(log x) ≪ fa(log b)³`; `f` primes divide `π_N`, giving `4^f` | holds | none |
| Gloss of Summary and Layer 2 | `p ≡ −1 (q₀)`, `p ≡ −1 (m)`, `χ_K(p) = −1` | partner `(−p)τ ≡ 1 (q₀)` is an a-place; `p` not exceptional | gloss false | R03 |
| 5.6 (a) in 5.7 | `g = z_w` | in the maximal compact (2.9 b); not in the source level (`i = 1`) | holds with 5.1's `K₀` only | C02 |

- Source locators: 0 of 48 `[ShortProof]` pointers checked against the text (the source could not be read; see below).
- Library declarations opened at the pins: Mathlib `NumberField.IsCMField` (NumberTheory/NumberField/CMField.lean:70), `NumberField.AdeleRing` (NumberTheory/NumberField/AdeleRing.lean:56), `IsDedekindDomain.FiniteAdeleRing` (RingTheory/DedekindDomain/FiniteAdeleRing.lean:95), `Matrix.unitaryGroup` (LinearAlgebra/UnitaryGroup.lean:105), `ZLattice.covolume.tendsto_card_div_pow` (Algebra/Module/ZLattice/Covolume.lean:318), and the Smith normal form over a PID (LinearAlgebra/FreeModule/PID.lean). Tau Ceti: LinearAlgebra/UnitaryGroup.lean (adjugate lemmas only; no algebraic modular forms).
- Cross-roadmap citations resolved: 29 to OneSidedPrimeSumBoundsAndAdmissibleData, 30 to ThetaLiftChainsAndTheSeesawIdentity, 7 to DivisibilityOfThetaDerivatives, 1 to SecondMomentsOfPoincareSeries, all to existing sections; 1 to RemainingAndMainTermsOfSecondMoments unresolved (R02). On main I opened ThetaLiftsForDefiniteUnitaryGroups §2.2, AutomorphicFormsOnReductiveGroups §§7.4–7.5, ArithmeticStatisticsPartIV §3.2 and LocalGainOfThetaChains §§4.12–4.14f′.
- Back-citations read in the siblings: OneSidedPrimeSumBoundsAndAdmissibleData lines 748, 784, 815, 836; DivisibilityOfThetaDerivatives lines 1131, 1162, 1207; SecondMomentsOfPoincareSeries line 296; DeterminantsOfThetaLiftChains lines 1169, 1194; ThetaLiftChainsAndTheSeesawIdentity lines 9, 13, 176 (descriptive only, no cycle).
- Elaboration: `lake env lean` on Suggested.lean exits 0 with no messages. The file declares nothing, so there was no `#check @name` comparison to make and no one-tactic probe to run. Its docstring names each headline (4.9, 5.4, 5.7) and the missing carriers, which I confirmed absent at the pins.
- Dependency check, output: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`. This misses the cycles of R01: run on OneSidedPrimeSumBoundsAndAdmissibleData and DivisibilityOfThetaDerivatives, it reports `NOT IN ORDER`, so the edges among the siblings are never checked.
- Out-of-folder diff: `umbrellas/GRH-targets.md`, `umbrellas/GRH.toml` (R05).
- Overlap check: read LocalGainOfThetaChains, the only roadmap the three closest-roadmap lists name (both vocabulary lists are empty). It owns the gain at inert primes, the Hecke commutation, the colength of the Hecke image and the colength at the level prime for the chain of RiemannHypothesisForDirichletLFunctions. No object is defined in both, because the two are written for different data. The general Satake relation through a lift (ThetaLiftsForDefiniteUnitaryGroups §2.2) and the evaluation at a free level (AutomorphicFormsOnReductiveGroups §7.5) are owned on main (R02). Ownership against open pull requests was checked only through the sibling folders of this pull request and the overlap index.

Source independence: 0 passages compared with 0 sources. The only source, `[ShortProof]`, could not be read, and the three "adapted from the published theory" origins (1.2, 1.5, 5.1) give no source. The largest share is `[ShortProof]`, 48 of 48 locators. Contents not compared. From the pointers alone, the layers do not map one to one onto its directories: Layer 2 draws on both `Size/` and `Divisibility/`, and `Size/` is split between Layers 2 and 5.

Research link: the headlines (4.9, 5.4, 5.7) are the inputs to Theorem A of an announced, unpublished formal Lean proof of GRH (`[ShortProof]`; README Summary and family index). The only published theories named (Stepanov's method in 1.2, Schur algebras in 1.5, class numbers of hermitian genera in 5.1) are cited without a source. This line rests on the README alone.

## Not verifiable

- Every `[ShortProof]` pointer (the 15 sampled targets and the rest): the sources service refused github.com/lsernau/grh-lean at commit 72fead1 because its host is in no licence class. No author is named, so I could not vouch that it is an author's page.
- The origins of 1.2, 1.5 and 5.1 ("adapted from the published theory of …"): no source is given.
- 1.4 (a), 1.9 (a), 1.10, 1.12 (a), 2.7 (a), 3.4: beyond the size and consistency checks in the table, these depend on steps of a source I could not read.

Automatic checks set aside as false positives: the two TeX-syntax hits, at lines 343 and 490, are inside inline code spans that continue onto the next line.

## Source issues

- none

## For the human reviewers

- Scope: the only source is an unpublished formal Lean proof in a GitHub repository (`[ShortProof]`, lsernau/grh-lean at 72fead1), presented as a proof of GRH. 38 of the 48 sections are labelled "particular to this proof", and I found no refereed source stating the headline theorems.
- Licence: the family index says `[ShortProof]` is Apache 2.0 and a rewriting of the proof that RiemannHypothesisForDirichletLFunctions follows, which that family's index says was published without a licence. The sources service does not classify the host.
- Not tested: `[ShortProof]`, the source of all 48 locators, could not be read, so neither the wording nor the arrangement was compared with it.
- Second plan: Layers 2–4 plan, for a second set-up, the stage that LocalGainOfThetaChains on main plans (gain at inert primes, the colength of the Hecke image through an edge model, the colength at the level prime). Whether the project wants both plans is a decision.
- Umbrella: the pull request re-roots the umbrella GRH from RiemannHypothesisForDirichletLFunctions to ShortGRH (from 256 to 95 areas, by the description).
