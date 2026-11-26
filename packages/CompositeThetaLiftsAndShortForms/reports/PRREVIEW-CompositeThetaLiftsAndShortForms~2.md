# Review of CompositeThetaLiftsAndShortForms (pull request #3160 at f612a55)
Folder: `TauCetiRoadmap/ShortGRH/CompositeThetaLiftsAndShortForms/`
**Verdict:** needs changes

**Summary.** Changes are needed. Every statement I could test against the README's own definitions and its suppliers' sections held, but five of the previous review's findings stand at this head and there is one new one. Two sentences still assert false mathematics (the gloss that identifies the exceptional primes, and a bound in the proof sketch of 5.5). This roadmap still forms a supply cycle with two of its suppliers, fourteen *Needs:* entries still point at a background that no roadmap provides (five of the results are stated on main or in Mathlib), the scalings and the ramified source forms are defined both here and in a supplier, and the pull request still changes files outside the family. Repaired since the previous review: citations are by section number, the count of integral vectors is stated as 5.1 (a), and 5.5 no longer cites SecondMomentsOfPoincareSeries. There are four small corrections and four format notes. The human reviewers decide the scope, the licence of the only source, and the umbrella.

## R01 (P1) — This roadmap and two of its suppliers in the same pull request still cite each other, so the three cannot be placed in a merge order.

The merge order is by roadmap, so a roadmap that both supplies and consumes another can be placed neither before nor after it. Of the three cycles of the previous review, the one through SecondMomentsOfPoincareSeries is gone (5.5 now cites ThetaLiftChainsAndTheSeesawIdentity §§2.5, 2.7, 2.15). Two remain:

- This roadmap cites OneSidedPrimeSumBoundsAndAdmissibleData 37 times (for example the *Needs:* of 2.1, line 587). In the other direction, the *Needs:* lines of its §5.2, §5.3 and §5.4 cite this roadmap's §§2.1, 2.4, 2.11, 4.9, 5.4, 5.5, 5.7 (its README, lines 807, 837, 865).
- This roadmap cites DivisibilityOfThetaDerivatives §3.1, §4.8 and §4.11 (d) (lines 724, 845, 921). The *Needs:* lines of its §5.4, §5.5 and §5.6 cite this roadmap's §2.1 (b) (its README, lines 1151, 1182, 1228).

The sections themselves are acyclic, so moving ownership is enough. Move the local prime sums `s_p` and `F(p)` of 2.1 (a), (b), with 2.2, into OneSidedPrimeSumBoundsAndAdmissibleData §4.1, beside the prime sums they decompose; this ends the cycle with DivisibilityOfThetaDerivatives. Move Layers 5 and 6 of OneSidedPrimeSumBoundsAndAdmissibleData (Theorems A to C and the main inequality, which consume this roadmap) into a roadmap that comes after this one. The dependency check does not see either cycle, because the siblings are not in the merge order yet.

## R02 (P1) — Fourteen *Needs:* entries are still left to "ShortGRH background", which no roadmap provides; five of the results are stated on main or in Mathlib.

An implementer of 1.4, 1.5, 1.8, 1.12, 1.14, 2.6, 2.11, 3.1, 3.5, 4.1, 5.1 or 5.6 meets a *Needs:* entry that points nowhere (lines 244, 281, 383, 498, 552, 695, 805, 845, 953, 1034, 1252, 1382–1385). The family index now says such an entry is "a result still to be stated as a numbered target", which confirms that it has no owner. Of the previous list only the count of integral vectors was repaired (now 5.1 (a)). These have owners and need only a citation:

- **3.5**: ThetaLiftsForDefiniteUnitaryGroups §2.2 (the homomorphism `ξ_w` with `θ_φ(F)⋆T = θ_φ(F⋆ξ_w(T))` and its Satake form, which is the relation of Hecke polynomials). ThetaLiftChainsAndTheSeesawIdentity §2.8 already cites that roadmap's §1.2.
- **2.6, 4.1**: AutomorphicFormsOnReductiveGroups §7.4 (the double-coset Hecke action on level forms).
- **2.11, 3.1, 4.1, 5.6**: AutomorphicFormsOnReductiveGroups §7.5 (`S(J, M) ≃ M^h` at a level with trivial stabilisers).
- **1.12**: Mathlib `ZLattice.covolume.tendsto_card_div_pow` (Mathlib/Algebra/Module/ZLattice/Covolume.lean, line 318), and ArithmeticStatisticsPartIV §3.2 for the number of subspaces, hence of flags.

The rest need a target here or a section of a named earlier roadmap: Hermite and Smith normal forms over a valuation domain (Mathlib has them over a PID only, Mathlib/LinearAlgebra/FreeModule/PID.lean); the adjointness of substitution by `A` and `Aᵀ` for the Fock pairing; the multiplicity bound of 1.4; short bases in the genus of the standard lattice (5.1, 5.6); spanning of a Weyl module by evaluation vectors at roots of unity. For 1.4 the uniform case is Dvir–Kopparty–Saraf–Sudan, arXiv:0901.2529v2, Lemma 8, p. 9 (the sum of the multiplicities of a nonzero polynomial of degree `d` over `Sⁿ` is at most `d·|S|^{n−1}`); the form used here weights each variable by the inverse of the size of its set.

## R03 (P2) — The Summary and the introduction to Layer 2 still identify the exceptional primes with the primes whose partners collide; the definition in 2.1 (f) is narrower.

Not repaired. A reader who takes the gloss as the definition will think collisions occur only at exceptional primes and miss the case 2.7 (b) pays for. The Summary says "the inert primes `p < x₁` whose partners collide (the exceptional primes)" (line 20), and line 562 "the primes at which the partner of an a-place is an a-place (the exceptional primes)".

By 2.1 (g) a collision at an inert `p` exists exactly when `(−p)^e ≡ 1 (mod q₀)` for some odd `e`, that is when `o₀(p)` is odd. Take `p < x₁` inert in `K` with `p ≡ −1` modulo `q₀` and modulo `m`: then `o₀(p) = 1`, every a-place collides with its partner at `e = 1`, and `p` is not exceptional because `p ≡ −1 (mod m)`. Its collisions are paid by the `m`-fold loss. The same happens when `o₀(p)` is odd and exceeds `𝔯(p)`.

Suggested wording in both places: "the inert primes `p ≢ ±1 (mod m)` at which partners collide at an odd exponent `o₀(p) ≤ 𝔯(p)` (the exceptional primes)".

## R04 (P2) — The proof sketch of 5.5 still says the coefficients `#Ḡ·e₀(t)` have conjugates of absolute value at most `1`; at `t = 1` the coefficient is an integer greater than `1`.

Not repaired (lines 1341–1342: "have conjugates of absolute value at most `1`"). An implementer following the sketch will try to prove a false bound. By ThetaLiftChainsAndTheSeesawIdentity §2.5, `e₀` is the sum over good families of the tensor products of the central idempotents `e_c = (χ_c(1)/|G|)·Σ_g χ_c(g⁻¹)g`, so `#𝖦·e₀(1) = Σ_good Π_w χ_{c_w}(1)²`, a sum of squares of degrees of characters of `GL_r(𝔽_w)`, at least one of them cuspidal of degree `Π_{0<i<r}(q^i − 1) > 1`. The bound that holds is `|σ(#𝖦·e₀(t))| ≤ Σ_χ χ(1)² = #𝖦`, and it is the one the sketch's own `4 log #Ḡ` allows for. Replace "at most `1`" by "at most `#Ḡ`". The statement 5.5 (b) is not affected.

## R05 (P2) — The pull request changes three files outside the roadmap folders it adds.

Not repaired, and one file more than before. `umbrellas/GRH.toml` and `umbrellas/GRH-targets.md` are rewritten (2,205 lines added, 18,337 deleted), re-rooting the umbrella GRH at this family, and the top-level `README.md` gains a line in its roadmap list, which is regenerated after a merge and is not edited by a roadmap pull request. Move the three changes to a pull request of their own, or have the operator name them as part of this one.

## R06 (P2) — The scalings `z_w` and the ramified source forms are defined twice: in 2.9–2.10 here and in ThetaLiftChainsAndTheSeesawIdentity §2.8.

Two definitions of one object in two roadmaps can drift apart, and an implementer cannot tell which roadmap the library declaration belongs to. ThetaLiftChainsAndTheSeesawIdentity §2.8 fixes for each `w | π_N` a scaling `z_w` (an integral norm-one idele, `1` away from `w` and `w̄`, generating the units of the residue field at `w`) and defines `𝒮_X^{ram}` as the source forms killed by `Σ_{0≤i<N−1} z_w^i` for every `w`; its §2.14 then uses them. Sections 2.9 (definition of a scaling, and "fix one") and 2.10 here give the same two definitions as this roadmap's own, and the Table of symbols lists `z_w, 𝒮^ram` as defined in 2.9, 2.10. Both roadmaps point at the same declarations of `[ShortProof]` (`New.Data.scalingGenerator`, `New.Data.ramifiedSourceForms`). The supplier is the earlier owner: in 2.9 and 2.10 recall the definitions with "as in ThetaLiftChainsAndTheSeesawIdentity §2.8", add that section to their *Needs:* lines and to the table, and keep here what is proved about them (existence in 2.9 (a), 2.9 (b), (c), 2.11).

## C01 — Several symbols still differ from the suppliers' symbols for the same object, and two letters are exchanged with a supplier.

Not repaired. The Table of symbols writes `Θ_j^ϑ` for the lift `X_j → X_{j+1}` and cites ThetaLiftChainsAndTheSeesawIdentity §2.8, where that lift is `L_j^ϑ`; the supplier (§2.15) and the family index use `Θ_ϑ` for the lower chain, which 5.5 here calls `ι_ϑ`, while `ι_{j+1}^ϑ` in §2.15 is one lift of that chain. Further: `Ḡ` is `𝖦` in §2.5; `B_ϑ^Ψ` is `comp_ϑ(Ψ)` and `t_x(j)` is `v_j(x)` in §2.12; `𝒮` is `𝒮_X` in §2.8; `e_U` is `u_E` in OneSidedPrimeSumBoundsAndAdmissibleData §4.1; `F(p)` is `S_p` in DivisibilityOfThetaDerivatives. Adopt the suppliers' symbols, or add a column to the table giving them.

## C02 — `K₀` still names two groups, and 5.7 uses both in one sentence.

Not repaired. In 5.1 (b) and 5.6 (lines 1250, 1374) `K₀` is the stabiliser of the standard lattice; elsewhere it is the level of the source forms. The sketch of 5.7 applies "5.6 (c) for `K₀` (free)", the source level, and then 5.6 (a), which needs `g ∈ K₀` in the other sense, to the scalar `z_w`, which by 2.9 (b) is in the maximal compact subgroup and not in the source level. Rename the group of 5.1 and 5.6 (for example `K_std`).

## C03 — `err₀` is defined at primes only, but 2.3 and 4.9 (c) sum it over finite sets of natural numbers.

Not repaired. 2.1 begins "Let `p` be a prime"; 2.3 (line 622) and 4.9 (c) sum over arbitrary finite `U ⊂ ℕ`. Add "and `err₀(n) = 0` for `n` not prime" to 2.1 (d).

## C04 — Two sentences of the pull request's description do not hold at this head.

"Where a section of an existing roadmap, or a theorem already in the library, gives what the route uses, it is cited and not restated" is not true of this roadmap, which cites no roadmap on main and leaves to the background what four sections on main and a Mathlib theorem state (R02). And "183 entries at this commit" of `ShortGRH background`: the eleven READMEs have 198 at this head, 14 of them here. Correct the count, and say that citations of main are still to be added in this member.

## N01 — Several letters carry two or three meanings.

`N` is the number of letters in Layer 1, the level prime elsewhere and an integer in the different in 5.1 and 5.6; `E` is the CM field, an exponent (1.2) and a set of edges (1.7 (d)); `K` is also a field of characteristic `p` (1.4, 1.12); `m` is also an exponent (1.7 (b), 1.12, 1.14); `T` is a Frobenius cycle and a set of primes (2.2 (d)); `ι` is an embedding and an index set (5.1 (a)).

## N02 — The README has no References section, and `[ShortProof]` is defined only in the family index.

An entry naming the repository and the commit would let the pointers be followed from this file; the published sources of 1.2, 1.5 and 5.1 ("adapted from the published theory of …") would go there too.

## N03 — The README has no Checks; three would each separate the stated object from a plausible wrong one.

Offered: (i) every prime below 13 divides `18480 | q₀` and `d ≡ −1` modulo each, so `−d` is a square there and each splits in `K`; hence `13 ≤ p` in 4.2 (e) and `P ≥ 5` in 1.1 (a) hold at every inert prime. (ii) `γ_p = v(π_p)·Σ_{e∈I_p} p^{−e}`: `p/(p² − 1)` at an inert prime, `1/(2d − 2)` at `d`. (iii) 1.5 (b) is sharp: in two variables over `𝔽_q` with `g` a product of `e` distinct linear forms, the evaluation vectors span a space of dimension `min(n + 1, q + 1 − e)`.

## N04 — `Suggested.lean` states nothing, although Layer 1 uses only local rings, polynomials and matrices.

The docstring's reason (Layer 1 is a step, not a headline) is the author's choice. If a test is wanted, Stepanov's count 1.2 is statable in a few lines against Mathlib, and 1.14 with the definitions of 1.1 and 1.7.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.2 Stepanov's count | `W = R = 𝔽_q`, `Φ = (X^q − X)^E`; `E = 0`; `R = 0` | `deg Φ = Eq` (sharp); `0 ≤ deg`; zero ring has no nonzero `Φ` | holds | none |
| 1.3 (a) weights | `P = 5`, `N = 2`; `j = (s − i) mod N` | difference `2P^j/(q−1) = 0.42` (`j = 1`), `(q+1)/(q−1) = 1.08` (`j = 0`); defect ≤ `1.25d` | in `[0, 3/2]`, ≤ `2d` | none |
| 1.4 (a), (b) | mean weighted degree over `Exp`; `k = 2, r = 1, N = 2, n = 1` | mean `= Nn((k−2r)P^{−2r}/(2k) + r/(kP)) ≤ c_div`; `Deep(1,1) = 0` in `V ⊗ V*^{(P)}` | holds | R02 (owner of the count) |
| 1.5 (a) adjoint weights | `p = 2, f = 2`, `γ = (1,1), (2,1)`; other primes | multinomials 2, 3; `η = 8, 16/3`; a prime `ℓ ≠ p` is a unit since `1 = ap + bℓ`; `v_p ≤ (#σ−1)f` | holds | none |
| 1.5 (b) spanning | two variables, `g` = `e` linear forms, `q = n + e` and `q = n + e − 1` | span dimension `min(n+1, q+1−e)`: `n + 1`, then `n` | holds; hypothesis sharp | N03 |
| 1.8 (a), (b) | `f = eN` in 1.5 (a), 1.6; `j = c` | per letter `p^{keN}`, pairing `p^{Nc₀} = p^{k²eN²}`; `⟨b′η, h′⟩ = p^{Nc₀}Σh′η`; `3c* = 9kc ≥ 3c` | holds | none |
| 1.10 averaging map | hypotheses of 1.6 and 1.9 from `Nk(ℓ+2)n + n + k < P^ℓ` | `D + k ≤ (P^ℓ − 1 − n − k)P^ℓ + k < P^{2ℓ} = q = p^f` | holds | none |
| 1.11 / 1.12 | `k = 1`; `k = 2, N = 1`; `(D/n)^{(k−1)N}` | share 1; `1/(q+1)`; `exp(θ/2) ≤ 1 + θ` on `[0,1]`; flags `Π(q^{l+1}−1)/(q−1)` | holds | R02 (lattice count) |
| 2.2 (a)–(d) | inert odd, even `e`; `p = d`; split; `p^e ≥ x₁`; `p ∣ q₁` | `(1−χ)/2 = 1, 0, 1/2, 0 = [e ∈ I_p]v(π_p)`; `y/p^e ≤ a/x₁ ≤ κ` | holds | none |
| 2.3 sum of losses | `Σ log p/p`, `p = mc ± 1`, `N`-term | `≲ 10fa(log b)^{7/3}`; `2mfb log N ≈ 8fa log b`; both `≪ fa(log b)³` | holds | C03 |
| 2.5 (a) | `v₂((−p)² − 1) ≤ μ` for `m = 2^μ`; `o` vs `lcm(2, ord p)` | order of `−p` mod `2^s` is `≥ 2^{21μ+1}`; `f_p = o` in both parities of `ord p` | holds | none |
| 2.6 / 4.1 scaling | `A_𝔩` in 2.4 (c) and 4.1 | `a·#{τ ∈ Φ_a : w_τ = 𝔩} = a·#{even letters}` (4.2 (d)) | agree | R02 (Hecke owner) |
| 2.7 (a)–(d) | `S = ∅` against the supplier §1.5 (d); geometric sum | `D_p(j, ∅) = PD − f n³(1 + log_p max(B,1))` on both sides; `coll ≤ fa·p^{−o}·p/(p−1) ≤ 2fa/p^o` | holds | none |
| 2.11 (a)–(c) | `ℂ[ℤ/(N−1)]`; `#s = f` | kernel of the norm element = image of `1 − z`; `dim 𝒮^ram ≥ D_X − f·D_X/(N−1)` | holds | R02, R06 |
| 3.1 (b)–(d) | weak chain datum of the supplier §2.12; `p ∤ M` | values integral away from `q_ϑ`; `π̄_M x_j` integral above `p ≠ N`; `π̄_M` a unit when `p ∤ M` | holds | R02 |
| 3.5 (a)–(e) | exponent of `z^{(t+1)i}N𝔩^{C(i,2)}`; coefficient of `U^i` | `hi(t+i) ≤ (f/2)·𝔯·2t = f𝔯t`; triangular system with `R(0) = 1`; `ν_p ≥ (j+1)f𝔯t` | holds | R02 (owner on main) |
| 4.2 (d)–(f), 4.3 | `o = o₀N′`; primes `< 13`; `P^{−2𝔯} + 𝔯²/(kP)` | `q = P^{N′} = p^o`; 2, 3, 5, 7, 11 split; `≤ 2/(mp)`; `(12A_𝔩/(mp) + j₀/(m²f))D_X` | holds | N03 |
| 4.9 headline | four cases of 4.8; `p = N`; `p = d`; intersection with `𝒮^ram` | `N`: valuation `≥ −2mfb`, colength `mfb·D_X ≤ 2mfb·D_X`; matrix over `𝒪_ι` keeps `𝒮^ram` | holds | C03 |
| 5.1 (a), (b) | `r = 0`; `ι = ∅`; `E = ℚ, r = 1`; packing in sup norm | 1 ≤ 1; 1 ≤ 1; 3 ≤ 9; ratio `(1 + 2r)^{2#ι f′}`; (b): `#ι = 2n²` gives `4fn²` | holds | none |
| 5.2 (b)–(d) | row 0; `l ≤ r + e`; `π̄_M` | `μ₀ + σ₀ ≤ 2a`; `s_∞(r+e) ≤ s_∞(r) + e(log(r+e+1) + log(M/Ω))`; `|π̄_M|² = M` | holds | none |
| 5.3 (b)–(d) | substitute 2.2 (c), definitions of `h_main`, `rem` | both sides `m·#Φ_a·s_main + mkΣ s_∞(κ)`; (d) `= #Φ_a(m(s_∞(a) − s_main) − a log N) ≤ 32fa log b` | exact | none |
| 5.4 headline | exponents of 5.3 (d), 3.2 (c), 5.2 (a) | `cs − #Φ_a·a·log N + e_U/2 + O(mx^{50} + x^{70})`; total `≤ β` | holds | none |
| 5.5 sketch | `t = 1` in `#𝖦·e₀(t)` | `Σ Π χ(1)² > 1` against "≤ 1"; `≤ #𝖦` gives `4 log #Ḡ` | sketch false, statement holds | R04 |
| 5.6 / 5.7 headline | `g = z_w`; `f` primes divide `π_N` | `z_w` in the maximal compact, not in the source level; `4^f·exp(e_U)/4^f = exp(e_U)` | holds with 5.1's `K₀` | C02 |
| Gloss, Summary and Layer 2 | `p ≡ −1 (q₀)`, `p ≡ −1 (m)`, inert | `o₀ = 1`, collision at `e = 1`; `p` not exceptional | gloss false | R03 |
| 2.9–2.10 against supplier §2.8 | definitions side by side | same scaling, same `Σ_{i<N−1} z_w^i φ = 0`, same two declarations cited | two owners | R06 |

- Earlier findings: R01 partly repaired (one of three cycles gone); R02 partly (the count of 5.1 only); R03, R04, R05, C01, C02, C03 not repaired; C04 not repaired; N02 of the previous review (citations in words) repaired; its N01 and N03 not.
- Source locators: 0 of 48 `[ShortProof]` pointers checked (source not readable, below); DKSS line 389 (Lemma 8, p. 9) read for the background entry of 1.4.
- Library declarations opened at the pins: Mathlib `ZLattice.covolume.tendsto_card_div_pow` (Algebra/Module/ZLattice/Covolume.lean:318), `NumberField.IsCMField` (NumberTheory/NumberField/CMField.lean:70), `NumberField.AdeleRing` (NumberTheory/NumberField/AdeleRing.lean:56), `IsDedekindDomain.FiniteAdeleRing` (RingTheory/DedekindDomain/FiniteAdeleRing.lean:95), `Matrix.unitaryGroup` (LinearAlgebra/UnitaryGroup.lean:105); no algebraic modular forms, Weil representation or theta kernel in either library.
- Cross-roadmap citations resolved: OneSidedPrimeSumBoundsAndAdmissibleData §§1.1, 2.1, 2.2, 3.1, 3.2, 3.3 (e), 3.4, 4.1, 5.3; ThetaLiftChainsAndTheSeesawIdentity §§1.1 (d), 1.4, 1.5 (d), 2.1, 2.2, 2.5, 2.6, 2.7, 2.8, 2.11, 2.12, 2.14, 2.15; DivisibilityOfThetaDerivatives §§3.1, 4.8, 4.11 (d): all exist with the stated subject. On main: ThetaLiftsForDefiniteUnitaryGroups §2.2, AutomorphicFormsOnReductiveGroups §§7.4–7.5, ArithmeticStatisticsPartIV §3.2, LocalGainOfThetaChains (scope).
- Elaboration: `lake env lean` on `Suggested.lean` gives no message; the file declares nothing, so there was no signature to compare and no one-tactic probe to run. Its docstring names the three headlines and the missing carriers.
- Dependency check, output: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)` (it does not test the edges among the siblings; R01).
- Automatic checks: two fail. The TeX-syntax hits are set aside (below); the changes outside the folder are R05.
- Overlap check: read LocalGainOfThetaChains (the only roadmap the closest-roadmap lists name; both vocabulary lists are empty): it owns the gain, the Hecke commutation and the colengths for the chain of RiemannHypothesisForDirichletLFunctions, written for other data; nothing is defined in both. Shared with a sibling: scalings and ramified source forms, owner ThetaLiftChainsAndTheSeesawIdentity §2.8 (R06). Ownership against other open pull requests was checked through the overlap index only.

Source independence: 0 passages compared with `[ShortProof]`, which could not be read; 1 lemma read in DKSS, which the README does not cite; largest share `[ShortProof]`, 48 of 48 locators; contents not compared. From the pointers alone the layers do not map one to one onto its directories: `Size/` is split between Layers 2 and 5, `Divisibility/` between Layers 2, 3 and 4.

Research link: the headlines 4.9, 5.4 and 5.7 are the inputs of Theorem A of an unpublished formal Lean proof of the Riemann hypothesis for Dirichlet L-functions (`[ShortProof]`; README Summary and family index). Stepanov's method (1.2), Schur algebras (1.5) and class numbers of hermitian genera (5.1) are named without a source. Rests on the README alone.

## Not verifiable

- Every `[ShortProof]` pointer, the fifteen sampled targets included: the sources service refuses the repository (its host is in no licence class), and no author is named for it, so I could not vouch for an author's page.
- The origins of 1.2, 1.5 and 5.1 ("adapted from the published theory of …"): no source is given.
- 1.4 (a), 1.9 (a), 1.10, 1.12 (a), 2.7 (a), 3.4, 4.6, 4.7 and the numerical sizes of 5.2 (a): beyond the consistency checks in the table these rest on steps of the unread source.

Automatic checks set aside as false positives: the hits for TeX-only syntax at lines 344 and 491 are inside inline code spans that continue onto the next line.

## Source issues

- none

## For the human reviewers

- Scope: the only source is an unpublished formal Lean proof in a GitHub repository (`[ShortProof]`), presented as a proof of GRH; 38 of 48 sections are labelled "particular to this proof", and I found no refereed source for the headlines.
- Licence: the family index says `[ShortProof]` is under Apache 2.0 and rewrites the proof that RiemannHypothesisForDirichletLFunctions follows; the sources service does not classify its host, so its text was not read.
- Not tested: `[ShortProof]`, the source of all 48 locators, could not be read; neither the wording nor the arrangement was compared with it.
- Second plan: Layers 2–4 plan, for other data, the stage LocalGainOfThetaChains on main plans (gain at inert primes, colength of a Hecke image, colength at the level prime).
- Umbrella: the pull request re-roots the umbrella GRH at this family and adds it to the top-level roadmap list (R05).
- Background: the family index defers 198 prerequisites to background roadmaps "still to come" (14 here, R02); whether the family may merge before they exist is a decision.
