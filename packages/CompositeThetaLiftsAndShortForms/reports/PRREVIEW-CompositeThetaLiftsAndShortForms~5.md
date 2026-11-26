# Review of CompositeThetaLiftsAndShortForms (pull request #3160 at 8e155d4)
Folder: `TauCetiRoadmap/ShortGRH/CompositeThetaLiftsAndShortForms/`
**Verdict:** needs changes

**Summary.** Changes are needed, but none of them is in a stated result: all fifteen sampled sections agree with the declarations of [ShortProof] they point at, all 230 pointers resolve, and every identity and size bound I recomputed holds. Four findings remain. Two are carried over (supply still runs both ways between this roadmap and OneSidedPrimeSumBoundsAndAdmissibleData, and six *Needs:* entries rest on a background that no roadmap provides, one of them stated on main). Two are new, found now that the source could be read: Layers 1, 4 and 5 follow the files of [ShortProof] one by one, and eight proof sketches follow its comments clause by clause. The false sentences of the previous review (the gloss on exceptional primes, the bound in the sketch of 5.5) and the double definition of scalings are repaired. There are four small corrections and three format notes. The human reviewers decide the scope, the licence of the source, and whether the two carried-over findings stand as the description says they have decided.

## R01 (P1) — This roadmap and OneSidedPrimeSumBoundsAndAdmissibleData still cite each other, so neither can be placed before the other in the merge order.

Partly repaired. The cycle with DivisibilityOfThetaDerivatives is gone (the local prime sums are now defined in OneSidedPrimeSumBoundsAndAdmissibleData §4.1 and 2.1 (b) cites them), and so is the one with ThetaLiftChainsAndTheSeesawIdentity §2.8 (2.9 now only cites the scalings). One remains. This roadmap takes §1.1, §§2.1–2.2, §§3.1–3.4 and §4.1 of OneSidedPrimeSumBoundsAndAdmissibleData on almost every *Needs:* line (for example 2.1, lines 610–612). In the other direction the *Needs:* lines of its §5.2, §5.3 and §5.4 take §§2.1, 2.4, 2.11, 4.9, 5.4, 5.5, 5.7 of this roadmap (its README, lines 858, 888, 916). The dependency check reports no problem only because the siblings are not in the merge order yet.

Nothing in this folder needs to change for the repair: the sections are acyclic, and the cycle ends when Layers 5 and 6 of OneSidedPrimeSumBoundsAndAdmissibleData (Theorems A and B and the main inequality) move to a roadmap that comes after this one. The description says the two-way supply is "as decided by the human reviewers"; the only such decision I could find on the pull request concerns the umbrella files, so I raise it again and leave it to them (last section).

## R02 (P1) — Six *Needs:* entries still point at "ShortGRH background", which no roadmap provides; the one of 3.5 is stated on main.

Reduced from fourteen: AutomorphicFormsOnReductiveGroups §§7.4–7.5, ThetaLiftsForDefiniteUnitaryGroups §1.2, HermitianFormsAndLattices §4.12 (a) and two Mathlib theorems are now cited, and I checked each (the derivation of `6N(fn)²` from §4.12 (a) at `q = 1` is right: `Tr⟨y, y⟩ ≤ 2fn²·rd_E²` gives `|σ(y_i)| ≤ √f·n·rd_E`, and `N ∈ 𝔇_E` gives `rd_E ≤ N`). An implementer of 1.4, 1.5, 1.8, 1.14, 3.5 or 5.6 still meets an input with no owner (lines 251, 290, 394, 568, 977, 1428).

- **3.5** (Hecke polynomials through a theta lift at a split place with unramified characters and the vacuum datum). ThetaLiftsForDefiniteUnitaryGroups §2.2 on main states this: a homomorphism `ξ_w` with `θ_φ(F)⋆T = θ_φ(F⋆ξ_w(T))` for the lattice vector, its Satake form, and the remark that it "reads as a relation between their Hecke polynomials". The Scope section here says so and then declines to cite it because [ShortProof] proves the case directly (lines 1489–1493). How a source proves a statement does not decide who owns it; the lifts of this family are already defined through §1.2 of that roadmap. Cite §2.2 on the *Needs:* line of 3.5, and keep the displayed identity as the form in which 3.5 uses it.
- **1.8, 1.14** (Hermite and Smith forms over a valuation domain). Tau Ceti has the discrete case, `Matrix.exists_smith_normal_form_of_isDiscreteValuationRing` (TauCeti/LinearAlgebra/Matrix/SmithNormalForm/Basic.lean, line 39), and Mathlib the case of a principal ideal domain; `𝒪_ι` is not discrete, so the general case is a target of its own. State it here as a numbered section before 1.8.
- **1.4** (the Nullstellensatz with multiplicities and costs), **1.5** (adjointness of substitution by `A` and `Aᵀ` for the pairing `f(∂)g(0)`), **5.6** (evaluation vectors span a Weyl module over `ℂ`): I found no owner on main or in the pinned libraries. Each is two or three lines; state each as a lettered item of the section that uses it.

The description says the background results "go to separate roadmap pull requests" by decision of the human reviewers. Until those roadmaps exist these six inputs are unowned, and the first of them needs only a citation.

## R03 (P2) — Layers 1, 4 and 5 follow the files of [ShortProof] one by one, in its order, and six section titles are its file titles.

A roadmap's layers are what its targets need, not a source's arrangement, and the description itself lists this as not done. With the contents list of [ShortProof] (`CONTENTS.md`, lines 123–153) beside the README:

- Layer 1 ↔ folder `ElementaryDivisors`: 1.1 ↔ TwistingData; 1.2–1.3 ↔ RootLemma; 1.4 ↔ Depth; 1.5–1.6 ↔ InvariantAverage; 1.7–1.8 ↔ Edges; 1.9 ↔ FrobeniusFactors; 1.10 ↔ AveragingMap; 1.11 ↔ PieriCone; 1.12 ↔ DefectCount; 1.13–1.14 ↔ ElementaryDivisorTheorem. The order is the source's, with Depth moved up two places.
- Layer 4 ↔ the last files of `Divisibility`, in order: 4.1 ↔ HeckeEdges; 4.2–4.3 ↔ MarkOperator; 4.4–4.5 ↔ SetupAtLevel; 4.6 ↔ ValuationAtLevel; 4.7 ↔ ColengthAtLevel; 4.8–4.9 ↔ LocalDivisibility.
- Layer 5 ↔ folder `Size`: 5.1 ↔ ClassCount; 5.2 ↔ Estimates; 5.3–5.5 ↔ ArchimedeanSize; 5.6–5.7 ↔ ShortColumns.
- The titles of 1.4, 1.12 and 1.14 are the titles of their files word for word, and those of 1.6, 5.1 and 5.5 nearly.

Layers 2 and 3 are the roadmap's own (their sections draw on five and on four files of two folders). The *Needs:* lines force `1.1 < 1.3 < 1.8 < 1.10 < 1.13 < 1.14` and `4.4 < 4.5 < 4.6, 4.7 < 4.8 < 4.9`; they do not force one section per file.

A reorganisation that the targets support: (i) split Layer 1 by what 1.14 needs — the tools that do not involve a Frobenius cycle (1.2, 1.5, 1.6, 1.11), each with its published antecedent (Bombieri 1973, p. 235, for the count of zeros with multiplicity; Benson–Doty 2009, Corollary 4.4, for the span of the points in the Schur algebra; Dvir–Kopparty–Saraf–Sudan, arXiv:0901.2529v2, Lemma 8, for the count behind 1.4); depth and defect on a cycle (1.1, 1.3, 1.4, 1.9, 1.12); edges and the theorem (1.7, 1.8, 1.10, 1.13, 1.14). (ii) Separate in Layer 5 the two statements about any CM field (5.1 and 5.6, with Borel 1963, Theorem 5.1, and HermitianFormsAndLattices §4.12) from the sizes on the data (5.2–5.5, 5.7, with 2.9 and 2.11, which only 5.7 and Theorem A use). (iii) Join 4.4–4.7 as one treatment of the level prime and place 4.1–4.3 with 2.4–2.8, the marked sets they serve. The sections the siblings cite by number (§§2.1, 2.2, 2.4, 2.11, 4.9, 5.2, 5.4–5.7) change number with it, and their citations with them.

## R04 (P2) — Eight proof sketches follow the comments and module docstrings of [ShortProof] clause by clause.

A roadmap is published under the project's licence and states the mathematics in its own words; the description reports that such sketches were rewritten in two other members after a review found them. Here (shared runs counted in words, symbols aside; about half of the word triples of the first passage are the source's):

| README | [ShortProof] | longest shared run |
|---|---|---|
| Method of 4.1, lines 1049–1053 (all four steps, in order) | `New/UpperBound/Divisibility/HeckeEdges.lean`, lines 12–20 | 14 and 12 words |
| Method of 4.6, lines 1172–1176 | `New/UpperBound/Divisibility/ValuationAtLevel.lean`, lines 9–13 | 10 words, every clause |
| Method of 2.3, lines 642–644 | `New/UpperBound/Size/Estimates.lean`, lines 345–347 | 11 words, every clause |
| Method of 5.1, lines 1271–1274 | `New/UpperBound/Size/ClassCount.lean`, lines 7–10 | 13 words |
| Method of 5.2, first clause, lines 1303–1304 | `New/UpperBound/Size/Estimates.lean`, lines 252–253 | 11 words |
| Method of 5.5, first clause, lines 1379–1380 | `New/UpperBound/Size/ArchimedeanSize.lean`, lines 24–25 | 18 words |
| Method of 5.6, first clause, line 1407 | `New/UpperBound/Size/ShortColumns.lean`, line 375 | 16 words |
| Method of 1.4, last sentence, lines 242–243 | `New/UpperBound/ElementaryDivisors/Depth.lean`, lines 760–762 | 11 words |

The statements themselves, and the definitions of 4.4 (b) and 4.6 (a), share long runs too, but there the mathematics leaves little choice. Replacements, each saying the same mathematics:

- 4.1: "Fix representatives of the classes of the level. As the stabilisers are trivial, a right coset of the double coset at `𝔩` is recovered from the class it leads to and the change of basis there; this makes the cosets the edges of 1.7 (e). Read through the embeddings at the a-places over `𝔩` and `𝔩̄`, the matrix of an edge is `ρ_n` of its two changes of basis around `diag(p^{depth})`, and the rest of the Weyl module contributes the integral factor `θ`. By AutomorphicFormsOnReductiveGroups §7.5, `𝓜_ι` is the lattice of `𝒪_ι`-valued functions on classes and basis vectors, so `Y_𝔩` is the operator `A` of 1.7 (f)."
- 4.6: "By ThetaLiftChainsAndTheSeesawIdentity §2.11 and §2.13 a double lift with glued datum, applied to a ramified form, is a character value times two direct lifts applied after `Up`. Over the `m/2` double lifts and the `f` places of `Σ_N` these values, each of `N`-adic size at most `N^{2b}` (§2.14), multiply to the constant of (a). Then (b) bounds each of the `m` direct lifts between the base points `δ_j`, and 3.1 (c) with 3.2 (b) returns to the base point `1`."
- 2.3: "Attach to each `p` with `err₀(p) ≠ 0` an integer `c ∈ [1, x₁]`: `c = p`; or `c = (p ∓ 1)/m` if `p ≡ ±1 (mod m)`; or `c = 1` if `p = N`. At most four primes share a value of `c`, and `err₀(p)·log p ≤ T/c` with `T = 4fa(log b)²·log x₁` (at `p = mc ± 1` the factor `m` is absorbed by `m/p ≤ 2/c`; at `N` by `log N ≤ 30m·log b` and `m² ≤ 4x`). So the sum is at most `4T(1 + log x₁)`, which is at most `u_E` because `(log x₁)⁶ ≤ log b`."
- 5.1: "Send a class to the pair `(G, GX)`: `G` is the Gram matrix of `n` short independent vectors `Y` of its lattice (HermitianFormsAndLattices §4.12 (a)), and `X` a matrix over `E` congruent, modulo the integral adeles, to the inverse of the adelic matrix that writes `Y` in a basis of the lattice. The pair determines the class, and its entries are integers of `E` whose conjugates are at most `c³`; (a) counts such pairs."
- 5.2, first clause: "The classes of `K ∩ K°` map onto those of `K` and onto those of `K°`, with at most `[K° : K ∩ K°]` over each class of `K°`; 5.1 (b) with `N = q₁d` bounds the classes of `K°`."
- 5.5, first clause: "By the equivariance of the lower chain for `𝖦` (ThetaLiftChainsAndTheSeesawIdentity §2.15), applying `#𝖦·e₀·s` before the chain equals summing after it, over `t ∈ 𝖦`, the right translates by `γ_ϑ(ts)` with the weights `#𝖦·e₀(t)`."
- 5.6, first clause: "By AutomorphicFormsOnReductiveGroups §7.5 a form of a level with trivial stabilisers is given by arbitrary values at representatives of the classes, so it is enough to span, class by class, the forms supported on one class (the delta forms of (b))."
- 1.4, last sentence: "Summing over `δ`, a monomial of weighted degree `t` can be the costly monomial for at most `⌊t⌋` values of `δ`, so the sum of the dimensions is at most the sum of the weighted degrees of all monomials: `#Exp` times their mean, which is at most `c_div`."

I checked the constant of 2.3 before proposing it: `2·loss(p)·log p ≤ 2fa(log b)²·log x₁/p`, times `m ≤ 2p/c` at `p = mc ± 1`, and `2mfb·log N ≤ 60m²fb·log b ≤ 240fa·log b`.

## C01 — Three sentences still say that this roadmap defines or owns the local prime sums, which 2.1 (b) now takes from OneSidedPrimeSumBoundsAndAdmissibleData §4.1.

The guide to the layers says "Layer 2 defines, on the data, the local prime sums, the gain, …" (lines 39–40), the title of 2.1 begins "Definitions: local prime sums", and "Owned here" lists "The local prime sums, the gain, the loss, …" (line 1473). A reader cannot tell which roadmap the declaration belongs to. What is owned here is the grouping of the prime sums by primes (2.2): say that in the three places, and add the local prime sums to the line for OneSidedPrimeSumBoundsAndAdmissibleData under "Not owned here".

## C02 — Two statements of the description do not hold at this head.

"`ShortGRH background (…)`, 169 entries at this commit": the eleven READMEs contain 180 occurrences of `ShortGRH background (` at this head (6 of them here), and the later paragraphs of the description give 152 and then six fewer. And "Where a section of an existing roadmap … gives what the route uses, it is cited and not restated" is not so for 3.5, as the README's own Scope section explains (R02). Give the count at the head, and say that one statement of main is kept as background by choice.

## C03 — The four published works are cited without a locator.

The Origin lines of 1.2, 1.5 and 5.1 name Bombieri (1973), Green (1980), Benson and Doty (2009) and Borel (1963), and the References give no theorem or page, so a reader cannot find what was adapted. I read three of them: Bombieri, Séminaire Bourbaki 430, p. 235 (a function vanishing to order at least `m` at the rational points); Benson–Doty, arXiv:0805.1235v2, Theorem 4.3 and Corollary 4.4 (over a field with more than `r` elements the group algebra maps onto the Schur algebra of degree `r`; the README's "degrees below the size of the field" is right); Borel, Publ. Math. IHES 16, §5, Theorem 5.1 (the number of double cosets is finite). Add these locators, and one for Green.

## C04 — The table of symbols gives `t_x(j)` with a citation of ThetaLiftChainsAndTheSeesawIdentity §2.12, where that datum is written `v_j(x)`.

The previous review's remark on symbols is otherwise repaired: the table now gives the supplier's symbol beside `𝒮`, `Θ_j^ϑ`, `B_ϑ^Ψ`, `F(p)` and uses `𝖦` and `Θ_ϑ`. Add "(there `v_j(x)`)" to this row as well.

## N01 — `N` is the level prime, but 5.1 (b) and 5.6 (c) use it for an integer in the different, and the sketch of 5.7 then sets `N = q₁d`.

Layer 1 now says that its letters are its own; a different letter in 5.1 and 5.6 (say `𝔡`) would spare the reader the same doubt in Layer 5.

## N02 — `Suggested.lean` states nothing; 1.2 and 1.14 use only local rings, polynomials and matrices and can be stated against Mathlib.

The docstring's reason (Layer 1 is a step, not a headline) is the author's choice, and the three headlines do lack their carriers at the pins. If a test is wanted, Stepanov's count is a few lines, and 1.14 needs the definitions of 1.1 and 1.7.

## N03 — The README has no Checks; three would each separate the stated object from a plausible wrong one.

Offered: (i) at `p = d` the order `o₀` is `2` (`−d ≡ 1 + q₀/2`, whose square is `1` modulo `q₀`), so `d` is small non-split but never exceptional and has no collision. (ii) `γ_p = p/(p² − 1)` at an inert prime and `1/(2d − 2)` at `d`. (iii) In 1.7 (c) the constant is forced: 1.5 (a) with `f = eN` gives `p^{keN}` per letter, the factor `p^{(k−1)keN}` raises it to `p^{c₀}`, and `N` letters give `p^{N c₀}`.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 definitions (sampled) | weight of `u_s` at `s = i`; `N = 1`; `P = 5, N = 2` | `P^N/(q−1) = 1 + 1/(q−1)`, the source's "plus 1"; no cycle with one letter; weights `25/24, 5/24, −1/24, −5/24` | agrees with `FrobeniusCycle`, `defectWeight`, `translatesIn` | none |
| 1.5 (sampled) | `p = 2, f = 2`, `γ = (1,1), (2,1)`; span in two variables | multinomials 2, 3; `η = 16/2 = 8`, `16/3`; span dimension `min(n+1, q+1−e)`: `n+1` at `q = n+e` | holds; agrees with source; Benson–Doty Cor. 4.4 needs `|k| > r` | C03 |
| 1.6 (sampled) | no bad monomial; all monomials bad; `I = p^{k²f}·ev₁` with bad monomials | `p^{k²f}·ev₁` works; `I = 0` works since `ψ(1) ∈ J`; `ev₁(X_{ii}ⁿ) = 1 ≠ 0` breaks (b) | holds; (b) excludes the wrong model | none |
| 1.7 (sampled) | constant of the pairing | per letter `p^{keN}·p^{(k−1)keN} = p^{c₀}`; `N` letters: `p^{N c₀}`, `c₀ = k²eN` | agrees with `IsEdgePairing`, `multinomialExponent` | N03 |
| 1.8 (sampled) | `j = c`; `k = 1` | defect `> 3c* = 9kc ≥ 3c` gives `w^c`; hypothesis `n < q = p^{eN}` is the degree bound of 1.5 (a) | holds; agrees with source | none |
| 1.9 (sampled) | `|Δ − (1 − 1/q)Δ|`; `k = 2, c = 1`; `c = 0` | `|Δ|/q ≤ 2n/q ≤ 1`; `2c + 2 = 4 ≤ 6 = 3kc`; `c = 0` vacuous | holds; agrees with source | none |
| 1.10 (sampled) | degree bound for 1.6 | `D + k < (Nk(ℓ+2)n + 1)P^ℓ ≤ P^{2ℓ} = q = p^{eN}` | holds; agrees with source | none |
| 1.12 (sampled) | `θ = 1`; `k = 2, a′ = 1` | `exp(θ/2) = 1.649 ≤ 2`; share `(q−1)/(q²−1) = 1/(q+1)`, index of the parahoric `q+1` | holds; agrees with source | none |
| 2.2 (sampled) | inert odd, even `e`; `p = d`; split; `p ∣ q₁`; `p^e ≥ x₁` | `(1−χ)/2 = 1, 0, 1/2, 0, 0`; `y/p^e ≤ a/x₁ ≤ κ` | holds; agrees with source | C01 |
| 2.3 | `p = N`; `p = mc ± 1`; generic `p` | `2mfb·log N ≤ 240fa·log b`; `m/p ≤ 2/c`; total `≤ 16fa(log b)²·log x₁(1+log x₁) ≤ u_E` | holds | R04 (wording) |
| 2.4 (sampled) | `Σ_{𝔩∈Λ} A_𝔩` | `a·#(Φ_a ∩ Φ(Λ)) ≤ a·f/φ(q₀) ≤ af` | agrees with `IsMarked`, `IsFullMark`, `heckeScalingExponent` | none |
| 2.5 (sampled) | `p ∣ q₁`; `p ≡ 3 (mod 8)`, `m = 8`; `p = d` | inert primes do not divide `q₁d`; `v₂(p²−1) = 3 ≤ μ` so `m ∣ o`; `o₀(d) = 2`, not exceptional | holds; agrees with `HasExceptionalOrbits` | N03 |
| 2.11 | `ℂ[ℤ/(N−1)]`; size of `N` | kernel of the norm element = image of `1 − z`; `f/(N−1) ≤ x^{12}/b^{100} ≤ b^{−8}` | holds | none |
| 3.5 (sampled) | exponent of `z^{(t+1)i}N𝔩^{C(i,2)}`; `ν_p` | `h·i(t+i) ≤ 2h𝔯t ≤ f𝔯t`; `(j+1)f𝔯t ≤ 𝔯f·n_m ≤ ν_p` since `mt ≤ n_m` | holds; agrees with source | R02 |
| 3.6 (sampled) | `L = Λ` in (a) | `Σ(ν_p − A_𝔩) + ΣA_𝔩 + λ_j = #Λ·ν_p + λ_j`, the exponent of (b) | holds; agrees with source | none |
| 3.7 (b)–(e) | sum over `m` lifts; `j_p`; full mark | `gain − m·coll − fa(log b)²/p`; `m·coll ≤ 2mfa/p ≤ j_p`; `a/x₁` terms cancel, `gain − 2·loss` | holds | none |
| 4.2 (e), (f), 4.3 | `P^{−2𝔯} + 𝔯²/(kP)`; `n⁴ ≤ q`; 2.8 (b) | `≤ 1/(mp) + 1/(mp)`; `13^m ≥ (xb)⁴` as `√x ≥ (log b)^{50}`; `12af/p + j_p/m ≤ loss` | holds | none |
| 4.6, 4.7 | exponents at `N` | `N^{mfb}·(N^{fb})^m = N^{2mfb}`; `ℓ(m/2+1) ≤ D_X·fa(m/2+1)/k ≤ mfb·D_X` as `k ≥ x⁵/e²` | holds | R04 (wording) |
| 4.8 (sampled) | four cases | `l = 0`, gain 0; `l = 0`, `m·coll ≤ loss`; `l ≤ loss·D_X`, `gain − 2loss`; `l ≤ mfb·D_X`, `−2mfb` | holds; agrees with source | none |
| 4.9 headline (sampled) | (b) at composite `p`; (d) intersection | `err₀ = 0` off the primes; intersecting with `𝓜_ι ∩ 𝒮^ram` keeps the colength | holds; agrees with `exists_err_gaugeLe_compositeLift` | none |
| 5.1 | `r = 0`; mixed-norm packing; (b) | `1 ≤ 1`; ratio of balls `((r+½)/½)^{2#ι f′}`; `#ι = 2n²` gives `(1+2c³)^{4fn²}`; `√f·n·rd_E ≤ 6N(fn)²` | holds | R04 (wording) |
| 5.3 (c) | definitions of `h_main`, `rem` in the supplier §4.1 | both sides `m·#Φ_a·s_main + mk·Σ_τ s_∞(κ(τ))` | exact | none |
| 5.4 headline | exponent of (b) | `cs − #Φ_a·a·log N + u_E/2 + 2mx^{50} + 2mx^{30} + 2x^{60} + x^{70} + fm(Δ/2)·log N ≤ β` | holds | none |
| 5.5 sketch | `t = 1`; any `t` | `#𝖦·e₀(1) = Σ_good Πχ(1)² ≤ #𝖦`; `|σ(e₀(t))| ≤ Σχ(1)²/#𝖦 ≤ 1`; norm² `≤ #𝖦⁴·exp(B)` | sketch now true | R04 (wording) |
| 5.7 headline | `g = z_w`; exponent of 5.6 (c) | `z_w ∈ K°`, not in `K₀`; `(√B+√B)² = 4B`, `4^f·exp(u_E)/4^f`; `12fa·log(6q₁d f²k²) ≤ u_E − f·log 4` | holds | none |
| Summary gloss on exceptional primes | `e = o₀` odd; `p ≡ −1 (q₀)` and `(m)` | `(−p)^{o₀} = −p^{o₀} ≡ 1`, an a-place; second case not exceptional, paid by the `m`-fold loss | gloss now true | none |
| Layers against `CONTENTS.md` | sections against files | Layers 1, 4, 5: one file per one or two sections, in order; Layers 2, 3: regrouped | follows the source | R03 |

- Earlier findings: R01 partly repaired (one of two cycles left); R02 partly (6 of 14 entries left); R03, R04, R06 repaired; R05 not raised again (below, for the human reviewers); C01 partly (C04 here); C02, C03 repaired; C04 partly (C02 here); N01 partly (N01 here); N02 repaired but for locators (C03); N03, N04 stand as offers.
- Source locators: 230 of 230 `[ShortProof]` pointers resolve to a declaration of that name in the named file; the statements of the fifteen sampled sections read against it; three published works read at their locators (C03).
- Library declarations opened at the pins: Mathlib `Matrix.card_GL_field` (LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean:122), `BoxIntegral.unitPartition.tendsto_card_div_pow_atTop_volume` (Analysis/BoxIntegral/UnitPartition.lean), `Submodule.exists_smith_normal_form_of_le` (LinearAlgebra/FreeModule/PID.lean:462), `NumberField.IsCMField` (NumberTheory/NumberField/CMField.lean:70), `Matrix.unitaryGroup` (LinearAlgebra/UnitaryGroup.lean:105); Tau Ceti `Matrix.exists_smith_normal_form_of_isDiscreteValuationRing` (LinearAlgebra/Matrix/SmithNormalForm/Basic.lean:39). No algebraic modular forms, Weil representation or theta kernel in either library.
- Cross-roadmap citations resolved: OneSidedPrimeSumBoundsAndAdmissibleData §§1.1, 2.1, 2.2, 3.1–3.4, 4.1, 5.3; ThetaLiftChainsAndTheSeesawIdentity §§1.1, 1.4, 1.5, 2.1, 2.2, 2.5–2.8, 2.11–2.15 and Conventions (`K°`); DivisibilityOfThetaDerivatives §§2.1, 3.1, 4.8, 4.11. On main: AutomorphicFormsOnReductiveGroups §§7.4, 7.5; ThetaLiftsForDefiniteUnitaryGroups §§1.2, 2.2; HermitianFormsAndLattices §4.12; LocalGainOfThetaChains §§4.12–4.16c. All exist with the stated subject.
- Elaboration: `lake env lean` on `Suggested.lean` gives no message. The file declares nothing, so there was no signature to compare and no one-tactic probe to run; its docstring names the three headlines and the missing carriers.
- Dependency check, output: `depcheck: 122 roadmaps, 1386 edges, 0 problem(s)` (it does not test the edges among the siblings; R01).
- Automatic checks: two fail. The hits for TeX-only syntax are set aside (below); the changes outside the folder are with the human reviewers.
- Overlap check: read LocalGainOfThetaChains (the only roadmap the closest-roadmap lists name): its §§4.14h, 4.15c bound the Hecke image for the chain of ThetaChainsOnDefiniteUnitaryGroups through depth bounds at an edge, for other data; no object is defined in both. Shared with siblings: the local prime sums, owner OneSidedPrimeSumBoundsAndAdmissibleData §4.1 (C01); scalings and ramified source forms, owner ThetaLiftChainsAndTheSeesawIdentity §2.8. Ownership against the other open pull requests was checked through the overlap index only.

Source independence: 25 passages compared with 1 source ([ShortProof]: the 15 sampled statements, 10 sketches side by side), every paragraph scanned for shared runs, and 3 Origin lines against Bombieri, Benson–Doty and Borel; eight sketches share wording with [ShortProof] (R04). Largest share: [ShortProof], 47 of 47 section pointers (the four published works have no locator). Contents compared with its `CONTENTS.md`: Layers 1, 4 and 5 follow it (R03).

Research link: the headlines 4.9, 5.4 and 5.7 are the inputs of Theorem A of an unpublished formal Lean proof of the Riemann hypothesis for Dirichlet L-functions ([ShortProof]). 1.2 adapts Stepanov's method (Bombieri 1973), 1.5 the Schur algebra (Green 1980; Benson–Doty 2009), 5.1 Borel's finiteness (1963). Rests on the README and on the three works read.

## Not verifiable

- Green, *Polynomial representations of `GL_n`* (1980): behind a paywall, not read; the Origin of 1.5 rests on Benson–Doty alone.
- The proofs behind 1.4 (a), 1.9 (a), 1.10, 1.12 (a), 2.7 (a), 3.4, 4.6 and 4.7: I compared the statements with the declarations of [ShortProof] and checked the arithmetic that joins them, not the proofs.
- The background entry of 3.5 against ThetaLiftsForDefiniteUnitaryGroups §2.2: same hypotheses and the same shape (a product of linear factors times the source polynomial at a rescaled variable); I did not match the normalisations of `α`, `β` and `c_w` term by term.

Automatic checks set aside as false positives: the two places flagged for TeX-only syntax (the display of 1.7 (f), line 355, and the bound of 1.12 (a), line 506) are inside inline code spans that continue onto the next line.

## Source issues

- none

## For the human reviewers

- Scope: the only source of the 47 sections is [ShortProof], an unpublished formal Lean proof presented as a proof of GRH; 38 sections are labelled "particular to this proof", and no refereed source states the headlines.
- Licence: [ShortProof] is Apache 2.0, "Copyright 2026 Anthropic, PBC" (its `NOTICE`). Three layers follow its files (R03) and eight sketches its comments (R04); whether adapting that text with attribution is acceptable is yours to decide.
- Umbrella: the pull request rewrites `umbrellas/GRH.toml`, `umbrellas/GRH-targets.md` and a line of the top-level `README.md`. A comment on the pull request of 2026-11-26, written on a maintainer's instruction, says these belong in it; I did not raise them.
- Two-way supply and background (R01, R02): the description says both are left as the human reviewers decided. I found that decision recorded for the umbrella only, so both are raised; if it covers them, they are settled.
- Second plan: Layers 1–4 treat, for other data, the stage that LocalGainOfThetaChains §§4.12–4.16c on main plans; the README says neither is deduced from the other.
