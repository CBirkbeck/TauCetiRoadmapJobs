# Review of ModularityAndLanglandsExtensionsPartII (pull request #2449 at 79b71ce)

**Verdict:** needs changes

## R01 (P2) — `gap:dyadic-definite-unitary-forms` asks for `l = 2` objects that earlier roadmaps already supply

**Location.** `TauCetiRoadmap/ModularityAndLanglandsExtensionsPartII/README.md` line 327: "What PotentialAutomorphyInfrastructurePartII must provide (gap:dyadic-definite-unitary-forms): the Layer 3 constructions for `l = 2` … algebraic modular forms on the definite unitary group, exactness and group-ring freeness at sufficiently small level, … the Hecke-valued determinant".

**Claim.** At `l = 2` these are already supplied by AutomorphicFormsOnReductiveGroups §§7.4–7.5 (on main, for every coefficient ring) and by OrdinaryAutomorphicFormsAndModularityLiftingPartII §§2.1, 2.3 (merge order 303, just before this roadmap at 304). The gap would make PotentialAutomorphyInfrastructurePartII a second owner of the `l = 2` constituent Galois representations. What is left (the levels `V_1(Q; N)` and the `P_Q`-module structure) is already a target of §§9.4 and 12.4 here.

**Witness.** OrdinaryAutomorphicFormsAndModularityLiftingPartII README line 290 (pull request #2268 head, §2.3): `r_2(π)` for every constituent of `S_{λ,{χ_v}}(ℚ̄₂)`, "the l = 2 case that PotentialAutomorphyInfrastructurePartII §3.6 … does not state". AutomorphicFormsOnReductiveGroups line 1245 (§7.5, main): at sufficiently small level `S(J,M) ≃ M^h` is free.

**Repair.**
- Delete `gap:dyadic-definite-unitary-forms` from `design/plan.json` and from the README: line 327, the *Needs* lines of §§9.4 and 12.4, and the Layer 9 Dependencies.
- Add a supplier section `### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups and OrdinaryAutomorphicFormsAndModularityLiftingPartII` with the text: "AutomorphicFormsOnReductiveGroups §§7.4–7.5 (algebraic modular forms; exactness, freeness and base change at sufficiently small level, for every coefficient ring). OrdinaryAutomorphicFormsAndModularityLiftingPartII §2.1 (algebraic modular forms on the definite unitary group at `l = 2`) and §2.3 (Galois representations of constituents at `l = 2`), under its standing hypothesis `4 | n[F : ℚ]`."
- In §9.4, replace "For `p = 2` the constructions of Layer 3 are used in the dyadic case (supplier contracts)." with: "For `p = 2` the forms, exactness and freeness are AutomorphicFormsOnReductiveGroups §§7.4–7.5 and OrdinaryAutomorphicFormsAndModularityLiftingPartII §2.1, and the Hecke-valued determinant is glued from the representations of its §2.3 by IntegralHeckeAndGaloisDeterminants §0.2; no `𝒢_n`-valued lift is needed."
- In reduction (6) of §9.1 and reduction (11) of §12.1, replace "`[F : ℚ]` even" with `4 | [F : ℚ]`.
- Cite the same sections in the *Needs* lines of §§9.4 and 12.4.

Tested on a scratch copy edited this way: `depcheck: 258 roadmaps, 2465 edges, 0 problem(s)`.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §2.3 base change to the unitary eigenvariety (nt21 proof of Thm 2.33, pp. 50–51) | CM form induced from `K`; primes dividing `Np` split in `F` | `K` ramified at a prime dividing `Np`, so `K ⊄ F`; image HT `{0, k−1}` before the twist | holds; matches nt21 lines 2463–2525 |
| §3.3 twin on an annulus (nt21 Lemma 3.3, p. 54) | `k=3, m=0`; `k=5, m=0`; `k=2, m=1` | `w=4`, `v₂=2`, `i+i′=1` impossible; `5³−1=124`, `i=i′=1`, slope `2`; `w=−2`, `i+i′=1` | holds; printed `z ∈ X_{i′}` (line 2657) noted |
| §3.5 local image criteria (nt21 Lemma 3.5, pp. 55–56) | CM inert prime; `Δ` at `2` | `α/β=−1`, `(α/β)²=1`: not 3-regular; induced forces `a₂=0`, but `a₂(Δ)=−24` | holds; (1)–(3) = lines 2689–2694 |
| §4.2 character identities (nt21 Props 1.6–1.7, pp. 12–13) | `U_1(ℝ)`, `σ_v` trivial | coefficient `1` has trace `1`; coefficient `2` has trace `2`, giving `2ϵ` | holds; base-change sign remark line 576 |
| §4.5 types and congruence (nt21 Prop 1.15, pp. 17–18) | `q=3`, `p=7` | `3` has order 6 mod 7; `|C(𝔽₃)|=28`; `dim τ=6`; `dim λ=4·8=32=−1+6+27` | holds |
| §5.4 level raising to a type (nt21 Thm 4.1, p. 60) | block sizes at `T₂`, `T₃`; `n=3` | (3)(c)–(d) give `n₁=2`, `n₁=n−2`; printed (4) has `n₂` (line 2963); `T₃` order `1` | holds; correction justified |
| §6.9 Thorne level raising (th24 Thm 6.11, pp. 39–41) | `n₁=n₂=1`, `q=2`, `𝔽₅`; `𝔽₇`, `{3,1}` | `2·2=4≠1`, swapped `3·2≡1`; ratios `3, 5 ∉ {2, 4}` | holds; Thm 4.5(1) = th24 line 916 |
| §7.4 rank-two block (nt21 proof of Prop 7.4, pp. 85–88) | `r=r_τ⊗ω₁ω₀^{2k}`; the blocks of `ρ₀` | `r^c≅r^∨ε^{6k−8k}δ`; `Ind χ⊗δ≅Ind χ`, but `r_τ⊗δ≇r_τ` (Steinberg at `q₁`) | defect real; hypothesis needed |
| §7.6 Theorem E in seed ranks (nt21 Thm 7.6, pp. 90–91) | `k≡3 mod 4`; `n=8` | `(k−1)/2` odd; `TS_8` from `TS_1` in three doublings | holds |
| §8.3 Theorem B relative to a seed (nt21 Prop 8.2, pp. 91–92) | semistable `E` | Steinberg ratio `l^{±1}`, not a root of unity; hypotheses = lines 4446–4451 | holds |
| §9.5 patching, `p > 2` (nt21b Prop 2.6, Lemma 2.7, pp. 13–14) | dimension count; `p=3` | `dim W_∞=q+4|S∪S_∞|`; `g=q+|S∪S_∞|−1` (line 578); `3^a>5` forces `a≥2` | holds |
| §12.3 Taylor–Wiles data for the tensor (nt26 pp. 29–30) | `r=1`; character pattern | `α≠β`; `Δ′_Q=Δ_Q^n` (line 1384); `α_vγ_{v,i}`, `β_vγ_{v,i−r}` (lines 1378–1381) | holds |
| §14.1 Theorem 7.1 and Theorem E (nt21 Thms 7.1, 7.6; nt26 Thm 6.4) | `p=577`; multiplier of the twist | `577=2·288+1`, `≡1 mod 4`, prime; `4≤575`; `ε^{3(n−1)−4(n−1)}=ε^{1−n}` | holds |
| `symPowerEulerProduct_levelOne_entire`, §14.4 (nt21 Thm A, Cor C, p. 2) | `Δ`, `p=2`, `n=2`; `n=0`; `n=1` | `α²+αβ+β²=576−2048=−1472`; `n=0` gives `ζ(s)`; region `(k+1)/2` = `Satake.lean:191` | holds; `simp` makes no progress |
| `symPowerEulerProduct_entire_of_not_hasQuadraticSelfTwist`, §14.5 (nt21b Thm A, p. 1) | `32a`, `n=4`; icosahedral weight one | `a₅=−2`; `ζ(s−2)(1−2^{2−s})` has a pole at `3`; an invariant of degree `|G|` gives `ζ(s)` | holds; CM and `k≥2` exclusions needed |
| `HasQuadraticSelfTwist` | `M=0, 1, 2`; `Δ`; `changeLevel` to `12` | `Coprime p 0 ⇔ p=1`; `(ℤ/2)^×=1`; `252·(−1)≠252`; `ψ′(3)=0`, `ψ′(7)=−1` | holds |
| `symPowerEulerFactor` | swap `α, β`; `n=0, 1` | proved `example` elaborates; `1−x`; `1−(α+β)x+αβx²` | holds |
| §§13.4, 13.10 numerics | `r=4`, `q=17`, `x=2`, `y=3`; `n=6, 7, 11, 12` | forbidden set `{1,2,4,8,9,13,15,16}`; eigenvalues `7,6,10,11,14,12,3,5`; `n=11` allows only `p=7` | holds |
| previous R01, §6.3 | "is PotentialAutomorphyInfrastructurePartII §3.10 (nt21 Lemma 6.6, p. 79" | supplier §3.10 at its head: surjection when no local choice is Steinberg | repaired |
| previous R02, §11.2 | "let `σ` be the companion of PotentialModularityAndCompatibleSystems §9.2" | §9.2 exports `r_σ∼r_π`; `ρ₁∼ρ₂⇝ρ₃` gives `ρ₁∼ρ₃` (supplier §1.2(1)); `ε^{−1}χ_v²=ε^{−2}ω_p` | repaired |
| previous R03, §10.8 Check | "the twist of `11a1` by the quadratic character of `ℚ(√−3)` has conductor `99`" | `11·3²=99`; component at `3` is a principal series twisted by `χ_{−3}`; `3∉sc` | repaired |
| previous R04, §13.6 | "read residually … the characteristic-zero reading … fails" | `{0,1}+{0,1}={0,1,1,2}` repeats a weight, so no RAESDC | repaired |
| R01 here, `gap:dyadic-definite-unitary-forms` | the supplier heads | OrdinaryAutomorphicFormsAndModularityLiftingPartII §2.3 gives `r_2(π)` at `l=2`; AutomorphicFormsOnReductiveGroups §7.5 gives `S(J,M)≃M^h` | already provided |

- Source locators checked against the cached texts: 53 (nt21 31, nt21b 7, nt26 7, th24 6, con99 1, chen14 1). All 15 sampled targets hold; the README flags no locator as unverified.
- Library declarations opened at the pins, all as cited:
  - Mathlib: `Multiplicity.lean:359`, `Bertrand.lean:225`, `Discriminant/Basic.lean:275`, `DirichletCharacter/Basic.lean:79, 88, 107`, `MulChar/Basic.lean:130`, `Resultant/Basic.lean:934`, `QExpansion.lean:172`.
  - Tau Ceti: `Satake.lean:91, 117, 161, 191`, `LFunction/Basic.lean:192`, `JacobsonMorozov.lean:87, 199`. Tau Ceti has `Newform.primitiveTwist` but no self-twist predicate.
- Cross-roadmap citations resolved: about 100 section ids in 24 roadmaps, at their heads or on main, all found; `overlaps.md` lists no dropped id.
- Gate at 79b71ce (my run): every check 0, `OK`; no change outside the folder. Depcheck: `depcheck: 257 roadmaps, 2447 edges, 0 problem(s)`.
- Elaboration: the scratch copy gives only the two `sorry` warnings (lines 98, 117). `#check @` of all 4 declarations matches §§14.4–14.5 (`[NeZero N]`, `hk`, `hf`, `hn`, `hαβ` all present). `simp` closes neither theorem. The one proved `example` is a nontrivial test of `symPowerEulerFactor`. No padding.
- Gaps: 15 slugs, identical in `design/plan.json` and the README, each under its supplier; none unowned; only `dyadic-definite-unitary-forms` is already provided (R01).
- Shape: every numbered subsection has at least 3 Checks and a *Needs* line; every layer ends with Examples and Dependencies; no LaTeX, process words or pull-request numbers.
- Pull-request text: the title and description agree with the head (a new roadmap with 4 declarations; the repair commit adds no supplier). No sentence is contradicted.

Overlap check: I read the scopes of OrdinaryAutomorphicFormsAndModularityLiftingPartII and PadicLocalLanglandsForGL2Qp; ModularityAndLanglandsExtensions §§4.5–4.37; PotentialAutomorphyInfrastructurePartII Layers 1, 3, 5 and 8; PotentialModularityAndCompatibleSystems §§2.16, 9.2, 10.10; and the cited sections of ArithmeticGaloisRepresentations and SmoothRepresentationsOfLocalGroups. Shared objects and their owners:
- the nt21 Lemma 6.6 comparison: PotentialAutomorphyInfrastructurePartII §3.10, cited in §6.3;
- the nt26 Lemma 3.1 companion: PotentialModularityAndCompatibleSystems §9.2, cited in §11.2;
- `l = 2` unitary forms and constituent representations: OrdinaryAutomorphicFormsAndModularityLiftingPartII §§2.1, 2.3 (R01);
- the parent's statements §§4.5–4.31: owned by ModularityAndLanglandsExtensions and proved here;
- the Kazhdan–Lusztig classification: §4.9 here, restated in the later SmoothRepresentationsOfLocalGroupsPartII §7.4.

Source independence: 26 passages compared with 6 sources (nt21, nt21b, nt26, th24, ct17, at20), plus a scan of the whole README for shared 9-word runs. The only shared runs are bibliographic titles and hypothesis clauses fixed by the formulas; the longest prose run is 11 words, a standard phrase at ct17. Largest share: nt21, 86 of 233 locator mentions. Contents compared with nt21: independent. Layers 0–8 correspond to nt21 §§2, 2, 2, 3, 1, 4, 6, 7, 8, merged with ct17 §§2–6 and th24 §6, and nt21 §5 has no layer. Layers 9–10 follow nt21b §§2–3 and Layers 11–13 follow nt26 §§3–6, in the order forced by §10.6 needing §9.8 and §13.10 needing §§13.7–13.8.

## Not verifiable

- kl87 Theorem 7.12 and §8, bbm82 Théorème 3.1.1, kw09 Proposition 9.3: uncertified (paywalled) and settled; cited by locator only.
- ct17 p. 26 (socle multiplicity after (3.9)) and ct15 §6: outside the sample; texts not opened this round.
- §4.2 Check "For `H = G` (the stable case) the sign is `+1`": it has no locator, and nt21 (proof of Prop 4.6, lines 3123, 3152) leaves `ϵ(v, U_n, φ)` unevaluated; not recomputed.

## Source issues

- **Misprint** in nt21 at Lemma 3.3, p. 54: the source says the point `z` lies on `X_{i′}`; it should be its twin `z′ = τ(z)`; affects nothing.
- **Misprint** in nt21 at Theorem 4.1(4), p. 60: the source attaches `n₂ = 2` to `T_{2,L}` and `n₂ = n − 2` to `T_{3,L}`; it should be `n₁`, the size of the `λ̃` block, as in hypotheses (3)(c)–(d); affects nothing.
- **Gap** in nt21 at §1.17, p. 19: the source defines `λ̃(ṽ, Θ)` only for `2 ≤ n₁ ≤ n`; Theorem 4.1(3)(d) with `n = 3` needs `n₁ = 1`, where it should be the character `Θ` itself; affects a stated result.
- **Error** in nt21 at proof of Proposition 7.4, p. 88: the source takes `π₂ = τ₀ ⊗ |·|^{(n−2)/2} ιω₁ω₀^{n−1}` as conjugate self-dual; it differs from its polarized dual by `δ_{K/ℚ}|_{G_{F₀}} ≠ 1`, and `r_τ ⊗ δ ≇ r_τ`; affects the proof.
- **Error** in nt21 at proof of Lemma 2.12, p. 30: the source says Schur's lemma makes two polarized extensions with the same restriction equal; it should be that they differ at `c` by a scalar and are conjugate by `(α, 1)`; affects the proof.
- **Misprint** in nt26 at Lemma 3.4(5), p. 16: the source states the Hodge–Tate condition for embeddings of an undefined `K`; it should be `K₁`; affects nothing.
- **Misprint** in th24 at proof of Corollary 7.2, p. 42: the source takes a Bertrand prime with `n < p < 2n` and then writes `n = p + r`, `r > 0`; it should be `n/2 < p < n`; affects nothing.

## For the human reviewers

- The Kazhdan–Lusztig classification is stated in §4.9 here (merge order 304) and in SmoothRepresentationsOfLocalGroupsPartII §7.4 (pull request #1815 head, README line 1557; merge order 316). An earlier repair round settled this as an edit for that roadmap.
- `gap:components-under-field-extension` asks AdicSpacesPartV Layer 1 (on main) for base change of irreducible components. That roadmap's README line 23 excludes "base change of global irreducible components" from its scope.
- README §13.6 (lines 5068–5070) and its first Check record that the second paragraph of ModularityAndLanglandsExtensions §4.23 (pull request #1180 head), read in characteristic zero, fails for `r ≥ 2`: the weights `{0, 1, 1, 2}` repeat. That statement belongs to the other roadmap.
- Layers 7 and 14 avoid nt21's odd-rank induction because of the block defect in the proof of nt21 Proposition 7.4 (p. 88), which this review recomputed. This review did not search for a published correction.
