# Review of PadicFamilies (pull request #3027 at e47c8ec)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 33 changed lines since `b8f3652`. I checked the new §1.7a (the module of congruences of a finite free algebra over a discrete valuation ring along an idempotent of `A[1/ϖ]`), the widened ownership sentence and the new reference: every identity of §1.7a and each of its four Checks was recomputed and holds, and the three places cited in Hida 1986 support the statements as written. The previous review had no findings; its three small corrections stand, because the text they concern is unchanged, and they are repeated below. There are no findings, so the change is accepted with three small corrections and no format note; nothing is left for the human reviewers to decide beyond one line recording that their decision was applied.

## C01 — Hida 1981 is cited in §1.7a with no locator, so a reader cannot tell what it supports

The source line that closes §1.7a (line 1120) gives exact places in Hida 1986 and then "[Hida81](#hida81)" with nothing after it; no other passage of the README cites that paper. Either give the section or theorem of the 1981 paper that §1.7a relies on, or drop the citation and the reference entry. I could not read the 1981 paper to propose the place.

## C02 — The description says each added section is stated in the generality of its source, and §1.7a is stated more widely than Hida

Part 1 of the description says that each added section is "stated in the generality of its source" and lists the exceptions in a parenthesis; PadicFamilies §1.7a is not among them. §1.7a is stated for any discrete valuation ring, any commutative algebra finite and free over it and any idempotent of `A[1/ϖ]`, while Hida has Hecke algebras over `ℤ_p` (§0, p. 232) and over the integers of a finite extension of `ℚ_p` (§3, p. 254), as §1.7a says itself (line 1101). The wider statement is true (each clause was recomputed), so only the description needs the change: add to the parenthesis "in PadicFamilies §1.7a for any commutative algebra finite and free over a discrete valuation ring and any idempotent of its generic fibre".

## C03 — The ownership sentence says "of a Hecke algebra", while §1.7a states the module for every commutative finite free `O`-algebra

In Scope and ownership (line 2907) the new clause reads "congruence modules along a decomposition of a Hecke algebra". §1.7a states the module for any commutative `O`-algebra finite and free over a discrete valuation ring, and LengthBoundsInPadicFamilies (its README, lines 11, 50, 55 and 646) cites it in that generality. A reader who settles ownership from the scope paragraph would find no owner for the general algebraic statement. "congruence modules along a decomposition of a finite free algebra over a discrete valuation ring (Hecke algebras among them)" would match the section.

## Verified sound

Here `K = Frac(O)`, `A_n = {(a, b) ∈ O² : a ≡ b mod ϖⁿ}` and `ξ = (1, 0)` unless stated.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.7a `ξA/𝔠_ξ ≅ C(A; ξ)` by `ξa ↦ (ξa, 0)` | general; `A_n` | onto: `(ξa,(1−ξ)b) ≡ (ξ(a−b),0)`; kernel `{c ∈ A : (1−ξ)c = 0} = 𝔠_ξ`. `A_n`: `O²/A_n ≅ O/ϖⁿ`; `(O×0)/(ϖⁿO×0) ≅ O/ϖⁿ` | holds | none |
| 1.7a `A/(𝔠_ξ ⊕ 𝔠_{1−ξ}) ≅ Ψ_ξ(A)`, symmetry | general; `A_n` | kernel of `a ↦ ξa mod 𝔠_ξ` is `{a : ξa ∈ A}`; `a = ξa + (1−ξ)a`. `A_n`: `ϖⁿO²`, quotient `O/ϖⁿ` both sides | holds | none |
| 1.7a annihilator of `C` = conductor = `𝔠_ξ ⊕ 𝔠_{1−ξ}` | general; `A_n` | `a(ξA + (1−ξ)A) ⊆ A` iff `aξ ∈ A` (as `1 ∈ A`). `A_n`: conductor in `O²` is `ϖⁿO²`; hida line 925 | holds | none |
| 1.7a finite length | `ξ = 0`, `ξ = 1`, `A = 0`; `A_n` | `ϖ^Nξ ∈ A` since `A_K = A[1/ϖ]`; degenerate cases give `Ψ = 0`; `A_n`: length `n` | holds | none |
| 1.7a `Ann_A(𝔠_ξ) = 𝔠_{1−ξ}` | `A_n`; `ξ = 1` | `Ann(ϖⁿO×0) = 0×ϖⁿO`; `Ann(A) = 0 = 𝔠_0`; uses `A` torsion-free and `𝔠_ξ[1/ϖ] = ξA_K` | holds | none |
| 1.7a raw-annihilator form of §1.7 for the ideal `𝔠_ξ` | `A_n` | `A[𝔠_ξ] = 0×ϖⁿO`, `A[Ann 𝔠_ξ] = ϖⁿO×0`, sum `ϖⁿO²`, quotient `O/ϖⁿ` | holds | none |
| 1.7a split case, `𝔠_{ξ_𝒴}` = functions vanishing off `𝒴` | `A = O²`, `𝒴 = {1}`; `𝒴 = ∅` | `𝔠 = O×0`, reversed reading `0×O` (Check 3); `𝒴 = ∅`: `𝔠 = 0`, `Ψ = 0` | holds | none |
| 1.7a "`A[1/ϖ] = K^𝒳`" for `A` separating points | `𝒳` two points | a unital `K`-subalgebra of `K²` separating the points contains `(1,0)`: all of `K²` | holds | none |
| Check 1, one point | `A_n`, `x = 1` | `ker λ_x = 0×ϖⁿO = 𝔠_{1−ξ}`; `I_λ = ϖⁿO×0 = 𝔠_ξ`; `Ann(I_λ) = ker λ_x`; both `O/ϖⁿ` | holds | none |
| Check 2 | `n = 0`; ramified `O` | `n = 0`: `A = O²`, `Ψ = 0`, length 0; length counted in `ϖ`, so `n` also for ramified `O` | holds | none |
| Check 4, odd residue characteristic | odd; `O = ℤ_2`, `n = 1` | `ξ² = (2 + 2t/ϖⁿ)/4 = ξ`; image `{u ≡ v mod 2ϖⁿ}` = `A_n` when 2 is a unit; over `ℤ_2` it is `{u ≡ v mod 4}`, length 2 | holds with the stated hypothesis | none |
| Description sentence (C02) | §1.7a against hida lines 59–62, 906–909 | source: Hecke algebras over `ℤ_p`, resp. the integers of a finite extension; head: any DVR, any commutative finite free `A` | differs | C02 |
| Scope sentence (C03) | line 2907 against line 1101 | scope: "of a Hecke algebra"; section: any commutative finite free `O`-algebra | narrower | C03 |
| Hida81 citation (C01) | line 1120 | no locator; text not readable | locator missing | C01 |
| Headline 0a.22 `locally_finite_ordinary_milestone` (untouched) | `R = ℤ_p`, `M = ℤ_p²`, `T = diag(1, p)` | `T^{k!} → diag(1, 0) = e`; `T` bijective on `eM`; `T^k → 0` on `ker e` | holds | none |

- Source locators checked against the text: 3, all in hida (§0, p. 232, lines 59–62; (3.11a)–(3.11b), p. 254, lines 906–909; the remark before (3.12), lines 925–927); each supports §1.7a as written. hida81 not readable.
- Seeded sample: none of the fifteen sampled sections lies in the changed passages or is affected by them (§1.7a is cited by no other section of this README); they were not re-read.
- Library declarations opened at the pinned Mathlib (`1b1ccf4`): `IsIdempotentElem` (Mathlib/Algebra/Group/Idempotent.lean:37), `Submodule.torsionBySet` (Mathlib/Algebra/Module/Torsion/Basic.lean:182), `Module.length` (Mathlib/RingTheory/Length.lean), `Module.annihilator` (Mathlib/RingTheory/Ideal/Maps.lean, section at line 860). Neither pinned library has a congruence module.
- Cross-roadmap citations resolved: the citations of PadicFamilies §1.7a at this head in LengthBoundsInPadicFamilies (README lines 11, 50, 55, 646) and CongruenceModulesOfThetaLifts (lines 273, 2026, 2071, 2367) each match what §1.7a states; §1.10, which §1.7a names, cites Hida's (3.9) at line 1217.
- Record: the README at the merge base has 8 layers; the head keeps all of them and every heading, adds §1.7a and the reference entry, and rewrites one sentence of the scope paragraph. Outside the folder the pull request changes only other roadmap folders under `TauCetiRoadmap/`, each of which it revises or adds as its own; nothing else in the repository changes.
- Automatic checks: all passed, none set aside. Dependency check output: `depcheck: 132 roadmaps, 1482 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).
- Elaboration: `lake env lean TauCetiRoadmap/PadicFamilies/Suggested.lean` gives three `declaration uses sorry` warnings (lines 57, 93, 119) and nothing else. The file is unchanged since the merge base, has no `set_option` and no sorried data; the elaborated types carry `[HasDerivedCategory (ModuleCat R)]` wherever the derived category occurs, so no needed binder is lost. The one-tactic probe was not re-run on the unchanged file.
- Previous review: no findings to account for; its three small corrections are unrepaired in unchanged text and are C01–C03 above.

Overlap check: read LengthBoundsInPadicFamilies and CongruenceModulesOfThetaLifts (this pull request), AutomorphicCongruences, SerreWeightAndLevelOptimisation, ModularIwasawaMainConjectures and PadicFamiliesPartII (open), ModularSymbolsPadicLFunctions and OrdinaryAutomorphicFormsAndModularityLifting (main), for the congruence module along an idempotent. Shared object: LengthBoundsInPadicFamilies §1.7a states the form for a module over a finite algebra along a central idempotent and names PadicFamilies §1.7a for the published algebra case (owner of that case: PadicFamilies). AutomorphicCongruences and SerreWeightAndLevelOptimisation use one-point congruence modules of their own Hecke modules and cite PadicFamilies Layer 1; the others state none. IntegralIwasawaTheoryPartII and AutomorphicGaloisRepresentations were searched by the roadmaps search only, with no hit.

Source independence: 4 passages compared with 1 source (changed passages only): the statement paragraph, the conductor sentence, the hypotheses paragraph and the first API bullet of §1.7a against hida lines 59–62, 906–909 and 925–927; nothing shared beyond the formula `(ξA ⊕ (1−ξ)A)/A` and the terms "conductor" and "module of congruences"; largest share of the changed passages' locators hida, 4 of 4 (hida81 has none, text not readable); the arrangement was not compared, as no layer is added, removed or reordered.

Research link: §1.7a is the module of congruences of Hida (1986), the finite-level object his Λ-adic congruence modules (§1.10) interpolate; the roadmap's headlines are Hida's control theorem and the family p-adic L-functions of Emerton–Pollack–Weston (2006) and Bellaïche (2012). Rests on the README's summary and references and on hida pp. 232 and 254.

## Not verifiable

- Hida81 (Invent. Math. 63, 1981): the EuDML page could not be fetched (its certificate has expired) and the DOI resolves to a paywalled publisher, so neither the citation's content nor the EuDML record number was checked.

## Source issues

- none

## For the human reviewers

- Your decision that published theorems live in the general roadmaps was applied: LengthBoundsInPadicFamilies §1.7a keeps its module form and names PadicFamilies §1.7a for the published algebra case, which §1.7a (README lines 1097–1122) does state.
