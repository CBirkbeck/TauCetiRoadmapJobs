# Review of PotentialAutomorphyInfrastructurePartII (pull request #2135 at 3924a02)

**Verdict:** needs changes

Files reviewed: `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md` (2237 lines, read in full) and `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/Suggested.lean` (75 lines). This is a full review of the repaired head. Four findings: three blocking (R01 carried from the previous review, R02 and R03) and one locator.

## Previous findings at this head

| Previous finding | Passage at this head | Status |
|---|---|---|
| R01, §10.2 (D0) weakened to `≥` | README line 2105: "(D0) `ℓ ≥ (b_ξ − a_ξ) + 2`;" | **not repaired** (R01 below) |
| R02, two owners with ModularityAndLanglandsExtensions | README line 21: "From ModularityAndLanglandsExtensions it imports potential diagonalizability with its criteria (§2.1) …"; former §§1.4, 1.5, 1.7, 6.2–6.5, 9.7, 8.8, 8.17 are gone | **partly**: the listed statements are now imported; three route ingredients of the Allen–Newton–Thorne theorem still have two owners (R02 below) |
| R03, §§3.1–3.3 restate the definite unitary forms | README line 58 and §§3.1–3.3 cite CompletedCohomologyAndLocalGlobalCompatibility §0.7 and keep the division-algebra variant, twisted coefficients, freeness and reducedness | repaired |
| R04, compound gaps | `gap:brochard-ultrapatching` is no longer used (its consumer moved out); `gap:semistable-stable-category` and `gap:unitary-shimura-integral-cohomology` now list their results as numbered items with locators (README lines 207–209, 258–261) | repaired in substance: each part is a separate, located result; the slug is shared |
| R05, design ids unmapped | table at README lines 80–105, header "Design identifier (earlier numbering)" | repaired; it covers every id the open roadmaps cite (`PL.0`, `PL.1`, `PL.1/potentially-barsotti-tate-diagonalizable`, `PL.4`, `PL.4/relaxed-adequacy`, `PL.5/ordinary-lifts-prescribed-local`, `PL.5/pd-automorphy-lifting`, §8.17) |
| R06, merge order omits PotentialAutomorphyDworkMotivesPartII | description: "It also depends on PotentialAutomorphyDworkMotivesPartII, which precedes it in the merge order and has no pull request yet; this pull request merges after that roadmap's." | repaired |
| R07, §§7.4, 7.14, 7.15 without locator | §§7.4 and 7.14 cite Tho15, proof of Theorem 7.1, p. 67, and ANT20, Lemma 5.2, p. 16; §7.15 says the comparison is not in the sources | repaired |
| R08, strong and weak primitivity forms as separate targets | §§8.7 and 8.8 are single targets with weak primitivity and a "Route under strong primitivity" paragraph | repaired |

## R01 (P2) — §10.2 still states LTXZZ's hypothesis (D0) with `≥`

**Location.** `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md` line 2105: "(D0) `ℓ ≥ (b_ξ − a_ξ) + 2`;", attributed at line 2117 to "LTXZZ, Theorem 3.6.3, p. 30". The change set since the previous head does not touch this line.

**Claim.** §10.2 is LTXZZ's Theorem 3.6.3 under (D0)–(D4).

**Witness.** LTXZZ line 1445 (Theorem 3.6.3, (D0)) and LTXZZ line 1371 (standing hypothesis of §3.6) both have the strict inequality `ℓ > (b_ξ − a_ξ) + 2`. For `N = 2`, `ξ_τ = (0, 4)`, `ξ_{τc} = (−4, 0)`: `a_ξ = −4`, `b_ξ = 4 + 1 = 5`, `(b_ξ − a_ξ) + 2 = 11`, a prime. The README admits `ℓ = 11`; the source starts at `ℓ = 13`.

**Repair.** Write `ℓ > (b_ξ − a_ξ) + 2` in (D0), and `ℓ > 2(N + 1)` in (D1) as printed (equivalent for odd `ℓ`). Tested: `ℓ = 11` is then excluded and `ℓ = 13` allowed, as in LTXZZ. If the boundary prime is wanted, it is a separate target with its own argument.

## R02 (P2) — The route of the Allen–Newton–Thorne lifting theorem has two owners, and its import runs against the proof

**Location.** README line 27: "the Schur condition and the determinant subring (Layer 2)"; line 32: "residually reducible deformation theory, the Allen–Newton–Thorne finiteness theorem and Thorne's two-constituent lifting theorem (Layers 7–8)". The statements are §2.2(3) (line 696, ANT20 Proposition 3.2), §7.7 (line 1475, ANT20 Lemma 3.6) and §8.5 (line 1750, ANT20 Theorem 5.1).

**Claim.** This roadmap owns these three results, and imports only the lifting theorem ANT20 Theorem 6.1 from ModularityAndLanglandsExtensions §4.2 (used in §8.15).

**Witness.** `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md` line 2439 at the head of pull request #1180, in §4.2: it says it owns the reducible-lifting route, namely the `µ₂^d`-action on the Schur ring, the invariant pseudodeformation subring, étaleness on the irreducible locus, the reducible-locus dimension bound at `v₀` and connectedness of the finite ordinary ring, with locator "Thm. 5.1 pp.15–17". These are §2.2(3), §7.7 and §8.5 here. That roadmap is line 196 of the merge order, this one line 282.

There is a second defect in the same place. The second conclusion of §8.5 ("every `O`-valued type-`𝒮₁` lift ordinary of weight `λ` comes from an ordinary RACSDC representation") is ANT20 Theorem 5.1, from which Theorem 6.1 follows by the soluble base change of ANT20 pp. 17–19. So §8.15 imports from an earlier roadmap a theorem whose proof is §8.5 here, with §§7.19 and 8.4 behind it; ModularityAndLanglandsExtensions §4.2 cannot cite those.

**Repair.** One owner for ANT20 Proposition 3.2, Lemma 3.6 and Theorem 5.1. Either:

- **(a)** ModularityAndLanglandsExtensions §4.2 keeps them. Then §2.2(3), §7.7 and the second conclusion of §8.5 cite it and say in one clause what they add (the form for every prime with absolutely irreducible generic representation, the form for an arbitrary finite `Λ`-algebra, the corrected bounds), and lines 27 and 32 are narrowed. This leaves §8.15 resting on a theorem whose route needs §§7.19 and 8.4 of this roadmap.
- **(b)** This roadmap keeps them, which is where their statements with hypotheses and their inputs are. Then the lifting theorem is stated here as the consequence of §8.5 (the former §8.17), §8.15 cites that target, and the import of ModularityAndLanglandsExtensions §4.2 is removed from the summary, lines 21 and 59, the contract at line 324, the table rows at lines 101 and 105 and the last paragraph of the `Suggested.lean` docstring. The description then says that pull request #1180 drops its §4.2 and the ownership sentence.

I recommend (b). Tested on the witness: under (b) each of the five ingredients named at line 2439 has one owner, and no `*Needs:*` line of §8.15 names a supplier whose proof needs this roadmap. Say in the description which option applies.

## R03 (P2) — §4.8 drops the hypothesis `l^N > n` at the places of `R` that its route uses

**Location.** README line 1168 (§4.8): "Let `T = R ∪ S_l ∪ {v₁}` as in §4.6, with `r̄_𝔪|G_{L_ṽ}` trivial and `Nv ≡ 1 mod l` for `v ∈ R`, and `v₁` as in §4.6."

**Claim.** Under these conditions on `R` the fixed-type Ihara-avoidance `R = T` theorem holds.

**Witness.** The route (line 1170) patches "simultaneously for the unipotent rings and for the rings `R^{χ_v}_ṽ` with pairwise distinct characters at `R`". §4.6(ii) (line 1140) asks for this: "if `l^N ∥ Nv − 1` then `l^N > n` and `O` contains the `l^N`-th roots of unity", as on Tho12 p. 48. §4.8 restates two of §4.6's conditions on `R` and not this one. For `l = 5`, `n = 6`, `Nv = 11`: `k(ṽ)^×(5)` has order `5`, so there are only five characters and no six pairwise distinct `χ_{v,j}`. Nothing in §4.8 excludes `l < n` (adequacy gives `l ∤ n` at most).

**Repair.** Add to §4.8, for `v ∈ R`: "if `l^N ∥ Nv − 1` then `l^N > n`, and `O` contains the `l^N`-th roots of unity (§4.6(ii))". In the route of §10.5 (line 2181), which applies §4.8 after base change, add to the conditions on `L` that at the places `w ∤ p` of ramification `r̄` is trivial, `Nw ≡ 1 mod p` and `p^{v_p(Nw − 1)} > n`; a soluble extension with large residue degree there gives it. Tested: `l = 5`, `n = 6`, `Nv = 11` is then excluded, and `Nv = 251` (`250 = 2·5³`, so `5³ ∥ Nv − 1` and `125 > 6`) is allowed.

## R04 (P3) — §8.15: Proposition 5.8 of NT21 is on pp. 73–75, not 72–74

**Location.** README line 1897: "(NT21, Proposition 5.8, pp. 72–74, modelled on BG19, Theorem 5.2.1)".

**Claim.** The statement and proof are on pp. 72–74 of arXiv:1912.11261v3.

**Witness.** NT21 line 3604 (set-up, p. 73), line 3619 (Proposition 5.8, p. 73), lines 3629–3653 (hypotheses and conclusions, p. 74), line 3679 (end of proof, p. 75). Page 72 holds Theorem 5.7 (NT21 line 3578).

**Repair.** Write "NT21, Proposition 5.8, pp. 73–74, proof pp. 74–75".

## Verified sound

**Gate, order, Lean.** The worker's gate at this head passes every check. The pull request changes nothing outside the folder. I ran the dependency check; its whole output is

    depcheck: 235 roadmaps, 2133 edges, 0 problem(s)

with no UPWARD, CYCLE or moved line. `lake env lean` on `Suggested.lean`: exit 0, no message. The file declares nothing: `import Mathlib`, a module docstring and an empty namespace, no `set_option`, no `lemma`, no sorry'd data. I searched the pinned Mathlib (`1b1ccf4`) and Tau Ceti (`2fd255d`) for deformation rings and automorphic representations: no file has either, so no headline of the docstring's list (§§4.5–4.8, 5.1, 5.3, 5.5–5.7, 6.1, 7.19, 8.7–8.8, 9.7, 10.2, 10.3, 10.5) is statable. With no declaration, the one-tactic probe and the `#check @name` comparison have nothing to run on, and nothing is padding.

**Shape.** Every layer ends with Examples and Dependencies; every numbered target has a `*Needs:*` line and at least three Checks. The number §7.10 is unused (§7.9 is followed by §7.11); no roadmap cites it.

**Seeded sample (15 of 15 read at their locators).**

| Target | Locator read | Outcome |
|---|---|---|
| 1.5 | NT21B p. 27 (lines 1281–1282); BLGGT14 §1.4 remarks (4)–(5), p. 26 (lines 1215–1216); LocalGaloisDeformationRings §6.8 (`Sym` compatibility) | matches |
| 2.1 | Tho15 Lemma 3.1, Definition 3.2, Lemmas 3.3–3.4, pp. 12–13 (lines 575–602) | matches; the added equality of multipliers in (2) is needed (source issues) |
| 3.8 | Ger19 Lemma 2.2.2 p. 7, Lemma 2.3.3 p. 11, Lemma 2.4.3 p. 13, Lemma 2.5.2 p. 15; Tho12 Definition 8.1 p. 45 | matches |
| 4.2 | Tho12 Corollary 5.7, Proposition 5.8 p. 23, Proposition 5.9 p. 24 (lines 989–1050), Lemma 5.10 p. 25, Lemma 5.11 p. 28, Proposition 5.12 p. 29, proof of Theorem 6.8 pp. 37–39 | matches, including the roots `q^{j(1−j)/2}e_j` and `R_j ≡ (X − C(d, j)α^j)^{k_j}` |
| 4.8 | LLHLM23 Theorem 9.2.1 and proof, p. 137 (lines 6233–6250); LLHLM20 Proposition 6.0.2, pp. 98–99 (lines 5170–5215) | locators match; hypothesis missing (R03) |
| 5.1 | Tho12 Theorem 7.1, pp. 41–42 (lines 1784–1813) | matches, with the multiplier conversion of the Conventions |
| 7.4 | Tho15 p. 67 (line 3247); ANT20 Lemma 5.2 and proof, p. 16 (lines 731–742) | matches |
| 7.6 | Tho15 Proposition 3.32 p. 26, Lemma 3.33 p. 27; ANT20 Lemmas 3.4–3.5, p. 10 (lines 456, 491) | matches |
| 7.7 | ANT20 Lemma 3.6, p. 11 (line 523); use at line 612 | matches |
| 7.12 | own result; Sk13 Remark 3.2 (line 205, printed p. 519) | locator correct |
| 8.2 | ANT20 §5, p. 16 (lines 725–763); Tho15 Proposition 6.2, p. 64 | matches |
| 8.3 | ANT20 Lemma 5.2, p. 16 (line 731) | matches |
| 8.8 | Tho15 Theorem 7.1, p. 66 (lines 3181–3192), proof from p. 67 | matches |
| 8.15 | NT21 pp. 73–75 (lines 3604–3679) | hypotheses (1)–(4) and conclusions (1)–(5) match; pages off (R04) |
| 10.1 | LTXZZ Lemma 3.6.6, p. 32 (lines 1560–1570); proof of Theorem 3.6.3, p. 35 (lines 1700–1722); LocalGaloisDeformationRings §2.12 (odd `µ`) | matches |

Also read: Tho12 Proposition 4.4, p. 17 (lines 688–708) for §4.3, and Tho12 p. 48 (lines 2056–2081) for §4.6.

**Adversarial pass (computed instances).**

| Statement | Instance | Values computed on each side | Result |
|---|---|---|---|
| §1.5 | `Sym²(1 ⊕ ε^{−1})`; `Sym^m` of two characters | `1 ⊕ ε^{−1} ⊕ ε^{−2}`, weights `{0, 1, 2}` with `HT(ε) = −1`; `m + 1` products `χ₁^aχ₂^{m−a}` | holds |
| §2.1(3) | `n = 1`; characteristic 2 | `c` acts on `ad = k` by `X ↦ −X`: `H⁰ = 0` iff `2 ≠ 0` | hypothesis needed and stated |
| §2.1 converse | `n = 2`, `χ₁ ≠ χ₂`, `k` finite odd | `χ₂^c = χ₂^{−1}µ`, so `χ₂^c = χ₁^{−1}µ` iff `χ₁ = χ₂`; `(k^×/k^{×2})²` has `4` classes | holds |
| §2.1(2) | `Δ = D₄`, `c` trivial on `Δ`, `ρ` of rank 2, `µ′ = µ·det ρ` | same trace on `Δ`; `ν ∘ r′ ≠ ν ∘ r`; `GL₂(k)`-conjugation fixes `ν` | equality of multipliers needed, as stated |
| §3.1 | `L⁺ = ℚ`, `n = 2`; `L/L⁺` unramified | `((−1)^{n/2})^{[L⁺:ℚ]} = −1`: no form; unramified forces `[L⁺ : ℚ]` even, giving `+1` | holds |
| §3.8 | `n = 2`, `λ = (1, 1)`, then `(−1, −1)` | `(w₀λ)(α¹) = ϖ^{λ₂} = ϖ`, then `ϖ^{−1}`; `∏_jα^j = diag(ϖ², ϖ)` | Check correct |
| §4.2 | `d = 1`; `d = 2` | `P₁ = P`, root `α`; `j = 1`: `e₁ = 2α = C(2,1)α`; `j = 2`: `q^{−1}α² ≡ α²` | matches Tho12 Proposition 5.9 |
| §4.5 parity | `n = 1`, `[L⁺ : ℚ] = 2`, `µ` even | `q₀ = 0 + 2·(1 − (−1)^{µ−1})/2 = 2`; `dim R_∞ = dim S_∞ − 2` | contradiction, so `µ ≡ n` |
| §4.6(ii) | `l = 3`, `n = 2`, `Nv = 4` | `3 ∥ 3`, `3 > 2`: three characters, two distinct ones exist | consistent |
| §4.8 | `l = 5`, `n = 6`, `Nv = 11` | `5 ∥ 10`; `\|k^×(5)\| = 5 < 6` | R03 |
| §5.1 | conversion | Thorne's `ρ^c ≅ ρ^∨ε^{1−n}µ` gives full multiplier `ε^{1−n}µ` | consistent with §0.3 |
| §5.6 | `n = 1`, `κ = 1` | `ν = δ·δ = 1`, `ν(c) = 1`, pairing on a line alternating, hence `0` | `κ = 0` forced |
| §5.7 | `n = 2`, `H_τ = {0, 1}`, `w = 1`, then `w = 2` | `H_{τc} = {1, 0}`; then `{2, 1}` | holds |
| §6.1 contract | `n = 2`, `q = 11` | roots `±11, ±121`, product `1331`; on `V_λ(1)`: `±1, ±11`, product `11 = q^{n−1} = ε^{1−n}(Frob_geom)` | consistent |
| §7.4 | `S₃`, `p = 5`, `n = 2` | `[Γ : H] = 2`; the `N`-orbits on `Γ/H` have equal size, a power of `5` dividing `2`, so size `1` and `N ⊂ H`; `\|𝔽₅^×\| = 4` has no element of order `3`, `\|𝔽₂₅^×\| = 24` has | argument and Check hold |
| §7.6 | `d = 1`; `n = 2` | `I^red` is the unit ideal; `I^red = A₁₂A₂₁` | holds |
| §7.7 | `n = 2`, `n₁ = n₂ = 1`; `S(B) = ∅` | one relation `χ₁(Frob) = χ₂(Frob)` per place; rank `2[F⁺ : ℚ] − d₀`; `d₀ = 0` gives `n[F⁺ : ℚ]` | matches ANT20 |
| §7.19 | Noetherian ring | `J` in every prime iff `J ⊂ √0` iff `J` nilpotent | equivalence holds |
| §8.2 | `P = ℤ`, `R = ℤ/2`, `J = (2)` | `θ(J)R = 0 ⊂ (0)` | Check correct |
| §8.5 / §8.8 | counts | `nD − \|R\|n − 2 − 1 − \|R\|n² = nD − \|R\|n(n + 1) − 3`; `1 + nD − (6 + rn(n + 1)) = nD − rn(n + 1) − 5 < nD − rn(n + 1) − 3` | consistent |
| §8.15 | `n = 2, 3, 5` | `p > max(n, 3)` gives `p ≥ 5, 5, 7`; `p ∤ n`, `n < p` | as used |
| §9.7 | `n = 1` | `H¹_f(F⁺, E(δ)) ⊂ Hom(Cl_F, E) = 0` | `P_{(𝔭′)} = E` |
| §10.1 | `N = 2`, `d = 1`, `µ` odd | `χ(c_v) = (−1)^{µ+N+1} = +1`; archimedean term `3` against `1`; LTXZZ's `(1 + (−1)^{µ+1−N})/2 = 1`, shortfall `Nd = 2` | matches |
| §10.2 (D0) | `ξ_τ = (0, 4)` | `(b_ξ − a_ξ) + 2 = 11` | R01 |
| §10.3 Check | `y² = x³ + 3x + 2` over `𝔽₅`, `ℓ = 7`, `N = 3` | `5` points; roots of `X² − X + 5` mod `7` are `2, 6`; `α/β = 2·6 = 5 = q`; `Sym²` eigenvalues `4, 5, 1`; ratios for exponents `2, 0, −2` are `4, 1, 2`; `4·24·124 = 11904`, none divisible by `7`; `ΦτΦ^{−1} = I + 35E₂₁ = τ⁵` | Check correct |
| §10.4 | `n = 2`, `λ^s = (0, 0)`; `n = 3`, `(2, 1, 0)` | `(−1, −1)`; `(−2, −3, −4)` | holds |

**Library declarations opened at the pins (16).** Mathlib `1b1ccf4`: `Field.absoluteGaloisGroup` (`FieldTheory/AbsoluteGaloisGroup.lean:42`), `NumberField.IsCMField` (`NumberTheory/NumberField/CMField.lean:70`), `cyclotomicCharacter` (`NumberTheory/Cyclotomic/CyclotomicCharacter.lean:308`), `Representation.ind` (`RepresentationTheory/Induced.lean:77`), `ringKrullDim` (`RingTheory/KrullDimension/Basic.lean:29`), `RingHom.Finite` (`RingTheory/Finiteness/Defs.lean:174`), `Ideal.finite_minimalPrimes_of_isNoetherianRing` (`RingTheory/Ideal/MinimalPrime/Noetherian.lean:26`), `Ideal.primesOver` (`RingTheory/Ideal/Over.lean:379`), `Group.IsSolvable` (`GroupTheory/Solvable.lean:145`), `Module.finite_of_surjective_of_ker_le_nilradical` (used at `RingTheory/QuasiFinite/Basic.lean:144`). Tau Ceti `2fd255d`: `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet` (`NumberTheory/Chebotarev/Density/Chebotarev.lean:51`), `NumberField.ncard_primesOver_eq_finrank_iff_of_isGalois` (`NumberTheory/NumberField/SplitsCompletely/Basic.lean:74`), `geometricArtinMap` with `continuous_geometricArtinMap`, `isArithFrobeniusLift_inv_of_mk_eq_geometricArtinMap_uniformizer`, `geometricArtinMap_norm` (`NumberTheory/ClassFieldTheory/Local/GeometricArtinMap.lean:68, 76, 112, 145`). All at the stated lines.

**Cross-roadmap citations resolved at the open heads.** ModularityAndLanglandsExtensions §§2.1, 2.2(1)–(2), 2.14, 2.15, 2.16, 2.32, 4.1, 4.2 (#1180): each exists and states what the README imports; §4.2 states the lifting theorem with the sources' primitivity and `ℓ > 3`, `ℓ ∤ n`. CompletedCohomologyAndLocalGlobalCompatibility §0.7 (#1270): the group with `ι_{w^c}(g) = c(ᵗι_w(g)^{−1})`, `S(U, A)` with class-set evaluation, restriction, trace and diamond action, and the split-place operators with the tame Hecke algebra. LocalGaloisDeformationRings §§1.7, 1.13, 2.12, 2.15, 2.20, 2.21, 2.23, 2.28, 3.13, 4.14, 6.8, 6.24, 8.7, F.2.11 (#923). The citations of the other suppliers are unchanged from the previous head, where they were resolved; I did not open them again.

**Declared gaps.** The 15 slugs in the README are each stated under their supplier with a named section. The board plan lists two more, `gap:brochard-ultrapatching` and `gap:enormous-image-taylor-wiles-primes`; their consumer (the former §9.7) is now ModularityAndLanglandsExtensions §4.1, so the README rightly no longer declares them.

**Overlaps.** `overlaps.md` lists no dropped id and no other pull request changing this folder. Ownership against the closest open roadmaps was compared by object: ModularityAndLanglandsExtensions (R02), CompletedCohomologyAndLocalGlobalCompatibility (settled), PotentialModularityAndCompatibleSystems (rank two, acknowledged at line 68), LocalGaloisDeformationRings, AutomorphicGaloisRepresentationsPartII. The generated `depends-on` and `merge-order` blocks of the description predate the imports of #1180 and #1270; the author's own paragraph names both.

## Not verifiable

- The source corrections the README asserts and the previous review recorded (the ANT20 Theorem 5.1 bound, the factor `1/2` on Tho15 p. 70, NT26 Definition 2.5(1), Tho12 Theorem 6.5(i) and Proposition 6.6, NT21's exponent in `𝔪_D`, NT23 Proposition 2.14) were not rechecked this round.
- Results named in routes without a manifest entry, not opened: Kisin Corollary 2.5.16, Gee Proposition 2.3, Labesse Théorème 5.4 and Corollaire 5.3, Clozel–Harris–Taylor, Wake–Wang-Erickson Theorem 2.5.5, Liu's theorem, Pink.
- §7.12 is the roadmap's own argument; I checked its locator and its use, not the midpoint-lattice construction step by step.

## Source issues

- **Error** in Tho15 at Lemma 3.3(2), p. 13: the source says two Schur homomorphisms with equal traces on `Δ` over an algebraically closed field are conjugate; it should also assume equal multipliers, since a self-twist `ρ ≅ ρ ⊗ η` gives a second multiplier; affects nothing.
