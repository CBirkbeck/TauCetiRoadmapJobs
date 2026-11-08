# Review of ArithmeticGaloisRepresentations (pull request #856 at 27e9e34)

**Verdict:** needs changes

This is an incremental re-review of the 146 lines changed since `f901260`. R02–R06 of the previous review are repaired. R01 is partly repaired: its two objects now have their correct owners, but the one object still handed to a Part II already has an owner. That remainder is the only finding.

## R01 (P2) — The zeta-integral comparison is still handed to a nonexistent Part II, but AL.2.4.1 owns it

**Location:**
- `README.md:164–167` (Scope and ownership): "The comparison of the standard zeta integral with the completed Hecke function belongs to ArithmeticGaloisRepresentations Part II … The identification of `W_H` with a functional-equation constant is made by the two downstream constructions that follow."
- `README.md:5575–5577` (Downstream consumers) repeats the Part II assignment.

**Claim:** no roadmap plans this comparison, so this roadmap's Part II will. The sentence also says the `W_H` identification is made by the AL.1 and AutomorphicSpectralTheory constructions in the next paragraph.

**Witness:** AutomorphicLFunctionsAndLocalFactors, at its head `330bb72`:
- `README.md:1367` builds the global Godement–Jacquet integrals for every `n ≥ 1`.
- `:1369` says that at `n = 1` the completed function is AnalyticNumberTheoryPartI §2.3a's `Λ(s,ω) = A^(−s/2)Λ_H(ω,s)`.
- Its Check at `:1376` gives `Z(s) = Γ_ℝ(s)ζ(s)` for `ω = 1` and the standard test function.
- `:29` assigns AL.1.6.2 (the Hecke equation) to AnalyticNumberTheoryPartI §2.3a, whose `README.md:1334` states that `W(ω)` is the normalized Gauss sum.

So the comparison already has an owner, and the AL.1 construction that the next paragraph names no longer exists.

**Repair:** replace `README.md:164–167` from "The comparison of the standard zeta integral" to "constructions that follow." with:

> The comparison of the global zeta integral at the standard test function with the completed Hecke function is the `n = 1` case of AutomorphicLFunctionsAndLocalFactors AL.2.4.1, whose local standard evaluations (AL.1.2.1) consume §2.7's. The Hecke continuation and functional equation, with `W(ω)` the normalised Gauss sum, are AnalyticNumberTheoryPartI §2.3a's. Downstream, AutomorphicLFunctionsAndLocalFactors AL.1.6.1 identifies §2.7's local-constant product with that root-number factor, and AutomorphicSpectralTheory §1.15c derives the same constant by Eisenstein theory.

At `README.md:5575–5577`, replace "is ArithmeticGaloisRepresentations Part II's, built on §2.7 and on LFunctions Layers 0, 5–6 or AutomorphicLFunctionsAndLocalFactors AL.1" with "is the `n = 1` case of AutomorphicLFunctionsAndLocalFactors AL.2.4.1".

**Test:**
- After the edit, `grep 'Part II' README.md` finds nothing, so every object has a single owner.
- AL.2.4.1's Check recomputes the trivial-character case: `Γ_ℝ(s)·∏_p(1 − p^(−s))^(−1) = Γ_ℝ(s)ζ(s) = completedRiemannZeta(s)`, with `A = 1` and `W = 1`, the values §2.7's own Check gives for the trivial character.

## Previous findings

- **R01 — partly repaired:** `README.md:158–164` now gives "AnalyticNumberTheoryPartI §2.41's, on its §§2.2a and 2.18a" and "the downstream ArtinRepresentations §2.4's". The previous repair kept a Part II only where no owner exists; the zeta-integral comparison it keeps is owned by AL.2.4.1. This is R01 above.
- **R02 — repaired:** `README.md:478–480` reads "and, for the decomposition groups of a Galois extension of number fields, their tame decomposition, …". `:2763–2769` restores the general API, "with `G_0` finite and every finite-dimensional `W` on which `G_i` acts trivially for all large `i`", and adds the `F₂((t))` Check.
- **R03 — repaired:** `README.md:3723–3724` reads "Serre 1981, n° 2.1, Théorème 1, p. 131, for the clopen case through a finite quotient, and Introduction, p. 124, for closed null sets".
- **R04 — repaired:** `README.md:3054–3056` reads "`v_2(𝔡) = 2` for `ℚ_2(√−1)` and `ℚ_2(√3) = ℚ_2(√−5)`, and `3` for `ℚ_2(√±2)` and `ℚ_2(√±6) = ℚ_2(√∓10)`, Serre 1987, §2.6, *Exemple*, p. 188".
- **R05 — repaired:**
  - `README.md:1218–1222` reads "if `k` has characteristic `p > d` … (in characteristic `0` this is Tau Ceti's `Representation.nonempty_equiv_of_character_eq_of_isSemisimpleRepresentation`…)", with three new Checks.
  - `:337` and `:2841–2850` cite `Rep.FiniteCyclicGroup.groupCohomologyIsoEven`.
  - `:540` no longer claims the vanishing.
- **R06 — repaired:**
  - The comment catalogue is gone from `Suggested.lean`, which changed only by deleting those four lines.
  - `README.md:4380–4381` reads "*Lean:* `Conductor.lowerSwanConductor_le`; the `.toNat` of `v_L(p) = ∞` is `0`, so the statement needs `[CharZero B]`".
  - The Check at `:4388–4391` no longer names the Lean file.

## Verified sound

**Gate, dependency check, diff.**
- The prescribed gate prints `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0). The worker's run on this head adds `build=0`.
- The dependency check prints `depcheck: 238 roadmaps, 2358 edges, 0 problem(s)` (exit 0), with no UPWARD, CYCLE or `moved:` line. The roadmap is on line 57 of the merge order and AnalyticNumberTheoryPartI on line 49. AutomorphicLFunctionsAndLocalFactors (93) and AutomorphicSpectralTheory (95) are later, and ArtinRepresentations is not listed. The new text names all four as owners, not as suppliers.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `scratch/overlaps.md` lists no other pull request changing this folder and no dropped or revision-only id.

**Elaboration.**
- `lake env lean Suggested.lean` exits 0 in 13 s with exactly 20 `declaration uses sorry` warnings and nothing else.
- I put `#check @name` for all 33 declarations in one scratch file: 33 outputs and 0 errors. The types match `scratch/signatures.md`; for example, `lowerSwanConductor_le` carries `[CharZero B]`, as the new *Lean:* note says.
- **Padding probe:** in a scratch copy I replaced every `sorry` with `first | (simp; done) | rfl | infer_instance | trivial | decide`. That gives 20 errors at 20 distinct theorems (lines 74 … 494), so none closes.
- Headline coverage is unchanged since the previous report.

**Library declarations opened at the pins.**

| Declaration | Pin, file and line | Note |
| --- | --- | --- |
| `Representation.nonempty_equiv_of_character_eq_of_isSemisimpleRepresentation` | Tau Ceti `2fd255d`, `RepresentationTheory/Semisimple.lean:63` | `[Monoid G] [CharZero k]`, finite-dimensional semisimple, equal `character` |
| `IsSemisimpleModule.nonempty_linearEquiv_of_trace_eq` | `RingTheory/Semisimple/Trace/Basic.lean:109` | — |
| `TauCeti.IsLocalRing.ramificationGroup_antitone` | `RingTheory/LocalRing/RamificationGroup.lean:183` | The definition at `:118`: `G_i` is the inertia of `𝔪^{(i+1).toNat}` |
| `Rep.FiniteCyclicGroup.groupCohomologyIsoEven` | Mathlib, `RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean:80` | `[CommGroup G] [Fintype G]`, `g` generating, `[NeZero i] (Even i)`; homology of `A --N--> A --(ρ(g)−1)--> A` |

All four resolve in one scratch `#check` file (exit 0).

**Cross-roadmap citations resolved for the changed passages.**
- AnalyticNumberTheoryPartI at `979e68c`:
  - §2.41 (`README.md:1996`) assembles `Λ(s,ρ) = w(ρ)Λ(1−s,ρ∨)` along §2.18a's Brauer expression. Its *Needs:* line lists §§2.18, 2.18a, 2.2a, 2.3a, 2.11 and LFunctions Layer 7, with no §2.7, as the README says. The folder never mentions this roadmap, so there is no cycle.
  - §2.2a (`README.md:1273–1290`; `Suggested.lean:636–661`) states its API bullets for `G_w` acting on `O_{L_w}` only, so the restricted contract is exact.
- ArtinRepresentations at `67a9da9`, §2.4:
  - `README.md:811` covers existence and uniqueness by Deligne's globalization and transfer, and `:831` the Weil–Deligne extension.
  - `:854` has `W(ρ⊗η,ψ) = η(ϖ)^(a(ρ)+d n(ψ)) W(ρ,ψ)`.
  - Its *Needs:* line at `:875` cites "ArithmeticGaloisRepresentations §§2.4, 2.5a, 2.7", so "downstream … built on §2.7" is right.
- AutomorphicLFunctionsAndLocalFactors AL.1.6.1 (`README.md:1078`) and AutomorphicSpectralTheory §1.15c (`README.md:1216–1220`, deriving `Λ_E(ω,u) = W_H(ω)Λ_E(ω⁻¹,1−u)`) both compare §2.7's constant with a functional-equation constant. So the new sentence at `:655–656` is correct.

**Sources checked at the changed locators (seeded sample: §3.7 is the only sampled target the diff touches).**
- `serre-1981-chebotarev` line 305 (page marker 10, printed p. 131, n° 2.1) has Théorème 1, density `|C|/|G|`. Lines 306–310 define natural density.
- `serre-1987-modular-galois` lines 434–438 (printed p. 188, §2.6, *Exemple*) give unramified `ℚ_2(√5)`. They give discriminant `(4)` for `√−1, √−5` and `(8)` for `√2, √−2, √10, √−10`. This matches the README's values once the identifications in the R04 row below are used.

**Adversarial table.** Matrices act on columns and `Frob` is arithmetic. The first block covers the changed statements, with values computed now.

| Statement | Instances and computed values | Result |
| --- | --- | --- |
| §1.8 trace criterion, `char k = p > d` | `F₅`, `ℤ/2`, `d = 3`: `1²⊕sgn` has trace `1+1−1 = 1` at `g`, `1⊕sgn²` has `−1 ≠ 1`, so they are distinguished. `F₄`, `ℤ/3`, `d = 1`: `ω ≠ ω²`. A simple constituent with `p \| m` (index) or `Z/k` inseparable has dimension `≥ p > d`, so the trace forms are independent. Imperfect `F_p(s)` with `k'^×` on `k'` has `d = p`, which is excluded | Holds |
| §1.8 Check 1 (semisimplicity needed) | `F₂`: charpoly of `(1 1; 0 1)` is `X² + 1 = (X−1)²`, the same as for `1⊕1`; the unipotent one is not semisimple | Holds |
| §1.8 Check 2 (`p > d` sharp) | `F₃`, `d = 3`: `tr(1) = 3 = 0` for both; `tr(g) = 3 = 0` and `−3 = 0`. Multiplicities `3 ≡ 0 (mod 3)` but are not equal | Holds |
| §1.8 Check 3 (characteristic `0`) | `F₇`, `d = 7`: traces `7 = 0` and `±7 = 0`, equal, not isomorphic. `ℚ`, `d = 7`: Tau Ceti's theorem applies with no bound | Holds |
| §3.2 restored API: Artin = Swan + `codim W^{G_0}` | `ℚ_2(i)`, regular representation: `2 = 1 + 1`. AS `F₂((t))`: `2 = 1 + 1`. `ℚ_3(√3)`: `1 = 0 + 1`. Negative control: `ℤ/2` acting trivially on `ℤ_p` gives `G_i = G` for all `i`, so with `W = sgn` both `finsum`s have infinite support and are `0`, while `codim = 1`. The hypothesis "`G_i` acts trivially for large `i`" excludes this. If `G_0` is infinite, `Nat.card = 0`; "`G_0` finite" excludes this | Holds |
| §3.2 vanishing when `G_0` acts trivially | `G_i ⊆ G_0` by `ramificationGroup_antitone` (`0 ≤ i`), so every codimension is `0` | Holds |
| §3.2 Check `F₂((t))`, `α² − α = t⁻¹` | `v_L(α) = −1`, `π = 1/α`, `σπ − π = −1/(α(α+1))`, so `v_L = 2`: `σ ∈ G_1 \ G_2`. Artin sum `1·1 + 1·1 = 2 = m + 1` | Holds |
| §3.2 Check `ℚ_3(√3)` | `σ√3 − √3 = −2√3` has `v_L = 1`, so `G_0 = ℤ/2` and `G_1 = 1`. Artin `1`, Swan `0`; `v_3(𝔡) = v_3(12) = 1` | Holds |
| §3.2 `H²` vanishing via `groupCohomologyIsoEven` | `G = ℤ/2`, `A = ℂ^×` trivial: `ker = A`, `im N = (ℂ^×)² = ℂ^×`, so `H² = 0`. Negative control: `A = ℤ` trivial gives `ℤ/2ℤ ≠ 0`, so divisibility is needed | Holds |
| §3.7 `ℚ_2` quadratic conductors | `3·(−5) = −15 ≡ 1 (mod 8)`, `6·(−10) = −60 = 4·(−15)`, `−6·10 = −60`. Discriminants `−4, 12` give `v_2 = 2`; `8, 24` give `3` | Holds |
| §3.7 order-3 characters of `ℚ_3^×` | `ℤ_3^× = μ_2 × (1+3ℤ_3)`. Order `3` forces triviality on `μ_2`, so `χ` is nontrivial on `U¹`. `(1+3x)³ ∈ 1+9ℤ_3`, so `χ(U²) = 1` and the conductor is `2` | Holds |
| §5.9 clopen density | `C` clopen and conjugation-stable is a union of cosets of an open normal subgroup, so Théorème 1 on the finite quotient gives density `\|C\|/\|G\| = μ(C)` | Holds |
| §6.6 *Lean:* note | Characteristic `p`: `(p : B) = 0`, `addVal 0 = ⊤`, `.toNat = 0`, so the bound would read `Sw ≤ 0`. AS `m = 1` has `Sw = 1`, and `[CharZero B]` excludes it | Holds |
| Scope: AnalyticNumberTheoryPartI §2.41 | Trivial `ρ` over `ℚ`: `Λ = completedRiemannZeta`, `w = 1`, `N(𝔣) = 1` | Holds |
| Scope: ArtinRepresentations §2.4 twist law | `ρ = 1`, `d = 1`, `a = 0`, `n(ψ) = 0`: `W(η) = η(ϖ)⁰·1 = 1`, which agrees with its "unramified gives `W = 1`" | Holds |
| Scope: zeta integral → Part II | AL.2.4.1, `n = 1`, `ω = 1`, `Φ = e^{−πx²}⊗1_Ẑ`: `Z(s) = Γ_ℝ(s)ζ(s)`, already planned there | R01 |

The rows below are carried from the previous report (`f901260`); these statements are untouched by the diff.

| Statement | Instances and computed values (previous report) | Result |
| --- | --- | --- |
| §3.2 regular-representation Artin sum `= f·d(L/K)` | `ℚ_2(i)`: `2 = v_2(−4)`. `ℚ_3(ζ_3,∛2)`: `(6/6)·5 + (3/6)·4 = 7` | Holds |
| §3.5 integrality via `lowerConductors_integral` | Standard `S₃` representation: `2 + ½·2 = 3` over `ℚ` and `F₂`. Over `F₃`, `3/2`, which `hC` excludes | Holds |
| §3.5 local (c), global with `Σ = ∅` | `ℚ_2(i)/ℚ_2`, `δ = 2 = a(1 ⊕ χ_{−4})`; `ℚ(i)/ℚ`: `(4) = 𝔣(χ_{−4})` | Holds |
| §3.6 Checks `11a1`, Kummer lattices | `ℓ = 3`: `a₂ = −2`, chain `1 ≤ 1 ≤ 1`. `ℓ = 5`: `30 = 25 + 5`. Lattice drop `2 − 1` | Holds |
| `baire_descent`, `exists_integral_conj_GL` | `n = 0`: `E = K`. `∏ ℤ/p_n → ℚ̄_ℓ^×` is discontinuous. `ℤ ∋ 1 ↦ ℓ` is not compact | Holds |
| `iso_of_charpoly_eq` | `F₂`, `1⊕1` against the unipotent. `F₄`: `(X−1)² ≠ (X−ω)²` | Holds |
| `isAbsolutelyIrreducible_of_isOddAt`, `dickson_projectiveImage` | Totally real cubic: `ρ(c) = 1` fails `hodd`. `GL₂(F_q)` gives `PGL₂`; `SL₂(F₃)` gives `A₄` | Holds |
| `iso_of_frobenius_charpoly_eq`, `imageAlgebra_isCentralSimple`, `realizable_iff_imageAlgebra_split` | Chebotarev lifts meet every `gU`. `Q₈` over `ℝ`: `ℍ`, dimension `4`; split over `ℚ(i)` | Holds |
| `realizable_of_charpoly_mem`, `conj_into_of_trace_mem_of_distinct_eigenvalues`, `carayol_conj_of_trace_eq` | `X − ω ∉ F₂[X]`. `Q₈` over `ℚ` has no rational distinct eigenvalues. `1⊕1` against `(1 ℓt; 0 1)` is excluded by `habs` | Holds |
| `compact_matrix_frattini_isOpen`, `multiplicative_residual_unramified_iff` | `1+ℓℤ_ℓ`: `Φ = 1+ℓ²ℤ_ℓ`. `11a1`, `v(j) = −5`: `p = 5` unramified, `p = 3` ramified | Holds |
| `lowerSwanConductor_le` | `ℚ_2(√2)`: `2 ≤ 2`. `ℚ_2(ζ_8)`: `2 ≤ 3`. Trivial `G`: `0 ≤ …` | Holds |
| `isAdequate_*`, `isEnormous_*`, `exists_linear_lift` | `SL₂(F₇)` adequate; `SL₂(F₅)` excluded. `A = (0 4; 1 4)` over `F₅` fails `h₂`. `n = 1`: `PGL₁ = 1` | Holds |
| Sample rows §§1.3, 1.10, 2.5, 2.7, 4.3, 4.6, 5.8, 5.12, 5.13, 6.3, 6.4, 7.2, 7.9, 7.10 | As tabulated in the previous report (e.g. `det Ind` for `ℤ/2`; `ε₂ = −i·3^{1/2−s}` for `ℚ₃`; `diag(2,1)` outer on `PSL₂(F₅)`; `H¹(ad⁰) = k` for `SL₂(F₄)`) | Holds |

**Remarks on untouched text (not findings).**
- `README.md:168–175`, `:2410–2412` and `:5556–5565` name AL anchors `rank-one-local-functional-equation`, `hecke-l-functional-equation` and `global-godement-jacquet`. `roadmaps grep --fixed` finds them only in this README. At `330bb72` AL numbers these AL.1.3.2, AL.1.6.2 (owned by AnalyticNumberTheoryPartI §2.3a) and AL.2.4.1.
- Likewise, `:156–157` attributes the Hecke equations to "LFunctions Layers 0, 5–6 and AutomorphicLFunctionsAndLocalFactors AL.1".

**Ownership against open pull requests.** For the changed objects I checked ownership against main and the open heads with `roadmaps grep`:
- the Artin functional equation, the higher-rank local constants and the zeta-integral comparison (R01);
- the general lower-sum API, which is owned here as the extension of AnalyticNumberTheoryPartI §2.2a;
- the trace criterion in characteristic `p > d` (Tau Ceti has characteristic `0` only).

## Not verifiable

- **CG 2020, App. §A.4, proof of Lemma A.8, p. 890** (still cited in §5.9): arXiv:1907.08691v1 has no Appendix A, and the journal is paywalled.
- **Ribet 1976, §2, p. 154** and **Chenevier, Thm 2.12, p. 31** (the §1.8 locator list, unchanged): not fetched in this review.
- **Isaacs, Cor. 11.22** (§3.2, unchanged): not fetched in this review.
- **Uncertified in the manifest:** Serre, *Local Fields*, and KW (II).

## Source issues

- none
