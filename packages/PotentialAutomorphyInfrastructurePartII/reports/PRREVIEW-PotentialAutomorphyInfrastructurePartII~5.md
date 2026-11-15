# Review of PotentialAutomorphyInfrastructurePartII (pull request #2135 at 053c948)

**Verdict:** accepted

Incremental re-review of the 10 lines of `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md` changed since `4777c48` (§0.10 statement reworded; §10.5 route, `*Needs:*` line, two new Checks; Layer 10 Dependencies). `Suggested.lean` is unchanged. No finding.

## Previous findings

- R01 — repaired: line 2183 "the lifting rings over `O′` are not claimed to be domains, and the component form of §4.8 is used instead of its domain corollary"; "with these rings above `p`"; the Check with `e′ = p^{M−1}(p − 1)` is at line 2193.

## Verified sound

| Statement | Instance | Values computed on each side | Result |
|---|---|---|---|
| §10.5 route, Galois-orbit step | `E = ℚ₅`, one place with `5 ∥ Nw − 1`, so `M = 1` | `E′ = ℚ₅(ζ₅)`, `e′ = 4 ≠ 1 = e`, `G = (ℤ/5)^×` of order 4; `B` free of rank 4 over the domain `A`, minimal primes all over `(0)`, one `G`-orbit | holds; no genericity for `e′` used |
| §10.5 route, the `E`-point | `x : A → E` with kernel `𝔪` | kernel of `B → E′` is `𝔪B`, `B/𝔪B = E′` a field, `σ(𝔪B) = 𝔪B`; it contains a minimal prime `𝔮`, so every `σ𝔮` | `r\|G_{L_w}` lies on every component |
| §10.5 route against §4.8 | component hypothesis of §4.8 (line 1168) | `f′ ∘ r_𝔪` lies on at least one component of `Spec B`; `r` on all, also after any finite Galois `E″/E` | hypothesis met for every `f′` |
| §10.5 route against §4.6(ii) | places `w ∈ R` with `v_p(Nw − 1) = N_w ≤ M` | `ζ_{p^{N_w}} ∈ E(ζ_{p^M})`; with no such place `E′ = E` and the step is empty | consistent |
| §10.5 route, base change of the ring | LocalGaloisDeformationRings §3.7 at its open head | it states that the reduced torsion-free quotient commutes with `𝒪′/𝒪` and that components can split | supports `R_w ⊗_O O′` |
| §10.5 Check, `e′` | `p = 3`, `M = 2`; `p = 5`, `M = 1` | `[ℚ₃(ζ₉) : ℚ₃] = 6 = 3·2`, totally ramified; `4 = 5⁰·4`; `p^{M−1}(p − 1) = 1` only for `p = 2`, `M = 1`, excluded by (v) | Check correct |
| §10.5 Check, splitting domain | `p = 5`, `A = ℚ₅[x, y]/(x² − 5y²)` | `5` is not a square in `ℚ₅`, so `A` is a domain; over `ℚ₅(√5)`: `(x − √5y)(x + √5y)`; `(0, 0)` on both; at `(√5, 1)`: `x − √5y = 0`, `x + √5y = 2√5 ≠ 0` | Check correct and discriminating |
| §0.10 (seeded sample) | `m = 1`; `r = ψ ⊕ ψ^σ`; BLGGT14 lines 1663–1669 | `M = F`: identity; reducible `r` excluded by hypothesis; source has the same five hypotheses (soluble Galois, `M` CM or totally real, `r` irreducible, `µ` on `G_{F⁺}`, induced pair automorphic polarized) and the same conclusion | holds; rewording changes no hypothesis |

The rows for the untouched statements stand as in the previous review, of `4777c48`.

- Source locators checked against the text: 4 (BLGGT14 Lemma 2.2.3 at line 1631, p. 36; Lemma 2.2.4 at lines 1663–1669, p. 36, proof ending at line 1713, p. 37; LLHLM23 Theorem 7.3.2(2) at lines 5001–5003 and 5078–5079; Theorem 9.2.1 at lines 6233–6250).
- Seeded sample: of the 15 targets only §0.10 lies in a changed passage (row above); §10.5 is cited only at lines 76 and 2199, both consistent with it.
- Cross-roadmap citations resolved: 2 newly cited in §10.5, LocalGaloisDeformationRings §3.7 and PotentialAutomorphyInfrastructure §2.5, each at the head of its open pull request; both are already listed in this README's supplier contracts (lines 172 and 196).
- Library declarations opened: none; the change touches no Lean statement and no library citation.
- Gate, run at this head: every counter 0, `OK`; the worker's run with the targeted build also passes. Nothing outside the folder changes.
- Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- `lake env lean` on `Suggested.lean`: exit 0, no message. The file declares nothing, so the one-tactic probe and the `#check @name` comparison have nothing to run on.
- Pull request text: no sentence of the title or description is contradicted by this head; the change adds no supplier (both newly cited sections belong to suppliers already listed), removes no section and no declaration.

Overlap check: read LocalGaloisDeformationRings (§§3.4, 3.7), PotentialAutomorphyInfrastructure (§2.5), OrdinaryAutomorphicFormsAndModularityLiftingPartII (Scope and ownership; it imports this roadmap's Layers 0–5 and owns none of the changed objects); nothing shared. A search of all open heads and main for BLGGT14 Lemma 2.2.4 and LLHLM23 Theorem 9.2.1 finds only this roadmap. Change of coefficients for potentially semistable rings is owned by LocalGaloisDeformationRings §3.7 and is cited, not restated.

Source independence: changed passages only; 3 passages compared with 2 sources (§0.10 statement with BLGGT14 lines 1663–1669, longest shared run 5 words, a standard name; §10.5 coefficient step and its two Checks with LLHLM23 lines 6249–6250, a two-line proof with no such argument), none shared; no layer added, removed or reordered, so the arrangement was not compared again.

Remark, no change asked: the eigensystem `f′` of the base change of `π` may be defined only over a finite extension of `E′`; the sentence "The same argument with any finite Galois extension of `E`" covers that case.

## Not verifiable

- §10.5, fifth Check, "the polynomial for `e′` is a different one": LLHLM23 lines 5001–5002 assert only that a polynomial exists depending on the weights and `e`; whether the two can be chosen equal is not stated. The Check's conclusion (hypothesis (ii) is for `e`, not `e′`) does not depend on it.
- The items listed in the earlier reports were not reopened: the change does not touch them.

## Source issues

- **Gap** in LLHLM23 at Theorem 9.2.1, p. 137: the source says the theorem follows from the domain theorem by standard base change and patching; it should say how coefficients enlarged by the roots of unity that Ihara avoidance needs relate to the ramification index indexing the genericity polynomial; affects the proof.

## For the human reviewers

- none
