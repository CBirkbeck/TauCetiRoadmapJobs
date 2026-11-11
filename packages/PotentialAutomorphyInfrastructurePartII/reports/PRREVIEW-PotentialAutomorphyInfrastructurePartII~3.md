# Review of PotentialAutomorphyInfrastructurePartII (pull request #2135 at 4777c48)

**Verdict:** needs changes

Incremental re-review of the 38 lines of `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md` changed since `3924a02`. `Suggested.lean` is unchanged. One finding: the repair of the previous R03 introduced a step in the route of §10.5 that the hypotheses and the declared gap do not support.

## R01 (P2) — §10.5: the route enlarges the coefficient field and still calls the local rings domains

**Location.** `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md` line 2183 (§10.5, Route), added at this head: "enlarge the coefficient field to contain the `p^{v_p(Nw − 1)}`-th roots of unity", followed by the unchanged "Over `L`, take the polarized problem with these domains above `p`".

**Claim.** After the coefficient field is enlarged, the potentially crystalline lifting rings above `p` are still domains, so the domain corollary of §4.8 applies.

**Witness.** Hypothesis (ii) is `P_{λ^s+η,e}`-genericity with `e` the ramification index of `O` (line 2172), and the polynomial depends on `e` (LLHLM23 lines 5001–5002 and 5078–5079). For `E = ℚ_p` and a place with `p ∥ Nw − 1`: `E′ = ℚ_p(ζ_p)` has `e′ = p − 1 ≠ 1`. Neither (ii) nor `gap:generic-tame-pcris-domain` (line 213) gives a domain over `O′`.

**Repair.** Keep the enlargement and use the component form of §4.8 instead of its domain corollary. Replace the clause by:

> and replace `E` by `E′ = E(ζ_{p^M})`, `M` the largest `v_p(Nw − 1)`, with ring `O′`. Genericity is for the ramification index `e` of `O`, so the rings over `O′` are not claimed to be domains. The lifting ring over `O′` is `R ⊗_O O′` with `R` the domain over `O`; `E′/E` is Galois, so `Gal(E′/E)` permutes the minimal primes of `R[1/p] ⊗_E E′` transitively, and the prime of the `E`-point `r|G_{L_w}` is Galois-stable, so that point lies on every irreducible component. The component hypothesis of §4.8 then holds for every `f′`.

and change "with these domains above `p`" to "with these rings above `p`". Tested on the witness: for `E = ℚ_p`, `E′ = ℚ_p(ζ_p)`, the components of `Spec R[1/p] ⊗ E′` form one orbit of `(ℤ/p)^×`; a `ℚ_p`-point on one component `C` lies on `σC` for every `σ`, so on all of them, and no genericity for `e′ = p − 1` is used. The transitivity is the standard one for `B = A ⊗_E E′` with `B^G = A`: `B` is free over the domain `A`, so every minimal prime of `B` lies over `(0)`, and `G` acts transitively on the primes over a given prime of `A`. Add the instance as a Check of §10.5 ("for `E = ℚ_p` the enlarged ring has `e′ = p^{M−1}(p − 1)`; the domain statement is used only over `O`").

## Previous findings

- R01 — repaired: line 2106–2107 "(D0) `ℓ > (b_ξ − a_ξ) + 2`; (D1) `ℓ > 2(N + 1)`", as LTXZZ lines 1371 and 1445–1446; the new Check computes `(b_ξ − a_ξ) + 2 = 11` and excludes `ℓ = 11`.
- R02 — repaired, by option (a): lines 32, 59 and 324 give the route to ModularityAndLanglandsExtensions §4.2; §2.2(3) and §7.7 cite it and say what they add; §8.5 proves only that every minimal prime is potentially pro-automorphic.
- R03 — partly repaired: §4.8 (line 1168) now has "if `l^N ∥ Nv − 1`, `l^N > n` and `O` containing the `l^N`-th roots of unity (§4.6(ii))" with the Check `l = 5`, `n = 6`, `Nv = 11`; the §10.5 route repair introduced R01 above.
- R04 — repaired: line 1898 "NT21, Proposition 5.8, pp. 73–74, proof pp. 74–75", as NT21 lines 3580 (p. 73), 3619, 3627 (p. 74), 3677 (p. 75).

## Verified sound

**Gate, order, Lean.** I ran the gate at `4777c48`: every counter is 0 and it ends `OK`; the worker's own run, with the targeted build, also passes. Nothing outside the folder changes (the diff against `origin/main` outside the folder is empty). The dependency check prints

    depcheck: 235 roadmaps, 2133 edges, 0 problem(s)

with no UPWARD, CYCLE or moved line. `lake env lean` on `Suggested.lean`: exit 0, no message. The file is unchanged since `3924a02`: it declares nothing, so the one-tactic probe and the `#check @name` comparison have nothing to run on, as recorded in the previous report.

**Changed passages (10), each read in full with what cites it.**

- Scope lines 27 and 32, the ownership bullet at line 59 and the contract at line 324: they agree with each other, with the description's ownership paragraph and with ModularityAndLanglandsExtensions §4.2 at the head of its open pull request, which states ANT20 Theorem 6.1 with `ℓ > 3`, `ℓ ∤ n` and says it owns the `µ₂^d`-action on the Schur ring, the invariant pseudodeformation subring, étaleness on the irreducible locus, the reducible-locus bound at `v₀` and connectedness of the finite ordinary ring (locators "Thm. 5.1 pp.15–17; Thm. 6.1 pp.17–19").
- §2.2(3) and §7.7: the statements are unchanged; each has one added sentence naming the owner and the added generality.
- §8.5: the `O`-valued conclusion, the last sentence of the route and the suppliers §§0.9, 3.5, 3.12 are removed together. I checked the two consumers. §8.6 (line 1765) needs only the minimal-prime statement ("no `O`-valued lift is needed"). §8.8 (line 1799) takes the minimal prime from §8.5 and carries its own `O`-point step, with §§0.9, 3.5, 3.12 in its own `*Needs:*` line; it does not rely on the removed conclusion. §§8.7 and 8.16 reach §8.5 through §8.6.
- Layer 8 introduction (line 1675): consistent with §8.5 and §8.15.
- §4.8: the added hypothesis is §4.6(ii) (line 1140) word for word in content, and the route now says where it is used.
- §10.2: (D0), (D1) and the new Check.
- §10.5: the added sentence, apart from the clause of R01. The splitting in `L/L⁺` of the places concerned, which §4.6 asks of its set `T`, follows from the prescription: a local field containing the field cut out by `r̄|G_{F_v}` contains `F_v`.
- §8.15: the locator.

**Seeded sample.** None of the 15 sampled targets lies in a changed passage. Of those that depend on one, §8.7 and §8.8 use §8.5 (checked above), and §8.12 uses §7.7, whose statement is unchanged. The other rows stand as in the previous report (15 of 15 read at their locators there).

**Adversarial pass.** Rows for the changed statements, with computed values:

| Statement | Instance | Values computed on each side | Result |
|---|---|---|---|
| §10.2 (D0) | `N = 2`, `ξ_τ = (0, 4)`, `ξ_{τc} = (−4, 0)` | `a_ξ = −4`, `b_ξ = 4 + 1 = 5`, bound `11`; strict form excludes `ℓ = 11`, admits `13`; LTXZZ line 1445 strict | holds |
| §10.2 (D1) | `N = 2`; odd `ℓ` | `2(N + 1) = 6`; `ℓ > 6` and `ℓ ≥ 6` both start at `7` | holds; Check correct |
| §4.8 hypothesis at `R` | `l = 5`, `n = 6`, `Nv = 11`; `Nv = 251` | `5 ∥ 10`, `5 < 6`, `\|k^×(5)\| = 5 < 6` characters: excluded; `250 = 2·5³`, `125 > 6`: allowed (`251` is prime) | holds; Check correct |
| §4.8 against §4.6(ii) | `l = 3`, `n = 2`, `Nv = 4` | `3 ∥ 3`, `3 > 2`; two distinct characters of a group of order `3` exist | consistent |
| §10.5 route, valuation | `p = 5`, `q = 11`, `a = 1`, `k = 1` | `11⁵ − 1 = 161050 = 2·5²·3221`, so `v₅ = 2 = k + 1`; in general `v_p(q^{ap^k} − 1) = v_p(q^a − 1) + k` for odd `p` | holds |
| §10.5 route, `p` odd | `p = 2` | (v) asks `ζ_p ∉ F̄^{ker ad r̄}`; `ζ₂ = −1 ∈ F`, so (v) fails | `p` odd is forced by (v) |
| §10.5 route, coefficients | `E = ℚ_p`, `p ∥ Nw − 1` | `e = 1`, `e′ = p − 1`; polynomial indexed by `e` | R01 |
| §8.5 | `n = 2`, `\|R\| = 1` | bounds `d₀, d_l > 2·3 + 3 = 9`; `nD − 2 − 2 − 1 − 4 = nD − 9`, and `nD − 9 > nD − d₀` iff `d₀ > 9` | consistent with the route and the first Check |
| §8.5 against §8.8 | counts | `1 + nD − (6 + rn(n + 1)) = nD − rn(n + 1) − 5 < nD − rn(n + 1) − 3` | consistent |
| §7.7 | `n = 2`, `n₁ = n₂ = 1`, `S(B) = {v₀}`; `S(B) = ∅` | one relation `χ₁(Frob) = χ₂(Frob)`, `d₀ ≤ 1`, bound `2[F⁺ : ℚ] − d₀`; `d₀ = 0` gives `n[F⁺ : ℚ]` | holds; the single-place form is the special case |
| §2.2(3) | `d = 1` | `µ₂` acts trivially, `P_𝒮 = R^univ_𝒮`, agreeing with §2.2(2) | holds |
| §8.15 locator | NT21 | statement p. 73, hypotheses p. 74, proof to p. 75 | holds |

The rows of the previous report for the untouched statements (§§1.5, 2.1, 3.1, 3.8, 4.2, 4.5, 4.6(ii), 5.1, 5.6, 5.7, 6.1, 7.4, 7.6, 7.19, 8.2, 9.7, 10.1, 10.3, 10.4) are carried forward from the review at `3924a02`, where each is recorded with its values.

**Sources opened this round (5).** LTXZZ lines 1368–1371 and 1444–1452; NT21 lines 3532–3682; LLHLM23 lines 4998–5026, 5074–5088 and 6233–6253; LLHLM20 lines 5170–5220; ModularityAndLanglandsExtensions §4.2 at its open head.

**Library declarations.** None is touched by the change; the 16 opened at the pins in the previous report stand.

**Declared gaps and overlaps.** No gap text changed. `overlaps.md` lists no dropped id and no other pull request changing this folder. Ownership against ModularityAndLanglandsExtensions, the only open roadmap the change concerns, is settled as above; ownership against the other open pull requests was not checked again this round.

**Description.** The ownership paragraph matches the head: it names option (a), the three kept statements and what each adds. Remark, no change asked: the generated `depends-on` and `merge-order` blocks do not list the pull requests of ModularityAndLanglandsExtensions and CompletedCohomologyAndLocalGlobalCompatibility, which the author's own paragraph names.

Remark on untouched text, no change asked: the `*Needs:*` line of §10.5 does not list PotentialAutomorphyInfrastructure §2.5, which its route uses for the local prescriptions.

## Not verifiable

- The items listed in the previous report (the asserted source corrections, the results named in routes without a manifest entry, the construction of §7.12) were not reopened: the change does not touch them.
- Whether LLHLM23's polynomial for `e′` divides, or is implied by, the one for `e` is not stated in the source; R01 rests on the source's statement that the polynomial depends on `e`, not on a computed counterexample to irreducibility over `O′`.

## Source issues

- **Gap** in LLHLM23 at Theorem 9.2.1, p. 137: the source says the theorem follows from the domain theorem by standard base change and patching; it should say how the coefficient ring with the roots of unity that Ihara avoidance needs relates to the ramification index indexing the genericity polynomial; affects the proof.
