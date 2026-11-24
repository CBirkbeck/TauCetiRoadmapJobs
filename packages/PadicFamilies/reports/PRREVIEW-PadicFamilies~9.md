# Review of PadicFamilies (pull request #3027 at 0b5086d)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 33 changed lines since `aecb53a`. I checked the new §1.7a (Hida's module of congruences along an idempotent of `A[1/ϖ]`), the widened ownership sentence and the new reference: every identity of §1.7a and its four Checks were recomputed and hold, and the Hida 1986 locators (§0, p. 232; (3.11a)–(3.11b) and the remark before (3.12), p. 254) support the statements as written. There are no findings, so the change is accepted with three small corrections: Hida 1981 is cited with no locator, the description says every addition keeps its source's generality although §1.7a does not, and the ownership sentence is narrower than §1.7a. Nothing is left for the human reviewers to decide; one line records that their decision on published theorems was applied.

## C01 — Hida 1981 is cited in §1.7a with no locator, so a reader cannot tell what it supports

The source line that closes §1.7a (line 1120) gives exact places in Hida 1986 and then "[Hida81](#hida81)" with nothing after it. No other passage of the README cites Hida81. Either give the section or theorem of the 1981 paper that the section relies on (presumably where the congruence module of a decomposition of a Hecke algebra is introduced), or drop the citation. I could not open the 1981 paper to propose the place (see the collapsed block).

## C02 — The description says every added section is stated in its source's generality, but PadicFamilies §1.7a is stated more widely than Hida

Part 1 of the description says that each added section is "stated in the generality of its source", and lists the exceptions in parentheses. PadicFamilies §1.7a is not among them. Yet it is stated for any discrete valuation ring, any commutative algebra that is finite and free over it, and any idempotent of `A[1/ϖ]`. Hida works with Hecke algebras over the integers of a finite extension of ℚ_p (§0, p. 232; §3, p. 254), and §1.7a says so itself (line 1101). The wider statement is correct (I checked every clause), so the description is what is wrong. Adding "in PadicFamilies §1.7a for any commutative algebra finite and free over a discrete valuation ring and any idempotent of its generic fibre" to the parenthesis would make it true.

## C03 — The ownership sentence claims congruence modules "of a Hecke algebra", while §1.7a states them for every commutative finite free `O`-algebra

In Scope and ownership (line 2907) the new clause reads "congruence modules along a decomposition of a Hecke algebra". §1.7a states the module for any commutative `O`-algebra that is finite and free over a discrete valuation ring. LengthBoundsInPadicFamilies (its README, lines 11 and 49) cites it in that generality. A reader settling ownership from the scope paragraph would conclude that the general algebraic statement has no owner. Writing "congruence modules along a decomposition of a finite free algebra over a discrete valuation ring (Hecke algebras among them)" would match the section.

## Verified sound

Here `A_n = {(a, b) ∈ O² : a ≡ b mod ϖⁿ}`, `ξ = (1, 0)` unless stated.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.7a `C(A; ξ) ≅ ξA/𝔠_ξ` via `ξa ↦ (ξa, 0)` | `A_n` | `C = O²/A_n ≅ O/ϖⁿ` by `(x, y) ↦ x − y`; `ξA/𝔠_ξ = (O×0)/(ϖⁿO×0) ≅ O/ϖⁿ` | holds | none |
| 1.7a kernel `𝔠_ξ ⊕ 𝔠_{1−ξ}`; `Ψ_ξ ≅ Ψ_{1−ξ}` | `A = {a≡b≡c mod ϖ} ⊆ O³` (odd residue char.), `𝒴 = {1}` and `{1,2}` | sum of ideals `ϖO³`; `A/ϖO³ ≅ O/ϖ`; `Ψ_𝒴 ≅ Ψ_{𝒳∖𝒴} ≅ O/ϖ` both cases | holds | none |
| 1.7a annihilator of `C` = conductor = `𝔠_ξ ⊕ 𝔠_{1−ξ}` | `A_n` | conductor of `A_n` in `O²`: `ϖⁿO²`; `Ann_{A_n}(O/ϖⁿ) = {(a,b) ∈ A_n : a ≡ 0} = ϖⁿO²`; hida line 925 | holds | none |
| 1.7a finite length, `ϖ^N` kills `Ψ_ξ` | Check 4 ring; `ξ = 0, 1`; `A = 0` | `ϖⁿξ = (ϖⁿ + t)/2 ∈ A`, `Ψ ≅ O/ϖⁿ`; degenerate cases `Ψ = 0` | holds | none |
| 1.7a "reducedness not used" | `A = O[t]/(t²)` | `K[t]/(t²)` has idempotents 0, 1 only; `Ψ = 0`, finite length (§1.7's `λ(t)=0` gives non-torsion `O`, another construction) | holds | none |
| 1.7a `Ann_A(𝔠_ξ) = 𝔠_{1−ξ}` | `A_n`; `ξ = 1` | `Ann(ϖⁿO×0) = 0×ϖⁿO = 𝔠_{1−ξ}`; `Ann(A) = 0 = 𝔠_0` | holds | none |
| 1.7a raw-annihilator form of §1.7 with ideal `𝔠_ξ` | `A_n` | `A[𝔠_ξ] = 0×ϖⁿO`, `A[Ann 𝔠_ξ] = ϖⁿO×0`, quotient `O/ϖⁿ` = §1.7 Check 1 (`ℤ/pⁿ` at `O = ℤ_p`) | holds | none |
| 1.7a split case: `𝔠_{ξ_𝒴}` = functions vanishing on `𝒳∖𝒴` | `A = O²`, `𝒴 = {1}` | `𝔠 = O×0`; the reversed reading gives `0×O` (Check 3) | holds | none |
| Check 2 over ramified `O` | `O = ℤ_p[√p]`, `ϖ = √p`, `n = 1` | `Ψ ≅ O/ϖ = 𝔽_p`, length 1 = n; with `p` for `ϖ` length would be 2 | holds | none |
| Check 4, odd residue characteristic | `O = ℤ_2`, `n = 1`; odd `p` | image of `ℤ_2[t]/(t²−4)` is `{u ≡ v mod 4}`, `Ψ ≅ ℤ/4`, length 2 ≠ 1; odd: image `A_n`, length n | hypothesis needed, stated | none |
| Check 1, one point | `A_n`, `x = 1` | `ker λ_1 = 0×ϖⁿO = 𝔠_{1−ξ}`; `I_λ = ϖⁿO×0 = 𝔠_ξ`; both quotients `O/ϖⁿ` | holds | none |
| Consumer claim (LengthBoundsInPadicFamilies 1.7a *Origin*) | its four named clauses | symmetry, finite length, raw-annihilator form, split case all at lines 1099–1103 | holds | none |
| Headline 0a.22 `locally_finite_ordinary_milestone` (unchanged) | `R = ℤ_p`, `M = ℤ_p²`, `T = diag(1, p)` | `T^{N!} → diag(1, 0) = e`; `T` bijective on `eM`, `T^k → 0` on `ker e` | holds | none |
| Headline 0a.17 `perfect_complex_ordinary_projector` (unchanged) | `C = ℤ_p` in degree 0, `t = p` | `t^{k!} → 0 = e`; `D = 0`, `ι, π` zero, `πι = id_0` | holds | none |
| Headline 0a.25 `locally_finite_derived_ordinary_independence` (unchanged) | `C₀ = C₁`, `α = id`, same splitting | composite `ι₀ α π₁` = identity of `D₀` in `D(R)`, an iso | holds | none |
| Description sentence (C02) | §1.7a against hida | source: Hecke algebras over integers of finite ext. of ℚ_p; head: any DVR, any commutative finite free `A`, any idempotent | differs | C02 |
| Scope sentence (C03) | line 2907 against line 1101 | scope: "of a Hecke algebra"; section: any commutative finite free `O`-algebra | narrower | C03 |
| Hida81 citation (C01) | line 1120 | no locator; text unreadable | locator missing | C01 |

- Source locators checked against the text: 3, all in hida (§0, p. 232, lines 59–62; (3.11a)–(3.11b), p. 254, lines 906–909; the remark before (3.12), lines 925–927), all supporting §1.7a as written; hida81 not readable.
- Library declarations opened at Mathlib `1b1ccf4`: `IsIdempotentElem` (Mathlib/Algebra/Group/Idempotent.lean:37), `Module.length` (Mathlib/RingTheory/Length.lean:31), `Module.annihilator` (Mathlib/RingTheory/Ideal/Maps.lean:869), `Submodule.torsionBySet` (Mathlib/Algebra/Module/Torsion/Basic.lean:182). No congruence-module declaration in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved: 6 citations of PadicFamilies §1.7a at this head (LengthBoundsInPadicFamilies README lines 11, 49, 54; CongruenceModulesOfThetaLifts README lines 272, 2069–2070, 2366), each matching what §1.7a states. §1.10, which §1.7a names, treats Hida's (3.9).
- Record: the merge-base README's 8 layers and every heading kept; the diff deletes one line (the scope sentence, rewritten). Nothing renumbered.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1482 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean TauCetiRoadmap/PadicFamilies/Suggested.lean` gives three `declaration uses sorry` warnings only (lines 57, 93, 119). `Suggested.lean` is unchanged since the merge base. Its elaborated types carry `[HasDerivedCategory (ModuleCat R)]` wherever the statement uses the derived category, so no needed binder is missing. The one-tactic probe was not re-run on the unchanged file.
- Ordering: `#3036` also changes this folder; the description's merge-order paragraph places it first, and the heads do not conflict in this folder.

Overlap check: read AutomorphicCongruences, ModularIwasawaMainConjectures, IntegralIwasawaTheoryPartII and SerreWeightAndLevelOptimisation (open), and ModularSymbolsPadicLFunctions, OrdinaryAutomorphicFormsAndModularityLifting and AutomorphicGaloisRepresentations (main). Shared object: the congruence module along an idempotent. LengthBoundsInPadicFamilies §1.7a states its module form and names PadicFamilies §1.7a for the algebra case (owner of that case: PadicFamilies). AutomorphicCongruences §§0.8, 5.2 and SerreWeightAndLevelOptimisation §1.3 use one-point modules of specific Hecke modules and cite PadicFamilies §§1.7–1.10 (owner: PadicFamilies). IntegralIwasawaTheory §9.1's Eisenstein congruence module is a specific module of forms (owner: IntegralIwasawaTheory). Ownership against the open pull requests was checked with the roadmaps search over their heads.

Source independence: 4 passages compared with 1 source (changed passages only). These were the statement paragraph of §1.7a against hida lines 59–62 and 906–909, and the conductor sentence and the first API bullet against hida lines 925–927 and 62. They share nothing beyond the formula `(ξA ⊕ (1−ξ)A)/A` and the terms "conductor", "annihilator" and "module of congruences". Largest share of the changed passages' locators: hida, 4 of 4 (hida81 has none). The arrangement was not compared, since no layer was added, removed or reordered.

Research link: §1.7a is Hida's (1986) module of congruences, the finite-level object that his Λ-adic congruence modules (§1.10) interpolate weight by weight. The roadmap's headlines are Hida's control theorem, the family p-adic L-functions of Emerton–Pollack–Weston (2006) and Bellaïche's critical p-adic L-functions (2012). This line rests on the README's summary and references and on hida pp. 232–233 and 254.

## Not verifiable

- Hida81 (Invent. Math. 63, 1981): the sources service found no readable copy (the EuDML record's certificate has expired, the DOI resolves to a paywalled publisher, and arXiv returned an error). So neither the citation nor the EuDML record id `142797` could be checked.

## Source issues

- none

## For the human reviewers

- Your decision that published theorems live in the general roadmaps was applied. LengthBoundsInPadicFamilies §1.7a keeps its module form and names PadicFamilies §1.7a for the published algebra case. I checked that §1.7a (README lines 1097–1122) states that case.
