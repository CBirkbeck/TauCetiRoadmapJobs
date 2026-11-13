# Review of PotentialAutomorphyDworkMotivesPartII (pull request #2291 at 1c99434)

**Verdict:** needs changes

## R01 (P2) — The symplectic level-structure torsor and its connectedness have two owners

**Location:** `TauCetiRoadmap/PotentialAutomorphyDworkMotivesPartII/README.md` line 1052 (§5.12): "For the self-dual data this is the geometric connectedness of the pairing-preserving trivialization scheme in ModularityAndLanglandsExtensions §2.14"; also §5.11 (line 1029) and §9.4 (line 1508).

**Claim:** §§5.11–5.12 and §9.4 construct the symplectic torsor and prove its geometric irreducibility as targets of this roadmap, while Scope (line 38) says the same scheme and "its geometric connectedness" are left to ModularityAndLanglandsExtensions §2.14 and not restated.

**Witness:** ModularityAndLanglandsExtensions §2.14 (open head, README line 1055), API: "Prove geometric connectedness of this scheme and nonemptiness of the prescribed real and finite local loci." It is earlier in the merge order; PotentialAutomorphyInfrastructurePartII (README line 67) names this roadmap as owner of §§5.10–5.12.

**Repair:** In §5.12 replace the quoted sentence by: "For the self-dual data the statement is ModularityAndLanglandsExtensions §2.14 and is cited, not a target here; what this roadmap adds for it is the residual monodromy (§§5.6, 5.10), which that section's route needs and does not state." In §5.11 define the symplectic `T({Uᵢ})` by that citation, and in §9.4 cite §2.14 for the connectedness of each factor. The linear, unitary and mixed products stay targets here.

## R02 (P2) — Two supplier requirements used by the end theorems are not declared gaps

**Location:** `TauCetiRoadmap/PotentialAutomorphyDworkMotivesPartII/README.md` lines 145 and 147: "What EllipticCurves must provide (gap:ordinary-and-supersingular-curves-over-prime-fields)" and "What GlobalNumberFields must provide (gap:cm-hecke-characters-with-prescribed-infinity-type)"; used in §§9.7, 9.8, 9.11, 9.12.

**Claim:** Both contracts are written as declared gaps, but neither slug is in the plan's `gaps` list, so neither counts as declared and neither supplier states the result: §§9.7–9.12 rest on two statements that no roadmap owns.

**Witness:** `packages/PotentialAutomorphyDworkMotivesPartII/design/plan.json` `gaps` has four slugs: `tame-point-specialization`, `curve-crystalline-companions`, `equivariant-toroidal-semistable-reduction`, `twisted-modular-curve-over-number-fields`. EllipticCurves on main has no existence statement for supersingular curves over `𝔽_p`; GlobalNumberFields is completed.

**Repair:** Either add both slugs, with supplier, section and the README's `needs` sentences, to the plan's `gaps` list, or own the statements here: a Layer 9 target "for every prime `p` there are an ordinary and a supersingular elliptic curve over `𝔽_p`" (Waterhouse, Theorem 4.1, p. 536) and a target for algebraic Hecke characters of an imaginary CM field with prescribed pure infinity type (Barnet-Lamb–Gee–Geraghty–Taylor, Lemma A.2.4, arXiv v4 p. 88), with §§9.7 and 9.8 citing them.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §0.1 pseudo-reflections | `diag(1,2)`, `−1 ∈ GL₂(ℚ)`, identity, `w(2)w(−1)` | ranks of `g − 1`: 1, 2, 0; `w(2)w(−1) = diag(2, 1/2)`; BH89 line 237 (Def. 2.9, p. 330) | holds |
| §0.5 finite unitary groups | `SU₂(𝔽₉)`, `U₁(𝔽₉)`, empty matrix | `3·(9−1) = 24 = #SL₂(𝔽₃)`; index `q+1 = 4`; BCGNT25 line 2310 defines `SU` as `ker ν`, as the README notes | holds |
| §0.9 normal subgroups | `(n,q) = (2,3)`, `SL₃(𝔽₇)` | abelianisation of `SL₂(𝔽₃)` has order 3; centre order `gcd(3,6) = 3`; pins `Perfect.lean:102,116`, `PSL/Simple.lean:127,142` | holds |
| §1.1 auxiliary moduli | `l=3, N=35` | `r = lcm(4,6) = 12`, `3⁶ ≡ 29 ≢ 34 (mod 35)` | holds |
| §1.2 Dwork pencil | `N = 3, 5` at `t = 1` | singular points `N^{N−2}` = 3, 125; Hessian `N(N·I − J)` has eigenvalue `N²` on sum-zero vectors | holds |
| §1.4 `qianIndexSet`, `selfDualIndexSet`, `ZeroShapedDatum.indexSet` | `(401,3)`, `(501,4)`, `(701,6)`, `(7,2)`, `(7,4)`, datum `(1,0,0,0,4)` | `{1,2,398}`, `{1,2,3,495}`, card 6 and sum 0, `{3,4}`, `{2,3,4,5}`, `{2,3}`, each by `decide` | holds |
| §1.5 stabilisers | Qian: `n = 3..8`, 30 odd `N > 100n+100` each; self-dual: even `n ≤ 12`, odd `N < 140` | no `α ≠ 1` (resp. `α ≠ ±1`) fixes `B`; below the bound Qian's set fails up to `(N,n) = (13,6)` only | holds |
| §2.2 torsion-freeness | Fermat quintic | 204 exponent vectors enumerated = `(4⁵ − 4)/5`; QIAN23 line 582, BLGHT11 line 1010 (printed p. 28) | holds |
| §3.1 hypergeometric sheaves | `q=7, N=3, x=3` | `3² = 9 ≡ 2`; trace formula agrees with BCGNT25 lines 2035–2041 | holds |
| §3.4 Katz comparison | ranks, base of `Ψ_λ` | both sides rank `n`; BCGNT25 lines 2042–2047; KATZ09 line 493 (Theorem 5.3, p. 96), line 503 (Remark 5.4, p. 97) | holds |
| §3.5 comparison characters | weights with twist `2−N` and printed `1−N` | `(N−2)−(n−1) = N−n−1`, `ε^{n+1−N}` has weight `2(N−n−1)`; `1−N` gives `2(N−n)` | holds, source misprint |
| §4.4 unipotence at infinity | `gcd(n,N)=1`; `n=N=3` | `cⁿ = c^N = 1 ⇒ c = 1`; scalar `ω` has determinant 1 when `n = N = 3`; QIAN23 line 601, BLGHT11 line 1113 | holds |
| §4.6 maximal unipotence | `n = 2` | `A = [[0,−1],[1,2]]`, `(A−1)² = 0`, `A ≠ 1`; QIAN23 line 669, BLGHT11 line 1178 (printed p. 32) | holds |
| §5.1 `qian_hypergeometric_group_eq_SL` | `N=401, n=3`, `l = 5, 3` | order of 5 is 25 (odd), of 3 is 400 with `3²⁰⁰ ≡ −1`; `∑B = 401 ≡ 0`; index of normal closure divides `gcd(N, l^k) = 1`; QIAN23 lines 682–715 | holds |
| §5.2 `selfDual_hypergeometric_group_conj_Sp` | `m=2, N=7`, `l=3` | `B = {2,3,4,5} = −B`, sum 14 ≡ 0, `0 ∉ B`; `𝔽₃(ζ₇+ζ₇⁻¹) = 𝔽₂₇ ⊂ 𝔽₇₂₉`; BLGHT11 lines 1182–1227 | holds |
| §5.3 `qian_hypergeometric_group_conj_SU` | `l=3, N=401` | `σ²(ζ) = ζ` so `σ² = 1` on `𝔽_l(ζ)`; `−B ≠ B` excludes `Sp`; BCGNT25 lines 2388–2409 | holds |
| §5.4 `qian_two_prime_hypergeometric_group` | `(5, 3209)`, `l₂ = 7, 11`, `l₁ = l₂` | 3209 prime, smallest `≡ 1 (mod 401)`; `7¹⁰⁰ ≡ 11¹⁰⁰ ≡ −1`; diagonal is proper; QIAN23 lines 738–756 | holds |
| §5.6 rank-two exception | products of two order-3 elements of `SL₂(𝔽₅)` | real parts `1/4 − 3c/4`, `c ∈ {±1, ±1/3, ±√5/3}`: orders 1, 3, 4, 6, 10, never 5 | holds |
| §5.11 level-structure torsors | `SL₃(𝔽₇)`, `Sp₂(𝔽₁₁)` | `343·48·342 = 5630688`; `11·120 = 1320`; BCGNT25 lines 2359–2386 | R01 |
| §6.1 Frobenius on Fermat eigenlines | Fermat cubic over `𝔽₇`, `𝔽₅` | 9 and 6 points counted; `J = 2+3ω`, norm 7, `J + J̄ = 1`, trace −1 | holds |
| §6.2 `zeroShaped_gauss_product` | `(q,N,a)`: `(29,7,(0⁴,1,2,4))`, `(11,5,(1,0,0,0,4))`, `(43,7,0⁷)`, `n = 0`, `(31,5,(0,0,0,2,3))` | both sides agree to relative error `< 10⁻¹³`; multiset `{a+b}` is symmetric, giving `q^{n(N−n)/2}` | holds |
| §6.4 determinant is an `n`-th power | `N=7, l=43`, `v ∣ 29` and `v ∣ 29, 71, 113, 127, 197` | exact: `{4,6,7,22,29,31}`, `29¹⁴ ≡ 6`, `29²⁸ ≡ 36`; zero-shaped values all cubes in `𝔽₄₃` | holds |
| §6.8 `λ`-independence | Hesse pencil | `X² − aX + q_v`; BCGNT25 lines 2075–2078, 2095–2098; KATZ09 line 514 (Question 5.5, p. 97) | holds |
| §7.2 Hodge grades | `N=5` self-dual; `N=7` `(0,0,0,1,3,5,5)` | sums 10, 15 give grades 1, 2; sums 21, 21, 28 give 2, 2, 3 | holds |
| §7.11 weakly compatible systems | `N=401, n=3, t=0` | `S` = places above 401; BCGNT25 lines 2086–2090 | holds |
| §9.7 local points | curves over `𝔽₅, 𝔽₇, 𝔽₁₁, 𝔽₁₃` | `y²=x³−x`: 8, 8, 12, 8 points; `y²=x³+1`: 12, 12; `x³+x+1/𝔽₁₁`: 14; `x³+x+4/𝔽₁₃`: 14, `Δ ≡ 5` | R02 |
| §9.8 `R_CM` | `m=3, q₁=7` | `(1,2,−3) ≡ (1,2,4)`, sum 0; `a_σ + a_{cσ} = m−1`; BLGGT14 line 4110 | R02 |
| §9.12 `S_UA` | `(n,m) = (2,3), (3,2)` | exponent `m·mn(n−1)/2 + n·m(m−1)/2 = nm(nm−1)/2`: 15 in both | holds |

- Source locators checked against the text: 59 (QIAN23 14, BCGNT25 14, BLGHT11 12, KATZ09 5, DK17 4, BH89 4, DMOS82 3, BLGGT14 3); BLGHT11 pages are the printed ones, one less than the file's page index.
- Library declarations opened at the pins: 45, among them `Transvection/Basic.lean:223,270,408,426`, `Generation.lean:487`, `GroupTheory/Goursat.lean:131`, `Hilbert90.lean:84`, `GaussSum.lean:76,200`, `Henselian.lean:154`, `SymplecticGroup.lean:102`, `UnitaryGroup.lean:121,285`, Tau Ceti `SpecialLinearGroup/Transvection.lean:600`, `HeckeCharacter/Purity.lean:98`, `FiniteEtale/Galois/Category.lean:111,122`.
- Cross-roadmap citations resolved: 98 section ids in 29 roadmaps, on main or at the open heads; none missing. `levelt_rigidity_field` is in HypergeometricMotives §3.4.
- Gate: every check passed at this head; no change outside the folder.
- Dependency check: `depcheck: 239 roadmaps, 2172 edges, 0 problem(s)`.
- Elaboration: `Suggested.lean` elaborates with five `sorry` warnings and nothing else; the ten elaborated types agree with README §§1.4, 5.1–5.4, 6.2.
- One-tactic probe (`first | rfl | simp | infer_instance | decide`): none of the five theorems closes; no padding.
- Headlines: §§5.1–5.4 and 6.2 are stated; §§3.4, 4.4–4.6, 5.5–5.12, 7.4–7.13, 8.1, 9.3, 9.4, 9.10–9.12 are named in the module docstring with the missing carriers.

Overlap check: read ModularityAndLanglandsExtensions (§§2.9–2.14), PotentialAutomorphyInfrastructurePartII (ownership list), PotentialAutomorphyInfrastructure (§2.20), PotentialModularityAndCompatibleSystems (§§1.1–1.11, 2.14–2.20), HypergeometricMotives (§§3.1–3.4, 5.0); none on main is close. Levelt's theorem: HypergeometricMotives. Fibrewise eigenrealization, equivariant semistable models, ordinarity criterion: ModularityAndLanglandsExtensions. Moret-Bailly: PotentialModularityAndCompatibleSystems. Symplectic trivialization scheme: two owners (R01).

Source independence: 67 passages compared with 8 sources (59 locators, 8 further prose passages and docstrings), none copied; the longest shared run is 19 words in §7.11 (the tuple and the standard name of a weakly compatible system, BCGNT25 lines 2088–2090); largest share QIAN23, 59 of about 205 locator citations; contents compared with QIAN23 (§§1–4): independent, its §3 is spread over Layers 1, 2, 4, 5, 6 and 7.

## Not verifiable

- ZS76, ARTIN55, KATZ90, KM74, KIS99, LEWIS82: settled as uncertified, cited by locator only.
- The published numbering of Qian's paper (Lemmas 3.7, 3.9–3.11, Proposition 3.8): paywalled; only arXiv v1 was read, and BCGNT25 lines 2387 and 2402 agree with the stated shift.
- Dickson, Waterhouse, Berger, CEGS, ACC23, QIAN21, ACAMPO24: outside the sample, not opened.

## Source issues

- **Misprint** in BCGNT25 at Lemma 4.2.4 and its proof, arXiv v3 pp. 41–42: the source says the duality twist is `1 − N` and the weight relation has exponent `N − n`; it should be `2 − N` and `N − n − 1`; affects a stated result.
- **Misprint** in BCGNT25 at §4.1, arXiv v3 p. 40: the source defines the eigensheaf from the direct image with no cohomological degree; it should be the degree `N − 2` higher direct image; affects nothing.
- **Misprint** in BCGNT25 at the proof of Lemma 4.4.4, arXiv v3 p. 48: the source takes the eigenspaces in degree `N − 1` of the Fermat fibre; it should be degree `N − 2`; affects nothing.
- **Error** in BCGNT25 at Definition 4.3.1, arXiv v3 p. 45: the source calls the kernel of the multiplier the special unitary group; it should be the unitary group, the special one also having determinant one; affects nothing.
- **Gap** in QIAN23 at Lemma 3.3(2), arXiv v1 pp. 13–14: the source proves unipotence around infinity on the parameter line, that is of the `N`-th power; it should also exclude a scalar root of unity; affects the proof.

## For the human reviewers

- **Scope.** The plan's `gaps` still lists `equivariant-toroidal-semistable-reduction` (SchemeAndStackFoundations §4.20); the README no longer uses it and cites ModularityAndLanglandsExtensions §2.10 instead (README line 1416).
- **Scope.** The plan's `needs` for `curve-crystalline-companions` includes Kedlaya's full faithfulness; the README (lines 127, 129) cites that as §RD.5.8 and asks only for the companion.
- **Scope.** A gap is addressed to GlobalNumberFields, a completed roadmap (README line 147).
- **Scope.** The title calls this "Part II" of PotentialAutomorphyInfrastructure, as does the open PotentialAutomorphyInfrastructurePartII (README line 1; that roadmap's README line 3).
- **Licence.** QIAN21 and ACAMPO24 are cited as arXiv preprints only (README lines 1689, 1708); they support §8.1's attribution and one Check.
